<?php

namespace Pagekit\Calendar\Controller;

use Pagekit\Application as App;
use Symfony\Component\HttpFoundation\Request;
/**
 * @Access(admin=true)
 */
class CalendarAPIController
{
	public function indexAction(Request $request)
    {
    	$request = Request::createFromGlobals();
		$start = $request->query->get('start');
		$end = $request->query->get('end');
		if($start == null){
			$date = date('Y-m-d');
			list($year, $month, $day) = explode('-',$date);
			$start = $year . "-01-01";
			$year = $year +1;
			$end = $year . "-01-01";
		}
		$result = App::db()->createQueryBuilder()->select('*')
												 ->from('@calendar_events')
												 ->where('start >= :start AND end < :end', ['start' => $start, 'end' => $end])
												 ->execute()
												 ->fetchAll();
		$user = App::user();
		$cnt = 0;
		foreach($result as $row){
			if($user->hasAccess("calendar: foreign event edit")) $editable = true;
			else{
				if($user->id==$row["creatorID"]){
					$editable = true;
				}
				else
					$editable = false;	
			} 
			$row["editable"] = $editable;
			$row["startEditable"] = $editable;
			$row["durationEditable"] = $editable;
			$row["overlap"] = $row["overlap"] == "0" ? false : true;
			$result[$cnt] = $row;
			$cnt++;
		}
		if ($user->hasAccess('calendar: new event')) {
			$newEvent =true;
		}else{
			$newEvent=false;
		}

        return [
	        '$data' => [
		        'result' => $result,
		        'newEvent' => $newEvent]
	    ];
    }
	
	/**
	*	@Route("/gettermine/")
	**/
	public function getTermineAction()
    {

    	$config = App::module('calendar')->config;

		if($config["allowTermine"] == false){
			return ['$data' => false];
		}

    	$result = App::db()->createQueryBuilder()->select('*')
												 ->from('@termine_list')
												 ->orderBy('date')
												 ->execute()
												 ->fetchAll();
        return [
	        '$data' =>  $result
	    ];
    }
    /**
    *	@Route("/update/")
    *	@Access('calendar: api access')
    */
	public function updateAction(Request $request)
    {

    	$request = Request::createFromGlobals();
    	$datajson = $request->getContent();
		$data = json_decode($datajson,true);

		$id = $data['dbid'];
		$key = $data['key'];
		$val = $data['val'];

		if($id == null || $key == false || $val == false) return false;
		$cur = App::db()->createQueryBuilder()->select('*')
												 ->from('@calendar_events')
												 ->where('id = :id', ['id' => $id])
												 ->execute()
												 ->fetchAll();
		if (count($cur) == 0){
			return false;
		}
		

		$key = explode('|', $key);
		$val = explode('|', $val);
		$setString ="";
		$cnt = 0;
		for ($i=0; $i < count($key); $i++) {

			if ($key[$i] != "0" && $val[$i] != "0") {
				if($i>0) $setString .= ", ";
				if($key[$i] == "start"){
					list($startyear, $startmonth, $startday) = explode('-',$cur[0]['start']);
					list($endyear, $endmonth, $endday) = explode('-',$cur[0]['end']);
					$difYears = $endyear- $startyear;
					if($difYears != 0) return false;
					$difMonth = $endmonth - $startmonth;

					$difDays = $endday + 30*$difMonth - $startday;
					list($upyear, $upmonth, $upday) = explode('-',$val[$i]);
					$newEndDate = $upyear . "-" . ($upmonth + $difMonth) . "-" . ($upday + $difDays);
					$setString .= $key[$i] . "='" . $val[$i] . "', end = '" . $newEndDate . "'";
					
				}
				else{
					$setString .= $key[$i] . "='" . $val[$i] . "'";
				}
			}
		}
		//return $setString;
		//return [ '$data' => $setString];
		$result = App::db()->executeQuery('update @calendar_events set ' . $setString . " where id = " . $id)->execute();

        return [
	        '$data' => [
		        '$success' => $result,
		        '$setString'  => $setString
	        ]
	    ];
    }
    /**
    *	@Route("/new/")
    *	@Access('calendar: api access')
    */
	public function newAction(Request $request)
    {
    	//return "hallo";
    	$request = Request::createFromGlobals();
    	$datajson = $request->getContent();
		$data = json_decode($datajson,true);

		$key = $data['key'];
		$val = $data['val'];

		if($key == false || $val == false) return $key + " " + $val;

		$val = str_replace("|", "','", $val);
		$val = "'".$val."'";
		$preDefKey = "editable,startEditable,durationEditable,overlap,creatorID";
		$preDefVal = "1,1,1,1," . App::user()->id;

		$key = $key . "," . $preDefKey;
		$val = $val . "," . $preDefVal;
		

		
		$result = App::db()->executeQuery('insert into @calendar_events ('.$key.') values ('.$val.') ');

        return [
	        '$data' => $result
	    ];
    }

    /**
    *	@Route("/delete/")
    *	@Access('calendar: api access')
    */
	public function deleteAction(Request $request)
    {
    	//return "hallo";
    	$request = Request::createFromGlobals();
    	$datajson = $request->getContent();
		$data = json_decode($datajson,true); 

		$dbid = $data['id'];

		$cur = App::db()->createQueryBuilder()->select('*')
												 ->from('@calendar_events')
												 ->where('id = :id', ['id' => $dbid])
												 ->execute()
												 ->fetchAll();
		if (count($cur) == 0){
			return false;
		}
		
		$result = App::db()->executeQuery("delete from @calendar_events where id='" . $dbid. "'");

        return [
	        '$data' => $result
	    ];
    }
}




































































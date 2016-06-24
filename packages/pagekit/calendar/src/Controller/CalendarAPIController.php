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
		foreach($result as $row){
			$row["editable"] = $row["editable"] == "0" ? false : true;
			$row["startEditable"] = $row["startEditable"] == "0" ? false : true;
			$row["durationEditable"] = $row["durationEditable"] == "0" ? false : true;
			$row["overlap"] = $row["overlap"] == "0" ? false : true;
		}
        return [
	        '$data' => $result
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
		

		$key = explode(',', $key);
		$val = explode(',', $val);
		$setString ="";
		$cnt = 0;
		for ($i=0; $i < count($key); $i++) {

			if ($key[$i] != "0" && $val[$i] != "0") {
				if($i>0) $setString .= ", ";
				if($key == "start"){
					list($startyear, $startmonth, $startday) = explode('-',$cur['start']);
					list($endyear, $endmonth, $endday) = explode('-',$cur['end']);
					$difYears = $endyear- $startyear;
					if($difYears != 0) return false;
					$difMonth = $endmonth - $startmonth;

					$difDays = $endday + 30*$difMonth - $startday;

					$newEndDate = $startyear . "-" . ($startmonth + $difMonth) . "-" . ($startday + $difDays);
					$setString .= $key[$i] . "='" . $val[$i] . "', end = ";
				}
				else{
					$setString .= $key[$i] . "='" . $val[$i] . "'";
				}
			}
		}
		//return $setString;
		
		$result = App::db()->executeQuery('update @calendar_events set ' . $setString . " where id = " . $id)->execute();

        return [
	        '$data' => $result
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

		$val = str_replace(",", "','", $val);
		$val = "'".$val."'";
		$preDefKey = "url,className,editable,startEditable,durationEditable,overlap,color";
		$preDefVal = "'#','',1,1,1,1,''";

		$key = $key . "," . $preDefKey;
		$val = $val . "," . $preDefVal;
		

		
		$result = App::db()->executeQuery('insert into @calendar_events ('.$key.') values ('.$val.') ');

        return [
	        '$data' => $result
	    ];
    }
}




































































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
			$start = $year . "-" . $month . "-01";
			if($month == 12){
				$year = $year + 1;
				$month = "01";
			}
			else{
				$month = $month +1;
			}
			$end = $year . "-" . $month . "-01";
		}
		$result = App::db()->createQueryBuilder()->select('*')
												 ->from('@calendar_events')
												 ->where('start > :start AND end < :end', ['start' => $start, 'end' => $end])
												 ->execute()
												 ->fetchAll();
		foreach($result as $row){
			$row["editable"] = $row["editable"] == "0" ? false : true;
			$row["allDay"] = $row["allDay"] == "0" ? false : true;
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
					$difMonth = $endmonth - $startmonth;
					$difDays = $endday + 30*$difMonth - $startday;
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
}




































































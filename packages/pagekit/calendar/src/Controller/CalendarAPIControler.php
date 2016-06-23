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
		
        return [
	        '$data' => $result
	    ];
    }


}
<?php

namespace Pagekit\Calendar\Controller;

use Pagekit\Application as App;
use Symfony\Component\HttpFoundation\Request;
/**
 * @Access(admin=true)
 */
class CalendarController
{
    public function indexAction(Request $request)
    {
        return [
	        '$view' => [

	            // Rendered in the site's <title>
	            'title' => 'Calendar',

	            // view file that is rendered
	            'name' => 'calendar:views/admin/index.php',
	        ]
	        
	    ];
    }
	
    public function post($url, $fields){

		//url-ify the data for the POST
		$fields_string = "";
		foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
		$fields_string = rtrim($fields_string,'&');

		//open connection
		$ch = curl_init();

		//set the url, number of POST vars, POST data
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_POST,count($fields));
		curl_setopt($ch,CURLOPT_POSTFIELDS,$fields_string);

		//execute post
		$result = curl_exec($ch);
		return $result;
    }

	/**
	 *	@Route("/id/")
	 *	@Route("/id/{dbid}/", name="@termine/admin/id/dbid", methods="GET")
	 **/
	public function idAction(Request $request){

		$request = Request::createFromGlobals();
		$dbid = $request->query->get('dbid');

		$result = App::db()->createQueryBuilder()->select('*')->from('@termine_list')->where('id = :id', ['id' => $dbid])->execute()->fetchAll();
		
		$cnt = 0;
		$text = "Ändern sie den gewählten Termin!";
		$SaveText = true;
		if($result == null){
			$text = "Erstellen Sie einen Termin!";
			$result = 0;
			$SaveText = false;
		}
		else{
			foreach($result as $entry){
				$cnt++;
			}
			if($cnt == 0){
				$text = "Erstellen Sie einen Termin!";
				$result = 0;
				$SaveText = false;
			}
		}
		
		
        return [
        '$view' => [

            // Rendered in the site's <title>
            'title' => 'Termine',

            // view file that is rendered
            'name' => 'termine:views/admin/id.php',
        ],

        // pass parameters to view file
        '$data' => [
        	'id' => $result[0]['id'],
        	'intern' => $result[0]['intern'],
        	'Title' => $result[0]['Title'],
        	'Description' => $result[0]['Description'],
        	'date' => $result[0]['Date'],
        	'options' => [
        		[
        			'text' => 'intern',
        			'value' => 1
        		],
        		[
        			'text' => 'extern',
        			'value' => 0
        		]
        	]
        ],
		'text' => $text,
		'saveText' => $SaveText
		];
	}
	/**
	 *	@Route("/delete/")
	 *	@Route("/delete/{dbid}/", name="@termine/admin/id/dbid", methods="GET")
	 *	@Access("termine: editor")
	 **/
	public function deleteAction(Request $request){

		$request = Request::createFromGlobals();
		$datajson = $request->getContent();
		$data = json_decode($datajson,true);
		$tid = $data["id"];
		$result = App::db()->createQueryBuilder()->select('*')->from('@termine_list')->where('id = :id', ['id' => $tid])->execute()->fetchAll();


		if($result == null){
			return false;
		}
		else{
			App::db()->executeQuery('delete from pk_termine_list where id = '. $tid);
		}
		
		
        return true;
	}
	
	/**
	 *	@Route("/save/")
	 *	@Access("termine: editor")
	 **/
	public function saveAction(Request $request){

		

		$request = Request::createFromGlobals();
		$datajson = $request->getContent();
		$data = json_decode($datajson,true);
		$id = $data["id"];
		$title = $data["title"];
		$desc = $data["desc"];
		$date = $data["date"];
		$val = false;
		if($id == 0){
			$val = App::db()->insert('@termine_list',[
			'Title' => $title,
			'Description' => $desc,
			'Date' => $date]);
		}
		else{
			$query= App::db()->createQueryBuilder();
			$val = $query->select()->from('@termine_list')->where('id = :id',['id' => $id])->update([
			'Title' => $title,
			'Description' => $desc,
			'Date' => $date]);
		}
		
		
		
        return  $val;
	}
	
    /**
     * @Access("termine: manage settings")
     */
    public function settingsAction()
    {
        return [
            '$view' => [
                'title' => __('Calendar Settings'),
                'name'  => 'calendar:views/admin/settings.php'
            ],
            '$data' => [
                'config' => App::module('calendar')->config()
            ]
        ];
    }
}

<?php

namespace Pagekit\Termine\Controller;

use Pagekit\Application as App;
use Symfony\Component\HttpFoundation\Request;
/**
 * @Access(admin=true)
 */
class TerminController
{
    public function indexAction()
    {
		//$util = App::db()->getUtility();
		$result = App::db()->createQueryBuilder()->select('*')->from('@termine_list')->execute()->fetchAll();
		
		
        return [
        '$view' => [

            // Rendered in the site's <title>
            'title' => 'Termine',

            // view file that is rendered
            'name' => 'termine:views/admin/index.php',
        ],

        // pass parameters to view file
        'termine' => $result
        
    ];
    }
	
	/**
	 *	@Route("/id/")
	 *	@Route("/id/{dbid}/", name="@termine/admin/id/dbid", methods="GET")
	 **/
	public function idAction($dbid = 0){
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
        'termine' => $result,
		'text' => $text,
		'saveText' => $SaveText
		];
	}
	/**
	 *	@Route("/delete/")
	 *	@Route("/delete/{dbid}/", name="@termine/admin/id/dbid", methods="GET")
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
	
	public function saveAction(){
		
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
		
		
		
        return  $val;
	}
	
    /**
     * @Access("hello: manage settings")
     */
    public function settingsAction()
    {
        return [
            '$view' => [
                'title' => __('Hello Settings'),
                'name'  => 'termine:views/admin/settings.php'
            ],
            '$data' => [
                'config' => App::module('hello')->config()
            ]
        ];
    }
}
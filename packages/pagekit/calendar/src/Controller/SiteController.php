<?php

namespace Pagekit\Calendar\Controller;

use Pagekit\Application as App;

class SiteController
{
    /**
     * @Route("/")
     * @Route("/{name}", name="name")
     */
    public function indexAction($name = '')
    {
        $user = App::user();

        if(!$user->hasAccess("termine: see intern")){
            $result = App::db()->createQueryBuilder()->select('*')->from('@termine_list')->where('intern = 0')->orderBy('date')->execute()->fetchAll();
        }
        else{
            $result = App::db()->createQueryBuilder()->select('*')->from('@termine_list')->orderBy('date')->execute()->fetchAll();

        }
        
        return [
            '$view' => [
                'title' => __('Termine'),
                'name' => 'termine:views/index.php'
            ],
            'termine' => $result
        ];
    }
    
}

<?php
namespace App\Controller\Api;

use App\Controller\Api\AppController;
use Cake\Event\Event;
use Cake\Network\Exception\UnauthorizedException;
use Cake\Utility\Security;
use Firebase\JWT\JWT;

class UsersController extends AppController
{
   public $paginate = [
       'page' => 1,
       'limit' => 5,
       'maxLimit' => 15,
       'sortWhitelist' => [
           'id', 'name'
       ]
   ];

   public function initialize()
   {
       parent::initialize();
       $this->Auth->allow(['add', 'token']);
   }

   public function token()
{
   $user = $this->Auth->identify();
   if (!$user) {
       throw new UnauthorizedException('Invalid username or password');
   }

   $this->set([
       'success' => true,
       'data' => [
           'token' => JWT::encode([
               'sub' => $user['id'],
               'exp' =>  time() + 604800
           ],
           Security::salt()),
           'id' =>$user['id'],
       ],
       '_serialize' => ['success', 'data']
   ]);

}

}
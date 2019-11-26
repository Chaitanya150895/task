<!-- To Integrate it to your frontend and fetch data from the Server TuToRial

Create a cakephp project ’menu’

php composer.phar create-project --prefer-dist cakephp/app menu
 
Create a database table with the name of ‘items’ and following

Column name should be id, name, description, cost, created and modified along with primary keys and A I.

Connect database with the project by making changes in default of username = ‘root’, password = ‘’ and database = ‘cake3api_app’ section
 
Then run the following command to bake  -->


php bin/cake.php bake all items



<!-- Install CRUD plugin 


composer require friendsofcake/crud:^5.2.0
 
Now load plugin 
 
bin/cake plugin load Crud

Create a folder named ‘api’ inside controller and file name ‘AppController’ with below code -->

<?php
namespace App\Controller\Api;
 
use Cake\Controller\Controller;
use Cake\Event\Event;
 
class AppController extends Controller
{
 
   use \Crud\Controller\ControllerTrait;
 
   public function beforeFilter(Event $event)
   {
     
       parent::beforeFilter($event);
       $this->response = $this->response->cors($this->request)
       ->allowOrigin(['*'])
       ->allowMethods(['GET', 'POST'])
       ->allowHeaders(['X-CSRF-Token'])
       ->allowCredentials()
       ->exposeHeaders(['Link'])
       ->maxAge(300)
       ->build();
   }
 
   public function initialize()
   {
       parent::initialize();
 
       $this->loadComponent('RequestHandler');
       $this->loadComponent('Crud.Crud', [
           'actions' => [
               'Crud.Index',
               'Crud.View',
               'Crud.Add',
               'Crud.Edit',
               'Crud.Delete'
           ],
           'listeners' => [
               'Crud.Api',
               'Crud.ApiPagination',
               'Crud.ApiQueryLog'
           ]
       ]);
           }}



<!-- 9. Make sure to keep the below code in AppAController.php /controller -->

   public $components = [
       'RequestHandler',
       'Crud.Crud' => [
           'actions' => [
               'Crud.Index',
               'Crud.View',
               'Crud.Add',
               'Crud.Edit',
               'Crud.Delete'
           ],
<!-- 
10. Create a file in src/controller/Api/ItemsController named ItemsController (table controller)  -->

<?php
namespace App\Controller\Api;

use App\Controller\Api\AppController;

class ItemsController extends AppController
{
   public $paginate = [
       'page' => 1,
       'limit' => 5,
       'maxLimit' => 15,
       'sortWhitelist' => [
           'id', 'name'
       ]
   ];
}

<!-- 11. Insert the items inside Router for the table -->
 $routes->resources('Items');

<!-- HERE -->

Router::prefix('api', function ($routes) {
   $routes->extensions(['json', 'xml']);
   $routes->resources('Items');
  // Router::connect('/api/users/register', ['controller' => 'Users', 'action' => 'add', 'prefix' => 'api']);
   $routes->fallbacks('InflectedRoute');
});


<!-- User CORS to allow the access to the data from one domain to the another domain in AppController.php -->

public function beforeFilter(Event $event)
   {
     
       parent::beforeFilter($event);
       $this->response = $this->response->cors($this->request)
       ->allowOrigin(['*'])
       ->allowMethods(['GET', 'POST'])
       ->allowHeaders(['X-CSRF-Token'])
       ->allowCredentials()
       ->exposeHeaders(['Link'])
       ->maxAge(300)
       ->build();
   }

<!-- Setting Cross Origin Request Headers (CORS)
As of 3.2 you can use the cors() method to define HTTP Access Control related headers with a fluent interface: -->
$this->response = $this->response->cors($this->request)
    ->allowOrigin(['*.cakephp.org'])
    ->allowMethods(['GET', 'POST'])
    ->allowHeaders(['X-CSRF-Token'])
    ->allowCredentials()
    ->exposeHeaders(['Link'])
    ->maxAge(300)
    ->build();
 
<!-- CORS related headers will only be applied to the response if the following criteria are met:
The request has an Origin header.
The request’s Origin value matches one of the allowed Origin values.


For CORS Add following code in AppController.php in public function. -->

  class AppController extends Controller
{
 
   use \Crud\Controller\ControllerTrait;
 
   public function beforeFilter(Event $event)
   {
     
       parent::beforeFilter($event);
       $this->response = $this->response->cors($this->request)
       ->allowOrigin(['*'])
       ->allowMethods(['GET', 'POST'])
       ->allowHeaders(['X-CSRF-Token'])
       ->allowCredentials()
       ->exposeHeaders(['Link'])
       ->maxAge(300)
       ->build();
   }
 
   public function initialize()
   {
       parent::initialize();
 
       $this->loadComponent('RequestHandler');
       $this->loadComponent('Crud.Crud', [
           'actions' => [
               'Crud.Index',
               'Crud.View',
               'Crud.Add',
               'Crud.Edit',
               'Crud.Delete'
           ],
           'listeners' => [
               'Crud.Api',
               'Crud.ApiPagination',
               'Crud.ApiQueryLog'
           ]
       ]);     
   }
}


<!-- Add below code to boostrap.php at very last. -->

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, PUT, PATCH, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: *');
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    exit(0);
}

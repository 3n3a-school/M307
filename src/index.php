<?php
require 'core/bootstrap.php';

$routes = [
	'/' => 'HomeController@index',
];

$db = [
	'host'	   => $_ENV['DB_HOST'],
	'port'	   => $_ENV['DB_PORT'],
	'name'     => $_ENV['DB_DB'],
	'username' => $_ENV['DB_USER'],
	'password' => $_ENV['DB_PASS'],
];

$router = new Router($routes);
$router->run($_GET['url'] ?? '');
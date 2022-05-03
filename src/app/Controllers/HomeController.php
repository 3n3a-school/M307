<?php

class HomeController
{
	public function index()
	{
		$vars['title'] = "M307";
		$vars['template'] = "home.view.php";
		
		require 'app/Views/base.view.php';
	}
	
	public function new()
	{
		$pdo = db();

		// Dein SQL-Code...
		$statement->execute();
		
		// Umleiten auf die Startseite
		header('Location: ' . ROOT_URL . '/hallo/welt');
	}
	
}


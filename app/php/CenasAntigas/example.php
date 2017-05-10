<?php

// include Imap_parser class
include_once('lib/Imap_parser.php');
// create Imap_parser Object
$email = new Imap_parser();

// data
$data = array(
	// email account
	'email' => array(
		'hostname' => '{imap.gmail.com:993/imap/ssl}INBOX',
		'username' => 'testetrackit@gmail.com',
		'password' => 'testetrackit123'
	),
	// inbox pagination
	'pagination' => array(
		'sort' => 'ASC', // or ASC
		'limit' => 1000,
		'offset' => 0
	)
);

// get inbox. Array
$result = $email->inbox($data);
echo '<pre>';
echo '</pre>';
?>
<script>
   window.history.back();
</script>

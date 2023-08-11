<?php
$conn = mysqli_init();
mysqli_ssl_set($conn, NULL, NULL, "../sql/DigiCertGlobalRootCA.crt.pem", NULL, NULL);
mysqli_real_connect($conn, getenv('DB_HOST'), getenv('DB_USER'), getenv('DB_PASSWORD'), getenv('DB_DATABASE'), 3306, MYSQLI_CLIENT_SSL);
if(!$conn){
 die('Could not Connect MySql:' .mysql_error());
}
?>

<?php
    $path = "login";
    if(isset($_POST["user"]) && isset($_POST["pwd"])){
        $user = $_POST["user"];
        if(str_contains($user,"@")) $email = true;
        $pwd = $_POST["pwd"];
        try{
            $db = new mysqli("localhost", "php", "password", "jukebox");
            if($email) $res = $db->query("Select username from utente where email like '$user'");
            else $res = $db->query("Select email from utente where username like '$user'");
            if($res->num_rows>0){
                session_start();
                header("location: ./");
            }
        }catch(Exception $e){
            echo $e->getMessage();
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <style>
        form{
            width: 40vw;
            grid-template-columns: 50% 50%;
        }
        form>label, form>h1{
            grid-column: span 2;
        }
        form>label:nth-child(2){
            grid-column: span 1;
            width: 95%;
            justify-self: start;
        }

        form>label:nth-child(3){
            grid-column: span 1;
            width: 95%;
            justify-self: end;
        }

    </style>
    <title>Registrati</title>
</head>
<body>
    <?php include_once("nav.php"); ?>
    <form action="register.php" method="post">
        <h1>Registrati</h1>
        <label for="nome"><input placeholder="Nome" required name="nome" type="text"></label>
        <label for="cognome"><input placeholder="Cognome" required name="cognome" type="text"></label>
        <label for="user"><input placeholder="Username" required name="user" type="text"></label>
        <label for="email"><input placeholder="E-mail" required name="email" type="email"></label>
        <label for="user"><input placeholder="Password" required name="pwd" type="password"></label>
        <button type="submit">Conferma</button>
    </form>
</body>
</html>
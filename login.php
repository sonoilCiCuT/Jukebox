<?php
    $path = "login";
    if(isset($_POST["user"]) && isset($_POST["pwd"])){
        $user = $_POST["user"];
        if(str_contains($user,"@")) $email = true;
        $pwd = $_POST["pwd"];
        try{
            $db = new mysqli("10.0.0.9", "quintaib15", "bcIvr01", "quintaib15_jukebox");
            //$db = new mysqli('localhost', 'php', 'password', 'quintaib15_jukebox');
            if($email) $res = $db->query("Select username from utente where email like '$user'");
            else $res = $db->query("Select email from utente where username like '$user'");
            if($res->num_rows>0){
                session_start();
                $_SESSION['username']=($email) ? $user : $res->fetch_assoc()["email"];
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
    <script src="./script.js"></script>
    <title>Accedi</title>
</head>
<body>
    <?php include_once("nav.php"); ?>
    <form action="login.php" method="post">
        <h1>Login</h1>
        <label for="user"><input placeholder="Username / E-mail" required name="user" type="text"></label>
        <label for="user"><input placeholder="Password" required name="pwd" type="password"></label>
        <button type="submit">Entra</button>
        <p>Non hai un account? <a href="register.php">Registrati!</a></p>
    </form>
</body>
</html>
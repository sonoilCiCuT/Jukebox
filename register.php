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
    
    if (isset($_POST['nome']) && isset($_POST['cognome']) && isset($_POST['email']) && isset($_POST['user']) && isset($_POST['pwd'])) {
        $nome = $_POST['nome'];
        $cognome = $_POST['cognome'];
        $Email = $_POST['email'];
        $username = $_POST['user'];
        $password = $_POST['pwd'];
        $conn = new mysqli("localhost", "php", "password", "jukebox");
        if ($conn->connect_error) die("Connessione fallita: " . $conn->connect_error);
        $query = "SELECT * FROM utente WHERE email = ? OR username = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("ss", $Email, $username);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) echo "Errore: email o username già registrati.";
        else {
            $sql= "INSERT INTO utente (nome, cognome, email, password, username) VALUES (?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssss", $nome, $cognome, $Email, $password, $username);
            if ($stmt->execute()) {
                session_start();
                $_SESSION["username"] = $username;
                header("location: ./");
            }
            else echo "Errore durante la registrazione: " . $stmt->error;
            $stmt->close();
        }
        $stmt->close();
        $conn->close();
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="register.css">
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

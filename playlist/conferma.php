<?php
    session_start();
    try{
        $db = new mysqli("10.0.0.9", "quintaib15", "bcIvr01", "quintaib15_jukebox");
        //$db = new mysqli('localhost', 'php', 'password', 'quintaib15_jukebox');
        $res = $db->query("select utente_id from utente where email = '$_SESSION[username]';");
        $res = $res->fetch_assoc();
        $ut = $res["utente_id"];
        $res = $db->query("select playlist_id from playlist where utente_id = $ut order by Playlist_id desc limit 1;");
        $res = $res->fetch_assoc();
        $pl = $res["playlist_id"];
        $res = $db->query("select sum(prezzo*quantita) as prezzo from playlist_articolo join articolo using(album_id,tipo_id) where playlist_id = $pl;");
        $pr = $res->fetch_assoc();
        $pr = $pr["prezzo"];
        if($db->query("insert into acquisti(utente_id,playlist_id,prezzo) values($ut,$pl,$pr);") && $db->query("insert into playlist(utente_id) values($ut);")) echo json_encode(["status" => "success", "message" => "Acquisto effettuato con successo!"]);        
        else echo json_encode(["status" => "error", "message" => "Errore durante l'acquisto."]);
    }catch(Exception $e){
        echo $e->getMessage();
    }
?>
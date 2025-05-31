<?php
    session_start();
    if(isset($_GET["artista"]) && isset($_GET["album"])){
        try{
            $db = new mysqli("10.0.0.9", "quintaib15", "bcIvr01", "quintaib15_jukebox");
            //$db = new mysqli('localhost', 'php', 'password', 'quintaib15_jukebox');
            $res = exists($_GET["album"],$_GET["artista"],$_GET["tipo"],$db);
            if(!is_null($res) && isset($_SESSION["username"])){
                $al = $res["album_id"];
                $res = $db->query("select utente_id from utente where email = '$_SESSION[username]';");
                $res = $res->fetch_assoc();
                $ut = $res["utente_id"];
                $r = $db->query("select * from playlist where utente_id = $ut order by playlist_id desc limit 1");
                $r = $r->fetch_assoc();
                if($db->query("insert into playlist_articolo(playlist_id, album_id, tipo_id, quantita) values ($r[playlist_id],$al,$_GET[tipo],1)")) echo "true";
                else echo "present";
            }else{
                echo "false";
            }
        }catch(Exception $e){
            echo "erroro";
        }
    }else{
        echo "false";
    }
    function exists($alb,$art,$tip,$db){
        $res = $db->query("select artista.nome, album.url,album_id,album.anno,album.titolo,artista_id from album join artista_album using(album_id) join artista using(artista_id) join articolo using(album_id) where titolo = '$alb' and artista.nome = '$art' and tipo_id = $tip");
        if($res->num_rows>0) return $res->fetch_assoc();
        return null;
    }
?>
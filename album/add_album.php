<?php
    if(isset($_GET["artista"]) && isset($_GET["album"])){
        try{
            //$db = new mysqli("10.0.0.9", "quintaib15", "bcIvr01", "quintaib15_jukebox");
            $db = new mysqli("localhost", "php", "password", "quintaib15_jukebox");
            $res = exists($_GET["album"],$_GET["artista"],$db);
            if(!is_null($res) && isset($_SESSION["username"])){
                //$db->query("insert into ")
            }
        }catch(Exception $e){
            echo $e->getMessage();
        }
    }else{
        echo "false";
    }
    function exists($alb,$art,$db){
        $res = $db->query("select artista.nome,album.url,album_id,album.anno,album.titolo from album join artista_album using(album_id) join artista using(artista_id) where titolo = '$alb' and nome = '$art'");
        if($res->num_rows>0) return $res->fetch_assoc();
        return null;
    }
?>
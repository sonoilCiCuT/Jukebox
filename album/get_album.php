<?php
    header('Content-Type: application/json');
    header("Access-Control-Allow-Origin: *");
    try{
        $db = new mysqli('localhost', 'php', 'password', 'jukebox');
        if(!empty($_GET["album"])) $arr = get_album($db, $_GET['album']);
        else $arr = get_album($db, "%");
        $db->close();
        echo json_encode($arr);
    } catch(Exception $exception){ 
        echo $exception->getMessage();
    }
    function get_album($db, $cond){
        $ass = [];
        $i = 0;
        $q = "select album_id,nome,titolo,anno,album.url from artista join artista_album using(artista_id) join album using(album_id) where titolo like '%$cond%'  order by artista.nome";            
        $res = $db->query($q);
        while($row = $res->fetch_assoc()){
            $r = $db->query("Select genere.nome from album natural join album_genere join genere using(genere_id) where album_id = ".$row['album_id']);
            $str = [];
            $j = 0;
            while($rr = $r->fetch_assoc()) $str[$j++] = $rr["nome"];
            $ass[$i++]=["titolo"=>$row['titolo'], "artista"=>$row['nome'], "anno"=>$row['anno'], "genere"=>implode(", ",$str), "url"=>$row['url']];
        }
        return $ass;
    }
?>
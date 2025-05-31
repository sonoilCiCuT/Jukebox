<?php
    header('Content-Type: application/json');
    header("Access-Control-Allow-Origin: *");
    try{
        $db = new mysqli("10.0.0.9", "quintaib15", "bcIvr01", "quintaib15_jukebox");
        //$db = new mysqli('localhost', 'php', 'password', 'quintaib15_jukebox');   
        if(!empty($_GET["nome"])) $arr = get_generi($db, $_GET['nome']);
        else $arr = get_generi($db, "%");
        $db->close();
        echo json_encode($arr);
    } catch(Exception $exception){ 
        echo $exception->getMessage();
    }

    function get_generi($db, $cond){
        $ass = [];
        $i = 0;
        $q = "select nome from genere where nome like '%$cond%' order by nome";            
        $res = $db->query($q);
        while($row = $res->fetch_assoc()){
            $ass[$i++]=["nome"=>$row['nome']];
        }
        return $ass;
    }
?>
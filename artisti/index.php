<?php
        header("Access-Control-Allow-Origin: *");
        $path="artisti";
        if(isset($_GET['album'])){
            try{
                $db = new mysqli("10.0.0.9", "quintaib15", "bcIvr01", "quintaib15_jukebox");
                //$db = new mysqli('localhost', 'php', 'password', 'quintaib15_jukebox');
                $cond = "album.titolo like '$_GET[album]'";
                $arr = get_artisti($db, $cond);
                //echo json_encode($arr);
                //$res->close();
                $db->close();
            }catch(Exception $exception){ 
                echo $exception->getMessage();
            }
        }else{
            try{
                $db = new mysqli("10.0.0.9", "quintaib15", "bcIvr01", "quintaib15_jukebox");
                //$db = new mysqli('localhost', 'php', 'password', 'quintaib15_jukebox');
                $arr = get_artisti($db, null);
                //echo json_encode($arr);
                //$res->close();
                $db->close();
            }catch(Exception $exception){ 
                echo $exception->getMessage();
            }
        }
        function get_all($db){
            $res = $db->query("select nome,url from artista");
            if($res->num_rows > 0){
                echo "<table>";
                echo "<tr><th>Artista</th><th>Titolo</th><th>Anno</th><th>Genere</th></tr>";
                while($row = $res->fetch_assoc()){
                    echo "<tr>";
                echo "<td>".$row['nome']."</td>";
                echo "<td>".$row['titolo']."</td>";
                echo "<td>".$row['anno']."</td>";
                echo "<td>".$row['genere']."</td>";
                echo "</tr>";
                }
                echo "</table>";
            }else{
                echo "Nessun risultato trovato.";
            }
        }

        function get_artisti($db, $cond){
            $ass = [];
            $i = 0;
            //select artista.nome,titolo,genere.nome from artista join artista_album using(artista_id) join album using(album_id) join album_genere using(album_id) join genere using(genere_id);
            if(is_null($cond)) $q = "select nome,url from artista order by artista.nome";
            else $q = "select nome,url from artista where $cond  order by artista.nome";            
            $res = $db->query($q);
            while($row = $res->fetch_assoc()){
                $ass[$i++]=["nome"=>$row['nome'], "url"=>$row['url']];
            }
            return $ass;
        }
    ?>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JUKEBOX</title>
        <link rel="stylesheet" href="../jukebox.css">
        <link rel="shortcut icon" href="https://www.svgrepo.com/show/268599/music-player-right-arrow.svg" type="image/x-icon">
        <script src="../script.js"></script>
    </head>
    <body>
        <?php include_once("../nav.php"); include_once("../search.php"); ?>
        <!--div class="filter" id="filter-menu">
            <form action="index.php" method="get">
                <input placeholder="Artista" type="text" name="artista" id="artista">
                <input placeholder="Anno" type="number" name="anno" id="anno">
                <input placeholder="Genere" type="text" name="genere" id="genere">
                <button type="submit">Applica</button>
            </form>
        </div-->
        <div class="artista-container">
            <?php foreach($arr as $artisti): ?>
                <a href="../album/?artista=<?= $artisti['nome'] ?>" class="artista">
                    <img src="<?= $artisti["url"] ?>" alt="">
                    <h2><?= $artisti['nome']; ?></h2>                    
                </a>
            <?php endforeach; ?>  
        </div>  
    </body>
    </html>
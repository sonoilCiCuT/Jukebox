<?php
    session_start();
    $importo = 0;
    //header("Content-type: application/json");
    $path = "playlist";
    if(isset($_SESSION["username"])){
        try{
            $db = new mysqli("10.0.0.9", "quintaib15", "bcIvr01", "quintaib15_jukebox");
            //$db = new mysqli('localhost', 'php', 'password', 'quintaib15_jukebox');
            $re = get_playlist($db);
            foreach($re as $r) $importo += $r["prezzo"];
        }catch(Exception $e){
            echo $e->getMessage();
        }
    }
    function get_playlist($db){
        $r = $db->query("Select prezzo,disponibilita,titolo,album.url as al_url,anno,artista.nome as artista,artista.url as ar_url,tipo.nome as tipo, quantita from playlist join playlist_articolo using(playlist_id) join articolo using(album_id, tipo_id) join album using(album_id) join artista_album using(album_id) join artista using(artista_id) join tipo using(tipo_id) where playlist_id = (select playlist_id from utente join playlist using(utente_id) where email = '$_SESSION[username]' order by playlist_id desc limit 1);");
        $re = [];
        //$quantita=[];
        while($p = $r->fetch_assoc()){
            array_push($re,$p);
            //array_push($quantita, $p["quantita"]);
        }
        //echo json_encode($quantita);
        return $re;
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Playlist</title>
    <link rel="shortcut icon" href="https://www.svgrepo.com/show/268599/music-player-right-arrow.svg" type="image/x-icon">
    <link rel="stylesheet" href="../jukebox.css">
    <link rel="stylesheet" href="playlist.css">
    <script src="../script.js"></script>
</head>
<body onload="createCounter()">
    <?php include_once("../nav.php"); ?>
    <?php if(isset($_SESSION['username'])): ?>
        <div class="subtitle">La tua playlist</div >
        <div class="list">
            <?php if(count($re) > 0): ?>
                <?php foreach($re as $r): ?>
                    <div class="obj" tabindex="0">
                        <div class="alb">
                            <img src="<?= $r['al_url'] ?>">
                            <div>
                                <h3><?= $r['titolo'] ?> - <?= $r['tipo'] ?></h3>
                                <p><?= $r['artista'] ?></p>
                            </div>
                        </div>
                        <div class="areaeconomica">
                            <p class="prezzo" id="a"><?= $r['prezzo'] ?>€</p>
                            <p class="disp" <?php if($r["disponibilita"] < 5 && $r["disponibilita"] > 1) echo "style='color:gold'"; elseif($r["disponibilita"] < 2) echo "style='color:#c30000';" ?> id="b">Disponibilità: <?= $r['disponibilita'] ?></p>
                            <div class="quantita" id="c"></div>
                        </div>
                    </div>
                <?php endforeach; ?>
                <div class="acquista"><span>Totale: <?= $importo ?>€</span><div onclick="acquista()" tabindex="0">Acquisisci</div></div>
            <?php else: ?>
                <div class="error"> Nessun articolo selezionato</div>
            <?php endif; ?>
        </div>
    <?php else: ?>
        <div class="list">
            <a href="../login.php" class="error">Accedi per visualizzare il tuo carrello</a>
        </div>
    <?php endif; ?>
    <div id="popup">
        <p>Sei sicuro di voler confermare l'ordine di 
            <span><?= $importo ?>€</span>?
        </p>
        <button onclick="noacquista(this)">Annulla</button>
        <button onclick="conferma()">Conferma</button>
    </div>
    <div id="acquisto">
        <p>Acquisto effettuato!</p>
        <a href="../">Continua</a>
    </div>
</body>
</html>
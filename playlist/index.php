<?php
    $tipo = [
        "CD"=>"https://www.svgrepo.com/show/487177/cd.svg",
        "Vinile"=>"https://www.svgrepo.com/show/246436/vinyl.svg",
        "Cassetta"=>"https://www.svgrepo.com/show/532675/cassette-tape.svg"
    ];
    session_start();
    $path = "playlist";
    if(isset($_SESSION["username"])){
        try{
            $db = new mysqli("10.0.0.9", "quintaib15", "bcIvr01", "quintaib15_jukebox");
            //$db = new mysqli("localhost", "php", "password", "quintaib15_jukebox");
            $re = get_playlist($db);
        }catch(Exception $e){
            echo $e->getMessage();
        }
    }
    function get_playlist($db){
        $r = $db->query("Select prezzo,disponibilita,titolo,album.url as al_url,anno,artista.nome as artista,artista.url as ar_url,tipo.nome as tipo from playlist join playlist_articolo using(playlist_id) join articolo using(album_id, tipo_id) join album using(album_id) join artista_album using(album_id) join artista using(artista_id) join tipo using(tipo_id) where playlist_id = (select playlist_id from utente join playlist using(utente_id) where email = '$_SESSION[username]' order by playlist_id desc limit 1);");
        $re = [];
        $importo = 0;
        while($p = $r->fetch_assoc()){
            $importo += $p['prezzo'];
            array_push($re,$p);
        }
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
        <h2>La tua playlist</h2>
        <div class="list">
            <?php if(count($re) > 0): ?>
                <?php foreach($re as $r): ?>
                    <fieldset class="obj">
                        <legend><img src="<?= $tipo[$r['tipo']] ?>" alt=""></legend>
                        <div class="alb">
                            <img src="<?= $r['al_url'] ?>">
                            <div>
                                <h3><?= $r['titolo'] ?> - <?= $r['tipo'] ?></h3>
                                <p><?= $r['artista'] ?></p>
                            </div>
                        </div>
                        <div class="areaeconomica">
                            <p class="prezzo" id="a"><?= $r['prezzo'] ?>€</p>
                            <p class="disp <?php if($r['disponibilita'] < 5) echo ($r["disponibilita"] < 2) ? "red" : "yellow";?>" id="b">Disponibilità: <?= $r['disponibilita']?></p>
                            <div class="quantita" id="c"></div>
                        </div>
                </fieldset>
                <?php endforeach; ?>
            <?php else: ?>
                <div class="error">Nessun articolo selezionato</div>
            <?php endif; ?>
        </div>
    <?php else: ?>
        <div class="list">
            <div class="error">Accedi per visualizzare il tuo carrello</div>
        </div>
    <?php endif; ?>
</body>
</html>
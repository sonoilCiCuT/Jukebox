<?php
    $path = "playlist";
    try{
        $db = new mysqli("10.0.0.9", "quintaib15", "bcIvr01", "quintaib15_jukebox");
        $re = get_playlist($db);
    }catch(Exception $e){
        echo $e->getMessage();
    }

    function get_playlist($db){
        $r = $db->query("Select * from playlist join playlist_articolo using(playlist_id) join articolo using(album_id, tipo_id) join album using(album_id) join artista_album using(album_id) join artista using(artista_id) join tipo using(tipo_id) where playlist_id = (select playlist_id from utente join playlist using(utente_id) order by playlist_id desc limit 1);");
        $re = [];
        $prezzo = 0;
        while($p = $r->fetch_assoc()){
            $prezzo += $p['prezzo'];
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
</head>
<body>
    <?php include_once("../nav.php"); ?>
    <div class="list">
        <?php if(count($re) > 0): ?>
            <?php foreach($re as $r): ?>
                <div class="obj">
                    <div class="alb">
                        <img src="<?= $r['src'] ?>">
                        <p><?= $r['nome'] ?></p>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <div class="error">Nessun articolo selezionato</div>
        <?php endif; ?>
    </div>
</body>
</html>
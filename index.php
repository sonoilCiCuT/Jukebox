<?php
    $path = "index";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JUKEBOX</title>
    <link rel="shortcut icon" href="https://www.svgrepo.com/show/268599/music-player-right-arrow.svg" type="image/x-icon">
    <link rel="stylesheet" href="jukebox.css">
    <link rel="stylesheet" href="home.css">
    <script src="script.js"></script>

</head>
<body onload="setColor()">
    <?php include_once("nav.php"); ?>
    <div class="home-grid">
        <a href="artisti" class="album">
            <img src="https://image-cdn-ak.spotifycdn.com/image/ab67618600000194282f8e91da4dff9d5bee49a8" alt="">
            <p>Artisti</p>
        </a>
        <a href="album" class="album">
            <img src="https://djlifemag.com/wp-content/uploads/2024/05/hit-me-hard-and-soft-v0-dhnauhkskhvc1.jpeg" alt="">
            <p>Album</p>
        </a>
        <a href="generi" class="album">
            <img src="https://image-cdn-ak.spotifycdn.com/image/ab67618600000194c4d3aa8ba1de39836df29e24" alt="">
            <p>Generi</p>
        </a>
    </div>
</body>
</html>
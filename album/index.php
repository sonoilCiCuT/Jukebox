    <?php
        $path="album";
        header("Access-Control-Allow-Origin: *");
        //$sel = "Back to Black";
        //$art = "Amy Winehouse";
        $selection = false;
            try{
                $db = new mysqli("10.0.0.9", "quintaib15", "bcIvr01", "quintaib15_jukebox");
                //$db = new mysqli('localhost', 'php', 'password', 'jukebox');
                if(isset($_GET['selection']) && isset($_GET['artista']) && !is_null($res = exists($_GET['selection'],$_GET['artista'],$db))){
                  //  if(isset($sel) && isset($art) && !is_null($res = exists($sel,$art,$db))){
                    $selection = true;
                    $res["canzoni"] = [];
                    $canzoni = $db->query("select * from canzone where album_id = $res[album_id]");
                    while($c = $canzoni->fetch_assoc()) array_push($res["canzoni"],$c);
                }else{
                    //get_all($db);
                    $cond = "";
                    if(isset($_GET['artista'])) $cond .= "artista.nome like '%$_GET[artista]%'";
                    if(isset($_GET['anno'])) $cond .= (strlen($cond) > 0 ? " and " : "")."album.anno = $_GET[anno]%";
                    if(isset($_GET['genere'])) $cond .= (strlen($cond) > 0 ? " and " : "")."genere.nome like '%$_GET[genere]%'";
                    if(isset($_GET['album'])) $cond .= (strlen($cond) > 0 ? " and " : "")."album.titolo like '%$_GET[album]%'";
                    $arr = get_albums($db, (strlen($cond) > 0 ? $cond : null));
                }
                //echo json_encode($arr);
                //$res->close();
                $db->close();
            }catch(Exception $exception){ 
                echo $exception->getMessage();
            }
               
        function exists($alb,$art,$db){
            $res = $db->query("select artista.nome,album.url,album_id,album.anno,album.titolo from album join artista_album using(album_id) join artista using(artista_id) where titolo = '$alb' and nome = '$art'");
            if($res->num_rows>0) return $res->fetch_assoc();
            return null;
        }
        
        function get_all($db){
            $res = $db->query("select artista.nome,titolo,anno,genere.nome as genere from artista natural join artista_album natural join album natural join album_genere join genere using(genere_id)");
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

        function get_albums($db, $cond){
            $ass = [];
            $i = 0;
            //select artista.nome,titolo,genere.nome from artista join artista_album using(artista_id) join album using(album_id) join album_genere using(album_id) join genere using(genere_id);
            if(is_null($cond)) $q = "select album_id,nome,titolo,anno,album.url from artista join artista_album using(artista_id) join album using(album_id) order by artista.nome";
            else $q = "select album_id,nome,titolo,anno,album.url from artista join artista_album using(artista_id) join album using(album_id) where $cond order by artista.nome";            
            $res = $db->query($q);
            while($row = $res->fetch_assoc()){
                $r = $db->query("Select genere.nome from album natural join album_genere join genere using(genere_id) where album_id = ".$row['album_id']);
                $str = [];
                $j = 0;
                while($rr = $r->fetch_assoc()) $str[$j++] = $rr["nome"];
                $ass[$i++]=["album"=>$row['titolo'], "artista"=>$row['nome'], "anno"=>$row['anno'], "genere"=>implode(", ",$str), "url"=>$row['url']];
            }
            return $ass;
        }
    ?>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ALBUM</title>
        <link rel="stylesheet" href="../jukebox.css">
        <link rel="stylesheet" href="album.css">
        <link rel="shortcut icon" href="https://www.svgrepo.com/show/268599/music-player-right-arrow.svg" type="image/x-icon">
        <script src="../script.js"></script>
    </head>
    <body>
        <?php include_once("../nav.php"); ?>
        <?php if(!$selection): ?>
            <?php include_once("../search.php"); ?>
        <div class="filter" id="filter-menu">
            <form action="index.php" method="get">
                <input placeholder="Artista" type="text" name="artista" id="artista">
                <input placeholder="Anno" type="number" name="anno" id="anno">
                <input placeholder="Genere" type="text" name="genere" id="genere">
                <button type="submit">Applica</button>
            </form>
        </div>
        <?php endif; ?>
        <?php if($selection): ?>
            <div class="show-album">
                <div class="details">
                    <img src="<?= $res['url'] ?>">
                    <div class="album-info"><h1><?= $res['titolo']; ?></h1><h2><a href="./?artista=<?= $res['nome'] ?>"><?= $res['nome']; ?></a>, <?= $res['anno']; ?></h2></div>
                    <button onclick="addAlbum(this,event)">Aggiungi alla playlist</button>
                </div>
                <fieldset class="song-list">
                    <legend>
                        <svg width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" ><g clip-path="url(#clip0_429_11112)"><circle cx="12" cy="12" r="2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><circle cx="18" cy="9" r="2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><path d="M15.318 3.63135C14.2913 3.22394 13.1718 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21C16.1514 21 19.6464 18.1892 20.6855 14.3669" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><path d="M20 9V2L22 4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></g><defs><clipPath id="clip0_429_11112"><rect width="24" height="24" fill="white"/></clipPath></defs></svg>
                    </legend>
                    <?php foreach($res['canzoni'] as $can): ?>
                        <div> <?= $can['titolo'] ?></div>
                        <?php endforeach; ?>
                </fieldset>
                <?php else: ?>
            <div class="album-container">
                <?php foreach($arr as $album): ?>
                    <?php if(isset($_GET["genere"])): ?>
                        <?php if(str_contains($album["genere"],$_GET["genere"])): ?>
                            <a href="?selection=<?= $album['album'] ?>&artista=<?= $album['artista'] ?>" class="album">
                                <img src="<?= $album["url"] ?>" alt="">
                                <h2><?= $album['album']; ?></h2>
                                <p class="artist"><?= $album['artista']; ?>, <span class="anno"><?= $album['anno']; ?></span></p>
                                <p class="genere"><?= $album['genere']; ?></p>
                            </a>
                        <?php endif; ?>
                    <?php else: ?>
                    <a href="?selection=<?= $album['album'] ?>&artista=<?= $album['artista'] ?>" class="album">
                        <img src="<?= $album["url"] ?>" alt="">
                        <h2><?= $album['album']; ?></h2>
                        <p class="artist"><?= $album['artista']; ?>, <span class="anno"><?= $album['anno']; ?></span></p>
                        <p class="genere"><?= $album['genere']; ?></p>
                    </a>
                    <?php endif; ?>
                <?php endforeach; ?>  
            <?php endif; ?>
        </div>  
    </body>
    </html>
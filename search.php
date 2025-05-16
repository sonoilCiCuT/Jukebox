<?php
    if(!isset($path)) header("location: http://10.0.0.9/~quintaib10/Jukebox");
?>

<div class="search-filter" style="<?php if($path == "artisti" || $path == "genere") echo "grid-template-columns: 70%; justify-content: center;" ?>">
    <input list="datalist" <?= "onkeyup='get_$path(this,event)'" ?> type="text" id="search" placeholder="Cerca un artista...">
    <?php if($path != "artisti" && $path != "genere"): ?> 
        <svg onclick="openFilter(this, event)" id="filter" width="800px" height="800px" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M41.5 10H35.5" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M27.5 6V14" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M27.5 10L5.5 10" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M13.5 24H5.5" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M21.5 20V28" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M43.5 24H21.5" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M41.5 38H35.5" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M27.5 34V42" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M27.5 38H5.5" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/></svg>
    <?php endif; ?>
    <datalist id="datalist"></datalist>
</div>
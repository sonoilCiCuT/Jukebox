<?php
    if(!isset($path)) header("location: ./");
?>

<div class="search-filter">
    <input list="datalist" <?= "onkeyup='get_$path(this,event)'" ?> type="text" id="search" placeholder="Cerca...">
    <datalist id="datalist"></datalist>
</div>
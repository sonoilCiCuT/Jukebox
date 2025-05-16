document.addEventListener("click", function(event) {
    event.stopPropagation();
    const filter = document.getElementById("filter-menu");
    const search = document.getElementById("search");
    const links_menu = document.getElementById("links-menu");
    if (!links_menu.contains(event.target)) {
        links_menu.style.left = "-50%";
    }
    if (!filter.contains(event.target) && !search.contains(event.target)) {
        filter.style.right = "-50%";
    }
});

var color = null;

function setColor(){
    if(color != null){
        color = "";
        for(let i = 0; i < 6; i++){
            r = Math.random() * 16;
            if(r < 10){
                r = Math.floor(r);
                color += r.toString();
            }else{
                r = Math.floor(r);
                color += String.fromCharCode(r + 87);
            }
        }
        document.documentElement.style.setProperty('--color', '#'+color);
    }
}

function openFilter(f, event){
    event.stopPropagation();
    const filter = document.getElementById("filter-menu");
    if(filter.style.right == "0"){
        filter.style.right = "-50%";
    }else{
        filter.style.right = "0";
    }
}

function toggleLinks(div,event){
    event.stopPropagation();
    const links = document.getElementById("links-menu");
    if(links.style.left == "0"){
        links.style.left = "-50%";
    }else{
        links.style.left = "0";
    }
}

function get_artisti(f, event){
    datalist = document.getElementById("datalist");
    datalist.innerHTML = "";
    const search = document.getElementById("search");
    url = "http://10.0.0.9/~quintaib10/Jukebox/artisti/get_artisti.php?artista=";
    //if(window.location.toString().includes("localhost")) url = "http://localhost/jukebox/artisti/get_artisti.php?artista=";
    fetch(url+search.value)
    .then(response => response.json())
    .then(data => {
        console.log(data);
        const container = document.querySelector(".artista-container");
        container.innerHTML = "";
        data.forEach(artista => {
            //if(search.value.length > 0) {
                opt = document.createElement("option");
                opt.value = artista.nome;
                datalist.appendChild(opt);
            
            const a = document.createElement("a");
            a.href = "../album/?artista="+artista.nome;
            a.className = "artista";
            a.innerHTML = `<img src="${artista.url}" alt=""><h2>${artista.nome}</h2>`;
            container.appendChild(a);
        });
    });
}

function get_album(f, event){
    datalist = document.getElementById("datalist");
    datalist.innerHTML = "";
    const search = document.getElementById("search");
    url = "http://10.0.0.9/~quintaib10/Jukebox/album/get_album.php?album=";
    //if(window.location.toString().includes("localhost")) url = "http://localhost/jukebox/album/get_album.php?album=";
    fetch(url+search.value)
    .then(response => response.json())
    .then(data => {
        console.log(data);
        const container = document.querySelector(".album-container");
        container.innerHTML = "";
        data.forEach(album => {
            if(search.value.length > 0) {
                opt = document.createElement("option");
                opt.value = album.titolo;
                datalist.appendChild(opt);
            }
            const a = document.createElement("a");
            a.href = "./?selection="+album.titolo+"&artista="+album.artista;
            a.className = "album";
            a.innerHTML = `<img src="${album.url}" alt=""><h2>${album.titolo}</h2>
            <p class="artist">${album.artista}, <span class="anno">${album.anno}</span></p>
            <p class="genere">${album.genere}</p>`;
            container.appendChild(a);
        });
    });
}
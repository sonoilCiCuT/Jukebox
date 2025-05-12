create database quintaib15_jukebox;
use quintaib15_jukebox;

create table utente(
    utente_id int auto_increment primary key,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    email varchar(100) not null unique,
    password varchar(255) not null,
    username varchar(50) not null unique
);

create table artista(
    artista_id int auto_increment primary key,
    nome varchar(50) not null,
    url varchar(500)
);

create table genere(
    genere_id int auto_increment primary key,
    nome varchar(50) not null
);

create table album(
    album_id int auto_increment primary key,
    titolo varchar(100) not null,
    url varchar(255) not null,
    anno int not null
);

create table canzone(
    album_id int references album(album_id),
    canzone_id int,
    titolo varchar(100) not null,
    url varchar(255) default null,
    primary key (album_id, canzone_id)
);

create table artista_album(
    artista_id int not null,
    album_id int not null,
    primary key (artista_id, album_id),
    foreign key (artista_id) references artista(artista_id),
    foreign key (album_id) references album(album_id)
);

create table album_genere(
    album_id int not null,
    genere_id int not null,
    primary key (album_id, genere_id),
    foreign key (album_id) references album(album_id),
    foreign key (genere_id) references genere(genere_id)
);

create table tipo(
    tipo_id int auto_increment primary key,
    nome varchar(50) not null
);

create table articolo(
    album_id int not null,
    tipo_id int not null,
    prezzo decimal(10, 2) not null,
    disponibilita int not null,
    foreign key (album_id) references album(album_id),
    foreign key (tipo_id) references tipo(tipo_id),
    primary key (album_id, tipo_id)
);

create table playlist(
    playlist_id int auto_increment primary key,
    utente_id int not null,
    articolo_id int not null,
    foreign key (utente_id) references utente(utente_id),
    foreign key (articolo_id) references articolo(album_id)
);

create table acquisti(
    utente_id int not null,
    playlist_id int not null,
    prezzo decimal(10, 2) not null,
    primary key (utente_id, playlist_id)
);

-----------------------------------------------------------------------------------------------------

INSERT INTO utente (nome, cognome, email, password, username) VALUES
('Mario', 'Rossi', 'mario.rossi@email.com', 'password123', 'mariorossi'),
('Luigi', 'Bianchi', 'luigi.bianchi@email.com', 'securepass', 'luigibianchi'),
('Anna', 'Verdi', 'anna.verdi@email.com', 'annapass', 'annaverdi'),
('Paolo', 'Neri', 'paolo.neri@email.com', 'paolo123', 'paoloneri'),
('Laura', 'Gialli', 'laura.gialli@email.com', 'laurapass', 'lauragialli'),
('Giovanna', 'Blu', 'giovanna.blu@email.com', 'giovanna456', 'giovannablu'),
('Marco', 'Arancione', 'marco.arancione@email.com', 'marco789', 'marcoaran'),
('Sofia', 'Rosa', 'sofia.rosa@email.com', 'sofiapass', 'sofiarosa');

INSERT INTO artista (nome,url) VALUES
('The Beatles','https://10.0.0.9/~quintaib15/ab67616100005174e9348cc01ff5d55971b22433.jpeg'),
('Pink Floyd', 'https://10.0.0.9/~quintaib15/f0a39a8a196a87a7236bdcf8a8708f6d5d3547cc.jpeg'),
('Led Zeppelin','https://10.0.0.9/~quintaib15/b0248a44865493e6a03832aa89854ada16ff07a8.jpeg'),
('Queen','https://10.0.0.9/~quintaib15/c06971e9ff81696699b829484e3be165f4e64368.jpeg'),
('David Bowie','https://10.0.0.9/~quintaib15/ab67616100005174b78f77c5583ae99472dd4a49.jpeg'),
('Radiohead','https://10.0.0.9/~quintaib15/ab67616100005174a03696716c9ee605006047fd.jpeg'),
('Miles Davis','https://10.0.0.9/~quintaib15/8496e6ea230dd47311d85dcf860015792f5ada42.jpeg'),
('John Coltrane','https://10.0.0.9/~quintaib15/ab6761610000517473c7f7505c1af82929ec41df.jpeg'),
('Kendrick Lamar','https://10.0.0.9/~quintaib15/ab6761610000517439ba6dcd4355c03de0b50918.jpeg'),
('Daft Punk','https://10.0.0.9/~quintaib15/ab67616100005174dc93bb227980211b325b9d70.jpeg'),
('Nirvana','https://10.0.0.9/~quintaib15/42ae0f180f16e2f21c1f2212717fc436f5b95451.jpeg'),
('Amy Winehouse','https://10.0.0.9/~quintaib15/ab676161000051742ceb023b10da17590878e88c.jpeg'),
('Arctic Monkeys','https://10.0.0.9/~quintaib15/ab676161000051747da39dea0a72f581535fb11f.jpeg'),
('The Rolling Stones','https://10.0.0.9/~quintaib15/ab67616100005174e4cea917b68726aadb4854b8.jpeg'),
('Bob Marley', 'https://10.0.0.9/~quintaib15/02fd758d9805ef44d1caafc35ff17a47f9dff098.jpeg'),
('Michael Jackson', 'https://10.0.0.9/~quintaib15/ab67616100005174997cc9a4aec335d46c9481fd.jpeg'),
('Madonna', 'https://10.0.0.9/~quintaib15/ab676161000051746ccc1215f5b205aa6b34b48b.jpeg'),
('The Weeknd', 'https://10.0.0.9/~quintaib15/ab676161000051749e528993a2820267b97f6aae.jpeg'),
('Billie Eilish', 'https://10.0.0.9/~quintaib15/ab676161000051744a21b4760d2ecb7b0dcdc8da.jpeg'),
('Eminem', 'https://10.0.0.9/~quintaib15/ab67616100005174a00b11c129b27a88fc72f36b.jpeg'),
('Tame Impala', 'https://10.0.0.9/~quintaib15/ab6761610000517490357ef28b3a012a1d1b2fa2.jpeg'),
('Fleetwood Mac', 'https://10.0.0.9/~quintaib15/ab67616100005174c8752dd511cda8c31e9daee8.jpeg'),
('Jimi Hendrix', 'https://10.0.0.9/~quintaib15/ab6761610000517431f6ab67e6025de876475814.jpeg'),
('Aretha Franklin', 'https://10.0.0.9/~quintaib15/ab67616100005174f12270128127ba170f90097d.jpeg'),
('Frank Ocean', 'https://10.0.0.9/~quintaib15/ab67616100005174ee3123e593174208f9754fab.jpeg'),
('Dio', 'https://10.0.0.9/~quintaib15/ab67616100005174555c8199ba80168cfeafdfbc.jpeg'),
('Rainbow', 'https://10.0.0.9/~quintaib15/402ab270e0754615887a261047f7db4596c1ffda.jpeg'),
('Black Sabbath', 'https://10.0.0.9/~quintaib15/ab676161000051744870cd833ebe1092601820c3.jpeg');

INSERT INTO genere (nome) VALUES
('Rock'),
('Progressive Rock'),
('Hard Rock'),
('Pop'),
('Jazz'),
('Hip Hop'),
('Electronic'),
('Funk'),
('Soul'),
('Alternative'),
('Grunge'),
('R&B'),
('Indie Rock'),
('Reggae'),
('Blues'),
('Pop Rock'),
('Disco'),
('Synthpop'),
('Contemporary R&B'),
('Rap'),
('Psychedelic Rock'),
('Classic Rock'),
('Electric Blues'),
('Gospel'),
('Alternative R&B'),
('Heavy Metal'),
('Power Metal'),
('Doom Metal');

INSERT INTO album (titolo, anno, url) VALUES
('Abbey Road', 1969, "https://m.media-amazon.com/images/I/81sBKBIcwvL.jpg"),
('The Dark Side of the Moon', 1973, "https://legendarycover.it/wp-content/uploads/2019/06/thedarksideofthemoon-e1559419433695.jpg"),
('Led Zeppelin IV', 1971, "https://m.media-amazon.com/images/I/81x364UAGAL._UF1000,1000_QL80_.jpg"),
('A Night at the Opera', 1975, "https://m.media-amazon.com/images/I/71nxRqKGA8L._UF1000,1000_QL80_.jpg"),
('The Rise and Fall of Ziggy Stardust', 1972, "https://www.emp-online.it/dw/image/v2/BBQV_PRD/on/demandware.static/-/Sites-master-emp/default/dw09e23216/images/4/9/9/0/499041a.jpg?sfrm=png"),
('OK Computer', 1997, "https://10.0.0.9/~quintaib15/ab67616d0000b273c8b444df094279e70d0ed856"),
('Kind of Blue', 1959, "https://m.media-amazon.com/images/I/71UUU3OLX2L.jpg"),
('A Love Supreme', 1965, "https://www.segnalisonori.it/wp-content/uploads/2024/11/A-Love-supreme-298x300.jpg"),
('To Pimp a Butterfly', 2015, "https://10.0.0.9/~quintaib15/ab67616d0000b273cdb645498cd3d8a2db4d05e1"),
('Random Access Memories', 2013, "https://www.lafeltrinelli.it/images/0888837168618_0_0_536_0_75.jpg"),
('Nevermind', 1991, "https://m.media-amazon.com/images/I/71DQrKpImPL._UF1000,1000_QL80_.jpg"),
('Back to Black', 2006, "https://m.media-amazon.com/images/I/71Y55FU5VGL._UF1000,1000_QL80_.jpg"),
('AM', 2013, "https://m.media-amazon.com/images/I/71-Y-3usHkL._UF1000,1000_QL80_.jpg"),
('Exile on Main St.', 1972, "https://m.media-amazon.com/images/I/81iYdOXSwwL.jpg"),
('Legend', 1984, "https://i.discogs.com/BkNK_6bL4o1ELmErdcgdvgraXqS7K4dT7-SXmegIaAU/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwNjEy/NzktMTUzNzQ0OTY2/OC0yMDU2LnBuZw.jpeg"),
('Thriller', 1982, "https://m.media-amazon.com/images/I/81ogsUqshzL.jpg"),
('Like a Virgin', 1984, "https://m.media-amazon.com/images/I/61GUZovO+FL._UF1000,1000_QL80_.jpg"),
('After Hours', 2020, "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/6f/bc/e6/6fbce6c4-c38c-72d8-4fd0-66cfff32f679/20UMGIM12176.rgb.jpg/600x600bf-60.jpg"),
('When We All Fall Asleep...', 2019, "https://m.media-amazon.com/images/I/81idxQqxTlL._UF1000,1000_QL80_.jpg"),
('The Marshall Mathers LP', 2000, "https://m.media-amazon.com/images/I/51kjI6nqAtL._UF1000,1000_QL80_.jpg"),
('Currents', 2015, "https://m.media-amazon.com/images/I/91mp9eEux-L.jpg"),
('Rumours', 1977, "https://m.media-amazon.com/images/I/71BekDJBb3L.jpg"),
('Are You Experienced', 1967, "https://upload.wikimedia.org/wikipedia/commons/3/33/Are_You_Experienced_-_US_cover-edit.jpg"),
('I Never Loved a Man...', 1967, "https://m.media-amazon.com/images/I/81Ez8-3qQaL._UF1000,1000_QL80_.jpg"),
('Blonde', 2016, "https://10.0.0.9/~quintaib15/ab67616d0000b273c5649add07ed3720be9d5526"),
('Holy Diver', 1983, "https://www.emp-online.it/dw/image/v2/BBQV_PRD/on/demandware.static/-/Sites-master-emp/default/dw12b64f28/images/4/0/0/1/400152.jpg?sw=1000&sh=800&sm=fit&sfrm=png"),
('The Last in Line', 1984, "https://m.media-amazon.com/images/I/71DkaIXGhEL._UF1000,1000_QL80_.jpg"),
('Rainbow Rising', 1976, "https://m.media-amazon.com/images/I/71D-MeVXnML.jpg"),  -- Supponendo che Rainbow sia artista_id 5 (verifica)
('Heaven and Hell', 1980, "https://m.media-amazon.com/images/I/71nANQYpdWL._UF1000,1000_QL80_.jpg"),  -- Supponendo che Black Sabbath sia artista_id 6
("Sacred Heart",1985,"https://m.media-amazon.com/images/I/81zwOxhwGlL._UF1000,1000_QL80_.jpg"),
("Dream Evil",1987,"https://m.media-amazon.com/images/I/71ogkzJrC+L._UF1000,1000_QL80_.jpg"),
("Lock Up the Wolves",1990,"https://m.media-amazon.com/images/I/71P-qO4RSjL._UF1000,1000_QL80_.jpg"),
("From Heaven to Heal",1992,"https://m.media-amazon.com/images/I/81nd1k14ZsL._UF1000,1000_QL80_.jpg"),
("Strange Highways",1993,"https://m.media-amazon.com/images/I/71ks7fF3vmL._UF1000,1000_QL80_.jpg"),
("Angry Machines",1996,"https://m.media-amazon.com/images/I/515ZT4HT1EL._UF1000,1000_QL80_.jpg"),
("Magica",2000,"https://m.media-amazon.com/images/I/714ECzGiy2L._UF1000,1000_QL80_.jpg"),
("Killing the Dragon",2002,"https://upload.wikimedia.org/wikipedia/en/c/cd/DioKillingTheDragon.jpg"),
("Master of the Moon",2004,"https://m.media-amazon.com/images/I/71QDTMuuFOL._UF894,1000_QL80_.jpg");

INSERT INTO canzone(album_id, titolo, canzone_id) VALUES
(12,"Rehab",1),
(12,"You Know I'm No Good",2),
(12,"Me & Mr. Jones",3),
(12,"Just Friends",4),
(12,"Back to Black",5),
(12,"Love Is a Losing Game",6),
(12,"Tears Dry on Their Own",7),
(12,"Wake Up Alone",8),
(12,"Some Unholy War",9),
(12,"He Can Only Hold Her",10),
(12,"Addicted",11),
(12,"Valerie",12),
(12,"Cupid",13),
(12,"Monkey Man",14),
(12,"Hey Little Rich Girl",15),
(12,"You're Wondering Now",16);

INSERT INTO artista_album (artista_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),  -- Holy Diver - Dio
(26, 27),  -- The Last in Line - Dio
(27, 28),  -- Rainbow Rising - Rainbow
(28, 29),
(26,30),
(26,31),
(26,32),
(26,33),
(26,34),
(26,35),
(26,36),
(26,37),
(26,38);

INSERT INTO album_genere (album_id, genere_id) VALUES
(1, 1), (1, 4),    -- Abbey Road: Rock, Pop
(2, 2), (2, 1),    -- Dark Side: Prog Rock, Rock
(3, 3), (3, 1),    -- Led Zepp IV: Hard Rock, Rock
(4, 1), (4, 4),    -- Night at Opera: Rock, Pop
(5, 1), (5, 9),    -- Ziggy Stardust: Rock, Soul
(6, 10), (6, 1),   -- OK Computer: Alternative, Rock
(7, 5), (7, 8),    -- Kind of Blue: Jazz, Funk
(8, 5),            -- Love Supreme: Jazz
(9, 6), (9, 8),    -- To Pimp: Hip Hop, Funk
(10, 7), (10, 8),  -- RAM: Electronic, Funk
(11, 11),            -- Nevermind: Grunge
(12, 12), (12, 9),    -- Back to Black: R&B, Soul
(13, 13), (13, 1),    -- AM: Indie Rock, Rock
(14, 1), (14, 15),    -- Exile: Rock, Blues
(15, 14), (15, 9),    -- Legend: Reggae, Soul
(16, 4), (16, 16), (16, 8),    -- Thriller: Pop, Pop Rock, Funk
(17, 4), (17, 17),              -- Like a Virgin: Pop, Disco
(18, 12), (18, 20),             -- After Hours: R&B, Alternative R&B
(19, 4), (19, 10),              -- When We All Fall Asleep: Pop, Alternative
(20, 21),                       -- Marshall Mathers LP: Rap
(21, 22), (21, 7),              -- Currents: Psychedelic Rock, Electronic
(22, 1), (22, 23),              -- Rumours: Rock, Classic Rock
(23, 1), (23, 24),              -- Are You Experienced: Rock, Electric Blues
(24, 9), (24, 25),              -- I Never Loved a Man: Soul, Gospel
(25, 20), (25, 10),             -- Blonde: Alternative R&B, Alternative
(26, 3), (26, 26),   -- Holy Diver: Hard Rock, Heavy Metal
(27, 3), (27, 26),   -- The Last in Line: Hard Rock, Heavy Metal
(28, 26), (28, 27),  -- Rainbow Rising: Heavy Metal, Power Metal
(29, 26), (29, 28),
(30,3), (30, 26), (30, 27),  
(31,3), (31, 26), (31, 27),  
(32,3), (32, 26), (32, 27),  
(33,3), (33, 26), (33, 27), 
(34,3), (34, 26), (34, 27), 
(35,3), (35, 26), (35, 27), 
(36,3), (36, 26), (36, 27), 
(37,3), (37, 26), (37, 27), 
(38,3), (38, 26), (38, 27);


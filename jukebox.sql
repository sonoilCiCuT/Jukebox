drop database quintaib15_jukebox;
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
    foreign key (utente_id) references utente(utente_id)
);

create table playlist_articolo(
    playlist_id int references playlist(playlist_id),
    album_id int not null,
    tipo_id int not null,
    foreign key (album_id,tipo_id) references articolo(album_id,tipo_id),
    primary key (playlist_id,album_id,tipo_id)
);

create table acquisti(
    utente_id int not null,
    playlist_id int not null,
    prezzo decimal(10, 2) not null,
    primary key (utente_id, playlist_id)
);


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
('The Beatles','../foto/ab67616100005174e9348cc01ff5d55971b22433.jpeg'),
('Pink Floyd', '../foto/f0a39a8a196a87a7236bdcf8a8708f6d5d3547cc.jpeg'),
('Led Zeppelin','../foto/b0248a44865493e6a03832aa89854ada16ff07a8.jpeg'),
('Queen','../foto/c06971e9ff81696699b829484e3be165f4e64368.jpeg'),
('David Bowie','../foto/ab67616100005174b78f77c5583ae99472dd4a49.jpeg'),
('Radiohead','../foto/ab67616100005174a03696716c9ee605006047fd.jpeg'),
('Miles Davis','../foto/8496e6ea230dd47311d85dcf860015792f5ada42.jpeg'),
('John Coltrane','../foto/ab6761610000517473c7f7505c1af82929ec41df.jpeg'),
('Kendrick Lamar','../foto/ab6761610000517439ba6dcd4355c03de0b50918.jpeg'),
('Daft Punk','../foto/ab67616100005174dc93bb227980211b325b9d70.jpeg'),
('Nirvana','../foto/42ae0f180f16e2f21c1f2212717fc436f5b95451.jpeg'),
('Amy Winehouse','../foto/ab676161000051742ceb023b10da17590878e88c.jpeg'),
('Arctic Monkeys','../foto/ab676161000051747da39dea0a72f581535fb11f.jpeg'),
('The Rolling Stones','../foto/ab67616100005174e4cea917b68726aadb4854b8.jpeg'),
('Bob Marley', '../foto/02fd758d9805ef44d1caafc35ff17a47f9dff098.jpeg'),
('Michael Jackson', '../foto/ab67616100005174997cc9a4aec335d46c9481fd.jpeg'),
('Madonna', '../foto/ab676161000051746ccc1215f5b205aa6b34b48b.jpeg'),
('The Weeknd', '../foto/ab676161000051749e528993a2820267b97f6aae.jpeg'),
('Billie Eilish', '../foto/ab676161000051744a21b4760d2ecb7b0dcdc8da.jpeg'),
('Eminem', '../foto/ab67616100005174a00b11c129b27a88fc72f36b.jpeg'),
('Tame Impala', '../foto/ab6761610000517490357ef28b3a012a1d1b2fa2.jpeg'),
('Fleetwood Mac', '../foto/ab67616100005174c8752dd511cda8c31e9daee8.jpeg'),
('Jimi Hendrix', '../foto/ab6761610000517431f6ab67e6025de876475814.jpeg'),
('Aretha Franklin', '../foto/ab67616100005174f12270128127ba170f90097d.jpeg'),
('Frank Ocean', '../foto/ab67616100005174ee3123e593174208f9754fab.jpeg'),
('Dio', '../foto/ab67616100005174555c8199ba80168cfeafdfbc.jpeg'),
('Rainbow', '../foto/402ab270e0754615887a261047f7db4596c1ffda.jpeg'),
('Black Sabbath', '../foto/ab676161000051744870cd833ebe1092601820c3.jpeg');

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
('OK Computer', 1997, "https://m.media-amazon.com/images/I/71qtTEW46SL._UF1000,1000_QL80_.jpg"),
('Kind of Blue', 1959, "https://m.media-amazon.com/images/I/71UUU3OLX2L.jpg"),
('A Love Supreme', 1965, "https://www.segnalisonori.it/wp-content/uploads/2024/11/A-Love-supreme-298x300.jpg"),
('To Pimp a Butterfly', 2015, "https://m.media-amazon.com/images/I/81VcA8-kuZL._UF1000,1000_QL80_.jpg"),
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
('Blonde', 2016, "https://images.rockol.it/TRtPnbFUhAI0KrepgMGQaOrYuHs=/1200x1200/smart/rockol-img/img/foto/upload/blonde-frank-ocean-cover-1471858660.jpg"),
('Holy Diver', 1983, "https://www.emp-online.it/dw/image/v2/BBQV_PRD/on/demandware.static/-/Sites-master-emp/default/dw12b64f28/images/4/0/0/1/400152.jpg?sw=1000&sh=800&sm=fit&sfrm=png"),
('The Last in Line', 1984, "https://m.media-amazon.com/images/I/71DkaIXGhEL._UF1000,1000_QL80_.jpg"),
('Rainbow Rising', 1976, "https://m.media-amazon.com/images/I/71D-MeVXnML.jpg"),  -- Rainbow
('Heaven and Hell', 1980, "https://m.media-amazon.com/images/I/71nANQYpdWL._UF1000,1000_QL80_.jpg"),  -- Black Sabbath
("Sacred Heart",1985,"https://m.media-amazon.com/images/I/81zwOxhwGlL._UF1000,1000_QL80_.jpg"),
("Dream Evil",1987,"https://m.media-amazon.com/images/I/71ogkzJrC+L._UF1000,1000_QL80_.jpg"),
("Lock Up the Wolves",1990,"https://e.snmc.io/i/600/s/8d0f22d3a39ca24a18fd25fd20434604/1214652/dio-lock-up-the-wolves-Cover-Art.jpg"),
("From Heaven to Hell",1992,"https://m.media-amazon.com/images/I/81nd1k14ZsL._UF1000,1000_QL80_.jpg"),
("Strange Highways",1993,"https://m.media-amazon.com/images/I/71ks7fF3vmL._UF1000,1000_QL80_.jpg"),
("Angry Machines",1996,"https://m.media-amazon.com/images/I/515ZT4HT1EL._UF1000,1000_QL80_.jpg"),
("Magica",2000,"https://m.media-amazon.com/images/I/714ECzGiy2L._UF1000,1000_QL80_.jpg"),
("Killing the Dragon",2002,"https://upload.wikimedia.org/wikipedia/en/c/cd/DioKillingTheDragon.jpg"), -- Dio
("Master of the Moon",2004,"https://m.media-amazon.com/images/I/71QDTMuuFOL._UF894,1000_QL80_.jpg"); -- Dio

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
(12,"You're Wondering Now",16),
(1,"Come Together",1),
(1,"Something",2),
(1,"Maxwell's Silver Hammer",3),
(1,"Oh! Darling",4),
(1,"Octopus's Garden",5),
(1,"I Want You (She's So Heavy)",6),
(1,"Here Comes the Sun",7),
(1,"Because",8),
(1,"You Never Give Me Your Money",9),
(1,"Sun King",10),
(1,"Mean Mr. Mustard",11),
(1,"Polythene Pam",12),
(1,"She Came in Through the Bathroom Window",13),
(1,"Golden Slumbers",14),
(1,"Carry That Weight",15),
(1,"The End",16),
(2,"Speak to Me",1),
(2,"Breathe",2),
(2,"On the Run",3),
(2,"Time",4),
(2,"The Great Gig in the Sky",5),
(2,"Money",6),
(2,"Us and Them",7),
(2,"Any Colour You Like",8),
(2,"Brain Damage",9),
(2,"Eclipse",10),
(3,"Black Dog",1),
(3,"Rock and Roll",2),
(3,"The Battle of Evermore",3),
(3,"Stairway to Heaven",4),
(3,"Misty Mountain Hop",5),
(3,"Four Sticks",6),
(3,"Going to California",7),
(3,"When the Levee Breaks",8),
(4,"Death on Two Legs (Dedicated to...)",1),
(4,"Lazing on a Sunday Afternoon",2),
(4,"I'm in Love with My Car",3),
(4,"You're My Best Friend",4),
(4,"39",5),
(4,"Sweet Lady",6),
(4,"Seaside Rendezvous",7),
(4,"The Prophet's Song",8),
(4,"Love of My Life",9),
(4,"Good Company",10),
(4,"Bohemian Rhapsody",11),
(4,"God Save the Queen",12),
(5,"Five Years",1),
(5,"Soul Love",2),
(5,"Moonage Daydream",3),
(5,"Starman",4),
(5,"It Ain't Easy",5),
(5,"Lady Stardust",6),
(5,"Star",7),
(5,"Hang On to Yourself",8),
(5,"Ziggy Stardust",9),
(5,"Suffragette City",10),
(5,"Rock 'n' Roll Suicide", 11),
(6,"Airbag",1),
(6,"Paranoid Android",2),
(6,"Subterranean Homesick Alien",3),
(6,"Exit Music (For a Film)",4),
(6,"Let Down",5),
(6,"Karma Police",6),
(6,"Fitter Happier",7),
(6,"Electioneering",8),
(6,"Climbing Up the Walls",9),
(6,"No Surprises",10),
(6,"Lucky",11),
(6,"The Tourist",12),
(7,"So What",1),
(7,"Freddie Freeloader",2),
(7,"Blue in Green",3),
(7,"All Blues",4),
(7,"Flamenco Sketches",5),
(8,"Acknowledgement",1),
(8,"Resolution",2),
(8,"Pursuance",3),
(8,"Psalm",4),
(9,"Wesley's Theory",1),
(9,"For Free? (Interlude)",2),
(9,"King Kunta",3),
(9,"Institutionalized",4),
(9,"These Walls",5),
(9,"u",6),
(9,"Alright",7),
(9,"For Sale? (Interlude)",8),
(9,"Momma",9),
(9,"Hood Politics",10),
(9,"How Much a Dollar Cost?",11),
(9, "Complexion (A Zulu Love)",12),
(9,"The Blacker the Berry",13), 
(9,"You Ain't Gotta Lie (Momma Said)",14),
(9, "i", 15),
(9, "Mortal Man", 16),
(10,"Give Life Back to Music",1),
(10,"The Game of Love",2),
(10,"Giorgio by Moroder",3),
(10,"Within",4),
(10,"Instant Crush",5),
(10,"Lose Yourself to Dance",6),
(10,"Touch",7),
(10,"Get Lucky",8),
(10,"Beyond",9),
(10,"Motherboard",10),
(10,"Fragments of Life",11),
(10,"Doin' It Right",12),
(10,"Contact",13),
(11,"Smells Like Teen Spirit",1),
(11,"In Bloom",2),
(11,"Come as You Are",3),
(11,"Breed",4),
(11,"Lithium",5),
(11,"Polly",6),
(11,"Territorial Pissings",7),
(11,"Drain You",8),
(11,"Lounge Act",9),
(11,"Stay Away",10),
(11,"On a Plain",11),
(11,"Something in the Way",12),
(13,"Do I Wanna Know?",1),
(13,"R U Mine?",2),
(13,"One for the Road",3),
(13,"Arabella",4),
(13,"I Want It All",5),
(13,"No. 1 Party Anthem",6),
(13,"Mad Sounds",7),
(13,"Fireside",8),
(13,"Why'd You Only Call Me When You're High?",9),
(13,"Snap Out of It",10),
(13,"Knee Socks",11),
(13,"I Wanna Be Yours",12),
(14,"Rocks Off",1),
(14,"Rip This Joint",2),
(14,"Shake Your Hips",3),
(14,"Casino Boogie",4),
(14,"Tumbling Dice",5),
(14,"Sweet Virginia",6),
(14,"Torn and Frayed",7),
(14,"Sweet Black Angel",8),
(14,"Loving Cup",9),
(14,"Happy",10),
(14,"Turd on the Run", 11),
(14,"Ventilator Blues", 12),
(14,"I Just Want to See His Face", 13),
(14,"Let It Loose", 14),
(14,"All Down the Line", 15),
(14,"Stop Breaking Down", 16),
(14,"Shine a Light", 17),
(14,"Soul Survivor", 18),
(15, "Is This Love", 1),
(15, "No Woman, No Cry", 2),
(15, "Could You Be Loved", 3),
(15, "Three Little Birds", 4),
(15, "Buffalo Soldier", 5),
(15, "Get Up, Stand Up", 6),
(15, "Stir It Up", 7),
(15, "One Love", 8),
(15, "I Shot the Sheriff", 9),
(15, "Waiting in Vain", 10),
(15, "Redemption Song", 11),
(15, "Satisfy My Soul", 12),
(15, "Exodus", 13),
(15, "Jamming", 14),
(16, "Want to Be Startin' Somethin'", 1),
(16, "Baby Be Mine", 2),
(16, "The Girl Is Mine", 3),
(16, "Thriller", 4),
(16, "Beat It", 5),
(16, "Billie Jean", 6),
(16, "Human Nature", 7),
(16, "P.Y.T. (Pretty Young Thing)", 8),
(16, "The Lady in My Life", 9),
(17, "Material Girl", 1),
(17, "Angel", 2),
(17, "Like a Virgin", 3),
(17, "Over and Over", 4),
(17, "Love Don't Live Here Anymore", 5),
(17, "Dress You Up", 6),
(17, "Shoo-Bee-Doo", 7),
(17, "Pretender", 8),
(17, "Stay", 9),
(18, "Alone Again", 1),
(18, "Too Late", 2),
(18, "Hardest to Love", 3),
(18, "Scared to Live", 4),
(18, "Snowchild", 5),
(18, "Escape from LA", 6),
(18, "Heartless", 7),
(18, "Faith", 8),
(18, "Blinding Lights", 9),
(18, "In Your Eyes", 10),
(18, "Save Your Tears", 11),
(18, "Repeat After Me (Interlude)", 12),
(18, "After Hours", 13),
(18, "Until I Bleed Out", 14),
(19, "!!!!!!!", 1),
(19, "bad guy", 2),
(19, "xanny", 3),
(19, "you should see me in a crown", 4),
(19, "all the good girls go to hell", 5),
(19, "wish you were gay", 6),
(19, "when the party's over", 7),
(19, "8", 8),
(19, "my strange addiction", 9),
(19, "bury a friend", 10),
(19, "ilomilo", 11),
(19, "listen before i go", 12),
(19, "i love you", 13),
(19, "goodbye", 14),
(20, "Public Service Announcement 2000", 1),
(20, "My Name Is", 2),
(20, "Guilty Conscience", 3),
(20, "Brain Damage", 4),
(20, "Paul (Skit)", 5),
(20, "If I Had", 6),
(20, '97 Bonnie & Clyde', 7),
(20, 'Bitch Please', 8),
(20, 'Role Model', 9),
(20, 'Lounge (Skit)', 10),
(20, 'My Fault', 11),
(20, 'Ken Kaniff (Skit)', 12),
(20, 'Cum on Everybody', 13),
(20, 'Rock Bottom', 14),
(20, "Just Don't Give a Fuck", 15),
(20, 'Marshall Mathers', 16),
(20, 'Drug Ballad', 17),
(20, 'Amityville', 18),
(20, 'Bitch Please II', 19),
(20, 'Kim', 20),
(20, 'Under the Influence', 21),
(20, 'Criminal', 22),
(21, 'Let It Happen', 1),
(21, 'Nangs', 2),
(21, 'The Moment', 3),
(21, "Yes I'm Changing", 4),
(21, 'Eventually', 5),
(21, 'Gossip', 6),
(21, 'The Less I Know the Better', 7),
(21, 'Past Life', 8),
(21, 'Disciples', 9),
(21, 'Cause I’m a Man', 10),
(21, 'Reality in Motion', 11),
(21, 'Love/Paranoia', 12),
(21, 'New Person, Same Old Mistakes', 13),
(22, 'Second Hand News', 1),
(22, 'Dreams', 2),
(22, 'Never Going Back Again', 3),
(22, "Don't Stop", 4),
(22, 'Go Your Own Way', 5),
(22, 'Songbird', 6),
(22, 'The Chain', 7),
(22, 'You Make Loving Fun', 8),
(22, "I Don't Want to Know", 9),
(22, 'Oh Daddy', 10),
(22, 'Gold Dust Woman', 11),
(23, 'Purple Haze', 1),
(23, 'Manic Depression', 2),
(23, 'Hey Joe', 3),
(23, 'Love or Confusion', 4),
(23, 'May This Be Love', 5),
(23, "I Don\'t Live Today", 6),
(23, 'The Wind Cries Mary', 7),
(23, 'Fire', 8),
(23, '3rd Stone from the Sun', 9),
(23, 'Foxy Lady', 10),
(23, 'Are You Experienced?', 11),
(24, 'Respect', 1),
(24, 'Drown in My Own Tears', 2),
(24, 'I Never Loved a Man (The Way I Love You)', 3),
(24, 'Soul Serenade', 4),
(24, "Don't Let Me Lose This Dream", 5),
(24, 'Baby, Baby, Baby', 6),
(24, 'Dr. Feelgood (Love is a Serious Business)', 7),
(24, 'Good Times', 8),
(24, 'Do Right Woman, Do Right Man', 9),
(24, 'Save Me', 10),
(24, 'A Change Is Gonna Come', 11),
(25, 'Nikes', 1),
(25, 'Ivy', 2),
(25, 'Pink + White', 3),
(25, 'Be Yourself', 4),
(25, 'Solo', 5),
(25, 'Skyline To', 6),
(25, 'The Weekend', 7),
(25, 'Self Control', 8),
(25, 'Good Guy', 9),
(25, 'Nights', 10),
(25, 'blonde', 11),
(25, 'Close to You', 12),
(25, 'White Ferrari', 13),
(25, 'Seigfried', 14),
(25, 'Godspeed', 15),
(25, 'Futura Free', 16),
(26, 'Stand Up and Shout', 1),
(26, 'Holy Diver', 2),
(26, 'Gypsy', 3),
(26, 'Caught in the Middle', 4),
(26, "Don't Talk to Strangers", 5),
(26, 'Straight Through the Heart', 6),
(26, 'Invisible', 7),
(26, 'Rainbow in the Dark', 8),
(26, 'Shame on the Night', 9),
(27, 'We Rock', 1),
(27, 'The Last in Line', 2),
(27, 'Breathless', 3),
(27, 'I Speed at Night', 4),
(27, 'One Night in the City', 5),
(27, 'Evil Eyes', 6),
(27, 'Mystery', 7),
(27, 'Eat Your Heart Out', 8),
(27, 'Egypt (The Chains Are On)', 9),
(28, 'Tarot Woman', 1),
(28, 'Run with the Wolf', 2),
(28, 'Starstruck', 3),
(28, 'Do You Close Your Eyes', 4),
(28, 'Stargazer', 5),
(28, 'A Light in the Black', 6),
(29, 'Neon Knights', 1),
(29, 'Children of the Sea', 2),
(29, 'Lady Evil', 3),
(29, 'Heaven and Hell', 4),
(29, 'Wishing Well', 5),
(29, 'Die Young', 6),
(29, 'Walk Away', 7),
(29, 'Lonely Is the Word', 8),
(30, 'King of Rock and Roll', 1),
(30, 'Sacred Heart', 2),
(30, 'Another Lie', 3),
(30, 'Rock and Roll Children', 4),
(30, 'Hungry for Heaven', 5),
(30, 'Like the Beat of a Heart', 6),
(30, 'Just Another Day', 7),
(30, 'Fallen Angels', 8),
(30, 'Shoot Shoot', 9),
(31, 'Night People', 1),
(31, 'Dream Evil', 2),
(31, 'Sunset Superman', 3),
(31, 'All the Fools Sailed Away', 4),
(31, 'Naked in the Rain', 5),
(31, 'Overlove', 6),
(31, 'I Could Have Been a Dreamer', 7),
(31, 'Faces in the Window', 8),
(31, 'When a Woman Cries', 9),
(32, 'Wild One', 1),
(32, 'Born on the Sun', 2),
(32, 'Hey Angel', 3),
(32, 'Between Two Hearts', 4),
(32, 'Night Music', 5),
(32, 'Lock Up the Wolves', 6),
(32, 'Evil on Queen Street', 7),
(32, 'Walk on Water', 8),
(32, 'Twisted', 9),
(32, 'Why Are They Watching Me', 10),
(32, 'My Eyes', 11),
(33, 'Different Approaches', 1),
(33, 'Fantasy and Dreams', 2),
(33, 'Stageshows', 3),
(33, 'Stage Shows II', 4),
(33, 'Fantasy', 5),
(33, 'Elf and Rainbow', 6),
(33, 'Writing Riffs', 7),
(33, 'Philadelphia', 8),
(33, 'Classic Songs', 9),
(33, 'Writing for Film', 10),
(33, 'Strange Concerts', 11),
(33, 'Hating Keyboards', 12),
(33, 'Being the King', 13),
(33, 'Reincarnation', 14),
(34, 'Jesus, Mary & The Holy Ghost', 1),
(34, 'Firehead', 2),
(34, 'Strange Highways', 3),
(34, 'Hollywood Black', 4),
(34, 'Evilution', 5),
(34, 'Pain', 6),
(34, 'One Foot In The Grave', 7),
(34, 'Give Her The Gun', 8),
(34, 'Blood From A Stone', 9),
(34, "Here's To You", 10),
(34, 'Bring Down The Rain', 11),
(35, 'Institutional Man', 1),
(35, "Don't Tell The Kids", 2),
(35, 'Black', 3),
(35, 'Hunter Of The Heart', 4),
(35, 'Stay Out Of My Mind', 5),
(35, 'Big Sister', 6),
(35, 'Double Monday', 7),
(35, 'Golden Rules', 8),
(35, 'Dying In America', 9),
(35, 'This Is Your Life', 10),
(36, 'Discovery', 1),
(36, 'Magica Theme', 2),
(36, 'Lord Of The Last Day', 3),
(36, 'Fever Dreams', 4),
(36, 'Turn To Stone', 5),
(36, 'Feed My Head', 6),
(36, 'Eriel', 7),
(36, 'Challis', 8),
(36, "As Long As It's Not About Love", 9),
(36, 'Losing My Insanity', 10),
(36, 'Otherworld', 11),
(36, 'Magica ~ Reprise', 12),
(36, 'Lord Of The Last Day ~ Reprise', 13),
(36, 'Magica Story', 14),
(37, 'Killing The Dragon', 1),
(37, 'Along Comes A Spider', 2),
(37, 'Scream', 3),
(37, 'Better In The Dark', 4),
(37, 'Rock & Roll', 5),
(37, 'Push', 6),
(37, 'Guilty', 7),
(37, 'Throw Away Children', 8),
(37, 'Before The Fall', 9),
(37, 'Cold Feet', 10),
(38, 'One More For The Road', 1),
(38, 'Master Of The Moon', 2),
(38, 'The End Of The World', 3),
(38, 'Shivers', 4),
(38, 'The Man Who Would Be King', 5),
(38, 'The Eyes', 6),
(38, 'Living The Lie', 7),
(38, 'I Am', 8),
(38, 'Death By Love', 9),
(38, 'In Dreams', 10);

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


INSERT INTO tipo (nome) VALUES
('CD'),
('Vinile'),
('Cassetta');

INSERT INTO articolo (prezzo, tipo_id, album_id, disponibilita) VALUES
(10.99, 1, 1, 5),
(12.99, 2, 1, 3),
(8.99, 3, 1, 2),
(9.99, 1, 2, 4),
(11.99, 2, 2, 6),
(7.99, 3, 2, 1),
(15.99, 1, 3, 5),
(17.99, 2, 3, 3),
(13.99, 3, 3, 2),
(14.99, 1, 4, 4),
(16.99, 2, 4, 6),
(12.99, 3, 4, 1),
(18.99, 1, 5, 5),
(20.99, 2, 5, 3),
(16.99, 3, 5, 2),
-- Articoli per album 16-20
(12.99, 1, 16, 7),  -- CD Thriller
(24.99, 2, 16, 4),  -- Vinile Thriller
(9.99, 3, 16, 3),   -- Cassetta Thriller

(10.99, 1, 17, 5),  -- CD Like a Virgin
(22.99, 2, 17, 2),  -- Vinile Like a Virgin
(8.99, 3, 17, 1),   -- Cassetta Like a Virgin

(14.99, 1, 18, 6),  -- CD After Hours
(26.99, 2, 18, 3),  -- Vinile After Hours
(11.99, 3, 18, 2),  -- Cassetta After Hours

(13.99, 1, 19, 4),  -- CD When We All Fall Asleep
(25.99, 2, 19, 2),  -- Vinile When We All Fall Asleep
(10.99, 3, 19, 1),  -- Cassetta When We All Fall Asleep

(11.99, 1, 20, 5),  -- CD Marshall Mathers LP
(23.99, 2, 20, 3),  -- Vinile Marshall Mathers LP
(9.99, 3, 20, 2),   -- Cassetta Marshall Mathers LP

-- Articoli per album 21-25
(15.99, 1, 21, 4),  -- CD Currents
(27.99, 2, 21, 2),  -- Vinile Currents
(12.99, 3, 21, 1),  -- Cassetta Currents

(14.99, 1, 22, 6),  -- CD Rumours
(28.99, 2, 22, 3),  -- Vinile Rumours
(11.99, 3, 22, 2),  -- Cassetta Rumours

(16.99, 1, 23, 5),  -- CD Are You Experienced
(29.99, 2, 23, 2),  -- Vinile Are You Experienced
(13.99, 3, 23, 1),  -- Cassetta Are You Experienced

(12.99, 1, 24, 4),  -- CD I Never Loved a Man
(24.99, 2, 24, 2),  -- Vinile I Never Loved a Man
(9.99, 3, 24, 1),   -- Cassetta I Never Loved a Man

(17.99, 1, 25, 3),  -- CD Blonde
(30.99, 2, 25, 1),  -- Vinile Blonde
(14.99, 3, 25, 1),  -- Cassetta Blonde

-- Articoli per album 26-30 (Dio e altri)
(18.99, 1, 26, 5),  -- CD Holy Diver
(31.99, 2, 26, 3),  -- Vinile Holy Diver
(15.99, 3, 26, 2),  -- Cassetta Holy Diver

(19.99, 1, 27, 4),  -- CD The Last in Line
(32.99, 2, 27, 2),  -- Vinile The Last in Line
(16.99, 3, 27, 1),  -- Cassetta The Last in Line

(20.99, 1, 28, 3),  -- CD Rainbow Rising
(33.99, 2, 28, 1),  -- Vinile Rainbow Rising
(17.99, 3, 28, 1),  -- Cassetta Rainbow Rising

(21.99, 1, 29, 4),  -- CD Heaven and Hell
(34.99, 2, 29, 2),  -- Vinile Heaven and Hell
(18.99, 3, 29, 1),  -- Cassetta Heaven and Hell

(22.99, 1, 30, 3),  -- CD Sacred Heart
(35.99, 2, 30, 1),  -- Vinile Sacred Heart
(19.99, 3, 30, 1),  -- Cassetta Sacred Heart

-- Articoli per album 31-38 (restanti album di Dio)
(20.99, 1, 31, 2),  -- CD Dream Evil
(33.99, 2, 31, 1),  -- Vinile Dream Evil
(17.99, 3, 31, 1),  -- Cassetta Dream Evil

(19.99, 1, 32, 3),  -- CD Lock Up the Wolves
(32.99, 2, 32, 1),  -- Vinile Lock Up the Wolves
(16.99, 3, 32, 1),  -- Cassetta Lock Up the Wolves

(18.99, 1, 33, 2),  -- CD From Heaven to Hell
(31.99, 2, 33, 1),  -- Vinile From Heaven to Hell
(15.99, 3, 33, 1),  -- Cassetta From Heaven to Hell

(21.99, 1, 34, 3),  -- CD Strange Highways
(34.99, 2, 34, 1),  -- Vinile Strange Highways
(18.99, 3, 34, 1),  -- Cassetta Strange Highways

(22.99, 1, 35, 2),  -- CD Angry Machines
(35.99, 2, 35, 1),  -- Vinile Angry Machines
(19.99, 3, 35, 1),  -- Cassetta Angry Machines

(23.99, 1, 36, 3),  -- CD Magica
(36.99, 2, 36, 1),  -- Vinile Magica
(20.99, 3, 36, 1),  -- Cassetta Magica

(24.99, 1, 37, 2),  -- CD Killing the Dragon
(37.99, 2, 37, 1),  -- Vinile Killing the Dragon
(21.99, 3, 37, 1),  -- Cassetta Killing the Dragon

(25.99, 1, 38, 3),  -- CD Master of the Moon
(38.99, 2, 38, 1),  -- Vinile Master of the Moon
(22.99, 3, 38, 1);  -- Cassetta Master of the Moon

INSERT INTO playlist(utente_id) VALUES
(1),
(2),
(3),
(4),
(5);

INSERT INTO playlist_articolo(playlist_id, album_id, tipo_id) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(2, 4, 1),
(2, 5, 2),
(2, 6, 3),
(3, 7, 1),
(3, 8, 2),
(3, 9, 3),
(4, 10, 1),
(4, 11, 2),
(4, 12, 3),
(5, 13, 1),
(5, 14, 2),
(5, 15, 3);
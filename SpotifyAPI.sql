--Creating Database for the SpotifyApI
create database Spotify_API

---creating User table
CREATE TABLE User_Table
(
userid int identity(1,1) primary key,
username varchar(100) not null,

)
---Inserting the data into the tables
INSERT INTO User_Table(username)
VALUES('Soubarnika'),
      ('Geminika'),
	  ('shanthi'),
	  ('Bavi'),
	  ('venkat')

INSERT INTO Playlist_Table(playlistid,playlistname,userid)
VALUES(1,'myplaylist1',1),
      (2,'myplaylist2',1),
	  (3,'myplaylist3',2),
	  (4,'myplaylist4',3),
	  (5,'myplaylist5',4),
	  (6,'myplaylist6',2),
	  (7,'myplaylist7',5),
	  (8,'myplaylist8',4)
	  

     
	 select * from User_Table
	 --Adding new column  to the user table
	 Alter table User_Table
	 Add  Emailid  varchar(20) ;
	 --Updating value to the new column
	 update User_Table set Emailid='sou@gmail.com' where userid=1;
	 update User_Table set Emailid='gem@gmail.com' where userid=2;
	 update User_Table set Emailid='shanthi.v@yahoo.com' where userid=3;
	 update User_Table set Emailid='bavi@gmail.com' where userid=4;
	 update User_Table set Emailid='vv@yahoo.com' where userid=5;
	 update User_Table set Emailid='meenu@tvsnxt.io' where userid=6;

	 select * from Playlist_Table
	 --altering playlist table to add new column
	 ALTER TABLE Playlist_Table ALTER COLUMN playlistid int NOT NULL;

	 ALTER TABLE Playlist_Table ADD PRIMARY KEY (playlistid) ;

---creating Playlisttracks table
CREATE TABLE Playlist_Tracks
(
trackid int PRIMARY KEY ,
trackname varchar(100),
playlistid int FOREIGN KEY REFERENCES Playlist_Table(playlistid) not null,
)
--Inserting records into playlist tracks  table

INSERT INTO dbo.Playlist_Tracks(trackid,trackname,playlistid)
VALUES(1,'Naanare',1),
      (2,'Vaathicoming',1),
	  (3,'Venmathiye',2),
	  (4,'Vasegaraa',3),
	  (5,'Roja Roja',3),
	  (6,'Kuttypattas',3),
	  (7,'Donu Donu',4),
	  (8,'Tum hi ho',4),
	  (9,'Edho ondru',5),
	  (10,'Pokkal pokkum',5)

	  select * from Playlist_Tracks
--To get user playlist using user id
select * from Playlist_Table  where userid=2
--To get user's palylist
select User_Table.userid,username,Playlist_Table.playlistid,playlistname from User_Table  join Playlist_Table on User_Table.userid=Playlist_Table.userid order by User_Table.userid
--To get playlist's tracks
select Playlist_Table.playlistid,playlistname,Playlist_Tracks.trackname from Playlist_Table left join Playlist_Tracks on Playlist_Table.playlistid = Playlist_Tracks.playlistid
--To get users tracks
select User_Table.username,Playlist_Table.playlistname,Playlist_Tracks.trackname from (User_Table inner join Playlist_Table on User_Table.userid=Playlist_Table.userid Full join Playlist_Tracks on Playlist_Table.playlistid = Playlist_Tracks.playlistid)where username='soubarnika'

--To get tracks based on playlistid
select * from Playlist_Tracks where playlistid=1
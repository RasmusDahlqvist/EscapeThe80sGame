DROP DATABASE IF EXISTS peli;
CREATE DATABASE peli;
USE peli;

#DROP TABLE IF EXISTS Door;
#DROP TABLE IF EXISTS OBJECT;
#DROP TABLE IF EXISTS LOCATION;
#DROP TABLE IF EXISTS DIRECTION;

CREATE TABLE Location
(
  locationId VARCHAR(50)  NOT NULL,
  Description VARCHAR(500)  NOT NULL,
  Details VARCHAR(5000)  NOT NULL,
  PRIMARY KEY (locationId)
);

CREATE TABLE Object
(
  ObjectId VARCHAR(50)  NOT NULL,
  Item VARCHAR(800)  NOT NULL, #Kuvaus esineestä
  Name VARCHAR(500)  NOT NULL,
  ODetails VARCHAR(800)  NOT NULL, #KUn tutkit esinettä
 # OLocation VARCHAR(50)  NOT NULL,
  Useability BOOLEAN,
  Takeable BOOLEAN,
  Hidden BOOLEAN, 
  locationId VARCHAR(50) NOT NULL,
  PRIMARY KEY (ObjectId),
  FOREIGN KEY (LocationId) REFERENCES Location(locationId)
);




CREATE TABLE Direction
(
  DirectionId VARCHAR(50)  NOT NULL,
  Value VARCHAR(50)  NOT NULL,
  PRIMARY KEY (DirectionId)
);

CREATE TABLE Door
(

  DoorId VARCHAR(50),
  Locked BOOLEAN NOT NULL,
  Note VARCHAR(50)  NOT NULL,
  #Directionid VARCHAR(10),
  jotain VARCHAR(20),
  startingpoint VARCHAR(50),
  finishpoint VARCHAR(50),
  PRIMARY KEY (DoorId),
  FOREIGN KEY (jotain) REFERENCES Direction(DirectionId),
  FOREIGN KEY (startingpoint) REFERENCES Location(locationId),
  FOREIGN KEY (finishpoint) REFERENCES Location(locationId)
);








INSERT INTO Location VALUES('ROOM1','You wake up in a room and do not remember anything.
 The only thing you know is that your head hurts and that Journeys “Don’t stop believin’ ” is stuck in your head which makes 
 the hangover at least 10 000 times worse. You need to find a way out. And so the journey begins... Ou yeah and dont mind me im just your consciousness or something.  ','first room');
INSERT INTO Location VALUES('ROOM2','This is the most boring and hideous room. Just find the freaking key quickly and move on.','room nr 2');
INSERT INTO Location VALUES('ROOM3','The room is completely empty. There is only KITT from knight riders car in wall next to door. Yeah I dont  know pelieither how thats even possible ','room nr 3');
INSERT INTO Location VALUES('ROOM4','Mysterious voice on the speaker says: "I remember one time I was thailand watching pingpong show and one of those... 
Oh yeah this room four there is some old faxmachine and stuff. Good luck!"','awesome fouth room');
INSERT INTO Location VALUES('ROOM5','This is the fifth room.','awesome fifth room');
INSERT INTO Location VALUES('ROOM6','Holy Christ! There is a discoball hanging from the roof, neon lights are lighting up the glorious 
dancefloor. 
Now you gotta cut loose
Footloose, kick off the Sunday shoes','This is the sixth room');
INSERT INTO Location VALUES('ROOM7','David Hasselhoff is in the room with all your friends, also known as fanny pack squad. 
There are sparkling wine, tacky posters on the walls and music playing. David has also made for you a huge cake, full of whipped cream and crushed dreams. 
Chocolate, Strawberries, candy.  
Then you realize, that David had planned the whole thing as a surprise for your birthday.','awesome seventh room');

INSERT INTO Direction VALUES('N', 'North');
INSERT INTO Direction VALUES('S', 'South');
INSERT INTO Direction VALUES('E', 'East');
INSERT INTO Direction VALUES('W', 'West');

INSERT INTO Object VALUES('KEY1','this is key','key','an old iron key ',TRUE,TRUE,TRUE,'ROOM5');
INSERT INTO Object VALUES('SMURF','the grandpa smurf','Smurf','What the heck! The Grandpa smurf jumps out of the box!
He hugs you and thanks you, he has been kidnapped and captured inside the box. He is now free and the most grateful thing on earth, so he unlocks the door for you',TRUE,TRUE,TRUE,'ROOM2');
INSERT INTO Object VALUES('FANNYPACK','Neoncolor fannypack (also your inventory so take it!)','fannypack','Fannypack is the sexiest 
thing one can wear and it is also surprisingly roomy.',FALSE,TRUE,FALSE,'ROOM1');
INSERT INTO Object VALUES('POSTER','Poster of Half naked David Hasselhoff that makes you questionable your sexuality','poster','HOTTTT!!! ',TRUE,TRUE,FALSE,'ROOM1');
INSERT INTO Object VALUES('ROD','this is rod','rod','No way there was a rod in the same room with key inside the fish tank. You know what to do champ.',TRUE,TRUE,TRUE,'ROOM5');
INSERT INTO Object VALUES('CODELOCK','codelock','codelock','You need to dial the right code to open door',TRUE,FALSE,FALSE,'ROOM1');
INSERT INTO Object VALUES('CODELOCK2','KITT','KITT','KITT from the Knight rider',TRUE,FALSE,FALSE,'ROOM3');
INSERT INTO Object VALUES('NOTE1','Welcoming message','message','Welcome to play escape to 80s.We are in 1985 or some other cool year between the 80’s and 90’s.
I am not sure because of those crazy years of the 80’s, but it really does not matter. We are also in Miami!Every room has a different kind of atmosphere and different clues to find the way out.
Oh yeah, your first clue is to take really close look that poster on the wall. Also remember nzmap.
Yours mr.x',TRUE,TRUE,FALSE,'ROOM1');
INSERT INTO Object VALUES('FAXNOTE','clue','paper','Lyrics of the greatest song ever',FALSE, TRUE,TRUE,'ROOM4');
INSERT INTO Object VALUES('TELEFAX','Its an super-old telefax machine.','telefax',
'Old telefax machine, there is a big button and next to it a red light is blinking.',FALSE,FALSE,FALSE,'ROOM4');
INSERT INTO Object VALUES('SING','SING','SING','Woah, were half way there 
Woah, livin on a prayer
Take my hand, well make it I swear
Woah, livin on a prayer',FALSE,FALSE,TRUE,'ROOM4');
INSERT INTO Object VALUES('CALENDAR','Its a calendar','calendar','Last years Hulk Hogan wrestling calendar. The best date , 17.7., is circled',FALSE,TRUE,FALSE,'ROOM2');
INSERT INTO Object VALUES('BOX','Wooden box (locked)','box','You have to use the box if you want to open it. Who knows whats inside...',FALSE,FALSE,FALSE,'ROOM2');
INSERT INTO Object VALUES('FISH TANK','Tank full of glow fishes','tank','Man those fish look hungry... Oh there is also key! No 
way putting your hand there if you want to play with your jojo ever again.',TRUE,FALSE,FALSE,'ROOM5');
INSERT INTO Object VALUES('BOOKSHELF','Shelf full of books','bookshelf','oh! There is an ice fishing rod on one of the shelves',FALSE,FALSE,FALSE,'ROOM5');
INSERT INTO Object VALUES('WALKMAN', 'Walkman', 'walkman','',TRUE,TRUE,FALSE,'ROOM1');
INSERT INTO Object VALUES('TIMEMACHINE', 'Timemachine', '','David has bought you a timemachine as a birthday present. He knows how much you hate the 80s, so this is your way out.',TRUE,TRUE,FALSE,'ROOM7');

INSERT INTO Door VALUES('R12',TRUE, 'The door is locked', 'E', 'Room1', 'Room2');
INSERT INTO Door VALUES('R21',TRUE, 'The door is locked', 'W', 'Room2', 'Room1');
INSERT INTO Door VALUES('R23',TRUE, 'The door is locked', 'S', 'Room2', 'Room3');
INSERT INTO Door VALUES('R32',TRUE, 'The door is locked', 'N', 'Room3', 'Room2');
INSERT INTO Door VALUES('R34',TRUE, 'The door is locked', 'S', 'Room3', 'Room4');
INSERT INTO Door VALUES('R43',TRUE, 'The door is locked', 'N', 'Room4', 'Room3');
INSERT INTO Door VALUES('R45',TRUE, 'The door is locked', 'E', 'Room4', 'Room5');
INSERT INTO Door VALUES('R54',TRUE, 'The door is locked', 'W', 'Room5', 'Room4');
INSERT INTO Door VALUES('R56',TRUE, 'The door is locked', 'N', 'Room5', 'Room6');
INSERT INTO Door VALUES('R65',TRUE, 'The door is locked', 'S', 'Room6', 'Room5');
INSERT INTO Door VALUES('R67',FALSE, 'The door is not locked', 'E', 'Room6', 'Room7');
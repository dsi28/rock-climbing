CREATE TABLE users(z_number INT, name CHAR(20), l_name CHAR(40), age INT,  level CHAR(20), CONSTRAINT PK_USER PRIMARY KEY(z_number));
				
CREATE TABLE instructors(emp_id INT, name CHAR(20), l_name CHAR(40), exp INT, z_number INT, CONSTRAINT FK_ZNUMBER FOREIGN KEY(z_number) REFERENCES users(z_number), CONSTRAINT PK_INSTRUCTORS PRIMARY KEY(emp_id));
				
CREATE TABLE membership(m_id INT, g_id INT, membership_type CHAR(20), s_date DATE, e_date DATE, CONSTRAINT PK_MEMBERSHIP PRIMARY KEY(g_id));
				
CREATE TABLE guest(g_id INT, name CHAR(20), l_name CHAR(40), age INT, membership INT, CONSTRAINT FK_MEMBERSHIP FOREIGN KEY (membership) REFERENCES membership(m_id), CONSTRAINT PK_GUEST PRIMARY KEY(g_id));
		
		//MORE THAN ONE INSTRUCTOR CAN TEACH THE SAME COURSE
CREATE TABLE courses(course_id INT, instructor INT, level CHAR(20), price INT,CONSTRAINT FK_COURSE_id FOREIGN KEY(instructor) REFERENCES instructors(emp_id), CONSTRAINT PK_COURSE PRIMARY KEY(course_id, instructor));  
					
CREATE TABLE walls(w_id INT, levels CHAR(60), state CHAR(100), location CHAR(40),CONSTRAINT PK_WALLS PRIMARY KEY(w_id));
					
CREATE TABLE trip(destination CHAR(100), s_date DATE, e_date DATE, equipment CHAR(100), CONSTRAINT PK_TRIP PRIMARY KEY(destination, s_date, e_date));
				
CREATE TABLE equipement(item_id INT, name CHAR(20), state CHAR(60), rented CHAR(1), CONSTRAINT PK_EQUIPMENT PRIMARY KEY(item_id));

CREATE TABLE u_rent(renter_id INT,  item CHAR(20), rent_state CHAR(20), s_date DATE, e_date DATE, CONSTRAINT PK_RENT PRIMARY KEY(renter_id, item), CONSTRAINT FK_RENTER_ID FOREIGN KEY(renter_id) REFERENCES users(z_number));

CREATE TABLE g_rent(renter_id INT,  item CHAR(20), rent_state CHAR(20), s_date DATE, e_date DATE, CONSTRAINT PK_RENT PRIMARY KEY(renter_id, item), CONSTRAINT FK_G_RENTER_id FOREIGN KEY(renter_id) REFERENCES guest(g_id));

CREATE TABLE membership(g_id INT, membership CHAR(20), s_date DATE, e_date DATE, CONSTRAINT PK_MEMBERSHIP PRIMARY KEY(g_id), CONSTRAINT FK_G_ID FOREIGN KEY(g_id) REFERENCES guest);

CREATE TABLE club(z_number INT, name CHAR(20), l_name CHAR(20), levels CHAR(20), time_club INT, CONSTRAINT PK_CLUB PRIMARY KEY(z_number), CONSTRAINT FK_Z_NUMBER FOREIGN KEY(z_number) REFERENCES users);


INSERT INTO users VALUES(23440200, "Pablo", "Adell", 20, "Intermediate");
INSERT INTO users VALUES(23440300, "Sara", "Bortolotti", 19, "Beginner");
INSERT INTO users VALUES(23440400, "Sam", "Smith", 22, "Beginner");
INSERT INTO users VALUES(23440500, "Darth", "Vade", 27, "Advanced");

INSERT INTO instructors VALUES(01, "Tanner", "Palm", 3, 23450988);
INSERT INTO instructors VALUES(02, "Marissa", "Rock", 5, 23450987);
INSERT INTO instructors VALUES(03, "Jim", "Bond", 1, 23450986);
INSERT INTO instructors VALUES(05, "Rachel", "Bloom", 9, 23450985);

INSERT INTO membership VALUES(01, , monthly, "21-03-2018", "20-04-2018");
INSERT INTO membership VALUES(02, , daily, "21-03-2018", "21-03-2018");

INSERT INTO guest VALUES(01, "Will", "Glass", 21, 01);
INSERT INTO guest VALUES(02, "Isabelle", "Red", 20, 02);


INSERT INTO courses VALUES(01, 01, "Beginner", 20);
INSERT INTO courses VALUES(01, 02, "Beginner", 20);
INSERT INTO courses VALUES(01, 03, "Beginner", 20);
INSERT INTO courses VALUES(01, 04, "Beginner", 20);
INSERT INTO courses VALUES(02, 03, "Intermediate", 30);
INSERT INTO courses VALUES(02, 04, "Intermediate", 30);
INSERT INTO courses VALUES(03, 01, "Advanced", 40);
INSERT INTO courses VALUES(03, 04, "Advanced", 40);





//date YYYY-MM-DD
//location we could use north south east and west instead.

INSERT INTO walls VALUES(1, "Beginner", "good", "FAU");  
INSERT INTO walls VALUES(2, "Advanced", "good", "FAU");  
INSERT INTO walls VALUES(3, "Intermediate", "needs repair", "FAU");  
INSERT INTO walls VALUES(4, "Intermediate", "good", "FAU");  

INSERT INTO trip VALUES("Coral Cliffs Rock Climbing Center", '2018-04-11', '2018-04-11', "none");
INSERT INTO trip VALUES("MT. Everest", '2018-05-01', '2018-06-03', "Rope, harness");
INSERT INTO trip VALUES("Rocky mountains", '2019-01-23', '2019-01-30', "Rope");
INSERT INTO trip VALUES("Tallahassee Rock Gym", '2018-07-23', '2018-07-24', "none");


INSERT INTO equipement VALUES(1, "rope", "good", "y");
INSERT INTO equipement VALUES(2, "rope", "needs repacement", "y");
INSERT INTO equipement VALUES(3, "rope", "good", "n");
INSERT INTO equipement VALUES(4, "rope", "new", "n");
INSERT INTO equipement VALUES(5, "harness", "needs repacement", "n");
INSERT INTO equipement VALUES(6, "harness", "good", "n");
INSERT INTO equipement VALUES(7, "harness", "good", "y");
INSERT INTO equipement VALUES(8, "harness", "new", "y");
INSERT INTO equipement VALUES(9, "Carabiners", "good", "y");
INSERT INTO equipement VALUES(10, "Carabiners", "new", "n");
INSERT INTO equipement VALUES(11, "Carabiners", "good", "y");
INSERT INTO equipement VALUES(12, "Carabiners", "needs repacement", "y");
INSERT INTO equipement VALUES(13, "Belay & Rappel Devices", "good", "n");
INSERT INTO equipement VALUES(14, "Belay & Rappel Devices", "needs repacement", "y");
INSERT INTO equipement VALUES(15, "Belay & Rappel Devices", "good", "n");
INSERT INTO equipement VALUES(16, "Belay & Rappel Devices", "new", "y");


INSERT INTO u_rent VALUES(23440200, 4, "good", '2018-03-23', '2018-03-23');
INSERT INTO u_rent VALUES(23440200, 5, "needs replacement", '2018-03-23', '2018-03-23');
INSERT INTO u_rent VALUES(23440200, 9, "good", '2018-03-23', '2018-03-23');
INSERT INTO u_rent VALUES(23440200, 16, "new", '2018-03-23', '2018-03-23');
	   
INSERT INTO u_rent VALUES(23440500, 3, "good", '2018-03-23', '2018-03-24');
INSERT INTO u_rent VALUES(23440500, 7, "good", '2018-03-23', '2018-03-24');
INSERT INTO u_rent VALUES(23440500, 10, "new", '2018-03-23', '2018-03-24');
INSERT INTO u_rent VALUES(23440500, 15, "good", '2018-03-23', '2018-03-24');
	   
INSERT INTO u_rent VALUES(23440400, 2, "needs replacement", '2018-03-24', '2018-03-24');
INSERT INTO u_rent VALUES(23440400, 8, "new", '2018-03-24', '2018-03-24');
INSERT INTO u_rent VALUES(23440400, 11, "good", '2018-03-24', '2018-03-24');
INSERT INTO u_rent VALUES(23440400, 14, "needs replacement", '2018-03-24', '2018-03-24');
	   
INSERT INTO g_rent VALUES(01, 2, "needs replacement", '2018-03-23', '2018-03-23');
INSERT INTO g_rent VALUES(01, 8, "new", '2018-03-23', '2018-03-23');
INSERT INTO g_rent VALUES(01, 11, "good", '2018-03-23', '2018-03-23');
INSERT INTO g_rent VALUES(01, 14, "needs replacement", '2018-03-23', '2018-03-23');
	   
INSERT INTO g_rent VALUES(02, 1, "good replacement", '2018-03-23', '2018-03-23');
INSERT INTO g_rent VALUES(02, 6, "good", '2018-03-23', '2018-03-23');
INSERT INTO g_rent VALUES(02, 12, "needs repacement", '2018-03-23', '2018-03-23');
INSERT INTO g_rent VALUES(02, 13, "good", '2018-03-23', '2018-03-23');



INSERT INTO club VALUES(23440200, "Pablo", "Adell", "Intermediate", 1);
INSERT INTO club VALUES(23440300, "Sara", "Bortolotti", "Beginner", 1);
 INSERT INTO club VALUES(23440500, "Darth", "Vade", "Advanced",5);
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
INSERT INTO users VALUESVALUES(23440400, "Sam", "Smith", 22, "Beginner");
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

(destination CHAR(100), s_date CHAR(60), e_date CHAR(60), equipment CHAR(100), CONSTRAINT PK_TRIP PRIMARY KEY(destination, s_date, e_date))
INSERT INTO trips VALUES("Coral Cliffs Rock Climbing Center", 2018-04-11, )










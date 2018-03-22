CREATE TABLE users(z_number INT, name CHAR(20), l_name CHAR(40), age INT,  level CHAR(20), CONSTRAINT PK_USER PRIMARY KEY(z_number));
				
CREATE TABLE instructors(emp_id INT, name CHAR(20), l_name CHAR(40), exp INT, z_number INT, CONSTRAINT FK_ZNUMBER FOREIGN KEY(z_number) REFERENCES users(z_number), CONSTRAINT PK_INSTRUCTORS PRIMARY KEY(emp_id));
				
CREATE TABLE membership(m_id INT, g_id INT, membership_type CHAR(20), s_date DATE, e_date DATE, CONSTRAINT PK_MEMBERSHIP PRIMARY KEY(g_id));
				
CREATE TABLE guest(g_id INT, name CHAR(20), l_name CHAR(40), age INT, membership INT, CONSTRAINT FK_MEMBERSHIP FOREIGN KEY (membership) REFERENCES membership(m_id), CONSTRAINT PK_GUEST PRIMARY KEY(g_id));
		
		//MORE THAN ONE INSTRUCTOR CAN TEACH THE SAME COURSE
CREATE TABLE courses(course_id INT, instructor INT, level CHAR(20), price INT,CONSTRAINT FK_COURSE_id FOREIGN KEY(instructor) REFERENCES instructors(emp_id), CONSTRAINT PK_COURSE PRIMARY KEY(course_id, instructor));  
					
CREATE TABLE walls(w_id INT, levels CHAR(60), state CHAR(100), location CHAR(40),CONSTRAINT PK_WALLS PRIMARY KEY(w_id));
					
CREATE TABLE trip(destination CHAR(100), s_date CHAR(60), e_date CHAR(60), equipment CHAR(100), CONSTRAINT PK_TRIP PRIMARY KEY(destination, s_date, e_date));
				
CREATE TABLE equipement(item_id INT, name CHAR(20), state CHAR(60), rented CHAR(1), CONSTRAINT PK_EQUIPMENT PRIMARY KEY(item_id));

CREATE TABLE u_rent(renter_id INT,  item CHAR(20), rent_state CHAR(20), s_date CHAR(20), e_date CHAR(20), CONSTRAINT PK_RENT PRIMARY KEY(renter_id, item), CONSTRAINT FK_RENTER_ID FOREIGN KEY(renter_id) REFERENCES users(z_number));

CREATE TABLE g_rent(renter_id INT,  item CHAR(20), rent_state CHAR(20), s_date CHAR(20), e_date CHAR(20), CONSTRAINT PK_RENT PRIMARY KEY(renter_id, item), CONSTRAINT FK_G_RENTER_id FOREIGN KEY(renter_id) REFERENCES guest(g_id));

CREATE TABLE membership(g_id INT, membership CHAR(20), s_date CHAR(20), e_date CHAR(20), CONSTRAINT PK_MEMBERSHIP PRIMARY KEY(g_id), CONSTRAINT FK_G_ID FOREIGN KEY(g_id) REFERENCES guest);

CREATE TABLE club(z_number INT, name CHAR(20), l_name CHAR(20), levels CHAR(20), time_club INT, CONSTRAINT PK_CLUB PRIMARY KEY(z_number), CONSTRAINT FK_Z_NUMBER FOREIGN KEY(z_number) REFERENCES users);
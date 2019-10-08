CREATE TABLE Users   (

	user_ID INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(25) NOT NULL,
    user_type VARCHAR(5),
    is_admin BOOLEAN,
	public_name VARCHAR(25),
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	street_address VARCHAR(50),
	town VARCHAR(25),
	zip_code CHAR(5),
	email VARCHAR(50),
	phone INT,
	website_URL VARCHAR(100),
	password VARCHAR(100),
    bio VARCHAR(500),

	PRIMARY KEY(user_ID)

);
CREATE TABLE Reviews    (

    review_ID INT NOT NULL AUTO_INCREMENT,
    rating TINYINT,
    review_text VARCHAR(250),
    review_datetime DATETIME,
    
    PRIMARY KEY(review_ID),
    FOREIGN KEY(from_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(to_ID) REFERENCES Users(user_ID)
    
);
CREATE TABLE SentReviews    (

    review_ID INT NOT NULL,
    sender_ID INT NOT NULL,
    
    CONSTRAINT sent_review PRIMARY KEY(review_ID, sender_ID)
    FOREIGN KEY(review_ID) REFERENCES Reviews(review_ID),
    FOREIGN KEY(sender_ID) REFERENCES Users(user_ID)
);
CREATE TABLE ReceivedReviews    (

    review_ID INT NOT NULL,
    receiver_ID INT NOT NULL,
    
    CONSTRAINT receiver_review PRIMARY KEY(review_ID, receiver_ID)
    FOREIGN KEY(review_ID) REFERENCES Reviews(review_ID),
    FOREIGN KEY(receiver_ID) REFERENCES Users(receiver_ID)
);
CREATE TABLE Messages   (

    message_ID INT NOT NULL AUTO_INCREMENT,
    message_text VARCHAR(500),
    message_datetime DATETIME,

    PRIMARY KEY(message_ID),
    
);
CREATE TABLE SentMessages   (

    message_ID INT NOT NULL,
    sender_ID INT NOT NULL,
    
    CONSTRAINT sent_message PRIMARY KEY(message_ID, sender_ID)
    FOREIGN KEY(message_ID) REFERENCES Messages(message_ID),
    FOREIGN KEY(sender_ID) REFERENCES Users(user_ID)
    
);
CREATE TABLE ReceivedMessages   (

    message_ID INT NOT NULL,
    receiver_ID INT NOT NULL,
    
    CONSTRAINT received_message PRIMARY KEY(message_ID, sender_ID)
    FOREIGN KEY(message_ID) REFERENCES Messages(message_ID),
    FOREIGN KEY(receiver_ID) REFERENCES Users(user_ID)
    
);
CREATE TABLE Followings (

    follower_ID INT NOT NULL,
    being_followed_ID INT NOT NULL,
    
    PRIMARY KEY(follower_ID, being_followed_ID),
    FOREIGN KEY(follower_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(being_followed_ID) REFERENCES Users(user_ID)
 
);
CREATE TABLE Flags  (

    flag_ID INT NOT NULL AUTO_INCREMENT,
    flag_reason VARCHAR(100),
    
    PRIMARY KEY(flag_ID),

);
CREATE TABLE SentFlags  (

    flag_ID INT NOT NULL,
    sender_ID INT NOT NULL,

    PRIMARY KEY(flag_ID, sender_ID),
    FOREIGN KEY(flag_ID) REFERENCES Flags(flag_ID),
    FOREIGN KEY(sender_ID) REFERENCES Users(user_ID)
);
CREATE TABLE ReceivedFlags  (

    flag_ID INT NOT NULL,
    receiver_ID INT NOT NULL,

    PRIMARY KEY(flag_ID, receiver_ID),
    FOREIGN KEY(flag_ID) REFERENCES Flags(flag_ID),
    FOREIGN KEY(receiver_ID) REFERENCES Users(user_ID)
);
CREATE TABLE Disciplines(

    discipline_ID INT NOT NULL AUTO_INCREMENT,
    discipline_type TINYINT NOT NULL,
    discipline_datetime DATETIME,
    discipline_duration SMALLINT,
    
    PRIMARY KEY(discipline_ID),
    FOREIGN KEY(admin_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(flag_ID) REFERENCES Flags(flag_ID)

);
CREATE TABLE FlagDisciplines(

    discipline_ID INT NOT NULL,
    flag_ID INT NOT NULL,

    CONSTRAINT received_discipline PRIMARY KEY(discipline_ID, flag_ID),
    FOREIGN KEY(discipline_ID) REFERENCES Disciplines(discipline_ID),
    FOREIGN KEY(flag_ID) REFERENCES Flags(flag_ID)

);
CREATE TABLE AdministeredDisciplines(

    discipline_ID INT NOT NULL,
    admin_ID INT NOT NULL,
    
    CONSTRAINT administered_discipline PRIMARY KEY(discipline_ID, admin_ID),
    FOREIGN KEY(discipline_ID) REFERENCES Disciplines(discipline_ID),
    FOREIGN KEY(admin_ID) REFERENCES Users(user_ID)
    
);
CREATE TABLE Bookings	(

	booking_ID INT NOT NULL AUTO_INCREMENT,
	requested_datetime DATETIME,
	duration_hrs TINYINT,
	confirmed BOOLEAN,
	datetime_of_request DATETIME,

	PRIMARY KEY(booking_ID),
	FOREIGN KEY(bar_ID) REFERENCES Users(user_ID),
	FOREIGN KEY(band_ID) REFERENCES Users(user_ID)

);
CREATE TABLE Shows  (

    show_ID INT NOT NULL,
    start_datetime DATETIME,
    end_datetime DATETIME,
    
    PRIMARY KEY(show_ID),

);
CREATE TABLE ShowBookings   (

    show_ID INT NOT NULL,
    booking_ID INT NOT NULL,
    
    CONSTRAINT show_booking PRIMARY KEY(show_ID, booking_ID)
    FOREIGN KEY(show_ID) REFERENCES Shows(show_ID),
    FOREIGN KEY(booking_ID) REFERENCES Bookings(booking_ID),

);
CREATE TABLE Tours  (

    tour_ID INT NOT NULL AUTO_INCREMENT,
    start_datetime DATETIME,
    end_datetime DATETIME,
    
    PRIMARY KEY(tour_ID),

);
CREATE TABLE TourStops  (

    tour_ID INT NOT NULL,
    show_ID INT NOT NULL,
    
    CONSTRAINT tour_stop PRIMARY KEY(tour_ID, show_ID),
    FOREIGN KEY(tour_ID) REFERENCES Tours(tour_ID),
    FOREIGN KEY(show_ID) REFERENCES Shows(show_ID)

);
CREATE TABLE Attendance (

    fan_ID INT NOT NULL,
    show_ID INT NOT NULL,
    
    CONSTRAINT attending PRIMARY KEY(fan_ID, show_ID),
    FOREIGN KEY(fan_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(show_ID) REFERENCES Shows(show_ID)
    
);
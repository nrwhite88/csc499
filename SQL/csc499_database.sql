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
CREATE TABLE Bookings	(

	booking_ID INT NOT NULL AUTO_INCREMENT,
	bar_ID INT NOT NULL,
    band_ID INT NOT NULL,
	datetime_requested DATETIME,
	duration_hrs TINYINT,
	confirmed BOOLEAN,
	datetime_of_request DATETIME,

	PRIMARY KEY(booking_ID),
	FOREIGN KEY(bar_ID) REFERENCES Users(user_ID),
	FOREIGN KEY(band_ID) REFERENCES Users(user_ID)

);
CREATE TABLE Reviews    (

    review_ID INT NOT NULL AUTO_INCREMENT,
    to_ID INT NOT NULL,
    from_ID INT NOT NULL,
    rating TINYINT,
    review_text VARCHAR(250),
    review_datetime DATETIME,
    
    PRIMARY KEY(review_ID),
    FOREIGN KEY(from_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(to_ID) REFERENCES Users(user_ID)
    
);
CREATE TABLE Messages   (

    message_ID INT NOT NULL AUTO_INCREMENT,
    to_ID INT NOT NULL,
    from_ID INT NOT NULL,
    message_text VARCHAR(500),
    message_datetime DATETIME,

    PRIMARY KEY(message_ID),
    FOREIGN KEY(from_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(to_ID) REFERENCES Users(user_ID)
    
);
CREATE TABLE Followings (

    follower_ID INT NOT NULL,
    being_followed_ID INT NOT NULL,
    
    PRIMARY KEY(follower_ID, being_followed_ID),
    FOREIGN KEY(follower_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(being_followed_ID) REFERENCES Users(user_ID)
 
);
CREATE TABLE Shows  (

    show_ID INT NOT NULL,
    bar_ID INT NOT NULL,
    start_datetime DATETIME,
    end_datetime DATETIME,
    
    PRIMARY KEY(show_ID),
    FOREIGN KEY(bar_ID) REFERENCES Users(user_ID)

);
CREATE TABLE Tours  (

    tour_ID INT NOT NULL AUTO_INCREMENT,
    band_ID INT NOT NULL,
    start_datetime DATETIME,
    end_datetime DATETIME,
    
    PRIMARY KEY(tour_ID),
    FOREIGN KEY(band_ID) REFERENCES Users(user_ID)

);
CREATE TABLE TourStops  (

    tour_ID INT NOT NULL,
    show_ID INT NOT NULL,
    
    CONSTRAINT tour_stop PRIMARY KEY(tour_ID, bar_ID),
    FOREIGN KEY(tour_ID) REFERENCES Tours(tour_ID),
    FOREIGN KEY(show_ID) REFERENCES Users(user_ID)

);
CREATE TABLE Attendance (

    fan_ID INT NOT NULL,
    show_ID INT NOT NULL,
    
    CONSTRAINT attending PRIMARY KEY(fan_ID, show_ID),
    FOREIGN KEY(fan_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(show_ID) REFERENCES Shows(show_ID)
    
);
CREATE TABLE Flags  (

    flag_ID INT NOT NULL AUTO_INCREMENT,
    flagger_ID INT NOT NULL,
    flagged_message_ID INT,
    flag_reason VARCHAR(100),
    
    PRIMARY KEY(flag_ID),
    FOREIGN KEY(flagger_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(flagged_message_ID) REFERENCES Messages(message_ID)

);
CREATE TABLE Disciplines(

    flag_ID INT NOT NULL,
    offender_ID INT NOT NULL,
    admin_ID INT NOT NULL,
    discipline_type TINYINT NOT NULL,
    discipline_datetime DATETIME,
    discipline_duration SMALLINT,
    
    CONSTRAINTdiscipline PRIMARY KEY(flag_ID, offender_ID),
    FOREIGN KEY(user_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(flag_ID) REFERENCES Flags(flag_ID)

);

CREATE TABLE Users   (

	user_ID INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(25) NOT NULL,
	public_name VARCHAR(25),
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	street_address VARCHAR(50),
	town VARCHAR(25),
	zip_code CHAR(5),
	email VARCHAR(50),
	phone INT,
	bio VARCHAR(500),
	website_URL VARCHAR(100),
	password VARCHAR(100),

	PRIMARY KEY(user_ID)

);
CREATE TABLE Bookings	(

	bar_ID INT NOT NULL,
	band_ID INT NOT NULL,
	datetime_requested DATETIME,
	duration TINYINT,
	confirmed BOOLEAN,
	confirmation_datetime DATETIME,

	PRIMARY KEY(bar_ID, band_ID, datetime_requested),
	FOREIGN KEY(bar_ID) REFERENCES Users(user_ID),
	FOREIGN KEY(band_ID) REFERENCES Users(user_ID)

);
CREATE TABLE Reviews    (

    review_ID INT NOT NULL AUTO_INCREMENT,
    reviewer_ID INT NOT NULL,
    reviewed_ID INT NOT NULL,
    rating TINYINT,
    review_text VARCHAR(250),
    review_datetime DATETIME,
    
    PRIMARY KEY(review_ID),
    FOREIGN KEY(reviewer_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(reviewed_ID) REFERENCES Users(user_ID)
    
);
CREATE TABLE Messages   (

    message_ID INT NOT NULL AUTO_INCREMENT,
    sender_ID INT NOT NULL,
    recipient_ID INT NOT NULL,
    message_text VARCHAR(500),
    message_datetime DATETIME,

    PRIMARY KEY(message_ID),
    FOREIGN KEY(sender_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(recipient_ID) REFERENCES Users(user_ID)
    
);
CREATE TABLE Followings (

    follower_ID INT NOT NULL,
    being_followed_ID INT NOT NULL,
    
    PRIMARY KEY(follower_ID, being_followed_ID),
    FOREIGN KEY(follower_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(being_followed_ID) REFERENCES Users(user_ID)
 
);
CREATE TABLE Tours  (

    tour_ID INT NOT NULL AUTO_INCREMENT,
    band_ID INT NOT NULL,
    start_datetime DATETIME,
    end_datetime DATETIME,
    
    PRIMARY KEY(tour_ID),
    FOREIGN KEY(band_ID) REFERENCES Users(user_ID)

);
CREATE TABLE Locations  (

    band_ID INT NOT NULL,
    location_datetime DATETIME,
    tour_ID INT NOT NULL,
    zip_code CHAR(5),
    
    PRIMARY KEY(band_ID, location_datetime),
    FOREIGN KEY(band_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(tour_ID) REFERENCES Tours(tour_ID)

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

    user_ID INT NOT NULL,
    flag_ID INT NOT NULL,
    discipline_type TINYINT NOT NULL,
    discipline_datetime DATETIME,
    discipline_duration SMALLINT,
    
    PRIMARY KEY(user_ID, flag_ID),
    FOREIGN KEY(user_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(flag_ID) REFERENCES Flags(flag_ID)

);

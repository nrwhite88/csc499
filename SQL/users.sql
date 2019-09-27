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
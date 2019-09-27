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

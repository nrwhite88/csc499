CREATE TABLE Tours  (

    tour_ID INT NOT NULL AUTO_INCREMENT,
    band_ID INT NOT NULL,
    start_datetime DATETIME,
    end_datetime DATETIME,
    
    PRIMARY KEY(tour_ID),
    FOREIGN KEY(band_ID) REFERENCES Users(user_ID)

);

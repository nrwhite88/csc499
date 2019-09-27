CREATE TABLE Locations  (

    band_ID INT NOT NULL,
    location_datetime DATETIME,
    tour_ID INT NOT NULL,
    zip_code CHAR(5),
    
    PRIMARY KEY(band_ID, location_datetime),
    FOREIGN KEY(band_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(tour_ID) REFERENCES Tours(tour_ID)

);

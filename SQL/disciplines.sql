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

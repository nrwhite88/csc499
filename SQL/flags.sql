CREATE TABLE Flags  (

    flag_ID INT NOT NULL AUTO_INCREMENT,
    flagger_ID INT NOT NULL,
    flagged_message_ID INT,
    flag_reason VARCHAR(100),
    
    PRIMARY KEY(flag_ID),
    FOREIGN KEY(flagger_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(flagged_message_ID) REFERENCES Messages(message_ID)

);

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

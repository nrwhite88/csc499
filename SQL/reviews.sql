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
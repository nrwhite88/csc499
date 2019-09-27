CREATE TABLE Followings (

    follower_ID INT NOT NULL,
    being_followed_ID INT NOT NULL,
    
    PRIMARY KEY(follower_ID, being_followed_ID),
    FOREIGN KEY(follower_ID) REFERENCES Users(user_ID),
    FOREIGN KEY(being_followed_ID) REFERENCES Users(user_ID)
 
);
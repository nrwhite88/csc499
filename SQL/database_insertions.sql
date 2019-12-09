use csc499;

INSERT INTO Users (username, user_type, is_admin, public_name, first_name, last_name,
                  street_address, town, zip_code, email, phone, website_URL, password, bio)
VALUES ('bob_balaban', 'BAND', 0, 'Bob Balaban and Band', 'Robert', 'Balaban', 'Balaban Street', 'New York City', '10012', 'bbalaban@bobbalabanandband.com', 1234567890,  'www.google.com', 'bobspw', "I am Seinfeld's own Bob Balaban and this is my Band, Bob Balaban and Band. We play all sorts of rock, but mainly Gypsy funk nu metal.");

INSERT INTO Users (username, user_type, is_admin, public_name, first_name, last_name,
                  street_address, town, zip_code, email, password, bio)
VALUES ('orderly_flanders', 'BAND', 0, 'Ned Flanders and Orderly Conduct', 'Eddard', 'Flanders', 'Flanders Street', 'Springfield', '62706', 'ned@nforderlyconduct.com', 'nfocpw', "Howdily-doodily, rockerinos! Prepare to get slaidily-daidily by our spiritual alt-rock!");
        
INSERT INTO Users (username, user_type, is_admin, public_name, first_name, last_name,
                  street_address, town, zip_code, email, password, bio)
VALUES ('multiplemikes', 'BAND', 0, 'Multiple Mikes', 'Mike', 'Mike', "Mike's Place", 'Horse Cave', '42749', 'mike@mikemikemike.mike', 'mmpw', "As you can tell by our name, there are multiple of us, each of our names is Mike.");
        
INSERT INTO Users (username, user_type, is_admin, public_name, first_name, last_name,
                  street_address, town, zip_code, email, password, bio)
VALUES ('whatadive', 'BAR', 0, 'What a Dive!', 'Dive', 'Diveson', 'Dive Place', 'Manakin-Sabot', '23103', 'dive@whatadivedivebar.com', 'wadpw', "Life's a dive... dive into it!");

INSERT INTO Users (username, user_type, is_admin, public_name, first_name, last_name,
                  street_address, town, zip_code, email, password, bio)
VALUES ('DustierThanThou', 'BAR', 0, 'Dustier Than Thou', 'Melvin', 'Van Horne', 'SW 6th Avenue', 'Topeka', '66615', 'manager@dustierthanthou.com', 'ddtpw', "He favors me! I am even dustier. Dustier than thou!'");

INSERT INTO Users (username, user_type, is_admin, public_name, first_name, last_name,
                  street_address, town, zip_code, email, password, bio)
VALUES ('highbar', 'BAR', 0, 'The High Bar', 'Gigantic', 'Baby', 'South St', 'Newburgh', '12550', 'owner@thehighbar.com', 'thbpw', "You'll never be as high as when I as when you add enter when this is the my bar.");

INSERT INTO Users (username, user_type, is_admin, public_name, first_name, last_name,
                   zip_code, password)
VALUES ('nick', 'FAN', 0, 'Nick White', 'Nick', 'White', '06511', 'nickpw');

INSERT INTO Users (username, user_type, is_admin, public_name, first_name, last_name, password)
VALUES ('theadmin', 'ADMIN', 1, 'The Admin', 'Ad', 'Min', 'adminpw');
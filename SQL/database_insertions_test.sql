INSERT INTO Users (username, user_type, is_admin, public_name, first_name, last_name,
                  street_address, town, zip_code, email, password, bio)
VALUES ('bob_balaban', 'BAND', 0, 'Bob Balaban and Band', 'Robert', 'Balaban', 'Balaban Street', 'New York City', '10012', 'bbalaban@bobbalabanandband.com', 'bobspw', "I am Seinfeld's own Bob Balaban and this is my Band, Bob Balaban and Band. We play all sorts of rock, but mainly Gypsy funk nu metal.");

INSERT INTO Users (username, user_type, is_admin, public_name, first_name, last_name, password)
VALUES ('theadmin', 'ADMIN', 1, 'The Admin', 'Ad', 'Min', 'adminpw');
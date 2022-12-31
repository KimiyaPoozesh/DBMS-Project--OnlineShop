START TRANSACTION;
INSERT INTO User (ID, fname, password, phonenumber, gender, userName) VALUES (1, 'mostafa', 'mostafa123', 09024561189, 'girl', 'mosi');
INSERT INTO User (ID, fname, password, phonenumber, gender, userName) VALUES (2, 'fatemeh', '12kode45', 09155487589, 'girl', 'fati');
INSERT INTO User (ID, fname, password, phonenumber, gender, userName) VALUES (3, 'kimiya', 'kimkim', 09155487779, 'girl', 'kim');
INSERT INTO User (ID, fname, password, phonenumber, gender, userName) VALUES (4, 'pedram', 'pedo', 09155557589, 'boy', 'ped');
INSERT INTO User (ID, fname, password, phonenumber, gender, userName) VALUES (5, 'alasti', 'amir', 09995487589, 'boy', 'niloufar');
INSERT INTO User (ID, fname, password, phonenumber, gender, userName) VALUES (6, 'sonia', 'sisi', 09159987589, 'girl', 'xxx');
INSERT INTO User (ID, fname, password, phonenumber, gender, userName) VALUES (7, 'mohammad', 'mmd45', 09155487589, 'boy', 'mmd');
INSERT INTO User (ID, fname, password, phonenumber, gender, userName) VALUES (8, 'ali', 'rezrez', 09155487589, 'boy', 'aliz');
INSERT INTO User (ID, fname, password, phonenumber, gender, userName) VALUES (9, 'kouroush', 'btch', 09155487589, 'boy', 'kouri');
INSERT INTO User (ID, fname, password, phonenumber, gender, userName) VALUES (10, 'mahasti', 'masti', 09155487589, 'girl', 'dava nemikone');
INSERT INTO User (ID, fname, password, phonenumber, gender, userName) VALUES (11, 'sharare', 'shshsh', 09155487589, 'girl', 'sharare');

COMMIT;


START TRANSACTION;

INSERT INTO Admin (idAdmin) VALUES (1);
INSERT INTO Admin (idAdmin) VALUES (2);
INSERT INTO Admin (idAdmin) VALUES (3);
INSERT INTO Admin (idAdmin) VALUES (4);
INSERT INTO Admin (idAdmin) VALUES (5);

COMMIT;



START TRANSACTION;


INSERT INTO Product (ID, name, size, gender, discount, age_range, availability, brand, color, AdminID) VALUES (555, 'blue dress', '36', 'women', 0, 'adult', 3, 'Gucci', 'blue', 1);
INSERT INTO Product (ID, name, size, gender, discount, age_range, availability, brand, color, AdminID) VALUES (506, 'Shirt', 'XXL', 'Men', 50, 'adult', 6, 'zara', 'white', 4);
INSERT INTO Product (ID, name, size, gender, discount, age_range, availability, brand, color, AdminID) VALUES (50, 'Skirt', '36', 'Women', 20, 'adult', 12, 'Gucci', 'Black', 1);
INSERT INTO Product (ID, name, size, gender, discount, age_range, availability, brand, color, AdminID) VALUES (507, 'Pants', '43', 'Men', 0, 'adult', 5, 'G-Star', 'Black', 2);
INSERT INTO Product (ID, name, size, gender, discount, age_range, availability, brand, color, AdminID) VALUES (508, 'Pants', '36', 'Women', 20, 'adult', 7, 'G-Star', 'Blue', 1);
INSERT INTO Product (ID, name, size, gender, discount, age_range, availability, brand, color, AdminID) VALUES (509, 'Skirt', '38', 'Women', 10, 'adult', 4, 'Gucci', 'White', 3);
INSERT INTO Product (ID, name, size, gender, discount, age_range, availability, brand, color, AdminID) VALUES (510, 'Legging', '40', 'Women', 15, 'adult', 6, 'Tie-Dye', 'Red', 5);
INSERT INTO Product (ID, name, size, gender, discount, age_range, availability, brand, color, AdminID) VALUES (511, 'Sweatshirt', 'XXL', 'Men', 0, 'adult', 5, 'Lacoste', 'Blue', 1);
INSERT INTO Product (ID, name, size, gender, discount, age_range, availability, brand, color, AdminID) VALUES (512, 'TrackSuit', 'XL', 'Women', 20, 'adult', 12, 'Lacoste', 'Black', 2);
INSERT INTO Product (ID, name, size, gender, discount, age_range, availability, brand, color, AdminID) VALUES (513, 'Pants', '32', 'Women', 20, 'kid', 5, 'Everlane', 'Blue', 4);
INSERT INTO Product (ID, name, size, gender, discount, age_range, availability, brand, color, AdminID) VALUES (514, 'Shirt', 'L', 'Women', 20, 'kid', 8, 'Balenciaga', 'Pink', 3);
INSERT INTO Product (ID, name, size, gender, discount, age_range, availability, brand, color, AdminID) VALUES (515, 'SweatShirt', 'S', 'Men', 20, 'kid', 7, 'Balenciaga', 'Black', 2);
COMMIT;



START TRANSACTION;

INSERT INTO Basket (totalCost, BasketID, prodID) VALUES (500, 1, 555);
INSERT INTO Basket (totalCost, BasketID, prodID) VALUES (400, 2, 506);
INSERT INTO Basket (totalCost, BasketID, prodID) VALUES (400, 3, 506);
INSERT INTO Basket (totalCost, BasketID, prodID) VALUES (400, 4, 506);
INSERT INTO Basket (totalCost, BasketID, prodID) VALUES (400, 5, 506);
INSERT INTO Basket (totalCost, BasketID, prodID) VALUES (400, 6, 506);
INSERT INTO Basket (totalCost, BasketID, prodID) VALUES (400, 7, 506);
INSERT INTO Basket (totalCost, BasketID, prodID) VALUES (400, 8, 506);
INSERT INTO Basket (totalCost, BasketID, prodID) VALUES (400, 9, 506);
INSERT INTO Basket (totalCost, BasketID, prodID) VALUES (400, 10, 506);
INSERT INTO Basket (totalCost, BasketID, prodID) VALUES (400, 11, 506);
COMMIT;



START TRANSACTION;

INSERT INTO Customer (customerID, basketID) VALUES (1, 1);
INSERT INTO Customer (customerID, basketID) VALUES (2, 2);
INSERT INTO Customer (customerID, basketID) VALUES (3, 3);
INSERT INTO Customer (customerID, basketID) VALUES (4, 4);
INSERT INTO Customer (customerID, basketID) VALUES (5, 5);
INSERT INTO Customer (customerID, basketID) VALUES (6, 6);
INSERT INTO Customer (customerID, basketID) VALUES (7, 7);
INSERT INTO Customer (customerID, basketID) VALUES (8, 8);
INSERT INTO Customer (customerID, basketID) VALUES (9, 9);
INSERT INTO Customer (customerID, basketID) VALUES (10, 10);
INSERT INTO Customer (customerID, basketID) VALUES (11, 11);

COMMIT;


START TRANSACTION;

INSERT INTO Card (`number`, `expireDate`, `cvv2`, `UID`) VALUES ('6104337495507456', '02-09', 562, 1);
INSERT INTO Card (`number`, `expireDate`, `cvv2`, `UID`) VALUES ('61045659598997', '02-12', 910, 2);
INSERT INTO Card (`number`, `expireDate`, `cvv2`, `UID`) VALUES ('61045659598998', '02-08', 912, 3);
INSERT INTO Card (`number`, `expireDate`, `cvv2`, `UID`) VALUES ('61045659598999', '02-05', 810, 4);
INSERT INTO Card (`number`, `expireDate`, `cvv2`, `UID`) VALUES ('61045659898997', '02-01', 510, 5);
INSERT INTO Card (`number`, `expireDate`, `cvv2`, `UID`) VALUES ('61045659598997', '02-06', 210, 6);
INSERT INTO Card (`number`, `expireDate`, `cvv2`, `UID`) VALUES ('61045655598997', '02-11', 789, 7);
INSERT INTO Card (`number`, `expireDate`, `cvv2`, `UID`) VALUES ('61045654598990', '02-10', 666, 8);
INSERT INTO Card (`number`, `expireDate`, `cvv2`, `UID`) VALUES ('61045659598995', '02-03', 999, 9);
INSERT INTO Card (`number`, `expireDate`, `cvv2`, `UID`) VALUES ('61045658598994', '02-08', 850, 10);

COMMIT;


START TRANSACTION;

INSERT INTO Address (strAddress, postalCode, city, plate, ownerID) VALUES ('baHonar 2', 99125687, 'mashhad', 12, 1);
INSERT INTO Address (strAddress, postalCode, city, plate, ownerID) VALUES ('bahar 15', 54848856, 'tehran', 555, 2);
INSERT INTO Address (strAddress, postalCode, city, plate, ownerID) VALUES ('sajad 45', 55848856, 'rasht', 555, 3);
INSERT INTO Address (strAddress, postalCode, city, plate, ownerID) VALUES ('honarestan 3', 88848856, 'tehran', 555, 4);
INSERT INTO Address (strAddress, postalCode, city, plate, ownerID) VALUES ('haftetir 15', 77848856, 'tehran', 555, 5);
INSERT INTO Address (strAddress, postalCode, city, plate, ownerID) VALUES ('bahar 5', 89848856, 'amol', 555, 6);
INSERT INTO Address (strAddress, postalCode, city, plate, ownerID) VALUES ('niloofar 15', 98848856, 'chabahar', 555, 7);
INSERT INTO Address (strAddress, postalCode, city, plate, ownerID) VALUES ('bahar 15', 54850856, 'tehran', 555, 8);
INSERT INTO Address (strAddress, postalCode, city, plate, ownerID) VALUES ('namaz 15', 66648856, 'semnan', 555, 9);
INSERT INTO Address (strAddress, postalCode, city, plate, ownerID) VALUES ('farshad 18', 00848856, 'esfahan', 555, 10);
INSERT INTO Address (strAddress, postalCode, city, plate, ownerID) VALUES ('bahar 20', 54338856, 'shiraz', 555, 11);




COMMIT;



START TRANSACTION;

INSERT INTO Supplier (idSupplier) VALUES (1);
INSERT INTO Supplier (idSupplier) VALUES (2);
INSERT INTO Supplier (idSupplier) VALUES (3);
INSERT INTO Supplier (idSupplier) VALUES (4);
INSERT INTO Supplier (idSupplier) VALUES (5);
INSERT INTO Supplier (idSupplier) VALUES (6);
INSERT INTO Supplier (idSupplier) VALUES (7);

COMMIT;



START TRANSACTION;

INSERT INTO Factor (ID, date, BasketID) VALUES (1, '2022-12-01', 1);

COMMIT;



START TRANSACTION;

INSERT INTO Comment (rate, text, id, prodID, cstID) VALUES (10, 'Awli bud', 54, 506, 1);

COMMIT;


START TRANSACTION;

INSERT INTO Price (date, value, ProdID) VALUES ('2022-06-07', 500, 555);

COMMIT;

START TRANSACTION;
INSERT INTO shipment (ID, `arival Date`, BasketID) VALUES (1, '2022-12-01', 1);
INSERT INTO shipment (ID, `arival Date`, BasketID) VALUES (2, '2022-12-06', 2);

COMMIT;

START TRANSACTION;
INSERT INTO Delivery (`arival_time`, ShipmentID) VALUES ('12:32:00.000', 1);

COMMIT;


START TRANSACTION;

INSERT INTO Driver (ID, picture, `license plate`, name, `car pelak`, `car model`, DeliveryID) VALUES (1, 'asghar pic', '546B4589', 'asghar sepehri', '789A5658', 'mazerati', 1);

COMMIT;

START TRANSACTION;

INSERT INTO Post (delivaryCode, shipmentID) VALUES (486235487, 1);

COMMIT;

START TRANSACTION;

INSERT INTO BasketItem (totalitemCost, quantity, BasketID, ProdID) VALUES (100, '1', 1, 555);
INSERT INTO BasketItem (totalitemCost, quantity, BasketID, ProdID) VALUES (400, '2', 2, 506);

COMMIT;



START TRANSACTION;
INSERT INTO Choose (prodID, cstID) VALUES (555, 1);
INSERT INTO Choose (prodID, cstID) VALUES (506, 2);

COMMIT;

START TRANSACTION;
INSERT INTO Support (idAdmin, idProd) VALUES (1, 555);

COMMIT;

START TRANSACTION;
INSERT INTO Communicate (idAdmin, idSupplier) VALUES (1, 1);

COMMIT;

START TRANSACTION;
INSERT INTO Supply (idSupplier, prodID) VALUES (1, 555);


COMMIT;

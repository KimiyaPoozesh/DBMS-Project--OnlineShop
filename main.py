import mysql.connector
from mysql.connector import Error

try:
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="password",
        database="project"
        )
    if mydb.is_connected():
        db_Info = mydb.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
        cursor = mydb.cursor()
        # cursor.execute("select database();")
        # record = cursor.fetchone()
        # print("You're connected to database: ", record)
        user = """ CREATE TABLE IF NOT EXISTS User(
            `ID` INT NOT NULL ,
            `fname` VARCHAR(45) NULL,
            `password` VARCHAR(45) NULL,
            `phonenumber` VARCHAR(11) NULL,
            `gender` VARCHAR(45) NULL,
            `userName` VARCHAR(45) NOT NULL,
            PRIMARY KEY (`ID`))"""
        cursor.execute(user)
        admin = """CREATE TABLE IF NOT EXISTS Admin (
            `idAdmin` INT NOT NULL,
            PRIMARY KEY (`idAdmin`),
            CONSTRAINT `user-admID`
            FOREIGN KEY (`idAdmin`)
            REFERENCES User (`ID`)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT)
             """
        cursor.execute(admin)
        product = """CREATE TABLE IF NOT EXISTS Product (
          `ID` INT NOT NULL,
          `name` VARCHAR(45) NOT NULL,
          `size` VARCHAR(45) NULL,
          `gender` VARCHAR(45) NULL,
          `discount` INT NULL,
          `age_range` VARCHAR(30) NULL,
          `availability` INT UNSIGNED NULL,
          `brand` VARCHAR(45) NULL,
          `color` VARCHAR(45) NULL,
          `AdminID` INT NOT NULL,
          PRIMARY KEY (`ID`),
          INDEX ` AdminID_idx` (`AdminID` ASC) VISIBLE,
          CONSTRAINT ` AdminID`
            FOREIGN KEY (`AdminID`)
            REFERENCES Admin (`idAdmin`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION)
        """
        cursor.execute(product)
        basket = """CREATE TABLE IF NOT EXISTS Basket (
          `totalCost` INT NOT NULL,
          `BasketID` INT UNSIGNED NOT NULL,
          `prodID` INT NULL,
           PRIMARY KEY (`BasketID`),
           INDEX `prodID_idx` (`prodID` ASC) VISIBLE,
           CONSETRAINT `prodID`
           FORIGN KEY (`prodID`)
           REFERENCES Product (`ID`)
           ON DELETE CASCADE
           ON UPDATE CASCADE)
            """
        cursor.execute(basket)
        customer = """CREATE TABLE IF NOT EXISTS Customer (
           `customerID` INT NOT NULL,
           `basketID` INT UNSIGNED NOT NULL,
            PRIMARY KEY (`customerID`),
            INDEX `basketID_idx` (`basketID` ASC) VISIBLE,
            CONSTRAINT `cstID`
            FOREIGN KEY (`customerID`)
            REFERENCES User (`ID`)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT,
            CONSTRAINT `basketID`
            FOREIGN KEY (`basketID`)
            REFERENCES Basket (`BasketID`)
            ON DELETE CASCADE
            ON UPDATE CASCADE)
        """
        cursor.execute(customer)
        card = """CREATE TABLE IF NOT EXISTS Card (
            `number` VARCHAR(16) NOT NULL,
            `expireDate` VARCHAR(5) NULL,
            `cvv2` INT NOT NULL,
            `UID` INT NOT NULL,
            PRIMARY KEY (`number`, `UID`),
            INDEX `UID_idx` (`UID` ASC) VISIBLE,
            CONSTRAINT `UserID`
            FOREIGN KEY (`UID`)
            REFERENCES Customer (`customerID`)
            ON DELETE CASCADE
            ON UPDATE CASCADE)
            """
        cursor.execute(card)
        address = """CREATE TABLE IF NOT EXISTS Address (
            `strAddress` VARCHAR(45) NOT NULL,
            `postalCode` INT NOT NULL,
            `city` VARCHAR(45) NULL,
            `plate` INT UNSIGNED NULL,
            `ownerID` INT NOT NULL,
            PRIMARY KEY (`postalCode`, `ownerID`),
            INDEX `CstID_idx` (`ownerID` ASC) VISIBLE,
            CONSTRAINT `ownID`
            FOREIGN KEY (`ownerID`)
            REFERENCES User (`ID`)
            ON DELETE CASCADE
            ON UPDATE CASCADE)
        """
        cursor.execute(address)
        supplier = """CREATE TABLE IF NOT EXISTS `mydb`.`Supplier` (
          `idSupplier` INT NOT NULL,
            PRIMARY KEY (`idSupplier`),
            CONSTRAINT `U-supplyID`
            FOREIGN KEY (`idSupplier`)
            REFERENCES `mydb`.`User` (`ID`)
            ON DELETE CASCADE
            ON UPDATE CASCADE)
        """
        cursor.execute(supplier)
        factor = """CREATE TABLE IF NOT EXISTS Factor (
            `ID` INT NOT NULL,
            `date` DATE NULL,
            `BasketID` INT UNSIGNED NOT NULL,
            PRIMARY KEY (`ID`, `BasketID`),
            INDEX `BasketID_idx` (`BasketID` ASC) VISIBLE,
            CONSTRAINT `constructorID`
            FOREIGN KEY (`BasketID`)
            REFERENCES Basket (`BasketID`)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT)
        """
        cursor.execute(factor)
        comment = """CREATE TABLE IF NOT EXISTS Comment (
            `rate` INT NOT NULL,
            `text` VARCHAR(45) NULL,
            `id` INT NOT NULL,
            `prodID` INT NOT NULL,
            `cstID` INT NOT NULL,
            PRIMARY KEY (`id`),
            INDEX `ProdID_idx` (`prodID` ASC) VISIBLE,
            INDEX `CustomerID_idx` (`cstID` ASC) VISIBLE,
            CONSTRAINT `targetprodID`
            FOREIGN KEY (`prodID`)
            REFERENCES Product (`ID`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
            CONSTRAINT `CustomerID`
            FOREIGN KEY (`cstID`)
            REFERENCES Customer (`customerID`)
            ON DELETE CASCADE
            ON UPDATE CASCADE)
        """
        cursor.execute(comment)
        price = """CREATE TABLE IF NOT EXISTS Price (
                `date` DATE NULL,
                `value` INT NOT NULL,
                `ProdID` INT NOT NULL,
                PRIMARY KEY (`ProdID`),
                CONSTRAINT `ownerProdID`
                FOREIGN KEY (`ProdID`)
                REFERENCES Product (`ID`)
                ON DELETE CASCADE
                ON UPDATE CASCADE)
            """
        cursor.execute(price)
        shipment = """CREATE TABLE IF NOT EXISTS Shipment (
            `ID` INT NOT NULL,
            `arival Date` DATE NULL,
            `BasketID` INT UNSIGNED NOT NULL,
            PRIMARY KEY (`ID`),
            INDEX `BasketID_idx` (`BasketID` ASC) VISIBLE,
            CONSTRAINT `exportedBasketID`
            FOREIGN KEY (`BasketID`)
            REFERENCES Basket (`BasketID`)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT)
        """
        cursor.execute(shipment)
        delivery = """CREATE TABLE IF NOT EXISTS Delivery (
        `arival_time` TIME NOT NULL,
        `ShipmentID` INT NOT NULL,
        PRIMARY KEY (`ShipmentID`),
        CONSTRAINT `ShipmentID`
        FOREIGN KEY (`ShipmentID`)
        REFERENCES Shipment (`ID`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
    """

except Error as e:
    print("Error while connecting to MySQL", e)
finally:
    if mydb.is_connected():
        cursor.close()
        mydb.close()
        print("MySQL connection is closed")

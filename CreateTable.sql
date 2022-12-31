-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `ID` INT NOT NULL ,
  `fname` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `phonenumber` VARCHAR(11) NULL,
  `gender` VARCHAR(45) NULL,
  `userName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Admin` (
  `idAdmin` INT NOT NULL,
  PRIMARY KEY (`idAdmin`),
  CONSTRAINT `user-admID`
    FOREIGN KEY (`idAdmin`)
    REFERENCES `mydb`.`User` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Product` (
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
    REFERENCES `mydb`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Basket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Basket` (
  `totalCost` INT NOT NULL,
  `BasketID` INT UNSIGNED NOT NULL,
  `prodID` INT NULL,
  PRIMARY KEY (`BasketID`),
  INDEX `prodID_idx` (`prodID` ASC) VISIBLE,
  CONSTRAINT `prodID`
    FOREIGN KEY (`prodID`)
    REFERENCES `mydb`.`Product` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `customerID` INT NOT NULL,
  `basketID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`customerID`),
  INDEX `basketID_idx` (`basketID` ASC) VISIBLE,
  CONSTRAINT `cstID`
    FOREIGN KEY (`customerID`)
    REFERENCES `mydb`.`User` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `basketID`
    FOREIGN KEY (`basketID`)
    REFERENCES `mydb`.`Basket` (`BasketID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Card` (
  `number` VARCHAR(16) NOT NULL,
  `expireDate` VARCHAR(5) NULL,
  `cvv2` INT NOT NULL,
  `UID` INT NOT NULL,
  PRIMARY KEY (`number`, `UID`),
  INDEX `UID_idx` (`UID` ASC) VISIBLE,
  CONSTRAINT `UserID`
    FOREIGN KEY (`UID`)
    REFERENCES `mydb`.`Customer` (`customerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `strAddress` VARCHAR(45) NOT NULL,
  `postalCode` INT NOT NULL,
  `city` VARCHAR(45) NULL,
  `plate` INT UNSIGNED NULL,
  `ownerID` INT NOT NULL,
  PRIMARY KEY (`postalCode`, `ownerID`),
  INDEX `CstID_idx` (`ownerID` ASC) VISIBLE,
  CONSTRAINT `ownID`
    FOREIGN KEY (`ownerID`)
    REFERENCES `mydb`.`User` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Supplier` (
  `idSupplier` INT NOT NULL,
  PRIMARY KEY (`idSupplier`),
  CONSTRAINT `U-supplyID`
    FOREIGN KEY (`idSupplier`)
    REFERENCES `mydb`.`User` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Factor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Factor` (
  `ID` INT NOT NULL,
  `date` DATE NULL,
  `BasketID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`, `BasketID`),
  INDEX `BasketID_idx` (`BasketID` ASC) VISIBLE,
  CONSTRAINT `constructorID`
    FOREIGN KEY (`BasketID`)
    REFERENCES `mydb`.`Basket` (`BasketID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comment` (
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
    REFERENCES `mydb`.`Product` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`cstID`)
    REFERENCES `mydb`.`Customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Price` (
  `date` DATE NULL,
  `value` INT NOT NULL,
  `ProdID` INT NOT NULL,
  PRIMARY KEY (`ProdID`),
  CONSTRAINT `ownerProdID`
    FOREIGN KEY (`ProdID`)
    REFERENCES `mydb`.`Product` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Shipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Shipment` (
  `ID` INT NOT NULL,
  `arival Date` DATE NULL,
  `BasketID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `BasketID_idx` (`BasketID` ASC) VISIBLE,
  CONSTRAINT `exportedBasketID`
    FOREIGN KEY (`BasketID`)
    REFERENCES `mydb`.`Basket` (`BasketID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Delivery` (
  `arival_time` TIME NOT NULL,
  `ShipmentID` INT NOT NULL,
  PRIMARY KEY (`ShipmentID`),
  CONSTRAINT `ShipmentID`
    FOREIGN KEY (`ShipmentID`)
    REFERENCES `mydb`.`Shipment` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Driver` (
  `ID` INT UNSIGNED NOT NULL,
  `picture` VARCHAR(45) NULL,
  `license plate` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `car pelak` VARCHAR(45) NULL,
  `car model` VARCHAR(45) NULL,
  `DeliveryID` INT NOT NULL,
  PRIMARY KEY (`ID`, `DeliveryID`),
  INDEX `ShipmentID_idx` (`DeliveryID` ASC) VISIBLE,
  CONSTRAINT `DeliveryID`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `mydb`.`Delivery` (`ShipmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Post` (
  `delivaryCode` INT NOT NULL,
  `shipmentID` INT NOT NULL,
  PRIMARY KEY (`shipmentID`),
  CONSTRAINT `ShipID`
    FOREIGN KEY (`shipmentID`)
    REFERENCES `mydb`.`Shipment` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BasketItembasketitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BasketItem` (
  `totalitemCost` INT NOT NULL,
  `quantity` VARCHAR(45) NULL,
  `BasketID` INT UNSIGNED NOT NULL,
  `ProdID` INT NOT NULL,
  PRIMARY KEY (`BasketID`),
  INDEX `prodID_idx` (`ProdID` ASC) VISIBLE,
  CONSTRAINT `targetBasketID`
    FOREIGN KEY (`BasketID`)
    REFERENCES `mydb`.`Basket` (`BasketID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `itemProdID`
    FOREIGN KEY (`ProdID`)
    REFERENCES `mydb`.`Product` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Choose`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Choose` (
  `prodID` INT NOT NULL,
  `cstID` INT NOT NULL,
  PRIMARY KEY (`prodID`, `cstID`),
  INDEX `cstID_idx` (`cstID` ASC) VISIBLE,
  CONSTRAINT `chosenprodID`
    FOREIGN KEY (`prodID`)
    REFERENCES `mydb`.`Product` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `targetCstID`
    FOREIGN KEY (`cstID`)
    REFERENCES `mydb`.`Customer` (`customerID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Support`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Support` (
  `idAdmin` INT NOT NULL,
  `idProd` INT NOT NULL,
  PRIMARY KEY (`idAdmin`, `idProd`),
  INDEX `idProd_idx` (`idProd` ASC) VISIBLE,
  CONSTRAINT `idAdmin`
    FOREIGN KEY (`idAdmin`)
    REFERENCES `mydb`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProd`
    FOREIGN KEY (`idProd`)
    REFERENCES `mydb`.`Product` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Communicate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Communicate` (
  `idAdmin` INT NOT NULL,
  `idSupplier` INT NOT NULL,
  PRIMARY KEY (`idAdmin`, `idSupplier`),
  INDEX `idSupplier_idx` (`idSupplier` ASC) VISIBLE,
  CONSTRAINT `admID`
    FOREIGN KEY (`idAdmin`)
    REFERENCES `mydb`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idSupplier`
    FOREIGN KEY (`idSupplier`)
    REFERENCES `mydb`.`Supplier` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Supply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Supply` (
  `idSupplier` INT NOT NULL,
  `prodID` INT NOT NULL,
  PRIMARY KEY (`idSupplier`, `prodID`),
  INDEX `prodID_idx` (`prodID` ASC) VISIBLE,
  CONSTRAINT `suppliedProdID`
    FOREIGN KEY (`prodID`)
    REFERENCES `mydb`.`Product` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `supplierID`
    FOREIGN KEY (`idSupplier`)
    REFERENCES `mydb`.`Supplier` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

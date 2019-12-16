# All our SQL was designed and run successfully on MySQL 5.6, hosted on AWS

# Table DDL:

CREATE TABLE Address (
    AddressID int Primary Key AUTO_INCREMENT,
    address_line_1 varchar(255),
    address_line_2 varchar(255),
    post_code varchar(10)
);

CREATE TABLE Property (
    PropertyID int Primary Key AUTO_INCREMENT,
    sale_price int,
    address_id int,
    FOREIGN KEY (address_id) REFERENCES Address(AddressID),
    size_unit varchar(255)
);

CREATE TABLE House (
    HouseID int Primary Key AUTO_INCREMENT,
    FOREIGN KEY (HouseID) REFERENCES Property(PropertyID)
);

CREATE TABLE Flat (
    FlatID int Primary Key AUTO_INCREMENT,
    FOREIGN KEY (FlatID) REFERENCES Property(PropertyID),
    leasehold_payment int,
    leasehold_frequency varchar(32)
);

CREATE TABLE Room (
    RoomID int Primary Key AUTO_INCREMENT,
    size int,
    property_id int,
    FOREIGN KEY (property_id) REFERENCES Property(PropertyID),
    type varchar(32)
);

CREATE TABLE User (
    UserID int Primary Key AUTO_INCREMENT,
    address_id int,
    FOREIGN KEY (address_id) REFERENCES Address(AddressID),
    age int,
    f_name varchar(32),
    l_name varchar(32)
);

CREATE TABLE Click (
    ClickID int Primary Key AUTO_INCREMENT,
    dtime datetime,
    property_id int,
    FOREIGN KEY (property_id) REFERENCES Property(PropertyID),
    UserID int,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

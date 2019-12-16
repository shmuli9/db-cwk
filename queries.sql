/* BASIC: Select Properties with sale_price AND size_unit */
SELECT * FROM Property WHERE sale_price < 500000 AND size_unit = 'metres';

/* BASIC: Select Properties with sale_price AND address*/
SELECT * FROM Property INNER JOIN Address A2 on Property.address_id = A2.AddressID WHERE sale_price < 900000 AND address_line_1 = '70 Karl route ';

/* MODERATE: Select Houses with room count */
SELECT * FROM House INNER JOIN Property P on House.HouseID = P.PropertyID WHERE (SELECT COUNT(*) FROM Room WHERE RoomID = P.PropertyID) = 2;

/* MODERATE: Select Flats with room count AND leasehold_frequency */
SELECT * FROM Flat INNER JOIN Property P on Flat.FlatID = P.PropertyID WHERE (SELECT COUNT(*) FROM Room WHERE RoomID = P.PropertyID) >= 2 AND leasehold_frequency = 'quarterly';

/* ADVANCED: Select (number of flats) with click count since date */
SELECT COUNT(*) FROM Flat INNER JOIN Property P on Flat.FlatID = P.PropertyID WHERE (SELECT COUNT(*) FROM Click WHERE property_id = P.PropertyID AND dtime > '10 December 2019') > 8;

/* ADVANCED: Select users whose average property click is more than X times grouped by post code */
SELECT f_name, l_name, age, post_code FROM User INNER JOIN Address A on User.address_id = A.AddressID;
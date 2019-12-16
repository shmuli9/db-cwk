/* BASIC: Select Properties with sale_price AND size_unit */
SELECT * FROM Property WHERE sale_price < 500000 AND size_unit = 'metres';

/* BASIC: Select Properties with sale_price AND address*/
SELECT * FROM Property INNER JOIN Address A2 on Property.address_id = A2.AddressID WHERE sale_price < 900000 AND address_line_1 LIKE '%6%';

/* MODERATE: Select Houses with room count */
SELECT * FROM House INNER JOIN Property P on House.HouseID = P.PropertyID WHERE (SELECT COUNT(*) FROM Room WHERE property_id = P.PropertyID) > 10;

/* MODERATE: Select Flats with room count AND leasehold_frequency */
SELECT * FROM Flat INNER JOIN Property P on Flat.FlatID = P.PropertyID WHERE (SELECT COUNT(*) FROM Room WHERE property_id = P.PropertyID) >= 10 AND leasehold_frequency = 'Quarterly';

/* ADVANCED: Select (number of flats) with click count since date */
SELECT COUNT(*) FROM Flat INNER JOIN Property P on Flat.FlatID = P.PropertyID WHERE (SELECT COUNT(*) FROM Click WHERE property_id = P.PropertyID AND dtime > '2019-12-25') > 8;

/* ADVANCED: Select users whose average property click is more than X times grouped by post code */
SELECT UPPER(f_name) AS FirstName, Upper(l_name) AS LastName, age AS Age, A.post_code AS PostCode, COUNT(ClickID) AS PropertyClicks FROM User INNER JOIN Address A on User.address_id = A.AddressID INNER JOIN Click C on User.UserID = C.UserID HAVING COUNT(ClickID) > AVG(ClickID) ORDER BY age DESC;
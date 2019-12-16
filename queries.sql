/* BASIC: Select Properties with sale_price < 500000 AND size_unit in metres */
SELECT * FROM Property WHERE sale_price < 500000 AND size_unit = 'metres';

/* BASIC: Select Properties with sale_price < 900000 AND address that includes a 6 anywhere */
SELECT * FROM Property INNER JOIN Address A2 on Property.address_id = A2.AddressID WHERE sale_price < 900000 AND address_line_1 LIKE '%6%';

/* MODERATE: Select Houses with room count > 10 */
SELECT * FROM House INNER JOIN Property P on House.HouseID = P.PropertyID WHERE (SELECT COUNT(*) FROM Room WHERE property_id = P.PropertyID) > 10;

/* MODERATE: Select Flats with room count >= 10 AND leasehold_frequency done quarterly */
SELECT * FROM Flat INNER JOIN Property P on Flat.FlatID = P.PropertyID WHERE (SELECT COUNT(*) FROM Room WHERE property_id = P.PropertyID) >= 10 AND leasehold_frequency = 'Quarterly';

/* ADVANCED: Select (number of flats) with click count >= 3 where each click occurs between 2019-10-01 and the current date */
SELECT COUNT(*) FROM Flat INNER JOIN Property P on Flat.FlatID = P.PropertyID WHERE (SELECT COUNT(*) FROM Click WHERE property_id = P.PropertyID AND dtime BETWEEN '2019-10-01' AND CURDATE()) >= 3;

/* ADVANCED: Select all users, displaying property click counts with datetime of last click, reverse ordered by first name limited to 5 records */
SELECT UPPER(f_name) AS FirstName, UPPER(l_name) AS LastName, age AS Age, A.post_code AS PostCode, COUNT(ClickID) AS PropertyClicks, MAX(C.dtime) AS LastClick FROM User INNER JOIN Address A on User.address_id = A.AddressID INNER JOIN Click C on User.UserID = C.UserID JOIN Property P on C.property_id = P.PropertyID Group By Age, f_name ORDER BY f_name DESC LIMIT 5;
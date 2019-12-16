/* BASIC: Select Properties with sale_price AND size_unit */
SELECT * FROM Property WHERE sale_price < 500000 AND size_unit = 'metres';
#  Expected Output:
#  PropertyID  sale_price  address_id  size_unit
#  5	        357164	    5	        Metres
#  6	        494577	    6	        Metres
#  7	        41123	    7	        Metres
#  8	        335006	    8	        Metres
# 10	        433101	    10	        Metres
# 14	        424668	    14	        Metres
# 23	        111252	    23	        Metres
# 29	        86194	    29	        Metres
# 30	        466256	    30	        Metres

/* BASIC: Select Properties with sale_price AND address */
SELECT * FROM Property INNER JOIN Address A2 on Property.address_id = A2.AddressID WHERE sale_price < 900000 AND address_line_1 LIKE '%6%';
#  Expected Output:
#  PropertyID  sale_price   address_id  size_unit   AddressID   address_line_1              address_line_2      post_code
#  1	       877675	    1	        Metres	    1	        Studio 16p Donna loop	    Port Anthonyside	G63 9ZH
# 12	       39362	    12	        Feet	    12	        Studio 66l Liam corners	    Port Sarah	        G8E 4BE
# 14	       424668	    14	        Metres	    14	        Flat 6 Lindsey court	    East Anthonybury	B8 9JD
# 19	       527155	    19	        Feet	    19	        Flat 69b Henry springs	    New Gerard	        M0 4GT

/* MODERATE: Select Houses with room count */
SELECT * FROM House INNER JOIN Property P on House.HouseID = P.PropertyID WHERE (SELECT COUNT(*) FROM Room WHERE property_id = P.PropertyID) > 10;
#   Expected Output:
#   HouseID     PropertyID  sale_price  address_id  size_unit
#   1	        1	        877675	    1	        Metres
#   4	        4	        987477	    4	        Metres
#   8	        8	        335006	    8	        Metres
#   10	        10	        433101	    10	        Metres

/* MODERATE: Select Flats with room count AND leasehold_frequency */
SELECT * FROM Flat INNER JOIN Property P on Flat.FlatID = P.PropertyID WHERE (SELECT COUNT(*) FROM Room WHERE property_id = P.PropertyID) >= 10 AND leasehold_frequency = 'Quarterly';
#   Expected Output:
#   FlatID     leasehold_payment    leasehold_frequency     PropertyID  sale_price      address_id  size_unit
#   26	       3246	                Quarterly	            26	        642108	        26	        Metres


/* ADVANCED: Select (number of flats) with click count since date */
SELECT COUNT(*) FROM Flat INNER JOIN Property P on Flat.FlatID = P.PropertyID WHERE (SELECT COUNT(*) FROM Click WHERE property_id = P.PropertyID AND dtime BETWEEN '2019-10-01' AND CURDATE()) >= 3;

/* ADVANCED: Select users whose average property click is more than X times grouped by post code */
SELECT UPPER(f_name) AS FirstName, Upper(l_name) AS LastName, age AS Age, A.post_code AS PostCode, COUNT(ClickID) AS PropertyClicks FROM User INNER JOIN Address A on User.address_id = A.AddressID INNER JOIN Click C on User.UserID = C.UserID GROUP BY Age, f_name ORDER BY f_name DESC;
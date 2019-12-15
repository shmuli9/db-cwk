/* BASIC: Select Properties with sale_price < 2000 AND size_unit = 5 */
SELECT * FROM Property WHERE sale_price < 2000 AND size_unit = 5;

/* BASIC: Select Properties with sale_price < 2000 AND address 10 Sinclair Grove */
SELECT * FROM Property INNER JOIN Address A2 on Property.address_id = A2.AddressID WHERE sale_price < 2000 AND address_line_1 = "10 Sinclair Grove";

/* MODERATE: Select Houses with 2 rooms */

/* MODERATE: Select Flats with >= 2 rooms AND leasehold_frequency < 5 */

/* ADVANCED: Select (number of flats) with more than 50 clicks since 10 December */

/* ADVANCED: Select users who have clicked on properties more than 5 times grouped by post code */

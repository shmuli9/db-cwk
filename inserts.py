from random import randint

from faker import Faker

fake = Faker("en_GB")
addresses = {}
properties = {}
houses = {}
flats = {}
rooms = {}
users = {}
clicks = {}

# Addresses
for i in range(45):
    whole = fake.address().split("\n")

    add1 = whole[0] + " " + (whole[1] if len(whole) > 3 else "")
    add2 = whole[2 if len(whole) > 3 else 1]
    pc = whole[3 if len(whole) > 3 else 2]

    insert_address = f'INSERT INTO Address VALUES (NULL,"{add1}", "{add2}", "{pc}");'
    addresses[i] = insert_address
    print(insert_address)
##################################################
# Properties
for i in range(1, 31):
    sale_price = randint(1000, 1000000)
    address_id = i
    size_unit = ["Metres", "Feet"][randint(0, 1)]

    insert_properties = f'INSERT INTO Property VALUES (NULL,{sale_price}, {address_id}, "{size_unit}");'
    properties[i] = insert_properties
    print(insert_properties)

# Houses
for i in range(1, 16):
    house_id = i  # this is a property id fk

    insert_house = f'INSERT INTO House VALUES ({house_id});'
    houses[i] = insert_house
    print(insert_house)

# Flats
for i in range(16, 31):
    flat_id = i  # this is a property id fk
    leasehold_payment = randint(500, 7532)
    leasehold_frequency = ["Monthly", "Quarterly", "Yearly"][randint(0, 2)]

    insert_flat = f'INSERT INTO Flat VALUES ({flat_id}, {leasehold_payment}, "{leasehold_frequency}");'
    flats[i] = insert_flat
    print(insert_flat)

# Rooms
for i in range(1, 251):
    room_id = i
    size = randint(25, 235)
    property_id = randint(1, 30)
    type_ = ["Bedroom", "Kitchen", "Lounge", "Dining", "Bedroom"][randint(0, 4)]

    insert_room = f'INSERT INTO Room VALUES ({room_id}, {size}, {property_id}, "{type_}");'
    rooms[i] = insert_room
    print(insert_room)

# Users
for i in range(31, 46):
    address_id = i
    age = randint(16, 72)
    f_name = fake.first_name()
    l_name = fake.last_name()

    insert_user = f'INSERT INTO User VALUES (NULL, {address_id}, {age}, "{f_name}", "{l_name}");'
    users[i] = insert_user
    print(insert_user)

# Clicks
for i in range(250):
    click_id = i
    dtime = fake.date(pattern="2019-%m-%d %H:%M:%S", end_datetime=None)
    property_id = randint(1, 30)
    UserID = randint(1, 15)

    insert_click = f'INSERT INTO Click VALUES ({click_id}, "{dtime}", {property_id}, {UserID});'
    clicks[i] = insert_click
    print(insert_click)

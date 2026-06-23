-- =====================================================
-- DML SCRIPT FILE
-- Hotel Management System - Oracle XE
-- Sample Data: 10-15 Records Per Table
-- =====================================================


-- =====================================================
-- INSERT: GUESTS (15 records)
-- =====================================================

INSERT INTO Guests VALUES (1,  'Ali Hassan',       '0300-1234567', '12 Clifton Block 5',  'Karachi',    '75600');
INSERT INTO Guests VALUES (2,  'Sara Khan',        '0301-2345678', '45 Gulshan-e-Iqbal',  'Karachi',    '75300');
INSERT INTO Guests VALUES (3,  'Omar Sheikh',      '0302-3456789', '7 Model Town',         'Lahore',     '54700');
INSERT INTO Guests VALUES (4,  'Fatima Malik',     '0303-4567890', '22 F-7 Markaz',        'Islamabad',  '44000');
INSERT INTO Guests VALUES (5,  'Bilal Ahmed',      '0304-5678901', '9 DHA Phase 2',        'Lahore',     '54792');
INSERT INTO Guests VALUES (6,  'Ayesha Siddiqui',  '0305-6789012', '33 Hayatabad',         'Peshawar',   '25000');
INSERT INTO Guests VALUES (7,  'Zain ul Abideen',  '0306-7890123', '18 Satellite Town',    'Rawalpindi', '46000');
INSERT INTO Guests VALUES (8,  'Hina Baig',        '0307-8901234', '5 Cantt Area',         'Quetta',     '87300');
INSERT INTO Guests VALUES (9,  'Tariq Mehmood',    '0308-9012345', '60 Garden Town',       'Lahore',     '54600');
INSERT INTO Guests VALUES (10, 'Nadia Hussain',    '0309-0123456', '11 Johar Town',        'Lahore',     '54782');
INSERT INTO Guests VALUES (11, 'Kamran Iqbal',     '0310-1234567', '3 Blue Area',          'Islamabad',  '44010');
INSERT INTO Guests VALUES (12, 'Sana Javed',       '0311-2345678', '77 North Nazimabad',   'Karachi',    '74700');
INSERT INTO Guests VALUES (13, 'Usman Farooq',     '0312-3456789', '29 Gulberg III',       'Lahore',     '54660');
INSERT INTO Guests VALUES (14, 'Maria Zahid',      '0313-4567890', '14 Phase 6 DHA',       'Karachi',    '75500');
INSERT INTO Guests VALUES (15, 'Faisal Nawaz',     '0314-5678901', '8 Cantt Road',         'Multan',     '60000');


-- =====================================================
-- INSERT: ROOMS (15 records)
-- =====================================================

INSERT INTO Rooms VALUES (101, 'Single',  'Available');
INSERT INTO Rooms VALUES (102, 'Single',  'Occupied');
INSERT INTO Rooms VALUES (103, 'Double',  'Available');
INSERT INTO Rooms VALUES (104, 'Double',  'Occupied');
INSERT INTO Rooms VALUES (105, 'Suite',   'Available');
INSERT INTO Rooms VALUES (106, 'Suite',   'Occupied');
INSERT INTO Rooms VALUES (107, 'Single',  'Available');
INSERT INTO Rooms VALUES (108, 'Double',  'Under Maintenance');
INSERT INTO Rooms VALUES (109, 'Suite',   'Available');
INSERT INTO Rooms VALUES (110, 'Single',  'Occupied');
INSERT INTO Rooms VALUES (111, 'Double',  'Available');
INSERT INTO Rooms VALUES (112, 'Suite',   'Available');
INSERT INTO Rooms VALUES (113, 'Single',  'Occupied');
INSERT INTO Rooms VALUES (114, 'Double',  'Available');
INSERT INTO Rooms VALUES (115, 'Suite',   'Under Maintenance');


-- =====================================================
-- INSERT: RESERVATIONS (15 records)
-- =====================================================

INSERT INTO Reservations VALUES (1001, 1,  TO_DATE('2025-01-05', 'YYYY-MM-DD'), TO_DATE('2025-01-10', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1002, 2,  TO_DATE('2025-01-12', 'YYYY-MM-DD'), TO_DATE('2025-01-15', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1003, 3,  TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-07', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1004, 4,  TO_DATE('2025-02-14', 'YYYY-MM-DD'), TO_DATE('2025-02-18', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1005, 5,  TO_DATE('2025-03-01', 'YYYY-MM-DD'), TO_DATE('2025-03-05', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1006, 6,  TO_DATE('2025-03-10', 'YYYY-MM-DD'), TO_DATE('2025-03-14', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1007, 7,  TO_DATE('2025-04-02', 'YYYY-MM-DD'), TO_DATE('2025-04-06', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1008, 8,  TO_DATE('2025-04-15', 'YYYY-MM-DD'), TO_DATE('2025-04-20', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1009, 9,  TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2025-05-04', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1010, 10, TO_DATE('2025-05-20', 'YYYY-MM-DD'), TO_DATE('2025-05-25', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1011, 11, TO_DATE('2025-06-01', 'YYYY-MM-DD'), TO_DATE('2025-06-05', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1012, 12, TO_DATE('2025-06-15', 'YYYY-MM-DD'), TO_DATE('2025-06-20', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1013, 13, TO_DATE('2025-07-04', 'YYYY-MM-DD'), TO_DATE('2025-07-09', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1014, 14, TO_DATE('2025-07-20', 'YYYY-MM-DD'), TO_DATE('2025-07-25', 'YYYY-MM-DD'));
INSERT INTO Reservations VALUES (1015, 15, TO_DATE('2025-08-01', 'YYYY-MM-DD'), TO_DATE('2025-08-06', 'YYYY-MM-DD'));


-- =====================================================
-- INSERT: BOOKING (15 records)
-- =====================================================

INSERT INTO Booking VALUES (2001, 1001, 101);
INSERT INTO Booking VALUES (2002, 1002, 102);
INSERT INTO Booking VALUES (2003, 1003, 103);
INSERT INTO Booking VALUES (2004, 1004, 104);
INSERT INTO Booking VALUES (2005, 1005, 105);
INSERT INTO Booking VALUES (2006, 1006, 106);
INSERT INTO Booking VALUES (2007, 1007, 107);
INSERT INTO Booking VALUES (2008, 1008, 109);
INSERT INTO Booking VALUES (2009, 1009, 110);
INSERT INTO Booking VALUES (2010, 1010, 111);
INSERT INTO Booking VALUES (2011, 1011, 112);
INSERT INTO Booking VALUES (2012, 1012, 113);
INSERT INTO Booking VALUES (2013, 1013, 114);
INSERT INTO Booking VALUES (2014, 1014, 103);
INSERT INTO Booking VALUES (2015, 1015, 105);


-- =====================================================
-- INSERT: PAYMENTS (15 records)
-- =====================================================

INSERT INTO Payments VALUES (3001, 2001, 15000.00, TO_DATE('2025-01-10', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3002, 2002,  9000.00, TO_DATE('2025-01-15', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3003, 2003, 21000.00, TO_DATE('2025-02-07', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3004, 2004, 12000.00, TO_DATE('2025-02-18', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3005, 2005, 20000.00, TO_DATE('2025-03-05', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3006, 2006, 18000.00, TO_DATE('2025-03-14', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3007, 2007,  8000.00, TO_DATE('2025-04-06', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3008, 2008, 25000.00, TO_DATE('2025-04-20', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3009, 2009,  6000.00, TO_DATE('2025-05-04', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3010, 2010, 15000.00, TO_DATE('2025-05-25', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3011, 2011, 16000.00, TO_DATE('2025-06-05', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3012, 2012,  7500.00, TO_DATE('2025-06-20', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3013, 2013, 17500.00, TO_DATE('2025-07-09', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3014, 2014, 21000.00, TO_DATE('2025-07-25', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (3015, 2015, 30000.00, TO_DATE('2025-08-06', 'YYYY-MM-DD'));


-- =====================================================
-- INSERT: SERVICES (12 records)
-- =====================================================

INSERT INTO Services VALUES (401, 'Room Service',          500.00);
INSERT INTO Services VALUES (402, 'Laundry',               300.00);
INSERT INTO Services VALUES (403, 'Spa & Wellness',       1500.00);
INSERT INTO Services VALUES (404, 'Airport Transfer',     2000.00);
INSERT INTO Services VALUES (405, 'Breakfast Buffet',      800.00);
INSERT INTO Services VALUES (406, 'Swimming Pool Access',  400.00);
INSERT INTO Services VALUES (407, 'Gym Access',            350.00);
INSERT INTO Services VALUES (408, 'Conference Room',      5000.00);
INSERT INTO Services VALUES (409, 'Doctor on Call',       3000.00);
INSERT INTO Services VALUES (410, 'Dry Cleaning',          450.00);
INSERT INTO Services VALUES (411, 'Babysitting',          1200.00);
INSERT INTO Services VALUES (412, 'Car Rental',           4000.00);


-- =====================================================
-- INSERT: SERVICE_REQUESTS (15 records)
-- =====================================================

INSERT INTO Service_Requests VALUES (5001, 1001, 401, 'Room Service',          'Completed');
INSERT INTO Service_Requests VALUES (5002, 1002, 402, 'Laundry',               'Completed');
INSERT INTO Service_Requests VALUES (5003, 1003, 403, 'Spa & Wellness',        'Pending');
INSERT INTO Service_Requests VALUES (5004, 1004, 404, 'Airport Transfer',      'Completed');
INSERT INTO Service_Requests VALUES (5005, 1005, 405, 'Breakfast Buffet',      'Completed');
INSERT INTO Service_Requests VALUES (5006, 1006, 406, 'Swimming Pool Access',  'In Progress');
INSERT INTO Service_Requests VALUES (5007, 1007, 407, 'Gym Access',            'Completed');
INSERT INTO Service_Requests VALUES (5008, 1008, 408, 'Conference Room',       'Pending');
INSERT INTO Service_Requests VALUES (5009, 1009, 409, 'Doctor on Call',        'Completed');
INSERT INTO Service_Requests VALUES (5010, 1010, 410, 'Dry Cleaning',          'In Progress');
INSERT INTO Service_Requests VALUES (5011, 1011, 411, 'Babysitting',           'Completed');
INSERT INTO Service_Requests VALUES (5012, 1012, 412, 'Car Rental',            'Pending');
INSERT INTO Service_Requests VALUES (5013, 1013, 401, 'Room Service',          'Completed');
INSERT INTO Service_Requests VALUES (5014, 1014, 405, 'Breakfast Buffet',      'In Progress');
INSERT INTO Service_Requests VALUES (5015, 1015, 403, 'Spa & Wellness',        'Pending');


-- =====================================================
-- INSERT: STAFF (12 records)
-- =====================================================

INSERT INTO Staff VALUES (601, 'Ahmed Raza',        'Manager');
INSERT INTO Staff VALUES (602, 'Sobia Noor',        'Receptionist');
INSERT INTO Staff VALUES (603, 'Khalid Mehmood',    'Housekeeping');
INSERT INTO Staff VALUES (604, 'Rabia Aslam',       'Receptionist');
INSERT INTO Staff VALUES (605, 'Imran Qureshi',     'Manager');
INSERT INTO Staff VALUES (606, 'Nasreen Bibi',      'Housekeeping');
INSERT INTO Staff VALUES (607, 'Shahid Ali',        'Housekeeping');
INSERT INTO Staff VALUES (608, 'Zara Waheed',       'Receptionist');
INSERT INTO Staff VALUES (609, 'Farhan Bashir',     'Manager');
INSERT INTO Staff VALUES (610, 'Saima Perveen',     'Housekeeping');
INSERT INTO Staff VALUES (611, 'Iqbal Chaudhry',    'Receptionist');
INSERT INTO Staff VALUES (612, 'Lubna Tariq',       'Housekeeping');


-- =====================================================
-- INSERT: SUPPLIERS (10 records)
-- =====================================================

INSERT INTO Suppliers VALUES (701, 'PakClean Supplies',     'pakclean@supplies.pk');
INSERT INTO Suppliers VALUES (702, 'HotelPro Traders',      'info@hotelpro.pk');
INSERT INTO Suppliers VALUES (703, 'Al-Madina Wholesale',   'almadina@wholesale.pk');
INSERT INTO Suppliers VALUES (704, 'Bright Linen Co.',      'sales@brightlinen.pk');
INSERT INTO Suppliers VALUES (705, 'SafeFood Distributors', 'contact@safefood.pk');
INSERT INTO Suppliers VALUES (706, 'TechAmenities Ltd.',    'tech@amenities.pk');
INSERT INTO Suppliers VALUES (707, 'CleanZone Corp.',       'cleanzone@corp.pk');
INSERT INTO Suppliers VALUES (708, 'Metro Kitchen Supply',  'metro@kitchen.pk');
INSERT INTO Suppliers VALUES (709, 'EcoFresh Products',     'eco@fresh.pk');
INSERT INTO Suppliers VALUES (710, 'Premier Bath Essentials','premier@bath.pk');


-- =====================================================
-- INSERT: INVENTORY (15 records)
-- =====================================================

INSERT INTO Inventory VALUES (801, 'Bath Towels',           150);
INSERT INTO Inventory VALUES (802, 'Bed Sheets',            200);
INSERT INTO Inventory VALUES (803, 'Shampoo Bottles',       300);
INSERT INTO Inventory VALUES (804, 'Soap Bars',             500);
INSERT INTO Inventory VALUES (805, 'Toilet Paper Rolls',    600);
INSERT INTO Inventory VALUES (806, 'Pillow Covers',         180);
INSERT INTO Inventory VALUES (807, 'Cleaning Detergent',     80);
INSERT INTO Inventory VALUES (808, 'Mineral Water Bottles', 400);
INSERT INTO Inventory VALUES (809, 'Tea & Coffee Sachets',  350);
INSERT INTO Inventory VALUES (810, 'Disposable Cups',       500);
INSERT INTO Inventory VALUES (811, 'Air Fresheners',        120);
INSERT INTO Inventory VALUES (812, 'Hand Sanitizers',       200);
INSERT INTO Inventory VALUES (813, 'Face Towels',           160);
INSERT INTO Inventory VALUES (814, 'Laundry Bags',          250);
INSERT INTO Inventory VALUES (815, 'Trash Bags',            300);


-- =====================================================
-- INSERT: SUPPLY_ORDER (15 records)
-- =====================================================

INSERT INTO Supply_Order VALUES (901, 603, 701, TO_DATE('2025-01-03', 'YYYY-MM-DD'), 50);
INSERT INTO Supply_Order VALUES (902, 606, 702, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 30);
INSERT INTO Supply_Order VALUES (903, 607, 703, TO_DATE('2025-02-01', 'YYYY-MM-DD'), 100);
INSERT INTO Supply_Order VALUES (904, 610, 704, TO_DATE('2025-02-10', 'YYYY-MM-DD'), 75);
INSERT INTO Supply_Order VALUES (905, 612, 705, TO_DATE('2025-02-20', 'YYYY-MM-DD'), 200);
INSERT INTO Supply_Order VALUES (906, 603, 706, TO_DATE('2025-03-05', 'YYYY-MM-DD'), 40);
INSERT INTO Supply_Order VALUES (907, 606, 707, TO_DATE('2025-03-15', 'YYYY-MM-DD'), 60);
INSERT INTO Supply_Order VALUES (908, 607, 708, TO_DATE('2025-04-01', 'YYYY-MM-DD'), 80);
INSERT INTO Supply_Order VALUES (909, 610, 709, TO_DATE('2025-04-12', 'YYYY-MM-DD'), 150);
INSERT INTO Supply_Order VALUES (910, 612, 710, TO_DATE('2025-04-25', 'YYYY-MM-DD'), 90);
INSERT INTO Supply_Order VALUES (911, 603, 701, TO_DATE('2025-05-05', 'YYYY-MM-DD'), 70);
INSERT INTO Supply_Order VALUES (912, 606, 703, TO_DATE('2025-05-18', 'YYYY-MM-DD'), 120);
INSERT INTO Supply_Order VALUES (913, 607, 705, TO_DATE('2025-06-02', 'YYYY-MM-DD'), 55);
INSERT INTO Supply_Order VALUES (914, 610, 708, TO_DATE('2025-06-20', 'YYYY-MM-DD'), 95);
INSERT INTO Supply_Order VALUES (915, 612, 710, TO_DATE('2025-07-10', 'YYYY-MM-DD'), 110);


-- =====================================================
-- INSERT: ORDER_DETAIL (15 records)
-- =====================================================

INSERT INTO Order_Detail VALUES (901, 801, 50);
INSERT INTO Order_Detail VALUES (902, 807, 30);
INSERT INTO Order_Detail VALUES (903, 804, 100);
INSERT INTO Order_Detail VALUES (904, 802, 75);
INSERT INTO Order_Detail VALUES (905, 808, 200);
INSERT INTO Order_Detail VALUES (906, 812, 40);
INSERT INTO Order_Detail VALUES (907, 811, 60);
INSERT INTO Order_Detail VALUES (908, 809, 80);
INSERT INTO Order_Detail VALUES (909, 810, 150);
INSERT INTO Order_Detail VALUES (910, 803, 90);
INSERT INTO Order_Detail VALUES (911, 806, 70);
INSERT INTO Order_Detail VALUES (912, 815, 120);
INSERT INTO Order_Detail VALUES (913, 814, 55);
INSERT INTO Order_Detail VALUES (914, 813, 95);
INSERT INTO Order_Detail VALUES (915, 805, 110);


-- =====================================================
-- COMMIT ALL CHANGES
-- =====================================================

COMMIT;

-- =====================================================
-- END OF DML SCRIPT
-- =====================================================

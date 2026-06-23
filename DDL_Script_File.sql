-- =====================================================
-- DDL SCRIPT FILE
-- Hotel Management System - Oracle XE
-- =====================================================

-- =====================================================
-- DROP TABLES (Run only if tables already exist)
-- =====================================================

DROP TABLE Order_Detail CASCADE CONSTRAINTS;
DROP TABLE Payments CASCADE CONSTRAINTS;
DROP TABLE Booking CASCADE CONSTRAINTS;
DROP TABLE Service_Requests CASCADE CONSTRAINTS;
DROP TABLE Supply_Order CASCADE CONSTRAINTS;
DROP TABLE Reservations CASCADE CONSTRAINTS;
DROP TABLE Rooms CASCADE CONSTRAINTS;
DROP TABLE Guests CASCADE CONSTRAINTS;
DROP TABLE Services CASCADE CONSTRAINTS;
DROP TABLE Staff CASCADE CONSTRAINTS;
DROP TABLE Suppliers CASCADE CONSTRAINTS;
DROP TABLE Inventory CASCADE CONSTRAINTS;

-- =====================================================
-- TABLE: GUESTS
-- Stores guest personal and contact information.
-- =====================================================

CREATE TABLE Guests(
    Guest_ID    NUMBER          PRIMARY KEY,
    Name        VARCHAR2(100)   NOT NULL,
    Phone_No    VARCHAR2(20)    UNIQUE,
    Street      VARCHAR2(100),
    City        VARCHAR2(50),
    Zip         VARCHAR2(10)
);

-- =====================================================
-- TABLE: RESERVATIONS
-- Tracks each reservation made by a guest.
-- =====================================================

CREATE TABLE Reservations(
    Reservation_ID  NUMBER  PRIMARY KEY,
    Guest_ID        NUMBER  NOT NULL,
    Check_In        DATE    NOT NULL,
    Check_Out       DATE    NOT NULL,

    CONSTRAINT fk_res_guest
        FOREIGN KEY (Guest_ID)
        REFERENCES Guests(Guest_ID)
);

-- =====================================================
-- TABLE: ROOMS
-- Stores room type and current availability status.
-- =====================================================

CREATE TABLE Rooms(
    Room_ID     NUMBER          PRIMARY KEY,
    Room_Type   VARCHAR2(20)
        CHECK (Room_Type IN ('Single', 'Double', 'Suite')),
    Room_Status VARCHAR2(20)
);

-- =====================================================
-- TABLE: BOOKING
-- Links a reservation to a specific room.
-- =====================================================

CREATE TABLE Booking(
    Booking_ID      NUMBER  PRIMARY KEY,
    Reservation_ID  NUMBER  NOT NULL,
    Room_ID         NUMBER  NOT NULL,

    CONSTRAINT fk_booking_reservation
        FOREIGN KEY (Reservation_ID)
        REFERENCES Reservations(Reservation_ID),

    CONSTRAINT fk_booking_room
        FOREIGN KEY (Room_ID)
        REFERENCES Rooms(Room_ID)
);

-- =====================================================
-- TABLE: PAYMENTS
-- Records payment transactions linked to bookings.
-- =====================================================

CREATE TABLE Payments(
    Payment_ID      NUMBER          PRIMARY KEY,
    Booking_ID      NUMBER          NOT NULL,
    Amount          NUMBER(10, 2)
        CHECK (Amount >= 0),
    Payment_Date    DATE,

    CONSTRAINT fk_payment_booking
        FOREIGN KEY (Booking_ID)
        REFERENCES Booking(Booking_ID)
);

-- =====================================================
-- TABLE: SERVICES
-- Catalogue of available hotel services and costs.
-- =====================================================

CREATE TABLE Services(
    Service_ID      NUMBER          PRIMARY KEY,
    Service_Name    VARCHAR2(100),
    Service_Cost    NUMBER(10, 2)
);

-- =====================================================
-- TABLE: SERVICE_REQUESTS
-- Tracks service requests made during a reservation.
-- =====================================================

CREATE TABLE Service_Requests(
    Request_ID      NUMBER          PRIMARY KEY,
    Reservation_ID  NUMBER          NOT NULL,
    Service_ID      NUMBER          NOT NULL,
    Request_Type    VARCHAR2(100),
    Request_Status  VARCHAR2(30),

    CONSTRAINT fk_request_reservation
        FOREIGN KEY (Reservation_ID)
        REFERENCES Reservations(Reservation_ID),

    CONSTRAINT fk_request_service
        FOREIGN KEY (Service_ID)
        REFERENCES Services(Service_ID)
);

-- =====================================================
-- TABLE: STAFF
-- Stores hotel staff details and their roles.
-- =====================================================

CREATE TABLE Staff(
    Staff_ID    NUMBER          PRIMARY KEY,
    Staff_Name  VARCHAR2(100),
    Position    VARCHAR2(50)
        CHECK (Position IN ('Manager', 'Receptionist', 'Housekeeping'))
);

-- =====================================================
-- TABLE: SUPPLIERS
-- Stores supplier contact information.
-- =====================================================

CREATE TABLE Suppliers(
    Supplier_ID     NUMBER          PRIMARY KEY,
    Supplier_Name   VARCHAR2(100),
    Contact         VARCHAR2(100)
);

-- =====================================================
-- TABLE: SUPPLY_ORDER
-- Records supply orders placed by staff to suppliers.
-- =====================================================

CREATE TABLE Supply_Order(
    Order_ID    NUMBER   PRIMARY KEY,
    Staff_ID    NUMBER   NOT NULL,
    Supplier_ID NUMBER   NOT NULL,
    Order_Date  DATE,
    Quantity    NUMBER
        CHECK (Quantity > 0),

    CONSTRAINT fk_supply_staff
        FOREIGN KEY (Staff_ID)
        REFERENCES Staff(Staff_ID),

    CONSTRAINT fk_supply_supplier
        FOREIGN KEY (Supplier_ID)
        REFERENCES Suppliers(Supplier_ID)
);

-- =====================================================
-- TABLE: INVENTORY
-- Tracks inventory items and their stock levels.
-- =====================================================

CREATE TABLE Inventory(
    Item_ID     NUMBER          PRIMARY KEY,
    Item_Name   VARCHAR2(100),
    Stock_Level NUMBER          DEFAULT 0
);

-- =====================================================
-- TABLE: ORDER_DETAIL
-- Junction table linking supply orders to inventory
-- items with quantities ordered.
-- =====================================================

CREATE TABLE Order_Detail(
    Order_ID    NUMBER,
    Item_ID     NUMBER,
    Quantity    NUMBER
        CHECK (Quantity > 0),

    CONSTRAINT pk_order_detail
        PRIMARY KEY (Order_ID, Item_ID),

    CONSTRAINT fk_orderdetail_order
        FOREIGN KEY (Order_ID)
        REFERENCES Supply_Order(Order_ID),

    CONSTRAINT fk_orderdetail_item
        FOREIGN KEY (Item_ID)
        REFERENCES Inventory(Item_ID)
);

-- =====================================================
-- END OF DDL SCRIPT
-- =====================================================

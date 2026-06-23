-- =====================================================
-- DATABASE QUERYING & OPTIMIZATION SCRIPT
-- Hotel Management System - Oracle XE
-- BSSE - Introduction to Database Systems - IIUI
-- =====================================================


-- =====================================================
-- SECTION 1: MULTI-TABLE JOINS (3 Queries)
-- =====================================================

-- ----------------------------------------------------
-- Query 1 (INNER JOIN):
-- Retrieve full booking details — guest name, room
-- type, check-in, check-out, and amount paid.
-- ----------------------------------------------------

SELECT
    G.Name              AS Guest_Name,
    G.Phone_No          AS Phone,
    R.Room_ID,
    R.Room_Type,
    RV.Check_In,
    RV.Check_Out,
    P.Amount            AS Amount_Paid
FROM Guests G
INNER JOIN Reservations RV  ON G.Guest_ID       = RV.Guest_ID
INNER JOIN Booking B        ON RV.Reservation_ID = B.Reservation_ID
INNER JOIN Rooms R          ON B.Room_ID         = R.Room_ID
INNER JOIN Payments P       ON B.Booking_ID      = P.Booking_ID;


-- ----------------------------------------------------
-- Query 2 (LEFT JOIN):
-- List all guests and their service requests (if any).
-- Guests with no service requests will still appear.
-- ----------------------------------------------------

SELECT
    G.Name              AS Guest_Name,
    G.City,
    SR.Request_Type,
    SR.Request_Status,
    S.Service_Name,
    S.Service_Cost
FROM Guests G
LEFT JOIN Reservations RV   ON G.Guest_ID       = RV.Guest_ID
LEFT JOIN Service_Requests SR ON RV.Reservation_ID = SR.Reservation_ID
LEFT JOIN Services S        ON SR.Service_ID    = S.Service_ID
ORDER BY G.Name;


-- ----------------------------------------------------
-- Query 3 (LEFT JOIN):
-- Show all supply orders with staff name, supplier
-- name, and the inventory items ordered.
-- ----------------------------------------------------

SELECT
    SO.Order_ID,
    ST.Staff_Name,
    ST.Position,
    SP.Supplier_Name,
    SO.Order_Date,
    I.Item_Name,
    OD.Quantity         AS Quantity_Ordered
FROM Supply_Order SO
LEFT JOIN Staff ST      ON SO.Staff_ID    = ST.Staff_ID
LEFT JOIN Suppliers SP  ON SO.Supplier_ID = SP.Supplier_ID
LEFT JOIN Order_Detail OD ON SO.Order_ID  = OD.Order_ID
LEFT JOIN Inventory I   ON OD.Item_ID     = I.Item_ID
ORDER BY SO.Order_Date;


-- =====================================================
-- SECTION 2: DATA AGGREGATION (2 Queries)
-- =====================================================

-- ----------------------------------------------------
-- Query 4 (SUM + GROUP BY + HAVING):
-- Total revenue collected per room type.
-- Only show room types that generated more than
-- PKR 30,000 in total payments.
-- ----------------------------------------------------

SELECT
    R.Room_Type,
    COUNT(P.Payment_ID) AS Total_Bookings,
    SUM(P.Amount)       AS Total_Revenue
FROM Rooms R
INNER JOIN Booking B    ON R.Room_ID    = B.Room_ID
INNER JOIN Payments P   ON B.Booking_ID = P.Booking_ID
GROUP BY R.Room_Type
HAVING SUM(P.Amount) > 30000
ORDER BY Total_Revenue DESC;


-- ----------------------------------------------------
-- Query 5 (COUNT + AVG + GROUP BY + HAVING):
-- Number of service requests and average service cost
-- per guest. Only show guests with more than 0 requests.
-- ----------------------------------------------------

SELECT
    G.Name                  AS Guest_Name,
    COUNT(SR.Request_ID)    AS Total_Requests,
    AVG(S.Service_Cost)     AS Avg_Service_Cost,
    MAX(S.Service_Cost)     AS Max_Service_Cost,
    MIN(S.Service_Cost)     AS Min_Service_Cost
FROM Guests G
INNER JOIN Reservations RV      ON G.Guest_ID        = RV.Guest_ID
INNER JOIN Service_Requests SR  ON RV.Reservation_ID = SR.Reservation_ID
INNER JOIN Services S           ON SR.Service_ID     = S.Service_ID
GROUP BY G.Name
HAVING COUNT(SR.Request_ID) > 0
ORDER BY Total_Requests DESC;


-- =====================================================
-- SECTION 3: SUBQUERIES (2 Queries)
-- =====================================================

-- ----------------------------------------------------
-- Query 6 (Subquery with IN):
-- Find all guests who have booked a Suite room.
-- ----------------------------------------------------

SELECT
    G.Guest_ID,
    G.Name          AS Guest_Name,
    G.City,
    G.Phone_No
FROM Guests G
WHERE G.Guest_ID IN (
    SELECT RV.Guest_ID
    FROM Reservations RV
    INNER JOIN Booking B ON RV.Reservation_ID = B.Reservation_ID
    INNER JOIN Rooms R   ON B.Room_ID         = R.Room_ID
    WHERE R.Room_Type = 'Suite'
);


-- ----------------------------------------------------
-- Query 7 (Correlated Subquery with EXISTS):
-- List all reservations that have at least one
-- pending service request.
-- ----------------------------------------------------

SELECT
    RV.Reservation_ID,
    G.Name          AS Guest_Name,
    RV.Check_In,
    RV.Check_Out
FROM Reservations RV
INNER JOIN Guests G ON RV.Guest_ID = G.Guest_ID
WHERE EXISTS (
    SELECT 1
    FROM Service_Requests SR
    WHERE SR.Reservation_ID = RV.Reservation_ID
    AND SR.Request_Status   = 'Pending'
);


-- ----------------------------------------------------
-- Query 8 (Scalar Subquery):
-- Show each payment along with the average payment
-- amount across all bookings for comparison.
-- ----------------------------------------------------

SELECT
    P.Payment_ID,
    G.Name              AS Guest_Name,
    P.Amount,
    (SELECT ROUND(AVG(Amount), 2) FROM Payments) AS Avg_Payment,
    CASE
        WHEN P.Amount > (SELECT AVG(Amount) FROM Payments)
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS Payment_Category
FROM Payments P
INNER JOIN Booking B    ON P.Booking_ID      = B.Booking_ID
INNER JOIN Reservations RV ON B.Reservation_ID = RV.Reservation_ID
INNER JOIN Guests G     ON RV.Guest_ID       = G.Guest_ID
ORDER BY P.Amount DESC;


-- =====================================================
-- SECTION 4: ADVANCED DATABASE OBJECTS
-- =====================================================

-- ----------------------------------------------------
-- Query 9 - VIEW: Guest_Booking_Summary
-- Simplifies the complex multi-table join between
-- Guests, Reservations, Booking, Rooms, and Payments
-- into a single easy-to-query view.
-- ----------------------------------------------------

CREATE OR REPLACE VIEW Guest_Booking_Summary AS
SELECT
    G.Guest_ID,
    G.Name              AS Guest_Name,
    G.Phone_No,
    G.City,
    RV.Reservation_ID,
    RV.Check_In,
    RV.Check_Out,
    R.Room_ID,
    R.Room_Type,
    R.Room_Status,
    P.Amount            AS Amount_Paid,
    P.Payment_Date
FROM Guests G
INNER JOIN Reservations RV  ON G.Guest_ID        = RV.Guest_ID
INNER JOIN Booking B        ON RV.Reservation_ID = B.Reservation_ID
INNER JOIN Rooms R          ON B.Room_ID         = R.Room_ID
INNER JOIN Payments P       ON B.Booking_ID      = P.Booking_ID;

-- Query the view:
SELECT * FROM Guest_Booking_Summary;

-- Example: Use the view to find all Suite bookings:
SELECT * FROM Guest_Booking_Summary WHERE Room_Type = 'Suite';

-- Example: Use the view to find high-value bookings:
SELECT * FROM Guest_Booking_Summary WHERE Amount_Paid > 20000;


-- ----------------------------------------------------
-- Query 10 - TRIGGER: trg_Update_Inventory
-- Business Rule: Whenever a new Order_Detail record
-- is inserted (i.e., items are ordered from a
-- supplier), automatically REDUCE the stock level
-- in the Inventory table by the ordered quantity.
-- This keeps stock levels in sync automatically.
-- ----------------------------------------------------

CREATE OR REPLACE TRIGGER trg_Update_Inventory
AFTER INSERT ON Order_Detail
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET Stock_Level = Stock_Level - :NEW.Quantity
    WHERE Item_ID = :NEW.Item_ID;
END;
/

-- Test the trigger:
-- Check stock level of Item 801 (Bath Towels) before:
SELECT Item_ID, Item_Name, Stock_Level FROM Inventory WHERE Item_ID = 801;

-- Insert a new supply order and order detail:
INSERT INTO Supply_Order VALUES (916, 603, 701, TO_DATE('2025-08-15', 'YYYY-MM-DD'), 20);
INSERT INTO Order_Detail VALUES (916, 801, 20);

-- Check stock level of Item 801 after (should be reduced by 20):
SELECT Item_ID, Item_Name, Stock_Level FROM Inventory WHERE Item_ID = 801;


-- =====================================================
-- END OF QUERYING & OPTIMIZATION SCRIPT
-- =====================================================

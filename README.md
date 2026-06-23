# Hotel Management System - Database Project

A fully normalized relational database for a Hotel Management System, designed and implemented in **Oracle XE** using SQL. The schema covers all core hotel operations, from guest check-in to supply chain management.

The system handles guest registration, room reservations, booking management, payment processing, hotel service requests, staff management, supplier procurement, and automated inventory tracking. All business rules are enforced through constraints, foreign keys, and a PL/SQL trigger that keeps stock levels updated automatically on every supply order.

## 📁 Repository Structure

| File | Description |
|------|-------------|
| `DDL_Script_File.sql` | Table definitions, constraints, and schema creation |
| `DML_Script_File.sql` | Sample data inserts, 10 to 15 records per table |
| `Queries_Script.sql` | 10 queries covering joins, aggregations, subqueries, a view, and a trigger |

## 🗄️ Database Schema

The database consists of **12 interrelated tables**, all verified to satisfy **Third Normal Form (3NF)**.

| Table | Description |
|-------|-------------|
| `Guests` | Guest personal and contact information |
| `Reservations` | Reservations made by guests with check-in/out dates |
| `Rooms` | Room details including type (Single/Double/Suite) and availability |
| `Booking` | Junction table linking a reservation to a specific room |
| `Payments` | Financial transactions tied to each booking |
| `Services` | Catalogue of hotel services with associated costs |
| `Service_Requests` | Service requests made by guests during their stay |
| `Staff` | Hotel employees with role classification (Manager/Receptionist/Housekeeping) |
| `Suppliers` | Supplier contact information for procurement |
| `Supply_Order` | Orders placed by staff to suppliers |
| `Inventory` | Inventory items and their current stock levels |
| `Order_Detail` | Junction table linking supply orders to inventory items with quantities |

## ⚙️ Setup Instructions

Run the scripts in the following order:

**1. Create the schema**
```sql
@DDL_Script_File.sql
```

**2. Populate with sample data**
```sql
@DML_Script_File.sql
```

**3. Run queries**
```sql
@Queries_Script.sql
```

> **Note:** The DROP TABLE statements at the top of the DDL script use `CASCADE CONSTRAINTS`. Run them only if the tables already exist from a previous setup.

## 🔍 Queries Overview

| # | Type | Description |
|---|------|-------------|
| 1 | INNER JOIN | Full booking details, guest, room, dates, and amount paid |
| 2 | LEFT JOIN | All guests with their service requests (including guests with none) |
| 3 | LEFT JOIN | Supply orders with staff, supplier, and inventory items |
| 4 | Aggregation | Total revenue per room type (filtered above PKR 30,000) |
| 5 | Aggregation | Service request count and avg/max/min cost per guest |
| 6 | Subquery (IN) | All guests who have booked a Suite room |
| 7 | Subquery (EXISTS) | Reservations with at least one pending service request |
| 8 | Scalar Subquery | Each payment labeled Above/Below the overall average |
| 9 | View | `Guest_Booking_Summary`, reusable 5-table join as a virtual table |
| 10 | Trigger | `trg_Update_Inventory`, auto-reduces stock level on supply order insert |

## 🛠️ Tech Stack

- **Database:** Oracle XE
- **Language:** SQL / PL-SQL
- **Concepts:** ER Modeling, 3NF Normalization, DDL, DML, Joins, Aggregations, Subqueries, Views, Triggers

## 📊 Key Highlights

- Fully normalized schema (3NF) across 12 tables with proper primary keys, foreign keys, and check constraints
- 150+ rows of realistic sample data
- Automated inventory management via an AFTER INSERT trigger
- Reusable `Guest_Booking_Summary` view simplifying a complex 5-table join

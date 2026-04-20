CREATE DATABASE HotelDW_Staging;
GO


USE HotelDW_Staging;
GO


CREATE TABLE stg_Booking (
    stg_booking_id          INT IDENTITY(1,1) PRIMARY KEY,
    hotel                   NVARCHAR(100),
    lead_time               INT,
    arrival_date_year       INT,
    arrival_date_month      NVARCHAR(20),
    arrival_date_week_number INT,
    arrival_date_day_of_month INT,
    stays_in_weekend_nights INT,
    stays_in_week_nights    INT,
    adults                  INT,
    children                FLOAT,
    babies                  INT,
    meal                    NVARCHAR(50),
    market_segment          NVARCHAR(100),
    distribution_channel    NVARCHAR(100),
    reserved_room_type      CHAR(1),
    assigned_room_type      CHAR(1),
    deposit_type            NVARCHAR(50),
    customer_type           NVARCHAR(50),
    etl_load_date           DATETIME DEFAULT GETDATE()
);
GO


CREATE TABLE stg_Guest (
    stg_guest_id    INT IDENTITY(1,1) PRIMARY KEY,
    name            NVARCHAR(200),
    email           NVARCHAR(200),
    phone_number    NVARCHAR(50),
    credit_card     NVARCHAR(50),
    country         CHAR(10),
    etl_load_date   DATETIME DEFAULT GETDATE()
);
GO


CREATE TABLE stg_ReservationStatus (
    stg_reservation_id          INT IDENTITY(1,1) PRIMARY KEY,
    is_canceled                 BIT,
    adr                         FLOAT,
    required_car_parking_spaces INT,
    total_of_special_requests   INT,
    reservation_status          NVARCHAR(50),
    reservation_status_date     DATE,
    etl_load_date               DATETIME DEFAULT GETDATE()
);
GO



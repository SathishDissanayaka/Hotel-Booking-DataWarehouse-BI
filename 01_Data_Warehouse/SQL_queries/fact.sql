USE HotelDW;

CREATE TABLE FactBooking (
    booking_key                 INT IDENTITY(1,1) PRIMARY KEY,
    -- Foreign Keys
    guest_key                   INT,
    hotel_key                   INT,
    room_key                    INT,
    agent_key                   INT,
    date_key                    INT,
    -- Measures
    lead_time                   INT,
    stays_in_weekend_nights     INT,
    stays_in_week_nights        INT,
    adults                      INT,
    children                    VARCHAR(50),
    babies                      INT,
    is_canceled                 BIT,
    adr                         FLOAT,
    required_car_parking_spaces INT,
    total_of_special_requests   INT,
    reservation_status          VARCHAR(100),
    reservation_status_date     DATE,
    -- Accumulating Fact columns (Task 6)
    accm_txn_create_time        DATETIME,
    accm_txn_complete_time      DATETIME NULL,
    txn_process_time_hours      FLOAT NULL,
    -- ETL
    etl_load_date               DATETIME DEFAULT GETDATE(),

    -- FK Constraints
    CONSTRAINT FK_Fact_Guest  FOREIGN KEY (guest_key)  REFERENCES DimGuest(guest_key),
    CONSTRAINT FK_Fact_Hotel  FOREIGN KEY (hotel_key)  REFERENCES DimHotel(hotel_key),
    CONSTRAINT FK_Fact_Room   FOREIGN KEY (room_key)   REFERENCES DimRoom(room_key),
    CONSTRAINT FK_Fact_Agent  FOREIGN KEY (agent_key)  REFERENCES DimAgent(agent_key),
    CONSTRAINT FK_Fact_Date   FOREIGN KEY (date_key)   REFERENCES DimDate(date_key)
);
GO


-- verify

USE HotelDW;
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'FactBooking';


ALTER TABLE DimDate
ALTER COLUMN month_name VARCHAR(20);

USE HotelDW;

ALTER TABLE FactBooking
ALTER COLUMN reservation_status NVARCHAR(100);

ALTER TABLE FactBooking
ALTER COLUMN reservation_status_date NVARCHAR(50);


ALTER TABLE FactBooking
ALTER COLUMN reservation_status NVARCHAR(255);

USE HotelDW;
SELECT COUNT(*) AS TotalBookings FROM FactBooking;
SELECT TOP 5 * FROM FactBooking;
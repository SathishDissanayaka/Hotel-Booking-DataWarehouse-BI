CREATE DATABASE HotelDW;
GO

USE HotelDW;
GO

CREATE TABLE DimDate (
    date_key        INT PRIMARY KEY,
    full_date       DATE,
    day_of_month    INT,
    month_number    INT,
    month_name      NVARCHAR(20),
    quarter         INT,
    year            INT,
    week_number     INT,
    is_weekend      BIT
);
GO

CREATE TABLE DimGuest (
    guest_key           INT IDENTITY(1,1) PRIMARY KEY,
    guest_id            INT,
    name                NVARCHAR(200),
    email               NVARCHAR(200),
    phone_number        NVARCHAR(50),
    credit_card         NVARCHAR(50),
    country             CHAR(10),
    -- SCD Type 2 columns
    is_current          BIT DEFAULT 1,
    effective_start     DATE DEFAULT GETDATE(),
    effective_end       DATE DEFAULT '9999-12-31'
);
GO

CREATE TABLE DimHotel (
    hotel_key       INT IDENTITY(1,1) PRIMARY KEY,
    hotel_id        INT,
    hotel_name      NVARCHAR(100),
    hotel_type      NVARCHAR(50)
);
GO

CREATE TABLE DimRoom (
    room_key                INT IDENTITY(1,1) PRIMARY KEY,
    reserved_room_type      VARCHAR(50),
    assigned_room_type      VARCHAR(50),
    meal                    VARCHAR(50)
);
GO

CREATE TABLE DimAgent (
    agent_key               INT IDENTITY(1,1) PRIMARY KEY,
    market_segment          VARCHAR(100),
    distribution_channel    VARCHAR(100),
    deposit_type            VARCHAR(50),
    customer_type           VARCHAR(50)
);
GO
 
DECLARE @StartDate DATE = '2015-01-01';
DECLARE @EndDate   DATE = '2017-12-31';
DECLARE @Current   DATE = @StartDate;

WHILE @Current <= @EndDate
BEGIN
    INSERT INTO DimDate (
        date_key, full_date, day_of_month,
        month_number, month_name, quarter,
        year, week_number, is_weekend
    )
    VALUES (
        CONVERT(INT, FORMAT(@Current, 'yyyyMMdd')),
        @Current,
        DAY(@Current),
        MONTH(@Current),
        DATENAME(MONTH, @Current),
        DATEPART(QUARTER, @Current),
        YEAR(@Current),
        DATEPART(WEEK, @Current),
        CASE WHEN DATEPART(WEEKDAY, @Current) IN (1,7) THEN 1 ELSE 0 END
    );
    SET @Current = DATEADD(DAY, 1, @Current);
END;

SELECT COUNT(*) AS TotalDates FROM DimDate;
SELECT TOP 5 * FROM DimDate ORDER BY date_key;
SELECT TOP 5 * FROM DimDate ORDER BY date_key DESC;
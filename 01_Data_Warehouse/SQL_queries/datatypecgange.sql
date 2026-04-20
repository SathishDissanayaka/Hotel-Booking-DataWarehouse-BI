USE HotelDW_Staging;

ALTER TABLE stg_Booking
ALTER COLUMN hotel VARCHAR(100);

ALTER TABLE stg_Booking
ALTER COLUMN arrival_date_month VARCHAR(20);

ALTER TABLE stg_Booking
ALTER COLUMN meal VARCHAR(50);

ALTER TABLE stg_Booking
ALTER COLUMN market_segment VARCHAR(100);

ALTER TABLE stg_Booking
ALTER COLUMN distribution_channel VARCHAR(100);

ALTER TABLE stg_Booking
ALTER COLUMN reserved_room_type VARCHAR(10);

ALTER TABLE stg_Booking
ALTER COLUMN assigned_room_type VARCHAR(10);

ALTER TABLE stg_Booking
ALTER COLUMN deposit_type VARCHAR(50);

ALTER TABLE stg_Booking
ALTER COLUMN customer_type VARCHAR(50);

ALTER TABLE stg_Booking
ALTER COLUMN reserved_room_type VARCHAR(50);

ALTER TABLE stg_Booking
ALTER COLUMN assigned_room_type VARCHAR(50);


ALTER TABLE stg_Guest
ALTER COLUMN name VARCHAR(50);

ALTER TABLE stg_Guest
ALTER COLUMN email VARCHAR(50);

ALTER TABLE stg_Guest
ALTER COLUMN phone_number VARCHAR(50);

ALTER TABLE stg_Guest
ALTER COLUMN credit_card VARCHAR(50);


ALTER TABLE stg_Guest
ALTER COLUMN country CHAR(50);


ALTER TABLE stg_ReservationStatus
ALTER COLUMN reservation_status NVARCHAR(255);

ALTER TABLE stg_Booking
ALTER COLUMN children VARCHAR(50) NULL;

SELECT * FROM stg_ReservationStatus;
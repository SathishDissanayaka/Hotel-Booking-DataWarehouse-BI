USE HotelDW;


SELECT 'DimDate'    AS TableName, COUNT(*) FROM DimDate;

SELECT 'DimGuest',   COUNT(*) FROM DimGuest;

SELECT 'DimHotel',   COUNT(*) FROM DimHotel;

SELECT 'DimRoom',    COUNT(*) FROM DimRoom;

SELECT 'DimAgent',   COUNT(*) FROM DimAgent;

SELECT 'FactBooking',COUNT(*) FROM FactBooking;


SELECT TOP 5
    f.booking_key,
    f.guest_key,
    f.hotel_key,
    f.room_key,
    f.agent_key,
    f.date_key,
    f.lead_time,
    f.adults,
    f.adr,
    f.reservation_status,
    f.accm_txn_create_time
FROM FactBooking f;


SELECT TOP 5
    f.booking_key,
    h.hotel_name,
    h.hotel_type,
    f.adr,
    f.reservation_status
FROM FactBooking f
JOIN DimHotel h ON f.hotel_key = h.hotel_key;


SELECT TOP 5
    f.booking_key,
    g.name,
    g.email,
    g.country
FROM FactBooking f
JOIN DimGuest g ON f.guest_key = g.guest_key;


SELECT TOP 5
    f.booking_key,
    d.full_date,
    d.month_name,
    d.year
FROM FactBooking f
JOIN DimDate d ON f.date_key = d.date_key;


SELECT 
    SUM(CASE WHEN guest_key IS NULL THEN 1 ELSE 0 END) AS null_guest,
    SUM(CASE WHEN hotel_key IS NULL THEN 1 ELSE 0 END) AS null_hotel,
    SUM(CASE WHEN room_key  IS NULL THEN 1 ELSE 0 END) AS null_room,
    SUM(CASE WHEN agent_key IS NULL THEN 1 ELSE 0 END) AS null_agent,
    SUM(CASE WHEN date_key  IS NULL THEN 1 ELSE 0 END) AS null_date
FROM FactBooking;
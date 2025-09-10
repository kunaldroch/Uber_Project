CREATE DATABASE uber;
USE uber;

# To see all the columns and rows in aug_bookings:
SELECT * FROM aug_bookings;

#1. Retrieve all successfull bookings:
CREATE VIEW Successfull_Bookings AS
SELECT * FROM aug_bookings WHERE Booking_Status = 'SUCCESS';

SELECT * FROM Successfull_Bookings;

#2. Find the average ride distance for each vehicle type:
CREATE VIEW Average_Ride_Distance_For_Each_Vehicle AS
SELECT Vehicle_Type, AVG(Ride_distance_km) AS AVG_Distance
FROM aug_bookings
GROUP BY Vehicle_Type;

SELECT * FROM Average_Ride_Distance_For_Each_Vehicle;

#3. Get the total number of cancelled rides by customers:
CREATE VIEW Total_Number_Of_Cancelled_Rides_By_Customers AS
SELECT COUNT(*) FROM aug_bookings
WHERE Booking_Status = "Cancelled By Customer";

SELECT * FROM Total_Number_Of_Cancelled_Rides_By_Customers; 

#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers_rides AS
SELECT Customer_ID, COUNT(Booking_ID) AS Total_Rides
FROM aug_bookings
GROUP BY Customer_ID
ORDER BY Total_Rides DESC LIMIT 5;

SELECT * FROM Top_5_Customers_rides;

#5.Get the number of rides cancelled by drivers due to personal or car-related issues:
CREATE VIEW rides_cancelled_by_drivers_due_to_personal_or_car_related_issues AS
SELECT COUNT(*) AS total_cancellations
FROM aug_bookings
WHERE Reasons_For_Cancelling_Drivers = 'Personal & Car related issues';

SELECT * FROM rides_cancelled_by_drivers_due_to_personal_or_car_related_issues;

#6.Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_Min_Driver_Rating_Prime_Sedan AS
SELECT MAX(Driver_Ratings) AS MAX_Rating, MIN(Driver_Ratings) AS MIN_Rating FROM aug_bookings 
WHERE Vehicle_Type = "Prime Sedan";

SELECT * FROM Max_Min_Driver_Rating_Prime_Sedan;

#7.Retrieve all rides where payment was made using Online mode:
CREATE VIEW Payment_Mode_Online AS
SELECT * FROM aug_bookings WHERE Payment_Method = "Online";

SELECT * FROM Payment_Mode_Online;

#8.Find the average customer rating per vehicle type:
CREATE VIEW average_customer_rating_per_vehicle_type AS
SELECT Vehicle_Type, AVG(Customer_Ratings) As AVG_Customer_Ratings
FROM aug_bookings GROUP BY Vehicle_Type;

SELECT * FROM average_customer_rating_per_vehicle_type;

#9.Calculate the total Booking_Value of rides completed successfully:
CREATE VIEW Total_Booking_Value_Of_Rides_Completed_Successfully AS
SELECT SUM(Booking_Values) FROM aug_bookings WHERE Booking_Status = "Success";

SELECT * FROM Total_Booking_Value_Of_Rides_Completed_Successfully;

#10.List all incomplete rides with reason:
CREATE VIEW Incomplete_Rides_With_Reason AS
SELECT Incomplete_Rides,Incomplete_Rides_Reason FROM aug_bookings WHERE Incomplete_Rides= "Yes";

SELECT * FROM Incomplete_Rides_With_Reason;
-- Add a whole trip - Inserts to 5 tables

DECLARE
  l_hotels HotelDatesList := HotelDatesList(
    HotelDates(1, TO_DATE('2023-07-01','YYYY-MM-DD'), TO_DATE('2023-07-10','YYYY-MM-DD')),
    HotelDates(2, TO_DATE('2023-07-15','YYYY-MM-DD'), TO_DATE('2023-07-20','YYYY-MM-DD'))
  );
  l_restaurants RestaurantList := RestaurantList(1, 2, 3);
	l_contains DestinationActivitiesList := DestinationActivitiesList(
		DestinationActivity(1,1,TO_DATE('2023-07-15','YYYY-MM-DD')),
		DestinationActivity(1,4,TO_DATE('2023-07-17','YYYY-MM-DD'))
	);
	l_guides GuideList := GuideList(1, 2);
	p_trip_id NUMBER;
BEGIN
  AddTrip(1, 2, 'Summer 33 Vacation', 'Enjoy the summer break', 'trip_image.jpg', TO_DATE('2023-07-01','YYYY-MM-DD'), TO_DATE('2023-07-25','YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);
	
	DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/

-- Update a trip - Updates to 5 tables

DECLARE
  l_hotels HotelDatesList := HotelDatesList(
    HotelDates(3, TO_DATE('2023-07-01','YYYY-MM-DD'), TO_DATE('2023-07-10','YYYY-MM-DD')),
    HotelDates(4, TO_DATE('2023-07-15','YYYY-MM-DD'), TO_DATE('2023-07-20','YYYY-MM-DD'))
  );
  l_restaurants RestaurantList := RestaurantList(1, 2, 3);
	l_contains DestinationActivitiesList := DestinationActivitiesList(
		DestinationActivity(1,1,TO_DATE('2023-07-15','YYYY-MM-DD')),
		DestinationActivity(1,4,TO_DATE('2023-07-17','YYYY-MM-DD'))
	);
	l_guides GuideList := GuideList(1);
BEGIN
  UpdateTrip( 1, 1, 2, 'Summer 33 Vacation', 'Enjoy the summer break', 'trip_image.jpg', TO_DATE('2023-07-01','YYYY-MM-DD'), TO_DATE('2023-07-25','YYYY-MM-DD'), l_contains, l_hotels, l_restaurants, l_guides );
END;
/


-- Calculate Hotel revenue Stats 

SELECT H.HOTEL_ID AS "hotel_id", SUM( H.PRICE_PER_DAY * (R.CHECKOUT_DATE - R.CHECKIN_DATE)) AS "total_revenue",
COUNT(DISTINCT F.USER_ID) AS "favorite_count"
FROM TRIPBOOKINGS TB LEFT OUTER JOIN TRIPS T
ON (TB.TRIP_ID = T.TRIP_ID)
LEFT OUTER JOIN RESIDENCEIN R
ON (T.TRIP_ID = R.TRIP_ID)
LEFT OUTER JOIN HOTELS H 
ON (R.HOTEL_ID = H.HOTEL_ID)
LEFT OUTER JOIN FAVORITES F 
ON (H.HOTEL_ID = F.OBJECT_ID AND F.OBJECT_TYPE = 'hotel')   
GROUP BY H.HOTEL_ID
ORDER BY SUM( H.PRICE_PER_DAY * (R.CHECKOUT_DATE - R.CHECKIN_DATE)) DESC;


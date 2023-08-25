CREATE OR REPLACE FUNCTION CALCULATE_TRIP_PRICE(
    p_contains IN DestinationActivitiesList,
		p_hotels IN HotelDatesList,
		p_restaurants IN RestaurantList
) RETURN NUMBER
AS
    total_price NUMBER := 0;
		temp_price NUMBER := 0;
BEGIN
    -- Calculate the total price for hotels
    FOR i IN 1..p_hotels.COUNT LOOP
		
        SELECT price_per_day INTO temp_price
        FROM Hotels
        WHERE hotel_id = p_hotels(i).hotel_id;

        total_price := total_price + (p_hotels(i).checkout_date - p_hotels(i).checkin_date) * temp_price;
    END LOOP;

    -- Calculate the total price for restaurants
    FOR i IN 1..p_restaurants.COUNT LOOP
        SELECT reservation_price INTO temp_price
        FROM Restaurants
        WHERE restaurant_id = p_restaurants(i);

        total_price := total_price + temp_price;
    END LOOP;

    -- Calculate the total price for activities
    FOR i IN 1..p_contains.COUNT LOOP
		
        SELECT price INTO temp_price
        FROM Provides
        WHERE destination_id = p_contains(i).destination_id
				AND activity_id = p_contains(i).activity_id;

        total_price := total_price + temp_price;
				
    END LOOP;
		
		-- log into ProcedureLog Table 
		
		INSERT INTO ProcedureLog( procedure_name, user_id, parameters )
		VALUES( 'CALCULATE_TRIP_PRICE', 0, 'total_price = ' || TO_CHAR(total_price) );

    RETURN total_price;
		
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/


CREATE OR REPLACE FUNCTION MY_HASH_PASSWORD(
	p_password IN VARCHAR2
) RETURN VARCHAR2 
AS
  hashed_password VARCHAR2(100);
BEGIN
	SELECT TO_CHAR(ORA_HASH(p_password)) INTO hashed_password FROM DUAL;
  RETURN hashed_password;
END;
/

CREATE OR REPLACE FUNCTION CHECK_CREDENTIALS(
  p_username IN VARCHAR2,
  p_password IN VARCHAR2
) RETURN NUMBER
AS
  l_count NUMBER;
BEGIN
  
  SELECT COUNT(*)
  INTO l_count
  FROM USERS
  WHERE username = p_username AND password_hash = MY_HASH_PASSWORD(p_password);

  RETURN CASE WHEN l_count > 0 THEN 1 ELSE 0 END;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
END;
/

CREATE OR REPLACE FUNCTION GET_RATING_COUNT(object_type IN VARCHAR2, object_id IN NUMBER, STARS NUMBER)
RETURN NUMBER IS
	
	COUNTER NUMBER;
	
BEGIN 
	
	IF lower(object_type) = 'hotel' THEN 
	
		SELECT COUNT(*) INTO COUNTER
		FROM REVIEWS R JOIN HOTELREVIEWS H
		ON (R.REVIEW_ID = H.REVIEW_ID)
		WHERE HOTEL_ID = object_id
		AND R.RATING = STARS;
	
	ELSIF lower(object_type) = 'restaurant' THEN 
	
		SELECT COUNT(*) INTO COUNTER
		FROM REVIEWS R JOIN RESTAURANTREVIEWS R2
		ON (R.REVIEW_ID = R2.REVIEW_ID)
		WHERE R2.RESTAURANT_ID = object_id
		AND R.RATING = STARS;
	
	ELSIF lower(object_type) = 'trip' THEN 
	
		SELECT COUNT(*) INTO COUNTER
		FROM REVIEWS R JOIN TRIPREVIEWS T
		ON (R.REVIEW_ID = T.REVIEW_ID)
		WHERE T.TRIP_ID = object_id
		AND R.RATING = STARS;
	
	END IF;
	
	RETURN COUNTER;
	
	
END;
/

/*

DECLARE 
	
	COUNTER NUMBER;
	
BEGIN 
	
	COUNTER := GET_RATING_COUNT('trip',10,3);
	DBMS_OUTPUT.PUT_LINE(COUNTER);
	
END;
/

*/

CREATE OR REPLACE FUNCTION GET_AVG_RATING(object_type IN VARCHAR2, object_id IN NUMBER)
RETURN NUMBER IS
	
	COUNTER NUMBER;
	
BEGIN 
	
	IF lower(object_type) = 'hotel' THEN 
	
		SELECT AVG(R.RATING) INTO COUNTER
		FROM REVIEWS R JOIN HOTELREVIEWS H
		ON (R.REVIEW_ID = H.REVIEW_ID)
		WHERE HOTEL_ID = object_id;
	
	ELSIF lower(object_type) = 'restaurant' THEN 
	
		SELECT AVG(R.RATING) INTO COUNTER
		FROM REVIEWS R JOIN RESTAURANTREVIEWS R2
		ON (R.REVIEW_ID = R2.REVIEW_ID)
		WHERE R2.RESTAURANT_ID = object_id;
	
	ELSIF lower(object_type) = 'trip' THEN 
	
		SELECT AVG(R.RATING) INTO COUNTER
		FROM REVIEWS R JOIN TRIPREVIEWS T
		ON (R.REVIEW_ID = T.REVIEW_ID)
		WHERE T.TRIP_ID = object_id;
	
	END IF;
	
	IF COUNTER IS NULL THEN
	
		COUNTER := 2.5;     -- DEFAULT RATING
	
	END IF;
	
	RETURN ROUND(COUNTER,2);
	
	
END;
/







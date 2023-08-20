
--- Drop all Tables , Caution...

CREATE OR REPLACE PROCEDURE DropAllTables AS
		COUNTER NUMBER;
BEGIN
		COUNTER := 0;
		DBMS_OUTPUT.PUT_LINE('CAUTION !!! All tables are being deleted...');
    FOR t IN (SELECT table_name FROM all_tables WHERE owner = 'C##TRIPIFY') LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS';
				DBMS_OUTPUT.PUT_LINE('Table ' || t.table_name || ' dropped.');
				COUNTER := COUNTER + 1;
    END LOOP;
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(COUNTER) || ' tables successfully deleted...');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: Unable to drop all tables');
END;
/

--- Drop all sequences, Caution...

CREATE OR REPLACE PROCEDURE DropAllSequences AS
		COUNTER NUMBER;
BEGIN
		COUNTER := 0;
		DBMS_OUTPUT.PUT_LINE('CAUTION !!! All sequences are being deleted...');
    FOR seq IN (SELECT sequence_name FROM all_sequences WHERE sequence_owner = 'C##TRIPIFY') 
		LOOP
        EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'C##TRIPIFY' || '.' || seq.sequence_name;
        DBMS_OUTPUT.PUT_LINE('Sequence ' || seq.sequence_name || ' dropped.');
				COUNTER := COUNTER + 1;
    END LOOP;
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(COUNTER) || ' sequences successfully deleted...');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: Unable to drop all sequences');
END;
/

--- Add a whole Trip to the database, inserts to 4 tables

--- DROP PROCEDURE AddTrip;

CREATE OR REPLACE PROCEDURE AddTrip(
  p_from_city_id IN NUMBER,
  p_to_city_id IN NUMBER,
  p_name IN VARCHAR2,
  p_description IN VARCHAR2,
  p_image_url IN VARCHAR2,
  p_start_date IN DATE,
  p_end_date IN DATE,
	p_creator_user_id IN NUMBER,
	p_contains IN DestinationActivitiesList,
  p_hotels IN HotelDatesList,
  p_restaurants IN RestaurantList,
	p_guides IN GuideList,
	p_trip_id OUT NUMBER
) AS
  l_trip_id NUMBER;
	l_total_price NUMBER;
BEGIN
	-- calculate the total price first 
	l_total_price := CALCULATE_TRIP_PRICE(p_contains, p_hotels, p_restaurants);
  -- Insert into Trips table
  INSERT INTO Trips (from_city_id, to_city_id, name, description, image_url, total_price, start_date, end_date, creator_user_id)
  VALUES (p_from_city_id, p_to_city_id, p_name, p_description, p_image_url, l_total_price, p_start_date, p_end_date, p_creator_user_id)
  RETURNING trip_id INTO p_trip_id;
	
	l_trip_id := p_trip_id;
	
	-- Insert into Contains table for each destination and activity in the list
  FOR i IN 1..p_contains.COUNT LOOP
    INSERT INTO Contains (trip_id, destination_id, activity_id, tentative_date)
		VALUES (l_trip_id, p_contains(i).destination_id, p_contains(i).activity_id, p_contains(i).tentative_date);
  END LOOP;

  -- Insert into ResidenceIn table for each hotel in the list
  FOR i IN 1..p_hotels.COUNT LOOP
    INSERT INTO ResidenceIn (trip_id, hotel_id, checkin_date, checkout_date)
    VALUES (l_trip_id, p_hotels(i).hotel_id, p_hotels(i).checkin_date, p_hotels(i).checkout_date);
  END LOOP;

  -- Insert into MealsIn table for each restaurant in the list
  FOR i IN 1..p_restaurants.COUNT LOOP
    INSERT INTO MealsIn (trip_id, restaurant_id)
    VALUES (l_trip_id, p_restaurants(i));
  END LOOP;
	
	FOR i IN 1..p_guides.COUNT LOOP
    INSERT INTO TripGuides (trip_id, guide_id)
    VALUES (l_trip_id, p_guides(i));
  END LOOP;
	
	-- log into ProcedureLog Table
	INSERT INTO ProcedureLog( procedure_name, user_id, parameters )
	VALUES( 'AddTrip', p_creator_user_id, 'trip_id = ' || p_trip_id || ', name = ' || p_name );

  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
/

CREATE OR REPLACE PROCEDURE UpdateTrip(
  p_trip_id IN NUMBER,
  p_from_city_id IN NUMBER,
  p_to_city_id IN NUMBER,
  p_name IN VARCHAR2,
  p_description IN VARCHAR2,
  p_image_url IN VARCHAR2,
  p_start_date IN DATE,
  p_end_date IN DATE,
  p_contains IN DestinationActivitiesList,
  p_hotels IN HotelDatesList,
  p_restaurants IN RestaurantList,
  p_guides IN GuideList
) AS
	l_creator_user_id NUMBER;
  l_total_price NUMBER;
BEGIN
  -- calculate the total price first 
  l_total_price := CALCULATE_TRIP_PRICE(p_contains, p_hotels, p_restaurants);

  -- Update the Trips table
  UPDATE Trips
  SET from_city_id = p_from_city_id,
      to_city_id = p_to_city_id,
      name = p_name,
      description = p_description,
      image_url = p_image_url,
      total_price = l_total_price,
      start_date = p_start_date,
      end_date = p_end_date
  WHERE trip_id = p_trip_id;

  -- Delete existing data from Contains, ResidenceIn, MealsIn, and TripGuides tables for this trip
  DELETE FROM Contains WHERE trip_id = p_trip_id;
  DELETE FROM ResidenceIn WHERE trip_id = p_trip_id;
  DELETE FROM MealsIn WHERE trip_id = p_trip_id;
  DELETE FROM TripGuides WHERE trip_id = p_trip_id;

  -- Insert into Contains table for each destination and activity in the list
  FOR i IN 1..p_contains.COUNT LOOP
    INSERT INTO Contains (trip_id, destination_id, activity_id, tentative_date)
    VALUES (p_trip_id, p_contains(i).destination_id, p_contains(i).activity_id, p_contains(i).tentative_date);
  END LOOP;

  -- Insert into ResidenceIn table for each hotel in the list
  FOR i IN 1..p_hotels.COUNT LOOP
    INSERT INTO ResidenceIn (trip_id, hotel_id, checkin_date, checkout_date)
    VALUES (p_trip_id, p_hotels(i).hotel_id, p_hotels(i).checkin_date, p_hotels(i).checkout_date);
  END LOOP;

  -- Insert into MealsIn table for each restaurant in the list
  FOR i IN 1..p_restaurants.COUNT LOOP
    INSERT INTO MealsIn (trip_id, restaurant_id)
    VALUES (p_trip_id, p_restaurants(i));
  END LOOP;

  -- Insert into TripGuides table for each guide in the list
  FOR i IN 1..p_guides.COUNT LOOP
    INSERT INTO TripGuides (trip_id, guide_id)
    VALUES (p_trip_id, p_guides(i));
  END LOOP;
	
	-- log into ProcedureLog Table
	-- first fetch the creator_user_id 
	SELECT creator_user_id INTO l_creator_user_id
	FROM TRIPS 
	WHERE trip_id = p_trip_id;
	-- now insert 
	
	INSERT INTO ProcedureLog( procedure_name, user_id, parameters )
	VALUES( 'UpdateTrip', l_creator_user_id, 'trip_id = ' || p_trip_id || ', name = ' || p_name );

  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
/


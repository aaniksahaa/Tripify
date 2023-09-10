CREATE OR REPLACE TRIGGER favorites_check_trigger
BEFORE INSERT OR UPDATE ON Favorites
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
		v_count := 0;
    IF :NEW.object_type = 'destination' THEN
        SELECT COUNT(*) INTO v_count
        FROM Destinations
        WHERE destination_id = :NEW.object_id;
    ELSIF :NEW.object_type = 'activity' THEN
        SELECT COUNT(*) INTO v_count
        FROM Activities
        WHERE activity_id = :NEW.object_id;
    ELSIF :NEW.object_type = 'hotel' THEN
        SELECT COUNT(*) INTO v_count 
				FROM Hotels
        WHERE hotel_id = :NEW.object_id;
    ELSIF :NEW.object_type = 'restaurant' THEN
        SELECT COUNT(*) INTO v_count
        FROM Restaurants
        WHERE restaurant_id = :NEW.object_id;
    ELSIF :NEW.object_type = 'trip' THEN
        SELECT COUNT(*) INTO v_count
        FROM Trips
        WHERE trip_id = :NEW.object_id;
    ELSIF :NEW.object_type = 'city' THEN
        SELECT COUNT(*) INTO v_count
        FROM Cities
        WHERE city_id = :NEW.object_id;
    ELSIF :NEW.object_type = 'flight' THEN
        SELECT COUNT(*) INTO v_count
        FROM Flights
        WHERE flight_id = :NEW.object_id;
    END IF;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid object_id or object_type');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER NOTIFY_BOOKING
AFTER UPDATE
OF IS_PAID, IS_PROCESSED
ON TRIPBOOKINGS
FOR EACH ROW
DECLARE 
	
	TNAME VARCHAR2(100);
	
BEGIN 

	SELECT NAME INTO TNAME
	FROM TRIPS
	WHERE TRIP_ID = :NEW.TRIP_ID;
	
	IF :OLD.IS_PAID = 0 AND :NEW.IS_PAID = 1 THEN 
	
		INSERT INTO Notifications (user_id, text)
		VALUES (:NEW.USER_ID, 'Your Payment for the trip ' || TNAME || ' has been successful! Please wait for processing');
		
	ELSIF :OLD.IS_PROCESSED = 0 AND :NEW.IS_PROCESSED = 1 THEN
	
		INSERT INTO Notifications (user_id, text)
		VALUES (:NEW.USER_ID, 'Your trip ' || TNAME || ' has been processed successfully! Now you are ready to go !');
		
	END IF;
	
END;
/

CREATE OR REPLACE TRIGGER NOTIFY_FOLLOW
AFTER UPDATE OR INSERT
ON FOLLOWS
FOR EACH ROW
DECLARE 
	
	FOLLOWER_NAME VARCHAR2(100);
	
BEGIN 

	SELECT NAME INTO FOLLOWER_NAME
	FROM USERS
	WHERE USER_ID = :NEW.FOLLOWER_ID;
	
	INSERT INTO NOTIFICATIONS(USER_ID,TEXT)
	VALUES(:NEW.FOLLOWEE_ID, FOLLOWER_NAME || ' started following you!');
	
END;
/

CREATE OR REPLACE TRIGGER NOTIFY_COMMENT
AFTER INSERT
ON COMMENTS
FOR EACH ROW
DECLARE 
	
	COMMENTER_NAME VARCHAR2(100);
	POST_OWNER_ID NUMBER;
	
BEGIN 

	SELECT USER_ID INTO POST_OWNER_ID
	FROM POSTS
	WHERE POST_ID = :NEW.POST_ID;

	SELECT NAME INTO COMMENTER_NAME
	FROM USERS
	WHERE USER_ID = :NEW.USER_ID;
	
	INSERT INTO NOTIFICATIONS(USER_ID,TEXT)
	VALUES(POST_OWNER_ID, COMMENTER_NAME || ' commented on your post - ' || :NEW.TEXT);
	
	
END;
/

CREATE OR REPLACE TRIGGER NOTIFY_REACT
AFTER INSERT
ON REACTS
FOR EACH ROW
DECLARE 
	
	REACTOR_NAME VARCHAR2(100);
	POST_OWNER_ID NUMBER;
	
BEGIN 

	SELECT USER_ID INTO POST_OWNER_ID
	FROM POSTS
	WHERE POST_ID = :NEW.POST_ID;

	SELECT NAME INTO REACTOR_NAME
	FROM USERS
	WHERE USER_ID = :NEW.USER_ID;
	
	INSERT INTO NOTIFICATIONS(USER_ID,TEXT)
	VALUES(POST_OWNER_ID, REACTOR_NAME || ' reacted to your post - ');
	
END;
/

-- DROP TRIGGER NOTIFY_BOOKING;
-- DROP TRIGGER NOTIFY_FOLLOW;
-- DROP TRIGGER NOTIFY_COMMENT;
-- DROP TRIGGER NOTIFY_REACT;

CREATE OR REPLACE TRIGGER HOTEL_UPD
AFTER UPDATE
ON HOTELS
FOR EACH ROW
DECLARE 
	
	
	
BEGIN 
	
	
	INSERT INTO ProcedureLog( procedure_name, user_id, parameters )
VALUES( 'Hotel Updated', 0, 'hotel_id = ' || :NEW.HOTEL_ID || ', hotel name = ' || :NEW.NAME );
	
	
END;
/


CREATE OR REPLACE TRIGGER RESTAURANT_UPD
AFTER UPDATE
ON RESTAURANTS
FOR EACH ROW
DECLARE 
	
	
	
BEGIN 
	
	
	INSERT INTO ProcedureLog( procedure_name, user_id, parameters )
VALUES( 'Restaurant Updated', 0, 'restaurant_id = ' || :NEW.RESTAURANT_ID || ', restaurant name = ' || :NEW.NAME );
	
	
END;
/




CREATE OR REPLACE TRIGGER DESTINATION_UPD
AFTER UPDATE
ON DESTINATIONS
FOR EACH ROW
DECLARE 
	
	
	
BEGIN 
	
	
	INSERT INTO ProcedureLog( procedure_name, user_id, parameters )
VALUES( 'Destination Updated', 0, 'destination_id = ' || :NEW.DESTINATION_ID || ', destination name = ' || :NEW.NAME );
	
	
END;
/


CREATE OR REPLACE TRIGGER ACTIVITY_UPD
AFTER UPDATE
ON ACTIVITIES
FOR EACH ROW
DECLARE 
	
	
	
BEGIN 
	
	
	INSERT INTO ProcedureLog( procedure_name, user_id, parameters )
VALUES( 'Activity Updated', 0, 'activity_id = ' || :NEW.ACTIVITY_ID || ', activity name = ' || :NEW.NAME );
	
	
END;
/











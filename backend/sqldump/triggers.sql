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


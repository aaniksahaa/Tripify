CREATE OR REPLACE TYPE DestinationActivity AS OBJECT (
	destination_id NUMBER,
	activity_id NUMBER,
	tentative_date DATE
);
/

CREATE OR REPLACE TYPE DestinationActivitiesList AS TABLE OF DestinationActivity;
/

CREATE OR REPLACE TYPE HotelDates AS OBJECT (
  hotel_id NUMBER,
  checkin_date DATE,
  checkout_date DATE
);
/

CREATE OR REPLACE TYPE HotelDatesList AS TABLE OF HotelDates;
/

CREATE OR REPLACE TYPE RestaurantList AS TABLE OF NUMBER;
/

CREATE OR REPLACE TYPE GuideList AS TABLE OF NUMBER;
/

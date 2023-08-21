/*
 Navicat Premium Data Transfer

 Source Server         : tripify_backend
 Source Server Type    : Oracle
 Source Server Version : 210000 (Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production)
 Source Host           : 0.0.0.0:1521
 Source Schema         : C##TRIPIFY

 Target Server Type    : Oracle
 Target Server Version : 210000 (Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production)
 File Encoding         : 65001

 Date: 22/08/2023 00:34:01
*/


-- ----------------------------
-- Table structure for ACTIVITIES
-- ----------------------------
DROP TABLE "C##TRIPIFY"."ACTIVITIES";
CREATE TABLE "C##TRIPIFY"."ACTIVITIES" (
  "ACTIVITY_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."ACTIVITY_SEQ"."NEXTVAL" NOT NULL,
  "NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "CATEGORY" VARCHAR2(50 BYTE) VISIBLE,
  "DESCRIPTION" VARCHAR2(1000 BYTE) VISIBLE,
  "IMAGE_URL" VARCHAR2(200 BYTE) VISIBLE,
  "MIN_AGE" NUMBER VISIBLE,
  "MAX_AGE" NUMBER VISIBLE,
  "CREATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "LAST_UPDATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "CREATOR_USER_ID" NUMBER VISIBLE DEFAULT 0
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of ACTIVITIES
-- ----------------------------
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('1', 'Boat Tour', 'Adventure', 'Experience the breathtaking beauty of a boat tour in a mangrove forest.', 'boat_tour.jpg', '8', '60', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('2', 'Hiking', 'Adventure', 'Embark on a thrilling hiking adventure amidst picturesque hills.', 'hiking.jpg', '12', '55', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('3', 'Snorkeling', 'Adventure', 'Discover the underwater world and vibrant marine life through snorkeling.', 'snorkeling.jpg', '10', '50', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('4', 'Cultural Tour', 'Culture', 'Immerse in the local culture and traditions with a guided cultural tour.', 'cultural_tour.jpg', '15', '65', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('5', 'Historical Sites Visit', 'Culture', 'Explore ancient historical sites and learn about their rich history.', 'historical_sites.jpg', '12', '70', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('6', 'Wildlife Safari', 'Adventure', 'Embark on a thrilling wildlife safari and spot exotic animals.', 'wildlife_safari.jpg', '18', '60', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('7', 'Nature Walks', 'Adventure', 'Take peaceful walks in nature and enjoy the tranquility it offers.', 'nature_walks.jpg', '8', '65', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('8', 'Beach Relaxation', 'Relaxation', 'Relax and unwind on the beautiful sandy beaches with crystal clear waters.', 'beach_relaxation.jpg', '5', '75', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('9', 'Water Sports', 'Adventure', 'Indulge in various water sports activities like jet skiing, parasailing, and more.', 'water_sports.jpg', '16', '55', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('10', 'Sunset Cruise', 'Adventure', 'Enjoy the mesmerizing view of the sunset while on a cruise.', 'sunset_cruise.jpg', '10', '60', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('11', 'Local Food Tasting', 'Cuisine', 'Taste a variety of delicious local dishes and savor the flavors.', 'local_food_tasting.jpg', '12', '70', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('12', 'Fishing Adventure', 'Adventure', 'Go on a fishing expedition and test your angling skills.', 'fishing_adventure.jpg', '10', '65', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('13', 'Art and Craft Workshop', 'Culture', 'Participate in traditional art and craft workshops and create unique souvenirs.', 'art_craft_workshop.jpg', '8', '75', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('14', 'Mountain Biking', 'Adventure', 'Explore the rugged terrains on a mountain biking adventure.', 'mountain_biking.jpg', '18', '50', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('15', 'Yoga Retreat', 'Relaxation', 'Rejuvenate your mind and body with a peaceful yoga retreat.', 'yoga_retreat.jpg', '20', '70', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('16', 'Hot Air Balloon Ride', 'Adventure', 'Experience the thrill of a hot air balloon ride with stunning aerial views.', 'hot_air_balloon_ride.jpg', '12', '60', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('17', 'Local Market Shopping', 'Cuisine', 'Explore the vibrant local markets and shop for unique handicrafts.', 'local_market_shopping.jpg', '8', '80', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('18', 'Volunteer and Community Service', 'Culture', 'Contribute to the community by participating in volunteer activities.', 'volunteer_community_service.jpg', '18', '65', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('19', 'Kayaking Adventure', 'Adventure', 'Paddle through the adventurous waters on a kayaking expedition.', 'kayaking_adventure.jpg', '14', '60', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('20', 'Scuba Diving', 'Adventure', 'Dive into the ocean depths and explore the wonders of marine life.', 'scuba_diving.jpg', '16', '55', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('21', 'Camping', 'Adventure', 'Experience the thrill of camping under the starry night sky.', 'camping.jpg', '12', '60', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('22', 'Cycling Tour', 'Adventure', 'Take a cycling tour and enjoy the scenic beauty at a leisurely pace.', 'cycling_tour.jpg', '16', '65', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('23', 'Underwater Exploration', 'Adventure', 'Dive into the mesmerizing underwater world and explore the vibrant marine life.', 'underwater_exploration.jpg', '18', '50', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('24', 'Photography Tour', 'Adventure', 'Capture the scenic beauty of the destination on a photography tour.', 'photography_tour.jpg', '18', '70', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('25', 'River Rafting', 'Adventure', 'Challenge the rapids of the river with an exciting rafting adventure.', 'river_rafting.jpg', '18', '50', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('26', 'Cooking Classes', 'Cuisine', 'Learn to cook the local dishes from expert chefs in cooking classes.', 'cooking_classes.jpg', '12', '65', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('27', 'Helicopter Tour', 'Adventure', 'Get a birds eye view of the destination with an exciting helicopter tour.', 'helicopter_tour.jpg', '10', '70', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('28', 'Sailing Adventure', 'Adventure', 'Embark on a sailing adventure and explore the coastline from the sea.', 'sailing_adventure.jpg', '16', '60', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('29', 'Educational Visit to Museum', 'Education', 'Discover the art, history, and culture of the region in museums.', 'museum_visits.jpg', '8', '80', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('30', 'Paragliding', 'Adventure', 'Experience the thrill of paragliding with an experienced pilot.', 'paragliding.jpg', '16', '55', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('31', 'Fruit Picking', 'Cuisine', 'Enjoy the fun of picking fresh fruits and tasting them at orchards.', 'fruit_picking.jpg', '5', '75', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('32', 'Zip Lining', 'Adventure', 'Feel the adrenaline rush with an exciting zip-lining adventure.', 'zip_lining.jpg', '12', '60', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('33', 'Gardens and Parks', 'Adventure', 'Relax and take a leisurely stroll in beautiful gardens and parks.', 'gardens_parks.jpg', '5', '80', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('34', 'Cave Exploration', 'Adventure', 'Explore the mysterious caves and marvel at their natural beauty.', 'cave_exploration.jpg', '14', '70', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('35', 'Bird Watching', 'Adventure', 'Observe and identify various bird species in their natural habitats.', 'bird_watching.jpg', '10', '75', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('36', 'Local Music and Dance', 'Culture', 'Experience the local music and dance performances showcasing traditions.', 'local_music_dance.jpg', '8', '70', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('37', 'Safaris', 'Adventure', 'Embark on thrilling safaris and encounter the diverse wildlife.', 'safaris.jpg', '18', '60', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('38', 'Festivals and Events', 'Culture', 'Participate in vibrant festivals and events celebrating local traditions.', 'festivals_events.jpg', '12', '70', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('39', 'Rock Climbing', 'Adventure', 'Conquer the rocks and cliffs with the thrill of rock climbing.', 'rock_climbing.jpg', '16', '50', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('40', 'Spa and Wellness', 'Relaxation', 'Pamper yourself with rejuvenating spa treatments and wellness therapies.', 'spa_wellness.jpg', '18', '70', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('41', 'Desert Adventure', 'Adventure', 'Experience the desert life and go on thrilling desert safaris.', 'desert_adventure.jpg', '10', '60', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('42', 'Pottery Classes', 'Culture', 'Learn the traditional art of pottery-making from skilled artisans.', 'pottery_classes.jpg', '12', '75', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('43', 'Sightseeing Tours', 'Adventure', 'Explore the famous landmarks and attractions on sightseeing tours.', 'sightseeing_tours.jpg', '8', '80', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('44', 'Cultural Workshops', 'Culture', 'Engage in interactive cultural workshops and learn traditional skills.', 'cultural_workshops.jpg', '10', '70', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('45', 'Jet Skiing', 'Adventure', 'Feel the rush of adrenaline with an exciting jet skiing adventure.', 'jet_skiing.jpg', '16', '55', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('46', 'Gastronomic Tour', 'Cuisine', 'Embark on a gastronomic tour and indulge in a variety of local cuisines.', 'gastronomic_tour.jpg', '12', '70', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('47', 'Archaeological Excavation', 'Culture', 'Participate in archaeological digs and uncover ancient artifacts.', 'archaeological_excavation.jpg', '18', '65', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('48', 'Forest Trek', 'Adventure', 'Embark on a trekking expedition through lush forests and diverse wildlife.', 'forest_trek.jpg', '14', '60', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('49', 'Cultural Performances', 'Culture', 'Witness captivating cultural performances showcasing local traditions.', 'cultural_performances.jpg', '8', '70', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."ACTIVITIES" VALUES ('50', 'Hot Spring Baths', 'Relaxation', 'Relax in natural hot spring baths and experience the healing properties.', 'hot_spring_baths.jpg', '10', '75', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');

-- ----------------------------
-- Table structure for CITIES
-- ----------------------------
DROP TABLE "C##TRIPIFY"."CITIES";
CREATE TABLE "C##TRIPIFY"."CITIES" (
  "CITY_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."CITY_SEQ"."NEXTVAL" NOT NULL,
  "NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "COUNTRY_NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "POPULATION" NUMBER VISIBLE,
  "WEATHER_TYPE" VARCHAR2(50 BYTE) VISIBLE,
  "CREATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "LAST_UPDATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of CITIES
-- ----------------------------
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('0', 'Dummy', 'Dummy', '0', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('1', 'Dhaka', 'Bangladesh', '168957745', 'rainy', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('2', 'Chittagong', 'Bangladesh', '28607074', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('3', 'Khulna', 'Bangladesh', '15563000', 'rainy', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('4', 'Rajshahi', 'Bangladesh', '9536714', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('5', 'Comilla', 'Bangladesh', '22142000', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('6', 'Mymensingh', 'Bangladesh', '22058771', 'cold', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('7', 'Rangpur', 'Bangladesh', '2901390', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('8', 'Sylhet', 'Bangladesh', '3482659', 'rainy', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('9', 'Barisal', 'Bangladesh', '3393084', 'rainy', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('10', 'Narayanganj', 'Bangladesh', '2200000', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('11', 'Gazipur', 'Bangladesh', '1997510', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('12', 'Narsingdi', 'Bangladesh', '705768', 'rainy', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('13', 'Bogra', 'Bangladesh', '791382', 'cold', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('14', 'Pabna', 'Bangladesh', '389918', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('15', 'Bandarban', 'Bangladesh', '275265', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('16', 'Jessore', 'Bangladesh', '237478', 'rainy', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('17', 'Dinajpur', 'Bangladesh', '204874', 'cold', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('18', 'Naogaon', 'Bangladesh', '151398', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('19', 'Tangail', 'Bangladesh', '160937', 'rainy', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('20', 'Netrokona', 'Bangladesh', '229752', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('21', 'Noakhali', 'Bangladesh', '160242', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('22', 'Narsingdi', 'Bangladesh', '705768', 'cold', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('23', 'Faridpur', 'Bangladesh', '114277', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('24', 'Bandarban', 'Bangladesh', '126379', 'rainy', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('25', 'Bhola', 'Bangladesh', '183113', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('26', 'Manikganj', 'Bangladesh', '160093', 'rainy', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('27', 'Coxs Bazar', 'Bangladesh', '249000', 'sunny', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('28', 'Rangamati', 'Bangladesh', '3482659', 'cold', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('29', 'Tangail', 'Bangladesh', '160937', 'rainy', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CITIES" VALUES ('30', 'Chandpur', 'Bangladesh', '115000', 'rainy', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for COMMENTS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."COMMENTS";
CREATE TABLE "C##TRIPIFY"."COMMENTS" (
  "COMMENT_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."COMMENT_SEQ"."NEXTVAL" NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "POST_ID" NUMBER VISIBLE NOT NULL,
  "COMMENTING_DATE" DATE VISIBLE DEFAULT CURRENT_DATE,
  "TEXT" VARCHAR2(1000 BYTE) VISIBLE,
  "UPVOTE_COUNT" NUMBER VISIBLE DEFAULT 0
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of COMMENTS
-- ----------------------------

-- ----------------------------
-- Table structure for CONNECTS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."CONNECTS";
CREATE TABLE "C##TRIPIFY"."CONNECTS" (
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "GROUP_ID" NUMBER VISIBLE NOT NULL,
  "CONNECTED_AT" DATE VISIBLE DEFAULT CURRENT_DATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of CONNECTS
-- ----------------------------

-- ----------------------------
-- Table structure for CONTAINS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."CONTAINS";
CREATE TABLE "C##TRIPIFY"."CONTAINS" (
  "TRIP_ID" NUMBER VISIBLE NOT NULL,
  "DESTINATION_ID" NUMBER VISIBLE NOT NULL,
  "ACTIVITY_ID" NUMBER VISIBLE NOT NULL,
  "TENTATIVE_DATE" DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of CONTAINS
-- ----------------------------
INSERT INTO "C##TRIPIFY"."CONTAINS" VALUES ('1', '1', '1', TO_DATE('2023-07-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CONTAINS" VALUES ('1', '1', '4', TO_DATE('2023-07-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CONTAINS" VALUES ('2', '2', '8', TO_DATE('2023-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CONTAINS" VALUES ('2', '2', '9', TO_DATE('2023-08-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CONTAINS" VALUES ('3', '3', '3', TO_DATE('2023-09-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."CONTAINS" VALUES ('3', '3', '7', TO_DATE('2023-09-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for DESTINATIONS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."DESTINATIONS";
CREATE TABLE "C##TRIPIFY"."DESTINATIONS" (
  "DESTINATION_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."DESTINATION_SEQ"."NEXTVAL" NOT NULL,
  "NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "ADDRESS" VARCHAR2(200 BYTE) VISIBLE,
  "CITY_ID" NUMBER VISIBLE NOT NULL,
  "LATITUDE" NUMBER(8,4) VISIBLE,
  "LONGITUDE" NUMBER(8,4) VISIBLE,
  "DESCRIPTION" VARCHAR2(1000 BYTE) VISIBLE,
  "IMAGE_URL" VARCHAR2(200 BYTE) VISIBLE,
  "CREATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "LAST_UPDATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "CREATOR_USER_ID" NUMBER VISIBLE DEFAULT 0
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of DESTINATIONS
-- ----------------------------
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('1', 'Ahsan Manzil', 'Bangsha Road, Old Dhaka', '1', '23.7104', '90.4074', 'Ahsan Manzil, also known as Pink Palace, is a historic mansion and museum in Dhaka.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('2', 'Coxs Bazar', 'Coxs Bazar, Chittagong', '2', '21.4272', '92.0058', 'Coxs Bazar is the longest sea beach in the world, located in southeastern Bangladesh.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('3', 'Sundarbans Mangrove Forest', 'Sundarbans, Khulna', '3', '21.9497', '89.1833', 'The Sundarbans is the largest mangrove forest and a UNESCO World Heritage Site.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('4', 'Srimangal', 'Srimangal, Sylhet', '8', '24.3133', '91.7258', 'Srimangal is known as the Tea Capital of Bangladesh and offers beautiful tea gardens.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('5', 'Saint Martins Island', 'Saint Martins Island, Coxs Bazar', '2', '20.5951', '92.3186', 'Saint Martins Island is a popular tourist destination known for its pristine beaches.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('6', 'Sajek Valley', 'Sajek Valley, Rangamati', '28', '23.3999', '92.2932', 'Sajek Valley is a picturesque hill station with breathtaking views of the hills and clouds.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('7', 'Lalbagh Fort', 'Lalbagh, Old Dhaka', '1', '23.7162', '90.4071', 'Lalbagh Fort is a Mughal fort complex with historical significance in Dhaka.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('8', 'Kuakata', 'Kuakata, Patuakhali', '9', '21.8333', '90.1167', 'Kuakata is known for its beautiful beach and stunning views of both sunrise and sunset.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('9', 'Ratargul Swamp Forest', 'Ratargul, Sylhet', '8', '24.3821', '90.9055', 'Ratargul Swamp Forest is a freshwater swamp forest and a great place for nature lovers.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('10', 'Jaflong', 'Jaflong, Sylhet', '8', '25.1473', '92.2659', 'Jaflong is famous for its tea gardens, hills, and the Dawki River with crystal-clear water.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('11', 'Rangamati Hill Tracts', 'Rangamati, Chittagong Hill Tracts', '28', '22.6503', '92.1645', 'Rangamati is a scenic hill district with beautiful lakes and tribal cultural diversity.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('12', 'Jamuna Future Park', 'Kuril, Dhaka', '1', '23.8166', '90.4232', 'Jamuna Future Park is the largest shopping mall in South Asia, located in Dhaka.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('13', 'Lalbagh Kella Mosque', 'Lalbagh, Old Dhaka', '1', '23.7176', '90.4041', 'Lalbagh Kella Mosque is an ancient mosque within the premises of Lalbagh Fort.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('14', 'Sagor Dighi', 'Rajshahi City', '4', '24.3668', '88.6091', 'Sagor Dighi is a large pond in Rajshahi city known for its historical significance.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('15', 'Ruposhi Bangla Hotel', 'Shahbagh, Dhaka', '1', '23.7345', '90.3918', 'Ruposhi Bangla Hotel is a renowned five-star hotel in the heart of Dhaka city.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('16', 'Rangpur Museum', 'Rangpur City', '7', '25.7555', '89.2445', 'Rangpur Museum is a museum with historical artifacts and cultural displays.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('17', 'Bangabandhu Sheikh Mujibur Rahman Novo Theatre', 'Shahbagh, Dhaka', '1', '23.7379', '90.3903', 'Novo Theatre is a planetarium and science museum dedicated to Bangabandhu Sheikh Mujibur Rahman.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('18', 'Shah Amanat Bridge', 'Chittagong City', '2', '22.3077', '91.8125', 'Shah Amanat Bridge is a landmark bridge over the Karnaphuli River in Chittagong.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('19', 'Coxs Bazar Marine Aquarium', 'Coxs Bazar, Chittagong', '2', '21.432', '92.0141', 'Coxs Bazar Marine Aquarium is an aquarium showcasing marine life and biodiversity.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('20', 'Sundarbans Tiger Reserve', 'Sundarbans, Khulna', '3', '21.9495', '88.9051', 'The Sundarbans Tiger Reserve is a protected area for the critically endangered Bengal tiger.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('21', 'Inani Beach', 'Coxs Bazar, Chittagong', '2', '21.4225', '92.0093', 'Inani Beach is one of the most popular and longest sea beaches in the world.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('22', 'Kaptai Lake', 'Kaptai, Rangamati', '28', '22.73', '92.2189', 'Kaptai Lake is the largest man-made lake in Bangladesh and offers scenic boat trips.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('23', 'Shalban Vihara', 'Mainamati, Comilla', '5', '23.4642', '91.1155', 'Shalban Vihara is an ancient archaeological site with Buddhist stupas and monasteries.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('24', 'Ratargul Swamp Forest', 'Ratargul, Sylhet', '8', '24.3821', '90.9055', 'Ratargul Swamp Forest is a freshwater swamp forest and a great place for nature lovers.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('25', 'Kuakata Sea Beach', 'Kuakata, Patuakhali', '9', '21.8333', '90.1167', 'Kuakata Sea Beach is known for its stunning sunrise and sunset views over the Bay of Bengal.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('26', 'Sundarbans National Park', 'Sundarbans, Khulna', '3', '21.9497', '88.9051', 'Sundarbans National Park is a UNESCO World Heritage Site known for its Bengal tigers and mangrove forests.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('27', 'Saint Martins Island', 'Saint Martins Island, Coxs Bazar', '2', '20.5951', '92.3186', 'Saint Martins Island is a popular tourist destination known for its pristine beaches.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('28', 'Lawachara National Park', 'Moulvibazar, Sylhet', '8', '24.4743', '91.5958', 'Lawachara National Park is a wildlife sanctuary known for its hoolock gibbons and rich biodiversity.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('29', 'Rangamati Hanging Bridge', 'Rangamati, Chittagong Hill Tracts', '28', '22.6335', '92.1919', 'Rangamati Hanging Bridge offers stunning views of the Kaptai Lake and surrounding hills.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('30', 'Kantaji Temple', 'Dinajpur City', '17', '25.6281', '88.6348', 'Kantaji Temple is a terracotta Hindu temple and one of the finest examples of Bengal architecture.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('31', 'Mahasthangarh', 'Bogra City', '13', '24.8', '89.3167', 'Mahasthangarh is an ancient archaeological site with ruins of ancient civilizations.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('32', 'Nilgiri Hills', 'Bandarban Hill District', '15', '21.7787', '92.2837', 'Nilgiri Hills is a popular hill station offering panoramic views of the surrounding landscape.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('33', 'Bichanakandi', 'Sylhet', '8', '25.0711', '92.1731', 'Bisnakandi is a scenic spot known for its crystal-clear water and surrounding hills.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('34', 'Sundarbans Wildlife Sanctuary', 'Sundarbans, Khulna', '3', '21.9497', '89.1833', 'Sundarbans Wildlife Sanctuary is a protected area for various endangered species.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('35', 'Jatiya Sangsad Bhaban', 'Sher-e-Bangla Nagar, Dhaka', '1', '23.7861', '90.4086', 'Jatiya Sangsad Bhaban is the National Parliament House of Bangladesh with modern architectural design.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('36', 'Biswakosh Bhaban', 'Agargaon, Dhaka', '1', '23.7877', '90.3637', 'Biswakosh Bhaban is the Bangladesh National Encyclopedia building, known for its unique design.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('37', 'Sonargaon', 'Narayanganj', '10', '23.6146', '90.5606', 'Sonargaon is an ancient historic city with ruins of palaces, mosques, and museums.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('38', 'Birishiri', 'Birishiri, Netrokona', '20', '24.9098', '90.7312', 'Birishiri is a beautiful hilly area with the picturesque Someshwari River and blue hills.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('39', 'Bangladesh National Museum', 'Shahbagh, Dhaka', '1', '23.729', '90.4043', 'Bangladesh National Museum is the largest and oldest museum in Bangladesh with diverse exhibits.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('40', 'Chittagong Ethnological Museum', 'Chittagong City', '2', '22.3593', '91.8327', 'Chittagong Ethnological Museum showcases the lifestyle and culture of various ethnic groups in Bangladesh.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('41', 'Kantajew Temple', 'Dinajpur City', '17', '25.6472', '88.6485', 'Kantajew Temple is a stunning terracotta Hindu temple known for its intricate artwork.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('42', 'Srimangal Tea Gardens', 'Srimangal, Sylhet', '8', '24.3056', '91.7121', 'Srimangal is renowned for its lush tea gardens and offers scenic views for nature enthusiasts.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('43', 'Nijhum Dwip', 'Noakhali', '21', '22.1587', '91.9827', 'Nijhum Dwip is an isolated island with diverse wildlife and serene natural beauty.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('44', 'Mainamati Ruins', 'Mainamati, Comilla', '5', '23.4486', '91.1319', 'Mainamati Ruins is an archaeological site with ancient Buddhist stupas and structures.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('45', 'Chera Dwip', 'Coxs Bazar, Chittagong', '2', '21.4072', '92.1095', 'Chera Dwip is an untouched island offering a peaceful retreat and scenic beauty.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('46', 'Sompur Mahabihar', 'Paharpur, Naogaon', '18', '25.0126', '88.9649', 'Sompur Mahabihar is an ancient Buddhist monastery and UNESCO World Heritage Site.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('47', 'Lalmai Hills', 'Comilla', '5', '23.4041', '91.1555', 'Lalmai Hills offer hiking opportunities and archaeological sites dating back to the 8th century.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('48', 'Kaptai National Park', 'Kaptai, Rangamati', '28', '22.7455', '92.3142', 'Kaptai National Park is a wildlife reserve with diverse flora and fauna.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('49', 'Baklai Waterfall', 'Bandarban Hill District', '24', '21.9641', '92.4188', 'Baklai Waterfall is a picturesque waterfall surrounded by lush greenery.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('50', 'Ramsagar National Park', 'Dinajpur', '17', '25.7775', '89.0993', 'Ramsagar National Park is a lake and park with historical significance.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('51', 'Ishwardi Upazila', 'Pabna', '14', '24.1303', '89.0413', 'Ishwardi Upazila is known for its agricultural landscapes and historical sites.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('52', 'Charanpur Reserve Forest', 'Pabna', '14', '24.0191', '89.2229', 'Charanpur Reserve Forest offers rich biodiversity and is a great place for nature lovers.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('53', 'Shilaidaha Kuthibari', 'Kusumgram, Pabna', '14', '24.0133', '89.2392', 'Shilaidaha Kuthibari is a historic house where Nobel Laureate Rabindranath Tagore stayed.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('54', 'Bangabandhu Bridge', 'Shahjadpur, Sirajganj', '6', '24.7899', '89.4807', 'Bangabandhu Bridge is the 6th longest bridge in South Asia and a significant landmark.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('55', 'Bir Muktijoddha Sirajul Islam Public Library', 'Mymensingh', '6', '24.7564', '90.4027', 'Bir Muktijoddha Sirajul Islam Public Library is a renowned library with historical documents.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('56', 'Shambhuganj Upazila', 'Mymensingh', '6', '25.0805', '90.5773', 'Shambhuganj Upazila is known for its tranquil atmosphere and lush greenery.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('57', 'Bhawal National Park', 'Gazipur', '11', '24.063', '90.3875', 'Bhawal National Park is a nature reserve with diverse flora and fauna.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('58', 'Chandni Ghat', 'Gazipur', '11', '23.9952', '90.4989', 'Chandni Ghat is a serene riverfront spot offering picturesque views of the river.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('59', 'Fantasy Kingdom', 'Sukundi, Gazipur', '11', '24.0902', '90.4185', 'Fantasy Kingdom is a popular amusement park with various fun rides and entertainment.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('60', 'Bheramara Upazila', 'Jessore', '16', '23.9592', '89.2305', 'Bheramara Upazila is known for its rural beauty and traditional culture.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('61', 'Shaheed Minar, Jessore', 'Jessore', '16', '23.1625', '89.2071', 'Shaheed Minar in Jessore is a monument dedicated to the language movement martyrs.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('62', 'Jadu Nibash Palace', 'Jessore', '16', '23.1365', '89.2108', 'Jadu Nibash Palace is a historical palace with architectural significance.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('63', 'Jamuna Future Park, Tangail', 'Tangail', '19', '24.2767', '89.9638', 'Jamuna Future Park in Tangail is a large shopping and entertainment complex.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('64', 'Birulia Bridge', 'Tangail', '19', '24.3787', '89.9687', 'Birulia Bridge is an old iron bridge offering views of the river and surrounding landscapes.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('65', 'Zia Park', 'Tangail', '19', '24.2409', '90.0093', 'Zia Park is a recreational park with greenery and various leisure activities.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('66', 'Bhairab Upazila', 'Narsingdi', '12', '23.9042', '90.7359', 'Bhairab Upazila is known for its cultural heritage and ancient sites.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('67', 'Narsingdi Town Hall', 'Narsingdi', '12', '23.9324', '90.7277', 'Narsingdi Town Hall is a significant architectural landmark in the town center.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('68', 'Meghna River', 'Narsingdi', '12', '23.6195', '90.706', 'The Meghna River offers boat rides and scenic views of the surrounding landscapes.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('69', 'Fulkuri River View', 'Faridpur', '23', '23.3784', '89.8509', 'Fulkuri River View offers stunning views of the river and surrounding landscapes.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('70', 'Charbhadrasan Bridge', 'Faridpur', '23', '23.3772', '89.6912', 'Charbhadrasan Bridge is a picturesque bridge over a serene waterway.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('71', 'Charvadrason Zamindar Bari', 'Faridpur', '23', '23.5023', '89.8973', 'Charvadrason Zamindar Bari is a historical mansion with rich heritage and cultural value.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('72', 'Dhalchar', 'Bhola', '25', '22.2145', '90.1194', 'Dhalchar is a river island known for its scenic beauty and tranquility.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('73', 'Monpura Island', 'Bhola', '25', '22.1788', '90.2172', 'Monpura Island is a remote island with beautiful beaches and serene atmosphere.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('74', 'Char Kukri-Mukri', 'Bhola', '25', '22.3195', '90.2405', 'Char Kukri-Mukri is a sandbar with crystal-clear water and stunning views.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('75', 'Atiya Jami Mosque', 'Manikganj', '26', '23.8644', '89.9569', 'Atiya Jami Mosque is a historical mosque with intricate terracotta artwork.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('76', 'Elenga Resort', 'Elenga, Manikganj', '26', '24.0765', '89.7355', 'Elenga Resort is a popular resort with swimming pools and recreational facilities.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('77', 'Manikganj Museum', 'Manikganj', '26', '23.8636', '89.9624', 'Manikganj Museum exhibits artifacts showcasing the regions cultural heritage.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('78', 'Hajiganj Fort', 'Hajiganj, Chandpur', '30', '23.1477', '90.7314', 'Hajiganj Fort is a historic Mughal fort with ancient ruins and architectural charm.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('79', 'Lohagara Upazila', 'Chandpur', '30', '23.0915', '90.6707', 'Lohagara Upazila is known for its serene landscape and peaceful environment.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."DESTINATIONS" VALUES ('80', 'Chandpur Shilpakala Academy', 'Chandpur', '30', '23.2287', '90.6514', 'Chandpur Shilpakala Academy promotes local arts and culture through various events.', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');

-- ----------------------------
-- Table structure for FAVORITES
-- ----------------------------
DROP TABLE "C##TRIPIFY"."FAVORITES";
CREATE TABLE "C##TRIPIFY"."FAVORITES" (
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "OBJECT_ID" NUMBER VISIBLE NOT NULL,
  "OBJECT_TYPE" VARCHAR2(50 BYTE) VISIBLE NOT NULL,
  "ADDED_ON" DATE VISIBLE DEFAULT CURRENT_DATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of FAVORITES
-- ----------------------------

-- ----------------------------
-- Table structure for FLIGHTS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."FLIGHTS";
CREATE TABLE "C##TRIPIFY"."FLIGHTS" (
  "FLIGHT_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."FLIGHT_SEQ"."NEXTVAL" NOT NULL,
  "FROM_CITY_ID" NUMBER VISIBLE NOT NULL,
  "TO_CITY_ID" NUMBER VISIBLE NOT NULL,
  "AIRLINE_NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "DEPARTURE_DATE" DATE VISIBLE NOT NULL,
  "RETURN_DATE" DATE VISIBLE NOT NULL,
  "PRICE" NUMBER VISIBLE NOT NULL,
  "SEAT_CLASS" VARCHAR2(20 BYTE) VISIBLE,
  "FLIGHT_DURATION" NUMBER VISIBLE,
  "BOOKING_URL" VARCHAR2(200 BYTE) VISIBLE NOT NULL,
  "CREATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "LAST_UPDATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "CREATOR_USER_ID" NUMBER VISIBLE DEFAULT 0
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of FLIGHTS
-- ----------------------------
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('1', '28', '16', 'International Flights Airlines', TO_DATE('2023-08-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '12204', 'Business', '55', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('2', '12', '4', 'Luxury Flights Airlines', TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '18850', 'Economy', '39', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('3', '17', '23', 'International Airways Airlines', TO_DATE('2023-08-03 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '14709', 'Business', '119', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('4', '20', '22', 'Luxury Airways Airlines', TO_DATE('2023-08-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '3897', 'Economy', '74', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('5', '9', '29', 'Royal Airways Airlines', TO_DATE('2023-07-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-05 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '17379', 'First', '54', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('6', '20', '3', 'National Aviation Airlines', TO_DATE('2023-08-29 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-03 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '5658', 'Economy', '93', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('7', '19', '9', 'Elite Aviation Airlines', TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-21 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '11738', 'Business', '112', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('8', '26', '21', 'Premium Flights Airlines', TO_DATE('2023-08-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-26 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '5766', 'Economy', '79', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('9', '13', '21', 'Global Airways Airlines', TO_DATE('2023-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-21 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '17450', 'First', '113', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('10', '10', '29', 'Elite Airways Airlines', TO_DATE('2023-08-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-14 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '13635', 'Business', '53', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('11', '8', '25', 'National Airways Airlines', TO_DATE('2023-08-11 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '15699', 'Economy', '86', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('12', '23', '19', 'Elite Airways Airlines', TO_DATE('2023-08-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '14489', 'Economy', '103', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('13', '12', '15', 'Elite Airlines Airlines', TO_DATE('2023-08-06 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-11 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '13299', 'Business', '31', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('14', '14', '27', 'Luxury Flights Airlines', TO_DATE('2023-08-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-04 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '12101', 'Economy', '32', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('15', '2', '9', 'Premium Airways Airlines', TO_DATE('2023-08-25 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-29 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '3530', 'First', '85', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('16', '7', '28', 'Royal Flights Airlines', TO_DATE('2023-08-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6484', 'Economy', '72', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('17', '15', '21', 'International Airways Airlines', TO_DATE('2023-08-06 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6949', 'Economy', '42', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('18', '24', '29', 'National Airways Airlines', TO_DATE('2023-08-14 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '13224', 'First', '80', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('19', '23', '18', 'Royal Aviation Airlines', TO_DATE('2023-08-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-11 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '13610', 'Economy', '32', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('20', '25', '19', 'Royal Airways Airlines', TO_DATE('2023-08-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '15577', 'Economy', '69', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('21', '1', '27', 'Elite Airlines Airlines', TO_DATE('2023-08-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '4801', 'Economy', '111', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('22', '14', '23', 'Global Aviation Airlines', TO_DATE('2023-08-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-26 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '16394', 'Economy', '111', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('23', '14', '22', 'International Flights Airlines', TO_DATE('2023-08-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '3460', 'Economy', '25', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('24', '3', '9', 'National Airways Airlines', TO_DATE('2023-08-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-19 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '5682', 'Business', '106', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('25', '10', '9', 'Elite Aviation Airlines', TO_DATE('2023-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '5157', 'Economy', '84', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('26', '6', '4', 'Global Aviation Airlines', TO_DATE('2023-08-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '5326', 'Economy', '29', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('27', '10', '13', 'International Flights Airlines', TO_DATE('2023-08-09 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6305', 'Economy', '113', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('28', '10', '1', 'International Airways Airlines', TO_DATE('2023-08-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '10014', 'First', '76', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('29', '17', '23', 'International Flights Airlines', TO_DATE('2023-08-14 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '18915', 'Business', '111', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('30', '14', '15', 'Global Flights Airlines', TO_DATE('2023-08-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '3211', 'Business', '82', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('31', '16', '18', 'Premium Aviation Airlines', TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '4393', 'Economy', '26', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('32', '12', '18', 'Elite Aviation Airlines', TO_DATE('2023-08-25 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-27 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '8123', 'Economy', '96', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('33', '3', '4', 'Royal Aviation Airlines', TO_DATE('2023-08-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-21 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '16044', 'Business', '115', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('34', '28', '10', 'Premium Airways Airlines', TO_DATE('2023-08-04 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '7458', 'Economy', '33', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('35', '26', '28', 'Royal Airways Airlines', TO_DATE('2023-08-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '15660', 'First', '38', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('36', '3', '12', 'Luxury Aviation Airlines', TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-19 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '17515', 'First', '35', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('37', '16', '14', 'National Flights Airlines', TO_DATE('2023-08-05 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-11 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '8108', 'Business', '92', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('38', '25', '24', 'International Airlines Airlines', TO_DATE('2023-08-14 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '15389', 'Economy', '107', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('39', '16', '28', 'National Aviation Airlines', TO_DATE('2023-08-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '3098', 'Business', '113', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('40', '19', '10', 'Global Airlines Airlines', TO_DATE('2023-08-06 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '19573', 'Economy', '67', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('41', '17', '15', 'Elite Airlines Airlines', TO_DATE('2023-08-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '19754', 'Economy', '77', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('42', '11', '24', 'National Airways Airlines', TO_DATE('2023-08-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '19740', 'Business', '103', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('43', '3', '27', 'Global Aviation Airlines', TO_DATE('2023-07-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-05 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '9881', 'First', '28', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('44', '4', '6', 'International Aviation Airlines', TO_DATE('2023-08-05 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '16556', 'Business', '115', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('45', '19', '12', 'Global Aviation Airlines', TO_DATE('2023-08-21 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '17192', 'Economy', '38', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('46', '27', '20', 'International Airways Airlines', TO_DATE('2023-08-04 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '5155', 'First', '68', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('47', '8', '30', 'Premium Airways Airlines', TO_DATE('2023-08-19 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '15371', 'Business', '83', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('48', '6', '7', 'Global Airways Airlines', TO_DATE('2023-08-11 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6063', 'Economy', '117', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('49', '21', '20', 'International Flights Airlines', TO_DATE('2023-08-25 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-29 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '17037', 'Business', '29', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('50', '22', '11', 'Premium Aviation Airlines', TO_DATE('2023-08-03 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-07 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '5948', 'First', '27', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('51', '11', '29', 'Global Airlines Airlines', TO_DATE('2023-08-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '18318', 'Economy', '118', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('52', '1', '4', 'National Flights Airlines', TO_DATE('2023-08-06 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '9756', 'First', '78', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('53', '5', '20', 'International Airways Airlines', TO_DATE('2023-08-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-07 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '9618', 'Economy', '81', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('54', '17', '8', 'Global Flights Airlines', TO_DATE('2023-08-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-26 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '4374', 'Business', '40', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('55', '10', '7', 'Royal Aviation Airlines', TO_DATE('2023-07-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-03 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '3511', 'Business', '26', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('56', '11', '20', 'Premium Aviation Airlines', TO_DATE('2023-08-23 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '15670', 'Business', '25', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('57', '7', '15', 'Global Flights Airlines', TO_DATE('2023-08-14 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6278', 'Business', '103', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('58', '25', '16', 'Global Airlines Airlines', TO_DATE('2023-08-14 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '17740', 'First', '120', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('59', '14', '19', 'Royal Airways Airlines', TO_DATE('2023-08-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '8894', 'Business', '70', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('60', '6', '2', 'Luxury Flights Airlines', TO_DATE('2023-08-14 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '17566', 'Business', '37', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('61', '21', '14', 'Luxury Flights Airlines', TO_DATE('2023-08-27 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '13691', 'First', '119', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('62', '9', '4', 'Global Airways Airlines', TO_DATE('2023-08-03 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-07 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '13405', 'Business', '95', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('63', '2', '25', 'Premium Aviation Airlines', TO_DATE('2023-08-04 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-09 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '3497', 'First', '120', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('64', '4', '5', 'National Airways Airlines', TO_DATE('2023-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6943', 'Business', '115', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('65', '7', '17', 'National Airlines Airlines', TO_DATE('2023-08-23 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-27 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '11168', 'Economy', '67', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('66', '20', '13', 'Luxury Aviation Airlines', TO_DATE('2023-08-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-29 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '8241', 'First', '20', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('67', '12', '29', 'National Flights Airlines', TO_DATE('2023-08-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6914', 'Business', '77', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('68', '2', '10', 'Royal Airways Airlines', TO_DATE('2023-08-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '19181', 'Economy', '84', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('69', '6', '16', 'Royal Flights Airlines', TO_DATE('2023-08-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '10698', 'Business', '70', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('70', '16', '11', 'Royal Airlines Airlines', TO_DATE('2023-08-11 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '4520', 'First', '94', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('71', '25', '23', 'International Flights Airlines', TO_DATE('2023-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-04 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '18637', 'First', '116', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('72', '14', '9', 'Luxury Flights Airlines', TO_DATE('2023-08-05 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '10701', 'Business', '109', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('73', '29', '1', 'Global Airways Airlines', TO_DATE('2023-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '9797', 'First', '51', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('74', '23', '14', 'International Airlines Airlines', TO_DATE('2023-08-21 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '14952', 'Economy', '46', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('75', '13', '23', 'International Airlines Airlines', TO_DATE('2023-08-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-25 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6775', 'First', '68', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('76', '28', '11', 'Global Flights Airlines', TO_DATE('2023-08-06 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-13 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '8006', 'First', '78', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('77', '20', '9', 'International Airlines Airlines', TO_DATE('2023-08-21 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '15529', 'First', '113', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('78', '1', '16', 'National Aviation Airlines', TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '12798', 'Economy', '87', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('79', '20', '14', 'International Airways Airlines', TO_DATE('2023-08-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-23 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '12684', 'First', '61', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('80', '6', '22', 'National Aviation Airlines', TO_DATE('2023-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-03 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '14669', 'First', '111', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('81', '29', '26', 'International Airlines Airlines', TO_DATE('2023-08-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-26 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '8083', 'First', '44', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('82', '13', '16', 'Global Flights Airlines', TO_DATE('2023-08-29 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '8276', 'Business', '102', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('83', '4', '26', 'Premium Airways Airlines', TO_DATE('2023-08-14 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-19 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '10529', 'Economy', '63', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('84', '20', '28', 'Luxury Aviation Airlines', TO_DATE('2023-08-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '13192', 'Business', '79', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('85', '27', '5', 'Elite Airlines Airlines', TO_DATE('2023-08-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '19235', 'Economy', '77', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('86', '10', '9', 'National Airlines Airlines', TO_DATE('2023-08-25 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '15714', 'Economy', '75', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('87', '12', '15', 'Elite Aviation Airlines', TO_DATE('2023-08-19 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '6832', 'First', '71', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('88', '2', '19', 'Global Airways Airlines', TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '13389', 'Business', '119', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('89', '19', '8', 'Global Airways Airlines', TO_DATE('2023-08-11 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-18 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '3401', 'Economy', '68', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('90', '24', '26', 'Global Aviation Airlines', TO_DATE('2023-08-06 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-12 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '5330', 'Economy', '38', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('91', '8', '16', 'Elite Airways Airlines', TO_DATE('2023-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-19 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '18487', 'Business', '116', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('92', '9', '22', 'National Airlines Airlines', TO_DATE('2023-08-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-11 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '18105', 'Economy', '120', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('93', '10', '13', 'Luxury Flights Airlines', TO_DATE('2023-08-11 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '9609', 'First', '43', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('94', '24', '11', 'Elite Airways Airlines', TO_DATE('2023-08-04 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '9559', 'Economy', '71', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('95', '15', '17', 'Luxury Airlines Airlines', TO_DATE('2023-08-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '9524', 'Business', '49', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('96', '23', '18', 'Elite Aviation Airlines', TO_DATE('2023-08-14 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-21 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '14157', 'Business', '74', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('97', '15', '6', 'Global Airlines Airlines', TO_DATE('2023-08-25 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '8702', 'First', '29', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('98', '24', '14', 'National Airways Airlines', TO_DATE('2023-08-26 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '8891', 'First', '113', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('99', '16', '24', 'Elite Aviation Airlines', TO_DATE('2023-08-26 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '4287', 'Business', '55', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."FLIGHTS" VALUES ('100', '20', '24', 'National Airways Airlines', TO_DATE('2023-08-14 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), '17298', 'Economy', '86', 'booking.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');

-- ----------------------------
-- Table structure for FOLLOWS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."FOLLOWS";
CREATE TABLE "C##TRIPIFY"."FOLLOWS" (
  "FOLLOWER_ID" NUMBER VISIBLE NOT NULL,
  "FOLLOWEE_ID" NUMBER VISIBLE NOT NULL,
  "SINCE_DATE" DATE VISIBLE DEFAULT CURRENT_DATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of FOLLOWS
-- ----------------------------

-- ----------------------------
-- Table structure for GROUPMESSAGES
-- ----------------------------
DROP TABLE "C##TRIPIFY"."GROUPMESSAGES";
CREATE TABLE "C##TRIPIFY"."GROUPMESSAGES" (
  "MESSAGE_ID" NUMBER VISIBLE NOT NULL,
  "GROUP_ID" NUMBER VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of GROUPMESSAGES
-- ----------------------------

-- ----------------------------
-- Table structure for GROUPPOSTS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."GROUPPOSTS";
CREATE TABLE "C##TRIPIFY"."GROUPPOSTS" (
  "POST_ID" NUMBER VISIBLE NOT NULL,
  "GROUP_ID" NUMBER VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of GROUPPOSTS
-- ----------------------------

-- ----------------------------
-- Table structure for GROUPS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."GROUPS";
CREATE TABLE "C##TRIPIFY"."GROUPS" (
  "GROUP_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."GROUP_SEQ"."NEXTVAL" NOT NULL,
  "NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "CREATED_AT" DATE VISIBLE DEFAULT CURRENT_DATE,
  "DESCRIPTION" VARCHAR2(1000 BYTE) VISIBLE,
  "RULES" VARCHAR2(1000 BYTE) VISIBLE,
  "IS_PUBLIC" NUMBER(1,0) VISIBLE DEFAULT 0
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of GROUPS
-- ----------------------------

-- ----------------------------
-- Table structure for GUIDES
-- ----------------------------
DROP TABLE "C##TRIPIFY"."GUIDES";
CREATE TABLE "C##TRIPIFY"."GUIDES" (
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "GUIDE_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."GUIDE_SEQ"."NEXTVAL"
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of GUIDES
-- ----------------------------
INSERT INTO "C##TRIPIFY"."GUIDES" VALUES ('1', '1');
INSERT INTO "C##TRIPIFY"."GUIDES" VALUES ('2', '2');

-- ----------------------------
-- Table structure for HOTELREVIEWS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."HOTELREVIEWS";
CREATE TABLE "C##TRIPIFY"."HOTELREVIEWS" (
  "REVIEW_ID" NUMBER VISIBLE NOT NULL,
  "HOTEL_ID" NUMBER VISIBLE NOT NULL,
  "SECURITY_QUALITY" VARCHAR2(100 BYTE) VISIBLE,
  "STAFF_QUALITY" VARCHAR2(100 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of HOTELREVIEWS
-- ----------------------------

-- ----------------------------
-- Table structure for HOTELS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."HOTELS";
CREATE TABLE "C##TRIPIFY"."HOTELS" (
  "HOTEL_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."HOTEL_SEQ"."NEXTVAL" NOT NULL,
  "NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "ADDRESS" VARCHAR2(200 BYTE) VISIBLE,
  "CITY_ID" NUMBER VISIBLE NOT NULL,
  "DESCRIPTION" VARCHAR2(1000 BYTE) VISIBLE,
  "IMAGE_URL" VARCHAR2(200 BYTE) VISIBLE,
  "PRICE_PER_DAY" NUMBER VISIBLE,
  "PHONE" VARCHAR2(20 BYTE) VISIBLE,
  "EMAIL" VARCHAR2(100 BYTE) VISIBLE,
  "HAS_WIFI" NUMBER(1,0) VISIBLE DEFAULT 1,
  "HAS_PARKING" NUMBER(1,0) VISIBLE DEFAULT 1,
  "HAS_GYM" NUMBER(1,0) VISIBLE DEFAULT 1,
  "CREATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "LAST_UPDATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "CREATOR_USER_ID" NUMBER VISIBLE DEFAULT 0
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of HOTELS
-- ----------------------------
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('1', 'Quaint Villa Hotel', '48 Lakeview Drive Bhola , Bangladesh', '25', 'A Exquisitely Rustic hotel in Bhola.', 'dummy.jpg', '4867', '019157054121', 'quaintvillahotel@gmail.com', '1', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('2', 'Elegant Cottage Hotel', '40 Beach Road Narsingdi , Bangladesh', '12', 'A Majestically Rustic hotel in Narsingdi.', 'dummy.jpg', '902', '014489813442', 'elegantcottagehotel@gmail.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('3', 'Cozy Cottage Hotel', '35 Sunset Boulevard Dhaka , Bangladesh', '1', 'A Exquisitely Elevated hotel in Dhaka.', 'dummy.jpg', '4210', '013943469125', 'cozycottagehotel@outlook.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('4', 'Elevated Hideaway Hotel', '28 Mountain Street Dinajpur , Bangladesh', '17', 'A Majestically Elegant hotel in Dinajpur.', 'dummy.jpg', '3889', '015389308686', 'elevatedhideawayhotel@yahoo.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('5', 'Glorious Hideaway Hotel', '18 Beach Road Dinajpur , Bangladesh', '17', 'A Extravagantly Glorious hotel in Dinajpur.', 'dummy.jpg', '3256', '015238514617', 'glorioushideawayhotel@gmail.com', '0', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('6', 'Charming Sanctuary Hotel', '55 Beach Road Jessore , Bangladesh', '16', 'A Majestically Elevated hotel in Jessore.', 'dummy.jpg', '961', '015116405724', 'charmingsanctuaryhotel@gmail.com', '1', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('7', 'Rustic Mansion Hotel', '39 Lakeview Drive Sylhet , Bangladesh', '8', 'A Extravagantly Rustic hotel in Sylhet.', 'dummy.jpg', '2731', '018085233307', 'rusticmansionhotel@outlook.com', '1', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('8', 'Charming Resort Hotel', '33 Sunset Boulevard Bandarban , Bangladesh', '24', 'A Majestically Spectacular hotel in Bandarban.', 'dummy.jpg', '4290', '018711754651', 'charmingresorthotel@yahoo.com', '0', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('9', 'Elegant Retreat Hotel', '23 Beach Road Dinajpur , Bangladesh', '17', 'A Exceptionally Luxurious hotel in Dinajpur.', 'dummy.jpg', '1472', '018198729920', 'elegantretreathotel@yahoo.com', '1', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('10', 'Rustic Mansion Hotel', '11 Sunset Boulevard Bogra , Bangladesh', '13', 'A Exquisitely Quaint hotel in Bogra.', 'dummy.jpg', '2001', '019991162178', 'rusticmansionhotel@yahoo.com', '1', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('11', 'Elegant Manor Hotel', '93 Main Street Netrokona , Bangladesh', '20', 'A Exquisitely Boutique hotel in Netrokona.', 'dummy.jpg', '2236', '019663393859', 'elegantmanorhotel@outlook.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('12', 'Glorious Manor Hotel', '40 Beach Road Bandarban , Bangladesh', '15', 'A Exceptionally Charming hotel in Bandarban.', 'dummy.jpg', '1191', '016059548626', 'gloriousmanorhotel@outlook.com', '1', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('13', 'Boutique Cottage Hotel', '32 Lakeview Drive Chittagong , Bangladesh', '2', 'A Gracefully Elevated hotel in Chittagong.', 'dummy.jpg', '1468', '014749715202', 'boutiquecottagehotel@yahoo.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('14', 'Glorious Cottage Hotel', '30 Lakeview Drive Pabna , Bangladesh', '14', 'A Exquisitely Seaside hotel in Pabna.', 'dummy.jpg', '3047', '011855618632', 'gloriouscottagehotel@gmail.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('15', 'Spectacular Hideaway Hotel', '77 Garden Lane Pabna , Bangladesh', '14', 'A Enchantingly Elevated hotel in Pabna.', 'dummy.jpg', '3376', '016997777705', 'spectacularhideawayhotel@yahoo.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('16', 'Spectacular Resort Hotel', '88 Mountain Street Narsingdi , Bangladesh', '22', 'A Extravagantly Quaint hotel in Narsingdi.', 'dummy.jpg', '998', '019653424396', 'spectacularresorthotel@outlook.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('17', 'Charming Palace Hotel', '95 Park Avenue Tangail , Bangladesh', '29', 'A Exquisitely Spectacular hotel in Tangail.', 'dummy.jpg', '4312', '019741139806', 'charmingpalacehotel@outlook.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('18', 'Seaside Manor Hotel', '71 Harbor View Bhola , Bangladesh', '25', 'A Wonderfully Charming hotel in Bhola.', 'dummy.jpg', '4837', '016318371557', 'seasidemanorhotel@gmail.com', '0', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('19', 'Glorious Oasis Hotel', '50 Harbor View Naogaon , Bangladesh', '18', 'A Gracefully Spectacular hotel in Naogaon.', 'dummy.jpg', '3867', '018301999253', 'gloriousoasishotel@gmail.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('20', 'Luxurious Manor Hotel', '45 Park Avenue Gazipur , Bangladesh', '11', 'A Gracefully Seaside hotel in Gazipur.', 'dummy.jpg', '1295', '011659029179', 'luxuriousmanorhotel@outlook.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('21', 'Seaside Lodge Hotel', '68 Garden Lane Coxs Bazar , Bangladesh', '27', 'A Gracefully Charming hotel in Coxs Bazar.', 'dummy.jpg', '4080', '016748298191', 'seasidelodgehotel@yahoo.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('22', 'Seaside Mansion Hotel', '19 Lakeview Drive Naogaon , Bangladesh', '18', 'A Majestically Quaint hotel in Naogaon.', 'dummy.jpg', '1568', '011864338780', 'seasidemansionhotel@yahoo.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('23', 'Seaside Retreat Hotel', '39 Lakeview Drive Pabna , Bangladesh', '14', 'A Majestically Cozy hotel in Pabna.', 'dummy.jpg', '1975', '019769742786', 'seasideretreathotel@gmail.com', '1', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('24', 'Glorious Cottage Hotel', '39 Park Avenue Manikganj , Bangladesh', '26', 'A Uniquely Glorious hotel in Manikganj.', 'dummy.jpg', '1040', '015053009336', 'gloriouscottagehotel@gmail.com', '0', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('25', 'Elegant Lodge Hotel', '64 Beach Road Sylhet , Bangladesh', '8', 'A Gracefully Elegant hotel in Sylhet.', 'dummy.jpg', '1393', '015316556115', 'elegantlodgehotel@yahoo.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('26', 'Charming Castle Hotel', '100 Park Avenue Chittagong , Bangladesh', '2', 'A Extravagantly Glorious hotel in Chittagong.', 'dummy.jpg', '2961', '015597671853', 'charmingcastlehotel@gmail.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('27', 'Glorious Retreat Hotel', '32 Sunset Boulevard Narsingdi , Bangladesh', '12', 'A Magically Modern hotel in Narsingdi.', 'dummy.jpg', '932', '018581799877', 'gloriousretreathotel@gmail.com', '0', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('28', 'Rustic Sanctuary Hotel', '54 Riverfront Bhola , Bangladesh', '25', 'A Exceptionally Spectacular hotel in Bhola.', 'dummy.jpg', '3174', '017479789959', 'rusticsanctuaryhotel@gmail.com', '0', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('29', 'Modern Resort Hotel', '70 Main Street Dhaka , Bangladesh', '1', 'A Enchantingly Glorious hotel in Dhaka.', 'dummy.jpg', '1877', '015127548978', 'modernresorthotel@yahoo.com', '1', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('30', 'Charming Castle Hotel', '67 Harbor View Narsingdi , Bangladesh', '22', 'A Serenely Cozy hotel in Narsingdi.', 'dummy.jpg', '823', '018449479335', 'charmingcastlehotel@gmail.com', '0', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('31', 'Glorious Manor Hotel', '17 Main Street Tangail , Bangladesh', '19', 'A Enchantingly Spectacular hotel in Tangail.', 'dummy.jpg', '4154', '014615259229', 'gloriousmanorhotel@outlook.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('32', 'Cozy Cottage Hotel', '23 Main Street Rajshahi , Bangladesh', '4', 'A Serenely Luxurious hotel in Rajshahi.', 'dummy.jpg', '2421', '016346461724', 'cozycottagehotel@gmail.com', '1', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('33', 'Glorious Lodge Hotel', '92 Beach Road Rajshahi , Bangladesh', '4', 'A Majestically Elegant hotel in Rajshahi.', 'dummy.jpg', '4998', '013839293576', 'gloriouslodgehotel@gmail.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('34', 'Charming Lodge Hotel', '9 Mountain Street Sylhet , Bangladesh', '8', 'A Extravagantly Charming hotel in Sylhet.', 'dummy.jpg', '3961', '015419884797', 'charminglodgehotel@yahoo.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('35', 'Glorious Resort Hotel', '79 Main Street Narsingdi , Bangladesh', '12', 'A Majestically Spectacular hotel in Narsingdi.', 'dummy.jpg', '1413', '018514413855', 'gloriousresorthotel@yahoo.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('36', 'Charming Inn Hotel', '41 Mountain Street Rangamati , Bangladesh', '28', 'A Gracefully Glorious hotel in Rangamati.', 'dummy.jpg', '1352', '012202944944', 'charminginnhotel@yahoo.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('37', 'Modern Palace Hotel', '29 Ocean Drive Tangail , Bangladesh', '29', 'A Uniquely Boutique hotel in Tangail.', 'dummy.jpg', '4013', '011504484489', 'modernpalacehotel@outlook.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('38', 'Boutique Castle Hotel', '61 Main Street Tangail , Bangladesh', '19', 'A Exquisitely Spectacular hotel in Tangail.', 'dummy.jpg', '4501', '014645494394', 'boutiquecastlehotel@gmail.com', '0', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('39', 'Elegant Villa Hotel', '40 Lakeview Drive Tangail , Bangladesh', '29', 'A Enchantingly Charming hotel in Tangail.', 'dummy.jpg', '1605', '018882337192', 'elegantvillahotel@outlook.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('40', 'Spectacular Resort Hotel', '88 Main Street Dhaka , Bangladesh', '1', 'A Exquisitely Glorious hotel in Dhaka.', 'dummy.jpg', '3174', '018168134820', 'spectacularresorthotel@outlook.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('41', 'Glorious Sanctuary Hotel', '42 Sunset Boulevard Dinajpur , Bangladesh', '17', 'A Extravagantly Spectacular hotel in Dinajpur.', 'dummy.jpg', '2587', '012906638455', 'glorioussanctuaryhotel@gmail.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('42', 'Elevated Resort Hotel', '47 Ocean Drive Sylhet , Bangladesh', '8', 'A Extravagantly Elevated hotel in Sylhet.', 'dummy.jpg', '4360', '017309829408', 'elevatedresorthotel@gmail.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('43', 'Charming Oasis Hotel', '79 Ocean Drive Narayanganj , Bangladesh', '10', 'A Wonderfully Elegant hotel in Narayanganj.', 'dummy.jpg', '2899', '015087608167', 'charmingoasishotel@yahoo.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('44', 'Elegant Sanctuary Hotel', '32 Park Avenue Bhola , Bangladesh', '25', 'A Enchantingly Boutique hotel in Bhola.', 'dummy.jpg', '1843', '017545707533', 'elegantsanctuaryhotel@gmail.com', '0', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('45', 'Rustic Castle Hotel', '10 Mountain Street Jessore , Bangladesh', '16', 'A Wonderfully Glorious hotel in Jessore.', 'dummy.jpg', '2553', '016297944069', 'rusticcastlehotel@yahoo.com', '1', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('46', 'Seaside Villa Hotel', '13 Main Street Narayanganj , Bangladesh', '10', 'A Uniquely Elevated hotel in Narayanganj.', 'dummy.jpg', '1090', '015128641886', 'seasidevillahotel@gmail.com', '0', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('47', 'Spectacular Mansion Hotel', '57 Sunset Boulevard Comilla , Bangladesh', '5', 'A Uniquely Rustic hotel in Comilla.', 'dummy.jpg', '4401', '018929417301', 'spectacularmansionhotel@yahoo.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('48', 'Spectacular Mansion Hotel', '100 Harbor View Netrokona , Bangladesh', '20', 'A Wonderfully Modern hotel in Netrokona.', 'dummy.jpg', '2976', '013464567238', 'spectacularmansionhotel@outlook.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('49', 'Cozy Resort Hotel', '59 Harbor View Rangpur , Bangladesh', '7', 'A Exquisitely Charming hotel in Rangpur.', 'dummy.jpg', '4213', '019861793820', 'cozyresorthotel@gmail.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('50', 'Elegant Retreat Hotel', '69 Main Street Bandarban , Bangladesh', '24', 'A Wonderfully Charming hotel in Bandarban.', 'dummy.jpg', '4820', '014815893554', 'elegantretreathotel@outlook.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('51', 'Spectacular Oasis Hotel', '87 Lakeview Drive Dhaka , Bangladesh', '1', 'A Serenely Seaside hotel in Dhaka.', 'dummy.jpg', '964', '017351938500', 'spectacularoasishotel@gmail.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('52', 'Modern Manor Hotel', '22 Main Street Naogaon , Bangladesh', '18', 'A Uniquely Glorious hotel in Naogaon.', 'dummy.jpg', '2987', '012761494134', 'modernmanorhotel@gmail.com', '0', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('53', 'Charming Villa Hotel', '64 Ocean Drive Dinajpur , Bangladesh', '17', 'A Serenely Elegant hotel in Dinajpur.', 'dummy.jpg', '2973', '011972282802', 'charmingvillahotel@yahoo.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('54', 'Cozy Sanctuary Hotel', '87 Ocean Drive Tangail , Bangladesh', '29', 'A Extravagantly Quaint hotel in Tangail.', 'dummy.jpg', '905', '013175118021', 'cozysanctuaryhotel@yahoo.com', '0', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('55', 'Rustic Resort Hotel', '81 Mountain Street Manikganj , Bangladesh', '26', 'A Uniquely Elevated hotel in Manikganj.', 'dummy.jpg', '982', '015631607231', 'rusticresorthotel@outlook.com', '1', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('56', 'Elegant Oasis Hotel', '28 Mountain Street Bhola , Bangladesh', '25', 'A Enchantingly Seaside hotel in Bhola.', 'dummy.jpg', '3971', '018188405231', 'elegantoasishotel@yahoo.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('57', 'Cozy Mansion Hotel', '67 Garden Lane Chittagong , Bangladesh', '2', 'A Serenely Luxurious hotel in Chittagong.', 'dummy.jpg', '1782', '012875035863', 'cozymansionhotel@gmail.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('58', 'Spectacular Castle Hotel', '33 Harbor View Chandpur , Bangladesh', '30', 'A Enchantingly Spectacular hotel in Chandpur.', 'dummy.jpg', '4190', '016967428201', 'spectacularcastlehotel@outlook.com', '0', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('59', 'Modern Hideaway Hotel', '50 Mountain Street Tangail , Bangladesh', '19', 'A Uniquely Rustic hotel in Tangail.', 'dummy.jpg', '3149', '013151774038', 'modernhideawayhotel@yahoo.com', '0', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('60', 'Boutique Lodge Hotel', '96 Ocean Drive Sylhet , Bangladesh', '8', 'A Enchantingly Rustic hotel in Sylhet.', 'dummy.jpg', '1206', '011076054553', 'boutiquelodgehotel@outlook.com', '0', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('61', 'Quaint Resort Hotel', '70 Park Avenue Comilla , Bangladesh', '5', 'A Gracefully Quaint hotel in Comilla.', 'dummy.jpg', '2724', '017243766693', 'quaintresorthotel@outlook.com', '1', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('62', 'Rustic Villa Hotel', '40 Garden Lane Rangamati , Bangladesh', '28', 'A Enchantingly Cozy hotel in Rangamati.', 'dummy.jpg', '1592', '017498241804', 'rusticvillahotel@gmail.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('63', 'Luxurious Cottage Hotel', '57 Riverfront Naogaon , Bangladesh', '18', 'A Extravagantly Glorious hotel in Naogaon.', 'dummy.jpg', '3801', '011894182090', 'luxuriouscottagehotel@outlook.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('64', 'Cozy Sanctuary Hotel', '48 Harbor View Pabna , Bangladesh', '14', 'A Wonderfully Rustic hotel in Pabna.', 'dummy.jpg', '4630', '016597037632', 'cozysanctuaryhotel@outlook.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('65', 'Glorious Manor Hotel', '27 Sunset Boulevard Chandpur , Bangladesh', '30', 'A Extravagantly Spectacular hotel in Chandpur.', 'dummy.jpg', '2775', '013968727352', 'gloriousmanorhotel@gmail.com', '1', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('66', 'Elevated Cottage Hotel', '97 Mountain Street Tangail , Bangladesh', '29', 'A Extravagantly Elevated hotel in Tangail.', 'dummy.jpg', '2472', '019105522050', 'elevatedcottagehotel@yahoo.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('67', 'Spectacular Palace Hotel', '60 Beach Road Noakhali , Bangladesh', '21', 'A Extravagantly Rustic hotel in Noakhali.', 'dummy.jpg', '2193', '016458139512', 'spectacularpalacehotel@gmail.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('68', 'Boutique Inn Hotel', '7 Mountain Street Barisal , Bangladesh', '9', 'A Extravagantly Elegant hotel in Barisal.', 'dummy.jpg', '1604', '012285763453', 'boutiqueinnhotel@outlook.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('69', 'Spectacular Castle Hotel', '70 Harbor View Tangail , Bangladesh', '19', 'A Gracefully Seaside hotel in Tangail.', 'dummy.jpg', '4916', '015127285762', 'spectacularcastlehotel@outlook.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('70', 'Modern Castle Hotel', '57 Park Avenue Manikganj , Bangladesh', '26', 'A Exquisitely Elevated hotel in Manikganj.', 'dummy.jpg', '3764', '011338126183', 'moderncastlehotel@yahoo.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('71', 'Quaint Manor Hotel', '83 Mountain Street Rajshahi , Bangladesh', '4', 'A Enchantingly Boutique hotel in Rajshahi.', 'dummy.jpg', '1772', '018494067393', 'quaintmanorhotel@gmail.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('72', 'Elevated Oasis Hotel', '44 Riverfront Coxs Bazar , Bangladesh', '27', 'A Uniquely Elegant hotel in Coxs Bazar.', 'dummy.jpg', '876', '016339766451', 'elevatedoasishotel@outlook.com', '0', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('73', 'Cozy Lodge Hotel', '56 Ocean Drive Bhola , Bangladesh', '25', 'A Wonderfully Modern hotel in Bhola.', 'dummy.jpg', '1859', '016298025364', 'cozylodgehotel@gmail.com', '1', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('74', 'Quaint Resort Hotel', '51 Beach Road Tangail , Bangladesh', '19', 'A Magically Luxurious hotel in Tangail.', 'dummy.jpg', '1241', '011027589242', 'quaintresorthotel@yahoo.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('75', 'Luxurious Villa Hotel', '46 Ocean Drive Mymensingh , Bangladesh', '6', 'A Exceptionally Glorious hotel in Mymensingh.', 'dummy.jpg', '2200', '015792357825', 'luxuriousvillahotel@gmail.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('76', 'Luxurious Palace Hotel', '3 Park Avenue Netrokona , Bangladesh', '20', 'A Uniquely Luxurious hotel in Netrokona.', 'dummy.jpg', '1161', '013761402413', 'luxuriouspalacehotel@gmail.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('77', 'Charming Retreat Hotel', '89 Main Street Tangail , Bangladesh', '19', 'A Uniquely Charming hotel in Tangail.', 'dummy.jpg', '1780', '013753826708', 'charmingretreathotel@outlook.com', '0', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('78', 'Quaint Retreat Hotel', '93 Sunset Boulevard Chittagong , Bangladesh', '2', 'A Extravagantly Spectacular hotel in Chittagong.', 'dummy.jpg', '2637', '018372565425', 'quaintretreathotel@yahoo.com', '0', '0', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('79', 'Modern Cottage Hotel', '27 Park Avenue Coxs Bazar , Bangladesh', '27', 'A Magically Seaside hotel in Coxs Bazar.', 'dummy.jpg', '3525', '012588188601', 'moderncottagehotel@gmail.com', '0', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('80', 'Quaint Mansion Hotel', '26 Park Avenue Pabna , Bangladesh', '14', 'A Exquisitely Charming hotel in Pabna.', 'dummy.jpg', '922', '012082669103', 'quaintmansionhotel@outlook.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('81', 'Glorious Retreat Hotel', '65 Garden Lane Narayanganj , Bangladesh', '10', 'A Wonderfully Quaint hotel in Narayanganj.', 'dummy.jpg', '2552', '014141283524', 'gloriousretreathotel@yahoo.com', '1', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('82', 'Charming Hideaway Hotel', '80 Mountain Street Chittagong , Bangladesh', '2', 'A Exquisitely Quaint hotel in Chittagong.', 'dummy.jpg', '2835', '012759557062', 'charminghideawayhotel@outlook.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('83', 'Rustic Villa Hotel', '8 Riverfront Rajshahi , Bangladesh', '4', 'A Majestically Spectacular hotel in Rajshahi.', 'dummy.jpg', '3263', '011214228952', 'rusticvillahotel@outlook.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('84', 'Elevated Mansion Hotel', '81 Garden Lane Faridpur , Bangladesh', '23', 'A Serenely Elegant hotel in Faridpur.', 'dummy.jpg', '3046', '014787644880', 'elevatedmansionhotel@gmail.com', '0', '0', '0', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('85', 'Luxurious Resort Hotel', '49 Ocean Drive Faridpur , Bangladesh', '23', 'A Exquisitely Rustic hotel in Faridpur.', 'dummy.jpg', '2130', '011449017469', 'luxuriousresorthotel@yahoo.com', '1', '1', '1', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('86', 'Modern Cottage Hotel', '64 Garden Lane Rangamati , Bangladesh', '28', 'A Gracefully Modern hotel in Rangamati.', 'dummy.jpg', '3078', '017184116102', 'moderncottagehotel@gmail.com', '1', '1', '0', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('87', 'Elevated Cottage Hotel', '41 Ocean Drive Bhola , Bangladesh', '25', 'A Majestically Rustic hotel in Bhola.', 'dummy.jpg', '3645', '015419986207', 'elevatedcottagehotel@yahoo.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('88', 'Charming Castle Hotel', '83 Harbor View Narsingdi , Bangladesh', '22', 'A Magically Elevated hotel in Narsingdi.', 'dummy.jpg', '3807', '016711691196', 'charmingcastlehotel@yahoo.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('89', 'Quaint Villa Hotel', '49 Ocean Drive Bandarban , Bangladesh', '24', 'A Exceptionally Elegant hotel in Bandarban.', 'dummy.jpg', '4227', '014178566853', 'quaintvillahotel@yahoo.com', '1', '1', '0', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('90', 'Luxurious Oasis Hotel', '50 Mountain Street Bhola , Bangladesh', '25', 'A Extravagantly Glorious hotel in Bhola.', 'dummy.jpg', '1169', '017955472834', 'luxuriousoasishotel@outlook.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('91', 'Luxurious Manor Hotel', '79 Mountain Street Manikganj , Bangladesh', '26', 'A Uniquely Elegant hotel in Manikganj.', 'dummy.jpg', '3145', '014736943514', 'luxuriousmanorhotel@gmail.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('92', 'Boutique Resort Hotel', '9 Mountain Street Tangail , Bangladesh', '19', 'A Exceptionally Rustic hotel in Tangail.', 'dummy.jpg', '906', '019392322989', 'boutiqueresorthotel@yahoo.com', '0', '1', '1', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('93', 'Seaside Lodge Hotel', '3 Ocean Drive Narsingdi , Bangladesh', '12', 'A Exquisitely Quaint hotel in Narsingdi.', 'dummy.jpg', '2651', '014825434984', 'seasidelodgehotel@yahoo.com', '0', '0', '0', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('94', 'Glorious Retreat Hotel', '25 Lakeview Drive Comilla , Bangladesh', '5', 'A Majestically Elevated hotel in Comilla.', 'dummy.jpg', '3877', '011753403204', 'gloriousretreathotel@outlook.com', '1', '0', '1', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('95', 'Cozy Resort Hotel', '29 Ocean Drive Naogaon , Bangladesh', '18', 'A Magically Luxurious hotel in Naogaon.', 'dummy.jpg', '4932', '012433797857', 'cozyresorthotel@yahoo.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('96', 'Quaint Oasis Hotel', '42 Lakeview Drive Comilla , Bangladesh', '5', 'A Magically Spectacular hotel in Comilla.', 'dummy.jpg', '3126', '018568827390', 'quaintoasishotel@yahoo.com', '1', '0', '0', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('97', 'Charming Inn Hotel', '8 Harbor View Naogaon , Bangladesh', '18', 'A Serenely Rustic hotel in Naogaon.', 'dummy.jpg', '4354', '019599834440', 'charminginnhotel@outlook.com', '1', '1', '0', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('98', 'Modern Lodge Hotel', '67 Sunset Boulevard Chandpur , Bangladesh', '30', 'A Enchantingly Charming hotel in Chandpur.', 'dummy.jpg', '3727', '014071493871', 'modernlodgehotel@yahoo.com', '0', '0', '1', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('99', 'Cozy Castle Hotel', '44 Ocean Drive Tangail , Bangladesh', '29', 'A Exquisitely Elevated hotel in Tangail.', 'dummy.jpg', '3857', '014298582868', 'cozycastlehotel@outlook.com', '1', '0', '1', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."HOTELS" VALUES ('100', 'Elegant Villa Hotel', '92 Riverfront Dhaka , Bangladesh', '1', 'A Uniquely Charming hotel in Dhaka.', 'dummy.jpg', '3830', '019547075359', 'elegantvillahotel@gmail.com', '0', '1', '0', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');

-- ----------------------------
-- Table structure for MEALSIN
-- ----------------------------
DROP TABLE "C##TRIPIFY"."MEALSIN";
CREATE TABLE "C##TRIPIFY"."MEALSIN" (
  "TRIP_ID" NUMBER VISIBLE NOT NULL,
  "RESTAURANT_ID" NUMBER VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of MEALSIN
-- ----------------------------
INSERT INTO "C##TRIPIFY"."MEALSIN" VALUES ('1', '1');
INSERT INTO "C##TRIPIFY"."MEALSIN" VALUES ('1', '2');
INSERT INTO "C##TRIPIFY"."MEALSIN" VALUES ('1', '3');
INSERT INTO "C##TRIPIFY"."MEALSIN" VALUES ('2', '10');
INSERT INTO "C##TRIPIFY"."MEALSIN" VALUES ('2', '15');
INSERT INTO "C##TRIPIFY"."MEALSIN" VALUES ('2', '20');
INSERT INTO "C##TRIPIFY"."MEALSIN" VALUES ('3', '18');
INSERT INTO "C##TRIPIFY"."MEALSIN" VALUES ('3', '21');
INSERT INTO "C##TRIPIFY"."MEALSIN" VALUES ('3', '22');

-- ----------------------------
-- Table structure for MESSAGES
-- ----------------------------
DROP TABLE "C##TRIPIFY"."MESSAGES";
CREATE TABLE "C##TRIPIFY"."MESSAGES" (
  "MESSAGE_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."MESSAGE_SEQ"."NEXTVAL" NOT NULL,
  "SENDER_ID" NUMBER VISIBLE NOT NULL,
  "RECEIVER_ID" NUMBER VISIBLE NOT NULL,
  "TEXT" VARCHAR2(1000 BYTE) VISIBLE,
  "SENT_AT" DATE VISIBLE DEFAULT CURRENT_DATE,
  "IS_SEEN" NUMBER(1,0) VISIBLE DEFAULT 0
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of MESSAGES
-- ----------------------------

-- ----------------------------
-- Table structure for NOTIFICATIONS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."NOTIFICATIONS";
CREATE TABLE "C##TRIPIFY"."NOTIFICATIONS" (
  "NOTIFICATION_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."NOTIFICATION_SEQ"."NEXTVAL" NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "NOTIFYING_DATE" DATE VISIBLE DEFAULT CURRENT_DATE,
  "TEXT" VARCHAR2(1000 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of NOTIFICATIONS
-- ----------------------------

-- ----------------------------
-- Table structure for POSTS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."POSTS";
CREATE TABLE "C##TRIPIFY"."POSTS" (
  "POST_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."POST_SEQ"."NEXTVAL" NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "POSTING_DATE" DATE VISIBLE DEFAULT CURRENT_DATE,
  "DESCRIPTION" VARCHAR2(1000 BYTE) VISIBLE,
  "IMAGE_URL" VARCHAR2(200 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of POSTS
-- ----------------------------

-- ----------------------------
-- Table structure for PROCEDURELOG
-- ----------------------------
DROP TABLE "C##TRIPIFY"."PROCEDURELOG";
CREATE TABLE "C##TRIPIFY"."PROCEDURELOG" (
  "LOG_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."LOG_SEQ"."NEXTVAL" NOT NULL,
  "PROCEDURE_NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "CALLING_DATE" DATE VISIBLE DEFAULT CURRENT_DATE NOT NULL,
  "USER_ID" NUMBER VISIBLE,
  "PARAMETERS" VARCHAR2(4000 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of PROCEDURELOG
-- ----------------------------
INSERT INTO "C##TRIPIFY"."PROCEDURELOG" VALUES ('1', 'CALCULATE_TRIP_PRICE', TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'), '0', 'total_price = 49878');
INSERT INTO "C##TRIPIFY"."PROCEDURELOG" VALUES ('2', 'AddTrip', TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', 'trip_id = 1, name = Summer Vacation in Paris');
INSERT INTO "C##TRIPIFY"."PROCEDURELOG" VALUES ('3', 'CALCULATE_TRIP_PRICE', TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'), '0', 'total_price = 55069');
INSERT INTO "C##TRIPIFY"."PROCEDURELOG" VALUES ('4', 'AddTrip', TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'), '2', 'trip_id = 2, name = Adventure in the Himalayas');
INSERT INTO "C##TRIPIFY"."PROCEDURELOG" VALUES ('5', 'CALCULATE_TRIP_PRICE', TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'), '0', 'total_price = 12580');
INSERT INTO "C##TRIPIFY"."PROCEDURELOG" VALUES ('6', 'AddTrip', TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'), '0', 'trip_id = 3, name = Relaxing Beach Vacation');

-- ----------------------------
-- Table structure for PROVIDES
-- ----------------------------
DROP TABLE "C##TRIPIFY"."PROVIDES";
CREATE TABLE "C##TRIPIFY"."PROVIDES" (
  "DESTINATION_ID" NUMBER VISIBLE NOT NULL,
  "ACTIVITY_ID" NUMBER VISIBLE NOT NULL,
  "PRICE" NUMBER VISIBLE,
  "IS_AVAILABLE" NUMBER(1,0) VISIBLE DEFAULT 1
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of PROVIDES
-- ----------------------------
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('1', '1', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('1', '4', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('1', '6', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('2', '8', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('2', '9', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('2', '20', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('3', '3', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('3', '6', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('3', '7', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('4', '10', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('4', '12', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('4', '45', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('5', '8', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('5', '9', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('5', '20', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('6', '2', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('6', '5', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('6', '36', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('7', '4', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('7', '5', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('7', '44', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('8', '8', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('8', '21', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('8', '45', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('9', '2', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('9', '5', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('9', '15', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('10', '3', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('10', '7', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('10', '15', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('11', '2', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('11', '6', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('11', '36', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('12', '25', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('12', '29', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('12', '45', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('13', '4', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('13', '15', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('13', '18', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('14', '7', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('14', '14', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('14', '31', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('15', '8', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('15', '9', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('15', '25', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('16', '29', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('16', '30', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('16', '31', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('17', '28', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('17', '30', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('17', '34', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('18', '2', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('18', '9', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('18', '12', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('19', '8', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('19', '9', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('19', '20', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('20', '3', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('20', '6', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('20', '34', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('21', '8', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('21', '9', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('21', '20', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('22', '1', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('22', '2', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('22', '3', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('23', '24', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('23', '25', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('23', '28', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('24', '2', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('24', '5', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('24', '33', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('25', '8', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('25', '9', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('25', '20', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('26', '3', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('26', '6', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('26', '7', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('27', '8', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('27', '9', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('27', '20', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('28', '26', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('28', '28', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('28', '34', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('29', '11', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('29', '29', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('29', '32', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('30', '11', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('30', '29', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('30', '32', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('31', '30', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('31', '31', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('31', '34', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('32', '13', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('32', '15', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('32', '16', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('33', '10', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('33', '29', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('33', '30', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('34', '3', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('34', '6', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('34', '26', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('35', '17', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('35', '19', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('35', '36', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('36', '17', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('36', '19', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('36', '36', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('37', '3', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('37', '6', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('37', '7', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('38', '11', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('38', '29', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('38', '32', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('39', '13', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('39', '15', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('39', '16', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('40', '8', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('40', '9', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('40', '20', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('41', '30', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('41', '31', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('41', '34', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('42', '13', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('42', '15', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('42', '16', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('43', '3', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('43', '6', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('43', '7', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('44', '13', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('44', '15', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('44', '16', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('45', '11', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('45', '29', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('45', '32', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('46', '3', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('46', '6', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('46', '7', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('47', '17', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('47', '19', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('47', '36', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('48', '8', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('48', '9', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('48', '20', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('49', '3', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('49', '6', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('49', '7', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('50', '26', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('50', '28', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('50', '34', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('51', '21', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('51', '22', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('51', '24', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('52', '26', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('52', '28', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('52', '34', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('53', '10', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('53', '11', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('53', '49', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('54', '18', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('54', '19', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('54', '25', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('55', '13', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('55', '15', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('55', '16', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('56', '11', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('56', '29', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('56', '32', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('57', '28', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('57', '30', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('57', '34', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('58', '10', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('58', '11', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('58', '49', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('59', '37', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('59', '38', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('59', '43', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('60', '38', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('60', '39', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('60', '48', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('61', '30', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('61', '31', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('61', '34', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('62', '13', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('62', '15', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('62', '16', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('63', '13', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('63', '15', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('63', '16', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('64', '26', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('64', '28', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('64', '34', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('65', '41', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('65', '42', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('65', '43', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('66', '26', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('66', '28', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('66', '34', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('67', '38', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('67', '39', '500', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('67', '48', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('68', '49', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('68', '50', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('69', '49', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('69', '50', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('70', '26', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('70', '28', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('70', '34', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('71', '30', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('71', '31', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('71', '34', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('72', '10', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('72', '11', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('72', '49', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('73', '13', '400', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('73', '15', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('73', '16', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('74', '17', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('74', '19', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('74', '36', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('75', '17', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('75', '19', '100', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('75', '36', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('76', '13', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('76', '15', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('76', '16', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('77', '28', '450', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('77', '30', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('77', '34', '350', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('78', '10', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('78', '11', '200', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('78', '49', '250', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('79', '3', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('79', '6', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('79', '7', '150', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('80', '17', '300', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('80', '19', '50', '1');
INSERT INTO "C##TRIPIFY"."PROVIDES" VALUES ('80', '36', '250', '1');

-- ----------------------------
-- Table structure for REACTS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."REACTS";
CREATE TABLE "C##TRIPIFY"."REACTS" (
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "POST_ID" NUMBER VISIBLE NOT NULL,
  "REACTING_DATE" DATE VISIBLE DEFAULT CURRENT_DATE,
  "REACT_TYPE" VARCHAR2(20 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of REACTS
-- ----------------------------

-- ----------------------------
-- Table structure for RESIDENCEIN
-- ----------------------------
DROP TABLE "C##TRIPIFY"."RESIDENCEIN";
CREATE TABLE "C##TRIPIFY"."RESIDENCEIN" (
  "TRIP_ID" NUMBER VISIBLE NOT NULL,
  "HOTEL_ID" NUMBER VISIBLE NOT NULL,
  "CHECKIN_DATE" DATE VISIBLE,
  "CHECKOUT_DATE" DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of RESIDENCEIN
-- ----------------------------
INSERT INTO "C##TRIPIFY"."RESIDENCEIN" VALUES ('1', '1', TO_DATE('2023-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."RESIDENCEIN" VALUES ('1', '2', TO_DATE('2023-07-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."RESIDENCEIN" VALUES ('2', '5', TO_DATE('2023-08-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."RESIDENCEIN" VALUES ('2', '8', TO_DATE('2023-08-25 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."RESIDENCEIN" VALUES ('3', '25', TO_DATE('2023-09-05 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."RESIDENCEIN" VALUES ('3', '30', TO_DATE('2023-09-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for RESTAURANTREVIEWS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."RESTAURANTREVIEWS";
CREATE TABLE "C##TRIPIFY"."RESTAURANTREVIEWS" (
  "REVIEW_ID" NUMBER VISIBLE NOT NULL,
  "RESTAURANT_ID" NUMBER VISIBLE NOT NULL,
  "FOOD_QUALITY" VARCHAR2(100 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of RESTAURANTREVIEWS
-- ----------------------------

-- ----------------------------
-- Table structure for RESTAURANTS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."RESTAURANTS";
CREATE TABLE "C##TRIPIFY"."RESTAURANTS" (
  "RESTAURANT_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."RESTAURANT_SEQ"."NEXTVAL" NOT NULL,
  "NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "RESERVATION_PRICE" NUMBER VISIBLE,
  "ADDRESS" VARCHAR2(200 BYTE) VISIBLE,
  "CITY_ID" NUMBER VISIBLE NOT NULL,
  "DESCRIPTION" VARCHAR2(1000 BYTE) VISIBLE,
  "IMAGE_URL" VARCHAR2(200 BYTE) VISIBLE,
  "CUISINE_TYPE" VARCHAR2(20 BYTE) VISIBLE,
  "CONTACT" VARCHAR2(20 BYTE) VISIBLE,
  "EMAIL" VARCHAR2(100 BYTE) VISIBLE,
  "CREATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "LAST_UPDATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "CREATOR_USER_ID" NUMBER VISIBLE DEFAULT 0
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of RESTAURANTS
-- ----------------------------
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('1', 'Authentic Eatery Dim Sum Restaurant', '276', '24 Culinary Avenue', '19', 'A restaurant serving Authentically Cozy Italian Curry.', 'dummy.jpg', 'Italian', '011242474493', 'authenticeaterydimsumrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('2', 'Authentic Osteria Pasta Restaurant', '218', '95 Restaurant Row', '7', 'A restaurant serving Enchantingly Quaint Italian Pasta.', 'dummy.jpg', 'French', '017798589617', 'authenticosteriapastarestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('3', 'Quaint Brasserie Curry Restaurant', '421', '92 Riverfront', '4', 'A restaurant serving Enchantingly Authentic Bangladeshi Kebab.', 'dummy.jpg', 'Chinese', '012735241493', 'quaintbrasseriecurryrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('4', 'Delicious Cafe Biryani Restaurant', '460', '19 Lakeview Drive', '28', 'A restaurant serving Wonderfully Cozy Thai Pasta.', 'dummy.jpg', 'Thai', '017157505197', 'deliciouscafebiryanirestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('5', 'Elegant Steakhouse Tacos Restaurant', '69', '52 Gourmet Street', '2', 'A restaurant serving Exquisitely Savory Bangladeshi Kebab.', 'dummy.jpg', 'Japanese', '018488659370', 'elegantsteakhousetacosrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('6', 'Delicious Bistro Biryani Restaurant', '112', '40 Cafeteria Lane', '17', 'A restaurant serving Tastefully Fusion Indian Kebab.', 'dummy.jpg', 'Mexican', '018679129439', 'deliciousbistrobiryanirestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('7', 'Cozy Diner Dim Sum Restaurant', '94', '15 Food Court', '10', 'A restaurant serving Savoringly Cozy Mediterranean Curry.', 'dummy.jpg', 'Mexican', '013365604241', 'cozydinerdimsumrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('8', 'Gourmet Bistro Steak Restaurant', '368', '57 Cafeteria Lane', '20', 'A restaurant serving Elegantly Elegant Greek Biryani.', 'dummy.jpg', 'Spanish', '011917375219', 'gourmetbistrosteakrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('9', 'Delicious Kitchen Pizza Restaurant', '225', '100 Cafeteria Lane', '30', 'A restaurant serving Passionately Fusion Mediterranean Burger.', 'dummy.jpg', 'Japanese', '015367128777', 'deliciouskitchenpizzarestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('10', 'Quaint Bistro Sushi Restaurant', '235', '95 Dining Boulevard', '30', 'A restaurant serving Savoringly Cozy Greek Pasta.', 'dummy.jpg', 'Mediterranean', '015307778573', 'quaintbistrosushirestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('11', 'Seaside Bistro Pizza Restaurant', '388', '26 Culinary Avenue', '24', 'A restaurant serving Delightfully Exquisite Bangladeshi Tacos.', 'dummy.jpg', 'Spanish', '016627773814', 'seasidebistropizzarestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('12', 'Cozy Osteria Dim Sum Restaurant', '273', '11 Cafeteria Lane', '9', 'A restaurant serving Savoringly Savory Greek Pasta.', 'dummy.jpg', 'Bangladeshi', '018544661787', 'cozyosteriadimsumrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('13', 'Seaside Eatery Pasta Restaurant', '94', '21 Culinary Avenue', '28', 'A restaurant serving Enchantingly Cozy Chinese Dim Sum.', 'dummy.jpg', 'Greek', '011643711755', 'seasideeaterypastarestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('14', 'Gourmet Kitchen Kebab Restaurant', '59', '17 Restaurant Row', '7', 'A restaurant serving Elegantly Gourmet Chinese Curry.', 'dummy.jpg', 'Mexican', '018587798518', 'gourmetkitchenkebabrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('15', 'Authentic Pizzeria Burger Restaurant', '72', '60 Riverfront', '10', 'A restaurant serving Passionately Elegant Greek Dim Sum.', 'dummy.jpg', 'Italian', '015135654557', 'authenticpizzeriaburgerrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('16', 'Authentic Tavern Tacos Restaurant', '175', '86 Foodie Street', '10', 'A restaurant serving Delightfully Delicious Chinese Dim Sum.', 'dummy.jpg', 'Chinese', '013415364356', 'authentictaverntacosrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('17', 'Quaint Bakery Steak Restaurant', '361', '7 Lakeview Drive', '2', 'A restaurant serving Enchantingly Fusion Japanese Biryani.', 'dummy.jpg', 'Spanish', '017133495055', 'quaintbakerysteakrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('18', 'Elegant Bakery Tacos Restaurant', '315', '66 Restaurant Row', '21', 'A restaurant serving Exquisitely Rustic Thai Tacos.', 'dummy.jpg', 'Spanish', '017543018743', 'elegantbakerytacosrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('19', 'Charming Diner Pasta Restaurant', '67', '18 Gourmet Street', '27', 'A restaurant serving Uniquely Quaint Italian Pizza.', 'dummy.jpg', 'Bangladeshi', '012118308660', 'charmingdinerpastarestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('20', 'Seaside Bistro Sushi Restaurant', '202', '50 Gourmet Street', '6', 'A restaurant serving Elegantly Fusion Italian Pizza.', 'dummy.jpg', 'Greek', '016594284269', 'seasidebistrosushirestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('21', 'Cozy Kitchen Kebab Restaurant', '410', '37 Food Court', '2', 'A restaurant serving Elegantly Gourmet Greek Steak.', 'dummy.jpg', 'Mediterranean', '011133472822', 'cozykitchenkebabrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('22', 'Cozy Cafe Seafood Restaurant', '175', '37 Main Street', '22', 'A restaurant serving Exquisitely Rustic Mediterranean Burger.', 'dummy.jpg', 'Indian', '015311347085', 'cozycafeseafoodrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('23', 'Savory Eatery Pasta Restaurant', '303', '86 Main Street', '11', 'A restaurant serving Tastefully Charming Italian Tacos.', 'dummy.jpg', 'Japanese', '015007176802', 'savoryeaterypastarestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('24', 'Savory Diner Pasta Restaurant', '449', '100 Food Court', '27', 'A restaurant serving Authentically Cozy Mediterranean Burger.', 'dummy.jpg', 'Chinese', '018879719034', 'savorydinerpastarestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('25', 'Gourmet Bakery Steak Restaurant', '370', '83 Dining Boulevard', '22', 'A restaurant serving Wonderfully Charming Japanese Steak.', 'dummy.jpg', 'Mediterranean', '015751082137', 'gourmetbakerysteakrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('26', 'Gourmet Bakery Kebab Restaurant', '94', '43 Food Court', '9', 'A restaurant serving Tastefully Delicious Mediterranean Sushi.', 'dummy.jpg', 'Thai', '013692091158', 'gourmetbakerykebabrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('27', 'Delicious Brasserie Kebab Restaurant', '345', '86 Riverfront', '7', 'A restaurant serving Authentically Fusion Mexican Dim Sum.', 'dummy.jpg', 'Bangladeshi', '015628317750', 'deliciousbrasseriekebabrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('28', 'Charming Kitchen Burger Restaurant', '289', '69 Main Street', '5', 'A restaurant serving Passionately Rustic Indian Sushi.', 'dummy.jpg', 'Mediterranean', '011362127958', 'charmingkitchenburgerrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('29', 'Gourmet Steakhouse Kebab Restaurant', '265', '33 Gourmet Street', '12', 'A restaurant serving Wonderfully Gourmet Spanish Burger.', 'dummy.jpg', 'Bangladeshi', '011511514963', 'gourmetsteakhousekebabrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('30', 'Authentic Brasserie Burger Restaurant', '63', '83 Culinary Avenue', '17', 'A restaurant serving Wonderfully Savory Mexican Pasta.', 'dummy.jpg', 'Spanish', '018472868549', 'authenticbrasserieburgerrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('31', 'Fusion Grill Sushi Restaurant', '324', '82 Restaurant Row', '30', 'A restaurant serving Enchantingly Seaside Greek Dim Sum.', 'dummy.jpg', 'Thai', '015889645462', 'fusiongrillsushirestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('32', 'Charming Kitchen Pizza Restaurant', '93', '7 Riverfront', '14', 'A restaurant serving Elegantly Seaside Japanese Curry.', 'dummy.jpg', 'Mexican', '019871222331', 'charmingkitchenpizzarestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('33', 'Charming Bakery Sushi Restaurant', '475', '63 Riverfront', '15', 'A restaurant serving Exquisitely Charming Italian Burger.', 'dummy.jpg', 'Greek', '012994402200', 'charmingbakerysushirestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('34', 'Exquisite Steakhouse Curry Restaurant', '160', '88 Culinary Avenue', '23', 'A restaurant serving Elegantly Rustic Mediterranean Kebab.', 'dummy.jpg', 'Spanish', '019419208704', 'exquisitesteakhousecurryrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('35', 'Rustic Steakhouse Seafood Restaurant', '230', '27 Riverfront', '11', 'A restaurant serving Enchantingly Savory Chinese Steak.', 'dummy.jpg', 'Thai', '017008859759', 'rusticsteakhouseseafoodrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('36', 'Fusion Grill Curry Restaurant', '482', '63 Lakeview Drive', '1', 'A restaurant serving Enchantingly Charming Mediterranean Pizza.', 'dummy.jpg', 'Italian', '016232645908', 'fusiongrillcurryrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('37', 'Seaside Grill Curry Restaurant', '453', '69 Lakeview Drive', '18', 'A restaurant serving Enchantingly Authentic French Burger.', 'dummy.jpg', 'Mediterranean', '016587201318', 'seasidegrillcurryrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('38', 'Gourmet Pizzeria Seafood Restaurant', '256', '18 Riverfront', '26', 'A restaurant serving Exquisitely Gourmet Mexican Dim Sum.', 'dummy.jpg', 'Thai', '017574599045', 'gourmetpizzeriaseafoodrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('39', 'Fusion Brasserie Tacos Restaurant', '362', '10 Riverfront', '23', 'A restaurant serving Passionately Quaint Indian Curry.', 'dummy.jpg', 'Spanish', '019877383252', 'fusionbrasserietacosrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('40', 'Gourmet Bakery Sushi Restaurant', '207', '48 Culinary Avenue', '10', 'A restaurant serving Savoringly Exquisite Chinese Curry.', 'dummy.jpg', 'Spanish', '012951895576', 'gourmetbakerysushirestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('41', 'Seaside Bistro Burger Restaurant', '495', '28 Main Street', '4', 'A restaurant serving Enchantingly Savory Bangladeshi Dim Sum.', 'dummy.jpg', 'Japanese', '016875667752', 'seasidebistroburgerrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('42', 'Gourmet Osteria Biryani Restaurant', '313', '35 Dining Boulevard', '25', 'A restaurant serving Uniquely Quaint French Dim Sum.', 'dummy.jpg', 'Greek', '017908806231', 'gourmetosteriabiryanirestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('43', 'Gourmet Cafe Pasta Restaurant', '85', '98 Restaurant Row', '6', 'A restaurant serving Delightfully Delicious Mexican Seafood.', 'dummy.jpg', 'Indian', '019843367500', 'gourmetcafepastarestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('44', 'Elegant Cafe Pizza Restaurant', '438', '24 Riverfront', '22', 'A restaurant serving Elegantly Charming Indian Seafood.', 'dummy.jpg', 'Thai', '011036951926', 'elegantcafepizzarestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('45', 'Elegant Pizzeria Pasta Restaurant', '178', '19 Food Court', '23', 'A restaurant serving Wonderfully Elegant Mexican Kebab.', 'dummy.jpg', 'Greek', '016505185657', 'elegantpizzeriapastarestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('46', 'Quaint Eatery Burger Restaurant', '105', '82 Cafeteria Lane', '4', 'A restaurant serving Delightfully Fusion Thai Kebab.', 'dummy.jpg', 'Italian', '018667115750', 'quainteateryburgerrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('47', 'Elegant Steakhouse Sushi Restaurant', '351', '34 Food Court', '30', 'A restaurant serving Exquisitely Seaside Greek Sushi.', 'dummy.jpg', 'Spanish', '019735996711', 'elegantsteakhousesushirestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('48', 'Delicious Osteria Tacos Restaurant', '445', '52 Food Court', '9', 'A restaurant serving Wonderfully Rustic Chinese Tacos.', 'dummy.jpg', 'Indian', '018658728511', 'deliciousosteriatacosrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('49', 'Elegant Kitchen Sushi Restaurant', '268', '32 Dining Boulevard', '5', 'A restaurant serving Passionately Elegant Indian Dim Sum.', 'dummy.jpg', 'Bangladeshi', '015436245249', 'elegantkitchensushirestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('50', 'Seaside Eatery Pizza Restaurant', '207', '82 Culinary Avenue', '3', 'A restaurant serving Exquisitely Elegant Chinese Steak.', 'dummy.jpg', 'Japanese', '011369539554', 'seasideeaterypizzarestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('51', 'Cozy Osteria Burger Restaurant', '224', '33 Food Court', '9', 'A restaurant serving Elegantly Authentic Thai Pizza.', 'dummy.jpg', 'Bangladeshi', '011271017151', 'cozyosteriaburgerrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('52', 'Gourmet Osteria Seafood Restaurant', '399', '80 Foodie Street', '23', 'A restaurant serving Delightfully Fusion Spanish Seafood.', 'dummy.jpg', 'Japanese', '011689181127', 'gourmetosteriaseafoodrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('53', 'Exquisite Brasserie Kebab Restaurant', '333', '10 Culinary Avenue', '8', 'A restaurant serving Elegantly Gourmet Greek Dim Sum.', 'dummy.jpg', 'Indian', '018304282338', 'exquisitebrasseriekebabrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('54', 'Delicious Pizzeria Seafood Restaurant', '237', '96 Restaurant Row', '4', 'A restaurant serving Passionately Authentic Bangladeshi Pizza.', 'dummy.jpg', 'Chinese', '012355969091', 'deliciouspizzeriaseafoodrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('55', 'Elegant Brasserie Curry Restaurant', '155', '42 Foodie Street', '2', 'A restaurant serving Savoringly Delicious Bangladeshi Kebab.', 'dummy.jpg', 'Mediterranean', '016619827787', 'elegantbrasseriecurryrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('56', 'Charming Eatery Biryani Restaurant', '286', '13 Main Street', '2', 'A restaurant serving Elegantly Authentic Chinese Biryani.', 'dummy.jpg', 'Italian', '012235293859', 'charmingeaterybiryanirestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('57', 'Exquisite Tavern Burger Restaurant', '393', '40 Gourmet Street', '8', 'A restaurant serving Uniquely Gourmet Greek Curry.', 'dummy.jpg', 'Greek', '014571648852', 'exquisitetavernburgerrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('58', 'Savory Bakery Seafood Restaurant', '336', '74 Main Street', '13', 'A restaurant serving Enchantingly Savory Greek Curry.', 'dummy.jpg', 'Thai', '017971508645', 'savorybakeryseafoodrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('59', 'Fusion Bakery Dim Sum Restaurant', '58', '81 Lakeview Drive', '27', 'A restaurant serving Elegantly Gourmet Bangladeshi Steak.', 'dummy.jpg', 'Mexican', '014608643088', 'fusionbakerydimsumrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('60', 'Quaint Bistro Tacos Restaurant', '128', '89 Lakeview Drive', '11', 'A restaurant serving Delightfully Gourmet Mexican Burger.', 'dummy.jpg', 'Indian', '018657592538', 'quaintbistrotacosrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('61', 'Quaint Osteria Pizza Restaurant', '64', '70 Gourmet Street', '15', 'A restaurant serving Tastefully Rustic French Biryani.', 'dummy.jpg', 'Mexican', '011907942896', 'quaintosteriapizzarestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('62', 'Seaside Cafe Dim Sum Restaurant', '61', '1 Cafeteria Lane', '24', 'A restaurant serving Savoringly Charming Greek Tacos.', 'dummy.jpg', 'Mexican', '015855659558', 'seasidecafedimsumrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('63', 'Authentic Osteria Biryani Restaurant', '247', '14 Cafeteria Lane', '17', 'A restaurant serving Elegantly Charming Italian Kebab.', 'dummy.jpg', 'Chinese', '018256235693', 'authenticosteriabiryanirestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('64', 'Delicious Pizzeria Pasta Restaurant', '325', '40 Dining Boulevard', '13', 'A restaurant serving Tastefully Seaside Spanish Kebab.', 'dummy.jpg', 'Italian', '017228868815', 'deliciouspizzeriapastarestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('65', 'Delicious Eatery Curry Restaurant', '222', '49 Cafeteria Lane', '12', 'A restaurant serving Delightfully Authentic Thai Curry.', 'dummy.jpg', 'French', '014074458087', 'deliciouseaterycurryrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('66', 'Authentic Osteria Curry Restaurant', '163', '41 Gourmet Street', '18', 'A restaurant serving Uniquely Cozy Indian Curry.', 'dummy.jpg', 'French', '015565556352', 'authenticosteriacurryrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('67', 'Delicious Tavern Seafood Restaurant', '288', '77 Cafeteria Lane', '7', 'A restaurant serving Elegantly Fusion Italian Tacos.', 'dummy.jpg', 'Mediterranean', '015084858123', 'delicioustavernseafoodrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('68', 'Charming Osteria Pasta Restaurant', '286', '95 Restaurant Row', '30', 'A restaurant serving Elegantly Charming Spanish Tacos.', 'dummy.jpg', 'Bangladeshi', '012389206655', 'charmingosteriapastarestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('69', 'Authentic Kitchen Sushi Restaurant', '167', '77 Gourmet Street', '7', 'A restaurant serving Exquisitely Cozy Thai Kebab.', 'dummy.jpg', 'Greek', '019592188847', 'authentickitchensushirestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('70', 'Gourmet Kitchen Burger Restaurant', '180', '80 Gourmet Street', '27', 'A restaurant serving Exquisitely Authentic Greek Burger.', 'dummy.jpg', 'Greek', '016005015797', 'gourmetkitchenburgerrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('71', 'Rustic Tavern Pizza Restaurant', '404', '33 Food Court', '2', 'A restaurant serving Wonderfully Fusion Indian Sushi.', 'dummy.jpg', 'Italian', '019344861174', 'rustictavernpizzarestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('72', 'Rustic Kitchen Seafood Restaurant', '410', '82 Gourmet Street', '2', 'A restaurant serving Tastefully Savory Japanese Steak.', 'dummy.jpg', 'Greek', '014793421127', 'rustickitchenseafoodrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('73', 'Cozy Bakery Steak Restaurant', '377', '94 Main Street', '23', 'A restaurant serving Passionately Elegant Chinese Pasta.', 'dummy.jpg', 'Japanese', '012414961888', 'cozybakerysteakrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('74', 'Quaint Eatery Steak Restaurant', '119', '55 Gourmet Street', '25', 'A restaurant serving Authentically Elegant Spanish Kebab.', 'dummy.jpg', 'Indian', '018036947645', 'quainteaterysteakrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('75', 'Charming Pizzeria Tacos Restaurant', '77', '33 Cafeteria Lane', '26', 'A restaurant serving Delightfully Charming French Dim Sum.', 'dummy.jpg', 'Chinese', '014442279453', 'charmingpizzeriatacosrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('76', 'Cozy Steakhouse Steak Restaurant', '292', '83 Main Street', '5', 'A restaurant serving Wonderfully Elegant Italian Tacos.', 'dummy.jpg', 'Bangladeshi', '016415159278', 'cozysteakhousesteakrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('77', 'Delicious Tavern Sushi Restaurant', '361', '90 Restaurant Row', '24', 'A restaurant serving Tastefully Gourmet Bangladeshi Kebab.', 'dummy.jpg', 'Mexican', '019196607505', 'delicioustavernsushirestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('78', 'Authentic Kitchen Steak Restaurant', '438', '34 Main Street', '23', 'A restaurant serving Authentically Authentic Greek Burger.', 'dummy.jpg', 'Mexican', '011621816820', 'authentickitchensteakrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('79', 'Exquisite Diner Dim Sum Restaurant', '86', '85 Culinary Avenue', '29', 'A restaurant serving Delightfully Exquisite Mediterranean Pasta.', 'dummy.jpg', 'French', '019901801141', 'exquisitedinerdimsumrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('80', 'Delicious Cafe Pizza Restaurant', '139', '67 Culinary Avenue', '30', 'A restaurant serving Wonderfully Rustic Mexican Steak.', 'dummy.jpg', 'Mediterranean', '014154559461', 'deliciouscafepizzarestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('81', 'Cozy Pizzeria Biryani Restaurant', '53', '14 Dining Boulevard', '19', 'A restaurant serving Exquisitely Rustic Spanish Seafood.', 'dummy.jpg', 'Mediterranean', '014388676050', 'cozypizzeriabiryanirestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('82', 'Authentic Bakery Sushi Restaurant', '93', '81 Foodie Street', '27', 'A restaurant serving Exquisitely Fusion Thai Dim Sum.', 'dummy.jpg', 'Indian', '019634743138', 'authenticbakerysushirestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('83', 'Delicious Pizzeria Burger Restaurant', '182', '85 Lakeview Drive', '3', 'A restaurant serving Enchantingly Exquisite Mexican Pizza.', 'dummy.jpg', 'Japanese', '017016984806', 'deliciouspizzeriaburgerrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('84', 'Quaint Diner Pasta Restaurant', '121', '63 Cafeteria Lane', '17', 'A restaurant serving Exquisitely Savory Mexican Pasta.', 'dummy.jpg', 'Greek', '018672007285', 'quaintdinerpastarestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('85', 'Charming Cafe Kebab Restaurant', '115', '91 Riverfront', '14', 'A restaurant serving Savoringly Savory Chinese Pasta.', 'dummy.jpg', 'French', '019836888652', 'charmingcafekebabrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('86', 'Cozy Bistro Kebab Restaurant', '216', '56 Gourmet Street', '4', 'A restaurant serving Tastefully Authentic Italian Sushi.', 'dummy.jpg', 'Mediterranean', '011257825240', 'cozybistrokebabrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('87', 'Delicious Cafe Steak Restaurant', '273', '70 Dining Boulevard', '21', 'A restaurant serving Uniquely Cozy Chinese Tacos.', 'dummy.jpg', 'Indian', '017517009788', 'deliciouscafesteakrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('88', 'Authentic Eatery Seafood Restaurant', '70', '55 Food Court', '2', 'A restaurant serving Elegantly Gourmet Japanese Biryani.', 'dummy.jpg', 'French', '014226126878', 'authenticeateryseafoodrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('89', 'Rustic Brasserie Curry Restaurant', '229', '91 Riverfront', '11', 'A restaurant serving Wonderfully Quaint Chinese Pasta.', 'dummy.jpg', 'Mediterranean', '013282801429', 'rusticbrasseriecurryrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('90', 'Exquisite Eatery Sushi Restaurant', '110', '28 Culinary Avenue', '20', 'A restaurant serving Exquisitely Cozy Mediterranean Tacos.', 'dummy.jpg', 'Mexican', '013524062302', 'exquisiteeaterysushirestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('91', 'Savory Diner Steak Restaurant', '478', '21 Main Street', '1', 'A restaurant serving Delightfully Delicious French Dim Sum.', 'dummy.jpg', 'Chinese', '014661732138', 'savorydinersteakrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('92', 'Rustic Diner Pasta Restaurant', '370', '41 Lakeview Drive', '23', 'A restaurant serving Elegantly Seaside Spanish Sushi.', 'dummy.jpg', 'Indian', '012822487986', 'rusticdinerpastarestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('93', 'Seaside Kitchen Pasta Restaurant', '259', '48 Restaurant Row', '5', 'A restaurant serving Passionately Cozy French Burger.', 'dummy.jpg', 'Mediterranean', '013053758178', 'seasidekitchenpastarestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('94', 'Exquisite Osteria Steak Restaurant', '191', '51 Riverfront', '1', 'A restaurant serving Uniquely Cozy French Pizza.', 'dummy.jpg', 'Indian', '013023935588', 'exquisiteosteriasteakrestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('95', 'Fusion Bakery Steak Restaurant', '368', '13 Restaurant Row', '21', 'A restaurant serving Tastefully Delicious Italian Curry.', 'dummy.jpg', 'Japanese', '016106026864', 'fusionbakerysteakrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('96', 'Delicious Pizzeria Kebab Restaurant', '167', '16 Gourmet Street', '13', 'A restaurant serving Enchantingly Authentic Indian Pasta.', 'dummy.jpg', 'Chinese', '015125446746', 'deliciouspizzeriakebabrestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('97', 'Charming Bakery Sushi Restaurant', '85', '43 Dining Boulevard', '1', 'A restaurant serving Passionately Gourmet Mediterranean Dim Sum.', 'dummy.jpg', 'Japanese', '016551585945', 'charmingbakerysushirestaurant@gmail.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('98', 'Gourmet Cafe Tacos Restaurant', '434', '46 Culinary Avenue', '2', 'A restaurant serving Savoringly Quaint Mediterranean Burger.', 'dummy.jpg', 'Thai', '014461865495', 'gourmetcafetacosrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('99', 'Exquisite Cafe Dim Sum Restaurant', '261', '73 Lakeview Drive', '7', 'A restaurant serving Passionately Elegant Mexican Biryani.', 'dummy.jpg', 'Spanish', '015324678992', 'exquisitecafedimsumrestaurant@yahoo.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "C##TRIPIFY"."RESTAURANTS" VALUES ('100', 'Delicious Grill Biryani Restaurant', '464', '19 Culinary Avenue', '26', 'A restaurant serving Savoringly Quaint Mediterranean Curry.', 'dummy.jpg', 'Mediterranean', '018559331930', 'deliciousgrillbiryanirestaurant@outlook.com', TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:57', 'SYYYY-MM-DD HH24:MI:SS'), '0');

-- ----------------------------
-- Table structure for REVIEWS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."REVIEWS";
CREATE TABLE "C##TRIPIFY"."REVIEWS" (
  "REVIEW_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."REVIEW_SEQ"."NEXTVAL" NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "POSTING_DATE" DATE VISIBLE DEFAULT CURRENT_DATE,
  "DESCRIPTION" VARCHAR2(1000 BYTE) VISIBLE,
  "RATING" NUMBER VISIBLE,
  "IMAGE_URL" VARCHAR2(200 BYTE) VISIBLE,
  "UPVOTE_COUNT" NUMBER VISIBLE DEFAULT 0
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of REVIEWS
-- ----------------------------

-- ----------------------------
-- Table structure for TRIPBOOKINGS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."TRIPBOOKINGS";
CREATE TABLE "C##TRIPIFY"."TRIPBOOKINGS" (
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "TRIP_ID" NUMBER VISIBLE NOT NULL,
  "BOOKING_DATE" DATE VISIBLE DEFAULT CURRENT_DATE,
  "IS_PAID" NUMBER(1,0) VISIBLE DEFAULT 0,
  "IS_PROCESSED" NUMBER(1,0) VISIBLE DEFAULT 0,
  "IS_COMPLETED" NUMBER(1,0) VISIBLE DEFAULT 0,
  "PAYMENT_METHOD" VARCHAR2(50 BYTE) VISIBLE,
  "TRANSACTION_ID" VARCHAR2(100 BYTE) VISIBLE,
  "PAYMENT_DATE" DATE VISIBLE,
  "COMPLETION_DATE" DATE VISIBLE,
  "IS_PRIVATE" NUMBER(1,0) VISIBLE DEFAULT 0,
  "CREATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "LAST_UPDATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "DELETED_ON" DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of TRIPBOOKINGS
-- ----------------------------

-- ----------------------------
-- Table structure for TRIPGUIDES
-- ----------------------------
DROP TABLE "C##TRIPIFY"."TRIPGUIDES";
CREATE TABLE "C##TRIPIFY"."TRIPGUIDES" (
  "TRIP_ID" NUMBER VISIBLE NOT NULL,
  "GUIDE_ID" NUMBER VISIBLE NOT NULL,
  "REGISTERED_ON" DATE VISIBLE DEFAULT CURRENT_DATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of TRIPGUIDES
-- ----------------------------
INSERT INTO "C##TRIPIFY"."TRIPGUIDES" VALUES ('1', '1', TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."TRIPGUIDES" VALUES ('1', '2', TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."TRIPGUIDES" VALUES ('2', '1', TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."TRIPGUIDES" VALUES ('3', '1', TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##TRIPIFY"."TRIPGUIDES" VALUES ('3', '2', TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for TRIPREVIEWS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."TRIPREVIEWS";
CREATE TABLE "C##TRIPIFY"."TRIPREVIEWS" (
  "REVIEW_ID" NUMBER VISIBLE NOT NULL,
  "TRIP_ID" NUMBER VISIBLE NOT NULL,
  "MANAGEMENT_QUALITY" VARCHAR2(100 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of TRIPREVIEWS
-- ----------------------------

-- ----------------------------
-- Table structure for TRIPS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."TRIPS";
CREATE TABLE "C##TRIPIFY"."TRIPS" (
  "TRIP_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."TRIP_SEQ"."NEXTVAL" NOT NULL,
  "FROM_CITY_ID" NUMBER VISIBLE,
  "TO_CITY_ID" NUMBER VISIBLE,
  "NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "DESCRIPTION" VARCHAR2(1000 BYTE) VISIBLE,
  "IMAGE_URL" VARCHAR2(200 BYTE) VISIBLE,
  "TOTAL_PRICE" NUMBER VISIBLE,
  "START_DATE" DATE VISIBLE,
  "END_DATE" DATE VISIBLE,
  "CREATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "LAST_UPDATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "DELETED_ON" DATE VISIBLE,
  "CREATOR_USER_ID" NUMBER VISIBLE DEFAULT 0
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of TRIPS
-- ----------------------------
INSERT INTO "C##TRIPIFY"."TRIPS" VALUES ('1', '1', '2', 'Summer Vacation in Paris', 'Enjoy the charm of Paris in summer', 'paris_summer.jpg', '49878', TO_DATE('2023-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-25 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1');
INSERT INTO "C##TRIPIFY"."TRIPS" VALUES ('2', '3', '4', 'Adventure in the Himalayas', 'Experience thrilling adventure in the Himalayas', 'himalayas_adventure.jpg', '55069', TO_DATE('2023-08-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-30 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '2');
INSERT INTO "C##TRIPIFY"."TRIPS" VALUES ('3', '5', '6', 'Relaxing Beach Vacation', 'Unwind on the beautiful beaches of Maldives', 'maldives_beach.jpg', '12580', TO_DATE('2023-09-05 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-20 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:58', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '0');

-- ----------------------------
-- Table structure for USERS
-- ----------------------------
DROP TABLE "C##TRIPIFY"."USERS";
CREATE TABLE "C##TRIPIFY"."USERS" (
  "USER_ID" NUMBER VISIBLE DEFAULT "C##TRIPIFY"."USER_SEQ"."NEXTVAL" NOT NULL,
  "USERNAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "EMAIL" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "PASSWORD_HASH" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "ROLE" VARCHAR2(50 BYTE) VISIBLE DEFAULT 'client',
  "NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "BIO" VARCHAR2(200 BYTE) VISIBLE DEFAULT 'Hey! I am using Tripify',
  "CITY_ID" NUMBER VISIBLE DEFAULT 0 NOT NULL,
  "FACEBOOK_URL" VARCHAR2(50 BYTE) VISIBLE DEFAULT 'https://www.facebook.com/leomessi',
  "TWITTER_URL" VARCHAR2(50 BYTE) VISIBLE DEFAULT 'https://twitter.com/imessi',
  "INSTAGRAM_URL" VARCHAR2(50 BYTE) VISIBLE DEFAULT 'https://www.instagram.com/leomessi',
  "PROFILE_PICTURE" VARCHAR2(200 BYTE) VISIBLE DEFAULT 'https://avatars.dicebear.com/api/avataaars/avatar.svg',
  "REGISTRATION_DATE" DATE VISIBLE DEFAULT CURRENT_DATE NOT NULL,
  "STATUS" VARCHAR2(20 BYTE) VISIBLE DEFAULT 'active',
  "DOB" DATE VISIBLE NOT NULL,
  "CREATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "LAST_UPDATED_ON" DATE VISIBLE DEFAULT CURRENT_DATE,
  "DELETED_ON" DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of USERS
-- ----------------------------
INSERT INTO "C##TRIPIFY"."USERS" VALUES ('0', 'admin', 'admin@gmail.com', '4243946697', 'admin', 'Oppenheimer', 'I am from Andromida', '0', 'facebook.com/opp', 'twitter.com/opp', 'instagram.com/opp', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), 'active', TO_DATE('2002-09-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "C##TRIPIFY"."USERS" VALUES ('1', 'aaniksahaa', 'abc@gmail.com', '2560241216', 'client', 'Anik Saha', 'Little Coder', '1', 'facebook.com/abc', 'twitter.com/abc', 'instagram.com/abc', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), 'active', TO_DATE('2002-09-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "C##TRIPIFY"."USERS" VALUES ('2', 'jab3r', 'xyz@gmail.com', '1898372157', 'client', 'Jaber Ahmed Deeder', 'Pro Coder', '1', 'facebook.com/xyz', 'twitter.com/xyz', 'instagram.com/xyz', 'dummy.jpg', TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), 'active', TO_DATE('2002-09-17 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-22 00:16:56', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Function structure for ADDTRIP
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "C##TRIPIFY"."ADDTRIP" AS
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

-- ----------------------------
-- Function structure for CALCULATE_TRIP_PRICE
-- ----------------------------
CREATE OR REPLACE
FUNCTION "C##TRIPIFY"."CALCULATE_TRIP_PRICE" AS
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

-- ----------------------------
-- Function structure for CHECK_CREDENTIALS
-- ----------------------------
CREATE OR REPLACE
FUNCTION "C##TRIPIFY"."CHECK_CREDENTIALS" AS
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

-- ----------------------------
-- Function structure for DROPALLSEQUENCES
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "C##TRIPIFY"."DROPALLSEQUENCES" AS
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

-- ----------------------------
-- Function structure for DROPALLTABLES
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "C##TRIPIFY"."DROPALLTABLES" AS
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

-- ----------------------------
-- Function structure for HASH_PASSWORD
-- ----------------------------
CREATE OR REPLACE
FUNCTION "C##TRIPIFY"."HASH_PASSWORD" AS
BEGIN
  hashed_password := TO_CHAR(ORA_HASH(p_password));
  RETURN hashed_password;
END;
/

-- ----------------------------
-- Function structure for MY_HASH_PASSWORD
-- ----------------------------
CREATE OR REPLACE
FUNCTION "C##TRIPIFY"."MY_HASH_PASSWORD" AS
BEGIN
	SELECT TO_CHAR(ORA_HASH(p_password)) INTO hashed_password FROM DUAL;
  RETURN hashed_password;
END;
/

-- ----------------------------
-- Function structure for UPDATETRIP
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "C##TRIPIFY"."UPDATETRIP" AS
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
	
	SELECT creator_user_id INTO l_creator_user_id
	FROM TRIPS 
	WHERE trip_id = p_trip_id;
	
	
	INSERT INTO ProcedureLog( procedure_name, user_id, parameters )
	VALUES( 'UpdateTrip', l_creator_user_id, 'trip_id = ' || p_trip_id || ', name = ' || p_name );

  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
/

-- ----------------------------
-- Sequence structure for ACTIVITY_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."ACTIVITY_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."ACTIVITY_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for CITY_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."CITY_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."CITY_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for COMMENT_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."COMMENT_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."COMMENT_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for DESTINATION_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."DESTINATION_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."DESTINATION_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for FLIGHT_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."FLIGHT_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."FLIGHT_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for GROUP_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."GROUP_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."GROUP_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for GUIDE_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."GUIDE_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."GUIDE_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for HOTEL_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."HOTEL_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."HOTEL_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for LOG_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."LOG_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."LOG_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for MESSAGE_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."MESSAGE_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."MESSAGE_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for NOTIFICATION_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."NOTIFICATION_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."NOTIFICATION_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for POST_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."POST_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."POST_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for RESTAURANT_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."RESTAURANT_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."RESTAURANT_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for REVIEW_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."REVIEW_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."REVIEW_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for TRIP_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."TRIP_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."TRIP_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for USER_SEQ
-- ----------------------------
DROP SEQUENCE "C##TRIPIFY"."USER_SEQ";
CREATE SEQUENCE "C##TRIPIFY"."USER_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Primary Key structure for table ACTIVITIES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."ACTIVITIES" ADD CONSTRAINT "SYS_C0013453" PRIMARY KEY ("ACTIVITY_ID");

-- ----------------------------
-- Checks structure for table ACTIVITIES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."ACTIVITIES" ADD CONSTRAINT "SYS_C0013452" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table CITIES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."CITIES" ADD CONSTRAINT "SYS_C0013433" PRIMARY KEY ("CITY_ID");

-- ----------------------------
-- Checks structure for table CITIES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."CITIES" ADD CONSTRAINT "SYS_C0013430" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."CITIES" ADD CONSTRAINT "SYS_C0013431" CHECK ("COUNTRY_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."CITIES" ADD CONSTRAINT "SYS_C0013432" CHECK (LOWER(weather_type) IN ('sunny', 'rainy', 'cold', 'snowy')) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table COMMENTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."COMMENTS" ADD CONSTRAINT "SYS_C0013557" PRIMARY KEY ("COMMENT_ID");

-- ----------------------------
-- Checks structure for table COMMENTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."COMMENTS" ADD CONSTRAINT "SYS_C0013554" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."COMMENTS" ADD CONSTRAINT "SYS_C0013555" CHECK ("POST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."COMMENTS" ADD CONSTRAINT "SYS_C0013556" CHECK (upvote_count >= 0) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table CONNECTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."CONNECTS" ADD CONSTRAINT "SYS_C0013574" PRIMARY KEY ("USER_ID", "GROUP_ID");

-- ----------------------------
-- Checks structure for table CONNECTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."CONNECTS" ADD CONSTRAINT "SYS_C0013572" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."CONNECTS" ADD CONSTRAINT "SYS_C0013573" CHECK ("GROUP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table CONTAINS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."CONTAINS" ADD CONSTRAINT "SYS_C0013513" PRIMARY KEY ("TRIP_ID", "DESTINATION_ID", "ACTIVITY_ID");

-- ----------------------------
-- Checks structure for table CONTAINS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."CONTAINS" ADD CONSTRAINT "SYS_C0013510" CHECK ("TRIP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."CONTAINS" ADD CONSTRAINT "SYS_C0013511" CHECK ("DESTINATION_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."CONTAINS" ADD CONSTRAINT "SYS_C0013512" CHECK ("ACTIVITY_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table DESTINATIONS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."DESTINATIONS" ADD CONSTRAINT "SYS_C0013449" PRIMARY KEY ("DESTINATION_ID");

-- ----------------------------
-- Checks structure for table DESTINATIONS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."DESTINATIONS" ADD CONSTRAINT "SYS_C0013445" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."DESTINATIONS" ADD CONSTRAINT "SYS_C0013446" CHECK ("CITY_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."DESTINATIONS" ADD CONSTRAINT "SYS_C0013447" CHECK (latitude >= -90 AND latitude <= 90) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."DESTINATIONS" ADD CONSTRAINT "SYS_C0013448" CHECK (longitude >= -180 AND longitude <= 180) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table FAVORITES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."FAVORITES" ADD CONSTRAINT "SYS_C0013592" PRIMARY KEY ("USER_ID", "OBJECT_TYPE", "OBJECT_ID");

-- ----------------------------
-- Checks structure for table FAVORITES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."FAVORITES" ADD CONSTRAINT "SYS_C0013591" CHECK (object_type IN ('destination', 'activity', 'hotel', 'restaurant', 'trip', 'city', 'flight')) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table FLIGHTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013479" PRIMARY KEY ("FLIGHT_ID");

-- ----------------------------
-- Checks structure for table FLIGHTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013469" CHECK ("FROM_CITY_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013470" CHECK ("TO_CITY_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013471" CHECK ("AIRLINE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013472" CHECK ("DEPARTURE_DATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013473" CHECK ("RETURN_DATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013474" CHECK ("PRICE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013475" CHECK ("BOOKING_URL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013476" CHECK (price > 0) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013477" CHECK (LOWER(seat_class) IN ('economy', 'business', 'first')) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013478" CHECK (return_date > departure_date) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table FOLLOWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."FOLLOWS" ADD CONSTRAINT "SYS_C0013543" PRIMARY KEY ("FOLLOWER_ID", "FOLLOWEE_ID");

-- ----------------------------
-- Checks structure for table FOLLOWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."FOLLOWS" ADD CONSTRAINT "SYS_C0013541" CHECK ("FOLLOWER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FOLLOWS" ADD CONSTRAINT "SYS_C0013542" CHECK ("FOLLOWEE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table GROUPMESSAGES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."GROUPMESSAGES" ADD CONSTRAINT "SYS_C0013580" PRIMARY KEY ("MESSAGE_ID");

-- ----------------------------
-- Primary Key structure for table GROUPPOSTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."GROUPPOSTS" ADD CONSTRAINT "SYS_C0013577" PRIMARY KEY ("POST_ID");

-- ----------------------------
-- Primary Key structure for table GROUPS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."GROUPS" ADD CONSTRAINT "SYS_C0013571" PRIMARY KEY ("GROUP_ID");

-- ----------------------------
-- Checks structure for table GROUPS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."GROUPS" ADD CONSTRAINT "SYS_C0013569" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."GROUPS" ADD CONSTRAINT "SYS_C0013570" CHECK (is_public IN (0, 1)) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table GUIDES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."GUIDES" ADD CONSTRAINT "SYS_C0013583" PRIMARY KEY ("USER_ID");

-- ----------------------------
-- Uniques structure for table GUIDES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."GUIDES" ADD CONSTRAINT "SYS_C0013584" UNIQUE ("GUIDE_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HOTELREVIEWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."HOTELREVIEWS" ADD CONSTRAINT "SYS_C0013533" PRIMARY KEY ("REVIEW_ID");

-- ----------------------------
-- Checks structure for table HOTELREVIEWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."HOTELREVIEWS" ADD CONSTRAINT "SYS_C0013531" CHECK ("REVIEW_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."HOTELREVIEWS" ADD CONSTRAINT "SYS_C0013532" CHECK ("HOTEL_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table HOTELS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."HOTELS" ADD CONSTRAINT "SYS_C0013466" PRIMARY KEY ("HOTEL_ID");

-- ----------------------------
-- Checks structure for table HOTELS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."HOTELS" ADD CONSTRAINT "SYS_C0013461" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."HOTELS" ADD CONSTRAINT "SYS_C0013462" CHECK ("CITY_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."HOTELS" ADD CONSTRAINT "SYS_C0013463" CHECK (has_wifi IN (0, 1)) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."HOTELS" ADD CONSTRAINT "SYS_C0013464" CHECK (has_parking IN (0, 1)) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."HOTELS" ADD CONSTRAINT "SYS_C0013465" CHECK (has_gym IN (0, 1)) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table MEALSIN
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."MEALSIN" ADD CONSTRAINT "SYS_C0013518" PRIMARY KEY ("TRIP_ID", "RESTAURANT_ID");

-- ----------------------------
-- Checks structure for table MEALSIN
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."MEALSIN" ADD CONSTRAINT "SYS_C0013516" CHECK ("TRIP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."MEALSIN" ADD CONSTRAINT "SYS_C0013517" CHECK ("RESTAURANT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table MESSAGES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."MESSAGES" ADD CONSTRAINT "SYS_C0013566" PRIMARY KEY ("MESSAGE_ID");

-- ----------------------------
-- Checks structure for table MESSAGES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."MESSAGES" ADD CONSTRAINT "SYS_C0013563" CHECK ("SENDER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."MESSAGES" ADD CONSTRAINT "SYS_C0013564" CHECK ("RECEIVER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."MESSAGES" ADD CONSTRAINT "SYS_C0013565" CHECK (is_seen IN (0, 1)) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table NOTIFICATIONS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."NOTIFICATIONS" ADD CONSTRAINT "SYS_C0013561" PRIMARY KEY ("NOTIFICATION_ID");

-- ----------------------------
-- Checks structure for table NOTIFICATIONS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."NOTIFICATIONS" ADD CONSTRAINT "SYS_C0013560" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table POSTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."POSTS" ADD CONSTRAINT "SYS_C0013547" PRIMARY KEY ("POST_ID");

-- ----------------------------
-- Checks structure for table POSTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."POSTS" ADD CONSTRAINT "SYS_C0013546" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table PROCEDURELOG
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."PROCEDURELOG" ADD CONSTRAINT "SYS_C0013596" PRIMARY KEY ("LOG_ID");

-- ----------------------------
-- Checks structure for table PROCEDURELOG
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."PROCEDURELOG" ADD CONSTRAINT "SYS_C0013594" CHECK ("PROCEDURE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."PROCEDURELOG" ADD CONSTRAINT "SYS_C0013595" CHECK ("CALLING_DATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table PROVIDES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."PROVIDES" ADD CONSTRAINT "SYS_C0013501" PRIMARY KEY ("DESTINATION_ID", "ACTIVITY_ID");

-- ----------------------------
-- Checks structure for table PROVIDES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."PROVIDES" ADD CONSTRAINT "SYS_C0013499" CHECK (price >= 0) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."PROVIDES" ADD CONSTRAINT "SYS_C0013500" CHECK (is_available IN (0, 1)) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table REACTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."REACTS" ADD CONSTRAINT "SYS_C0013551" PRIMARY KEY ("USER_ID", "POST_ID");

-- ----------------------------
-- Checks structure for table REACTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."REACTS" ADD CONSTRAINT "SYS_C0013549" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."REACTS" ADD CONSTRAINT "SYS_C0013550" CHECK ("POST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table RESIDENCEIN
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."RESIDENCEIN" ADD CONSTRAINT "SYS_C0013507" PRIMARY KEY ("TRIP_ID", "HOTEL_ID");

-- ----------------------------
-- Checks structure for table RESIDENCEIN
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."RESIDENCEIN" ADD CONSTRAINT "SYS_C0013504" CHECK ("TRIP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."RESIDENCEIN" ADD CONSTRAINT "SYS_C0013505" CHECK ("HOTEL_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."RESIDENCEIN" ADD CONSTRAINT "SYS_C0013506" CHECK (checkout_date > checkin_date) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table RESTAURANTREVIEWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."RESTAURANTREVIEWS" ADD CONSTRAINT "SYS_C0013538" PRIMARY KEY ("REVIEW_ID");

-- ----------------------------
-- Checks structure for table RESTAURANTREVIEWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."RESTAURANTREVIEWS" ADD CONSTRAINT "SYS_C0013536" CHECK ("REVIEW_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."RESTAURANTREVIEWS" ADD CONSTRAINT "SYS_C0013537" CHECK ("RESTAURANT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table RESTAURANTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."RESTAURANTS" ADD CONSTRAINT "SYS_C0013486" PRIMARY KEY ("RESTAURANT_ID");

-- ----------------------------
-- Checks structure for table RESTAURANTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."RESTAURANTS" ADD CONSTRAINT "SYS_C0013483" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."RESTAURANTS" ADD CONSTRAINT "SYS_C0013484" CHECK ("CITY_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."RESTAURANTS" ADD CONSTRAINT "SYS_C0013485" CHECK (reservation_price > 0) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table REVIEWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."REVIEWS" ADD CONSTRAINT "SYS_C0013524" PRIMARY KEY ("REVIEW_ID");

-- ----------------------------
-- Checks structure for table REVIEWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."REVIEWS" ADD CONSTRAINT "SYS_C0013521" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."REVIEWS" ADD CONSTRAINT "SYS_C0013522" CHECK (rating >= 0 AND rating <= 5) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."REVIEWS" ADD CONSTRAINT "SYS_C0013523" CHECK (upvote_count >= 0) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table TRIPBOOKINGS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."TRIPBOOKINGS" ADD CONSTRAINT "SYS_C0013496" PRIMARY KEY ("USER_ID", "TRIP_ID");

-- ----------------------------
-- Checks structure for table TRIPBOOKINGS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."TRIPBOOKINGS" ADD CONSTRAINT "SYS_C0013489" CHECK (is_paid IN (0, 1)) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPBOOKINGS" ADD CONSTRAINT "SYS_C0013490" CHECK (is_processed IN (0, 1)) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPBOOKINGS" ADD CONSTRAINT "SYS_C0013491" CHECK (is_completed IN (0, 1)) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPBOOKINGS" ADD CONSTRAINT "SYS_C0013492" CHECK (is_private IN (0, 1)) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPBOOKINGS" ADD CONSTRAINT "SYS_C0013493" CHECK (
        (is_paid = 0 AND payment_method IS NULL AND transaction_id IS NULL AND payment_date IS NULL) OR
        (is_paid = 1 AND payment_method IS NOT NULL AND transaction_id IS NOT NULL AND payment_date IS NOT NULL)
    ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPBOOKINGS" ADD CONSTRAINT "SYS_C0013494" CHECK (
        (is_completed = 0 AND completion_date IS NULL) OR
        (is_completed = 1 AND completion_date IS NOT NULL)
    ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPBOOKINGS" ADD CONSTRAINT "SYS_C0013495" CHECK ((is_paid = 0 AND is_processed = 0 AND is_completed = 0) OR
           (is_paid = 1 AND is_processed = 0 AND is_completed = 0) OR
           (is_paid = 1 AND is_processed = 1 AND is_completed = 0) OR
           (is_paid = 1 AND is_processed = 1 AND is_completed = 1)) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table TRIPGUIDES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."TRIPGUIDES" ADD CONSTRAINT "SYS_C0013588" PRIMARY KEY ("TRIP_ID", "GUIDE_ID");

-- ----------------------------
-- Checks structure for table TRIPGUIDES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."TRIPGUIDES" ADD CONSTRAINT "SYS_C0013586" CHECK ("TRIP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPGUIDES" ADD CONSTRAINT "SYS_C0013587" CHECK ("GUIDE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table TRIPREVIEWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."TRIPREVIEWS" ADD CONSTRAINT "SYS_C0013528" PRIMARY KEY ("REVIEW_ID");

-- ----------------------------
-- Checks structure for table TRIPREVIEWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."TRIPREVIEWS" ADD CONSTRAINT "SYS_C0013526" CHECK ("REVIEW_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPREVIEWS" ADD CONSTRAINT "SYS_C0013527" CHECK ("TRIP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table TRIPS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."TRIPS" ADD CONSTRAINT "SYS_C0013457" PRIMARY KEY ("TRIP_ID");

-- ----------------------------
-- Checks structure for table TRIPS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."TRIPS" ADD CONSTRAINT "SYS_C0013455" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPS" ADD CONSTRAINT "SYS_C0013456" CHECK (total_price > 0) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table USERS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."USERS" ADD CONSTRAINT "SYS_C0013442" PRIMARY KEY ("USER_ID");

-- ----------------------------
-- Uniques structure for table USERS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."USERS" ADD CONSTRAINT "SYS_C0013443" UNIQUE ("USERNAME") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table USERS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."USERS" ADD CONSTRAINT "CHECK_VALID_EMAIL" CHECK (REGEXP_LIKE(email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?$')) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."USERS" ADD CONSTRAINT "SYS_C0013434" CHECK ("USERNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."USERS" ADD CONSTRAINT "SYS_C0013435" CHECK ("EMAIL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."USERS" ADD CONSTRAINT "SYS_C0013436" CHECK ("PASSWORD_HASH" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."USERS" ADD CONSTRAINT "SYS_C0013437" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."USERS" ADD CONSTRAINT "SYS_C0013438" CHECK ("CITY_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."USERS" ADD CONSTRAINT "SYS_C0013439" CHECK ("REGISTRATION_DATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."USERS" ADD CONSTRAINT "SYS_C0013440" CHECK ("DOB" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table ACTIVITIES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."ACTIVITIES" ADD CONSTRAINT "SYS_C0013454" FOREIGN KEY ("CREATOR_USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table COMMENTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."COMMENTS" ADD CONSTRAINT "SYS_C0013558" FOREIGN KEY ("USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."COMMENTS" ADD CONSTRAINT "SYS_C0013559" FOREIGN KEY ("POST_ID") REFERENCES "C##TRIPIFY"."POSTS" ("POST_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table CONNECTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."CONNECTS" ADD CONSTRAINT "SYS_C0013575" FOREIGN KEY ("USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."CONNECTS" ADD CONSTRAINT "SYS_C0013576" FOREIGN KEY ("GROUP_ID") REFERENCES "C##TRIPIFY"."GROUPS" ("GROUP_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table CONTAINS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."CONTAINS" ADD CONSTRAINT "SYS_C0013514" FOREIGN KEY ("TRIP_ID") REFERENCES "C##TRIPIFY"."TRIPS" ("TRIP_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."CONTAINS" ADD CONSTRAINT "SYS_C0013515" FOREIGN KEY ("DESTINATION_ID", "ACTIVITY_ID") REFERENCES "C##TRIPIFY"."PROVIDES" ("DESTINATION_ID", "ACTIVITY_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table DESTINATIONS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."DESTINATIONS" ADD CONSTRAINT "SYS_C0013450" FOREIGN KEY ("CREATOR_USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."DESTINATIONS" ADD CONSTRAINT "SYS_C0013451" FOREIGN KEY ("CITY_ID") REFERENCES "C##TRIPIFY"."CITIES" ("CITY_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table FAVORITES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."FAVORITES" ADD CONSTRAINT "SYS_C0013593" FOREIGN KEY ("USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table FLIGHTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013480" FOREIGN KEY ("CREATOR_USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013481" FOREIGN KEY ("FROM_CITY_ID") REFERENCES "C##TRIPIFY"."CITIES" ("CITY_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FLIGHTS" ADD CONSTRAINT "SYS_C0013482" FOREIGN KEY ("TO_CITY_ID") REFERENCES "C##TRIPIFY"."CITIES" ("CITY_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table FOLLOWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."FOLLOWS" ADD CONSTRAINT "SYS_C0013544" FOREIGN KEY ("FOLLOWER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."FOLLOWS" ADD CONSTRAINT "SYS_C0013545" FOREIGN KEY ("FOLLOWEE_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table GROUPMESSAGES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."GROUPMESSAGES" ADD CONSTRAINT "SYS_C0013581" FOREIGN KEY ("MESSAGE_ID") REFERENCES "C##TRIPIFY"."MESSAGES" ("MESSAGE_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."GROUPMESSAGES" ADD CONSTRAINT "SYS_C0013582" FOREIGN KEY ("GROUP_ID") REFERENCES "C##TRIPIFY"."GROUPS" ("GROUP_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table GROUPPOSTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."GROUPPOSTS" ADD CONSTRAINT "SYS_C0013578" FOREIGN KEY ("POST_ID") REFERENCES "C##TRIPIFY"."POSTS" ("POST_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."GROUPPOSTS" ADD CONSTRAINT "SYS_C0013579" FOREIGN KEY ("GROUP_ID") REFERENCES "C##TRIPIFY"."GROUPS" ("GROUP_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table GUIDES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."GUIDES" ADD CONSTRAINT "SYS_C0013585" FOREIGN KEY ("USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table HOTELREVIEWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."HOTELREVIEWS" ADD CONSTRAINT "SYS_C0013534" FOREIGN KEY ("REVIEW_ID") REFERENCES "C##TRIPIFY"."REVIEWS" ("REVIEW_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."HOTELREVIEWS" ADD CONSTRAINT "SYS_C0013535" FOREIGN KEY ("HOTEL_ID") REFERENCES "C##TRIPIFY"."HOTELS" ("HOTEL_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table HOTELS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."HOTELS" ADD CONSTRAINT "SYS_C0013467" FOREIGN KEY ("CREATOR_USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."HOTELS" ADD CONSTRAINT "SYS_C0013468" FOREIGN KEY ("CITY_ID") REFERENCES "C##TRIPIFY"."CITIES" ("CITY_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table MEALSIN
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."MEALSIN" ADD CONSTRAINT "SYS_C0013519" FOREIGN KEY ("TRIP_ID") REFERENCES "C##TRIPIFY"."TRIPS" ("TRIP_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."MEALSIN" ADD CONSTRAINT "SYS_C0013520" FOREIGN KEY ("RESTAURANT_ID") REFERENCES "C##TRIPIFY"."RESTAURANTS" ("RESTAURANT_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table MESSAGES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."MESSAGES" ADD CONSTRAINT "SYS_C0013567" FOREIGN KEY ("SENDER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."MESSAGES" ADD CONSTRAINT "SYS_C0013568" FOREIGN KEY ("RECEIVER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table NOTIFICATIONS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."NOTIFICATIONS" ADD CONSTRAINT "SYS_C0013562" FOREIGN KEY ("USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table POSTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."POSTS" ADD CONSTRAINT "SYS_C0013548" FOREIGN KEY ("USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table PROCEDURELOG
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."PROCEDURELOG" ADD CONSTRAINT "SYS_C0013597" FOREIGN KEY ("USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table PROVIDES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."PROVIDES" ADD CONSTRAINT "SYS_C0013502" FOREIGN KEY ("DESTINATION_ID") REFERENCES "C##TRIPIFY"."DESTINATIONS" ("DESTINATION_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."PROVIDES" ADD CONSTRAINT "SYS_C0013503" FOREIGN KEY ("ACTIVITY_ID") REFERENCES "C##TRIPIFY"."ACTIVITIES" ("ACTIVITY_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table REACTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."REACTS" ADD CONSTRAINT "SYS_C0013552" FOREIGN KEY ("USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."REACTS" ADD CONSTRAINT "SYS_C0013553" FOREIGN KEY ("POST_ID") REFERENCES "C##TRIPIFY"."POSTS" ("POST_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table RESIDENCEIN
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."RESIDENCEIN" ADD CONSTRAINT "SYS_C0013508" FOREIGN KEY ("TRIP_ID") REFERENCES "C##TRIPIFY"."TRIPS" ("TRIP_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."RESIDENCEIN" ADD CONSTRAINT "SYS_C0013509" FOREIGN KEY ("HOTEL_ID") REFERENCES "C##TRIPIFY"."HOTELS" ("HOTEL_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table RESTAURANTREVIEWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."RESTAURANTREVIEWS" ADD CONSTRAINT "SYS_C0013539" FOREIGN KEY ("REVIEW_ID") REFERENCES "C##TRIPIFY"."REVIEWS" ("REVIEW_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."RESTAURANTREVIEWS" ADD CONSTRAINT "SYS_C0013540" FOREIGN KEY ("RESTAURANT_ID") REFERENCES "C##TRIPIFY"."RESTAURANTS" ("RESTAURANT_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table RESTAURANTS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."RESTAURANTS" ADD CONSTRAINT "SYS_C0013487" FOREIGN KEY ("CREATOR_USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."RESTAURANTS" ADD CONSTRAINT "SYS_C0013488" FOREIGN KEY ("CITY_ID") REFERENCES "C##TRIPIFY"."CITIES" ("CITY_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table REVIEWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."REVIEWS" ADD CONSTRAINT "SYS_C0013525" FOREIGN KEY ("USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table TRIPBOOKINGS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."TRIPBOOKINGS" ADD CONSTRAINT "SYS_C0013497" FOREIGN KEY ("USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPBOOKINGS" ADD CONSTRAINT "SYS_C0013498" FOREIGN KEY ("TRIP_ID") REFERENCES "C##TRIPIFY"."TRIPS" ("TRIP_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table TRIPGUIDES
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."TRIPGUIDES" ADD CONSTRAINT "SYS_C0013589" FOREIGN KEY ("TRIP_ID") REFERENCES "C##TRIPIFY"."TRIPS" ("TRIP_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPGUIDES" ADD CONSTRAINT "SYS_C0013590" FOREIGN KEY ("GUIDE_ID") REFERENCES "C##TRIPIFY"."GUIDES" ("GUIDE_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table TRIPREVIEWS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."TRIPREVIEWS" ADD CONSTRAINT "SYS_C0013529" FOREIGN KEY ("REVIEW_ID") REFERENCES "C##TRIPIFY"."REVIEWS" ("REVIEW_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPREVIEWS" ADD CONSTRAINT "SYS_C0013530" FOREIGN KEY ("TRIP_ID") REFERENCES "C##TRIPIFY"."TRIPS" ("TRIP_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table TRIPS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."TRIPS" ADD CONSTRAINT "SYS_C0013458" FOREIGN KEY ("CREATOR_USER_ID") REFERENCES "C##TRIPIFY"."USERS" ("USER_ID") ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPS" ADD CONSTRAINT "SYS_C0013459" FOREIGN KEY ("FROM_CITY_ID") REFERENCES "C##TRIPIFY"."CITIES" ("CITY_ID") ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##TRIPIFY"."TRIPS" ADD CONSTRAINT "SYS_C0013460" FOREIGN KEY ("TO_CITY_ID") REFERENCES "C##TRIPIFY"."CITIES" ("CITY_ID") ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table USERS
-- ----------------------------
ALTER TABLE "C##TRIPIFY"."USERS" ADD CONSTRAINT "SYS_C0013444" FOREIGN KEY ("CITY_ID") REFERENCES "C##TRIPIFY"."CITIES" ("CITY_ID") ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

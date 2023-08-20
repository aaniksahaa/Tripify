const trip = {
    "from_city_id" : 1,
    "to_city_id" : 2,
    "name" : "Sunset Sceneries",
    "description" : "A wonderful Trip, it will be.",
    "image_url" : "dummy.jpg",
    "start_date" : "2023-07-01",
    "end_date" : "2023-07-25",
    "contains" : [
        {
            "destination_id" : 1,
            "activity_id" : 4,
            "tentative_date" : "2023-07-15"
        },
        {
            "destination_id" : 1,
            "activity_id" : 1,
            "tentative_date" : "2023-07-17"
        }
    ],
    "hotels" : [
        {
            "hotel_id" : 1,
            "checkin_date" : "2023-07-01",
            "checkout_date" : "2023-07-07"
        },
        {
            "hotel_id" : 2,
            "checkin_date" : "2023-07-15",
            "checkout_date" : "2023-07-18"
        }
    ],
    "restaurants" : [
        {
            "restaurant_id" : 1
        },
        {
            "restaurant_id" : 2
        },
        {
            "restaurant_id" : 3
        }
    ]
}

const formatDate = (date) => {
    s = "TO_DATE('" + date + "','YYYY-MM-DD')";
    return s;
}

const generateAddTrip_sql_binds = (trip) => {

    const hotelBinds = [];
    const hotelValues = [];

    let cnt = 0;

    for (const hotel of trip.hotels) {

        const { hotel_id, checkin_date, checkout_date } = hotel;

        hotelBinds.push(`:hotel_id_${cnt}`);
        hotelValues.push(hotel_id);
        hotelBinds.push(`:checkin_date_${cnt}`);
        hotelValues.push(formatDate(checkin_date));
        hotelBinds.push(`:checkout_date_${cnt}`);
        hotelValues.push(formatDate(checkout_date));

        cnt++;

    }

    let hotelsQuery = `HotelDatesList( `;

    for(let i=0; i<cnt; i++)
    {
        hotelsQuery += `HotelDates( ${hotelBinds.slice(3*i,3*i+3).join(' , ')} ) `
        if(i < cnt-1)
        {
            hotelsQuery += ', '
        }
    }

    hotelsQuery += ' )'

    // Generate the RestaurantList bind variable
    const restaurantBinds = [];
    const restaurantValues = [];

    cnt = 0;

    for (const restaurant of trip.restaurants) {

        restaurantBinds.push(`:restaurant_id_${cnt}`);
        restaurantValues.push(restaurant.restaurant_id);

        cnt++;
    }

    const restaurantsQuery = `RestaurantList( ${restaurantBinds.join(' , ')} )`;

    // Generate the DestinationActivitiesList bind variable

    const containBinds = [];
    const containValues = [];

    cnt = 0;

    for (const contain of trip.contains) {

        const { destination_id, activity_id, tentative_date } = contain;

        containBinds.push(`:destination_id_${cnt}`);
        containValues.push(destination_id);
        containBinds.push(`:activity_id_${cnt}`);
        containValues.push(activity_id);
        containBinds.push(`:tentative_date_${cnt}`);
        containValues.push(formatDate(tentative_date));

        cnt++;
    }

    let containsQuery = `DestinationActivitiesList( `;

    for(let i=0; i<cnt; i++)
    {
        containsQuery += `DestinationActivity( ${containBinds.slice(3*i,3*i+3).join(' , ')}  ) `;
        if(i < cnt-1)
        {
            containsQuery += ', ';
        }
    }

    containsQuery += ' )'

    // Final SQL query with bind variables
    const sql = `
    DECLARE
    l_hotels HotelDatesList := ${hotelsQuery};
    l_restaurants RestaurantList := ${restaurantsQuery};
    l_contains DestinationActivitiesList := ${containsQuery};
    BEGIN
    AddTrip(:from_city_id, :to_city_id, :name, :description, :image_url, TO_DATE(:start_date, 'YYYY-MM-DD'), TO_DATE(:end_date, 'YYYY-MM-DD'), l_contains, l_hotels, l_restaurants);
    END;/
    `;

    //console.log(sql);

    const binds = {
        from_city_id: trip.from_city_id,
        to_city_id: trip.to_city_id,
        name: trip.name,
        description: trip.description,
        image_url: trip.image_url,
        start_date: formatDate(trip.start_date),
        end_date: formatDate(trip.end_date),
        ...hotelValues.reduce((obj, value, index) => {
            let entry_no = Math.floor(index / 3);
            //console.log(entry_no);
            let attribute_no = index % 3;
            if(attribute_no == 0){
                obj[`hotel_id_${entry_no}`] = value;
            }
            else if(attribute_no == 1){
                obj[`checkin_date_${entry_no}`] = value;
            }
            else{
                obj[`checkout_date_${entry_no}`] = value;
            }
            return obj;
        }, {}),
        ...restaurantValues.reduce((obj, value, index) => {
            obj[`restaurant_id_${index}`] = value;
            return obj;
        }, {}),
        ...containValues.reduce((obj, value, index) => {
            let entry_no = Math.floor(index / 3);
            //console.log(entry_no);
            let attribute_no = index % 3;
            if(attribute_no == 0){
                obj[`destination_id_${entry_no}`] = value;
            }
            else if(attribute_no == 1){
                obj[`activity_id_${entry_no}`] = value;
            }
            else{
                obj[`tentative_date_${entry_no}`] = value;
            }
            return obj;
        }, {})
    };

    return { sql, binds };
}


const {sql, binds} = generateAddTrip_sql_binds(trip);

console.log(sql)
console.log(binds)

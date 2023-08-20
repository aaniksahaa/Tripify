# Tripify

# Tripify API Documentation

# API Endpoints
The API Endpoints belong to  major routes. The routes are as follows:   

## 1. [Trip](#book)
## 2. [Hotel](#hotel)
## 3. [Login](#login)
## 4. [Chat](#chat)

The respective API endpoints are as follows:    

# Trip

## a. Get Single Trip by trip_id
Endpoint URL: `GET /api/v1/trip/16`  
Request Body: `None`    
Example Response:    
```json
{
    "trip_id": 16,
    "from_city_id": 1,
    "to_city_id": 2,
    "name": "Very Cool trip",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 33473,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z"
}
```

## b. Get Single Trip Details by trip_id
Endpoint URL: `GET /api/v1/trip/details/21`  
Request Body: `None`    
Example Response:    
```json
{
    "trip_id": 21,
    "from_city_id": 1,
    "to_city_id": 2,
    "name": "Very Cool trip",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 33473,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z",
    "contains": [
        {
            "destination_id": 1,
            "activity_id": 1,
            "tentative_date": "2023-07-16T18:00:00.000Z"
        },
        {
            "destination_id": 1,
            "activity_id": 4,
            "tentative_date": "2023-07-14T18:00:00.000Z"
        }
    ],
    "hotels": [
        {
            "hotel_id": 1,
            "checkin_date": "2023-06-30T18:00:00.000Z",
            "checkout_date": "2023-07-06T18:00:00.000Z"
        },
        {
            "hotel_id": 2,
            "checkin_date": "2023-07-14T18:00:00.000Z",
            "checkout_date": "2023-07-17T18:00:00.000Z"
        }
    ],
    "restaurants": [
        {
            "restaurant_id": 1
        },
        {
            "restaurant_id": 2
        },
        {
            "restaurant_id": 3
        }
    ]
}
```

## c. Create New Trip
Endpoint URL: `POST /api/v1/trip`  
Request Body:    
```json
{
    "from_city_id" : 1,
    "to_city_id" : 2,
    "name" : "Departmental Tour to Infinity",
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
            "checkout_date" : "2023-07-17"
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
    ],
    "guides" : [
        {
            "guide_id" : 1
        },
        {
            "guide_id" : 2
        }
    ]
}
```
Example Response:  
```json
{
    "trip_id": 3,
    "from_city_id": 1,
    "to_city_id": 2,
    "name": "Departmental Tour to Infinity",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 32571,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z",
    "created_on": "2023-07-31T21:59:52.000Z",
    "last_updated_on": "2023-07-31T21:59:52.000Z",
    "deleted_on": null
}
```

## e. Delete a Trip

Endpoint URL:     
`DELETE api/v1/trip/2`  
Request Body: `None`    
Example Response:    
```json
{
    "trip_id": 2,
    "from_city_id": 1,
    "to_city_id": 2,
    "name": "Magnificient Seashore Exploration",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 32571,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z",
    "created_on": "2023-07-31T20:08:58.000Z",
    "last_updated_on": "2023-07-31T20:08:58.000Z",
    "deleted_on": null
}
```

# Hotel

## a. Get Single Hotel by hotel_id

Endpoint URL:     
`GET /api/v1/hotel/21'  
Request Body: `None`    
Example Response:    
```json
{
    "hotel_id": 21,
    "name": "Seaside Lodge Hotel",
    "address": "68 Garden Lane Coxs Bazar , Bangladesh",
    "city_id": 27,
    "description": "A Gracefully Charming hotel in Coxs Bazar.",
    "image_url": "dummy.jpg",
    "price_per_day": 4080,
    "phone": "016748298191",
    "email": "seasidelodgehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1
}
```

## b. Get Hotels by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:     
`GET /api/v1/hotel?name=hotel&address=bangladesh&city_id=24,25,26,1,2,3&min_price=500&max_price=8000&has_wifi=1&has_parking=1&has_gym=1&orderby=price_per_day&ordertype=desc&page=1&per_page=2`  
Request Body: `None`    
Example Response:    
```json
[
    {
        "hotel_id": 50,
        "name": "Elegant Retreat Hotel",
        "address": "69 Main Street Bandarban , Bangladesh",
        "city_id": 24,
        "description": "A Wonderfully Charming hotel in Bandarban.",
        "image_url": "dummy.jpg",
        "price_per_day": 4820,
        "phone": "014815893554",
        "email": "elegantretreathotel@outlook.com",
        "has_wifi": 1,
        "has_parking": 1,
        "has_gym": 1
    },
    {
        "hotel_id": 70,
        "name": "Modern Castle Hotel",
        "address": "57 Park Avenue Manikganj , Bangladesh",
        "city_id": 26,
        "description": "A Exquisitely Elevated hotel in Manikganj.",
        "image_url": "dummy.jpg",
        "price_per_day": 3764,
        "phone": "011338126183",
        "email": "moderncastlehotel@yahoo.com",
        "has_wifi": 1,
        "has_parking": 1,
        "has_gym": 1
    }
]
```
## c. Create New Hotel

Endpoint URL: `POST /api/v1/hotel/`  
Request Body:    
```json
{
    "name": "Barbie Oppenheimer Hotel",
    "address": "57 Park Avenue Manikganj , Bangladesh",
    "city_id": 26,
    "description": "A Exquisitely Elevated hotel in Manikganj.",
    "image_url": "dummy.jpg",
    "price_per_day": 2500,
    "phone": "011338126183",
    "email": "barbiehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1
}
```
Example Response:  
```json
{
    "hotel_id": 103,
    "name": "Barbie Oppenheimer Hotel",
    "address": "57 Park Avenue Manikganj , Bangladesh",
    "city_id": 26,
    "description": "A Exquisitely Elevated hotel in Manikganj.",
    "image_url": "dummy.jpg",
    "price_per_day": 2500,
    "phone": "011338126183",
    "email": "barbiehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1,
    "created_on": "2023-07-31T19:17:46.000Z",
    "last_updated_on": "2023-07-31T19:17:46.000Z"
}
```
## d. Update a Hotel
Endpoint URL: `PUT /api/v1/hotel/`  
Request Body:    
```json
{
    "hotel_id": 103,
    "name": "New Barbie Oppenheimer Hotel",
    "address": "57 Park Avenue Manikganj , Bangladesh",
    "city_id": 26,
    "description": "A Exquisitely Elevated hotel in Manikganj.",
    "image_url": "dummy.jpg",
    "price_per_day": 4500,
    "phone": "011338126183",
    "email": "barbiehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1
}
```
Example Response:  
```json
{
    "hotel_id": 103,
    "name": "Barbie Oppenheimer Hotel",
    "address": "57 Park Avenue Manikganj , Bangladesh",
    "city_id": 26,
    "description": "A Exquisitely Elevated hotel in Manikganj.",
    "image_url": "dummy.jpg",
    "price_per_day": 2500,
    "phone": "011338126183",
    "email": "barbiehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1,
    "created_on": "2023-07-31T19:17:46.000Z",
    "last_updated_on": "2023-07-31T19:17:46.000Z"
}
```

## e. Delete a Hotel

Endpoint URL:     
`DELETE api/v1/hotel/99`  
Request Body: `None`    
Example Response:    
```json
{
    "hotel_id": 99,
    "name": "Cozy Castle Hotel",
    "address": "44 Ocean Drive Tangail , Bangladesh",
    "city_id": 29,
    "description": "A Exquisitely Elevated hotel in Tangail.",
    "image_url": "dummy.jpg",
    "price_per_day": 3857,
    "phone": "014298582868",
    "email": "cozycastlehotel@outlook.com",
    "has_wifi": 1,
    "has_parking": 0,
    "has_gym": 1,
    "created_on": "2023-07-31T19:43:37.000Z",
    "last_updated_on": "2023-07-31T19:43:37.000Z"
}
```

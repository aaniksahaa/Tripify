const { response } = require("express");
const { OpenAI } = require("openai");
const { getHotels } = require("./hotel");
const { getCities } = require("./city");
const { getRestaurants } = require("./restaurant");
const { getDestinations } = require("./destination");

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY // This is also the default, can be omitted
});

init_prompt_1 = `From a certain text, you have to extract features,

The text will be a query from a user in a trip related website, the user will specify in natural language, which cities the user wants to go, what price ranges should apply for hotels, restaurants, which cuisine type for restaurants, which facilities to include in hotels, there are only 3 facilities alllowable 'wifi', 'parking', gym, ignore other facilities given in text, if a facility is not mentioned, keep its value empty string, Similar for other attributes, the features you cant extract simply make them empty string. As of cities, the city_names should be an array, containing all the possible cities the user mentions that he wants to go.

Here is an example,

Assume the given text is this,

'Hey friend, please suggest me family vacation trip to Chattogram or Dhaka. Make sure the prices for hotels don't exceed 4000 and it should have parking but i don't need gym. Also the restaurant must have Continental cuisine and make sure the reservation price for restaurant is at least 500, because I love classy eateries, you know'

You have to output a json like this,

{
  "city_names":["Chattogram","Dhaka"],
  "hotel":{
    "min_price":"",
    "max_price":"4000",
    "has_parking":"1",
    "has_wifi":"0",
    "has_gym":""
  },
  "restaurant":{
    "min_price":"500",
    "max_price":""
  }
}

No extra output is required. Remember you only need to output a json and nothing else

Hope you have understood.

Now do the same for the following,

'`

init_prompt_2 = `'

No extra output is required. Remember you only need to output a perfectly written json and nothing else`


const getGeneralChatResponse = async (payload) => {
    max_words = 30
    prompt = payload.user_text + ' \n\nPlease give your answer within no more than ' + max_words.toString() + ' words'
    console.log(prompt);
    const completion = await openai.chat.completions.create({
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: prompt }],
    });
    //console.log(completion)
    var response = completion.choices[0].message.content;
    //console.log(response)
    
    chat_response = { answer: response };
    console.log(chat_response);
    return chat_response
};

const getQueries = async (user_text) => {
    prompt = init_prompt_1 + user_text + init_prompt_2
  console.log(prompt);
  const completion = await openai.chat.completions.create({
    model: "gpt-3.5-turbo",
    messages: [{ role: "user", content: prompt }],
  });
  //console.log(completion)
  var response = completion.choices[0].message.content;
  response = response.replace("\n", "").trim();
  //console.log(response)
  json = JSON.parse(response);
  console.log(json);
  return json;
};

const getCityIDfromName = async(city_name) => {
    const cities = await getCities({name: city_name})
    if(cities.length > 0)
    {
        return cities[0].city_id
    }
    return 0
}

const getTripSuggestion = async (payload) => {
    
    user_text = payload.user_text

    const queries = await getQueries(user_text)

    // const queries = {
    //     city_names: [ 'Sylhet', 'Barishal' ],
    //     hotel: {
    //     min_price: '',
    //     max_price: '6000',
    //     has_parking: '1',
    //     has_wifi: '',
    //     has_gym: '1'
    //     },
    //     restaurant: { min_price: '100', max_price: '600' }
    // }

    city_ids = []
    for(let city_name of queries.city_names)
    {
        const id = await getCityIDfromName(city_name)
        city_ids.push(id)
    }

    const city_id_str = city_ids.join(',')

    console.log(city_id_str)

    hotel_queries = {
        ...queries.hotel,
        city_id: city_id_str,
        orderby: 'rating',
        ordertype: 'desc',
        per_page: 6
    }

    restaurant_queries = {
        ...queries.restaurant,
        city_id: city_id_str,
        orderby: 'rating',
        ordertype: 'desc',
        per_page: 6
    }

    destination_queries = {
        city_id: city_id_str,
        per_page: 6
    }

    const hotels = await getHotels(hotel_queries)
    const restaurants = await getRestaurants(restaurant_queries)
    const destinations = await getDestinations(destination_queries)

    const response = {
        queries: queries,
        hotels: hotels,
        restaurants: restaurants,
        destinations: destinations
    }
    
    return response
}

module.exports = { getGeneralChatResponse, getTripSuggestion}

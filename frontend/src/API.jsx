import { api_base } from "./Constants"
import { getItem } from "./LocalStorage"

async function Fetch(url, stuff) {
  console.log('FETCH ->', url, JSON.stringify(stuff))
  const resp = await fetch(url, stuff)
  return resp
}

export function getAuthToken() {
  return getItem('authToken')
}

export async function fetchX(method, path, get, post) {
  console.log('fetchX ->', path, JSON.stringify(get))
  var url = `${api_base}/${path}/?`
  try {
    Object.keys(get).forEach(x => {
      url = url + x + '=' + get[x] + '&'
    })
  }
  catch { }
  const r = await Fetch(url, {
    method: method,
    mode: 'cors',
    headers: {
      'Authorization': getAuthToken(),
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(post)
  })
  const j = await r.json()
  return j
}

export async function getX(path, filter) {
  console.log('getX ->', path, JSON.stringify(filter))
  var url = `${api_base}/${path}/?`
  try {
    Object.keys(filter).forEach(x => {
      url = url + x + '=' + filter[x] + '&'
    })
  }
  catch { }
  const r = await Fetch(url, {
    method: 'GET',
    headers: {
      'Authorization': getAuthToken()
    }
  })
  const j = await r.json()
  return j
}
export async function postX(path, filter, body) {
  console.log('postX ->', path, JSON.stringify(filter), JSON.stringify(body))
  var url = `${api_base}/${path}/?`
  try {
    Object.keys(filter).forEach(x => {
      url = url + x + '=' + filter[x] + '&'
    })
  }
  catch { }
  const r = await Fetch(url, {
    method: 'POST',
    mode: 'cors',
    headers: {
      'Authorization': getAuthToken(),
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(body)
  })
  const j = await r.json()
  return j
}
export async function getRestaurants(filter) {
  const j = await getX('restaurant', filter)
  return j
}
export async function getHotels(filter) {
  const j = await getX('hotel', filter)
  return j
}
export async function getUsers(filter) {
  const j = await getX('user', filter)
  return j
}
export async function getNotifications(filter) {
  const j = await getX('notifications', filter)
  return j
}
export async function createBooking(data) {
  const j = await postX('tripbooking', {}, data)
  return j
}
export async function doPayment(data) {
  const j = await fetchX('PUT','tripbooking/payment', {}, data)
  return j
}
export async function createReview(data) {
  const j = await postX('review', {}, data)
  return j
}
export async function updateUser(data) {
  const j = await fetchX('PUT', 'user', {}, data)
}
export async function getRestaurant(id) {
  const j = await getX(`restaurant/${id}`, {})
  return j
}
export async function getTrip(id) {
  const j = await getX(`trip/details/${id}`, {})
  return j
}

export async function getDestination(id) {
  const j = await getX(`destination/${id}`, {})
  return j
}
export async function getReviews(filter) {
  const j = await getX('review', filter)
  return j
}
export async function createUser(data) {
  const j = await postX('user', {}, data)
  return j
}
export async function getDestinations(filter) {
  const j = await getX('destination', filter)
  return j
}
export async function getActivities(filter) {
  const j = await getX('activity', filter)
  return j
}
export async function getLogin(data) {
  const j = await postX('login', {}, data)
  return j
}
export async function getTrips(filter) {
  const j = await getX('trip', filter)
  return j
}
export async function getFeed(filter) {
  const j = await getX(`feed`, filter)
  return j
}
export async function getPostDetails(id) {
  const j = await getX(`post/details/${id}`, {})
  return j
}
export async function deletePost(id) {
  const j = await fetchX('delete', `post/${id}`, {}, {})
  return j
}
export async function getSingleUser(id) {
  const j = await getX(`user/${id}`, {})
  return j
}
export async function writeComment(data) {
  const j = await postX(`comment/`, {}, data)
  return j
}
export async function deleteComment() {

}

export async function writePost(data) {
  const j = await postX(`post`, {}, data)
  return j
}

export async function getUserProfile(id, filter) {
  const j = await getX(`user/${id}/profile`, filter)
  return j
}
export async function removeLike(id) {
  const j = await fetchX('DELETE', `post/${id}/react`, {}, {})
  return j
}
export async function follow(a, b) {
  const j = await postX(`user/${a}/follow/${b}`, {}, {})
  return j
}
export async function unfollow(a, b) {
  const j = await fetchX('DELETE',`user/${a}/follow/${b}`, {}, {})
  return j
}
export async function isFollowing(a, b) {
  const j = await getX(`user/${a}/follow/${b}`, {})
  return j
}
export async function getActivityById(id) {
  const j = await getX(`activity/${id}`)
  return j
}
export async function getHotelById(id) {
  const j = await getX(`hotel/${id}`)
  return j
}
export async function getTripById(id) {
  const j = await getX(`trip/details/${id}`)
  return j
}
export async function likePost(id) {
  const j = await postX(`post/${id}/react/1`, {}, {})
  return j
}
export async function getCities(filter) {
  const j = await getX('city', filter)
  var tmp = []
  for (var i = 0; i < j.length; i++) {
    tmp.push({
      label: j[i].name,
      value: j[i].city_id
    })
  }
  return tmp
}

export async function createTrip(body) {
  const j = await postX('trip', {}, body)
  console.log(j)
}


// Added for Admin

export async function getStat(filter) {
  const j = await getX('stat', filter)
  return j
}

export async function getPrices(filter) {
  const j = await getX('stat/prices', filter)
  return j
}

export async function getTripBookings(filter) {
  const j = await getX('tripbooking', filter)
  return j
}

export async function getSingleTripDetails(id) {
  const j = await getX(`trip/details/${id}`, {})
  return j
}

export async function deleteTrip(id) {
  const j = await deleteX('trip/' + id)
  return j
}
export async function deleteUser(id) {
  const j = await deleteX('user/' + id)
  return j
}
export async function deleteTripHard(id) {
  const j = await deleteX('trip/danger/' + id)
  return j
}
export async function getSingleTripBooking(user_id, trip_id) {
  const j = await getX(`tripbooking/${user_id}/${trip_id}`, {})
  return j
}

export async function processTripBooking(body) {
  const j = await fetchX('PUT', 'tripbooking/onlyadmin/processed' , {}, body)
  console.log(j)
}

export async function updateHotel(data) {
  const j = await fetchX('PUT', 'hotel', {}, data)
}

export async function updateRestaurant(data) {
  const j = await fetchX('PUT', 'restaurant', {}, data)
}

export async function updateDestination(data) {
  const j = await fetchX('PUT', 'destination', {}, data)
}

export async function updateActivity(data) {
  const j = await fetchX('PUT', 'activity', {}, data)
}

export async function deleteX(path) {
  console.log('deleteX ->', path)
  var url = `${api_base}/${path}/`
  
  const r = await Fetch(url, {
    method: 'DELETE',
    headers: {
      'Authorization': getAuthToken()
    }
  })
  const j = await r.json()
  return j
}


////////////////////



export async function getGeneralChatResponse(text) { 
  const j = await getX('chat/general', {user_text: text}) 
  return j 
} 
 
export async function getTripSuggestion(text) { 
  const j = await getX('chat/trip-suggestion', {user_text: text}) 
  return j 
}

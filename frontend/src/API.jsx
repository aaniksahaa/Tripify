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
export async function createReview(data) {
  const j = await postX('review', {}, data)
  return j
}
export async function updateUser(data) {
  const j = await fetchX('PUT', 'user', {}, data)
}
export async function getReviews(filter) {
  const j = await getX('review', filter)
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
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
    mode:'cors',
    headers: {
      'Authorization': getAuthToken(),
      'Access-Control-Allow-Origin':'*',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(body)
  })
  const j = await r.json()
  return j
}
export async function getHotels(filter) {
  const j = await getX('hotel', filter)
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
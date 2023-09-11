import { getDict, getItem, useLocalStorage } from "./LocalStorage"

export function getParam() {
    const all = window.location.href.split('/')
    const id = all[all.length - 1]
    return id
}
export function doesURLContain(x) {
    return window.location.href.includes(x)
}

export function redirectToHomepage() {
    window.location = '/'
}
export function protectRoute(role) {
    const u = getDict('tripify_user')
    if (u == JSON.stringify({})) redirectToHomepage()
    else {
        if (u.role !== role) redirectToHomepage()
    }
}

export function userIs(role) {
    const u = getDict('tripify_user')
    if (u == JSON.stringify({})) return false
    else {
        if (u.role !== role) return false
    }
    return true
}

export function isLoggedIn() {
    const u = getDict('tripify_user')
    if (!u.role) return false
    return true
}
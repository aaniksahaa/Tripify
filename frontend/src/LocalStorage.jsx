export function setList(list, value) {
    const t = JSON.stringify(value)
    localStorage.setItem(list, t)
}

export function getList(list) {
    const t = JSON.parse(localStorage.getItem(list))
    if(t === null) return []
    return t
}
export function addToListUnique(list,value) {
    var t = getList(list)
    t.push(value)
    localStorage.setItem(list,JSON.stringify(t))
}
export function addToList(list,value) {
    var t = getList(list)
    // for(var i=0;i<t.length;i++) if(JSON.stringify(t[i]) === JSON.stringify(value)) return
    t.push(value)
    localStorage.setItem(list,JSON.stringify(t))
}
export function removeFromList(list,value) {
    const t = getList(list)
    var T = []
    for(var i=0;i<t.length;i++) if(JSON.stringify(t[i])!==JSON.stringify(value)) T.push(t[i])
    localStorage.setItem(list,JSON.stringify(T))
}

export function setDict(dict, value) {
    const t = JSON.parse(value)
    localStorage.setItem(dict, t)
}
export function getDict(dict) {
    const t = JSON.parse(localStorage.getItem(dict))
    if(t === null) return {}
    return t
}

export function addToDict(dict, key, value) {
    var t = getDict(dict)
    t[key] = value
    localStorage.setItem(dict, JSON.stringify(t))
}

export function getItem(x) {
    const t = localStorage.getItem(x)
    if(t === null) return ''
    return t
}

export function setItem(x,y) {
    localStorage.setItem(x,y)
}

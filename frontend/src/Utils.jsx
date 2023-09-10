export function getParam() {
    const all = window.location.href.split('/')
    const id = all[all.length - 1]
    return id
}
export function doesURLContain(x) {
    return window.location.href.includes(x)
}
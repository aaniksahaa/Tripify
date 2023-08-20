async function Fetch(url, stuff) {
    console.log('FETCH ->',url,stuff)
    const resp = await fetch(url, stuff)
    return resp
}

export { Fetch }
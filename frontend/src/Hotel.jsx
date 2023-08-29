import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { api_base } from './Constants'
import HotelDetails from './components/HotelDetails'
import Navbar2 from './components/Navbar2'

function Hotel() {
    const { id } = useParams()
    const [data, setData] = useState({})
    async function initialize() {
        const url = api_base + '/hotel/' + id
        const t = await fetch(url)
        const j = await t.json()
        setData(j)
        console.log(j)
    }
    useEffect(() => {
        initialize()
    }, [])
    return (
        <div>
            <Navbar2 />
            <HotelDetails props={data} hotel_id={data.hotel_id} />
        </div>
    )
}

export default Hotel
import React, { useEffect, useState } from 'react'
import Navbar2 from './components/Navbar2'
import { useParams } from 'react-router-dom'
import { api_base } from './Config'
import CaptionCarousel from './components/Carousel'
import HotelDetails from './components/HotelDetails'

function Hotel() {
    const { id } = useParams()
    const [data, setData] = useState({})
    async function initialize() {
        const url = api_base + '/hotel/' + id
        const t = await fetch(url)
        const j = await t.json()
        setData(j)
    }
    useEffect(() => {
        initialize()
    }, [])
    return (
        <div>
            <Navbar2 />
            <HotelDetails props={data}/>
        </div>  
    )
}

export default Hotel
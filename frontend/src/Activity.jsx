import React, { useEffect, useState } from 'react'
import Navbar2 from './components/Navbar2'
import { useParams } from 'react-router-dom'
import { api_base } from './Constants'
import CaptionCarousel from './components/Carousel'
import DestDetails from './components/DestinationDetails'
import ActivityDetails from './components/ActivityDetails'

function Activity() {
    const { id } = useParams()
    const [data, setData] = useState({})
    async function initialize() {
        const url = api_base + '/activity/' + id
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
            <ActivityDetails props={data} />
        </div>
    )
}

export default Activity
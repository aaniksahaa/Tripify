import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { api_base } from './Constants'
import Navbar2 from './components/Navbar2'
import TripDetails from './components/TripDetails'

function Trip() {
    const { id } = useParams()
    const [data, setData] = useState({})
    async function initialize() {
        const url = api_base + '/trip/' + id
        const t = await fetch(url)
        const j = await t.json()
        setData(j)
        console.log(j);
    }
    useEffect(() => {
        initialize()
    }, [])
    return (
        <div>
            <Navbar2 />
            <TripDetails props={data} />
        </div>
    )
}

export default Trip
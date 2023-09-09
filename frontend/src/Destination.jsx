import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { api_base } from './Constants'
import DestDetails from './components/DestinationDetails'
import Navbar2 from './components/Navbar2'

function Destination() {
    const { id } = useParams()
    const [data, setData] = useState({})
    async function initialize() {
        const url = api_base + '/destination/' + id
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
            <DestDetails data={JSON.stringify(data)} />
        </div>
    )
}

export default Destination
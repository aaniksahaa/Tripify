import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { api_base } from './Constants'
import Navbar2 from './components/Navbar2'
import RestaurantDetails from './components/RestaurantDetails'

function Restaurant() {
    const { id } = useParams()
    const [data, setData] = useState({})
    async function initialize() {
        const url = api_base + '/restaurant/' + id
        const t = await fetch(url)
        const j = await t.json()
        setData(j)
        console.log(j)
        console.log(j.rating_info)
    }
    useEffect(() => {
        initialize()
    }, [])
    return (
        <div>
            <Navbar2 />
            <RestaurantDetails ratingInfo={data.rating_info} props={data} />
        </div>
    )
}

export default Restaurant
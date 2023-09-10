import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { api_base } from './Constants'
import Navbar2 from './components/Navbar2'
import RestaurantDetails from './components/RestaurantDetails'

function Restaurant() {
    const {id}=useParams()
    return (
        <div>
            <Navbar2 />
            <RestaurantDetails restaurant_id={id}/>
        </div>
    )
}

export default Restaurant

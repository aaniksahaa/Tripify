import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { api_base } from './Constants'
import Navbar2 from './components/Navbar2'
import RestaurantDetails from './components/RestaurantDetails'

function Restaurant() {
    return (
        <div>
            <Navbar2 />
            <RestaurantDetails  />
        </div>
    )
}

export default Restaurant
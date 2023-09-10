import React from 'react'
import HotelDetails from './components/HotelDetails'
import Navbar2 from './components/Navbar2'
import AdminEditHotel from './components/AdminEditHotel'

function Hotel() {

    return (
        <div>
            <Navbar2 />
            <AdminEditHotel />
            <HotelDetails />
        </div>
    )
}

export default Hotel
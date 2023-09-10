import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { api_base } from './Constants'
import DestDetails from './components/DestinationDetails'
import Navbar2 from './components/Navbar2'

function Destination() {
   
    return (
        <div>
            <Navbar2 />
            <DestDetails />
        </div>
    )
}

export default Destination
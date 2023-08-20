import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import Home from './Home'
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import Hotel from './Hotel'

import Hotels from './Hotels'
import Activities from './Activities'
import Destinations from './Destinations'
import Trips from './Trips'
import Restaurants from './Restaurants'
import Destination from './Destination'

function App() {
  return (
    <>
      <BrowserRouter>
        <Routes>
          <Route path="" Component={Home}/>
          <Route path="/" Component={Home}/>
          <Route path="/hotels" Component={Hotels}/>
          <Route path="/activities" Component={Activities}/>
          <Route path="/destinations" Component={Destinations}/>
          <Route path="/trips" Component={Trips}/>
          <Route path="/restaurants" Component={Restaurants}/>

          <Route path="/hotel/:id" Component={Hotel}/>
          <Route path="/destination/:id" Component={Destination}/>
        </Routes>
      </BrowserRouter>
    </>
  )
}

export default App



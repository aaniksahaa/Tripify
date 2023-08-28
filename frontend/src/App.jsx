import { BrowserRouter, Route, Routes } from 'react-router-dom'
import './App.css'
import Home from './Home'
import Hotel from './Hotel'

import Activities from './Activities'
import Activity from './Activity'
import CreateTrip from './CreateTrip'
import Destination from './Destination'
import Destinations from './Destinations'
import Hotels from './Hotels'
import Login from './Login'
import Profile from './Profile'
import Restaurant from './Restaurant'
import Restaurants from './Restaurants'
import Trip from './Trip'
import Trips from './Trips'
import EditProfile from './components/EditProfile'
import Feed from './components/Feed'
import Post from './components/Post'

function App() {
  return (
    <>
      <BrowserRouter>
        <Routes>
          <Route path="" Component={Home} />
          <Route path="/" Component={Home} />
          <Route path="/login" Component={Login} />
          
          <Route path="/hotels" Component={Hotels} />
          <Route path="/hotel/:id" Component={Hotel} />

          <Route path="/activities" Component={Activities} />
          <Route path="/activity/:id" Component={Activity} />

          <Route path="/destinations" Component={Destinations} />
          <Route path="/destination/:id" Component={Destination} />
          
          <Route path="/trips" Component={Trips} />
          <Route path="/trip/:id" Component={Trip} />

          <Route path="/restaurants" Component={Restaurants} />
          <Route path="/restaurant/:id" Component={Restaurant} />

          <Route path="/create-trip" Component={CreateTrip} />

          <Route path="/feed" Component={Feed} />
          <Route path="/edit-profile" Component={EditProfile} />
          <Route path="/post/:id" Component={Post} />
          <Route path="/profile" Component={Profile} />
          <Route path="/profile/:id" Component={Profile} />

        </Routes>
      </BrowserRouter>
    </>
  )
}

export default App



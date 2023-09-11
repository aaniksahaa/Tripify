import { BrowserRouter, Route, Routes, useLocation } from 'react-router-dom'
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
import SignupCard from './components/SignUp'
import Users from './components/Users'
import Chat from './Chat'

import AdminStat from './AdminStat'
import AdminTrips from './AdminTrips'
import AdminTripBookings from './AdminTripBookings'
import AdminCreates from './AdminCreates'
import { useEffect } from 'react'
import { useToast } from '@chakra-ui/react'
import { getX } from './API'
import { useLocalStorage } from './LocalStorage'

function ScrollToTop() {
  const { pathname } = useLocation();
  useEffect(() => {
    window.scrollTo(0, 0);
  }, [pathname]);

  return null;
}

function App() {
  const toast = useToast()
  const [user, setUser] = useLocalStorage('tripify_user', null)
  async function polling() {
    const _notifications = await getX(`user/${user.user_id}/notifications`, { is_read: 0 })
    _notifications.forEach(x => {
      toast({
        position: 'top-right',
        title: 'Notification',
        description: x.text,
        status: 'info',
        duration: 3000,
        isClosable: true,
      })
    })
  }
  useEffect(() => {
    setInterval(polling, 5000);
  }, [])
  return (
    <>
      <BrowserRouter>
        <ScrollToTop />
        <Routes>
          <Route path="" Component={Home} />
          <Route path="/" Component={Home} />
          <Route path="/login" Component={Login} />
          <Route path="/reg" Component={SignupCard} />
          <Route path="/users" Component={Users} />
          <Route path="/chat" Component={Chat} />

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

          <Route path="/statistics" Component={AdminStat} />
          <Route path="/tripbookings" Component={AdminTripBookings} />
          <Route path="/create-new" Component={AdminCreates} />

        </Routes>
      </BrowserRouter>
    </>
  )
}

export default App



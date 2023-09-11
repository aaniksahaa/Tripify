import { Box, Button, Card, Container, FormControl, FormLabel, GridItem, HStack, Input, SimpleGrid, Stack, Text, VStack } from '@chakra-ui/react'
import { Select } from 'chakra-react-select'
import React, { useEffect, useState } from 'react'
import { getCities, getTripBookings, getTrips } from './API'
import CardSlider from './components/AdminRankCardSlider'
import Navbar2 from './components/Navbar2'
import AdminTripBookingCart from './components/AdminTripBookingCart'
import AdminBookingCard from './components/AdminBookingCard'
import { useLocalStorage } from './LocalStorage'

function AdminTripBookings() {

  const [u, setU] = useLocalStorage('tripify_user', {
    role: 'dummy',
    user_id: 'dummy'
  })
  const [status, setStatus] = useState(1)

  const [filter, setFilter] = useState({
    is_paid: '0',
    is_processed: '0',
    orderby: 'booking_date',
    ordertype: 'desc',
    page: '1',
    per_page: '10',
    user_id: u.role == 'admin' ? '' : u.user_id
  })

  const [bookings, setBookings] = useState([])

  const [open, setOpen] = useState(false)
  const [user, setUser] = useState('1')
  const [trip, setTrip] = useState('2')

  async function refresh() {
    load(filter)
  }
  async function load(t) {
    const _bookings = await getTripBookings(t)
    setBookings(_bookings)
    console.log(_bookings)
  }
  async function initialize() {
    load(filter)
  }
  useEffect(() => {
    if (u.role === 'dummy') window.location = '/'
    else initialize()
  }, [open, user, trip])

  function nextPage() {
    var f = filter
    f.page = Math.min(1000, parseInt(f.page) + 1)
    setFilter(f)
    load(f)
    window.scrollTo(0, 0);
  }
  function prevPage() {
    var f = filter
    f.page = Math.max(1, parseInt(f.page) - 1)
    setFilter(f)
    load(f)
    window.scrollTo(0, 0);
  }
  function notPaid() {
    setStatus(1)
    var f = filter
    f.is_paid = 0
    f.is_processed = '0'
    f.orderby = 'booking_date'
    setFilter(f)
    load(f)
  }
  function notProcessed() {
    setStatus(2)
    var f = filter
    f.is_paid = '1'
    f.is_processed = '0'
    f.orderby = 'payment_date'
    setFilter(f)
    load(f)
  }
  function confirmed() {
    setStatus(3)
    var f = filter
    f.is_paid = '1'
    f.is_processed = '1'
    f.orderby = 'processing_date'
    setFilter(f)
    load(f)
  }
  return (
    <div>
      <Navbar2 />
      <AdminTripBookingCart open={open} setOpen={setOpen} user_id={user} trip_id={trip}></AdminTripBookingCart>
      <Container maxW='2000px'>
        <Box margin='20px' style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
          <Text fontWeight={'bold'} fontSize='4xl'>Tripbookings</Text>
        </Box>
        <HStack p={10} justifyContent={'center'}>
          <Button size={'lg'} colorScheme={status == 1 ? 'blue' : 'gray'} variant={'solid'} onClick={() => { notPaid() }}>Pending Payment</Button>
          <Button size={'lg'} colorScheme={status == 2 ? 'blue' : 'gray'} variant={'solid'} onClick={() => { notProcessed() }}>Pending Processing</Button>
          <Button size={'lg'} colorScheme={status == 3 ? 'blue' : 'gray'} variant={'solid'} onClick={() => { confirmed() }}>Confirmed</Button>
        </HStack>
        <VStack>
          <SimpleGrid columns={{ base: 1, sm: 1, md: 1, lg: 1, xl: 1 }} spacing={35} p='30px'>
            {
              bookings.map((item, index) => (
                <Box key={index}>
                  <Box display={'flex'} justifyContent={'right'}>
                    <Button width={'25%'} colorScheme='gray' size={'lg'} variant={'solid'} onClick={() => { setOpen(true); setUser(item.user_id); setTrip(item.trip_id) }}>View Booking Details</Button>
                  </Box>
                  <AdminBookingCard booking={item}></AdminBookingCard>
                </Box>
              ))
            }
          </SimpleGrid>
          <Stack direction={'row'} justifyContent={'center'} alignItems={'center'}>
            <Button variant={'solid'} colorScheme={'blue'} onClick={prevPage}>Previous Page</Button>
            <Button variant={'solid'} colorScheme={'blue'} onClick={nextPage}>Next Page</Button>
          </Stack>
        </VStack>
        <br></br>
      </Container>
    </div>
  )
}

export default AdminTripBookings
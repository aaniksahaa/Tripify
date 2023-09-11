import React, { useEffect, useState } from 'react'
import Navbar from './components/Navbar'
import { Box, Button, Card, Container, Drawer, DrawerBody, DrawerCloseButton, DrawerContent, DrawerFooter, DrawerHeader, DrawerOverlay, Flex, FormControl, FormLabel, GridItem, HStack, Heading, Input, RangeSlider, RangeSliderFilledTrack, RangeSliderMark, RangeSliderThumb, RangeSliderTrack, SimpleGrid, Slider, SliderFilledTrack, SliderMark, SliderThumb, SliderTrack, Stack, Tab, TabIndicator, TabList, TabPanel, TabPanels, Tabs, Text, useDisclosure } from '@chakra-ui/react'
import { api_base } from './Constants'
import HotelCard from './components/HotelCard'
import { Select } from 'chakra-react-select'
import { Link } from 'react-router-dom'
import { BiFilterAlt } from 'react-icons/bi'
import Navbar2 from './components/Navbar2'
import CardSlider from './components/AdminRankCardSlider'
import { getCities, getHotels, getPrices, getStat } from './API'
import ReactPaginate from 'react-paginate'
import PieChart from './components/PieChart'
import BarChart from './components/AdminPriceChart'
import AdminStatGeneral from './AdminStatGeneral'
import NiceButton from './components/NiceButton'
import AdminCreateHotel from './components/AdminCreateHotel'
import AdminCreateRestaurant from './components/AdminCreateRestaurant'
import AdminCreateDestination from './components/AdminCreateDestination'
import AdminCreateActivity from './components/AdminCreateActivity'
import { protectRoute } from './Utils'

function AdminCreates() {

 const [type, setType] = useState('Hotel')

 const object_types = ['Hotel','Restaurant','Destination','Activity']

  useEffect(() => {
    protectRoute('admin')
  }, [])
  
  return (
    <Box>
      <Navbar2 />
      <center>
        <Box p={5} margin='20px' style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
          <Text fontWeight={'bold'} fontSize='3xl'>Create New {type}</Text>
        </Box>
        <HStack justifyContent={'center'}>
        {
            object_types.map((item,index) => (
                <Button key={item} size={'lg'} colorScheme={item==type ? 'whatsapp': 'gray'} variant={'solid'} onClick={() => setType(item)}>{item}</Button>
            ))
        }
        {/* <Button size={'lg'} colorScheme='gray' variant={'solid'} onClick={() => setType('hotel')}>Hotel</Button>
        <Button variant={'ghost'} onClick={() => setType('restaurant')}>Restaurant</Button> */}
        </HStack>
      </center>
      {
        type == 'Hotel' && (
            <AdminCreateHotel/>
      )}
      {
        type == 'Restaurant' && (
            <AdminCreateRestaurant/>
      )}
      {
        type == 'Destination' && (
            <AdminCreateDestination/>
      )}
      {
        type == 'Activity' && (
            <AdminCreateActivity/>
      )}
    </Box>
  )
}

export default AdminCreates
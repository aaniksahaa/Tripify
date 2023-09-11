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
import { protectRoute } from './Utils'
// import AdminNavbar2 from './components/AdminNavbar2'

function AdminStat() {

  const [type, setType] = useState('Hotel')

  const object_types = ['Hotel', 'Restaurant', 'Trip']

  useEffect(() => {
      protectRoute('admin')
  }, [])

  return (
    <Box>
      <Navbar2 />
      <center>
        <Box p={5} margin='20px' style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
          <Text fontWeight={'bold'} fontSize='3xl'>Price and Popularity Statistics</Text>
        </Box>
        <HStack justifyContent={'center'}>
          {
            object_types.map((item, index) => (
              <Button size={'lg'} colorScheme={item == type ? 'whatsapp' : 'gray'} variant={'solid'} onClick={() => setType(item)}>{item}</Button>
            ))
          }
          {/* <Button size={'lg'} colorScheme='gray' variant={'solid'} onClick={() => setType('hotel')}>Hotel</Button>
        <Button variant={'ghost'} onClick={() => setType('restaurant')}>Restaurant</Button> */}
        </HStack>
      </center>
      <AdminStatGeneral object_type={type}></AdminStatGeneral>
    </Box>
  )
}

export default AdminStat
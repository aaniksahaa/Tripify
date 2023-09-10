import React, { useEffect, useState } from 'react'
import Navbar from './components/Navbar'
import { Box, Button, Card, Container, Drawer, DrawerBody, DrawerCloseButton, DrawerContent, DrawerFooter, DrawerHeader, DrawerOverlay, Flex, FormControl, FormLabel, GridItem, Heading, Input, RangeSlider, RangeSliderFilledTrack, RangeSliderMark, RangeSliderThumb, RangeSliderTrack, SimpleGrid, Slider, SliderFilledTrack, SliderMark, SliderThumb, SliderTrack, Stack, Text, useDisclosure } from '@chakra-ui/react'
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

function AdminStatGeneral({object_type}) {

    const initcap_type = object_type

    object_type = object_type.toLowerCase()

  const rank_attributes = ['rating','total_revenue', 'total_bookings']
  const rank_titles = ['Average Rating', 'Total Revenue', 'Total Bookings']

  const [objects, setObjects] = useState([])
  const [prices, setPrices] = useState([])
  
  async function load() {
    let new_objects = []
    for(let a of rank_attributes)
    {
      const _objects = await getStat({ object_type: object_type, orderby: a, ordertype: 'desc', per_page: '3' })
      console.log(_objects)
      new_objects.push(_objects)
    }
    setObjects(new_objects)
    console.log(new_objects);
    const _prices = await getPrices({object_type: object_type})
    console.log(_prices)
    setPrices(_prices)
  }
  async function initialize() {
    await load()
  }
  useEffect(() => {
    initialize()
  }, [object_type])

  const getRankParameter = (item,rank_id) => {
    if(rank_id == 0)
    {
      return item.rating_avg
    }
    else if(rank_id == 1)
    {
      return item.total_revenue
    }
    if(rank_id == 2)
    {
      return item.total_bookings
    }
  }

  const getRankSubTitle = (item, rank_id) => {
    return rank_titles[rank_id]+ ': ' +getRankParameter(item,rank_id);
  }

  const getObjectId = (item) => {
    if(object_type == 'hotel'){
        return item.hotel_id
    }
    else if(object_type == 'restaurant'){
        return item.restaurant_id
    }
  }

  if(objects.length == 0)
  {
    return (
      <Text>Loading</Text>
    )
  }

  console.log('objects are ',objects)
  
  return (
      <Container maxW='2000px' >
        <br></br>
      <center>
      <Text fontWeight={'bold'} fontSize='4xl'>Price Distribution of {initcap_type}s</Text>
      <br></br>
      <Box width={'80%'} height={'80%'}>
      <BarChart got_data={prices}/>
      </Box>
      <br></br>
      </center>
      {
        rank_attributes.map((item, rank_id) => (
          <>
          <Box>
          <Text p={10} fontSize={'2xl'} fontWeight={'bold'}>{initcap_type}s Ranked by {rank_titles[rank_id]}</Text>
          </Box>
          <SimpleGrid columns={{ base: 1, sm: 1, md: 5, lg: 5, xl: 5 }} >
            <GridItem colSpan={{ base: 1, sm: 1, md: 2, lg: 3, xl: 5 }}>
              <SimpleGrid columns={{ base: 1, sm: 1, md: 2, lg: 3, xl: 3 }} spacing={20} style={{ width: '100%' }} p='30px'>
                {
                  objects[rank_id].map((item, index) => (
                    <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} height={'100%'} position={'relative'}>
                      <CardSlider rating={parseInt(Math.round(parseFloat(item.rating_avg)))} imgs={item.images} price={item.price_per_day} href={`/${object_type}/${getObjectId(item)}`} title={item.name} info={item.address} rank={index+1} subtitle={getRankSubTitle(item,rank_id)}/>
                    </Card>
                  ))
                }
              </SimpleGrid>
            </GridItem>
            <Box height={'200px'}>
            </Box>
          </SimpleGrid>
          </>
        ))
      }
      </Container>
  )
}

export default AdminStatGeneral
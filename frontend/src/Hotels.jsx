import React, { useEffect, useState } from 'react'
import Navbar from './components/Navbar'
import { Box, Button, Card, Container, Drawer, DrawerBody, DrawerCloseButton, DrawerContent, DrawerFooter, DrawerHeader, DrawerOverlay, Flex, FormControl, FormLabel, GridItem, Heading, Input, RangeSlider, RangeSliderFilledTrack, RangeSliderMark, RangeSliderThumb, RangeSliderTrack, SimpleGrid, Slider, SliderFilledTrack, SliderMark, SliderThumb, SliderTrack, Stack, Text, useDisclosure } from '@chakra-ui/react'
import { api_base } from './Constants'
import HotelCard from './components/HotelCard'
import { Select } from 'chakra-react-select'
import { Link } from 'react-router-dom'
import { BiFilterAlt } from 'react-icons/bi'
import Navbar2 from './components/Navbar2'
import CardSlider from './components/CardSlider'
import { getCities, getHotels } from './API'
import ReactPaginate from 'react-paginate'

function Hotels() {
  const [hotels, setHotels] = useState([])
  const [cities, setCities] = useState([])
  const [filter, setFilter] = useState({
    name: '',
    address: '',
    city_id: '',
    min_price: 0,
    max_price: 5000,
    has_wifi: '',
    has_parking: '',
    has_gym: '',
    orderby: 'name',
    ordertype: 'asc',
    page: 1,
    per_page: 10
  })
  async function searchClick() {
    var f = filter
    f['page'] = 1
    await load(f)
    setFilter(f)
  }
  async function load(t) {
    const _hotels = await getHotels(t)
    setHotels(_hotels)
  }
  async function initialize() {
    const _cities = await getCities({})
    setCities(_cities)
    load({ orderby: 'name', ordertype: 'asc' })
  }
  useEffect(() => {
    initialize()
  }, [])

  function nextPage() {
    var f = filter
    f['page'] = Math.min(1000, f['page'] + 1)
    setFilter(f)
    load(f)
  }
  function prevPage() {
    var f = filter
    f['page'] = Math.max(1, f['page'] - 1)
    setFilter(f)
    load(f)
  }
  return (
    <Box>
      <Navbar2 />
      <Container maxW='2000px' >
        <Box margin='20px' style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
          <Text fontSize='4xl'>Hotels</Text>
        </Box>
        <SimpleGrid columns={{ base: 1, sm: 1, md: 3, lg: 4, xl: 5 }} >
          <GridItem colSpan={{ base: 1, sm: 1, md: 1, lg: 1, xl: 1 }} padding='20px'>
            <Stack spacing={'10px'}>
              <FormControl>
                <FormLabel>Name</FormLabel>
                <Input variant='filled' placeholder='' value={filter.name} onChange={(e) => {
                  var obj = { ...filter }
                  obj['name'] = e.target.value
                  setFilter(obj)
                }} />
              </FormControl>
              <FormControl>
                <FormLabel>Address</FormLabel>
                <Input variant='filled' placeholder='' value={filter.address} onChange={(e) => {
                  var obj = { ...filter }
                  obj['address'] = e.target.value
                  setFilter(obj)
                }} />
              </FormControl>
              <FormControl>
                <FormLabel>Price per day</FormLabel>
                <RangeSlider min={0} max={5000} step={30} value={[filter.min_price, filter.max_price]} onChange={(val) => {
                  var obj = { ...filter }
                  obj.min_price = val[0]
                  obj.max_price = val[1]
                  setFilter(obj)
                }}>
                  <RangeSliderMark value={0} mt='5' ml='-2.5' fontSize='sm'>৳0</RangeSliderMark>
                  <RangeSliderMark value={1000} mt='5' ml='-2.5' fontSize='sm'>৳1000</RangeSliderMark>
                  <RangeSliderMark value={2000} mt='5' ml='-2.5' fontSize='sm'>৳2000</RangeSliderMark>
                  <RangeSliderMark value={3000} mt='5' ml='-2.5' fontSize='sm'>৳3000</RangeSliderMark>
                  <RangeSliderMark value={4000} mt='5' ml='-2.5' fontSize='sm'>৳4000</RangeSliderMark>
                  <RangeSliderMark value={5000} mt='5' ml='-2.5' fontSize='sm'>৳5000</RangeSliderMark>
                  <RangeSliderTrack bg='red.100'>
                    <RangeSliderFilledTrack bg='tomato' />
                  </RangeSliderTrack>
                  <RangeSliderThumb boxSize={6} index={0} />
                  <RangeSliderThumb boxSize={6} index={1} />
                </RangeSlider>
              </FormControl>
              <br />
              <FormControl>
                <FormLabel>City</FormLabel>
                <Select
                  isMulti
                  options={cities}
                  className="basic-multi-select"
                  classNamePrefix="select"
                  onChange={(v) => {
                    var obj = { ...filter }
                    obj.city_id = ''
                    v.forEach(x => obj.city_id += x.value + ',')
                    setFilter(obj)
                  }}
                />
              </FormControl>
              <FormControl>
                <FormLabel>Facilities</FormLabel>
                <Select
                  isMulti
                  options={
                    [
                      {
                        label: "Wifi",
                        value: "has_wifi"
                      },
                      {
                        label: "Gym",
                        value: "has_gym",
                      },
                      {
                        label: "Parking",
                        value: "has_parking",
                      },
                    ]
                  }
                  onChange={(v) => {
                    var obj = { ...filter }
                    obj['has_wifi'] = ''
                    obj['has_gym'] = ''
                    obj['has_parking'] = ''
                    v.forEach(x => obj[x.value] = '1')
                    setFilter(obj)
                  }}
                  className="basic-multi-select"
                  classNamePrefix="select"
                />
              </FormControl>
              <FormControl>
                <FormLabel>Sort by</FormLabel>
                <Select
                  options={
                    [
                      {
                        label: "Name (Ascending)",
                        value: '1',
                        orderby: 'name',
                        ordertype: 'asc'
                      },
                      {
                        label: "Price Per Day (Ascending)",
                        value: '2',
                        orderby: 'price_per_day',
                        ordertype: 'asc'
                      },
                      {
                        label: "Rating (Descending)",
                        value: '3',
                        orderby: 'price_per_day',
                        ordertype: 'asc'
                      },
                      {
                        label: "Review Count (Descending)",
                        value: '4',
                        orderby: 'price_per_day',
                        ordertype: 'asc'
                      },
                      {
                        label: "Name (Descending)",
                        value: '5',
                        orderby: 'name',
                        ordertype: 'desc'
                      },
                      {
                        label: "Price Per Day (Descending)",
                        value: '6',
                        orderby: 'price_per_day',
                        ordertype: 'desc'
                      },
                      {
                        label: "Rating (Ascending)",
                        value: '7',
                        orderby: 'price_per_day',
                        ordertype: 'asc'
                      },
                      {
                        label: "Review Count (Ascending)",
                        value: '8',
                        orderby: 'price_per_day',
                        ordertype: 'asc'
                      }
                    ]
                  }
                  defaultValue={
                    {
                      label: "Name (Ascending)",
                      value: '1',
                      orderby: 'name',
                      ordertype: 'asc'
                    }
                  }
                  onChange={(v) => {
                    var obj = { ...filter }
                    obj['orderby'] = v.orderby
                    obj['ordertype'] = v.ordertype
                    setFilter(obj)
                  }}
                  useBasicStyles 
                />
              </FormControl>
              <Button onClick={searchClick}>Search</Button>
            </Stack>
          </GridItem>
          <GridItem colSpan={{ base: 1, sm: 1, md: 2, lg: 3, xl: 4 }}>
            <SimpleGrid columns={{ base: 1, sm: 1, md: 2, lg: 3, xl: 4 }} spacing={5} style={{ width: '100%' }} p='30px'>
              {
                hotels.map((item, index) => (
                  <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} position={'relative'}>
                    <CardSlider price={item.price_per_day} href={`/hotel/${item.hotel_id}`} title={item.name} info={item.address} rating={3} />
                  </Card>
                ))
              }
            </SimpleGrid>
            <Stack direction={'row'} justifyContent={'center'} alignItems={'center'}>
              <Button variant={'solid'} colorScheme={'blue'} onClick={prevPage}>Previous Page</Button>
              <Button variant={'solid'} colorScheme={'blue'} onClick={nextPage}>Next Page</Button>
            </Stack>
          </GridItem>
          <Box height={'200px'}>
          </Box>
        </SimpleGrid>
      </Container>
    </Box >
  )
}

export default Hotels
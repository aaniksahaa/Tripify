import React, { useEffect, useState } from 'react'
import Navbar from './components/Navbar'
import { Box, Button, Card, Container, Drawer, DrawerBody, DrawerCloseButton, DrawerContent, DrawerFooter, DrawerHeader, DrawerOverlay, FormControl, FormLabel, GridItem, Heading, Input, RangeSlider, RangeSliderFilledTrack, RangeSliderMark, RangeSliderThumb, RangeSliderTrack, SimpleGrid, Slider, SliderFilledTrack, SliderMark, SliderThumb, SliderTrack, Stack, Text, useDisclosure } from '@chakra-ui/react'
import { api_base } from './Constants'
import HotelCard from './components/HotelCard'
import { MultiSelect } from 'chakra-multiselect'
import { Select } from 'chakra-react-select'
import { Link } from 'react-router-dom'
import { BiFilterAlt } from 'react-icons/bi'
import Navbar2 from './components/Navbar2'
import CardSlider from './components/CardSlider'
import { getCities, getDestinations } from './API'

function Destinations() {
  const [dests, setDests] = useState([])
  const [cities, setCities] = useState([])
  const [filter, setFilter] = useState({
    name: '',
    address: '',
    city_id: '',
    page: 1,
    per_page: 10,
    orderby: 'name',
    ordertype: 'asc'
  })
  async function searchClick() {
    var f = filter
    f['page'] = 1
    await load(f)
    setFilter(f)
  }
  async function load(t) {
    const _dests = await getDestinations(t)
    setDests(_dests)
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
    <div>
      <Navbar2 />
      <Container maxW='2000px'>
        <Box margin='20px' style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
          <Text fontSize='4xl'>Destinations</Text>
        </Box>
        <SimpleGrid columns={{ base: 1, sm: 1, md: 3, lg: 4, xl: 5 }}>
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
                        label: "Rating (Descending)",
                        value: '2',
                        orderby: 'rating',
                        ordertype: 'desc'
                      },
                      {
                        label: "Review Count (Descending)",
                        value: '3',
                        orderby: 'review_count',
                        ordertype: 'desc'
                      },
                      {
                        label: "Name (Descending)",
                        value: '4',
                        orderby: 'name',
                        ordertype: 'desc'
                      },
                      {
                        label: "Rating (Ascending)",
                        value: '5',
                        orderby: 'rating',
                        ordertype: 'asc'
                      },
                      {
                        label: "Review Count (Ascending)",
                        value: '6',
                        orderby: 'review_count',
                        ordertype: 'asc'
                      }
                    ]
                  }
                  defaultValue={
                    {
                      label: "Name (Ascending)",
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
                  className="basic-multi-select"
                  classNamePrefix="select"
                />
              </FormControl>
              <Button onClick={searchClick}>Search</Button>
            </Stack>
          </GridItem>
          <GridItem colSpan={{ base: 1, sm: 1, md: 2, lg: 3, xl: 4 }}>
            <SimpleGrid columns={{ base: 1, sm: 1, md: 2, lg: 3, xl: 4 }} spacing={1} p='30px'>
              {
                dests.map((item, index) => (
                  <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} position={'relative'}>
                    <CardSlider href={`/destination/${item.destination_id}`} title={item.name} info={item.address} rating={Math.floor(Math.random() * 5)} />
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
    </div>
  )
}

export default Destinations
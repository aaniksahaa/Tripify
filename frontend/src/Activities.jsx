import React, { useEffect, useState } from 'react'
import Navbar from './components/Navbar'
import { Box, Button, Card, Container, Drawer, DrawerBody, DrawerCloseButton, DrawerContent, DrawerFooter, DrawerHeader, DrawerOverlay, FormControl, FormLabel, GridItem, Heading, Input, RangeSlider, RangeSliderFilledTrack, RangeSliderMark, RangeSliderThumb, RangeSliderTrack, SimpleGrid, Slider, SliderFilledTrack, SliderMark, SliderThumb, SliderTrack, Stack, Text, useDisclosure } from '@chakra-ui/react'
import { api_base } from './Constants'
import HotelCard from './components/HotelCard'
import { MultiSelect } from 'chakra-multiselect'
import { Select } from 'chakra-react-select'
import { Link } from 'react-router-dom'
import { BiFilterAlt } from 'react-icons/bi'
import ActivityCard from './components/ActivityCard'
import Navbar2 from './components/Navbar2'
import CardSlider from './components/CardSlider'
import { getActivities } from './API'

function Activities() {
  const [activities, setActivities] = useState([])
  const [filter, setFilter] = useState({
    name: '',
    category: '',
    min_age: 0,
    max_age: 100,
  })
  async function searchClick() {
    var f = filter
    f['page'] = 1
    await load(f)
    setFilter(f)
  }
  async function load(t) {
    const _acts = await getActivities(t)
    setActivities(_acts)
  }
  async function initialize() {
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
          <Text fontSize='4xl'>Activities</Text>
        </Box>
        <SimpleGrid columns={{ base: 1, sm: 1, md: 3, lg: 4, xl: 5 }}>
          <GridItem colSpan={{ base: 1, sm: 1, md: 1, lg: 1, xl: 1 }} padding='20px'>
            <Stack spacing={'10px'}>
              <FormControl>
                <FormLabel>Name</FormLabel>
                <Input variant='filled' placeholder='' value={filter.name} onChange={(e) => {
                  setFilter((prevFilter) => ({
                    ...prevFilter,
                    name: e.target.value
                  }));
                }} />
              </FormControl>
              <FormControl>
                <FormLabel>Category</FormLabel>
                <Input variant='filled' placeholder='' value={filter.category} onChange={(e) => {
                  setFilter((prevFilter) => ({
                    ...prevFilter,
                    category: e.target.value
                  }));
                }} />
              </FormControl>
              <FormControl>
                <FormLabel>Age</FormLabel>
                <RangeSlider min={0} max={100} step={10} value={[filter.min_age, filter.max_age]} onChange={(val) => {
                  var obj = { ...filter }
                  obj.min_age = val[0]
                  obj.max_age = val[1]
                  setFilter(obj)
                }}>
                  <RangeSliderMark value={0} mt='5' ml='-2.5' fontSize='sm'>0</RangeSliderMark>
                  <RangeSliderMark value={20} mt='5' ml='-2.5' fontSize='sm'>20</RangeSliderMark>
                  <RangeSliderMark value={40} mt='5' ml='-2.5' fontSize='sm'>40</RangeSliderMark>
                  <RangeSliderMark value={60} mt='5' ml='-2.5' fontSize='sm'>60</RangeSliderMark>
                  <RangeSliderMark value={80} mt='5' ml='-2.5' fontSize='sm'>80</RangeSliderMark>
                  <RangeSliderMark value={100} mt='5' ml='-2.5' fontSize='sm'>100</RangeSliderMark>
                  <RangeSliderTrack bg='red.100'>
                    <RangeSliderFilledTrack bg='tomato' />
                  </RangeSliderTrack>
                  <RangeSliderThumb boxSize={6} index={0} />
                  <RangeSliderThumb boxSize={6} index={1} />
                </RangeSlider>
              </FormControl>
              <br/>
              <FormControl>
                <FormLabel>Sort by</FormLabel>
                <Select
                  options={
                    [
                      {
                        label: "Name (Ascending)",
                        value:'1',
                        orderby: 'name',
                        ordertype: 'asc'
                      },
                      {
                        label: "Price Per Day (Ascending)",
                        value:'2',
                        orderby: 'price_per_day',
                        ordertype: 'asc'
                      },
                      {
                        label: "Rating (Descending)",
                        value:'3',
                        orderby: 'rating',
                        ordertype: 'desc'
                      },
                      {
                        label: "Review Count (Descending)",
                        value:'4',
                        orderby: 'review_count',
                        ordertype: 'desc'
                      },
                      {
                        label: "Name (Descending)",
                        value:'5',
                        orderby: 'name',
                        ordertype: 'desc'
                      },
                      {
                        label: "Price Per Day (Descending)",
                        value:'6',
                        orderby: 'price_per_day',
                        ordertype: 'desc'
                      },
                      {
                        label: "Rating (Ascending)",
                        value:'7',
                        orderby: 'rating',
                        ordertype: 'asc'
                      },
                      {
                        label: "Review Count (Ascending)",
                        value:'8',
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
            <SimpleGrid columns={{ base: 1, sm: 1, md: 2, lg: 3, xl: 4 }} spacing={1} style={{ width: '100%' }} p='30px'>
              {
                activities.map((item, index) => (
                  <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} position={'relative'}>
                    <CardSlider href={`/activity/${item.activity_id}`} title={item.name} info={item.category} rating={3} />
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

export default Activities
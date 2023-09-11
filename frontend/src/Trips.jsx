import { Box, Button, Card, Checkbox, Container, Flex, FormControl, FormLabel, GridItem, Input, RangeSlider, RangeSliderFilledTrack, RangeSliderMark, RangeSliderThumb, RangeSliderTrack, SimpleGrid, Stack, Text } from '@chakra-ui/react'
import { Select } from 'chakra-react-select'
import React, { useEffect, useState } from 'react'
import { getCities, getTrips } from './API'
import { useLocalStorage } from './LocalStorage'
import CardSlider from './components/CardSlider'
import Navbar2 from './components/Navbar2'
import { isLoggedIn } from './Utils'

function Trips() {
  const [user, setUser] = useLocalStorage('tripify_user', {})
  const [trips, setTrips] = useState([])
  const [cities, setCities] = useState([])
  const [filter, setFilter] = useState({
    name: '',
    creator_user_id: '',
    address: '',
    city_id: '',
    price_min: 0,
    price_max: 100000,
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
    const _trips = await getTrips(t)
    setTrips(_trips)
    console.log(_trips);
  }
  async function initialize() {
    const _cities = await getCities({})
    setCities(_cities)
    load({})
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
    fload(f)
  }
  function checkboxClick(e) {
    var f = filter
    if (e.target.checked) f['creator_user_id'] = user.user_id
    else delete f['creator_user_id']
    setFilter(f)
    load(f)
  }
  return (
    <div>
      <Navbar2 />
      <Container maxW='2000px'>
        <Box margin='20px' style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
          <Text fontSize='4xl'>Trips</Text>
        </Box>
        <SimpleGrid columns={{ base: 1, sm: 1, md: 3, lg: 4, xl: 5 }}>
          <GridItem colSpan={{ base: 1, sm: 1, md: 1, lg: 1, xl: 1 }} padding='20px'>
            <Stack spacing={'10px'}>
              <FormControl>
                <Flex>
                  {
                    isLoggedIn() ?
                      <Flex justifyItems={'center'} alignItems={'center'}>
                        <Checkbox size={'lg'} onChange={checkboxClick} /> &emsp;<Text fontSize={'lg'}>My Trips</Text>

                      </Flex>
                      : <></>
                  }
                </Flex>
              </FormControl>
              <FormControl>
                <FormLabel>Name</FormLabel>
                <Input variant='filled' placeholder='' value={filter.name} onChange={(e) => {
                  var obj = { ...filter }
                  obj['name'] = e.target.value
                  setFilter(obj)
                }} />
              </FormControl>
              {/* <FormControl>
                <FormLabel>Address</FormLabel>
                <Input variant='filled' placeholder='' value={filter.address} onChange={(e) => {
                  var obj = { ...filter }
                  obj['address'] = e.target.value
                  setFilter(obj)
                }} />
              </FormControl> */}
              {/* <FormControl>
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
                </FormControl> */}
              <FormControl>
                <FormLabel>Total Price</FormLabel>
                <RangeSlider min={0} max={100000} step={2000} value={[filter.price_min, filter.price_max]} onChange={(val) => {
                  var obj = { ...filter }
                  obj.price_min = val[0]
                  obj.price_max = val[1]
                  setFilter(obj)
                }}>
                  <RangeSliderMark value={0} mt='5' ml='-2.5' fontSize='sm'>৳0</RangeSliderMark>
                  <RangeSliderMark value={20000} mt='5' ml='-2.5' fontSize='sm'>৳20K</RangeSliderMark>
                  <RangeSliderMark value={40000} mt='5' ml='-2.5' fontSize='sm'>৳40K</RangeSliderMark>
                  <RangeSliderMark value={60000} mt='5' ml='-2.5' fontSize='sm'>৳60K</RangeSliderMark>
                  <RangeSliderMark value={80000} mt='5' ml='-2.5' fontSize='sm'>৳80K</RangeSliderMark>
                  <RangeSliderMark value={100000} mt='5' ml='-2.5' fontSize='sm'>৳100K</RangeSliderMark>
                  <RangeSliderTrack bg='red.100'>
                    <RangeSliderFilledTrack bg='tomato' />
                  </RangeSliderTrack>
                  <RangeSliderThumb boxSize={6} index={0} />
                  <RangeSliderThumb boxSize={6} index={1} />
                </RangeSlider>
              </FormControl>
              <br />
              <br />
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
                trips.map((item, index) => (
                  item ?

                    <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} position={'relative'}>
                      <CardSlider imgs={[item.image_url]} href={`/trip/${item.trip_id}`} title={item.name} info={item.address} rating={item.rating_info.rating_avg} price={item.total_price} />
                    </Card>
                    :
                    <></>
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

export default Trips
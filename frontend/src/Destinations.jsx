import React, { useEffect, useState } from 'react'
import Navbar from './components/Navbar'
import { Box, Button, Drawer, DrawerBody, DrawerCloseButton, DrawerContent, DrawerFooter, DrawerHeader, DrawerOverlay, FormControl, FormLabel, Heading, Input, RangeSlider, RangeSliderFilledTrack, RangeSliderMark, RangeSliderThumb, RangeSliderTrack, SimpleGrid, Slider, SliderFilledTrack, SliderMark, SliderThumb, SliderTrack, useDisclosure } from '@chakra-ui/react'
import { api_base } from './Config'
import HotelCard from './components/HotelCard'
import { MultiSelect } from 'chakra-multiselect'
import { Select } from 'chakra-react-select'
import { FormField } from 'semantic-ui-react'
import { Link } from 'react-router-dom'
import { BiFilterAlt } from 'react-icons/bi'
import Navbar2 from './components/Navbar2'

function Destinations() {
  const { isOpen, onOpen, onClose } = useDisclosure()
  const btnRef = React.useRef()

  const [dests, setDests] = useState([])
  const [cities, setCities] = useState([])
  const [filter, setFilter] = useState({
    name: '',
    address: '',
    city_id: '',
  })
  const [page, setPage] = useState(1)
  const [value, setValue] = useState([])
  async function searchClick() {
    // var url = api_base + '/hotel/?'
    // Object.keys(filter).forEach(x => {
    //   url = url + x + '=' + filter[x] + '&'
    // })
    // console.log(url)
    // alert(url)
    await load()
  }
  async function getCities() {
    const url = api_base + '/city?name=a&country_name=ban'
    const r = await fetch(url)
    const j = await r.json()
    var tmp = []
    for (var i = 0; i < j.length; i++) {
      tmp.push({
        label: j[i].name,
        value: j[i].city_id
      })
    }
    setCities(tmp)
    console.log(tmp)
  }
  async function load() {
    var url = api_base + '/destination/?'
    Object.keys(filter).forEach(x => {
      url = url + x + '=' + filter[x] + '&'
    })
    console.log(url)
    const r = await fetch(url)
    const j = await r.json()
    setDests(j)
  }
  useEffect(() => {
    getCities()
    load()
  }, [])
  return (
    <div>
      <Navbar2 />
      <Box style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
        <Box style={{ margin: '10px' }}>
          <Heading>Destinations</Heading>
        </Box>
        <Box>
          <Button leftIcon={<BiFilterAlt />} variant='solid' ref={btnRef}  onClick={onOpen}>
            Filter
          </Button>
        </Box>
      </Box>

      <center>
        <SimpleGrid columns={{ sm: 1, md: 3, lg: 6 }} spacing={5} style={{ width: '100%' }} p='30px'>

          {
            dests.map((item, index) => (
              <Link to={`/destination/${item.destination_id}`}>
                <HotelCard props={item} />
              </Link>
            ))
          }
        </SimpleGrid>
      </center>

      <Drawer
        size='md'
        isOpen={isOpen}
        placement='right'
        onClose={onClose}
        finalFocusRef={btnRef}
      >
        <DrawerOverlay />
        <DrawerContent>
          <DrawerCloseButton />
          <DrawerHeader>Filters</DrawerHeader>
          <DrawerBody>
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
            <br />
            <FormControl>
              <FormField>City</FormField>
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
            <br />
            <Button onClick={searchClick}>Search</Button>
          </DrawerBody>
          {/* <DrawerFooter>
            <Button variant='outline' mr={3} onClick={onClose}>
              Cancel
            </Button>
            <Button colorScheme='blue'>Save</Button>
          </DrawerFooter> */}
        </DrawerContent>
      </Drawer>
    </div>
  )
}

export default Destinations
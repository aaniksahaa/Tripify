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
import ActivityCard from './components/ActivityCard'
import Navbar2 from './components/Navbar2'

function Activities() {
  const { isOpen, onOpen, onClose } = useDisclosure()
  const btnRef = React.useRef()

  const [activities, setActivities] = useState([])
  const [filter, setFilter] = useState({
    name: '',
    category: '',
    min_age: 0,
    max_age: 100,
  })
  const [page, setPage] = useState(1)
  async function searchClick() {
    // var url = api_base + '/hotel/?'
    // Object.keys(filter).forEach(x => {
    //   url = url + x + '=' + filter[x] + '&'
    // })
    // console.log(url)
    // alert(url)
    await load()
  }
  async function load() {
    var url = api_base + '/activity/?'
    Object.keys(filter).forEach(x => {
      url = url + x + '=' + filter[x] + '&'
    })
    console.log(url)
    const r = await fetch(url)
    const j = await r.json()
    setActivities(j)
  }
  useEffect(() => {
    load()
  }, [])
  return (
    <div>
      <Navbar2 />
      <Box style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
        <Box style={{ margin: '10px' }}>
          <Heading>Activities</Heading>
        </Box>
        <Box>
          <Button leftIcon={<BiFilterAlt />} variant='solid' ref={btnRef} onClick={onOpen}>
            Filter
          </Button>
        </Box>
      </Box>

      <center>
        <SimpleGrid columns={{ sm: 1, md: 3, lg: 6 }} spacing={5} style={{ width: '100%' }} p='30px'>

          {
            activities.map((item, index) => (
              <Link to={`/activity/${item.activity_id}`}>
                <ActivityCard props={item} />
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
            </FormControl><br/>
            <FormControl>
              <FormLabel>Category</FormLabel>
              <Input variant='filled' placeholder='' value={filter.category} onChange={(e) => {
                var obj = { ...filter }
                obj['category'] = e.target.value
                setFilter(obj)
              }} />
            </FormControl><br/>
            <FormControl>
              <FormField>Age</FormField>
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

export default Activities
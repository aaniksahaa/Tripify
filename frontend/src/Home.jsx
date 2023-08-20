import {
  Box,
  Flex,
  Avatar,
  HStack,
  Text,
  IconButton,
  Button,
  Menu,
  MenuButton,
  MenuList,
  MenuItem,
  MenuDivider,
  useDisclosure,
  useColorModeValue,
  Stack,
  Grid,
  GridItem,
  SimpleGrid,
  InputGroup,
  InputLeftAddon,
  Input,
  Tabs,
  TabList,
  Tab,
  TabIndicator,
  Heading,
} from '@chakra-ui/react'
import { HamburgerIcon, CloseIcon, AddIcon } from '@chakra-ui/icons'
import { useEffect, useState } from 'react'
import HotelCard from './components/HotelCard'
import Navbar from './components/Navbar'
import Hero from './components/Hero'
import Navbar2 from './components/Navbar2'

export default function Home() {
  const { isOpen, onOpen, onClose } = useDisclosure()
  const [list, setList] = useState([]);
  const [search, setSearch] = useState('')

  const [hotels, setHotels] = useState([])
  const [restaurants, setRestaurants] = useState([])
  const [activities, setActivities] = useState([])
  const [trips, setTrips] = useState([])
  const [destinations, setDestinations] = useState([])

  async function getDestinations() {
    const url = `http://localhost:3000/api/v1/destination?name=${search}&page=1&per_page=5&orderby=name&ordertype=asc`
    const f = await fetch(url)
    const j = await f.json()
    setDestinations(j)
  }
  async function getTrips() {
    const url = `http://localhost:3000/api/v1/trip?name=${search}`
    const f = await fetch(url)
    const j = await f.json()
    setTrips(j)
  }
  async function getActivities() {
    const url = `http://localhost:3000/api/v1/activity?name=${search}&page=1&per_page=6&orderby=name&ordertype=desc`
    const f = await fetch(url)
    const j = await f.json()
    setActivities(j)
  }
  async function getHotels() {
    const url = `http://localhost:3000/api/v1/hotel?name=${search}&orderby=price_per_day&ordertype=desc&page=1&per_page=10`
    const f = await fetch(url)
    const j = await f.json()
    setHotels(j)
  }
  async function getRestaurants() {
    const url = `http://localhost:3000/api/v1/restaurant?name=${search}&page=1&per_page=10`
    const f = await fetch(url)
    const j = await f.json()
    setRestaurants(j)
  }

  function searchClick() {
    getHotels()
    getRestaurants()
    getActivities()
    getTrips()
    getDestinations()
  }

  useEffect(() => {

  }, [])
  return (
    <Box>
      <Navbar2 />
      <Hero />
      <Box p={4}>
        <Box style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
          <Tabs variant='unstyled'>
            <TabList>
              <Tab>Search All</Tab>
              <Tab>Hotels</Tab>
              <Tab>Activities</Tab>
              <Tab>Restaurants</Tab>
            </TabList>
            <TabIndicator
              mt="-1.5px"
              height="2px"
              bg="blue.500"
              borderRadius="1px"
            />
          </Tabs>
        </Box><br />
        <Box style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
          <Text color={'gray.1000'}>
            <InputGroup>
              <Input style={{ width: '1000px', height: '50px', borderRadius: '50px', borderColor: 'gray' }} onChange={(e) => setSearch(e.target.value)}></Input>
            </InputGroup>
          </Text>
        </Box><br />
        <Box style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
          <Button
            onClick={searchClick}
            colorScheme={'green'}
            bg={'green.400'}
            rounded={'full'}
            px={6}
            size='lg'
            _hover={{
              bg: 'green.500',
            }}>
            Search
          </Button>
        </Box>
        <br />
        {/* <InputGroup style={{ 'width': '50%' }}>
            <InputLeftAddon children='Search' />
            <Input variant='outline' placeholder='Where do you wanna go?' onChange={(e) => setSearch(e.target.value)} />
          </InputGroup> */}

        {hotels.length > 0 && <Box>
          <Box style={{ display: 'flex', justifyContent: 'center', alignItems: 'centers' }}>
            <Heading>Hotels</Heading>
          </Box>
          <Box style={{ display: 'flex', justifyContent: 'center', alignItems: 'centers' }}>
            {/* <SimpleGrid columns={{ sm: 1, md: 3, lg: 4, xl: 5 }} spacing={5} style={{ width: '100%' }} p='30px'> */}
              {
                hotels.map((item, index) => (
                  <HotelCard style={{width:'400px'}} props={item} />
                ))
              }
            {/* </SimpleGrid> */}
          </Box>
        </Box>
        }
        
        {destinations.length > 0 && <Box>
          <Box style={{ display: 'flex', justifyContent: 'center', alignItems: 'centers' }}>
            <Heading>Destinations</Heading>
          </Box>
          <Box style={{ display: 'flex', justifyContent: 'center', alignItems: 'centers' }}>
            <SimpleGrid columns={{ sm: 1, md: 3, lg: 4, xl: 5 }} spacing={5} style={{ width: '100%' }} p='30px'>
              {
                destinations.map((item, index) => (
                  <HotelCard props={item} />
                ))
              }
            </SimpleGrid>
          </Box>
        </Box>
        }

      </Box>
    </Box >
  )
}

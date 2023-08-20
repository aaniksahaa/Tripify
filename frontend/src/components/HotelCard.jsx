'use client'

import {
  Box,
  Center,
  Heading,
  Text,
  Stack,
  Avatar,
  useColorModeValue,
  Image,
  CardFooter,
  CardBody,
  CardHeader,
  Card,
  Divider,
  ButtonGroup,
  Button,
  Badge,
} from '@chakra-ui/react'
import { AiOutlineWifi } from 'react-icons/ai'
import { Link } from 'react-router-dom'
import CaptionCarousel from './Carousel'
import { Rating } from './Card2'
import CardSlider from './CardSlider'

export default function HotelCard({ props, price }) {
  return (
    <Card className="card" height={'96%'}>

      {/* <Image
          src='https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'
          alt='Green double couch with wooden legs'
          borderRadius='lg'
        /> */}

      <CardSlider price={price} title={props.name} info={props.address} rating={Math.floor(Math.random() * 5)} />
      {/* </Box> */}
      {/* <Box style={{margin:'5px'}}> */}
      {/* <Box>
        <Box style={{ padding: '10px' }}>
          <Heading size='md'>{props.name}</Heading>
          <Box style={{ overflow: 'hidden', textOverflow: 'ellipsis' }}>
            {props.description}
          </Box>
          <Box style={{ height: '30px', overflow: 'hidden', textOverflow: 'ellipsis' }}>
            <b>Location</b>: {props.address}
          </Box>
          <Text color='blue.600'>
            ${props.price_per_day} per day
          </Text>
          <Rating rating={5} numReviews={1000}/>
        </Box>
      </Box> */}
      {/* </Box> */}
      {/* <Divider />
      <CardFooter>
        <ButtonGroup spacing='2'>
          <Link to={`/hotel/${props.hotel_id}`}>
            <Button variant='solid' colorScheme='blue'>
              VIEW DETAILS
            </Button>
          </Link>
          <Button variant='ghost' colorScheme='blue'>
            Add to cart
          </Button>
        </ButtonGroup>
      </CardFooter> */}
    </Card>
  )
}

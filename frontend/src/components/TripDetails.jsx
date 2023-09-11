'use client'
import {
    Box,
    Button,
    Card,
    Container,
    Divider,
    Flex,
    Heading,
    Modal,
    ModalBody,
    ModalCloseButton,
    ModalContent,
    ModalHeader,
    ModalOverlay,
    SimpleGrid,
    Stack,
    Table,
    TableContainer,
    Tbody,
    Td,
    Text,
    Textarea,
    Thead,
    Tr,
    useColorModeValue,
    useDisclosure,
    useToast
} from '@chakra-ui/react';
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import Carousel from './Carousel';

// import { EmblaCarousel } from './EmblaCarousel'
import { DeleteIcon } from '@chakra-ui/icons';
import React, { useEffect, useState } from 'react';
import { FaHourglassEnd, FaHourglassStart } from 'react-icons/fa';
import { ImPriceTag } from 'react-icons/im';
import { useParams } from 'react-router-dom';
import { createReview, deleteTrip, getRestaurant, getTrip, getTripById, postX } from '../API';
import { addToList, useLocalStorage } from '../LocalStorage';
import ActivityDetails from './ActivityDetails';
import CardSlider from './CardSlider';
import EmblaCarousel from './EmblaCarousel';
import RatingBox from './RatingBox';
import StarRating from './StarRating';
import { getParam, isLoggedIn, userIs } from '../Utils';

export default function TripDetails() {
    const [startDate, setStartDate] = useState(new Date());
    const [endDate, setEndDate] = useState(new Date());

    const { isOpen, onOpen, onClose } = useDisclosure()
    const { isOpen: isOpen2, onOpen: onOpen2, onClose: onClose2 } = useDisclosure()
    const [props, setProps] = useState({})
    const [rating, setRating] = useState(0)
    const [review, setReview] = useState('')
    const [activity, setActivity] = useState({})

    const toast = useToast()

    async function Delete() {
        const id = getParam()
        await deleteTrip(id)
        toast({
            position: 'top-right',
            title: 'Success',
            description: 'Trip has been deleted',
            status: 'success',
            duration: 3000,
            isClosable: true,
        })
        setTimeout(() => {
            window.location = '/trips'
        }, 1000)
    }
    function activityClick(id) {
        setActivity(props.activities[id])
        onOpen2()
    }

    async function initialize(id) {
        const data = await getTrip(id)
        setProps(data)
    }

    useEffect(() => {
        const id = getParam()
        setTimeout(() => {
            initialize(id)
        }, 500)
    }, [])

    async function postReviewClick() {
        const postData = {
            "description": review,
            "rating": rating,
            "image_url": "dummy.jpg",
            "object_type": "trip",
            "object_id": props.trip_id
        }
        await createReview(postData)
        setRating(0)
        setReview('')
        toast({
            position: 'top-right',
            title: 'Success',
            description: 'Review has been posted',
            status: 'success',
            duration: 3000,
            isClosable: true,
        })
        setTimeout(() => location.reload(), 1000)
    }
    async function book() {
        const j = await postX('tripbooking', {}, { trip_id: props.trip_id, is_private: 0 })
        alert(JSON.stringify(j))
    }
    const [user, setUser] = useLocalStorage('tripify_user', {
        user_id: 69
    })
    return (
        <Container maxW={'7xl'}>
            <SimpleGrid
                columns={{ base: 1, lg: 2 }}
                spacing={{ base: 8, md: 10 }}
                pt={{ base: 18, md: 24 }}
                pb={{ base: 8, md: 14 }}
            >
                <Box>
                    <Box>
                        <Carousel data={[props.image_url]} />
                    </Box>
                </Box>
                <Stack>
                    <Box as={'header'}>
                        <Heading
                            textAlign={'center'}
                            lineHeight={1.1}
                            fontWeight={600}
                            fontSize={{ base: '2xl', sm: '4xl', lg: '5xl' }}>
                            {props.name}
                        </Heading>
                    </Box>
                    <Divider borderWidth={'1px'} m='10px' />
                    <Stack spacing={{ base: 4, sm: 6 }}>
                        <Text
                            color={useColorModeValue('gray.500', 'gray.400')}
                            fontSize={'2xl'}
                            fontWeight={'300'}>
                            {props.description}
                        </Text>
                        <Text fontSize={'lg'}>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad aliquid amet
                            at delectus doloribus dolorum expedita hic, ipsum maxime modi nam officiis
                            porro, quae, quisquam quos reprehenderit velit? Natus, totam.
                        </Text>
                        <Box>
                            {/* <Text
                                fontSize={{ base: '20px', lg: '25px' }}
                                // color={useColorModeValue('yellow.500', 'yellow.300')}
                                // fontWeight={'500'}
                                textTransform={'uppercase'}
                                mb={'4'}>
                                Features
                            </Text> */}
                        </Box>
                    </Stack>
                </Stack>
                <Stack spacing={{ base: 6, md: 10 }}>
                    {/* <Text
                        fontSize={{ base: '20x', lg: '25px' }}
                        // color={useColorModeValue('yellow.500', 'yellow.300')}
                        // fontWeight={'500'}
                        textTransform={'uppercase'}
                        mb={'4'}>
                        More
                    </Text> */}
                    <Text fontSize='3xl'>
                        Details
                    </Text>
                    <Stack
                        spacing={{ base: 4, sm: 6 }}
                        direction={'column'}
                    >
                        <Box>

                            <TableContainer>
                                <Table variant='striped'>
                                    <Tbody>
                                        <Tr>
                                            <Td>
                                                <Flex alignItems='center'>
                                                    <Box><ImPriceTag size={30} /></Box><Box>&emsp;Total Price</Box>
                                                </Flex>
                                            </Td>
                                            <Td>
                                                ৳{props.total_price}
                                            </Td>
                                        </Tr>
                                        <Tr>
                                            <Td>
                                                <Flex alignItems='center'>
                                                    <Box><FaHourglassStart size={30} /></Box><Box>&emsp;Start Date</Box>
                                                </Flex>
                                            </Td>
                                            <Td>
                                                {new Date(props.start_date).toLocaleString()}
                                            </Td>
                                        </Tr>
                                        <Tr>
                                            <Td>
                                                <Flex alignItems='center'>
                                                    <Box><FaHourglassEnd size={30} /></Box><Box>&emsp;End Date</Box>
                                                </Flex>
                                            </Td>
                                            <Td>
                                                {new Date(props.end_date).toLocaleString()}
                                            </Td>
                                        </Tr>
                                        {/* <Tr>
                                            <Td>
                                                <Flex alignItems='center'>
                                                    <Box><ImPriceTag size={30} /></Box><Box>&emsp;City</Box>
                                                </Flex>
                                            </Td>
                                            <Td>
                                                {props.city_id}
                                            </Td>
                                        </Tr>
                                        <Tr>
                                            <Td>
                                                <Flex alignItems='center'>
                                                    <Box>
                                                        <FaMapMarkerAlt size={30} />
                                                    </Box>
                                                    <Box>
                                                        &emsp;Address
                                                    </Box>
                                                </Flex>
                                            </Td>
                                            <Td>
                                                {props.address}
                                            </Td>
                                        </Tr> */}
                                        {/* <Tr>
                                            <Td>
                                                <Flex alignItems='center'>
                                                    <Box>
                                                        <AiOutlineMail size={30} />
                                                    </Box>
                                                    <Box>
                                                        Map
                                                    </Box>
                                                </Flex>
                                            </Td>
                                            <Td>
                                                <iframe style={{ width: '100%', height: '300px' }} src={`https://maps.google.com/maps?q=${props.latitude},${props.longitude}&output=embed`}></iframe>
                                            </Td>
                                        </Tr> */}
                                    </Tbody>
                                </Table>
                            </TableContainer>
                            <br />
                            <Stack direction={'row'} spacing={'20px'} justifyContent={'space-between'}>
                                {
                                    isLoggedIn() ?
                                        <Button colorScheme='blue' onClick={book} width={'50%'}>Book</Button>
                                        : <></>
                                }
                                {

                                    isLoggedIn() && (props.creator_user_id == user.user_id || userIs('admin')) ?
                                        <Button colorScheme='red' onClick={Delete}><DeleteIcon /></Button> :
                                        <></>
                                }
                            </Stack>
                        </Box>
                        <Box>
                            <Stack spacing={{ base: 6, md: 10 }}>
                                <Box>
                                    <Text fontSize={'3xl'}>
                                        Hotels
                                    </Text>
                                    <SimpleGrid columns={{ base: 1, sm: 2, md: 2, lg: 2, xl: 2 }} spacing={'20px'}>
                                        {props.hotels && props.hotels.map((item, index) =>
                                            <Box key={index}>
                                                <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} position={'relative'}>
                                                    <CardSlider imgs={item.hotel.images} price={item.hotel.price_per_day} title={item.hotel.name} info={item.hotel.address} rating={item.hotel.rating_info.rating_avg} />
                                                </Card>
                                            </Box>
                                        )}
                                    </SimpleGrid>
                                </Box>
                                <Box>
                                    <Text fontSize={'3xl'}>
                                        Restaurants
                                    </Text>
                                    <SimpleGrid columns={{ base: 1, sm: 2, md: 2, lg: 2, xl: 2 }} spacing={'20px'}>
                                        {props.restaurants && props.restaurants.map((item, index) =>
                                            <Box key={index}>
                                                <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} position={'relative'}>
                                                    <CardSlider imgs={item.restaurant.images} price={item.restaurant.reservation_price} title={item.restaurant.name} info={item.restaurant.address} rating={item.restaurant.rating_info.rating_avg} />
                                                </Card>
                                            </Box>
                                        )}
                                    </SimpleGrid>
                                </Box>
                                <Box>
                                    <Text fontSize={'3xl'}>
                                        Destination & Activities
                                    </Text>
                                    <Table>
                                        <Thead>
                                            <Tr>
                                                <Td>Destination</Td>
                                                <Td>Activity</Td>
                                                <Td>Date</Td>
                                                <Td>Cost</Td>
                                            </Tr>
                                        </Thead>
                                        <Tbody>
                                            {props.contains && props.contains.map((item, index) =>
                                                <Tr>
                                                    <Td>{item.destination_name}</Td>
                                                    <Td>{item.activity_name}</Td>
                                                    <Td>{new Date(item.tentative_date).toLocaleString()}</Td>
                                                    <Td>৳{item.price}</Td>
                                                </Tr>
                                            )}
                                        </Tbody>
                                    </Table>
                                </Box>
                            </Stack>
                        </Box>
                    </Stack>

                </Stack>

                <Box>
                    <Box>
                        <Stack spacing={{ base: 6, md: 10 }}>
                            <Text fontSize={'3xl'}>
                                Activities
                            </Text>
                            <SimpleGrid columns={{ base: 1, sm: 2, md: 2, lg: 2, xl: 2 }} spacing={'20px'}>
                                {props.activities && props.activities.map((item, index) =>
                                    <Box onClick={() => activityClick(index)} key={index}>
                                        <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} position={'relative'}>
                                            <CardSlider images={item.activity.images} price={item.price} title={item.activity.name} info={item.activity.category} rating={Math.floor(Math.random() * 5)} />
                                        </Card>
                                    </Box>
                                )}
                            </SimpleGrid>
                        </Stack>
                    </Box>
                    <Stack>
                        <Flex justifyContent={'center'}>
                            <RatingBox ratingInfo={props.rating_info} />
                        </Flex>
                        <Box>
                            <Text fontSize='3xl' textAlign={'center'}>
                                Reviews
                            </Text>
                            <Box marginTop='20px'>
                                <EmblaCarousel type={'trip'} id={props.trip_id} />
                            </Box>
                            {
                                user.user_id != 69 ?
                                    <Box marginTop={'20px'}>
                                        <Text fontSize='3xl' textAlign={'center'}>
                                            Write a Review
                                        </Text>
                                        <Box margin='10px'>
                                            <Box marginBottom={'10px'}>
                                                <StarRating allowReview={true} rating={rating} setRating={setRating} size={30} />
                                            </Box>
                                            <Textarea marginBottom={'10px'} value={review} rows='4' variant='filled' placeholder='Review' onChange={(e) => {
                                                setReview(e.target.value)
                                            }} />
                                            <Button onClick={postReviewClick} colorScheme="blue" size={'md'}>Post</Button>
                                        </Box>
                                    </Box>
                                    : <></>
                            }
                        </Box>
                    </Stack>
                </Box>

            </SimpleGrid>
            <Box height={'500px'}>
            </Box>
            <Modal onClose={onClose2} isOpen={isOpen2} isCentered size={'5xl'}>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>
                        Activity Details
                    </ModalHeader>
                    <ModalCloseButton />
                    <ModalBody display={'flex'} justifyContent={'space-between'}>
                        <ActivityDetails props={activity.activity} price={activity.price} destination={props.name} destinationId={props.destination_id} />
                    </ModalBody>
                    <Box display={'flex'} alignItems={'center'} justifyContent={'space-between'} margin='12px'>
                        <Box>
                            <Button margin='10px' onClick={onClose2}>Cancel</Button>
                        </Box>
                    </Box>
                </ModalContent>
            </Modal>
        </Container>
    )
}

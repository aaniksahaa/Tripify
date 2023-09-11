'use client'
import {
    Box,
    Button,
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
    StackDivider,
    Table,
    TableContainer,
    Tbody,
    Td,
    Text,
    Textarea,
    Tr,
    useColorModeValue,
    useDisclosure,
    useToast
} from '@chakra-ui/react';
import "react-datepicker/dist/react-datepicker.css";
import { ImPriceTag } from 'react-icons/im';

import { AiOutlineMail } from 'react-icons/ai';
import { FaMapMarkerAlt, FaPhoneAlt } from 'react-icons/fa';
import EmblaCarousel from './EmblaCarousel';
import RatingBox from './RatingBox';
import StarRating from './StarRating';
// import { EmblaCarousel } from './EmblaCarousel'
import React, { useEffect } from 'react';
import { createReview, getRestaurant } from '../API';
import { addToList } from "../LocalStorage";
import Carousel from "./Carousel";
import { useParams } from 'react-router-dom';
import { getParam, userIs } from '../Utils';
import AdminEditRestaurant from './AdminEditRestaurant';

export default function RestaurantDetails({ restaurant_id, rating_info, data }) {
    const [startDate, setStartDate] = React.useState(new Date());
    const [endDate, setEndDate] = React.useState(new Date());
    const { isOpen, onOpen, onClose } = useDisclosure()
    const { isOpen: isOpen2, onOpen: onOpen2, onClose: onClose2 } = useDisclosure()
    const [rating, setRating] = React.useState(0)
    const [review, setReview] = React.useState('')
    const [props, setProps] = React.useState({
        images: [],
        name: '',
        address: '',
        cost: '',
        reservation_price: 0,
        restaurant_id: 0,
        email: '',
        contact: ''
    })


    async function initialize(id) {

        const data = await getRestaurant(id)
        setProps(data)
    }
    async function refresh() {
        const id = getParam()
        setTimeout(() => {
            initialize(id)
        }, 500)
    }
    useEffect(() => {
        const id = getParam()
        setTimeout(() => {
            initialize(id)
        }, 500)
    }, [])

    function addClick() {
        const cartData = {
            id: props.restaurant_id,
            address: props.address,
            name: props.name,
            cost: props.reservation_price,
        }
        addToList('_restaurants', cartData)
        onClose()
    }
    const toast = useToast()
    async function postReviewClick() {
        const postData = {
            "description": review,
            "rating": rating,
            "image_url": "dummy.jpg",
            "object_type": "restaurant",
            "object_id": props.restaurant_id
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
                        <Carousel data={props.images} />
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
                    <br />
                    {
                        userIs('admin') ?
                            <Button variant={'outline'} onClick={onOpen2} colorScheme='blue'>Edit</Button>
                            : <></>
                    }
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
                        divider={
                            <StackDivider borderColor={useColorModeValue('gray.200', 'gray.600')} />
                        }>
                        <Box>

                            <TableContainer>
                                <Table variant='striped'>
                                    <Tbody>
                                        <Tr>
                                            <Td>
                                                <Flex alignItems='center'>
                                                    <Box><ImPriceTag size={30} /></Box><Box>&emsp;Reservation Price</Box>
                                                </Flex>
                                            </Td>
                                            <Td>
                                                ৳{props.reservation_price}
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
                                        </Tr><Tr>
                                            <Td>
                                                <Flex alignItems='center'>
                                                    <Box>
                                                        <FaPhoneAlt size={30} />
                                                    </Box>
                                                    <Box>
                                                        &emsp;Phone
                                                    </Box>
                                                </Flex>
                                            </Td>
                                            <Td>
                                                {props.contact}
                                            </Td>
                                        </Tr>
                                        <Tr>
                                            <Td>
                                                <Flex alignItems='center'>
                                                    <Box>
                                                        <AiOutlineMail size={30} />
                                                    </Box>
                                                    <Box>
                                                        &emsp;Email
                                                    </Box>
                                                </Flex>
                                            </Td>
                                            <Td>
                                                {props.email}
                                            </Td>
                                        </Tr>
                                        <Tr>
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
                                                <iframe style={{ width: '100%', height: '300px' }} src={`https://maps.google.com/maps?q=${props.address}&output=embed`}></iframe>
                                            </Td>
                                        </Tr>
                                    </Tbody>

                                </Table>
                            </TableContainer>
                        </Box>
                    </Stack>
                    <Button
                        onClick={onOpen}
                        rounded={'none'}
                        w={'full'}
                        size={'lg'}
                        bg={useColorModeValue('gray.900', 'gray.50')}
                        color={useColorModeValue('white', 'gray.900')}
                        textTransform={'uppercase'}
                        _hover={{
                            transform: 'translateY(2px)',
                            boxShadow: 'lg',
                        }}>
                        Add to Trip
                    </Button>
                </Stack>
                <Stack>
                    <Flex justifyContent={'center'}>
                        <RatingBox ratingInfo={props.rating_info} />
                    </Flex>
                    <Box>
                        <Text fontSize='3xl' textAlign={'center'}>
                            Reviews
                        </Text>
                        <Box marginTop='20px'>
                            <EmblaCarousel type={'restaurant'} id={props.restaurant_id} />
                        </Box>
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
                    </Box>
                </Stack>
            </SimpleGrid>
            <Box height={'500px'}>
            </Box>
            <Modal size={'2xl'} onClose={onClose2} isOpen={isOpen2} isCentered>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>Edit Restaurant</ModalHeader>
                    <ModalCloseButton />
                    <ModalBody>
                        <AdminEditRestaurant refresh={refresh} />
                    </ModalBody>
                </ModalContent>
            </Modal>
            <Modal onClose={onClose} isOpen={isOpen} isCentered>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>Add Restaurant to Trip</ModalHeader>
                    <ModalCloseButton />
                    <ModalBody>
                        <Stack>
                            <Box>
                                <Text fontSize={'xl'}>Cost</Text>
                                ৳{props.reservation_price}
                            </Box>
                        </Stack>
                    </ModalBody>
                    <Box display={'flex'} alignItems={'center'} justifyContent={'space-between'} margin='12px'>
                        <Box>
                            <Button margin='10px' colorScheme='blue' onClick={addClick}>OK</Button>
                        </Box>
                        <Box>
                            <Button margin='10px' onClick={onClose}>Cancel</Button>
                        </Box>
                    </Box>
                </ModalContent>
            </Modal>
        </Container>
    )
}

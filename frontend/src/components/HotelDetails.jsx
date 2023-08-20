'use client'
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import {
    Box,
    chakra,
    Container,
    Stack,
    Text,
    Image,
    Flex,
    VStack,
    Button,
    Heading,
    SimpleGrid,
    StackDivider,
    useColorModeValue,
    VisuallyHidden,
    List,
    ListItem,
    Badge,
    Divider,
    TableContainer,
    Table,
    Tbody,
    Tr,
    Td,
    Tfoot,
    Modal,
    ModalOverlay,
    ModalContent,
    ModalHeader,
    ModalCloseButton,
    ModalBody,
    Textarea,
    useDisclosure,
} from '@chakra-ui/react'
import { MdLocalShipping, MdSportsGymnastics } from 'react-icons/md'
import CaptionCarousel from './Carousel'
import Carousel2 from './Carousel2'
import { ImPriceTag } from 'react-icons/im'
import { CgGym } from 'react-icons/cg'

import { FaMapMarkerAlt, FaPhoneAlt } from 'react-icons/fa'
import { AiFillAccountBook, AiFillCar, AiOutlineWifi, AiOutlineMail } from 'react-icons/ai'
import ColoredCircle from './ColoredCircle'
import Feature from './Feature'
import StarRating from './StarRating'
import RatingBox from './RatingBox'
import Review from './Review'
import EmblaCarousel from './EmblaCarousel'
// import { EmblaCarousel } from './EmblaCarousel'
import React from 'react'
import Carousel from "./Carousel";
import { addToDict, addToList, setDict } from "../LocalStorage";

export default function HotelDetails({ props }) {
    const [startDate, setStartDate] = React.useState(new Date());
    const [endDate, setEndDate] = React.useState(new Date());
    const { isOpen, onOpen, onClose } = useDisclosure()
    const [rating, setRating] = React.useState(0)
    const [review, setReview] = React.useState('')

    function addClick() {
        const data = {
            id: props.hotel_id,
            name: props.name,
            start: startDate,
            end: endDate,
            cost: Math.round(Math.abs((endDate - startDate) / 86400000)) * props.price_per_day
        }
        addToList('_hotels', data)
        onClose()
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
                        <Carousel />
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
                            <Text fontSize='3xl'>
                                Features
                            </Text>
                            <br />
                            <Flex flexWrap={'wrap'}>
                                <Feature name='WiFi' icon={<AiOutlineWifi size={30} />} available={props.has_wifi} />
                                <Feature name='Parking' icon={<AiFillCar size={30} />} available={props.has_parking} />
                                <Feature name='Gym' icon={<CgGym size={30} />} available={props.has_gym} />
                            </Flex>
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
                                                    <Box><ImPriceTag size={30} /></Box><Box>&emsp;Price Per Day</Box>
                                                </Flex>
                                            </Td>
                                            <Td>
                                                ৳{props.price_per_day}
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
                                                {props.phone}
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
                        <RatingBox />
                    </Flex>
                    <Box>
                        <Text fontSize='3xl' textAlign={'center'}>
                            Reviews
                        </Text>
                        <Box marginTop='20px'>
                            <EmblaCarousel />
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
                                <Button colorScheme="blue" size={'md'}>Post</Button>
                            </Box>
                        </Box>
                    </Box>
                </Stack>
            </SimpleGrid>
            <Box height={'500px'}>
            </Box>
            <Modal onClose={onClose} isOpen={isOpen} isCentered>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>Add Hotel to Trip</ModalHeader>
                    <ModalCloseButton />
                    <ModalBody>
                        <Stack>
                            <Flex justifyContent={'space-between'}>
                                <Box>
                                    <Box>
                                        <Text fontSize='xl'>Start</Text>
                                    </Box>
                                    <Box>
                                        <DatePicker selected={startDate} onChange={(date) => setStartDate(date)} />
                                    </Box>
                                </Box>
                                <Box>
                                    <Box>
                                        <Text fontSize='xl'>End</Text>
                                    </Box>
                                    <Box>
                                        <DatePicker selected={endDate} onChange={(date) => setEndDate(date)} />
                                    </Box>
                                </Box>
                            </Flex>
                            <Box>
                                <Text fontSize={'xl'}>Cost</Text>
                                ৳{Math.round(Math.abs((endDate - startDate) / 86400000)) * props.price_per_day}
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

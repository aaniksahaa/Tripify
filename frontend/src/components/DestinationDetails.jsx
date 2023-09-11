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
    Tr,
    useColorModeValue,
    useDisclosure
} from '@chakra-ui/react';
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import { ImPriceTag } from 'react-icons/im';
import Carousel from './Carousel';

import { AiOutlineMail } from 'react-icons/ai';
import { FaMapMarkerAlt } from 'react-icons/fa';
// import { EmblaCarousel } from './EmblaCarousel'
import React, { useEffect, useState } from 'react';
import { addToList, useLocalStorage } from '../LocalStorage';
import ActivityDetails from './ActivityDetails';
import CardSlider from './CardSlider';
import { getDestination } from '../API';
import { useParams } from 'react-router-dom';
import { getParam, userIs } from '../Utils';
import AdminEditDestination from './AdminEditDestination';

export default function DestDetails({ data }) {
    const [startDate, setStartDate] = useState(new Date());
    const [endDate, setEndDate] = useState(new Date());
    const { isOpen, onOpen, onClose } = useDisclosure()
    const { isOpen: isOpen2, onOpen: onOpen2, onClose: onClose2 } = useDisclosure()
    const { isOpen: isOpen3, onOpen: onOpen3, onClose: onClose3 } = useDisclosure()
    const [rating, setRating] = useState(0)
    const [review, setReview] = useState('')
    const [activity, setActivity] = useState({})
    const [props, setProps] = useState({})
    const [aid, setaid] = useLocalStorage('aid', '1')


    async function initialize(id) {
        const data = await getDestination(id)
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

    function activityClick(id) {
        setActivity(props.activities[id])
        setaid(props.activities[id].activity_id)
        onOpen2()
    }

    function addClick() {
        const data = {
            id: props.destination_id,
            name: props.name,
            start: startDate,
            end: endDate,
            address: props.address
        }
        addToList('_destinations', data)
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
                            <Button variant={'outline'} onClick={onOpen3} colorScheme='blue'>Edit</Button>
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
                                                <iframe style={{ width: '100%', height: '300px' }} src={`https://maps.google.com/maps?q=${props.latitude},${props.longitude}&output=embed`}></iframe>
                                            </Td>
                                        </Tr>
                                    </Tbody>
                                </Table>
                            </TableContainer>
                        </Box>
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
                        {/* <Box>
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
                        </Box> */}
                    </Stack>

                </Stack>
                <Box>
                    <Stack spacing={{ base: 6, md: 10 }}>
                        <Text fontSize={'3xl'}>
                            Activities
                        </Text>
                        <SimpleGrid columns={{ base: 1, sm: 2, md: 2, lg: 2, xl: 2 }} spacing={'20px'}>
                            {props.activities && props.activities.map((item, index) =>
                                <Box onClick={() => activityClick(index)} key={index}>
                                    <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} position={'relative'}>
                                        <CardSlider imgs={item.activity.images} price={item.price} title={item.activity.name} info={item.activity.category} />
                                    </Card>
                                </Box>
                            )}
                        </SimpleGrid>
                    </Stack>
                </Box>
                {/* <Stack>
                    <Flex justifyContent={'center'}>
                        <RatingBox ratingInfo={props.rating_info} />
                    </Flex>
                    <Box>
                        <Text fontSize='3xl' textAlign={'center'}>
                            Reviews
                        </Text>
                        <Box marginTop='20px'>
                            <EmblaCarousel />
                        </Box>

                    </Box>
                </Stack> */}
            </SimpleGrid>
            <Box height={'500px'}>
            </Box>

            <Modal size={'2xl'} onClose={onClose3} isOpen={isOpen3} isCentered>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>Edit Destination</ModalHeader>
                    <ModalCloseButton />
                    <ModalBody>
                        <AdminEditDestination refresh={refresh} />
                    </ModalBody>
                </ModalContent>
            </Modal>

            <Modal onClose={onClose2} isOpen={isOpen2} isCentered size={'5xl'}>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>
                        Activity Details
                    </ModalHeader>
                    <ModalCloseButton />
                    <ModalBody display={'flex'} justifyContent={'space-between'}>
                        <ActivityDetails t={0} price={activity.price} destination={props.name} destinationId={props.destination_id} />
                    </ModalBody>
                    <Box display={'flex'} alignItems={'center'} justifyContent={'space-between'} margin='12px'>
                        <Box>
                            <Button margin='10px' onClick={onClose2}>Cancel</Button>
                        </Box>
                    </Box>
                </ModalContent>
            </Modal>
            <Modal onClose={onClose} isOpen={isOpen} isCentered>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>Add Destination to Trip</ModalHeader>
                    <ModalCloseButton />
                    <ModalBody display={'flex'} justifyContent={'space-between'}>
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

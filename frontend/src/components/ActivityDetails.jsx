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
    NumberDecrementStepper,
    NumberIncrementStepper,
    NumberInput,
    NumberInputField,
    NumberInputStepper,
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
import { MdCategory } from 'react-icons/md';
import Carousel from './Carousel';

import React, { useEffect, useState } from 'react';
import { BiSolidHourglassBottom, BiSolidHourglassTop } from 'react-icons/bi';
import { FaMapMarkerAlt } from 'react-icons/fa';
import { useParams } from 'react-router-dom';
import { getActivityById, getDestinations } from '../API';
import { addToList, useLocalStorage } from '../LocalStorage';
import CardSlider from './CardSlider';
import { getParam, userIs } from '../Utils';
import AdminEditActivity from './AdminEditActivity'

export default function ActivityDetails({ t, data, price, destination, destinationId }) {
    const [date, setDate] = useState(new Date());
    const { isOpen, onOpen, onClose } = useDisclosure()
    const { isOpen: isOpen2, onOpen: onOpen2, onClose: onClose2 } = useDisclosure()
    const [rating, setRating] = useState(0)
    const [review, setReview] = useState('')
    const [destinations, setDestinations] = useState([])
    const [persons, setPersons] = useState(1)
    const [props, setProps] = useState({})

    const [aid, setaid] = useLocalStorage('aid', '1')

    async function initialize(id) {
        var x;
        if (t !== undefined) x = aid;
        else x = id;
        const p = await getActivityById(x)
        setProps(p)
        const filter = {
            activity_id: p.activity_id
        }
        const d = await getDestinations(filter)
        setDestinations(d)
        console.log(d)
    }

    function okClick() {
        const t = {
            id: props.activity_id,
            name: props.name,
            destination: destination,
            destination_id: destinationId,
            date: date,
            persons: persons,
            cost: persons * price,
        }
        addToList('_activities', t)
        onClose()
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
                                            {
                                                price && <Tr>
                                                    <Td>
                                                        <Flex alignItems='center'>
                                                            <Box><ImPriceTag size={30} /></Box><Box>&emsp;Price Per Person</Box>
                                                        </Flex>
                                                    </Td>
                                                    <Td>
                                                        ৳{price}
                                                    </Td>
                                                </Tr>
                                            }
                                            {
                                                destination && <Tr>
                                                    <Td>
                                                        <Flex alignItems='center'>
                                                            <Box><FaMapMarkerAlt size={30} /></Box><Box>&emsp;Destination</Box>
                                                        </Flex>
                                                    </Td>
                                                    <Td>
                                                        {destination}
                                                    </Td>
                                                </Tr>
                                            }
                                            <Tr>
                                                <Td>
                                                    <Flex alignItems='center'>
                                                        <Box><MdCategory size={30} /></Box><Box>&emsp;Category</Box>
                                                    </Flex>
                                                </Td>
                                                <Td>
                                                    {props.category}
                                                </Td>
                                            </Tr>
                                            <Tr>
                                                <Td>
                                                    <Flex alignItems='center'>
                                                        <Box>
                                                            <BiSolidHourglassBottom size={30} />
                                                        </Box>
                                                        <Box>
                                                            &emsp;Minimum Age
                                                        </Box>
                                                    </Flex>
                                                </Td>
                                                <Td>
                                                    {props.min_age}
                                                </Td>
                                            </Tr>
                                            <Tr>
                                                <Td>
                                                    <Flex alignItems='center'>
                                                        <Box>
                                                            <BiSolidHourglassTop size={30} />
                                                        </Box>
                                                        <Box>
                                                            &emsp;Maximum Age
                                                        </Box>
                                                    </Flex>
                                                </Td>
                                                <Td>
                                                    {props.max_age}
                                                </Td>
                                            </Tr>
                                        </Tbody>
                                    </Table>
                                </TableContainer>
                            </Box>
                            {
                                price && <Button
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
                            }

                        </Stack>
                    </Stack>


                </Stack>

                <Box>
                    <Stack spacing={{ base: 6, md: 10 }}>
                        <Text fontSize={'3xl'}>
                            Destinations
                        </Text>
                        <SimpleGrid columns={{ base: 1, sm: 2, md: 2, lg: 2, xl: 2 }} spacing={'20px'}>
                            {destinations && destinations.map((destination, index) =>
                                <Box key={index}>
                                    <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} position={'relative'}>
                                        <CardSlider href={`/destination/${destination.destination_id}`} imgs={destination.images} title={destination.name} info={destination.category} />
                                    </Card>
                                </Box>
                            )}
                        </SimpleGrid>
                    </Stack>
                </Box>
            </SimpleGrid>
            <Box height={'500px'}>
            </Box>
            <Modal size={'2xl'} onClose={onClose2} isOpen={isOpen2} isCentered>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>Edit Activity</ModalHeader>
                    <ModalCloseButton />
                    <ModalBody>
                        <AdminEditActivity refresh={refresh} />
                    </ModalBody>
                </ModalContent>
            </Modal>
            <Modal onClose={onClose} isOpen={isOpen} isCentered>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>Add Activity to Trip</ModalHeader>
                    <ModalCloseButton />
                    <ModalBody>
                        <Stack>
                            <Stack direction={'row'} alignItems={'center'}>
                                <Box>
                                    <Text fontSize='xl'>Date</Text>
                                </Box>
                                <Box>
                                    <DatePicker selected={date} onChange={(date) => setDate(date)} />
                                </Box>
                            </Stack>
                            <Stack direction={'row'} alignItems={'center'}>
                                <Box>
                                    <Text fontSize='xl'>Persons</Text>
                                </Box>
                                <Box>
                                    <NumberInput maxW={100} defaultValue={1} min={1} value={persons} onChange={(v) => setPersons(v)}>
                                        <NumberInputField />
                                        <NumberInputStepper>
                                            <NumberIncrementStepper />
                                            <NumberDecrementStepper />
                                        </NumberInputStepper>
                                    </NumberInput>
                                </Box>
                            </Stack>
                        </Stack>
                    </ModalBody>
                    <Box display={'flex'} alignItems={'center'} justifyContent={'space-between'} margin='12px'>
                        <Box>
                            <Button margin='10px' colorScheme='blue' onClick={okClick}>OK</Button>
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

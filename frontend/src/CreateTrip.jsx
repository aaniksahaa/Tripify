import { Box, Button, Container, Flex, FormControl, GridItem, Input, Modal, ModalBody, ModalCloseButton, ModalContent, ModalFooter, ModalHeader, ModalOverlay, SimpleGrid, Step, StepDescription, StepIcon, StepIndicator, StepNumber, StepSeparator, StepStatus, StepTitle, Stepper, Text, useDisclosure, useSteps } from '@chakra-ui/react'
import React, { useEffect, useState } from 'react'
import HotelDetails from './components/HotelDetails'
import { getCities, getHotels } from "./API"
import Navbar2 from "./components/Navbar2"
import { Select } from 'chakra-react-select'
import Hotels from './Hotels'
import HotelCard from './components/HotelCard'
import { Link } from 'react-router-dom'

function VerticallyCenter() {
    const { isOpen, onOpen, onClose } = useDisclosure()
    const [hotels, setHotels] = useState([])
    async function load() {
        const tmp = await getHotels({})
        setHotels(tmp)
    }
    useEffect(() => {
        load()
    }, [])
    return (
        <>
            <Button onClick={onOpen}>Trigger modal</Button>
            <Modal onClose={onClose} isOpen={isOpen} size={'full'}>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>Modal Title</ModalHeader>
                    <ModalCloseButton />
                    <ModalBody>
                        {
                            hotels && <HotelDetails props={hotels[0]} />
                        }
                    </ModalBody>
                    <ModalFooter>
                        <Button onClick={onClose}>Close</Button>
                    </ModalFooter>
                </ModalContent>
            </Modal>
        </>
    )
}
function CreateTrip() {
    const [cities, setCities] = useState([])
    const [hotels, setHotels] = useState([])
    const [destinations, setDestinations] = useState([])
    const [activities, setActivities] = useState([])
    const [restaurants, setRestaurants] = useState([])

    const [at, setAt] = useState(3)
    const [city, setCity] = useState('')

    async function load() {
        const c = await getCities({})
        setCities(c)
        const h = await getHotels({})
        setHotels(h)
    }
    useEffect(() => {
        load()
    }, [])
    return (
        <div>
            <Navbar2 />
            <Text marginTop='20px' fontSize={'3xl'} textAlign={'center'}>
                Create a Trip !
            </Text>
            <Box backgroundColor={'red'}>
                <Stepper index={at} orientation='vertical' gap='0px' margin={'10px'}>
                    <Step key={0}>
                        <StepIndicator>
                            <StepStatus
                                complete={<StepIcon />}
                                incomplete={<StepNumber />}
                                active={<StepNumber />}
                            />
                        </StepIndicator>
                        <Box flexShrink={'0'}>
                            <StepTitle>Select a City</StepTitle>
                            <StepDescription>The city you wanna go to</StepDescription>
                            <Box margin={'50px 0 50px 0'}>
                                <Select
                                    options={cities}
                                    className="basic-multi-select"
                                    classNamePrefix="select"
                                />
                            </Box>
                        </Box>
                        <StepSeparator />
                    </Step>
                    <Step key={1}>
                        <StepIndicator>
                            <StepStatus
                                complete={<StepIcon />}
                                incomplete={<StepNumber />}
                                active={<StepNumber />}
                            />
                        </StepIndicator>

                        <Box flexShrink={'0'}>
                            <StepTitle>Select Hotels</StepTitle>
                            <StepDescription>Hotels you would like to stay</StepDescription>
                            <Box width={'80vw'} backgroundColor={'blue'}>
                                <SimpleGrid columns={{ base: 1, sm: 1, md: 1, lg: 2, xl: 3 }} style={{ width: '100%' }} spacing={10} p='30px'>
                                    {
                                        hotels.map((item, index) => (
                                            <Link key={index} to={`/hotel/${item.hotel_id}`}>
                                                <HotelCard key={index} props={item} price={item.price_per_day} />
                                            </Link>
                                        ))
                                    }
                                </SimpleGrid>
                            </Box>
                        </Box>

                        <StepSeparator />
                    </Step>
                </Stepper>
            </Box>
        </div>
    )
}

export default CreateTrip
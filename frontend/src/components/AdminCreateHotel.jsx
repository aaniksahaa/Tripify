import { Accordion, AccordionButton, AccordionIcon, AccordionItem, AccordionPanel, Avatar, Box, Button, Checkbox, CheckboxGroup, Container, FormControl, FormLabel, Input, Progress, Stack, Table, Tbody, Td, Text, Textarea, Th, Tr, VStack, useToast } from '@chakra-ui/react'
import React, { useEffect, useRef, useState } from 'react'
import { deleteX, getCities, postX, updateHotel, updateUser } from '../API'
import { Navigate } from 'react-router-dom';
import { Select } from 'chakra-react-select'
import ImageUploader from './ImageUploader';

function AdminCreateHotel() {

    function setImageURL(x) {
        setData({
            ...data,
            images: [x]
        })
    }
    const blank_hotel = {
        "name": "",
        "address": "",
        "city_id": "",
        "description": "",
        "price_per_day": "",
        "phone": "",
        "email": "",
        "has_wifi": 0,
        "has_parking": 0,
        "has_gym": 0
    }

    const [cities, setCities] = useState([
        {
            "label": "Dhaka",
            "value": 1
        }])

    const [created, setCreated] = useState(0)

    const toast = useToast()
    function showToast(title, description) {
        toast({
            title: title,
            description: description,
            isClosable: 'true',
            duration: 3000,
            position: 'top-right',
            colorScheme: 'whatsapp'
        });
    }

    const [data, setData] = useState(blank_hotel)

    async function initialize() {
        const _cities = await getCities({})
        setCities(_cities)
    }

    useEffect(() => {
        initialize()
    }, [])

    function handleChange(e) {
        setData({
            ...data,
            [e.target.name]: e.target.value
        })
    }

    const handleCheckboxChange = (facility) => {
        setData({
            ...data,
            [facility]: data[facility] ? 0 : 1, // Toggle between 0 and 1
        });
    };

    async function create() {
        var x = data
        await postX('hotel', {}, data)
        console.log(x)
        showToast('Successfully Created', 'Hotel is created and changes stored permanently')
        setCreated(1)
        setData(blank_hotel)
        setTimeout(() => {
            window.location = '/hotels'
        }, 1000)
    }

    if (created == 1) {
        //return <Navigate to="/hotels" />;
    }

    if (cities.length == 0) {
        return (<Text>Loading</Text>);
    }

    console.log('\n\n\nCities = \n\n\n', cities)

    return (
        <Box>
            <br></br>
            <VStack>
                <VStack>
                    <Table size='md' variant={'unstyled'}>
                        <Tbody>
                            <Tr><Th>Name</Th><Td><Input name='name' variant={'outline'} borderWidth={'2px'} value={data.name} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Address</Th><Td><Input type='name' name='address' variant={'outline'} borderWidth={'2px'} value={data.address} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Description</Th><Td><Textarea name='description' variant={'outline'} borderWidth={'2px'} value={data.description} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Price Per Day</Th><Td><Input name='price_per_day' variant={'outline'} borderWidth={'2px'} value={data.price_per_day} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Phone</Th><Td><Input type='number' name='phone' variant={'outline'} borderWidth={'2px'} value={data.phone} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Email</Th><Td><Input type='email' name='email' variant={'outline'} borderWidth={'2px'} value={data.email} onChange={handleChange} /></Td></Tr>
                        </Tbody>
                    </Table>
                    <Box fontSize={'xl'}>
                        <Stack direction="row" align="center" spacing={20}>
                            <Text>Facilities:</Text>
                            <CheckboxGroup colorScheme="teal">
                                <Stack direction="row">
                                    <Checkbox key='has_wifi' isChecked={data.has_wifi === 1} onChange={() => handleCheckboxChange('has_wifi')}>
                                        Wifi
                                    </Checkbox>
                                    <Checkbox key='has_parking' isChecked={data.has_parking === 1} onChange={() => handleCheckboxChange('has_parking')}>
                                        Parking
                                    </Checkbox>
                                    <Checkbox key='has_gym' isChecked={data.has_gym === 1} onChange={() => handleCheckboxChange('has_gym')}>
                                        Gym
                                    </Checkbox>
                                </Stack>
                            </CheckboxGroup>
                        </Stack>
                        <br></br>
                        <FormControl>
                            <FormLabel>City Name</FormLabel>
                            <Select
                                placeholder="Select a city"
                                options={cities}
                                onChange={(v) => {
                                    var obj = { ...data }
                                    obj['city_id'] = v.value
                                    setData(obj)
                                }}

                                useBasicStyles
                            />
                        </FormControl>
                    </Box>
                    <br></br>
                    <br></br>
                    <ImageUploader setURL={setImageURL} />
                    <br />
                    <br />
                    <Button colorScheme='blue' onClick={create}>Create Hotel</Button>
                </VStack>
            </VStack>
            <br></br>
        </Box>
    )
}

export default AdminCreateHotel
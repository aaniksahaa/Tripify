import { Accordion, AccordionButton, AccordionIcon, AccordionItem, AccordionPanel, Avatar, Box, Button, Checkbox, CheckboxGroup, Container, FormControl, FormLabel, Input, Progress, Stack, Table, Tbody, Td, Text, Textarea, Th, Tr, VStack, useToast } from '@chakra-ui/react'
import React, { useEffect, useRef, useState } from 'react'
import { deleteX, getCities, postX, updateRestaurant, updateUser } from '../API'
import { Navigate } from 'react-router-dom';
import { Select } from 'chakra-react-select'
import ImageUploader from './ImageUploader';

function AdminCreateRestaurant() {

    function setImageURL(x) {
        setData({
            ...data,
            images: [x]
        })
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

    const [data, setData] = useState({
        "name": "",
        "address": "",
        "city_id": "",
        "description": "",
        "reservation_price": "",
        "contact": "",
        "email": ""
    })

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

    async function create() {
        var x = data
        await postX('restaurant', {}, data)
        console.log(x)
        showToast('Successfully Created', 'Restaurant is created and changes stored permanently')
        setCreated(1)
        setTimeout(() => window.location = '/restaurants', 1000);
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
                            <Tr><Th>Reservation Price</Th><Td><Input name='reservation_price' variant={'outline'} borderWidth={'2px'} value={data.reservation_price} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Contact</Th><Td><Input type='number' name='contact' variant={'outline'} borderWidth={'2px'} value={data.contact} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Email</Th><Td><Input type='email' name='email' variant={'outline'} borderWidth={'2px'} value={data.email} onChange={handleChange} /></Td></Tr>
                        </Tbody>
                    </Table>
                    <Box fontSize={'xl'}>
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
                    <Button colorScheme='blue' onClick={create}>Create Restaurant</Button>
                </VStack>
            </VStack>
            <br></br>
        </Box>
    )
}

export default AdminCreateRestaurant
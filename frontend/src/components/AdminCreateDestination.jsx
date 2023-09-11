import { Accordion, AccordionButton, AccordionIcon, AccordionItem, AccordionPanel, Avatar, Box, Button, Checkbox, CheckboxGroup, Container, FormControl, FormLabel, Input, Progress, Stack, Table, Tbody, Td, Text, Textarea, Th, Tr, VStack, useToast } from '@chakra-ui/react'
import React, { useEffect, useRef, useState } from 'react'
import { deleteX, getCities, postX, updateDestination, updateUser } from '../API'
import { Navigate } from 'react-router-dom';
import { Select } from 'chakra-react-select'
import ImageUploader from './ImageUploader';

function AdminCreateDestination() {

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
        "latitude": "",
        "longitude": ""
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
        await postX('destination', {}, data)
        console.log(x)
        showToast('Successfully Created', 'Destination is created and changes stored permanently')
        // setCreated(1)
        setTimeout(() => window.location = '/destinations', 1000)
    }

    if (created == 1) {
        return <Navigate to="/destinations" />;
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
                            <Tr><Th>Latitude</Th><Td><Input type='number' name='latitude' variant={'outline'} borderWidth={'2px'} value={data.latitude} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Longitude</Th><Td><Input type='number' name='longitude' variant={'outline'} borderWidth={'2px'} value={data.longitude} onChange={handleChange} /></Td></Tr>
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
                    <Button colorScheme='blue' onClick={create}>Create Destination</Button>
                </VStack>
            </VStack>
            <br></br>
        </Box>
    )
}

export default AdminCreateDestination
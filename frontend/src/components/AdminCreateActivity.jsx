import { Accordion, AccordionButton, AccordionIcon, AccordionItem, AccordionPanel, Avatar, Box, Button, Checkbox, CheckboxGroup, Container, FormControl, FormLabel, Input, Progress, Stack, Table, Tbody, Td, Text, Textarea, Th, Tr, VStack, useToast } from '@chakra-ui/react'
import React, { useEffect, useRef, useState } from 'react'
import { deleteX, getCities, postX, updateActivity, updateUser } from '../API'
import { Navigate } from 'react-router-dom';
import { Select } from 'chakra-react-select'
import ImageUploader from './ImageUploader';

function AdminCreateActivity() {

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
        "category": "",
        "description": "",
        "min_age": "",
        "max_age": ""
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
        // alert(JSON.stringify(x))
        await postX('activity', {}, data)
        console.log(x)
        showToast('Successfully Created', 'Activity is created and changes stored permanently')
        // setCreated(1)
        setTimeout(() => window.location = '/activities', 1000)
    }

    if (created == 1) {
        return <Navigate to="/activities" />;
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
                            <Tr><Th>Category</Th><Td><Input type='name' name='category' variant={'outline'} borderWidth={'2px'} value={data.category} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Description</Th><Td><Textarea name='description' variant={'outline'} borderWidth={'2px'} value={data.description} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Min Age</Th><Td><Input type='number' name='min_age' variant={'outline'} borderWidth={'2px'} value={data.min_age} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Max Age</Th><Td><Input type='number' name='max_age' variant={'outline'} borderWidth={'2px'} value={data.max_age} onChange={handleChange} /></Td></Tr>
                        </Tbody>
                    </Table>
                    <Box fontSize={'xl'}>
                        <br></br>
                    </Box>
                    <br></br>
                    <br></br>
                    <ImageUploader setURL={setImageURL} />
                    <br />
                    <br />
                    <Button colorScheme='blue' onClick={create}>Create Activity</Button>
                </VStack>
            </VStack>
            <br></br>
        </Box>
    )
}

export default AdminCreateActivity
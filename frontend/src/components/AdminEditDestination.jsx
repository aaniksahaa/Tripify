import { Accordion, AccordionButton, AccordionIcon, AccordionItem, AccordionPanel, Avatar, Box, Button, Checkbox, CheckboxGroup, Container, Input, Progress, Stack, Table, Tbody, Td, Text, Textarea, Th, Tr, VStack, useToast } from '@chakra-ui/react'
import React, { useEffect, useRef, useState } from 'react'
import { deleteX, getDestination, updateDestination, updateUser } from '../API'
import { Navigate } from 'react-router-dom';
import { getParam } from '../Utils';

function AdminEditDestination({ refresh }) {

    const [deleted, setDeleted] = useState(0)

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

    const [data, setData] = useState({})

    async function initialize(id) {
        const d = await getDestination(id)
        setData(d)
    }
    useEffect(() => {
        const id = getParam()
        setTimeout(() => initialize(id), 500);
    }, [])

    function handleChange(e) {
        setData({
            ...data,
            [e.target.name]: e.target.value
        })
    }

    async function save() {
        var x = data
        await updateDestination(x)
        console.log(x)
        console.log('calling parent')
        console.log('okay parent')
        showToast('Successfully Updated', 'Destination is updated and changes stored permanently')
        await refresh()
    }
    async function del() {
        await deleteX(`destination/${data.destination_id}`)
        showToast('Successfully Deleted', 'Destination is deleted and changes stored permanently')
        setDeleted(1);
    }

    if (deleted == 1) {
        return <Navigate to="/destinations" />;
    }

    return (
        <Box>
            <Accordion defaultIndex={[0, 1]} allowMultiple>
                <AccordionItem>
                    <AccordionButton>
                        <Box as="span" flex='1' textAlign='center'>
                            <Text fontSize={'xl'} fontWeight={'500'}>Update Destination</Text>
                        </Box>
                        <AccordionIcon />
                    </AccordionButton>
                    <AccordionPanel pb={4}>
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
                                <br></br>
                                <Button colorScheme='blue' onClick={save}>Update Destination</Button>
                            </VStack>
                        </VStack>
                    </AccordionPanel>
                </AccordionItem>
                <AccordionItem>
                    <AccordionButton>
                        <Box as="span" flex='1' textAlign='center'>
                            <Text fontSize={'xl'} fontWeight={'500'}>Delete Destination</Text>
                        </Box>
                        <AccordionIcon />
                    </AccordionButton>
                    <AccordionPanel>
                        <Stack align={'center'}>
                            <Button colorScheme='red' onClick={del}>Delete Destination</Button>
                        </Stack>
                    </AccordionPanel>
                </AccordionItem>
            </Accordion>
        </Box>
    )
}

export default AdminEditDestination
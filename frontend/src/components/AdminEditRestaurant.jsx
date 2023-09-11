import { Accordion, AccordionButton, AccordionIcon, AccordionItem, AccordionPanel, Avatar, Box, Button, Checkbox, CheckboxGroup, Container, Input, Progress, Stack, Table, Tbody, Td, Text, Textarea, Th, Tr, VStack, useToast } from '@chakra-ui/react'
import React, { useEffect, useRef, useState } from 'react'
import { deleteX, getRestaurant, updateRestaurant, updateUser } from '../API'
import { Navigate } from 'react-router-dom';
import { getParam } from '../Utils';

function AdminEditRestaurant({ refresh }) {

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
        const t = await getRestaurant(id)
        setData(t)
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
        await updateRestaurant(x)
        console.log(x)
        showToast('Successfully Updated', 'Restaurant is updated and changes stored permanently')
        showToast('Users Notified', 'Relevant users have been notified')
        await refresh()
    }
    async function del() {
        await deleteX(`restaurant/${data.restaurant_id}`)
        showToast('Successfully Deleted', 'Restaurant is deleted and changes stored permanently')
        showToast('Users Notified', 'Relevant users have been notified')
        setDeleted(1);
    }

    if (deleted == 1) {
        return <Navigate to="/restaurants" />;
    }

    return (
        <Box>
            <Accordion defaultIndex={[0, 1]} allowMultiple>
                <AccordionItem>
                    <AccordionButton>
                        <Box as="span" flex='1' textAlign='center'>
                            <Text fontSize={'xl'} fontWeight={'500'}>Update Restaurant</Text>
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
                                        <Tr><Th>Reservation Price</Th><Td><Input name='reservation_price' variant={'outline'} borderWidth={'2px'} value={data.reservation_price} onChange={handleChange} /></Td></Tr>
                                        <Tr><Th>Contact</Th><Td><Input type='number' name='contact' variant={'outline'} borderWidth={'2px'} value={data.contact} onChange={handleChange} /></Td></Tr>
                                        <Tr><Th>Email</Th><Td><Input type='email' name='email' variant={'outline'} borderWidth={'2px'} value={data.email} onChange={handleChange} /></Td></Tr>
                                    </Tbody>
                                </Table>
                                <br></br>
                                <Button colorScheme='blue' onClick={save}>Update Restaurant</Button>
                            </VStack>
                        </VStack>
                    </AccordionPanel>
                </AccordionItem>
                <AccordionItem>
                    <AccordionButton>
                        <Box as="span" flex='1' textAlign='center'>
                            <Text fontSize={'xl'} fontWeight={'500'}>Delete Restaurant</Text>
                        </Box>
                        <AccordionIcon />
                    </AccordionButton>
                    <AccordionPanel>
                        <Stack align={'center'}>
                            <Button colorScheme='red' onClick={del}>Delete Restaurant</Button>
                        </Stack>
                    </AccordionPanel>
                </AccordionItem>
            </Accordion>
        </Box>
    )
}

export default AdminEditRestaurant
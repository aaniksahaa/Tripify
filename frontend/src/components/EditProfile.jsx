import { Avatar, Box, Button, Center, Container, Flex, GridItem, Input, Modal, ModalBody, ModalCloseButton, ModalContent, ModalFooter, ModalHeader, ModalOverlay, SimpleGrid, Stack, Tab, TabList, TabPanel, TabPanels, Table, Tabs, Tbody, Td, Text, Textarea, Th, Tr, VStack, useDisclosure } from '@chakra-ui/react'
import React from 'react'
import Navbar2 from './Navbar2'
import { useParams } from 'react-router-dom'
import Posts from './Posts'
import PostCard from './PostCard'
import { useState } from 'react'

function EditProfile() {
    const { id } = useParams()
    const [data, setData] = useState({
        name: '',
        email: '',
        bio: '',
        facebook: '',
        twitter: '',
        instagram: '',
        propic: '',
        city: 1
    })
    function handleChange(e) {
        setData({
            ...data,
            [e.target.name]: e.target.value
        })
    }
    return (
        <Box>
            <Navbar2 />
            <Container maxW='7xl'>
                <VStack>
                    <VStack spacing={'20px'} height={'300px'} alignItems={'center'} justifyContent={'center'}>
                        <Avatar height={'200px'} width={'200px'} name='Dan Abrahmov' src='https://bit.ly/dan-abramov' />
                        <Button size={'sm'}>Change Profile Picture</Button>
                    </VStack>
                    <VStack spacing={'20px'}>
                        <Table size='sm' variant={'unstyled'}>
                            <Tbody>
                                <Tr><Th>Name</Th><Td><Input name='name' variant={'outline'} borderWidth={'2px'} value={data.name} onChange={handleChange} /></Td></Tr>
                                <Tr><Th>Email</Th><Td><Input type='email' name='email' variant={'outline'} borderWidth={'2px'} value={data.email} onChange={handleChange} /></Td></Tr>
                                <Tr><Th>Bio</Th><Td><Textarea name='bio' variant={'outline'} borderWidth={'2px'} value={data.bio} onChange={handleChange} /></Td></Tr>
                                <Tr><Th>Facebook</Th><Td><Input type='url' name='facebook' variant={'outline'} borderWidth={'2px'} value={data.facebook} onChange={handleChange} /></Td></Tr>
                                <Tr><Th>Twitter</Th><Td><Input type='url' name='twitter' variant={'outline'} borderWidth={'2px'} value={data.twitter} onChange={handleChange} /></Td></Tr>
                                <Tr><Th>Instagram</Th><Td><Input type='url' name='instagram' variant={'outline'} borderWidth={'2px'} value={data.instagram} onChange={handleChange} /></Td></Tr>
                            </Tbody>
                        </Table>
                        <Button colorScheme='blue'>Save</Button>
                    </VStack>
                </VStack>
            </Container>
        </Box>
    )
}

export default EditProfile
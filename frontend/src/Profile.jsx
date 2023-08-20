import { Avatar, Box, Button, Center, Container, Flex, GridItem, Modal, ModalBody, ModalCloseButton, ModalContent, ModalFooter, ModalHeader, ModalOverlay, SimpleGrid, Stack, Tab, TabList, TabPanel, TabPanels, Tabs, Text, Textarea, VStack, useDisclosure } from '@chakra-ui/react'
import React from 'react'
import Navbar2 from './components/Navbar2'
import { useParams } from 'react-router-dom'
import Posts from './components/Posts'
import PostCard from './components/PostCard'
import { useState } from 'react'

function Profile() {
    const { id } = useParams()
    const [followed, setFollowed] = useState(false)
    const { isOpen, onOpen, onClose } = useDisclosure()

    return (
        <Box >
            <Navbar2 />
            <Container maxW='5xl'>
                <Center mt='20px'>
                    <Box display={{ base: 'block', sm: 'block', md: 'flex', lg: 'flex', xl: 'flex' }} alignItems={'center'}>
                        <Flex height={'300px'} alignItems={'center'} justifyContent={'center'}>
                            <Avatar height={'200px'} width={'200px'} name='Dan Abrahmov' src='https://bit.ly/dan-abramov' />
                        </Flex>
                        <Stack pl={'50px'} pr={'50px'} minWidth={'400px'} maxWidth={'500px'} spacing={'20px'}>
                            <Flex alignItems={'center'} justifyContent={'space-between'}>
                                <Text fontSize={'3xl'}>user_name</Text>
                                <Button colorScheme={followed ? 'red' : 'blue'} onClick={() => setFollowed(x => !x)}>{followed ? 'Unfollow' : 'Follow'}</Button>
                            </Flex>
                            <Flex fontWeight='600' fontSize='md' alignItems={'center'} justifyContent={'space-between'} maxWidth={'350px'}>
                                <Text>109 posts</Text>
                                <Text>1,325 followers</Text>
                                <Text>917 following</Text>
                            </Flex>
                            <Flex fontSize={'md'}>
                                There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...
                            </Flex>
                            <Box>
                                <Button onClick={onOpen} size={'sm'}>Write a Post</Button>
                            </Box>
                        </Stack>
                    </Box>
                </Center>
                <br />
                <Tabs >
                    <TabList alignItems={'center'} justifyItems={'center'} justifyContent={'center'}>
                        <Tab>Posts</Tab>
                        <Tab>Reviews</Tab>
                        <Tab>Trips</Tab>
                    </TabList>
                    <TabPanels>
                        <TabPanel padding={0} pt='20px'>
                            <Posts />
                        </TabPanel>
                        <TabPanel >
                            <PostCard />
                        </TabPanel>
                    </TabPanels>
                </Tabs>
            </Container>
            <Modal size={'xl'} onClose={onClose} isOpen={isOpen} isCentered>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>Write a Post</ModalHeader>
                    <ModalCloseButton />
                    <ModalBody>
                        <Textarea rows={'10'} />
                    </ModalBody>
                    <ModalFooter justifyContent={'space-between'}>
                        <Button onClick={onClose}>Cancel</Button>
                        <Button colorScheme={'blue'} onClick={onClose}>Post</Button>
                    </ModalFooter>
                </ModalContent>
            </Modal>
        </Box>
    )
}

export default Profile
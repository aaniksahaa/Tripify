import { Avatar, Box, Button, Center, Container, Flex, Modal, ModalBody, ModalCloseButton, ModalContent, ModalFooter, ModalHeader, ModalOverlay, Stack, Tab, TabList, TabPanel, TabPanels, Tabs, Text, Textarea, useDisclosure } from '@chakra-ui/react'
import React, { useEffect, useRef, useState } from 'react'
import { useParams } from 'react-router-dom'
import { follow, getUserProfile, isFollowing, writePost } from './API'
import { useLocalStorage } from './LocalStorage'
import Navbar2 from './components/Navbar2'
import Posts from './components/Posts'

function Profile() {
    const [followed, setFollowed] = useState(false)
    const { isOpen, onOpen, onClose } = useDisclosure()
    const [profile, setProfile] = useState({
        posts_created: []
    })
    const [user, setUser] = useLocalStorage('tripify_user', {})
    const { id } = useParams()
    const postRef = useRef()

    const [filter, setFilter] = useState({
        page: 1,
        per_page: 10
    })

    // async function searchClick() {
    //     var f = filter
    //     f['page'] = 1
    //     await load(f)
    //     setFilter(f)
    // }
    async function followClick() {
        await follow(user.user_id, id)
        setFollowed(x => !x)
    }
    async function load(t) {
        const _profile = await getUserProfile(id ? id : user.user_id, t)
        setProfile(_profile)
    }
    async function initialize() {
        alert(1)
        load(filter)
        if (id !== undefined) {
            const f = await isFollowing(user.user_id, id)
            if (f.is_following) {
                setFollowed(true)
            }
            else {
                setFollowed(false)
            }
        }
    }
    useEffect(() => {
        initialize()
    }, [id])

    function nextPage() {
        var f = filter
        f['page'] = Math.min(1000, f['page'] + 1)
        setFilter(f)
        load(f)
    }
    function prevPage() {
        var f = filter
        f['page'] = Math.max(1, f['page'] - 1)
        setFilter(f)
        load(f)
    }

    async function postClick() {
        const postData =
        {
            "description": postRef.current.value,
            "image_url": "amazing.jpg",
            "images": ["a.jpg", "b.jpg"]
        }
        const response = await writePost(postData)
        await initialize()
        onClose()
    }
    return (
        <Box >
            <Navbar2 />
            <Container maxW='5xl'>
                <Center mt='20px'>
                    <Box display={{ base: 'block', sm: 'block', md: 'flex', lg: 'flex', xl: 'flex' }} alignItems={'center'}>
                        <Flex height={'300px'} alignItems={'center'} justifyContent={'center'}>
                            <Avatar height={'200px'} width={'200px'} name={user.name} src={profile.profile_picture} />
                        </Flex>
                        <Stack pl={'50px'} pr={'50px'} minWidth={'400px'} maxWidth={'500px'} spacing={'20px'}>
                            <Flex alignItems={'center'} justifyContent={'space-between'}>
                                <Text fontSize={'3xl'}>{profile ? profile.username : ''}</Text>
                                {
                                    id != user.user_id ?
                                        <Button colorScheme={followed ? 'red' : 'blue'} onClick={followClick}>{
                                            followed ? 'Unfollow' : 'Follow'
                                        }</Button> : <></>
                                }
                            </Flex>
                            <Flex fontWeight='600' fontSize='md' alignItems={'center'} justifyContent={'space-between'} maxWidth={'350px'}>
                                <Text>{profile.posts_created.length} posts</Text>
                                <Text>{profile.follower_count} followers</Text>
                                <Text>{profile.followee_count} following</Text>
                            </Flex>
                            <Flex fontSize={'md'}>
                                {
                                    profile.bio
                                }
                            </Flex>
                            {
                                id == user.user_id
                                &&
                                <Box>
                                    <Button onClick={onOpen} size={'sm'}>Write a Post</Button>
                                    <Button onClick={initialize} size={'sm'}>Refresh</Button>
                                </Box>
                            }
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
                            <Posts profile={profile} refesh={initialize} />
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
                        <Textarea rows={'10'} ref={postRef} />
                        <Box mt='10px'>
                            <input type='file' />
                        </Box>
                    </ModalBody>
                    <ModalFooter justifyContent={'space-between'}>
                        <Button onClick={onClose}>Cancel</Button>
                        <Button colorScheme={'blue'} onClick={postClick}>Post</Button>
                    </ModalFooter>
                </ModalContent>
            </Modal>
        </Box >
    )
}

export default Profile
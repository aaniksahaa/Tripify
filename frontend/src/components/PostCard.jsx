import { Avatar, Box, Button, Card, CardBody, CardFooter, CardHeader, Flex, Heading, IconButton, Image, Menu, MenuButton, MenuItem, MenuList, Modal, ModalBody, ModalCloseButton, ModalContent, ModalFooter, ModalHeader, ModalOverlay, Stack, Text, Textarea, useDisclosure } from '@chakra-ui/react'
import React, { useEffect, useRef } from 'react'
import { BiChat, BiLike, BiShare, BiSolidLike } from 'react-icons/bi'
import { BsThreeDotsVertical } from 'react-icons/bs'
import { Link } from 'react-router-dom'
import { useState } from 'react'
import Comments from './Comments'
import { likePost, removeLike, writeComment } from '../API'
import { useLocalStorage } from '../LocalStorage'

function PostCard({ id, card, name, p, userId, postId }) {
    const [liked, setLiked] = useState(false)
    const { isOpen, onOpen, onClose } = useDisclosure()
    const { isOpen: isOpen2, onOpen: onOpen2, onClose: onClose2 } = useDisclosure()
    const [likesCount, setLikesCount] = useState(0)
    const [commentsCount, setCommentsCount] = useState(0)

    const commentRef = useRef()

    const [post, setPost] = useState({
        post_id: 1,
        reacts: [],
        comments: [],
    })
    const [user, setUser] = useLocalStorage('tripify_user', {})

    useEffect(() => {
        if (p) {
            p.reacts.forEach(x => { if (x.user_id === user.user_id) setLiked(true) })
            setLikesCount(p.reacts.length)
            setCommentsCount(p.comments.length)
        }
        console.log(p);
        setPost(p)
    }, [])
    async function likeClick() {
        if (liked) {
            await removeLike(post.post_id)
            setLiked(false)
            setLikesCount(x => x - 1)
        }
        else {
            await likePost(post.post_id)
            setLiked(true)
            setLikesCount(x => x + 1)
        }
    }
    async function commentClick() {
        const data = {
            post_id: post.post_id,
            text: commentRef.current.value
        }
        await writeComment(data)
        setCommentsCount(x => x + 1)
    }
    return (
        <Box>
            <Card>
                <CardHeader>
                    <Flex spacing='4'>
                        <Flex flex='1' gap='4' alignItems='center' flexWrap='wrap'>
                            <Link to={`/profile/${userId}`}>
                                <Avatar name={name} src='/profile.jpg' />
                            </Link>
                            <Box>
                                <Link to='/profile/1'>
                                    <Heading size='sm'>{name}</Heading>
                                </Link>
                                <Text>{new Date().toLocaleString()}</Text>
                            </Box>
                        </Flex>
                        <Menu>
                            <MenuButton>
                                <IconButton
                                    variant='ghost'
                                    colorScheme='gray'
                                    aria-label='See menu'
                                    icon={<BsThreeDotsVertical />}
                                />
                            </MenuButton>
                            <MenuList>
                                <MenuItem>Edit</MenuItem>
                                <MenuItem>Delete</MenuItem>
                            </MenuList>
                        </Menu>
                    </Flex>
                </CardHeader>
                {/* <Link to='/post/1'> */}
                <CardBody onClick={onOpen2} _hover={{ pointer: 'cursor' }}>
                    {
                        card ?
                            <Text overflow={'hidden'} style={{ display: '-webkit-box', WebkitLineClamp: '3', lineClamp: '3', WebkitBoxOrient: 'vertical' }}>
                                {post && post.description}
                            </Text>
                            :
                            <Text>
                                {post && post.description}
                            </Text>
                    }
                </CardBody>
                {
                    (card === false || card === undefined) &&
                    <Image
                        onClick={onOpen2}
                        _hover={{ cursor: 'pointer' }}
                        objectFit='cover'
                        src='https://images.unsplash.com/photo-1531403009284-440f080d1e12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'
                        alt='Chakra UI'
                    />
                }
                {/* </Link> */}
                <CardFooter justify='space-between'>
                    <Button onClick={likeClick} flex='1' variant={liked ? 'solid' : 'ghost'} leftIcon={
                        liked ? <BiSolidLike size={30} /> : <BiLike size={30} />
                    }>
                        {likesCount}
                    </Button>
                    <Button onClick={onOpen} flex='1' variant='ghost' leftIcon={<BiChat size={30} />}>
                        {commentsCount}
                    </Button>
                    <Button flex='1' variant='ghost' leftIcon={<BiShare size={30} />}>

                    </Button>
                </CardFooter>
            </Card>
            <Modal size={'xl'} onClose={onClose} isOpen={isOpen} isCentered>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>Write a Comment</ModalHeader>
                    <ModalCloseButton />
                    <ModalBody>
                        <Textarea ref={commentRef} rows={'5'} />
                    </ModalBody>
                    <ModalFooter justifyContent={'space-between'}>
                        <Button onClick={onClose}>Cancel</Button>
                        <Button colorScheme={'blue'} onClick={commentClick}>Post</Button>
                    </ModalFooter>
                </ModalContent>
            </Modal>
            <Modal size={'6xl'} onClose={onClose2} isOpen={isOpen2} isCentered>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader></ModalHeader>
                    <ModalCloseButton />
                    <ModalBody>
                        <Card mt='10px'>
                            <CardHeader>
                                <Flex spacing='4'>
                                    <Flex flex='1' gap='4' alignItems='center' flexWrap='wrap'>
                                        <Link to={'/profile/' + userId}>
                                            <Avatar name={name} src='/profile.jpg' />
                                        </Link>
                                        <Box>
                                            <Link to='/profile/1'>
                                                <Heading size='sm'>{name}</Heading>
                                            </Link>
                                            <Text>{new Date().toLocaleString()}</Text>
                                        </Box>
                                    </Flex>
                                    <IconButton
                                        variant='ghost'
                                        colorScheme='gray'
                                        aria-label='See menu'
                                        icon={<BsThreeDotsVertical />}
                                    />
                                </Flex>
                            </CardHeader>
                            <CardBody>
                                <Text>
                                    {post && post.description}
                                </Text>
                            </CardBody>
                            <Image
                                objectFit='cover'
                                src='https://images.unsplash.com/photo-1531403009284-440f080d1e12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'
                                alt='Chakra UI'
                            />

                            <CardFooter justify='space-between'>
                                <Button onClick={likeClick} flex='1' variant={liked ? 'solid' : 'ghost'} leftIcon={
                                    liked ? <BiSolidLike size={30} /> : <BiLike size={30} />
                                }>
                                    {likesCount}
                                </Button>
                                <Button onClick={onOpen} flex='1' variant='ghost' leftIcon={<BiChat size={30} />}>
                                    {commentsCount}
                                </Button>
                                <Button flex='1' variant='ghost' leftIcon={<BiShare size={30} />}>

                                </Button>
                            </CardFooter>
                        </Card>
                        <Box mt='10px'>
                            <Comments postId={postId} />
                        </Box>
                    </ModalBody>
                    <ModalFooter justifyContent={'right'}>
                        <Button onClick={onClose2}>Close</Button>
                    </ModalFooter>
                </ModalContent>
            </Modal>
        </Box>
    )
}

export default PostCard
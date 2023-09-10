import { Avatar, Box, Button, Card, CardBody, CardFooter, CardHeader, Flex, Heading, IconButton, Image, Menu, MenuButton, MenuItem, MenuList, Modal, ModalBody, ModalCloseButton, ModalContent, ModalFooter, ModalHeader, ModalOverlay, Text, Textarea, useDisclosure } from '@chakra-ui/react'
import React, { useEffect, useRef, useState } from 'react'
import { BiChat, BiLike, BiShare, BiSolidLike } from 'react-icons/bi'
import { BsThreeDotsVertical } from 'react-icons/bs'
import { Link } from 'react-router-dom'
import { deletePost, likePost, removeLike, writeComment } from '../API'
import { useLocalStorage } from '../LocalStorage'
import Comments from './Comments'

function PostCard({ refresh, id, card, name, p, userId, postId, profile_picture, posting_date }) {
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
    const [user, setUser] = useLocalStorage('tripify_user', null)

    useEffect(() => {
        if (p) {
            setPost(p)
            if (user)
                p.reacts.forEach(x => { if (x.user_id === user.user_id) setLiked(true) })
            setLikesCount(p.reacts.length)
            setCommentsCount(p.comments.length)
        }
        console.log(p);
    }, [])
    async function editPostClick() {

    }
    async function deletePostClick() {
        await deletePost(postId)
        refresh()
    }
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
        onClose()
    }
    return (
        <Box>
            <Card>
                <CardHeader>
                    <Flex spacing='4'>
                        <Flex flex='1' gap='4' alignItems='center' flexWrap='wrap'>
                            <Link to={`/profile/${userId}`}>
                                <Avatar name={name} src={profile_picture} />
                            </Link>
                            <Box>
                                <Link to={'/profile/' + userId}>
                                    <Heading size='sm'>{name}</Heading>
                                </Link>
                                <Text>{new Date(posting_date).toLocaleString()}</Text>
                            </Box>
                        </Flex>
                        {
                            user && userId == user.user_id && <Menu>
                                <MenuButton>
                                    <IconButton
                                        variant='ghost'
                                        colorScheme='gray'
                                        aria-label='See menu'
                                        icon={<BsThreeDotsVertical />}
                                    />
                                </MenuButton>
                                <MenuList>
                                    <MenuItem onClick={editPostClick}>Edit</MenuItem>
                                    <MenuItem onClick={deletePostClick}>Delete</MenuItem>
                                </MenuList>
                            </Menu>
                        }
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
                        src={
                            post && post.image_url ? post.image_url :  ''
                        }
                    />
                }
                {/* </Link> */}
                {
                    user && <CardFooter justify='space-between'>
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
                }
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
                                            <Avatar name={name} src={profile_picture} />
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
                                src={
                                    post && post.image_url ? post.image_url : ''
                                }
                                alt='Chakra UI'
                            />

                            {
                                user && <CardFooter justify='space-between'>
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
                            }
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
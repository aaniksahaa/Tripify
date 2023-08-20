import { Avatar, Box, Button, Card, CardBody, CardFooter, CardHeader, Flex, Heading, IconButton, Image, Menu, MenuButton, MenuItem, MenuList, Modal, ModalBody, ModalCloseButton, ModalContent, ModalFooter, ModalHeader, ModalOverlay, Stack, Text, Textarea, useDisclosure } from '@chakra-ui/react'
import React from 'react'
import { BiChat, BiLike, BiShare, BiSolidLike } from 'react-icons/bi'
import { BsThreeDotsVertical } from 'react-icons/bs'
import { Link } from 'react-router-dom'
import { useState } from 'react'
import Comments from './Comments'

function PostCard({ id, card }) {
    const [liked, setLiked] = useState(false)
    const { isOpen, onOpen, onClose } = useDisclosure()
    const { isOpen: isOpen2, onOpen: onOpen2, onClose: onClose2 } = useDisclosure()

    return (
        <Box>
            <Card>
                <CardHeader>
                    <Flex spacing='4'>
                        <Flex flex='1' gap='4' alignItems='center' flexWrap='wrap'>
                            <Link to='/profile/1'>
                                <Avatar name='Segun Adebayo' src='https://bit.ly/dan-abramov' />
                            </Link>
                            <Box>
                                <Link to='/profile/1'>
                                    <Heading size='sm'>Segun Adebayo</Heading>
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
                                With Chakra UI, I wanted to sync the speed of development with the speed
                                of design. I wanted the developer to be just as excited as the designer to
                                create a screen.
                            </Text>
                            :
                            <Text>
                                With Chakra UI, I wanted to sync the speed of development with the speed
                                of design. I wanted the developer to be just as excited as the designer to
                                create a screen.
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
                    <Button onClick={() => setLiked(x => !x)} flex='1' variant={liked ? 'solid' : 'ghost'} leftIcon={
                        liked ? <BiSolidLike /> : <BiLike />
                    }>
                        Like
                    </Button>
                    <Button onClick={onOpen} flex='1' variant='ghost' leftIcon={<BiChat />}>
                        Comment
                    </Button>
                    <Button flex='1' variant='ghost' leftIcon={<BiShare />}>
                        Share
                    </Button>
                </CardFooter>
            </Card>
            <Modal size={'xl'} onClose={onClose} isOpen={isOpen} isCentered>
                <ModalOverlay />
                <ModalContent>
                    <ModalHeader>Write a Comment</ModalHeader>
                    <ModalCloseButton />
                    <ModalBody>
                        <Textarea rows={'5'} />
                    </ModalBody>
                    <ModalFooter justifyContent={'space-between'}>
                        <Button onClick={onClose}>Cancel</Button>
                        <Button colorScheme={'blue'} onClick={onClose}>Post</Button>
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
                                        <Link to='/profile/1'>
                                            <Avatar name='Segun Adebayo' src='https://bit.ly/dan-abramov' />
                                        </Link>
                                        <Box>
                                            <Link to='/profile/1'>
                                                <Heading size='sm'>Segun Adebayo</Heading>
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
                                    With Chakra UI, I wanted to sync the speed of development with the speed
                                    of design. I wanted the developer to be just as excited as the designer to
                                    create a screen.
                                </Text>
                            </CardBody>
                            <Image
                                objectFit='cover'
                                src='https://images.unsplash.com/photo-1531403009284-440f080d1e12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'
                                alt='Chakra UI'
                            />
                            <CardFooter justify='space-between'>
                                <Button onClick={() => setLiked(x => !x)} flex='1' variant={liked ? 'solid' : 'ghost'} leftIcon={
                                    liked ? <BiSolidLike /> : <BiLike />
                                }>
                                    Like
                                </Button>
                                <Button onClick={onOpen} flex='1' variant='ghost' leftIcon={<BiChat />}>
                                    Comment
                                </Button>
                                <Button flex='1' variant='ghost' leftIcon={<BiShare />}>
                                    Share
                                </Button>
                            </CardFooter>
                        </Card>
                        <Box mt='10px'>
                            <Comments />
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
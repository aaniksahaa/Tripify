import { Avatar, Box, Button, Card, CardBody, CardFooter, CardHeader, Flex, Heading, IconButton, Menu, MenuButton, MenuItem, MenuList, Text, useToast } from '@chakra-ui/react'
import React, { useEffect, useState } from 'react'
import { BsThreeDotsVertical } from 'react-icons/bs'
import { deleteX, getSingleUser } from '../API'
import StarRating from './StarRating'
import { useLocalStorage } from '../LocalStorage'

function Review({ user_id, description, posting_date, rating, review_id }) {
    const [user, setUser] = useState({
        profile_picture: '',
        name: ''
    })
    const toast = useToast()
    async function Delete() {
        await deleteX('review/' + review_id)
        toast({
            position: 'top-right',
            title: 'Notification',
            description: 'Review has been deleted',
            status: 'success',
            duration: 3000,
            colorScheme: 'whatsapp',
            isClosable: true,
        })
        setTimeout(() => location.reload(), 1000)
    }
    const [u, setU] = useLocalStorage('tripify_user', null)

    async function initialize() {
        const u = await getSingleUser(user_id)
        setUser(u)
    }
    useEffect(() => {
        initialize()
    }, [])
    return (
        <div>
            <Card className='card'>
                <CardHeader>
                    <Flex spacing='4'>
                        <Flex flex='1' gap='4' alignItems='center' flexWrap='wrap'>
                            <Avatar name={user.name} src={user.profile_picture} />
                            <Box>
                                <Heading size='sm'>{user.name}</Heading>
                                <Text>{new Date(posting_date).toLocaleString()}</Text>
                            </Box>
                        </Flex>
                        {
                            user && user_id === user.user_id ?
                                <Menu>
                                    <MenuButton as={IconButton}>
                                        <IconButton
                                            variant='ghost'
                                            colorScheme='gray'
                                            aria-label='See menu'
                                            icon={<BsThreeDotsVertical />}
                                        />
                                    </MenuButton>
                                    <MenuList>
                                        <MenuItem onClick={Delete}>Delete</MenuItem>
                                    </MenuList>
                                </Menu>
                                : <></>
                        }
                    </Flex>
                </CardHeader>
                <CardBody>
                    <StarRating rating={rating} />
                    <Text>
                        {description}
                    </Text>
                </CardBody>
                <CardFooter
                    justify='space-between'
                    flexWrap='wrap'
                    sx={{
                        '& > button': {
                            minW: '136px',
                        },
                    }}
                >
                </CardFooter>
            </Card>
        </div>
    )
}

export default Review
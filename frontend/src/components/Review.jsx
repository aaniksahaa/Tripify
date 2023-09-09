import { Avatar, Box, Card, CardBody, CardFooter, CardHeader, Flex, Heading, IconButton, Text } from '@chakra-ui/react'
import React, { useEffect, useState } from 'react'
import { BsThreeDotsVertical } from 'react-icons/bs'
import { getSingleUser } from '../API'
import StarRating from './StarRating'

function Review({ user_id, description, posting_date, rating, review_id }) {
    const [user, setUser] = useState({
        profile_picture: '',
        name: ''
    })
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
                        <IconButton
                            variant='ghost'
                            colorScheme='gray'
                            aria-label='See menu'
                            icon={<BsThreeDotsVertical />}
                        />
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
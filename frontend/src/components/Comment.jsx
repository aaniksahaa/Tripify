import { Avatar, Box, Button, Card, CardBody, CardFooter, CardHeader, Flex, Heading, IconButton, Image, Text } from '@chakra-ui/react'
import React from 'react'
import { BiChat, BiLike, BiShare } from 'react-icons/bi'
import { BsThreeDotsVertical } from 'react-icons/bs'
import { getUserProfile } from '../API'

function Comment({ text, user_id }) {
    const [name, setName] = useState('noob')
    const [image, setImage] = useState('')

    async function initialize() {
        const user = await getUserProfile(user_id, {})
        setName(user.name)
    }
    useEffect(() => {
        initialize()
    }, [])
    return (
        <Box>
            <Card>
                <CardHeader>
                    <Flex spacing='4'>
                        <Flex flex='1' gap='4' alignItems='center' flexWrap='wrap'>
                            <Avatar name='Segun Adebayo' src='https://bit.ly/sage-adebayo' />
                            <Box>
                                <Heading size='sm'>{ }</Heading>
                                <Text>Creator, Chakra UI</Text>
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
                        {text}
                    </Text>
                </CardBody>
            </Card>
        </Box>
    )
}

export default Comment
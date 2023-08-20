import { Avatar, Box, Button, Card, CardBody, CardFooter, CardHeader, Flex, Heading, IconButton, Image, Text } from '@chakra-ui/react'
import React from 'react'
import { BiChat, BiLike, BiShare } from 'react-icons/bi'
import { BsThreeDotsVertical } from 'react-icons/bs'

function Comment() {
    return (
        <Box>
            <Card>
                <CardHeader>
                    <Flex spacing='4'>
                        <Flex flex='1' gap='4' alignItems='center' flexWrap='wrap'>
                            <Avatar name='Segun Adebayo' src='https://bit.ly/sage-adebayo' />
                            <Box>
                                <Heading size='sm'>Segun Adebayo</Heading>
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
                        With Chakra UI, I wanted to sync the speed of development with the speed
                        of design. I wanted the developer to be just as excited as the designer to
                        create a screen.
                    </Text>
                </CardBody>
            </Card>
        </Box>
    )
}

export default Comment
import { Avatar, Box, Card, CardBody, CardHeader, Flex, Heading, IconButton, Text } from '@chakra-ui/react'
import React from 'react'
import { BsThreeDotsVertical } from 'react-icons/bs'

function Comment({ text, name, date, pp }) {
    return (
        <Box>
            <Card>
                <CardHeader>
                    <Flex spacing='4'>
                        <Flex flex='1' gap='4' alignItems='center' flexWrap='wrap'>
                            <Avatar name={name} src={pp} />
                            <Box>
                                <Heading size='sm'>{name}</Heading>
                                <Text>{new Date(date).toLocaleString()}</Text>
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
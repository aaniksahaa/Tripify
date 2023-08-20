import React from 'react'
import StarRating from './StarRating'
import { Box, Container, Flex, Heading, Progress, Stack, Text, VStack } from '@chakra-ui/react'
import { FaStar } from 'react-icons/fa'

function RatingBox({ props }) {
    return (
        <Container width='100%' margin={'20px'}>
            <VStack>
                <Text fontSize='3xl'>
                    Rating Overview
                </Text>
                <Flex alignItems={'baseline'}>
                    <Heading size='2xl' textAlign={'center'}>
                        4.56
                    </Heading>
                    <Text fontSize='3xl'>/5</Text>
                </Flex>
                <StarRating rating={4} size={50} />
                <Text fontSize='20px'>
                    2,124 reviews
                </Text>

            </VStack>
            <Box>
                <Stack spacing={2}>
                    <Flex alignItems={'center'} justifyContent={'space-evenly'}>
                        <Box>5</Box>
                        <Box color='#ffc107'><FaStar /></Box>
                        <Box width={'90%'}><Progress borderRadius={'50px'} size='md' value={80} /></Box>
                    </Flex>
                    <Flex alignItems={'center'} justifyContent={'space-evenly'}>
                        <Box>4</Box>
                        <Box color='#ffc107'><FaStar /></Box>
                        <Box width={'90%'}><Progress borderRadius={'50px'} size='md' value={50} /></Box>
                    </Flex>
                    <Flex alignItems={'center'} justifyContent={'space-evenly'}>
                        <Box>3</Box>
                        <Box color='#ffc107'><FaStar /></Box>
                        <Box width={'90%'}><Progress borderRadius={'50px'} size='md' value={20} /></Box>
                    </Flex>
                    <Flex alignItems={'center'} justifyContent={'space-evenly'}>
                        <Box>2</Box>
                        <Box color='#ffc107'><FaStar /></Box>
                        <Box width={'90%'}><Progress borderRadius={'50px'} size='md' value={10} /></Box>
                    </Flex>
                    <Flex alignItems={'center'} justifyContent={'space-evenly'}>
                        <Box>1</Box>
                        <Box color='#ffc107'><FaStar /></Box>
                        <Box width={'90%'}><Progress borderRadius={'50px'} size='md' value={5} /></Box>
                    </Flex>
                </Stack>
            </Box>
        </Container>
    )
}

export default RatingBox
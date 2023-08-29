import { Box, Container, Flex, Heading, Progress, Stack, Text, VStack } from '@chakra-ui/react'
import React, { useEffect, useState } from 'react'
import { FaStar } from 'react-icons/fa'
import StarRating from './StarRating'

function RatingBox({ ratingInfo }) {
    const [total, setTotal] = useState(1)
    const [rating, setRating] = useState({
        rating_1: 0,
        rating_2: 0,
        rating_3: 0,
        rating_4: 0,
        rating_5: 0,
        rating_avg: 0
    })
    useEffect(() => {
        if (ratingInfo) {
            console.log(ratingInfo)
            setRating(ratingInfo)
            setTotal(ratingInfo.rating_1 + ratingInfo.rating_2 + ratingInfo.rating_3 + ratingInfo.rating_4 + ratingInfo.rating_5)
        }
    }, [ratingInfo])

    return (
        <Container width='100%' margin={'20px'}>
            <VStack>
                <Text fontSize='3xl'>
                    Rating Overview
                </Text>
                <Flex alignItems={'baseline'}>
                    <Heading size='2xl' textAlign={'center'}>
                        {rating.rating_avg}
                    </Heading>
                    <Text fontSize='3xl'>/5</Text>
                </Flex>
                <StarRating rating={4} size={50} />
                <Text fontSize='20px'>
                    {total} reviews
                </Text>
            </VStack>
            <Box>
                <Stack spacing={2}>
                    <Flex alignItems={'center'} justifyContent={'space-evenly'}>
                        <Box>5</Box>
                        <Box color='#ffc107'><FaStar /></Box>
                        <Box width={'90%'}><Progress borderRadius={'50px'} size='md' value={parseInt(Math.floor(rating.rating_5 * 100 / total))} /></Box>
                    </Flex>
                    <Flex alignItems={'center'} justifyContent={'space-evenly'}>
                        <Box>4</Box>
                        <Box color='#ffc107'><FaStar /></Box>
                        <Box width={'90%'}><Progress borderRadius={'50px'} size='md' value={parseInt(Math.floor(rating.rating_4 * 100 / total))} /></Box>
                    </Flex>
                    <Flex alignItems={'center'} justifyContent={'space-evenly'}>
                        <Box>3</Box>
                        <Box color='#ffc107'><FaStar /></Box>
                        <Box width={'90%'}><Progress borderRadius={'50px'} size='md' value={parseInt(Math.floor(rating.rating_3 * 100 / total))} /></Box>
                    </Flex>
                    <Flex alignItems={'center'} justifyContent={'space-evenly'}>
                        <Box>2</Box>
                        <Box color='#ffc107'><FaStar /></Box>
                        <Box width={'90%'}><Progress borderRadius={'50px'} size='md' value={parseInt(Math.floor(rating.rating_2 * 100 / total))} /></Box>
                    </Flex>
                    <Flex alignItems={'center'} justifyContent={'space-evenly'}>
                        <Box>1</Box>
                        <Box color='#ffc107'><FaStar /></Box>
                        <Box width={'90%'}><Progress borderRadius={'50px'} size='md' value={parseInt(Math.floor(rating.rating_1 * 100 / total))} /></Box>
                    </Flex>
                </Stack>
            </Box>
        </Container>
    )
}

export default RatingBox
import { Box, Button, Text, Textarea } from '@chakra-ui/react'
import React from 'react'
import StarRating from './StarRating'

function WriteReview() {
    return (
        <Box>
            <Text fontSize='3xl' textAlign={'center'}>
                Write a Review
            </Text>
            <Box margin='10px'>
                <Box marginBottom={'10px'}>
                    <StarRating allowReview={true} rating={rating} setRating={setRating} size={30} />
                </Box>
                <Textarea marginBottom={'10px'} value={review} rows='4' variant='filled' placeholder='Review' onChange={(e) => {
                    setReview(e.target.value)
                }} />
                <Button colorScheme="blue" size={'md'}>Post</Button>
            </Box>
        </Box>
    )
}

export default WriteReview
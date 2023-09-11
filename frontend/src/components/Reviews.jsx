import { Box, SimpleGrid } from '@chakra-ui/react'
import React, { useEffect, useState } from 'react'
import PostCard from './PostCard'

function Reviews({ profile, refresh }) {
    const [reviews, setReviews] = useState([])
    useEffect(() => {
        console.log(profile)
        if (profile) {
            setReviews(profile.reviews_created)
        }
    }, [profile])
    return (
        <Box>
            <SimpleGrid spacing={'10px'} columns={{ base: 1, sm: 1, md: 1, lg: 1, xl: 1 }}>
                {
                    reviews.length > 0 && reviews.map((review, id) =>
                        <Box>
                            hi
                        </Box>
                    )
                }
            </SimpleGrid>

        </Box>
    )
}

export default Reviews
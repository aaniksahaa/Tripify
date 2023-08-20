import { Box, Center, SimpleGrid } from '@chakra-ui/react'
import React from 'react'
import PostCard from './PostCard'

function Posts({ userId }) {
    return (
        <Box>
            <SimpleGrid spacing={'10px'} columns={{ base: 1, sm: 1, md: 1, lg: 1, xl: 1 }}>
                <PostCard />
                <PostCard />
                <PostCard />
                <PostCard />
            </SimpleGrid>
        </Box>
    )
}

export default Posts
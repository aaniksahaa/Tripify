import { Box, Center, SimpleGrid } from '@chakra-ui/react'
import React from 'react'
import PostCard from './PostCard'

function Posts({ profile }) {
    return (
        <Box>
            <SimpleGrid spacing={'10px'} columns={{ base: 1, sm: 1, md: 1, lg: 1, xl: 1 }}>
                {
                    profile.posts_created && profile.posts_created.map((post, id) => {
                        return <PostCard postId={post.post_id} userId={profile.user_id} name={profile.name} p={post} key={id} />
                    })
                }
            </SimpleGrid>
        </Box>
    )
}

export default Posts
import { Box, SimpleGrid } from '@chakra-ui/react'
import React, { useEffect, useState } from 'react'
import PostCard from './PostCard'

function Posts({ profile, refresh }) {
    const [posts, setPosts] = useState([])
    useEffect(() => {
        if (profile) {
            setPosts(profile.posts_created)
        }
    }, [profile])
    return (
        <Box>
            <SimpleGrid spacing={'10px'} columns={{ base: 1, sm: 1, md: 1, lg: 1, xl: 1 }}>
                {
                    posts.length > 0 && posts.map((post, id) => {
                        return <PostCard posting_date={post.posting_date} refresh={refresh} postId={post.post_id} userId={profile.user_id} name={profile.name} p={post} key={id} profile_picture={profile.profile_picture} />
                    })
                }
            </SimpleGrid>
        </Box>
    )
}

export default Posts
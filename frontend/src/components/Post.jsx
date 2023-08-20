import { Box, Container, Stack } from '@chakra-ui/react'
import React from 'react'
import PostCard from './PostCard'
import Navbar2 from './Navbar2'
import Comments from './Comments'

function Post({ id }) {
    return (
        <Box>
            <Navbar2 />
            <Container maxW={'5xl'}>
                <Stack spacing={'10px'} mt={'50px'}>
                    <PostCard />
                    <Comments />
                </Stack>
            </Container>
        </Box>
    )
}

export default Post
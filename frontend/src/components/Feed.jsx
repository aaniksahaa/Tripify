import { Box, Container } from '@chakra-ui/react'
import React from 'react'
import Navbar2 from './Navbar2'
import Posts from './Posts'

function Feed() {
    return (
        <Box>
            <Navbar2 />
            <Container maxW='5xl'>
                <Box mt='40px'> 
                    <Posts />
                </Box>
            </Container>
        </Box>
    )
}

export default Feed
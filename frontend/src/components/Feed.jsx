import { Box, Container, SimpleGrid } from '@chakra-ui/react'
import React from 'react'
import Navbar2 from './Navbar2'
import Posts from './Posts'
import { useEffect } from 'react'
import { useState } from 'react'
import { getFeed } from '../API'
import PostCard from './PostCard'

function Feed() {
    const [posts, setPosts] = useState([])
    const [filter, setFilter] = useState({
        orderby: 'posting_date',
        ordertype: 'desc',
        page: 1,
        per_page: 10
    })
    async function load(t) {
        const _posts = await getFeed(t)
        setPosts(_posts)
    }
    async function initialize() {
        load({ orderby: 'posting_date', ordertype: 'desc' })
    }
    useEffect(() => {
        initialize()
    }, [])

    function nextPage() {
        var f = filter
        f['page'] = Math.min(1000, f['page'] + 1)
        setFilter(f)
        load(f)
    }
    function prevPage() {
        var f = filter
        f['page'] = Math.max(1, f['page'] - 1)
        setFilter(f)
        load(f)
    }
    function refresh() {

    }
    return (
        <Box>
            <Navbar2 />
            <Container maxW='5xl'>
                <Box mt='40px'>
                    <SimpleGrid spacing={'10px'} columns={{ base: 1, sm: 1, md: 1, lg: 1, xl: 1 }}>
                        {
                            posts.length > 0 && posts.map((post, id) => {
                                return <PostCard posting_date={post.posting_date} refresh={refresh} postId={post.post_id} userId={post.user.user_id} name={post.user.name} p={post} key={id} profile_picture={post.user.profile_picture} />
                            })
                        }
                    </SimpleGrid>
                </Box>
            </Container>
        </Box>
    )
}

export default Feed
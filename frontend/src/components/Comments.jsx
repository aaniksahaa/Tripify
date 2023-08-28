import React, { useEffect, useState } from 'react'
import Comment from './Comment'
import { Box, Stack } from '@chakra-ui/react'
import { getPostDetails } from '../API'

function Comments({ postId }) {
  const [comments, setComments] = useState([])

  async function initialize() {
    const post = await getPostDetails(postId)
    console.log(post)
    setComments(post.comments)
  }
  useEffect(() => {
    initialize()
  }, [])
  return (
    <Stack spacing={'10px'}>
      {comments.map((comment, id) =>
        <Comment text={comment.text} user={comment.user_id} key={id} />
      )}
    </Stack>
  )
}

export default Comments
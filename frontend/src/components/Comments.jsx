import React, { useEffect, useState } from 'react'
import Comment from './Comment'
import { Box, Stack } from '@chakra-ui/react'
import { getPostDetails } from '../API'

function Comments({ postId }) {
  const [comments, setComments] = useState([])

  async function initialize() {
    const post = await getPostDetails(postId)
    setComments(post.comments)
    console.log(post.comments)
  }
  useEffect(() => {
    initialize()
  }, [])
  return (
    <Stack spacing={'10px'}>
      {comments.map((comment, id) =>
        <Comment date={comment.commenting_date} text={comment.text} name={comment.user.name} key={id} />
      )}
    </Stack>
  )
}

export default Comments
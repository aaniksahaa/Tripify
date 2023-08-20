import React from 'react'
import Comment from './Comment'
import { Box, Stack } from '@chakra-ui/react'

function Comments() {
  return (
    <Stack spacing={'10px'}>
        <Comment/>
        <Comment/>
        <Comment/>
        <Comment/>
        <Comment/>
    </Stack>
  )
}

export default Comments
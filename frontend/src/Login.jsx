'use client'

import {
    Box,
    Button,
    Checkbox,
    Flex,
    FormControl,
    FormLabel,
    Heading,
    Image,
    Input,
    Stack,
    Text,
} from '@chakra-ui/react'
import { useEffect, useRef } from 'react'
import { getLogin } from './API'
import { useLocalStorage } from './LocalStorage'

export default function SplitScreen() {
    const [user, setUser] = useLocalStorage('tripify_user', {})
    const userRef = useRef()
    const passRef = useRef()
    async function login() {
        const user = userRef.current.value
        const pass = passRef.current.value
        const result = await getLogin({ username: user, password: pass })
        if (result.error) {

        }
        else {
            setUser(result.user)
        }
    }
    useEffect(() => {
    }, [])
    return (
        <Box>
            <Stack minH={'100vh'} direction={{ base: 'column', md: 'row' }}>
                <Flex p={8} flex={1} align={'center'} justify={'center'}>
                    <Stack spacing={4} w={'full'} maxW={'md'}>
                        <Heading fontSize={'2xl'}>Sign in to your account</Heading>
                        <FormControl id="email">
                            <FormLabel>Username</FormLabel>
                            <Input type="text" ref={userRef} />
                        </FormControl>
                        <FormControl id="password">
                            <FormLabel>Password</FormLabel>
                            <Input type="password" ref={passRef} />
                        </FormControl>
                        <Stack spacing={6}>
                            <Stack
                                direction={{ base: 'column', sm: 'row' }}
                                align={'start'}
                                justify={'space-between'}>
                                <Checkbox>Remember me</Checkbox>
                                <Text color={'blue.500'}>Forgot password?</Text>
                            </Stack>
                            <Button colorScheme={'blue'} variant={'solid'} onClick={login}>
                                Login
                            </Button>
                        </Stack>
                    </Stack>
                </Flex>
                <Flex flex={1}>
                    <Image
                        alt={'Login Image'}
                        objectFit={'cover'}
                        src={
                            'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80'
                        }
                    />
                </Flex>
            </Stack>
        </Box>
    )
}

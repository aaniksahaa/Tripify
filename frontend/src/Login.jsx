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
    useToast,
} from '@chakra-ui/react'
import { useEffect, useRef } from 'react'
import { getLogin } from './API'
import { setItem, useLocalStorage } from './LocalStorage'

export default function Login() {
    const toast = useToast()
    const [user, setUser] = useLocalStorage('tripify_user', null)
    const userRef = useRef()
    const passRef = useRef()
    async function login() {
        const user = userRef.current.value
        const pass = passRef.current.value
        const result = await getLogin({ username: user, password: pass })
        if (result.token) {
            toast({
                position:'top-right',
                title: 'Success',
                description: 'Logged in successfully',
                status: 'success',
                duration: 3000,
                colorScheme: 'whatsapp',
                isClosable: true,
            })
            setTimeout(() => {
                setItem('authToken', result.token)
                setUser(result.user)
                window.location = '/'
            }, 1000)

        }
        else {
            var message = ''
            if(result.errors) {
                result.errors.forEach(x=>{
                    message+=x.path+','
                })
                message = message.substring(0, message.length-1)
                message += ' missing'
            }
            else message = result.message;
            toast({
                position:'top-right',
                title: 'Failed',
                description: message,
                status: 'error',
                duration: 3000,
                isClosable: true,
            })
        }
    }
    useEffect(() => {
        if (user) window.location = '/'
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
                            <Text>
                                Don't have an account?
                            </Text>
                            <Button onClick={() => window.location = '/reg'} colorScheme='red'>Sign Up</Button>
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

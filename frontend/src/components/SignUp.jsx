'use client'

import {
  Flex,
  Box,
  FormControl,
  FormLabel,
  Input,
  InputGroup,
  HStack,
  InputRightElement,
  Stack,
  Button,
  Heading,
  Text,
  useColorModeValue,
  useToast,
} from '@chakra-ui/react'

import DatePicker from "react-datepicker";

import { useState } from 'react'
import { ViewIcon, ViewOffIcon } from '@chakra-ui/icons'
import { Link } from 'react-router-dom'
import { useLocalStorage } from '../LocalStorage'
import { useEffect } from 'react'
import { createUser } from '../API';

export default function SignupCard() {
  const toast = useToast()
  const [showPassword, setShowPassword] = useState(false)
  const [dob, setDob] = useState(new Date())
  const [user, setUser] = useLocalStorage('tripify_user', null)
  const [data, setData] = useState({
    "username": "",
    "email": "",
    "password": "",
    "name": "",
    "dob": ""
  })
  useEffect(() => {
    if (user) window.location = '/'
  })
  function setDob_(date) {
    setDob(date)
    setData({
      ...data,
      dob: new Date(date).toISOString().split('T')[0]
    })
  }
  function handleChange(e) {
    setData({
      ...data,
      [e.target.name]: e.target.value
    })
  }
  async function signUp() {
    const result = await createUser(data)
    if (result.username) {
      toast({
        position:'top-right',
        title: 'Success',
        description: 'Account created successfully',
        status: 'success',
        duration: 3000,
        colorScheme:'whatsapp',
        isClosable: true,
      })
      setTimeout(() => {
        window.location = '/login'
      }, 1000)
    }
    else {
      var message = ''
      if (result.errors) {
        result.errors.forEach(x => {
          message += x.path + ','
        })
        message = message.substring(0, message.length - 1)
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
  return (
    <Flex
      minH={'100vh'}
      align={'center'}
      justify={'center'}
      bg={useColorModeValue('gray.50', 'gray.800')}>
      <Stack spacing={8} mx={'auto'} maxW={'lg'} py={12} px={6}>
        <Stack align={'center'}>
          <Heading fontSize={'4xl'} textAlign={'center'}>
            Sign up
          </Heading>
          <Text fontSize={'lg'} color={'gray.600'}>
            to enjoy all of our cool features ✌️
          </Text>
        </Stack>
        <Box
          rounded={'lg'}
          bg={useColorModeValue('white', 'gray.700')}
          boxShadow={'lg'}
          p={8}>
          <Stack spacing={4}>
            <HStack>
              <Box>
                <FormControl id="name" isRequired>
                  <FormLabel>Name</FormLabel>
                  <Input name="name" onChange={handleChange} type="text" />
                </FormControl>
              </Box>
              <Box>
                <FormControl id="lastName">
                  <FormLabel>Username</FormLabel>
                  <Input name="username" onChange={handleChange} type="text" />
                </FormControl>
              </Box>
            </HStack>
            <FormControl id="email" isRequired>
              <FormLabel>Email address</FormLabel>
              <Input name="email" onChange={handleChange} type="email" />
            </FormControl>
            <FormControl id="password" isRequired>
              <FormLabel>Password</FormLabel>
              <InputGroup>
                <Input name="password" onChange={handleChange} type={showPassword ? 'text' : 'password'} />
                <InputRightElement h={'full'}>
                  <Button
                    variant={'ghost'}
                    onClick={() => setShowPassword((showPassword) => !showPassword)}>
                    {showPassword ? <ViewIcon /> : <ViewOffIcon />}
                  </Button>
                </InputRightElement>
              </InputGroup>
            </FormControl>
            <FormControl id="password" isRequired>
              <FormLabel>Date of Birth</FormLabel>
              <DatePicker selected={dob} onChange={(date) => setDob_(date)} />
            </FormControl>
            <Stack spacing={10} pt={2}>
              <Button
                onClick={signUp}
                loadingText="Submitting"
                size="lg"
                bg={'blue.400'}
                color={'white'}
                _hover={{
                  bg: 'blue.500',
                }}>
                Sign up
              </Button>
            </Stack>
            <Stack pt={6}>
              <Text align={'center'}>
                Already a user? <Link to='/login'><Button size={'sm'} colorScheme='red'>Login</Button></Link>
              </Text>
            </Stack>
          </Stack>
        </Box>
      </Stack>
    </Flex>
  )
}

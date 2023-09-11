import { Avatar, Box, Button, Card, CardBody, Container, FormControl, FormLabel, GridItem, Input, RangeSlider, RangeSliderFilledTrack, RangeSliderMark, RangeSliderThumb, RangeSliderTrack, SimpleGrid, Stack, Table, Tbody, Td, Text, Tfoot, Th, Thead, Tr, useToast } from '@chakra-ui/react'
import React from 'react'
import Navbar2 from './Navbar2'
import { deleteUser, getCities, getHotels, getUsers } from '../API'
import { useState } from 'react'
import { useEffect } from 'react'
import { Select } from 'chakra-react-select'
import { Link } from 'react-router-dom'
import { DeleteIcon } from '@chakra-ui/icons'
import { isLoggedIn, userIs } from '../Utils'

function Users() {
    ///api/v1/user?name=e&city_id=1,2,3&min_age=5&max_age=92&page=1&per_page=3&orderby=name&ordertype=desc
    const [users, setUsers] = useState([])
    const [cityMap, setCityMap] = useState({})
    const [cities, setCities] = useState([])
    const [filter, setFilter] = useState({
        name: '',
        city_id: '',
        min_age: 0,
        max_age: 50000,
        orderby: '',
        ordertype: '',
        page: 1,
        per_page: 10
    })

    const toast = useToast()


    async function Delete(id) {
        await deleteUser(id)
        toast({
            position: 'top-right',
            title: 'Success',
            description: 'User has been deleted',
            status: 'success',
            duration: 3000,
            isClosable: true,
        })
        setTimeout(() => load(filter), 300)
    }
    async function searchClick() {
        var f = filter
        f['page'] = 1
        await load(f)
        setFilter(f)
    }
    async function load(t) {
        const _users = await getUsers(t)
        setUsers(_users)
    }
    async function initialize() {
        const _cities = await getCities({})
        var m = {}
        _cities.forEach(x => m[x.value] = x.label)
        setCityMap(m)
        setCities(_cities)
        await load({})
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
    return (
        <Box>
            <Navbar2 />
            <Container maxW='2000px' >
                <Box margin='20px' style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                    <Text fontSize='4xl'>Users</Text>
                </Box>
                <SimpleGrid columns={{ base: 1, sm: 1, md: 3, lg: 4, xl: 5 }} >
                    <GridItem colSpan={{ base: 1, sm: 1, md: 1, lg: 1, xl: 1 }} padding='20px'>
                        <Stack spacing={'10px'}>
                            <FormControl>
                                <FormLabel>Name</FormLabel>
                                <Input variant='filled' placeholder='' value={filter.name} onChange={(e) => {
                                    var obj = { ...filter }
                                    obj['name'] = e.target.value
                                    setFilter(obj)
                                }} />
                            </FormControl>
                            <FormControl>
                                <FormLabel>Age</FormLabel>
                                <RangeSlider min={0} max={100} step={5} value={[filter.min_age, filter.max_age]} onChange={(val) => {
                                    var obj = { ...filter }
                                    obj.min_age = val[0]
                                    obj.max_age = val[1]
                                    setFilter(obj)
                                }}>
                                    <RangeSliderMark value={0} mt='5' ml='-2.5' fontSize='sm'>0</RangeSliderMark>
                                    <RangeSliderMark value={20} mt='5' ml='-2.5' fontSize='sm'>20</RangeSliderMark>
                                    <RangeSliderMark value={40} mt='5' ml='-2.5' fontSize='sm'>40</RangeSliderMark>
                                    <RangeSliderMark value={60} mt='5' ml='-2.5' fontSize='sm'>60</RangeSliderMark>
                                    <RangeSliderMark value={80} mt='5' ml='-2.5' fontSize='sm'>80</RangeSliderMark>
                                    <RangeSliderMark value={100} mt='5' ml='-2.5' fontSize='sm'>100</RangeSliderMark>
                                    <RangeSliderTrack bg='red.100'>
                                        <RangeSliderFilledTrack bg='tomato' />
                                    </RangeSliderTrack>
                                    <RangeSliderThumb boxSize={6} index={0} />
                                    <RangeSliderThumb boxSize={6} index={1} />
                                </RangeSlider>
                            </FormControl>
                            <br />
                            <FormControl>
                                <FormLabel>City</FormLabel>
                                <Select
                                    isMulti
                                    options={cities}
                                    className="basic-multi-select"
                                    classNamePrefix="select"
                                    onChange={(v) => {
                                        var obj = { ...filter }
                                        obj.city_id = ''
                                        v.forEach(x => obj.city_id += x.value + ',')
                                        setFilter(obj)
                                    }}
                                />
                            </FormControl>
                            <FormControl>
                                <FormLabel>Sort by</FormLabel>
                                <Select
                                    options={
                                        [
                                            {
                                                label: "Name (Ascending)",
                                                value: '1',
                                                orderby: 'name',
                                                ordertype: 'asc'
                                            },
                                            {
                                                label: "Price Per Day (Ascending)",
                                                value: '2',
                                                orderby: 'price_per_day',
                                                ordertype: 'asc'
                                            },
                                            {
                                                label: "Rating (Descending)",
                                                value: '3',
                                                orderby: 'price_per_day',
                                                ordertype: 'asc'
                                            },
                                            {
                                                label: "Review Count (Descending)",
                                                value: '4',
                                                orderby: 'price_per_day',
                                                ordertype: 'asc'
                                            },
                                            {
                                                label: "Name (Descending)",
                                                value: '5',
                                                orderby: 'name',
                                                ordertype: 'desc'
                                            },
                                            {
                                                label: "Price Per Day (Descending)",
                                                value: '6',
                                                orderby: 'price_per_day',
                                                ordertype: 'desc'
                                            },
                                            {
                                                label: "Rating (Ascending)",
                                                value: '7',
                                                orderby: 'price_per_day',
                                                ordertype: 'asc'
                                            },
                                            {
                                                label: "Review Count (Ascending)",
                                                value: '8',
                                                orderby: 'price_per_day',
                                                ordertype: 'asc'
                                            }
                                        ]
                                    }
                                    defaultValue={
                                        {
                                            label: "Name (Ascending)",
                                            value: '1',
                                            orderby: 'name',
                                            ordertype: 'asc'
                                        }
                                    }
                                    onChange={(v) => {
                                        var obj = { ...filter }
                                        obj['orderby'] = v.orderby
                                        obj['ordertype'] = v.ordertype
                                        setFilter(obj)
                                    }}
                                    useBasicStyles
                                />
                            </FormControl>
                            <Button onClick={searchClick}>Search</Button>
                        </Stack>
                    </GridItem>
                    <GridItem colSpan={{ base: 1, sm: 1, md: 2, lg: 3, xl: 4 }}>
                        <SimpleGrid columns={{ base: 1, sm: 1, md: 2, lg: 3, xl: 4 }} spacing={5} style={{ width: '100%' }} p='30px'>
                            {
                                users.map((user, idx) =>
                                    <Card maxWidth={'300px'} className='card'>
                                        {
                                            isLoggedIn() && userIs('admin') ?
                                                <Box textAlign={'right'} padding={'5px'}>
                                                    <Button onClick={() => Delete(user.user_id)} colorScheme='red'><DeleteIcon size={30} /></Button>
                                                </Box>
                                                : <></>
                                        }
                                        <Link to={'/profile/' + user.user_id}>

                                            <CardBody>
                                                <Stack direction='column' justifyContent={'center'} alignItems={'center'}>
                                                    <Box>
                                                        <Avatar src={user.profile_picture} size={'2xl'} />
                                                    </Box>
                                                    <Table>
                                                        <Tr>
                                                            <Th>Username</Th>
                                                            <Td>{user.username}</Td>
                                                        </Tr>
                                                        <Tr>
                                                            <Th>Name</Th>
                                                            <Td>{user.name}</Td>
                                                        </Tr>
                                                        <Tr>
                                                            <Th>City</Th>
                                                            <Td>{cityMap[user.city_id]}</Td>
                                                        </Tr>
                                                    </Table>
                                                </Stack>
                                            </CardBody>
                                        </Link>

                                    </Card>
                                )
                            }
                        </SimpleGrid>
                        <Stack direction={'row'} justifyContent={'center'} alignItems={'center'}>
                            <Button variant={'solid'} colorScheme={'blue'} onClick={prevPage}>Previous Page</Button>
                            <Button variant={'solid'} colorScheme={'blue'} onClick={nextPage}>Next Page</Button>
                        </Stack>
                    </GridItem>
                    <Box height={'200px'}>
                    </Box>
                </SimpleGrid>
            </Container>
        </Box >
    )
}
export default Users
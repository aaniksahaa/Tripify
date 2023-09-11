import { MoonIcon, SunIcon } from "@chakra-ui/icons";
import { Avatar, Box, Button, Center, CloseButton, Flex, HStack, IconButton, Menu, MenuButton, MenuDivider, MenuItem, MenuList, VStack, chakra, useColorMode, useColorModeValue, useDisclosure, useToast } from "@chakra-ui/react";
import React, { useState } from 'react';
import { AiOutlineMenu } from "react-icons/ai";
import { Link } from "react-router-dom";
import { useLocalStorage } from "../LocalStorage";
import Cart from "./Cart";
import { doesURLContain, userIs } from "../Utils";
import { IoMdNotifications } from 'react-icons/io';
import Notifications from "./Notifications";
import { useEffect } from "react";
import { getX } from "../API";

function Navbar2({ openDrawer }) {
    const toast = useToast()
    const [timer, setTimer] = useLocalStorage('tripify_notification_timer', null)
    function logout() {
        localStorage.removeItem('tripify_user')
        location.reload();
        localStorage.removeItem('authToken')
    }
    const bg = useColorModeValue("white", "gray.800");
    const mobileNav = useDisclosure();
    const [open, setOpen] = useState(false)
    const { colorMode, toggleColorMode } = useColorMode()
    const [user, setUser] = useLocalStorage('tripify_user', null)

    useEffect(() => {

    }, [])
    return (
        <Box style={{ zIndex: '20' }} position={'sticky'} top='0'>
            <Cart open={open} setOpen={setOpen} />
            <chakra.header bg={bg} w="full" px={{ base: 2, sm: 4, }} py={4} shadow="md">
                <Flex alignItems="center" justifyContent="space-between" mx="auto">
                    <Flex>
                        <chakra.a href="/" title="Choc Home Page" display="flex" alignItems="center" style={{ padding: '2px' }}>
                            <img src={colorMode === 'light' ? '/logo.png' : '/logo_dark.png'}
                                width='200px' />
                        </chakra.a>
                    </Flex>
                    <HStack display="flex" alignItems="center" spacing={1}>
                        {
                            user && userIs('client') ?
                                <Button colorScheme="green" onClick={() => {
                                    setOpen(true)
                                }}>
                                    My Trip
                                </Button>
                                :
                                <></>
                        }

                        <HStack spacing={1} mr={1} color="brand.500" display={{ base: "none", md: "inline-flex", }}>
                            {
                                user && user.role === 'admin' &&
                                <>
                                    <Link to='/statistics'><Button variant={doesURLContain('/statistics') ? 'solid' : 'ghost'} colorScheme="red">Statistics</Button></Link>
                                    <Link to='/create-new'><Button variant={doesURLContain('/create-new') ? 'solid' : 'ghost'} colorScheme="red">Create New</Button></Link>
                                </>
                            }
                            {
                                user && <>
                                    <Link to='/tripbookings'><Button variant={doesURLContain('/tripbookings') ? 'solid' : 'ghost'} colorScheme="blue">TripBookings</Button></Link>
                                </>
                            }
                            <Link to='/trips'><Button variant={doesURLContain('/trips') ? 'solid' : 'ghost'} colorScheme="blue">Trips</Button></Link>
                            <Link to='/hotels'><Button variant={doesURLContain('/hotels') ? 'solid' : 'ghost'} colorScheme="blue">Hotels</Button></Link>
                            <Link to='/destinations'><Button variant={doesURLContain('/destinations') ? 'solid' : 'ghost'} colorScheme="blue">Destinations</Button></Link>
                            <Link to='/activities'><Button variant={doesURLContain('/activities') ? 'solid' : 'ghost'} colorScheme="blue">Activities</Button></Link>
                            <Link to='/restaurants'><Button variant={doesURLContain('/restaurants') ? 'solid' : 'ghost'} colorScheme="blue">Restaurants</Button></Link>
                            {
                                user && <>
                                    <Link to='/users'><Button variant={doesURLContain('/users') ? 'solid' : 'ghost'} colorScheme="blue">Users</Button></Link>
                                    <Link to='/chat'><Button variant={doesURLContain('/chat') ? 'solid' : 'ghost'} colorScheme="blue">Chat</Button></Link>
                                </>
                            }
                            <Button onClick={toggleColorMode} variant="ghost">
                                {colorMode === 'light' ? <MoonIcon /> : <SunIcon />}
                            </Button>
                            {
                                user ? <Notifications /> : <></>
                            }
                            {
                                user ? <Menu>
                                    <MenuButton
                                        as={Button}
                                        rounded={'full'}
                                        variant={'link'}
                                        cursor={'pointer'}
                                        minW={0}>
                                        <Avatar
                                            size={'sm'}
                                            src={user.profile_picture}
                                        />
                                    </MenuButton>
                                    <MenuList alignItems={'center'}>
                                        <br />
                                        <Center>
                                            <Avatar
                                                size={'2xl'}
                                                src={user.profile_picture}
                                            />
                                        </Center>
                                        <br />
                                        <Center>
                                            <Link to={'/profile/' + user.user_id}>
                                                <Button colorScheme={'blue'}>{user.name}</Button>
                                            </Link>
                                        </Center>
                                        <br />
                                        <MenuDivider />
                                        <MenuItem><Link to='/feed'>News Feed</Link></MenuItem>
                                        <MenuItem><Link to='/edit-profile'>Edit Profile</Link></MenuItem>
                                        <MenuItem>Favourites</MenuItem>
                                        <MenuItem onClick={logout}>
                                            Logout
                                        </MenuItem>
                                    </MenuList>
                                </Menu>
                                    :
                                    <Link to={'/login'}>
                                        <Button>Login</Button>
                                    </Link>
                            }
                        </HStack>
                        <Box display={{ base: "inline-flex", md: "none", }}>
                            <IconButton display={{ base: "flex", md: "none", }} aria-label="Open menu" fontSize="20px"
                                color="gray.800" _dark={{ color: "inherit", }} variant="ghost" icon={<AiOutlineMenu />}
                                onClick={mobileNav.onOpen}
                            />

                            <VStack pos="absolute" top={0} left={0} right={0} display={mobileNav.isOpen ? "flex" : "none"}
                                flexDirection="column" p={2} pb={4} m={2} bg={bg} spacing={3} rounded="sm" shadow="sm">
                                <CloseButton aria-label="Close menu" onClick={mobileNav.onClose} />

                                {
                                    user ? <Menu >
                                        <MenuButton
                                            as={Button}
                                            rounded={'full'}
                                            variant={'link'}
                                            cursor={'pointer'}
                                            minW={0}>
                                            <Avatar
                                                size={'lg'}
                                                src={user.profile_picture}
                                            />
                                        </MenuButton>
                                        <MenuList alignItems={'center'}>
                                            <br />
                                            <Center>
                                                <Avatar
                                                    size={'2xl'}
                                                    src={user.profile_picture}
                                                />
                                            </Center>
                                            <br />
                                            <Center>
                                                <Link to='/profile'>
                                                    <Button>Username</Button>
                                                </Link>
                                            </Center>
                                            <br />
                                            <MenuDivider />
                                            <MenuItem><Link to='/editprofile'>Edit Profile</Link></MenuItem>
                                            <MenuItem>Favourites</MenuItem>
                                            <MenuItem>Account Settings</MenuItem>
                                            <MenuItem>Logout</MenuItem>
                                        </MenuList>
                                    </Menu>
                                        :
                                        <Link to={'/login'}>
                                            <Button>Login</Button>
                                        </Link>
                                }
                                {
                                    user ? <Notifications /> : <></>
                                }
                                {
                                    user && user.role === 'admin' &&
                                    <>
                                        <Link style={{ width: '100%' }} to='/statistics'><Button width='full' variant={doesURLContain('/statistics') ? 'solid' : 'ghost'} colorScheme="red">Statistics</Button></Link>
                                        <Link style={{ width: '100%' }} to='/create-new'><Button width='full' variant={doesURLContain('/create-new') ? 'solid' : 'ghost'} colorScheme="red">Create New</Button></Link>
                                    </>
                                }
                                {
                                    user && <>
                                        <Link style={{ width: '100%' }} to='/tripbookings'><Button width='full' variant={doesURLContain('/tripbookings') ? 'solid' : 'ghost'} colorScheme="blue">TripBookings</Button></Link>
                                    </>
                                }
                                <Link style={{ width: '100%' }} to='/trips'><Button width='full' variant={doesURLContain('/trips') ? 'solid' : 'ghost'} colorScheme="blue">Trips</Button></Link>
                                <Link style={{ width: '100%' }} to='/hotels'><Button width='full' variant={doesURLContain('/hotels') ? 'solid' : 'ghost'} colorScheme="blue">Hotels</Button></Link>
                                <Link style={{ width: '100%' }} to='/destinations'><Button width='full' variant={doesURLContain('/destinations') ? 'solid' : 'ghost'} colorScheme="blue">Destinations</Button></Link>
                                <Link style={{ width: '100%' }} to='/activities'><Button width='full' variant={doesURLContain('/activities') ? 'solid' : 'ghost'} colorScheme="blue">Activities</Button></Link>
                                <Link style={{ width: '100%' }} to='/restaurants'><Button width='full' variant={doesURLContain('/restaurants') ? 'solid' : 'ghost'} colorScheme="blue">Restaurants</Button></Link>
                                {
                                    user && <>
                                        <Link style={{ width: '100%' }} to='/users'><Button width={'full'} variant={doesURLContain('/users') ? 'solid' : 'ghost'} colorScheme="blue">Users</Button></Link>
                                        <Link style={{ width: '100%' }} to='/chat'><Button width={'full'} variant={doesURLContain('/chat') ? 'solid' : 'ghost'} colorScheme="blue">Chat</Button></Link>
                                    </>
                                }
                                <Button onClick={toggleColorMode} variant="ghost">
                                    {colorMode === 'light' ? <MoonIcon /> : <SunIcon />}
                                </Button>
                            </VStack>
                        </Box>
                    </HStack>
                </Flex>
            </chakra.header>
        </Box>
    );
}

export default Navbar2
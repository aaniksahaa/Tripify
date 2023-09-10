import { MoonIcon, SunIcon } from "@chakra-ui/icons";
import { Avatar, Box, Button, Center, CloseButton, Flex, HStack, IconButton, Menu, MenuButton, MenuDivider, MenuItem, MenuList, VStack, chakra, useColorMode, useColorModeValue, useDisclosure } from "@chakra-ui/react";
import React, { useState } from 'react';
import { AiOutlineMenu } from "react-icons/ai";
import { Link } from "react-router-dom";
import { useLocalStorage } from "../LocalStorage";
import Cart from "./Cart";

function Navbar2({ openDrawer }) {
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
                        <Button colorScheme="green" size="sm" onClick={() => {
                            setOpen(true)
                        }}>
                            My Trip
                        </Button>

                        <HStack spacing={1} mr={1} color="brand.500" display={{ base: "none", md: "inline-flex", }}>
                            <Link to='/trips'><Button variant="ghost">Trips</Button></Link>
                            <Link to='/hotels'><Button variant="ghost">Hotels</Button></Link>
                            <Link to='/destinations'><Button variant="ghost">Destinations</Button></Link>
                            <Link to='/activities'><Button variant="ghost">Activities</Button></Link>
                            <Link to='/restaurants'><Button variant="ghost">Restaurants</Button></Link>
                            <Button onClick={toggleColorMode} variant="ghost">
                                {colorMode === 'light' ? <MoonIcon /> : <SunIcon />}
                            </Button>
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

                                <Link style={{ width: '100%' }} to='/trips'><Button width='full' variant="ghost">Trips</Button></Link>
                                <Link style={{ width: '100%' }} to='/hotels'><Button width='full' variant="ghost">Hotels</Button></Link>
                                <Link style={{ width: '100%' }} to='/destinations'><Button width='full' variant="ghost">Destinations</Button></Link>
                                <Link style={{ width: '100%' }} to='/activities'><Button width='full' variant="ghost">Activities</Button></Link>
                                <Link style={{ width: '100%' }} to='/restaurants'><Button width='full' variant="ghost">Restaurants</Button></Link>
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
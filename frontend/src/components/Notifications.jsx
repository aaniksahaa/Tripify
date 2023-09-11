import { Box, Button, Card, CardBody, Menu, MenuButton, MenuList, Stack, Text } from '@chakra-ui/react'
import React, { useEffect, useState } from 'react'
import { IoMdNotifications } from 'react-icons/io'
import { getNotifications, getUsers, getX } from '../API'
import { useLocalStorage } from '../LocalStorage'

function Notifications() {
    ///api/v1/user/1/notifications?is_read=0&page=1&per_page=2&order_by=notifying_date&order_type=desc
    const [user, setUser] = useLocalStorage('tripify_user', null)
    const [notifications, setNotifications] = useState([])
    const [filter, setFilter] = useState({
        orderby: 'notifying_date',
        ordertype: 'desc',
        page: 1,
        per_page: 10
    })
    async function load(t) {
        const _notifications = await getX(`user/${user.user_id}/notifications`)
        setNotifications(_notifications)
    }
    async function initialize() {
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
        <Menu>
            <MenuButton
                as={Button}
                variant={'ghost'}
                onClick={initialize}
            >
                <IoMdNotifications size={20} />
            </MenuButton>
            <MenuList zIndex="dropdown" maxHeight={"80vh"} overflowY={"scroll"}>
                {
                    notifications.length > 0 && notifications.map((item, index) =>
                        <Box>
                            <Card key={index} maxW={'500px'}>
                                <CardBody>
                                    <Stack direction={'column'}>
                                        <Text fontSize={'sm'}>{new Date(item.notifying_date).toLocaleString()}</Text>
                                        <Text >{item.text}</Text>
                                    </Stack>
                                </CardBody>
                            </Card>
                            <hr />
                        </Box>
                    )
                }
            </MenuList>
        </Menu>
    )
}

export default Notifications
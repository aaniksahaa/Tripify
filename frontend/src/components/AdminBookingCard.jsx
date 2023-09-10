import { ExternalLinkIcon } from '@chakra-ui/icons'
import { Box, Button, Container, Flex, HStack, Stack, Table, Tbody, Td, Th, Tr, useToast } from '@chakra-ui/react'
import React from 'react'
import { Link } from 'react-router-dom'
import { FaCheck, FaQuestion } from 'react-icons/fa';

function AdminBookingCard({ booking }) {
    const toast = useToast()
    return (
        <>
        <HStack>
        { booking && booking.is_paid == 1 && (
        <Button size={'lg'} marginLeft={'8'} width={'fill-content'} colorScheme="whatsapp" leftIcon={<FaCheck />}>
            Paid
        </Button>
        )}
        { booking && booking.is_processed == 1 && (
        <Button size={'lg'} marginLeft={'2'} width={'fill-content'} colorScheme="orange" leftIcon={<FaCheck />}>
            Processed
        </Button>
        )}
        </HStack>
        <Box p={2} width={'100%'} display={'flex'} justifyContent={'center'}>
        <Table width={'100%'} variant={'striped'} size='md'>
        <Tbody>
            <Tr >
            <Th width={'20%'}>User</Th>
            <Td>
            <Flex alignItems={'center'}>
                <Link href={'/profile/' + booking.user_id} isExternal alignItems={'center'}>
                {booking.user.name}
                </Link>
                <ExternalLinkIcon mx='2px' />
            </Flex>
            </Td>
            </Tr>
            <Tr><Th>Booking Date</Th><Td>{new Date(booking.booking_date).toLocaleDateString()}</Td></Tr>
            <Tr><Th>Trip Name</Th><Td>{booking.trip.name}</Td></Tr>
            <Tr><Th>Trip Description</Th><Td>{booking.trip.description}</Td></Tr>
            <Tr><Th>Start Date</Th><Td>{new Date(booking.trip.start_date).toLocaleDateString()}</Td></Tr>
            <Tr><Th>End Date</Th><Td>{new Date(booking.trip.end_date).toLocaleDateString()}</Td></Tr>
        </Tbody>
        </Table>
        </Box>
        </>
    )
}

export default AdminBookingCard
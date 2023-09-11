import { Accordion, AccordionButton, AccordionIcon, AccordionItem, AccordionPanel, Box, Button, Divider, Flex, IconButton, Input, Link, Modal, ModalBody, ModalCloseButton, ModalContent, ModalHeader, ModalOverlay, Table, TableContainer, Tbody, Td, Text, Textarea, Th, Thead, Tr, useDisclosure, useToast } from "@chakra-ui/react"
import { useEffect, useRef, useState } from "react"
import { DeleteIcon, ExternalLinkIcon } from "@chakra-ui/icons"
import { taka } from "../Constants"
import { doPayment, getSingleTripBooking, getSingleTripDetails, processTripBooking } from "../API"
import { userIs } from "../Utils"

export default function AdminTripBookingCart({ open, setOpen, user_id, trip_id }) {

  const [booking, setBooking] = useState({
    "user_id": 1,
    "trip_id": 2,
    "booking_date": "2023-08-31T20:06:20.000Z",
    "is_paid": 1,
    "is_processed": 0,
    "is_completed": 0,
    "payment_method": "Bkash",
    "transaction_id": "xretdf",
    "payment_date": "2023-09-01T07:22:32.000Z",
    "completion_date": null,
    "is_private": 1,
    "created_on": "2023-08-31T20:06:20.000Z",
    "last_updated_on": "2023-08-31T20:06:20.000Z",
    "user": {
      "user_id": 1,
      "username": "aaniksahaa",
      "email": "abc@gmail.com",
      "role": "client",
      "name": "Anik Saha",
      "bio": "Little Coder",
      "city_id": 1,
      "facebook_url": "facebook.com/abc",
      "twitter_url": "twitter.com/abc",
      "instagram_url": "instagram.com/abc",
      "profile_picture": "dummy.jpg",
      "dob": "2002-09-16T18:00:00.000Z",
      "registration_date": "2023-08-28T16:54:56.000Z",
      "status": "active",
      "created_on": "2023-08-28T16:54:56.000Z",
      "last_updated_on": "2023-08-28T16:54:56.000Z",
      "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
      }
    }
  })
  const [hotels, setHotels] = useState([])
  const [activities, setActivities] = useState([])
  const [restaurants, setRestaurants] = useState([])
  const [totalCost, setTotalCost] = useState(0)
  const [body, setBody] = useState({
    name: '',
    description: '',
    startDate: new Date(),
    endDate: new Date()
  })
  async function load(user_id, trip_id) {
    const trip_booking = await getSingleTripBooking(user_id, trip_id)
    setBooking(trip_booking)
    const trip = await getSingleTripDetails(trip_id)
    setHotels(trip.hotels)
    setActivities(trip.contains)
    setRestaurants(trip.restaurants)
    setTotalCost(trip.total_price)
    setBody({
      name: trip.name,
      description: trip.description,
      startDate: trip.start_date,
      endDate: trip.end_date
    })
  }
  const refTID = useRef()
  const refMethod = useRef()
  async function confirmPayment() {
    const data = {
      "trip_id": trip_id,
      "payment_method": refMethod.current.value,
      "transaction_id": refTID.current.value
    }
    // alert(JSON.stringify(data))
    await doPayment(data)
    showToast('Success','Payment done successfully')
    setOpen(false)
    await refresh()
  }
  useEffect(() => {
    if (open) load(user_id, trip_id)
  }, [open])

  function closeModal() {
    setOpen(false)
  }

  const toast = useToast()
  function showToast(title, description) {
    toast({
      title: title,
      description: description,
      isClosable: 'true',
      duration: 3000,
      position: 'top-right',
      colorScheme: 'whatsapp'
    });
  }

  function handleConfirmClick() {
    processTripBooking({ user_id: booking.user_id, trip_id: booking.trip_id });
    closeModal();
    showToast('Processing Confirmed', "Trip Booking Request processed and notified to user")
  }

  return (
    <Modal onClose={closeModal} size={'2xl'} isOpen={open} isCentered scrollBehavior={'inside'}>
      <ModalOverlay />
      <ModalContent>
        <ModalHeader>Trip Booking Details</ModalHeader>
        <ModalCloseButton />
        <ModalBody>
          <Box>
            <Accordion defaultIndex={[0, 1, 2, 3, 4, 5, 6]} allowMultiple>
              <AccordionItem>
                <AccordionButton>
                  <Box as="span" flex='1' textAlign='left'>
                    <Text fontSize={'xl'} fontWeight={'500'}>Basic Info</Text>
                  </Box>
                  <AccordionIcon />
                </AccordionButton>
                <AccordionPanel pb={4}>
                  <Table variant={'simple'} size='sm'>
                    <Tbody>
                      <Tr ><Th>User</Th><Td>
                        <Flex alignItems={'center'}>
                          <Link href={'/profile/' + booking.user_id} isExternal alignItems={'center'}>
                            {booking.user.name}
                          </Link>
                          <ExternalLinkIcon mx='2px' />
                        </Flex>
                      </Td></Tr>
                      <Tr><Th>Booking Date</Th><Td>{new Date(booking.booking_date).toLocaleDateString()}</Td></Tr>
                      <Tr><Th>Trip Name</Th><Td>{body.name}</Td></Tr>
                      <Tr><Th>Trip Description</Th><Td>{body.description}</Td></Tr>
                      <Tr><Th>Start Date</Th><Td>{new Date(body.startDate).toLocaleDateString()}</Td></Tr>
                      <Tr><Th>End Date</Th><Td>{new Date(body.endDate).toLocaleDateString()}</Td></Tr>
                    </Tbody>
                  </Table>
                </AccordionPanel>
              </AccordionItem>
              <AccordionItem>
                <AccordionButton>
                  <Box as="span" flex='1' textAlign='left'>
                    <Text fontSize={'xl'} fontWeight={'500'}>Hotels ({hotels.length})</Text>
                  </Box>
                  <AccordionIcon />
                </AccordionButton>
                <AccordionPanel pb={4}>
                  {
                    hotels.map((hotel, id) =>
                      <Flex key={id} alignItems={'center'} justifyContent={'space-between'} padding={'10px'}>
                        <TableContainer>
                          <Table variant='simple' size='sm'>
                            <Tbody>
                              <Tr ><Th>Name</Th><Td>
                                <Flex alignItems={'center'}>
                                  <Link href={'/hotel/' + hotel.hotel_id} isExternal alignItems={'center'}>
                                    {hotel.hotel.name}
                                  </Link>
                                  <ExternalLinkIcon mx='2px' />
                                </Flex>
                              </Td></Tr>
                              <Tr><Th>Checkin Date</Th><Td>{new Date(hotel.checkin_date).toLocaleDateString()}</Td></Tr>
                              <Tr><Th>Checkout Date</Th><Td>{new Date(hotel.checkout_date).toLocaleDateString()}</Td></Tr>
                              <Tr><Th>Price Per Day</Th><Td>৳{hotel.hotel.price_per_day}</Td></Tr>
                            </Tbody>
                          </Table>
                        </TableContainer>
                      </Flex>
                    )
                  }
                </AccordionPanel>
              </AccordionItem>
              <AccordionItem>
                <AccordionButton>
                  <Box as="span" flex='1' textAlign='left'>
                    <Text fontSize={'xl'} fontWeight={'500'}>Activities ({activities.length})</Text>
                  </Box>
                  <AccordionIcon />
                </AccordionButton>
                <AccordionPanel pb={4}>
                  {
                    activities.map((activity, id) =>
                      <Flex key={id} alignItems={'center'} justifyContent={'space-between'}>
                        <TableContainer margin={'10px'}>
                          <Table variant='simple' size='sm'>
                            <Tbody>
                              <Tr><Th>Name</Th><Td>
                                <Flex alignItems={'center'}>
                                  <Link href={'/activity/' + activity.activity_id} isExternal alignItems={'center'}>
                                    {activity.activity_name}
                                  </Link>
                                  <ExternalLinkIcon mx='2px' />
                                </Flex>
                              </Td></Tr>
                              <Tr><Th>Destination</Th><Td>
                                <Flex alignItems={'center'}>
                                  <Link href={'/destination/' + activity.destination_id} isExternal alignItems={'center'}>
                                    {activity.destination_name}
                                  </Link>
                                  <ExternalLinkIcon mx='2px' />
                                </Flex>
                              </Td></Tr>
                              <Tr><Th>Tentative Date</Th><Td>{new Date(activity.tentative_date).toLocaleDateString()}</Td></Tr>
                              <Tr><Th>Price</Th><Td>৳{activity.price}</Td></Tr>
                            </Tbody>
                          </Table>
                        </TableContainer>
                      </Flex>
                    )
                  }
                </AccordionPanel>
              </AccordionItem>
              <AccordionItem>
                <AccordionButton>
                  <Box as="span" flex='1' textAlign='left'>
                    <Text fontSize={'xl'} fontWeight={'500'}>Restaurants ({restaurants.length})</Text>
                  </Box>
                  <AccordionIcon />
                </AccordionButton>
                <AccordionPanel pb={4}>
                  {
                    restaurants.map((restaurant, id) =>
                      <Flex key={id} alignItems={'center'} justifyContent={'space-between'}>
                        <TableContainer margin={'10px'}>
                          <Table variant='simple' size='sm'>
                            <Tbody>
                              <Tr><Th>Name</Th><Td>
                                <Flex alignItems={'center'}>
                                  <Link href={'/restaurant/' + restaurant.restaurant_id} isExternal alignItems={'center'}>
                                    {restaurant.restaurant.name}
                                  </Link>
                                  <ExternalLinkIcon mx='2px' />
                                </Flex>
                              </Td></Tr>
                              <Tr><Th>Reservation Price</Th><Td>৳{restaurant.restaurant.reservation_price}</Td></Tr>
                            </Tbody>
                          </Table>
                        </TableContainer>
                      </Flex>
                    )
                  }
                </AccordionPanel>
              </AccordionItem>
              <AccordionItem>
                <AccordionButton>
                  <Box as="span" flex='1' textAlign='left'>
                    <Text fontSize={'xl'} fontWeight={'500'}>Summary</Text>
                  </Box>
                  <AccordionIcon />
                </AccordionButton>
                <AccordionPanel pb={4}>
                  <Table variant={'simple'} size='sm'>
                    <Tbody>
                      <Tr><Th>Total Cost</Th><Td>{taka}{totalCost}</Td></Tr>
                    </Tbody>
                  </Table>
                </AccordionPanel>
              </AccordionItem>
              {
                booking && (
                  <AccordionItem>
                    <AccordionButton>
                      <Box as="span" flex='1' textAlign='left'>
                        <Text fontSize={'xl'} fontWeight={'500'}>Payment Information</Text>
                      </Box>
                      <AccordionIcon />
                    </AccordionButton>
                    <AccordionPanel pb={4}>
                      <Table variant={'simple'} size='sm'>
                        <Tbody>
                          <Tr><Th>Payment</Th><Td>{booking.is_paid ? 'Done' : 'Pending'}</Td></Tr>
                          {
                            booking.is_paid ? (
                              <>
                                <Tr><Th>Payment Method</Th><Td>{booking.payment_method}</Td></Tr>
                                <Tr><Th>Transaction ID</Th><Td>{booking.transaction_id}</Td></Tr>
                                <Tr><Th>Payment Date</Th><Td>{new Date(booking.payment_date).toLocaleDateString()}</Td></Tr>
                              </>
                            )
                              : <></>
                          }
                          {
                            !booking.is_paid ? (
                              <>
                                <Tr><Th>Payment Method</Th><Td><Input type="text" variant={'filled'} ref={refMethod} value={'bkash'}/></Td></Tr>
                                <Tr><Th>Transaction ID</Th><Td><Input type="text" variant={'filled'} ref={refTID} /></Td></Tr>
                                {/* <Tr><Th>Payment Date</Th><Td>{new Date(booking.payment_date).toLocaleDateString()}</Td></Tr> */}
                                {
                                  <Button colorScheme="green" onClick={confirmPayment}>Confirm Payment</Button>
                                }
                              </>
                            ) :
                              <></>}
                        </Tbody>
                      </Table>
                    </AccordionPanel>
                  </AccordionItem>
                )}
              {
                booking && booking.is_paid ? (
                  <AccordionItem>
                    <AccordionButton>
                      <Box as="span" flex='1' textAlign='left'>
                        <Text fontSize={'xl'} fontWeight={'500'}>Processing</Text>
                      </Box>
                      <AccordionIcon />
                    </AccordionButton>
                    <AccordionPanel pb={4}>
                      <Table variant={'simple'} size='sm'>
                        <Tbody>
                          <Tr><Th>Processing</Th><Td>{booking.is_processed ? 'Done' : 'Pending'}</Td></Tr>
                        </Tbody>
                      </Table>
                      {
                        (!booking.is_processed) ? (
                          <Box p={5} display={'flex'} justifyContent={'right'}>
                            {
                              userIs('admin') ?
                                <Button colorScheme="green" onClick={() => { handleConfirmClick() }}>Confirm Processing</Button>
                                :
                                <></>
                            }
                          </Box>
                        ) : <></>}
                    </AccordionPanel>
                  </AccordionItem>
                ) : <></>}
            </Accordion>
          </Box >
        </ModalBody>
        <Box display={'flex'} alignItems={'center'} justifyContent={'space-between'} margin='12px'>
          <Box>
            <Button margin='10px' onClick={closeModal} colorScheme="red">Cancel</Button>
          </Box>
        </Box>
      </ModalContent>
    </Modal>
  )
}
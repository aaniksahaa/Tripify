import React, { useEffect, useState } from 'react'
import { Box, Text, Flex, Textarea, VStack, FormControl, FormLabel, Button, SimpleGrid, Card, Progress } from '@chakra-ui/react'
import { FaTelegramPlane } from 'react-icons/fa'
import { getDestinations, getTripSuggestion } from './API'
import CardSlider from './components/CardSlider'
import Navbar2 from './components/Navbar2'

function Chat() {

    const blank_data = { hotels: [], restaurants: [], destinations: [] }

    const [loading, setLoading] = useState(0)
    const [data, setData] = useState(blank_data)
    const [query, setQuery] = useState('')
    const [answer, setAnswer] = useState('')
    const [text, setText] = useState('');
    const originalText = 'TripGPT, your AI trip assistant';

    const sendClick = async () => {
        setLoading(1)
        setData(blank_data)
        //setAnswer('Cool User')
        const waitText = 'Sure, thanks for your query.\n\nplease wait a little until I fetch you the destinations, hotels and restaurants that suit your requirements.Hope you have an amazing trip ahead.\n\n Thanks for your patience....';
        setAnswer(waitText)

        const j = await getTripSuggestion(query.replace('%20', ' '))

        setData(j)
    }

    useEffect(() => {

        if (data.hotels.length > 0) {
            setLoading(0)
            setAnswer('')
        }

        let index = 0;
        const interval = setInterval(() => {
            setText(originalText.substring(0, index));
            index++;
            if (index === originalText.length + 1) {
                clearInterval(interval);
            }
        }, 90); // Adjust the interval for typing speed
    }, [data]);

    return (
        <>
            <Navbar2 /> 
            <Box style={{ display: 'flex', justifyContent: 'center' }}>
                <VStack>
                    <Box
                        p={5}
                        bgGradient={`linear(to-l, #B888FF, #FFA7D1)`}
                        bgClip="text"
                        fontSize="6xl"
                        fontWeight="bold"
                    >
                        {text}
                    </Box>
                    <FormControl>
                        <FormLabel p={3} fontSize={'xl'}>What's on your mind?</FormLabel>
                        <Textarea
                            sx={{ fontSize: 'xl' }}
                            width={'1000px'}
                            height={'200px'}
                            name='description'
                            variant={'outline'}
                            borderWidth={'2px'}
                            value={query}
                            onChange={(e) => setQuery(e.target.value)}
                        />
                    </FormControl>
                    <Box ml={'auto'}>
                        <Button
                            fontSize={'xl'}
                            alignSelf={'right'}
                            colorScheme="teal"
                            leftIcon={<FaTelegramPlane />}
                            variant="solid"
                            size="md"
                            borderRadius="full"
                            onClick={sendClick}
                        >
                            Send
                        </Button>
                    </Box>
                    <FormControl>
                        <FormLabel p={3} fontSize={'xl'}>TripGPT:</FormLabel>
                        <Textarea
                            isReadOnly
                            sx={{ fontSize: 'xl' }}
                            width={'1000px'}
                            height={'200px'}
                            name='description'
                            variant={'outline'}
                            borderWidth={'2px'}
                            value={answer}
                            onChange={(e) => setQuery(e.target.value)}
                        />
                    </FormControl>


                </VStack>

            </Box>
            <center>
                {
                    loading == 1 && (
                        <Progress width={'1000px'} size='md' isIndeterminate />
                    )
                }
                <br></br>

                <Button size={'lg'} colorScheme={'gray'} variant={'solid'}>Destinations</Button>

                <SimpleGrid maxW={'80%'} columns={{ base: 1, sm: 1, md: 2, lg: 3, xl: 3 }} spacing={3} p='30px'>
                    {
                        data.destinations.map((item, index) => (
                            <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} position={'relative'}>
                                <CardSlider imgs={item.images} href={`/destination/${item.destination_id}`} title={item.name} info={item.address} />
                            </Card>
                        ))
                    }
                </SimpleGrid>

                <Button size={'lg'} colorScheme={'gray'} variant={'solid'}>Hotels</Button>

                <SimpleGrid maxW={'80%'} columns={{ base: 1, sm: 1, md: 2, lg: 3, xl: 3 }} spacing={3} style={{ width: '100%' }} p='30px'>
                    {
                        data.hotels.map((item, index) => (
                            <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} position={'relative'}>
                                <CardSlider rating={parseInt(Math.round(parseFloat(item.rating_info.rating_avg)))} imgs={item.images} price={item.price_per_day} href={`/hotel/${item.hotel_id}`} title={item.name} info={item.address} />
                            </Card>
                        ))
                    }
                </SimpleGrid>

                <Button size={'lg'} colorScheme={'gray'} variant={'solid'}>Restaurants</Button>

                <SimpleGrid maxW={'80%'} columns={{ base: 1, sm: 1, md: 2, lg: 3, xl: 3 }} spacing={3} style={{ width: '100%' }} p='30px'>
                    {
                        data.restaurants.slice(0, 6).map((item, index) => (
                            <Card key={index} className="card" paddingBottom={'100%'} width={'100%'} position={'relative'}>
                                <CardSlider rating={parseInt(Math.round(parseFloat(item.rating_info.rating_avg)))} imgs={item.images} price={item.reservation_price} href={`/restaurant/${item.restaurant_id}`} title={item.name} info={item.address} />
                            </Card>
                        ))
                    }
                </SimpleGrid>

            </center>

        </>
    )
}

export default Chat


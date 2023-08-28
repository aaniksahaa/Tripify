'use client'

import {
    Box,
    Flex,
    Text,
    useBreakpointValue
} from '@chakra-ui/react'
import React, { useEffect, useState } from 'react'
// Here we have used react-icons package for the icons
// And react-slick as our Carousel Lib
import { Link } from 'react-router-dom'
import Slider from 'react-slick'
import StarRating from './StarRating'

// Settings for the slider

export default function CardSlider({ title, info, rating, price, href, imgs }) {
    // As we have used custom buttons, we need a reference variable to
    // change the state
    const [slider, setSlider] = useState(null)
    const [images, setImages] = useState([])
    useEffect(() => {
        const x = [
            'https://a0.muscache.com/im/pictures/901267a5-3087-473b-8174-1e2f51336e0b.jpg?im_w=1200',
            'https://a0.muscache.com/im/pictures/df6702b8-c930-4612-926d-4b5f3d284a91.jpg?im_w=1200',
            'https://a0.muscache.com/im/pictures/cb06423e-5332-4f62-8ae9-5414d1cf1dc1.jpg?im_w=1200'
        ]
        if (imgs === null || imgs === undefined || imgs.length === 0) setImages(x)
        else setImages(imgs)
    }, [imgs])
    const settings = {
        dots: false,
        arrows: false,
        fade: true,
        infinite: true,
        autoplay: true,
        speed: 500,
        autoplaySpeed: 5000,
        slidesToShow: 1,
        slidesToScroll: 1,
        height: 500
    }


    // These are the breakpoints which changes the position of the
    // buttons as the screen size changes
    // const top = useBreakpointValue({ base: '90%', md: '50%' })
    // const side = useBreakpointValue({ base: '30%', md: '40px' })

    const top = useBreakpointValue({ base: '50%' })
    const side = useBreakpointValue({ base: '40px' })

    // This list contains all the data for carousels
    // This can be static or loaded from a server

    return (
        <Box height={'100%'} width={'100%'} position={'absolute'}>
            {/* CSS files for react-slick */}
            <link
                rel="stylesheet"
                type="text/css"
                href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.css"
            />
            <link
                rel="stylesheet"
                type="text/css"
                href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick-theme.min.css"
            />
            {/* <IconButton
        aria-label="left-arrow"
        variant="ghost"
        position="absolute"
        left={side}
        top={top}
        transform={'translate(0%, -50%)'}
        zIndex={2}
        onClick={() => slider?.slickPrev()}>
        <BiLeftArrowAlt size="40px" />
      </IconButton>
      <IconButton
        aria-label="right-arrow"
        variant="ghost"
        position="absolute"
        right={side}
        top={top}
        transform={'translate(0%, -50%)'}
        zIndex={2}
        onClick={() => slider?.slickNext()}>
        <BiRightArrowAlt size="40px" />
      </IconButton> */}
            <Slider {...settings} ref={(slider) => setSlider(slider)} className='slider'>
                {images && images.map((src, index) => (
                    <Link to={href} key={index}>
                        <Box position={'relative'} backgroundImage={src} backgroundPosition={'center'} backgroundSize={'cover'}
                            backgroundClip={'red'} paddingTop={'100%'}>
                            {
                                price && <Box color='white' position={'absolute'} top={'0'} right={'0'} backgroundColor={'black'} p={'10px'}>
                                    <Text fontSize='lg' fontWeight={'bold'}>
                                        ৳{price}
                                    </Text>
                                </Box>
                            }
                            <Box _hover={{ backgroundColor: 'rgba(0,0,0,0.9)' }} padding='10px' pb={'30px'} pt={'30px'} color='white' position={'absolute'} bottom={'0'} backgroundColor={'rgba(0,0,0,0.7)'} width={'100%'} textAlign={'left'}>
                                <Text fontSize={'2xl'}>{title}</Text>
                                <Flex alignItems={'center'} justifyContent={'space-between'}>
                                    <Box>
                                        {info}
                                    </Box>
                                    <Box>
                                        {rating ? <StarRating rating={rating} /> : <></>}
                                    </Box>
                                </Flex>
                            </Box>
                        </Box>
                    </Link>
                ))}
            </Slider>
        </Box >
    )
}

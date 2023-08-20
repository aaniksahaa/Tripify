'use client'

import React, { useState } from 'react'
import {
  Box,
  IconButton,
  useBreakpointValue,
  Stack,
  Heading,
  Text,
  Container,
  Image,
} from '@chakra-ui/react'
// Here we have used react-icons package for the icons
import { BiLeftArrowAlt, BiRightArrowAlt } from 'react-icons/bi'
// And react-slick as our Carousel Lib
import Slider from 'react-slick'

// Settings for the slider
const settings = {
  dots: true,
  arrows: false,
  fade: true,
  infinite: true,
  autoplay: true,
  speed: 500,
  autoplaySpeed: 5000,
  slidesToShow: 1,
  slidesToScroll: 1,
}

export default function CaptionCarousel({props}) {
  // As we have used custom buttons, we need a reference variable to
  // change the state
  const [slider, setSlider] = useState(null)

  // These are the breakpoints which changes the position of the
  // buttons as the screen size changes
  // const top = useBreakpointValue({ base: '90%', md: '50%' })
  // const side = useBreakpointValue({ base: '30%', md: '40px' })

  const top = useBreakpointValue({ base: '50%' })
  const side = useBreakpointValue({ base: '40px' })

  // This list contains all the data for carousels
  // This can be static or loaded from a server
  const cards = [
    {
      title: '',
      text: '',
      image:
        'https://a0.muscache.com/im/pictures/901267a5-3087-473b-8174-1e2f51336e0b.jpg?im_w=1200',
    },
    {
      title: '',
      text: '',
      image: 'https://a0.muscache.com/im/pictures/df6702b8-c930-4612-926d-4b5f3d284a91.jpg?im_w=1200',
    },
    {
      title: '',
      text: '',
      image: 'https://a0.muscache.com/im/pictures/cb06423e-5332-4f62-8ae9-5414d1cf1dc1.jpg?im_w=1200',
    },
  ]

  return (
    <Box position={'relative'}>
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
      <IconButton
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
      </IconButton>
      <Slider {...settings} ref={(slider)=>setSlider(slider)}>
        {cards.map((card, index) => (
          <Image height={'auto'} src={card.image}/>
          // <Box
          //   key={index}
          //   height={'6xl'}
          //   position="relative"
          //   // backgroundPosition="center"
          //   backgroundRepeat="no-repeat"
          //   backgroundSize="100%"
          //   backgroundImage={`url(${card.image})`}>
          //   {/* This is the block you need to change, to customize the caption */}
          //   <Container size="container.lg" height="600px" position="relative">
          //     <Stack
          //       spacing={6}
          //       w={'full'}
          //       maxW={'lg'}
          //       position="absolute"
          //       top="50%"
          //       transform="translate(0, -50%)">
          //       <Heading fontSize={{ base: '3xl', md: '4xl', lg: '5xl' }}>
          //         {card.title}
          //       </Heading>
          //       <Text fontSize={{ base: 'md', lg: 'lg' }} color="GrayText">
          //         {card.text}
          //       </Text>
          //     </Stack>
          //   </Container>
          // </Box>
        ))}
      </Slider>
    </Box>
  )
}

'use client'

import {
  Box,
  IconButton,
  useBreakpointValue
} from '@chakra-ui/react'
import React, { useEffect, useState } from 'react'
// Here we have used react-icons package for the icons
import { BiLeftArrowAlt, BiRightArrowAlt } from 'react-icons/bi'
// And react-slick as our Carousel Lib
import Slider from 'react-slick'

// Settings for the slider

export default function Carousel({ data }) {
  const [slider, setSlider] = useState(null)
  const [images, setImages] = useState([])
  async function initialize() {
    console.log('CAROUSEL ->', data)
    try {
      setImages(data)
    }
    catch { }
  }
  // useEffect(() => {
  //   initialize()
  // }, [])
  
  useEffect(() => {
    initialize()
  }, [data])

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
  const top = useBreakpointValue({ base: '50%' })
  const side = useBreakpointValue({ base: '40px' })
  // const images = [
  //   'https://a0.muscache.com/im/pictures/901267a5-3087-473b-8174-1e2f51336e0b.jpg?im_w=1200',
  //   'https://a0.muscache.com/im/pictures/df6702b8-c930-4612-926d-4b5f3d284a91.jpg?im_w=1200',
  //   'https://a0.muscache.com/im/pictures/cb06423e-5332-4f62-8ae9-5414d1cf1dc1.jpg?im_w=1200'
  // ]
  return (
    <Box position={'relative'}>
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
      <Slider {...settings} ref={(slider) => setSlider(slider)}>
        {images && images.map((img, index) => (
          <Box key={index}>
            <img src={img} />
          </Box>
        ))}
      </Slider>
    </Box>
  )
}

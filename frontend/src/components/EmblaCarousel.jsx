import React, { useCallback } from 'react'
import useEmblaCarousel from 'embla-carousel-react'
import Review from './Review'
import { Button } from '@chakra-ui/react'

const EmblaCarousel = (props) => {
    const options = {
        align: 'center',
        containScroll: false,
        nViewThreshold: 0,
        dragFree: true,
        // containScroll: 'trimSnaps'
    }
    const slides = [1, 2, 3]
    const [emblaRef, emblaApi] = useEmblaCarousel(options)
    const scrollPrev = useCallback(() => { if (emblaApi) emblaApi.scrollPrev() }, [emblaApi])
    const scrollNext = useCallback(() => { if (emblaApi) emblaApi.scrollNext() }, [emblaApi])

    return (
        <div>
            <div className="embla">
                <div className="embla__viewport" ref={emblaRef}>
                    <div className="embla__container">
                        {slides.map((index) => (
                            <div className="embla__slide" key={index}>
                                <Review />
                            </div>
                        ))}
                    </div>
                </div>
            </div>
            <div style={{display:'flex', justifyContent:'space-evenly', alignItems:'center'}}>
                <Button className="embla__prev" onClick={scrollPrev}>Prev</Button>
                <Button className="embla__next" onClick={scrollNext}>Next</Button>
            </div>
        </div>
    )
}

export default EmblaCarousel

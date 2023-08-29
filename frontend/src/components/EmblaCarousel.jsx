import { Button } from '@chakra-ui/react'
import useEmblaCarousel from 'embla-carousel-react'
import React, { useCallback, useEffect, useState } from 'react'
import { getReviews } from '../API'
import Review from './Review'

const EmblaCarousel = ({ type, id }) => {
    const options = {
        align: 'center',
        containScroll: false,
        nViewThreshold: 0,
        dragFree: true,
        // containScroll: 'trimSnaps'
    }
    const [reviews, setReviews] = useState([])
    async function initialize() {
        const filter = {
            object_type: type,
            object_id: id
        }
        const r = await getReviews(filter)
        setReviews(r)
        console.log(r)
    }
    useEffect(() => {
        initialize()
    }, [id])
    const [emblaRef, emblaApi] = useEmblaCarousel(options)
    const scrollPrev = useCallback(() => { if (emblaApi) emblaApi.scrollPrev() }, [emblaApi])
    const scrollNext = useCallback(() => { if (emblaApi) emblaApi.scrollNext() }, [emblaApi])

    return (
        <div>
            <div className="embla">
                <div className="embla__viewport" ref={emblaRef}>
                    <div className="embla__container">
                        {reviews.map((review, id) => (
                            <div className="embla__slide" key={id}>
                                <Review {...review} />
                            </div>
                        ))}
                    </div>
                </div>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-evenly', alignItems: 'center' }}>
                <Button className="embla__prev" onClick={scrollPrev}>Prev</Button>
                <Button className="embla__next" onClick={scrollNext}>Next</Button>
            </div>
        </div>
    )
}

export default EmblaCarousel

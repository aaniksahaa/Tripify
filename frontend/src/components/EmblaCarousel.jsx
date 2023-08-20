import React from 'react'
import useEmblaCarousel from 'embla-carousel-react'

const EmblaCarousel = (props) => {
    const options = { 
        align: 'center', 
        containScroll: false, 
        nViewThreshold: 0, 
        dragFree: true,
    }
    const slides = [1,2,3]
    const [emblaRef] = useEmblaCarousel(options)
    return (
        <div className="embla">
            <div className="embla__viewport" ref={emblaRef}>
                <div className="embla__container">
                    {slides.map((index) => (
                        <div className="embla__slide" key={index}>
                            <div className="embla__slide__number">
                                <span>{index + 1}</span>
                            </div>
                            <img
                                className="embla__slide__img"
                                src={'https://raw.githubusercontent.com/davidjerleke/embla-carousel/master/packages/embla-carousel-docs/src/assets/images/slide-1.jpg'}
                                alt="Your alt text"
                            />
                        </div>
                    ))}
                </div>
            </div>
        </div>
    )
}

export default EmblaCarousel

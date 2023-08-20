import React, { useState } from "react";
import { FaStar } from "react-icons/fa";
import { Radio, HStack, Box, ModalFooter, Input, FormControl, FormLabel, Flex, Textarea } from "@chakra-ui/react";
import { Button, Modal, ModalBody, ModalCloseButton, ModalContent, ModalHeader, ModalOverlay, useDisclosure } from "@chakra-ui/react"

export default function StarRating({ rating, setRating, count, size, allowReview }) {
  // count:  number of stars you want, pass as props
  //size: size of star that you want
  const [hover, setHover] = useState(null)
  return (
    <Box>
      <HStack spacing={"2px"}>
        {[...Array(count || 5)].map((star, index) => {
          const ratingValue = index + 1;
          return (
            <Box
              as="label"
              key={index}
              color={ratingValue <= (hover || rating) ? "#ffc107" : "#e4e5e9"}
              onMouseEnter={() => {if(allowReview) setHover(ratingValue)}}
              onMouseLeave={() => {if(allowReview) setHover(null)}}
            >
              <Radio
                name="rating"
                onChange={() => setRating(ratingValue)}
                value={ratingValue}
                display="none"

              ></Radio>
              <FaStar
                cursor={"pointer"}
                size={size || 20}
                transition="color 200ms"
              />
            </Box>
          );
        })}
      </HStack>
    </Box>
  );
}

import React from 'react';
import { Box, Flex, Button, Text, VStack, Checkbox, CheckboxGroup, HStack, Heading } from '@chakra-ui/react';
import { FaCheck, FaQuestion } from 'react-icons/fa';

export default function NiceButton({text}) {
  return (
    <Button
    w="fill-content" 
    h="50px" 
    borderRadius="md" // Rounded corners
    backgroundColor={'#FFE6FF'} // Background color
    color="black" // Text color
    fontWeight="bold"
    fontSize='xl'
    px={3}
    >
    {text}
    </Button>
  );
}

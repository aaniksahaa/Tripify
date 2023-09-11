import { Accordion, AccordionButton, AccordionIcon, AccordionItem, AccordionPanel, Avatar, Box, Button, Checkbox, CheckboxGroup, Container, Input, Progress, Stack, Table, Tbody, Td, Text, Textarea, Th, Tr, VStack, useToast } from '@chakra-ui/react'
import React, { useEffect, useRef, useState } from 'react'
import { deleteX, getHotelById, updateHotel, updateUser } from '../API'
import { Navigate} from 'react-router-dom';
import { getParam } from '../Utils';

function AdminEditHotel({hotel_data, parent_initializer, refresh}) {

    const [deleted,setDeleted] = useState(0)

    const toast = useToast()
    function showToast(title, description){
        toast({
        title: title,
        description: description,
        isClosable:'true', 
        duration: 3000, 
        position:'top-right', 
        colorScheme:'whatsapp'
        });
    }

    const [data, setData] = useState({})

    async function initialize(id) {
        const hotel = await getHotelById(id)
        setData(hotel)
    }
    useEffect(() => {
        const id = getParam()
        setTimeout(() => initialize(id), 500);
    }, [])

    
    function handleChange(e) {
        setData({
            ...data,
            [e.target.name]: e.target.value
        })
    }
    const handleCheckboxChange = (facility) => {
        setData({
          ...data,
          [facility]: data[facility] ? 0 : 1, // Toggle between 0 and 1
        });
    };
    function handleUpload() {
        if (!file) {
            alert('No file selected!')
        }
        setUploading(true);
        const storageRef = ref(storage, '/uploads/' + file.name);
        const uploadTask = uploadBytesResumable(storageRef, file)
        uploadTask.on(
            "state_changed",
            (snap) => {
                const percent = Math.round((snap.bytesTransferred / snap.totalBytes) * 100)
                setPercent(percent)
            },
            (err) => console.log(err),
            () => {
                getDownloadURL(uploadTask.snapshot.ref).then(url => {
                    console.log('File uploaded to ->', url)
                    setData({
                        ...data,
                        'profile_picture': url
                    })
                })
            }
        )
    }
    async function save() {
        var x = data
        await updateHotel(x)
        console.log(x)
        console.log('calling parent')
        // await parent_initializer(x)
        console.log('okay parent')
        showToast('Successfully Updated', 'Hotel is updated and changes stored permanently')
        showToast('Users Notified', 'Relevant users have been notified')
        await refresh()
    }
    async function del(){
        await deleteX(`hotel/${data.hotel_id}`)
        showToast('Successfully Deleted', 'Hotel is deleted and changes stored permanently')
        showToast('Users Notified', 'Relevant users have been notified')
        setDeleted(1);
    }
    async function uploadClick() {
        handleUpload()
    }

    if(deleted == 1)
    {
        return <Navigate to="/hotels" />;
    }

    return (
        <Box>
        <Accordion defaultIndex={[0,1]} allowMultiple>
            <AccordionItem>
            <AccordionButton>
                <Box as="span" flex='1' textAlign='center'>
                <Text fontSize={'xl'} fontWeight={'500'}>Update Hotel</Text>
                </Box>
                <AccordionIcon />
            </AccordionButton>
            <AccordionPanel pb={4}>
            <VStack>
                <VStack>
                    <Table size='md' variant={'unstyled'}>
                        <Tbody>
                            <Tr><Th>Name</Th><Td><Input name='name' variant={'outline'} borderWidth={'2px'} value={data.name} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Address</Th><Td><Input type='name' name='address' variant={'outline'} borderWidth={'2px'} value={data.address} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Description</Th><Td><Textarea name='description' variant={'outline'} borderWidth={'2px'} value={data.description} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Price Per Day</Th><Td><Input name='price_per_day' variant={'outline'} borderWidth={'2px'} value={data.price_per_day} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Phone</Th><Td><Input type='number' name='phone' variant={'outline'} borderWidth={'2px'} value={data.phone} onChange={handleChange} /></Td></Tr>
                            <Tr><Th>Email</Th><Td><Input type='email' name='email' variant={'outline'} borderWidth={'2px'} value={data.email} onChange={handleChange} /></Td></Tr>
                        </Tbody>
                    </Table>
                    <Box fontSize={'xl'}>
                    <Stack direction="row" align="center" spacing={20}>
                        <Text>Facilities:</Text>
                        <CheckboxGroup colorScheme="teal">
                            <Stack direction="row">
                                <Checkbox key='has_wifi' isChecked={data.has_wifi === 1} onChange={() => handleCheckboxChange('has_wifi')}>
                                    Wifi
                                </Checkbox>
                                <Checkbox key='has_parking' isChecked={data.has_parking === 1} onChange={() => handleCheckboxChange('has_parking')}>
                                    Parking
                                </Checkbox>
                                <Checkbox key='has_gym' isChecked={data.has_gym === 1} onChange={() => handleCheckboxChange('has_gym')}>
                                    Gym
                                </Checkbox>
                            </Stack>
                        </CheckboxGroup>
                    </Stack>
                    </Box>
                    <br></br>
                    <Button colorScheme='blue' onClick={save}>Update Hotel</Button>
                </VStack>
            </VStack>
            </AccordionPanel>
            </AccordionItem>
            <AccordionItem>
            <AccordionButton>
                <Box as="span" flex='1' textAlign='center'>
                <Text fontSize={'xl'} fontWeight={'500'}>Delete Hotel</Text>
                </Box>
                <AccordionIcon />
            </AccordionButton>
            <AccordionPanel>
                <Stack align={'center'}>
                <Button colorScheme='red' onClick={del}>Delete Hotel</Button>
                </Stack>
            </AccordionPanel>
            </AccordionItem>
        </Accordion>
        </Box>
    )
}

export default AdminEditHotel
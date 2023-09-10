import { Avatar, Box, Button, Container, Input, Progress, Stack, Table, Tbody, Td, Textarea, Th, Tr, VStack, useToast } from '@chakra-ui/react'
import { getDownloadURL, ref, uploadBytesResumable } from "firebase/storage"
import React, { useEffect, useRef, useState } from 'react'
import { getCities, updateUser } from '../API'
import { storage } from '../Firebase'
import { useLocalStorage } from '../LocalStorage'
import Navbar2 from './Navbar2'
import { Select } from 'chakra-react-select'

function EditProfile() {
    const toast = useToast()
    const [cityMap, setCityMap] = useState({})
    const [cities, setCities] = useState([])
    const [data, setData] = useState({
        name: '',
        email: '',
        bio: '',
        facebook_url: '',
        twitter_url: '',
        instagram_url: '',
        propic: '',
        city_id: 1
    })
    const fileRef = useRef()
    const imageRef = useRef()

    const [file, setFile] = useState()
    const [percent, setPercent] = useState(0)
    const [fileNo, setFileNo] = useState(1)
    const [uploading, setUploading] = useState(false)

    const [user, setUser] = useLocalStorage('tripify_user', {})
    const [pp, setPP] = useState('')

    async function init() {
        const _cities = await getCities({})
        var m = {}
        _cities.forEach(x=>m[x.value]=x.label)
        setCityMap(m)
        setCities(_cities)
    }
    useEffect(() => {
        init()
        setData(user)
        setPP(user.profile_picture)
    }, [])
    function handleChange(e) {
        setData({
            ...data,
            [e.target.name]: e.target.value
        })
    }
    async function handleFileChange(e) {
        setFile(e.target.files[0])
        setPP(URL.createObjectURL(e.target.files[0]))
    }
    async function selectProfilePictureClick() {
        fileRef.current.click()
    }
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
        x['dob'] = x['dob'].split('T')[0]
        await updateUser(x)
        console.log(x)
        setUser(x)
        toast({
            position:'top-right',
            title: 'Success',
            description: 'Profile updated successfully',
            status: 'success',
            duration: 3000,
            colorScheme:'whatsapp',
            isClosable: true,
        })
    }
    async function uploadClick() {
        handleUpload()
    }
    return (
        <Box>
            <Navbar2 />
            <Container maxW='7xl'>
                <VStack>
                    <VStack spacing={'20px'} height={'300px'} alignItems={'center'} justifyContent={'center'}>
                        <Avatar height={'200px'} width={'200px'} name='Dan Abrahmov' src={pp} />
                        {
                            percent != 0 &&
                            <Box>
                                <Progress width={'300px'} hasStripe size='sm' value={percent} />
                            </Box>
                        }
                        <Stack direction={'row'}>
                            <Button size={'sm'} onClick={selectProfilePictureClick}>Change Profile Picture</Button>
                            {
                                file &&
                                <Button size={'sm'} onClick={uploadClick}>Upload</Button>
                            }
                        </Stack>
                        <Input onChange={handleFileChange} type='file' display={'none'} ref={fileRef} />

                    </VStack>

                    <VStack spacing={'20px'}>
                        <Table size='sm' variant={'unstyled'}>
                            <Tbody>
                                <Tr><Th>Name</Th><Td><Input name='name' variant={'outline'} borderWidth={'2px'} value={data.name} onChange={handleChange} /></Td></Tr>
                                <Tr><Th>Email</Th><Td><Input type='email' name='email' variant={'outline'} borderWidth={'2px'} value={data.email} onChange={handleChange} /></Td></Tr>
                                <Tr><Th>Bio</Th><Td><Textarea name='bio' variant={'outline'} borderWidth={'2px'} value={data.bio} onChange={handleChange} /></Td></Tr>
                                <Tr><Th>City</Th><Td><Select
                                    options={cities}
                                    className="basic-multi-select"
                                    classNamePrefix="select"
                                    value={
                                        {
                                            label: cityMap[data.city_id],
                                            value: data.city_id
                                        }
                                    }
                                    onChange={(v) => {
                                        setData({
                                            ...data,
                                            city_id: v.value
                                        })
                                    }}
                                /></Td></Tr>
                                <Tr><Th>Facebook</Th><Td><Input type='url' name='facebook' variant={'outline'} borderWidth={'2px'} value={data.facebook_url} onChange={handleChange} /></Td></Tr>
                                <Tr><Th>Twitter</Th><Td><Input type='url' name='twitter' variant={'outline'} borderWidth={'2px'} value={data.twitter_url} onChange={handleChange} /></Td></Tr>
                                <Tr><Th>Instagram</Th><Td><Input type='url' name='instagram' variant={'outline'} borderWidth={'2px'} value={data.instagram_url} onChange={handleChange} /></Td></Tr>
                            </Tbody>
                        </Table>
                        <Button colorScheme='blue' onClick={save}>Save</Button>
                        <Box height={'500px'}></Box>
                    </VStack>
                </VStack>
            </Container>
        </Box>
    )
}

export default EditProfile
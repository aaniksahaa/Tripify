import { Avatar, Box, Button, Container, Input, Progress, Stack, Table, Tbody, Td, Textarea, Th, Tr, VStack } from '@chakra-ui/react'
import { getDownloadURL, ref, uploadBytesResumable } from "firebase/storage"
import React, { useEffect, useRef, useState } from 'react'
import { updateUser } from '../API'
import { storage } from '../Firebase'
import { useLocalStorage } from '../LocalStorage'
import Navbar2 from './Navbar2'

function ImageUploader({ setURL }) {
    const fileRef = useRef()
    const [file, setFile] = useState()
    const [percent, setPercent] = useState(0)
    const [uploading, setUploading] = useState(false)
    const [pp, setPP] = useState('')
    useEffect(() => {

    }, [])
    async function handleFileChange(e) {
        setFile(e.target.files[0])
        setPP(URL.createObjectURL(e.target.files[0]))
    }
    async function selectFile() {
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
                    setURL(url)
                })
            }
        )
    }

    async function uploadClick() {
        handleUpload()
    }
    return (
        <Box>
            <center>

                <Box>
                    {
                        pp !== '' && <img width={'100%'} src={pp} />
                    }
                    <br />
                    {
                        <Box>
                            <Progress width={'300px'} hasStripe size='sm' value={percent} />
                        </Box>
                    }
                    <br />
                </Box>
                <Stack direction={'row'}>
                    <Button size={'sm'} onClick={selectFile}>Select Image</Button>
                    {
                        file &&
                        <Button size={'sm'} onClick={uploadClick}>Upload</Button>
                    }
                </Stack>
                <Input onChange={handleFileChange} type='file' display={'none'} ref={fileRef} />
            </center>
        </Box>
    )
}

export default ImageUploader
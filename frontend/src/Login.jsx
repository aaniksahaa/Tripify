import React, { useEffect } from 'react'
import { getItem, setItem, useLocalStorage } from './LocalStorage'
import { getSingleUser } from './API'

function Login() {
    const [user, setUser] = useLocalStorage('tripify_user', {})
    async function load() {
        const u = await getSingleUser('1')
        setUser(u)
    }
    useEffect(() => {
        load()
    }, [])
    return (
        <div>Login</div>
    )
}

export default Login
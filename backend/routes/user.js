const express = require('express');
const { body, validationResult } = require('express-validator');
const { createUser, getSingleUser, updateUser, deleteUser, deleteUserPermanent, getUsers, handleFollow, handleUnFollow, getSingleUserByUsername, handleFavorite, handleRemoveFavorite } = require('../controllers/user');
const { getSingleUserProfile } = require('../controllers/profile');
const router = express.Router();

const check_unique_username = async (username) => {
    console.log('checking if unique username ', username)
    const user = await getSingleUserByUsername({ username: username })
    console.log(user)
    if(user == null){
        return true;
    }
    else{
        return false;
    }
}

const check_valid_email = (email) => {
    console.log('checking if valid email ', email)
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?$/;
    return emailRegex.test(email);
}

router.get('/:user_id', async (req, res, next) => {
    
    try {
        const user = await getSingleUser(req.params);
        console.log(user);
        res.json(user);
    } catch (err) {
        console.log(err);
        next(err);
    }
});

router.get('/:user_id/profile', async (req, res, next) => {
    
    try {
        req.query.user_id = req.params.user_id
        const user = await getSingleUserProfile(req.query);
        console.log(user);
        res.json(user);
    } catch (err) {
        console.log(err);
        next(err);
    }
});

router.get('/', async (req,res,next) => {
    try{
        const hotels = await getUsers(req.query)
        console.log(hotels)
        res.json(hotels)
    }
    catch(err){
        console.log(err)
        next(err)
    }
})

router.post('/', [
    body('username').notEmpty().withMessage('username is required'),
    body('password').notEmpty().withMessage('password is required'),
    body('email').notEmpty().withMessage('email is required'),
    body('name').notEmpty().withMessage('name is required'),
    body('dob').notEmpty().withMessage('dob is required')
], async (req, res, next) => {
    const result = validationResult(req);
    console.log(req.body);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }

    const is_unique_username = await check_unique_username(req.body.username);

    if( ! is_unique_username ){
        next({message : 'username already exists !'});
        return;
    }

    const is_valid_email = check_valid_email(req.body.email)

    if( ! is_valid_email ){
        next({message : 'email not valid !'});
        return;
    }

    try {
        const user = await createUser(req.body);
        res.json(user);
    } catch (error) {
        next(error);
    }
});

router.put('/', [
    body('user_id').notEmpty().withMessage('user_id is required')
], async (req, res, next) => {

    const result = validationResult(req);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }

    if(req.user !== undefined && req.user.user_id != req.params.user_id )
    {
        next({message : 'oops, hecker moment, nice try !'})
        return;
    }

    const user = await getSingleUser({user_id: req.body.user_id})

    const current_username = user.username

    console.log('current username ', current_username)

    if(req.body.username != current_username)
    {
        const is_unique_username = await check_unique_username(req.body.username);

        if( ! is_unique_username ){
            next({message : 'username already exists !'});
            return;
        }
    }

    const is_valid_email = check_valid_email(req.body.email)

    if( ! is_valid_email ){
        next({message : 'email not valid !'});
        return;
    }

    try {
        const user = await updateUser(req.body);
        res.json(user);
    } catch (error) {
        next(error);
    }
});

router.delete('/:user_id', async (req, res, next) => {
    const result = validationResult(req);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }

    if(req.user !== undefined && req.user.user_id != req.params.user_id )
    {
        next({message : 'oops, hecker moment, nice try !'})
        return;
    }

    try {
        const user = await deleteUser(req.params);
        res.json(user);
    } catch (error) {
        next(error);
    }
});

router.delete('/danger/:user_id', async (req, res, next) => {
    const result = validationResult(req);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }

    if(req.user !== undefined && req.user.user_id != req.params.user_id )
    {
        next({message : 'oops, hecker moment, nice try !'})
        return;
    }

    try {
        const user = await deleteUserPermanent(req.params);
        res.json(user);
    } catch (error) {
        next(error);
    }
});

router.post('/:follower_id/follow/:followee_id', async (req, res, next) => {
    const result = validationResult(req)
    console.log(req.params)
    if(result.isEmpty() === false) {
        return res.send({errors: result.array()})
    }

    if(req.user !== undefined && req.user.user_id != req.params.user_id )
    {
        next({message : 'oops, hecker moment, nice try !'})
        return;
    }

    req.params.follower_id = req.user ? req.user.user_id : 1;

    try { 
        const follow = await handleFollow(req.params)
        res.json(follow)
    }
    catch(error) {
        next(error)
    }
})

router.delete('/:follower_id/follow/:followee_id', async (req, res, next) => {
    const result = validationResult(req)
    console.log(req.params)
    if(result.isEmpty() === false) {
        return res.send({errors: result.array()})
    }

    if(req.user !== undefined && req.user.user_id != req.params.user_id )
    {
        next({message : 'oops, hecker moment, nice try !'})
        return;
    }

    try { 
        const follow = await handleUnFollow(req.params)
        res.json(follow)
    }
    catch(error) {
        next(error)
    }
})

router.post('/:user_id/favorite/:object_id', async (req, res, next) => {
    const result = validationResult(req)
    console.log(req.body)
    if(result.isEmpty() === false) {
        return res.send({errors: result.array()})
    }

    if(req.user !== undefined && req.user.user_id != req.params.user_id )
    {
        next({message : 'oops, hecker moment, nice try !'})
        return;
    }

    req.params.object_type = req.body.object_type

    try { 
        const favorite = await handleFavorite(req.params)
        res.json(favorite)
    }
    catch(error) {
        console.log(error)
        next(error)
    }
})

router.delete('/:user_id/favorite/:object_id', async (req, res, next) => {
    const result = validationResult(req)
    console.log(req.body)
    if(result.isEmpty() === false) {
        return res.send({errors: result.array()})
    }

    if(req.user !== undefined && req.user.user_id != req.params.user_id )
    {
        next({message : 'oops, hecker moment, nice try !'})
        return;
    }

    req.params.object_type = req.body.object_type

    try { 
        const favorite = await handleRemoveFavorite(req.params)
        res.json(favorite)
    }
    catch(error) {
        console.log(error)
        next(error)
    }
})

module.exports = router;

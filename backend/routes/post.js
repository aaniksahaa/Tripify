const express = require('express');
const { validationResult, body } = require('express-validator');
const { getSinglePost, getPosts, createPost, updatePost, deletePost, handleReact, handleRemoveReact, getSinglePostDetails } = require('../controllers/post');
const router = express.Router();

router.get('/:post_id', async (req, res, next) => {
    try {
        const post = await getSinglePost(req.params);
        console.log(post);
        res.json(post);
    } catch (err) {
        console.log(err);
        next(err);
    }
});

router.get('/details/:post_id', async (req, res, next) => {
    try {
        const post = await getSinglePostDetails(req.params);
        console.log(post);
        res.json(post);
    } catch (err) {
        console.log(err);
        next(err);
    }
});

router.get('/', async (req, res, next) => {
    try {
        const posts = await getPosts(req.query);
        console.log(posts);
        res.json(posts);
    } catch (err) {
        console.log(err);
        next(err);
    }
});

router.post('/', async (req, res, next) => {
    const result = validationResult(req);
    console.log(req.body);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }

    req.body.user_id = req.user ? req.user.user_id : 1;

    try {
        req.body.user_id = req.user ? req.user.user_id : 1;
        const post = await createPost(req.body);
        res.json(post);
    } catch (error) {
        next(error);
    }
});

router.put('/', [
    body('post_id').notEmpty().withMessage('post_id is required')    
], async (req, res, next) => {
    const result = validationResult(req);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }

    req.body.user_id = req.user ? req.user.user_id : 1;

    const post = await getSinglePost({post_id: req.body.post_id})

    if(req.body.user_id != post.user_id)
    {
        next({message : 'oops, hecker moment, nice try !'})
        return;
    } 

    try {
        const post = await updatePost(req.body);
        res.json(post);
    } catch (error) {
        next(error);
    }
});

router.delete('/:post_id', async (req, res, next) => {
    const result = validationResult(req);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }

    user_id = req.user ? req.user.user_id : 1;

    const post = await getSinglePost({post_id: req.params.post_id})

    if(user_id != post.user_id)
    {
        next({message : 'oops, hecker moment, nice try !'})
        return;
    } 

    try {
        const post = await deletePost(req.params);
        res.json(post);
    } catch (error) {
        next(error);
    }
});

router.post('/:post_id/react/:react_type_id', async (req, res, next) => {

    const result = validationResult(req)

    console.log(req.params)
    if(result.isEmpty() === false) {
        return res.send({errors: result.array()})
    }

    req.params.user_id = req.user ? req.user.user_id : 1;

    react_types = ['like','love','haha','care','wow','sad']

    react_type_id = req.params.react_type_id 

    if(react_type_id<=0 || react_type_id > react_types.length)
    {
        next({ message : 'react_type_id out of range'})
        return;
    }

    req.params.react_type = react_types[react_type_id-1]

    try { 
        const reaction = await handleReact(req.params)
        res.json(reaction)
    }
    catch(err) {
        console.log(err)
        next(err)
    }
})

router.delete('/:post_id/react', async (req, res, next) => {

    const result = validationResult(req)

    console.log(req.params)
    if(result.isEmpty() === false) {
        return res.send({errors: result.array()})
    }

    req.params.user_id = req.user ? req.user.user_id : 1;

    try { 
        const reaction = await handleRemoveReact(req.params)
        res.json(reaction)
    }
    catch(err) {
        console.log(err)
        next(err)
    }
})

module.exports = router;

const express = require('express');
const { validationResult } = require('express-validator');
const { getSingleReview, getReviews, createReview, updateReview, deleteReview } = require('../controllers/review');
const router = express.Router();

router.get('/:review_id', async (req, res, next) => {
    try {
        const review = await getSingleReview(req.params);
        console.log(review);
        res.json(review);
    } catch (err) {
        console.log(err);
        next(err);
    }
});

router.get('/', async (req, res, next) => {
    try {
        const reviews = await getReviews(req.query);
        console.log(reviews);
        res.json(reviews);
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

    rating = req.body.rating

    if(rating < 1 || rating > 5)
    {
        next({message: 'rating should be between 1 and 5'})
        return;
    }

    req.body.user_id = req.user ? req.user.user_id : 1;

    try {
        const review = await createReview(req.body);
        res.json(review);
    } catch (error) {
        next(error);
    }
});

router.put('/', async (req, res, next) => {
    const result = validationResult(req);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }

    user_id = req.user ? req.user.user_id : 1;

    const review = await getSingleReview({review_id: req.body.review_id})

    if(user_id != review.user_id)
    {
        next({message : 'oops, hecker moment, nice try !'})
        return;
    } 

    try {
        const review = await updateReview(req.body);
        res.json(review);
    } catch (error) {
        next(error);
    }
});

router.delete('/:review_id', async (req, res, next) => {
    const result = validationResult(req);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }

    user_id = req.user ? req.user.user_id : 1;

    const review = await getSingleReview({review_id: req.params.review_id})
    
    if(user_id != review.user_id)
    {
        next({message : 'oops, hecker moment, nice try !'})
        return;
    } 

    try {
        const review = await deleteReview(req.params);
        res.json(review);
    } catch (error) {
        next(error);
    }
});

module.exports = router;

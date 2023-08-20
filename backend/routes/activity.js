const express = require('express');
const { validationResult } = require('express-validator');
const { getSingleActivity, getActivities, createActivity, updateActivity, deleteActivity } = require('../controllers/activity');
const router = express.Router();

router.get('/:activity_id', async (req, res, next) => {
    try {
        const activity = await getSingleActivity(req.params);
        console.log(activity);
        res.json(activity);
    } catch (err) {
        console.log(err);
        next(err);
    }
});

router.get('/', async (req, res, next) => {
    try {
        const activities = await getActivities(req.query);
        console.log(activities);
        res.json(activities);
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
    try {
        req.body.creator_user_id = req.user ? req.user.user_id : 1;
        const activity = await createActivity(req.body);
        res.json(activity);
    } catch (error) {
        next(error);
    }
});

router.put('/', async (req, res, next) => {
    const result = validationResult(req);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }
    try {
        const activity = await updateActivity(req.body);
        res.json(activity);
    } catch (error) {
        next(error);
    }
});

router.delete('/:activity_id', async (req, res, next) => {
    const result = validationResult(req);
    if (result.isEmpty() === false) {
        return res.send({ errors: result.array() });
    }
    try {
        const activity = await deleteActivity(req.params);
        res.json(activity);
    } catch (error) {
        next(error);
    }
});

module.exports = router;

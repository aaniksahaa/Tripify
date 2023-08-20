const express = require('express');
const { getFeed } = require('../controllers/feed');
const router = express.Router();

router.get('/', async(req, res, next) => {
    try{
        req.query.user_id = req.user ? req.user.user_id : 1
        const feed = await getFeed(req.query)
        res.json(feed)
    }
    catch(err)
    {
        console.log(err)
        next(err)
    }
})

module.exports = router;
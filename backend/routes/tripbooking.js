const express = require('express');
const { validationResult, body } = require('express-validator');
const {
    getSingleTripBooking,
    createTripBooking,
    deleteTripBooking,
    getTripBookingsFromUserId,
    paymentTripBooking,
    completeTripBooking,
    processTripBooking,
    deleteTripBookingPermanent,
    getTripBookings
} = require('../controllers/tripbooking');

const router = express.Router();

router.get('/:trip_id', async (req, res, next) => {

    req.params.user_id = req.user ? req.user.user_id : 1;

    try {

        const tripBooking = await getSingleTripBooking(req.params);
        console.log(tripBooking);

        if (!tripBooking) {
            return res.status(404).json({ message: 'TripBooking not found' });
        }
        res.json(tripBooking);
    } catch (err) {
        console.log(err);
        next(err);
    }
});

router.get('/', async (req,res,next) => {

    req.query.user_id = req.user ? req.user.user_id : 1;

    try{
        const tripbookings = await getTripBookings(req.query)
        console.log(tripbookings)
        res.json(tripbookings)
    }
    catch(err){
        console.log(err)
        next(err)
    }
})

router.post('/', [
    body('trip_id').notEmpty().withMessage('trip_id is required')    
], async (req, res, next) => {
    const result = validationResult(req);
    if (!result.isEmpty()) {
        return res.status(400).json({ errors: result.array() });
    }

    req.body.user_id = req.user ? req.user.user_id : 1;

    try {
        const tripBooking = await createTripBooking(req.body);
        res.json(tripBooking);
    } catch (error) {
        next(error);
    }
});

router.put('/payment/', [
    body('trip_id').notEmpty().withMessage('trip_id is required')    
], async (req, res, next) => {
    const result = validationResult(req);
    if (!result.isEmpty()) {
        return res.status(400).json({ errors: result.array() });
    }

    req.body.user_id = req.user ? req.user.user_id : 1;

    try {
        const tripBooking = await paymentTripBooking(req.body);
        res.json(tripBooking);
    } catch (error) {
        next(error);
    }
});

router.put('/onlyadmin/processed/', [
    body('user_id').notEmpty().withMessage('user_id is required'),
    body('trip_id').notEmpty().withMessage('trip_id is required')    
], async (req, res, next) => {

    const result = validationResult(req);
    if (!result.isEmpty()) {
        return res.status(400).json({ errors: result.array() });
    }

    try {
        const tripBooking = await processTripBooking(req.body);
        res.json(tripBooking);
    } catch (error) {
        next(error);
    }
});

router.put('/onlyadmin/complete/', [
    body('user_id').notEmpty().withMessage('user_id is required'),
    body('trip_id').notEmpty().withMessage('trip_id is required')    
], async (req, res, next) => {
    const result = validationResult(req);
    if (!result.isEmpty()) {
        return res.status(400).json({ errors: result.array() });
    }

    try {
        const tripBooking = await completeTripBooking(req.body);
        res.json(tripBooking);
    } catch (error) {
        next(error);
    }
});

router.delete('/:trip_id', async (req, res, next) => {
    const result = validationResult(req);
    if (!result.isEmpty()) {
        return res.status(400).json({ errors: result.array() });
    }

    req.params.user_id = req.user ? req.user.user_id : 1;

    try {
        const tripBooking = await deleteTripBooking(req.params);
        res.json(tripBooking);
    } catch (error) {
        next(error);
    }
});

router.delete('/danger/:trip_id', async (req, res, next) => {
    const result = validationResult(req);
    if (!result.isEmpty()) {
        return res.status(400).json({ errors: result.array() });
    }

    req.params.user_id = req.user ? req.user.user_id : 1;

    try {
        const tripBooking = await deleteTripBookingPermanent(req.params);
        res.json(tripBooking);
    } catch (error) {
        next(error);
    }
});

module.exports = router;

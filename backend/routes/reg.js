const express = require('express');
const { body, validationResult } = require('express-validator');
const { createUser, getSingleUserByUsername } = require('../controllers/user');
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

module.exports = router;
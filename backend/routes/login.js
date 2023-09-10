const router = require('express').Router()
const { body, validationResult } = require('express-validator')
const { getToken } = require('../controllers/login')

router.post('/', [
    body('username').notEmpty(),
    body('password').notEmpty()
], async (req, res, next) => {
    console.log(req.body)
    const result = validationResult(req)
    if(result.isEmpty() === false) {
        return res.send({errors: result.array()})
    }
    
    try {
        const token = await getToken(req.body)
        if(token == null)
        {
            next({message: 'credentials invalid'});
            return;
        }
        const {user,accessToken} = token
        
        if(accessToken === null) {
            res.send('unauthorized')
        }
        else {
            console.log(accessToken,user)
            res.json({
                token: accessToken,
                user : user
            });
        }
    }
    catch(err) {
        console.log(err)
        next(err)
    }
});

module.exports = router;
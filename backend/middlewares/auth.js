const jwt = require('jsonwebtoken')

const isAuthorized = (req, res, next) => {
    const token = req.headers.authorization
    
    if (token) {
        jwt.verify(token, process.env.SECRET, (err, user) => {
            if (err) {
                return res.sendStatus(403)
            }
            // hehe should check if the user exists XD
            req.user = user
            console.log(__filename, token, user)
            next()
        });
    } else {
        res.sendStatus(401)
    }
}

module.exports = isAuthorized
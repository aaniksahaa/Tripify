const express = require('express')
const router = express.Router()
const morgan = require('morgan')
const cors = require('cors') 

require('dotenv').config()

const db = require('./db/db')
db.startup()

// Routes

const demoRouter = require('./routes/demo')
const tripRouter = require('./routes/trip')
const hotelRouter = require('./routes/hotel')
const restaurantRouter = require('./routes/restaurant')
const cityRouter = require('./routes/city')
const userRouter = require('./routes/user')
const activityRouter = require('./routes/activity')
const flightRouter = require('./routes/flight')
const destinationRouter = require('./routes/destination')
const reviewRouter = require('./routes/review')
const tripbookingRouter = require('./routes/tripbooking')
const miniRouter = require('./routes/mini')
const loginRouter = require('./routes/login')
const postRouter = require('./routes/post')
const commentRouter = require('./routes/comment')
const feedRouter = require('./routes/feed')
const statRouter = require('./routes/stat')

// Errorhandler

const errorhandler = require('./middlewares/errorhandler')

// Declare and configure the app

const app = express()

app.use(morgan('dev'))
app.use(express.json())
app.use(
    cors({
      origin: '*',
      methods: "GET,POST,PUT,DELETE, PATCH",
      credentials: true,
      maxAge: 36000,
    })
);
  
// Link routes to routers, demo url = 'api/v1/demo?data=anik'

app.use('/api/v1/demo', demoRouter)
app.use('/api/v1/trip', tripRouter)
app.use('/api/v1/hotel', hotelRouter)
app.use('/api/v1/restaurant', restaurantRouter)
app.use('/api/v1/city', cityRouter)
app.use('/api/v1/user', userRouter)
app.use('/api/v1/activity', activityRouter)
app.use('/api/v1/flight', flightRouter)
app.use('/api/v1/destination', destinationRouter)
app.use('/api/v1/review', reviewRouter)
app.use('/api/v1/tripbooking', tripbookingRouter)
app.use('/api/v1/mini', miniRouter)
app.use('/api/v1/login', loginRouter)
app.use('/api/v1/post', postRouter)
app.use('/api/v1/comment', commentRouter)
app.use('/api/v1/feed', feedRouter)
app.use('/api/v1/stat', statRouter)

// Use errorhandler

app.use(errorhandler)

// Set up the connection

const port = process.env.PORT || 3000
app.listen(port, console.log(`Listening on port ${port}`))
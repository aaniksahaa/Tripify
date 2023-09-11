
require('dotenv').config()

console.log(process.env.MAIL_ID)
console.log(process.env.MAIL_PASS)

const nodemailer = require('nodemailer');

// Create a transporter
let transporter = nodemailer.createTransport({
  service: 'gmail', // Use your email service (e.g., 'smtp.gmail.com' for custom SMTP)
  auth: {
    user: process.env.MAIL_ID, // Your email address
    pass: process.env.MAIL_PASS // Your email password or app-specific password for Gmail
  }
});

// Configure the email
let mailOptions = {
  from: {
    name: 'Tripify Admin',
    address: 'a@gmail.com'
  },
  to: 'aaniksahaa.2001@gmail.com', // Recipient's email address
  subject: 'Hello from Node Mailer',
  text: 'Hello, this is a test email from Node Mailer!'
};

transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      return console.log(error);
    }
    console.log('Email sent: ' + info.response);
  });
  

const express = require('express');
const PORT = process.env.PORT || 3000;
const DATABASE_URL = process.env.DATABASE_URL;
const app = express();
const bcrypt = require('bcryptjs');
const cors = require('cors');
const bodyParser = require('body-parser');
const knex = require('knex');
const register = require('./controllers/register');
const imageBit = require('./controllers/imageBit');
const signin = require('./controllers/signin');
const profile = require('./controllers/profile');
const image = require('./controllers/image');
console.log(DATABASE_URL);

const db = knex({
	client: 'pg',
	connection: {
		connectionString: DATABASE_URL,
		ssl: true,
	},
  });

// MIDDLEWARE
app.use( express.json() );
app.use( cors() );
app.use(bodyParser.json());




// SIGNOUT
app.post('/signout', (req, res) => {
	// Clear the user's session
	req.session = null;
	res.status(200).json({ message: 'Signed out successfully' });
  });


// GET - HOMEPAGE
app.get('/', (req, res) => { res.send('it is working') });

// GET - PROFILE
app.get('/profile/:id', profile.handleProfileGet(db));

// GET - IMAGE RANKING
app.put('/image-ranking',(req, res) => { image.handleImage(req, res, db) });

// POST - IMAGE BIT
app.post('/image-bit', (req, res) => { imageBit.handleApiCall(req, res) });

// POST REGISTER
app.post('/register', (req, res) => { register.handleRegister(req, res, db, bcrypt) });

// POST SIGNIN
app.post('/signin', signin.handleSignin(db, bcrypt));


app.listen(
	PORT,
	console.log(`it's at alive on http://localhost:${PORT}`)
	);



// / --> res == this is working
// /signin --> POST = success/fail
// /register --> POST = user 
// /profile/userId --> PUT = user 
// /image-ranking --> GET = user image count
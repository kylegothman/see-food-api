const express = require('express');
const PORT = 3000;
const app = express();
const bcrypt = require('bcryptjs');
const cors = require('cors');
const bodyParser = require('body-parser');
const knex = require('knex');

const db = knex({
  client: 'pg',
  connection: {
    host : '127.0.0.1',
    user : '',
    password : '',
    database : 'see-food-db'
  }
});

// MIDDLEWARE
app.use( express.json() );
app.use( cors() );
app.use(bodyParser.json());


// GET - HOMEPAGE
app.get('/profile/:id', (req, res) => {
  const { id } = req.params;
  db.select('*').from('users').where({id})
    .then(user => {
      if (user.length) {
        res.json(user[0])
      } else {
        res.status(400).json('Not found')
      }
    })
    .catch(err => res.status(400).json('user not found'))
})

// IMAGE RANKINGs
app.put('/image-ranking', async (req, res) => {
	try {
		const { id } = req.body;
		const updatedScore = await db('users')
			.where('id', '=', id)
			.increment('score', 1)
			.returning('score');
		res.json(updatedScore[0].score);
	} catch (error) {
		res.status(400).json('Unable to get score');
	}
});


// POST REGISTER
app.post('/register', async (req, res) => {
	try {
		const { name, username, password } = req.body.data;
		const hash = bcrypt.hashSync(password);
		const insertedUsername = await db.transaction(async (trx) => {
			const loginUsername = await trx('login')
				.insert({
					hash: hash,
					username: username,
				})
				.returning('username');
			const user = await trx('users')
				.insert({
					username: loginUsername[0],
					name: name,
					joined: new Date(),
				})
				.returning('*');
			return user[0].username;
		});
		res.json(insertedUsername);
	} catch (error) {
		res.status(400).json('Unable to register');
	}
});


// POST SIGNIN
app.post('/signin', (req, res) => {
	const { username, password } = req.body.data;
	db.select('username', 'hash').from('login')
	  .where('username', '=', username)
	  .then(data => {
		const isValidPassword = bcrypt.compareSync(password, data[0].hash);
		if (isValidPassword) {
		  return db.select('*').from('users')
			.where('username', '=', username)
			.then(user => {
			  res.json(user[0])
			})
			.catch(err => res.status(400).json('unable to get user'))
		} else {
		  res.status(400).json('wrong credentials')
		}
	  })
	  .catch(err => res.status(400).json('wrong credentials'))
  })



app.listen(
	PORT,
	console.log(`it's at alive on http://localhost:${PORT}`)
	);

// / --> res == this is working
// /signin --> POST = success/fail
// /register --> POST = user 
// /profile/userId --> PUT = user 
// /image-ranking --> GET = user image count
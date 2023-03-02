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
    user : 'kylegothman',
    password : 'krg343',
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


// PUT - UPDATE RANKING
app.put('/image-ranking', (req, res) => {
	const { id } = req.body;

	db('users').where('id', '=', id)
  	.increment('score', 1)
  	.returning('score')
  	.then(score => {
    res.json(score[0].score);
  })
  .catch(err => res.status(400).json('unable to get score'))
})


// POST REGISTER
app.post('/register', (req, res) => {
	const { name, username, password } = req.body.data;
	const hash = bcrypt.hashSync(password);
	  db.transaction(trx => {
		trx.insert({
		  hash: hash,
		  username: username
		})
		.into('login')
		.returning('username')
		.then(loginUsername => {
		  return trx('users')
			.returning('*')
			.insert({
			  username: loginUsername[0].username,
			  name: name,
			  joined: new Date()
			})
			.then(user => {
			  res.json(user[0]);
			})
		})
		.then(trx.commit)
		.catch(trx.rollback)
	  })
	  .catch(err => res.status(400).json('unable to register'))
  })
  


//POST SIGNIN
app.post('/signin', (req, res) => {
  db.select('username', 'hash').from('login')
    .where('username', '=', req.body.data.username)
    .then(data => {
      const isValid = bcrypt.compareSync(req.body.data.password, data[0].hash);
      if (isValid) {
        return db.select('*').from('users')
          .where('username', '=', req.body.data.username)
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
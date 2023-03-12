const handleSignin = (db, bcrypt) => (req, res) => {
    const { username, password } = req.body.data;
    if (!username || !password) {
      return res.status(400).json('Incorrect form submission');
    }
    db.select('*').from('login')
      .where('username', '=', username)
      .then(data => {
        const isValidPassword = bcrypt.compareSync(password, data[0].hash);
        if (isValidPassword) {
          return db.select('*').from('users')
            .where('username', '=', username)
            .then(user => {
              res.json(user[0]);
            })
            .catch(err => res.status(400).json('unable to get user'));
        } else {
          res.status(401).json('wrong credentials');
        }
      })
      .catch(err => res.status(401).json('wrong credentials'));
  };
  

module.exports = {
    handleSignin: handleSignin
}
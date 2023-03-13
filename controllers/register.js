const handleRegister = async (req, res, db, bcrypt) => {
    const { name, username, password } = req.body.data;
    if (!name || !username || !password) {
        return res.status(400).json('Incorrect form submission');
    }
	try {
		const { name, username, password } = req.body.data;
		const hash = bcrypt.hashSync(password);
		const insertedUser = await db.transaction(async (trx) => {
			const loginUsername = await trx('login')
				.insert({
					hash: hash,
					username: username,
				})
				.returning('username');
			const user = await trx('users')
				.insert({
					username: loginUsername[0].username,
					name: name,
					joined: new Date(),
				})
				.returning('*');
			return user[0];
		});
		res.json(insertedUser);
	} catch (error) {
		res.status(400).json('Unable to register');
	}
};

module.exports = {
    handleRegister,
}
const handleImage =  async (req, res, db) => {
    try {
        const { id, points } = req.body;
        const updatedScore = await db('users')
            .where('id', '=', id)
            .increment('score', points)
            .returning('score');
        res.json(updatedScore[0].score);
    } catch (error) {
        res.status(400).json('Unable to get score');
    }

    };
  
  module.exports = {
    handleImage
  };
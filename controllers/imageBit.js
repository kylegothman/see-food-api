
const handleApiCall = async (req, res) => {
    // console.log('req.body', req.body.image.content)
    const raw = JSON.stringify({
        "user_app_id": {
        "user_id": ``,
        "app_id": ``
        },
        "inputs": [
            {
                "data": {
                    "image": {
                        "base64": req.body.image.content
                    }
                }
            }
        ]
    });


    const requestOptions = {
        method: 'POST',
        headers: {
        'Accept': 'application/json',
        'Authorization': `Key `,
        },
        body: raw
    };
    // console.log(requestOptions)

    try {
        // console.log(requestOptions)
        const response = await fetch('https://api.clarifai.com/v2/models/food-item-recognition/versions/1d5fd481e0cf4826aa72ec3ff049e044/outputs', requestOptions);
        const data = await response.json();
        // console.log(data.outputs[0].data.concepts[0].name);
        res.json(data);
        // console.log('response sent', data);
      } catch (err) {
        // console.error('Unable to work with API:', err.message);
        res.status(400).json('Unable to work with API');
      }
    };
    
module.exports = {
    handleApiCall
} 
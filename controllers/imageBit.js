
const { ClarifaiStub, grpc } = require("clarifai-nodejs-grpc");

const stub = ClarifaiStub.grpc();

// This will be used by every Clarifai endpoint call
const metadata = new grpc.Metadata();
metadata.set("authorization", "Key c2e851ddbb4446bda9fc93146215a0a8");

const handleApiCall = async (req, res) => {
    // console.log('req.body', req.body.image.content)

    stub.PostModelOutputs(
        {
            user_app_id: {
                "user_id": 'k-goth',
                "app_id": 'SeeFood'
            },
            model_id: 'food-item-recognition',
            inputs: [
                { data: { image: { base64: req.body.image.content } } }
            ]
        },
        metadata,
        (err, response) => {
            if (err) {
                throw new Error(err);
            }
    
            if (response.status.code !== 10000) {
                throw new Error("Post model outputs failed, status: " + response.status.description);
            }
    
            // Since we have one input, one output will exist here
            // const output = response.outputs[0];
    
            // console.log("Predicted concepts:");
            // for (const concept of output.data.concepts) {
            //     console.log(concept.name + " " + concept.value);
            // }
            res.json(response)
        }
    );
}

module.exports = {
    handleApiCall
} 
// index.js
const AWS = require("aws-sdk");
const sns = new AWS.SNS();

exports.handler = async (event) => {
    const body = JSON.parse(event.body);
    const message = `New contact form submission: ${JSON.stringify(body)}`;

    await sns
        .publish({
            Message: message,
            TopicArn: process.env.SNS_TOPIC_ARN,
        })
        .promise();

    return {
        statusCode: 200,
        body: JSON.stringify({ message: "Form received successfully!" }),
    };
};

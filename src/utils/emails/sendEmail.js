const nodemailer = require('nodemailer')
const { google } = require("googleapis");

const { 
	EMAIL_USERNAME, 
	OAUTH_CLIENT_ID, 
	OAUTH_CLIENT_SECRET, 
	OAUTH_REFRESH_TOKEN 
} = require('../../config')

const OAuth2 = google.auth.OAuth2;

/**
 * set up Google email transporter.
 */
const createTransporter = async () => {
    // 1
	const oauth2Client = new OAuth2(
		OAUTH_CLIENT_ID,
		OAUTH_CLIENT_SECRET,
		"https://developers.google.com/oauthplayground"
	);
    
    // 2
	oauth2Client.setCredentials({
		refresh_token: OAUTH_REFRESH_TOKEN,
	});
    
    const accessToken = await new Promise((resolve, reject) => {
        oauth2Client.getAccessToken((err, token) => {
			if (err) {
				console.log(err);
			}
          	resolve(token);
        });
    });
    
    // 3
    const transporter = nodemailer.createTransport({
        service: "gmail",
        auth: {
			type: "OAuth2",
			user: EMAIL_USERNAME,
			accessToken,
			clientId: OAUTH_CLIENT_ID,
			clientSecret: OAUTH_CLIENT_SECRET,
			refreshToken: OAUTH_REFRESH_TOKEN,
        },
    });
    
    // 4
    return transporter;
};

/**
 * Send Email.
 */
const sendEmail = async (emailDetails) => {
    let mailOption = {
        from: 'Glow Capture',
        to: emailDetails.to,
        subject: emailDetails.subject,
        html: emailDetails.message
    }

    let emailTransporter = await createTransporter();

    await emailTransporter.sendMail(mailOption)
}

module.exports = sendEmail
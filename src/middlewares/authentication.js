const jwt = require("jsonwebtoken");

const { ACCESS_TOKEN_SECRET } = require("../config");

/**
 * Authenticate agents by verifing JWT validity.
 */
const agent = (req, res, next) => {
	const token = req.header("x-auth-token");
	if (!token)
		return res.status(401).json({ error: {message: "No token, authentication denied", status:401} });

	try {
		const decoded = jwt.verify(token, ACCESS_TOKEN_SECRET);
		req.agent = decoded.id;
		next();
	} catch (err) {
		return res.status(400).json({error: {message: "Token is not valid", status: 400} });
	}
};

/**
 * Authenticate admin by verifing session.
 */
const admin = (req, res, next) => {
	if (!req.session.adminId) {
        return res.redirect('/login')
    }
	next();
}

module.exports = {
	agent,
	admin
};
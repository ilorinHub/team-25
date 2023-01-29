const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");

const Agent = require("./model");

/**
 *  Login an adent
 * @param {string} email
 * @param {string} password
 */
const login = async (email, password) => {
	try {
		// Check for existing user
		const agent = await User.findOne({ email });
		if (!agent) throw Error("Agent does not exist");

		const validPassword = await agent.validPassword(password);
		if (!validPassword) throw Error("Invalid credentials");

		const accessToken = jwt.sign(
			{ id: user._id, tokenType: "authentication" },
			ACCESS_TOKEN_SECRET,
			{ expiresIn: 3600 }
		);
		if (!accessToken) throw Error("Could not sign access token");

		return {
			accessToken: accessToken,
			agent: {
				id: agent._id,
				firstname: agent.firstname,
				lastname: agent.lastname,
				email: agent.email,
			},
		};
	} catch (error) {
		if (error.message === "Agent does not exist")
			return { error: { message: error.message, status: 404 } };

		if (error.message === "Invalid credentials")
			return { error: { message: error.message, status: 401 } };

		return { error: { message: error.message, status: 500 } };
	}
};

module.exports = {
    login
}
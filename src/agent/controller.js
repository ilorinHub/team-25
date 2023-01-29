const { Router } = require('express');
const { login } = require('./service');


const router = Router();

/**
 * @route           POST api/agent/login
 * @description     Login user
 * @access          Public
 */
router.post("/login", async (req, res) => {
	const { email, password } = req.body;

	//Validation of fields
	if (!email || !password)
		return res.status(400).json({ error: { message: "Please enter all fields", status: 400 } });

	const loginRes = await login(email, password);

	if (loginRes.error) {
		return res.status(loginRes.error.status).json({ error: loginRes.error });
	}

	return res.status(200).json(loginRes);
});

module.exports = router
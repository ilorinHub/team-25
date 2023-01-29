const { Router } = require('express');
const auth = require('../middlewares/authentication')
const upload = require('../middlewares/imageUpload')
const { createProperty, getProperties } = require('./service');

const router = Router();

/**
 * @route   		POST api/property/upload-image
 * @description     Upload Property Image
 * @access          Private
 */
router.post("/upload-image", auth.agent, upload.single('avatar'), async (req, res) => {
	return res.status(200).json({imageURL: req.file.path});
})

/**
 * @route   		POST api/property/
 * @description     Create a property
 * @access          Private
 */
router.post("/", auth.agent, async (req, res) => {
	const {zone, lga, buildingType, numberOfRooms, taxPayable, address, imageURL} = req.body;
	const capturedBy = req.agent

	if (!zone || !lga || !buildingType || !numberOfRooms || !taxPayable || !address || !imageURL) return res.status(400).json({ msg: 'Please enter all required fields'})

	const createPropertyRes = await createProperty(zone, lga, buildingType, numberOfRooms, taxPayable, address, imageURL, capturedBy)
	if (createPropertyRes.error) return res.json({ error: createPropertyRes.error })

	return res.status(200).json(createPropertyRes);
})

/**
 * @route   		Get api/property/
 * @description     Get properties captured by an agent
 * @access          Private
 */
router.get('/', auth.agent, async (req, res) => {
	const agentId = req.agent

	const getPropertiesRes = await getProperties(agentId)
	if (getPropertiesRes.error) return res.json({ error: getPropertiesRes})

	return res.status(200).json(getPropertiesRes);
})

module.exports = router
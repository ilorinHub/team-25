const Property = require('./model')

/**
 * Create A Property
 * @param {string} zone
 * @param {string} lga
 * @param {string} buildingType
 * @param {string} numberOfRooms
 * @param {string} taxPayable
 * @param {string} address
 * @param {string} imageURL
 * @param {string} capturedBy
 */
const createProperty = async (zone, lga, buildingType, numberOfRooms, taxPayable, address, imageURL, capturedBy) => {
    try {
		const property = new Property({
			zone, lga, buildingType, numberOfRooms, taxPayable, address, imageURL, capturedBy
		});

		await property.save();
		
		return {
			message: 'Property Created Successfully',
		}
    } catch (error) {
        console.log(error);
		return { error: {message: 'An error Occured try again'} }
    }
}

/**
 * @param {string} agentId
 */
const getProperties = async (agentId) => {
	try {
		const properties = Property.find({capturedBy: agentId})

		return properties
	} catch (error) {
		console.log(error);
		return { error: {message: 'An error Occured try again'} }
	}
}

module.exports = {
    createProperty,
	getProperties
}
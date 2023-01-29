const bcrypt = require('bcryptjs')

const Admin = require('./model')
const Agent = require('../agent/model')
const sendEmail = require('../utils/emails/sendEmail')
const { createAgentEmailDetails } = require('../utils/emails/emailDetails')
const generatePassword = require('../utils/passwordGenerator')


/**
 *  Login an Admin
 * @param {string} email
 * @param {string} password
 */
const login = async (email, password) => {
    try {
        const admin = await Admin.findOne({email})
        const validPassword = await admin.validPassword(password);
        if (validPassword) {
            return admin
        }
        else {
            throw Error("Invalid credentials");
        }
    } catch (error) {
        console.log(error.message)
    }

}

/**
 *  Update Admin Password
 * @param {string} adminId
 * @param {string} oldPassword
 * @param {string} newPassword
 * @param {string} confirmNewPassword
 */
const updatePassword = async (adminId, oldPassword, newPassword, confrimNewPassword) => {
    try {
        const admin = await Admin.findOne({_id: adminId})
        const oldPasswordIsValid = await admin.validPassword(oldPassword)

        if (!oldPasswordIsValid) {
            return {
                message: "Old Password isn't valid"
            }
        }

        if (newPassword !== confrimNewPassword) {
            return {
                message: "Password Confirmation doesn't match the password"
            }
        }

        await admin.setPassword(newPassword)
        await admin.save()

        return { message: "Password Update Successful" };

    } catch (error) {

    }
}

/**
 *  Create an Agent
 * @param {string} email
 * @param {string} firstname
 * @param {string} lastname
 * @param {string} host
 */
const createAgent = async (email, firstname, lastname, host) => {
    try {
        const agent = await Agent.findOne({email});
        if (agent) {
            return {message: 'Agent with the email already exist'};
        }

        const newAgent = new Agent({
            email,
            firstname,
            lastname
        });

        const password = generatePassword(10);

        await newAgent.setPassword(password);
        await newAgent.save();

        mailResp = await sendEmail(createAgentEmailDetails(`${firstname} ${lastname}`, email, password, host));
		if (!mailResp) throw Error(mailResp);

        return { message: 'Agent created successfully. Login Credentians have benn sent to the registered email.'};

    } catch (error) {
        console.log(error)
        if (error.message === 'Agent with the email already exist') {
            return {message: 'Agent with the email already exist'}
        }

        return {message: 'An error occured. Please Try again'}
    }
}

/**
 * Get all agents
 */
const getAgents = async () => {
    try {
        const agents = await Agent.find()

        return agents
    } catch (error) {
        console.log(error)
    }
}

module.exports = {
    login,
    updatePassword,
    createAgent,
    getAgents
}
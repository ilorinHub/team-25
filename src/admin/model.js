const mongoose = require('mongoose')
const bcrypt = require('bcryptjs')


const AdminSchema = new mongoose.Schema(
    {
        email: {
            type: String,
            required: true,
            unique: true
        },
        name: {
            type: String,
            required: true
        },
        password: {
            type: String,
            required: true
        }
    },
    {
        timestamps: true
    }
)

AdminSchema.methods.setPassword = async function (password) {
    const salt = await bcrypt.genSalt(10)
    const hash = await bcrypt.hash(password, salt)
    this.password = hash
}

AdminSchema.methods.validPassword = async function (password) {
    return await bcrypt.compare(password, this.password)
}

const Admin = mongoose.model('Admin', AdminSchema)

module.exports = Admin
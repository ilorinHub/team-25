const mongoose = require('mongoose')

const PropertySchema = new mongoose.Schema({
    capturedBy: {
        type: mongoose.Types.ObjectId,
        required: true,
        ref: 'Agent'
    },
    zone: {
        type: String,
        required: true
    },
    lga: {
        type: String,
        required: true
    },
    buildingType: {
        type: String,
        required: true
    },
    numberOfRooms: {
        type: String,
        required: true
    },
    taxPayable: {
        type: String,
        required: true
    },
    address: {
        type: String,
        required: true
    },
    imageURL:{
        type: String,
        required: true
    }
},
    {
        timestamps: true
    }
)

const Property = mongoose.model('Property', PropertySchema)

module.exports = Property
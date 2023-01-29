const cloudinary = require('cloudinary').v2;
const { CloudinaryStorage } = require("multer-storage-cloudinary");
const multer = require("multer");

const {
    CLOUDINARY_NAME,
    CLOUDINARY_API_KEY,
    CLOUDINARY_API_SECRET
} = require('../config')

/**
 * Cloudinary Configuration
 */
cloudinary.config({
  cloud_name: CLOUDINARY_NAME,
  api_key: CLOUDINARY_API_KEY,
  api_secret: CLOUDINARY_API_SECRET,
  secure: true
});

/**
 * Setting up multer cloudinary storage
 */
const storage = new CloudinaryStorage({
  cloudinary: cloudinary,
  params: {
    folder: "Machine-Glow",
  },
});

const upload = multer({ storage: storage })

module.exports = upload
const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");

const AgentSchema = new mongoose.Schema(
  {
    firstname: {
      type: String,
      required: true,
    },
    lastname: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
      unique: true,
    },
    password: {
      type: String,
      required: true,
    }
  },

  {
    timestamps: true,
  }
);

AgentSchema.methods.setPassword = async function (password) {
  const salt = await bcrypt.genSalt(10);
  const hash = await bcrypt.hash(password, salt);
  this.password = hash;
};

AgentSchema.methods.validPassword = async function (password) {
  return await bcrypt.compare(password, this.password);
};

const Agent = mongoose.model("Agent", AgentSchema);

module.exports = Agent;
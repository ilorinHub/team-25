const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
const morgan = require("morgan");
const { create } = require('express-handlebars');
const path = require("path");
const session = require("express-session");

const AgentController = require('./agent/controller');
const AdminController = require('./admin/controller');
const PropertyController = require('./property/controller');

const { MONGODB_URI, EXPRESS_SESSION_SECRET } = require("./config");

const app = express();
const hbs = create({
  extname: 'hbs',
  defaultView: 'default',
  layoutsDir: __dirname + '/views/layouts/',
  partialsDir: __dirname + '/views/partials/'
});

app.use(express.static(__dirname + '/public/img'));

mongoose.connect(MONGODB_URI, {
	useNewUrlParser: true,
	useUnifiedTopology: true
});

const db = mongoose.connection;
db.on("error", (error) =>
	console.error("Error Connecting to Database:", error.message)
);
db.once("open", () => console.log("Connected to Database"));

app.set('view engine', 'hbs');
app.engine( 'hbs', hbs.engine);
app.set("views", path.join(__dirname, "/views"));
app.use(cors());
app.use(morgan("combined"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(session({
	secret: EXPRESS_SESSION_SECRET,
	resave: false,
	saveUninitialized: true,
  	cookie: { maxAge: 1000 * 60 * 60 * 24 }
}));

app.use('/api/agent/', AgentController);
app.use('/api/property/', PropertyController);
app.use('/', AdminController);

module.exports = app
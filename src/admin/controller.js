const { Router } = require('express');
const { login, updatePassword, createAgent, getAgents } = require('./service');
const auth = require('../middlewares/authentication')

const router = Router();

/**
 * @route           GET /
 * @description     Redirects to Admin Dashboard
 * @access          Private
 */
router.get('/', async (req, res) => {
    return res.redirect('/dashboard')
})

/**
 * @route           GET /login
 * @description     Get Admin login page
 * @access          Public
 */
router.get('/login', async (req, res) => {
    if (req.session.adminId) {
        return res.redirect('/dashboard')
    }
    return res.render('login', {layout: false})
})

/**
 * @route           POST /login
 * @description     Admin login
 * @access          Public
 */
router.post('/login', async (req, res) => {
    if (req.session.adminId) {
        return res.redirect('/dashboard')
    }

    const {email, password} = req.body
    const admin = await login(email, password)
    if (admin) {
        req.session.adminId = admin._id
        req.session.name = admin.name
        return res.redirect('/dashboard')
    } else {
        return res.render('login', {layout: false, message: 'Invalid Email/Password'})
    }
})


/**
 * @route           GET /dashboard
 * @description     Get Admin dashboard page
 * @access          Private
 */
router.get('/dashboard', auth.admin, async (req, res) => {
    return res.render('dashboard', {layout: false, user: req.session.name})   
})

/**
 * @route           GET admin/logout
 * @description     logout route
 * @access          Private
 */
router.get('/logout', auth.admin, async (req, res) => {
    req.session.destroy();
    return res.redirect('/login')
})


/**
 * @route           GET /settings
 * @description     Get Admin settings page
 * @access          Private
 */
router.get("/settings", auth.admin, async (req, res) => {
  return res.render("settings", {user: req.session.name});
});

/**
 * @route           POST /update-password
 * @description     Update Admin password
 * @access          Private
 */
router.post("/update-password", auth.admin, async (req, res) => {
    const { oldPassword, newPassword, confrimNewPassword } = req.body
    const adminId = req.session.adminId

    const updatePasswordRes = await updatePassword(adminId, oldPassword, newPassword, confrimNewPassword)
    return res.json(updatePasswordRes)
});

/**
 * @route           GET /agents
 * @description     Get Manage Agents Page
 * @access          Private
 */
router.get("/agents", auth.admin, async (req, res) => {
    const agents = await getAgents()
    return res.render("agents", {layout: false, user: req.session.name, agents});
})

/**
 * @route           POST admin/create-agent
 * @description     Create a new agent
 * @access          Private
 */
router.post("/agents", auth.admin, async (req, res) => {
    const { email, firstname, lastname } = req.body

    const createAgentRes = await createAgent(email, firstname, lastname, req.headers.host)

    return res.render('create-agents', {layout: false, user: req.session.name, message: createAgentRes.message})
})

/**
 * @route           GET admin/create-agent
 * @description     Create a new agent
 * @access          Private
 */
router.get("/create-agent", auth.admin, async (req, res) => {
    return res.render("create-agents", {layout: false, user: req.session.name});
})


module.exports = router
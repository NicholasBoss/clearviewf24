const express = require("express")
const router = new express.Router() 
const accountController = require("../controllers/accountController")
const util = require("../utilities")


router.get("/register", util.handleErrors(accountController.buildRegister))

// Export
module.exports = router
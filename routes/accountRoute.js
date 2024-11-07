// Needed Resources 
const express = require("express")
const router = new express.Router() 
const accountController = require("../controllers/accountController")
const util = require("../utilities")

// Routes

// Default Home Route
router.get("/", util.handleErrors(accountController.buildAccount))



// Export
module.exports = router
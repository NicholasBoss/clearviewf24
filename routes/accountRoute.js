// Needed Resources 
const express = require("express")
const router = new express.Router() 
const accountController = require("../controllers/accountController")
const util = require("../utilities")

// Routes

// Default Accout Route
router.get("/", util.handleErrors(accountController.displayAccountManagementPage))

// Export
module.exports = router
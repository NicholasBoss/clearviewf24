// Needed Resources 
const express = require("express")
const router = new express.Router() 
const accountController = require("../controllers/accountController")
const accountValidator = require("../utilities/accountValidation")
const util = require("../utilities")

// Routes

// Default Home Route
router.get("/", util.handleErrors(accountController.buildAccount))

// Register Route
router.get("/register", util.handleErrors(accountController.buildRegister))

// Register Account
router.post("/register", 
    accountValidator.registrationRules(),
    accountValidator.checkRegData,
    util.handleErrors(accountController.registerAccount))

// Export
module.exports = router
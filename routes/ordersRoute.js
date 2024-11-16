// Needed Resources 
const express = require("express")
const router = new express.Router()
const ordersController = require("../controllers/ordersController")
const util = require("../utilities")

// Orders CRUD Routes
router.get("/create", util.handleErrors(ordersController.buildCreate))
router.get("/read", util.handleErrors(ordersController.buildRead))
router.get("/update", util.handleErrors(ordersController.buildUpdate))
router.get("/delete", util.handleErrors(ordersController.buildDelete))

// Export
module.exports = router
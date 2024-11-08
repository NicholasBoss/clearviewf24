// Needed Resources 
const express = require("express")
const router = new express.Router()
const ordersController = require("../controllers/ordersController")
const util = require("../utilities")

// Orders CRUD Routes
router.get("/orders/create", util.handleErrors(ordersController.buildCreate))
router.get("/orders/read", util.handleErrors(ordersController.buildRead))
router.get("/orders/update", util.handleErrors(ordersController.buildUpdate))
router.get("/orders/delete", util.handleErrors(ordersController.buildDelete))

// Export
module.exports = router
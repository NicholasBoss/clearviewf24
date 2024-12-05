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
router.get("/createMirage3500", util.handleErrors(ordersController.buildCreateDoor))
router.get("/createMirage", util.handleErrors(ordersController.buildCreateDoor))
router.get("/createRainier", util.handleErrors(ordersController.buildCreateDoor))
router.get("/createDoor", util.handleErrors(ordersController.buildCreateDoor))
router.get("/createHaleScreenModel", util.handleErrors(ordersController.buildCreateDoor))
router.get("/createPhantom", util.handleErrors(ordersController.buildCreateDoor))
router.get("/createWizardSmartScreen", util.handleErrors(ordersController.buildCreateDoor))
router.get("/createViewguard", util.handleErrors(ordersController.buildCreateDoor))
router.get("/createDoor", util.handleErrors(ordersController.buildCreateDoor))

// Export
module.exports = router
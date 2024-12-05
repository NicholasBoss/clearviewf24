// Needed Resources 
const express = require("express")
const router = new express.Router()
const ordersController = require("../controllers/ordersController")
const util = require("../utilities")

// Orders CRUD Routes
router.get("/create", util.checkLogin, util.handleErrors(ordersController.buildCreate))
router.get("/read", util.checkLogin, util.handleErrors(ordersController.buildRead))
router.get("/update", util.checkLogin, util.handleErrors(ordersController.buildUpdate))
router.get("/delete", util.checkLogin, util.handleErrors(ordersController.buildDelete))
router.get("/createMirage3500", util.checkLogin, util.handleErrors(ordersController.buildCreateDoor))
router.get("/createMirage", util.checkLogin, util.handleErrors(ordersController.buildCreateDoor))
router.get("/createRainier", util.checkLogin, util.handleErrors(ordersController.buildCreateDoor))
router.get("/createDoor", util.checkLogin, util.handleErrors(ordersController.buildCreateDoor))
router.get("/createHaleScreenModel", util.checkLogin, util.handleErrors(ordersController.buildCreateDoor))
router.get("/createPhantom", util.checkLogin, util.handleErrors(ordersController.buildCreateDoor))
router.get("/createWizardSmartScreen", util.checkLogin, util.handleErrors(ordersController.buildCreateDoor))
router.get("/createViewguard", util.checkLogin, util.handleErrors(ordersController.buildCreateDoor))
router.get("/createDoor", util.checkLogin, util.handleErrors(ordersController.buildCreateDoor))

// Export
module.exports = router
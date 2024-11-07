const { query } = require('express-validator');
const accountModel = require('../models/accountModel');


const { body, validationResult } = require('express-validator');
const { link } = require('../routes/static');
const validate = {}

validate.addressRules = () => {
    return [
        body('address_street')
            .notEmpty()
            .withMessage('Street is required')
            .isLength({ min: 5 })
            .withMessage('Street must be at least 5 characters long'),
        body('address_city')
            .notEmpty()
            .withMessage('City is required')
            .isLength({ min: 3 })
            .withMessage('City must be at least 3 characters long'),
        body('address_state')
            .notEmpty()
            .withMessage('State is required')
            .isLength({ min: 2, max: 2 })
            .withMessage('State must be at least 2 characters long'),
        body('address_zip')
            .notEmpty()
            .withMessage('Zip is required')
            .isLength({ min: 5 })
            .withMessage('Zip must be at least 5 characters long')
    ]
}

validate.checkAddressData = (req, res, next) => {
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
        const { address_street, address_city, address_state, address_zip } = req.body
        // console.log('Errors:', errors)
        return res.render('account/deliveryCheckout', { 
            errors: errors.array(), 
            title: 'Delivery Checkout',
            link: 'account/deliveryCheckout',
            section: 'cart',
            address_street,
            address_city,
            address_state,
            address_zip
        })
    }
    next()
}

module.exports = validate
const express = require('express');
const accountModel = require('../models/accountModel');


// Function to display account management page
const displayAccountManagementPage = (req, res) => {
    console.log('Displaying account management page');
    const accounts = accountModel.getAccounts();
    console.log(accounts);
    res.render('account/accountManagement', {
        title: 'Account Management',
        link: 'account',
        // accounts
    });
};

// Export the function
module.exports = {
    displayAccountManagementPage,
};
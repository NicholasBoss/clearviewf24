const accountController = {}

accountController.buildAccount = async function(req, res){
    res.render('account/register', {
        title: 'Register', 
        link: '', 
        errors: null
    })
}

module.exports = accountController
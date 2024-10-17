const accountController = {}

accountController.buildRegister = async function(req, res){
    console.log('Building Registration')
    res.render('account/register', {
        title: 'Registration', 
        link: 'account/register', 
    })
}

module.exports = accountController
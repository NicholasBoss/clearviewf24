const pool = require('../database/')

const getAccounts = async () => {
    try {
        const res = await pool.query('SELECT * FROM account');
        return res.rows;
    } catch (err) {
        return err;
    }
}

// export the function
module.exports = {
    getAccounts,
}; 

const db = require('./index');

const testQuery = async () => {
    try {
        const res = await db.query('SELECT NOW()');
        console.log('Connection successful:', res.rows);
    } catch (err) {
        console.error('Connection error:', err);
    }
};

testQuery();
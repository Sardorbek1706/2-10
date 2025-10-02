require('dotenv').config();
const express = require('express');
const { Pool } = require('pg');
const app = express();
app.use(express.json());

const pool = new Pool();
app.post('/users', async (req, res) => {
    const { id, first_name, last_name, email, password, phone_number, address } = req.body;
    try {
        const result = await pool.query(
            'INSERT INTO users (id, first_name, last_name, email, password, phone_number, address) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING *',
            [id, first_name, last_name, email, password, phone_number, address]
        );
        res.json(result.rows[0]);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

app.get('/users', async (req, res) => {
    const result = await pool.query('SELECT * FROM users');
    res.json(result.rows);
});
app.post('/posts', async (req, res) => {
    const { id, title, content, slug, user_id } = req.body;
    try {
        const result = await pool.query(
            'INSERT INTO posts (id, title, content, slug, user_id) VALUES ($1,$2,$3,$4,$5) RETURNING *',
            [id, title, content, slug, user_id]
        );
        res.json(result.rows[0]);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

app.get('/posts', async (req, res) => {
    const result = await pool.query('SELECT * FROM posts');
    res.json(result.rows);
});
app.post('/comments', async (req, res) => {
    const { id, content, post_id, user_id } = req.body;
    try {
        const result = await pool.query(
            'INSERT INTO comments (id, content, post_id, user_id) VALUES ($1,$2,$3,$4) RETURNING *',
            [id, content, post_id, user_id]
        );
        res.json(result.rows[0]);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

app.get('/comments', async (req, res) => {
    const result = await pool.query('SELECT * FROM comments');
    res.json(result.rows);
});

app.listen(3000, () => {
    console.log('Server running on port 3000');
});

CREATE TABLE users (
    id VARCHAR PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    email VARCHAR UNIQUE,
    password VARCHAR,
    phone_number VARCHAR,
    address VARCHAR
);

CREATE TABLE posts (
    id VARCHAR PRIMARY KEY,
    title VARCHAR,
    content TEXT,
    slug VARCHAR,
    user_id VARCHAR REFERENCES users(id)
);

CREATE TABLE comments (
    id VARCHAR PRIMARY KEY,
    content TEXT,
    post_id VARCHAR REFERENCES posts(id),
    user_id VARCHAR REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

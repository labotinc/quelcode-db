CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mail VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    introduction VARCHAR(1000),
    work_phone_number VARCHAR(13),
    mobile_phone_number VARCHAR(13),
    is_deleated TINYINT(1) DEFAULT 0 NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

CREATE TABLE chatrooms (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    chat_name VARCHAR(100) NOT NULL,
    overview VARCHAR(1000),
    file_send_flg TINYINT(1) DEFAULT 1 NOT NULL,
    direct_chat_flg TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleated TINYINT(1) DEFAULT 0 NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    created_user_id INT NOT NULL REFERENCES users(id),
    updated_user_id INT NOT NULL REFERENCES users(id)
);

CREATE TABLE participants (
    user_id INT NOT NULL REFERENCES users(id),
    chatroom_id INT NOT NULL REFERENCES chatrooms(id),
    joined_at DATETIME NOT NULL,
    PRIMARY KEY(user_id, chatroom_id)
);

CREATE TABLE posts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(1000) NOT NULL,
    attachment_file_name VARCHAR(100),
    is_deleated TINYINT(1) DEFAULT 0 NOT NULL,
    posted_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    posted_user_id INT NOT NULL REFERENCES users(id),
    updated_user_id INT NOT NULL REFERENCES users(id),
    chatroom_id INT NOT NULL REFERENCES chatrooms(id)
);

CREATE TABLE tasks (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(1000) NOT NULL,
    person_user_id INT NOT NULL REFERENCES users(id),
    deadline DATETIME,
    done_flg TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleated TINYINT(1) DEFAULT 0 NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    created_user_id INT NOT NULL REFERENCES users(id),
    updated_user_id INT NOT NULL REFERENCES users(id),
    chatroom_id INT NOT NULL REFERENCES chatrooms(id)
);

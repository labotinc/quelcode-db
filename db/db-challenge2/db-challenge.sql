CREATE TABLE users (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(100) UNIQUE NOT NULL,
    biography VARCHAR(1000),
    office_phone VARCHAR(13),
    mobile VARCHAR(13),
    is_deleted TINYINT(1) DEFAULT '0' NOT NULL CHECK(is_deleted<=1),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE chatrooms (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL,
    description VARCHAR(1000),
    is_send TINYINT(1) DEFAULT '0' NOT NULL CHECK(is_send<=1),
    is_direct TINYINT(1) DEFAULT '0' NOT NULL CHECK(is_direct<=1),
    is_deleted TINYINT(1) DEFAULT '0' NOT NULL CHECK(is_deleted<=1),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_user_id int(11) NOT NULL REFERENCES users(id),
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    update_user_id INT(11) NOT NULL REFERENCES users(id)
);

CREATE TABLE tasks (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    chatroom_id INT(11) NOT NULL REFERENCES chatroom(id),
    task_admins_user_id INT(11) NOT NULL REFERENCES users(id),
    task_content VARCHAR(1000) NOT NULL,
    schedule_end DATETIME,
    is_completion TINYINT(1) DEFAULT '0' NOT NULL CHECK(is_completion<=1),
    is_deleted TINYINT(1) DEFAULT '0' NOT NULL CHECK(is_deleted<=1),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    create_user_id INT(11) NOT NULL REFERENCES users(id),
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    update_user_id INT(11) NOT NULL REFERENCES users(id)
);

CREATE TABLE posts (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    chatroom_id INT(11) NOT NULL REFERENCES chatroom(id),
    post_content VARCHAR(1000) NOT NULL,
    attached_filename VARCHAR(100),
    is_deleted TINYINT(1) DEFAULT '0' NOT NULL CHECK(is_deleted<=1),
    posted_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    post_user_id INT(11) NOT NULL REFERENCES users(id),
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    update_user_id INT(11) NOT NULL REFERENCES users(id)
);

CREATE TABLE chatroom_users (
    users_id INT(11) NOT NULL REFERENCES users(id),
    chatroom_users_id INT(11) NOT NULL REFERENCES chatroom(id),
    joined_at DATETIME NOTNULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(users_id,chatroom_users_id)
);
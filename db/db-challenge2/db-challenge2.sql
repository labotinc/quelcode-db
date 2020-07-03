CREATE TABLE `user_information` (
    `id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `email_address` varchar(100) NOT NULL UNIQUE,
    `password` varchar(100) NOT NULL,
    `display_name` varchar(100) NOT NULL,
    `profile` varchar(1000),
    `workplace_phone_number` varchar(13),
    `myphone_number` varchar(13) UNIQUE,
    `account_delete_flag` tinyint(1) NOT NULL DEFAULT '0',
    `create_date_and_time` datetime NOT NULL,
    `update_date_and_time`datetime NOT NULL
);

CREATE TABLE `chatroom` (
    `chatroom_id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `chatroom_name` varchar(100) NOT NULL,
    `chatroom_overview` varchar(1000),
    `file_transmission_flag` tinyint(1) NOT NULL DEFAULT '0',
    `direct_chat_flag` tinyint(1) NOT NULL DEFAULT '0',
    `chatroom_delete_flag` tinyint(1) NOT NULL DEFAULT '0',
    `create_author` int(11) NOT NULL REFERENCES user_information(id),
    `update_author` int(11) NOT NULL REFERENCES user_information(id),
    `create_date_and_time` datetime NOT NULL,
    `update_date_and_time`datetime NOT NULL
);

CREATE TABLE `participant` (
    `user_id` int(11) REFERENCES user_information(id),
    `chatroom_id` varchar(100) REFERENCES chatroom(chatroom_id),
    `participation_date` varchar(100) NOT NULL,
    PRIMARY KEY (`id`,`chatroom_id`)
);

CREATE TABLE `posts` (
    `post_id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `chatroom_id` int(11) NOT NULL REFERENCES chatroom(chatroom_id),
    `post_content` varchar(1000) NOT NULL,
    `file_name` varchar(100),
    `post_content_delete_flag` tinyint(1) NOT NULL DEFAULT '0',
    `create_author` int(11) NOT NULL REFERENCES user_information(id),
    `update_author` int(11) NOT NULL REFERENCES user_information(id),
    `create_date_and_time` datetime NOT NULL,
    `update_date_and_time`datetime NOT NULL
);

CREATE TABLE `task` (
    `task_id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `chatroom_id` int(11) NOT NULL REFERENCES chatroom(chatroom_id),
    `task_content` varchar(1000) NOT NULL,
    `person_in_charge_id` int(11) NOT NULL REFERENCES user_information(id),
    `deadline` datetime(1),
    `complete_flag` tinyint(1) NOT NULL DEFAULT '0',
    `post_content_delete_flag` tinyint(1) NOT NULL DEFAULT '0',
    `create_author` int(11) NOT NULL REFERENCES user_information(id),
    `update_author` int(11) NOT NULL REFERENCES user_information(id),
    `create_date_and_time` datetime NOT NULL,
    `update_date_and_time`datetime NOT NULL
);
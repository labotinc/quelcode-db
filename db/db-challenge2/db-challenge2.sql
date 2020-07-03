CREATE TABLE `user_information` (
    `id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `email_address` varchar(100) NOT NULL,
    `password` varchar(100) NOT NULL,
    `display_name` varchar(100) NOT NULL,
    `profile` varchar(1000),
    `office_telephone_number` varchar(13),
    `mobilephone_number` varchar(13),
    `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL
);

CREATE TABLE `chatroom` (
    `id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `chatroom_name` varchar(100) NOT NULL,
    `chatroom_overview` varchar(1000),
    `file_transmission_flag` tinyint(1) NOT NULL DEFAULT '0',
    `direct_chat_flag` tinyint(1) NOT NULL DEFAULT '0',
    `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
    `create_user` int(11) NOT NULL REFERENCES user_information(id),
    `update_user` int(11) NOT NULL REFERENCES user_information(id),
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL
);

CREATE TABLE `participant` (
    `user_id` int(11) REFERENCES user_information(id),
    `chatroom_id` varchar(100) REFERENCES chatroom(chatroom_id),
    `participation_date` varchar(100) NOT NULL,
    PRIMARY KEY (`id`,`chatroom_id`)
);

CREATE TABLE `posts` (
    `id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `chatroom_id` int(11) NOT NULL REFERENCES chatroom(chatroom_id),
    `post_content` varchar(1000) NOT NULL,
    `file_name` varchar(100),
    `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
    `create_user` int(11) NOT NULL REFERENCES user_information(id),
    `update_user` int(11) NOT NULL REFERENCES user_information(id),
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL
);

CREATE TABLE `task` (
    `id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `chatroom_id` int(11) NOT NULL REFERENCES chatroom(chatroom_id),
    `task_content` varchar(1000) NOT NULL,
    `person_in_charge_id` int(11) NOT NULL REFERENCES user_information(id),
    `deadline` datetime,
    `complete_flag` tinyint(1) NOT NULL DEFAULT '0',
    `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
    `create_user` int(11) NOT NULL REFERENCES user_information(id),
    `update_user` int(11) NOT NULL REFERENCES user_information(id),
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL
);
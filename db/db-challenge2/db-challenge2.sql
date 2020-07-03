CREATE TABLE `user_information` (
    `id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `email_address` varchar(100) NOT NULL UNIQUE,
    `password` varchar(100) NOT NULL,
    `display_name` varchar(100) NOT NULL,
    `profile` varchar(1000),
    `workplace_phone_number` varchar(13) UNIQUE,
    `myphone_number` varchar(13),
    `account_delete_flag` tinyint,
    `create_date_and_time` datetime NOt NULL,
    `update_date_and_time`datetime NOt NULL
);

CREATE TABLE `participant` (
    `id` int(11) AUTO_INCREMENT,
    `chatroom_id` varchar(100) NOT NULL UNIQUE,
    `participation_date` varchar(100) NOT NULL,
    PRIMARY KEY (`id`,`chatroom_id`)
);


CREATE TABLE `users` (
      `id` int NOT NULL AUTO_INCREMENT,
      `mail` varchar(100) NOT NULL,
      `password` varchar(100) NOT NULL,
      `name` varchar(100) NOT NULL,
      `self-introduction` varchar(1000),
      `number_work` varchar(13),
      `number_private` varchar(13),
      `is_deleted` tinyint(1) DEFAULT 0 NOT NULL comment'1:削除済み',
      `created_at` datetime NOT NULL,
      `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `chat_users` (
      `user_id` int NOT NULL REFERENCES users(ID),
      `chat_id` int NOT NULL REFERENCES chats(ID),
      `joined_at` datetime NOT NULL,
      PRIMARY KEY (`user_id`,`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `chats` (
      `id` int NOT NULL AUTO_INCREMENT,
      `name` varchar(100) NOT NULL,
      `summary` varchar(1000),
      `is_good_to_send` tinyint(1) DEFAULT 0 NOT NULL comment'1:ファイル送信可能',
      `is_good_to_start_direct` tinyint(1) DEFAULT 0 NOT NULL comment'1:ダイレクトチャット開始',
      `is_deleted` tinyint(1) DEFAULT 0 NOT NULL comment'1:削除済み',
      `created_at` datetime NOT NULL,
      `created_by` int NOT NULL REFERENCES users(ID),
      `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `modified_by` int NOT NULL REFERENCES users(ID),
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `posts` (
      `id` int NOT NULL AUTO_INCREMENT,
      `chat_id` int NOT NULL REFERENCES chats(ID),
      `user_id` int NOT NULL REFERENCES users(ID),
      `contents` varchar(1000) NOT NULL,
      `file_name` varchar(100),
      `is_deleted` tinyint(1) DEFAULT 0 NOT NULL comment'1:削除済み',
      `created_at` datetime NOT NULL,
      `created_by` int NOT NULL REFERENCES users(ID),
      `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `modified_by` int NOT NULL REFERENCES users(ID),
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `tasks` (
      `id` int NOT NULL AUTO_INCREMENT,
      `contents` varchar(1000) NOT NULL,
      `pic_id` int NOT NULL REFERENCES users(ID),
      `chat_id` int NOT NULL REFERENCES chats(ID),
      `deadline` datetime,
      `is_completed` tinyint(1) DEFAULT 0 NOT NULL comment'1:完了済み',
      `is_deleted` tinyint(1) DEFAULT 0 NOT NULL comment'1:削除済み',
      `created_at` datetime NOT NULL,
      `created_by` int NOT NULL REFERENCES users(ID),
      `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `modified_by` int NOT NULL REFERENCES users(ID),
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


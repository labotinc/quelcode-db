CREATE TABLE `users` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `mail` varchar(100) NOT NULL,
      `password` varchar(100) NOT NULL,
      `name` varchar(100) NOT NULL,
      `self_introduction` varchar(1000),
      `number_work` varchar(13),
      `number_private` varchar(13),
      `is_deleted` tinyint(1) DEFAULT 0 NOT NULL comment'1:削除済み',
      `created_at` datetime(5) DEFAULT CURRENT_TIMESTAMP NOT NULL,
      `modified_at` timestamp(4) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `chat_users` (
      `user_id` int(11) NOT NULL REFERENCES users(ID),
      `chat_id` int(11) NOT NULL REFERENCES chats(ID),
      `joined_at` datetime(5) DEFAULT CURRENT_TIMESTAMP NOT NULL,
      PRIMARY KEY (`user_id`,`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `chats` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `name` varchar(100) NOT NULL,
      `summary` varchar(1000),
      `is_sendable` tinyint(1) DEFAULT 0 NOT NULL comment'1:ファイル送信可能',
      `is_directchat` tinyint(1) DEFAULT 0 NOT NULL comment'1:ダイレクトチャット開始',
      `is_deleted` tinyint(1) DEFAULT 0 NOT NULL comment'1:削除済み',
      `created_at` datetime(5) DEFAULT CURRENT_TIMESTAMP NOT NULL,
      `created_by` int(11) NOT NULL REFERENCES users(ID),
      `modified_at` timestamp(4) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
      `modified_by` int(11) NOT NULL REFERENCES users(ID),
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `posts` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `chat_id` int(11) NOT NULL REFERENCES chats(ID),
      `contents` varchar(1000) NOT NULL,
      `file_name` varchar(100),
      `is_deleted` tinyint(1) DEFAULT 0 NOT NULL comment'1:削除済み',
      `created_at` datetime(5) DEFAULT CURRENT_TIMESTAMP NOT,
      `created_by` int(11) NOT NULL REFERENCES users(ID),
      `modified_at` timestamp(4) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
      `modified_by` int(11) NOT NULL REFERENCES users(ID),
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `tasks` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `contents` varchar(1000) NOT NULL,
      `person_in_charge` int(11) NOT NULL REFERENCES users(ID),
      `chat_id` int(11) NOT NULL REFERENCES chats(ID),
      `deadline` datetime(5),
      `is_completed` tinyint(1) DEFAULT 0 NOT NULL comment'1:完了済み',
      `is_deleted` tinyint(1) DEFAULT 0 NOT NULL comment'1:削除済み',
      `created_at` datetime(5) DEFAULT CURRENT_TIMESTAMP NOT NULL,
      `created_by` int(11) NOT NULL REFERENCES users(ID),
      `modified_at` timestamp(4) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
      `modified_by` int(11) NOT NULL REFERENCES users(ID),
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


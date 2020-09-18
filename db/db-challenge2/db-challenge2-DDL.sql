CREATE TABLE `users` (
      `id` int NOT NULL AUTO_INCREMENT,
      `mail` varchar(255) NOT NULL,
      `password` varchar(100) NOT NULL,
      `name` varchar(100) NOT NULL,
      `self-id` varchar(255),
      `number_work` varchar(255) NOT NULL,
      `number_private` varchar(255) NOT NULL,
      `created` datetime NOT NULL,
      `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `chat_users` (
      `user_id` int NOT NULL,
      `chat_id` int NOT NULL,
      `join_date` datetime NOT NULL,
      PRIMARY KEY (`user_id`,`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `chats` (
      `id` int NOT NULL AUTO_INCREMENT,
      `name` varchar(225) NOT NULL,
      `summary` varchar(1000),
      `file_send_flag` int(1) NOT NULL DEFAULT 0　comment'1:ファイル送信可能',
      `direct_chat_flag` int(1) NOT NULL DEFAULT 0　comment'1:ダイレクトチャット開始',
      `delete_flag` int(1) NOT NULL DEFAULT 0　comment'1:削除済み',
      `created` datetime NOT NULL,
      `ct_user_id` int NOT NULL,
      `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `md_user_id` int NOT NULL,
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `posts` (
      `id` int NOT NULL AUTO_INCREMENT,
      `chat_id` int NOT NULL,
      `user_id` int NOT NULL,
      `contents` text NOT NULL,
      `file_name` varchar(225),
      `delete_flag` int(1) NOT NULL DEFAULT 0　comment'1:削除済み',
      `created` datetime NOT NULL,
      `ct_user_id` int NOT NULL,
      `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `md_user_id` int NOT NULL,
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `tasks` (
      `id` int NOT NULL AUTO_INCREMENT,
      `contents` text NOT NULL,
      `pic_id` int NOT NULL,
      `chat_id` int NOT NULL,
      `deadline` datetimw NOT NULL,
      `complete_flag` int(1) NOT NULL DEFAULT 0　comment'1:完了済み',
      `delete_flag` int(1) NOT NULL DEFAULT 0　comment'1:削除済み',
      `created` datetime NOT NULL,
      `ct_user_id` int NOT NULL,
      `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `md_user_id` int NOT NULL,
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


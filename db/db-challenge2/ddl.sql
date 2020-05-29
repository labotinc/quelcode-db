create table users
(
    user_id int(11) not null auto_increment,
    email varchar(100) not null,
    password varchar(100) not null,
    user_name varchar(100) not null,
    self_info varchar(1000),
    company_phone varchar(12),
    cell_phone varchar(13),
    is_deleted tinyint(1) not null default 0,
    create_user_id int(11)not null,
    created_at datetime not null,
    update_user_id int(11) not null,
    updated_at datetime not null,
    primary key(user_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table chat_rooms
(
    chat_id int(11) not null auto_increment,
    chat_name varchar(100) not null, 
    chat_detail varchar(1000),
    file_send tinyint(1) not null default 0,
    direct_chat tinyint(1) not null default 0,
    is_deleted tinyint(1) not null default 0, 
    create_user_id int(11) not null,
    created_at datetime not null,
    update_user_id int(11) not null,
    updated_at datetime not null,
    foreign key(create_user_id) references users(user_id),
    foreign key(update_user_id) references users(user_id),
    primary key(chat_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table chat_members
(
    chat_id int(11) not null,
    user_id int(11) not null,
    join_time datetime not null,
    foreign key(chat_id) references chat_rooms(chat_id),
    foreign key(user_id) references users(user_id),
    primary key(chat_id, user_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table tasks
(
    task_id int(11) auto_increment not null,
    chat_id int(11) not null,
    task_detail varchar(1000) not null,
    user_id int(11) not null,
    limited_time datetime not null,
    is_completed tinyint(1) not null default 0,
    create_user_id int(11) not null,
    created_at datetime not null,
    update_user_id int(11) not null,
    updated_at datetime not null,
    is_deleted tinyint(1) not null default 0,
    foreign key(chat_id) references chat_rooms(chat_id),
    foreign key(user_id) references users(user_id),
    foreign key(create_user_id) references users(user_id),
    foreign key(update_user_id) references users(user_id),
    primary key(task_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table posts
(
    post_id int(11) auto_increment not null,
    chat_id int(11) not null,
    post_detail varchar(1000) not null,
    user_id int(11) not null,
    posted_at datetime not null,
    update_user_id int(11) not null,
    updated_at datetime not null,
    is_deleted tinyint(1) not null default 0,
    add_dile varchar(100) not null,
    foreign key(chat_id) references chat_rooms(chat_id),
    foreign key(user_id) references users(user_id),
    foreign key(update_user_id) references users(user_id),
    primary key(post_id)    
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table users
(
    id int(11) not null auto_increment,
    email varchar(100) not null,
    password varchar(100) not null,
    name varchar(100) not null,
    self_intro varchar(1000),
    company_phone varchar(12),
    cell_phone varchar(13),
    is_deleted tinyint(1) not null default 0,
    create_user_id int(11)not null,
    created_at datetime not null,
    update_user_id int(11) not null,
    updated_at datetime not null,
    primary key(id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table chat_rooms
(
    id int(11) not null auto_increment,
    name varchar(100) not null, 
    detail varchar(1000),
    is_sent tinyint(1) not null default 1,
    is_directed tinyint(1) not null default 0,
    is_deleted tinyint(1) not null default 0, 
    create_user_id int(11) not null,
    created_at datetime not null,
    update_user_id int(11) not null,
    updated_at datetime not null,
    foreign key(create_user_id) references users(id),
    foreign key(update_user_id) references users(id),
    primary key(id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table chat_members
(
    chat_id int(11) not null,
    user_id int(11) not null,
    join_time datetime not null,
    foreign key(chat_id) references chat_rooms(id),
    foreign key(user_id) references users(id),
    primary key(chat_id, user_id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table tasks
(
    id int(11) auto_increment not null,
    chat_id int(11) not null,
    detail varchar(1000) not null,
    user_id int(11) not null,
    limited_time datetime not null,
    is_completed tinyint(1) not null default 0,
    create_user_id int(11) not null,
    created_at datetime not null,
    update_user_id int(11) not null,
    updated_at datetime not null,
    is_deleted tinyint(1) not null default 0,
    foreign key(chat_id) references chat_rooms(id),
    foreign key(user_id) references users(id),
    foreign key(create_user_id) references users(id),
    foreign key(update_user_id) references users(id),
    primary key(id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table posts
(
    id int(11) auto_increment not null,
    chat_id int(11) not null,
    detail varchar(1000) not null,
    user_id int(11) not null,
    created_at datetime not null,
    update_user_id int(11) not null,
    updated_at datetime not null,
    is_deleted tinyint(1) not null default 0,
    added_file varchar(100) not null,
    foreign key(chat_id) references chat_rooms(id),
    foreign key(user_id) references users(id),
    foreign key(update_user_id) references users(id),
    primary key(id)    
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

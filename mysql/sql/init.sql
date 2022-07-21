CREATE DATABASE IF NOT EXISTS chatproject;

USE chatproject;

CREATE TABLE users (
    user_id varchar(30) NOT NULL PRIMARY KEY,
    user_name varchar(30) NOT NULL,
    password char(255) NOT NULL,
    role char(3) NOT NULL,
    ins_dt char(19) NOT NULL,
    upd_dt char(19) NOT NULL 
);

CREATE TABLE joinroom (
    user_id varchar(30) NOT NULL,
    room_id int NOT NULL,
    ins_id char(19) NOT NULL,
    upd_id char(19) NOT NULL,
    PRIMARY KEY(user_id,room_id)
);

CREATE TABLE rooms (
    id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    room_name varchar(30) NOT NULL,
    registered_user varchar(30) NOT  NULL,
    ins_dt char(19) NOT NULL,
    upd_dt char(19) NOT NULL 
);

CREATE TABLE posts (
    id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id varchar(30) NOT  NULL,
    room_id int NOT NULL,
    contents text NOT NULL,
    ins_dt char(19) NOT NULL,
    upd_dt char(19) NOT NULL 
);

CREATE TABLE comments (
    id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    post_id int NOT NULL,
    user_id varchar(30) NOT  NULL,
    comment text NOT NULL,
    ins_dt char(19) NOT NULL,
    upd_dt char(19) NOT NULL 
);

CREATE TABLE postlikes (
    post_id int NOT NULL,  
    user_id varchar(30) NOT  NULL,    
    ins_dt char(19) NOT NULL,
    upd_dt char(19) NOT NULL,
    PRIMARY KEY(post_id,user_id)
);

CREATE TABLE commentlikes (
    comment_id int NOT NULL,
    user_id varchar(30) NOT  NULL,
    ins_dt char(19) NOT NULL,
    upd_dt char(19) NOT NULL,
    PRIMARY KEY(comment_id,user_id) 
);
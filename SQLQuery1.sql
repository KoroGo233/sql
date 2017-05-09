create database social

use social

create table t_user(
userID int primary key,
username  varchar(20) not null,
password varchar(20) not null,
birthday date,
bacakground varchar(100),
u_picture varchar(100),
petname varchar(20) default('这个人很懒'),
college varchar(20),
email varchar(100),
phone varchar(20)
)

create table t_friends(
userID int primary key,
friendID int,
friends_add_time date
constraint cs_friend foreign key(userID)references t_user(userID)
)
--drop table blog_list
create table blog_list(
userID int ,
blogID int  primary key(blogID),
blog_time date ,
url varchar(100),
blogcommentID int,
constraint cs_blog foreign key(userID) references t_user(userID),
)
--drop table act_list
create table act_list(
userID int ,
actID int ,
act_time date primary key(actID),
url varchar(100),
constraint cs_act foreign key(userID) references t_user(userID)
)
--drop table	 blog_comment
create table blog_comment(
blogcommentID int primary key,
userID int,
blogID int,
comment_detail nvarchar(500),
comment_time date ,
constraint cs_bloguser foreign key(userID) references t_user(userID),
constraint cs_blogcomment foreign key(blogID) references blog_list(blogID)
)
--drop table act_comment
create table act_comment(
actcommentID int primary key,
userID int,
actID int,
comment_detail nvarchar(500),
comment_time date,
constraint cs_actuser foreign key(userID) references t_user(userID),
constraint cs_accomm foreign key(actID) references act_list(actID)
)
--alter table blog_list drop constraint cs_bcomm

--alter table blog_comment add constraint cs_bcomm foreign key(blogcommentID) references blog_list(blogcommentID)
alter table Assignment drop constraint FKB3FD62ED8A94A401;
alter table Assignment drop constraint FKB3FD62EDF73AEE0F;
alter table TimeStamp drop constraint FK78F858D6CD26E040;
alter table TimeStamp drop constraint FK78F858D6F73AEE0F;
alter table TimeStamp drop constraint FK78F858D68A94A401;
alter table TimeStamp drop constraint FK78F858D6849B4488;
alter table Project drop constraint FK50C8E2F98A94A401;
drop table Type;
drop table Status;
drop table Assignment;
drop table User;
drop table TimeStamp;
drop table Project;
create table Type (
   id varchar(255) not null,
   name varchar(128) not null,
   fee double precision null,
   timeClearing tinyint null,
   mtime datetime not null,
   ctime datetime not null,
   primary key (id)
);
create table Status (
   id varchar(255) not null,
   name varchar(128) not null,
   mtime datetime not null,
   ctime datetime not null,
   color varchar(32) null,
   primary key (id)
);
create table Assignment (
   id varchar(255) not null,
   user_id varchar(128) null,
   project_id varchar(128) null,
   manager tinyint not null,
   ctime datetime not null,
   primary key (user_id, project_id),
   unique (user_id, project_id)
);
create table User (
   id varchar(128) not null,
   login varchar(32) not null unique,
   password varchar(32) not null,
   firstName varchar(64) not null,
   lastName varchar(64) null,
   email varchar(96) not null,
   superuser tinyint not null,
   mtime datetime not null,
   ctime datetime not null,
   ltime datetime null,
   primary key (id)
);
create table TimeStamp (
   id varchar(255) not null,
   begin datetime not null,
   end datetime not null,
   description varchar(65535) not null,
   open tinyint null,
   deduct tinyint null,
   fee double precision null,
   ctime datetime not null,
   mtime datetime not null,
   project_id varchar(128) null,
   type_id varchar(255) null,
   status_id varchar(255) null,
   user_id varchar(128) null,
   primary key (id)
);
create table Project (
   id varchar(128) not null,
   name varchar(128) not null,
   description varchar(65535) null,
   project_id varchar(128) null,
   mtime datetime not null,
   ctime datetime not null,
   primary key (id)
);
alter table Assignment add constraint FKB3FD62ED8A94A401 foreign key (project_id) references Project;
alter table Assignment add constraint FKB3FD62EDF73AEE0F foreign key (user_id) references User;
alter table TimeStamp add constraint FK78F858D6CD26E040 foreign key (type_id) references Type;
alter table TimeStamp add constraint FK78F858D6F73AEE0F foreign key (user_id) references User;
alter table TimeStamp add constraint FK78F858D68A94A401 foreign key (project_id) references Project;
alter table TimeStamp add constraint FK78F858D6849B4488 foreign key (status_id) references Status;
alter table Project add constraint FK50C8E2F98A94A401 foreign key (project_id) references Project;

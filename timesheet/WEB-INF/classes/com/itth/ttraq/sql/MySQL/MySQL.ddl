--alter table Assignment drop constraint FKB3FD62ED8A94A401;
--alter table Assignment drop constraint FKB3FD62EDF73AEE0F;
--alter table TimeStamp drop constraint FK78F858D6CD26E040;
--alter table TimeStamp drop constraint FK78F858D6F73AEE0F;
--alter table TimeStamp drop constraint FK78F858D68A94A401;
--alter table TimeStamp drop constraint FK78F858D6849B4488;
--alter table Project drop constraint FK50C8E2F98A94A401;
drop table if exists Type;
drop table if exists Status;
drop table if exists Assignment;
drop table if exists User;
drop table if exists TimeStamp;
drop table if exists Project;
create table Type (
   id varchar(255) not null,
   name varchar(128) not null,
   fee double precision,
   timeClearing bit,
   mtime datetime not null,
   ctime datetime not null,
   primary key (id)
);
create table Status (
   id varchar(255) not null,
   name varchar(128) not null,
   mtime datetime not null,
   ctime datetime not null,
   color varchar(32),
   primary key (id)
);
create table Assignment (
   id varchar(255) not null,
   user_id varchar(128),
   project_id varchar(128),
   manager bit not null,
   ctime datetime not null,
   primary key (user_id, project_id),
   unique (user_id, project_id)
);
create table User (
   id varchar(128) not null,
   login varchar(32) not null unique,
   password varchar(32) not null,
   firstName varchar(64) not null,
   lastName varchar(64),
   email varchar(96) not null,
   superuser bit not null,
   mtime datetime not null,
   ctime datetime not null,
   ltime datetime,
   primary key (id)
);
create table TimeStamp (
   id varchar(255) not null,
   begin datetime not null,
   end datetime not null,
   description text not null,
   open bit,
   deduct bit,
   fee double precision,
   ctime datetime not null,
   mtime datetime not null,
   project_id varchar(128),
   type_id varchar(255),
   status_id varchar(255),
   user_id varchar(128),
   primary key (id)
);
create table Project (
   id varchar(128) not null,
   name varchar(128) not null,
   description text,
   project_id varchar(128),
   mtime datetime not null,
   ctime datetime not null,
   primary key (id)
);
alter table Assignment add index FKB3FD62ED8A94A401 (project_id), add constraint FKB3FD62ED8A94A401 foreign key (project_id) references Project (id);
alter table Assignment add index FKB3FD62EDF73AEE0F (user_id), add constraint FKB3FD62EDF73AEE0F foreign key (user_id) references User (id);
alter table TimeStamp add index FK78F858D6CD26E040 (type_id), add constraint FK78F858D6CD26E040 foreign key (type_id) references Type (id);
alter table TimeStamp add index FK78F858D6F73AEE0F (user_id), add constraint FK78F858D6F73AEE0F foreign key (user_id) references User (id);
alter table TimeStamp add index FK78F858D68A94A401 (project_id), add constraint FK78F858D68A94A401 foreign key (project_id) references Project (id);
alter table TimeStamp add index FK78F858D6849B4488 (status_id), add constraint FK78F858D6849B4488 foreign key (status_id) references Status (id);
alter table Project add index FK50C8E2F98A94A401 (project_id), add constraint FK50C8E2F98A94A401 foreign key (project_id) references Project (id);

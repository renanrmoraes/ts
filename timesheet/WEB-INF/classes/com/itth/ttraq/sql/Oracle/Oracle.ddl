alter table Assignment drop constraint FKB3FD62ED8A94A401;
alter table Assignment drop constraint FKB3FD62EDF73AEE0F;
alter table TimeStamp drop constraint FK78F858D6CD26E040;
alter table TimeStamp drop constraint FK78F858D6F73AEE0F;
alter table TimeStamp drop constraint FK78F858D68A94A401;
alter table TimeStamp drop constraint FK78F858D6849B4488;
alter table Project drop constraint FK50C8E2F98A94A401;
drop table Type cascade constraints;
drop table Status cascade constraints;
drop table Assignment cascade constraints;
drop table User cascade constraints;
drop table TimeStamp cascade constraints;
drop table Project cascade constraints;
create table Type (
   id varchar2(255) not null,
   name varchar2(128) not null,
   fee double precision,
   timeClearing number(1,0),
   mtime date not null,
   ctime date not null,
   primary key (id)
);
create table Status (
   id varchar2(255) not null,
   name varchar2(128) not null,
   mtime date not null,
   ctime date not null,
   color varchar2(32),
   primary key (id)
);
create table Assignment (
   id varchar2(255) not null,
   user_id varchar2(128),
   project_id varchar2(128),
   manager number(1,0) not null,
   ctime date not null,
   primary key (user_id, project_id),
   unique (user_id, project_id)
);
create table User (
   id varchar2(128) not null,
   login varchar2(32) not null unique,
   password varchar2(32) not null,
   firstName varchar2(64) not null,
   lastName varchar2(64),
   email varchar2(96) not null,
   superuser number(1,0) not null,
   mtime date not null,
   ctime date not null,
   ltime date,
   primary key (id)
);
create table TimeStamp (
   id varchar2(255) not null,
   begin date not null,
   end date not null,
   description varchar2(65535) not null,
   open number(1,0),
   deduct number(1,0),
   fee double precision,
   ctime date not null,
   mtime date not null,
   project_id varchar2(128),
   type_id varchar2(255),
   status_id varchar2(255),
   user_id varchar2(128),
   primary key (id)
);
create table Project (
   id varchar2(128) not null,
   name varchar2(128) not null,
   description varchar2(65535),
   project_id varchar2(128),
   mtime date not null,
   ctime date not null,
   primary key (id)
);
alter table Assignment add constraint FKB3FD62ED8A94A401 foreign key (project_id) references Project;
alter table Assignment add constraint FKB3FD62EDF73AEE0F foreign key (user_id) references User;
alter table TimeStamp add constraint FK78F858D6CD26E040 foreign key (type_id) references Type;
alter table TimeStamp add constraint FK78F858D6F73AEE0F foreign key (user_id) references User;
alter table TimeStamp add constraint FK78F858D68A94A401 foreign key (project_id) references Project;
alter table TimeStamp add constraint FK78F858D6849B4488 foreign key (status_id) references Status;
alter table Project add constraint FK50C8E2F98A94A401 foreign key (project_id) references Project;

drop table Type cascade;
drop table Status cascade;
drop table Assignment cascade;
drop table User cascade;
drop table TimeStamp cascade;
drop table Project cascade;
create table Type (
   id varchar(255) not null,
   name varchar(128) not null,
   fee double precision,
   timeClearing smallint,
   mtime timestamp not null,
   ctime timestamp not null,
   primary key (id)
);
create table Status (
   id varchar(255) not null,
   name varchar(128) not null,
   mtime timestamp not null,
   ctime timestamp not null,
   color varchar(32),
   primary key (id)
);
create table Assignment (
   id varchar(255) not null,
   user_id varchar(128),
   project_id varchar(128),
   manager smallint not null,
   ctime timestamp not null,
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
   superuser smallint not null,
   mtime timestamp not null,
   ctime timestamp not null,
   ltime timestamp,
   primary key (id)
);
create table TimeStamp (
   id varchar(255) not null,
   begin timestamp not null,
   end timestamp not null,
   description varchar(65535) not null,
   open smallint,
   deduct smallint,
   fee double precision,
   ctime timestamp not null,
   mtime timestamp not null,
   project_id varchar(128),
   type_id varchar(255),
   status_id varchar(255),
   user_id varchar(128),
   primary key (id)
);
create table Project (
   id varchar(128) not null,
   name varchar(128) not null,
   description varchar(65535),
   project_id varchar(128),
   mtime timestamp not null,
   ctime timestamp not null,
   primary key (id)
);
alter table Assignment add constraint FKB3FD62ED8A94A401 foreign key (project_id) references Project;
alter table Assignment add constraint FKB3FD62EDF73AEE0F foreign key (user_id) references User;
alter table TimeStamp add constraint FK78F858D6CD26E040 foreign key (type_id) references Type;
alter table TimeStamp add constraint FK78F858D6F73AEE0F foreign key (user_id) references User;
alter table TimeStamp add constraint FK78F858D68A94A401 foreign key (project_id) references Project;
alter table TimeStamp add constraint FK78F858D6849B4488 foreign key (status_id) references Status;
alter table Project add constraint FK50C8E2F98A94A401 foreign key (project_id) references Project;

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
   timeClearing boolean null,
   mtime timestamp not null,
   ctime timestamp not null,
   primary key (id)
);
create table Status (
   id varchar(255) not null,
   name varchar(128) not null,
   mtime timestamp not null,
   ctime timestamp not null,
   color varchar(32) null,
   primary key (id)
);
create table Assignment (
   id varchar(255) not null,
   user_id varchar(128) null,
   project_id varchar(128) null,
   manager boolean not null,
   ctime timestamp not null,
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
   superuser boolean not null,
   mtime timestamp not null,
   ctime timestamp not null,
   ltime timestamp null,
   primary key (id)
);
create table TimeStamp (
   id varchar(255) not null,
   begin timestamp not null,
   end timestamp not null,
   description varchar(65535) not null,
   open boolean null,
   deduct boolean null,
   fee double precision null,
   ctime timestamp not null,
   mtime timestamp not null,
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
   mtime timestamp not null,
   ctime timestamp not null,
   primary key (id)
);
alter table Assignment foreign key FKB3FD62ED8A94A401 (project_id) references Project;
alter table Assignment foreign key FKB3FD62EDF73AEE0F (user_id) references User;
alter table TimeStamp foreign key FK78F858D6CD26E040 (type_id) references Type;
alter table TimeStamp foreign key FK78F858D6F73AEE0F (user_id) references User;
alter table TimeStamp foreign key FK78F858D68A94A401 (project_id) references Project;
alter table TimeStamp foreign key FK78F858D6849B4488 (status_id) references Status;
alter table Project foreign key FK50C8E2F98A94A401 (project_id) references Project;

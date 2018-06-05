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
   fee double,
   timeClearing smallint,
   mtime datetime year to fraction(5) not null,
   ctime datetime year to fraction(5) not null,
   primary key (id)
);
create table Status (
   id varchar(255) not null,
   name varchar(128) not null,
   mtime datetime year to fraction(5) not null,
   ctime datetime year to fraction(5) not null,
   color varchar(32),
   primary key (id)
);
create table Assignment (
   id varchar(255) not null,
   user_id varchar(128),
   project_id varchar(128),
   manager smallint not null,
   ctime datetime year to fraction(5) not null,
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
   mtime datetime year to fraction(5) not null,
   ctime datetime year to fraction(5) not null,
   ltime datetime year to fraction(5),
   primary key (id)
);
create table TimeStamp (
   id varchar(255) not null,
   begin datetime year to fraction(5) not null,
   end datetime year to fraction(5) not null,
   description varchar(65535) not null,
   open smallint,
   deduct smallint,
   fee double,
   ctime datetime year to fraction(5) not null,
   mtime datetime year to fraction(5) not null,
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
   mtime datetime year to fraction(5) not null,
   ctime datetime year to fraction(5) not null,
   primary key (id)
);
alter table Assignment add constraint  foreign key (project_id) references Project constraint FKB3FD62ED8A94A401;
alter table Assignment add constraint  foreign key (user_id) references User constraint FKB3FD62EDF73AEE0F;
alter table TimeStamp add constraint  foreign key (type_id) references Type constraint FK78F858D6CD26E040;
alter table TimeStamp add constraint  foreign key (user_id) references User constraint FK78F858D6F73AEE0F;
alter table TimeStamp add constraint  foreign key (project_id) references Project constraint FK78F858D68A94A401;
alter table TimeStamp add constraint  foreign key (status_id) references Status constraint FK78F858D6849B4488;
alter table Project add constraint  foreign key (project_id) references Project constraint FK50C8E2F98A94A401;

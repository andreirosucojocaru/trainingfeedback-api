drop database trainingfeedback;

create database trainingfeedback;

use trainingfeedback;

create table `role`(
  id                int(6) auto_increment not null primary key,
  name              varchar(20) not null
);

insert into `role`(name)
  values('admin');
insert into `role`(name)
  values('user');
  
create table `position`(
  id                int(6) auto_increment not null primary key,
  name              varchar(20) not null
);

insert into `position`(name)
  values('trainer');
insert into `position`(name)
  values('trainee');

create table `employee`(
  id                int(6) auto_increment not null primary key,
  first_name        varchar(50) not null,
  last_name         varchar(50) not null,
  employment_date   date not null,
  username          varchar(20) not null,
  password          varchar(100) not null,
  photo             longblob,
  role_id           int(6) not null,
  active            varchar(1) not null default 'Y'
);

alter table `employee`
  add constraint fk_employee_role_id foreign key(role_id) references `role`(id) on delete cascade;

create table `room`(
  id                int(6) auto_increment not null primary key,
  name              varchar(50) not null,
  location          varchar(50) not null,
  capacity          int(4) not null
);

create table `category`(
  id                int(6) auto_increment not null primary key,
  description       varchar(50) not null
);

create table `training`(
  id                int(6) auto_increment not null primary key,
  name              varchar(50) not null,
  duration          int(4),
  category_id       int(6) not null
);

alter table `training`
  add constraint fk_training_category_id foreign key(category_id) references `category`(id) on delete cascade;
  
create table `schedule` (
  id                 int(6) auto_increment not null primary key,
  training_id        int(6) not null,
  room_id            int(6) not null,
  timeframe          timestamp
);

alter table `schedule`
  add constraint fk_schedule_training_id foreign key(training_id) references `training`(id) on delete cascade;
alter table `schedule`
  add constraint fk_schedule_room_id foreign key(room_id) references `room`(id) on delete cascade;
  
create table `participant` (
  id                 int(6) auto_increment not null primary key,
  schedule_id        int(6) not null,
  employee_id        int(6) not null,
  position_id        int(6) not null
);

alter table `participant`
  add constraint fk_participant_schedule_id foreign key(schedule_id) references `schedule`(id) on delete cascade;
alter table `participant`
  add constraint fk_participant_employee_id foreign key(employee_id) references `employee`(id) on delete cascade;
alter table `participant`
  add constraint fk_participant_position_id foreign key(position_id) references `position`(id) on delete cascade;
  
create table `rating` (
  id                 int(6) auto_increment not null primary key,
  schedule_id        int(6) not null,
  trainer_id         int(6) not null,
  trainee_id         int(6) not null,
  grade              int(2) not null
);

alter table `rating`
  add constraint fk_rating_schedule_id foreign key(schedule_id) references `schedule`(id) on delete cascade;
alter table `rating`
  add constraint fk_rating_trainer_id foreign key(trainer_id) references `employee`(id) on delete cascade;
alter table `rating`
  add constraint fk_rating_trainee_id foreign key(trainee_id) references `employee`(id) on delete cascade;
drop database training_feedback;

create database training_feedback;

use training_feedback;

create table `role`(
  id                int(6) auto_increment not null primary key,
  name              varchar(20) not null
);

insert into `role`(name)
  values('admin');
insert into `role`(name)
  values('trainingteam');
insert into `role`(name)
  values('user');
  
create table `position`(
  id                int(6) auto_increment not null primary key,
  name              varchar(20) not null
);

insert into `position`(name)
  values('trainer');
insert into `position`(name)
  values('developer');
insert into `position`(name)
  values('tester');

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
  capacity          int(4) not null,
  phone_number      varchar(10)
);

insert into `room`(name, location, capacity, phone_number)
  values('Eminescu', '1st Floor', 20, '820');
insert into `room`(name, location, capacity)
  values('Brancusi', '1st Floor', 8);
insert into `room`(name, location, capacity, phone_number)
  values('Saligny', '2nd Floor', 15, '899');
insert into `room`(name, location, capacity, phone_number)
  values('Bacovia', '2nd Floor', 15, '877');

create table `category`(
  id                int(6) auto_increment not null primary key,
  description       varchar(50) not null
);

insert into `category`(description)
  values('Technical Course Development');
insert into `category`(description)
  values('Technical Course Technical Information');
insert into `category`(description)
  values('Soft Skills Course');
insert into `category`(description)
  values('Conference');
insert into `category`(description)
  values('Certification');
insert into `category`(description)
  values('Internal Training');
insert into `category`(description)
  values('Workshop');
  
create table `currency`(
  id                int(6) auto_increment not null primary key,
  code              varchar(3) not null,
  name              varchar(20) not null,
  symbol            varchar(1)
);

insert into `currency`(code, name)
  values('RON', 'Romanian Leu');
insert into `currency`(code, name, symbol)
  values('EUR', 'Euro', '€');
insert into `currency`(code, name, symbol)
  values('USD', 'United States Dollar', '$');
  
create table `cost_type`(
  id                int(6) auto_increment not null primary key,
  name              varchar(20) not null,
  description       varchar(100)
);

insert into `cost_type`(name, description)
  values('per_employee', 'The cost applies for each employee that attends the training.');
insert into `cost_type`(name, description)
  values('per_class', 'The cost applies for the entire class and it is split among all employees that attend the training.');

create table `training`(
  id                int(6) auto_increment not null primary key,
  name              varchar(50) not null,
  duration          int(4),
  category_id       int(6) not null,
  price             numeric(6,2),
  currency_id       int(6),
  cost_type_id      int(6)
);

alter table `training`
  add constraint fk_training_category_id foreign key(category_id) references `category`(id) on delete cascade;
alter table `training`
  add constraint fk_training_currency_id foreign key(currency_id) references `currency`(id) on delete cascade;
alter table `training`
  add constraint fk_training_cost_type_id foreign key(cost_type_id) references `cost_type`(id) on delete cascade;

create table `frequency`(
  id                 int(6) auto_increment not null primary key,
  name               varchar(20) not null,
  description        varchar(100)
);

insert into `frequency`(name, description)
  values('daily', 'This training occurs every day between the start timestamp and finish timestamp.');
insert into `cost_type`(name, description)
  values('weekly', 'This training occurs once a week between the start timestamp and finish timestamp.');
insert into `cost_type`(name, description)
  values('monthly', 'This training occurs once a month between the start timestamp and finish timestamp.');

create table `schedule`(
  id                 int(6) auto_increment not null primary key,
  training_id        int(6) not null,
  room_id            int(6) not null,
  frequency_id       int(6) not null,
  start              timestamp not null,
  finish             timestamp
);

alter table `schedule`
  add constraint fk_schedule_training_id foreign key(training_id) references `training`(id) on delete cascade;
alter table `schedule`
  add constraint fk_schedule_room_id foreign key(room_id) references `room`(id) on delete cascade;
alter table `schedule`
  add constraint fk_frequency_id foreign key(frequency_id) references `frequency`(id) on delete cascade;
  
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
  grade              int(2) not null,
  remark             varchar(1000)
);

alter table `rating`
  add constraint fk_rating_schedule_id foreign key(schedule_id) references `schedule`(id) on delete cascade;
alter table `rating`
  add constraint fk_rating_trainer_id foreign key(trainer_id) references `employee`(id) on delete cascade;
alter table `rating`
  add constraint fk_rating_trainee_id foreign key(trainee_id) references `employee`(id) on delete cascade;
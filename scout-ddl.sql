drop table if exists person;
drop table if exists contact;
drop table if exists statistics;
drop table if exists teams;
drop table if exists eligibility;
drop table if exists general;
drop table if exists recruitment;
drop table if exists socials;

create table person(
    ID integer primary key autoincrement,
    first_name varchar(30),
    last_name varchar(30),
    position varchar(3),
    date_of_birth varchar(10),
    grad_year numeric(4),
    gpa numeric(3,2),
    team_name varchar(75),

    foreign key (team_name) references teams(team_name)
);

create table general (
    date_of_birth varchar(10),
    hometown varchar(50),
    nationality varchar(50),

    primary key(date_of_birth)
);

create table body(
    ID integer,
    height integer,
    weight integer,
    wingspan numeric(3,1),
    vertical_leap numeric(3,1),

    foreign key(ID) references person(ID)
);

create table statistics(
    ID integer,
    PPG numeric(3,1),
    APG numeric(3,1),
    RPG numeric(3,1),
    BPG numeric(3,1),
    SPG numeric(3,1),
    field_goal_pct numeric(3,1),
    three_point_pct numeric(3,1),
    free_throw_pct numeric(3,1),

    primary key(ID),
    foreign key(ID) references person(ID)
);

create table contact(
    ID integer,
    social_media_id integer primary key autoincrement,
    email varchar(50),

    foreign key(ID) references person(ID)
);

create table numbers(
    contact_id integer,
    phone_number varchar(20),
    
    primary key(contact_id, phone_number),
    foreign key(contact_id) references contact(ID)
);

create table teams(
    team_name varchar(50),
    coach_name varchar(50),
    city varchar(50),
    state varchar(50),
    country varchar(50),

    primary key(team_name)
);

create table eligibility(
    grad_year integer,
    gpa numeric(3,2),
    is_postgraduate varchar(3),

    primary key (grad_year,gpa)
);

create table recruitment(
    player_visit_id integer,
    first_name varchar(50),
    last_name varchar(50),
    school varchar(50),
    date_of_visit varchar(10),
    official boolean,
    offered boolean,

    primary key (player_visit_id)
);

create table socials(
    social_media_id integer primary key autoincrement,
    Snapchat varchar(50),
    Instagram varchar(50),
    Twitter varchar(50)
);
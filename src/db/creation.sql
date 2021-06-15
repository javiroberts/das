create table role (
    id integer primary key not null identity,
    name varchar(32) not null,
    [read] bit not null default 1,
    write bit not null default 0,
    admin bit not null default 0
)

create table [user] (
    id integer primary key not null identity,
    cuil integer not null,
    first_name varchar(32) not null,
    last_name varchar(32) not null,
    email varchar(32) not null,
    password varchar(32) not null,
    validated bit not null default 0,
    role integer not null  foreign key references role(id)
)

create table service (
    id integer primary key not null identity,
    name varchar(32) not null,
    phone varchar(32) not null
)

create table assistance_status (
    id integer primary key not null identity,
    name varchar(32) not null
)

create table assistance (
    id integer primary key not null identity,
    service_id integer not null foreign key references service(id),
    user_id integer not null foreign key references [user](id),
    status_id integer not null foreign key references assistance_status(id),
    date datetime default GETDATE(),
    lat float not null,
    lng float not null,
    message varchar(255) not null,
    audio varbinary(max),
    photo varbinary(max)
)

create table message (
    id integer primary key not null identity,
    user_id integer not null foreign key references [user](id),
    service_id integer not null foreign key references service(id),
    assistance_id integer not null foreign key references assistance(id),
    date datetime default GETDATE(),
    message varchar(255) not null,
    attachment varbinary(max)
)

create table statistic (
    id integer primary key not null identity,
    service_id integer not null foreign key references service(id),
    measurement varbinary(max) not null
)

create table announcement_type (
    id integer primary key not null identity,
    name varchar(32)
)

create table announcement (
    id integer primary key not null identity,
    announcement_type_id integer not null foreign key references announcement_type(id),
    title varchar(255) not null,
    subtitle varchar(255) not null,
    author varchar(32) not null,
    date datetime not null default GETDATE(),
    body varchar(max) not null
)

create table announcement_attachment (
    id integer primary key not null identity,
    announcement_id integer not null foreign key references announcement(id),
    attachment varbinary(max) not null
)
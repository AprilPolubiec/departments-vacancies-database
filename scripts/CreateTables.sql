CREATE TABLE `polubiec23200836`.Candidates (
	id int primary key auto_increment,
	first_name varchar(45) not null,
	surname varchar(45) not null,
	street_address_1 varchar(45),
	street_address_2 varchar(45),
	post_code varchar(45),
	phone varchar(45)
);

ALTER TABLE `polubiec23200836`.Candidates
ADD CONSTRAINT unique_name_number UNIQUE (first_name, surname, phone);

CREATE INDEX idx_surname on `polubiec23200836`.Candidates (surname);

ALTER TABLE `polubiec23200836`.Candidates AUTO_INCREMENT=1000;

CREATE TABLE `polubiec23200836`.Skills (
	id int primary key auto_increment,
	name varchar(45) not null unique
);

CREATE TABLE `polubiec23200836`.Positions (
	id int primary key auto_increment,
    name varchar(45) not null unique,
    position_type varchar(45),
    department_id int
		references Departments(id)
        on delete set null
        on update cascade
);

ALTER TABLE `polubiec23200836`.Positions
ADD FOREIGN KEY (department_id) REFERENCES Departments(id)
on delete set null
on update cascade;

ALTER TABLE `polubiec23200836`.Positions
ADD CONSTRAINT unique_position_dept UNIQUE (name, department_id);

ALTER TABLE `polubiec23200836`.Positions
ADD openings int default 0;

CREATE TABLE `polubiec23200836`.Departments (
	id int primary key auto_increment,
	name varchar(45) not null,
    street_address_1 varchar(45),
    street_address_2 varchar(45),
    post_code varchar(45),
	phone_number varchar(45)
);

ALTER TABLE `polubiec23200836`.Departments
ADD CONSTRAINT unique_dept_address UNIQUE (name, street_address_1, street_address_2);

CREATE INDEX idx_name on `polubiec23200836`.Departments (name);

CREATE TABLE `polubiec23200836`.Interviews (
	id int primary key auto_increment,
	interview_date datetime,
    candidate_id int
		references Candidates(id)
        on delete set null
        on update cascade,
    position_id int
		references Positions(id)
        on delete no action
        on update cascade
);

CREATE INDEX idx_position on `polubiec23200836`.Interviews(position_id);

ALTER TABLE `polubiec23200836`.Interviews
ADD FOREIGN KEY (candidate_id)
references Candidates(id)
on delete set null
on update cascade;

ALTER TABLE `polubiec23200836`.Interviews
ADD FOREIGN KEY (position_id)
references Positions(id)
on delete no action
on update cascade;

CREATE TABLE `polubiec23200836`.CandidateSkills (
	candidate_id int
		references Candidates(id)
        on delete cascade
        on update cascade,
    skill_id int
		references Skills(id)
        on delete cascade
        on update cascade,
    unique (candidate_id, skill_id)
);

CREATE INDEX idx_candidate on `polubiec23200836`.CandidateSkills(skill_id);

ALTER TABLE `polubiec23200836`.CandidateSkills
ADD FOREIGN KEY (candidate_id)
references Candidates(id)
on delete cascade
on update cascade;

ALTER TABLE `polubiec23200836`.CandidateSkills
ADD FOREIGN KEY (skill_id)
references Skills(id)
on delete cascade
on update cascade;


CREATE TABLE `polubiec23200836`.PositionSkills (
	position_id int
		references Positions(id)
        on delete no action
        on update cascade,
    skill_id int
		references Skills(id)
        on delete cascade
        on update cascade,
    unique (position_id, skill_id)
);

ALTER TABLE `polubiec23200836`.PositionSkills
ADD FOREIGN KEY (skill_id)
references Skills(id)
on delete cascade
on update cascade;

ALTER TABLE `polubiec23200836`.PositionSkills
ADD FOREIGN KEY (position_id)
references Positions(id)
on delete no action
on update cascade;


CREATE TABLE `polubiec23200836`.Offers (
	id int primary key auto_increment,
	offer_date datetime,
    candidate_id int
		references Candidates(id)
        on delete set null
        on update cascade,
    position_id int
		references Positions(id)
        on delete no action
        on update cascade
);

CREATE INDEX idx_position on `polubiec23200836`.Offers(position_id);


ALTER TABLE `polubiec23200836`.Offers
ADD FOREIGN KEY (candidate_id)
references Candidates(id)
on delete set null
on update cascade;

ALTER TABLE `polubiec23200836`.Offers
ADD FOREIGN KEY (position_id)
references Positions(id)
on delete no action
on update cascade;
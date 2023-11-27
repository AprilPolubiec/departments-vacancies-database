INSERT INTO `polubiec23200836`.Departments (name, street_address_1, street_address_2, post_code, phone_number)
VALUES
    ('Sales Department', '123 Main St', 'Suite 101', '11111', '555-111-1111'),
    ('Engineering Department', '456 Elm St', NULL, '22222', '555-222-2222'),
    ('Marketing Department', '789 Oak St', NULL, '33333', '555-333-3333'),
    ('IT Department', '101 Pine St', 'Floor 5', '44444', '555-444-4444'),
    ('Customer Support', '202 Maple St', NULL, '55555', '555-555-5555'),
    ('Quality Assurance', '303 Cedar St', NULL, '66666', '555-666-6666'),
    ('Finance Department', '404 Birch St', 'Suite 200', '77777', '555-777-7777'),
    ('Product Development', '505 Redwood St', NULL, '88888', '555-888-8888'),
    ('Human Resources', '606 Walnut St', NULL, '99999', '555-999-9999'),
    ('Legal Department', '707 Fir St', 'Room 303', '00000', '555-000-0000');

INSERT INTO `polubiec23200836`.Candidates (first_name, surname, street_address_1, street_address_2, post_code, phone)
VALUES
    ('Emily', 'Smith', '123 Oak St', 'Apt 101', '11111', '555-111-1111'),
    ('Michael', 'Johnson', '456 Main St', NULL, '22222', '555-222-2222'),
    ('Sophia', 'Brown', '789 Elm St', NULL, '33333', '555-333-3333'),
    ('William', 'Davis', '101 Cedar St', 'Suite 5', '44444', '555-444-4444'),
    ('Olivia', 'Wilson', '202 Maple Ave', NULL, '55555', '555-555-5555'),
    ('James', 'Martin', '303 Birch Ln', NULL, '66666', '555-666-6666'),
    ('Ava', 'Lee', '404 Pine St', 'Unit 200', '77777', '555-777-7777'),
    ('Liam', 'Garcia', '505 Beach Rd', NULL, '88888', '555-888-8888'),
    ('Emma', 'Anderson', '606 Sunset Rd', NULL, '99999', '555-999-9999'),
    ('Noah', 'Perez', '707 Mountain Ct', 'Room 303', '00000', '555-000-0000');

INSERT INTO `polubiec23200836`.Skills (name)
VALUES
    ('Java Programming'),
    ('Data Analysis'),
    ('Customer Service'),
    ('Project Management'),
    ('Graphic Design'),
    ('Administrative'),
    ('Content Writing'),
    ('Network Security'),
    ('Financial Analysis'),
    ('Mobile App Development');

INSERT INTO `polubiec23200836`.CandidateSkills (candidate_id, skill_id)
VALUES
    (1000, 1),
    (1000, 10),
    (1000, 2),
    (1001, 2),
    (1002, 3),
    (1002, 5),
    (1003, 4),
    (1004, 5),
    (1004, 6),
    (1004, 7),
    (1005, 6),
    (1006, 7),
    (1006, 3),
    (1007, 8),
    (1007, 1),
    (1008, 9),
    (1008, 1),
    (1008, 5),
    (1008, 4),
    (1009, 10);

INSERT INTO `polubiec23200836`.Positions (name, position_type, department_id)
VALUES
    ('Sales Manager', 'Sales', 1),
    ('Engineering Manager', 'Management', 2),
    ('Software Engineer', 'Tech', 2),
    ('Software Engineer II', 'Tech', 2),
    ('Social Media Manager', 'Marketing', 3),
    ('Customer Service Representative', 'Remote', 4),
    ('Chief Financial Officer', 'Executive', 7),
    ('Product Manager', 'Management', 8),
    ('Hiring Manager', 'HR', 9),
    ('Executive Legal Advisor', 'Executive', 10);

INSERT INTO `polubiec23200836`.PositionSkills (position_id, skill_id)
VALUES
    (1, 7),
    (2, 1),
    (2, 10),
    (2, 8),
    (3, 1),
    (4, 10),
    (5, 5),
    (5, 2),
    (6, 6),
    (7, 9),
    (8, 4),
    (9, 7);

INSERT INTO `polubiec23200836`.Interviews (interview_date, candidate_id, position_id)
VALUES
	-- Candidate 1000 had one interview for 2 roles
    ('2023-11-01 12:00:00', 1000, 4),
    ('2023-11-01 12:00:00', 1000, 3),
    -- Candidate 1001-1007 had one interview
    ('2023-11-01 14:00:00', 1001, 4),
    ('2023-11-01 09:00:00', 1002, 8),
    ('2023-11-04 13:00:00', 1003, 4),
    ('2023-11-05 10:30:00', 1004, 9),
    ('2023-11-06 09:30:00', 1005, 5),
    ('2023-11-07 11:00:00', 1006, 1),
    ('2023-11-08 11:30:00', 1007, 5),
    -- Candidate 1008 had 2 interviews for 1 role
    ('2023-11-09 13:30:00', 1008, 6),
    ('2023-11-10 12:00:00', 1008, 6),
    ('2023-11-10 08:30:00', 1009, 7);
    

INSERT INTO `polubiec23200836`.Offers (offer_date, candidate_id, position_id)
VALUES
    ('2023-11-05 12:00:00', 1000, 4),
    ('2023-11-10 13:00:00', 1000, 3),
    ('2023-11-05 8:30:00', 1001, 4),
    ('2023-11-05 8:30:00', 1002, 8),
    ('2023-11-10 13:30:00', 1003, 4),
    ('2023-11-10 13:30:00', 1004, 9),
    ('2023-11-11 12:30:00', 1005, 5),
    ('2023-11-12 13:30:00', 1006, 1),
    ('2023-11-13 9:30:00', 1008, 6),
    ('2023-11-20 10:30:00', 1009, 7);

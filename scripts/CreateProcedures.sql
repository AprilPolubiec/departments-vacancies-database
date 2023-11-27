DELIMITER //
CREATE PROCEDURE `polubiec23200836`.CreateCandidate
   (IN FirstName nvarchar(45),
    IN Surname nvarchar(45),
    IN StreetAddress1 nvarchar(45),
    IN StreetAddress2 nvarchar(45),
    IN PostCode nvarchar(45),
    IN Phone nvarchar(45))
BEGIN
INSERT INTO Candidates (first_name, surname, street_address_1, street_address_2, post_code, phone)
VALUES
    (FirstName, Surname, StreetAddress1, StreetAddress2, PostCode, Phone);
END //

DELIMITER //
CREATE PROCEDURE `polubiec23200836`.CreateSkill
    (IN Name nvarchar(45))
BEGIN
INSERT INTO Skills (name)
VALUES
    (Name);
END //


CREATE PROCEDURE `polubiec23200836`.CreatePosition
    (IN Name nvarchar(45),
    IN PositionType nvarchar(45),
    IN DepartmentId int)
BEGIN
INSERT INTO Positions (name, position_type, department_id)
VALUES
    (Name, PositionType, DepartmentId);
END //

DELIMITER //
CREATE PROCEDURE `polubiec23200836`.CreateDepartment
    (IN Name nvarchar(45),
    IN StreetAddress1 nvarchar(45),
    IN StreetAddress2 nvarchar(45),
    IN PostCode nvarchar(45),
    IN Phone nvarchar(45))
BEGIN
INSERT INTO Departments (name, street_address_1, street_address_2, post_code, phone_number)
VALUES
    (Name, StreetAddress1, StreetAddress2, PostCode, Phone);
END //

CREATE PROCEDURE `polubiec23200836`.CreateInterview
    (IN InterviewDate nvarchar(45),
    IN CandidateId int,
    IN PositionId int)
BEGIN
INSERT INTO Interviews (interview_date, candidate_id, position_id)
VALUES
    (InterviewDate, CandidateId, PositionId);
END //

DELIMITER //
CREATE PROCEDURE `polubiec23200836`.CreateCandidateSkill
    (IN CandidateId int,
    IN SkillId int)
BEGIN
INSERT INTO CandidateSkills (candidate_id, skill_id)
VALUES
    (CandidateId, SkillId);
END //

CREATE PROCEDURE `polubiec23200836`.CreatePositionSkill
    (IN PositionId int,
    IN SkillId int)
BEGIN
INSERT INTO PositionSkills (position_id, skill_id)
VALUES
    (PositionId, SkillId);
END //

DELIMITER //
CREATE PROCEDURE `polubiec23200836`.CreateOffer
    (IN offerDate datetime, IN candidateId int, IN positionId int)
BEGIN
INSERT INTO Offers (offer_date, candidate_id, position_id)
VALUES
    (offerDate, candidateId, positionId);
END //


-- the candidates with a given first name.
DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q1_get_candidate_by_first_name(IN FirstName varchar(45))
BEGIN
SELECT * 
FROM `polubiec23200836`.Candidates
WHERE first_name = FirstName;
END //

-- the surname of candidates with a given candidate identifier.
DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q2_get_candidate_surname(IN CandidateId int)
BEGIN
SELECT surname
FROM `polubiec23200836`.Candidates
WHERE id = CandidateId;
END //

-- the departments with a given department name.
DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q3_get_department_by_name(IN DeptName varchar(45))
BEGIN
SELECT * 
FROM `polubiec23200836`.Departments
WHERE name = DeptName;
END //

-- the candidates who have at least one skill required by a given position identifier.
DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q4_get_qualified_candidates(IN PositionId int)
BEGIN
SELECT distinct(c.id), c.first_name, c.surname, c.street_address_1, c.street_address_2, c.post_code, c.phone
FROM `polubiec23200836`.Candidates c, 
	 `polubiec23200836`.CandidateSkills cs, 
     `polubiec23200836`.Positions p, 
     `polubiec23200836`.PositionSkills ps
WHERE c.id = cs.candidate_id AND cs.skill_id = ps.skill_id AND p.id = ps.position_id AND p.Id = PositionId;
END //

-- the positions requiring a given skill.
DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q5_get_positions_requiring_skill_by_id(IN SkillId int)
BEGIN
SELECT p.id as position_id, p.name as position_name, p.position_type, p.department_id
FROM `polubiec23200836`.Positions p, `polubiec23200836`.PositionSkills ps
WHERE p.id = ps.position_id and ps.skill_id = SkillId;
END //

DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q5a_get_positions_requiring_skill_by_name(IN SkillName varchar(45))
BEGIN
SELECT p.id as position_id, p.name as position_name, p.position_type, p.department_id
FROM `polubiec23200836`.Positions p, `polubiec23200836`.PositionSkills ps, `polubiec23200836`.Skills s
WHERE s.name = SkillName and p.id = ps.position_id and s.id = ps.skill_id;
END //

-- the number of candidates that have been offered a position.
DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q6_count_offers()
SELECT Count(DISTINCT(candidate_id)) as offers
FROM `polubiec23200836`.Offers;
END //

DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q6a_count_offers_for_position(IN PositionId int)
SELECT Count(DISTINCT(candidate_id)) as offers
FROM `polubiec23200836`.Offers o
WHERE o.position_id = PositionId;
END //

DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q6b_count_offers_by_position()
SELECT position_id, Count(DISTINCT(candidate_id)) as offers
FROM `polubiec23200836`.Offers
GROUP BY position_id;
END //

-- the number of positions that require administrative skills.
DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q7_get_admin_positions()
BEGIN
SELECT Count(DISTINCT(p.id)) as positions
FROM `polubiec23200836`.Positions p, `polubiec23200836`.PositionSkills ps
WHERE p.id = ps.position_id and ps.skill_id = 6;
END //

-- the identifier of candidates that were interviewed ONLY on a given date.
DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q8_get_candidates_interviewed_on_date(IN InterviewDate datetime)
BEGIN
SELECT c.Id
FROM `polubiec23200836`.Candidates c, `polubiec23200836`.Interviews i
WHERE c.id = i.candidate_id and i.interview_date = InterviewDate
GROUP BY c.Id
HAVING COUNT(i.interview_date) = 1;
END //

-- the interviews that occurred on a given date.
DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q9_get_interviews_on_date(IN InterviewDate date)
BEGIN
SELECT * 
FROM `polubiec23200836`.Interviews
WHERE interview_date = InterviewDate;
END //

-- the positions sorted according to the departments who are offering them.
DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q10_get_positions_sorted_by_department_id()
BEGIN
SELECT * 
FROM `polubiec23200836`.Positions
ORDER BY department_id;
END //

DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q10a_get_positions_sorted_by_department_name()
BEGIN
SELECT p.id, p.name, p.position_type, p.department_id, d.name, p.openings
FROM `polubiec23200836`.Positions p, `polubiec23200836`.Departments d
WHERE d.Id = p.department_id
ORDER BY d.name;
END //

-- the name and identifier of candidates that were interviewed more than once.
DELIMITER //
CREATE PROCEDURE `polubiec23200836`.Q11_get_candidates_interviewed_multiple_times()
BEGIN
SELECT c.first_name, c.surname, c.id, COUNT(i.interview_date) as interview_count
FROM `polubiec23200836`.Candidates c, `polubiec23200836`.Interviews i
WHERE c.id = i.candidate_id
GROUP BY c.id
HAVING COUNT(i.interview_date) > 1;
END //


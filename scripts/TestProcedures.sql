call `polubiec23200836`.Q1_get_candidate_by_first_name('Ava');
call `polubiec23200836`.Q2_get_candidate_surname('1006');
call `polubiec23200836`.Q3_get_department_by_name('Marketing');
call `polubiec23200836`.Q4_get_qualified_candidates(2);
call `polubiec23200836`.Q5_get_positions_requiring_skill_by_id(1);
call `polubiec23200836`.Q5a_get_positions_requiring_skill_by_name('Content Writing');
call `polubiec23200836`.Q6_count_offers();
call `polubiec23200836`.Q6a_count_offers_for_position(1);
call `polubiec23200836`.Q6b_count_offers_by_position();
call `polubiec23200836`.Q7_get_admin_positions();
call `polubiec23200836`.Q8_get_candidates_interviewed_on_date('2023-11-01');
call `polubiec23200836`.Q9_get_interviews_on_date('2023-11-01');
call `polubiec23200836`.Q10_get_positions_sorted_by_department_id();
call `polubiec23200836`.Q10a_get_positions_sorted_by_department_name();
call `polubiec23200836`.Q11_get_candidates_interviewed_multiple_times();

-- Phone number as varchar because numbers might lose 0s etc
call `polubiec23200836`.CreateCandidate('April', 'Polubiec', 'Roebuck Hall', 'Apt 14, Room 2', 'D04V3V5', '353877600715');
Select * from `polubiec23200836`.Candidates;
call `polubiec23200836`.CreateCandidateSkill(1010, 10);
call `polubiec23200836`.CreateCandidateSkill(1010, 1);
call `polubiec23200836`.CreateCandidateSkill(1010, 3);
call `polubiec23200836`.CreateSkill("SQL");
call `polubiec23200836`.CreateCandidateSkill(1010, 11);
call `polubiec23200836`.CreateDepartment('Customer Support', '68 Emerson Ave', null, '10520', '+1-914-827-9188');
Select * from `polubiec23200836`.Departments;
call `polubiec23200836`.CreatePosition('Customer Service Analyst', 'Analytics', 11);
Select * from `polubiec23200836`.Positions;
call `polubiec23200836`.CreatePositionSkill(11, 2);
call `polubiec23200836`.CreatePositionSkill(11, 3);
call `polubiec23200836`.CreateInterview('2023-11-09 10:00:00', 1010, 4);
call `polubiec23200836`.CreateOffer('2023-11-19 10:00:00', 1010, 4);

SELECT Count(DISTINCT(p.id)) as positions
FROM `polubiec23200836`.Positions p, `polubiec23200836`.PositionSkills ps
WHERE p.id = ps.position_id and ps.skill_id = 6;

SELECT c.first_name, c.surname, c.id, COUNT(i.interview_date) as interview_count
FROM `polubiec23200836`.Candidates c, `polubiec23200836`.Interviews i
WHERE c.id = i.candidate_id
GROUP BY c.id
HAVING COUNT(i.interview_date) > 1;
# Write your MySQL query statement below
With c as(Select 
s.student_id, 
s.student_name, 
sub.subject_name
from students as s
cross join subjects sub

)

Select 
c.student_id, 
c.student_name, 
c.subject_name,
count(e.subject_name) as attended_exams
from c
left join Examinations e 
on e.student_ID = c.student_id
and e.subject_name = c.subject_name
group by sub.subject_name, s.student_name, 
s.student_id
ORDER BY c.student_id ASC, c.subject_name ASC;



-- I need to append each person to a subject name, then count every instance in which they appeared 
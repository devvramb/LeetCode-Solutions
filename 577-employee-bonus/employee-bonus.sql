# Write your MySQL query statement below
Select 
B.Bonus, 
E.name
From 
Employee as E
Left join Bonus as B
on B.empId = E.empId
Where B.bonus < 1000
OR b.bonus is null 
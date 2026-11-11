# Write your MySQL query statement below
Select 
x,
y,
z,
IF (x + y > z and x + z > y and y + z > x,'Yes', 'No') as triangle
from Triangle
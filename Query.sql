CREATE TABLE notes(
grade numeric(10,0) not null,
Min_Value numeric(3,0) not null,
Max_Value numeric(3,0) not null
)
go

INSERT INTO students values (1,'Julia',81)
INSERT INTO students values (2,'Carol',68)
INSERT INTO students values (3,'Maria',99)
INSERT INTO students values (4,'Andreia',78)
INSERT INTO students values (5,'Jaqueline',63)
INSERT INTO students values (6,'Marcela',88)

go

INSERT INTO notes values (1,0,9)
INSERT INTO notes values (2,10,19)
INSERT INTO notes values (3,20,29)
INSERT INTO notes values (4,30,39)
INSERT INTO notes values (5,40,49)
INSERT INTO notes values (6,50,59)
INSERT INTO notes values (7,60,69)
INSERT INTO notes values (8,70,79)
INSERT INTO notes values (9,80,89)
INSERT INTO notes values (10,90,100 )  
go



WITH students_report as
(
	SELECT s.name,
	(SELECT n.grade FROM notes n WHERE s.value BETWEEN n.Min_Value AND n.Max_Value) grade
	, s.value
	FROM students s
)
SELECT 
CASE WHEN grade < 8 THEN NULL ELSE name END name,grade,value FROM students_report 
ORDER BY 
	CASE WHEN grade < 8 THEN grade END  ASC, 
	CASE WHEN grade >=8 THEN grade END desc, name asc

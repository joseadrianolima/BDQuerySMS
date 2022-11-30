create table dogs(id numeric(3), name varchar(50) not null)

create table cats(id numeric(3), name varchar(50) not null)


INSERT INTO dogs Values (1,'ABC0')
INSERT INTO dogs Values (2,'CBA')

INSERT INTO cats Values (1,'ddd')
INSERT INTO cats Values (2,'CcccBA')




WITH ANAMES AS (
	SELECT name FROM dogs
	UNION ALL
	SELECT name FROM cats
)
SELECT DISTINCT NAME FROM ANAMES


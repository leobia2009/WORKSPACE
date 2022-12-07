show databases;
use teste;
CREATE TABLE favorite_food(
   person_id smallint unsigned,
   food varchar(20),
   constraint pk_favorite_food PRIMARY KEY (person_id, food),
   CONSTRAINT fk_favorite_food_person_id FOREIGN KEY(person_id) REFERENCES person(person_id)
);
DESC favorite_food;
SHOW DATABASES;
SELECT * FROM information_schema.table_constraints
	WHERE (CONSTRAINT_SCHEMA = "teste") AND (TABLE_NAME = "person");
 desc person;
 INSERT INTO person values('1', 'Bianca', 'Bona', 'F', '1970/11/03',
							'Presidente Washington Luis 644', 'Santa Luzia',
                            'Minas Gerais', 'Brazil','33035-310','14000' ) ,
                            ('2', 'Lucca', 'Bona', 'M', '1999/12/16',
							'Presidente Washington Luis 644', 'Santa Luzia',
                            'Minas Gerais', 'Brazil','33035-310','0' ),
                            ('3', 'Leopoldo', 'Paolucci', 'M', '1962/03/03',
							'Presidente Washington Luis 644', 'Santa Luzia',
                            'Minas Gerais', 'Brazil','33035-310','4000' );
 SELECT * FROM person;
 
 INSERT INTO favorite_food values('1', 'lasanha') ,
								 ('2', 'picanha'),
								 ('3', 'dobradinha');
 SELECT * FROM favorite_food;
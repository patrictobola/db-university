-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT * FROM `students` WHERE YEAR(`date_of_birth`) = 1990; 

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT * FROM `courses` WHERE `cfu` > 10; 

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT *, DATE_ADD(NOW(), INTERVAL -30 YEAR) AS `now` FROM `students` HAVING DATE(`date_of_birth`) <= DATE(`now`); 

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT * FROM `courses` WHERE `period` LIKE 'I semestre' AND `year` = 1; 

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

SELECT * FROM `exams` WHERE HOUR(`hour`) >= 14 AND `date` LIKE '2020-06-20'; 

-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT * FROM `degrees` WHERE `level` LIKE 'magistrale%'; 

-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(*) AS `total_departments` FROM `departments`; 

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT * FROM `teachers` WHERE `phone` IS NULL; 
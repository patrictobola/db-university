-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(`id`) AS `students`, YEAR(`enrolment_date`) AS `anno_iscrizione` FROM `students` GROUP BY `anno_iscrizione`; 

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(`id`) AS `teachers`, `office_address` AS `office` FROM `teachers` GROUP BY `office`; 

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id`, ROUND(AVG(`vote`), 2) FROM `exam_student` GROUP BY `exam_id`; 

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(`id`) AS `courses`, `department_id` FROM `degrees` GROUP BY `department_id`; 
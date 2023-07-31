-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT S.`registration_number`, S.`name`, S.`surname`
FROM `students` AS S
JOIN `degrees` AS D ON D.`id` = S.`degree_id`
WHERE D.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT DEG.`name`
FROM `degrees` AS DEG
JOIN `departments` AS DEP ON DEP.`id` = DEG.`department_id`
WHERE DEP.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT T.`id`, T.`name`, T.`surname`, C.`name` AS 'course_name'
FROM `teachers` AS T
JOIN `course_teacher` AS CT ON T.`id` = CT.`teacher_id`
JOIN `courses` AS C ON C.`id` = CT.`course_id`
WHERE T.`id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT S.`surname`, S.`name`, DEG.`name` AS 'Nome Corso', DEP.`name` AS 'Nome Dipartimento'
FROM `students` AS S
JOIN `degrees` AS DEG ON DEG.`id` = S.`degree_id`
JOIN `departments` AS DEP ON DEP.`id` = DEG.`department_id`
ORDER BY S.`surname` ASC, S.`name` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT D.`name` AS 'Corso di laurea', C.`name` AS 'Corsi', T.`name` AS 'Teacher Name', T.`surname` AS 'Teacher Surname' 
FROM `degrees` AS D
JOIN `courses` AS C ON D.`id` = C.`degree_id`
JOIN `course_teacher` AS CT ON C.`id` = CT.`course_id`
JOIN `teachers` AS T ON T.`id` = CT.`teacher_id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT T.`name`, T.`surname`, DEP.`name`
FROM `teachers` AS T
JOIN `course_teacher` AS CT ON T.`id` = CT.`teacher_id`
JOIN `courses` AS C ON C.`id` = CT.`course_id`
JOIN `degrees` AS DEG ON DEG.`id` = C.`degree_id`
JOIN `departments` AS DEP ON DEP.`id` = DEG.`department_id`
WHERE DEP.`name` = 'Dipartimento di Matematica';

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

SELECT COUNT(E.`course_id`) AS 'Tentativi', C.`name` AS 'Nome Esame', S.`surname`, S.`name`
FROM `students` AS S
JOIN `exam_student` AS ES ON S.`id` = ES.`student_id`
JOIN `exams` AS E ON E.`id` = ES.`exam_id`
JOIN `courses` AS C ON C.`id` = E.`course_id`
GROUP BY E.`course_id`, S.`surname`, S.`name`, C.`name`;
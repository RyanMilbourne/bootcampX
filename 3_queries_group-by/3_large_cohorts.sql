SELECT cohorts.name,
  count(students.id) AS student_count
FROM cohorts
  JOIN students ON cohorts.id = cohort_id
GROUP BY cohorts.name
HAVING count(students.id) >= 18
ORDER BY count(students.id);
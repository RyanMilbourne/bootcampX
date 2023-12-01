SELECT teachers.name AS teacher,
  cohorts.name AS cohort,
  COUNT(assistance_requests.created_at) AS total_assistances
FROM teachers
  JOIN assistance_requests ON teacher_id = teachers.id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teacher,
  cohort
ORDER BY teacher;
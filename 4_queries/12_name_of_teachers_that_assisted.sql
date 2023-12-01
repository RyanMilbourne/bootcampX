SELECT teachers.name AS teacher,
  cohorts.name AS cohort
FROM teachers
  JOIN assistance_requests ON assistance_requests.teacher_id = teachers.id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY cohort,
  teacher;
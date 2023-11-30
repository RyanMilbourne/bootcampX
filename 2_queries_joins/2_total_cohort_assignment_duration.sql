SELECT SUM(assignment_submissions.duration) AS total_duration
FROM assignment_submissions
  JOIN students ON students.id = student_id
  JOIN cohorts ON students.cohort_id = cohorts.id
WHERE students.cohort_id = 1;
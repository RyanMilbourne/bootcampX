SELECT cohorts.name,
  SUM(completed_at - created_at) AS total_duration
FROM assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY total_duration;
SELECT avg(subquery_alias.total_duration) as average_total_duration
FROM (
    SELECT cohorts.name,
      SUM(completed_at - started_at) AS total_duration
    FROM assistance_requests
      JOIN students ON students.id = student_id
      JOIN cohorts ON cohorts.id = students.cohort_id
    GROUP BY cohorts.name
    ORDER BY total_duration
  ) AS subquery_alias;
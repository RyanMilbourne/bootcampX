SELECT assignment_id AS id,
  assignments.name AS name,
  assignments.day AS day,
  assignments.chapter AS chapter,
  COUNT(created_at) AS total_requests
FROM assistance_requests
  JOIN assignments ON assignments.id = assignment_id
GROUP BY assignments.name,
  assignments.day,
  assignments.chapter,
  assignment_id
ORDER BY total_requests DESC;
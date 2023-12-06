const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const args = process.argv.slice(2);

pool.query(`
    SELECT DISTINCT teachers.name AS teacher,
    cohorts.name AS cohort
    FROM teachers
    JOIN assistance_requests ON teacher_id = teachers.id
    JOIN students ON students.id = student_id
    JOIN cohorts ON cohorts.id = cohort_id
    WHERE cohorts.name = '${args[0]}'
    ORDER BY teacher;
  `)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.cohort}: ${user.teacher}`)
    })
  })
  .catch(err => console.error('query error', err.stack))
  .finally(() => pool.end());
import { pool } from "../config/mysql-config";

export async function getEmployees(limit) {
  const [rows] = await pool.query(`SELECT emp_no FROM salaries limits ${limit || 10}`);
  console.log(rows);
  return rows;
}

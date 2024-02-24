SELECT e.name AS employee,e.role AS employee_role, d.name AS department
FROM plenary-anagram-413215.employee_id.employees AS e
LEFT JOIN plenary-anagram-413215.employee_id.departments AS d
ON e.department_id = d.department_id

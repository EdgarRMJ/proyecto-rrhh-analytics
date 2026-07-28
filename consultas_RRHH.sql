---- Esta consulta calcula el promedio de salario por departamento ----
------ This query calculates the average salary per department ------
SELECT d.nombre, ROUND(AVG(e.salario), 2) AS salario_promedio
FROM departamentos d
INNER JOIN empleados e
ON d.id = e.departamento_id
GROUP BY d.nombre;


-- Esta consulta calcula el promedio de antigüedad por departamento --
----- This query calculates the average seniority by department -----
SELECT d.nombre, ROUND(AVG(julianday('now') - julianday(fecha_ingreso)) / 365, 2)
AS  antiguedad_promedio
FROM departamentos d
INNER JOIN empleados e
ON d.id = e.departamento_id 
GROUP BY d.nombre;

--- Esta consulta calcula la cantidad de empleados por antigüedad ---
---- This query calculates the number of employees by seniority ----
SELECT CASE WHEN (julianday('now') - julianday(fecha_ingreso)) / 365 < 2 
THEN 'Nuevo' 
WHEN (julianday('now') - julianday(fecha_ingreso)) / 365 <= 5 
THEN 'Intermedio' 
ELSE 'Senior' 
END AS rango, COUNT(*) 
AS cantidad 
FROM empleados 
GROUP BY rango;    
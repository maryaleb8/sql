USE master
--������� ���� �� ����������� ���� ���� ���������, � �������� ������� ���� ����� 'WIFF SOFTBALL'
	/*SELECT list_price --� ������� 1v1.0
	FROM PRICE INNER JOIN PRODUCT ON PRICE.PRODUCT_ID = PRODUCT.PRODUCT_ID
	WHERE [description] LIKE '%WIFF SOFTBALL%' AND (end_date is NULL or end_date > getdate());*/

	/*SELECT actual_price--� ������� 1v2.0
	FROM ITEM INNER JOIN PRODUCT ON ITEM.product_id = PRODUCT. product_id
	WHERE description LIKE '%WIFF SOFTBALL%';*/
	
	
--������� �������� � ������ ������� � ������� ���� ���������, � �� ���������� (��������� - 'ANALYST').
	/*SELECT regional_group, DEPARTMENT.name, COUNT (*) AS ����������--� ������� 2
	FROM DEPARTMENT INNER JOIN EMPLOYEE ON DEPARTMENT.department_id = EMPLOYEE.department_id
		INNER JOIN JOB ON JOB.job_id = EMPLOYEE.job_id
		INNER JOIN LOCATION  ON LOCATION. location_id = DEPARTMENT.location_id
	WHERE JOB.[function] LIKE 'ANALYST'
	group by regional_group, department.name;*/
	
	
--������� �������� � ������ ��� �������, � ������� ���� ����������, �� ���������� ���������� (��������� - �� 'SALESPERSON'), �� ���������� ������������.
	/*SELECT regional_group, DEPARTMENT.name--� �������?3
	FROM DEPARTMENT INNER JOIN EMPLOYEE ON DEPARTMENT.department_id = EMPLOYEE.department_id
		INNER JOIN JOB ON JOB.job_id = EMPLOYEE.job_id
		INNER JOIN LOCATION  ON LOCATION.location_id = DEPARTMENT.location_id
	WHERE JOB.[function] !='SALESPERSON' AND EMPLOYEE.commission IS NOT NULL AND EMPLOYEE.commission > 0;*/
	
	
--������� ����������� ����� ������, ������� ���������� �� ������ ����������, ����������� � ������ 'NEW YORK'.
	/*SELECT MIN(T) AS �����-- � ������� 4.1
	FROM (SELECT EMPLOYEE.EMPLOYEE_ID, SUM(TOTAL) AS T
		FROM LOCATION 
		INNER JOIN DEPARTMENT ON LOCATION.location_id = DEPARTMENT.location_id
		INNER JOIN EMPLOYEE ON DEPARTMENT.department_id = EMPLOYEE.department_id
		INNER JOIN CUSTOMER ON EMPLOYEE.employee_id = CUSTOMER.salesperson_id
		INNER JOIN SALES_ORDER ON CUSTOMER.customer_id = SALES_ORDER.customer_id
		WHERE regional_group = 'NEW YORK'
		GROUP BY EMPLOYEE.employee_id) AS TABL;*/


		/*SELECT  top (1) SUM(TOTAL) as T --� ������� 4.2
		FROM LOCATION 
		INNER JOIN DEPARTMENT ON LOCATION.location_id = DEPARTMENT.location_id
		INNER JOIN EMPLOYEE ON DEPARTMENT.department_id = EMPLOYEE.department_id
		INNER JOIN CUSTOMER ON EMPLOYEE.employee_id = CUSTOMER.salesperson_id
		INNER JOIN SALES_ORDER ON CUSTOMER.customer_id = SALES_ORDER.customer_id
		WHERE regional_group = 'NEW YORK' 
		GROUP BY EMPLOYEE.employee_id 
		ORDER BY T asc */


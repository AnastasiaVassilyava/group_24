
 
 --������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.

 select employee_name, monthly_salary from employee_salary
 join salary on salary.id=employee_salary.salary_id
 join employees on employees.id=employee_salary.employee_id;
 
--2 ������� ���� ���������� � ������� �� ������ 2000.

select employee_name, monthly_salary from employee_salary
 join salary on salary.id =employee_salary.salary_id 
 join employees on employees.id = employee_salary.employee_id 
 where monthly_salary < 2000;
 
--***��������� ������� �� ���������� ������
select monthly_salary 
from salary 
where id not in (select employee_salary.salary_id from employee_salary);

--3 ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

select employee_name, monthly_salary from employee_salary
 left join salary on salary.id=employee_salary.salary_id
 left join employees on employees.id=employee_salary.employee_id where employee_name is NULL;
 
 
 --4 ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

 select employee_name, monthly_salary from employee_salary
 left join salary on salary.id=employee_salary.salary_id
 left join employees on employees.id=employee_salary.employee_id where employee_name is null
  and  monthly_salary < 2000;
 
 --5 ����� ���� ���������� ���� �� ��������� ��.
 
 select employee_name, monthly_salary from employee_salary
 right join salary on salary.id= employee_salary.salary_id  
 right join employees on employee_salary.employee_id = employees.id
 where monthly_salary is null;
 
  --6 ������� ���� ���������� � ���������� �� ���������.

select employee_name, role_name from roles_employee
 join roles on roles_employee.role_id = roles.id 
 join employees on roles_employee.employee_id = employees.id;

--7 ������� ����� � ��������� ������ Java �������������.

select employee_name, role_name from roles_employee
 join employees on employees.id = roles_employee.employee_id 
 join roles on roles.id = roles_employee.role_id 
where role_name like '%Java %';

--8 ������� ����� � ��������� ������ Python �������������.

select employee_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%Python %';

--9 ������� ����� � ��������� ���� QA ���������.

select employee_name,role_name from roles_employee
join employees on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id
where role_name like '%QA%';


-- 10 ������� ����� � ��������� ������ QA ���������.

select employee_name,role_name from roles_employee
join employees on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id
where role_name like '%Manual QA%';

--11 ������� ����� � ��������� ��������������� QA

select employee_name,role_name from roles_employee
join employees on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id
where role_name like '%Au% QA%';

-- 12 ������� ����� � �������� Junior ������������

select employee_name,role_name,monthly_salary 
 from salary
join employee_salary on employee_salary.salary_id = salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles  on roles_employee.role_id=roles.id
 where role_name like '%Junior%';

 --13. ������� ����� � �������� Middle ������������

select employee_name, role_name, monthly_salary
from salary
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employees.id=employee_salary.employee_id
join roles_employee on roles_employee.employee_id=employees.id 
join roles on roles.id=roles_employee.role_id
where role_name like '%Middle%';

-- 14. ������� ����� � �������� Senior ������������

select employee_name, role_name, monthly_salary
from salary
join employee_salary on employee_salary.salary_id= salary.id
join employees on employees.id= employee_salary.employee_id 
join roles_employee on roles_employee.employee_id= employees.id
join roles on roles.id= roles_employee.role_id 
 where role_name like '%Senior%';

--15.������� �������� Java �������������

select role_name,monthly_salary
from employee_salary
join salary on salary.id= employee_salary.salary_id 
join roles_employee on roles_employee.employee_id= employee_salary.employee_id
join roles on roles.id= roles_employee.role_id
where role_name like '%Java %';
 
--16. ������� �������� Python �������������

select role_name, monthly_salary
from employee_salary
join salary on salary.id= employee_salary.salary_id 
join roles_employee on roles_employee.employee_id= employee_salary.employee_id
join roles on roles.id= roles_employee.role_id
where role_name like '%Python%';

--17. ������� ����� � �������� Junior Python �������������

select employee_name, monthly_salary, role_name
from salary
join employee_salary on employee_salary.salary_id= salary.id
join employees on employees.id= employee_salary.employee_id 
join roles_employee on roles_employee.employee_id= employees.id 
join roles on roles.id= roles_employee.role_id
where role_name like 'Junior Python%';
 
--18. ������� ����� � �������� Middle JS �������������

select employee_name, monthly_salary, role_name
from salary
join employee_salary on employee_salary.salary_id= salary.id 
join employees on employees.id= employee_salary.employee_id 
join roles_employee on roles_employee.employee_id= employees.id
join roles on roles.id= roles_employee.role_id
where role_name like 'Middle J%S%';

-- 19 ������� ����� � �������� Senior Java �������������

select employee_name, monthly_salary, role_name
from salary
join employee_salary on employee_salary.salary_id= salary.id 
join employees on employees.id= employee_salary.employee_id 
join roles_employee on roles_employee.employee_id= employees.id 
join roles on roles.id= roles_employee.role_id
where role_name like 'Senior Java %';

--20. ������� �������� Junior QA ���������

select monthly_salary, role_name
from salary
join employee_salary on employee_salary.salary_id= salary.id 
join roles_employee on roles_employee. employee_id= employee_salary.employee_id
join roles on roles.id= roles_employee.role_id
where role_name like 'Junior %QA%';

-- 21 ������� ������� �������� ���� Junior ������������

select avg(monthly_salary)
from salary
join employee_salary on employee_salary.salary_id= salary.id 
join roles_employee on roles_employee. employee_id= employee_salary.employee_id
join roles on roles.id= roles_employee.role_id
where role_name like '%Junior%';


-- 22. ������� ����� ������� JS �������������

select sum(monthly_salary)
as sum from salary
join employee_salary on employee_salary.salary_id= salary.id 
join roles_employee on roles_employee. employee_id= employee_salary.employee_id
join roles on roles.id= roles_employee.role_id
where role_name like '%J%S%';
 
--23. ������� ����������� �� QA ���������

select min(monthly_salary)
from salary
join employee_salary on employee_salary.salary_id= salary.id 
join roles_employee on roles_employee. employee_id= employee_salary.employee_id
join roles on roles.id= roles_employee.role_id
where role_name like '%QA%';

--24. ������� ������������ �� QA ���������

select max(monthly_salary)
from salary
join employee_salary on employee_salary.salary_id= salary.id 
join roles_employee on roles_employee. employee_id= employee_salary.employee_id
join roles on roles.id= roles_employee.role_id
where role_name like '%QA%';


--25. ������� ���������� QA ���������

select count(role_name)
from roles
where role_name like '%QA%';
--join employee_salary on employee_salary.salary_id= salary.id 
--join roles_employee on roles_employee. employee_id= employee_salary.employee_id
--join roles on roles.id= roles_employee.role_id


-- 26. ������� ���������� Middle ������������.

select count(role_name)
from roles
where role_name like 'Middle%';

--27. ������� ���������� �������������

select count(role_name)
from roles
where role_name like '%developer';

--28. ������� ���� (�����) �������� �������������.

select sum(monthly_salary)
from salary
join employee_salary on employee_salary.salary_id= salary.id 
join roles_employee on roles_employee. employee_id= employee_salary.employee_id
join roles on roles.id= roles_employee.role_id
where role_name like '%developer';

 --29. ������� �����, ��������� � �� ���� ������������ �� �����������

select employee_name,role_name, monthly_salary
from salary
join employee_salary on employee_salary.salary_id= salary.id 
join employees on employees.id= employee_salary.employee_id 
join roles_employee on roles_employee.employee_id= employees.id 
join roles on roles.id= roles_employee.role_id
order by monthly_salary 
  
 --30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300

select employee_name,role_name, monthly_salary
from salary
join employee_salary on employee_salary.salary_id= salary.id 
join employees on employees.id= employee_salary.employee_id 
join roles_employee on roles_employee.employee_id= employees.id 
join roles on roles.id= roles_employee.role_id
where monthly_salary between 1700 and 2300
order by monthly_salary;

--31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300

select employee_name,role_name, monthly_salary
from salary
join employee_salary on employee_salary.salary_id= salary.id 
join employees on employees.id= employee_salary.employee_id 
join roles_employee on roles_employee.employee_id= employees.id 
join roles on roles.id= roles_employee.role_id
where monthly_salary < 2300
order by monthly_salary;

--32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000

select employee_name,role_name, monthly_salary
from salary
join employee_salary on employee_salary.salary_id= salary.id 
join employees on employees.id= employee_salary.employee_id 
join roles_employee on roles_employee.employee_id= employees.id 
join roles on roles.id= roles_employee.role_id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;

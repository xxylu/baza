--1
select
title stanowisko
from emp
group by title
order by 1 desc;
--2
select
name || ' ' || address || ' ' || city "Nazwa, adres, miasto"
from customer
where id in (206,208,215);
--3
select
d.id,
d.name,
d.region_id
from dept d
where region_id = 1 Or region_id = 3;
--4
select
56*78/9 expr
from dual;
--5
select
id,
trunc(round(months_between(to_date('19-04-2024','DD-MM-YYYY'),start_date)/12*52,2),0) tygodnie
from emp;
--6
select
lower(name) nazwa,
initcap(city) miasto,
upper(country)
from customer
where upper(credit_rating) like 'POOR';
--7
select
customer_id,
max(total)
from ord
where total >= ALL(select min(total) from ord group by customer_id)
group by customer_id;
--8
select
max(region_id),
min(region_id)
from dept;
--9
select
avg(salary),
min(salary)
from emp
where lower(first_name) like 'b%';
--10
select
first_name,
last_name,
dept_id
from emp
where manager_id IN (select id from emp where upper(last_name) like 'PATEL');
--11
select distinct
c.id,
c.name,
c.phone,
c.address,
c.city,
o.payment_type,
e.id
from customer c  join ord o on c.id = o.customer_id
 join emp e on e.id = c.sales_rep_id
where e.id = o.sales_rep_id and o.customer_id = c.id and c.id =210;
--12
select
first_name,
last_name
from emp
where salary = (select min(salary) from emp);
--13
select
dept_id
from emp
group by dept_id;
--14
select
name
from product
where id in (select
id
from product
minus
select
product_id
from item
group by product_id);
--15
select
dept_id,
title,
max(salary),
min(salary),
avg(salary)
from emp
group by dept_id,title;

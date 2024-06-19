--1
UPDATE emp
SET salary=salary + (SELECT AVG(salary)*1.10 FROM emp)
WHERE salary < 4000;
--2
INSERT INTO emp
VALUES(26,'Pachulski', 'Oliwier', '318696', TO_DATE('13-11-2019', 'DD-MM-YYYY'), NULL, 1, 'Stock Clerk', 32, 2500.56, NULL);
--3
DELETE FROM emp
WHERE dept_id = 41 OR dept_id = 43;
--4
Rename Dept to Nowe_dept;
--5
CREATE TABLE Pracownicy(
  pracownik_id number(10),
  imie varchar2(20),
  nazwisko varchar2(20),
  plec char,
  data_urodzenia date,
  zarobki number(8,2)
)
--6
ALTER TABLE pracownicy
ADD 
telefon varchar(50);
--7
ALTER TABLE pracownicy
MODIFY 
telefon varchar2(15 char);
--8
ALTER TABLE pracownicy
ADD CONSTRAINT 
check_length CHECK (length(telefon)>=9);
--9
ALTER TABLE pracownicy
RENAME COLUMN telefon to telefon_sluzbowy;
--10
ALTER TABLE pracownicy
DROP COLUMN telefon_sluzbowy;
--11
SELECT table_name FROM user_tables;
--12
DROP TABLE
NOWE_DEPT;
--14
DROP TABLE NOWE_DEPT;
CREATE TABLE dept_kopia (
  id number(7)
  CONSTRAINT dept_id_nn_new NOT NULL,
  name varchar2(25)
  CONSTRAINT dept_name_nn_new NOT NULL,
  CONSTRAINT dept_id_pk_new PRIMARY KEY(id)
);
--15
CREATE TABLE Pracownicy22(
  pracownik_id number(10) CONSTRAINT prac22_prim_key PRIMARY KEY,
  imie VARCHAR2(20) NOT NULL,
  nazwisko VARCHAR2(30) NOT NULL,
  plec CHAR CONSTRAINT plec_k_m CHECK(lower(plec) in ('k', 'm')),
  data_urodzenia DATE,
  zarobki NUMBER(8,2) NOT NULL CHECK(zarobki >=4800)
);
--16
ALTER TABLE pracownicy 
ADD CONSTRAINT pk PRIMARY KEY (pracownik_id);
--17
alter table Pracownicy22 add dept_id Number(7);
--18
ALTER TABLE pracownicy22
ADD dept_id number(7,0)
ADD CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES dept (id);
--19 kolumnowe
Create table Pracownicy22(
Id number constraint fk_dept_id primary key,
Klucz number, constraint fk_dept_id references dept(id)
);
--20 tablicowe
Create table Pracownicy22(
Id number constraint xd_pk primary key,
Klucz number, constraint fk_dept_id foreign key(dept_id) references dept(id)
);
--21
ALTER TABLE pracownicy22
ADD pesel VARCHAR(11) UNIQUE;
--22 usuniecie klucza obcego
ALTER TABLE pracownicy22
DROP CONSTRAINT fk_dept;

--23 wyświetlanie
SET SERVEROUTPUT ON;
DECLARE 
  v_name varchar2(25);
  v_surname varchar2(25);
  v_salary number(11,2);
  CURSOR c_emp IS
  SELECT first_name, last_name, salary FROM emp
  WHERE salary=(SELECT AVG(salary) FROM emp);
BEGIN
  OPEN c_emp;

  LOOP
    FETCH c_emp INTO v_name, v_surname, v_salary;
    EXIT WHEN c_emp%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_name || ' ' || v_surname || v_salary);
  END LOOP;
  CLOSE c_emp;
END;
--25 ustawienie zarobków na stałe 5400
ALTER TABLE pracownicy
MODIFY zarobki DEFAULT 5400;

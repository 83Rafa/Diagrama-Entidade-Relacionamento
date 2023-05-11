USE company_constraints;
select * from user_messages;
# Parte 1 – Personalizando acessos com views e criando acessos para usuários

# Número de Empregados Por Departamento e Localidade
CREATE VIEW employee_per_department AS
	SELECT COUNT(Ssn), Dname, Dlocation
    FROM 		employee e
    INNER JOIN	department d ON (e.Dno = d.Dnumber)
    INNER JOIN	dept_location dl ON (dl.Dnumber = d.Dnumber)
    GROUP BY	Dlocation;

-- Acesso irrestrito à View "employee_per_department" para o manager
CREATE USER "manager"@localhost IDENTIFIED BY '165459824';
GRANT ALL PRIVILEGES ON company_constraints.employee_per_department TO "manager"@localhost; 
SHOW GRANTS FOR 'manager'@localhost;
   

# Lista de Departamentos e Seus Gerentes
CREATE VIEW department_mgrs AS
	SELECT		Dname, CONCAT(Fname, " ", Lname) AS Gerente, Mgr_ssn
	FROM 		employee e
	INNER JOIN	department d ON (e.Dno = d.Dnumber)
	WHERE		e.Ssn = d.Mgr_ssn;
    
-- Acesso irrestrito à View "department_mgrs" para o hr_mgr
CREATE USER "hr_mgr"@localhost IDENTIFIED BY '123976765';
GRANT ALL PRIVILEGES ON company_constraints.Mgr_Dependents TO "hr_mgr"@localhost;
SHOW GRANTS FOR 'hr_mgr'@localhost;


# Projetos Com Maior Número de Empregados
CREATE VIEW largest_dept AS
	SELECT 		Pname, Pnumber, count(*)
	FROM 		employee e
	INNER JOIN 	project p ON (p.Dnum = e.Dno)
	INNER JOIN	works_on wo ON (wo.Pno = p.Pnumber)
	GROUP BY 	Pname
	ORDER BY 	COUNT(*)
	DESC LIMIT 3;

-- Acesso de leitura à View "largest_dept" para o admin
CREATE USER "admin"@localhost IDENTIFIED BY '888665555';
GRANT SELECT ON company_constraints.largest_dept TO "admin"@localhost;
  
    
# Lista de Projetos, Departamentos e Gerentes
CREATE VIEW projects_by_dept_mgr AS
	SELECT 		Pname, Dname, CONCAT(Fname, " ", Lname) AS Manager
	FROM 		employee e
	INNER JOIN 	department d ON (d.Dnumber = e.Dno)
	INNER JOIN	project p ON (p.Dnum = d.Dnumber)
	WHERE		e.Ssn = d.Mgr_ssn;

-- Acesso irrestrito à View "projects_by_dept_mgr" para o projects_general_mgr
CREATE USER "projects_general_mgr"@localhost IDENTIFIED BY '963976756';
GRANT ALL PRIVILEGES ON company_constraints.projects_by_dept_mgr TO "projects_general_mgr"@localhost;
SHOW GRANTS FOR 'projects_general_mgr'@localhost; 

-- Quais Empregados Possuem Dependentes e Se São Gerentes 
CREATE VIEW Mgr_Dependents AS
	SELECT CONCAT(e.Fname, " ", e.Lname) AS Employee, dp.Mgr_ssn, d.Dependent_name
	FROM employee e 
	INNER JOIN dependent d ON (d.Essn = Ssn)
	INNER JOIN department dp ON (dp.Dnumber = e.Dno)
	WHERE e.Ssn = dp.Mgr_ssn;

-- Acesso irrestrito à View "employee_per_department" para o manager
GRANT ALL PRIVILEGES ON company_constraints.employee_per_department TO "manager"@localhost;  
SHOW GRANTS FOR 'manager'@localhost;





# Parte 2 – Criando gatilhos para cenário de company

-- Before Update Statement
# Atribuindo aumento de salário para um departamento específco => 1 salary = salary * 1.20;

-- INSERT
DELIMITER $$
CREATE TRIGGER payment_bonus 
BEFORE INSERT ON employee 
FOR EACH ROW
BEGIN
	CASE NEW.Dno
		WHEN 5 THEN SET NEW.Salary = NEW.Salary * 1.20;
	END CASE;
END $$
DELIMITER ;

INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Gender, Salary, Super_ssn, Dno)
		VALUES('Brian', 'O', 'Connor', '821965156', '1977-08-22', NULL, 'M', '32000.00', NULL, '5');

select * from employee where Ssn = '821965156';


-- UPDATE
drop trigger payment_bonus;
DELIMITER $$
CREATE TRIGGER payment_increase 
BEFORE UPDATE ON employee 
FOR EACH ROW
BEGIN
	CASE NEW.Dno
		WHEN 5 THEN SET NEW.Salary = NEW.Salary * 1.20;
	END CASE;
END $$
DELIMITER ;



UPDATE employee 
   SET Dno = '5'
 WHERE Ssn = '165459824';
        
select * from employee where Ssn = '165459824';


-- BEFORE DELETE STATEMENT
# Salvando em Outra Tabela os Employees Demitidos
CREATE TABLE dismissed_or_resigned (
	former_employee VARCHAR(50),
    fe_data	VARCHAR(250));
       
CREATE TABLE logs (
	logstring VARCHAR(100));
    
    
DELIMITER $$
CREATE TRIGGER trigger_before_delete_employee
BEFORE DELETE
ON employee FOR EACH ROW
BEGIN
	INSERT INTO dismissed_or_resigned VALUES( current_user(), CONCAT(OLD.Fname, ' ',  OLD.Minit, ' ', OLD.Lname, ' | Ssn: ', OLD.Ssn, 
															' | Super_ssn: ', OLD.Super_ssn, ' | Dno: ', OLD.Dno, ' | Date: ', NOW()));
    INSERT INTO LOGS VALUES (CONCAT('Ssn: ', OLD.Ssn, ' - Data moved to dismissed_or_resigned'));                                                                
END $$
DELIMITER ;

SELECT * FROM logs;
SELECT * FROM dismissed_or_resigned;
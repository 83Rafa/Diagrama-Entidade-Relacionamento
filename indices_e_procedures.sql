# 1. Criando índices no Banco de Dados

-- Unique Index para a tabela employee
CREATE UNIQUE INDEX employee_idx ON employee(Ssn);
-- A utilização deste tipo de índice é vantajosa por questões de 
-- integridade dos dados e também pelo desempenho, o que faz das 
-- pesquisas contendo índices exclusivos muito mais rápida


-- Multicolumn Index para tabela department
CREATE INDEX dapartamento ON department(Dname, Dnumber);
-- Torna a consulta que envolve múltiplas colunas de dados para mais rápida. 
-- Para casos em qua se precisa retornar mais de um valor, índices single-columns 
-- não oferecem um bom desempenho. 


-- Single-column index na tabela project
CREATE INDEX project_idx ON project(Pnumber);
-- Normalmente, em um projeto de banco de dados, as tabelas representam uma única 
-- categoria de dados, normalmente é utilizada um índice de única coluna.


-- Multicolumn Index para tabela dependent
CREATE INDEX idx_essn_dependente ON dependent (Essn, Dependent_name);
-- índice que retorna nome do dependente junto ao ssn do empregado


-- Multicolumn Index para tabela works_on
CREATE INDEX idx_employee_work_records ON works_on (Essn, Pno, Hours);
-- ìndice que retorna toda a informação de trabalho do uncionário


-- Índice Hash (não suportado neste Store Engine)
ALTER TABLE employee
ADD ativo BOOLEAN DEFAULT TRUE;

CREATE INDEX idx_ativo_hash ON employee(ativo) USING HASH; 
-- O MySQL não suporta o index HASH, não dá erro, só converte 
-- automaticamente para BTREE (PADRÃO)
DROP INDEX idx_ativo_hash ON employee;
CREATE INDEX idx_ativo_btree ON employee(ativo) USING Btree;
SHOW INDEX FROM employee;


-- PERGUNTAS:
-- Qual o departamento com o maior número de funcionários?
SELECT 	Dname, Dno, COUNT(Ssn) 
FROM 	employee
INNER JOIN department ON Dno = Dnumber
GROUP BY Dno;
-- R: Research, com 9 funcionários


-- Quais são os departamentos por cidade?
SELECT 		Dname, Dlocation 
FROM 		department d
INNER JOIN 	dept_location dl ON d.Dnumber = dl.Dnumber
ORDER BY 	Dlocation;
-- R: Researsh (Ballaire), Headquarters e Research (houston), 
-- Administration (Staford) e Research (Sugarland)


-- Qual a relação de empregados por departamento?
SELECT		Dname, COUNT(Ssn) 
FROM 		employee
INNER JOIN 	department ON Dno = Dnumber
GROUP BY 	Dname;
-- R: Research = 9, Administration = 4, Headquarters = 2


# Parte 2 - Utilização de procedures para manipulação de dados em Banco de Dados 
USE ecommerce;

-- Script SQL com Procedure criada e chamada para manipular os dados do e-commerce.
delimiter $$
CREATE PROCEDURE 			product_crud(
	p_action 				VARCHAR(10),
	p_product_name		 	VARCHAR(35),
	p_classification_kids 	BOOL,
	p_category				ENUM('Eletronic', 'Home & Kitchen', 'Clothing', 'Fitness', 'Toys & Games', 'Tools', 'Food & Beverage', 'Books & Kindle', 'Personal Security', 'Market', 'Grocery', 'Automotive'),
	p_evaluation			FLOAT,
	p_dimensions			VARCHAR(15),
    p_price					FLOAT
)
BEGIN
	-- SELECT
    IF p_action = "SELECT" THEN
		SELECT * FROM product
        WHERE p_product_name=product_name;
	END IF;
    -- CREATE
    IF p_action = "INSERT" THEN
		IF	(LENGTH(p_product_name) > 5 AND p_evaluation > 0 AND p_price <> 0) THEN
			INSERT INTO 	product (product_name, classification_kids, category, evaluation, dimensions, price) 
			VALUES 			(p_product_name, p_classification_kids, p_category, p_evaluation, p_dimensions, p_price);
			SELECT * FROM 	product
            WHERE p_product_name=product_name;
		ELSE 
			SELECT 'Erro nos dados fornecidos. Por favor, digite os dados corretamente' AS Message_error;
		END IF;
	END IF;
    -- UPDATE
    IF p_action = "UPDATE" THEN
		UPDATE 		product
		SET 		product_name=p_product_name, 
					classification_kids = p_classification_kids,
					category = p_category,
					evaluation = p_evaluation,
					dimensions = p_dimensions,
					price = p_price
		WHERE product_name=p_product_name;
        SELECT * FROM 	product
        WHERE p_product_name=product_name;
	END IF;
    -- DELETE
    IF p_action = "DELETE" THEN
			DELETE FROM product
			WHERE product_name=p_product_name;
            SELECT 'Produto apagado com sucesso' AS Message;
            SELECT * FROM 	product;
    END IF;
END $$
delimiter ;

-- 	Chamadas da procedure para CRUD
CALL product_crud('SELECT', "Varinha Mágica", FALSE, 'Personal Security', 5, '37cm', 180);
CALL product_crud('INSERT','Nimbus 2000', FALSE, 'Toys & Games', 5, '135cm', 3800);
CALL product_crud('INSERT','Nimbus 3000', FALSE, 'Toys & Games', 5, '135cm', 5750);
CALL product_crud('UPDATE','Nimbus 3000', FALSE, 'Personal Security', 5, '135cm', 8750);
CALL product_crud('INSERT','Nimbus 3500', FALSE, 'Personal Security', 5, '135cm', 15750);
CALL product_crud('DELETE','Nimbus 3500', FALSE, 'Personal Security', 5, '135cm', 15750);
SET @@autocommit = 0;

USE ecommerce;
SHOW tables;

# CODE 01 - TRANSACTION STATEMENTS DE CONSULTA DE DADOS PERSISTIDOS NO BD
START TRANSACTION;
	SELECT CONCAT(fname, ' ', lname) AS Cliente, id_product AS Produto,
		address AS Endereço, order_status AS Status
	FROM clients NATURAL JOIN orders
    WHERE address LIKE '%Manhattan%';
COMMIT;

START TRANSACTION;
	SELECT product_name AS Produto, id, price
	FROM product
	WHERE category = 'Food & Beverage';
COMMIT;

START TRANSACTION;
	SELECT product_name AS Produto, id, price
	FROM product
	WHERE category = 'Personal Security';
COMMIT;



# CODE 02 - TRANSACTION STATEMENT DE MODIFICAÇÕES (UPDATE) EM DADOS PERSISTIDOS NO BD
START TRANSACTION;
	ALTER TABLE product CHANGE category category ENUM('Eletronic', 'Home & Kitchen', 'Clothing', 'Fitness', 'Toys & Games', 'Tools', 'Food & Beverage', 'Books & Kindle', 'Personal Security', 'Market', 'Grocery', 'Automotive', 'Sports') NOT NULL;
COMMIT;

START TRANSACTION;
	UPDATE product 
    SET category = "Sports" 
    WHERE product_name LIKE "%Nimbus%";   
COMMIT;

START TRANSACTION;
	UPDATE product 
    SET classification_kids = TRUE 
    WHERE product_name LIKE "%Nimbus%";
COMMIT;


                      
DELIMITER //
CREATE PROCEDURE on_product_fail()
	BEGIN
		START TRANSACTION;
			SELECT @nextid := MAX(id)+1 AS nextId 
			FROM product;
			 
			INSERT INTO product 		(product_name, classification_kids, category, evaluation, dimensions, price)
								VALUES	('Terno Blindado', FALSE, 'Personal Security', '5', NULL, 12000),
										('Jaqueta Lions 76 - Vintage Sports ', FALSE, 'Clothing', '4', NULL, 386.50);		
			SAVEPOINT insercao_produtos;
            
			INSERT INTO product_supplier	(id_supplier, id_product, quantity)
									VALUES	(5, 37, 1),
											(6, 38, 50);
			IF on_product_fail = FALSE THEN
				COMMIT;
                SAVEPOINT insercao_product_supplier;
				SELECT * FROM product NATURAL JOIN product_supplier;
			ELSE
				ROLLBACK TO SAVEPOINT insercao_produtos;
                SELECT 'Erro de inserção em product_supplier' AS Resultado;
			END IF;
		COMMIT;
	END //
DELIMITER ;			
            
CALL on_product_fail;
-- DROP PROCEDURE on_product_fail;  

-- Query para produtos adicionados
SELECT product_name, category, quantity, id_supplier
FROM product 
INNER JOIN product_supplier ON (id = id_product)
WHERE id_supplier > 4;

# CODE 03 - BACKUP & RECOVERY
-- Backup geral com routines
-- mysqldump --routines --triggers -u root -p ecommerce > ecommerce_backup.sql

-- Backup parcial (apenas strutura do db)
-- mysqldump --no-data -u root -p ecommerce > ecommerce_no_data_backup.sql

-- Backup parcial (dados persistidos)
-- mysqldump --no-create-info -u root -p ecommerce > ecommerce_no_info_backup.sql

-- Recovery do banco de dados
-- mysql -u root -p ecommerce < ecommerce_backup.sql


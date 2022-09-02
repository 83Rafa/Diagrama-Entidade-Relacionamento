-- criação do banco de dados para cenário de E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- Tabela Cliente
CREATE TABLE clients (
		idClient INT AUTO_INCREMENT PRIMARY KEY,
        fname 	 VARCHAR(10),
        minit 	 CHAR(3),
        lname 	 VARCHAR(20),
        ssn 	 CHAR(11) NOT NULL,
        address	 VARCHAR(65),
        CONSTRAINT unique_cpf_client UNIQUE (ssn)
);

-- Tabela Produto
CREATE TABLE product (
		idProduct 	INT AUTO_INCREMENT PRIMARY KEY,
		pname 		VARCHAR(35) NOT NULL,
		classification_kids BOOL DEFAULT FALSE,
		category 	ENUM('Eletronic', 'Home & Kitchen', 'Clothing', 'Fitness', 'Toys & Games', 'Tools', 'Food & Beverage', 
					'Books & Kindle', 'Personal Security', 'Market', 'Grocery', 'Automotive') NOT NULL,
		evaluation	FLOAT DEFAULT 0,
        price		FLOAT,
		dimensions	VARCHAR(15)
);

-- Tabela Pedidos
CREATE TABLE orders (
		idOrder 	  INT AUTO_INCREMENT PRIMARY KEY,
        idOrdclient   INT,
        orderStatus	  ENUM('Confirmed', 'Canceled', 'In Proccess', 'Delivered') DEFAULT 'In Proccess',
        orderDescript VARCHAR(255),
        shipping	  FLOAT DEFAULT 0,
        paymentType	  ENUM ('Ticket', 'Creditcard', 'Bank Transfer', 'Pix', 'Cash'),
        CONSTRAINT 	  fk_odr_clients FOREIGN KEY (idOrdclient) REFERENCES clients (idClient)
		ON UPDATE CASCADE
);

-- Tabela Pagamento 
CREATE TABLE payment (
		idPayment		INT AUTO_INCREMENT PRIMARY KEY,
        idPayClient		INT,
        idPayOrder		INT,
        amount			FLOAT,
        payStatus		ENUM ('Confirmed', 'In Proccess', 'Canceled'),
        CONSTRAINT 	fk_payment_client FOREIGN KEY (idPayClient) REFERENCES clients(idClient),
        CONSTRAINT 	fk_payment_order FOREIGN KEY (idPayOrder) REFERENCES orders(idOrder)
        ON UPDATE CASCADE
);

-- Tabela Forma de Pagamento
CREATE TABLE payment_type (
		idPayment_type	INT,
		Creditcard		FLOAT,
        Ticket			FLOAT,
        Bank_transfer	FLOAT,
        Pix				FLOAT,
        CONSTRAINT 	fk_payment_type FOREIGN KEY (idPayment_type) REFERENCES payment(idPayment)
);

-- Tabela Estoque
CREATE TABLE product_storage (
		idPstorage 	 INT AUTO_INCREMENT PRIMARY KEY,
        storLocation VARCHAR(255),
        amount		 INT default 0
);		

-- Tabela Fornecedor
CREATE TABLE supplier (
		idSupplier 	INT AUTO_INCREMENT PRIMARY KEY,
		corpName 	VARCHAR(255) NOT NULL,
        fin			CHAR(14) NOT NULL, -- Fiscal Indentifier Number
		contact	  	CHAR(11) NOT NULL,
        CONSTRAINT 	unique_supplier UNIQUE (fin)
);

-- Tabela Vendedo
CREATE TABLE seller (
		idSeller 	INT AUTO_INCREMENT PRIMARY KEY,
		companyName VARCHAR(255) NOT NULL,
        tradingName VARCHAR(255) NOT NULL,
        fin			CHAR(14),
        ssn		 	CHAR(9),	
		contact		CHAR(11) NOT NULL,
        location	VARCHAR(100),
        CONSTRAINT 	unique_fin_seller UNIQUE (fin),
        CONSTRAINT 	unique_ssn_seller UNIQUE (ssn)
);

-- Tabela Produtos/Vendedor
CREATE TABLE product_seller (
		idPseller	INT,
        idPproduct	INT,
        prodAmount	INT DEFAULT 1,
        PRIMARY KEY	(idPseller, idPproduct),
        CONSTRAINT	fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller (idSeller),
        CONSTRAINT	fk_product_product FOREIGN KEY (idPproduct) REFERENCES product (idProduct)
);

-- Tabela Produto/Fornecedor
CREATE TABLE product_supplier (
		idPsupplier	INT,
        idPproduct	INT,
        quantity	INT NOT NULL,
        PRIMARY KEY	(idPsupplier, idPproduct),
        CONSTRAINT	fk_product_supplier_supplier FOREIGN KEY (idPsupplier) REFERENCES supplier (idSupplier),
        CONSTRAINT	fk_product_supplier_product FOREIGN KEY (idPproduct) REFERENCES product (idproduct)
);

-- Tabela Produtos/Pedidos
CREATE TABLE product_order (
		idPOproduct	INT,
        idPOorder	INT,
        prodAmount	INT DEFAULT 1,
        prodStatus	ENUM('Available', 'Unavailable') DEFAULT 'Available',
        PRIMARY KEY	(idPOproduct, idPOorder),
        CONSTRAINT 	fk_product_order_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
		CONSTRAINT 	fk_product_order_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

-- Tabela Produto em estóque
CREATE TABLE storage_location (
		idLproduct	INT,
        idLstorage	INT,
        location	VARCHAR(255) NOT NULL,
        PRIMARY KEY	(idLproduct, idLstorage),
        CONSTRAINT	fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
        CONSTRAINT	fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES product_storage(idPstorage)
);

-- SHOW TABLES;
-- SHOW DATABASES;
-- USE information_schema;
-- SHOW TABLES;
-- DESC table_constraints;
-- DESC referential_constraints;
-- SELECT * FROM referential_constraints WHERE constraint_schema = 'ecommerce';
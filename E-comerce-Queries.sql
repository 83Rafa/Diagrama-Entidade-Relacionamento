SELECT * FROM clients;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM payment;
SELECT * FROM payment_type;
SELECT * FROM product_storage;
SELECT * FROM supplier;
SELECT * FROM seller;
SELECT * FROM product_seller;
SELECT * FROM product_seller;
SELECT * FROM product_supplier;
SELECT * FROM product_order;
SELECT * FROM storage_location;

-- ------
-- Clientes com plataformas de compra e a situação do pedido
SELECT	CONCAT(fname, ' ', lname) AS Cliente, idOrder AS Pedido, orderDescript AS Acesso, orderStatus AS Situação
FROM	clients c, orders o
WHERE	c.idClient = idOrdclient
ORDER BY fname;

-- ------
-- Para saber formas de pagementos por localização
SELECT	fname, ssn AS Identidade, address As Endereço, paymentType AS Forma_de_Pgto
FROM 	clients
LEFT OUTER JOIN orders
ON 		idClient = idOrdclient;

-- ------
-- Produtos com preço abeixo de 1000 por ordem de classificação dos clientes
SELECT 	pname, evaluation
FROM	product
WHERE	price <= 1000
ORDER BY evaluation DESC;

-- ------
-- dados de faturamento e informações frete
SELECT	SUM(price) Faturamento, MAX(price) Maior_Compra, MIN(price) Menor_Compra, ROUND(AVG(price),2) Média, 
		SUM(shipping) Total_Fretes, MAX(shipping) Marior_Frete, MIN(shipping) Menos_Frete, AVG(shipping) Media_de_Fretes
FROM	product, orders
WHERE	category = 'Personal Security';

-- ------
-- dados de consumo dos clientes ordenados pela quantidade
SELECT 	CONCAT(fname, ' ', lname) AS Cliente, address AS Endereço, pname AS Produto, 
prodAmount AS Quantidade
FROM 	clients 
INNER JOIN orders ON idClient = idOrdclient
INNER JOIN product_order ON idPOorder = idOrder
INNER JOIN product ON idPOproduct = idProduct
ORDER BY prodAmount DESC;

-- ------
-- Localização dos centros de distribuição filtrados pelo estado do RJ para posterior consulta de despesas de logisticas
SELECT	pname AS Product, location AS Centro_de_Distribuição
FROM 	product, storage_location
WHERE	idProduct = idLproduct AND location LIKE '%RJ - Brasil%';

-- ------
-- busca por produtos relacionados a super-herois
SELECT 	* FROM product WHERE idProduct IN
		(SELECT DISTINCT paymentType FROM orders, clients WHERE (idOrdclient = idClient)
        OR
        (SELECT idProduct FROM product, orders WHERE pname = 'Bat_rang'));

-- ------
-- análise preferências e quantidade de compras agrupados por nome
SELECT 		CONCAT(fname,' ',lname) AS cliente, idOrder as Número_do_Pedido, pname AS Produto, prodAmount AS Quantidade, 
			price AS Preço, paymentType AS Forma_de_Pagamento, shipping AS Frete,  payStatus AS Situação
FROM 	 	clients
INNER JOIN 	orders ON idClient = idOrdclient
INNER JOIN 	payment ON idOrder = idPayOrder
INNER JOIN 	payment_type ON idPayment = idPayment
INNER JOIN 	product_order ON idPOorder = idOrder
INNER JOIN	product ON idPOproduct = idProduct
GROUP BY 	fname;

-- ------
-- analise da situação dos pedidos, com dados de clientes ordenada por situação
SELECT 		DISTINCT CONCAT(fname,' ',lname) AS cliente, idOrder as Número_do_Pedido, pname AS Produto, prodAmount AS Quantidade, 
			price AS Preço, paymentType AS Forma_de_Pagamento, shipping AS Frete,  payStatus AS Situação
FROM 	 	clients
INNER JOIN 	orders ON idClient = idOrdclient
INNER JOIN 	payment ON idOrder = idPayOrder
INNER JOIN 	payment_type ON idPayment = idPayment
INNER JOIN 	product_order ON idPOorder = idOrder
INNER JOIN	product ON idPOproduct = idProduct
ORDER BY	payStatus DESC;

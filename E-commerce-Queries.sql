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

SELECT	CONCAT(fname, ' ', lname) AS Cliente, idOrder AS Pedido, orderDescript AS Acesso, orderStatus AS Situação
FROM	clients c, orders o
WHERE	c.idClient = idOrdclient
ORDER BY fname;

-- ------

SELECT	*
FROM 	clients
LEFT OUTER JOIN orders
ON 		idClient = idOrdclient;

-- ------

SELECT 	* 
FROM	product
WHERE	price <= 1000
ORDER BY pname;

-- ------

SELECT	SUM(price) Faturamento, MAX(price) Maior_Compra, MIN(price) Menor_Compra, ROUND(AVG(price),2) Média, 
		SUM(shipping) Total_Fretes, MAX(shipping) Marior_Frete, MIN(shipping) Menos_Frete, AVG(shipping) Media_de_Fretes
FROM	product, orders
WHERE	category = 'Personal Security';

-- ------

SELECT 	CONCAT(fname, ' ', lname) AS Cliente, address AS Endereço, pname AS Produto, 
prodAmount AS Quantidade, category AS Categoría, price AS Preço, shipping AS Frete
FROM 	clients 
INNER JOIN orders ON idClient = idOrdclient
INNER JOIN product_order ON idPOorder = idOrder
INNER JOIN product ON idPOproduct = idProduct
ORDER BY fname;

-- ------

SELECT	pname AS Product, location AS Centro_de_Distribuição
FROM 	product, storage_location
WHERE	idProduct = idLproduct AND location LIKE '%RJ - Brasil%';

-- ------

SELECT 	DISTINCT idProduct, pname FROM product WHERE idProduct IN
		(SELECT DISTINCT paymentType FROM orders, clients WHERE (idOrdclient = idClient)
        OR
        (SELECT idProduct FROM product, orders WHERE pname = 'Bat_rang'));

-- ------

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

SELECT 		DISTINCT CONCAT(fname,' ',lname) AS cliente, idOrder as Número_do_Pedido, pname AS Produto, prodAmount AS Quantidade, 
			price AS Preço, paymentType AS Forma_de_Pagamento, shipping AS Frete,  payStatus AS Situação
FROM 	 	clients
INNER JOIN 	orders ON idClient = idOrdclient
INNER JOIN 	payment ON idOrder = idPayOrder
INNER JOIN 	payment_type ON idPayment = idPayment
INNER JOIN 	product_order ON idPOorder = idOrder
INNER JOIN	product ON idPOproduct = idProduct;

SELECT 		*
FROM 	 	clients
INNER JOIN 	orders ON idClient = idOrdclient
INNER JOIN 	payment ON idOrder = idPayOrder
INNER JOIN 	payment_type ON idPayment = idPayment
INNER JOIN 	product_order ON idPOorder = idOrder
INNER JOIN	product ON idPOproduct = idProduct;
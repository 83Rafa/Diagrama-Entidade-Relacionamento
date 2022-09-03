-- Quantos carros estão com serviço aguardando autorização?
SELECT 	avlIdveiculo, avlVeiPlaca, avOrcamento, avlAutorizacao
FROM 	avaliacao
WHERE 	avlAutorizacao = 0;

-- Quantos clientes não concluiram serviços?
select COUNT(*) from avaliacao
where avlAutorizacao = 0;

-- Quais Clientes gastaram mais de 5000?
SELECT CONCAT(pnome, ' ',snome) AS Cliente, cpf, osValor AS Despesa_Total from os
INNER JOIN 	cliente ON idCliente = osIdcliente
WHERE		osValor > 5000
ORDER BY 	pnome;

-- Faturamento Total dos ultimos 10 serviços?
SELECT 		SUM(osValor) as Faturamento_total
FROM		os
INNER JOIN 	cliente ON idCliente = osIdcliente
ORDER BY 	pnome;
 
-- Veículo, proprietário, servico, data de entrada e data de entrega
SELECT		marca, modelo, placa, servico, avPrevEntrega,
CONCAT		(pnome,' ',snome) AS Cliente, telefone, email
FROM 		veiculo
LEFT JOIN 	avaliacao ON idVeiculo = avlIdveiculo
RIGHT JOIN 	cliente ON idCliente = avlIdCliente;
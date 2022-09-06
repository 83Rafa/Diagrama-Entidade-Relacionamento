-- Quantos carros estão com serviço aguardando autorização?
SELECT 	avlIdveiculo, avlVeiPlaca, avOrcamento, avlAutorizacao
FROM 	avaliacao
WHERE 	avlAutorizacao = 0;

-- Quantos clientes não concluiram serviços?
select COUNT(*) from avaliacao
where avlAutorizacao = 0;

-- Quais Clientes gastaram mais de 5000?
SELECT CONCAT(pnome, ' ',snome) AS Cliente, cpf, osValor AS Despesa_Total
FROM		os
INNER JOIN 	avaliacao ON idAvaliacao = idOsAvaliacao
INNER JOIN 	cliente ON idCliente = avlIdCliente
ORDER BY 	pnome;

-- Faturamento Total dos ultimos 10 serviços?
SELECT 		SUM(osValor) AS Faturamento_total
FROM		os
INNER JOIN 	avaliacao ON idAvaliacao = idOsAvaliacao
INNER JOIN 	cliente ON idCliente = avlIdCliente;
 
-- Veículo, proprietário, servico, data de entrada e data de entrega
SELECT		marca, modelo, placa, servico, avPrevEntrega,
CONCAT		(pnome,' ',snome) AS Cliente, telefone, email
FROM 		veiculo
LEFT JOIN 	avaliacao ON idVeiculo = avlIdveiculo
RIGHT JOIN 	cliente ON idCliente = avlIdCliente;

-- Serviços realizados para qual cliente, qual veículo e mecânico e observações
Select 		c.pnome AS Cliente, CONCAT(marca, ' ', modelo) AS Veículo, m.pnome AS Mecânico, servico, observacoes
from		avaliacao
INNER JOIN	cliente c  ON idCliente = avlIdCliente
INNER JOIN	mecanico m ON idMecanico = avlIdMecanico
INNER JOIN	os ON idOs = idOsAvaliacao
INNER JOIN 	veiculo ON idVeiculo = avlIdveiculo;
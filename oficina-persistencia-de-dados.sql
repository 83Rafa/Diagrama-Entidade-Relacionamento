			-- cnpj: char(14), razao_social: varchar(45), endereço: varchar(65), contato: varchar(10)
INSERT INTO oficina (cnpj, razao_social, endereço, contato)
			VALUES	('00112101000139', 'Oficina da Flo', 'Rota 66 - Radiator Springs', '2125552300');
                    select * from oficina;
            
            -- pnome: varchar(25), snome: varchar(60), cpf: char(11), cnpj: char(14), telefone: varchar(14), email: varchar(25), endereço: varchar(65)
INSERT INTO cliente (pnome, snome, cpf, cnpj, telefone, email, endereço)
			VALUES('Dave', 'Grohl', '01425836910', NULL, '912345678', 'dgrohl@grohlmail.com', 'Rua Rockstar, 290 - Los Angeles CA'),
				  ('James', 'Hetfield', '46513279825', NULL, '963051452', 'hjames@metalmail.com', 'Avenida Paulista, 2200 - São Paulo SP'),
                  ('Steven', 'Tyler', '14725836925', NULL, '945685201', 'tylerst@rockmail.com', 'Avenida Paulista, 2027 - São Paulo SP'),
                  ('Axl', 'Rose', '04128539674', NULL, '999987776', 'a_rose@gnrmail.com', 'Rua 13 de Maio, 590 - São Paulo'),
                  ('Brian', 'Johnson', '71482593601', NULL, '911223345', 'johnson@acdcmail.com', 'R. dos Arcos, s/n - Centro, Rio de Janeiro - RJ'),
                  ('Mark', 'Tornillo', '98765432110', NULL, '974410258', 'tornillo@metalmail.com', 'R. Álvaro Ramos, 270 - Botafogo, Rio de Janeiro - RJ'),
                  ('Bruce', 'Dickinson', '12345678910', NULL, '900123654', 'dickinson@maidenmail.com', 'R. Maj. Lopes, 719 - São Pedro, Belo Horizonte - MG'),
                  ('James', 'LaBrie', '19537582501', NULL, '901478523', 'labrie@dreammail.com', 'Av. Teresa Cristina, 295 - Prado, Belo Horizonte - MG'),
                  ('Zakk', 'Wylde', '94376142650', NULL, '944453369', 'wylde@metalmail.com', 'Rua Apinajés, 597 - Pompeia, São Paulo - SP'),
                  ('John', 'Petrucci', '55566677789', NULL, '922223654', 'petrucci@gprogmail.com', 'R. Fidalga, 531 - Pinheiros, São Paulo - SP'),
                  ('SPClassicos', 'Car Shop', NULL, '10147874000125', '33335521', 'classicossp@carspmail.com', 'Avenida Pacaembu 5320 - Barra Funda, São Paulo - SP'),
                  ('MG Classsic Car Studio', 'Car Studio', NULL, '10119874000139', '33101234', 'mgclassic@carmail.com', 'Av. Teresa Cristina, 12892 - Belo Horizonte - MG');
				select * from cliente;
                
            -- placa: char(8), marca: varchar(15), modelo: varchar(15), servico: varchar(250)
INSERT INTO veiculo (placa, marca, modelo, servico)
			VALUES	('ABC1D234', 'Chevrolet', 'Camaro', 'Funilaria'),
					('ABD2E345', 'Ford', 'Mustang BOSS 302', 'Sistema de Som'),
					('BAB3F147', 'Chrysler', 'Camaro SS', 'Restauração do Motor'),
					('BBA5F258', 'Plymouth', 'Hemi Barracuda ', 'Motor'),
					('GNR4E001', 'Shelby', 'Mustango GT 500', 'Restauração de Interior'),
					('AER9T541', 'Pontiac', 'GTO', 'Polimento'),
					('FOR4F444', 'Buick', 'GSX 455 Stage 1', 'Direção Elétrica'),
					('MTL0D666', 'Chevrolet', 'Chevelle SS 454', 'Tapeçaria nova'),
					('CAR4D023', 'Dodge', 'Charger 500-426 Hemi ', 'Pintura'),
					('CAR7D120', 'Plymouth', 'Road Runner ', 'Novos Frisos Cromados'),
                    ('KOM8B054', 'Wolksvagen', 'Fusca', 'Customização'),
					('FKE7A004', 'Wolksvagen', 'Konbi', 'Customização');
            
            -- especialidade enum('Pintura', 'Funilaria', 'Mecânica', 'Elétrica', 'Customização', 'Tapeçaria', 'Acessórios')	
INSERT INTO mecanico (pnome, snome, cpf, telefone, especialidade)
			VALUES	('Dave', 'Kindig', '12345678978', '91478523', 'Acessórios'),
					('Kevin', 'Schiele', '96382274101', '91595912', 'Customização'),
                    ('Will', 'Lockwood', '11144477723', '97417893', 'Elétrica'),
                    ('Eric', 'Larsen', '22255588810', '91453657', 'Funilaria'),
                    ('Greg', 'Hebard', '33344499925', '93216547', 'Mecânica'),
                    ('Bryce', 'Green', '26824884613', '98528522', 'Pintura'),
                    ('Justin', 'Stephens', '78612674521', '95588852', 'Tapeçaria');
            
            -- peca - varchar(30),  descricao - varchar(250), cursto - float
INSERT INTO pecas (peca, descricao, custo)
			VALUES	('Transmissão', 'Componente do Motor', 2500),
					('Motor', 'Motor Completo', 25000),
                    ('Suspensão', 'Jogo Completo', 1350),
                    ('Freios', 'Jogo Completo', 890),
                    ('Cabeçote', 'Componente do Motor', 4890),
                    ('Bloco do Motor', 'Componente do Motor', 4500),
                    ('Virabrequim', 'Componente do Motor', 3200),
                    ('Vela', 'Componente do Motor', 350),
                    ('Ar Condicionado', 'Interior', 2000),
                    ('Valvula', 'Componente do Motor', 590),
                    ('Pistão', 'Componente do Motor', 395),
                    ('Biela', 'Componente do Motor', 275),
                    ('Tanque', 'Célula de Combustível', 1250),
                    ('Bateria', 'Alimentação do Motor', 600),
                    ('Parachoque', 'Item de Segurança', 200),
                    ('Radiador', 'Sistema de Refrigeração', 645),
                    ('Bomba de Injeção', 'Injeção de Combustível', 680),
                    ('Bancos', 'Interior', 4000),
                    ('Kit Multimídia', 'Componentes Eletrônicos', 4000),
                    ('Painel', 'Peças Originais de Reposição', 1100),
                    ('Rodas', 'Componentes Personalizados (Jogo)', 3350),
                    ('Pneus', 'Componentes de Performance', 2250),
                    ('Disco de Freios', 'Componentes Esportivos', 1500),
                    ('Pinças', 'Componente de Freio', 180),
                    ('Frisos', 'Jogo completo cromado', 2180),
                    ('Amortecedores', 'Componente de Suspenção', 570),
                    ('Escapamento', 'Sistema de Exaustão', 1355),
                    ('Tinta', 'Produto para Pintura final', 2355),
                    ('Primer', 'Produto para Ipermeabilização pré-pintura', 1055),
					('Coletores', 'Sistema de Exaustão', 1285),
					('Direção Elétrica', 'Sistema de direção', 6450);
            
            -- servico enum ('Pintura', 'Funilaria', 'Mecânica', 'Elétrica', 'Customização', 'Tapeçaria', 'Acessórios'), descrição - varchar(250), vlrServico float
INSERT INTO servicos (servico, descricao, vlrServico)
			VALUES	('Acessórios', 'Instalação de Itens Eletrônicos', 350),
					('Customização', 'Personalização de Interiores e/ou Exteriores', 5000),
					('Elétrica', 'Manutenção e/ou Melhorias', 950),
					('Funilaria', 'Manutenção e/ou Melhorias', 5300),
					('Mecânica', 'Manutenção e/ou Melhorias', 1200),
					('Pintura', 'Pintura completa, Polimento, manutenção', 1500),
					('Tapeçaria', 'Manutenção e/ou Criação de Interiores', 5100);
            
			-- (avlVeiPlaca - char(8) not null, avOrcamento - varchar(250), avlAutorizacao - boolean, avEntrada - date, avPrevEntrega - date)
INSERT INTO avaliacao (avlIdOficina, avlIdCliente, avlIdMecanico, avlIdveiculo, avlIdpecas, avlIdservicos, avlVeiPlaca, avOrcamento, avlAutorizacao, avEntrada, avPrevEntrega)
			VALUES	(1, 1, 4, 1, NULL, 4, 'ABC1D234', 'Veículo receberá serviço de funilaria completo', 1,  '2022-07-02', '2022-09-01'),
					(1, 2, 3, 2, 19, 3, 'ABD2E345', 'Novo Sistema Multimídia', 1,  '2022-08-26', '2022-09-02'),
                    (1, 3, 5, 3, 2, 5, 'ABD2E345', 'Necessário novo motor', 0,  '2022-08-10', '2022-11-03'),
                    (1, 4, 5, 4, 7, 5, 'BBA5F258', 'Restauração do motor + novo Virabrequim', 0, '2022-08-10', '2022-11-03'),
                    (1, 5, 7, 5, 20, 7, 'GNR4E001', 'Restauração do interior', 1, '2022-08-01', '2022-10-01'),
                    (1, 6, 6, 6, NULL, 6, 'AER9T541', 'Polimento na pintura', 1, '2022-08-25', '2022-09-11'),
                    (1, 7, 3, 7, 20, 3, 'FOR4F444', 'Direção Elétrica', 1, '2022-08-18', '2022-09-01'),
                    (1, 8, 7, 8, 18, 7, 'MTL0D666', 'Tapeçaria personalizada', 1, '2022-08-19', '2022-09-25'),
                    (1, 9, 6, 9, 27, 6, 'GNR4E001', 'Restauração do interior', 1, '2022-07-01', '2022-09-04'),
                    (1, 10, 1, 10, 25, 1, 'CAR7D120', 'Frisos cromados', 1, '2022-09-01', '2022-09-07'),
                    (1, 11, 2, 11, 19, 2, 'KOM8B054', 'Customização ', 1, '2022-06-01', '2022-09-03'),
                    (1, 12, 2, 12, 28, 2, 'FKE7A004', 'Customização', 1, '2022-09-01', '2022-09-07');
				
			-- (osValor - float, osPaga - boolean, observacoes - varchar(250)
INSERT INTO os (osIdveiculo, osIdcliente, osIdoficina, osIdmecanico, osIdservico, osValor, osPaga, observacoes)
			VALUES	(1, 1, 1, 4, 4, 5300, 1, 'Serviçõs Realizados: Funilaria completa. Veículo entregue no prazo.'),
					(2, 2, 1, 3, 3, 2300, 1, 'Novo Sistema Multimídia Instalado e testado. Veículo entregue no prazo.'),
					(3, 3, 1, 5, 5, 26200, 0, 'Aguardando autorização para comprar novo motor.'),
					(4, 4, 1, 5, 5, 4400, 1, 'Motor na restauração restaurado, virabrequim pronto para ser trocado.'),
					(5, 5, 1, 7, 7, 5100, 1, 'Veículo em processo de instalação do novo interior'),
					(6, 6, 1, 6, 6, 0, 1, 'Veículo em processo de preparação para polimento'),
					(7, 7, 1, 3, 3, 6450, 1, 'Direção elétrica instalada. Veículo entrege no prazo'),
					(8, 8, 1, 7, 7, 4000, 1, 'Removida a tapeçaria antiga iniciado o processo de limpeza'),
					(9, 9, 1, 6, 6, 6450, 1, 'Restauração do interior concluida. Veículo pronto para entrega'),
					(10, 10, 1, 1, 1, 2180, 1, 'Veículo em processo de remoção dos frisos antigos'),
					(11, 11, 1, 2, 2, 4000, 1, 'Customização concluída. Retoques finais.'),
					(12, 12, 1, 2, 2, 2355, 1, 'Customização em 90%');
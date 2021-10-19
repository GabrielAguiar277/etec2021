use farmacia;

INSERT INTO tb_produto (nm_produto, vl_produto, qt_estoque, st_ativo)
VALUES
('Merthiolate 30ml', 16.49, 50, 'S'), 
('Dorflex Envelope Com 10 Comprimidos',5.00,126 , 'S'),
('Sabonete Liquido Dove Baby 200ml',13.64 ,37 , 'S'), 
('Xylocaina Pomada 25g',20.75 ,23 , 'S'),
('Protetor Solar Episol COlor Extra Clara Fps70', 90.29, 17, 'S'), 
('Locerul 50mg 2,5 ml Esmalte Antimicotico',100.33 ,7 , 'S');
 
INSERT INTO tb_cliente (nm_cliente, cpf_cliente, dt_nascimento, rg_cliente, st_ativo)
VALUES
('Ailton Cruz','111.222.333-44','2001-06-13','16.878.023-5','S'), ('Maria da Conceição','999.888.777-66','1996-11-03','23.105.701-3','S'),
('Josinilda Silva','555.666.111-00','2004-03-28','27.909.101','S'), ('João José Antônio Arantes','100.200.300-40','2007-09-16','21.111.111-1','S'),
('Tárcio Telles','900.800.700-60','1981-05-23','26.800.343','S');
 
INSERT INTO tb_tipo_pagamento (nm_tp_pagamento, st_ativo)
VALUES ('Dinheiro','S'), ('Cheque','S'), ('Cartão Débito', 'S'), ('Cartão Crédio', 'S');
 
INSERT INTO tb_telefone_cliente (id_cliente, tel_cliente)
VALUES (1, '(11) 3456-1111'),(1,'(11) 91234-5678'),(2, '(11) 3590-0101'),(3, '(11) 99999-5678'),(3, '(19) 87070-2323'),
               (5, '(11) 5678-0989');
 
INSERT INTO tb_venda (dt_venda, id_cliente, tp_pagamento)
VALUES ('2020-03-02',1,1), ('2020-03-07',3,4),('2020-03-07',5,1),('2020-03-09',1,2),('2020-03-09',4,2), ('2020-03-22', 2,3), ('2020-04-03',3,4), ('2020-04-11',5,2), ('2020-04-11',1,1);
 
INSERT INTO tb_item_venda (id_produto, qt_vendida, vl_produto, id_venda)
VALUES (1,2,16.49,1),(3,3,13.64,1),(5,1,90.29,1),(2,10,5.00,2),(2,2,5.00,3),(6,1,100.33,3),(4,1,20.75,4), (5,2,90.29,5), (2,6,5.00,6), (1,2,16.49,7), (3,3,13.64,8), (2,3,5.00,9), (4,1,20.75,9), (1,2,16.49,9);




select * from tb_cliente where cpf_cliente = '100.200.300-40';

select cli.*, tel.* from tb_cliente as cli inner join tb_telefone_cliente as tel on cli.id_cliente = tel.id_cliente where cli.cpf_cliente = "111.222.333-44";

SELECT date_format(VEND.dt_venda, '%d/%m/%y') AS 'Data da Venda',
       PAG.nm_tp_pagamento AS 'Forma de Pagamento'
FROM tb_venda AS VEND
     INNER JOIN tb_tipo_pagamento AS PAG
           ON VEND.tp_pagamento = pag.id_tp_pagamento
WHERE vend.DT_VENDA >= '2020-04-01'
ORDER BY PAG.nm_tp_pagamento asc;


SELECT date_format(VEND.dt_venda, '%d/%m/%y') AS 'Data da Venda',
       PAG.nm_tp_pagamento AS 'Forma de Pagamento',
       CLI.nm_cliente AS 'NOME DO CLIENTE',
       tel.TEL_CLIENTE as 'telefone cliente'
FROM tb_venda AS VEND
     INNER JOIN tb_tipo_pagamento PAG
           ON VEND.tp_pagamento = PAG.id_tp_pagamento
     INNER JOIN TB_CLIENTE AS CLI
           ON CLI.id_cliente = VEND.id_cliente
     INNER JOIN TB_TELEFONE_CLIENTE AS TEL
           ON TEL.ID_CLIENTE = CLI.ID_CLIENTE
WHERE vend.DT_VENDA >= '2020-04-01'
ORDER BY PAG.nm_tp_pagamento asc;

SELECT date_format(VEND.dt_venda, '%d/%m/%y') AS 'Data da Venda',
       PAG.nm_tp_pagamento AS 'Forma de Pagamento',
       CLI.nm_cliente AS 'NOME DO CLIENTE',
       tel.TEL_CLIENTE as 'telefone cliente'
FROM TB_CLIENTE as cli
     INNER JOIN TB_TELEFONE_CLIENTE AS TEL
           ON TEL.ID_CLIENTE = CLI.ID_CLIENTE
     INNER JOIN TB_venda AS vend
           ON CLI.id_cliente = VEND.id_cliente
     inner JOIN TB_TIPO_PAGAMENTO as pag
           ON PAG.ID_TP_PAGAMENTO = VEND.TP_PAGAMENTO
WHERE vend.DT_VENDA >= '2020-04-01'
ORDER BY PAG.nm_tp_pagamento asc;
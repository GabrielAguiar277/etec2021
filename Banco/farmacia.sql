create database farmacia;
 
use farmacia;
 
create table tb_produto 
(id_produto int not null auto_increment primary key,
 nm_produto varchar(45) not null,
 vl_produto decimal(8,2) not null,
 qt_estoque int not null, 
 st_ativo char(1) not null);
 
 create table tb_cliente 
(id_cliente int not null auto_increment primary key,
 nm_cliente varchar(45) not null,
 cpf_cliente varchar(14) not null,
 dt_nascimento date not null, 
 rg_cliente varchar(12) not null,
 st_ativo char(1) not null);
 
 create table tb_tipo_pagamento 
(id_tp_pagamento int not null auto_increment primary key,
 nm_tp_pagamento varchar(20) not null,
 st_ativo char(1) not null);

 create table tb_venda
(id_venda int not null auto_increment primary key,
 dt_venda datetime not null, 
 id_cliente int null ,
 tp_pagamento int not null,
 CONSTRAINT ligacao_tb_venda_tb_tp_pagamento
 FOREIGN KEY (tp_pagamento)
 REFERENCES tb_tipo_pagamento (id_tp_pagamento));
 
 create table tb_item_venda
(id_item_venda int not null auto_increment primary key,
 id_produto int not null, 
 qt_vendida int null ,
 vl_produto decimal(8,2) not null,
 id_venda int not null,
 CONSTRAINT ligacao_tb_produto_tb_item_venda
 FOREIGN KEY (id_produto)
 REFERENCES tb_produto (id_produto),
 CONSTRAINT ligacao_tb_venda_tb_item_venda
 FOREIGN KEY (id_venda)
 REFERENCES tb_venda (id_venda));
 
 create table tb_telefone_cliente
(id_tel_cliente int not null auto_increment primary key,
 id_cliente int null ,
 tel_cliente varchar(15) not null,
 CONSTRAINT ligacao_tb_cliente_tb_telefone_cliente
 FOREIGN KEY (id_cliente)
 REFERENCES tb_cliente (id_cliente));






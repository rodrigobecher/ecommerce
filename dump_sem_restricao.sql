drop database ecommerce;
create database ecommerce;
use ecommerce;
create table usuario(
	login varchar(60) not null,
    senha varchar (300) not null,
    primary key(login)
);
create table permissoes(
	idPermissoes int auto_increment not null,
	permissoes varchar(500) not null,
    login varchar(60) not null,
    primary key(idPermissoes),
    foreign key (login) references usuario(login) on delete cascade on update cascade
);

create table estado(
	idEstado int not null auto_increment,
    descricaoEstado varchar(70) not null,
    primary key(idEstado)
);
create table cidade(
	idCidade int not null auto_increment,
    descricaoCidade varchar(70) not null,
    idEstado int not null,
	foreign key (idEstado) references estado(idEstado) on delete cascade on update cascade,
    primary key(idCidade)
);
create table cliente(
	idCliente int not null auto_increment,
    nome varchar(50) not null,
    sobreNome varchar(50) not null,
    telefone varchar(20) not null,
    cpf varchar(11) not null,
    cep varchar (8) not null,
    Cidade varchar(50) not null,
    Estado varchar(50) not null,
    logradouro varchar(100),
    numero int not null,
    login varchar(50) not null,
	foreign key (login) references usuario(login) on delete cascade on update cascade,
    primary key(idCliente)
);

create table restricao(
	idRestricao int not null auto_increment,
    descricaoRestricao varchar(100),
    primary key(idRestricao)
);
create table restricaoCliente(
	idRestricaoCliente int not null auto_increment,
    idRestricao int not null,
    idCliente int not null,
	foreign key (idRestricao) references restricao(idRestricao) on delete cascade on update cascade,
    foreign key (idCliente) references cliente(idCliente) on delete cascade on update cascade,
    primary key(idRestricaoCliente)
);
create table produto(
	idProduto int not null auto_increment,
	produtoDescricao varchar(100) not null,
    quantidade int not null,
	complemento varchar(3000),
    precoVenda double,
    primary key (idProduto)
    
);
create table restricaoProduto(
	idRestricaoProduto int not null auto_increment,
    idRestricao int not null,
    idProduto int not null,
    foreign key (idRestricao) references restricao(idRestricao) on delete cascade on update cascade,
    foreign key (idProduto) references produto(idProduto) on delete cascade on update cascade,
    primary key(idRestricaoProduto)
);

create table imagem(
	idImagem int not null auto_increment,
    descricao varchar(1000),
    idProduto int,
    foreign key (idProduto) references produto(idProduto) on delete cascade on update cascade,
    primary key(idImagem)
);

/* create table formaPagamento(
	idFormaPagamento int not null auto_increment,
    descricaoPagamento varchar(60) not null,
    primary key(idFormaPagamento)
); */
use ecommerce

create table pedido(
	idPedido int not null auto_increment,
    valorTotal double not null,
   -- idCliente int not null,
    -- idFormaPagamento int not null,
   -- foreign key (idCliente) references cliente(idCliente) on delete cascade on update cascade,
    -- foreign key (idFormaPagamento) references formaPagamento(idFormaPagamento) on delete cascade on update cascade,
    primary key(idPedido)
);

create table itemPedido(
	idItemPedido int not null auto_increment,
    idPedido int not null,
    idProduto int not null,
	quantidade int not null,
    foreign key (idPedido) references pedido(idPedido) on delete cascade on update cascade,
    foreign key (idProduto) references produto(idProduto) on delete cascade on update cascade,
    primary key(idItemPedido)
);

use ecommerce
select login, senha from usuario where login = 'rodrigo'
select * from cliente
truncate cliente;
truncate usuario;
insert into usuario (login, senha) values ('rodrigo', '$2a$10$g8x41tFLZTenQeGriW7bbu2yHLWCGQ94nKqDBuZyIIfJKbOJ2fXQK');
insert into permissoes(permissoes, login) values ('ROLE_ADMIN','aline');
truncate permissoes
select permissoes, login from permissoes where login = 'rodrigo'

insert into restricao(descricaoRestricao) values ('Sem Glutem');
s



insert into restricao(descricaoRestricao) values ('Sem Glutem');
insert into restricao(descricaoRestricao) values ('Sem Lactose');
insert into restricao(descricaoRestricao) values ('Sem Frutose');


SELECT SQL_CALC_FOUND_ROWS * FROM pessoa LIMIT 0,10


select idRestricao, descricaoRestricao from restricao
/ insert into restricaoProduto (idRestricao, idProduto) values (3, 1)
SELECT SQL_CALC_FOUND_ROWS * FROM pessoa LIMIT 0,10
select produto.idProduto, produto.produtoDescricao, produto.complemento,  produto.precoVenda, imagem.idImagem,  imagem.descricao from imagem
inner join produto
on produto.idProduto = imagem.idProduto
where produto.idProduto = 43
limit 0,3;
select found_rows()
select * from produto

SELECT SQL_CALC_FOUND_ROWS * FROM produto
   LIMIT 3;
SELECT FOUND_ROWS();
select count(*)  from produto
insert into produto (produtoDescricao, quantidade, complemento, precoVenda) values ('sei la', 12,' .', 20)
 */
 SET FOREIGN_KEY_CHECKS = 0;


truncate usuario
select * from cliente
select produto.idProduto, produto.produtoDescricao, produto.complemento,  produto.precoVenda, restricao.idRestricao, restricao.descricaoRestricao from restricaoProduto
inner join produto
on produto.idProduto = restricaoProduto.idProduto
inner join restricao
on restricao.idRestricao = restricaoProduto.idRestricao
where produto.idProduto = 15


select restricao.idRestricao, restricao. descricaoRestricao from restricaoProduto
inner join restricao
on restricao.idRestricao = restricaoProduto.idRestricao
where idProduto = 15

update restricaoProduto set idRestricao = 2 where idProduto = 9

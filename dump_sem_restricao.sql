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


create table pedido(
	idPedido int not null auto_increment,
    valorTotal double not null,
	idCliente int not null,
	foreign key (idCliente) references cliente(idCliente) on delete cascade on update cascade,
    primary key(idPedido)
);

create table itemPedido(
	idItemPedido int not null auto_increment,
    idPedido int not null,
    idProduto int not null,
	quantidade int not null,
    dataPedido Date,
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
insert into permissoes(permissoes, login) values ('ROLE_ADMIN','rodrigo');
truncate permissoes

select * from usuario
select permissoes, login from permissoes where login = 'rodrigo'

insert into restricao(descricaoRestricao) values ('Sem Glutem');
insert into restricao(descricaoRestricao) values ('Sem Lactose');
insert into restricao(descricaoRestricao) values ('Sem Frutose');
insert into restricao(descricaoRestricao) values ('Sem Sacarose');

SELECT SQL_CALC_FOUND_ROWS * FROM pessoa LIMIT 0,10

select * from pedido

select * from itempedido

select idRestricao, descricaoRestricao from restricao
/ insert into restricaoProduto (idRestricao, idProduto) values (3, 1)
SELECT SQL_CALC_FOUND_ROWS * FROM pessoa LIMIT 0,10

select produto.idProduto, produto.produtoDescricao, sum(itempedido.quantidade) as quantidade, itempedido.dataPedido  from itempedido
inner join produto
on produto.idProduto = itempedido.idProduto
group by (itempedido.idProduto)
HAVING COUNT(itempedido.quantidade)
order by quantidade desc
limit 3



select produto.idProduto, produto.produtoDescricao, itempedido.quantidade, itempedido.dataPedido  from itempedido
inner join produto
on produto.idProduto = itempedido.idProduto

select found_rows()
select * from restricao
use ecommerce
SELECT SQL_CALC_FOUND_ROWS * FROM produto
   LIMIT 3;
SELECT FOUND_ROWS();
select count(*)  from produto
insert into produto (produtoDescricao, quantidade, complemento, precoVenda) values ('sei la', 12,' .', 20)
 */
 SET FOREIGN_KEY_CHECKS = 0;

select idCliente, nome, sobreNome, telefone, cpf, cep, Cidade, Estado, logradouro, numero, login from cliente
where login = 'rodrigo' 

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

update cliente set telefone = 33392988 where idCliente =1
update produto set precoVenda = '2.50' where idProduto = 47
select * from produto
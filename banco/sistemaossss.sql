
select * from usuarios;
show tables;
create database dbsistema;
show databases;



drop table clientes;



use dbsistema;


create table clientes (
id int primary key auto_increment,
nome varchar(50) not null,
cpf varchar(11) not null unique,
endereco varchar(30) not null,
numero varchar(10) not null,
complemento varchar(20),
bairro varchar(50) not null,
cep varchar(20) not null,
cidade varchar(30) not null,
uf char(2),
fone varchar(12) not null,
email varchar(50) not null unique
);

-- //idcli nome cpf endereco numero complemento bairro cep cidade uf fone email
select * from usuarios where nome like 'b%' order by nome;
select * from clientes;
/*CRIANDO TELA DE LOGIN(TIPO 1-N*/
-- timestamp default current_timestamp (data e hora automatica)
--  decimal (numeros nao inteiros) 10,2 (digitos, casas decimal
-- 1 (fk) ----- n (pk)
-- foreign key (idcli) references clientes(idcli) ele cria a tabela e relaciona as tabelas



create table servicos (
       os int primary key auto_increment,
       dataOS timestamp default current_timestamp,
       equipamento varchar(200) not null,
       defeito varchar(200) not null,
       valor decimal(10,2),
       id int not null,
       foreign key (id) references clientes(id)
       );

insert into servicos (equipamento,defeito,valor,id)
values ('Notebook LeNovo G90','Troca da fonte',250,1);

/**impressao os*/


select * from servicos
inner join  clientes
on servicos.id = clientes.id;
-- selecionando o conteudo de 2 ou mais tabelas

/** imprimir/relatorios/gerar documento pdf**/
-- clientes
select nome,fone,email from clientes order by nome;

-- servicos
select 
servicos.os,servicos.dataOS,servicos.equipamento,servicos.defeito,
servicos.valor,
clientes.nome
from servicos
inner join clientes
on servicos.id = clientes.id;

 

select * from clientes
inner join  cliente
on servicos.id = clientes.id;
-- selecionando o conteudo de 2 ou mais tabelas

/** imprimir/relatorios/gerar documento pdf**/
-- clientes
select id,nome,cpf,endereco,numero,complemento,bairro,cep,cidade,uf from clientes order by nome;

-- servicos
select 
servicos.os,servicos.dataOS,servicos.equipamento,servicos.defeito,
servicos.valor,
clientes.nome
from servicos
inner join clientes
on servicos.id = clientes.id;

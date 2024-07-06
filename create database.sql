create database livraria;
use livraria;
create table livros(
nome_do_livro varchar (30),
nome_do_autor varchar (30),
sexo_do_autor enum ('F', 'M'),
numero_de_paginas int,
editora varchar (30),
valor_do_livro decimal( 9, 2),
estado_UF varchar (2),
ano_publicacao CHAR(4)
);
insert into livros
values
('cavaleiro_real','ana_claudia','f','465','atlas',49.9,'rj','2009'),
('sql_para_leigos','joao_nunes','m','450','addison',98,'sp','2018'),
('receitas_caseiras','celia_tavares','f','210','atlas',45,'rj','2008'),
('pessoas_efetivas','eduardo_santos','m','390','beta',78.99,'rj','2018'),
('habitos_saudaveis','eduardo_santos','m','630','beta',150.98,'rj','2019'),
('a_casa_marrom','hermes_macedo','m','250','bubba',60,'mg','2016'),
('estacio_querido','geraldo_francisco','m','310','insignia',100,'es','2015'),
('pra_sempre_amigas','leda_silva','f','510','insignia',78.98,'es','2011'),
('copas_inesqueciveis','marco_alcantara','m','200','larson',130.98,'rs','2018'),
('o_poder_da_mente','clara_mafra','f','120','continental',56.58,'sp','2017');


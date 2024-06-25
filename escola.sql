create database escola;
use escola;

create table escola(
	id int primary key auto_increment,
    nome varchar(255)
);

create table professor(
	id int primary key auto_increment,
    nome varchar(45),
    cpf int
);

create table sala (
	id int primary key auto_increment,
    numero int,
    andar varchar(45),
    predio varchar(45),
    setor varchar(45)
);

create table turma (
	id int primary key auto_increment,
    nome varchar(5),
    constraint escola_id foreign key (id) references escola(id),
    constraint sala_id foreign key (id) references sala(id)
);

create table aula (
	id int primary key auto_increment,
	constraint professor_id foreign key (id) references professor(id),
    constraint turma_id foreign key (id) references turma(id)
);
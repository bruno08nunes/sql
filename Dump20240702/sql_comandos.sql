create table estoque (
	id_sala int primary key,
    espaco varchar(120)
);

insert into estoque
values ("104", "10m² x 2.5 m altura"),
("102", "50cm² por 1.3 m altura");

insert into estoque values (0, "30cm² por 30cm de altura");

create table categorias (
	id int primary key auto_increment,
    nome varchar(45) not null
);

insert into categorias (nome)
values ("Papelaria"), ("Higiene");

create table itens (
	id int primary key auto_increment,
    nome varchar(45) not null,
    descricao varchar(120),
    gasto_mensal float,
    tamanho float,
    categoria_id int,
    foreign key (categoria_id) references categorias(id)
);

insert into itens (nome, descricao, gasto_mensal, tamanho, categoria_id)
values ("Folha A4", "Folha A4 Branca", 0, "30cmx15cm", 1),
("Folha A4 Colorida", "Folha A4 de várias cores, como rosa, roxo, azul, vermelho", 0, "30cmx15cm", 1),
("Papel Higiênico", "Rolo de papel higiênico", 0, "15cmx15cmx10cm", 2);

create table estoque_has_itens (
	id_sala int,
    id_itens int,
    quantidade int,
    foreign key (id_sala) references estoque(id_sala),
    foreign key (id_itens) references itens(id),
    primary key (id_sala, id_itens)
);

insert into estoque_has_itens (id_sala, id_itens, quantidade)
values (0, 1, 100),
(104, 1, 200),
(104, 2, 100),
(102, 1, 100),
(102, 3, 30);

create table usuario (
	id int primary key auto_increment,
    nome varchar(45) not null,
    email varchar(120) not null,
    senha varchar(45) not null
);

insert into usuario (nome, email, senha)
values ("Guilherme", "gui@email.com", "123"),
("Andrei", "careca@email.com", "admin"),
("Bruna", "bruna@email.com", "2812");

create table admin (
	id int primary key auto_increment,
    nome varchar(45) not null,
    email varchar(120) not null,
    senha varchar(45) not null
);

insert into admin (nome, email, senha)
values ("Amanda", "amanda@email.com", "321"),
("Gabriela", "gabriela@email.com", "gabriela");

create table pedidos (
	id int primary key auto_increment,
    estado enum("A", "R", "P") default "P", -- Aceito, Recusado ou Pendente
    comentario varchar(120),
    usuario_id int,
    foreign key (usuario_id) references usuario(id)
);

insert into pedidos (comentario, usuario_id)
values ("Gostaria de aproximadamente 50 Folhas Brancas", 3),
("Preciso de algumas folhas coloridas, de qualquer cor", 2),
("", 1);

insert into pedidos (comentario, usuario_id)
values ("Preciso de algumas folhas coloridas rosas", 3);

create table pedidos_has_itens (
	pedidos_id int,
    itens_id int,
    foreign key (pedidos_id) references pedidos (id),
    foreign key (itens_id) references itens (id),
    primary key (pedidos_id, itens_id)
);

insert into pedidos_has_itens (pedidos_id, itens_id)
values (1, 1),
(2, 2),
(3, 2),
(3, 3),
(4, 2);

select * from pedidos where (select id from usuario where nome = "Bruna") = usuario_id;
select * from pedidos_has_itens where (select id from itens where nome = "Folha A4 Colorida") = itens_id;
select usuario.nome, count(pedidos_has_itens.pedidos_id) as num_pedidos from usuario, pedidos_has_itens where pedidos_has_itens.pedidos_id = usuario.id group by usuario.nome;
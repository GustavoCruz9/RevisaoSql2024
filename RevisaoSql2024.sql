create database RevisaoSql2024
go
use RevisaoSql2024
go
create table Aluno (
ra			int				not null,
nome		varchar(100)	not null,
idade		int				not null check(idade >= 0)
Primary key(ra)		
)
go
create table Disciplina (
codDisciplina		int			not null,
nome				varchar(80)	not null,
carga_horaria		int			not null check(carga_horaria >= 32)
Primary key(codDisciplina)
)
go
create table Titulacao (
codTitulacao	int			not null,
titulo			varchar(40)	not null
Primary key(codTitulacao)
)
go
create table Professor (
registro		int				not null,
nome			varchar(100)	not null,
codTitulacao	int				not null
Primary key(registro)
Foreign key(codTitulacao) references Titulacao(codTitulacao)
)
go
create table Curso (
codCurso		int				not null,
nome			varchar(50)		not null,
area			varchar(100)		not null
Primary key(codCurso)
)
go
create table Aluno_Disciplina (
ra					int			not null,
codDisciplina		int			not null
Primary key(ra, codDisciplina)
Foreign key(ra) references Aluno(ra),
Foreign key(codDisciplina) references Disciplina(codDisciplina)
)
go
create table Curso_Disciplina (
codCurso		int				not null,
codDisciplina		int			not null
Primary key(codCurso, codDisciplina)
Foreign key(codCurso) references Curso(codCurso),
Foreign key(codDisciplina) references Disciplina(codDisciplina)
)
go
create table Disciplina_Professor (
codDisciplina		int			not null,
registro			int			not null
Primary key(codDisciplina, registro)
Foreign key(codDisciplina) references Disciplina(codDisciplina),
Foreign key(registro) references Professor(registro)
)
go
INSERT INTO Aluno (ra, nome, idade) VALUES
(3416, 'DIEGO PIOVESAN DE RAMOS', 18),
(3423, 'LEONARDO MAGALHÃES DA ROSA', 17),
(3434, 'LUIZA CRISTINA DE LIMA MARTINELI', 20),
(3440, 'IVO ANDRÉ FIGUEIRA DA SILVA', 25),
(3443, 'BRUNA LUISA SIMIONI', 37),
(3448, 'THAÍS NICOLINI DE MELLO', 17),
(3457, 'LÚCIO DANIEL TÂMARA ALVES', 29),
(3459, 'LEONARDO RODRIGUES', 25),
(3465, 'ÉDERSON RAFAEL VIEIRA', 19),
(3466, 'DAIANA ZANROSSO DE OLIVEIRA', 21),
(3467, 'DANIELA MAURER', 23),
(3470, 'ALEX SALVADORI PALUDO', 42),
(3471, 'VINÍCIUS SCHVARTZ', 19),
(3472, 'MARIANA CHIES ZAMPIERI', 18),
(3482, 'EDUARDO CAINAN GAVSKI', 19),
(3483, 'REDNALDO ORTIZ DONEDA', 20),
(3499, 'MAYELEN ZAMPIERON', 22)
go
INSERT INTO Disciplina (codDisciplina, nome, carga_horaria) VALUES
(1, 'Laboratório de Banco de Dados', 80),
(2, 'Laboratório de Engenharia de Software', 80),
(3, 'Programação Linear e Aplicações', 80),
(4, 'Redes de Computadores', 80),
(5, 'Segurança da informação', 40),
(6, 'Teste de Software', 80),
(7, 'Custos e Tarifas Logísticas', 80),
(8, 'Gestão de Estoques', 40),
(9, 'Fundamentos de Marketing', 40),
(10, 'Métodos Quantitativos de Gestão', 80),
(11, 'Gestão do Tráfego Urbano', 80),
(12, 'Sistemas de Movimentação e Transporte', 40)
go
INSERT INTO Titulacao (codTitulacao, titulo) VALUES
(1, 'Especialista'),
(2, 'Mestre'),
(3, 'Doutor')
go
INSERT INTO Professor (registro, nome, codTitulacao) VALUES
(1111, 'Leandro', 2),
(1112, 'Antonio', 2),
(1113, 'Alexandre', 3),
(1114, 'Wellington', 2),
(1115, 'Luciano', 1),
(1116, 'Edson', 2),
(1117, 'Ana', 2),
(1118, 'Alfredo', 1),
(1119, 'Celio', 2),
(1120, 'Dewar', 3),
(1121, 'Julio', 1)
go
INSERT INTO Curso (codCurso, nome, area) VALUES
(1, 'ADS', 'Ciências da Computação'),
(2, 'Logística', 'Engenharia Civil')
go
INSERT INTO Aluno_Disciplina (codDisciplina, ra) VALUES
(1, 3416),
(4, 3416),
(1, 3423),
(2, 3423),
(5, 3423),
(6, 3423),
(2, 3434),
(5, 3434),
(6, 3434),
(1, 3440),
(5, 3443),
(6, 3443),
(4, 3448),
(5, 3448),
(6, 3448),
(2, 3457),
(4, 3457),
(5, 3457),
(6, 3457),
(1, 3459),
(6, 3459),
(7, 3465),
(11, 3465),
(8, 3466),
(11, 3466),
(8, 3467),
(12, 3467),
(8, 3470),
(9, 3470),
(11, 3470),
(12, 3470),
(7, 3471),
(7, 3472),
(12, 3472),
(9, 3482),
(11, 3482),
(8, 3483),
(11, 3483),
(12, 3483),
(8, 3499)
go
INSERT INTO Disciplina_Professor (codDisciplina, registro) VALUES
(1, 1111),
(2, 1112),
(3, 1113),
(4, 1114),
(5, 1115),
(6, 1116),
(7, 1117),
(8, 1118),
(9, 1117),
(10, 1119),
(11, 1120),
(12, 1121)
go
INSERT INTO Curso_Disciplina (codDisciplina, codCurso) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2)
go

select a.ra, a.nome, d.nome
from Aluno a, Aluno_Disciplina ad, Disciplina d
Where ad.ra = a.ra and ad.codDisciplina = d.codDisciplina

go

select p.nome, d.nome
from Professor p, Disciplina d, Disciplina_Professor dp
Where dp.codDisciplina = d.codDisciplina and dp.registro = p.registro

go

SELECT C.nome 
FROM Curso C
JOIN  Curso_Disciplina CD ON C.codCurso = CD.codCurso
JOIN Disciplina D ON CD.codDisciplina = D.codDisciplina
WHERE D.Nome = 'Laboratório de Banco de Dados'

go

SELECT C.area
FROM Curso C
JOIN Curso_Disciplina CD ON C.codCurso = CD.codCurso
JOIN Disciplina D ON CD.codDisciplina = D.codDisciplina
WHERE D.Nome = 'Laboratório de Banco de Dados'

go

SELECT T.titulo
FROM Disciplina D
JOIN Disciplina_Professor PD ON D.codDisciplina = PD.codDisciplina
JOIN Professor P ON PD.registro = P.Registro
JOIN Titulacao T ON P.codTitulacao = T.codTitulacao
WHERE D.Nome = 'Laboratório de Banco de Dados'

go

SELECT D.nome, COUNT(AD.ra) AS QuantidaDeAlunos
FROM Disciplina D
LEFT JOIN Aluno_Disciplina AD ON D.codDisciplina = AD.codDisciplina
GROUP BY D.nome, D.codDisciplina

go

SELECT P.nome
FROM Disciplina D
JOIN Disciplina_Professor DP ON D.codDisciplina = DP.codDisciplina
JOIN Professor P ON DP.registro = P.Registro
JOIN Aluno_Disciplina AD ON D.codDisciplina = AD.codDisciplina
WHERE D.Nome = 'Segurança da informação'
GROUP BY P.Nome, P.Registro
HAVING COUNT(AD.ra) >= 5

go

SELECT C.nome, COUNT(DISTINCT DP.registro) AS Quantidade
FROM Curso C
JOIN Curso_Disciplina CD ON C.codCurso = CD.codCurso
JOIN Disciplina D ON CD.codDisciplina = D.codDisciplina
JOIN Disciplina_Professor DP ON D.codDisciplina = DP.codDisciplina
GROUP BY C.nome, C.codCurso


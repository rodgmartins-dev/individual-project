-- Comandos para MySQL Server

CREATE DATABASE projeto;
USE projeto;

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
email VARCHAR(45),
senha VARCHAR(45)
)AUTO_INCREMENT = 100;

CREATE TABLE exercicio (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
tipo VARCHAR(45)
);

CREATE TABLE personalrecord (
id INT AUTO_INCREMENT,
fk_usuario INT,
CONSTRAINT fkpr_usuario FOREIGN KEY (fk_usuario)
REFERENCES usuario(id),
fk_exercicio INT,
CONSTRAINT fkpr_exercicio FOREIGN KEY (fk_exercicio)
REFERENCES exercicio(id),
data_dia DATETIME,
valor FLOAT,
CONSTRAINT pk_personalrecord PRIMARY KEY (id, fk_usuario, fk_exercicio)
);


/*INSERT INTO personalrecord (fk_usuario, fk_exercicio, data_dia, valor) VALUES
	(100, 1, CAST(now()  AS DATE) , 999);*/

INSERT INTO exercicio (tipo, nome) VALUES
-- Barbell
('Barbell', 'Back squat'),
('Barbell', 'Bent over row'),
('Barbell', 'bench press'),
('Barbell', 'Clean'),
('Barbell', 'clean & jerk'),
('Barbell', 'clean pull'),
('Barbell', 'cluster'),
('Barbell', 'Deadlift'),
('Barbell', 'Front squat'),
('Barbell', 'Hang power clean'),
('Barbell', 'Hang power snatch'),
('Barbell', 'Hang squat clean'),
('Barbell', 'Hang power snatch'),
('Barbell', 'Muscle clean'),
('Barbell', 'Muscle Snatch'),
('Barbell', 'Overhead Lunge'),
('Barbell', 'Overhead squat'),
('Barbell', 'Power clean'),
('Barbell', 'Push jerk'),
('Barbell', 'Shoulder press'),
('Barbell', 'Snatch'),
('Barbell', 'Snatch balance'),
('Barbell', 'Snatch deadlift'),
('Barbell', 'Snatch pull'),
('Barbell', 'Split jerk'),
('Barbell', 'Squat clean'),
('Barbell', 'Squat jerk'),
('Barbell', 'Squat Snatch'),
('Barbell', 'Sumo deadlift'),
('Barbell', 'Sumo deadlift high pull'),
('Barbell', 'thruster'),
-- Endurance
('Endurance', 'AirBike (100cal)'),
('Endurance', 'AirBike (50cal)'),
('Endurance', 'AirBike (max cal 1\')'),
('Endurance', 'Row 100m'),
('Endurance', 'Row 200m'),
('Endurance', 'Row 500m'),
('Endurance', 'Row 1km'),
('Endurance', 'Row 2km'),
('Endurance', 'Row 5km'),
('Endurance', 'Row 10km'),
('Endurance', 'Row 21km'),
('Endurance', 'Run 100m'),
('Endurance', 'Run 200m'),
('Endurance', 'Run 300m'),
('Endurance', 'Run 500m'),
('Endurance', 'Run 1km'),
('Endurance', 'Run 1.6km'),
('Endurance', 'Run 3km'),
('Endurance', 'Run 5km'),
('Endurance', 'Run 10km'),
('Endurance', 'Run 15km'),
-- Gymnastic
('Gymnastic', 'Bar Muscle-Ups (max reps 1\')'),
('Gymnastic', 'Bar Muscle-Ups (max unbroken)'),
('Gymnastic', 'Chest-to-bar (max unbroken)'),
('Gymnastic', 'Double-Under unbroken'),
('Gymnastic', 'Handstand push-ups (max reps 1\')'),
('Gymnastic', 'Handstand push-ups (max unbroken)'),
('Gymnastic', 'Handstand walk (max distance)'),
('Gymnastic', 'Muscle-ups (max unbroken)'),
('Gymnastic', 'Pull-up (max weight)'),
('Gymnastic', 'Pull-up (max unbroken)'),
('Gymnastic', 'Push-up (max unbroken)'),
('Gymnastic', 'Strict Handstand push-ups'),
('Gymnastic', 'Strict Pull-ups'),
('Gymnastic', 'Strict Toes-to-bar'),
('Gymnastic', 'Toes-to-bar');


INSERT INTO usuario (nome, email, senha) VALUES ('Rodrigo', 'vini1@csgo.com', '1234567');

INSERT INTO personalrecord VALUES
(default, 105, 1, '2025-05-29', 90),
(default, 105, 1, '2025-05-28', 80),
(default, 105, 1, '2025-05-27', 70),
(default, 105, 1, '2025-05-25', 60);

/*
SELECT * FROM personalrecord;
SELECT * FROM usuario;

SELECT id, nome FROM exercicio ORDER BY id;

SELECT usuario.nome, exercicio.nome, personalrecord.valor, personalrecord.data_dia
	FROM personalrecord JOIN usuario
    ON personalrecord.fk_usuario = usuario.id
    JOIN exercicio ON exercicio.id = personalrecord.fk_exercicio;
    
SELECT usuario.id, usuario.nome AS Usuario, exercicio.nome, pr.data_dia, pr.valor
	    FROM exercicio
        JOIN personalrecord pr ON exercicio.id = pr.fk_exercicio
        JOIN usuario ON pr.fk_usuario = usuario.id
        ORDER BY exercicio.nome;
    
SELECT usuario.id, usuario.nome AS usuario, exercicio.nome, pr.id AS idPost, pr.data_dia, pr.valor
	    FROM exercicio
        JOIN personalrecord pr ON exercicio.id = pr.fk_exercicio
        JOIN usuario ON pr.fk_usuario = usuario.id
        ORDER BY exercicio.nome;
        
SELECT usuario.id, usuario.nome AS usuario, exercicio.nome, pr.id AS idPost, pr.data_dia, pr.valor
	    FROM exercicio
        JOIN personalrecord pr ON exercicio.id = pr.fk_exercicio
        JOIN usuario ON pr.fk_usuario = usuario.id
        ORDER BY exercicio.nome AND valor;        
        
        
SELECT * FROM exercicio ex INNER JOIN personalrecord pr
	ON ex.id = pr.fk_exercicio
	WHERE pr.fk_exercicio = 6 and pr.fk_usuario = 100
	ORDER BY data_dia;

set @valorMIN  =  (select VALOR FROM PersonalRecord where fk_exercicio = 6 AND fk_usuario = 100 order by Data_dia desc LIMIT 1 );
set @valorMAX  =  (select  valor  FROM PersonalRecord where fk_exercicio = 6 AND fk_usuario = 100 order by Data_dia ASC LIMIT 1 );

SELECT pr.fk_exercicio AS id_Exercicio, min(pr.valor) as MIN_VALOR, MAX(pr.valor) AS MAX_VALOR, COUNT(pr.fk_exercicio) AS QTDE_PR, (@valorMIN - @valorMAX) /100  AS prog FROM exercicio ex INNER JOIN personalrecord pr
	ON ex.id = pr.fk_exercicio
	WHERE  pr.fk_exercicio = 6 AND pr.fk_usuario = 100
	GROUP BY pr.fk_exercicio;
*/
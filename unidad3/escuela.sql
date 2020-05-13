DROP DATABASE escuela;

CREATE DATABASE escuela;

USE escuela;

CREATE TABLE ESTUDIANTE(
ID INT NOT NULL, 
NOMBRE VARCHAR (20) NOT NULL, ANO_INGRESO  INT NOT NULL,
PRIMARY KEY (ID)
);

CREATE TABLE ASIGNATURA(
CODIGO VARCHAR(7) NOT NULL,
NAME VARCHAR (20) NOT NULL,
SEMESTRE INT NOT NULL,       
PRIMARY KEY (CODIGO)
);

CREATE TABLE CURSAR(
ESTUDIANTE_ID INT NOT NULL,
ASIGNATURA_CODIGO VARCHAR(7) NOT NULL,
AÑO INT NOT NULL,
NOTA_FINAL FLOAT NOT NULL,
PRIMARY KEY(ESTUDIANTE_ID, ASIGNATURA_CODIGO, AÑO),
FOREIGN KEY (ESTUDIANTE_ID) REFERENCES ESTUDIANTE(ID),
FOREIGN KEY (ASIGNATURA_CODIGO) REFERENCES ASIGNATURA(CODIGO)
);

CREATE TABLE TENER_REQUISITO(
ASIGNATURA_NECESARIA VARCHAR(7) NOT NULL,
ASIGNATURA VARCHAR(7) NOT NULL,
PRIMARY KEY(ASIGNATURA_NECESARIA, ASIGNATURA)
);

ALTER TABLE TENER_REQUISITO ADD CONSTRAINT fk1 FOREIGN KEY (ASIGNATURA_NECESARIA) REFERENCES ASIGNATURA(CODIGO);

ALTER TABLE TENER_REQUISITO ADD CONSTRAINT fk2 FOREIGN KEY (ASIGNATURA) REFERENCES ASIGNATURA(CODIGO);

INSERT INTO ESTUDIANTE
VALUES (1, "Olivia", 2016), 
(2, "Daniel", 2015), 
(3, "Victoria", 2015), 
(4, "José", 2014), 
(5, "Maya", 2017);

INSERT INTO ASIGNATURA
VALUES (1, "Construcción de software", 4), 
(2, "Base de datos", 5), 
(3, "Arquitectura de Software", 6), 
(4, "Inteligencia Artificial", 5), 
(5, "Estructura de datos", 4);

INSERT INTO CURSAR
VALUES (1, 1, 2017,6.3), 
(1, 2, 2017,7.0), 
(2, 4, 2018,6.5), 
(2, 1, 2016,4.0), 
(3, 4, 2018,5.2);

INSERT INTO TENER_REQUISITO
VALUES (1, 2), 
(2, 3), 
(2, 4);

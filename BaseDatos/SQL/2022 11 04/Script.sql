

--query para agregar registros a una tabla
INSERT INTO generationc2.estudiante
(id, nombre, apellido)
VALUES(1, 'Juan', 'perez');
INSERT INTO generationc2.estudiante
(id, nombre, apellido)
VALUES(2, 'Pedro', 'Rodriguez');


--query para eliminar registros de una tabla 
DELETE FROM generationc2.estudiante
WHERE id=1 AND nombre='Juan' AND apellido='perez';
DELETE FROM generationc2.estudiante
WHERE id=2 AND nombre='Pedro' AND apellido='Rodriguez';

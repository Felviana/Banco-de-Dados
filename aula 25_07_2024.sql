DECLARE @nome varchar(50)
DECLARE @data_nascimento datetime
DECLARE @num_pets varchar(2)

SET @nome = 'André'
SET @data_nascimento = '1998-02-10' 
SET @num_pets = '2'

SELECT 'Meu nome é ' + @nome + ', nasci em ' + CONVERT(varchar, @data_nascimento, 103) + ' e tenho ' + @num_pets + ' pets.';
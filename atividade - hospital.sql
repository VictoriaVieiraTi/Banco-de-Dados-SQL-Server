-- ATIVIDADE 
--criando uma procedure para atualização de telefone 
CREATE PROCEDURE sp_AtualizarTelefone
    @id_paciente INT, 
    @telefone VARCHAR(20)
 AS  
 BEGIN 
 UPDATE Pacientes
 SET telefone = @telefone
 WHERE id_paciente = @id_paciente;
 
 END;

 
EXEC sp_AtualizarTelefone
    @id_paciente = 1,
    @telefone = '11987654321';

  
 -- criando uma procure para consultar lista de médico 
CREATE PROCEDURE sp_ListarConsultasMedico
    id_medico INT 
AS 
BEGIN 
SELECT * FROM Consultas
WHERE id_medico = @id_medico;
END; 

-- executar 
EXEC sp_ListarConsultasMedico
    @id_medico = 1; 


   --3 ALTERAR UMA PROCEDURE UTILIZANDO ALTER PROCEDURE

   ALTER PROCEDURE sp_AtualizarTelefone
      @id_paciente INT,
      @nov_telefone VARCHAR(20)
   AS 
   BEGIN
   UPDATE Paciente
   SET Telefone = @nov_telefone
   WHERE @id_paciente @id_paciente;
   END;



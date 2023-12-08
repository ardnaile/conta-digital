CREATE PROCEDURE proc_bloquearConta
    @NumConta INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM Conta WHERE num_conta = @NumConta)
    	BEGIN
        	RAISERROR('Conta não encontrada.', 16, 1);
		RETURN; 
    	END
	    
	IF EXISTS (SELECT 1 FROM Conta WHERE num_conta = @NumConta and bloqueio <> 0)
    	BEGIN
		RAISERROR('Esta conta ja esta bloqueada.', 16, 1);
		RETURN; 	
	END
	ELSE
	BEGIN
		UPDATE Conta SET bloqueio = 1 WHERE num_conta = @NumConta;
		SELECT 'Esta conta foi bloqueada' AS Mensagem;
	END
	
END


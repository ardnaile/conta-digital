CREATE PROCEDURE proc_barrarConta
    @NumConta INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Conta WHERE num_conta = @NumConta and bloqueio <> 0)
    	BEGIN
		RAISERROR('Esta conta ja esta bloqueada.', 16, 1);
		RETURN; 	
	END
	ELSE
	BEGIN
		UPDATE Conta SET conta_bloqueada = 1 WHERE num_conta = @NumConta;	
	END
	
END


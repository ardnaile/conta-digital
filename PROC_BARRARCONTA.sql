CREATE PROCEDURE proc_barrarConta
    @NumConta INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Conta WHERE num_conta in (1,4,6,7))
    BEGIN
        --Caso a conta não exista sai da proc
        RAISERROR('Esta conta esta bloqueada.', 16, 1);
		RETURN; 
    END
END

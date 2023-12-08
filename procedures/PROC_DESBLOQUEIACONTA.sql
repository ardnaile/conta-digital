CREATE PROCEDURE proc_desbloquearConta
    @NumConta INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Conta WHERE num_conta = @NumConta AND bloqueio = 0)
    BEGIN
        RAISERROR('Esta conta não está bloqueada.', 16, 1);
        RETURN; 
    END
    ELSE
    BEGIN
        UPDATE Conta SET bloqueio = 0 WHERE num_conta = @NumConta;
        SELECT 'Esta conta foi desbloqueada' AS Mensagem;
    END
END
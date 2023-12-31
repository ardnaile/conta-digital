CREATE PROCEDURE proc_realizar_transacao
    @valor_transacao DECIMAL(18, 0),
    @tp_transacao INT,
    @num_conta INT
AS
BEGIN
    -- Verifica se a conta existe
    IF NOT EXISTS (SELECT 1 FROM Conta WHERE num_conta = @num_conta)
    BEGIN
        --Caso a conta não exista, sai da proc
        RAISERROR('Conta não encontrada.', 16, 1);
        RETURN; 
    END
    BEGIN
        -- Insere a nova transação
        INSERT INTO Transacao(valor_transacao, tp_transacao, num_conta)
        VALUES (@valor_transacao, @tp_transacao, @num_conta);

        -- Retorna uma mensagem indicando que a transação foi realizada com sucesso
        SELECT 'Transação realizada com sucesso.' AS Mensagem;
    END
END;

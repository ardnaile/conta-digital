CREATE PROCEDURE proc_realizar_transacao
    @valor_transacao DECIMAL(18, 0),
    @dt_horatransacao DATETIME,
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

    -- Verifica se há saldo suficiente na conta
    IF (SELECT Saldo FROM Conta WHERE num_conta = @num_conta) < @valor_transacao
    BEGIN
        -- Caso o saldo seja menor ou igual ao valor da transação, sai da proc
        RAISERROR('Saldo insuficiente.', 16, 1);
        RETURN;
    END
    ELSE
    BEGIN
        -- Insere a nova transação
        INSERT INTO Transacao(valor_transacao, dt_hr_transacao, tp_transacao, num_conta)
        VALUES (@valor_transacao, @dt_horatransacao, @tp_transacao, @num_conta);

        -- Retorna uma mensagem indicando que a transação foi realizada com sucesso
        SELECT 'Transação realizada com sucesso.' AS Mensagem;
    END
END;

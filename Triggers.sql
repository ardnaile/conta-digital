-- Criação da Trigger que atualiza o saldo OK
CREATE TRIGGER atualizar_saldo
ON Transacao
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @novo_saldo DECIMAL(10, 2);

    -- Calcula o novo saldo após a transação
    UPDATE Conta
    SET @novo_saldo = saldo + i.valor_transacao
    FROM Conta
    INNER JOIN inserted i ON Conta.num_conta = i.num_conta;

    -- Atualiza o saldo na tabela Conta
    UPDATE Conta
    SET saldo = @novo_saldo
    FROM Conta
    INNER JOIN inserted i ON Conta.num_conta = i.num_conta;
END;

-- Criação da Trigger para impedir transacao com saldo insuficiente OK

CREATE TRIGGER verifica_saldo_suficiente
ON Transacao
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verifica se o saldo é suficiente antes de inserir a transação
    IF (SELECT COUNT(*) FROM inserted i
        INNER JOIN Conta c ON i.num_conta = c.num_conta
        WHERE c.saldo >= i.valor_transacao) = (SELECT COUNT(*) FROM inserted)
    BEGIN
        -- Se o saldo for suficiente, realiza a inserção
        INSERT INTO Transacao (valor_transacao, dt_hr_transacao, tp_transacao, num_conta)
        SELECT valor_transacao, dt_hr_transacao, tp_transacao, num_conta FROM inserted i;

        -- Atualiza o saldo na tabela Conta
        UPDATE Conta
        SET saldo = saldo - i.valor_transacao
        FROM Conta
        INNER JOIN inserted i ON Conta.num_conta = i.num_conta;
    END
    ELSE
    BEGIN
        -- Se o saldo não for suficiente, a transação é impedida
        THROW 50000, 'Saldo insuficiente.', 1;    
    END
END;

-- Trigger para salvar alterações na tabela Transacao OK
CREATE TRIGGER salvar_historico_transacao
ON Transacao
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO HistoricoTransacoes (num_conta, id_transacao, tp_transacao)
    SELECT i.num_conta, i.id_transacao, i.tp_transacao
    FROM inserted i;
END;
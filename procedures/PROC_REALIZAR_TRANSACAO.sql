CREATE PROCEDURE proc_realizar_transacao
    @id_transacao INT,
    @valor_transacao DECIMAL(18, 0),
    @dt_horatransacao DATETIME,
    @tp_transacao INT,
    @num_conta INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM Transacao WHERE id_transacao = @id_transacao)
    BEGIN
        --Caso já exista uma transacao com o mesmo id
        RAISERROR('Já existe uma transação com essa identificação favor revisar os dados, a transação foi cancelada', 16, 1);
		RETURN; 
    END

    -- Verifica se a conta existe
    IF NOT EXISTS (SELECT 1 FROM Conta WHERE num_conta = @num_conta)
    BEGIN
        --Caso a conta não exista sai da proc
        RAISERROR('Conta não encontrada.', 16, 1);
		RETURN; 
    END

    -- Verifica se há saldo suficiente na conta
    IF (SELECT Saldo FROM Conta WHERE num_conta = @num_conta) < @valor_transacao
    BEGIN
        --caso o saldo seja menor que o valor da transação sai da proc
        RAISERROR('Saldo insuficiente.', 16, 1);
        RETURN;
    END
	ELSE
	BEGIN
		-- Atualiza o saldo
		UPDATE Conta
		SET Saldo = Saldo - @valor_transacao
		WHERE num_conta = @num_conta;
		-- Insere a nova transação
		INSERT INTO Transacao(id_transacao, valor_transacao, dt_hr_transacao, tp_transacao, num_conta)
		VALUES (@id_transacao, @valor_transacao, @dt_horatransacao, @tp_transacao, @num_conta);

		-- Retorna uma mensagem indicando que a transação foi realizada com sucesso
		SELECT 'Transação realizada com sucesso.' AS Mensagem;
	END
END;

drop proc proc_realizar_transacao
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
        --Caso j� exista uma transacao com o mesmo id
        RAISERROR('J� existe uma transa��o com essa identifica��o favor revisar os dados, a transa��o foi cancelada', 16, 1);
		RETURN; 
    END

    -- Verifica se a conta existe
    IF NOT EXISTS (SELECT 1 FROM Conta WHERE num_conta = @num_conta)
    BEGIN
        --Caso a conta n�o exista sai da proc
        RAISERROR('Conta n�o encontrada.', 16, 1);
		RETURN; 
    END

    -- Verifica se h� saldo suficiente na conta
    IF (SELECT Saldo FROM Conta WHERE num_conta = @num_conta) < @valor_transacao
    BEGIN
        --caso o saldo seja menor que o valor da transa��o sai da proc
        RAISERROR('Saldo insuficiente.', 16, 1);
        RETURN;
    END
	ELSE
	BEGIN
		-- Atualiza o saldo
		UPDATE Conta
		SET Saldo = Saldo - @valor_transacao
		WHERE num_conta = @num_conta;
		-- Insere a nova transa��o
		INSERT INTO Transacao(id_transacao, valor_transacao, dt_hr_transacao, tp_transacao, num_conta)
		VALUES (@id_transacao, @valor_transacao, @dt_horatransacao, @tp_transacao, @num_conta);

		-- Retorna uma mensagem indicando que a transa��o foi realizada com sucesso
		SELECT 'Transa��o realizada com sucesso.' AS Mensagem;
	END
END;

drop proc proc_realizar_transacao
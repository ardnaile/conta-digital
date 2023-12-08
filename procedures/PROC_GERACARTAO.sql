CREATE PROCEDURE proc_GerarCartaoDebito
    @NumConta INT
AS
BEGIN
	
	IF NOT EXISTS (SELECT 1 FROM Conta WHERE num_conta = @NumConta)
    BEGIN
        --Caso a conta não exista sai da proc
        RAISERROR('Conta não encontrada.', 16, 1);
		RETURN; 
    END
	    
	IF NOT EXISTS (SELECT 1 FROM Conta WHERE num_conta = @NumConta AND bloqueio = 0)
    BEGIN
        --Caso a conta não exista sai da proc
        RAISERROR('Conta bloqueada', 16, 1);
		RETURN; 
    END
	
	    
    -- Gera número de cartão aleatório (16 dígitos)
    DECLARE @NumCartao VARCHAR(16)
    SET @NumCartao = CAST(ABS(CHECKSUM(NEWID())) % 10000000000000000 AS VARCHAR(16))

    -- Gera data de validade aleatória (para os próximos 5 anos a partir da data atual)
    DECLARE @DtValidade DATE
    SET @DtValidade = DATEADD(YEAR, ABS(CHECKSUM(NEWID())) % 5, GETDATE())

    -- Gera código de segurança aleatório (3 dígitos)
    DECLARE @CodSeg INT
    SET @CodSeg = ABS(CHECKSUM(NEWID())) % 1000

    -- Insere os dados na tabela de cartões de débito (substitua 'SuaTabela' pelo nome real da tabela)
    INSERT INTO CartaoDebito(num_cartao, dt_validade, cod_seguranca, num_conta)
    VALUES (@NumCartao, @DtValidade, @CodSeg, @NumConta)
END

drop proc proc_GerarCartaoDebito

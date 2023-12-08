CREATE PROCEDURE proc_GerarCartaoDebito
    @NumConta INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM Conta WHERE num_conta = @NumConta)
    BEGIN
        --Caso a conta n�o exista sai da proc
        RAISERROR('Conta n�o encontrada.', 16, 1);
		RETURN; 
    END

    -- Gera n�mero de cart�o aleat�rio (16 d�gitos)
    DECLARE @NumCartao VARCHAR(16)
    SET @NumCartao = CAST(ABS(CHECKSUM(NEWID())) % 10000000000000000 AS VARCHAR(16))

    -- Gera data de validade aleat�ria (para os pr�ximos 5 anos a partir da data atual)
    DECLARE @DtValidade DATE
    SET @DtValidade = DATEADD(YEAR, ABS(CHECKSUM(NEWID())) % 5, GETDATE())

    -- Gera c�digo de seguran�a aleat�rio (3 d�gitos)
    DECLARE @CodSeg INT
    SET @CodSeg = ABS(CHECKSUM(NEWID())) % 1000

    -- Insere os dados na tabela de cart�es de d�bito (substitua 'SuaTabela' pelo nome real da tabela)
    INSERT INTO CartaoDebito(num_cartao, dt_validade, cod_seguranca, num_conta)
    VALUES (@NumCartao, @DtValidade, @CodSeg, @NumConta)
END

drop proc proc_GerarCartaoDebito
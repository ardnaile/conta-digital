CREATE FUNCTION ObterSaldo
(
	@num_conta INT
)
RETURNS DECIMAL(18,2)
AS
BEGIN
	DECLARE @saldo DECIMAL(18,2)

SELECT @saldo = saldo
FROM conta
WHERE num_conta = @num_conta

	RETURN @saldo
END
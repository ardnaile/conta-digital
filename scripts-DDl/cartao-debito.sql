CREATE TABLE [CartaoDebito] (
  [num_cartao] varchar(16) PRIMARY KEY,
  [dt_validade] date DEFAULT(DATEADD(YEAR, 5, GETDATE())),
  [cod_seguranca] int,
  [num_conta] int,
)
GO


ALTER TABLE [CartaoDebito] ADD FOREIGN KEY ([num_conta]) REFERENCES [Conta] ([num_conta])
GO

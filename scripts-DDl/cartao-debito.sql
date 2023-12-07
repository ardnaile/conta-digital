CREATE TABLE [CartaoDebito] (
  [num_cartao] varchar(16) IDENTITY(1,1) PRIMARY KEY,
  [dt_validade] date,
  [cod_seguranca] int,
  [num_conta] int UNIQUE
)
GO


ALTER TABLE [CartaoDebito] ADD FOREIGN KEY ([num_conta]) REFERENCES [Conta] ([num_conta])
GO

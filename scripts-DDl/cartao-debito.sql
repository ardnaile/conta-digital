CREATE TABLE [CartaoDebito] (
  [num_cartao] nvarchar(16) PRIMARY KEY,
  [dt_validade] date,
  [cod_seguranca] int,
  [num_conta] int UNIQUE
)
GO


ALTER TABLE [CartaoDebito] ADD FOREIGN KEY ([num_conta]) REFERENCES [Conta] ([num_conta])
GO

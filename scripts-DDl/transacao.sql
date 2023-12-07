CREATE TABLE [Transacao] (
  [id_transacao] int IDENTITY(1,1) PRIMARY KEY,
  [valor_transacao] decimal,
  [dt_hr_transacao] datetime,
  [tp_transacao] int,
  [num_conta] int
)
GO

ALTER TABLE [Transacao] ADD FOREIGN KEY ([tp_transacao]) REFERENCES [TipoTransacao] ([id_tipo_transacao])
GO

ALTER TABLE [Transacao] ADD FOREIGN KEY ([num_conta]) REFERENCES [Conta] ([num_conta])
GO

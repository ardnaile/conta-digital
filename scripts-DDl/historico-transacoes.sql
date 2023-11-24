CREATE TABLE [HistoricoTransacoes] (
  [id_historico] int PRIMARY KEY,
  [num_conta] int,
  [id_transacao] int,
  [tp_transacao] int
)
GO

ALTER TABLE [HistoricoTransacoes] ADD FOREIGN KEY ([num_conta]) REFERENCES [Conta] ([num_conta])
GO

ALTER TABLE [HistoricoTransacoes] ADD FOREIGN KEY ([id_transacao]) REFERENCES [Transacao] ([id_transacao])
GO

ALTER TABLE [HistoricoTransacoes] ADD FOREIGN KEY ([tp_transacao]) REFERENCES [TipoTransacao] ([id_tipo_transacao])
GO

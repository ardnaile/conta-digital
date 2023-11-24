
CREATE TABLE [Conta] (
  [num_conta] int PRIMARY KEY,
  [saldo] decimal,
  [tipo_conta] nvarchar(255),
  [data_abertura] datetime,
  [usuario_id] int
)
GO

ALTER TABLE [Conta] ADD FOREIGN KEY ([usuario_id]) REFERENCES [Usuario] ([id_usuario])
GO

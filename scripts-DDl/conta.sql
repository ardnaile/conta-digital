
CREATE TABLE [Conta] (
  [num_conta] int IDENTITY(1,1) PRIMARY KEY,
  [saldo] decimal,
  [tipo_conta] varchar(255),
  [data_abertura] datetime,
  [usuario_id] int
)
GO

ALTER TABLE [Conta] ADD FOREIGN KEY ([usuario_id]) REFERENCES [Usuario] ([id_usuario])
GO

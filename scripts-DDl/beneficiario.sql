CREATE TABLE [Beneficiario] (
  [id_beneficiario] int IDENTITY(1,1) PRIMARY KEY,
  [nome_beneficiario] varchar(255),
  [num_conta_beneficiario] int,
  [banco] varchar(255),
  [id_usuario] int
)
GO

ALTER TABLE [Beneficiario] ADD FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario])
GO

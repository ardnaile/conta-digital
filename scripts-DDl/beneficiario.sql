CREATE TABLE [Beneficiario] (
  [id_beneficiario] int PRIMARY KEY,
  [nome_beneficiario] nvarchar(255),
  [num_conta_beneficiario] int,
  [banco] nvarchar(255),
  [id_usuario] int
)
GO

ALTER TABLE [Beneficiario] ADD FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario])
GO
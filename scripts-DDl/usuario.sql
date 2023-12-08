CREATE TABLE [Usuario] (
  [id_usuario] int IDENTITY(1,1) PRIMARY KEY,
  [nome_usuario] varchar(255),
  [email_usuario] varchar(255),
  [senha_usuario] varchar(255),
  [data_registro] datetime DEFAULT(GETDATE()),
)
GO


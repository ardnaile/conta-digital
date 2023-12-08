CREATE TABLE [TokenAutenticacao] (
  [id_token] int IDENTITY(1,1) PRIMARY KEY,
  [id_usuario] int,
  [token] varchar(36) DEFAULT NEWID(),
  [dt_criacao] datetime DEFAULT(GETDATE()),
  [dt_expiracao] datetime DEFAULT(DATEADD(YEAR, 5, GETDATE()))
)
GO


ALTER TABLE [TokenAutenticacao] ADD FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario])
GO

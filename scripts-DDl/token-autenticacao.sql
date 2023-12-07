CREATE TABLE [TokenAutenticacao] (
  [id_token] int IDENTITY(1,1) PRIMARY KEY,
  [id_usuario] int,
  [token] varchar(255),
  [dt_criacao] datetime,
  [dt_expiracao] datetime
)
GO


ALTER TABLE [TokenAutenticacao] ADD FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario])
GO

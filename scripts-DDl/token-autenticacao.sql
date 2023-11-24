CREATE TABLE [TokenAutenticacao] (
  [id_token] int PRIMARY KEY,
  [id_usuario] int,
  [token] nvarchar(255),
  [dt_criacao] datetime,
  [dt_expiracao] datetime
)
GO


ALTER TABLE [TokenAutenticacao] ADD FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario])
GO
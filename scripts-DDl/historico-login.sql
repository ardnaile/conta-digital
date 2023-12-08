
CREATE TABLE [HistoricoLogin] (
  [id_login] int IDENTITY(1,1) PRIMARY KEY,
  [id_usuario] int,
  [dt_hr_login] datetime DEFAULT(GETDATE()),
  [endereco_ip] varchar(255)
)
GO

ALTER TABLE [HistoricoLogin] ADD FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario])
GO

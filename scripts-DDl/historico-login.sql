
CREATE TABLE [HistoricoLogin] (
  [id_login] int PRIMARY KEY,
  [id_usuario] int,
  [dt_hr_login] datetime,
  [endereco_ip] nvarchar(255)
)
GO

ALTER TABLE [HistoricoLogin] ADD FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario])
GO

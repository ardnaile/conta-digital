CREATE TABLE [Usuario] (
  [id_usuario] int IDENTITY(1,1) PRIMARY KEY,
  [nome_usuario] varchar(255),
  [email_usuario] varchar(255),
  [senha_usuario] varchar(255),
  [data_registro] datetime DEFAULT(GETDATE()),
)
GO


CREATE TABLE [Conta] (
  [num_conta] int IDENTITY(1,1) PRIMARY KEY,
  [saldo] decimal,
  [tipo_conta] varchar(255),
  [data_abertura] datetime DEFAULT(GETDATE()),
  [usuario_id] int,
  [bloqueio] bit DEFAULT(0),
)
GO

ALTER TABLE [Conta] ADD FOREIGN KEY ([usuario_id]) REFERENCES [Usuario] ([id_usuario])
GO

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

CREATE TABLE [CartaoDebito] (
  [num_cartao] varchar(16) PRIMARY KEY,
  [dt_validade] date DEFAULT(DATEADD(YEAR, 5, GETDATE())),
  [cod_seguranca] int,
  [num_conta] int,
)
GO


ALTER TABLE [CartaoDebito] ADD FOREIGN KEY ([num_conta]) REFERENCES [Conta] ([num_conta])
GO

CREATE TABLE [TipoTransacao] (
  [id_tipo_transacao] int IDENTITY(1,1) PRIMARY KEY,
  [descricao_tipo] varchar(255)
)
GO

CREATE TABLE [Transacao] (
  [id_transacao] int IDENTITY(1,1) PRIMARY KEY,
  [valor_transacao] decimal,
  [dt_hr_transacao] datetime DEFAULT(GETDATE()),
  [tp_transacao] int,
  [num_conta] int
)
GO

ALTER TABLE [Transacao] ADD FOREIGN KEY ([tp_transacao]) REFERENCES [TipoTransacao] ([id_tipo_transacao])
GO

ALTER TABLE [Transacao] ADD FOREIGN KEY ([num_conta]) REFERENCES [Conta] ([num_conta])
GO

CREATE TABLE [HistoricoTransacoes] (
  [id_historico] int IDENTITY(1,1) PRIMARY KEY,
  [num_conta] int,
  [id_transacao] int,
  [tp_transacao] int
)
GO

ALTER TABLE [HistoricoTransacoes] ADD FOREIGN KEY ([num_conta]) REFERENCES [Conta] ([num_conta])
GO

ALTER TABLE [HistoricoTransacoes] ADD FOREIGN KEY ([id_transacao]) REFERENCES [Transacao] ([id_transacao])
GO

ALTER TABLE [HistoricoTransacoes] ADD FOREIGN KEY ([tp_transacao]) REFERENCES [TipoTransacao] ([id_tipo_transacao])
GO


CREATE TABLE [HistoricoLogin] (
  [id_login] int IDENTITY(1,1) PRIMARY KEY,
  [id_usuario] int,
  [dt_hr_login] datetime DEFAULT(GETDATE()),
  [endereco_ip] varchar(255)
)
GO

ALTER TABLE [HistoricoLogin] ADD FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario])
GO

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

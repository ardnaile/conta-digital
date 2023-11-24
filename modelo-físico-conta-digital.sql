CREATE TABLE [Usuario] (
  [id_usuario] int PRIMARY KEY,
  [nome_usuario] nvarchar(255),
  [email_usuario] nvarchar(255),
  [senha_usuario] nvarchar(255),
  [data_registro] datetime
)
GO

CREATE TABLE [Conta] (
  [num_conta] int PRIMARY KEY,
  [saldo] decimal,
  [tipo_conta] nvarchar(255),
  [data_abertura] datetime,
  [usuario_id] int
)
GO

CREATE TABLE [Transacao] (
  [id_transacao] int PRIMARY KEY,
  [valor_transacao] decimal,
  [dt_hr_transacao] datetime,
  [tp_transacao] nvarchar(255),
  [num_conta] int
)
GO

CREATE TABLE [Beneficiario] (
  [id_beneficiario] int PRIMARY KEY,
  [nome_beneficiario] nvarchar(255),
  [num_conta_beneficiario] int,
  [banco] nvarchar(255),
  [id_usuario] int
)
GO

CREATE TABLE [CartaoDebito] (
  [num_cartao] int PRIMARY KEY,
  [dt_validade] date,
  [cod_seguranca] int,
  [num_conta] int UNIQUE
)
GO

CREATE TABLE [HistoricoTransacoes] (
  [id_historico] int PRIMARY KEY,
  [num_conta] int,
  [id_transacao] int,
  [tp_transacao] int
)
GO

CREATE TABLE [HistoricoLogin] (
  [id_login] int PRIMARY KEY,
  [id_usuario] int,
  [dt_hr_login] datetime,
  [endereco_ip] nvarchar(255)
)
GO

CREATE TABLE [TokenAutenticacao] (
  [id_token] int PRIMARY KEY,
  [id_usuario] int,
  [token] nvarchar(255),
  [dt_criacao] datetime,
  [dt_expiracao] datetime
)
GO

CREATE TABLE [TipoTransacao] (
  [id_tipo_transacao] int PRIMARY KEY,
  [descricao_tipo] nvarchar(255)
)
GO

ALTER TABLE [Conta] ADD FOREIGN KEY ([usuario_id]) REFERENCES [Usuario] ([id_usuario])
GO

ALTER TABLE [Transacao] ADD FOREIGN KEY ([tp_transacao]) REFERENCES [TipoTransacao] ([id_tipo_transacao])
GO

ALTER TABLE [Transacao] ADD FOREIGN KEY ([num_conta]) REFERENCES [Conta] ([num_conta])
GO

ALTER TABLE [Beneficiario] ADD FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario])
GO

ALTER TABLE [CartaoDebito] ADD FOREIGN KEY ([num_conta]) REFERENCES [Conta] ([num_conta])
GO

ALTER TABLE [HistoricoTransacoes] ADD FOREIGN KEY ([num_conta]) REFERENCES [Conta] ([num_conta])
GO

ALTER TABLE [HistoricoTransacoes] ADD FOREIGN KEY ([id_transacao]) REFERENCES [Transacao] ([id_transacao])
GO

ALTER TABLE [HistoricoTransacoes] ADD FOREIGN KEY ([tp_transacao]) REFERENCES [TipoTransacao] ([id_tipo_transacao])
GO

ALTER TABLE [HistoricoLogin] ADD FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario])
GO

ALTER TABLE [TokenAutenticacao] ADD FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario])
GO

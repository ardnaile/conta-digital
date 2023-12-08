-- �ndices para colunas que podem ser comumente usadas em join e where

-- �ndices para a tabela Usuario
CREATE INDEX IX_Usuario_NomeUsuario ON Usuario (nome_usuario);
CREATE INDEX IX_Usuario_EmailUsuario ON Usuario (email_usuario);

-- �ndices para a tabela Transacao
CREATE INDEX IX_Transacao_ValorTransacao ON Transacao (valor_transacao);
CREATE INDEX IX_Transacao_DtHrTransacao ON Transacao (dt_hr_transacao);
CREATE INDEX IX_Transacao_TpTransacao ON Transacao (tp_transacao);
CREATE INDEX IX_Transacao_NumConta ON Transacao (num_conta);

-- �ndices para a tabela TokenAutenticacao
CREATE INDEX IX_TokenAutenticacao_IdUsuario ON TokenAutenticacao (id_usuario);
CREATE INDEX IX_TokenAutenticacao_Token ON TokenAutenticacao (token);

-- �ndices para a tabela HistoricoTransacoes
CREATE INDEX IX_HistoricoTransacoes_NumConta ON HistoricoTransacoes (num_conta);
CREATE INDEX IX_HistoricoTransacoes_IdTransacao ON HistoricoTransacoes (id_transacao);
CREATE INDEX IX_HistoricoTransacoes_TpTransacao ON HistoricoTransacoes (tp_transacao);

-- �ndices para a tabela HistoricoLogin
CREATE INDEX IX_HistoricoLogin_IdUsuario ON HistoricoLogin (id_usuario);
CREATE INDEX IX_HistoricoLogin_DtHrLogin ON HistoricoLogin (dt_hr_login);

-- �ndices para a tabela Conta
CREATE INDEX IX_Conta_Saldo ON Conta (saldo);
CREATE INDEX IX_Conta_TipoConta ON Conta (tipo_conta);
CREATE INDEX IX_Conta_DataAbertura ON Conta (data_abertura);
CREATE INDEX IX_Conta_UsuarioId ON Conta (usuario_id);

-- �ndices para a tabela CartaoDebito
CREATE INDEX IX_CartaoDebito_NumConta ON CartaoDebito (num_conta);

-- �ndices para a tabela Beneficiario
CREATE INDEX IX_Beneficiario_NomeBeneficiario ON Beneficiario (nome_beneficiario);
CREATE INDEX IX_Beneficiario_NumContaBeneficiario ON Beneficiario (num_conta_beneficiario);
CREATE INDEX IX_Beneficiario_IdUsuario ON Beneficiario (id_usuario);

-- �ndices adicionais para auxiliar nas consultas

-- �ndice para a Consulta 1: Usu�rios que mais Movimentaram Suas Contas no �ltimo Ano
CREATE INDEX IX_Transacao_DtHrTransacao_NumConta ON Transacao (dt_hr_transacao, num_conta);

-- �ndice para a Consulta 3: N�mero de Contas por Usu�rio
CREATE INDEX IX_Conta_UsuarioId_NumConta ON Conta (usuario_id, num_conta);

-- �ndice para a Consulta 4: Tipos de Transa��es mais Comuns nas Contas Digitais
CREATE INDEX IX_Transacao_TpTransacao_IdTransacao ON Transacao (tp_transacao, id_transacao);

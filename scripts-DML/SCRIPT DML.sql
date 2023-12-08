INSERT [Usuario] ( [nome_usuario], [email_usuario], [senha_usuario], [data_registro]) 
VALUES ( 'Pedro Pereira', 'pedrinhoP2002@gmail.com', 'camaroAmarelo123', CAST(N'2020-10-27T17:00:00.000' AS DateTime))

INSERT [Usuario] ( [nome_usuario], [email_usuario], [senha_usuario], [data_registro]) 
VALUES ('Ana Silva', 'ana.silva@gmail.com', 'senha123', CAST(N'2021-02-15T12:30:00.000' AS DateTime));

INSERT [Usuario] ( [nome_usuario], [email_usuario], [senha_usuario], [data_registro]) 
VALUES ( 'Carlos Oliveira', 'carlos.oliveira@yahoo.com', 'abcXYZ456', CAST(N'2021-05-08T09:45:00.000' AS DateTime));

INSERT [Usuario] ([nome_usuario], [email_usuario], [senha_usuario], [data_registro]) 
VALUES ( 'Fernanda Souza', 'fernanda_souza@hotmail.com', 'senhaFer456', CAST(N'2021-08-20T15:20:00.000' AS DateTime));

INSERT [Usuario] ( [nome_usuario], [email_usuario], [senha_usuario], [data_registro]) 
VALUES ('Gabriel Lima', 'gabriel.lima@gmail.com', 'lima1234', CAST(N'2022-01-10T08:00:00.000' AS DateTime));

INSERT [Usuario] ( [nome_usuario], [email_usuario], [senha_usuario], [data_registro]) 
VALUES ( 'Isabela Santos', 'isabela.santos@gmail.com', 'senha@123', CAST(N'2022-03-25T14:10:00.000' AS DateTime));

INSERT [Usuario] ( [nome_usuario], [email_usuario], [senha_usuario], [data_registro]) 
VALUES ( 'Lucas Oliveira', 'lucas.oliveira@gmail.com', 'lucas789', CAST(N'2022-06-12T18:30:00.000' AS DateTime));

INSERT [Usuario] ( [nome_usuario], [email_usuario], [senha_usuario], [data_registro]) 
VALUES ('Mariana Costa', 'mariana.costa@yahoo.com', 'senhaMariana', CAST(N'2022-09-05T10:45:00.000' AS DateTime));

INSERT [Usuario] ([nome_usuario], [email_usuario], [senha_usuario], [data_registro]) 
VALUES ('Rafael Pereira', 'rafael.pereira@gmail.com', 'rafa123', CAST(N'2022-11-18T16:20:00.000' AS DateTime));

INSERT [Usuario] ([nome_usuario], [email_usuario], [senha_usuario], [data_registro]) 
VALUES ('Thais Oliveira', 'thais.oliveira@hotmail.com', 'senhaThais', CAST(N'2023-02-03T11:05:00.000' AS DateTime));

GO

INSERT [Conta] ( [saldo], [tipo_conta], [data_abertura], [usuario_id]) 
VALUES ( 5000.00, 'Corrente', CAST(N'2021-01-15T09:00:00.000' AS DateTime), 1);

INSERT [Conta] ( [saldo], [tipo_conta], [data_abertura], [usuario_id]) 
VALUES (3000.50, 'Poupança', CAST(N'2021-03-20T14:30:00.000' AS DateTime), 2);

INSERT [Conta] ( [saldo], [tipo_conta], [data_abertura], [usuario_id]) 
VALUES ( 8000.75, 'Corrente', CAST(N'2021-06-05T11:45:00.000' AS DateTime), 3);

INSERT [Conta] ( [saldo], [tipo_conta], [data_abertura], [usuario_id]) 
VALUES ( 12000.20, 'Poupança', CAST(N'2021-09-18T17:20:00.000' AS DateTime), 4);

INSERT [Conta] ( [saldo], [tipo_conta], [data_abertura], [usuario_id]) 
VALUES ( 6000.90, 'Corrente', CAST(N'2022-02-01T08:15:00.000' AS DateTime), 5);

INSERT [Conta] ( [saldo], [tipo_conta], [data_abertura], [usuario_id]) 
VALUES ( 9000.30, 'Poupança', CAST(N'2022-04-15T14:45:00.000' AS DateTime), 6);

INSERT [Conta] ( [saldo], [tipo_conta], [data_abertura], [usuario_id]) 
VALUES (7500.60, 'Corrente', CAST(N'2022-07-02T19:30:00.000' AS DateTime), 7);

INSERT [Conta] ( [saldo], [tipo_conta], [data_abertura], [usuario_id]) 
VALUES ( 4800.25, 'Poupança', CAST(N'2022-10-15T10:15:00.000' AS DateTime), 8);

INSERT [Conta] ( [saldo], [tipo_conta], [data_abertura], [usuario_id]) 
VALUES ( 9500.70, 'Corrente', CAST(N'2023-01-28T15:50:00.000' AS DateTime), 9);

INSERT [Conta] ( [saldo], [tipo_conta], [data_abertura], [usuario_id]) 
VALUES ( 7000.40, 'Poupança', CAST(N'2023-04-05T11:30:00.000' AS DateTime), 10);

GO

INSERT [Beneficiario] ([nome_beneficiario], [num_conta_beneficiario], [banco], [id_usuario]) 
VALUES ('João Oliveira', 123456789, 'Banco do Brasil', 1);

INSERT [Beneficiario] ([nome_beneficiario], [num_conta_beneficiario], [banco], [id_usuario]) 
VALUES ('Camila Silva', 987654321, 'Itau', 2);

INSERT [Beneficiario] ([nome_beneficiario], [num_conta_beneficiario], [banco], [id_usuario]) 
VALUES ('Rodrigo Santos', 567890123, 'Santander', 3);

INSERT [Beneficiario] ([nome_beneficiario], [num_conta_beneficiario], [banco], [id_usuario]) 
VALUES ('Amanda Costa', 109876543, 'Bradesco', 4);

INSERT [Beneficiario] ([nome_beneficiario], [num_conta_beneficiario], [banco], [id_usuario]) 
VALUES ('Bruno Lima', 234567890, 'Banco do Brasil', 5);

INSERT [Beneficiario] ([nome_beneficiario], [num_conta_beneficiario], [banco], [id_usuario]) 
VALUES ('Gabriela Pereira', 876543210, 'Itau', 6);

INSERT [Beneficiario] ([nome_beneficiario], [num_conta_beneficiario], [banco], [id_usuario]) 
VALUES ('Lucas Oliveira', 543210987, 'Santander', 7);

INSERT [Beneficiario] ([nome_beneficiario], [num_conta_beneficiario], [banco], [id_usuario]) 
VALUES ('Mariana Costa', 210987654, 'Bradesco', 8);

INSERT [Beneficiario] ([nome_beneficiario], [num_conta_beneficiario], [banco], [id_usuario]) 
VALUES ('Rafael Pereira', 487654321, 'Banco do Brasil', 9);

INSERT [Beneficiario] ([nome_beneficiario], [num_conta_beneficiario], [banco], [id_usuario]) 
VALUES ('Thais Oliveira', 823456789, 'Itau', 10);

GO

INSERT [CartaoDebito] ([num_cartao], [dt_validade], [cod_seguranca], [num_conta]) 
VALUES ('1111222233334444', '2024-05-01', 123, 1);

INSERT [CartaoDebito] ([num_cartao], [dt_validade], [cod_seguranca], [num_conta]) 
VALUES ('2222333344445555', '2023-11-01', 456, 2);

INSERT [CartaoDebito] ([num_cartao], [dt_validade], [cod_seguranca], [num_conta]) 
VALUES ('3333444455556666', '2025-02-01', 789, 3);

INSERT [CartaoDebito] ([num_cartao], [dt_validade], [cod_seguranca], [num_conta]) 
VALUES ('4444555566667777', '2024-08-01', 234, 4);

INSERT [CartaoDebito] ([num_cartao], [dt_validade], [cod_seguranca], [num_conta]) 
VALUES ('5555666677778888', '2023-01-01', 567, 5);

INSERT [CartaoDebito] ([num_cartao], [dt_validade], [cod_seguranca], [num_conta]) 
VALUES ('6666777788889999', '2025-04-01', 890, 6);

INSERT [CartaoDebito] ([num_cartao], [dt_validade], [cod_seguranca], [num_conta]) 
VALUES ('7777888899990000', '2024-10-01', 345, 7);

INSERT [CartaoDebito] ([num_cartao], [dt_validade], [cod_seguranca], [num_conta]) 
VALUES ('8888999900001111', '2023-03-01', 678, 8);

INSERT [CartaoDebito] ([num_cartao], [dt_validade], [cod_seguranca], [num_conta]) 
VALUES ('9999000011112222', '2025-06-01', 901, 9);

INSERT [CartaoDebito] ([num_cartao], [dt_validade], [cod_seguranca], [num_conta]) 
VALUES ('1234123412345678', '2024-12-01', 234, 10);

GO

INSERT [TipoTransacao] ([descricao_tipo]) 
VALUES ('Depósito');

INSERT [TipoTransacao] ([descricao_tipo]) 
VALUES ('Saque');

INSERT [TipoTransacao] ([descricao_tipo]) 
VALUES ('Transferência');

INSERT [TipoTransacao] ([descricao_tipo]) 
VALUES ('Pagamento');

INSERT [TipoTransacao] ([descricao_tipo]) 
VALUES ('Compra');

INSERT [TipoTransacao] ([descricao_tipo]) 
VALUES ('Recebimento');

INSERT [TipoTransacao] ([descricao_tipo]) 
VALUES ('Investimento');

INSERT [TipoTransacao] ([descricao_tipo]) 
VALUES ('Estorno');

INSERT [TipoTransacao] ([descricao_tipo]) 
VALUES ('Tarifa');

INSERT [TipoTransacao] ([descricao_tipo]) 
VALUES ('Ajuste');

GO

INSERT [Transacao] ( [valor_transacao], [dt_hr_transacao], [tp_transacao], [num_conta]) 
VALUES (1000.00, CAST(N'2023-01-05T14:30:00.000' AS DateTime), 1, 1);

INSERT [Transacao] ( [valor_transacao], [dt_hr_transacao], [tp_transacao], [num_conta]) 
VALUES (500.50, CAST(N'2023-02-20T09:45:00.000' AS DateTime), 2, 2);

INSERT [Transacao] ( [valor_transacao], [dt_hr_transacao], [tp_transacao], [num_conta]) 
VALUES (1500.75, CAST(N'2023-03-15T16:20:00.000' AS DateTime), 3, 3);

INSERT [Transacao] ( [valor_transacao], [dt_hr_transacao], [tp_transacao], [num_conta]) 
VALUES ( 200.20, CAST(N'2023-04-10T11:00:00.000' AS DateTime), 4, 4);

INSERT [Transacao] ( [valor_transacao], [dt_hr_transacao], [tp_transacao], [num_conta]) 
VALUES (750.90, CAST(N'2023-05-25T14:45:00.000' AS DateTime), 5, 5);

INSERT [Transacao] ( [valor_transacao], [dt_hr_transacao], [tp_transacao], [num_conta]) 
VALUES ( 300.30, CAST(N'2023-06-18T18:30:00.000' AS DateTime), 6, 6);

INSERT [Transacao] ( [valor_transacao], [dt_hr_transacao], [tp_transacao], [num_conta]) 
VALUES (1200.60, CAST(N'2023-07-05T12:15:00.000' AS DateTime), 7, 7);

INSERT [Transacao] ( [valor_transacao], [dt_hr_transacao], [tp_transacao], [num_conta]) 
VALUES (480.25, CAST(N'2023-08-22T09:30:00.000' AS DateTime), 8, 8);

INSERT [Transacao] ( [valor_transacao], [dt_hr_transacao], [tp_transacao], [num_conta]) 
VALUES ( 950.70, CAST(N'2023-09-10T16:45:00.000' AS DateTime), 9, 9);

INSERT [Transacao] ( [valor_transacao], [dt_hr_transacao], [tp_transacao], [num_conta]) 
VALUES ( 700.40, CAST(N'2023-10-28T13:20:00.000' AS DateTime), 10, 10);

GO

INSERT [HistoricoTransacoes] ([num_conta], [id_transacao], [tp_transacao]) 
VALUES ( 1, 1, 1);

INSERT [HistoricoTransacoes] ([num_conta], [id_transacao], [tp_transacao]) 
VALUES ( 2, 2, 2);

INSERT [HistoricoTransacoes] ([num_conta], [id_transacao], [tp_transacao]) 
VALUES ( 3, 3, 3);

INSERT [HistoricoTransacoes] ([num_conta], [id_transacao], [tp_transacao]) 
VALUES (4, 4, 4);

INSERT [HistoricoTransacoes] ([num_conta], [id_transacao], [tp_transacao]) 
VALUES ( 5, 5, 5);

INSERT [HistoricoTransacoes] ([num_conta], [id_transacao], [tp_transacao]) 
VALUES ( 6, 6, 6);

INSERT [HistoricoTransacoes] ([num_conta], [id_transacao], [tp_transacao]) 
VALUES ( 7, 7, 7);

INSERT [HistoricoTransacoes] ([num_conta], [id_transacao], [tp_transacao]) 
VALUES ( 8, 8, 8);

INSERT [HistoricoTransacoes] ([num_conta], [id_transacao], [tp_transacao]) 
VALUES ( 9, 9, 9);

INSERT [HistoricoTransacoes] ([num_conta], [id_transacao], [tp_transacao]) 
VALUES ( 10, 10, 10);

GO

INSERT [HistoricoLogin] ([id_usuario], [dt_hr_login], [endereco_ip]) 
VALUES (1, CAST(N'2023-01-01T10:00:00.000' AS DateTime), '192.168.0.1');

INSERT [HistoricoLogin] ([id_usuario], [dt_hr_login], [endereco_ip]) 
VALUES ( 2, CAST(N'2023-02-15T15:30:00.000' AS DateTime), '192.168.0.2');

INSERT [HistoricoLogin] ([id_usuario], [dt_hr_login], [endereco_ip]) 
VALUES ( 3, CAST(N'2023-03-20T20:45:00.000' AS DateTime), '192.168.0.3');

INSERT [HistoricoLogin] ([id_usuario], [dt_hr_login], [endereco_ip]) 
VALUES ( 4, CAST(N'2023-04-10T08:15:00.000' AS DateTime), '192.168.0.4');

INSERT [HistoricoLogin] ([id_usuario], [dt_hr_login], [endereco_ip]) 
VALUES ( 5, CAST(N'2023-05-05T14:00:00.000' AS DateTime), '192.168.0.5');

INSERT [HistoricoLogin] ([id_usuario], [dt_hr_login], [endereco_ip]) 
VALUES ( 6, CAST(N'2023-06-12T18:30:00.000' AS DateTime), '192.168.0.6');

INSERT [HistoricoLogin] ([id_usuario], [dt_hr_login], [endereco_ip]) 
VALUES ( 7, CAST(N'2023-07-25T11:45:00.000' AS DateTime), '192.168.0.7');

INSERT [HistoricoLogin] ([id_usuario], [dt_hr_login], [endereco_ip]) 
VALUES ( 8, CAST(N'2023-08-10T09:00:00.000' AS DateTime), '192.168.0.8');

INSERT [HistoricoLogin] ([id_usuario], [dt_hr_login], [endereco_ip]) 
VALUES ( 9, CAST(N'2023-09-20T16:20:00.000' AS DateTime), '192.168.0.9');

INSERT [HistoricoLogin] ([id_usuario], [dt_hr_login], [endereco_ip]) 
VALUES ( 10, CAST(N'2023-10-05T13:10:00.000' AS DateTime), '192.168.0.10');

GO

INSERT [TokenAutenticacao] ( [id_usuario], [token], [dt_criacao], [dt_expiracao]) 
VALUES ( 1, 'abc123def456', CAST(N'2023-01-05T14:30:00.000' AS DateTime), CAST(N'2023-02-05T14:30:00.000' AS DateTime));

INSERT [TokenAutenticacao] ( [id_usuario], [token], [dt_criacao], [dt_expiracao]) 
VALUES ( 2, 'ghi789jkl012', CAST(N'2023-02-15T09:45:00.000' AS DateTime), CAST(N'2023-03-15T09:45:00.000' AS DateTime));

INSERT [TokenAutenticacao] ( [id_usuario], [token], [dt_criacao], [dt_expiracao]) 
VALUES ( 3, 'mno345pqr678', CAST(N'2023-03-20T16:20:00.000' AS DateTime), CAST(N'2023-04-20T16:20:00.000' AS DateTime));

INSERT [TokenAutenticacao] ( [id_usuario], [token], [dt_criacao], [dt_expiracao]) 
VALUES ( 4, 'stu901vwx234', CAST(N'2023-04-10T11:00:00.000' AS DateTime), CAST(N'2023-05-10T11:00:00.000' AS DateTime));

INSERT [TokenAutenticacao] ( [id_usuario], [token], [dt_criacao], [dt_expiracao]) 
VALUES ( 5, 'yz678abc123', CAST(N'2023-05-25T14:45:00.000' AS DateTime), CAST(N'2023-06-25T14:45:00.000' AS DateTime));

INSERT [TokenAutenticacao] ( [id_usuario], [token], [dt_criacao], [dt_expiracao]) 
VALUES ( 6, 'def456ghi789', CAST(N'2023-06-18T18:30:00.000' AS DateTime), CAST(N'2023-07-18T18:30:00.000' AS DateTime));

INSERT [TokenAutenticacao] ( [id_usuario], [token], [dt_criacao], [dt_expiracao]) 
VALUES ( 7, 'jkl012mno345', CAST(N'2023-07-05T12:15:00.000' AS DateTime), CAST(N'2023-08-05T12:15:00.000' AS DateTime));

INSERT [TokenAutenticacao] ( [id_usuario], [token], [dt_criacao], [dt_expiracao]) 
VALUES ( 8, 'pqr678stu901', CAST(N'2023-08-22T09:30:00.000' AS DateTime), CAST(N'2023-09-22T09:30:00.000' AS DateTime));

INSERT [TokenAutenticacao] ( [id_usuario], [token], [dt_criacao], [dt_expiracao]) 
VALUES ( 9, 'vwx234yz678', CAST(N'2023-09-10T16:45:00.000' AS DateTime), CAST(N'2023-10-10T16:45:00.000' AS DateTime));

INSERT [TokenAutenticacao] ( [id_usuario], [token], [dt_criacao], [dt_expiracao]) 
VALUES ( 10, 'abc123def456', CAST(N'2023-10-28T13:20:00.000' AS DateTime), CAST(N'2023-11-28T13:20:00.000' AS DateTime));

GO
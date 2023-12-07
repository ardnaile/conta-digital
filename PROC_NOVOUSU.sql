CREATE PROCEDURE proc_novoUsu
    @idUsuario INT,
    @NomeCliente NVARCHAR(255),
    @emailUsuario NVARCHAR(255),
    @senhaUsuario NVARCHAR(255),
    @dt_cadastro DATETIME
AS
BEGIN
    -- Verifica se o ID do usu�rio j� existe
    IF EXISTS (SELECT 1 FROM Usuario WHERE id_Usuario = @idUsuario)
    BEGIN
        -- Se o ID do usu�rio j� existe, voc� pode lidar com isso da maneira desejada.
        -- Pode lan�ar um erro, retornar uma mensagem, etc.
        RAISERROR('ID do usu�rio j� existe.', 16, 1);
    END
    ELSE
    BEGIN
        -- Insere o novo usu�rio
        INSERT INTO Usuario (id_Usuario, nome_usuario, email_usuario, senha_usuario, data_registro)
        VALUES (@idUsuario, @NomeCliente, @emailUsuario, @senhaUsuario, @dt_cadastro);
        
        -- Se necess�rio, voc� pode fazer mais coisas aqui, como enviar notifica��es, etc.
        
        -- Retorna uma mensagem indicando que o usu�rio foi criado com sucesso
        SELECT 'Usu�rio criado com sucesso.' AS Mensagem;
    END
END;

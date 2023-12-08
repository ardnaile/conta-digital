CREATE PROCEDURE proc_novoUsu
    @idUsuario INT,
    @NomeCliente NVARCHAR(255),
    @emailUsuario NVARCHAR(255),
    @senhaUsuario NVARCHAR(255),
    @dt_cadastro DATETIME
AS
BEGIN
    -- Verifica se o ID do usuário já existe
    IF EXISTS (SELECT 1 FROM Usuario WHERE id_Usuario = @idUsuario)
    BEGIN
        -- Se o ID do usuário já existe, você pode lidar com isso da maneira desejada.
        -- Pode lançar um erro, retornar uma mensagem, etc.
        RAISERROR('ID do usuário já existe.', 16, 1);
    END
    ELSE
    BEGIN
        -- Insere o novo usuário
        INSERT INTO Usuario (id_Usuario, nome_usuario, email_usuario, senha_usuario, data_registro)
        VALUES (@idUsuario, @NomeCliente, @emailUsuario, @senhaUsuario, @dt_cadastro);
        
        -- Se necessário, você pode fazer mais coisas aqui, como enviar notificações, etc.
        
        -- Retorna uma mensagem indicando que o usuário foi criado com sucesso
        SELECT 'Usuário criado com sucesso.' AS Mensagem;
    END
END;

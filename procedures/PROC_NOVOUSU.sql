CREATE PROCEDURE proc_novoUsu
    @NomeCliente VARCHAR(255),
    @emailUsuario VARCHAR(255),
    @senhaUsuario VARCHAR(255)
AS
BEGIN
     BEGIN
        -- Insere o novo usuário
        INSERT INTO Usuario ( nome_usuario, email_usuario, senha_usuario)
        VALUES ( @NomeCliente, @emailUsuario, @senhaUsuario);
        
        -- Se necessário, você pode fazer mais coisas aqui, como enviar notificações, etc.
        
        -- Retorna uma mensagem indicando que o usuário foi criado com sucesso
        SELECT 'Usuário criado com sucesso.' AS Mensagem;
    END
END;

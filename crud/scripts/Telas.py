import pyodbc
import tkinter as tk
from tkinter import ttk, messagebox

class TelaLogin:
    def __init__(self, janela):
        self.janela = janela
        self.janela.title("Tela de Login")

        # Criar um contêiner para centralizar os itens
        self.container = tk.Frame(self.janela)
        self.container.pack(pady=20)

        # Widgets
        self.label_usuario = tk.Label(self.container, text="Usuário:")
        self.label_senha = tk.Label(self.container, text="Senha:")
        self.label_servidor = tk.Label(self.container, text="Servidor:")
        self.label_database = tk.Label(self.container, text="Banco de Dados:")

        self.entry_usuario = tk.Entry(self.container)
        self.entry_senha = tk.Entry(self.container, show="*")
        self.entry_servidor = tk.Entry(self.container)
        self.entry_database = tk.Entry(self.container)

        self.botao_login = tk.Button(self.container, text="Login", command=self.fazer_login)

        # Layout dos widgets no contêiner
        self.label_usuario.grid(row=0, column=0, padx=10, pady=10, sticky="e")
        self.label_senha.grid(row=1, column=0, padx=10, pady=10, sticky="e")
        self.label_servidor.grid(row=2, column=0, padx=10, pady=10, sticky="e")
        self.label_database.grid(row=3, column=0, padx=10, pady=10, sticky="e")

        self.entry_usuario.grid(row=0, column=1, padx=10, pady=10, sticky="w")
        self.entry_senha.grid(row=1, column=1, padx=10, pady=10, sticky="w")
        self.entry_servidor.grid(row=2, column=1, padx=10, pady=10, sticky="w")
        self.entry_database.grid(row=3, column=1, padx=10, pady=10, sticky="w")

        self.botao_login.grid(row=4, column=0, columnspan=2, pady=10)

    def fazer_login(self):
        # Aqui você pode adicionar a lógica de autenticação
        usuario = self.entry_usuario.get()
        senha = self.entry_senha.get()
        servidor = self.entry_servidor.get()
        banco_dados = self.entry_database.get()

        # Exemplo de verificação simples (substitua por sua lógica de autenticação real)
        try:
            # connectionString = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={servidor};DATABASE={banco_dados};UID={usuario};PWD={senha}'
            # conexao = pyodbc.connect(connectionString)
            self.container.destroy()
            TelaOpcoes(self.janela)
            
        except:
            messagebox.showerror("Erro", "Credenciais inválidas")
            

class TelaOpcoes:
    def __init__(self, janela):
        self.janela = janela
        self.janela.title("Opções")

        # Widgets na nova janela
        self.label_opcoes = tk.Label(self.janela, text="Escolha uma opção:")
        self.botao_cadastrar = tk.Button(self.janela, text="Cadastrar", command=self.abrir_tela_cadastro)
        self.botao_listar = tk.Button(self.janela, text="Listar")
        self.botao_editar = tk.Button(self.janela, text="Editar")
        self.botao_deletar = tk.Button(self.janela, text="Deletar")

        # Layout dos widgets na nova janela
        self.label_opcoes.pack(pady=10)
        self.botao_cadastrar.pack(pady=5)
        self.botao_listar.pack(pady=5)
        self.botao_editar.pack(pady=5)
        self.botao_deletar.pack(pady=5)

    def abrir_tela_cadastro(self):
        self.janela_cadastro = tk.Toplevel(self.janela)
        self.janela_cadastro.title("Cadastro")

        self.janela_cadastro.geometry("400x300")

        # Widgets na janela de cadastro
        self.label_tabela = tk.Label(self.janela_cadastro, text="Selecione a tabela:")
        self.combobox_tabela = ttk.Combobox(self.janela_cadastro, values=["Usuario", "Beneficiario", "CartaoDebito", "Conta", "HistoricoLogin", "TipoTransacao", "Transacao", "HistoricoTransacoes", "TokenAutenticacao"])
        self.botao_confirmar_cadastro = tk.Button(self.janela_cadastro, text="Confirmar Cadastro", command=self.confirmar_cadastro)

        # Layout dos widgets na janela de cadastro
        self.label_tabela.pack(pady=10)
        self.combobox_tabela.pack(pady=5)
        self.botao_confirmar_cadastro.pack(pady=5)

    def confirmar_cadastro(self):
        tabela_selecionada = self.entry_tabela.get()
        messagebox.showinfo("Cadastro", f"Cadastro na tabela {tabela_selecionada} confirmado!")


# Criar a janela principal
janela_principal = tk.Tk()

# Criar a instância da TelaLogin
tela_login = TelaLogin(janela_principal)

# Obtém as dimensões da tela
largura_tela = janela_principal.winfo_screenwidth()
altura_tela = janela_principal.winfo_screenheight()

# Calcula a posição para centralizar a janela
x_pos = largura_tela // 2 - 200
y_pos = altura_tela // 2 - 125

# Define a posição da janela
janela_principal.geometry("400x250+{}+{}".format(x_pos, y_pos))

# Iniciar o loop principal da interface gráfica
janela_principal.mainloop()
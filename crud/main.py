#pip install pyodbc

import pyodbc

SERVER = 'banco2.database.windows.net'
DATABASE = 'banco2'
USERNAME = 'administrador'
PASSWORD = 'SenhaAdmin#'

connectionString = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={SERVER};DATABASE={DATABASE};UID={USERNAME};PWD={PASSWORD}'
conexao = pyodbc.connect(connectionString)
print("Conexão Bem Sucedida")

cursor = conexao.cursor()

insert = "INSERT INTO Usuario2 ( nome_usuario, email_usuario, senha_usuario, data_registro) VALUES ( 'MArua Roverto', 'pedrinfashoR2004@gmail.com', 'camaroRoxo123', CAST(N'2020-10-27T17:00:00.000' AS DateTime))"
cursor.execute(insert)
conexao.commit()

comando = f"""SELECT * from Usuario2"""
cursor.execute(comando)

records = cursor.fetchall()
for r in records:
    print(f"{r}")

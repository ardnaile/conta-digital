#pip install pyodbc

import pyodbc

SERVER = 'servidor-banco2.database.windows.net'
DATABASE = 'banco2'
USERNAME = 'administrador'
PASSWORD = 'SenhaAdmin#'

connectionString = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={SERVER};DATABASE={DATABASE};UID={USERNAME};PWD={PASSWORD}'
conexao = pyodbc.connect(connectionString)
print("Conexão Bem Sucedida")

cursor = conexao.cursor()


comando = f"""SELECT * from Conta"""
cursor.execute(comando)

records = cursor.fetchall()
for r in records:
    print(f"{r.num_conta}")

# id = 3
# cliente = "Lira Python"
# produto = "Carro"
# data = "25/08/2021"
# preco = 5000
# quantidade = 1

# comando = f"""SELECT * from Conta(id_venda, cliente, produto, data_venda, preco, quantidade)
# VALUES
#     ({id}, '{cliente}', '{produto}', '{data}', {preco}, {quantidade})"""


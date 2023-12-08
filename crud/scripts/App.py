#pip install pyodbc
#pip install flask

import pyodbc
from flask import Flask, request, jsonify

SERVER = 'banco2.database.windows.net'
DATABASE = 'banco2'
USERNAME = 'administrador'
PASSWORD = 'SenhaAdmin#'

app = Flask(__name__)

connectionString = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={SERVER};DATABASE={DATABASE};UID={USERNAME};PWD={PASSWORD}'
conexao = pyodbc.connect(connectionString)
print("Conexão Bem Sucedida")

cursor = conexao.cursor()

def insert_usuario(nome, email, senha):
    try:
        cursor.execute("INSERT INTO Usuario ( nome_usuario, email_usuario, senha_usuario) VALUES (?, ?, ?)", nome, email, senha)
        conexao.commit()

        return True, "Dados inseridos com sucesso."
    except Exception as e:
        return False, str(e)

def insert_tipoTransacao(tipo):
    try:
        cursor.execute("INSERT INTO TipoTransacao ( descricao_tipo) VALUES (?)", tipo)
        conexao.commit()

        return True, "Dados inseridos com sucesso."
    except Exception as e:
        return False, str(e)

def insert_conta(saldo, tipoConta, idUsuario):
    try:
        cursor.execute("INSERT INTO Conta ( saldo, tipo_conta, usuario_id) VALUES (?, ?, ?)", saldo, tipoConta, idUsuario)
        conexao.commit()

        return True, "Dados inseridos com sucesso."
    except Exception as e:
        return False, str(e)

def insert_transacao(valor, tipo, conta):
    try:
        cursor.execute("INSERT INTO Transacao ( valor_transacao, tp_transacao, num_conta) VALUES (?, ?, ?)", valor, tipo, conta)
        conexao.commit()

        return True, "Dados inseridos com sucesso."
    except Exception as e:
        return False, str(e)

def insert_beneficiario(nome, numConta, banco, idUsuario):
    try:
        cursor.execute("INSERT INTO Beneficiario ( nome_beneficiario, num_conta_beneficiario, banco, id_usuario) VALUES (?, ?, ?, ?)", nome, numConta, banco, idUsuario)
        conexao.commit()

        return True, "Dados inseridos com sucesso."
    except Exception as e:
        return False, str(e)

def insert_cartaoDebito(numCartao, cvv, conta):
    try:
        cursor.execute("INSERT INTO CartaoDebito ( num_cartao, cod_seguranca, num_conta) VALUES (?, ?, ?)", numCartao, cvv, conta)
        conexao.commit()

        return True, "Dados inseridos com sucesso."
    except Exception as e:
        return False, str(e)

def insert_cartaoDebito(numCartao, cvv, conta):
    try:
        cursor.execute("INSERT INTO CartaoDebito ( num_cartao, cod_seguranca, num_conta) VALUES (?, ?, ?)", numCartao, cvv, conta)
        conexao.commit()

        return True, "Dados inseridos com sucesso."
    except Exception as e:
        return False, str(e)

def insert_historicoLogin(idUsuario, ip):
    try:
        cursor.execute("INSERT INTO HistoricoLogin ( id_usuario, endereco_ip) VALUES (?, ?)", idUsuario, ip)
        conexao.commit()

        return True, "Dados inseridos com sucesso."
    except Exception as e:
        return False, str(e)

def insert_historicoTransacoes(conta, idTransacao, tipoTransacao):
    try:
        cursor.execute("INSERT INTO HistoricoTransacoes ( num_conta, id_transacao, tp_transacao) VALUES (?, ?, ?)", conta, idTransacao, tipoTransacao)
        conexao.commit()

        return True, "Dados inseridos com sucesso."
    except Exception as e:
        return False, str(e)

def insert_tokenAutenticacao(idUsuario):
    try:
        cursor.execute("INSERT INTO TokenAutenticacao ( id_usuario) VALUES (?)", idUsuario)
        conexao.commit()

        return True, "Dados inseridos com sucesso."
    except Exception as e:
        return False, str(e)

def proc_bloqueioConta(idConta):
    try:
        cursor.execute("{CALL proc_bloquearConta (?)}", idConta)
        conexao.commit()

        return True, "Conta bloqueada."
    except Exception as e:
        return False, str(e)

def proc_desbloqueioConta(idConta):
    try:
        cursor.execute("{CALL proc_desbloquearConta (?)}", idConta)
        conexao.commit()

        return True, "Conta desbloqueada."
    except Exception as e:
        return False, str(e)

def proc_novoUsuario(nome, email, senha):
    try:
        cursor.execute("{CALL proc_novoUsu (?, ?, ?)}", nome, email, senha)
        conexao.commit()

        return True, "Usuario cadastrado."
    except Exception as e:
        return False, str(e)

def proc_novoCartao(idConta):
    try:
        cursor.execute("{CALL proc_GerarCartaoDebito (?)}", idConta)
        conexao.commit()

        return True, "Cartão Gerado."
    except Exception as e:
        return False, str(e)

def proc_transacao(valor, tipo, conta):
    try:
        cursor.execute("{CALL proc_realizar_transacao (?, ?, ? )}", valor, tipo, conta)
        conexao.commit()

        return True, "Transação Efetuada."
    except Exception as e:
        return False, str(e)

def func_saldo(conta):
    try:
        saldo = cursor.execute("SELECT dbo.ObterSaldo (?)}",conta)
        conexao.commit()
        return saldo
    except Exception as e:
        return False, str(e)

def select(tabela):
    try:
        cursor.execute(f"SELECT * FROM {tabela}")
        colunas = [column[0] for column in cursor.description]

        resultados = cursor.fetchall()

        retorno = [dict(zip(colunas, row)) for row in resultados]

        return jsonify(retorno)
    except Exception as e:
        return False, str(e)

def drop(tabela):
    try:
        cursor.execute(f"DROP table {tabela}")
        conexao.commit()
        return True, "Tabela Deletada."
    except Exception as e:
        return False, str(e)



@app.route('/insert/usuario', methods=['POST'])
def endpoint_insert_usuario():
    data = request.get_json()

    if 'nome' in data and 'email' in data and 'senha' in data:
        sucesso, mensagem = insert_usuario(data['nome'], data['email'], data['senha'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/insert/tipoTransacao', methods=['POST'])
def endpoint_insert_tipoTransacao():
    data = request.get_json()

    if 'tipo' in data:
        sucesso, mensagem = insert_tipoTransacao(data['tipo'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/insert/conta', methods=['POST'])
def endpoint_insert_conta():
    data = request.get_json()

    if 'saldo' in data and 'tipoConta' in data and 'idUsuario' in data:
        sucesso, mensagem = insert_conta(data['saldo'],data['tipoConta'], data['idUsuario'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/insert/transacao', methods=['POST'])
def endpoint_insert_transacao():
    data = request.get_json()

    if 'valor' in data and 'tipo' in data and 'conta' in data:
        sucesso, mensagem = insert_transacao(data['valor'],data['tipo'], data['conta'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/insert/beneficiario', methods=['POST'])
def endpoint_insert_beneficiario():
    
    data = request.get_json()

    if 'nome' in data and 'numConta' in data and 'banco' in data and 'idUsuario' in data:
        sucesso, mensagem = insert_beneficiario(data['nome'],data['numConta'], data['banco'], data['idUsuario'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/insert/cartaoDebito', methods=['POST'])
def endpoint_insert_cartaoDebito():
    data = request.get_json()

    if 'numCartao' in data and 'cvv' in data and 'conta' in data:
        sucesso, mensagem = insert_cartaoDebito(data['numCartao'],data['cvv'], data['conta'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/insert/historicoTransacoes', methods=['POST'])
def endpoint_insert_historicoTransacoes():
    data = request.get_json()

    if 'conta' in data and 'idTransacao' in data and 'tipoTransacao' in data:
        sucesso, mensagem = insert_historicoTransacoes(data['conta'], data['idTransacao'], data['tipoTransacao'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/insert/historicoLogin', methods=['POST'])
def endpoint_insert_historicoLogin():
    data = request.get_json()

    if 'idUsuario' in data and 'ip' in data:
        sucesso, mensagem = insert_historicoLogin(data['idUsuario'], data['ip'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/insert/tokenAutenticacao', methods=['POST'])
def endpoint_insert_tokenAutenticacao():
    data = request.get_json()

    if 'idUsuario' in data:
        sucesso, mensagem = insert_tokenAutenticacao(data['idUsuario'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/proc/bloqueioConta', methods=['POST'])
def endpoint_proc_bloqueioConta():
    data = request.get_json()

    if 'idConta' in data:
        sucesso, mensagem = proc_bloqueioConta(data['idConta'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/proc/desbloqueioConta', methods=['POST'])
def endpoint_proc_desbloqueioConta():
    data = request.get_json()

    if 'idConta' in data:
        sucesso, mensagem = proc_desbloqueioConta(data['idConta'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/proc/novoUsuario', methods=['POST'])
def endpoint_proc_novoUsuario():
    data = request.get_json()

    if 'nome' in data and 'email' in data and 'senha' in data:
        sucesso, mensagem = proc_novoUsuario(data['nome'], data['email'], data['senha'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/proc/novoCartao', methods=['POST'])
def endpoint_proc_novoCartao():
    data = request.get_json()

    if 'idConta' in data:
        sucesso, mensagem = proc_novoCartao(data['idConta'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/proc/transacao', methods=['POST'])
def endpoint_proc_transacao():
    data = request.get_json()

    if 'valor' in data and 'tipo' in data and 'conta' in data:
        sucesso, mensagem = proc_transacao(data['valor'], data['tipo'], data['conta'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/func/saldo', methods=['POST'])
def endpoint_func_saldo():
    data = request.get_json()

    if 'conta' in data:
        sucesso, mensagem = func_saldo(data['conta'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})

@app.route('/select/<int:tabela>', methods=['GET'])
def endpoint_select(tabela):

    if tabela:
        sucesso, mensagem = select(tabela)
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})


@app.route('/drop', methods=['POST'])
def drop():
    data = request.get_json()

    if 'tabela' in data:
        sucesso, mensagem = func_saldo(data['tabela'])
        return jsonify({"sucesso": sucesso, "mensagem": mensagem})
    else:
        return jsonify({"sucesso": False, "mensagem": "Dados incompletos."})


if __name__ == '__main__':
    app.run(debug=True)

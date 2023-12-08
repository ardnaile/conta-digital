## Projeto Sistema de Conta Digital

Projeto final da matéria de Banco de Dados II no curso de Engenharia Software

### Grupo D

### Integrantes:
- Eliandra Cardoso - [GitHub](https://github.com/ardnaile)
- Guilherme Correa Rabelo - [GitHub](https://github.com/GuilhermeCorreaRabelo)
- Rafael Rodrigues - [GitHub](https://github.com/Rafael171022)
- Theo Gomide - [GitHub](https://github.com/theogomide)
- Wallace Mendes - [GitHub](https://github.com/WallaceB2)

Professor orientador: Jorge Luiz da Silva - [GitHub](https://github.com/jlsilva01)

### Modelo físico
Utilizamos a ferramenta de modelagem de dados [dbdiagram.io](https://dbdiagram.io/d/conta-digital-655ff6883be1495787a1352e) para criação do modelo físico do banco de dados, para posterior exportação dos scripts DDL das tabelas e relacionamentos. Arquivo fonte: [Modelo físico](https://dbdiagram.io/d/conta-digital-655ff6883be1495787a1352e)
![conta-digital](https://github.com/ardnaile/conta-digital/assets/106704268/c4195a8b-a1ba-4a91-a5c8-3a3ab26c5e55)

### Dicionário de dados
As informações sobre as tabelas e índices foram documentadas na planilha [Google Sheets](https://docs.google.com/spreadsheets/d/1s7h-08PUFU2ivZUk2W6DeGKcwTwY5Bql/edit#gid=486633979)

### Scripts SQL
(em andamento)
Para este projeto foi utilizado o SQL Server. Abaixo segue os scripts SQL separados por tipo:
- [DDL](https://github.com/ardnaile/conta-digital/tree/main/scripts-DDl)
- [DML](https://github.com/ardnaile/conta-digital/tree/main/scripts-DML)
- [Triggers](https://github.com/ardnaile/conta-digital/tree/main/Triggers)
- [Índices]
- [Stored procedures](https://github.com/ardnaile/conta-digital/tree/main/procedures)
- [Functions](https://github.com/ardnaile/conta-digital/tree/main/functions)
- [Principais consultas mapeadas baseadas em regras de negócio](https://github.com/ardnaile/conta-digital/commit/6a32c6f978e668bbe935552298f5d0c63639277c)

### Código Fonte do CRUD
(em andamento)
- CRUD em andamento, sendo construído com a linguagem Python
- Utilizamos o módulo pyodbc para acessar o banco de dados com Python
- [Código fonte](https://github.com/ardnaile/conta-digital/blob/9d62c2f165a5c76b404755a9690ff12c1130f531/crud/main.py)

### Relatório Final
(em andamento)
O relatório final está disponível no arquivo [relatório_final](https://alunosatcedu-my.sharepoint.com/:w:/g/personal/eliandra_282421_alunosatc_edu_br/EQE1sWbdF0ZCvfly5NhIUPcBnPq5SxGd54n4OLY7ctD3pQ?e=Fl5JuD).

### Informações adicionais
Para rodar os scripts de criação e inserção (DDL e DML) do banco de dados de forma lógica e sem conflito nas foreign keys, siga a seguinte ordem:<br>
1. Usuario<br>
2. Conta<br>
3. Beneficiario<br>
4. CartaoDebito<br>
5. TipoTransacao<br>
6. Transacao<br>
7. HistoricoTransacao<br>
8. HistoricoLogin<br>
9. TokenAutenticacao

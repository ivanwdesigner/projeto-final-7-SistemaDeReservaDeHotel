PROJETO FINAL 7 – SISTEMA DE RESERVAS DE HOTEL COM ORM

Introdução
   
Este é o projeto final da disciplina ADS0011 – Projeto de Banco de Dados da Universidade Federal do Cariri (UFCA). O objetivo foi conectar o banco PostgreSQL criado na atividade 6, que é um sistema de reservas de hotel, a uma aplicação Python usando SQLAlchemy ORM. Foram realizadas operações CRUD e consultas com relacionamentos, sem escrever SQL manualmente.

Objetivos Atingidos
   
Mapeamento ORM de todas as tabelas principais: Configuração, TipoQuarto, Quarto, Hospede, Reserva, Temporada, Diaria, HistoricoReserva, Adicional, Pagamento e BloqueioQuarto.
Implementação correta dos relacionamentos 1:N e N:1, respeitando o modelo lógico.
Execução das operações CRUD com inserção de pelo menos três registros em entidades principais, listagem com ordenação e paginação, atualização de um registro e remoção respeitando a integridade referencial.
Realização de três consultas usando ORM, sendo duas envolvendo relacionamentos com JOIN e uma com filtro e ordenação.

Tecnologias Utilizadas

Python 3.8 ou superior
- SQLAlchemy (ORM)
- PostgreSQL (banco de dados)
- Psycopg2 (driver de conexão)
- Google Colab (execução e registro das etapas)

Estrutura do Projeto

A estrutura do projeto está organizada da seguinte forma:
Na raiz:
README.md
Projeto_Final_7_ORM_acessando_o_banco_criado.ipynb (notebook com todo o código)
requirements.txt (lista de dependências)

Pastas:

scripts/ – contém o arquivo schema.sql, que é o script DDL e DML da atividade 6
screenshots/ – contém as imagens que comprovam a execução de cada etapa

Como Executar o Projeto
Pré-requisitos

Python 3.8 ou superior instalado
PostgreSQL instalado e rodando
Banco de dados hotel_db criado (pode-se usar o script schema.sql para criar as tabelas e inserir os dados de teste)

Passo a Passo

Clone o repositório:
git clone https://github.com/ivanwdesigner/projeto-final-7-SistemaDeReservaDeHotel.git

Acesse a pasta criada:

cd projeto-final-7-SistemaDeReservaDeHotel
Crie e ative um ambiente virtual:

python -m venv venv

source venv/bin/activate (no Linux/Mac)

venv\Scripts\activate (no Windows)

Instale as dependências:

pip install -r requirements.txt

Configure a conexão com o banco:

Edite a variável DATABASE_URL no início do notebook, informando usuário, senha, host e nome do banco.

Execute o notebook:

Abra o arquivo Projeto_Final_7_ORM_acessando_o_banco_criado.ipynb no Jupyter, VS Code ou Google Colab e execute as células sequencialmente.
Caso o banco já exista, pule a célula que recria as tabelas. Caso contrário, execute-a normalmente.

Evidências de Funcionamento

As evidências de funcionamento estão disponíveis na pasta screenshots, contendo todos os prints das operações realizadas: criação, listagem, atualização, remoção e consultas com relacionamento.

Observações Importantes

O banco utilizado é exatamente o mesmo da atividade 6, mantendo a estrutura original.
Todas as operações foram feitas via ORM, sem SQL manual, incluindo as consultas com JOIN que usaram o método join do SQLAlchemy.
A integridade referencial foi respeitada, conforme demonstrado na tentativa de exclusão de um hóspede com reservas.
O projeto atende a todos os requisitos do enunciado: configuração, mapeamento, CRUD, consultas com relacionamento e evidências de funcionamento.

Autoria

Este projeto foi desenvolvido por José Ivan Simão da Silva, matrícula 2023011724, como parte da disciplina ADS0011 – Projeto de Banco de Dados da Universidade Federal do Cariri (UFCA). É um trabalho acadêmico e pode ser usado como referência, desde que os créditos sejam mantidos.

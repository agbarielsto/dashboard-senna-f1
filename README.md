# 🏎️ Ayrton Senna (1984 - 1994) — Full-Stack Data Analytics Dashboard

---

## Dashboard

<!-- Substitua o link abaixo pelo link gerado na aba Issues com o print do seu painel -->
![Dashboard Ayrton Senna](https://github.com/user-attachments/assets/5f58ba8d-3f13-41e4-b5fa-84dd8b628a1d)

---

## Sobre o projeto

Este projeto consiste na construção de uma solução completa de Engenharia de Dados e Data Analytics para análise do desempenho histórico de Ayrton Senna na Fórmula 1 (1984 - 1994).

Diferente de painéis tradicionais, este projeto foi construído do zero no modelo Full-Stack (Ponta a Ponta), contemplando desde a extração automatizada em APIs, limpeza estrutural, modelagem dimensional em banco de dados relacional e criação de uma interface própria para a visualização dos indicadores.

Todo o fluxo foi desenvolvido simulando um cenário real de pipeline de dados utilizado em empresas.

---

## Objetivos

* Praticar Engenharia de Dados ponta a ponta
* Modelagem dimensional (Star Schema)
* Construção de Banco de Dados Relacional
* Consultas SQL complexas
* Desenvolvimento de APIs REST (Backend)
* Storytelling com dados
* Visualização de indicadores via Web (Frontend)

---

## Pipeline do Projeto

```text
       API Ergast / Jolpica F1
                 │
                 ▼
          Coleta dos dados (Python)
                 │
                 ▼
       PostgreSQL Database
                 │
         ┌───────┴───────┐
         ▼               ▼
    Tabela Fato     Tabelas Dimensão
         │               │
         └───────┬───────┘
                 ▼
      API Backend (Python Flask)
                 │
                 ▼
     Dashboard Final (HTML/CSS/JS)

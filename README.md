# 🏎️ Ayrton Senna (1984 - 1994) — Full-Stack Data Analytics Dashboard

---

## Dashboard

![Dashboard Ayrton Senna](https://github.com/user-attachments/assets/5f58ba8d-3f13-41e4-b5fa-84dd8b628a1d)
---

## Sobre o projeto

Este projeto consiste na construção de uma solução completa de Engenharia de Dados e Data Analytics para análise do desempenho histórico de Ayrton Senna na Fórmula 1 (1984 - 1994).

Diferente de painéis tradicionais, este projeto foi construído do zero no modelo Full-Stack (Ponta a Ponta), contemplando desde a extração automatizada em APIs, limpeza estrutural, modelagem dimensional em banco de dados relacional e criação de uma interface própria para a visualização dos indicadores.

Todo o fluxo foi desenvolvido simulando um cenário real de pipeline de dados utilizado em empresas.

---

## Objetivos

*   Praticar modelagem dimensional avançada (Star Schema) no ambiente PostgreSQL.
*   Desenvolver uma pipeline Full-Stack completa: Banco de Dados -> Backend (API) -> Frontend.
*   Dominar consultas SQL analíticas complexas e agregações de dados esportivos.
*   Aplicar conceitos de interatividade assíncrona (Fetch API) no Frontend.
*   Desenvolver visualizações de dados dinâmicas e responsivas com Chart.js.
*   Aplicar técnicas de Storytelling com dados aplicados à carreira de um atleta de elite.
*   Implementar a funcionalidade de Filtro Cruzado (Cross-filtering) entre múltiplos gráficos.

---

## Pipeline do Projeto

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

---

## Modelagem do Banco de Dados

O projeto foi estruturado utilizando modelagem dimensional.

### Tabelas Fato

* FATO_CORRIDAS_SENNA

### Dimensões

* DIM_CIRCUITOS
* DIM_EQUIPES
* DIM_STATUS_CORRIDA

---

## Modelo Relacional

![Modelo Relacional](https://github.com/user-attachments/assets/306515bc-5c17-4fc1-b4ec-e07badc16b54)

---

## PostgreSQL

Toda a estrutura do banco de dados foi construída no PostgreSQL.

Foram desenvolvidas consultas para:

* criação das tabelas
* carga dos dados
* limpeza e formatação (CASE WHEN)
* agregações
* integração com a API Backend]
  
---

## Indicadores

O dashboard apresenta indicadores como:

✅ Corridas Disputadas

✅ Vitórias Totais

✅ Chegadas no Pódio

✅ Pole Positions

✅ Pole to Win (Largou e Chegou em 1º)

✅ Corridas de Recuperação (Pódio largando fora do Top 5)

✅ Evolução de Pontos por Temporada (Gráfico de Linha)

✅ Top 5 Circuitos Vencedores (Gráfico de Barras)

---

## Tecnologias

* PostgreSQL
* Python (Pandas, Requests)
* Flask (API Backend)
* SQL
* HTML5 / CSS3 (Flat Design)
* JavaScript (Fetch API & Chart.js)

---

## Fonte dos dados

Todos os dados foram obtidos através da:

**Ergast Developer API / Jolpica F1**
[http://ergast.com/mrd/](http://ergast.com/mrd/)

---

## Principais aprendizados

Durante o desenvolvimento deste projeto foram aplicados conceitos de:

* Modelagem Dimensional
* Star Schema
* Extração e tratamento de dados via API
* SQL
* Criação de APIs (Backend)
* Data Visualization
* Storytelling
* Integração Full-Stack (Front-end consumindo Back-end)

---

## Próximas evoluções

* Hospedagem do banco de dados na nuvem (AWS ou Render)
* Filtros interativos por temporada no dashboard
* Adição de estatísticas comparativas com outros pilotos da época

---

## Autor

**Anderson Gabriel Santos**

[LinkedIn](https://www.linkedin.com/in/gabriel-santos-087302244/)

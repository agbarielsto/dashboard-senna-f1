from flask import Flask, jsonify
from flask_cors import CORS
import psycopg2
import psycopg2.extras

app = Flask(__name__)
CORS(app)

DB_HOST = "localhost"
DB_NAME = "projeto_senna"
DB_USER = "postgres"
DB_PASS = "351828" # <-- Não esqueça de colocar sua senha!

def obter_conexao():
    return psycopg2.connect(host=DB_HOST, database=DB_NAME, user=DB_USER, password=DB_PASS)

@app.route('/api/kpis', methods=['GET'])
def get_kpis():
    conn = obter_conexao()
    cursor = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

    try:
        # 1. Total de Corridas
        cursor.execute("SELECT COUNT(id_corrida) AS total_corridas FROM fato_corridas_senna;")
        total = cursor.fetchone()['total_corridas']

        # 2. Vitórias Totais
        cursor.execute("SELECT COUNT(*) AS vitorias FROM fato_corridas_senna WHERE posicao_chegada = 1;")
        vitorias = cursor.fetchone()['vitorias']

        # 3. Pódios (Top 3)
        cursor.execute("SELECT COUNT(*) AS podios FROM fato_corridas_senna WHERE posicao_chegada BETWEEN 1 AND 3;")
        podios = cursor.fetchone()['podios']

        # 4. Pole Positions (Largou em 1º)
        cursor.execute("SELECT COUNT(*) AS poles FROM fato_corridas_senna WHERE posicao_largada = 1;")
        poles = cursor.fetchone()['poles']

        # 5. Pole to Win
        cursor.execute("SELECT COUNT(*) AS pole_to_win FROM fato_corridas_senna WHERE posicao_largada = 1 AND posicao_chegada = 1;")
        pole_to_win = cursor.fetchone()['pole_to_win']

        # 6. Corridas de Recuperação
        cursor.execute("SELECT COUNT(*) AS recuperacao FROM fato_corridas_senna WHERE posicao_largada > 5 AND posicao_chegada <= 3 AND posicao_chegada > 0;")
        recuperacao = cursor.fetchone()['recuperacao']

        return jsonify({
            "status": "sucesso",
            "dados": {
                "total_corridas": total, "vitorias": vitorias, "podios": podios,
                "poles": poles, "pole_to_win": pole_to_win, "corridas_recuperacao": recuperacao
            }
        })
    except Exception as e:
        return jsonify({"status": "erro", "mensagem": str(e)})
    finally:
        cursor.close()
        conn.close()

@app.route('/api/graficos', methods=['GET'])
def get_graficos():
    conn = obter_conexao()
    cursor = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

    try:
        cursor.execute("""
            SELECT temporada, SUM(pontos) AS total_pontos 
            FROM fato_corridas_senna GROUP BY temporada ORDER BY temporada;
        """)
        pontos = cursor.fetchall()
        
        cursor.execute("""
            SELECT CASE 
                WHEN c.nome_circuito = 'Circuit de Monaco' THEN 'Mônaco'
                WHEN c.nome_circuito = 'Circuit de Spa-Francorchamps' THEN 'Spa-Francorchamps'
                WHEN c.nome_circuito = 'Autodromo Enzo e Dino Ferrari' THEN 'Ímola'
                WHEN c.nome_circuito = 'Detroit Street Circuit' THEN 'Detroit'
                WHEN c.nome_circuito = 'Hockenheimring' THEN 'Hockenheim'
                ELSE c.nome_circuito
            END AS nome_circuito, COUNT(f.id_corrida) AS vitorias
            FROM fato_corridas_senna f
            JOIN dim_circuitos c ON f.id_circuito = c.id_circuito
            WHERE f.posicao_chegada = 1 GROUP BY 1 ORDER BY vitorias DESC LIMIT 5;
        """)
        vitorias_circuito = cursor.fetchall()

        return jsonify({
            "status": "sucesso",
            "grafico_linha": {"labels": [l['temporada'] for l in pontos], "dados": [float(l['total_pontos']) for l in pontos]},
            "grafico_barra": {"labels": [l['nome_circuito'] for l in vitorias_circuito], "dados": [l['vitorias'] for l in vitorias_circuito]}
        })
    except Exception as e:
        return jsonify({"status": "erro", "mensagem": str(e)})
    finally:
        cursor.close()
        conn.close()

if __name__ == '__main__':
    app.run(debug=True, port=5000)
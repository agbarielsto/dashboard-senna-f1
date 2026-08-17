import requests
import pandas as pd

def extrair_dados_senna():
    """Conecta na API e extrai TODOS os resultados do Ayrton Senna."""
    print("Iniciando a extração dos dados da API...")
    driver_id = "senna"
    todas_corridas = []
    offset = 0
    limite = 100
    
    while True:
        url = f"https://api.jolpi.ca/ergast/f1/drivers/{driver_id}/results.json?limit={limite}&offset={offset}"
        try:
            response = requests.get(url)
            response.raise_for_status()
            dados_brutos = response.json()
            corridas_pagina = dados_brutos['MRData']['RaceTable']['Races']
            
            if len(corridas_pagina) == 0:
                break
                
            todas_corridas.extend(corridas_pagina)
            print(f"Baixando... {len(todas_corridas)} corridas extraídas até agora.")
            offset += limite
            
        except requests.exceptions.RequestException as e:
            print(f"Erro ao conectar na API: {e}")
            return None
            
    return todas_corridas

def transformar_dados_para_dataframe(corridas):
    """Transforma a lista JSON em DataFrame e aplica limpeza de nulos/tempos."""
    print("Iniciando transformação e limpeza dos dados...")
    lista_registros = []
    
    for corrida in corridas:
        temporada = corrida.get('season')
        rodada = corrida.get('round')
        nome_corrida = corrida.get('raceName')
        data_corrida = corrida.get('date')
        circuito = corrida['Circuit']['circuitName']
        pais = corrida['Circuit']['Location']['country']
        
        resultado = corrida['Results'][0]
        construtor = resultado['Constructor']['name']
        posicao_largada = int(resultado.get('grid', 0))
        posicao_chegada = int(resultado.get('position', 0))
        pontos = float(resultado.get('points', 0))
        status = resultado.get('status')
        
        # --- A MÁGICA DA TRANSFORMAÇÃO DE TEMPO ENTRA AQUI ---
        # 1. Tratamento de Nulos
        # O tempo pode não existir no JSON, ou vir em nós aninhados. Usamos .get() com padrão 'Ausente'
        tempo_total = 'Ausente'
        if 'Time' in resultado:
            tempo_total = resultado['Time'].get('time', 'Ausente')
            
        volta_mais_rapida = 'Ausente'
        if 'FastestLap' in resultado:
            volta_mais_rapida = resultado['FastestLap']['Time'].get('time', 'Ausente')
            
        # 2. Padronização (Transformando minutos:segundos em Segundos Totais)
        # Exemplo: Transforma "1:25.432" em 85.432 segundos (ajuda muito no Power BI!)
        segundos_volta_rapida = None
        if volta_mais_rapida != 'Ausente' and ':' in volta_mais_rapida:
            try:
                minutos, segundos = volta_mais_rapida.split(':')
                segundos_volta_rapida = round((int(minutos) * 60) + float(segundos), 3)
            except ValueError:
                segundos_volta_rapida = None # Segurança extra contra dados sujos
        # -----------------------------------------------------

        lista_registros.append({
            'Temporada': temporada,
            'Rodada': rodada,
            'Data': data_corrida,
            'Grande_Premio': nome_corrida,
            'Circuito': circuito,
            'Pais': pais,
            'Equipe': construtor,
            'Posicao_Largada': posicao_largada,
            'Posicao_Chegada': posicao_chegada,
            'Pontos': pontos,
            'Status': status,
            'Tempo_Corrida_Str': tempo_total,
            'Volta_Rapida_Str': volta_mais_rapida,
            'Volta_Rapida_Segundos': segundos_volta_rapida
        })
        
    df_senna = pd.DataFrame(lista_registros)
    
    # 3. Limpeza Final de Nulos usando Pandas (Preenchendo valores ausentes na coluna numérica)
    df_senna['Volta_Rapida_Segundos'].fillna(0, inplace=True)
    
    print(f"Transformação concluída! {len(df_senna)} linhas prontas.")
    return df_senna

# --- Execução do Pipeline ---
corridas_brutas = extrair_dados_senna()

if corridas_brutas:
    df_final = transformar_dados_para_dataframe(corridas_brutas)
    
    print("\n--- Amostra dos Dados com a Nova Transformação ---")
    # Mostramos apenas algumas colunas para focar nos tempos
    print(df_final[['Grande_Premio', 'Status', 'Tempo_Corrida_Str', 'Volta_Rapida_Str', 'Volta_Rapida_Segundos']].head(10))
    
    # Exporta para CSV
    df_final.to_csv('resultados_senna.csv', index=False, encoding='utf-8')
    print("\nSUCESSO: Arquivo 'resultados_senna.csv' atualizado com sucesso na sua pasta!")
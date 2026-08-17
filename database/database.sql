--
-- PostgreSQL database dump
--

\restrict ZzgdiCU0MMZpb0q0fh3dlD1BsiRdN1QmhbqKBSlLmrgPu40tnMRzXeUiKAkpMAX

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-08-17 19:38:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 24713)
-- Name: dim_circuitos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_circuitos (
    id_circuito integer NOT NULL,
    nome_circuito character varying(100) NOT NULL,
    pais character varying(50) NOT NULL
);


ALTER TABLE public.dim_circuitos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24712)
-- Name: dim_circuitos_id_circuito_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_circuitos_id_circuito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_circuitos_id_circuito_seq OWNER TO postgres;

--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 221
-- Name: dim_circuitos_id_circuito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_circuitos_id_circuito_seq OWNED BY public.dim_circuitos.id_circuito;


--
-- TOC entry 220 (class 1259 OID 24704)
-- Name: dim_equipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_equipes (
    id_equipe integer NOT NULL,
    nome_equipe character varying(50) NOT NULL
);


ALTER TABLE public.dim_equipes OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24703)
-- Name: dim_equipes_id_equipe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_equipes_id_equipe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_equipes_id_equipe_seq OWNER TO postgres;

--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 219
-- Name: dim_equipes_id_equipe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_equipes_id_equipe_seq OWNED BY public.dim_equipes.id_equipe;


--
-- TOC entry 224 (class 1259 OID 24723)
-- Name: dim_status_corrida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_status_corrida (
    id_status integer NOT NULL,
    descricao_status character varying(50) NOT NULL,
    tipo_fim character varying(50)
);


ALTER TABLE public.dim_status_corrida OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24722)
-- Name: dim_status_corrida_id_status_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_status_corrida_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_status_corrida_id_status_seq OWNER TO postgres;

--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 223
-- Name: dim_status_corrida_id_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_status_corrida_id_status_seq OWNED BY public.dim_status_corrida.id_status;


--
-- TOC entry 226 (class 1259 OID 24732)
-- Name: fato_corridas_senna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fato_corridas_senna (
    id_corrida integer NOT NULL,
    temporada integer NOT NULL,
    rodada integer NOT NULL,
    data_corrida date NOT NULL,
    grande_premio character varying(100) NOT NULL,
    id_equipe integer,
    id_circuito integer,
    id_status integer,
    posicao_largada integer,
    posicao_chegada integer,
    pontos numeric(5,2),
    tempo_corrida character varying(50),
    melhor_volta_original character varying(50),
    melhor_volta_segundos numeric(10,3)
);


ALTER TABLE public.fato_corridas_senna OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24731)
-- Name: fato_corridas_senna_id_corrida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fato_corridas_senna_id_corrida_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fato_corridas_senna_id_corrida_seq OWNER TO postgres;

--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 225
-- Name: fato_corridas_senna_id_corrida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fato_corridas_senna_id_corrida_seq OWNED BY public.fato_corridas_senna.id_corrida;


--
-- TOC entry 227 (class 1259 OID 24758)
-- Name: stg_senna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stg_senna (
    temporada integer,
    rodada integer,
    data date,
    grande_premio character varying(100),
    circuito character varying(100),
    pais character varying(50),
    equipe character varying(50),
    posicao_largada integer,
    posicao_chegada integer,
    pontos numeric(5,2),
    status character varying(50),
    tempo_corrida_str character varying(50),
    volta_rapida_str character varying(50),
    volta_rapida_segundos numeric(10,3)
);


ALTER TABLE public.stg_senna OWNER TO postgres;

--
-- TOC entry 4876 (class 2604 OID 24716)
-- Name: dim_circuitos id_circuito; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_circuitos ALTER COLUMN id_circuito SET DEFAULT nextval('public.dim_circuitos_id_circuito_seq'::regclass);


--
-- TOC entry 4875 (class 2604 OID 24707)
-- Name: dim_equipes id_equipe; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_equipes ALTER COLUMN id_equipe SET DEFAULT nextval('public.dim_equipes_id_equipe_seq'::regclass);


--
-- TOC entry 4877 (class 2604 OID 24726)
-- Name: dim_status_corrida id_status; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_status_corrida ALTER COLUMN id_status SET DEFAULT nextval('public.dim_status_corrida_id_status_seq'::regclass);


--
-- TOC entry 4878 (class 2604 OID 24735)
-- Name: fato_corridas_senna id_corrida; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_corridas_senna ALTER COLUMN id_corrida SET DEFAULT nextval('public.fato_corridas_senna_id_corrida_seq'::regclass);


--
-- TOC entry 5040 (class 0 OID 24713)
-- Dependencies: 222
-- Data for Name: dim_circuitos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (61, 'Autódromo do Estoril', 'Portugal');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (62, 'Kyalami', 'South Africa');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (63, 'Circuito de Jerez', 'Spain');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (64, 'Circuit de Nevers Magny-Cours', 'France');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (65, 'Circuit Paul Ricard', 'France');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (66, 'Hungaroring', 'Hungary');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (67, 'Donington Park', 'UK');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (68, 'Circuit Gilles Villeneuve', 'Canada');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (69, 'Circuit de Monaco', 'Monaco');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (70, 'Autódromo Hermanos Rodríguez', 'Mexico');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (71, 'Circuit de Barcelona-Catalunya', 'Spain');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (72, 'Autodromo Enzo e Dino Ferrari', 'Italy');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (73, 'Fair Park', 'USA');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (74, 'Okayama International Circuit', 'Japan');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (75, 'Phoenix street circuit', 'USA');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (76, 'Red Bull Ring', 'Austria');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (77, 'Dijon-Prenois', 'France');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (78, 'Zolder', 'Belgium');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (79, 'Hockenheimring', 'Germany');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (80, 'Autódromo Internacional Nelson Piquet', 'Brazil');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (81, 'Circuit de Spa-Francorchamps', 'Belgium');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (82, 'Adelaide Street Circuit', 'Australia');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (83, 'Circuit Park Zandvoort', 'Netherlands');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (84, 'Detroit Street Circuit', 'USA');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (85, 'Autodromo Nazionale di Monza', 'Italy');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (86, 'Autódromo José Carlos Pace', 'Brazil');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (87, 'Brands Hatch', 'UK');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (88, 'Suzuka Circuit', 'Japan');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (89, 'Silverstone Circuit', 'UK');
INSERT INTO public.dim_circuitos (id_circuito, nome_circuito, pais) VALUES (90, 'Nürburgring', 'Germany');


--
-- TOC entry 5038 (class 0 OID 24704)
-- Dependencies: 220
-- Data for Name: dim_equipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dim_equipes (id_equipe, nome_equipe) VALUES (9, 'Team Lotus');
INSERT INTO public.dim_equipes (id_equipe, nome_equipe) VALUES (10, 'Williams');
INSERT INTO public.dim_equipes (id_equipe, nome_equipe) VALUES (11, 'Toleman');
INSERT INTO public.dim_equipes (id_equipe, nome_equipe) VALUES (12, 'McLaren');


--
-- TOC entry 5042 (class 0 OID 24723)
-- Dependencies: 224
-- Data for Name: dim_status_corrida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (55, 'Tyre', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (56, 'Clutch', 'Problema Mecânico');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (57, 'Gearbox', 'Problema Mecânico');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (58, 'CV joint', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (59, 'Alternator', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (60, 'Radiator', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (61, 'Turbo', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (62, 'Transmission', 'Problema Mecânico');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (63, 'Electrical', 'Problema Mecânico');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (64, 'Engine', 'Problema Mecânico');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (65, 'Accident', 'Acidente/Colisão');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (66, '+3 Laps', 'Concluído');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (67, 'Finished', 'Concluído');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (68, '+2 Laps', 'Concluído');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (69, 'Fuel system', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (70, 'Oil pressure', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (71, 'Throttle', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (72, '+5 Laps', 'Concluído');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (73, 'Out of fuel', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (74, '+1 Lap', 'Concluído');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (75, 'Differential', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (76, 'Collision', 'Acidente/Colisão');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (77, 'Disqualified', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (78, 'Wheel', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (79, 'Hydraulics', 'Problema Mecânico');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (80, 'Wheel bearing', 'Outros');
INSERT INTO public.dim_status_corrida (id_status, descricao_status, tipo_fim) VALUES (81, 'Spun off', 'Acidente/Colisão');


--
-- TOC entry 5044 (class 0 OID 24732)
-- Dependencies: 226
-- Data for Name: fato_corridas_senna; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1933, 1985, 10, '1985-08-18', 'Austrian Grand Prix', 9, 76, 67, 14, 2, 6.00, '+30.002', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1934, 1985, 3, '1985-05-05', 'San Marino Grand Prix', 9, 72, 73, 1, 7, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1935, 1985, 15, '1985-10-19', 'South African Grand Prix', 9, 62, 64, 4, 12, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1936, 1985, 11, '1985-08-25', 'Dutch Grand Prix', 9, 83, 67, 4, 3, 4.00, '+48.491', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1937, 1985, 1, '1985-04-07', 'Brazilian Grand Prix', 9, 80, 63, 4, 15, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1938, 1986, 12, '1986-08-17', 'Austrian Grand Prix', 9, 76, 64, 8, 19, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1939, 1987, 7, '1987-07-12', 'British Grand Prix', 9, 89, 74, 3, 3, 4.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1940, 1986, 15, '1986-10-12', 'Mexican Grand Prix', 9, 70, 67, 1, 3, 4.00, '+52.513', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1941, 1986, 6, '1986-06-15', 'Canadian Grand Prix', 9, 68, 74, 2, 5, 2.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1942, 1986, 4, '1986-05-11', 'Monaco Grand Prix', 9, 69, 67, 3, 3, 4.00, '+53.646', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1943, 1985, 7, '1985-07-07', 'French Grand Prix', 9, 65, 65, 2, 18, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1944, 1987, 15, '1987-11-01', 'Japanese Grand Prix', 9, 88, 67, 7, 2, 6.00, '+17.384', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1945, 1986, 5, '1986-05-25', 'Belgian Grand Prix', 9, 81, 67, 4, 2, 6.00, '+19.827', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1946, 1987, 3, '1987-05-17', 'Belgian Grand Prix', 9, 81, 65, 3, 15, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1947, 1987, 11, '1987-09-06', 'Italian Grand Prix', 9, 85, 67, 4, 2, 6.00, '+1.806', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1948, 1985, 9, '1985-08-04', 'German Grand Prix', 9, 90, 58, 5, 17, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1949, 1987, 6, '1987-07-05', 'French Grand Prix', 9, 65, 74, 3, 4, 3.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1950, 1985, 6, '1985-06-23', 'Detroit Grand Prix', 9, 84, 65, 1, 13, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1951, 1986, 3, '1986-04-27', 'San Marino Grand Prix', 9, 72, 80, 1, 21, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1952, 1985, 16, '1985-11-03', 'Australian Grand Prix', 9, 82, 64, 1, 9, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1953, 1987, 14, '1987-10-18', 'Mexican Grand Prix', 9, 70, 81, 7, 10, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1954, 1985, 2, '1985-04-21', 'Portuguese Grand Prix', 9, 61, 67, 1, 1, 9.00, '2:00:28.006', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1955, 1986, 11, '1986-08-10', 'Hungarian Grand Prix', 9, 66, 67, 1, 2, 6.00, '+17.673', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1956, 1987, 5, '1987-06-21', 'Detroit Grand Prix', 9, 84, 67, 2, 1, 9.00, '1:50:16.358', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1957, 1985, 5, '1985-06-16', 'Canadian Grand Prix', 9, 68, 72, 2, 16, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1958, 1987, 8, '1987-07-26', 'German Grand Prix', 9, 79, 74, 2, 3, 4.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1959, 1987, 16, '1987-11-15', 'Australian Grand Prix', 9, 82, 77, 4, 10, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1960, 1987, 1, '1987-04-12', 'Brazilian Grand Prix', 9, 80, 64, 3, 14, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1961, 1987, 10, '1987-08-16', 'Austrian Grand Prix', 9, 76, 68, 7, 5, 2.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1962, 1986, 8, '1986-07-06', 'French Grand Prix', 9, 65, 65, 1, 22, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1963, 1987, 13, '1987-09-27', 'Spanish Grand Prix', 9, 63, 67, 5, 5, 2.00, '+1:13.507', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1964, 1986, 1, '1986-03-23', 'Brazilian Grand Prix', 9, 80, 67, 1, 2, 6.00, '+34.827', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1965, 1985, 12, '1985-09-08', 'Italian Grand Prix', 9, 85, 67, 1, 3, 4.00, '+1:00.390', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1966, 1987, 9, '1987-08-09', 'Hungarian Grand Prix', 9, 66, 67, 6, 2, 6.00, '+37.727', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1967, 1986, 16, '1986-10-26', 'Australian Grand Prix', 9, 82, 64, 3, 19, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1968, 1987, 12, '1987-09-20', 'Portuguese Grand Prix', 9, 61, 68, 5, 7, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1969, 1986, 9, '1986-07-13', 'British Grand Prix', 9, 87, 57, 3, 16, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1970, 1985, 14, '1985-10-06', 'European Grand Prix', 9, 87, 67, 1, 2, 6.00, '+21.396', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1971, 1986, 10, '1986-07-27', 'German Grand Prix', 9, 79, 67, 3, 2, 6.00, '+15.437', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1972, 1986, 2, '1986-04-13', 'Spanish Grand Prix', 9, 63, 67, 1, 1, 9.00, '1:48:47.735', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1973, 1987, 2, '1987-05-03', 'San Marino Grand Prix', 9, 72, 67, 1, 2, 6.00, '+27.545', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1974, 1985, 4, '1985-05-19', 'Monaco Grand Prix', 9, 69, 64, 1, 16, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1975, 1987, 4, '1987-05-31', 'Monaco Grand Prix', 9, 69, 67, 2, 1, 9.00, '1:57:54.085', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1976, 1986, 14, '1986-09-21', 'Portuguese Grand Prix', 9, 61, 73, 1, 4, 3.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1977, 1986, 7, '1986-06-22', 'Detroit Grand Prix', 9, 84, 67, 1, 1, 9.00, '1:51:12.847', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1978, 1985, 13, '1985-09-15', 'Belgian Grand Prix', 9, 81, 67, 2, 1, 9.00, '1:34:19.893', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1979, 1986, 13, '1986-09-07', 'Italian Grand Prix', 9, 85, 62, 5, 27, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1980, 1985, 8, '1985-07-21', 'British Grand Prix', 9, 89, 69, 4, 10, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1981, 1994, 2, '1994-04-17', 'Pacific Grand Prix', 10, 74, 76, 1, 24, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1982, 1994, 1, '1994-03-27', 'Brazilian Grand Prix', 10, 86, 81, 1, 13, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1983, 1994, 3, '1994-05-01', 'San Marino Grand Prix', 10, 72, 65, 1, 22, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1984, 1984, 8, '1984-06-24', 'Detroit Grand Prix', 11, 84, 65, 7, 19, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1985, 1984, 12, '1984-08-19', 'Austrian Grand Prix', 11, 76, 70, 10, 14, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1986, 1984, 5, '1984-05-20', 'French Grand Prix', 11, 77, 61, 13, 19, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1987, 1984, 11, '1984-08-05', 'German Grand Prix', 11, 79, 65, 9, 25, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1988, 1984, 10, '1984-07-22', 'British Grand Prix', 11, 87, 67, 7, 3, 4.00, '+1:03.328', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1989, 1984, 9, '1984-07-08', 'Dallas Grand Prix', 11, 73, 56, 6, 14, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1990, 1984, 7, '1984-06-17', 'Canadian Grand Prix', 11, 68, 68, 9, 7, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1991, 1984, 15, '1984-10-07', 'European Grand Prix', 11, 90, 65, 12, 23, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1992, 1984, 1, '1984-03-25', 'Brazilian Grand Prix', 11, 80, 61, 16, 26, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1993, 1984, 16, '1984-10-21', 'Portuguese Grand Prix', 11, 61, 67, 3, 3, 4.00, '+20.042', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1994, 1984, 6, '1984-06-03', 'Monaco Grand Prix', 11, 69, 67, 13, 2, 3.00, '+7.446', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1995, 1984, 2, '1984-04-07', 'South African Grand Prix', 11, 62, 66, 13, 6, 1.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1996, 1984, 3, '1984-04-29', 'Belgian Grand Prix', 11, 78, 68, 19, 6, 1.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1997, 1984, 13, '1984-08-26', 'Dutch Grand Prix', 11, 83, 64, 13, 23, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1998, 1992, 10, '1992-07-26', 'German Grand Prix', 12, 79, 67, 3, 2, 6.00, '+4.500', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (1999, 1988, 11, '1988-08-28', 'Belgian Grand Prix', 12, 81, 67, 1, 1, 9.00, '1:28:00.549', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2000, 1992, 3, '1992-04-05', 'Brazilian Grand Prix', 12, 86, 64, 3, 23, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2001, 1992, 8, '1992-07-05', 'French Grand Prix', 12, 64, 65, 3, 23, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2002, 1993, 4, '1993-04-25', 'San Marino Grand Prix', 12, 72, 79, 4, 12, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2003, 1990, 8, '1990-07-15', 'British Grand Prix', 12, 89, 67, 2, 3, 4.00, '+43.088', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2004, 1989, 8, '1989-07-16', 'British Grand Prix', 12, 89, 81, 1, 25, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2005, 1989, 12, '1989-09-10', 'Italian Grand Prix', 12, 85, 64, 1, 13, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2006, 1988, 14, '1988-10-02', 'Spanish Grand Prix', 12, 63, 67, 1, 4, 3.00, '+46.710', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2007, 1990, 2, '1990-03-25', 'Brazilian Grand Prix', 12, 86, 67, 1, 3, 4.00, '+37.722', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2008, 1990, 10, '1990-08-12', 'Hungarian Grand Prix', 12, 66, 67, 4, 2, 6.00, '+0.288', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2009, 1991, 8, '1991-07-14', 'British Grand Prix', 12, 89, 73, 2, 4, 3.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2010, 1989, 7, '1989-07-09', 'French Grand Prix', 12, 65, 75, 2, 26, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2011, 1990, 1, '1990-03-11', 'United States Grand Prix', 12, 75, 67, 5, 1, 9.00, '1:52:32.829', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2012, 1991, 13, '1991-09-22', 'Portuguese Grand Prix', 12, 61, 67, 3, 2, 6.00, '+20.941', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2013, 1993, 13, '1993-09-12', 'Italian Grand Prix', 12, 85, 76, 4, 21, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2014, 1988, 2, '1988-05-01', 'San Marino Grand Prix', 12, 72, 67, 1, 1, 9.00, '1:32:41.264', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2015, 1990, 9, '1990-07-29', 'German Grand Prix', 12, 79, 67, 1, 1, 9.00, '1:20:47.164', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2016, 1989, 16, '1989-11-05', 'Australian Grand Prix', 12, 82, 76, 1, 15, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2017, 1992, 16, '1992-11-08', 'Australian Grand Prix', 12, 82, 76, 2, 21, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2018, 1990, 13, '1990-09-23', 'Portuguese Grand Prix', 12, 61, 67, 3, 2, 6.00, '+2.808', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2019, 1992, 13, '1992-09-13', 'Italian Grand Prix', 12, 85, 67, 2, 1, 10.00, '1:18:15.349', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2020, 1989, 15, '1989-10-22', 'Japanese Grand Prix', 12, 88, 77, 1, 11, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2021, 1991, 5, '1991-06-02', 'Canadian Grand Prix', 12, 68, 59, 3, 19, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2022, 1993, 12, '1993-08-29', 'Belgian Grand Prix', 12, 81, 67, 5, 4, 3.00, '+1:39.763', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2023, 1988, 15, '1988-10-30', 'Japanese Grand Prix', 12, 88, 67, 1, 1, 9.00, '1:33:26.173', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2024, 1992, 12, '1992-08-30', 'Belgian Grand Prix', 12, 81, 67, 2, 5, 2.00, '+1:08.369', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2025, 1991, 9, '1991-07-28', 'German Grand Prix', 12, 79, 73, 2, 7, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2026, 1990, 4, '1990-05-27', 'Monaco Grand Prix', 12, 69, 67, 1, 1, 9.00, '1:52:46.982', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2027, 1989, 3, '1989-05-07', 'Monaco Grand Prix', 12, 69, 67, 1, 1, 9.00, '1:53:33.251', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2028, 1989, 2, '1989-04-23', 'San Marino Grand Prix', 12, 72, 67, 1, 1, 9.00, '1:26:51.245', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2029, 1989, 4, '1989-05-28', 'Mexican Grand Prix', 12, 70, 67, 1, 1, 9.00, '1:35:21.431', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2030, 1993, 1, '1993-03-14', 'South African Grand Prix', 12, 62, 67, 2, 2, 6.00, '+1:19.824', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2031, 1988, 4, '1988-05-29', 'Mexican Grand Prix', 12, 70, 67, 1, 2, 6.00, '+7.104', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2032, 1989, 5, '1989-06-04', 'United States Grand Prix', 12, 75, 63, 1, 15, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2033, 1990, 6, '1990-06-24', 'Mexican Grand Prix', 12, 70, 55, 3, 20, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2034, 1991, 12, '1991-09-08', 'Italian Grand Prix', 12, 85, 67, 1, 2, 6.00, '+16.262', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2035, 1993, 8, '1993-07-04', 'French Grand Prix', 12, 64, 67, 5, 4, 3.00, '+32.405', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2036, 1992, 2, '1992-03-22', 'Mexican Grand Prix', 12, 70, 62, 6, 22, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2037, 1991, 6, '1991-06-16', 'Mexican Grand Prix', 12, 70, 67, 3, 3, 4.00, '+57.356', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2038, 1993, 2, '1993-03-28', 'Brazilian Grand Prix', 12, 86, 67, 3, 1, 10.00, '1:51:15.485', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2039, 1992, 1, '1992-03-01', 'South African Grand Prix', 12, 62, 67, 2, 3, 4.00, '+34.675', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2040, 1993, 7, '1993-06-13', 'Canadian Grand Prix', 12, 68, 63, 8, 18, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2041, 1993, 14, '1993-09-26', 'Portuguese Grand Prix', 12, 61, 64, 4, 24, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2042, 1993, 15, '1993-10-24', 'Japanese Grand Prix', 12, 88, 67, 2, 1, 10.00, '1:40:27.912', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2043, 1988, 10, '1988-08-07', 'Hungarian Grand Prix', 12, 66, 67, 1, 1, 9.00, '1:57:47.081', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2044, 1990, 7, '1990-07-08', 'French Grand Prix', 12, 65, 67, 3, 3, 4.00, '+11.606', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2045, 1992, 14, '1992-09-27', 'Portuguese Grand Prix', 12, 61, 74, 3, 3, 4.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2046, 1992, 6, '1992-05-31', 'Monaco Grand Prix', 12, 69, 67, 3, 1, 10.00, '1:50:59.372', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2047, 1991, 1, '1991-03-10', 'United States Grand Prix', 12, 75, 67, 1, 1, 10.00, '2:00:47.828', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2048, 1988, 12, '1988-09-11', 'Italian Grand Prix', 12, 85, 76, 1, 10, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2049, 1989, 10, '1989-08-13', 'Hungarian Grand Prix', 12, 66, 67, 2, 2, 6.00, '+25.967', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2050, 1993, 6, '1993-05-23', 'Monaco Grand Prix', 12, 69, 67, 3, 1, 10.00, '1:52:10.947', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2051, 1989, 9, '1989-07-30', 'German Grand Prix', 12, 79, 67, 1, 1, 9.00, '1:21:43.302', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2052, 1990, 12, '1990-09-09', 'Italian Grand Prix', 12, 85, 67, 1, 1, 9.00, '1:17:57.878', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2053, 1988, 9, '1988-07-24', 'German Grand Prix', 12, 79, 67, 1, 1, 9.00, '1:32:54.188', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2054, 1990, 3, '1990-05-13', 'San Marino Grand Prix', 12, 72, 78, 1, 22, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2055, 1991, 10, '1991-08-11', 'Hungarian Grand Prix', 12, 66, 67, 1, 1, 10.00, '1:49:12.796', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2056, 1991, 15, '1991-10-20', 'Japanese Grand Prix', 12, 88, 67, 2, 2, 6.00, '+0.344', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2057, 1988, 13, '1988-09-25', 'Portuguese Grand Prix', 12, 61, 67, 2, 6, 1.00, '+1:18.269', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2058, 1990, 14, '1990-09-30', 'Spanish Grand Prix', 12, 63, 60, 1, 14, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2059, 1988, 5, '1988-06-12', 'Canadian Grand Prix', 12, 68, 67, 1, 1, 9.00, '1:39:46.618', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2060, 1992, 5, '1992-05-17', 'San Marino Grand Prix', 12, 72, 67, 3, 3, 4.00, '+48.984', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2061, 1992, 7, '1992-06-14', 'Canadian Grand Prix', 12, 68, 63, 1, 18, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2062, 1991, 3, '1991-04-28', 'San Marino Grand Prix', 12, 72, 67, 1, 1, 10.00, '1:35:14.750', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2063, 1988, 7, '1988-07-03', 'French Grand Prix', 12, 65, 67, 2, 2, 6.00, '+31.752', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2064, 1988, 3, '1988-05-15', 'Monaco Grand Prix', 12, 69, 81, 1, 11, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2065, 1992, 4, '1992-05-03', 'Spanish Grand Prix', 12, 71, 81, 3, 9, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2066, 1991, 7, '1991-07-07', 'French Grand Prix', 12, 64, 67, 3, 3, 4.00, '+34.934', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2067, 1991, 4, '1991-05-12', 'Monaco Grand Prix', 12, 69, 67, 1, 1, 10.00, '1:53:02.334', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2068, 1993, 11, '1993-08-15', 'Hungarian Grand Prix', 12, 66, 71, 4, 24, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2069, 1989, 6, '1989-06-18', 'Canadian Grand Prix', 12, 68, 64, 2, 7, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2070, 1991, 14, '1991-09-29', 'Spanish Grand Prix', 12, 71, 67, 3, 5, 2.00, '+1:02.402', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2071, 1990, 15, '1990-10-21', 'Japanese Grand Prix', 12, 88, 76, 1, 23, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2072, 1992, 15, '1992-10-25', 'Japanese Grand Prix', 12, 88, 64, 3, 26, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2073, 1988, 1, '1988-04-03', 'Brazilian Grand Prix', 12, 80, 77, 1, 17, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2074, 1993, 3, '1993-04-11', 'European Grand Prix', 12, 67, 67, 4, 1, 10.00, '1:50:46.570', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2075, 1989, 14, '1989-10-01', 'Spanish Grand Prix', 12, 63, 67, 1, 1, 9.00, '1:47:48.264', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2076, 1989, 11, '1989-08-27', 'Belgian Grand Prix', 12, 81, 67, 1, 1, 9.00, '1:40:54.196', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2077, 1988, 8, '1988-07-10', 'British Grand Prix', 12, 89, 67, 3, 1, 9.00, '1:33:16.367', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2078, 1988, 6, '1988-06-19', 'Detroit Grand Prix', 12, 84, 67, 1, 1, 9.00, '1:54:56.035', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2079, 1993, 5, '1993-05-09', 'Spanish Grand Prix', 12, 71, 67, 3, 2, 6.00, '+16.873', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2080, 1989, 13, '1989-09-24', 'Portuguese Grand Prix', 12, 61, 76, 1, 17, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2081, 1991, 11, '1991-08-25', 'Belgian Grand Prix', 12, 81, 67, 1, 1, 10.00, '1:27:17.669', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2082, 1989, 1, '1989-03-26', 'Brazilian Grand Prix', 12, 80, 68, 1, 11, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2083, 1990, 5, '1990-06-10', 'Canadian Grand Prix', 12, 68, 67, 1, 1, 9.00, '1:42:56.400', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2084, 1992, 11, '1992-08-16', 'Hungarian Grand Prix', 12, 66, 67, 3, 1, 10.00, '1:46:19.216', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2085, 1992, 9, '1992-07-12', 'British Grand Prix', 12, 89, 62, 3, 18, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2086, 1990, 16, '1990-11-04', 'Australian Grand Prix', 12, 82, 81, 1, 15, 0.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2087, 1991, 16, '1991-11-03', 'Australian Grand Prix', 12, 82, 67, 1, 1, 5.00, '24:34.899', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2088, 1993, 16, '1993-11-07', 'Australian Grand Prix', 12, 82, 67, 1, 1, 10.00, '1:43:27.476', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2089, 1993, 9, '1993-07-11', 'British Grand Prix', 12, 89, 73, 4, 5, 2.00, 'Ausente', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2090, 1991, 2, '1991-03-24', 'Brazilian Grand Prix', 12, 86, 67, 1, 1, 10.00, '1:38:28.128', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2091, 1990, 11, '1990-08-26', 'Belgian Grand Prix', 12, 81, 67, 1, 1, 9.00, '1:26:31.997', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2092, 1988, 16, '1988-11-13', 'Australian Grand Prix', 12, 82, 67, 1, 2, 6.00, '+36.387', 'Ausente', NULL);
INSERT INTO public.fato_corridas_senna (id_corrida, temporada, rodada, data_corrida, grande_premio, id_equipe, id_circuito, id_status, posicao_largada, posicao_chegada, pontos, tempo_corrida, melhor_volta_original, melhor_volta_segundos) VALUES (2093, 1993, 10, '1993-07-25', 'German Grand Prix', 12, 79, 67, 4, 4, 3.00, '+1:08.229', 'Ausente', NULL);


--
-- TOC entry 5045 (class 0 OID 24758)
-- Dependencies: 227
-- Data for Name: stg_senna; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 1, '1984-03-25', 'Brazilian Grand Prix', 'Autódromo Internacional Nelson Piquet', 'Brazil', 'Toleman', 16, 26, 0.00, 'Turbo', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 2, '1984-04-07', 'South African Grand Prix', 'Kyalami', 'South Africa', 'Toleman', 13, 6, 1.00, '+3 Laps', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 3, '1984-04-29', 'Belgian Grand Prix', 'Zolder', 'Belgium', 'Toleman', 19, 6, 1.00, '+2 Laps', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 5, '1984-05-20', 'French Grand Prix', 'Dijon-Prenois', 'France', 'Toleman', 13, 19, 0.00, 'Turbo', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 6, '1984-06-03', 'Monaco Grand Prix', 'Circuit de Monaco', 'Monaco', 'Toleman', 13, 2, 3.00, 'Finished', '+7.446', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 7, '1984-06-17', 'Canadian Grand Prix', 'Circuit Gilles Villeneuve', 'Canada', 'Toleman', 9, 7, 0.00, '+2 Laps', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 8, '1984-06-24', 'Detroit Grand Prix', 'Detroit Street Circuit', 'USA', 'Toleman', 7, 19, 0.00, 'Accident', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 9, '1984-07-08', 'Dallas Grand Prix', 'Fair Park', 'USA', 'Toleman', 6, 14, 0.00, 'Clutch', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 10, '1984-07-22', 'British Grand Prix', 'Brands Hatch', 'UK', 'Toleman', 7, 3, 4.00, 'Finished', '+1:03.328', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 11, '1984-08-05', 'German Grand Prix', 'Hockenheimring', 'Germany', 'Toleman', 9, 25, 0.00, 'Accident', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 12, '1984-08-19', 'Austrian Grand Prix', 'Red Bull Ring', 'Austria', 'Toleman', 10, 14, 0.00, 'Oil pressure', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 13, '1984-08-26', 'Dutch Grand Prix', 'Circuit Park Zandvoort', 'Netherlands', 'Toleman', 13, 23, 0.00, 'Engine', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 15, '1984-10-07', 'European Grand Prix', 'Nürburgring', 'Germany', 'Toleman', 12, 23, 0.00, 'Accident', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1984, 16, '1984-10-21', 'Portuguese Grand Prix', 'Autódromo do Estoril', 'Portugal', 'Toleman', 3, 3, 4.00, 'Finished', '+20.042', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 1, '1985-04-07', 'Brazilian Grand Prix', 'Autódromo Internacional Nelson Piquet', 'Brazil', 'Team Lotus', 4, 15, 0.00, 'Electrical', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 2, '1985-04-21', 'Portuguese Grand Prix', 'Autódromo do Estoril', 'Portugal', 'Team Lotus', 1, 1, 9.00, 'Finished', '2:00:28.006', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 3, '1985-05-05', 'San Marino Grand Prix', 'Autodromo Enzo e Dino Ferrari', 'Italy', 'Team Lotus', 1, 7, 0.00, 'Out of fuel', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 4, '1985-05-19', 'Monaco Grand Prix', 'Circuit de Monaco', 'Monaco', 'Team Lotus', 1, 16, 0.00, 'Engine', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 5, '1985-06-16', 'Canadian Grand Prix', 'Circuit Gilles Villeneuve', 'Canada', 'Team Lotus', 2, 16, 0.00, '+5 Laps', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 6, '1985-06-23', 'Detroit Grand Prix', 'Detroit Street Circuit', 'USA', 'Team Lotus', 1, 13, 0.00, 'Accident', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 7, '1985-07-07', 'French Grand Prix', 'Circuit Paul Ricard', 'France', 'Team Lotus', 2, 18, 0.00, 'Accident', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 8, '1985-07-21', 'British Grand Prix', 'Silverstone Circuit', 'UK', 'Team Lotus', 4, 10, 0.00, 'Fuel system', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 9, '1985-08-04', 'German Grand Prix', 'Nürburgring', 'Germany', 'Team Lotus', 5, 17, 0.00, 'CV joint', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 10, '1985-08-18', 'Austrian Grand Prix', 'Red Bull Ring', 'Austria', 'Team Lotus', 14, 2, 6.00, 'Finished', '+30.002', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 11, '1985-08-25', 'Dutch Grand Prix', 'Circuit Park Zandvoort', 'Netherlands', 'Team Lotus', 4, 3, 4.00, 'Finished', '+48.491', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 12, '1985-09-08', 'Italian Grand Prix', 'Autodromo Nazionale di Monza', 'Italy', 'Team Lotus', 1, 3, 4.00, 'Finished', '+1:00.390', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 13, '1985-09-15', 'Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'Belgium', 'Team Lotus', 2, 1, 9.00, 'Finished', '1:34:19.893', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 14, '1985-10-06', 'European Grand Prix', 'Brands Hatch', 'UK', 'Team Lotus', 1, 2, 6.00, 'Finished', '+21.396', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 15, '1985-10-19', 'South African Grand Prix', 'Kyalami', 'South Africa', 'Team Lotus', 4, 12, 0.00, 'Engine', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1985, 16, '1985-11-03', 'Australian Grand Prix', 'Adelaide Street Circuit', 'Australia', 'Team Lotus', 1, 9, 0.00, 'Engine', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 1, '1986-03-23', 'Brazilian Grand Prix', 'Autódromo Internacional Nelson Piquet', 'Brazil', 'Team Lotus', 1, 2, 6.00, 'Finished', '+34.827', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 2, '1986-04-13', 'Spanish Grand Prix', 'Circuito de Jerez', 'Spain', 'Team Lotus', 1, 1, 9.00, 'Finished', '1:48:47.735', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 3, '1986-04-27', 'San Marino Grand Prix', 'Autodromo Enzo e Dino Ferrari', 'Italy', 'Team Lotus', 1, 21, 0.00, 'Wheel bearing', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 4, '1986-05-11', 'Monaco Grand Prix', 'Circuit de Monaco', 'Monaco', 'Team Lotus', 3, 3, 4.00, 'Finished', '+53.646', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 5, '1986-05-25', 'Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'Belgium', 'Team Lotus', 4, 2, 6.00, 'Finished', '+19.827', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 6, '1986-06-15', 'Canadian Grand Prix', 'Circuit Gilles Villeneuve', 'Canada', 'Team Lotus', 2, 5, 2.00, '+1 Lap', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 7, '1986-06-22', 'Detroit Grand Prix', 'Detroit Street Circuit', 'USA', 'Team Lotus', 1, 1, 9.00, 'Finished', '1:51:12.847', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 8, '1986-07-06', 'French Grand Prix', 'Circuit Paul Ricard', 'France', 'Team Lotus', 1, 22, 0.00, 'Accident', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 9, '1986-07-13', 'British Grand Prix', 'Brands Hatch', 'UK', 'Team Lotus', 3, 16, 0.00, 'Gearbox', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 10, '1986-07-27', 'German Grand Prix', 'Hockenheimring', 'Germany', 'Team Lotus', 3, 2, 6.00, 'Finished', '+15.437', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 11, '1986-08-10', 'Hungarian Grand Prix', 'Hungaroring', 'Hungary', 'Team Lotus', 1, 2, 6.00, 'Finished', '+17.673', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 12, '1986-08-17', 'Austrian Grand Prix', 'Red Bull Ring', 'Austria', 'Team Lotus', 8, 19, 0.00, 'Engine', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 13, '1986-09-07', 'Italian Grand Prix', 'Autodromo Nazionale di Monza', 'Italy', 'Team Lotus', 5, 27, 0.00, 'Transmission', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 14, '1986-09-21', 'Portuguese Grand Prix', 'Autódromo do Estoril', 'Portugal', 'Team Lotus', 1, 4, 3.00, 'Out of fuel', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 15, '1986-10-12', 'Mexican Grand Prix', 'Autódromo Hermanos Rodríguez', 'Mexico', 'Team Lotus', 1, 3, 4.00, 'Finished', '+52.513', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1986, 16, '1986-10-26', 'Australian Grand Prix', 'Adelaide Street Circuit', 'Australia', 'Team Lotus', 3, 19, 0.00, 'Engine', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 1, '1987-04-12', 'Brazilian Grand Prix', 'Autódromo Internacional Nelson Piquet', 'Brazil', 'Team Lotus', 3, 14, 0.00, 'Engine', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 2, '1987-05-03', 'San Marino Grand Prix', 'Autodromo Enzo e Dino Ferrari', 'Italy', 'Team Lotus', 1, 2, 6.00, 'Finished', '+27.545', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 3, '1987-05-17', 'Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'Belgium', 'Team Lotus', 3, 15, 0.00, 'Accident', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 4, '1987-05-31', 'Monaco Grand Prix', 'Circuit de Monaco', 'Monaco', 'Team Lotus', 2, 1, 9.00, 'Finished', '1:57:54.085', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 5, '1987-06-21', 'Detroit Grand Prix', 'Detroit Street Circuit', 'USA', 'Team Lotus', 2, 1, 9.00, 'Finished', '1:50:16.358', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 6, '1987-07-05', 'French Grand Prix', 'Circuit Paul Ricard', 'France', 'Team Lotus', 3, 4, 3.00, '+1 Lap', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 7, '1987-07-12', 'British Grand Prix', 'Silverstone Circuit', 'UK', 'Team Lotus', 3, 3, 4.00, '+1 Lap', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 8, '1987-07-26', 'German Grand Prix', 'Hockenheimring', 'Germany', 'Team Lotus', 2, 3, 4.00, '+1 Lap', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 9, '1987-08-09', 'Hungarian Grand Prix', 'Hungaroring', 'Hungary', 'Team Lotus', 6, 2, 6.00, 'Finished', '+37.727', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 10, '1987-08-16', 'Austrian Grand Prix', 'Red Bull Ring', 'Austria', 'Team Lotus', 7, 5, 2.00, '+2 Laps', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 11, '1987-09-06', 'Italian Grand Prix', 'Autodromo Nazionale di Monza', 'Italy', 'Team Lotus', 4, 2, 6.00, 'Finished', '+1.806', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 12, '1987-09-20', 'Portuguese Grand Prix', 'Autódromo do Estoril', 'Portugal', 'Team Lotus', 5, 7, 0.00, '+2 Laps', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 13, '1987-09-27', 'Spanish Grand Prix', 'Circuito de Jerez', 'Spain', 'Team Lotus', 5, 5, 2.00, 'Finished', '+1:13.507', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 14, '1987-10-18', 'Mexican Grand Prix', 'Autódromo Hermanos Rodríguez', 'Mexico', 'Team Lotus', 7, 10, 0.00, 'Spun off', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 15, '1987-11-01', 'Japanese Grand Prix', 'Suzuka Circuit', 'Japan', 'Team Lotus', 7, 2, 6.00, 'Finished', '+17.384', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1987, 16, '1987-11-15', 'Australian Grand Prix', 'Adelaide Street Circuit', 'Australia', 'Team Lotus', 4, 10, 0.00, 'Disqualified', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 1, '1988-04-03', 'Brazilian Grand Prix', 'Autódromo Internacional Nelson Piquet', 'Brazil', 'McLaren', 1, 17, 0.00, 'Disqualified', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 2, '1988-05-01', 'San Marino Grand Prix', 'Autodromo Enzo e Dino Ferrari', 'Italy', 'McLaren', 1, 1, 9.00, 'Finished', '1:32:41.264', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 3, '1988-05-15', 'Monaco Grand Prix', 'Circuit de Monaco', 'Monaco', 'McLaren', 1, 11, 0.00, 'Spun off', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 4, '1988-05-29', 'Mexican Grand Prix', 'Autódromo Hermanos Rodríguez', 'Mexico', 'McLaren', 1, 2, 6.00, 'Finished', '+7.104', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 5, '1988-06-12', 'Canadian Grand Prix', 'Circuit Gilles Villeneuve', 'Canada', 'McLaren', 1, 1, 9.00, 'Finished', '1:39:46.618', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 6, '1988-06-19', 'Detroit Grand Prix', 'Detroit Street Circuit', 'USA', 'McLaren', 1, 1, 9.00, 'Finished', '1:54:56.035', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 7, '1988-07-03', 'French Grand Prix', 'Circuit Paul Ricard', 'France', 'McLaren', 2, 2, 6.00, 'Finished', '+31.752', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 8, '1988-07-10', 'British Grand Prix', 'Silverstone Circuit', 'UK', 'McLaren', 3, 1, 9.00, 'Finished', '1:33:16.367', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 9, '1988-07-24', 'German Grand Prix', 'Hockenheimring', 'Germany', 'McLaren', 1, 1, 9.00, 'Finished', '1:32:54.188', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 10, '1988-08-07', 'Hungarian Grand Prix', 'Hungaroring', 'Hungary', 'McLaren', 1, 1, 9.00, 'Finished', '1:57:47.081', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 11, '1988-08-28', 'Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'Belgium', 'McLaren', 1, 1, 9.00, 'Finished', '1:28:00.549', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 12, '1988-09-11', 'Italian Grand Prix', 'Autodromo Nazionale di Monza', 'Italy', 'McLaren', 1, 10, 0.00, 'Collision', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 13, '1988-09-25', 'Portuguese Grand Prix', 'Autódromo do Estoril', 'Portugal', 'McLaren', 2, 6, 1.00, 'Finished', '+1:18.269', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 14, '1988-10-02', 'Spanish Grand Prix', 'Circuito de Jerez', 'Spain', 'McLaren', 1, 4, 3.00, 'Finished', '+46.710', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 15, '1988-10-30', 'Japanese Grand Prix', 'Suzuka Circuit', 'Japan', 'McLaren', 1, 1, 9.00, 'Finished', '1:33:26.173', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1988, 16, '1988-11-13', 'Australian Grand Prix', 'Adelaide Street Circuit', 'Australia', 'McLaren', 1, 2, 6.00, 'Finished', '+36.387', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 1, '1989-03-26', 'Brazilian Grand Prix', 'Autódromo Internacional Nelson Piquet', 'Brazil', 'McLaren', 1, 11, 0.00, '+2 Laps', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 2, '1989-04-23', 'San Marino Grand Prix', 'Autodromo Enzo e Dino Ferrari', 'Italy', 'McLaren', 1, 1, 9.00, 'Finished', '1:26:51.245', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 3, '1989-05-07', 'Monaco Grand Prix', 'Circuit de Monaco', 'Monaco', 'McLaren', 1, 1, 9.00, 'Finished', '1:53:33.251', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 4, '1989-05-28', 'Mexican Grand Prix', 'Autódromo Hermanos Rodríguez', 'Mexico', 'McLaren', 1, 1, 9.00, 'Finished', '1:35:21.431', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 5, '1989-06-04', 'United States Grand Prix', 'Phoenix street circuit', 'USA', 'McLaren', 1, 15, 0.00, 'Electrical', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 6, '1989-06-18', 'Canadian Grand Prix', 'Circuit Gilles Villeneuve', 'Canada', 'McLaren', 2, 7, 0.00, 'Engine', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 7, '1989-07-09', 'French Grand Prix', 'Circuit Paul Ricard', 'France', 'McLaren', 2, 26, 0.00, 'Differential', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 8, '1989-07-16', 'British Grand Prix', 'Silverstone Circuit', 'UK', 'McLaren', 1, 25, 0.00, 'Spun off', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 9, '1989-07-30', 'German Grand Prix', 'Hockenheimring', 'Germany', 'McLaren', 1, 1, 9.00, 'Finished', '1:21:43.302', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 10, '1989-08-13', 'Hungarian Grand Prix', 'Hungaroring', 'Hungary', 'McLaren', 2, 2, 6.00, 'Finished', '+25.967', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 11, '1989-08-27', 'Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'Belgium', 'McLaren', 1, 1, 9.00, 'Finished', '1:40:54.196', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 12, '1989-09-10', 'Italian Grand Prix', 'Autodromo Nazionale di Monza', 'Italy', 'McLaren', 1, 13, 0.00, 'Engine', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 13, '1989-09-24', 'Portuguese Grand Prix', 'Autódromo do Estoril', 'Portugal', 'McLaren', 1, 17, 0.00, 'Collision', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 14, '1989-10-01', 'Spanish Grand Prix', 'Circuito de Jerez', 'Spain', 'McLaren', 1, 1, 9.00, 'Finished', '1:47:48.264', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 15, '1989-10-22', 'Japanese Grand Prix', 'Suzuka Circuit', 'Japan', 'McLaren', 1, 11, 0.00, 'Disqualified', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1989, 16, '1989-11-05', 'Australian Grand Prix', 'Adelaide Street Circuit', 'Australia', 'McLaren', 1, 15, 0.00, 'Collision', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 1, '1990-03-11', 'United States Grand Prix', 'Phoenix street circuit', 'USA', 'McLaren', 5, 1, 9.00, 'Finished', '1:52:32.829', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 2, '1990-03-25', 'Brazilian Grand Prix', 'Autódromo José Carlos Pace', 'Brazil', 'McLaren', 1, 3, 4.00, 'Finished', '+37.722', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 3, '1990-05-13', 'San Marino Grand Prix', 'Autodromo Enzo e Dino Ferrari', 'Italy', 'McLaren', 1, 22, 0.00, 'Wheel', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 4, '1990-05-27', 'Monaco Grand Prix', 'Circuit de Monaco', 'Monaco', 'McLaren', 1, 1, 9.00, 'Finished', '1:52:46.982', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 5, '1990-06-10', 'Canadian Grand Prix', 'Circuit Gilles Villeneuve', 'Canada', 'McLaren', 1, 1, 9.00, 'Finished', '1:42:56.400', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 6, '1990-06-24', 'Mexican Grand Prix', 'Autódromo Hermanos Rodríguez', 'Mexico', 'McLaren', 3, 20, 0.00, 'Tyre', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 7, '1990-07-08', 'French Grand Prix', 'Circuit Paul Ricard', 'France', 'McLaren', 3, 3, 4.00, 'Finished', '+11.606', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 8, '1990-07-15', 'British Grand Prix', 'Silverstone Circuit', 'UK', 'McLaren', 2, 3, 4.00, 'Finished', '+43.088', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 9, '1990-07-29', 'German Grand Prix', 'Hockenheimring', 'Germany', 'McLaren', 1, 1, 9.00, 'Finished', '1:20:47.164', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 10, '1990-08-12', 'Hungarian Grand Prix', 'Hungaroring', 'Hungary', 'McLaren', 4, 2, 6.00, 'Finished', '+0.288', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 11, '1990-08-26', 'Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'Belgium', 'McLaren', 1, 1, 9.00, 'Finished', '1:26:31.997', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 12, '1990-09-09', 'Italian Grand Prix', 'Autodromo Nazionale di Monza', 'Italy', 'McLaren', 1, 1, 9.00, 'Finished', '1:17:57.878', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 13, '1990-09-23', 'Portuguese Grand Prix', 'Autódromo do Estoril', 'Portugal', 'McLaren', 3, 2, 6.00, 'Finished', '+2.808', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 14, '1990-09-30', 'Spanish Grand Prix', 'Circuito de Jerez', 'Spain', 'McLaren', 1, 14, 0.00, 'Radiator', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 15, '1990-10-21', 'Japanese Grand Prix', 'Suzuka Circuit', 'Japan', 'McLaren', 1, 23, 0.00, 'Collision', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1990, 16, '1990-11-04', 'Australian Grand Prix', 'Adelaide Street Circuit', 'Australia', 'McLaren', 1, 15, 0.00, 'Spun off', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 1, '1991-03-10', 'United States Grand Prix', 'Phoenix street circuit', 'USA', 'McLaren', 1, 1, 10.00, 'Finished', '2:00:47.828', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 2, '1991-03-24', 'Brazilian Grand Prix', 'Autódromo José Carlos Pace', 'Brazil', 'McLaren', 1, 1, 10.00, 'Finished', '1:38:28.128', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 3, '1991-04-28', 'San Marino Grand Prix', 'Autodromo Enzo e Dino Ferrari', 'Italy', 'McLaren', 1, 1, 10.00, 'Finished', '1:35:14.750', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 4, '1991-05-12', 'Monaco Grand Prix', 'Circuit de Monaco', 'Monaco', 'McLaren', 1, 1, 10.00, 'Finished', '1:53:02.334', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 5, '1991-06-02', 'Canadian Grand Prix', 'Circuit Gilles Villeneuve', 'Canada', 'McLaren', 3, 19, 0.00, 'Alternator', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 6, '1991-06-16', 'Mexican Grand Prix', 'Autódromo Hermanos Rodríguez', 'Mexico', 'McLaren', 3, 3, 4.00, 'Finished', '+57.356', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 7, '1991-07-07', 'French Grand Prix', 'Circuit de Nevers Magny-Cours', 'France', 'McLaren', 3, 3, 4.00, 'Finished', '+34.934', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 8, '1991-07-14', 'British Grand Prix', 'Silverstone Circuit', 'UK', 'McLaren', 2, 4, 3.00, 'Out of fuel', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 9, '1991-07-28', 'German Grand Prix', 'Hockenheimring', 'Germany', 'McLaren', 2, 7, 0.00, 'Out of fuel', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 10, '1991-08-11', 'Hungarian Grand Prix', 'Hungaroring', 'Hungary', 'McLaren', 1, 1, 10.00, 'Finished', '1:49:12.796', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 11, '1991-08-25', 'Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'Belgium', 'McLaren', 1, 1, 10.00, 'Finished', '1:27:17.669', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 12, '1991-09-08', 'Italian Grand Prix', 'Autodromo Nazionale di Monza', 'Italy', 'McLaren', 1, 2, 6.00, 'Finished', '+16.262', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 13, '1991-09-22', 'Portuguese Grand Prix', 'Autódromo do Estoril', 'Portugal', 'McLaren', 3, 2, 6.00, 'Finished', '+20.941', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 14, '1991-09-29', 'Spanish Grand Prix', 'Circuit de Barcelona-Catalunya', 'Spain', 'McLaren', 3, 5, 2.00, 'Finished', '+1:02.402', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 15, '1991-10-20', 'Japanese Grand Prix', 'Suzuka Circuit', 'Japan', 'McLaren', 2, 2, 6.00, 'Finished', '+0.344', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1991, 16, '1991-11-03', 'Australian Grand Prix', 'Adelaide Street Circuit', 'Australia', 'McLaren', 1, 1, 5.00, 'Finished', '24:34.899', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 1, '1992-03-01', 'South African Grand Prix', 'Kyalami', 'South Africa', 'McLaren', 2, 3, 4.00, 'Finished', '+34.675', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 2, '1992-03-22', 'Mexican Grand Prix', 'Autódromo Hermanos Rodríguez', 'Mexico', 'McLaren', 6, 22, 0.00, 'Transmission', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 3, '1992-04-05', 'Brazilian Grand Prix', 'Autódromo José Carlos Pace', 'Brazil', 'McLaren', 3, 23, 0.00, 'Engine', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 4, '1992-05-03', 'Spanish Grand Prix', 'Circuit de Barcelona-Catalunya', 'Spain', 'McLaren', 3, 9, 0.00, 'Spun off', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 5, '1992-05-17', 'San Marino Grand Prix', 'Autodromo Enzo e Dino Ferrari', 'Italy', 'McLaren', 3, 3, 4.00, 'Finished', '+48.984', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 6, '1992-05-31', 'Monaco Grand Prix', 'Circuit de Monaco', 'Monaco', 'McLaren', 3, 1, 10.00, 'Finished', '1:50:59.372', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 7, '1992-06-14', 'Canadian Grand Prix', 'Circuit Gilles Villeneuve', 'Canada', 'McLaren', 1, 18, 0.00, 'Electrical', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 8, '1992-07-05', 'French Grand Prix', 'Circuit de Nevers Magny-Cours', 'France', 'McLaren', 3, 23, 0.00, 'Accident', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 9, '1992-07-12', 'British Grand Prix', 'Silverstone Circuit', 'UK', 'McLaren', 3, 18, 0.00, 'Transmission', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 10, '1992-07-26', 'German Grand Prix', 'Hockenheimring', 'Germany', 'McLaren', 3, 2, 6.00, 'Finished', '+4.500', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 11, '1992-08-16', 'Hungarian Grand Prix', 'Hungaroring', 'Hungary', 'McLaren', 3, 1, 10.00, 'Finished', '1:46:19.216', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 12, '1992-08-30', 'Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'Belgium', 'McLaren', 2, 5, 2.00, 'Finished', '+1:08.369', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 13, '1992-09-13', 'Italian Grand Prix', 'Autodromo Nazionale di Monza', 'Italy', 'McLaren', 2, 1, 10.00, 'Finished', '1:18:15.349', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 14, '1992-09-27', 'Portuguese Grand Prix', 'Autódromo do Estoril', 'Portugal', 'McLaren', 3, 3, 4.00, '+1 Lap', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 15, '1992-10-25', 'Japanese Grand Prix', 'Suzuka Circuit', 'Japan', 'McLaren', 3, 26, 0.00, 'Engine', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1992, 16, '1992-11-08', 'Australian Grand Prix', 'Adelaide Street Circuit', 'Australia', 'McLaren', 2, 21, 0.00, 'Collision', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 1, '1993-03-14', 'South African Grand Prix', 'Kyalami', 'South Africa', 'McLaren', 2, 2, 6.00, 'Finished', '+1:19.824', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 2, '1993-03-28', 'Brazilian Grand Prix', 'Autódromo José Carlos Pace', 'Brazil', 'McLaren', 3, 1, 10.00, 'Finished', '1:51:15.485', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 3, '1993-04-11', 'European Grand Prix', 'Donington Park', 'UK', 'McLaren', 4, 1, 10.00, 'Finished', '1:50:46.570', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 4, '1993-04-25', 'San Marino Grand Prix', 'Autodromo Enzo e Dino Ferrari', 'Italy', 'McLaren', 4, 12, 0.00, 'Hydraulics', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 5, '1993-05-09', 'Spanish Grand Prix', 'Circuit de Barcelona-Catalunya', 'Spain', 'McLaren', 3, 2, 6.00, 'Finished', '+16.873', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 6, '1993-05-23', 'Monaco Grand Prix', 'Circuit de Monaco', 'Monaco', 'McLaren', 3, 1, 10.00, 'Finished', '1:52:10.947', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 7, '1993-06-13', 'Canadian Grand Prix', 'Circuit Gilles Villeneuve', 'Canada', 'McLaren', 8, 18, 0.00, 'Electrical', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 8, '1993-07-04', 'French Grand Prix', 'Circuit de Nevers Magny-Cours', 'France', 'McLaren', 5, 4, 3.00, 'Finished', '+32.405', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 9, '1993-07-11', 'British Grand Prix', 'Silverstone Circuit', 'UK', 'McLaren', 4, 5, 2.00, 'Out of fuel', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 10, '1993-07-25', 'German Grand Prix', 'Hockenheimring', 'Germany', 'McLaren', 4, 4, 3.00, 'Finished', '+1:08.229', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 11, '1993-08-15', 'Hungarian Grand Prix', 'Hungaroring', 'Hungary', 'McLaren', 4, 24, 0.00, 'Throttle', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 12, '1993-08-29', 'Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'Belgium', 'McLaren', 5, 4, 3.00, 'Finished', '+1:39.763', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 13, '1993-09-12', 'Italian Grand Prix', 'Autodromo Nazionale di Monza', 'Italy', 'McLaren', 4, 21, 0.00, 'Collision', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 14, '1993-09-26', 'Portuguese Grand Prix', 'Autódromo do Estoril', 'Portugal', 'McLaren', 4, 24, 0.00, 'Engine', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 15, '1993-10-24', 'Japanese Grand Prix', 'Suzuka Circuit', 'Japan', 'McLaren', 2, 1, 10.00, 'Finished', '1:40:27.912', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1993, 16, '1993-11-07', 'Australian Grand Prix', 'Adelaide Street Circuit', 'Australia', 'McLaren', 1, 1, 10.00, 'Finished', '1:43:27.476', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1994, 1, '1994-03-27', 'Brazilian Grand Prix', 'Autódromo José Carlos Pace', 'Brazil', 'Williams', 1, 13, 0.00, 'Spun off', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1994, 2, '1994-04-17', 'Pacific Grand Prix', 'Okayama International Circuit', 'Japan', 'Williams', 1, 24, 0.00, 'Collision', 'Ausente', 'Ausente', NULL);
INSERT INTO public.stg_senna (temporada, rodada, data, grande_premio, circuito, pais, equipe, posicao_largada, posicao_chegada, pontos, status, tempo_corrida_str, volta_rapida_str, volta_rapida_segundos) VALUES (1994, 3, '1994-05-01', 'San Marino Grand Prix', 'Autodromo Enzo e Dino Ferrari', 'Italy', 'Williams', 1, 22, 0.00, 'Accident', 'Ausente', 'Ausente', NULL);


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 221
-- Name: dim_circuitos_id_circuito_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_circuitos_id_circuito_seq', 90, true);


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 219
-- Name: dim_equipes_id_equipe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_equipes_id_equipe_seq', 12, true);


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 223
-- Name: dim_status_corrida_id_status_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_status_corrida_id_status_seq', 81, true);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 225
-- Name: fato_corridas_senna_id_corrida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fato_corridas_senna_id_corrida_seq', 2093, true);


--
-- TOC entry 4882 (class 2606 OID 24721)
-- Name: dim_circuitos dim_circuitos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_circuitos
    ADD CONSTRAINT dim_circuitos_pkey PRIMARY KEY (id_circuito);


--
-- TOC entry 4880 (class 2606 OID 24711)
-- Name: dim_equipes dim_equipes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_equipes
    ADD CONSTRAINT dim_equipes_pkey PRIMARY KEY (id_equipe);


--
-- TOC entry 4884 (class 2606 OID 24730)
-- Name: dim_status_corrida dim_status_corrida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_status_corrida
    ADD CONSTRAINT dim_status_corrida_pkey PRIMARY KEY (id_status);


--
-- TOC entry 4886 (class 2606 OID 24742)
-- Name: fato_corridas_senna fato_corridas_senna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_corridas_senna
    ADD CONSTRAINT fato_corridas_senna_pkey PRIMARY KEY (id_corrida);


--
-- TOC entry 4887 (class 2606 OID 24748)
-- Name: fato_corridas_senna fato_corridas_senna_id_circuito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_corridas_senna
    ADD CONSTRAINT fato_corridas_senna_id_circuito_fkey FOREIGN KEY (id_circuito) REFERENCES public.dim_circuitos(id_circuito);


--
-- TOC entry 4888 (class 2606 OID 24743)
-- Name: fato_corridas_senna fato_corridas_senna_id_equipe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_corridas_senna
    ADD CONSTRAINT fato_corridas_senna_id_equipe_fkey FOREIGN KEY (id_equipe) REFERENCES public.dim_equipes(id_equipe);


--
-- TOC entry 4889 (class 2606 OID 24753)
-- Name: fato_corridas_senna fato_corridas_senna_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_corridas_senna
    ADD CONSTRAINT fato_corridas_senna_id_status_fkey FOREIGN KEY (id_status) REFERENCES public.dim_status_corrida(id_status);


-- Completed on 2026-08-17 19:38:28

--
-- PostgreSQL database dump complete
--

\unrestrict ZzgdiCU0MMZpb0q0fh3dlD1BsiRdN1QmhbqKBSlLmrgPu40tnMRzXeUiKAkpMAX


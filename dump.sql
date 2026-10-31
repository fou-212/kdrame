--
-- PostgreSQL database dump
--

\restrict XnmhFOdgfT3m9mkaElcaoMVgqGjoGaXJDxiqLqoNr15XrZDH9deNLpdNds3kGHN

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg12+2)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg12+2)

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
-- Name: drama; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drama (
    id integer NOT NULL,
    naziv character varying(150) NOT NULL,
    godina integer NOT NULL,
    broj_epizoda integer NOT NULL,
    ocjena numeric(3,1),
    redatelj_id integer,
    tv_kuca_id integer
);


ALTER TABLE public.drama OWNER TO postgres;

--
-- Name: drama_glumac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drama_glumac (
    drama_id integer NOT NULL,
    glumac_id integer NOT NULL
);


ALTER TABLE public.drama_glumac OWNER TO postgres;

--
-- Name: drama_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drama_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.drama_id_seq OWNER TO postgres;

--
-- Name: drama_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drama_id_seq OWNED BY public.drama.id;


--
-- Name: drama_zanr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drama_zanr (
    drama_id integer NOT NULL,
    zanr_id integer NOT NULL
);


ALTER TABLE public.drama_zanr OWNER TO postgres;

--
-- Name: glumac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.glumac (
    id integer NOT NULL,
    ime character varying(50) NOT NULL,
    prezime character varying(50) NOT NULL
);


ALTER TABLE public.glumac OWNER TO postgres;

--
-- Name: glumac_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.glumac_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.glumac_id_seq OWNER TO postgres;

--
-- Name: glumac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.glumac_id_seq OWNED BY public.glumac.id;


--
-- Name: redatelj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.redatelj (
    id integer NOT NULL,
    ime character varying(50) NOT NULL,
    prezime character varying(50) NOT NULL
);


ALTER TABLE public.redatelj OWNER TO postgres;

--
-- Name: redatelj_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.redatelj_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.redatelj_id_seq OWNER TO postgres;

--
-- Name: redatelj_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.redatelj_id_seq OWNED BY public.redatelj.id;


--
-- Name: tv_kuca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tv_kuca (
    id integer NOT NULL,
    naziv character varying(50) NOT NULL
);


ALTER TABLE public.tv_kuca OWNER TO postgres;

--
-- Name: tv_kuca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tv_kuca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tv_kuca_id_seq OWNER TO postgres;

--
-- Name: tv_kuca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tv_kuca_id_seq OWNED BY public.tv_kuca.id;


--
-- Name: zanr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zanr (
    id integer NOT NULL,
    naziv character varying(50) NOT NULL
);


ALTER TABLE public.zanr OWNER TO postgres;

--
-- Name: zanr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zanr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.zanr_id_seq OWNER TO postgres;

--
-- Name: zanr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zanr_id_seq OWNED BY public.zanr.id;


--
-- Name: drama id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drama ALTER COLUMN id SET DEFAULT nextval('public.drama_id_seq'::regclass);


--
-- Name: glumac id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.glumac ALTER COLUMN id SET DEFAULT nextval('public.glumac_id_seq'::regclass);


--
-- Name: redatelj id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redatelj ALTER COLUMN id SET DEFAULT nextval('public.redatelj_id_seq'::regclass);


--
-- Name: tv_kuca id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tv_kuca ALTER COLUMN id SET DEFAULT nextval('public.tv_kuca_id_seq'::regclass);


--
-- Name: zanr id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zanr ALTER COLUMN id SET DEFAULT nextval('public.zanr_id_seq'::regclass);


--
-- Data for Name: drama; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drama (id, naziv, godina, broj_epizoda, ocjena, redatelj_id, tv_kuca_id) FROM stdin;
1	Crash Landing on You	2019	16	8.7	1	1
2	Goblin	2016	16	8.6	2	1
3	Flower of Evil	2020	16	8.5	3	1
4	Little Women	2022	12	7.7	4	1
5	Would You Marry Me?	2025	12	7.3	5	3
6	Taxi Driver	2021	16	8.1	6	3
7	Penthouse	2020	21	8.7	7	3
8	18 Again	2020	16	8.1	8	2
9	Itaewon Class	2020	16	8.1	9	2
10	Strong Girl Bong-Soon	2017	16	8.1	10	2
\.


--
-- Data for Name: drama_glumac; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drama_glumac (drama_id, glumac_id) FROM stdin;
1	1
1	2
2	3
2	4
3	5
3	6
4	4
4	7
5	8
5	9
6	10
7	11
8	12
9	13
10	14
\.


--
-- Data for Name: drama_zanr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drama_zanr (drama_id, zanr_id) FROM stdin;
1	1
1	2
2	3
2	1
3	4
4	4
4	5
5	1
5	2
5	4
6	6
7	4
7	5
8	1
8	2
8	4
9	1
9	2
10	1
10	2
10	3
\.


--
-- Data for Name: glumac; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.glumac (id, ime, prezime) FROM stdin;
1	Bin	Hyun
2	Ye-Jin	Son
3	Yoo	Gong
4	Go-Eun	Kim
5	Joon-Gi	Lee
6	Chae-Won	Moon
7	Ji-Hyun	Nam
8	Woo-Sik	Choi
9	So-Min	Jung
10	Je-Hoon	Lee
11	So-Yeon	Kim
12	Do-Hyun	Lee
13	Seo-Jun	Park
14	Bo-Young	Park
\.


--
-- Data for Name: redatelj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.redatelj (id, ime, prezime) FROM stdin;
1	Jeong-Hyo	Lee
2	Eung-Bok	Lee
3	Cheol-Kyu	Kim
4	Hee-Won	Kim
5	Da-Som	Kwon
6	Joon-Woo	Park
7	Dong-Min	Joo
8	Byung-Hoon	Ha
9	Sung-Yoon	Kim
10	Hyeong-Min	Lee
\.


--
-- Data for Name: tv_kuca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tv_kuca (id, naziv) FROM stdin;
1	tvN
2	JTBC
3	SBS
\.


--
-- Data for Name: zanr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zanr (id, naziv) FROM stdin;
1	Romansa
2	Komedija
3	Fantasy
4	Drama
5	Thriller
6	Akcija
\.


--
-- Name: drama_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drama_id_seq', 10, true);


--
-- Name: glumac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.glumac_id_seq', 14, true);


--
-- Name: redatelj_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.redatelj_id_seq', 10, true);


--
-- Name: tv_kuca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tv_kuca_id_seq', 3, true);


--
-- Name: zanr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zanr_id_seq', 6, true);


--
-- Name: drama_glumac drama_glumac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drama_glumac
    ADD CONSTRAINT drama_glumac_pkey PRIMARY KEY (drama_id, glumac_id);


--
-- Name: drama drama_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drama
    ADD CONSTRAINT drama_pkey PRIMARY KEY (id);


--
-- Name: drama_zanr drama_zanr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drama_zanr
    ADD CONSTRAINT drama_zanr_pkey PRIMARY KEY (drama_id, zanr_id);


--
-- Name: glumac glumac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.glumac
    ADD CONSTRAINT glumac_pkey PRIMARY KEY (id);


--
-- Name: redatelj redatelj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redatelj
    ADD CONSTRAINT redatelj_pkey PRIMARY KEY (id);


--
-- Name: tv_kuca tv_kuca_naziv_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tv_kuca
    ADD CONSTRAINT tv_kuca_naziv_key UNIQUE (naziv);


--
-- Name: tv_kuca tv_kuca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tv_kuca
    ADD CONSTRAINT tv_kuca_pkey PRIMARY KEY (id);


--
-- Name: zanr zanr_naziv_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zanr
    ADD CONSTRAINT zanr_naziv_key UNIQUE (naziv);


--
-- Name: zanr zanr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zanr
    ADD CONSTRAINT zanr_pkey PRIMARY KEY (id);


--
-- Name: drama_glumac drama_glumac_drama_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drama_glumac
    ADD CONSTRAINT drama_glumac_drama_id_fkey FOREIGN KEY (drama_id) REFERENCES public.drama(id);


--
-- Name: drama_glumac drama_glumac_glumac_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drama_glumac
    ADD CONSTRAINT drama_glumac_glumac_id_fkey FOREIGN KEY (glumac_id) REFERENCES public.glumac(id);


--
-- Name: drama drama_redatelj_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drama
    ADD CONSTRAINT drama_redatelj_id_fkey FOREIGN KEY (redatelj_id) REFERENCES public.redatelj(id);


--
-- Name: drama drama_tv_kuca_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drama
    ADD CONSTRAINT drama_tv_kuca_id_fkey FOREIGN KEY (tv_kuca_id) REFERENCES public.tv_kuca(id);


--
-- Name: drama_zanr drama_zanr_drama_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drama_zanr
    ADD CONSTRAINT drama_zanr_drama_id_fkey FOREIGN KEY (drama_id) REFERENCES public.drama(id);


--
-- Name: drama_zanr drama_zanr_zanr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drama_zanr
    ADD CONSTRAINT drama_zanr_zanr_id_fkey FOREIGN KEY (zanr_id) REFERENCES public.zanr(id);


--
-- PostgreSQL database dump complete
--

\unrestrict XnmhFOdgfT3m9mkaElcaoMVgqGjoGaXJDxiqLqoNr15XrZDH9deNLpdNds3kGHN


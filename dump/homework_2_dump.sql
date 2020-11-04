--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: ddmitroidd
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    name character varying(200) DEFAULT 'lore'::character varying NOT NULL,
    year date DEFAULT '1970-01-01'::date NOT NULL
);


ALTER TABLE public.authors OWNER TO ddmitroidd;

--
-- Name: authors_books; Type: TABLE; Schema: public; Owner: ddmitroidd
--

CREATE TABLE public.authors_books (
    author_id integer DEFAULT 0 NOT NULL,
    book_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.authors_books OWNER TO ddmitroidd;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: ddmitroidd
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO ddmitroidd;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddmitroidd
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: ddmitroidd
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title character varying(200) DEFAULT 'noname'::character varying NOT NULL,
    genre_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.books OWNER TO ddmitroidd;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: ddmitroidd
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO ddmitroidd;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddmitroidd
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: ddmitroidd
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    genre character varying(100) DEFAULT 'unknown'::character varying NOT NULL
);


ALTER TABLE public.genres OWNER TO ddmitroidd;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: ddmitroidd
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO ddmitroidd;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddmitroidd
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: vocabulary; Type: TABLE; Schema: public; Owner: ddmitroidd
--

CREATE TABLE public.vocabulary (
    id integer NOT NULL,
    name character varying(255),
    info text
);


ALTER TABLE public.vocabulary OWNER TO ddmitroidd;

--
-- Name: vocabulary_id_seq; Type: SEQUENCE; Schema: public; Owner: ddmitroidd
--

CREATE SEQUENCE public.vocabulary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vocabulary_id_seq OWNER TO ddmitroidd;

--
-- Name: vocabulary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddmitroidd
--

ALTER SEQUENCE public.vocabulary_id_seq OWNED BY public.vocabulary.id;


--
-- Name: word; Type: TABLE; Schema: public; Owner: ddmitroidd
--

CREATE TABLE public.word (
    id integer NOT NULL,
    word character varying(255),
    vocabulary_id integer
);


ALTER TABLE public.word OWNER TO ddmitroidd;

--
-- Name: word_id_seq; Type: SEQUENCE; Schema: public; Owner: ddmitroidd
--

CREATE SEQUENCE public.word_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.word_id_seq OWNER TO ddmitroidd;

--
-- Name: word_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddmitroidd
--

ALTER SEQUENCE public.word_id_seq OWNED BY public.word.id;


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: ddmitroidd
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: ddmitroidd
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: ddmitroidd
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: vocabulary id; Type: DEFAULT; Schema: public; Owner: ddmitroidd
--

ALTER TABLE ONLY public.vocabulary ALTER COLUMN id SET DEFAULT nextval('public.vocabulary_id_seq'::regclass);


--
-- Name: word id; Type: DEFAULT; Schema: public; Owner: ddmitroidd
--

ALTER TABLE ONLY public.word ALTER COLUMN id SET DEFAULT nextval('public.word_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: ddmitroidd
--

COPY public.authors (id, name, year) FROM stdin;
1	Френк Герберт	1970-01-01
2	Михаил Булгаков	1970-01-01
3	Ждек Лондон	1970-01-01
4	Иоган Гёте	1970-01-01
5	Роберт Хайнлайн	1970-01-01
6	Лев Толстой	1970-01-01
\.


--
-- Data for Name: authors_books; Type: TABLE DATA; Schema: public; Owner: ddmitroidd
--

COPY public.authors_books (author_id, book_id) FROM stdin;
1	4
2	1
3	3
4	2
5	6
6	5
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: ddmitroidd
--

COPY public.books (id, title, genre_id) FROM stdin;
1	Мастер и Маргарита	2
3	Белый клык	3
4	Дюна	1
5	Война и мир	2
6	Звездный десант	2
2	Фауст	5
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: ddmitroidd
--

COPY public.genres (id, genre) FROM stdin;
\.


--
-- Data for Name: vocabulary; Type: TABLE DATA; Schema: public; Owner: ddmitroidd
--

COPY public.vocabulary (id, name, info) FROM stdin;
\.


--
-- Data for Name: word; Type: TABLE DATA; Schema: public; Owner: ddmitroidd
--

COPY public.word (id, word, vocabulary_id) FROM stdin;
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ddmitroidd
--

SELECT pg_catalog.setval('public.authors_id_seq', 6, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ddmitroidd
--

SELECT pg_catalog.setval('public.books_id_seq', 6, true);


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ddmitroidd
--

SELECT pg_catalog.setval('public.genres_id_seq', 5, true);


--
-- Name: vocabulary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ddmitroidd
--

SELECT pg_catalog.setval('public.vocabulary_id_seq', 1, false);


--
-- Name: word_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ddmitroidd
--

SELECT pg_catalog.setval('public.word_id_seq', 1, false);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: ddmitroidd
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: ddmitroidd
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: ddmitroidd
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


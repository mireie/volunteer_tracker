--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 12.7

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: whaines
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.projects OWNER TO whaines;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: whaines
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO whaines;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whaines
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: whaines
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    name character varying,
    project_id integer,
    hours integer
);


ALTER TABLE public.volunteers OWNER TO whaines;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: whaines
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO whaines;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whaines
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: whaines
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: whaines
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: whaines
--

COPY public.projects (id, title) FROM stdin;
793	Park Cleanup
794	Aid the Elderly 
795	Mentor a Child
796	Help the Homeless
799	Put the &#39;Fun&#39; in Fundraising
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: whaines
--

COPY public.volunteers (id, name, project_id, hours) FROM stdin;
465	A MASSIVE WASP	793	1
463	Smokey Bear	793	234
464	Some Sort of Pelican	793	113
466	Hos Lisp	794	666
467	Grim Ree Per	794	66
468	Sweet Baby Angus	794	42000
469	Tea Cher	795	235
470	Mrs. Frizzle	795	5139
471	Ted Wheeler	796	\N
472	Kynd Sole	796	23
473	Cheery O&#39; Teary	799	500
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whaines
--

SELECT pg_catalog.setval('public.projects_id_seq', 799, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whaines
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 473, true);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: whaines
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: whaines
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


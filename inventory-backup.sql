--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: computer; Type: TABLE; Schema: public; Owner: yyz-anmolpreetd
--

CREATE TABLE public.computer (
    id bigint NOT NULL,
    serial_number numeric,
    model_name text NOT NULL,
    asset_code text NOT NULL,
    warranty_id bigint NOT NULL,
    location_name text NOT NULL,
    comments text
);


ALTER TABLE public.computer OWNER TO "yyz-anmolpreetd";

--
-- Name: computer_id_seq; Type: SEQUENCE; Schema: public; Owner: yyz-anmolpreetd
--

CREATE SEQUENCE public.computer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computer_id_seq OWNER TO "yyz-anmolpreetd";

--
-- Name: computer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yyz-anmolpreetd
--

ALTER SEQUENCE public.computer_id_seq OWNED BY public.computer.id;


--
-- Name: location; Type: TABLE; Schema: public; Owner: yyz-anmolpreetd
--

CREATE TABLE public.location (
    name text NOT NULL
);


ALTER TABLE public.location OWNER TO "yyz-anmolpreetd";

--
-- Name: scanner; Type: TABLE; Schema: public; Owner: yyz-anmolpreetd
--

CREATE TABLE public.scanner (
    id bigint NOT NULL,
    serial_number numeric,
    model_name text NOT NULL,
    asset_code text NOT NULL,
    contract_number numeric NOT NULL,
    warranty_id bigint NOT NULL,
    location_name text NOT NULL,
    comments text
);


ALTER TABLE public.scanner OWNER TO "yyz-anmolpreetd";

--
-- Name: scanner_id_seq; Type: SEQUENCE; Schema: public; Owner: yyz-anmolpreetd
--

CREATE SEQUENCE public.scanner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scanner_id_seq OWNER TO "yyz-anmolpreetd";

--
-- Name: scanner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yyz-anmolpreetd
--

ALTER SEQUENCE public.scanner_id_seq OWNED BY public.scanner.id;


--
-- Name: warranty; Type: TABLE; Schema: public; Owner: yyz-anmolpreetd
--

CREATE TABLE public.warranty (
    id bigint NOT NULL,
    period daterange NOT NULL,
    under_warranty boolean NOT NULL
);


ALTER TABLE public.warranty OWNER TO "yyz-anmolpreetd";

--
-- Name: warranty_id_seq; Type: SEQUENCE; Schema: public; Owner: yyz-anmolpreetd
--

CREATE SEQUENCE public.warranty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.warranty_id_seq OWNER TO "yyz-anmolpreetd";

--
-- Name: warranty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yyz-anmolpreetd
--

ALTER SEQUENCE public.warranty_id_seq OWNED BY public.warranty.id;


--
-- Name: computer id; Type: DEFAULT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.computer ALTER COLUMN id SET DEFAULT nextval('public.computer_id_seq'::regclass);


--
-- Name: scanner id; Type: DEFAULT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.scanner ALTER COLUMN id SET DEFAULT nextval('public.scanner_id_seq'::regclass);


--
-- Name: warranty id; Type: DEFAULT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.warranty ALTER COLUMN id SET DEFAULT nextval('public.warranty_id_seq'::regclass);


--
-- Data for Name: computer; Type: TABLE DATA; Schema: public; Owner: yyz-anmolpreetd
--

COPY public.computer (id, serial_number, model_name, asset_code, warranty_id, location_name, comments) FROM stdin;
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: yyz-anmolpreetd
--

COPY public.location (name) FROM stdin;
Belgrave
Hogan
\.


--
-- Data for Name: scanner; Type: TABLE DATA; Schema: public; Owner: yyz-anmolpreetd
--

COPY public.scanner (id, serial_number, model_name, asset_code, contract_number, warranty_id, location_name, comments) FROM stdin;
1	12345	Honeywell CK65	YYZ-004555	28901	1	Hogan	No comments for now
\.


--
-- Data for Name: warranty; Type: TABLE DATA; Schema: public; Owner: yyz-anmolpreetd
--

COPY public.warranty (id, period, under_warranty) FROM stdin;
1	[2020-06-05,2021-06-08)	t
\.


--
-- Name: computer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yyz-anmolpreetd
--

SELECT pg_catalog.setval('public.computer_id_seq', 1, false);


--
-- Name: scanner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yyz-anmolpreetd
--

SELECT pg_catalog.setval('public.scanner_id_seq', 1, true);


--
-- Name: warranty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yyz-anmolpreetd
--

SELECT pg_catalog.setval('public.warranty_id_seq', 1, false);


--
-- Name: computer computer_asset_code_key; Type: CONSTRAINT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.computer
    ADD CONSTRAINT computer_asset_code_key UNIQUE (asset_code);


--
-- Name: computer computer_pkey; Type: CONSTRAINT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.computer
    ADD CONSTRAINT computer_pkey PRIMARY KEY (id);


--
-- Name: computer computer_serial_number_key; Type: CONSTRAINT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.computer
    ADD CONSTRAINT computer_serial_number_key UNIQUE (serial_number);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (name);


--
-- Name: scanner scanner_asset_code_key; Type: CONSTRAINT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.scanner
    ADD CONSTRAINT scanner_asset_code_key UNIQUE (asset_code);


--
-- Name: scanner scanner_pkey; Type: CONSTRAINT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.scanner
    ADD CONSTRAINT scanner_pkey PRIMARY KEY (id);


--
-- Name: scanner scanner_serial_number_key; Type: CONSTRAINT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.scanner
    ADD CONSTRAINT scanner_serial_number_key UNIQUE (serial_number);


--
-- Name: warranty warranty_pkey; Type: CONSTRAINT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.warranty
    ADD CONSTRAINT warranty_pkey PRIMARY KEY (id);


--
-- Name: computer computer_location_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.computer
    ADD CONSTRAINT computer_location_name_fkey FOREIGN KEY (location_name) REFERENCES public.location(name);


--
-- Name: computer computer_warranty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.computer
    ADD CONSTRAINT computer_warranty_id_fkey FOREIGN KEY (warranty_id) REFERENCES public.warranty(id);


--
-- Name: scanner scanner_location_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.scanner
    ADD CONSTRAINT scanner_location_name_fkey FOREIGN KEY (location_name) REFERENCES public.location(name);


--
-- Name: scanner scanner_warranty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yyz-anmolpreetd
--

ALTER TABLE ONLY public.scanner
    ADD CONSTRAINT scanner_warranty_id_fkey FOREIGN KEY (warranty_id) REFERENCES public.warranty(id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: animals; Type: TABLE; Schema: public; Owner: elreybelmonti
--

CREATE TABLE animals (
    id integer NOT NULL,
    name character varying,
    gender character varying,
    date_admitted date DEFAULT ('now'::text)::date NOT NULL,
    type character varying,
    breed character varying,
    adopted_by integer
);


ALTER TABLE animals OWNER TO elreybelmonti;

--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: elreybelmonti
--

CREATE SEQUENCE animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE animals_id_seq OWNER TO elreybelmonti;

--
-- Name: animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elreybelmonti
--

ALTER SEQUENCE animals_id_seq OWNED BY animals.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: elreybelmonti
--

CREATE TABLE customers (
    id integer NOT NULL,
    name character varying,
    phone character varying,
    email character varying(355),
    prefer_type character varying,
    prefer_breed character varying
);


ALTER TABLE customers OWNER TO elreybelmonti;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: elreybelmonti
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_id_seq OWNER TO elreybelmonti;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elreybelmonti
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: animals id; Type: DEFAULT; Schema: public; Owner: elreybelmonti
--

ALTER TABLE ONLY animals ALTER COLUMN id SET DEFAULT nextval('animals_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: elreybelmonti
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: elreybelmonti
--

COPY animals (id, name, gender, date_admitted, type, breed, adopted_by) FROM stdin;
\.


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elreybelmonti
--

SELECT pg_catalog.setval('animals_id_seq', 1, true);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: elreybelmonti
--

COPY customers (id, name, phone, email, prefer_type, prefer_breed) FROM stdin;
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elreybelmonti
--

SELECT pg_catalog.setval('customers_id_seq', 1, true);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: elreybelmonti
--

ALTER TABLE ONLY animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: elreybelmonti
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 15.2

-- Started on 2023-09-24 20:27:13

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

DROP DATABASE mydb;
--
-- TOC entry 3364 (class 1262 OID 16474)
-- Name: mydb; Type: DATABASE; Schema: -; Owner: myuser
--

CREATE DATABASE mydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru_RU.UTF-8';


ALTER DATABASE mydb OWNER TO myuser;

\connect mydb

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16502)
-- Name: certificates; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.certificates (
    id integer NOT NULL,
    certifnumber integer,
    releasedate character varying(100),
    expirationdate character varying(100),
    certifstatus character varying(100)
);


ALTER TABLE public.certificates OWNER TO myuser;

--
-- TOC entry 215 (class 1259 OID 16501)
-- Name: certificates_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.certificates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificates_id_seq OWNER TO myuser;

--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 215
-- Name: certificates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.certificates_id_seq OWNED BY public.certificates.id;


--
-- TOC entry 210 (class 1259 OID 16476)
-- Name: stockholders; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.stockholders (
    id integer NOT NULL,
    firstname character varying(100),
    lastname character varying(100),
    telephone character varying(100),
    email character varying(100)
);


ALTER TABLE public.stockholders OWNER TO myuser;

--
-- TOC entry 209 (class 1259 OID 16475)
-- Name: stockholders_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.stockholders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stockholders_id_seq OWNER TO myuser;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 209
-- Name: stockholders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.stockholders_id_seq OWNED BY public.stockholders.id;


--
-- TOC entry 214 (class 1259 OID 16490)
-- Name: stocks; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.stocks (
    id integer NOT NULL,
    type_id integer,
    stockquantity integer
);


ALTER TABLE public.stocks OWNER TO myuser;

--
-- TOC entry 213 (class 1259 OID 16489)
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.stocks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_seq OWNER TO myuser;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 213
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- TOC entry 212 (class 1259 OID 16483)
-- Name: stocktype; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.stocktype (
    id integer NOT NULL,
    stocktype character varying(100)
);


ALTER TABLE public.stocktype OWNER TO myuser;

--
-- TOC entry 211 (class 1259 OID 16482)
-- Name: stocktype_id_type_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.stocktype_id_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocktype_id_type_seq OWNER TO myuser;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 211
-- Name: stocktype_id_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.stocktype_id_type_seq OWNED BY public.stocktype.id;


--
-- TOC entry 218 (class 1259 OID 16509)
-- Name: transactions; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    transactiontype character varying(100),
    transactiondate character varying(100),
    transactionamount integer,
    stockholder_id integer,
    certificate_id integer,
    stock_id integer
);


ALTER TABLE public.transactions OWNER TO myuser;

--
-- TOC entry 217 (class 1259 OID 16508)
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO myuser;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 217
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- TOC entry 3194 (class 2604 OID 16505)
-- Name: certificates id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.certificates ALTER COLUMN id SET DEFAULT nextval('public.certificates_id_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 16479)
-- Name: stockholders id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.stockholders ALTER COLUMN id SET DEFAULT nextval('public.stockholders_id_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 16493)
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- TOC entry 3192 (class 2604 OID 16486)
-- Name: stocktype id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.stocktype ALTER COLUMN id SET DEFAULT nextval('public.stocktype_id_type_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 16512)
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- TOC entry 3356 (class 0 OID 16502)
-- Dependencies: 216
-- Data for Name: certificates; Type: TABLE DATA; Schema: public; Owner: myuser
--

INSERT INTO public.certificates (id, certifnumber, releasedate, expirationdate, certifstatus) VALUES (1, 36, '20.06.2020', '25.12.2026', 'Активен');
INSERT INTO public.certificates (id, certifnumber, releasedate, expirationdate, certifstatus) VALUES (2, 67, '21.08.2019', '22.09.2030', 'Активен');
INSERT INTO public.certificates (id, certifnumber, releasedate, expirationdate, certifstatus) VALUES (3, 3, '22.01.2009', '22.01.2023', 'Аннулирован');
INSERT INTO public.certificates (id, certifnumber, releasedate, expirationdate, certifstatus) VALUES (4, 66, '01.01.2021', '05.08.2023', 'Активен');
INSERT INTO public.certificates (id, certifnumber, releasedate, expirationdate, certifstatus) VALUES (5, 77, '24.09.2020', '24.09.2026', 'Активен');
INSERT INTO public.certificates (id, certifnumber, releasedate, expirationdate, certifstatus) VALUES (6, 89, '22.10.2021', '03.04.2022', 'Аннулирован');


--
-- TOC entry 3350 (class 0 OID 16476)
-- Dependencies: 210
-- Data for Name: stockholders; Type: TABLE DATA; Schema: public; Owner: myuser
--

INSERT INTO public.stockholders (id, firstname, lastname, telephone, email) VALUES (1, 'Данила', 'Скороход', '+79503453434', 'skorohod@gmail.com');
INSERT INTO public.stockholders (id, firstname, lastname, telephone, email) VALUES (2, 'Никита', 'Никитич', '89123463568', '@gmail.com');
INSERT INTO public.stockholders (id, firstname, lastname, telephone, email) VALUES (3, 'Чак', 'Паланик', '+1224923311', 'palanik@mail.com');
INSERT INTO public.stockholders (id, firstname, lastname, telephone, email) VALUES (4, 'Сергей', 'Вотченков', '+7934263424', 'watch1@mail.com');
INSERT INTO public.stockholders (id, firstname, lastname, telephone, email) VALUES (5, 'Максим', 'Олейников', '+718921249', 'oleynik@mail.com');


--
-- TOC entry 3354 (class 0 OID 16490)
-- Dependencies: 214
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: myuser
--

INSERT INTO public.stocks (id, type_id, stockquantity) VALUES (1, 1, 100);
INSERT INTO public.stocks (id, type_id, stockquantity) VALUES (2, 1, 30);
INSERT INTO public.stocks (id, type_id, stockquantity) VALUES (3, 2, 30);
INSERT INTO public.stocks (id, type_id, stockquantity) VALUES (4, 2, 20);
INSERT INTO public.stocks (id, type_id, stockquantity) VALUES (5, 1, 700);
INSERT INTO public.stocks (id, type_id, stockquantity) VALUES (6, 1, 400);
INSERT INTO public.stocks (id, type_id, stockquantity) VALUES (7, 1, 20);


--
-- TOC entry 3352 (class 0 OID 16483)
-- Dependencies: 212
-- Data for Name: stocktype; Type: TABLE DATA; Schema: public; Owner: myuser
--

INSERT INTO public.stocktype (id, stocktype) VALUES (1, 'Обыкновенная');
INSERT INTO public.stocktype (id, stocktype) VALUES (2, 'Привилегированная');


--
-- TOC entry 3358 (class 0 OID 16509)
-- Dependencies: 218
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: myuser
--

INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (2, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (3, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (4, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (5, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (6, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (7, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (8, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (9, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (10, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (11, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (12, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (13, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (14, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (15, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (16, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (17, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (18, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (19, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (20, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (21, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (22, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (23, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (24, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (25, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (26, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (27, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (28, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (29, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (30, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (31, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (32, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (33, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (34, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (35, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (36, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (37, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (38, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (39, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (40, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (41, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (42, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (43, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (44, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (45, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (46, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (47, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (48, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (49, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (50, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (51, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (52, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (53, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (54, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (55, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (56, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (57, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (58, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (59, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (60, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (61, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (62, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (63, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (64, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (65, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (66, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (67, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (68, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (69, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (70, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (71, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (72, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (73, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (74, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (75, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (76, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (77, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (78, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (79, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (80, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (81, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (82, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (83, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (84, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (85, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (86, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (87, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (88, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (89, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (90, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (91, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (92, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (93, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (94, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (95, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (96, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (97, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (98, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (99, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (100, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (101, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (102, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (103, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (104, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (105, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (106, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (107, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (108, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (109, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (110, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (111, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (112, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (113, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (114, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (115, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (116, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (117, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (118, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (119, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (120, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (121, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (122, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (123, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (124, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (125, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (126, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (127, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (128, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (129, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (130, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (131, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (132, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (133, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (134, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (135, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (136, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (137, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (138, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (139, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (140, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (141, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (142, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (143, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (144, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (145, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (146, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (147, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (148, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (149, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (150, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (151, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (152, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (153, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (154, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (155, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (156, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (157, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (158, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (159, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (160, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (161, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (162, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (163, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (164, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (165, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (166, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (167, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (168, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (169, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (170, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (171, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (172, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (173, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (174, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (175, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (176, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (177, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (178, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (179, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (180, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (181, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (182, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (183, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (184, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (185, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (186, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (187, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (188, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (189, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (190, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (191, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (192, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (193, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (194, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (195, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (196, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (197, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (198, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (199, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (200, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (201, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (202, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (203, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (204, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (205, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (206, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (207, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (208, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (209, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (210, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (211, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (212, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (213, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (214, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (215, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (216, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (217, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (218, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (219, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (220, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (221, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (222, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (223, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (224, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (225, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (226, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (227, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (228, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (229, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (230, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (231, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (232, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (233, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (234, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (235, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (236, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (237, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (238, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (239, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (240, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (241, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (242, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (243, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (244, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (245, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (246, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (247, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (248, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (249, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (250, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (251, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (252, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (253, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (254, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (255, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (256, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (257, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (258, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (259, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (260, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (261, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (262, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (263, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (264, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (265, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (266, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (267, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (268, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (269, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (270, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (271, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (272, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (273, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (274, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (275, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (276, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (277, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (278, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (279, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (280, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (281, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (282, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (283, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (284, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (285, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (286, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (287, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (288, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (289, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (290, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (291, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (292, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (293, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (294, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (295, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (296, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (297, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (298, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (299, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (300, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (301, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (302, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (303, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (304, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (305, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (306, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (307, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (308, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (309, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (310, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (311, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (312, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (313, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (314, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (315, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (316, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (317, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (318, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (319, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (320, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (321, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (322, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (323, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (324, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (325, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (326, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (327, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (328, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (329, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (330, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (331, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (332, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (333, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (334, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (335, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (336, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (337, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (338, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (339, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (340, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (341, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (342, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (343, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (344, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (345, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (346, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (347, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (348, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (349, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (350, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (351, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (352, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (353, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (354, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (355, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (356, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (357, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (358, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (359, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (360, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (361, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (362, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (363, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (364, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (365, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (366, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (367, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (368, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (369, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (370, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (371, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (372, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (373, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (374, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (375, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (376, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (377, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (378, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (379, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (380, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (381, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (382, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (383, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (384, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (385, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (386, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (387, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (388, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (389, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (390, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (391, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (392, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (393, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (394, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (395, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (396, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (397, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (398, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (399, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (400, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (401, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (402, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (403, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (404, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (405, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (406, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (407, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (408, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (409, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (410, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (411, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (412, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (413, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (414, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (415, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (416, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (417, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (418, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (419, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (420, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (421, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (422, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (423, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (424, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (425, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (426, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (427, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (428, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (429, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (430, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (431, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (432, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (433, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (434, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (435, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (436, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (437, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (438, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (439, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (440, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (441, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (442, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (443, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (444, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (445, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (446, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (447, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (448, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (449, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (450, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (451, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (452, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (453, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (454, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (455, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (456, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (457, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (458, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (459, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (460, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (461, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (462, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (463, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (464, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (465, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (466, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (467, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (468, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (469, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (470, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (471, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (472, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (473, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (474, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (475, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (476, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (477, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (478, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (479, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (480, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (481, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (482, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (483, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (484, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (485, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (486, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (487, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (488, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (489, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (490, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (491, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (492, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (493, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (494, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (495, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (496, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (497, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (498, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (499, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (500, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (501, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (502, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (503, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (504, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (505, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (506, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (507, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (508, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (509, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (510, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (511, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (512, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (513, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (514, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (515, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (516, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (517, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (518, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (519, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (520, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (521, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (522, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (523, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (524, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (525, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (526, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (527, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (528, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (529, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (530, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (531, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (532, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (533, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (534, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (535, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (536, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (537, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (538, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (539, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (540, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (541, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (542, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (543, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (544, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (545, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (546, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (547, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (548, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (549, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (550, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (551, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (552, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (553, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (554, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (555, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (556, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (557, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (558, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (559, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (560, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (561, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (562, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (563, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (564, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (565, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (566, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (567, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (568, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (569, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (570, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (571, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (572, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (573, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (574, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (575, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (576, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (577, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (578, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (579, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (580, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (581, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (582, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (583, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (584, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (585, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (586, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (587, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (588, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (589, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (590, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (591, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (592, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (593, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (594, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (595, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (596, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (597, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (598, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (599, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (600, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (601, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (602, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (603, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (604, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (605, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (606, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (607, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (608, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (609, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (610, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (611, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (612, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (613, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (614, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (615, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (616, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (617, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (618, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (619, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (620, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (621, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (622, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (623, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (624, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (625, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (626, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (627, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (628, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (629, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (630, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (631, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (632, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (633, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (634, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (635, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (636, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (637, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (638, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (639, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (640, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (641, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (642, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (643, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (644, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (645, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (646, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (647, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (648, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (649, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (650, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (651, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (652, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (653, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (654, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (655, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (656, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (657, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (658, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (659, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (660, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (661, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (662, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (663, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (664, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (665, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (666, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (667, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (668, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (669, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (670, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (671, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (672, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (673, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (674, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (675, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (676, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (677, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (678, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (679, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (680, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (681, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (682, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (683, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (684, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (685, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (686, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (687, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (688, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (689, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (690, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (691, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (692, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (693, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (694, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (695, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (696, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (697, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (698, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (699, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (700, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (701, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (702, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (703, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (704, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (705, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (706, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (707, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (708, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (709, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (710, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (711, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (712, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (713, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (714, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (715, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (716, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (717, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (718, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (719, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (720, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (721, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (722, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (723, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (724, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (725, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (726, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (727, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (728, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (729, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (730, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (731, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (732, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (733, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (734, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (735, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (736, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (737, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (738, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (739, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (740, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (741, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (742, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (743, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (744, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (745, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (746, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (747, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (748, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (749, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (750, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (751, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (752, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (753, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (754, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (755, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (756, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (757, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (758, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (759, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (760, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (761, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (762, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (763, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (764, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (765, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (766, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (767, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (768, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (769, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (770, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (771, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (772, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (773, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (774, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (775, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (776, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (777, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (778, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (779, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (780, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (781, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (782, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (783, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (784, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (785, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (786, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (787, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (788, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (789, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (790, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (791, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (792, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (793, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (794, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (795, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (796, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (797, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (798, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (799, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (800, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (801, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (802, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (803, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (804, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (805, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (806, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (807, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (808, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (809, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (810, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (811, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (812, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (813, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (814, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (815, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (816, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (817, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (818, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (819, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (820, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (821, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (822, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (823, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (824, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (825, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (826, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (827, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (828, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (829, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (830, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (831, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (832, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (833, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (834, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (835, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (836, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (837, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (838, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (839, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (840, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (841, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (842, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (843, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (844, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (845, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (846, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (847, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (848, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (849, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (850, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (851, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (852, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (853, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (854, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (855, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (856, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (857, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (858, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (859, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (860, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (861, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (862, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (863, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (864, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (865, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (866, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (867, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (868, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (869, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (870, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (871, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (872, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (873, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (874, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (875, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (876, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (877, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (878, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (879, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (880, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (881, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (882, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (883, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (884, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (885, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (886, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (887, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (888, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (889, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (890, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (891, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (892, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (893, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (894, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (895, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (896, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (897, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (898, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (899, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (900, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (901, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (902, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (903, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (904, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (905, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (906, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (907, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (908, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (909, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (910, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (911, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (912, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (913, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (914, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (915, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (916, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (917, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (918, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (919, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (920, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (921, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (922, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (923, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (924, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (925, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (926, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (927, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (928, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (929, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (930, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (931, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (932, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (933, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (934, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (935, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (936, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (937, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (938, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (939, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (940, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (941, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (942, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (943, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (944, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (945, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (946, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (947, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (948, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (949, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (950, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (951, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (952, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (953, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (954, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (955, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (956, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (957, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (958, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (959, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (960, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (961, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (962, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (963, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (964, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (965, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (966, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (967, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (968, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (969, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (970, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (971, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (972, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (973, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (974, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (975, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (976, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (977, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (978, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (979, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (980, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (981, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (982, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (983, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (984, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (985, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (986, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (987, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (988, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (989, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (990, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (991, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (992, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (993, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (994, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (995, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (996, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (997, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (998, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (999, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1000, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1001, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1002, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1003, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1004, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1005, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1006, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1007, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1008, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1009, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1010, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1011, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1012, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1013, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1014, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1015, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1016, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1017, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1018, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1019, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1020, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1021, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1022, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1023, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1024, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1025, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1026, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1027, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1028, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1029, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1030, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1031, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1032, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1033, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1034, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1035, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1036, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1037, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1038, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1039, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1040, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1041, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1042, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1043, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1044, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1045, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1046, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1047, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1048, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1049, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1050, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1051, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1052, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1053, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1054, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1055, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1056, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1057, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1058, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1059, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1060, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1061, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1062, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1063, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1064, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1065, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1066, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1067, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1068, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1069, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1070, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1071, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1072, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1073, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1074, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1075, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1076, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1077, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1078, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1079, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1080, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1081, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1082, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1083, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1084, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1085, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1086, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1087, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1088, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1089, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1090, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1091, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1092, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1093, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1094, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1095, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1096, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1097, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1098, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1099, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1100, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1101, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1102, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1103, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1104, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1105, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1106, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1107, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1108, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1109, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1110, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1111, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1112, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1113, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1114, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1115, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1116, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1117, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1118, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1119, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1120, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1121, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1122, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1123, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1124, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1125, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1126, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1127, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1128, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1129, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1130, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1131, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1132, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1133, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1134, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1135, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1136, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1137, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1138, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1139, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1140, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1141, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1142, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1143, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1144, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1145, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1146, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1147, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1148, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1149, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1150, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1151, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1152, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1153, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1154, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1155, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1156, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1157, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1158, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1159, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1160, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1161, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1162, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1163, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1164, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1165, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1166, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1167, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1168, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1169, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1170, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1171, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1172, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1173, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1174, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1175, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1176, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1177, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1178, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1179, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1180, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1181, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1182, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1183, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1184, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1185, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1186, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1187, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1188, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1189, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1190, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1191, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1192, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1193, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1194, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1195, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1196, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1197, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1198, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1199, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1200, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1201, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1202, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1203, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1204, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1205, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1206, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1207, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1208, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1209, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1210, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1211, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1212, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1213, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1214, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1215, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1216, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1217, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1218, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1219, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1220, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1221, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1222, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1223, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1224, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1225, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1226, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1227, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1228, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1229, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1230, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1231, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1232, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1233, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1234, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1235, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1236, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1237, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1238, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1239, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1240, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1241, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1242, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1243, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1244, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1245, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1246, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1247, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1248, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1249, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1250, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1251, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1252, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1253, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1254, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1255, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1256, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1257, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1258, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1259, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1260, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1261, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1262, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1263, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1264, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1265, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1266, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1267, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1268, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1269, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1270, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1271, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1272, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1273, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1274, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1275, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1276, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1277, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1278, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1279, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1280, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1281, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1282, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1283, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1284, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1285, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1286, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1287, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1288, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1289, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1290, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1291, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1292, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1293, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1294, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1295, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1296, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1297, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1298, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1299, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1300, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1301, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1302, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1303, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1304, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1305, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1306, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1307, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1308, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1309, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1310, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1311, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1312, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1313, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1314, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1315, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1316, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1317, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1318, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1319, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1320, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1321, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1322, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1323, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1324, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1325, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1326, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1327, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1328, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1329, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1330, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1331, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1332, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1333, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1334, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1335, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1336, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1337, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1338, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1339, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1340, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1341, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1342, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1343, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1344, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1345, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1346, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1347, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1348, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1349, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1350, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1351, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1352, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1353, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1354, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1355, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1356, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1357, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1358, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1359, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1360, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1361, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1362, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1363, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1364, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1365, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1366, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1367, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1368, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1369, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1370, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1371, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1372, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1373, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1374, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1375, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1376, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1377, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1378, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1379, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1380, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1381, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1382, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1383, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1384, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1385, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1386, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1387, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1388, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1389, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1390, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1391, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1392, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1393, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1394, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1395, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1396, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1397, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1398, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1399, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1400, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1401, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1402, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1403, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1404, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1405, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1406, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1407, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1408, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1409, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1410, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1411, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1412, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1413, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1414, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1415, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1416, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1417, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1418, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1419, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1420, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1421, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1422, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1423, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1424, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1425, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1426, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1427, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1428, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1429, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1430, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1431, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1432, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1433, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1434, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1435, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1436, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1437, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1438, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1439, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1440, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1441, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1442, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1443, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1444, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1445, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1446, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1447, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1448, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1449, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1450, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1451, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1452, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1453, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1454, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1455, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1456, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1457, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1458, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1459, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1460, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1461, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1462, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1463, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1464, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1465, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1466, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1467, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1468, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1469, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1470, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1471, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1472, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1473, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1474, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1475, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1476, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1477, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1478, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1479, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1480, 'Продажа', '03.09.2023', 18000, 3, 3, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1481, 'Покупка', '21.06.2020', 50000, 5, 6, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1482, 'Продажа', '27.06.2020', 2000, 4, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1483, 'Дивиденды', '20.06.2020', 100, 4, 6, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1484, 'Покупка', '10.12.2020', 100, 4, 4, 4);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1485, 'Покупка', '03.09.2021', 10000, 2, 2, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1486, 'Покупка', '06.08.2022', 200000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1487, 'Продажа', '13.06.2021', 60000, 1, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1488, 'Покупка', '23.09.2021', 30000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1489, 'Покупка', '12.10.2021', 8000, 2, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1490, 'Покупка', '23.03.2023', 13000, 3, 3, 3);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1491, 'Продажа', '27.06.2023', 3000, 2, 1, 1);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1492, 'Дивиденды', '03.09.2021', 100000, 5, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1493, 'Покупка', '03.09.2021', 60000, 2, 5, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1494, 'Покупка', '03.09.2021', 10000, 1, 4, 2);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1495, 'Покупка', '13.08.2022', 20000, 5, 6, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1496, 'Дивиденды', '03.09.2023', 100000, 2, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1497, 'Дивиденды', '03.09.2020', 12000, 2, 3, 7);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1498, 'Продажа', '03.09.2023', 10200, 5, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1499, 'Дивиденды', '03.09.2023', 1900, 4, 2, 6);
INSERT INTO public.transactions (id, transactiontype, transactiondate, transactionamount, stockholder_id, certificate_id, stock_id) VALUES (1500, 'Продажа', '03.09.2023', 18000, 3, 3, 6);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 215
-- Name: certificates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.certificates_id_seq', 6, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 209
-- Name: stockholders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.stockholders_id_seq', 5, true);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 213
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.stocks_id_seq', 7, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 211
-- Name: stocktype_id_type_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.stocktype_id_type_seq', 2, true);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 217
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.transactions_id_seq', 1500, true);


--
-- TOC entry 3203 (class 2606 OID 16507)
-- Name: certificates certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 16481)
-- Name: stockholders stockholders_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.stockholders
    ADD CONSTRAINT stockholders_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 16495)
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 16488)
-- Name: stocktype stocktype_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.stocktype
    ADD CONSTRAINT stocktype_pkey PRIMARY KEY (id);


--
-- TOC entry 3205 (class 2606 OID 16514)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 16535)
-- Name: stocks stocks_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.stocktype(id) NOT VALID;


--
-- TOC entry 3207 (class 2606 OID 16520)
-- Name: transactions transactions_certificate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_certificate_id_fkey FOREIGN KEY (certificate_id) REFERENCES public.certificates(id) ON DELETE CASCADE;


--
-- TOC entry 3208 (class 2606 OID 16530)
-- Name: transactions transactions_stock_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_stock_id_fkey FOREIGN KEY (stock_id) REFERENCES public.stocks(id) NOT VALID;


--
-- TOC entry 3209 (class 2606 OID 16515)
-- Name: transactions transactions_stockholder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_stockholder_id_fkey FOREIGN KEY (stockholder_id) REFERENCES public.stockholders(id) ON DELETE CASCADE;


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-09-24 20:27:13

--
-- PostgreSQL database dump complete
--


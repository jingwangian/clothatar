--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
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

--
-- Name: avatar_data; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE avatar_data AS (
        head_to_foot real,
        bust real,
        waist real,
        hips real,
        neck_to_wrist_bent real,
        inside_neck_to_waist real,
        waist_to_ankle real
);


ALTER TYPE avatar_data OWNER TO postgres;



--
-- Name: compare_absolute(real, real); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION compare_absolute(p real, c real) RETURNS avatar_data
    LANGUAGE sql
    AS $$

select

(person.head_to_foot-clothing.head_to_foot),
(person.bust-clothing.bust),
(person.waist-clothing.waist),
(person.hips-clothing.hips),
(person.neck_to_wrist_bent-clothing.neck_to_wrist_bent),
(person.inside_neck_to_waist-clothing.inside_neck_to_waist),
(person.waist_to_ankle-clothing.waist_to_ankle)

from avatar as person , avatar as clothing

where person.avatar_id = p and clothing.avatar_id = c;

$$;


ALTER FUNCTION public.compare_absolute(p real, c real) OWNER TO postgres;

--
-- Name: pdiff(real, real); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pdiff(v1 real, v2 real) RETURNS real
    LANGUAGE plpgsql
    AS $$

DECLARE
        difference real;
BEGIN
        difference := (( @ v1 - v2) / ((v1+v2)/2.0 )) * 100.0;
        return difference;
END

$$;


ALTER FUNCTION public.pdiff(v1 real, v2 real) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: avatar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE avatar (
    avatar_id integer NOT NULL,
    avatar_type character(1),
    head_to_foot real,
    bust real,
    waist real,
    hips real,
    neck_to_wrist_bent real,
    inside_neck_to_waist real,
    waist_to_ankle real,
    CONSTRAINT avatar_avatar_type_check CHECK (((avatar_type = 'P'::bpchar) OR (avatar_type = 'C'::bpchar)))
);


ALTER TABLE avatar OWNER TO postgres;

--
-- Name: avatar_avatar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE avatar_avatar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE avatar_avatar_id_seq OWNER TO postgres;

--
-- Name: avatar_avatar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE avatar_avatar_id_seq OWNED BY avatar.avatar_id;


--
-- Name: avatar avatar_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avatar ALTER COLUMN avatar_id SET DEFAULT nextval('avatar_avatar_id_seq'::regclass);


--
-- Data for Name: avatar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY avatar (avatar_id, avatar_type, head_to_foot, bust, waist, hips, neck_to_wrist_bent, inside_neck_to_waist, waist_to_ankle) FROM stdin;
1       P       189     45.4000015      85.4000015      92.0999985      75      70      81.1999969
2       C       179     75.4000015      66.1999969      92.0999985      75      92      83.6999969
\.


--
-- Name: avatar_avatar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('avatar_avatar_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

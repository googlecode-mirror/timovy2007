--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- Name: tablefunc_crosstab_2; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_2 AS (
	row_name text,
	category_1 text,
	category_2 text
);


ALTER TYPE public.tablefunc_crosstab_2 OWNER TO postgres;

--
-- Name: tablefunc_crosstab_3; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_3 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text
);


ALTER TYPE public.tablefunc_crosstab_3 OWNER TO postgres;

--
-- Name: tablefunc_crosstab_4; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_4 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text,
	category_4 text
);


ALTER TYPE public.tablefunc_crosstab_4 OWNER TO postgres;

--
-- Name: connectby(text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, integer, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.connectby(text, text, text, text, integer, text) OWNER TO postgres;

--
-- Name: connectby(text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.connectby(text, text, text, text, integer) OWNER TO postgres;

--
-- Name: connectby(text, text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, text, integer, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.connectby(text, text, text, text, text, integer, text) OWNER TO postgres;

--
-- Name: connectby(text, text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.connectby(text, text, text, text, text, integer) OWNER TO postgres;

--
-- Name: crosstab(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab(text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab(text) OWNER TO postgres;

--
-- Name: crosstab(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab(text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab(text, integer) OWNER TO postgres;

--
-- Name: crosstab(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab(text, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab_hash'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab(text, text) OWNER TO postgres;

--
-- Name: crosstab2(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab2(text) RETURNS SETOF tablefunc_crosstab_2
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab2(text) OWNER TO postgres;

--
-- Name: crosstab3(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab3(text) RETURNS SETOF tablefunc_crosstab_3
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab3(text) OWNER TO postgres;

--
-- Name: crosstab4(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab4(text) RETURNS SETOF tablefunc_crosstab_4
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab4(text) OWNER TO postgres;

--
-- Name: insert_username(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION insert_username() RETURNS "trigger"
    AS '$libdir/insert_username', 'insert_username'
    LANGUAGE c;


ALTER FUNCTION public.insert_username() OWNER TO postgres;

--
-- Name: normal_rand(integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION normal_rand(integer, double precision, double precision) RETURNS SETOF double precision
    AS '$libdir/tablefunc', 'normal_rand'
    LANGUAGE c STRICT;


ALTER FUNCTION public.normal_rand(integer, double precision, double precision) OWNER TO postgres;

--
-- Name: ssl_client_cert_present(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_client_cert_present() RETURNS boolean
    AS '$libdir/sslinfo', 'ssl_client_cert_present'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_cert_present() OWNER TO postgres;

--
-- Name: ssl_client_dn(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_client_dn() RETURNS text
    AS '$libdir/sslinfo', 'ssl_client_dn'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_dn() OWNER TO postgres;

--
-- Name: ssl_client_dn_field(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_client_dn_field(text) RETURNS text
    AS '$libdir/sslinfo', 'ssl_client_dn_field'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_dn_field(text) OWNER TO postgres;

--
-- Name: ssl_client_serial(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_client_serial() RETURNS numeric
    AS '$libdir/sslinfo', 'ssl_client_serial'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_serial() OWNER TO postgres;

--
-- Name: ssl_is_used(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_is_used() RETURNS boolean
    AS '$libdir/sslinfo', 'ssl_is_used'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_is_used() OWNER TO postgres;

--
-- Name: ssl_issuer_dn(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_issuer_dn() RETURNS text
    AS '$libdir/sslinfo', 'ssl_issuer_dn'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_issuer_dn() OWNER TO postgres;

--
-- Name: ssl_issuer_field(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_issuer_field(text) RETURNS text
    AS '$libdir/sslinfo', 'ssl_issuer_field'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_issuer_field(text) OWNER TO postgres;

--
-- Name: xml_encode_special_chars(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xml_encode_special_chars(text) RETURNS text
    AS '$libdir/pgxml', 'xml_encode_special_chars'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xml_encode_special_chars(text) OWNER TO postgres;

--
-- Name: xml_is_well_formed(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xml_is_well_formed(text) RETURNS boolean
    AS '$libdir/pgxml', 'xml_is_well_formed'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xml_is_well_formed(text) OWNER TO postgres;

--
-- Name: xml_valid(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xml_valid(text) RETURNS boolean
    AS '$libdir/pgxml', 'xml_is_well_formed'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xml_valid(text) OWNER TO postgres;

--
-- Name: xpath_bool(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_bool(text, text) RETURNS boolean
    AS '$libdir/pgxml', 'xpath_bool'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_bool(text, text) OWNER TO postgres;

--
-- Name: xpath_list(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_list(text, text, text) RETURNS text
    AS '$libdir/pgxml', 'xpath_list'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_list(text, text, text) OWNER TO postgres;

--
-- Name: xpath_list(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_list(text, text) RETURNS text
    AS $_$SELECT xpath_list($1,$2,',')$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_list(text, text) OWNER TO postgres;

--
-- Name: xpath_nodeset(text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_nodeset(text, text, text, text) RETURNS text
    AS '$libdir/pgxml', 'xpath_nodeset'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_nodeset(text, text, text, text) OWNER TO postgres;

--
-- Name: xpath_nodeset(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_nodeset(text, text) RETURNS text
    AS $_$SELECT xpath_nodeset($1,$2,'','')$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_nodeset(text, text) OWNER TO postgres;

--
-- Name: xpath_nodeset(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_nodeset(text, text, text) RETURNS text
    AS $_$SELECT xpath_nodeset($1,$2,'',$3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_nodeset(text, text, text) OWNER TO postgres;

--
-- Name: xpath_number(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_number(text, text) RETURNS real
    AS '$libdir/pgxml', 'xpath_number'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_number(text, text) OWNER TO postgres;

--
-- Name: xpath_string(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_string(text, text) RETURNS text
    AS '$libdir/pgxml', 'xpath_string'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_string(text, text) OWNER TO postgres;

--
-- Name: xpath_table(text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_table(text, text, text, text, text) RETURNS SETOF record
    AS '$libdir/pgxml', 'xpath_table'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.xpath_table(text, text, text, text, text) OWNER TO postgres;

--
-- Name: xslt_process(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xslt_process(text, text, text) RETURNS text
    AS '$libdir/pgxml', 'xslt_process'
    LANGUAGE c STRICT;


ALTER FUNCTION public.xslt_process(text, text, text) OWNER TO postgres;

--
-- Name: xslt_process(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xslt_process(text, text) RETURNS text
    AS '$libdir/pgxml', 'xslt_process'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xslt_process(text, text) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: academics; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE academics (
    id integer NOT NULL
);


ALTER TABLE public.academics OWNER TO team14;

--
-- Name: academics_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE academics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.academics_id_seq OWNER TO team14;

--
-- Name: academics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE academics_id_seq OWNED BY academics.id;


--
-- Name: academics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('academics_id_seq', 1, false);


--
-- Name: clearances; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE clearances (
    id integer NOT NULL,
    "key" character varying(64) NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    parent_id integer
);


ALTER TABLE public.clearances OWNER TO team14;

--
-- Name: clearances_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE clearances_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.clearances_id_seq OWNER TO team14;

--
-- Name: clearances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE clearances_id_seq OWNED BY clearances.id;


--
-- Name: clearances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('clearances_id_seq', 8, true);


--
-- Name: graduates; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE graduates (
    id integer NOT NULL,
    specialization_id integer NOT NULL,
    finish_year character varying(64)
);


ALTER TABLE public.graduates OWNER TO team14;

--
-- Name: languages; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE languages (
    id integer NOT NULL,
    name_sk character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL
);


ALTER TABLE public.languages OWNER TO team14;

--
-- Name: TABLE languages; Type: COMMENT; Schema: public; Owner: team14
--

COMMENT ON TABLE languages IS 'languages for user_languages';


--
-- Name: levels; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE levels (
    id integer NOT NULL,
    name_sk character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL
);


ALTER TABLE public.levels OWNER TO team14;

--
-- Name: TABLE levels; Type: COMMENT; Schema: public; Owner: team14
--

COMMENT ON TABLE levels IS 'level for user_languages';


--
-- Name: login_history; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE login_history (
    id integer NOT NULL,
    user_id integer NOT NULL,
    ip character varying(255),
    login_time timestamp without time zone NOT NULL
);


ALTER TABLE public.login_history OWNER TO team14;

--
-- Name: login_history_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE login_history_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.login_history_id_seq OWNER TO team14;

--
-- Name: login_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE login_history_id_seq OWNED BY login_history.id;


--
-- Name: login_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('login_history_id_seq', 19, true);


--
-- Name: mail_address_groups; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE mail_address_groups (
    id integer NOT NULL,
    mail_id integer NOT NULL,
    mail_group_id integer NOT NULL
);


ALTER TABLE public.mail_address_groups OWNER TO team14;

--
-- Name: mail_address_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE mail_address_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.mail_address_groups_id_seq OWNER TO team14;

--
-- Name: mail_address_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE mail_address_groups_id_seq OWNED BY mail_address_groups.id;


--
-- Name: mail_address_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('mail_address_groups_id_seq', 1, false);


--
-- Name: mail_address_users; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE mail_address_users (
    id integer NOT NULL,
    mail_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.mail_address_users OWNER TO team14;

--
-- Name: mail_address_users_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE mail_address_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.mail_address_users_id_seq OWNER TO team14;

--
-- Name: mail_address_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE mail_address_users_id_seq OWNED BY mail_address_users.id;


--
-- Name: mail_address_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('mail_address_users_id_seq', 1, false);


--
-- Name: mail_group_users; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE mail_group_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    mail_group_id integer NOT NULL
);


ALTER TABLE public.mail_group_users OWNER TO team14;

--
-- Name: mail_group_users_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE mail_group_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.mail_group_users_id_seq OWNER TO team14;

--
-- Name: mail_group_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE mail_group_users_id_seq OWNED BY mail_group_users.id;


--
-- Name: mail_group_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('mail_group_users_id_seq', 1, false);


--
-- Name: mail_groups; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE mail_groups (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.mail_groups OWNER TO team14;

--
-- Name: mail_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE mail_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.mail_groups_id_seq OWNER TO team14;

--
-- Name: mail_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE mail_groups_id_seq OWNED BY mail_groups.id;


--
-- Name: mail_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('mail_groups_id_seq', 1, false);


--
-- Name: mails; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE mails (
    id integer NOT NULL,
    user_id integer NOT NULL,
    subject character varying(255) NOT NULL,
    body text NOT NULL,
    date_send timestamp without time zone NOT NULL
);


ALTER TABLE public.mails OWNER TO team14;

--
-- Name: mails_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE mails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.mails_id_seq OWNER TO team14;

--
-- Name: mails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE mails_id_seq OWNED BY mails.id;


--
-- Name: mails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('mails_id_seq', 1, false);


--
-- Name: news; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE news (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    title_en character varying(255) NOT NULL,
    body text NOT NULL,
    body_en text NOT NULL,
    created date,
    modified date,
    user_id integer NOT NULL
);


ALTER TABLE public.news OWNER TO team14;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE news_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO team14;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE news_id_seq OWNED BY news.id;


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('news_id_seq', 1, true);


--
-- Name: posts; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    title character varying(50),
    body text,
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone
);


ALTER TABLE public.posts OWNER TO team14;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE posts_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO team14;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('posts_id_seq', 3, true);


--
-- Name: professions; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE professions (
    id integer NOT NULL,
    name_sk character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL
);


ALTER TABLE public.professions OWNER TO team14;

--
-- Name: project_types; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE project_types (
    id character varying(2) NOT NULL,
    name character varying(64),
    name_en character varying(64)
);


ALTER TABLE public.project_types OWNER TO team14;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    project_type_id character varying(2),
    academic_id integer,
    master_academic_id integer,
    graduate_id integer NOT NULL,
    study_year character varying(64) NOT NULL,
    name character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL,
    description text,
    description_en text,
    specialization_id integer NOT NULL
);


ALTER TABLE public.projects OWNER TO team14;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE projects_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO team14;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('projects_id_seq', 793, true);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text
);


ALTER TABLE public.roles OWNER TO team14;

--
-- Name: roles_clearances; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE roles_clearances (
    id integer NOT NULL,
    role_id integer NOT NULL,
    clearance_id integer NOT NULL
);


ALTER TABLE public.roles_clearances OWNER TO team14;

--
-- Name: roles_clearances_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE roles_clearances_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.roles_clearances_id_seq OWNER TO team14;

--
-- Name: roles_clearances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE roles_clearances_id_seq OWNED BY roles_clearances.id;


--
-- Name: roles_clearances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('roles_clearances_id_seq', 14, true);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE roles_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO team14;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('roles_id_seq', 3, true);


--
-- Name: specializations; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE specializations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    study_type_id integer
);


ALTER TABLE public.specializations OWNER TO team14;

--
-- Name: specializations_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE specializations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.specializations_id_seq OWNER TO team14;

--
-- Name: specializations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE specializations_id_seq OWNED BY specializations.id;


--
-- Name: specializations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('specializations_id_seq', 1, false);


--
-- Name: study_types; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE study_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    priority integer NOT NULL
);


ALTER TABLE public.study_types OWNER TO team14;

--
-- Name: study_types_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE study_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.study_types_id_seq OWNER TO team14;

--
-- Name: study_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE study_types_id_seq OWNED BY study_types.id;


--
-- Name: study_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('study_types_id_seq', 3, true);


--
-- Name: user_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE user_languages_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.user_languages_id_seq OWNER TO team14;

--
-- Name: user_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('user_languages_id_seq', 10, true);


--
-- Name: user_languages; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE user_languages (
    id integer DEFAULT nextval('user_languages_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    language_id integer NOT NULL,
    level_id integer
);


ALTER TABLE public.user_languages OWNER TO team14;

--
-- Name: TABLE user_languages; Type: COMMENT; Schema: public; Owner: team14
--

COMMENT ON TABLE user_languages IS 'relations for user. language and level';


--
-- Name: user_mail_states; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE user_mail_states (
    id character varying(32) NOT NULL
);


ALTER TABLE public.user_mail_states OWNER TO team14;

--
-- Name: user_mails; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE user_mails (
    id integer NOT NULL,
    user_id integer NOT NULL,
    mail_id integer NOT NULL,
    user_mail_state_id character varying(32) NOT NULL
);


ALTER TABLE public.user_mails OWNER TO team14;

--
-- Name: user_mails_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE user_mails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.user_mails_id_seq OWNER TO team14;

--
-- Name: user_mails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE user_mails_id_seq OWNED BY user_mails.id;


--
-- Name: user_mails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('user_mails_id_seq', 1, false);


--
-- Name: user_professions; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE user_professions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    profession_id integer NOT NULL,
    year_from integer,
    year_to integer,
    description_sk text,
    description_en text
);


ALTER TABLE public.user_professions OWNER TO team14;

--
-- Name: user_professions_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE user_professions_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.user_professions_id_seq OWNER TO team14;

--
-- Name: user_professions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE user_professions_id_seq OWNED BY user_professions.id;


--
-- Name: user_professions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('user_professions_id_seq', 4, true);


--
-- Name: users; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    personal_number character varying(32),
    username character varying(255) NOT NULL,
    ldapname character varying(255),
    "password" character varying(32) NOT NULL,
    first_name character varying(255) NOT NULL,
    middle_name character varying(255),
    last_name character varying(255) NOT NULL,
    title character varying(64),
    email character varying(255),
    address text,
    phone character varying(64),
    icq character varying(54),
    occupation character varying(255),
    forward_mail character varying(255),
    mail_listing integer DEFAULT 20 NOT NULL,
    publish_email smallint DEFAULT 0
);


ALTER TABLE public.users OWNER TO team14;

--
-- Name: users_clearances; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE users_clearances (
    id integer NOT NULL,
    user_id integer NOT NULL,
    clearance_id integer NOT NULL,
    "access" character varying(5) DEFAULT 'allow'::character varying NOT NULL,
    CONSTRAINT users_clearances_access_check CHECK ((("access")::text = ANY ((ARRAY['allow'::character varying, 'deny'::character varying])::text[])))
);


ALTER TABLE public.users_clearances OWNER TO team14;

--
-- Name: users_clearances_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE users_clearances_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_clearances_id_seq OWNER TO team14;

--
-- Name: users_clearances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE users_clearances_id_seq OWNED BY users_clearances.id;


--
-- Name: users_clearances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('users_clearances_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE users_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO team14;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('users_id_seq', 705, true);


--
-- Name: users_online; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE users_online (
    id integer NOT NULL,
    session_id character varying(255) NOT NULL,
    user_id integer NOT NULL,
    session_start timestamp without time zone NOT NULL,
    session_last_refresh timestamp without time zone
);


ALTER TABLE public.users_online OWNER TO team14;

--
-- Name: users_online_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE users_online_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_online_id_seq OWNER TO team14;

--
-- Name: users_online_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE users_online_id_seq OWNED BY users_online.id;


--
-- Name: users_online_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('users_online_id_seq', 19, true);


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE users_roles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.users_roles OWNER TO team14;

--
-- Name: users_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE users_roles_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_roles_id_seq OWNER TO team14;

--
-- Name: users_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE users_roles_id_seq OWNED BY users_roles.id;


--
-- Name: users_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('users_roles_id_seq', 632, true);


--
-- Name: wall_posters; Type: TABLE; Schema: public; Owner: team14; Tablespace: 
--

CREATE TABLE wall_posters (
    id integer NOT NULL,
    title character varying(255),
    text text,
    valid_from date,
    valid_until date,
    new_title character varying(255),
    new_text text,
    new_valid_from date,
    new_valid_until date,
    refusal_text text,
    created timestamp without time zone NOT NULL,
    changed timestamp without time zone,
    refused timestamp without time zone,
    is_changed boolean DEFAULT false,
    is_refused boolean DEFAULT false,
    is_deleted boolean DEFAULT false,
    operation character(1),
    user_id integer NOT NULL
);


ALTER TABLE public.wall_posters OWNER TO team14;

--
-- Name: wall_posters_id_seq; Type: SEQUENCE; Schema: public; Owner: team14
--

CREATE SEQUENCE wall_posters_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wall_posters_id_seq OWNER TO team14;

--
-- Name: wall_posters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: team14
--

ALTER SEQUENCE wall_posters_id_seq OWNED BY wall_posters.id;


--
-- Name: wall_posters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: team14
--

SELECT pg_catalog.setval('wall_posters_id_seq', 9, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE academics ALTER COLUMN id SET DEFAULT nextval('academics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE clearances ALTER COLUMN id SET DEFAULT nextval('clearances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE login_history ALTER COLUMN id SET DEFAULT nextval('login_history_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE mail_address_groups ALTER COLUMN id SET DEFAULT nextval('mail_address_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE mail_address_users ALTER COLUMN id SET DEFAULT nextval('mail_address_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE mail_group_users ALTER COLUMN id SET DEFAULT nextval('mail_group_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE mail_groups ALTER COLUMN id SET DEFAULT nextval('mail_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE mails ALTER COLUMN id SET DEFAULT nextval('mails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE roles_clearances ALTER COLUMN id SET DEFAULT nextval('roles_clearances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE specializations ALTER COLUMN id SET DEFAULT nextval('specializations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE study_types ALTER COLUMN id SET DEFAULT nextval('study_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE user_mails ALTER COLUMN id SET DEFAULT nextval('user_mails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE user_professions ALTER COLUMN id SET DEFAULT nextval('user_professions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE users_clearances ALTER COLUMN id SET DEFAULT nextval('users_clearances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE users_online ALTER COLUMN id SET DEFAULT nextval('users_online_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE users_roles ALTER COLUMN id SET DEFAULT nextval('users_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: team14
--

ALTER TABLE wall_posters ALTER COLUMN id SET DEFAULT nextval('wall_posters_id_seq'::regclass);


--
-- Data for Name: academics; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO academics VALUES (563);
INSERT INTO academics VALUES (24);
INSERT INTO academics VALUES (17);
INSERT INTO academics VALUES (660);
INSERT INTO academics VALUES (358);
INSERT INTO academics VALUES (674);
INSERT INTO academics VALUES (40);
INSERT INTO academics VALUES (360);
INSERT INTO academics VALUES (579);
INSERT INTO academics VALUES (541);
INSERT INTO academics VALUES (655);
INSERT INTO academics VALUES (301);
INSERT INTO academics VALUES (13);
INSERT INTO academics VALUES (431);
INSERT INTO academics VALUES (375);
INSERT INTO academics VALUES (359);
INSERT INTO academics VALUES (361);
INSERT INTO academics VALUES (382);
INSERT INTO academics VALUES (437);
INSERT INTO academics VALUES (704);
INSERT INTO academics VALUES (374);
INSERT INTO academics VALUES (16);
INSERT INTO academics VALUES (27);
INSERT INTO academics VALUES (566);
INSERT INTO academics VALUES (517);
INSERT INTO academics VALUES (388);
INSERT INTO academics VALUES (20);
INSERT INTO academics VALUES (97);
INSERT INTO academics VALUES (433);
INSERT INTO academics VALUES (43);
INSERT INTO academics VALUES (98);
INSERT INTO academics VALUES (31);
INSERT INTO academics VALUES (10);
INSERT INTO academics VALUES (294);
INSERT INTO academics VALUES (11);
INSERT INTO academics VALUES (297);
INSERT INTO academics VALUES (447);
INSERT INTO academics VALUES (260);
INSERT INTO academics VALUES (584);
INSERT INTO academics VALUES (588);
INSERT INTO academics VALUES (357);
INSERT INTO academics VALUES (25);
INSERT INTO academics VALUES (298);
INSERT INTO academics VALUES (19);
INSERT INTO academics VALUES (270);
INSERT INTO academics VALUES (401);
INSERT INTO academics VALUES (387);
INSERT INTO academics VALUES (215);
INSERT INTO academics VALUES (46);
INSERT INTO academics VALUES (557);
INSERT INTO academics VALUES (705);
INSERT INTO academics VALUES (672);
INSERT INTO academics VALUES (95);
INSERT INTO academics VALUES (422);
INSERT INTO academics VALUES (342);
INSERT INTO academics VALUES (188);
INSERT INTO academics VALUES (400);
INSERT INTO academics VALUES (417);
INSERT INTO academics VALUES (219);
INSERT INTO academics VALUES (562);
INSERT INTO academics VALUES (221);
INSERT INTO academics VALUES (396);
INSERT INTO academics VALUES (436);
INSERT INTO academics VALUES (92);
INSERT INTO academics VALUES (272);
INSERT INTO academics VALUES (253);
INSERT INTO academics VALUES (44);
INSERT INTO academics VALUES (235);
INSERT INTO academics VALUES (247);
INSERT INTO academics VALUES (236);
INSERT INTO academics VALUES (237);
INSERT INTO academics VALUES (670);
INSERT INTO academics VALUES (690);
INSERT INTO academics VALUES (12);
INSERT INTO academics VALUES (569);
INSERT INTO academics VALUES (445);
INSERT INTO academics VALUES (35);
INSERT INTO academics VALUES (299);
INSERT INTO academics VALUES (419);
INSERT INTO academics VALUES (412);
INSERT INTO academics VALUES (250);
INSERT INTO academics VALUES (673);
INSERT INTO academics VALUES (218);
INSERT INTO academics VALUES (252);
INSERT INTO academics VALUES (549);
INSERT INTO academics VALUES (580);
INSERT INTO academics VALUES (96);
INSERT INTO academics VALUES (160);
INSERT INTO academics VALUES (548);
INSERT INTO academics VALUES (545);
INSERT INTO academics VALUES (551);
INSERT INTO academics VALUES (33);
INSERT INTO academics VALUES (612);
INSERT INTO academics VALUES (47);
INSERT INTO academics VALUES (220);
INSERT INTO academics VALUES (397);


--
-- Data for Name: clearances; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO clearances VALUES (1, 'IMPORT', 'Importovanie dat', 'Importovanie dat zo systmu yonban', NULL);
INSERT INTO clearances VALUES (2, 'MAIL_WRITE', 'Zasielanie sprav', 'Moze zasielat spravy ostatnym pouzivatelom', NULL);
INSERT INTO clearances VALUES (3, 'WALL_POSTER_WRITE', 'Wall Poster Write', 'Prispievanie na nastenku', NULL);
INSERT INTO clearances VALUES (4, 'WALL_POSTER_ADMIN', 'Wall Poster Admin', 'Manazovanie nastenky', NULL);
INSERT INTO clearances VALUES (5, 'MANAGE_USERS', 'User & Permission management', 'Manazovanie pouzivatelov a ich prav', 1);
INSERT INTO clearances VALUES (8, 'MANAGE_NEWS', 'Actualities management', 'Manazovanie aktualít', NULL);


--
-- Data for Name: graduates; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO graduates VALUES (5, 0, NULL);
INSERT INTO graduates VALUES (7, 4, NULL);
INSERT INTO graduates VALUES (8, 1, NULL);
INSERT INTO graduates VALUES (9, 0, NULL);
INSERT INTO graduates VALUES (14, 1, NULL);
INSERT INTO graduates VALUES (18, 0, NULL);
INSERT INTO graduates VALUES (21, 1, NULL);
INSERT INTO graduates VALUES (22, 1, NULL);
INSERT INTO graduates VALUES (28, 1, NULL);
INSERT INTO graduates VALUES (29, 0, NULL);
INSERT INTO graduates VALUES (30, 1, NULL);
INSERT INTO graduates VALUES (32, 0, NULL);
INSERT INTO graduates VALUES (34, 0, NULL);
INSERT INTO graduates VALUES (37, 0, NULL);
INSERT INTO graduates VALUES (38, 4, NULL);
INSERT INTO graduates VALUES (39, 1, NULL);
INSERT INTO graduates VALUES (41, 1, NULL);
INSERT INTO graduates VALUES (42, 4, NULL);
INSERT INTO graduates VALUES (45, 0, NULL);
INSERT INTO graduates VALUES (48, 1, NULL);
INSERT INTO graduates VALUES (49, 1, NULL);
INSERT INTO graduates VALUES (50, 4, NULL);
INSERT INTO graduates VALUES (51, 4, NULL);
INSERT INTO graduates VALUES (52, 1, NULL);
INSERT INTO graduates VALUES (53, 1, NULL);
INSERT INTO graduates VALUES (54, 1, NULL);
INSERT INTO graduates VALUES (55, 1, NULL);
INSERT INTO graduates VALUES (56, 4, NULL);
INSERT INTO graduates VALUES (57, 1, NULL);
INSERT INTO graduates VALUES (58, 1, NULL);
INSERT INTO graduates VALUES (59, 1, NULL);
INSERT INTO graduates VALUES (60, 1, NULL);
INSERT INTO graduates VALUES (61, 1, NULL);
INSERT INTO graduates VALUES (62, 1, NULL);
INSERT INTO graduates VALUES (63, 1, NULL);
INSERT INTO graduates VALUES (64, 1, NULL);
INSERT INTO graduates VALUES (65, 1, NULL);
INSERT INTO graduates VALUES (66, 1, NULL);
INSERT INTO graduates VALUES (67, 1, NULL);
INSERT INTO graduates VALUES (68, 0, NULL);
INSERT INTO graduates VALUES (69, 0, NULL);
INSERT INTO graduates VALUES (70, 0, NULL);
INSERT INTO graduates VALUES (71, 0, NULL);
INSERT INTO graduates VALUES (72, 0, NULL);
INSERT INTO graduates VALUES (73, 0, NULL);
INSERT INTO graduates VALUES (74, 0, NULL);
INSERT INTO graduates VALUES (75, 0, NULL);
INSERT INTO graduates VALUES (76, 0, NULL);
INSERT INTO graduates VALUES (78, 1, NULL);
INSERT INTO graduates VALUES (80, 0, NULL);
INSERT INTO graduates VALUES (81, 0, NULL);
INSERT INTO graduates VALUES (83, 1, NULL);
INSERT INTO graduates VALUES (85, 0, NULL);
INSERT INTO graduates VALUES (86, 0, NULL);
INSERT INTO graduates VALUES (87, 1, NULL);
INSERT INTO graduates VALUES (88, 1, NULL);
INSERT INTO graduates VALUES (89, 1, NULL);
INSERT INTO graduates VALUES (90, 1, NULL);
INSERT INTO graduates VALUES (93, 1, NULL);
INSERT INTO graduates VALUES (94, 1, NULL);
INSERT INTO graduates VALUES (99, 0, NULL);
INSERT INTO graduates VALUES (100, 0, NULL);
INSERT INTO graduates VALUES (101, 0, NULL);
INSERT INTO graduates VALUES (102, 0, NULL);
INSERT INTO graduates VALUES (103, 0, NULL);
INSERT INTO graduates VALUES (104, 1, NULL);
INSERT INTO graduates VALUES (105, 1, NULL);
INSERT INTO graduates VALUES (106, 1, NULL);
INSERT INTO graduates VALUES (108, 1, NULL);
INSERT INTO graduates VALUES (109, 1, NULL);
INSERT INTO graduates VALUES (110, 0, NULL);
INSERT INTO graduates VALUES (111, 1, NULL);
INSERT INTO graduates VALUES (113, 0, NULL);
INSERT INTO graduates VALUES (114, 0, NULL);
INSERT INTO graduates VALUES (115, 1, NULL);
INSERT INTO graduates VALUES (116, 1, NULL);
INSERT INTO graduates VALUES (117, 1, NULL);
INSERT INTO graduates VALUES (118, 1, NULL);
INSERT INTO graduates VALUES (119, 1, NULL);
INSERT INTO graduates VALUES (120, 1, NULL);
INSERT INTO graduates VALUES (121, 4, NULL);
INSERT INTO graduates VALUES (122, 1, NULL);
INSERT INTO graduates VALUES (123, 0, NULL);
INSERT INTO graduates VALUES (124, 1, NULL);
INSERT INTO graduates VALUES (125, 1, NULL);
INSERT INTO graduates VALUES (127, 0, NULL);
INSERT INTO graduates VALUES (128, 0, NULL);
INSERT INTO graduates VALUES (129, 1, NULL);
INSERT INTO graduates VALUES (130, 1, NULL);
INSERT INTO graduates VALUES (131, 1, NULL);
INSERT INTO graduates VALUES (132, 1, NULL);
INSERT INTO graduates VALUES (133, 0, NULL);
INSERT INTO graduates VALUES (134, 0, NULL);
INSERT INTO graduates VALUES (135, 1, NULL);
INSERT INTO graduates VALUES (136, 1, NULL);
INSERT INTO graduates VALUES (137, 0, NULL);
INSERT INTO graduates VALUES (138, 0, NULL);
INSERT INTO graduates VALUES (139, 1, NULL);
INSERT INTO graduates VALUES (140, 1, NULL);
INSERT INTO graduates VALUES (141, 1, NULL);
INSERT INTO graduates VALUES (143, 1, NULL);
INSERT INTO graduates VALUES (145, 0, NULL);
INSERT INTO graduates VALUES (146, 1, NULL);
INSERT INTO graduates VALUES (147, 1, NULL);
INSERT INTO graduates VALUES (148, 1, NULL);
INSERT INTO graduates VALUES (150, 1, NULL);
INSERT INTO graduates VALUES (152, 1, NULL);
INSERT INTO graduates VALUES (154, 0, NULL);
INSERT INTO graduates VALUES (155, 1, NULL);
INSERT INTO graduates VALUES (156, 0, NULL);
INSERT INTO graduates VALUES (157, 1, NULL);
INSERT INTO graduates VALUES (159, 1, NULL);
INSERT INTO graduates VALUES (161, 1, NULL);
INSERT INTO graduates VALUES (162, 1, NULL);
INSERT INTO graduates VALUES (163, 1, NULL);
INSERT INTO graduates VALUES (164, 0, NULL);
INSERT INTO graduates VALUES (165, 1, NULL);
INSERT INTO graduates VALUES (166, 0, NULL);
INSERT INTO graduates VALUES (167, 1, NULL);
INSERT INTO graduates VALUES (168, 1, NULL);
INSERT INTO graduates VALUES (169, 1, NULL);
INSERT INTO graduates VALUES (170, 1, NULL);
INSERT INTO graduates VALUES (171, 0, NULL);
INSERT INTO graduates VALUES (172, 0, NULL);
INSERT INTO graduates VALUES (173, 1, NULL);
INSERT INTO graduates VALUES (174, 1, NULL);
INSERT INTO graduates VALUES (176, 1, NULL);
INSERT INTO graduates VALUES (177, 0, NULL);
INSERT INTO graduates VALUES (178, 0, NULL);
INSERT INTO graduates VALUES (179, 1, NULL);
INSERT INTO graduates VALUES (180, 1, NULL);
INSERT INTO graduates VALUES (181, 1, NULL);
INSERT INTO graduates VALUES (182, 1, NULL);
INSERT INTO graduates VALUES (183, 0, NULL);
INSERT INTO graduates VALUES (185, 1, NULL);
INSERT INTO graduates VALUES (186, 1, NULL);
INSERT INTO graduates VALUES (187, 0, NULL);
INSERT INTO graduates VALUES (189, 0, NULL);
INSERT INTO graduates VALUES (190, 1, NULL);
INSERT INTO graduates VALUES (191, 0, NULL);
INSERT INTO graduates VALUES (192, 1, NULL);
INSERT INTO graduates VALUES (193, 1, NULL);
INSERT INTO graduates VALUES (194, 0, NULL);
INSERT INTO graduates VALUES (195, 1, NULL);
INSERT INTO graduates VALUES (196, 1, NULL);
INSERT INTO graduates VALUES (197, 1, NULL);
INSERT INTO graduates VALUES (198, 0, NULL);
INSERT INTO graduates VALUES (199, 0, NULL);
INSERT INTO graduates VALUES (200, 0, NULL);
INSERT INTO graduates VALUES (201, 1, NULL);
INSERT INTO graduates VALUES (202, 1, NULL);
INSERT INTO graduates VALUES (203, 1, NULL);
INSERT INTO graduates VALUES (204, 1, NULL);
INSERT INTO graduates VALUES (205, 1, NULL);
INSERT INTO graduates VALUES (206, 0, NULL);
INSERT INTO graduates VALUES (207, 1, NULL);
INSERT INTO graduates VALUES (208, 0, NULL);
INSERT INTO graduates VALUES (209, 0, NULL);
INSERT INTO graduates VALUES (210, 1, NULL);
INSERT INTO graduates VALUES (211, 0, NULL);
INSERT INTO graduates VALUES (212, 1, NULL);
INSERT INTO graduates VALUES (213, 1, NULL);
INSERT INTO graduates VALUES (214, 3, NULL);
INSERT INTO graduates VALUES (216, 1, NULL);
INSERT INTO graduates VALUES (217, 0, NULL);
INSERT INTO graduates VALUES (222, 1, NULL);
INSERT INTO graduates VALUES (223, 1, NULL);
INSERT INTO graduates VALUES (227, 1, NULL);
INSERT INTO graduates VALUES (228, 1, NULL);
INSERT INTO graduates VALUES (229, 0, NULL);
INSERT INTO graduates VALUES (230, 0, NULL);
INSERT INTO graduates VALUES (231, 1, NULL);
INSERT INTO graduates VALUES (232, 1, NULL);
INSERT INTO graduates VALUES (233, 1, NULL);
INSERT INTO graduates VALUES (234, 1, NULL);
INSERT INTO graduates VALUES (238, 0, NULL);
INSERT INTO graduates VALUES (239, 0, NULL);
INSERT INTO graduates VALUES (240, 1, NULL);
INSERT INTO graduates VALUES (241, 0, NULL);
INSERT INTO graduates VALUES (242, 0, NULL);
INSERT INTO graduates VALUES (243, 1, NULL);
INSERT INTO graduates VALUES (248, 0, NULL);
INSERT INTO graduates VALUES (254, 0, NULL);
INSERT INTO graduates VALUES (255, 0, NULL);
INSERT INTO graduates VALUES (257, 0, NULL);
INSERT INTO graduates VALUES (258, 1, NULL);
INSERT INTO graduates VALUES (259, 1, NULL);
INSERT INTO graduates VALUES (262, 1, NULL);
INSERT INTO graduates VALUES (263, 1, NULL);
INSERT INTO graduates VALUES (264, 0, NULL);
INSERT INTO graduates VALUES (265, 0, NULL);
INSERT INTO graduates VALUES (266, 1, NULL);
INSERT INTO graduates VALUES (267, 0, NULL);
INSERT INTO graduates VALUES (268, 0, NULL);
INSERT INTO graduates VALUES (269, 1, NULL);
INSERT INTO graduates VALUES (273, 1, NULL);
INSERT INTO graduates VALUES (274, 1, NULL);
INSERT INTO graduates VALUES (275, 0, NULL);
INSERT INTO graduates VALUES (276, 1, NULL);
INSERT INTO graduates VALUES (278, 1, NULL);
INSERT INTO graduates VALUES (279, 1, NULL);
INSERT INTO graduates VALUES (280, 0, NULL);
INSERT INTO graduates VALUES (281, 1, NULL);
INSERT INTO graduates VALUES (282, 1, NULL);
INSERT INTO graduates VALUES (284, 0, NULL);
INSERT INTO graduates VALUES (285, 0, NULL);
INSERT INTO graduates VALUES (286, 1, NULL);
INSERT INTO graduates VALUES (287, 1, NULL);
INSERT INTO graduates VALUES (288, 0, NULL);
INSERT INTO graduates VALUES (289, 1, NULL);
INSERT INTO graduates VALUES (290, 1, NULL);
INSERT INTO graduates VALUES (291, 1, NULL);
INSERT INTO graduates VALUES (292, 0, NULL);
INSERT INTO graduates VALUES (293, 1, NULL);
INSERT INTO graduates VALUES (295, 0, NULL);
INSERT INTO graduates VALUES (296, 1, NULL);
INSERT INTO graduates VALUES (300, 1, NULL);
INSERT INTO graduates VALUES (302, 0, NULL);
INSERT INTO graduates VALUES (303, 0, NULL);
INSERT INTO graduates VALUES (304, 1, NULL);
INSERT INTO graduates VALUES (305, 1, NULL);
INSERT INTO graduates VALUES (306, 1, NULL);
INSERT INTO graduates VALUES (307, 1, NULL);
INSERT INTO graduates VALUES (308, 1, NULL);
INSERT INTO graduates VALUES (309, 1, NULL);
INSERT INTO graduates VALUES (310, 1, NULL);
INSERT INTO graduates VALUES (311, 1, NULL);
INSERT INTO graduates VALUES (312, 0, NULL);
INSERT INTO graduates VALUES (313, 1, NULL);
INSERT INTO graduates VALUES (314, 1, NULL);
INSERT INTO graduates VALUES (315, 1, NULL);
INSERT INTO graduates VALUES (316, 1, NULL);
INSERT INTO graduates VALUES (317, 1, NULL);
INSERT INTO graduates VALUES (318, 1, NULL);
INSERT INTO graduates VALUES (319, 1, NULL);
INSERT INTO graduates VALUES (320, 1, NULL);
INSERT INTO graduates VALUES (321, 1, NULL);
INSERT INTO graduates VALUES (322, 0, NULL);
INSERT INTO graduates VALUES (323, 0, NULL);
INSERT INTO graduates VALUES (324, 1, NULL);
INSERT INTO graduates VALUES (325, 0, NULL);
INSERT INTO graduates VALUES (326, 1, NULL);
INSERT INTO graduates VALUES (327, 1, NULL);
INSERT INTO graduates VALUES (328, 1, NULL);
INSERT INTO graduates VALUES (329, 1, NULL);
INSERT INTO graduates VALUES (330, 0, NULL);
INSERT INTO graduates VALUES (331, 1, NULL);
INSERT INTO graduates VALUES (332, 1, NULL);
INSERT INTO graduates VALUES (333, 1, NULL);
INSERT INTO graduates VALUES (335, 0, NULL);
INSERT INTO graduates VALUES (336, 0, NULL);
INSERT INTO graduates VALUES (337, 1, NULL);
INSERT INTO graduates VALUES (338, 0, NULL);
INSERT INTO graduates VALUES (339, 0, NULL);
INSERT INTO graduates VALUES (340, 1, NULL);
INSERT INTO graduates VALUES (343, 1, NULL);
INSERT INTO graduates VALUES (344, 1, NULL);
INSERT INTO graduates VALUES (345, 1, NULL);
INSERT INTO graduates VALUES (346, 1, NULL);
INSERT INTO graduates VALUES (347, 1, NULL);
INSERT INTO graduates VALUES (348, 1, NULL);
INSERT INTO graduates VALUES (349, 1, NULL);
INSERT INTO graduates VALUES (350, 1, NULL);
INSERT INTO graduates VALUES (351, 1, NULL);
INSERT INTO graduates VALUES (352, 1, NULL);
INSERT INTO graduates VALUES (353, 1, NULL);
INSERT INTO graduates VALUES (354, 1, NULL);
INSERT INTO graduates VALUES (355, 1, NULL);
INSERT INTO graduates VALUES (356, 1, NULL);
INSERT INTO graduates VALUES (362, 1, NULL);
INSERT INTO graduates VALUES (363, 1, NULL);
INSERT INTO graduates VALUES (365, 1, NULL);
INSERT INTO graduates VALUES (366, 1, NULL);
INSERT INTO graduates VALUES (368, 1, NULL);
INSERT INTO graduates VALUES (369, 1, NULL);
INSERT INTO graduates VALUES (370, 1, NULL);
INSERT INTO graduates VALUES (373, 0, NULL);
INSERT INTO graduates VALUES (376, 1, NULL);
INSERT INTO graduates VALUES (377, 0, NULL);
INSERT INTO graduates VALUES (384, 1, NULL);
INSERT INTO graduates VALUES (395, 1, NULL);
INSERT INTO graduates VALUES (402, 1, NULL);
INSERT INTO graduates VALUES (405, 1, NULL);
INSERT INTO graduates VALUES (406, 1, NULL);
INSERT INTO graduates VALUES (407, 0, NULL);
INSERT INTO graduates VALUES (408, 1, NULL);
INSERT INTO graduates VALUES (410, 1, NULL);
INSERT INTO graduates VALUES (411, 0, NULL);
INSERT INTO graduates VALUES (413, 1, NULL);
INSERT INTO graduates VALUES (414, 1, NULL);
INSERT INTO graduates VALUES (415, 1, NULL);
INSERT INTO graduates VALUES (416, 0, NULL);
INSERT INTO graduates VALUES (418, 0, NULL);
INSERT INTO graduates VALUES (420, 1, NULL);
INSERT INTO graduates VALUES (421, 3, NULL);
INSERT INTO graduates VALUES (423, 1, NULL);
INSERT INTO graduates VALUES (424, 1, NULL);
INSERT INTO graduates VALUES (425, 0, NULL);
INSERT INTO graduates VALUES (426, 1, NULL);
INSERT INTO graduates VALUES (427, 1, NULL);
INSERT INTO graduates VALUES (428, 1, NULL);
INSERT INTO graduates VALUES (429, 1, NULL);
INSERT INTO graduates VALUES (432, 1, NULL);
INSERT INTO graduates VALUES (434, 1, NULL);
INSERT INTO graduates VALUES (435, 0, NULL);
INSERT INTO graduates VALUES (438, 0, NULL);
INSERT INTO graduates VALUES (439, 1, NULL);
INSERT INTO graduates VALUES (440, 1, NULL);
INSERT INTO graduates VALUES (441, 0, NULL);
INSERT INTO graduates VALUES (442, 0, NULL);
INSERT INTO graduates VALUES (443, 0, NULL);
INSERT INTO graduates VALUES (444, 1, NULL);
INSERT INTO graduates VALUES (446, 1, NULL);
INSERT INTO graduates VALUES (448, 1, NULL);
INSERT INTO graduates VALUES (449, 0, NULL);
INSERT INTO graduates VALUES (450, 1, NULL);
INSERT INTO graduates VALUES (451, 1, NULL);
INSERT INTO graduates VALUES (452, 1, NULL);
INSERT INTO graduates VALUES (453, 1, NULL);
INSERT INTO graduates VALUES (454, 1, NULL);
INSERT INTO graduates VALUES (455, 1, NULL);
INSERT INTO graduates VALUES (456, 0, NULL);
INSERT INTO graduates VALUES (457, 0, NULL);
INSERT INTO graduates VALUES (458, 1, NULL);
INSERT INTO graduates VALUES (460, 1, NULL);
INSERT INTO graduates VALUES (461, 0, NULL);
INSERT INTO graduates VALUES (462, 0, NULL);
INSERT INTO graduates VALUES (463, 1, NULL);
INSERT INTO graduates VALUES (464, 0, NULL);
INSERT INTO graduates VALUES (465, 1, NULL);
INSERT INTO graduates VALUES (466, 0, NULL);
INSERT INTO graduates VALUES (467, 1, NULL);
INSERT INTO graduates VALUES (469, 1, NULL);
INSERT INTO graduates VALUES (470, 1, NULL);
INSERT INTO graduates VALUES (471, 0, NULL);
INSERT INTO graduates VALUES (472, 1, NULL);
INSERT INTO graduates VALUES (473, 1, NULL);
INSERT INTO graduates VALUES (474, 1, NULL);
INSERT INTO graduates VALUES (475, 1, NULL);
INSERT INTO graduates VALUES (476, 1, NULL);
INSERT INTO graduates VALUES (477, 0, NULL);
INSERT INTO graduates VALUES (478, 0, NULL);
INSERT INTO graduates VALUES (479, 1, NULL);
INSERT INTO graduates VALUES (480, 1, NULL);
INSERT INTO graduates VALUES (481, 1, NULL);
INSERT INTO graduates VALUES (482, 1, NULL);
INSERT INTO graduates VALUES (483, 1, NULL);
INSERT INTO graduates VALUES (484, 1, NULL);
INSERT INTO graduates VALUES (486, 1, NULL);
INSERT INTO graduates VALUES (487, 1, NULL);
INSERT INTO graduates VALUES (488, 1, NULL);
INSERT INTO graduates VALUES (489, 0, NULL);
INSERT INTO graduates VALUES (490, 1, NULL);
INSERT INTO graduates VALUES (491, 1, NULL);
INSERT INTO graduates VALUES (492, 1, NULL);
INSERT INTO graduates VALUES (493, 1, NULL);
INSERT INTO graduates VALUES (494, 1, NULL);
INSERT INTO graduates VALUES (495, 1, NULL);
INSERT INTO graduates VALUES (496, 1, NULL);
INSERT INTO graduates VALUES (497, 1, NULL);
INSERT INTO graduates VALUES (498, 1, NULL);
INSERT INTO graduates VALUES (499, 1, NULL);
INSERT INTO graduates VALUES (500, 0, NULL);
INSERT INTO graduates VALUES (501, 1, NULL);
INSERT INTO graduates VALUES (502, 0, NULL);
INSERT INTO graduates VALUES (503, 1, NULL);
INSERT INTO graduates VALUES (504, 1, NULL);
INSERT INTO graduates VALUES (505, 1, NULL);
INSERT INTO graduates VALUES (506, 1, NULL);
INSERT INTO graduates VALUES (507, 1, NULL);
INSERT INTO graduates VALUES (508, 1, NULL);
INSERT INTO graduates VALUES (509, 1, NULL);
INSERT INTO graduates VALUES (510, 1, NULL);
INSERT INTO graduates VALUES (511, 0, NULL);
INSERT INTO graduates VALUES (512, 0, NULL);
INSERT INTO graduates VALUES (513, 1, NULL);
INSERT INTO graduates VALUES (514, 0, NULL);
INSERT INTO graduates VALUES (515, 1, NULL);
INSERT INTO graduates VALUES (516, 0, NULL);
INSERT INTO graduates VALUES (518, 0, NULL);
INSERT INTO graduates VALUES (519, 1, NULL);
INSERT INTO graduates VALUES (520, 0, NULL);
INSERT INTO graduates VALUES (521, 1, NULL);
INSERT INTO graduates VALUES (522, 1, NULL);
INSERT INTO graduates VALUES (523, 1, NULL);
INSERT INTO graduates VALUES (524, 1, NULL);
INSERT INTO graduates VALUES (525, 0, NULL);
INSERT INTO graduates VALUES (526, 1, NULL);
INSERT INTO graduates VALUES (527, 1, NULL);
INSERT INTO graduates VALUES (528, 1, NULL);
INSERT INTO graduates VALUES (529, 1, NULL);
INSERT INTO graduates VALUES (530, 1, NULL);
INSERT INTO graduates VALUES (531, 0, NULL);
INSERT INTO graduates VALUES (532, 0, NULL);
INSERT INTO graduates VALUES (533, 1, NULL);
INSERT INTO graduates VALUES (534, 1, NULL);
INSERT INTO graduates VALUES (535, 0, NULL);
INSERT INTO graduates VALUES (536, 1, NULL);
INSERT INTO graduates VALUES (537, 0, NULL);
INSERT INTO graduates VALUES (538, 0, NULL);
INSERT INTO graduates VALUES (539, 1, NULL);
INSERT INTO graduates VALUES (542, 1, NULL);
INSERT INTO graduates VALUES (543, 0, NULL);
INSERT INTO graduates VALUES (544, 0, NULL);
INSERT INTO graduates VALUES (546, 1, NULL);
INSERT INTO graduates VALUES (550, 0, NULL);
INSERT INTO graduates VALUES (552, 0, NULL);
INSERT INTO graduates VALUES (553, 1, NULL);
INSERT INTO graduates VALUES (554, 1, NULL);
INSERT INTO graduates VALUES (555, 1, NULL);
INSERT INTO graduates VALUES (556, 1, NULL);
INSERT INTO graduates VALUES (558, 0, NULL);
INSERT INTO graduates VALUES (559, 0, NULL);
INSERT INTO graduates VALUES (560, 0, NULL);
INSERT INTO graduates VALUES (561, 0, NULL);
INSERT INTO graduates VALUES (564, 0, NULL);
INSERT INTO graduates VALUES (565, 1, NULL);
INSERT INTO graduates VALUES (567, 0, NULL);
INSERT INTO graduates VALUES (568, 1, NULL);
INSERT INTO graduates VALUES (570, 0, NULL);
INSERT INTO graduates VALUES (571, 0, NULL);
INSERT INTO graduates VALUES (572, 1, NULL);
INSERT INTO graduates VALUES (573, 1, NULL);
INSERT INTO graduates VALUES (574, 0, NULL);
INSERT INTO graduates VALUES (575, 0, NULL);
INSERT INTO graduates VALUES (576, 1, NULL);
INSERT INTO graduates VALUES (577, 0, NULL);
INSERT INTO graduates VALUES (581, 0, NULL);
INSERT INTO graduates VALUES (582, 1, NULL);
INSERT INTO graduates VALUES (583, 0, NULL);
INSERT INTO graduates VALUES (589, 0, NULL);
INSERT INTO graduates VALUES (590, 1, NULL);
INSERT INTO graduates VALUES (592, 1, NULL);
INSERT INTO graduates VALUES (593, 1, NULL);
INSERT INTO graduates VALUES (594, 0, NULL);
INSERT INTO graduates VALUES (595, 1, NULL);
INSERT INTO graduates VALUES (596, 0, NULL);
INSERT INTO graduates VALUES (597, 1, NULL);
INSERT INTO graduates VALUES (598, 1, NULL);
INSERT INTO graduates VALUES (599, 1, NULL);
INSERT INTO graduates VALUES (600, 1, NULL);
INSERT INTO graduates VALUES (601, 1, NULL);
INSERT INTO graduates VALUES (602, 1, NULL);
INSERT INTO graduates VALUES (603, 0, NULL);
INSERT INTO graduates VALUES (604, 1, NULL);
INSERT INTO graduates VALUES (605, 0, NULL);
INSERT INTO graduates VALUES (606, 0, NULL);
INSERT INTO graduates VALUES (607, 0, NULL);
INSERT INTO graduates VALUES (608, 1, NULL);
INSERT INTO graduates VALUES (609, 0, NULL);
INSERT INTO graduates VALUES (610, 1, NULL);
INSERT INTO graduates VALUES (611, 1, NULL);
INSERT INTO graduates VALUES (613, 0, NULL);
INSERT INTO graduates VALUES (614, 1, NULL);
INSERT INTO graduates VALUES (615, 1, NULL);
INSERT INTO graduates VALUES (616, 1, NULL);
INSERT INTO graduates VALUES (618, 1, NULL);
INSERT INTO graduates VALUES (619, 0, NULL);
INSERT INTO graduates VALUES (620, 1, NULL);
INSERT INTO graduates VALUES (621, 1, NULL);
INSERT INTO graduates VALUES (622, 1, NULL);
INSERT INTO graduates VALUES (623, 1, NULL);
INSERT INTO graduates VALUES (625, 1, NULL);
INSERT INTO graduates VALUES (626, 1, NULL);
INSERT INTO graduates VALUES (627, 1, NULL);
INSERT INTO graduates VALUES (628, 1, NULL);
INSERT INTO graduates VALUES (629, 1, NULL);
INSERT INTO graduates VALUES (630, 1, NULL);
INSERT INTO graduates VALUES (632, 0, NULL);
INSERT INTO graduates VALUES (633, 0, NULL);
INSERT INTO graduates VALUES (634, 1, NULL);
INSERT INTO graduates VALUES (635, 1, NULL);
INSERT INTO graduates VALUES (636, 1, NULL);
INSERT INTO graduates VALUES (637, 1, NULL);
INSERT INTO graduates VALUES (638, 1, NULL);
INSERT INTO graduates VALUES (639, 1, NULL);
INSERT INTO graduates VALUES (640, 1, NULL);
INSERT INTO graduates VALUES (641, 1, NULL);
INSERT INTO graduates VALUES (642, 1, NULL);
INSERT INTO graduates VALUES (643, 1, NULL);
INSERT INTO graduates VALUES (644, 1, NULL);
INSERT INTO graduates VALUES (645, 1, NULL);
INSERT INTO graduates VALUES (646, 0, NULL);
INSERT INTO graduates VALUES (647, 1, NULL);
INSERT INTO graduates VALUES (648, 1, NULL);
INSERT INTO graduates VALUES (649, 1, NULL);
INSERT INTO graduates VALUES (650, 1, NULL);
INSERT INTO graduates VALUES (651, 1, NULL);
INSERT INTO graduates VALUES (652, 0, NULL);
INSERT INTO graduates VALUES (653, 0, NULL);
INSERT INTO graduates VALUES (654, 1, NULL);
INSERT INTO graduates VALUES (656, 1, NULL);
INSERT INTO graduates VALUES (657, 0, NULL);
INSERT INTO graduates VALUES (658, 0, NULL);
INSERT INTO graduates VALUES (659, 0, NULL);
INSERT INTO graduates VALUES (661, 1, NULL);
INSERT INTO graduates VALUES (662, 1, NULL);
INSERT INTO graduates VALUES (663, 0, NULL);
INSERT INTO graduates VALUES (664, 1, NULL);
INSERT INTO graduates VALUES (665, 1, NULL);
INSERT INTO graduates VALUES (666, 1, NULL);
INSERT INTO graduates VALUES (667, 1, NULL);
INSERT INTO graduates VALUES (668, 0, NULL);
INSERT INTO graduates VALUES (669, 1, NULL);
INSERT INTO graduates VALUES (671, 1, NULL);
INSERT INTO graduates VALUES (675, 1, NULL);
INSERT INTO graduates VALUES (676, 1, NULL);
INSERT INTO graduates VALUES (677, 0, NULL);
INSERT INTO graduates VALUES (678, 1, NULL);
INSERT INTO graduates VALUES (679, 1, NULL);
INSERT INTO graduates VALUES (680, 1, NULL);
INSERT INTO graduates VALUES (681, 1, NULL);
INSERT INTO graduates VALUES (682, 0, NULL);
INSERT INTO graduates VALUES (683, 1, NULL);
INSERT INTO graduates VALUES (684, 0, NULL);
INSERT INTO graduates VALUES (685, 1, NULL);
INSERT INTO graduates VALUES (686, 1, NULL);
INSERT INTO graduates VALUES (687, 1, NULL);
INSERT INTO graduates VALUES (688, 1, NULL);
INSERT INTO graduates VALUES (689, 1, NULL);
INSERT INTO graduates VALUES (691, 1, NULL);
INSERT INTO graduates VALUES (692, 0, NULL);
INSERT INTO graduates VALUES (693, 0, NULL);
INSERT INTO graduates VALUES (694, 0, NULL);
INSERT INTO graduates VALUES (695, 1, NULL);
INSERT INTO graduates VALUES (696, 1, NULL);
INSERT INTO graduates VALUES (697, 0, NULL);
INSERT INTO graduates VALUES (698, 0, NULL);
INSERT INTO graduates VALUES (699, 1, NULL);
INSERT INTO graduates VALUES (700, 0, NULL);
INSERT INTO graduates VALUES (701, 0, NULL);
INSERT INTO graduates VALUES (702, 0, NULL);
INSERT INTO graduates VALUES (703, 0, NULL);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO languages VALUES (1, 'Slovenský jazyk', 'Slovak language');
INSERT INTO languages VALUES (2, 'Anglický jazyk', 'English language');
INSERT INTO languages VALUES (3, 'Nemecký jazyk', 'German language');
INSERT INTO languages VALUES (4, 'Francúzský jazyk', 'French language');


--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO levels VALUES (1, 'základy', 'basic');
INSERT INTO levels VALUES (2, 'mierne pokročilý', 'upper intermediate');
INSERT INTO levels VALUES (3, 'aktívne', 'active');
INSERT INTO levels VALUES (4, 'expert, tlmočenie', 'expert, interpreter');
INSERT INTO levels VALUES (5, 'materinský jazyk', 'native language');


--
-- Data for Name: login_history; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO login_history VALUES (1, 1, '127.0.0.1', '2008-03-11 12:30:36.656429');
INSERT INTO login_history VALUES (2, 1, '127.0.0.1', '2008-03-12 11:00:24.460049');
INSERT INTO login_history VALUES (3, 1, '192.168.62.244', '2008-03-13 01:31:48.532665');
INSERT INTO login_history VALUES (4, 1, '192.168.62.131', '2008-04-01 10:22:18.373602');
INSERT INTO login_history VALUES (5, 1, '127.0.0.1', '2008-04-01 10:41:31.664956');
INSERT INTO login_history VALUES (6, 1, '127.0.0.1', '2008-04-01 10:43:12.228373');
INSERT INTO login_history VALUES (7, 1, '127.0.0.1', '2008-04-01 10:50:48.495008');
INSERT INTO login_history VALUES (8, 1, '127.0.0.1', '2008-04-01 11:10:08.282061');
INSERT INTO login_history VALUES (9, 1, '192.168.62.133', '2008-04-01 11:54:36.680735');
INSERT INTO login_history VALUES (10, 1, '192.168.62.244', '2008-04-08 10:01:17.753355');
INSERT INTO login_history VALUES (11, 1, '127.0.0.1', '2008-04-08 10:05:54.874206');
INSERT INTO login_history VALUES (12, 1, '127.0.0.1', '2008-04-08 11:18:41.849728');
INSERT INTO login_history VALUES (13, 1, '127.0.0.1', '2008-04-12 00:20:57.825');
INSERT INTO login_history VALUES (14, 1, '127.0.0.1', '2008-04-15 22:25:26.509');
INSERT INTO login_history VALUES (15, 1, '127.0.0.1', '2008-04-16 08:47:14.288');
INSERT INTO login_history VALUES (16, 1, '127.0.0.1', '2008-04-16 17:59:33.621');
INSERT INTO login_history VALUES (17, 4, '127.0.0.1', '2008-04-16 19:57:00.904');
INSERT INTO login_history VALUES (18, 1, '127.0.0.1', '2008-04-17 20:52:19.569');
INSERT INTO login_history VALUES (19, 1, '127.0.0.1', '2008-04-17 22:31:03.908');


--
-- Data for Name: mail_address_groups; Type: TABLE DATA; Schema: public; Owner: team14
--



--
-- Data for Name: mail_address_users; Type: TABLE DATA; Schema: public; Owner: team14
--



--
-- Data for Name: mail_group_users; Type: TABLE DATA; Schema: public; Owner: team14
--



--
-- Data for Name: mail_groups; Type: TABLE DATA; Schema: public; Owner: team14
--



--
-- Data for Name: mails; Type: TABLE DATA; Schema: public; Owner: team14
--



--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO news VALUES (1, 'Testing - Vitajte na našej stránke', 'Testing - Welcome to our page', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque mollis, magna et laoreet dignissim, risus tellus interdum est, a varius felis nisi ut sapien. Phasellus eget nunc in mi consectetuer molestie. Fusce tempor, odio eu blandit imperdiet, lorem libero bibendum risus, a malesuada tellus lacus id est. Mauris eu ligula nec risus mollis accumsan. Praesent fermentum sapien sit amet tellus. Proin ac elit at pede mollis molestie. Mauris euismod, lectus in condimentum dapibus, velit nisi pellentesque nibh, et faucibus ligula dolor vitae lectus. Curabitur malesuada. In feugiat lorem quis tortor. Nulla nec quam. Ut nec nibh. Sed nibh lacus, tristique vitae, commodo faucibus, vulputate at, quam. Vestibulum et quam. Pellentesque porttitor vehicula tellus. Pellentesque eleifend venenatis mi.</p><p>Integer sem sapien, fringilla sed, volutpat ut, iaculis in, augue. Integer convallis. Proin pede turpis, consectetuer ut, convallis id, molestie ac, ligula. Aenean gravida nulla vitae nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec varius lobortis diam. Donec neque eros, vulputate quis, aliquam vel, scelerisque vel, felis. Ut scelerisque pede ac urna. Nulla et metus vel risus tincidunt blandit. In hac habitasse platea dictumst. Etiam viverra enim vel turpis. Donec purus tortor, mattis sed, consequat quis, cursus sit amet, massa. Morbi a nulla ac lectus ultricies congue. Nam commodo luctus nulla. Duis volutpat. Phasellus porttitor ligula in turpis. Sed bibendum ipsum id mauris.</p>', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque mollis, magna et laoreet dignissim, risus tellus interdum est, a varius felis nisi ut sapien. Phasellus eget nunc in mi consectetuer molestie. Fusce tempor, odio eu blandit imperdiet, lorem libero bibendum risus, a malesuada tellus lacus id est. Mauris eu ligula nec risus mollis accumsan. Praesent fermentum sapien sit amet tellus. Proin ac elit at pede mollis molestie. Mauris euismod, lectus in condimentum dapibus, velit nisi pellentesque nibh, et faucibus ligula dolor vitae lectus. Curabitur malesuada. In feugiat lorem quis tortor. Nulla nec quam. Ut nec nibh. Sed nibh lacus, tristique vitae, commodo faucibus, vulputate at, quam. Vestibulum et quam. Pellentesque porttitor vehicula tellus. Pellentesque eleifend venenatis mi.</p><p>Integer sem sapien, fringilla sed, volutpat ut, iaculis in, augue. Integer convallis. Proin pede turpis, consectetuer ut, convallis id, molestie ac, ligula. Aenean gravida nulla vitae nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec varius lobortis diam. Donec neque eros, vulputate quis, aliquam vel, scelerisque vel, felis. Ut scelerisque pede ac urna. Nulla et metus vel risus tincidunt blandit. In hac habitasse platea dictumst. Etiam viverra enim vel turpis. Donec purus tortor, mattis sed, consequat quis, cursus sit amet, massa. Morbi a nulla ac lectus ultricies congue. Nam commodo luctus nulla. Duis volutpat. Phasellus porttitor ligula in turpis. Sed bibendum ipsum id mauris.</p>', '2001-01-11', '2001-01-01', 1);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO posts VALUES (1, 'The title', 'This is the post body.', '2008-03-11 12:30:16.929482', NULL);
INSERT INTO posts VALUES (2, 'A title once again', 'And the post body follows.', '2008-03-11 12:30:16.929482', NULL);
INSERT INTO posts VALUES (3, 'Title strikes back', 'This is really exciting! Not.', '2008-03-11 12:30:16.929482', NULL);


--
-- Data for Name: professions; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO professions VALUES (1, 'Student', 'Student');
INSERT INTO professions VALUES (2, 'Ucitel', 'Teacher');


--
-- Data for Name: project_types; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO project_types VALUES ('DP', 'Diplomový projekt', 'Diplom project');
INSERT INTO project_types VALUES ('ZP', 'Bakalársky projekt', 'Bachelor project');


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO projects VALUES (1, 'ZP', 563, NULL, 5, '2005/2006', 'Experimentálny mikropočítač', 'Experimentálny mikropočítač', 'Navrhnite a zrealizujte experimentálny mikropočítač na báze jednočipového mikropočítača 80C552 s nasledovnými požiadavkami:  
kompatibilita s MPS51/52/552,
8-bitový vstupný port so spínačmi a 8-bitový výstupný port s indikáciou,
generovanie externých žiadostí o prerušenie tlačidlami,
6-miestny numerický displej,
10-bitový A/D prevodník,
8-bitový prevodník s PWM,
podpora pripojenia monitorovacej jednotky,
sada testovacích programov.
', 'Navrhnite a zrealizujte experimentálny mikropočítač na báze jednočipového mikropočítača 80C552 s nasledovnými požiadavkami:  
kompatibilita s MPS51/52/552,
8-bitový vstupný port so spínačmi a 8-bitový výstupný port s indikáciou,
generovanie externých žiadostí o prerušenie tlačidlami,
6-miestny numerický displej,
10-bitový A/D prevodník,
8-bitový prevodník s PWM,
podpora pripojenia monitorovacej jednotky,
sada testovacích programov.
', 0);
INSERT INTO projects VALUES (2, 'DP', 24, NULL, 7, '2005/2006', 'Zhlukovanie a klasifikácia textových dokumentov', 'Zhlukovanie a klasifikácia textových dokumentov', NULL, NULL, 4);
INSERT INTO projects VALUES (3, 'ZP', 17, NULL, 8, '2004/2005', 'Editor tvorby algoritmov – práca s reťazcami', 'Editor for the creation of algorithms – working with strings', 'Analyzujte problém tvorby algoritmu resp. programu ako skladanie predpripravených modulov. Jednotlivé moduly nech obsahujú vybrané algoritmické a programové (jazykové) konštrukcie. Problémovo sa orientujte na vybranú oblasť. Navrhnite a implementujte aplikáciu, ktorá by podporovala takýto modulárny prístup. Aplikácia by mala podporovať celý životný cyklus tvorby programov', 'Analyzujte problém tvorby algoritmu resp. programu ako skladanie predpripravených modulov. Jednotlivé moduly nech obsahujú vybrané algoritmické a programové (jazykové) konštrukcie. Problémovo sa orientujte na vybranú oblasť. Navrhnite a implementujte aplikáciu, ktorá by podporovala takýto modulárny prístup. Aplikácia by mala podporovať celý životný cyklus tvorby programov', 1);
INSERT INTO projects VALUES (4, 'DP', 660, NULL, 8, '2005/2006', 'Prezentácia vedomostí v adaptívnom webovom systéme', 'Prezentácia vedomostí v adaptívnom webovom systéme', NULL, NULL, 4);
INSERT INTO projects VALUES (5, 'ZP', 358, NULL, 9, '2004/2005', 'Testovanie bezpečnostných slabín počítačových sietí', 'Testing the Security Weaknesses of Computer Networks', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy bezpečnostných slabín. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú testovať vybraté typy bezpečnostných slabín na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy bezpečnostných slabín. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú testovať vybraté typy bezpečnostných slabín na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.', 0);
INSERT INTO projects VALUES (6, 'DP', 674, NULL, 9, '2005/2006', 'Interaktívna kolaboratívna trojrozmerná vizualizácia modelov a dát', 'Interaktívna kolaboratívna trojrozmerná vizualizácia modelov a dát', NULL, NULL, 4);
INSERT INTO projects VALUES (7, 'ZP', 40, NULL, 14, '2005/2006', 'Objektovo relačné mapre pre jazyk C#', 'Objektovo relačné mapre pre jazyk C#', 'Naštudujte princípy a charakteristiky Objektovo-Relačných maprov vo všeobecnosti. Analyzujte existujúce O–R mapre pre programovací jazyk C#. Naštudujte podrobnosti pre Vami vybrané O-R mapre (min. 2) pre jazyk C#. S využitím vybraných O-R maprov vytvorte jednoduchú databázovú aplikáciu, resp. aplikácie na spoločnom základe. Vybrané mapre porovnajte s využitím osobných skúseností získaných pri vytváraní aplikácie/aplikácií.', 'Naštudujte princípy a charakteristiky Objektovo-Relačných maprov vo všeobecnosti. Analyzujte existujúce O–R mapre pre programovací jazyk C#. Naštudujte podrobnosti pre Vami vybrané O-R mapre (min. 2) pre jazyk C#. S využitím vybraných O-R maprov vytvorte jednoduchú databázovú aplikáciu, resp. aplikácie na spoločnom základe. Vybrané mapre porovnajte s využitím osobných skúseností získaných pri vytváraní aplikácie/aplikácií.', 1);
INSERT INTO projects VALUES (8, 'DP', 360, NULL, 18, '2005/2006', 'Optimálne kódovanie stavov synchrónnych sekvenčných obvodov', 'Optimálne kódovanie stavov synchrónnych sekvenčných obvodov', NULL, NULL, 0);
INSERT INTO projects VALUES (9, 'ZP', 579, NULL, 18, '2003/2004', 'Multimediálne informácie v regionálnom IS – 2', 'Multimedia information in regional IS - 2', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie existujúceho základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb KIVT.', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie existujúceho základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb KIVT.', 1);
INSERT INTO projects VALUES (10, 'ZP', 674, NULL, 21, '2005/2006', 'Vývoj správania sa hráčov v tímovej hre proti statickému súperovi', 'Vývoj správania sa hráčov v tímovej hre proti statickému súperovi', 'Predpokladajme model futbalovej hry, v ktorej hrajú proti sebe dva tímy softvérových agentov. Správanie každého hráča je modelované pomocou automatu, na základe ktorého sa rozhoduje, akú akciu vykoná agent v danej situácii. Navrhnite a implementuje spôsob, na základe ktorého bude možné nahradzovať doterajší model správania sa hráča novým lepším modelom. Predpokladajte, že sú známe statické (t.j. nevyvíjajúce sa) modely správania sa súperov počas hry. Svoje riešenie porovnajte s niektorými inými už existujúcimi riešeniami a zaraďte ho do kontextu sučasného stavu v oblasti modelovania tímových hier.', 'Predpokladajme model futbalovej hry, v ktorej hrajú proti sebe dva tímy softvérových agentov. Správanie každého hráča je modelované pomocou automatu, na základe ktorého sa rozhoduje, akú akciu vykoná agent v danej situácii. Navrhnite a implementuje spôsob, na základe ktorého bude možné nahradzovať doterajší model správania sa hráča novým lepším modelom. Predpokladajte, že sú známe statické (t.j. nevyvíjajúce sa) modely správania sa súperov počas hry. Svoje riešenie porovnajte s niektorými inými už existujúcimi riešeniami a zaraďte ho do kontextu sučasného stavu v oblasti modelovania tímových hier.', 1);
INSERT INTO projects VALUES (11, 'ZP', 541, NULL, 22, '2005/2006', 'Model používateľa pre jeho identifikáciu', 'Model používateľa pre jeho identifikáciu', 'Navrhnite metódy a prostriedky pre budovanie modelu používateľa na základe jeho charakteristík správania sa v počítačovom systéme. Navrhnutý systém implementujte vo vybranom prostredí. Systém má slúžiť na potvrdenie identifikácie používateľa za účelom zvýšenia bezpečnosti prevádzky informačných systémov.', 'Navrhnite metódy a prostriedky pre budovanie modelu používateľa na základe jeho charakteristík správania sa v počítačovom systéme. Navrhnutý systém implementujte vo vybranom prostredí. Systém má slúžiť na potvrdenie identifikácie používateľa za účelom zvýšenia bezpečnosti prevádzky informačných systémov.', 1);
INSERT INTO projects VALUES (12, 'ZP', 655, NULL, 28, '2005/2006', 'Webový portál pre správu študentských projetkov', 'Webový portál pre správu študentských projetkov', 'Analyzujte problematiku podpory zadávania a odovzdávania študentských projektov na fakulte. Navrhnite a implementujte systém - webovskú aplikáciu, ktorá by umožnila pedagógom zadávať témy projektov a študentom prihlasovať sa na vypísané témy. Aplikáciu je možné rozšíriť napríklad aj o zadávanie hodnotení posudkov a pod. Vytvorený systém naplňte údajmi z už existujúcich systémov využívaných na fakulte. Vzhľadom k rozsahu projektu a aj predpokladu nasadania v reálnom prostredí vyžadujú sa znalosti uchádzačov z oblasti vývoja webovských aplikácií (napríklad Postgres / PHP, JSP a pod.).', 'Analyzujte problematiku podpory zadávania a odovzdávania študentských projektov na fakulte. Navrhnite a implementujte systém - webovskú aplikáciu, ktorá by umožnila pedagógom zadávať témy projektov a študentom prihlasovať sa na vypísané témy. Aplikáciu je možné rozšíriť napríklad aj o zadávanie hodnotení posudkov a pod. Vytvorený systém naplňte údajmi z už existujúcich systémov využívaných na fakulte. Vzhľadom k rozsahu projektu a aj predpokladu nasadania v reálnom prostredí vyžadujú sa znalosti uchádzačov z oblasti vývoja webovských aplikácií (napríklad Postgres / PHP, JSP a pod.).', 1);
INSERT INTO projects VALUES (13, 'ZP', 301, NULL, 29, '2005/2006', 'Návrh a implementácia algoritmu pre funkčný generátor testov  VLSI obvodov', 'Návrh a implementácia algoritmu pre funkčný generátor testov  VLSI obvodov', 'Analyzujte metódy a spôsoby generovania funkčných testov, navrhnite a  realizujte vybrané moduly algoritmu pre systém generovania  funkčných testov vnorených systémov, ktorý zostavuje funkčné testy na základe opisu obvodu v istom špecifikačnom jazyku (VHDL). Algoritmus implementujte a vytvorte grafické užívateľské rozhranie. Funkčnosť implementovaného algoritmu a vyhodnotenie účinnosti generovaných testovacích mixov overte na príkladoch. ', 'Analyzujte metódy a spôsoby generovania funkčných testov, navrhnite a  realizujte vybrané moduly algoritmu pre systém generovania  funkčných testov vnorených systémov, ktorý zostavuje funkčné testy na základe opisu obvodu v istom špecifikačnom jazyku (VHDL). Algoritmus implementujte a vytvorte grafické užívateľské rozhranie. Funkčnosť implementovaného algoritmu a vyhodnotenie účinnosti generovaných testovacích mixov overte na príkladoch. ', 0);
INSERT INTO projects VALUES (14, 'ZP', 579, NULL, 30, '2005/2006', 'Systém pre správu webových stránok - používateľ', 'Systém pre správu webových stránok - používateľ', 'Cieľom projektu je vytvorenie prostredia, ktoré umožní spravovanie webových stránok. Analyzujte existujúce systémy podobného charakteru z pohľadu používateľov a vlastností prostredia, v ktorom bude vytváraný systém.  Navrhnite štruktúru použitej databázy, štruktúru obrazoviek pre používateľov, grafické prvky a štýly. Následne implementujte kľúčové časti systému a použiteľnosť overte na vybranej množine stránok používaných v pedagogike FIIT.
', 'Cieľom projektu je vytvorenie prostredia, ktoré umožní spravovanie webových stránok. Analyzujte existujúce systémy podobného charakteru z pohľadu používateľov a vlastností prostredia, v ktorom bude vytváraný systém.  Navrhnite štruktúru použitej databázy, štruktúru obrazoviek pre používateľov, grafické prvky a štýly. Následne implementujte kľúčové časti systému a použiteľnosť overte na vybranej množine stránok používaných v pedagogike FIIT.
', 1);
INSERT INTO projects VALUES (15, 'ZP', 13, 431, 32, '2004/2005', 'Priebežná diagnostika a návrh kontrolórov ', 'Online diagnostics and designing of checkers', 'Preštudujte metodiky priebežnej diagnostiky, návrhy kontrolórov pre digitálne obvody. Opíšte ich funkčnost vo VHDL. Navrhnite systém pre automatickú syntézu vybraných blokov priebežnej diagnostiky k obvodom modelovaným vo VHDL. Systém implementujte v jazyku JAVA, funkčnosť overte na príkladoch. ', 'Preštudujte metodiky priebežnej diagnostiky, návrhy kontrolórov pre digitálne obvody. Opíšte ich funkčnost vo VHDL. Navrhnite systém pre automatickú syntézu vybraných blokov priebežnej diagnostiky k obvodom modelovaným vo VHDL. Systém implementujte v jazyku JAVA, funkčnosť overte na príkladoch. ', 0);
INSERT INTO projects VALUES (16, 'DP', 431, NULL, 32, '2005/2006', 'Simulátor jazyka VHDL', 'Simulátor jazyka VHDL', NULL, NULL, 0);
INSERT INTO projects VALUES (17, 'DP', 375, NULL, 34, '2005/2006', 'Meranie  a vyhodnocovanie parametrov kvality služieb v TCP/IP sieťach', 'Meranie  a vyhodnocovanie parametrov kvality služieb v TCP/IP sieťach', NULL, NULL, 0);
INSERT INTO projects VALUES (18, 'ZP', 359, NULL, 34, '2004/2005', 'Výučbový systém pre vizualizáciu bezpečnosti údajov.', 'Educational system for visualization of data security', 'Analyzujte z pohľadu bezpečnosti údajov a funknčosti technológie počítačových sietí (router, switch, hub, wifi ... ) na báze protokolu TCP/IP so zameranim na LAN.
Analyzujte možnosti multimediálnej prezentácie informácií (napr. flash).
Navrhnite a implementujte výučbový systém pre prezentáciu informácií o bezpečnosti údajov jednotlivych protokolov aplikačnej vrstvy.
', 'Analyzujte z pohľadu bezpečnosti údajov a funknčosti technológie počítačových sietí (router, switch, hub, wifi ... ) na báze protokolu TCP/IP so zameranim na LAN.
Analyzujte možnosti multimediálnej prezentácie informácií (napr. flash).
Navrhnite a implementujte výučbový systém pre prezentáciu informácií o bezpečnosti údajov jednotlivych protokolov aplikačnej vrstvy.
', 0);
INSERT INTO projects VALUES (19, 'ZP', 361, NULL, 37, '2004/2005', 'Problémová štúdia mobilného počítačového systému (GSM)', 'Situation study of mobile computing system (GSM) ', 'Analyzujte problematiku súčasného  stavu v oblasti technickej časti mobilného počítačového systému (GSM).
Urobte štrukturálnu analýzu architektúry GSM siete (mobile station, base station subsystem, network subsystem). Navrhnite a implementujte rádio-komunikačné aspekty  mobilného počítačového systému (GSM).
', 'Analyzujte problematiku súčasného  stavu v oblasti technickej časti mobilného počítačového systému (GSM).
Urobte štrukturálnu analýzu architektúry GSM siete (mobile station, base station subsystem, network subsystem). Navrhnite a implementujte rádio-komunikačné aspekty  mobilného počítačového systému (GSM).
', 0);
INSERT INTO projects VALUES (20, 'DP', 359, NULL, 37, '2005/2006', 'Programová podpora simulácie vybraných kombinovaných ARQ metód.', 'Programová podpora simulácie vybraných kombinovaných ARQ metód.', NULL, NULL, 0);
INSERT INTO projects VALUES (21, 'DP', 382, NULL, 38, '2005/2006', 'Klastrovanie mravcami', 'Klastrovanie mravcami', NULL, NULL, 4);
INSERT INTO projects VALUES (22, 'DP', 437, NULL, 39, '2005/2006', 'Odhaľovanie webových stránok so zaujímavou informáciou pomocou poznámok', 'Odhaľovanie webových stránok so zaujímavou informáciou pomocou poznámok', NULL, NULL, 1);
INSERT INTO projects VALUES (23, 'DP', 704, NULL, 41, '2005/2006', 'Návrh a implementácia webovej prezentácie pracoviska z oblasti kultúry', 'Návrh a implementácia webovej prezentácie pracoviska z oblasti kultúry', NULL, NULL, 1);
INSERT INTO projects VALUES (24, 'DP', 374, NULL, 42, '2005/2006', 'Možnosti ochrany mobilných agentov', 'Možnosti ochrany mobilných agentov', NULL, NULL, 4);
INSERT INTO projects VALUES (25, 'ZP', 375, NULL, 42, '2004/2005', 'Peer-to-peer klient pre zdieľanie súborov', 'Peer-to-peer client for files sharing', 'Analyzujte peer-to-peer (P2P) siete. Uveďte ich základné parametre a stručne charakterizujte niektoré typické P2P siete. Navrhnite a implementujte programový systém, ktorý poskytne základné komunikačné vlastnosti uzla P2P sietí nad TCP/IP sieťami. Overte navrhnutý programový systém v reálnej sieti. ', 'Analyzujte peer-to-peer (P2P) siete. Uveďte ich základné parametre a stručne charakterizujte niektoré typické P2P siete. Navrhnite a implementujte programový systém, ktorý poskytne základné komunikačné vlastnosti uzla P2P sietí nad TCP/IP sieťami. Overte navrhnutý programový systém v reálnej sieti. ', 0);
INSERT INTO projects VALUES (26, 'DP', 361, NULL, 45, '2005/2006', 'Návrh modelu charakterizujúceho určitý systém, pomocou systému level design methodology (LDM) ', 'Návrh modelu charakterizujúceho určitý systém, pomocou systému level design methodology (LDM) ', NULL, NULL, 0);
INSERT INTO projects VALUES (27, 'ZP', 374, NULL, 48, '2004/2005', 'Mobilné agenty', 'Mobile Agents', 'Analyzujte vlastnosti a možnosti multi-agentových systémov, zamerajte sa hlavne na mobilitu agentov. Preskúmajte spôsoby vytvárania hostiteľských prostredí pre mobilné agenty v rôznych operačných systémoch a podporu, ktorú poskytujú knižnice jazyka JAVA. Špecifikujte podstatné vlastnosti, ktoré zabezpečia mobilitu agenta. Navrhnite hostiteľské prostredie a jednoduchého agenta, ktorý je schopný podľa určeného plánu cestovať medzi zvolenými počítačmi. Navrhnuté riešenie overte implementovaním softvérového prototypu.', 'Analyzujte vlastnosti a možnosti multi-agentových systémov, zamerajte sa hlavne na mobilitu agentov. Preskúmajte spôsoby vytvárania hostiteľských prostredí pre mobilné agenty v rôznych operačných systémoch a podporu, ktorú poskytujú knižnice jazyka JAVA. Špecifikujte podstatné vlastnosti, ktoré zabezpečia mobilitu agenta. Navrhnite hostiteľské prostredie a jednoduchého agenta, ktorý je schopný podľa určeného plánu cestovať medzi zvolenými počítačmi. Navrhnuté riešenie overte implementovaním softvérového prototypu.', 1);
INSERT INTO projects VALUES (28, 'DP', 16, NULL, 49, '2005/2006', 'Aspektovo-orientované návrhové vzory', 'Aspektovo-orientované návrhové vzory', NULL, NULL, 1);
INSERT INTO projects VALUES (29, 'DP', 541, NULL, 50, '2005/2006', 'Systém automatizovaného odčítania elektromerov', 'Systém automatizovaného odčítania elektromerov', NULL, NULL, 4);
INSERT INTO projects VALUES (30, 'DP', 27, NULL, 51, '2005/2006', 'Správa distribuovaných údajov', 'Správa distribuovaných údajov', NULL, NULL, 4);
INSERT INTO projects VALUES (31, 'ZP', 566, NULL, 52, '2004/2005', 'Neurónové siete s logickým prahovým neurónom ', 'Neural networks with logical threshold neurons', 'Neurónové siete s logickým prahovým neurónom patria medzi najjednoduchšie typy neurónových sietí, boli objavené McCulluchom a Pittsom v r. 1943. Títo autori dokázali, že ľubovolná Boolova funkcia je simulovaná trojvrstvovou neurónovou sieťou, čím vlastne dokázali, že tento typ neurónových sietí je univerzálnym výpočtovým zariadením v doméne Boolových funkcií. Tento teoretický prístup je názorne ilustrovaný schémami neurónových sietí, ktoré sú schopné vykonávať rôzne boolovské operácie. Predmetom projektu bude teoretická rekapitulácia týchto neurónových sietí a implementácia jednoduchého programu s grafickým znázornením neurónovej siete, ktorý bude simulovať Boolove funkcie pomocou prahových logických neurónov.
', 'Neurónové siete s logickým prahovým neurónom patria medzi najjednoduchšie typy neurónových sietí, boli objavené McCulluchom a Pittsom v r. 1943. Títo autori dokázali, že ľubovolná Boolova funkcia je simulovaná trojvrstvovou neurónovou sieťou, čím vlastne dokázali, že tento typ neurónových sietí je univerzálnym výpočtovým zariadením v doméne Boolových funkcií. Tento teoretický prístup je názorne ilustrovaný schémami neurónových sietí, ktoré sú schopné vykonávať rôzne boolovské operácie. Predmetom projektu bude teoretická rekapitulácia týchto neurónových sietí a implementácia jednoduchého programu s grafickým znázornením neurónovej siete, ktorý bude simulovať Boolove funkcie pomocou prahových logických neurónov.
', 1);
INSERT INTO projects VALUES (32, 'DP', 566, NULL, 52, '2005/2006', 'Adaptívna kombinácia lokálnych neurónových sietí', 'Adaptívna kombinácia lokálnych neurónových sietí', NULL, NULL, 1);
INSERT INTO projects VALUES (33, 'ZP', 517, NULL, 53, '2004/2005', 'Vizualizácia parametrov komunikačných protokolov na nespoľahlivých sieťach', 'Visualization of parameters on communication protocols in unreliable networks', 'Cieľom práce je simulovať vybrané typy komunikačných protokolov na nespoľahlivých počítačových sieťach s náhodne chybnými linkami/uzlami.
Analyzujte, navrhnite a simulujte problém uvedených komunikačných protokolov na vybraných topológiách. Pre nasimulované protokoly je tiež potrebné vyhodnotiť a spracovať ich vlastnosti správania sa.', 'Cieľom práce je simulovať vybrané typy komunikačných protokolov na nespoľahlivých počítačových sieťach s náhodne chybnými linkami/uzlami.
Analyzujte, navrhnite a simulujte problém uvedených komunikačných protokolov na vybraných topológiách. Pre nasimulované protokoly je tiež potrebné vyhodnotiť a spracovať ich vlastnosti správania sa.', 1);
INSERT INTO projects VALUES (34, 'DP', 374, NULL, 53, '2005/2006', 'Možnosti ochrany mobilných agentov', 'Možnosti ochrany mobilných agentov', NULL, NULL, 1);
INSERT INTO projects VALUES (35, 'ZP', 388, NULL, 54, '2003/2004', 'OOP  pomocou príkladov', 'OOP using examples', 'Analyzujte metódy tvorby a prezentácie znalostí z oblasti programovania vo forme riešených príkladov s využitím hypertextu. Analyzujte výsledky prác vytvorených v tejto oblasti v rámci študentských projektov na KIVT v minulých rokoch. 
Navrhnite a implementujte softvérovú aplikáciu, ktorá umožní tvorbu, prezentáciu, použitie a údržbu príručky objektovo orientovaného programovania vo forme riešených príkladov.  
Navrhnite jednoduchú príručku riešených príkladov  OOP v jazyku C++.  Vaše riešenie softvérovej aplikácie overte tým, že pomocou implementovaného protototypu vytvoríte a prezentujete navrhnutú príručku.', 'Analyzujte metódy tvorby a prezentácie znalostí z oblasti programovania vo forme riešených príkladov s využitím hypertextu. Analyzujte výsledky prác vytvorených v tejto oblasti v rámci študentských projektov na KIVT v minulých rokoch. 
Navrhnite a implementujte softvérovú aplikáciu, ktorá umožní tvorbu, prezentáciu, použitie a údržbu príručky objektovo orientovaného programovania vo forme riešených príkladov.  
Navrhnite jednoduchú príručku riešených príkladov  OOP v jazyku C++.  Vaše riešenie softvérovej aplikácie overte tým, že pomocou implementovaného protototypu vytvoríte a prezentujete navrhnutú príručku.', 1);
INSERT INTO projects VALUES (36, 'DP', 20, NULL, 54, '2005/2006', 'Riešenie úloh pomocou prístupov založených architekturálnom biase', 'Riešenie úloh pomocou prístupov založených architekturálnom biase', NULL, NULL, 1);
INSERT INTO projects VALUES (37, 'ZP', 541, NULL, 55, '2004/2005', 'Dispečerský systém', 'Dispatcher system', 'Vytvorte program pre dispečerský systém pre montérov. Jedná sa o mobilné zariadenie do auta. Má GPS a na komunikáciu využíva GPRS Orange. Musí umožňovať sledovať polohu auta, robiť archív jázd, zadávať montérovi úlohy, navigovať ho a umožniť mu komunikovať s dispečerom.', 'Vytvorte program pre dispečerský systém pre montérov. Jedná sa o mobilné zariadenie do auta. Má GPS a na komunikáciu využíva GPRS Orange. Musí umožňovať sledovať polohu auta, robiť archív jázd, zadávať montérovi úlohy, navigovať ho a umožniť mu komunikovať s dispečerom.', 1);
INSERT INTO projects VALUES (38, 'DP', 97, NULL, 55, '2005/2006', 'Generovanie zdrojového kódu z UML 2.0 diagramov ', 'Generovanie zdrojového kódu z UML 2.0 diagramov ', NULL, NULL, 1);
INSERT INTO projects VALUES (39, 'DP', 24, NULL, 56, '2005/2006', 'Určovanie autorstva textového dokumentu', 'Určovanie autorstva textového dokumentu', NULL, NULL, 4);
INSERT INTO projects VALUES (40, 'ZP', 660, NULL, 56, '2003/2004', 'Podpora výučby programovania pomocou príkladov', 'Podpora výučby programovania pomocou príkladov', 'Analyzujte metódy tvorby a prezentácie znalostí z oblasti programovania vo forme riešených príkladov s využitím hypertextu. Vychádzajte pri tom z modelu hypertextového dokumentu, ktorý zahĹ•ňa takéto znalosti z oblasti tvorby programov v programovacích jazykoch lisp a prolog (použitý v existujúcom softvérovom prototype, ktorý bol prvýkrát nasadený v akademickom roku 2002/2003 v predmete Funkcionálne a logické programovanie). Navrhnite softvérovú aplikáciu, ktorá umožní napĺňanie informačného obsahu takéhoto systému. Ďalej navrhnite modifikácie existujúceho systému tak, aby to odrážalo výsledky analýzy. Navrhnuté riešenie overte implementovaním softvérového prototypu.  ', 'Analyzujte metódy tvorby a prezentácie znalostí z oblasti programovania vo forme riešených príkladov s využitím hypertextu. Vychádzajte pri tom z modelu hypertextového dokumentu, ktorý zahĹ•ňa takéto znalosti z oblasti tvorby programov v programovacích jazykoch lisp a prolog (použitý v existujúcom softvérovom prototype, ktorý bol prvýkrát nasadený v akademickom roku 2002/2003 v predmete Funkcionálne a logické programovanie). Navrhnite softvérovú aplikáciu, ktorá umožní napĺňanie informačného obsahu takéhoto systému. Ďalej navrhnite modifikácie existujúceho systému tak, aby to odrážalo výsledky analýzy. Navrhnuté riešenie overte implementovaním softvérového prototypu.  ', 1);
INSERT INTO projects VALUES (41, 'DP', 433, NULL, 57, '2005/2006', 'Katalóg softvérových znalostí s modelovaním variablity', 'Katalóg softvérových znalostí s modelovaním variablity', NULL, NULL, 1);
INSERT INTO projects VALUES (42, 'ZP', 541, NULL, 57, '2003/2004', 'Archivačný systém pre manažment projektov', 'Archiving system for project management', 'Urobte prieskum trhu a analyzujte dostupné archivačné systémy pre manažment projektov. Špecifikujte požadované vlastnosti takéhoto systému.  Navrhnite funkčný model inteligentného archivačného systému pre manažment projektov. Navrhnutý systém implementujte vo vybratom prostredí. Funkčnosť systému demonštrujte na vybratom príklade', 'Urobte prieskum trhu a analyzujte dostupné archivačné systémy pre manažment projektov. Špecifikujte požadované vlastnosti takéhoto systému.  Navrhnite funkčný model inteligentného archivačného systému pre manažment projektov. Navrhnutý systém implementujte vo vybratom prostredí. Funkčnosť systému demonštrujte na vybratom príklade', 1);
INSERT INTO projects VALUES (43, 'ZP', 382, NULL, 58, '2004/2005', 'Riešenie hry evolučným algoritmom', 'Solving a game with evolution algorithm', 'Problém „deviatka“ – vyriešte detskú hru, pri ktorej máte 9 políčok v štvorci, na ktorom je rozmiestnených 8 kociek očíslovaných od 1 po 8 a vy ich máte usporiadať posúvaním tak, aby išli podľa veľkosti po riadkoch. Zadávate počiatočný stav. Na riešenie použite jednu z „ostatných techník riešenia“ a evolučný algoritmus. Zobecniete úlohu na obdĺžnik n x m. Vyrobte grafy so štatistickými meraniami (priemer, maximum, minimum, smerodajná odchýlka) závislosti rýchlosti nájdeného riešenia na čase s veľkosťou problému.
Porovnajte, ktorá z metód je lepšia v zmysle optimality (počtu posunov, resp. kvality riešenia – koľko kociek je ešte neusporiadaných) a celkovej optimality (najlepšie riešenie za minimum času s minimom použitej pamäti).

', 'Problém „deviatka“ – vyriešte detskú hru, pri ktorej máte 9 políčok v štvorci, na ktorom je rozmiestnených 8 kociek očíslovaných od 1 po 8 a vy ich máte usporiadať posúvaním tak, aby išli podľa veľkosti po riadkoch. Zadávate počiatočný stav. Na riešenie použite jednu z „ostatných techník riešenia“ a evolučný algoritmus. Zobecniete úlohu na obdĺžnik n x m. Vyrobte grafy so štatistickými meraniami (priemer, maximum, minimum, smerodajná odchýlka) závislosti rýchlosti nájdeného riešenia na čase s veľkosťou problému.
Porovnajte, ktorá z metód je lepšia v zmysle optimality (počtu posunov, resp. kvality riešenia – koľko kociek je ešte neusporiadaných) a celkovej optimality (najlepšie riešenie za minimum času s minimom použitej pamäti).

', 1);
INSERT INTO projects VALUES (44, 'DP', 97, NULL, 58, '2005/2006', 'Refaktorizácia objektových štruktúr', 'Refaktorizácia objektových štruktúr', NULL, NULL, 1);
INSERT INTO projects VALUES (45, 'ZP', 541, NULL, 59, '2004/2005', 'Dispečerský systém', 'Dispatching System', 'Vytvorte program pre dispečerský systém pre montérov. Jedná sa o mobilné zariadenie do auta. Má GPS a na komunikáciu využíva GPRS Orange. Musí umožňovať sledovať polohu auta, robiť archív jázd, zadávať montérovi úlohy, navigovať ho a umožniť mu komunikovať s dispečerom.', 'Vytvorte program pre dispečerský systém pre montérov. Jedná sa o mobilné zariadenie do auta. Má GPS a na komunikáciu využíva GPRS Orange. Musí umožňovať sledovať polohu auta, robiť archív jázd, zadávať montérovi úlohy, navigovať ho a umožniť mu komunikovať s dispečerom.', 1);
INSERT INTO projects VALUES (46, 'DP', 43, NULL, 59, '2005/2006', 'Paralelné prehľadávanie herného stromu', 'Paralelné prehľadávanie herného stromu', NULL, NULL, 1);
INSERT INTO projects VALUES (47, 'DP', 374, NULL, 60, '2005/2006', 'Štruktúrovaný hráč pre simulované hry typu RoboCup', 'Štruktúrovaný hráč pre simulované hry typu RoboCup', NULL, NULL, 1);
INSERT INTO projects VALUES (48, 'ZP', 98, NULL, 60, '2004/2005', 'Systém pre odovzdávanie prác prostredníctvom Internetu', 'Systém na odovzdávanie prác prostredníctvom internetu', 'C# je pomerne nový jazyk, ktorý vycháza z jazyka C++  a z jazyka Java. Naštudujte tento programovací jazyk a posúďte jeho možnosti ako prostriedku pre tvorbu webovských aplikácii.
Na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu pre odovzdávanie prác prostredníctvom Internetu.
', 'C# je pomerne nový jazyk, ktorý vycháza z jazyka C++  a z jazyka Java. Naštudujte tento programovací jazyk a posúďte jeho možnosti ako prostriedku pre tvorbu webovských aplikácii.
Na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu pre odovzdávanie prác prostredníctvom Internetu.
', 1);
INSERT INTO projects VALUES (49, 'ZP', 579, NULL, 61, '2004/2005', 'Multimediálne informácie v regionálnom IS', 'Multimedia information in regional IS', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie existujúceho základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb FIIT.', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie existujúceho základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb FIIT.', 1);
INSERT INTO projects VALUES (50, 'DP', 388, NULL, 61, '2005/2006', 'Správa a publikovanie dokumentov  v prostredí sémantického webu.', 'Správa a publikovanie dokumentov  v prostredí sémantického webu.', NULL, NULL, 1);
INSERT INTO projects VALUES (51, 'ZP', 566, NULL, 62, '2004/2005', 'Použitie simulovaného žíhania k globálnej optimalizácii funkcií', 'Použitie simulovaného žíhania k globálnej optimalizácii funkcií', 'Simulované žíhanie patrí v súčasnosti medzi efektívne metódy globálnej optimalizácie funkcií. Riešenie je založené na fyzikálnej analógii ochladzovania tuhého telesa, v ktorom sú štrukturálne poruchy. Riešenie daneho optimalizačného problému je formálne chápané ako systém, ktorého funkčná hodnota popisuje vnútornú energiu. Cieľom je nájsť také riešenie, ktoré minimalizuje vnútornú energiu modelového systému, t.j. funkčnú hodnotu. Metóda je zahájená počiatočnou teplotou, ktorá špecifikuje pravdepodobonosť akceptovania nového riešenia, ktoré vznikne malou poruchou z pôvodného riešenia. Čím je teplota vyššia, tým s väčšou pravdepodobnosťou akceptujeme nové riešenie. V priebehu výpočtu teplotu postupne znižujeme. Na záver, keď je teplota malá, akceptujú sa obvykle len také riešenia, ktoré nie sú horšie od pôvodného. Dá sa dokázať, že tento postup musí konvergovať k riešeniu, ktoré je veľmi blízke globálnemu riešeniu. Preštudujte metódu a napíšte jej teoretický prehľad. Ďalej navrhnite jej jednoduchú implementáciu a návrh realizujte v jazyku Pascal alebo C.', 'Simulované žíhanie patrí v súčasnosti medzi efektívne metódy globálnej optimalizácie funkcií. Riešenie je založené na fyzikálnej analógii ochladzovania tuhého telesa, v ktorom sú štrukturálne poruchy. Riešenie daneho optimalizačného problému je formálne chápané ako systém, ktorého funkčná hodnota popisuje vnútornú energiu. Cieľom je nájsť také riešenie, ktoré minimalizuje vnútornú energiu modelového systému, t.j. funkčnú hodnotu. Metóda je zahájená počiatočnou teplotou, ktorá špecifikuje pravdepodobonosť akceptovania nového riešenia, ktoré vznikne malou poruchou z pôvodného riešenia. Čím je teplota vyššia, tým s väčšou pravdepodobnosťou akceptujeme nové riešenie. V priebehu výpočtu teplotu postupne znižujeme. Na záver, keď je teplota malá, akceptujú sa obvykle len také riešenia, ktoré nie sú horšie od pôvodného. Dá sa dokázať, že tento postup musí konvergovať k riešeniu, ktoré je veľmi blízke globálnemu riešeniu. Preštudujte metódu a napíšte jej teoretický prehľad. Ďalej navrhnite jej jednoduchú implementáciu a návrh realizujte v jazyku Pascal alebo C.', 1);
INSERT INTO projects VALUES (52, 'DP', 566, NULL, 62, '2005/2006', 'Štúdium vlastnosti algoritmov kvantového počítania pomocou programu Mathematica', 'Štúdium vlastnosti algoritmov kvantového počítania pomocou programu Mathematica', NULL, NULL, 1);
INSERT INTO projects VALUES (53, 'ZP', 31, NULL, 63, '2004/2005', 'Automatické rozmiestňovanie grafov v aplikácii EGRET', 'Automatic graph deployment in application EGRET', 'Aplikácia EGRET  umožňuje pohodlnú prácu s grafmi udalostí. Naštudujte architektúru  a implementáciu aplikácie EGRET so zameraním na tvorbu zásuvných modulov pre túto aplikáciu. Analyzujte existujúce algoritmy pre kreslenie grafov. Navrhnite a implementujte zásuvný modul, ktorý umožní automatické rozmiestnenie grafu v aplikácii EGRET. Implementácia  v jazyku C++, Win32. ', 'Aplikácia EGRET  umožňuje pohodlnú prácu s grafmi udalostí. Naštudujte architektúru  a implementáciu aplikácie EGRET so zameraním na tvorbu zásuvných modulov pre túto aplikáciu. Analyzujte existujúce algoritmy pre kreslenie grafov. Navrhnite a implementujte zásuvný modul, ktorý umožní automatické rozmiestnenie grafu v aplikácii EGRET. Implementácia  v jazyku C++, Win32. ', 1);
INSERT INTO projects VALUES (54, 'DP', 10, NULL, 63, '2005/2006', 'Simulovaný robotický futbal - automatizované učenie', 'Simulovaný robotický futbal - automatizované učenie', NULL, NULL, 1);
INSERT INTO projects VALUES (55, 'ZP', 294, NULL, 64, '2004/2005', 'Distribuované simulačné prostredie založené na technike Web3D ', 'Distributed simulation environment based on Web3D technique', 'Naštudujte existujúce riešenia,  urobte analýzu existujúcich systémov pre distribuovanú simuláciu pohybu 3D modelov v distribuovanom  prostredí Web3D  (http://www.web3d.org) založenom na VRML  (http://www.vrml.org) alebo EONReality (http://www.eonreality.com) reality pre internet. Urobte experimenty s jednoduchou scénou tak, aby mohli objekty scény ovládať viaceré osoby z rôznych klientských počítačov. Realizujte  s adaptovaným  a modifikovaným alebo vlastným vyvinutým prostredím jednoduchú aplikáciu zameranú na e-vzdelávanie, napríklad kooperatívne experimenty vo virtuálnom laboratóriu. 

', 'Naštudujte existujúce riešenia,  urobte analýzu existujúcich systémov pre distribuovanú simuláciu pohybu 3D modelov v distribuovanom  prostredí Web3D  (http://www.web3d.org) založenom na VRML  (http://www.vrml.org) alebo EONReality (http://www.eonreality.com) reality pre internet. Urobte experimenty s jednoduchou scénou tak, aby mohli objekty scény ovládať viaceré osoby z rôznych klientských počítačov. Realizujte  s adaptovaným  a modifikovaným alebo vlastným vyvinutým prostredím jednoduchú aplikáciu zameranú na e-vzdelávanie, napríklad kooperatívne experimenty vo virtuálnom laboratóriu. 

', 1);
INSERT INTO projects VALUES (56, 'DP', 11, 297, 64, '2005/2006', 'Vývojový nástroj pre správu riadiacich údajov v informačných systémoch', 'Vývojový nástroj pre správu riadiacich údajov v informačných systémoch', NULL, NULL, 1);
INSERT INTO projects VALUES (57, 'ZP', 20, NULL, 65, '2004/2005', 'Editor neurónových sietí', 'Editor of recurent neural networks', 'Rekurentné neurónové siete sú na rozdiel od klasických dopredných neurónových sietí schopné spracovávať vstupy s časopriestorovou štruktúrou. Existujú rôzne architektúry rekurentných sietí s rôznymi schopnosťami z hľadiska spracovania vstupných dát.
Naštudujte problematiku neurónových sietí a rekurentných neurónových sietí, zamerajte sa na možnosti zakódovania architektúry neurónových sietí vzhľadom na potreby trénovacích algoritmov. Vytvorte editor umožňujúci používateľovi vytvoriť neurónovú sieť využívajúci navrhnutý formát.', 'Rekurentné neurónové siete sú na rozdiel od klasických dopredných neurónových sietí schopné spracovávať vstupy s časopriestorovou štruktúrou. Existujú rôzne architektúry rekurentných sietí s rôznymi schopnosťami z hľadiska spracovania vstupných dát.
Naštudujte problematiku neurónových sietí a rekurentných neurónových sietí, zamerajte sa na možnosti zakódovania architektúry neurónových sietí vzhľadom na potreby trénovacích algoritmov. Vytvorte editor umožňujúci používateľovi vytvoriť neurónovú sieť využívajúci navrhnutý formát.', 1);
INSERT INTO projects VALUES (58, 'DP', 98, NULL, 65, '2005/2006', 'Nástroj na vytváranie učebných textov', 'Nástroj na vytváranie učebných textov', NULL, NULL, 1);
INSERT INTO projects VALUES (59, 'ZP', 447, NULL, 66, '2004/2005', 'Observatórium jazykov v priestore WWW', 'Language Observatory Project in World Wide Web', 'Celosvetová sieť WWW obsahuje obrovské množstvo textových dokumentov napísaných v rôznych prirodzených jazykoch (slovenčina, angličtina a pod.). Analyzujte problematiku identifikácie jazyka textového dokumentu v sieti WWW. Navrhnite spôsob identifikácie vybraných jazykov, v ktorých sú textové dokumenty napísané a navrhnuté riešenie overte implementovaním softvérového nástroja na ich klasifikáciu. Pri experimentoch s navrhnutou metódou použite obsah webu v štruktúrovanej podobe získaný v rámci projektu Language Observatory (http://www.language-observatory.org/) - tento bude pri riešení projektu dostupný.', 'Celosvetová sieť WWW obsahuje obrovské množstvo textových dokumentov napísaných v rôznych prirodzených jazykoch (slovenčina, angličtina a pod.). Analyzujte problematiku identifikácie jazyka textového dokumentu v sieti WWW. Navrhnite spôsob identifikácie vybraných jazykov, v ktorých sú textové dokumenty napísané a navrhnuté riešenie overte implementovaním softvérového nástroja na ich klasifikáciu. Pri experimentoch s navrhnutou metódou použite obsah webu v štruktúrovanej podobe získaný v rámci projektu Language Observatory (http://www.language-observatory.org/) - tento bude pri riešení projektu dostupný.', 1);
INSERT INTO projects VALUES (60, 'DP', 447, NULL, 66, '2005/2006', 'Identifikácia prirodzených jazykov na webe', 'Identifikácia prirodzených jazykov na webe', NULL, NULL, 1);
INSERT INTO projects VALUES (61, 'ZP', 260, NULL, 67, '2004/2005', 'Prostriedky pre heuristické definovanie bezpečnostnej politiky', 'Tools for heuristic definition of security policy', 'Analyzujte možnosti sledovania operácií používateľa nad súborovým systémom a spracovania nazbieraných údajov.  Navrhnite a vytvorte nástroj, ktorý umožní sledovať činnosti používateľa v systéme, ktoré sú relevantné z pohľadu definovania bezpečnostnej politiky riadenia prístupu. Príkladom môžu byť súbory, ku ktorým používateľ pristupuje, ich klasifikácia časová (kedy pristupuje, ako často, ...) aj priestorová (umiestenie v súborovom systéme, ...), spôsob prístupu (čítanie, zápis, vykonanie, pridávanie, ...) ako aj sledovanie postupností prístupov. Výstupy nástroja štatisticky spracujte a vytvorte základ profilu používateľa.', 'Analyzujte možnosti sledovania operácií používateľa nad súborovým systémom a spracovania nazbieraných údajov.  Navrhnite a vytvorte nástroj, ktorý umožní sledovať činnosti používateľa v systéme, ktoré sú relevantné z pohľadu definovania bezpečnostnej politiky riadenia prístupu. Príkladom môžu byť súbory, ku ktorým používateľ pristupuje, ich klasifikácia časová (kedy pristupuje, ako často, ...) aj priestorová (umiestenie v súborovom systéme, ...), spôsob prístupu (čítanie, zápis, vykonanie, pridávanie, ...) ako aj sledovanie postupností prístupov. Výstupy nástroja štatisticky spracujte a vytvorte základ profilu používateľa.', 1);
INSERT INTO projects VALUES (62, 'DP', 260, NULL, 67, '2005/2006', 'Detekcia neštandardných stavov v operačnom systéme', 'Detekcia neštandardných stavov v operačnom systéme', NULL, NULL, 1);
INSERT INTO projects VALUES (63, 'DP', 584, NULL, 68, '2005/2006', 'Bezpečnosť v grid computingu.', 'Bezpečnosť v grid computingu.', NULL, NULL, 0);
INSERT INTO projects VALUES (64, 'ZP', 358, NULL, 68, '2004/2005', 'Testovanie bezpečnostných slabín počítačových sietí', 'Testing the security weaknesses of computer networks', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy bezpečnostných slabín. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú testovať vybraté typy bezpečnostných slabín na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy bezpečnostných slabín. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú testovať vybraté typy bezpečnostných slabín na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.', 0);
INSERT INTO projects VALUES (65, 'ZP', 588, 563, 69, '2004/2005', 'Identifikačné systémy', 'Identification systems', 'Analyzujte technické a programové prostredie pre realizáciu identifikačných systémov. Porovnajte kontaktné a bezdrôtové systémy uvedené (minimálne od dvoch výrobcov) na základe definovaných technických parametrov. Navrhnite obvodovú schému pre jednoduchý identifikačný systém riadený vhodným mikroprocesorom. Napíšte a overte program pre riadenie mikroprocesoru.

', 'Analyzujte technické a programové prostredie pre realizáciu identifikačných systémov. Porovnajte kontaktné a bezdrôtové systémy uvedené (minimálne od dvoch výrobcov) na základe definovaných technických parametrov. Navrhnite obvodovú schému pre jednoduchý identifikačný systém riadený vhodným mikroprocesorom. Napíšte a overte program pre riadenie mikroprocesoru.

', 0);
INSERT INTO projects VALUES (66, 'DP', 357, NULL, 69, '2005/2006', 'Princípy a vizualizácia STP', 'Princípy a vizualizácia STP', NULL, NULL, 0);
INSERT INTO projects VALUES (67, 'ZP', 358, NULL, 70, '2004/2005', 'Testovanie bezpečnostných slabín počítačových sietí', 'Testing for Security Vulnerabilities of Computer Networks', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy bezpečnostných slabín. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú testovať vybraté typy bezpečnostných slabín na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy bezpečnostných slabín. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú testovať vybraté typy bezpečnostných slabín na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.', 0);
INSERT INTO projects VALUES (68, 'DP', 375, NULL, 70, '2005/2006', 'Meranie  a vyhodnocovanie parametrov kvality služieb v TCP/IP sieťach', 'Meranie  a vyhodnocovanie parametrov kvality služieb v TCP/IP sieťach', NULL, NULL, 0);
INSERT INTO projects VALUES (69, 'ZP', 25, NULL, 71, '2004/2005', 'Klasifikácia používateľov a súborov na základe ich vzájomných interakcií', 'Classification of users and files based upon their mutual interactions', 'Navrhnite spôsob zbierania relevantných informácií o prístupoch používateľov k súborom. Na základe týchto informácií zvoľte vhodný model pre klasifikáciu používateľov a súborov podľa ich podobných vlastností a vzájomných súvislostí, pričom zohľadnite aj typické postupnosti v skúmaných údajoch. Implementujte nástroj (napr. v podobe modulu jadra OS) ktorý umožní zaznamenávať potrebné údaje počas bežnej prevádzky (on-line). Získané údaje vyhodnoťte podľa navrhnutého modelu skupín podobných súborov a používateľov.', 'Navrhnite spôsob zbierania relevantných informácií o prístupoch používateľov k súborom. Na základe týchto informácií zvoľte vhodný model pre klasifikáciu používateľov a súborov podľa ich podobných vlastností a vzájomných súvislostí, pričom zohľadnite aj typické postupnosti v skúmaných údajoch. Implementujte nástroj (napr. v podobe modulu jadra OS) ktorý umožní zaznamenávať potrebné údaje počas bežnej prevádzky (on-line). Získané údaje vyhodnoťte podľa navrhnutého modelu skupín podobných súborov a používateľov.', 0);
INSERT INTO projects VALUES (70, 'DP', 298, NULL, 71, '2005/2006', 'Virtuálna univerzita', 'Virtuálna univerzita', NULL, NULL, 0);
INSERT INTO projects VALUES (71, 'DP', 359, NULL, 72, '2005/2006', 'Programová podpora simulácie vybraných hybridných ARQ metód.', 'Programová podpora simulácie vybraných hybridných ARQ metód.', NULL, NULL, 0);
INSERT INTO projects VALUES (72, 'ZP', 25, NULL, 72, '2004/2005', 'Systém pre podporu výučby peer-to-peer technológie', 'System for support learning of Peer-to-peer technology', 'Vytvorte prehľad existujúcich riešení v oblasti technológie p2p. V analýze sa sústreďte na opis existujúcich riešení neštrukturovaných, semi-štrukturovaných a štrukturovaných p2p sietí, na ich vzájomné kvantitatívne a kvalitatívne porovnanie a doterajšie výsledky ich zapracovania do technológie grid. Vytvorte niekoľko vizualizácií pre ukážku štruktúry a funkcie. Navrhnite a implementujte jednoduchý systém demonštrujúci možnosti rozkladania záťaže na úrovni úloh v sieti počítačov (cluster). ', 'Vytvorte prehľad existujúcich riešení v oblasti technológie p2p. V analýze sa sústreďte na opis existujúcich riešení neštrukturovaných, semi-štrukturovaných a štrukturovaných p2p sietí, na ich vzájomné kvantitatívne a kvalitatívne porovnanie a doterajšie výsledky ich zapracovania do technológie grid. Vytvorte niekoľko vizualizácií pre ukážku štruktúry a funkcie. Navrhnite a implementujte jednoduchý systém demonštrujúci možnosti rozkladania záťaže na úrovni úloh v sieti počítačov (cluster). ', 0);
INSERT INTO projects VALUES (73, 'ZP', 431, NULL, 73, '2004/2005', 'Multimediálny výučbový modul pre Petriho siete', 'Multimedial education module for Petri nets', 'Analyzujte problematiku tvorby multimediálnych výučbových systémov. Na základe analýzy navrhnite a implementujte multimediálny výučbový modul pre podporu výučby Petriho sietí v rozsahu predmetu Špecifikačné a opisné jazyky.  Navrhnutý modul by mal vhodným názorným spôsobom prezentovať učivo, umožniť cvičné testovanie získaných vedomostí a podporovať aj získavanie praktických zručností v návrhu Petriho sietí.', 'Analyzujte problematiku tvorby multimediálnych výučbových systémov. Na základe analýzy navrhnite a implementujte multimediálny výučbový modul pre podporu výučby Petriho sietí v rozsahu predmetu Špecifikačné a opisné jazyky.  Navrhnutý modul by mal vhodným názorným spôsobom prezentovať učivo, umožniť cvičné testovanie získaných vedomostí a podporovať aj získavanie praktických zručností v návrhu Petriho sietí.', 0);
INSERT INTO projects VALUES (74, 'DP', 431, NULL, 73, '2005/2006', 'Podpora dištančného vzdelávania v predmete Špecifikačné a opisné jazyky', 'Podpora dištančného vzdelávania v predmete Špecifikačné a opisné jazyky', NULL, NULL, 0);
INSERT INTO projects VALUES (75, 'ZP', 359, NULL, 74, '2004/2005', 'Systémy so skupinovou obsluhou a skupinovými príchodmi', 'Systems with group servicing and group incoming', 'Vytvorte programové riešenie pre výpočet základných charakteristík daných systémov s ohľadom na ich neerlangovské správanie. Urobte jednu zvolenú stredohodnotovú analýzu. Urobte jednoduchú grafickú vizualizáciu procesu.', 'Vytvorte programové riešenie pre výpočet základných charakteristík daných systémov s ohľadom na ich neerlangovské správanie. Urobte jednu zvolenú stredohodnotovú analýzu. Urobte jednoduchú grafickú vizualizáciu procesu.', 0);
INSERT INTO projects VALUES (76, 'DP', 360, NULL, 74, '2005/2006', 'Nedokonalosti v realizácii kombinačných logických obvodov, HTML aplikácia', 'Nedokonalosti v realizácii kombinačných logických obvodov, HTML aplikácia', NULL, NULL, 0);
INSERT INTO projects VALUES (77, 'DP', 431, NULL, 75, '2005/2006', 'Podpora dištančného vzdelávania v predmete Špecifikačné a opisné jazyky', 'Podpora dištančného vzdelávania v predmete Špecifikačné a opisné jazyky', NULL, NULL, 0);
INSERT INTO projects VALUES (78, 'ZP', 431, NULL, 75, '2004/2005', 'Multimediálny výučbový modul pre SystemC', 'Multimedial learning module for SystemC', 'Analyzujte problematiku tvorby multimediálnych výučbových systémov. Na základe analýzy navrhnite a implementujte multimediálny výučbový modul pre podporu výučby jazyka SystemC. Navrhnutý modul by mal vhodným názorným spôsobom prezentovať učivo, umožniť cvičné testovanie získaných vedomostí a podporovať aj získavanie praktických zručností v návrhu SystemC modelov.', 'Analyzujte problematiku tvorby multimediálnych výučbových systémov. Na základe analýzy navrhnite a implementujte multimediálny výučbový modul pre podporu výučby jazyka SystemC. Navrhnutý modul by mal vhodným názorným spôsobom prezentovať učivo, umožniť cvičné testovanie získaných vedomostí a podporovať aj získavanie praktických zručností v návrhu SystemC modelov.', 0);
INSERT INTO projects VALUES (79, 'ZP', 13, 431, 76, '2004/2005', 'Priebežná diagnostika a návrh kontrolórov ', 'On-line testing and design of checkers', 'Preštudujte metodiky priebežnej diagnostiky, návrhy kontrolórov pre digitálne obvody. Opíšte ich funkčnost vo VHDL. Navrhnite systém pre automatickú syntézu vybraných blokov priebežnej diagnostiky k obvodom modelovaným vo VHDL. Systém implementujte v jazyku JAVA, funkčnosť overte na príkladoch. ', 'Preštudujte metodiky priebežnej diagnostiky, návrhy kontrolórov pre digitálne obvody. Opíšte ich funkčnost vo VHDL. Navrhnite systém pre automatickú syntézu vybraných blokov priebežnej diagnostiky k obvodom modelovaným vo VHDL. Systém implementujte v jazyku JAVA, funkčnosť overte na príkladoch. ', 0);
INSERT INTO projects VALUES (80, 'DP', 13, 301, 76, '2005/2006', 'E-systém pre priebežnú diagnostiku', 'E-systém pre priebežnú diagnostiku', NULL, NULL, 0);
INSERT INTO projects VALUES (81, 'DP', 19, NULL, 78, '2005/2006', 'Vytvorenie a udržiavanie modelu používateľa', 'Vytvorenie a udržiavanie modelu používateľa', NULL, NULL, 1);
INSERT INTO projects VALUES (82, 'DP', 301, NULL, 80, '2005/2006', 'Multimediálny výučbový systém pre Architektúru počítačov', 'Multimediálny výučbový systém pre Architektúru počítačov', NULL, NULL, 0);
INSERT INTO projects VALUES (83, 'ZP', 375, NULL, 81, '2004/2005', 'Prostriedky pre podporu výučby počítačových sietí', 'Tools for teaching support of computer networking', 'Analyzujte rôzne systémy zaoberajúce sa problematikou efektívnej výučby
počítačových sietí - od jednoduchého zobrazovania komunikácie po multimediálne systémy.  Navrhnite a implementujte vývojove prostredie pre jednoduché vytváranie komunikačných modulov a aplikácií nad API rozhraním. Navrhite niekoľko jednoduchých sieťových aplikácií, ktorými overíte funkčnosť riešenia.    ', 'Analyzujte rôzne systémy zaoberajúce sa problematikou efektívnej výučby
počítačových sietí - od jednoduchého zobrazovania komunikácie po multimediálne systémy.  Navrhnite a implementujte vývojove prostredie pre jednoduché vytváranie komunikačných modulov a aplikácií nad API rozhraním. Navrhite niekoľko jednoduchých sieťových aplikácií, ktorými overíte funkčnosť riešenia.    ', 0);
INSERT INTO projects VALUES (84, 'DP', 270, NULL, 81, '2005/2006', 'Sprístupňovanie dokumentov s využitím metadát', 'Sprístupňovanie dokumentov s využitím metadát', NULL, NULL, 4);
INSERT INTO projects VALUES (85, 'ZP', 297, NULL, 83, '2003/2004', 'Spájanie programov v rôznych programovacích jazykoch', 'Spájanie programov v rôznych programovacích jazykoch', 'Analyzujte spôsoby a metódy spojenia dvoch programovacích jazykov do výsledného programu. Urobte zhodnotenie podľa najvhodnejších kritérií. Napíšte niekoľko  jednoduchých príkladov , ktoré poslúžia na porovnanie vybraných metód. Vypracujte príručku s návodom na používanie daných metód v zvolenom implementačnom prostredí. Vyberte najlepšiu metódu, ktorou docielite s čo najmenšou námahou efektívnejší výsledný program', 'Analyzujte spôsoby a metódy spojenia dvoch programovacích jazykov do výsledného programu. Urobte zhodnotenie podľa najvhodnejších kritérií. Napíšte niekoľko  jednoduchých príkladov , ktoré poslúžia na porovnanie vybraných metód. Vypracujte príručku s návodom na používanie daných metód v zvolenom implementačnom prostredí. Vyberte najlepšiu metódu, ktorou docielite s čo najmenšou námahou efektívnejší výsledný program', 1);
INSERT INTO projects VALUES (86, 'DP', 401, NULL, 83, '2005/2006', 'Predikčné dolovanie v dátach pomocou modelových stromov', 'Predikčné dolovanie v dátach pomocou modelových stromov', NULL, NULL, 4);
INSERT INTO projects VALUES (87, 'ZP', 357, NULL, 85, '2004/2005', 'Web aplikácia na interkatívnu registráciu používateľských údajov', 'Web application for interactive registration of user’s data', 'Analyzujte a navrhnite bezpečný interaktívny web na registráciu klientov, ktorý umožní ukladanie a editovanie údajov klientov do databázy.
Analyzujte využitie rôznych implementačných nástrojov ako aj vhodnosti operačných systémov.
Realizujte funkčný model takéhoto  systému na báze Linuxu, PHP a MySQL databázy.
Otestujte funkčnosť, stabilitu systému.
', 'Analyzujte a navrhnite bezpečný interaktívny web na registráciu klientov, ktorý umožní ukladanie a editovanie údajov klientov do databázy.
Analyzujte využitie rôznych implementačných nástrojov ako aj vhodnosti operačných systémov.
Realizujte funkčný model takéhoto  systému na báze Linuxu, PHP a MySQL databázy.
Otestujte funkčnosť, stabilitu systému.
', 0);
INSERT INTO projects VALUES (88, 'DP', 437, NULL, 85, '2005/2006', 'Odporúčanie webových stránok so zaujímavou informáciou pomocou včiel', 'Odporúčanie webových stránok so zaujímavou informáciou pomocou včiel', NULL, NULL, 4);
INSERT INTO projects VALUES (89, 'ZP', 298, NULL, 86, '2004/2005', 'Multimediálna prezentácia informácií', 'Multimedia Presentation Of Information', 'Analyzujte možnosti multimediálnej prezentácie informácií. Navrhnite a implementujte výučbový systém pre prezentáciu informácií z predmetu Periférne zariadenia – témy 6 až 10. Systém má obsahovať možnosť poskytnúť záujemcovi študijné materiály, ako aj mechanizmy overovania znalostí naštudovaných textov.', 'Analyzujte možnosti multimediálnej prezentácie informácií. Navrhnite a implementujte výučbový systém pre prezentáciu informácií z predmetu Periférne zariadenia – témy 6 až 10. Systém má obsahovať možnosť poskytnúť záujemcovi študijné materiály, ako aj mechanizmy overovania znalostí naštudovaných textov.', 0);
INSERT INTO projects VALUES (90, 'DP', 387, NULL, 86, '2005/2006', 'Odporúčanie pomocou asociačných pravidiel', 'Odporúčanie pomocou asociačných pravidiel', NULL, NULL, 4);
INSERT INTO projects VALUES (91, 'DP', 437, NULL, 87, '2005/2006', 'Opoznámkovanie sprístupňovaných webových stránok počas sprístupňovania', 'Opoznámkovanie sprístupňovaných webových stránok počas sprístupňovania', NULL, NULL, 1);
INSERT INTO projects VALUES (92, 'ZP', 660, NULL, 87, '2004/2005', 'CSIDC 2005', 'CSIDC 2005', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 1);
INSERT INTO projects VALUES (93, 'DP', 97, NULL, 88, '2005/2006', 'Transformácie UML diagramov v prostredí IBM Rational Software Architect', 'Transformácie UML diagramov v prostredí IBM Rational Software Architect', NULL, NULL, 1);
INSERT INTO projects VALUES (94, 'ZP', 674, NULL, 89, '2004/2005', 'Interaktívna kolaboratívna trojrozmerná vizualizácia modelov a dát', 'Interactive Collaboration Three-dimensional Visualization Models and Data ', 'Analyzujte niektoré súčasné prístupy k interaktívnej kolaboratívnej vizualizácii. Navrhnite a vytvorte systém umožňujúci vizualizáciu modelov a z nich získaných dát v trojrozmernom priestore. S vizualizovanými dátami, parametrami modelov a objektami budú môcť manipulovať viacerí používatelia (z rôznych počítačov pripojených do siete) súčasne. Zabezpečte, aby používatelia, ktorí sa nevidia, mohli koordinovať svoju prácu vo vizualizovanej scéne. Riešenie realizujte v jazyku Java s použitím knižnice Java3D (prípadne v inom jazyku a prostredí, ktoré má vhodné vlastnosti). Funkčnosť riešenia otestujte na príkladoch.', 'Analyzujte niektoré súčasné prístupy k interaktívnej kolaboratívnej vizualizácii. Navrhnite a vytvorte systém umožňujúci vizualizáciu modelov a z nich získaných dát v trojrozmernom priestore. S vizualizovanými dátami, parametrami modelov a objektami budú môcť manipulovať viacerí používatelia (z rôznych počítačov pripojených do siete) súčasne. Zabezpečte, aby používatelia, ktorí sa nevidia, mohli koordinovať svoju prácu vo vizualizovanej scéne. Riešenie realizujte v jazyku Java s použitím knižnice Java3D (prípadne v inom jazyku a prostredí, ktoré má vhodné vlastnosti). Funkčnosť riešenia otestujte na príkladoch.', 1);
INSERT INTO projects VALUES (95, 'ZP', 16, NULL, 90, '2004/2005', 'Systém na podporu multiparadigmového návrhu', 'System for support of multi-paradigm design', 'Programovacie jazyky poskytujú rôzne mechanizmy (paradigmy) na modelovanie domény aplikácie. V multiparadigmovom návrhu sa výber týchto mechanizmov uskutočňuje explicitne na základe analýzy domény aplikácie a domény riešenia (t.j. programovacieho jazyka).
Analyzujte možnosti podpory modelovania vlastností (feature modeling) â€” predovšetkým diagramov vlastností (feature diagrams) â€” pre potreby multiparadigmového návrhu. Analyzujte aj možnosť podpory transformačnej analýzy, t.j. mapovania modelu vlastností domény aplikácie na model vlastností domény riešenia.
Navrhnite a implementujte systém na podporu multiparadigmového návrhu založený na modelovaní vlastností. Pri tvorbe systému zvážte použitie multiparadigmového návrhu a implementácie v jazyku AspectJ (aspektovo-orientované rozšírenie Javy).
', 'Programovacie jazyky poskytujú rôzne mechanizmy (paradigmy) na modelovanie domény aplikácie. V multiparadigmovom návrhu sa výber týchto mechanizmov uskutočňuje explicitne na základe analýzy domény aplikácie a domény riešenia (t.j. programovacieho jazyka).
Analyzujte možnosti podpory modelovania vlastností (feature modeling) â€” predovšetkým diagramov vlastností (feature diagrams) â€” pre potreby multiparadigmového návrhu. Analyzujte aj možnosť podpory transformačnej analýzy, t.j. mapovania modelu vlastností domény aplikácie na model vlastností domény riešenia.
Navrhnite a implementujte systém na podporu multiparadigmového návrhu založený na modelovaní vlastností. Pri tvorbe systému zvážte použitie multiparadigmového návrhu a implementácie v jazyku AspectJ (aspektovo-orientované rozšírenie Javy).
', 1);
INSERT INTO projects VALUES (96, 'DP', 579, NULL, 93, '2005/2006', 'Systém získavania doplňujúcich informácií', 'System for obtaining additional information', NULL, NULL, 1);
INSERT INTO projects VALUES (97, 'ZP', 579, NULL, 93, '2003/2004', 'Využitie multimediálnych foriem výučby informatiky - 2', 'Multimedia utilization in teaching Informatics - 2', 'Analyzujte možnosti využitia multimediálnej podoby informácií v systémoch na podporu výučby informatiky. Navrhnite základný systém a následne ho rozšírte o vhodné štruktúry a funkcie, ktoré by zvýraznili obohatenie textového obsahu o rôzne iné formy prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na niektorom predmete podľa potrieb KIVT.', 'Analyzujte možnosti využitia multimediálnej podoby informácií v systémoch na podporu výučby informatiky. Navrhnite základný systém a následne ho rozšírte o vhodné štruktúry a funkcie, ktoré by zvýraznili obohatenie textového obsahu o rôzne iné formy prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na niektorom predmete podľa potrieb KIVT.', 1);
INSERT INTO projects VALUES (98, 'ZP', 660, NULL, 94, '2005/2006', 'CSIDC 2006', 'CSIDC 2006', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.
', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.
', 1);
INSERT INTO projects VALUES (99, 'ZP', 25, NULL, 99, '2005/2006', 'Monitorovanie používateľských procesov', 'Monitorovanie používateľských procesov', 'Analyzujte možnosti získania údajov o bežiacich procesoch (ako názov príkazu, argumenty, používateľ, alokované prostriedky, atď.) v OS. Vypracujte návrh systému, ktorý na základe týchto údajov a konfigurácie zadanej používateľom bude sledovať a ovplyvňovať stav procesov. Systém implementujte a otestujte.', 'Analyzujte možnosti získania údajov o bežiacich procesoch (ako názov príkazu, argumenty, používateľ, alokované prostriedky, atď.) v OS. Vypracujte návrh systému, ktorý na základe týchto údajov a konfigurácie zadanej používateľom bude sledovať a ovplyvňovať stav procesov. Systém implementujte a otestujte.', 0);
INSERT INTO projects VALUES (100, 'ZP', 360, NULL, 100, '2005/2006', 'Skupinová minimalizácia logických funkcií', 'Skupinová minimalizácia logických funkcií', 'Analyzujte problematiku  skupinovej minimalizácie logických funkcií.
Navrhnite a implementujte systém na programovú podporu výučby minimalizácie booleovských funkcií. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch.
Má byť funkčný  pod OS Windows.

', 'Analyzujte problematiku  skupinovej minimalizácie logických funkcií.
Navrhnite a implementujte systém na programovú podporu výučby minimalizácie booleovských funkcií. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch.
Má byť funkčný  pod OS Windows.

', 0);
INSERT INTO projects VALUES (101, 'ZP', 360, NULL, 101, '2005/2006', 'Skupinová minimalizácia logických funkcií', 'Skupinová minimalizácia logických funkcií', 'Analyzujte problematiku  skupinovej minimalizácie logických funkcií.
Navrhnite a implementujte systém na programovú podporu výučby minimalizácie booleovských funkcií. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch.
Má byť funkčný  pod OS Windows.

', 'Analyzujte problematiku  skupinovej minimalizácie logických funkcií.
Navrhnite a implementujte systém na programovú podporu výučby minimalizácie booleovských funkcií. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch.
Má byť funkčný  pod OS Windows.

', 0);
INSERT INTO projects VALUES (102, 'ZP', 361, NULL, 102, '2005/2006', 'Riadenie bezpečnosti informačných systémov', 'Riadenie bezpečnosti informačných systémov', 'Analyzujte prax v riadení bezpečnosti počítačových systémov. Uveďte 
súčasný stav domény bezpečnosti informačných systémov (InfoSec),  prvkov a konceptov, ktoré sa prekrývajú. Analyzujte  nástroje na posudzovanie riadenia rizík a navhrnite vhodné nástroje na posudzovanie riadenia rizík.
', 'Analyzujte prax v riadení bezpečnosti počítačových systémov. Uveďte 
súčasný stav domény bezpečnosti informačných systémov (InfoSec),  prvkov a konceptov, ktoré sa prekrývajú. Analyzujte  nástroje na posudzovanie riadenia rizík a navhrnite vhodné nástroje na posudzovanie riadenia rizík.
', 0);
INSERT INTO projects VALUES (103, 'ZP', 301, NULL, 103, '2005/2006', 'Funkčný generátor testov VLSI obvodov - vybrané moduly', 'Funkčný generátor testov VLSI obvodov - vybrané moduly', 'Analyzujte metódy a spôsoby generovania funkčných testov, navrhnite a  realizujte vybrané moduly systému generovania  funkčných testov vnorených systémov, ktorý zostavuje funkčné testy na základe opisu obvodu v istom špecifikačnom jazyku (VHDL). Vybrané moduly na vyhodnotenie účinnosti generovaných testovacích mixov implementujte v existujúcom grafickom užívateľskom rozhraní. Funkčnosť implementovaného algoritmu a vyhodnotenie účinnosti generovaných testovacích mixov overte na príkladoch. ', 'Analyzujte metódy a spôsoby generovania funkčných testov, navrhnite a  realizujte vybrané moduly systému generovania  funkčných testov vnorených systémov, ktorý zostavuje funkčné testy na základe opisu obvodu v istom špecifikačnom jazyku (VHDL). Vybrané moduly na vyhodnotenie účinnosti generovaných testovacích mixov implementujte v existujúcom grafickom užívateľskom rozhraní. Funkčnosť implementovaného algoritmu a vyhodnotenie účinnosti generovaných testovacích mixov overte na príkladoch. ', 0);
INSERT INTO projects VALUES (104, 'ZP', 215, NULL, 104, '2002/2003', 'Modelovanie správania sa v podmienkach neurčitosti, kapitálu, daní, tovarov, preferencií z hľadiska cyklov a na kapitálových trhoch', 'Modeling of behaviour in uncertain conditions of capital, taxes, goods, preferences, as in cycles and on the financial markets', NULL, NULL, 1);
INSERT INTO projects VALUES (105, 'DP', 437, NULL, 104, '2003/2004', 'Špecializačné vzory v navrhovaní programov', 'Specialization patterns in program design', NULL, NULL, 1);
INSERT INTO projects VALUES (106, 'ZP', 704, NULL, 105, '2002/2003', 'Návrh a implementácia rozhrania pre problémovo-orientovaný IS s predpokladom možnosti získavania podstatných informácii z databáz', 'Design and Implementation of Interface Problem-oriented IS with Possibility Proposal in Discovering Hidden Knowledge from DB', 'Návrh a implementácia rozhrania pre problémovo-orientovaný IS s predpokladom možnosti získavania podstatných informácii z databáz', 'Návrh a implementácia rozhrania pre problémovo-orientovaný IS s predpokladom možnosti získavania podstatných informácii z databáz', 1);
INSERT INTO projects VALUES (107, 'DP', 46, NULL, 105, '2005/2006', 'Využitie CRM v elektronickom obchode', 'CRM Utilization in E-business', NULL, NULL, 1);
INSERT INTO projects VALUES (108, 'ZP', 579, NULL, 106, '2003/2004', 'Multimediálne informácie v regionálnom IS – 2', 'Multimediálne informácie v regionálnom IS – 2', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie existujúceho základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb KIVT.', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie existujúceho základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb KIVT.', 1);
INSERT INTO projects VALUES (109, 'ZP', 660, NULL, 108, '2002/2003', 'CSIDC', 'CSIDC', NULL, NULL, 1);
INSERT INTO projects VALUES (110, 'DP', 660, NULL, 108, '2003/2004', 'Objavovanie znalostí o správaní sa študenta pri učení sa programovať', 'Discovery of knowledge about student`s behavior during the process of learning programming', NULL, NULL, 1);
INSERT INTO projects VALUES (111, 'ZP', 294, NULL, 109, '2002/2003', 'Navigácia v informačnom hyperpriestore pomocou virtuálnej reality formou 3D modelov', 'Navigation in information hyperspaces using virtual reality in form of 3D models', NULL, NULL, 1);
INSERT INTO projects VALUES (112, 'DP', 294, NULL, 109, '2003/2004', 'Animácia výrazov tváre', 'Eacial Expressions Animation', NULL, NULL, 1);
INSERT INTO projects VALUES (113, 'ZP', 298, NULL, 110, '2005/2006', 'Generátor konfigurácií pre Cisco smerovače', 'Generátor konfigurácií pre Cisco smerovače', 'Analyzujte syntax príkazov pre konfiguráciu Cisco smerovačov (IOS). Navrhnite a implementujte programový systém, generujúci takúto konfiguráciu z neformálneho opisu vyžadovaného správania sa smerovača. Vstupná špecifikácia bude napr. v tvare obrázku, definujúcom vzťahy a vlastnosti jednotlivých prepojených smerovačov. Výstupný súbor bude obsahovať konfiguračné príkazy podobne, ako sú uvedené na konzole smerovača pri výpise konfigurácie (príkaz sh run). ', 'Analyzujte syntax príkazov pre konfiguráciu Cisco smerovačov (IOS). Navrhnite a implementujte programový systém, generujúci takúto konfiguráciu z neformálneho opisu vyžadovaného správania sa smerovača. Vstupná špecifikácia bude napr. v tvare obrázku, definujúcom vzťahy a vlastnosti jednotlivých prepojených smerovačov. Výstupný súbor bude obsahovať konfiguračné príkazy podobne, ako sú uvedené na konzole smerovača pri výpise konfigurácie (príkaz sh run). ', 0);
INSERT INTO projects VALUES (114, 'ZP', 557, NULL, 111, '2002/2003', 'Využitie aditívnych generátorov v kryptografii', 'Usage of additive generators in cryptography', NULL, NULL, 1);
INSERT INTO projects VALUES (115, 'DP', 704, NULL, 111, '2003/2004', 'Vizualizácia modulov pre system VU', 'Visualization of modules for the system of VU', NULL, NULL, 1);
INSERT INTO projects VALUES (116, 'ZP', 25, NULL, 113, '2005/2006', 'Monitorovanie stavu operačného systému', 'Monitorovanie stavu operačného systému', 'Analyzujte parametre podstatné pre správnu a spoľahlivú činnosť operačného systému, ako napríklad IP adresy, sieťové spojenia, pravidlá "firewall-u", vyťaženosť, bežiace procesy, zavedené moduly, atď. Navrhnite systém sledovania a vyhodnocovania týchto parametrov, ako aj spôsob reakcie na ich zmeny za účelom udržania korektného stavu. Sledované parametre, ich hodnoty ako aj požadované reakcie musia byť konfigurovateľné. Zvážte možnosť implementácie ako používateľského procesu, respektíve ako súčasť jadra OS. Navrhnutý systém implementujte a otestujte.', 'Analyzujte parametre podstatné pre správnu a spoľahlivú činnosť operačného systému, ako napríklad IP adresy, sieťové spojenia, pravidlá "firewall-u", vyťaženosť, bežiace procesy, zavedené moduly, atď. Navrhnite systém sledovania a vyhodnocovania týchto parametrov, ako aj spôsob reakcie na ich zmeny za účelom udržania korektného stavu. Sledované parametre, ich hodnoty ako aj požadované reakcie musia byť konfigurovateľné. Zvážte možnosť implementácie ako používateľského procesu, respektíve ako súčasť jadra OS. Navrhnutý systém implementujte a otestujte.', 0);
INSERT INTO projects VALUES (117, 'ZP', 705, NULL, 114, '2002/2003', 'Automatický návrh mostíkových hradlových obvodov', 'Automatic design bridge-gates circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (118, 'DP', 25, NULL, 114, '2003/2004', 'Riadenie vlastností prenosového kanálu', 'Control of network channel characteristic', NULL, NULL, 0);
INSERT INTO projects VALUES (119, 'ZP', 672, NULL, 115, '2003/2004', 'Komunikačná sieť ako graf typu „malý svet“', 'Komunikačná sieť ako graf typu „malý svet“', 'Siete „malého sveta“ sú v súčasnosti v popredí záujmu matematikov a fyzikov.  Pomocou modelov „malého sveta“  môžeme  pochopiť štruktúru sociálnych a komunikačných sietí, ako sietí, ktoré v sebe zahĹ•ňajú jednak prvok náhodnosti, jednak prvok lokálnej usporiadanosti. Prvok náhodnosti je zodpovedný za efektívnosť prepojení uzlov v sieti a ich malú separáciu, prvok usporiadanosti  za lokálnu štruktúru uzlov a klasterizáciu. Úlohou riešiteľa je: Preštudovať teóriu sietí „malého sveta“ a dostupné modely. Analyzovať prepojenosť a štruktúru www stránok, alebo ineho reálneho problému (napr. graf semantickej blízkosti slov) podľa vybranej špecifikácie. Navrhnúť model prepojení  ako model „malého sveta“. Overiť funkčnosť modelu.  Pracovať v Linuxe', 'Siete „malého sveta“ sú v súčasnosti v popredí záujmu matematikov a fyzikov.  Pomocou modelov „malého sveta“  môžeme  pochopiť štruktúru sociálnych a komunikačných sietí, ako sietí, ktoré v sebe zahĹ•ňajú jednak prvok náhodnosti, jednak prvok lokálnej usporiadanosti. Prvok náhodnosti je zodpovedný za efektívnosť prepojení uzlov v sieti a ich malú separáciu, prvok usporiadanosti  za lokálnu štruktúru uzlov a klasterizáciu. Úlohou riešiteľa je: Preštudovať teóriu sietí „malého sveta“ a dostupné modely. Analyzovať prepojenosť a štruktúru www stránok, alebo ineho reálneho problému (napr. graf semantickej blízkosti slov) podľa vybranej špecifikácie. Navrhnúť model prepojení  ako model „malého sveta“. Overiť funkčnosť modelu.  Pracovať v Linuxe', 1);
INSERT INTO projects VALUES (120, 'ZP', 579, NULL, 116, '2005/2006', 'Multimediálne informácie v regionálnom IS', 'Multimediálne informácie v regionálnom IS', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili informačné využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb FIIT.', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili informačné využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb FIIT.', 1);
INSERT INTO projects VALUES (121, 'ZP', 95, NULL, 117, '2004/2005', 'Systém na vizuálnu evidenciu inventára', 'Building inventory visualization system', 'Analyzujte spôsob uchovávania a grafickej reprezentácie objektov v 2D priestore na obrazovke počítača. Na základe tejto analýzy navrhnite a implementujte systém, ktorý umožní zobrazenie a interaktívnu prácu s inventárom firmy v budovách na viacerých podlažiach', 'Analyzujte spôsob uchovávania a grafickej reprezentácie objektov v 2D priestore na obrazovke počítača. Na základe tejto analýzy navrhnite a implementujte systém, ktorý umožní zobrazenie a interaktívnu prácu s inventárom firmy v budovách na viacerých podlažiach', 1);
INSERT INTO projects VALUES (122, 'DP', 674, NULL, 117, '2005/2006', 'Intencionálne programovanie', 'Intencionálne programovanie', NULL, NULL, 1);
INSERT INTO projects VALUES (123, 'ZP', 297, NULL, 118, '2004/2005', 'Efektívnosť programov v jazyku strojovej úrovne', 'Effectiveness of machine language programs', 'Analyzujte správanie  sa programu na základe danej inštrukčnej sady a známych programovacích techník.  Navrhnite kritérium efektívnosti strojovo orientovaného programu viacerými spôsobmi alebo prostriedkami.  Napíšte viacero krátkych, jednoduchých príkladov, ktoré budú názorne demonštrovať navrhnuté spôsoby zlepšenia efektívnosti programu. Vyhodnoťte navrhnuté spôsoby.', 'Analyzujte správanie  sa programu na základe danej inštrukčnej sady a známych programovacích techník.  Navrhnite kritérium efektívnosti strojovo orientovaného programu viacerými spôsobmi alebo prostriedkami.  Napíšte viacero krátkych, jednoduchých príkladov, ktoré budú názorne demonštrovať navrhnuté spôsoby zlepšenia efektívnosti programu. Vyhodnoťte navrhnuté spôsoby.', 1);
INSERT INTO projects VALUES (124, 'DP', 16, NULL, 118, '2005/2006', 'Prekonanie rozdielov medzi aspektovo-orientovanými jazykmi pomocou prístupu MDA', 'Prekonanie rozdielov medzi aspektovo-orientovanými jazykmi pomocou prístupu MDA', NULL, NULL, 1);
INSERT INTO projects VALUES (125, 'ZP', 46, NULL, 119, '2006/2007', 'Vizualizácia procesu vytvárania a používania ADT softvérových v aplikáciach', 'Vizualizácia procesu vytvárania a používania ADT softvérových v aplikáciach', 'Abstraktné údajové typy  (ADT) považujeme za určité stavebné bloky  pri budovaní aplikácií založených na objektovo orientovanej paradigme. Preštudujte  problematiku tvorby ADT a tiež možnosti implementačných prostriedkov. Na základe analýzy, vytvorte aplikáciu, ktorá vysvetlí vybrané ADTs a bude vizualizovať proces vytvárania a používania vybraných ADT vo zvolenej aplikácii.  ', 'Abstraktné údajové typy  (ADT) považujeme za určité stavebné bloky  pri budovaní aplikácií založených na objektovo orientovanej paradigme. Preštudujte  problematiku tvorby ADT a tiež možnosti implementačných prostriedkov. Na základe analýzy, vytvorte aplikáciu, ktorá vysvetlí vybrané ADTs a bude vizualizovať proces vytvárania a používania vybraných ADT vo zvolenej aplikácii.  ', 1);
INSERT INTO projects VALUES (126, 'ZP', 27, NULL, 120, '2002/2003', 'Štúdia rozhrania objektovo orientovaného operačného systému', 'Štúdia rozhrania objektovo orientovaného operačného systému', NULL, NULL, 1);
INSERT INTO projects VALUES (127, 'DP', 27, NULL, 120, '2003/2004', 'Rozšírenie knižnice Open Inventor', 'Extension of Open Inventor library', NULL, NULL, 1);
INSERT INTO projects VALUES (128, 'DP', 98, NULL, 121, '2005/2006', 'Rodostrom', 'Rodostrom', NULL, NULL, 4);
INSERT INTO projects VALUES (129, 'ZP', 95, NULL, 121, '2003/2004', 'Tvorba špecifikácií v Z jazyku', 'Creating specifications in Z Language', 'Analyzujte problematiku tvorby Z-špecifikácií z hľadiska možnosti vizualizácie schém a formúl Z-jazyka. Analyzujte možnosti, ktoré poskytuje prostriedok na prezeranie Z-špecifikácií, Z-Browser. Na základe tejto analýzy  navrhnite a implementujte model systému, ktorý podporí vizualizáciu čítania a zápisu Z-formúl.', 'Analyzujte problematiku tvorby Z-špecifikácií z hľadiska možnosti vizualizácie schém a formúl Z-jazyka. Analyzujte možnosti, ktoré poskytuje prostriedok na prezeranie Z-špecifikácií, Z-Browser. Na základe tejto analýzy  navrhnite a implementujte model systému, ktorý podporí vizualizáciu čítania a zápisu Z-formúl.', 1);
INSERT INTO projects VALUES (130, 'ZP', 422, 704, 122, '2003/2004', 'Nový design www.rubriky.sk', 'Design of www.rubriky.net', 'Navrhnite nový design stránok www.rubriky.sk s využitím MYSQL databáz. Realizujte tento návrh tak, aby boli uložené jednotlivé rubriky z www.rubriky.sk v databáze a vytvorte GUI (grafický užívateľský nástroj) pre správu týchto rubrík pre superužívateľa a prístup na prezeranie pre štandardného užívateľa. Užívateľ má mať k dispozícii novú funkciu vyhľadaj (search) text alebo skladatela.  Prácu realizujte v jazyku PHP.', 'Navrhnite nový design stránok www.rubriky.sk s využitím MYSQL databáz. Realizujte tento návrh tak, aby boli uložené jednotlivé rubriky z www.rubriky.sk v databáze a vytvorte GUI (grafický užívateľský nástroj) pre správu týchto rubrík pre superužívateľa a prístup na prezeranie pre štandardného užívateľa. Užívateľ má mať k dispozícii novú funkciu vyhľadaj (search) text alebo skladatela.  Prácu realizujte v jazyku PHP.', 1);
INSERT INTO projects VALUES (131, 'DP', 579, NULL, 122, '2005/2006', 'Systém optimalizácie rozvrhov', 'Systém optimalizácie rozvrhov', NULL, NULL, 1);
INSERT INTO projects VALUES (132, 'ZP', 375, NULL, 123, '2002/2003', 'Spracovanie cyklických voltamperometrických meraní', 'Elaboration of Cyclical Voltampermetric Measuring', NULL, NULL, 0);
INSERT INTO projects VALUES (133, 'DP', 298, NULL, 123, '2003/2004', 'Systém pre vytváranie HTML prezentácie informačných materiálov', 'System for creating HTML presentations from information materials', NULL, NULL, 0);
INSERT INTO projects VALUES (134, 'ZP', 704, NULL, 124, '2005/2006', 'Editor zdrojových programov v stave ich  zdieľania', 'Editor zdrojových programov v stave ich  zdieľania', 'Analyzujte vlastnosti editorov zdrojových programov  a  možnosti zdieľania dokumentov obsahujúcich zdrojové  programy pri tímovej práci .  Analyzujte  možnosti , spôsoby a princípy podpory tímovej práce pri tvorbe takýchto dokumentov .  Navrhnite editor zdrojových programov , ktorý bude podporovať  zvýrazňovanie syntaxe (vybraného)  programovacieho jazyka a umožní zostavovanie celku z jednotlivých častí vytvorených v tíme. Doporučený implementačný jazyk - jazyk Java.
 
', 'Analyzujte vlastnosti editorov zdrojových programov  a  možnosti zdieľania dokumentov obsahujúcich zdrojové  programy pri tímovej práci .  Analyzujte  možnosti , spôsoby a princípy podpory tímovej práce pri tvorbe takýchto dokumentov .  Navrhnite editor zdrojových programov , ktorý bude podporovať  zvýrazňovanie syntaxe (vybraného)  programovacieho jazyka a umožní zostavovanie celku z jednotlivých častí vytvorených v tíme. Doporučený implementačný jazyk - jazyk Java.
 
', 1);
INSERT INTO projects VALUES (135, 'ZP', 95, NULL, 125, '2002/2003', 'Podpora vyučovania MaPŠ – kontrola vedomostí', 'Support for education in subject Methods and Techniques for Program Specification – proof of learning', NULL, NULL, 1);
INSERT INTO projects VALUES (136, 'DP', 541, NULL, 125, '2004/2005', 'Monitorovanie stacionárnych objektov', 'Stationary object monitoring', NULL, NULL, 1);
INSERT INTO projects VALUES (137, 'ZP', 25, NULL, 127, '2003/2004', 'Analýza implementácie TCP/IP protokolového zásobníka', 'Analysis of TCP/IP stack implementation', 'Podrobne analyzujte protokolový zásobník TCP/IP, pričom zvláštnu pozornosť venujte preddefinovaným hodnotám parametrov v rôznych implementáciách. Navrhnite sadu testov na zisťovanie hodnôt relevantných parametrov vybraných protokolov. Navrhnite a implementujte systém pre zostavovanie komplexných testov implementácie TCP/IP zásobníka vzdialených uzlov siete. Systém otestujte v laboratórnych podmienkach a urobte odhad spoľahlivosti jeho výstupov.', 'Podrobne analyzujte protokolový zásobník TCP/IP, pričom zvláštnu pozornosť venujte preddefinovaným hodnotám parametrov v rôznych implementáciách. Navrhnite sadu testov na zisťovanie hodnôt relevantných parametrov vybraných protokolov. Navrhnite a implementujte systém pre zostavovanie komplexných testov implementácie TCP/IP zásobníka vzdialených uzlov siete. Systém otestujte v laboratórnych podmienkach a urobte odhad spoľahlivosti jeho výstupov.', 0);
INSERT INTO projects VALUES (138, 'ZP', 342, NULL, 128, '2005/2006', 'Prostriedky pre podporu výučby predmetu ASP', 'Prostriedky pre podporu výučby predmetu ASP', 'Analyzujte možnosti programových prostriedkov pre podporu vyučovania predmetu Assemblery  a systémové programovanie. Navrhnite vhodné programové vybavenie použiteľné pre podporu výučby ASP v aplikácii s počítačom typu PC. Zrealizujte vybranú skupinu programových prostriedkov vrátane zostavy vzorových príkladov.', 'Analyzujte možnosti programových prostriedkov pre podporu vyučovania predmetu Assemblery  a systémové programovanie. Navrhnite vhodné programové vybavenie použiteľné pre podporu výučby ASP v aplikácii s počítačom typu PC. Zrealizujte vybranú skupinu programových prostriedkov vrátane zostavy vzorových príkladov.', 0);
INSERT INTO projects VALUES (139, 'ZP', 704, NULL, 129, '2004/2005', 'Prezentácia histórie informatiky na STU', 'Presentation of history of informatics at SUT', 'Pojednajte  o metódach, technike a prostriedkoch navigácie v hypermediálnych systémoch. Experimentovaním zefektívnite navigovanie už v čiastočne vytvorenom systéme v rámci tímového projektu v ak. roku 2003/2004 a tento systém skompletizujte. Navrhnite kategorizáciu používateľov vzhľadom na ich stupeň vzdelania a záujmu o informatiku a zároveň tento fakt zohľadnite v efektivite  navigácie v systéme a v štruktúre samotného IS. Požiadavka na výstupy: adaptívna prezentácia  na Webe a CD.', 'Pojednajte  o metódach, technike a prostriedkoch navigácie v hypermediálnych systémoch. Experimentovaním zefektívnite navigovanie už v čiastočne vytvorenom systéme v rámci tímového projektu v ak. roku 2003/2004 a tento systém skompletizujte. Navrhnite kategorizáciu používateľov vzhľadom na ich stupeň vzdelania a záujmu o informatiku a zároveň tento fakt zohľadnite v efektivite  navigácie v systéme a v štruktúre samotného IS. Požiadavka na výstupy: adaptívna prezentácia  na Webe a CD.', 1);
INSERT INTO projects VALUES (140, 'ZP', 20, NULL, 130, '2005/2006', 'Aplikácia pre mobilné zariadenie', 'Aplikácia pre mobilné zariadenie', 'Mobilné zariadenia umožňujúce vykonávanie užívateľom dodaných programov sú čoraz dostupnejšie. Naštudujte možnosti programovania aplikácií pre mobilné zariadenia a vytvorte aplikáciu – hru využívajúcu komunikačné možnosti týchto zariadení.
', 'Mobilné zariadenia umožňujúce vykonávanie užívateľom dodaných programov sú čoraz dostupnejšie. Naštudujte možnosti programovania aplikácií pre mobilné zariadenia a vytvorte aplikáciu – hru využívajúcu komunikačné možnosti týchto zariadení.
', 1);
INSERT INTO projects VALUES (141, 'ZP', 188, NULL, 131, '2005/2006', 'Tvorba rozpisu zápasov', 'Tvorba rozpisu zápasov', 'Navrhnite a implementujte program pre tvorbu rozpisu zápasov amatérskej ligy. Liga sa skladá z niekoľkých divízií, pričom v každej hrá určitý počet tímov. V rámci každej divízie sa hrá systémom každý s každým. Kvôli finančnej náročnosti profesionálnych rozhodcov si tímy rozhodujú zápasy navzájom. Zápasy prebiehajú v exteriéri cez víkendy, prípadne sviatky, pričom na jednom ihrisku sa môžu striedať zápasy viacerých divízií.
Váš program musí zabezpečiť vytvorenie rozpisu zápasov tak, aby čo najlepšie splnil rôzne ohraničenia: hrať sa môže len za prirodzeného svetla, každý tím by mal rozhodovať približne rovnaký počet zápasov, každý tím môže mať preferencie týkajúce sa časov ich zápasov, a pod.
Pozn.: Zvážte použitie evolučných algoritmov.', 'Navrhnite a implementujte program pre tvorbu rozpisu zápasov amatérskej ligy. Liga sa skladá z niekoľkých divízií, pričom v každej hrá určitý počet tímov. V rámci každej divízie sa hrá systémom každý s každým. Kvôli finančnej náročnosti profesionálnych rozhodcov si tímy rozhodujú zápasy navzájom. Zápasy prebiehajú v exteriéri cez víkendy, prípadne sviatky, pričom na jednom ihrisku sa môžu striedať zápasy viacerých divízií.
Váš program musí zabezpečiť vytvorenie rozpisu zápasov tak, aby čo najlepšie splnil rôzne ohraničenia: hrať sa môže len za prirodzeného svetla, každý tím by mal rozhodovať približne rovnaký počet zápasov, každý tím môže mať preferencie týkajúce sa časov ich zápasov, a pod.
Pozn.: Zvážte použitie evolučných algoritmov.', 1);
INSERT INTO projects VALUES (142, 'ZP', 298, NULL, 132, '2002/2003', 'Informačný systém regionálnej CISCO akadémie, správa dát', 'Information system for regional  CISCO  academy - data management', NULL, NULL, 1);
INSERT INTO projects VALUES (143, 'DP', 557, 672, 132, '2003/2004', 'Útoky na prúdový šifrátor A5/1', 'Attacks on A5/1 stream cipher', NULL, NULL, 2);
INSERT INTO projects VALUES (144, 'ZP', 358, NULL, 133, '2003/2004', 'Testovanie bezpečnostných slabín počítačových sietí', 'Penetration testing of computer networks', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy prienikov. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú simulovať vybraté typy útokov na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.

', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy prienikov. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú simulovať vybraté typy útokov na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.

', 0);
INSERT INTO projects VALUES (145, 'DP', 25, NULL, 133, '2005/2006', 'Štatistické vlastnosti uzla v počítačovej sieti', 'Štatistické vlastnosti uzla v počítačovej sieti', NULL, NULL, 0);
INSERT INTO projects VALUES (146, 'ZP', 584, NULL, 134, '2005/2006', 'Bezpečnostné mechanizmy grid computingu prostredníctvom web rozhrania', 'Bezpečnostné mechanizmy grid computingu prostredníctvom web rozhrania', 'Analyzujte súčasné bezpečnostné mechanizmy a riešenia v prostredí grid computingu. Popíšte a podrobne analyzujte aspoň jeden z týchto mechanizmov. Opíšte jeho výhody a nevýhody, porovnajte s daľšími možnými riešeniami. Navrhnite a implementujte web rozhranie k prostrediu grid computingu s aplikáciou a implementáciou vybraného bezpečnostného mechanizmu.
', 'Analyzujte súčasné bezpečnostné mechanizmy a riešenia v prostredí grid computingu. Popíšte a podrobne analyzujte aspoň jeden z týchto mechanizmov. Opíšte jeho výhody a nevýhody, porovnajte s daľšími možnými riešeniami. Navrhnite a implementujte web rozhranie k prostrediu grid computingu s aplikáciou a implementáciou vybraného bezpečnostného mechanizmu.
', 0);
INSERT INTO projects VALUES (147, 'ZP', 579, NULL, 135, '2005/2006', 'Systém pre správu webových stránok - používateľ', 'Systém pre správu webových stránok - používateľ', 'Cieľom projektu je vytvorenie prostredia, ktoré umožní spravovanie webových stránok. Analyzujte existujúce systémy podobného charakteru z pohľadu používateľov a vlastností prostredia, v ktorom bude vytváraný systém.  Navrhnite štruktúru použitej databázy, štruktúru obrazoviek pre používateľov, grafické prvky a štýly. Následne implementujte kľúčové časti systému a použiteľnosť overte na vybranej množine stránok používaných v pedagogike FIIT.
', 'Cieľom projektu je vytvorenie prostredia, ktoré umožní spravovanie webových stránok. Analyzujte existujúce systémy podobného charakteru z pohľadu používateľov a vlastností prostredia, v ktorom bude vytváraný systém.  Navrhnite štruktúru použitej databázy, štruktúru obrazoviek pre používateľov, grafické prvky a štýly. Následne implementujte kľúčové časti systému a použiteľnosť overte na vybranej množine stránok používaných v pedagogike FIIT.
', 1);
INSERT INTO projects VALUES (148, 'ZP', 579, NULL, 136, '2005/2006', 'Systém na podporu tvorby skúškových rozvrhov', 'Systém na podporu tvorby skúškových rozvrhov', 'Analyzujte údajové množiny a postupy pri vytváraní  rozvrhov skúšok a následne navrhnite systém, ktorý by tieto činnosti podporoval. Základné časti návrhu realizujte v podobe prototypu a zaistite nevyhnutnú kompatibilitu s informačným systémom používaným na FIIT.
', 'Analyzujte údajové množiny a postupy pri vytváraní  rozvrhov skúšok a následne navrhnite systém, ktorý by tieto činnosti podporoval. Základné časti návrhu realizujte v podobe prototypu a zaistite nevyhnutnú kompatibilitu s informačným systémom používaným na FIIT.
', 1);
INSERT INTO projects VALUES (149, 'DP', 301, NULL, 137, '2005/2006', 'Návrh špeciálnych funkcií sieťového adaptéra v prostredí PLD', 'Návrh špeciálnych funkcií sieťového adaptéra v prostredí PLD', NULL, NULL, 0);
INSERT INTO projects VALUES (150, 'ZP', 301, NULL, 137, '2003/2004', 'Testovanie rozšírenej MAC vrstvy sieťového adaptéra a návrh v prostredí PLD', 'Testing of extended MAC layer of network interface card and design by PLD
tTesting of extended MAC layer of network interface card and design by PLD echnology', 'Navrhnite vybrané časti a špeciálne funkcie sieťového adaptéra. Opíšte architektúru a funkciu v jazyku VHDL, implementujte systém do zvolenej technológie PLD/FPGA v návrhovom prostredí XILINX Foundation M1 technology, navrhnite metódu testovania MAC vrstvy, overte činnosť.', 'Navrhnite vybrané časti a špeciálne funkcie sieťového adaptéra. Opíšte architektúru a funkciu v jazyku VHDL, implementujte systém do zvolenej technológie PLD/FPGA v návrhovom prostredí XILINX Foundation M1 technology, navrhnite metódu testovania MAC vrstvy, overte činnosť.', 0);
INSERT INTO projects VALUES (151, 'DP', 25, NULL, 138, '2005/2006', 'Adaptívne riadenie vlastností prenosového kanálu', 'Adaptívne riadenie vlastností prenosového kanálu', NULL, NULL, 0);
INSERT INTO projects VALUES (152, 'ZP', 563, NULL, 138, '2004/2005', 'Ladiaci program pre experimentálny mikropočítač', 'Debugging program for experimental microcomputer', 'Navrhnite a implemetujte ladiaci program pre experimentálny mikropočítač na báze I80386EX s nasledovnými požiadavkami:

- znakovo orientovaná komunikácia s hostiteľským počítačom cez sériový port
- naplnenie používateľského programu z hostiteľského počítača
- krokovanie používateľského programu po inštrukciách
- spustenie používateľského programu v reálnom čase
- nastavenie ladiacich bodov
- prezeranie/modifikácia obsahu registrov a pamäte
- priama práca s portami mikropočítača
', 'Navrhnite a implemetujte ladiaci program pre experimentálny mikropočítač na báze I80386EX s nasledovnými požiadavkami:

- znakovo orientovaná komunikácia s hostiteľským počítačom cez sériový port
- naplnenie používateľského programu z hostiteľského počítača
- krokovanie používateľského programu po inštrukciách
- spustenie používateľského programu v reálnom čase
- nastavenie ladiacich bodov
- prezeranie/modifikácia obsahu registrov a pamäte
- priama práca s portami mikropočítača
', 0);
INSERT INTO projects VALUES (153, 'ZP', 374, NULL, 139, '2005/2006', 'Zobrazovanie objektov GIS podľa požadovanej mierky', 'Zobrazovanie objektov GIS podľa požadovanej mierky', 'Geografické informačné systémy obsahujú množstvo rôznych, prevažne grafických objektov, z ktorých je možné skladať a vytvárať rozličné druhy máp. Grafické objekty sú na mape reprezentované čiarami, mnohouholníkmi a symbolmi. Niektoré rozmery týchto objektov a tým aj ich viditeľnosť je závislá od zvolenej mierky zobrazenia. Súčasné systémy často zobrazujú príliš malé objekty čiarami alebo bodkami, ktoré sú na výslednej mape rušivé. Úlohou je eliminovať takéto objekty. Najprv analyzujte spôsoby zobrazovania geografických informácií a na základe analýzy navrhnite spôsob predspracovania zobrazovaných objektov. Navrhnuté riešenie overte implementovaním prototypu.', 'Geografické informačné systémy obsahujú množstvo rôznych, prevažne grafických objektov, z ktorých je možné skladať a vytvárať rozličné druhy máp. Grafické objekty sú na mape reprezentované čiarami, mnohouholníkmi a symbolmi. Niektoré rozmery týchto objektov a tým aj ich viditeľnosť je závislá od zvolenej mierky zobrazenia. Súčasné systémy často zobrazujú príliš malé objekty čiarami alebo bodkami, ktoré sú na výslednej mape rušivé. Úlohou je eliminovať takéto objekty. Najprv analyzujte spôsoby zobrazovania geografických informácií a na základe analýzy navrhnite spôsob predspracovania zobrazovaných objektov. Navrhnuté riešenie overte implementovaním prototypu.', 1);
INSERT INTO projects VALUES (154, 'ZP', 388, NULL, 140, '2005/2006', 'Informačný portál predmetu', 'Informačný portál predmetu', 'Analyzujte typické prvky informačného portálu univerzitného predmetu a vhodné prostriedky na ich vytvorenie a údržbu v prostredí webu. Navrhnite softvérový systém - webovskú aplikáciu, ktorá podporí jednoduchú tvorbu informačných portálov pre predmety informatického zamerania na našej fakulte. Návrh riešenia overte implementáciou prototypu podporného softvérového systému.', 'Analyzujte typické prvky informačného portálu univerzitného predmetu a vhodné prostriedky na ich vytvorenie a údržbu v prostredí webu. Navrhnite softvérový systém - webovskú aplikáciu, ktorá podporí jednoduchú tvorbu informačných portálov pre predmety informatického zamerania na našej fakulte. Návrh riešenia overte implementáciou prototypu podporného softvérového systému.', 1);
INSERT INTO projects VALUES (155, 'ZP', 387, NULL, 141, '2005/2006', 'Prehliadač stránok na Internete ', 'Prehliadač stránok na Internete ', 'Rôzne internetové prehliadače majú často problém zobraziť
stránky presne podľa štandardov w3c.org. Preto analyzujte
vhodnosť rôznych formátov a spôsoby ich zobrazovania.
Navrhnite vlastný formát vychádzajúci z XML, do ktorého
je možné stránky v rôznych html formátoch (napr. html40,html41,xhtml1)
prekonvertovať. Ďalej navrhnite prehliadač tohto formátu.
Svoje riešenie overte prototypom. ', 'Rôzne internetové prehliadače majú často problém zobraziť
stránky presne podľa štandardov w3c.org. Preto analyzujte
vhodnosť rôznych formátov a spôsoby ich zobrazovania.
Navrhnite vlastný formát vychádzajúci z XML, do ktorého
je možné stránky v rôznych html formátoch (napr. html40,html41,xhtml1)
prekonvertovať. Ďalej navrhnite prehliadač tohto formátu.
Svoje riešenie overte prototypom. ', 1);
INSERT INTO projects VALUES (156, 'ZP', 660, NULL, 143, '2005/2006', 'Vyhodnocovanie vedomostí študenta pri štúdiu prostredníctvom webového adaptívneho systému', 'Vyhodnocovanie vedomostí študenta pri štúdiu prostredníctvom webového adaptívneho systému', 'Webové adaptívne výučbové systémy umožňujú dosiahnutie vyššej efektívnosti učenia sa tým, že výučbový systém sa dokáže prispôsobiť jednotlivým študentom, resp. skupinám študentov. Pri prispôsobovaní hrá významnú úlohu práve schopnosť systému vyhodnotiť charakteristiky používateľa vzhľadom na jeho predchádzajúcu činnosť vo výučbovom systéme. Skúmajte možnosti vyhodnotenia charakteristík používateľa vzhľadom na prezentované vedomosti (ktoré časti len videl, ktoré pochopil). Zamerajte sa na systémy na výučbu programovania. Zoberte pri tom do úvahy pohyb používateľa v informačnom priestore, vyhodnotenie otázok používateľovi po preštudovaní jednotlivých častí a tiež možnosť vyhodnotenia príkladov programov, ktoré študent pri práci so systémom vyriešil. Navrhnite spôsob ako tieto charakteristiky vyhodnocovať v kontexte výučby programovania (vo zvolenej paradigme: procedurálna, objektovo-orientovaná, funkcionálna alebo logická). Návrh experimentálne overte tak, že doplníte a obohatíte existujúci otvorený systém AHA! pre výučbu programovania (systém AHA! je vyvinutý modernými technológiami – Java servlety, Tomcat web server, XML a ďalšie a je dostupný na adrese http://aha.win.tue.nl).', 'Webové adaptívne výučbové systémy umožňujú dosiahnutie vyššej efektívnosti učenia sa tým, že výučbový systém sa dokáže prispôsobiť jednotlivým študentom, resp. skupinám študentov. Pri prispôsobovaní hrá významnú úlohu práve schopnosť systému vyhodnotiť charakteristiky používateľa vzhľadom na jeho predchádzajúcu činnosť vo výučbovom systéme. Skúmajte možnosti vyhodnotenia charakteristík používateľa vzhľadom na prezentované vedomosti (ktoré časti len videl, ktoré pochopil). Zamerajte sa na systémy na výučbu programovania. Zoberte pri tom do úvahy pohyb používateľa v informačnom priestore, vyhodnotenie otázok používateľovi po preštudovaní jednotlivých častí a tiež možnosť vyhodnotenia príkladov programov, ktoré študent pri práci so systémom vyriešil. Navrhnite spôsob ako tieto charakteristiky vyhodnocovať v kontexte výučby programovania (vo zvolenej paradigme: procedurálna, objektovo-orientovaná, funkcionálna alebo logická). Návrh experimentálne overte tak, že doplníte a obohatíte existujúci otvorený systém AHA! pre výučbu programovania (systém AHA! je vyvinutý modernými technológiami – Java servlety, Tomcat web server, XML a ďalšie a je dostupný na adrese http://aha.win.tue.nl).', 1);
INSERT INTO projects VALUES (157, 'ZP', 358, NULL, 145, '2005/2006', 'Testovanie bezpečnostných slabín počítačových sietí', 'Testovanie bezpečnostných slabín počítačových sietí', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy bezpečnostných slabín. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú testovať vybraté typy bezpečnostných slabín na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy bezpečnostných slabín. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú testovať vybraté typy bezpečnostných slabín na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.', 0);
INSERT INTO projects VALUES (158, 'ZP', 294, NULL, 146, '2002/2003', 'Navigácia v informačnom hyperpriestore pomocou virtuálnej reality formou sférickej panorámy', 'Navigation in information hyperspace with use of virtual reality in form of spherical panoramas', NULL, NULL, 1);
INSERT INTO projects VALUES (159, 'DP', 294, NULL, 146, '2003/2004', 'Použitie optiky rybieho oka pri interaktívnom zobrazovaní hyperdokumentov', 'Using fish-eye views to interactively display hyperdocuments', NULL, NULL, 1);
INSERT INTO projects VALUES (160, 'ZP', 40, NULL, 147, '2005/2006', 'Objektovo relačné mapre pre jazyk C++', 'Objektovo relačné mapre pre jazyk C++', 'Naštudujte princípy a charakteristiky Objektovo-Relačných maprov vo všeobecnosti. Analyzujte existujúce O–R mapre pre programovací jazyk C++. Naštudujte podrobnosti pre Vami vybrané O-R mapre (min. 2) pre jazyk C++. S využitím vybraných O-R maprov vytvorte jednoduchú databázovú aplikáciu, resp. aplikácie na spoločnom základe. Vybrané mapre porovnajte s využitím osobných skúseností získaných pri vytváraní aplikácie/aplikácií.', 'Naštudujte princípy a charakteristiky Objektovo-Relačných maprov vo všeobecnosti. Analyzujte existujúce O–R mapre pre programovací jazyk C++. Naštudujte podrobnosti pre Vami vybrané O-R mapre (min. 2) pre jazyk C++. S využitím vybraných O-R maprov vytvorte jednoduchú databázovú aplikáciu, resp. aplikácie na spoločnom základe. Vybrané mapre porovnajte s využitím osobných skúseností získaných pri vytváraní aplikácie/aplikácií.', 1);
INSERT INTO projects VALUES (161, 'ZP', 400, NULL, 148, '2005/2006', 'Komunitná katalogizácia roztrúsených informácií', 'Komunitná katalogizácia roztrúsených informácií', 'Množstvo informácií je roztrúsených medzi vzájomne neprepojenými subjektami. V procese informatizácie, digitalizácie a štrukturovania informácií je potrebné katalogizovať a prepájať takéto informácie informácie. Pre zefektívnenie tohto procesu je možné využiť samotných nositeľov týchto informácií. Existuje niekoľko projektov na riešenie tohto problému [napr. 1], tieto však fungujú iba pri dostatočne veľkých komunitách, kde sú výkyvy automaticky pohltené. Navrhnite aplikáciu takýchto technológií na menšie komunity , príkladom nech
je zhromažďovanie lokálnych turistických informácií na Slovensku.

Výstupy projektu:
Analýza postupu pri veľkých komunitách, 
Návrh potrebných zmien v prostredí bez automatických opráv chýb, 
Implementácia jednoduchého systému na podporu komunitnej katalogizácie v menších komunitách.

[1] http://www.wikipedia.org/', 'Množstvo informácií je roztrúsených medzi vzájomne neprepojenými subjektami. V procese informatizácie, digitalizácie a štrukturovania informácií je potrebné katalogizovať a prepájať takéto informácie informácie. Pre zefektívnenie tohto procesu je možné využiť samotných nositeľov týchto informácií. Existuje niekoľko projektov na riešenie tohto problému [napr. 1], tieto však fungujú iba pri dostatočne veľkých komunitách, kde sú výkyvy automaticky pohltené. Navrhnite aplikáciu takýchto technológií na menšie komunity , príkladom nech
je zhromažďovanie lokálnych turistických informácií na Slovensku.

Výstupy projektu:
Analýza postupu pri veľkých komunitách, 
Návrh potrebných zmien v prostredí bez automatických opráv chýb, 
Implementácia jednoduchého systému na podporu komunitnej katalogizácie v menších komunitách.

[1] http://www.wikipedia.org/', 1);
INSERT INTO projects VALUES (162, 'ZP', 297, NULL, 150, '2005/2006', 'Simulátor toku strojových inštrukcií', 'Simulátor toku strojových inštrukcií', 'Analyzujte možnosti a prostriedky na simuláciu definovanej inštrukčnej sady strojových inštrukcií. Vytvorte simulačné prostredie, v ktorom názorne zobrazte procesy a stavy počas vykonávania inštrukcie daného programu pre zvolený typ procesora.', 'Analyzujte možnosti a prostriedky na simuláciu definovanej inštrukčnej sady strojových inštrukcií. Vytvorte simulačné prostredie, v ktorom názorne zobrazte procesy a stavy počas vykonávania inštrukcie daného programu pre zvolený typ procesora.', 1);
INSERT INTO projects VALUES (163, 'ZP', 24, NULL, 152, '2005/2006', 'Optimalizácia turnusov v autobusovej doprave', 'Optimalizácia turnusov v autobusovej doprave', 'Pomocou grafového modelu riešte optimalizáciu turnusov v autobusovej doprave.
Analyzujte vybrané metódy, ktoré sa používajú v teórii grafov 
na modelovanie dopravných sietí. Analyzujte použité algoritmy, ktorými problém optimalizujete.
Navrhnite model, pre optimalizáciu turnusov v autobusovej doprave.
Nájdite maximálny tok v  dopravnej sieti. Model optimalizujte a zistite najlacnejší maximálny tok. Navrhnutý model vizualizujte vytvorením softvérového prototypu.
', 'Pomocou grafového modelu riešte optimalizáciu turnusov v autobusovej doprave.
Analyzujte vybrané metódy, ktoré sa používajú v teórii grafov 
na modelovanie dopravných sietí. Analyzujte použité algoritmy, ktorými problém optimalizujete.
Navrhnite model, pre optimalizáciu turnusov v autobusovej doprave.
Nájdite maximálny tok v  dopravnej sieti. Model optimalizujte a zistite najlacnejší maximálny tok. Navrhnutý model vizualizujte vytvorením softvérového prototypu.
', 1);
INSERT INTO projects VALUES (164, 'ZP', 563, NULL, 154, '2002/2003', 'Vnorený systém pre polohovacie zariadenie', 'Embeded system for positioning equipment', NULL, NULL, 0);
INSERT INTO projects VALUES (165, 'DP', 563, NULL, 154, '2003/2004', 'Experimentálny mikropočítač', 'Experimental microcomputer', NULL, NULL, 0);
INSERT INTO projects VALUES (166, 'ZP', 655, NULL, 155, '2003/2004', 'Nástroj pre analýzu javov v neurónových sieťach', 'Nástroj pre analýzu javov v neurónových sieťach', 'Rekurentné neurónové siete sú na rozdiel od klasických dopredných neurónových sietí schopné spracovávať vstupy s časopriestorovou štruktúrou, ako sú napríklad časové postupnosti symbolov. Pri ich skúmaní boli opísané viaceré zaujímavé javy, ktoré vyžadujú podrobnejšiu analýzu pre ich lepšie pochopenie.
Naštudujte problematiku rekurentných neurónových sietí, zamerajte sa na javy v rekurentných sieťach ako architektutálny bias (fraktálová štruktúra stavového priestoru), zmena stavovej reprezentácie v procese učenia, prípadne strácanie chybových signálov v čase. Navrhnite a vytvorte nástroj (napr. JAVA applet), ktorý by umožnil pomocou zaujímavých vizualizácii prehľadné znázornenie týchto javov a tak ich následné skúmanie.  Vytvorené riešenie overte na zvolených testovacích postupnostiach.
', 'Rekurentné neurónové siete sú na rozdiel od klasických dopredných neurónových sietí schopné spracovávať vstupy s časopriestorovou štruktúrou, ako sú napríklad časové postupnosti symbolov. Pri ich skúmaní boli opísané viaceré zaujímavé javy, ktoré vyžadujú podrobnejšiu analýzu pre ich lepšie pochopenie.
Naštudujte problematiku rekurentných neurónových sietí, zamerajte sa na javy v rekurentných sieťach ako architektutálny bias (fraktálová štruktúra stavového priestoru), zmena stavovej reprezentácie v procese učenia, prípadne strácanie chybových signálov v čase. Navrhnite a vytvorte nástroj (napr. JAVA applet), ktorý by umožnil pomocou zaujímavých vizualizácii prehľadné znázornenie týchto javov a tak ich následné skúmanie.  Vytvorené riešenie overte na zvolených testovacích postupnostiach.
', 1);
INSERT INTO projects VALUES (167, 'ZP', 301, NULL, 156, '2002/2003', 'Návrh a implementácia algoritmu pre funkčný generátor testov  VLSI obvodov', 'Functional test generator for VLSI circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (168, 'DP', 301, NULL, 156, '2003/2004', 'Funkčný generátor testov VLSI obvodov', 'Functional test generator for VLSI circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (169, 'ZP', 660, NULL, 157, '2005/2006', 'CSIDC 2006', 'CSIDC 2006', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.
', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.
', 1);
INSERT INTO projects VALUES (170, 'ZP', 579, NULL, 159, '2003/2004', 'Využitie multimediálnych foriem výučby informatiky - 2', 'Využitie multimediálnych foriem výučby informatiky - 2', 'Analyzujte možnosti využitia multimediálnej podoby informácií v systémoch na podporu výučby informatiky. Navrhnite základný systém a následne ho rozšírte o vhodné štruktúry a funkcie, ktoré by zvýraznili obohatenie textového obsahu o rôzne iné formy prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na niektorom predmete podľa potrieb KIVT.', 'Analyzujte možnosti využitia multimediálnej podoby informácií v systémoch na podporu výučby informatiky. Navrhnite základný systém a následne ho rozšírte o vhodné štruktúry a funkcie, ktoré by zvýraznili obohatenie textového obsahu o rôzne iné formy prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na niektorom predmete podľa potrieb KIVT.', 1);
INSERT INTO projects VALUES (171, 'ZP', 297, NULL, 161, '2003/2004', 'Výučba odborného predmetu cez Internet', 'Výučba odborného predmetu cez Internet', 'Analyzujte nové smery v oblasti výučby a vzdelávania ako dôsledok nových informačných technológií. Zamerajte sa na e-learning paradigmu. Špecifikujte model systému orientovaný pre vyučovanie odborného predmetu a navrhnite  jeho štruktúru , ktorá bude vyhovovať prezentácii v sieti Internet. Navrhnite model v súlade so štandardami modelu e-learning. Systém skúšobne naplňte  textom s príkladmi do štruktúrovaných jednotiek. Overte  funkčnosť navrhnutého systému.', 'Analyzujte nové smery v oblasti výučby a vzdelávania ako dôsledok nových informačných technológií. Zamerajte sa na e-learning paradigmu. Špecifikujte model systému orientovaný pre vyučovanie odborného predmetu a navrhnite  jeho štruktúru , ktorá bude vyhovovať prezentácii v sieti Internet. Navrhnite model v súlade so štandardami modelu e-learning. Systém skúšobne naplňte  textom s príkladmi do štruktúrovaných jednotiek. Overte  funkčnosť navrhnutého systému.', 1);
INSERT INTO projects VALUES (172, 'ZP', 579, NULL, 162, '2005/2006', 'Systém pre správu webových stránok - používateľ', 'Systém pre správu webových stránok - používateľ', 'Cieľom projektu je vytvorenie prostredia, ktoré umožní spravovanie webových stránok. Analyzujte existujúce systémy podobného charakteru z pohľadu používateľov a vlastností prostredia, v ktorom bude vytváraný systém.  Navrhnite štruktúru použitej databázy, štruktúru obrazoviek pre používateľov, grafické prvky a štýly. Následne implementujte kľúčové časti systému a použiteľnosť overte na vybranej množine stránok používaných v pedagogike FIIT.
', 'Cieľom projektu je vytvorenie prostredia, ktoré umožní spravovanie webových stránok. Analyzujte existujúce systémy podobného charakteru z pohľadu používateľov a vlastností prostredia, v ktorom bude vytváraný systém.  Navrhnite štruktúru použitej databázy, štruktúru obrazoviek pre používateľov, grafické prvky a štýly. Následne implementujte kľúčové časti systému a použiteľnosť overte na vybranej množine stránok používaných v pedagogike FIIT.
', 1);
INSERT INTO projects VALUES (173, 'ZP', 294, NULL, 163, '2005/2006', 'Systém pre animovanie chôdze ľudskej kostry', 'Systém pre animovanie chôdze ľudskej kostry', 'Urobte rešerš literatúry o počítačových modeloch ľudskej kostry a animácie chôdze a  na základe výsledkov tímových projektov [1], [2] doplňte model  kostry človeka a jeho animácie o chrbticu, hrudný kôš, horné končatiny a hlavu. Použite rovnakú reprezentáciu 3D modelu, štruktúru dát modelu kostry, formát súboru pre simuláciu pohybu ako aj metodiku transformácie existujúcich modelov do požadovanej štruktúry dát..  

[1]  Mareták, P.: Analýza a animácia chôdze človeka. Tímový projekt FIIT STU Bratislava (2004)
[2] Lučenič, Ľ.:  Analýza a animácia chôdze človeka. Tímový projekt FIIT STU Bratislava (2005)

', 'Urobte rešerš literatúry o počítačových modeloch ľudskej kostry a animácie chôdze a  na základe výsledkov tímových projektov [1], [2] doplňte model  kostry človeka a jeho animácie o chrbticu, hrudný kôš, horné končatiny a hlavu. Použite rovnakú reprezentáciu 3D modelu, štruktúru dát modelu kostry, formát súboru pre simuláciu pohybu ako aj metodiku transformácie existujúcich modelov do požadovanej štruktúry dát..  

[1]  Mareták, P.: Analýza a animácia chôdze človeka. Tímový projekt FIIT STU Bratislava (2004)
[2] Lučenič, Ľ.:  Analýza a animácia chôdze človeka. Tímový projekt FIIT STU Bratislava (2005)

', 1);
INSERT INTO projects VALUES (174, 'ZP', 705, NULL, 164, '2002/2003', 'Automatický návrh sériovo-paralelných hradlových obvodov', 'Automatic design of serial-parallel gate circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (175, 'ZP', 298, NULL, 165, '2002/2003', 'Informačný systém regionálnej CISCO akadémie, prezentácia dát', 'Regional Cisco Academy information system, data presentation', NULL, NULL, 1);
INSERT INTO projects VALUES (176, 'DP', 433, NULL, 165, '2004/2005', 'Systém pre správu dokumentov v prostredí webu so sémantikou', 'Semantic web based system for document management', NULL, NULL, 1);
INSERT INTO projects VALUES (177, 'ZP', 417, NULL, 166, '2002/2003', 'Simulátor počítačovej siete', 'Simulátor počítačovej siete', NULL, NULL, 0);
INSERT INTO projects VALUES (178, 'ZP', 579, NULL, 167, '2005/2006', 'Multimediálne informácie v regionálnom IS', 'Multimediálne informácie v regionálnom IS', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili informačné využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb FIIT.', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili informačné využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb FIIT.', 1);
INSERT INTO projects VALUES (179, 'ZP', 660, NULL, 168, '2005/2006', 'CSIDC 2006', 'CSIDC 2006', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.
', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.
', 1);
INSERT INTO projects VALUES (180, 'ZP', 219, 260, 169, '2002/2003', 'Trhovo orientovaný prístup k správe prostriedkov výpočtového systému', 'The market-oriented approach to the management of computational system', 'Trhovo orientovaný prístup k správe prostriedkov výpočtového systému', 'Trhovo orientovaný prístup k správe prostriedkov výpočtového systému', 1);
INSERT INTO projects VALUES (181, 'ZP', 374, NULL, 170, '2002/2003', 'Vlastnosti evolučných algoritmov', 'Vlastnosti evolučných algoritmov', NULL, NULL, 1);
INSERT INTO projects VALUES (182, 'ZP', 25, NULL, 171, '2002/2003', 'Vzdialený prístup k hardwareovým prostriedkom počítača', 'Hardware sharing in Unix operating systems', NULL, NULL, 0);
INSERT INTO projects VALUES (183, 'DP', 358, NULL, 171, '2003/2004', 'Implementácia modelu bezpečnostnej politiky v bezpečnostných bránach', 'Implementation of security policy model in firewalls', NULL, NULL, 0);
INSERT INTO projects VALUES (184, 'ZP', 358, NULL, 172, '2005/2006', 'Testovanie bezpečnostných slabín počítačových sietí', 'Testovanie bezpečnostných slabín počítačových sietí', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy bezpečnostných slabín. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú testovať vybraté typy bezpečnostných slabín na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy bezpečnostných slabín. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú testovať vybraté typy bezpečnostných slabín na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.', 0);
INSERT INTO projects VALUES (185, 'DP', 704, NULL, 173, '2005/2006', 'Diskusné fórum virtuálnej univerzity', 'Virtual University – discusion forums ', NULL, NULL, 1);
INSERT INTO projects VALUES (186, 'ZP', 704, NULL, 173, '2003/2004', 'Diskusné fórum  univerzity', 'Virtual University – discusion forums', 'Analyzujte súčasné spôsoby on-line  spôsoby konverzácie ( talkery) na sieti Internet. Analyzujte a porovnajte existujúce prostriedky. Na základe analýzy  navrhnite vlastný takýto prostriedok. Pri návrhu uvažujte s jeho  využitím ako prostriedku diskusného fóra pre systém virtuálnej univerzity. Treba zabezpečiť hierarchiu prístupových práv jednotlivých používateľov aj v súvislosti ich zadelenia do tried a formu jednoduchých užívateľských príkazov. Návrh modulu pre viacužívateľskú konverzáciu implementujte a odskúšajte ako prototyp. ', 'Analyzujte súčasné spôsoby on-line  spôsoby konverzácie ( talkery) na sieti Internet. Analyzujte a porovnajte existujúce prostriedky. Na základe analýzy  navrhnite vlastný takýto prostriedok. Pri návrhu uvažujte s jeho  využitím ako prostriedku diskusného fóra pre systém virtuálnej univerzity. Treba zabezpečiť hierarchiu prístupových práv jednotlivých používateľov aj v súvislosti ich zadelenia do tried a formu jednoduchých užívateľských príkazov. Návrh modulu pre viacužívateľskú konverzáciu implementujte a odskúšajte ako prototyp. ', 1);
INSERT INTO projects VALUES (187, 'ZP', 660, NULL, 174, '2002/2003', 'CSIDC', 'CSIDC', NULL, NULL, 1);
INSERT INTO projects VALUES (188, 'DP', 24, NULL, 174, '2003/2004', 'Využitie metód získavania znalostí z databáz pre bankový sektor', 'Application of Knowledge Discovery in Databases Methods to Banking', NULL, NULL, 1);
INSERT INTO projects VALUES (189, 'ZP', 374, NULL, 176, '2002/2003', 'Vylepšenie prostredia pre simulácie robotického hokeja', 'Improvement of robotic hockey simulation environment', NULL, NULL, 1);
INSERT INTO projects VALUES (190, 'ZP', 562, 358, 177, '2002/2003', 'Merací systém s PC', 'Measuring system with PC', NULL, NULL, 0);
INSERT INTO projects VALUES (191, 'DP', 562, 358, 177, '2003/2004', 'Automatický merací systém na diagnostiku polovodičových štruktúr', 'Automatic measurement system for diagnostics of semiconductor structures', NULL, NULL, 0);
INSERT INTO projects VALUES (192, 'ZP', 563, NULL, 178, '2002/2003', 'Statický vnútroobvodový emulátor', 'Static in-circuit emulator', NULL, NULL, 0);
INSERT INTO projects VALUES (193, 'DP', 563, NULL, 178, '2004/2005', 'Vnorený multiprocesorový systém', 'Embedded multiprocessor system', NULL, NULL, 0);
INSERT INTO projects VALUES (194, 'ZP', 46, NULL, 179, '2002/2003', 'Tvorba návrhových vzorov  - šablón', 'Creating design paterns – templates', NULL, NULL, 1);
INSERT INTO projects VALUES (195, 'DP', 46, NULL, 179, '2004/2005', 'Návrhové vzory v tvorbe softvéru', 'DESIGN PATTERNS IN SOFTWARE DEVELOPMENT', NULL, NULL, 1);
INSERT INTO projects VALUES (196, 'ZP', 579, NULL, 180, '2002/2003', 'Multimediálne informácie v regionálnom IS - 2', 'Multimedia information in regional information system - 2', NULL, NULL, 1);
INSERT INTO projects VALUES (197, 'DP', 655, NULL, 180, '2003/2004', 'Trénovanie Echo state neurónových sietí algoritmom simulovaného žíhania', 'Training of Echo state neural networks using simulated annealing algorithm', NULL, NULL, 1);
INSERT INTO projects VALUES (198, 'ZP', 660, NULL, 181, '2002/2003', 'CSIDC', 'CSIDC', NULL, NULL, 1);
INSERT INTO projects VALUES (199, 'DP', 342, NULL, 181, '2003/2004', 'Programové vybavenie pre spracovanie meteorologických údajov', 'Software for processing of meteorological data', NULL, NULL, 1);
INSERT INTO projects VALUES (200, 'ZP', 188, NULL, 182, '2005/2006', 'Systém pre realizáciu turnaja programov', 'Systém pre realizáciu turnaja programov', 'Analyzujte, špecifikujte, navrhnite a implementujte systém, ktorý umožní samostatne fungujúcim programom (hráčom) odohrať turnaj vo zvolenej hre a určiť víťaza. Turnaj musí prebiehať plne automaticky, predpokladajte možnú účasť desiatok hráčov. Implementujte niekoľko takýchto hráčov a prostredníctvom vášho systému usporiadajte medzi nimi ukážkový turnaj.', 'Analyzujte, špecifikujte, navrhnite a implementujte systém, ktorý umožní samostatne fungujúcim programom (hráčom) odohrať turnaj vo zvolenej hre a určiť víťaza. Turnaj musí prebiehať plne automaticky, predpokladajte možnú účasť desiatok hráčov. Implementujte niekoľko takýchto hráčov a prostredníctvom vášho systému usporiadajte medzi nimi ukážkový turnaj.', 1);
INSERT INTO projects VALUES (201, 'ZP', 563, NULL, 183, '2002/2003', 'Statický vnútroobvodový emulátor', 'Static in-circuit emulator', NULL, NULL, 0);
INSERT INTO projects VALUES (202, 'DP', 563, NULL, 183, '2004/2005', 'Vnorený multiprocesorový systém', 'Embedded multiprocessor system', NULL, NULL, 0);
INSERT INTO projects VALUES (203, 'ZP', 221, NULL, 185, '2002/2003', 'Kryptoanalýza a použitie kryptosystému XTR', 'Cryptanalysis and applications of XTR', NULL, NULL, 1);
INSERT INTO projects VALUES (204, 'DP', 396, NULL, 185, '2004/2005', 'Kryptosystém XTR', 'The XTR Cryptosystem', NULL, NULL, 2);
INSERT INTO projects VALUES (205, 'ZP', 20, NULL, 186, '2002/2003', 'Modely rekurentných neurónových sietí založené na architekturálnom biase', 'Models of recurrent neural networks based on architectural bias', NULL, NULL, 1);
INSERT INTO projects VALUES (206, 'DP', 579, NULL, 186, '2003/2004', 'Virtuálna univerzita – správa nevirtuálnych prostriedkov – rezervačný podsystém', 'Virtual university - non-virtual resources management – reservation subsystem', NULL, NULL, 1);
INSERT INTO projects VALUES (207, 'ZP', 705, NULL, 187, '2002/2003', 'Automatický návrh mostíkových hradlových obvodov', 'Automatic design of bridge-gate circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (208, 'DP', 357, NULL, 187, '2004/2005', 'Kódovanie/dekódovanie Reed Solomonovych kódov na interaktívnom webe', 'Coding/decoding Reed Solomon codes on interactive web', NULL, NULL, 0);
INSERT INTO projects VALUES (209, 'ZP', 436, NULL, 189, '2002/2003', 'Program pre automatickú syntézu sekvenčných obvodov s preklápacími obvodmi', 'Program for automatic synthesis of sequential circuits with flip – flop circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (210, 'DP', 705, NULL, 189, '2003/2004', 'Programový systém na detekciu a elimináciu statických hazardov', 'Program system for detection and elimination of static hazards', NULL, NULL, 0);
INSERT INTO projects VALUES (211, 'ZP', 660, NULL, 190, '2002/2003', 'Podpora organizovania ankiet v prostredí WWW', 'Support of design and operating web questionnaires', NULL, NULL, 1);
INSERT INTO projects VALUES (212, 'DP', 260, NULL, 190, '2003/2004', 'Výpočtové prostredie pre aktívny súborový systém', 'Computing environment for active file system', NULL, NULL, 1);
INSERT INTO projects VALUES (213, 'ZP', 563, NULL, 191, '2005/2006', 'Experimentálny mikropočítač EMP386EX', 'Experimentálny mikropočítač EMP386EX', 'Navrhnite a zrealizujte experimentálny mikropočítač na báze mikroprocesora 80386EX s nasledovnými požiadavkami: 8-bitová pamäť ROM s kapacitou 512 kB s možnosťou rozšírenia, 16-bitová pamäť RWM s kapacitou 64 kB s možnosťou rozšírenia, možnosť krokovania programu po stroj. cykloch cez stav WAIT, 6-miestny numerický displej, 2 sériové interfejsy RS232C, podpora pripojenia monitorovacej jednotky.', 'Navrhnite a zrealizujte experimentálny mikropočítač na báze mikroprocesora 80386EX s nasledovnými požiadavkami: 8-bitová pamäť ROM s kapacitou 512 kB s možnosťou rozšírenia, 16-bitová pamäť RWM s kapacitou 64 kB s možnosťou rozšírenia, možnosť krokovania programu po stroj. cykloch cez stav WAIT, 6-miestny numerický displej, 2 sériové interfejsy RS232C, podpora pripojenia monitorovacej jednotky.', 0);
INSERT INTO projects VALUES (214, 'ZP', 297, NULL, 192, '2002/2003', 'Virtuálny stroj', 'Virtual Machine', NULL, NULL, 1);
INSERT INTO projects VALUES (215, 'DP', 297, NULL, 192, '2004/2005', 'Animácia činnosti procesora', 'Animation of processor activity', NULL, NULL, 1);
INSERT INTO projects VALUES (216, 'ZP', 422, 297, 193, '2002/2003', 'Kontrola šachových ťahov', 'Checking of chess moves', NULL, NULL, 1);
INSERT INTO projects VALUES (217, 'DP', 422, NULL, 193, '2004/2005', 'Automatická oprava chýb v zápise šachovej partie', 'Automatic errors corrections in text game of chess', NULL, NULL, 1);
INSERT INTO projects VALUES (218, 'ZP', 705, NULL, 194, '2005/2006', 'Automatický návrh logických kombinačných obvodov s integrovanými obvodmi MSI', 'Automatický návrh logických kombinačných obvodov s integrovanými obvodmi MSI', 'Treba vypracovať metodiku automatického návrhu logických kombinačných obvodov s jedným výstupom s použitím multiplexorov zo stavebnice  integrovaných obvodov MSI, a navrhnúť a odladiť programový systém pre osobný počítač. Vstupom má byť boolovská funkcia s najviac piatimi premennými zadaná ľubovoľným boolovským výrazom alebo pravdivostnou tabuľkou. Výstupom má byť prepojovací predpis opisujúci štruktúru navrhnutého logického obvodu.', 'Treba vypracovať metodiku automatického návrhu logických kombinačných obvodov s jedným výstupom s použitím multiplexorov zo stavebnice  integrovaných obvodov MSI, a navrhnúť a odladiť programový systém pre osobný počítač. Vstupom má byť boolovská funkcia s najviac piatimi premennými zadaná ľubovoľným boolovským výrazom alebo pravdivostnou tabuľkou. Výstupom má byť prepojovací predpis opisujúci štruktúru navrhnutého logického obvodu.', 0);
INSERT INTO projects VALUES (219, 'DP', 387, NULL, 195, '2005/2006', 'Využitie pravdepodobnostných modelov so skrytými premennými na dolovanie v textových databázach', 'Use of probabilistic models with unobserved variables for data mining in textual databases', NULL, NULL, 1);
INSERT INTO projects VALUES (220, 'ZP', 388, NULL, 195, '2003/2004', 'Spracovanie študentských projektov', 'Processing of students assignments', 'Analyzujte typické činnosti v životnom cykle študentských projektov riešených v rámci informatických predmetov na KIVT. Analyzujte  možnosti spracovania týchto činností v prostredí internetu a navrhnite softvérový systém na ich podporu.  Systém musí podporovať činnosti ako: tvorbu tém projektov k predmetu zo strany učiteľov, výber a schválenie konečnej množiny tém, prezentáciu tém v pavučine pre študentov, výber preferovaných tém zo strany študentov, proces pridelenia témy, prezentáciu konečného pridelenia,  odovzdanie riešenia v jednotlivých kontrolných bodoch, atď. Musí zabezpečiť autorizovaný prístup rôznych kategórií používateľov. 
Navrhnuté riešenie overte implementovaním softvérového prototypu pre vybrané činnosti životného cyklu projektu. 

', 'Analyzujte typické činnosti v životnom cykle študentských projektov riešených v rámci informatických predmetov na KIVT. Analyzujte  možnosti spracovania týchto činností v prostredí internetu a navrhnite softvérový systém na ich podporu.  Systém musí podporovať činnosti ako: tvorbu tém projektov k predmetu zo strany učiteľov, výber a schválenie konečnej množiny tém, prezentáciu tém v pavučine pre študentov, výber preferovaných tém zo strany študentov, proces pridelenia témy, prezentáciu konečného pridelenia,  odovzdanie riešenia v jednotlivých kontrolných bodoch, atď. Musí zabezpečiť autorizovaný prístup rôznych kategórií používateľov. 
Navrhnuté riešenie overte implementovaním softvérového prototypu pre vybrané činnosti životného cyklu projektu. 

', 1);
INSERT INTO projects VALUES (221, 'ZP', 20, NULL, 196, '2005/2006', 'Editor neurónových sietí', 'Editor neurónových sietí', 'Rekurentné neurónové siete sú na rozdiel od klasických popredných neurónových sietí schopné spracovávať vstupy s časopriestorovou štruktúrou. Naštudujte problematiku neurónových sietí a rekurentných neurónových sietí, zamerajte sa na možnosti zakódovania architektúry neurónových sietí vzhľadom na potreby trénovacích algoritmov. Vytvorte editor umožňujúci používateľovi vytvoriť neurónovú sieť využívajúci navrhnutý formát.', 'Rekurentné neurónové siete sú na rozdiel od klasických popredných neurónových sietí schopné spracovávať vstupy s časopriestorovou štruktúrou. Naštudujte problematiku neurónových sietí a rekurentných neurónových sietí, zamerajte sa na možnosti zakódovania architektúry neurónových sietí vzhľadom na potreby trénovacích algoritmov. Vytvorte editor umožňujúci používateľovi vytvoriť neurónovú sieť využívajúci navrhnutý formát.', 1);
INSERT INTO projects VALUES (222, 'ZP', 25, NULL, 197, '2002/2003', 'Vzdialený prístup k hardwareovým prostriedkom počítača', 'Remote access to the computer’s hardware', NULL, NULL, 1);
INSERT INTO projects VALUES (223, 'DP', 297, NULL, 197, '2003/2004', 'Animácia vizualizovaného programu', 'Animation of visualised program', NULL, NULL, 1);
INSERT INTO projects VALUES (224, 'ZP', 705, NULL, 198, '2005/2006', 'Automatický návrh logických kombinačných obvodov s integrovanými obvodmi SSI', 'Automatický návrh logických kombinačných obvodov s integrovanými obvodmi SSI', 'Treba vypracovať metodiku automatického návrhu logických kombinačných obvodov s jedným výstupom s použitím členov NAND zo stavebnice integrovaných obvodov SSI a  navrhnúť a odladiť programový systém pre osobný počítač. Vstupom má byť boolovská funkcia zadaná ľubovoľným boolovským výrazom alebo pravdivostnou tabuľkou. Výstupom má byť prepojovací predpis opisujúci štruktúru navrhnutého logického obvodu.', 'Treba vypracovať metodiku automatického návrhu logických kombinačných obvodov s jedným výstupom s použitím členov NAND zo stavebnice integrovaných obvodov SSI a  navrhnúť a odladiť programový systém pre osobný počítač. Vstupom má byť boolovská funkcia zadaná ľubovoľným boolovským výrazom alebo pravdivostnou tabuľkou. Výstupom má byť prepojovací predpis opisujúci štruktúru navrhnutého logického obvodu.', 0);
INSERT INTO projects VALUES (225, 'ZP', 92, 375, 199, '2002/2003', 'Jednotné prihlásenie na báze XML v počítačových sieťach', 'XML based single sign-on for comuter networks', NULL, NULL, 0);
INSERT INTO projects VALUES (226, 'DP', 92, 375, 199, '2003/2004', 'Centralizovaná správa používateľov', 'Centralizovaná správa používateľov', NULL, NULL, 0);
INSERT INTO projects VALUES (227, 'ZP', 13, 431, 200, '2002/2003', 'Generátor testov pre poruchy oneskorení v číslicových obvodoch', 'Delay faults test generator for digital circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (228, 'DP', 13, NULL, 200, '2004/2005', 'Generátor testov pre poruchy oneskorení pre štrukturované sekvenčné obvody', 'Delay faults test generator for full-scan sequential circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (229, 'ZP', 396, NULL, 201, '2002/2003', 'História rotorových šifrátorov a možnosti ich dnešného využitia', 'The history of rotor systems and the possibilities of their application to date', NULL, NULL, 1);
INSERT INTO projects VALUES (230, 'DP', 517, NULL, 201, '2003/2004', 'Stochastické CDGS náhodné grafy s vlastnosťami grafov malého sveta', 'Networks generation with properties of small world graphs – genetic algorithm utilization', NULL, NULL, 1);
INSERT INTO projects VALUES (231, 'ZP', 541, NULL, 202, '2002/2003', 'Inteligentné spracovanie informácií v distribuovanom prostredí', 'Inteligent data processing in distributed systems', NULL, NULL, 1);
INSERT INTO projects VALUES (232, 'DP', 387, NULL, 202, '2004/2005', 'Klastrovanie dokumentov pomocou pravdepodobnostných modelov', 'Unsupervised clustering of documents using probability models ', NULL, NULL, 1);
INSERT INTO projects VALUES (233, 'ZP', 215, NULL, 203, '2002/2003', 'Finančné operácie, štruktúra nákladov, cykly a kapitálový trh v podmienkach rizika', 'Finančné operácie, štruktúra nákladov, cykly a kapitálový trh v podmienkach rizika', NULL, NULL, 1);
INSERT INTO projects VALUES (234, 'ZP', 272, NULL, 204, '2002/2003', 'Podpora výučby OOP', 'The support of teaching object oriented programming', NULL, NULL, 1);
INSERT INTO projects VALUES (235, 'DP', 437, NULL, 204, '2003/2004', 'Vývoj otvorených zdrojov a celosvetová pavučina', 'Open Source Development and the World Wide Web', NULL, NULL, 1);
INSERT INTO projects VALUES (236, 'ZP', 396, NULL, 205, '2002/2003', 'Shannonov prístup ku bezpečnosti komunikácie a jeho aktuálnosť', 'Shannon’s approach to the security of the communication and its current utilization.', NULL, NULL, 1);
INSERT INTO projects VALUES (237, 'DP', 437, NULL, 205, '2003/2004', 'Špecializačné vzory v navrhovaní programov v jazyku Java', 'Specialization patterns in program designing in Java language', NULL, NULL, 1);
INSERT INTO projects VALUES (238, 'ZP', 375, NULL, 206, '2002/2003', 'Systém pre správu a riešenie úloh', 'System for administration and solving problems', NULL, NULL, 0);
INSERT INTO projects VALUES (239, 'DP', 375, NULL, 206, '2003/2004', 'Manažment sieťových prvkov', 'System for management network elements', NULL, NULL, 0);
INSERT INTO projects VALUES (240, 'ZP', 297, NULL, 207, '2002/2003', 'Vizualizácia programov', 'Program visualization', NULL, NULL, 1);
INSERT INTO projects VALUES (241, 'DP', 437, NULL, 207, '2003/2004', 'Stratégie spolupráce vo viacagentových systémoch', 'Teamwork strategies in multiagent systems', NULL, NULL, 1);
INSERT INTO projects VALUES (242, 'ZP', 705, NULL, 208, '2006/2007', 'Automatický návrh logických kombinačných obvodov s integrovanými obvodmi MSI', 'Automatický návrh logických kombinačných obvodov s integrovanými obvodmi MSI', 'Treba vypracovať metodiku automatického návrhu logických kombinačných obvodov s jedným výstupom s použitím členov NOR zo stavebnice integrovaných obvodov SSI a navrhnúť a odladiť programový systém pre osobný počítač. Vstupom má byť boolovská funkcia zadaná ľubovoľným boolovským výrazom alebo pravdivostnou tabuľkou. Výstupom má byť prepojovací predpis opisujúci štruktúru navrhnutého logického obvodu.', 'Treba vypracovať metodiku automatického návrhu logických kombinačných obvodov s jedným výstupom s použitím členov NOR zo stavebnice integrovaných obvodov SSI a navrhnúť a odladiť programový systém pre osobný počítač. Vstupom má byť boolovská funkcia zadaná ľubovoľným boolovským výrazom alebo pravdivostnou tabuľkou. Výstupom má byť prepojovací predpis opisujúci štruktúru navrhnutého logického obvodu.', 0);
INSERT INTO projects VALUES (243, 'ZP', 25, NULL, 209, '2005/2006', 'Monitorovanie používateľských procesov', 'Monitorovanie používateľských procesov', 'Analyzujte možnosti získania údajov o bežiacich procesoch (ako názov príkazu, argumenty, používateľ, alokované prostriedky, atď.) v OS. Vypracujte návrh systému, ktorý na základe týchto údajov a konfigurácie zadanej používateľom bude sledovať a ovplyvňovať stav procesov. Systém implementujte a otestujte.', 'Analyzujte možnosti získania údajov o bežiacich procesoch (ako názov príkazu, argumenty, používateľ, alokované prostriedky, atď.) v OS. Vypracujte návrh systému, ktorý na základe týchto údajov a konfigurácie zadanej používateľom bude sledovať a ovplyvňovať stav procesov. Systém implementujte a otestujte.', 0);
INSERT INTO projects VALUES (244, 'ZP', 387, NULL, 210, '2005/2006', 'Sharing book reviews', 'Sharing book reviews', 'On the Internet, one can find book reviews on sites of Internet book stores (e.g. Amazon.com). But information about books and book reviews
is writteln only in one language and it is not possible to add a new book that is not offered by the store. That is why, there is need for Internet portal that enables the user to add information about new books and publish their reviews. Analyze existing portals, design an implement Internet portal that provides a hierarchy of categories where users can
add the  information about new books and write their reviews. All those
information should be reviesed by administrator. He might be also able
to edit hierarchy of categories – based on different characteristics (e.g. language, genre).', 'On the Internet, one can find book reviews on sites of Internet book stores (e.g. Amazon.com). But information about books and book reviews
is writteln only in one language and it is not possible to add a new book that is not offered by the store. That is why, there is need for Internet portal that enables the user to add information about new books and publish their reviews. Analyze existing portals, design an implement Internet portal that provides a hierarchy of categories where users can
add the  information about new books and write their reviews. All those
information should be reviesed by administrator. He might be also able
to edit hierarchy of categories – based on different characteristics (e.g. language, genre).', 1);
INSERT INTO projects VALUES (245, 'ZP', 360, NULL, 211, '2002/2003', 'Programová podpora výučby jazyka VHDL', 'Software support for VHDL language teaching', NULL, NULL, 0);
INSERT INTO projects VALUES (246, 'DP', 25, NULL, 211, '2003/2004', 'Implementácia politiky prideľovania systémových zdrojov', 'Implementation of system resources allocation policy', NULL, NULL, 0);
INSERT INTO projects VALUES (247, 'ZP', 31, NULL, 212, '2002/2003', 'Nové črty pre aplikáciu EGRET', 'New features for application EGRET', NULL, NULL, 1);
INSERT INTO projects VALUES (248, 'DP', 294, NULL, 212, '2005/2006', 'Hovoriaca hlava so simulovaním výrazov tváre', 'Hovoriaca hlava so simulovaním výrazov tváre', NULL, NULL, 1);
INSERT INTO projects VALUES (249, 'ZP', 375, NULL, 213, '2002/2003', 'Systém pre správu a riešenie úloh', 'Administrating and Solving Task System', NULL, NULL, 1);
INSERT INTO projects VALUES (250, 'DP', 388, NULL, 213, '2003/2004', 'Podpora sprístupňovania dokumentov', 'Support for documents accessing', NULL, NULL, 1);
INSERT INTO projects VALUES (251, 'DP', 253, NULL, 214, '2004/2005', 'Multimediálna výučba ekonómie', 'Multimedia Economics Training', NULL, NULL, 3);
INSERT INTO projects VALUES (252, 'ZP', 566, NULL, 216, '2005/2006', 'Použitie neurónových sietí k "dištančnému" riadeniu zložitých systémov', 'Použitie neurónových sietí k "dištančnému" riadeniu zložitých systémov', 'Ak stojíme pred problémom, ako riadiť nejaký zložitý systém, obvykle tento problém riešime pomocou modelu "dištančného" riadenia, ktorý v kognitívnej vede patrí medzi základné modely. V prvej etape si vytvoríme vnútorný model systému, ktorý odráža základné vlastnosti riadeného systému. V ďalšej etape už zložitý systém riadime pomocou tohto modelu.
Podrobnosti prístupu sú uvedené v kapitole, ktorá je uvedená na adrese
ftp://math.chtf.stuba.sk/pub/vlado/FSEV_Informatika/skripta/pdf_final/Kapitola12.pdf
', 'Ak stojíme pred problémom, ako riadiť nejaký zložitý systém, obvykle tento problém riešime pomocou modelu "dištančného" riadenia, ktorý v kognitívnej vede patrí medzi základné modely. V prvej etape si vytvoríme vnútorný model systému, ktorý odráža základné vlastnosti riadeného systému. V ďalšej etape už zložitý systém riadime pomocou tohto modelu.
Podrobnosti prístupu sú uvedené v kapitole, ktorá je uvedená na adrese
ftp://math.chtf.stuba.sk/pub/vlado/FSEV_Informatika/skripta/pdf_final/Kapitola12.pdf
', 1);
INSERT INTO projects VALUES (253, 'DP', 298, NULL, 217, '2003/2004', 'Virtuálna univerzita', 'Virtual University', NULL, NULL, 0);
INSERT INTO projects VALUES (254, 'ZP', 44, NULL, 222, '2005/2006', 'Implementácia algoritmov na hľadanie hamiltonovských kružníc v grafe', 'Implementácia algoritmov na hľadanie hamiltonovských kružníc v grafe', 'Úloha zistiť, či v grafe existuje hamiltonovská kružnica je NP-úplný problém. Jeden možný prístup, ako zvládnuť tento problém v praxi, je overiť nejakú postačujúcu podmienku hamiltonovskosti (napr. podmienku Bondyho a Chvátala - dá sa overiť v polynomiálnom čase). Tým však zúžime množinu hamiltonovských grafov, pretože nie všetky hamiltonovské grafy jej vyhovujú.
Inou možnosťou je implemetovať nejaký heuristický algoritmus a hľadať hamiltonovskú kružnicu podľa neho.
Projekt by mal riešiť daný problém obidvomi prístupmi.', 'Úloha zistiť, či v grafe existuje hamiltonovská kružnica je NP-úplný problém. Jeden možný prístup, ako zvládnuť tento problém v praxi, je overiť nejakú postačujúcu podmienku hamiltonovskosti (napr. podmienku Bondyho a Chvátala - dá sa overiť v polynomiálnom čase). Tým však zúžime množinu hamiltonovských grafov, pretože nie všetky hamiltonovské grafy jej vyhovujú.
Inou možnosťou je implemetovať nejaký heuristický algoritmus a hľadať hamiltonovskú kružnicu podľa neho.
Projekt by mal riešiť daný problém obidvomi prístupmi.', 1);
INSERT INTO projects VALUES (255, 'ZP', 297, NULL, 223, '2002/2003', 'Simulátor strojových inštrukcií procesora', 'Simulation of machine level instructions for a microprocessor', NULL, NULL, 1);
INSERT INTO projects VALUES (256, 'DP', 374, NULL, 223, '2003/2004', 'Vlastnosti mobilných agentov z rôznych vývojových prostredí', 'Characteristics of mobile agents from different development environments', NULL, NULL, 1);
INSERT INTO projects VALUES (257, 'ZP', 387, NULL, 227, '2002/2003', 'Odhaľovanie záujmov a odporúčanie informácií', 'Relevant information recommendation', NULL, NULL, 1);
INSERT INTO projects VALUES (258, 'DP', 566, NULL, 227, '2003/2004', 'Koevolúcia univerzálnej gramatiky a gramatiky', 'Koevolúcia univerzálnej gramatiky a gramatiky', NULL, NULL, 1);
INSERT INTO projects VALUES (259, 'ZP', 46, NULL, 228, '2002/2003', 'Využitie CASE prostriedku na objektovo-orientovanú tvorbu softvérového systému', 'Využitie CASE prostriedku na objektovo-orientovanú tvorbu softvérového systému', 'Na základe analýzy použiteľnosti a dostupnosti CASE prostriedkov v univerzitnom prostredí vyberte taký, ktorý podporuje objektovo-orientovanú tvorbu softvéru. V ňom špecifikujte a navrhnite softvérový systém pre požičovňu videokaziet. Použite pritom známe techniky objektovo-orientovanej analýzy a návrhu (UML). Na implementáciu využite možnosť generovania kódu z vytvorených modelov', 'Na základe analýzy použiteľnosti a dostupnosti CASE prostriedkov v univerzitnom prostredí vyberte taký, ktorý podporuje objektovo-orientovanú tvorbu softvéru. V ňom špecifikujte a navrhnite softvérový systém pre požičovňu videokaziet. Použite pritom známe techniky objektovo-orientovanej analýzy a návrhu (UML). Na implementáciu využite možnosť generovania kódu z vytvorených modelov', 1);
INSERT INTO projects VALUES (260, 'ZP', 431, NULL, 229, '2002/2003', 'Automatizované testovanie vedomostí', 'Computer assisted testing system', NULL, NULL, 0);
INSERT INTO projects VALUES (261, 'DP', 431, NULL, 229, '2004/2005', 'Automatizované testovanie vedomostí', 'Automatizované testovanie vedomostí', NULL, NULL, 0);
INSERT INTO projects VALUES (262, 'ZP', 375, NULL, 230, '2005/2006', 'Distribuované výpočty', 'Distribuované výpočty', 'Analyzujte možnosti riešenia výpočtových úloh v prostredí počítačových sietí. Navrhnite systém distribúcie úloh na rôzne uzly v sieti a ich vykonanie.   Navrhnutý a implementovaný systém overte v TCP/IP sieti.  ', 'Analyzujte možnosti riešenia výpočtových úloh v prostredí počítačových sietí. Navrhnite systém distribúcie úloh na rôzne uzly v sieti a ich vykonanie.   Navrhnutý a implementovaný systém overte v TCP/IP sieti.  ', 0);
INSERT INTO projects VALUES (263, 'ZP', 95, NULL, 231, '2002/2003', 'Podpora vyučovania MaPŠ - B-jazyk', 'Support of teaching course on formal methods - B language', NULL, NULL, 1);
INSERT INTO projects VALUES (264, 'DP', 672, NULL, 231, '2003/2004', 'Pravdepodobnostná štruktúra modelu smerovanej  perkolácie na štvorcovej mriežke', 'Percolation Backbones on the Square Lattice', NULL, NULL, 1);
INSERT INTO projects VALUES (265, 'ZP', 235, 297, 232, '2002/2003', 'Programový systém na simuláciu bioelektrických polí', 'Program System for Bio-electrical Fields Simulation', NULL, NULL, 1);
INSERT INTO projects VALUES (266, 'DP', 247, 358, 232, '2004/2005', 'Havarijné plány informačných systémov', 'Havarijné plány informačných systémov', NULL, NULL, 2);
INSERT INTO projects VALUES (267, 'DP', 437, NULL, 233, '2003/2004', 'Modelovanie architektonického návrhu softvérového systému pomocou UML', 'Modelovanie architektonického návrhu softvérového systému pomocou UML', NULL, NULL, 1);
INSERT INTO projects VALUES (268, 'ZP', 236, 98, 233, '2002/2003', 'eBiznis, implementácia aplikácie umožňujúcej obchodovanie na Internete.', 'eBusiness, Implementation of Application to Allow Business Transactions on Internet', NULL, NULL, 1);
INSERT INTO projects VALUES (269, 'ZP', 237, 704, 234, '2002/2003', 'Webovský dokumentačný nástroj pre návrh databáz', 'Web application for database modeling and documentation', NULL, NULL, 1);
INSERT INTO projects VALUES (270, 'DP', 660, NULL, 234, '2003/2004', 'Vyhľadávanie elektronických dokumentov v osobnom informačnom priestore', 'Vyhľadávanie elektronických dokumentov v osobnom informačnom priestore', NULL, NULL, 1);
INSERT INTO projects VALUES (271, 'ZP', 705, NULL, 238, '2005/2006', 'Automatický návrh logických kombinačných obvodov s integrovanými obvodmi SSI', 'Automatický návrh logických kombinačných obvodov s integrovanými obvodmi SSI', 'Treba vypracovať metodiku automatického návrhu logických kombinačných obvodov s jedným výstupom s použitím členov NOR zo stavebnice integrovaných obvodov SSI a navrhnúť a odladiť programový systém pre osobný počítač. Vstupom má byť boolovská funkcia zadaná ľubovoľným boolovským výrazom alebo pravdivostnou tabuľkou. Výstupom má byť prepojovací predpis opisujúci štruktúru navrhnutého logického obvodu.', 'Treba vypracovať metodiku automatického návrhu logických kombinačných obvodov s jedným výstupom s použitím členov NOR zo stavebnice integrovaných obvodov SSI a navrhnúť a odladiť programový systém pre osobný počítač. Vstupom má byť boolovská funkcia zadaná ľubovoľným boolovským výrazom alebo pravdivostnou tabuľkou. Výstupom má byť prepojovací predpis opisujúci štruktúru navrhnutého logického obvodu.', 0);
INSERT INTO projects VALUES (272, 'ZP', 670, NULL, 239, '2005/2006', 'Odhad časovej náročnosti softvérového modulu', 'Odhad časovej náročnosti softvérového modulu', 'Na základe opisu softvérového modulu v danom špecifikačnom jazyku odhadnite jeho časovú náročnosť pomocou minimálne 2 rôznych metód. Umožnite tvorbu knižnice modulov, kde každý modul je možné oceniť pre rôzne architektúry (podľa toho na akom procesore je modul spustený). Vybrané metódy opíšte a zhodnoťte ich vlastnosti.

Odporúčaná literatúra:
[1] J. Straustrup, W. Wolf: Hardware/Software Co-Design: Principles and Practise, Kluwer 1997, p. 395
[2] P. Giusto, G. Martin: Reliable Estimation of Execution Time of Embedded Software, Cadence, 2001, p. 8
[3] A. V. Aho, et. al.: Compilers: Principles, Techniques, and Tools, Addison Wesley, 1986, p. 796

Pozn.: Prístupné elektronické knižnice z domény stuba.sk
http://portal.acm.org/
http://www.computer.org/dlsearch.htm', 'Na základe opisu softvérového modulu v danom špecifikačnom jazyku odhadnite jeho časovú náročnosť pomocou minimálne 2 rôznych metód. Umožnite tvorbu knižnice modulov, kde každý modul je možné oceniť pre rôzne architektúry (podľa toho na akom procesore je modul spustený). Vybrané metódy opíšte a zhodnoťte ich vlastnosti.

Odporúčaná literatúra:
[1] J. Straustrup, W. Wolf: Hardware/Software Co-Design: Principles and Practise, Kluwer 1997, p. 395
[2] P. Giusto, G. Martin: Reliable Estimation of Execution Time of Embedded Software, Cadence, 2001, p. 8
[3] A. V. Aho, et. al.: Compilers: Principles, Techniques, and Tools, Addison Wesley, 1986, p. 796

Pozn.: Prístupné elektronické knižnice z domény stuba.sk
http://portal.acm.org/
http://www.computer.org/dlsearch.htm', 0);
INSERT INTO projects VALUES (273, 'ZP', 660, NULL, 240, '2005/2006', 'CSIDC 2006', 'CSIDC 2006', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.
', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.
', 1);
INSERT INTO projects VALUES (274, 'DP', 25, NULL, 241, '2003/2004', 'Neštandardné možnosti komunikácie v TCP/IP sieťach', 'Neštandardné možnosti komunikácie v TCP/IP sieťach', NULL, NULL, 0);
INSERT INTO projects VALUES (275, 'DP', 358, NULL, 242, '2004/2005', 'Riadenie testovania bezpečnosti počítačovej siete', 'Computer Network Security Testing Control', NULL, NULL, 0);
INSERT INTO projects VALUES (276, 'DP', 98, NULL, 243, '2004/2005', 'Rozpoznávanie digitálnych kriviek', 'Recognition of digital curves', NULL, NULL, 1);
INSERT INTO projects VALUES (277, 'DP', 342, NULL, 248, '2003/2004', 'Programová podpora návrhu riadiacich systémov', 'Program support for control system’s design', NULL, NULL, 0);
INSERT INTO projects VALUES (278, 'ZP', 342, NULL, 254, '2005/2006', 'Programový systém pre návrh riadiacich jednotiek na báze  mikropočítača', 'Programový systém pre návrh riadiacich jednotiek na báze  mikropočítača', 'Analyzujte možnosti využitia existujúcich mikropočítačových modulov na návrh a realizáciu riadiacich jednotiek. 
Navrhnite inštrukčný súbor virtuálneho procesora vhodného na realizáciu vybranej triedy riadiacich jednotiek.
Navrhnite a zrealizujte vybranú časť prekladača programu  virtuálneho procesora na program v JSI vybraného mikropočítača.
', 'Analyzujte možnosti využitia existujúcich mikropočítačových modulov na návrh a realizáciu riadiacich jednotiek. 
Navrhnite inštrukčný súbor virtuálneho procesora vhodného na realizáciu vybranej triedy riadiacich jednotiek.
Navrhnite a zrealizujte vybranú časť prekladača programu  virtuálneho procesora na program v JSI vybraného mikropočítača.
', 0);
INSERT INTO projects VALUES (279, 'ZP', 25, NULL, 255, '2005/2006', 'Implementácia bezpečnostných mechanizmov v systéme vzdialeného prístupu k hardvéru', 'Implementácia bezpečnostných mechanizmov v systéme vzdialeného prístupu k hardvéru', 'Analyzujte štandardné spôsoby zabezpečenia prístupu k súborom a sieťovým službám, ako aj spôsoby ochrany prenášaných dát (napr. SSL), v prostredí operačného systému unix-ového typu. Navrhnite vhodný spôsob využitia týchto bezpečnostných mechanizmov v existujúcom systéme vzdialeného prístupu k hardvérovým prostriedkom počítača pomocou siete (ide o aplikáciu typu klient - server). Navrhnuté riešenie implementujte a overte jeho funkčnosť a spoľahlivosť.', 'Analyzujte štandardné spôsoby zabezpečenia prístupu k súborom a sieťovým službám, ako aj spôsoby ochrany prenášaných dát (napr. SSL), v prostredí operačného systému unix-ového typu. Navrhnite vhodný spôsob využitia týchto bezpečnostných mechanizmov v existujúcom systéme vzdialeného prístupu k hardvérovým prostriedkom počítača pomocou siete (ide o aplikáciu typu klient - server). Navrhnuté riešenie implementujte a overte jeho funkčnosť a spoľahlivosť.', 0);
INSERT INTO projects VALUES (280, 'ZP', 301, NULL, 257, '2006/2007', 'Návrh a implementácia systému na grafickú vizualizáciu činnosti vyrovnávacej pamäti počítača', 'Návrh a implementácia systému na grafickú vizualizáciu činnosti vyrovnávacej pamäti počítača', 'Navrhnite a implementujte systém, ktorý bude s využitím multimediálnych technológií umožňovať  naštudovanie, grafické zobrazenie a demonštráciu  dejov pri činnosti vyrovnávacej pamäte počítača.
Produkt implementujte ako hypermediálnu prezentáciu vo voľne dostupnom webovom prehliadači.', 'Navrhnite a implementujte systém, ktorý bude s využitím multimediálnych technológií umožňovať  naštudovanie, grafické zobrazenie a demonštráciu  dejov pri činnosti vyrovnávacej pamäte počítača.
Produkt implementujte ako hypermediálnu prezentáciu vo voľne dostupnom webovom prehliadači.', 0);
INSERT INTO projects VALUES (281, 'ZP', 46, NULL, 258, '2002/2003', 'Využitie CRM v elektronickom obchode', 'Usage of CRM in e-bussines', NULL, NULL, 1);
INSERT INTO projects VALUES (282, 'DP', 46, NULL, 258, '2003/2004', 'Využitie CRM v elektronickom obchode', 'Usage of CRM in e-bussines', NULL, NULL, 1);
INSERT INTO projects VALUES (283, 'ZP', 437, NULL, 259, '2005/2006', 'Katalóg návrhových vzorov', 'Katalóg návrhových vzorov', 'Návrhové vzory sa stávajú dôležitým nástrojom na  vyjadrenie opakujúcich sa riešení pri navrhovaní softvérových systémov. Existujú viaceré sady návrhových vzorov aj viaceré samostatné vzory. Pokúste sa ich zhromaždiť a vytvoriť jednotný katalóg. Navrhnite pre ne vhodný spôsob reprezentácie. Zvážte použitie jazyka UML. ', 'Návrhové vzory sa stávajú dôležitým nástrojom na  vyjadrenie opakujúcich sa riešení pri navrhovaní softvérových systémov. Existujú viaceré sady návrhových vzorov aj viaceré samostatné vzory. Pokúste sa ich zhromaždiť a vytvoriť jednotný katalóg. Navrhnite pre ne vhodný spôsob reprezentácie. Zvážte použitie jazyka UML. ', 1);
INSERT INTO projects VALUES (284, 'ZP', 541, NULL, 262, '2005/2006', 'Rozpoznávanie obrazov z infrakamery', 'Rozpoznávanie obrazov z infrakamery', 'Navrhnite a realizujte systém pre rozpoznanie  človeka z obrazu infrakamery. Systém má umožniť v reálnom čase rozpoznať, či sa v práve snímanom obraze infrakamery nachádza silueta človeka a indikovať takýto stav. Systém môže byť využitý v autách na indikáciu chodcov a cyklistov za zníženej viditeľnosti a v inteligentných alarmoch.', 'Navrhnite a realizujte systém pre rozpoznanie  človeka z obrazu infrakamery. Systém má umožniť v reálnom čase rozpoznať, či sa v práve snímanom obraze infrakamery nachádza silueta človeka a indikovať takýto stav. Systém môže byť využitý v autách na indikáciu chodcov a cyklistov za zníženej viditeľnosti a v inteligentných alarmoch.', 1);
INSERT INTO projects VALUES (285, 'DP', 270, NULL, 263, '2005/2006', 'Vyhľadávanie a prezentácia informácií na webe', 'Vyhľadávanie a prezentácia informácií na webe', NULL, NULL, 1);
INSERT INTO projects VALUES (286, 'ZP', 375, NULL, 263, '2003/2004', 'Systém pre správu úloh pre e-vzdelávanie', 'The system for task administration for e-learning.', 'Analyzujte rôzne výučbové systémy, ktoré podporujú učenie sa elektronickou formou. Pri analýze sa zamerajte najmä na metodiku e-testovania poznatkov získaných štúdiom rôznych učebných materiálov. Navrhnite a implementujte modulárny programový systém, ktorý poskytne dostatočne univerzálny rámec pre tvorbu rôznych foriem testov (triviálne, kontextovo závislé, a pod.) ako aj spôsob ich vyhodnocovania. Funkčnosť systému overte vytvorením rôznych typov testov a ich hodnotení.', 'Analyzujte rôzne výučbové systémy, ktoré podporujú učenie sa elektronickou formou. Pri analýze sa zamerajte najmä na metodiku e-testovania poznatkov získaných štúdiom rôznych učebných materiálov. Navrhnite a implementujte modulárny programový systém, ktorý poskytne dostatočne univerzálny rámec pre tvorbu rôznych foriem testov (triviálne, kontextovo závislé, a pod.) ako aj spôsob ich vyhodnocovania. Funkčnosť systému overte vytvorením rôznych typov testov a ich hodnotení.', 1);
INSERT INTO projects VALUES (287, 'ZP', 358, NULL, 264, '2003/2004', 'Certifikačná autorita', 'Certification Authority', 'Analyzujte činnosť a funkcie certifikačnej autority na vydávanie certifikátov verejných kľúčov. Pri analýze berte do úvahy aj voľne šíriteľné programové moduly. Navrhnite a implementujte certifikačnú autoritu. Pri návrhu rešpektujte odporúčané štandardy', 'Analyzujte činnosť a funkcie certifikačnej autority na vydávanie certifikátov verejných kľúčov. Pri analýze berte do úvahy aj voľne šíriteľné programové moduly. Navrhnite a implementujte certifikačnú autoritu. Pri návrhu rešpektujte odporúčané štandardy', 0);
INSERT INTO projects VALUES (288, 'DP', 361, NULL, 264, '2005/2006', 'Návrh bezpečnostnej architektúry počítačových systémov', 'Návrh bezpečnostnej architektúry počítačových systémov', NULL, NULL, 0);
INSERT INTO projects VALUES (289, 'ZP', 357, NULL, 265, '2005/2006', 'IPv6 - teória a prax', 'IPv6 - teória a prax', 'Naštudujte a analyzujte IPv6. Porovnanie s IPv4, koexistencia, kompatibilita, integrácia do súčasných poč. sietí a problémy s tým spojené.
Na základe analýzy navrhnite minimálnu reálnu topológiu, v ktorej by ste implementovali a otestovali IPv6. V prípade nereálnosti skutočnej topológie navrhnite a zrealizujte počítačovú simuláciu IPv6 komunikácie min 2 počítačov.', 'Naštudujte a analyzujte IPv6. Porovnanie s IPv4, koexistencia, kompatibilita, integrácia do súčasných poč. sietí a problémy s tým spojené.
Na základe analýzy navrhnite minimálnu reálnu topológiu, v ktorej by ste implementovali a otestovali IPv6. V prípade nereálnosti skutočnej topológie navrhnite a zrealizujte počítačovú simuláciu IPv6 komunikácie min 2 počítačov.', 0);
INSERT INTO projects VALUES (290, 'ZP', 10, NULL, 266, '2005/2006', 'Simulovaný robotický futbal - vyššie schopnosti hráčov', 'Simulovaný robotický futbal - vyššie schopnosti hráčov', 'Simulovaný robotický futbal sa zaoberá vytváraním tímov spolupracujúcich agentov, ktoré v simulovanom prostredí navzájom súperia. Jednotliví hráči-agenti predstavujú samostatné programy, ktoré prostredníctvom siete komunikujú so simulačným serverom. Venujte sa vyšším schopnostiam hráčov. Navrhnite a implementujte niektorú z vyšších schopností hráča, prípadne vylepšite niektorý z existujúcich prístupov.', 'Simulovaný robotický futbal sa zaoberá vytváraním tímov spolupracujúcich agentov, ktoré v simulovanom prostredí navzájom súperia. Jednotliví hráči-agenti predstavujú samostatné programy, ktoré prostredníctvom siete komunikujú so simulačným serverom. Venujte sa vyšším schopnostiam hráčov. Navrhnite a implementujte niektorú z vyšších schopností hráča, prípadne vylepšite niektorý z existujúcich prístupov.', 1);
INSERT INTO projects VALUES (291, 'ZP', 357, NULL, 267, '2005/2006', 'Prehľadová štúdia autentifikácie klientov prostredníctvom Internetu', 'Prehľadová štúdia autentifikácie klientov prostredníctvom Internetu', 'Analyzujte súčasné prístupy autentifikácie a bezpečnej autentifikácie na dostupných OS a pri použití bežných implementačných nástrojov. Navrhnite a realizujte implementáciu, v ktorej demonštrujete viacero riešení získaných v analýze. Riešenia vzájomne porovnajte a otestujte na funkčnosť, stabilitu a bezpečnosť systému proti zlyhaniu a prienikom.', 'Analyzujte súčasné prístupy autentifikácie a bezpečnej autentifikácie na dostupných OS a pri použití bežných implementačných nástrojov. Navrhnite a realizujte implementáciu, v ktorej demonštrujete viacero riešení získaných v analýze. Riešenia vzájomne porovnajte a otestujte na funkčnosť, stabilitu a bezpečnosť systému proti zlyhaniu a prienikom.', 0);
INSERT INTO projects VALUES (292, 'ZP', 359, NULL, 268, '2005/2006', 'Skladový informačný system', 'Skladový informačný system', 'Analyzujte, navrhnite a implementujte informačný systém, ktorý bude riadiť skladové hospodárstvo na základe predaného tovaru jednotlivým zákazníkom. Systém má umožňovať prístup k skladovému hospodárstvu z viacerých pracovných staníc, vytvárať zostavy pre nákup tovarov na základe ich zostatkov v sklade, vytvárať zostavy vydaného tovaru jednotlivým zákazníkom, generovať štatistiky predajnosti podľa jednotlivých druhov tovaru. Treba navrhnúť sieťovú komunikáciu a synchronizáciu údajov medzi jednotlivými stanicami. 

', 'Analyzujte, navrhnite a implementujte informačný systém, ktorý bude riadiť skladové hospodárstvo na základe predaného tovaru jednotlivým zákazníkom. Systém má umožňovať prístup k skladovému hospodárstvu z viacerých pracovných staníc, vytvárať zostavy pre nákup tovarov na základe ich zostatkov v sklade, vytvárať zostavy vydaného tovaru jednotlivým zákazníkom, generovať štatistiky predajnosti podľa jednotlivých druhov tovaru. Treba navrhnúť sieťovú komunikáciu a synchronizáciu údajov medzi jednotlivými stanicami. 

', 0);
INSERT INTO projects VALUES (293, 'ZP', 98, NULL, 269, '2003/2004', 'Perl a objektovo orientované programovanie', 'Perl and object oriented programming', 'Perl je voľne šíritelný skriptovací jazyk so syntaxou podobnou jazyku C. Jazyk má dispozícii výkonné a pružné programovacie prostredie. Umožňuje objektovo orientované programovanie, spracovanie textu. Analyzujte  jazyk a prostredie pre vývoj objektovo orientovaných aplikácií. Porovnajte jeho objektovo orientované črty s možnosťami C++ . Na základe analýzy navrhnite a vytvorte aplikáciu,ktorá ukáže objektovo orientované črty jazyka ', 'Perl je voľne šíritelný skriptovací jazyk so syntaxou podobnou jazyku C. Jazyk má dispozícii výkonné a pružné programovacie prostredie. Umožňuje objektovo orientované programovanie, spracovanie textu. Analyzujte  jazyk a prostredie pre vývoj objektovo orientovaných aplikácií. Porovnajte jeho objektovo orientované črty s možnosťami C++ . Na základe analýzy navrhnite a vytvorte aplikáciu,ktorá ukáže objektovo orientované črty jazyka ', 1);
INSERT INTO projects VALUES (294, 'DP', 297, NULL, 269, '2005/2006', 'Spôsoby optimalizovania programu v jazykoch rôznej úrovne', 'Spôsoby optimalizovania programu v jazykoch rôznej úrovne', NULL, NULL, 1);
INSERT INTO projects VALUES (295, 'ZP', 655, NULL, 273, '2005/2006', 'Zisťovanie charakteristík pripojenia v rámci SR na základe IP adresy', 'Zisťovanie charakteristík pripojenia v rámci SR na základe IP adresy', 'Analyzujte možnosti vytvorenia aplikácie, ktorá by umožnila na základe IP adresy používateľa identifikovať charakteristické informácie o jeho pripojení. Medzi tie patrí napríklad región (mesto), poskytovateľ pripojenia, typ pripojenia (pevná linka, modem, bezdrátové pripojenie, wifi,...) a pod. Na vytvorenie databázy môžete použiť napríklad databázu RIPE, informáciu o reverznom DNS zázname pre danú IP adresu, alebo ďalšie verejne dostupné informácie.', 'Analyzujte možnosti vytvorenia aplikácie, ktorá by umožnila na základe IP adresy používateľa identifikovať charakteristické informácie o jeho pripojení. Medzi tie patrí napríklad región (mesto), poskytovateľ pripojenia, typ pripojenia (pevná linka, modem, bezdrátové pripojenie, wifi,...) a pod. Na vytvorenie databázy môžete použiť napríklad databázu RIPE, informáciu o reverznom DNS zázname pre danú IP adresu, alebo ďalšie verejne dostupné informácie.', 1);
INSERT INTO projects VALUES (296, 'ZP', 579, NULL, 274, '2005/2006', 'Systém pre správu webových stránok - administrátor', 'Systém pre správu webových stránok - administrátor', 'Cieľom projektu je vytvorenie prostredia, ktoré umožní spravovanie webových stránok. Analyzujte existujúce systémy podobného charakteru z pohľadu administátora a vlastností prostredia, v ktorom bude vytváraný systém.  Navrhnite štruktúru použitej databázy, štruktúru obrazoviek pre administrátora, grafické prvky a štýly. Následne implementujte kľúčové časti systému a použiteľnosť overte na vybranej množine stránok používaných v pedagogike FIIT', 'Cieľom projektu je vytvorenie prostredia, ktoré umožní spravovanie webových stránok. Analyzujte existujúce systémy podobného charakteru z pohľadu administátora a vlastností prostredia, v ktorom bude vytváraný systém.  Navrhnite štruktúru použitej databázy, štruktúru obrazoviek pre administrátora, grafické prvky a štýly. Následne implementujte kľúčové časti systému a použiteľnosť overte na vybranej množine stránok používaných v pedagogike FIIT', 1);
INSERT INTO projects VALUES (297, 'ZP', 357, NULL, 275, '2005/2006', 'STP -Spanning Tree Protocol 802.1D - vizualizácia na počítači', 'STP -Spanning Tree Protocol 802.1D - vizualizácia na počítači', 'Naštudujte a analyzujte princíp fungovania STP -Spanning Tree Protocol 802.1D.  Navrhnite spôsob grafickej vizualizácie výsledného STP stromu na počítači, v ktorej si navrhnete ľubovolnú topológiu ethernet. siete. Zrealizujte funkčný model - pomôcka pre pedagogiku.', 'Naštudujte a analyzujte princíp fungovania STP -Spanning Tree Protocol 802.1D.  Navrhnite spôsob grafickej vizualizácie výsledného STP stromu na počítači, v ktorej si navrhnete ľubovolnú topológiu ethernet. siete. Zrealizujte funkčný model - pomôcka pre pedagogiku.', 0);
INSERT INTO projects VALUES (298, 'ZP', 374, NULL, 276, '2006/2007', 'Rozhodovanie sa hráčov pri vedení lopty', 'Rozhodovanie sa hráčov pri vedení lopty', 'Naštudujte problematiku hry hráčov simulovaného robotického futbalu RoboCup. Oboznámte sa s najnovšími hráčmi, ktorí boli vytvorení študentmi FIIT STU. Podrobne analyzujte súčasnú stratégiu a možnosti rozhodovania sa hráčov pri vedení lopty. Navrhnite také zmeny v hráčovej stratégii, aby adekvátnejšie reagoval na aktuálnu situáciu a zlepšil sa hlavne jeho presun s loptou. Navrhnuté riešenie overte implementáciou rozšírenia existujúceho hráča.', 'Naštudujte problematiku hry hráčov simulovaného robotického futbalu RoboCup. Oboznámte sa s najnovšími hráčmi, ktorí boli vytvorení študentmi FIIT STU. Podrobne analyzujte súčasnú stratégiu a možnosti rozhodovania sa hráčov pri vedení lopty. Navrhnite také zmeny v hráčovej stratégii, aby adekvátnejšie reagoval na aktuálnu situáciu a zlepšil sa hlavne jeho presun s loptou. Navrhnuté riešenie overte implementáciou rozšírenia existujúceho hráča.', 1);
INSERT INTO projects VALUES (299, 'ZP', 24, NULL, 278, '2005/2006', 'Modelovanie a riešenie alokačných problémov', 'Modelovanie a riešenie alokačných problémov', 'Analyzujte vybrané metódy, ktoré sa používajú v teórii grafov 
na modelovanie a riešenie alokačných problémov. Analyzujte použité heuristiky, ktorými hľadáme riešenie blízke optimálnemu riešeniu. 
Navrhnite model, v ktorom rozmiestnite strediská (napr. záchranné stredisko, havarijné stredisko, sklady) podľa určitej požadovanej dostupnosti.
Problém umiestnenia minimálneho počtu týchto stredísk s určitou dostupnosťou riešte ako problém hľadania pokrývajúcej množiny 
v grafe s najmenšou mohutnosťou.
Navrhnutý model vizualizujte vytvorením softvérového prototypu.', 'Analyzujte vybrané metódy, ktoré sa používajú v teórii grafov 
na modelovanie a riešenie alokačných problémov. Analyzujte použité heuristiky, ktorými hľadáme riešenie blízke optimálnemu riešeniu. 
Navrhnite model, v ktorom rozmiestnite strediská (napr. záchranné stredisko, havarijné stredisko, sklady) podľa určitej požadovanej dostupnosti.
Problém umiestnenia minimálneho počtu týchto stredísk s určitou dostupnosťou riešte ako problém hľadania pokrývajúcej množiny 
v grafe s najmenšou mohutnosťou.
Navrhnutý model vizualizujte vytvorením softvérového prototypu.', 1);
INSERT INTO projects VALUES (300, 'ZP', 297, NULL, 279, '2005/2006', 'Simulátor toku strojových inštrukcií v sieti Internet', 'Simulátor toku strojových inštrukcií v sieti Internet', 'Analyzujte možnosti a prostriedky na simuláciu definovanej inštrukčnej sady strojových inštrukcií. Vytvorte simulačné prostredie, v ktorom názorne zobrazte procesy a stavy počas vykonávania inštrukcie daného programu pre zvolený typ procesora. Simulátor  pripravte na prezentáciu vo forme web aplikácie.
', 'Analyzujte možnosti a prostriedky na simuláciu definovanej inštrukčnej sady strojových inštrukcií. Vytvorte simulačné prostredie, v ktorom názorne zobrazte procesy a stavy počas vykonávania inštrukcie daného programu pre zvolený typ procesora. Simulátor  pripravte na prezentáciu vo forme web aplikácie.
', 1);
INSERT INTO projects VALUES (301, 'ZP', 361, NULL, 280, '2005/2006', 'Bezpečnostná architektúra počítačových systémov', 'Bezpečnostná architektúra počítačových systémov', 'Analyzujte súčasné stavy a efektívnosť metód, ktoré sa zaoberajú vyhodnotením zabezpečenia, pravidlami a štandardmi certifikácie a akreditácie. Kritériá vyhodnoťte z hľadiska bezpečnostnej politiky počítačových systémov.
', 'Analyzujte súčasné stavy a efektívnosť metód, ktoré sa zaoberajú vyhodnotením zabezpečenia, pravidlami a štandardmi certifikácie a akreditácie. Kritériá vyhodnoťte z hľadiska bezpečnostnej politiky počítačových systémov.
', 0);
INSERT INTO projects VALUES (302, 'ZP', 188, NULL, 281, '2005/2006', 'Maľované krížovky', 'Maľované krížovky', 'Navrhnite algoritmy na riešenie rôznych druhov maľovaných krížoviek (klasické čiernobiele, viacfarebné;  trojuholníkové, viacfarebné trojuholníkové) a porovnajte ich výkonnosť. Ďalej vytvorte program na automatické spracovanie krížovky z naskenovaného obrázka aspoň pre klasické čiernobiele.', 'Navrhnite algoritmy na riešenie rôznych druhov maľovaných krížoviek (klasické čiernobiele, viacfarebné;  trojuholníkové, viacfarebné trojuholníkové) a porovnajte ich výkonnosť. Ďalej vytvorte program na automatické spracovanie krížovky z naskenovaného obrázka aspoň pre klasické čiernobiele.', 1);
INSERT INTO projects VALUES (303, 'ZP', 690, NULL, 282, '2005/2006', 'Vykresľovanie veľkých grafov', 'Vykresľovanie veľkých grafov', 'Pre niektoré aplikácie je dôležité rozumné vykreslenie veľkých grafov s rádovo niekoľko tisícmi uzlami. Existuje niekoľko prístupov na zobrazenie takýchto grafov, napr. prístup na vykreslenia pomocou gravitačného modelu: začiatočné náhodné rozloženie grafu sa postupne dostane do ustáleného rozloženia na základe príťažlivosti, resp. odporu medzi uzlami. Vo vykresľovaní grafov by sa mala zohľadniť štruktúra komunít, prístupy na zjednotenie viacerých uzlov do jedného telesa, zjednodušenie zobrazenia štruktúry v grafe sú vítané. Ako odrazový most k výberu layoutovacieho algoritmu riešiteľa odporučím na projekt pajek (http://vlado.fmf.uni-lj.si/pub/networks/pajek/), kde sú implementované rôzne vykreslovacie algoritmy.', 'Pre niektoré aplikácie je dôležité rozumné vykreslenie veľkých grafov s rádovo niekoľko tisícmi uzlami. Existuje niekoľko prístupov na zobrazenie takýchto grafov, napr. prístup na vykreslenia pomocou gravitačného modelu: začiatočné náhodné rozloženie grafu sa postupne dostane do ustáleného rozloženia na základe príťažlivosti, resp. odporu medzi uzlami. Vo vykresľovaní grafov by sa mala zohľadniť štruktúra komunít, prístupy na zjednotenie viacerých uzlov do jedného telesa, zjednodušenie zobrazenia štruktúry v grafe sú vítané. Ako odrazový most k výberu layoutovacieho algoritmu riešiteľa odporučím na projekt pajek (http://vlado.fmf.uni-lj.si/pub/networks/pajek/), kde sú implementované rôzne vykreslovacie algoritmy.', 1);
INSERT INTO projects VALUES (304, 'ZP', 357, NULL, 284, '2005/2006', 'STP -Spanning Tree Protocol 802.1D - vizualizácia na počítači', 'STP -Spanning Tree Protocol 802.1D - vizualizácia na počítači', 'Naštudujte a analyzujte princíp fungovania STP - Spanning Tree Protocol 802.1D .
Navrhnite spôsob grafickej vizualizácie výsledného STP stromu na počítači, v ktorej si navrhnete ľubovolnú topológiu ethernet. siete.
Zrealizujte funkčný model - pomôcka pre pedagogiku.', 'Naštudujte a analyzujte princíp fungovania STP - Spanning Tree Protocol 802.1D .
Navrhnite spôsob grafickej vizualizácie výsledného STP stromu na počítači, v ktorej si navrhnete ľubovolnú topológiu ethernet. siete.
Zrealizujte funkčný model - pomôcka pre pedagogiku.', 0);
INSERT INTO projects VALUES (305, 'ZP', 375, NULL, 285, '2005/2006', 'Demonštračné príklady sieťovej komunikácie', 'Demonštračné príklady sieťovej komunikácie', 'Analyzujte systémy na podporu výučby počítačových sietí. Navrhnite a implementujte vybrané praktické úlohy - ukážky sieťovej komunikácie v TCP/IP sieťach. Pre jednotlivé demonštračné úlohy spracujte používateľské
príručky.  ', 'Analyzujte systémy na podporu výučby počítačových sietí. Navrhnite a implementujte vybrané praktické úlohy - ukážky sieťovej komunikácie v TCP/IP sieťach. Pre jednotlivé demonštračné úlohy spracujte používateľské
príručky.  ', 0);
INSERT INTO projects VALUES (306, 'ZP', 19, NULL, 286, '2005/2006', 'Pravidlá pre prispôsobovanie modelu používateľa', 'Pravidlá pre prispôsobovanie modelu používateľa', 'Súčasný web obsahuje veľké množstvo informácií. Používateľovi je často 
poskytnutých veľa nerelevantných informácií, čo ho môže odradiť pri 
skúmaní problémovej oblasti. To si vyžaduje personalizovaný prístup k 
používateľovi. Analyzujte model používateľa a spôsoby jeho aktualizácie 
v existujúcich adaptívnych hypermediálnych systémoch. Na základe tejto 
analýzy navrhnite model používateľa a súbor pravidiel pre jeho 
prispôsobovanie v doméne pracovných príležitostí. Navrhované riešenie 
experimentálne overte.
', 'Súčasný web obsahuje veľké množstvo informácií. Používateľovi je často 
poskytnutých veľa nerelevantných informácií, čo ho môže odradiť pri 
skúmaní problémovej oblasti. To si vyžaduje personalizovaný prístup k 
používateľovi. Analyzujte model používateľa a spôsoby jeho aktualizácie 
v existujúcich adaptívnych hypermediálnych systémoch. Na základe tejto 
analýzy navrhnite model používateľa a súbor pravidiel pre jeho 
prispôsobovanie v doméne pracovných príležitostí. Navrhované riešenie 
experimentálne overte.
', 1);
INSERT INTO projects VALUES (307, 'ZP', 388, NULL, 287, '2005/2006', 'Informačný portál predmetu', 'Informačný portál predmetu', 'Analyzujte typické prvky informačného portálu univerzitného predmetu a vhodné prostriedky na ich vytvorenie a údržbu v prostredí webu. Navrhnite softvérový systém - webovskú aplikáciu, ktorá podporí jednoduchú tvorbu informačných portálov pre predmety informatického zamerania na našej fakulte. Návrh riešenia overte implementáciou prototypu podporného softvérového systému.', 'Analyzujte typické prvky informačného portálu univerzitného predmetu a vhodné prostriedky na ich vytvorenie a údržbu v prostredí webu. Navrhnite softvérový systém - webovskú aplikáciu, ktorá podporí jednoduchú tvorbu informačných portálov pre predmety informatického zamerania na našej fakulte. Návrh riešenia overte implementáciou prototypu podporného softvérového systému.', 1);
INSERT INTO projects VALUES (308, 'ZP', 563, NULL, 288, '2005/2006', 'Univerzálny generátor prerušení', 'Univerzálny generátor prerušení', 'Navrhnite a zrealizujte univerzálny generátor 8 žiadostí o prerušenie. Generátor musí umožňovať individuálne nastavenie parametrov (okamih spustenia, perióda, doba trvania) pre každú žiadosť a vzájomnú synchronizáciu žiadostí.

', 'Navrhnite a zrealizujte univerzálny generátor 8 žiadostí o prerušenie. Generátor musí umožňovať individuálne nastavenie parametrov (okamih spustenia, perióda, doba trvania) pre každú žiadosť a vzájomnú synchronizáciu žiadostí.

', 0);
INSERT INTO projects VALUES (309, 'ZP', 98, NULL, 289, '2005/2006', 'Nástroj pre vytváranie kurzov', 'Nástroj pre vytváranie kurzov', 'Pri vytváraní prednášok, seminárov, kurzov, workshopov atď., má autor, resp. prednášateľ k dispozícii informácie rôzných typov a formátov. Cieľom je vytvoriť prostriedok, ktorý by podporil proces vytvárania  takýchto učebných celkov. Autor by vyberal buď z databázy informácií (otázky, učebné texty, obrázky, diagramy), alebo  by mal možnosť vytvárať nové základné učebné celky.  
Spravte analýzu problematiky a na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu, ktorá bude slúžiť ako nástroj pre vytváranie kurzov.', 'Pri vytváraní prednášok, seminárov, kurzov, workshopov atď., má autor, resp. prednášateľ k dispozícii informácie rôzných typov a formátov. Cieľom je vytvoriť prostriedok, ktorý by podporil proces vytvárania  takýchto učebných celkov. Autor by vyberal buď z databázy informácií (otázky, učebné texty, obrázky, diagramy), alebo  by mal možnosť vytvárať nové základné učebné celky.  
Spravte analýzu problematiky a na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu, ktorá bude slúžiť ako nástroj pre vytváranie kurzov.', 1);
INSERT INTO projects VALUES (310, 'ZP', 188, NULL, 290, '2005/2006', 'Monitor pre RoboCup určený na prezentáciu', 'Monitor pre RoboCup určený na prezentáciu', 'Vytvorte multiplatformový monitor pre RoboCup, ktorého cieľom bude prezentovať zápasy pútavou formou pre divákov. Mal by podporovať zobrazenie opakovaných záznamov zaujímavých situácií, ozvučenie zápasu zvukmi píšťaľky, príp. obecenstva, zobrazovať logá hrajúcich tímov a pod.', 'Vytvorte multiplatformový monitor pre RoboCup, ktorého cieľom bude prezentovať zápasy pútavou formou pre divákov. Mal by podporovať zobrazenie opakovaných záznamov zaujímavých situácií, ozvučenie zápasu zvukmi píšťaľky, príp. obecenstva, zobrazovať logá hrajúcich tímov a pod.', 1);
INSERT INTO projects VALUES (311, 'ZP', 12, NULL, 291, '2005/2006', 'Študentský portál', 'Študentský portál', 'Analyzujte potreby študentov na prístup a zdieľanie informácií. Ďalej preskúmajte existujúce rámce (framework) umožňujúce tvorbu portálov – aplikácií umožňujúcich integráciu informácií z viacerých rôznorodých zdrojov (novinky, oznamy, termíny). Zamerajte sa na možnosti personalizácie, jednotné používateľské rozhranie a vyhľadávanie. S použitím vybraného rámca navrhnite a implementujte študentský portál na webe, ktorý umožní študentom personalizovaný a bezpečný prístup k informáciám.
[1] Venkatacharya, P., Techniques for Creating User-Friendly Enterprise Portals, Oracle Corporation, October 2000
[2] Townsend, J., Riz, D., Schaffer, D., Building Portals, Intranets, and Corporate Web Sites Using Microsoft Servers, Addison-Wesley, 2004
', 'Analyzujte potreby študentov na prístup a zdieľanie informácií. Ďalej preskúmajte existujúce rámce (framework) umožňujúce tvorbu portálov – aplikácií umožňujúcich integráciu informácií z viacerých rôznorodých zdrojov (novinky, oznamy, termíny). Zamerajte sa na možnosti personalizácie, jednotné používateľské rozhranie a vyhľadávanie. S použitím vybraného rámca navrhnite a implementujte študentský portál na webe, ktorý umožní študentom personalizovaný a bezpečný prístup k informáciám.
[1] Venkatacharya, P., Techniques for Creating User-Friendly Enterprise Portals, Oracle Corporation, October 2000
[2] Townsend, J., Riz, D., Schaffer, D., Building Portals, Intranets, and Corporate Web Sites Using Microsoft Servers, Addison-Wesley, 2004
', 1);
INSERT INTO projects VALUES (312, 'ZP', 360, NULL, 292, '2005/2006', 'Výučbový a demonštračný systém na výučbu problematiky zobrazenia údajov v počítači', 'Výučbový a demonštračný systém na výučbu problematiky zobrazenia údajov v počítači', 'Analyzujte problematiku zobrazenia údajov v počítači. Navrhnite a implementujte programový systém použiteľný  na výučbu prevodov medzi číselnými sústavami, zobrazovania údajov v počítači a celočíselnej aritmetiky v dvojkovej číselnej sústave. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Má byť funkčný  pod OS Windows.
', 'Analyzujte problematiku zobrazenia údajov v počítači. Navrhnite a implementujte programový systém použiteľný  na výučbu prevodov medzi číselnými sústavami, zobrazovania údajov v počítači a celočíselnej aritmetiky v dvojkovej číselnej sústave. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Má byť funkčný  pod OS Windows.
', 0);
INSERT INTO projects VALUES (313, 'ZP', 655, NULL, 293, '2003/2004', 'test1', 're', 'aaa', 'aaa', 1);
INSERT INTO projects VALUES (314, 'ZP', 569, NULL, 295, '2005/2006', 'Programový systém na tvorbu usporiadaných binárnych rozhodovacích diagramov ', 'Programový systém na tvorbu usporiadaných binárnych rozhodovacích diagramov ', 'Analyzujte problematiku, metódu a  existujúce programové prostriedky 
podporujúce tvorbu a vykreslovanie binárnych rozhodovacích diagramov
vychádzajúc zo zadanej booleovskej funkcie. Vytvorený diagram konvertujte do redukovanej formy a výsledný diagram vykreslite.
Navrhnite a implementujte programový systém, ktorý bude poskytovať vizualizáciu postupu tvorby diagramu tak, aby mohol byť použitý ako názorná   učebná pomôcka.
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Navrhnutý systém je možné implementovať v ľubovolnom programovacom jazyku pod OS Windows.
', 'Analyzujte problematiku, metódu a  existujúce programové prostriedky 
podporujúce tvorbu a vykreslovanie binárnych rozhodovacích diagramov
vychádzajúc zo zadanej booleovskej funkcie. Vytvorený diagram konvertujte do redukovanej formy a výsledný diagram vykreslite.
Navrhnite a implementujte programový systém, ktorý bude poskytovať vizualizáciu postupu tvorby diagramu tak, aby mohol byť použitý ako názorná   učebná pomôcka.
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Navrhnutý systém je možné implementovať v ľubovolnom programovacom jazyku pod OS Windows.
', 0);
INSERT INTO projects VALUES (315, 'ZP', 566, NULL, 296, '2005/2006', 'Evolučná minimalizácia Boolovej funkcie pomocou Quinovej McCluskeyho metódy', 'Evolučná minimalizácia Boolovej funkcie pomocou Quinovej McCluskeyho metódy', 'Metóda Quinova a McCluskeyho patrí medzi veľmi efektívne prístupy k minimalizácii Boolových funkcií. Jej ďalšou výhodou je pomerne ľahká algoritmizácia pre veľké množstvo (niekoľko sto) klauzúl s mnohými literálmi (niekoľko desiatok). Pomocou tejto metódy sa zostrojí množina  tzv. redukovaných klauzúl, z ktorých hľadáme takú minimánu podmnožnu, aby plne pokrývala všetky pôvodné klauzule danej Boolovej funkcie. Tento proces sa obvykle rieši buď ručne, alebo metódou spätného prehľadávania (backtrack). Avšak, ak máme mnoho sto redukovaných klauzúl, použitie spätného prehľadávania vedie k enormnému nárastu časovej zložitosti (vieme, ze časová zložitosť spätného prehľadávania rastie exponenciálne). Z týchto dôvodov v práci bude použitý evolučný algoritmus k nájdeniu optimálného pokrytia pôvodných klazúl redukovanými klauzulami. Prípadným záujemcom doporučujem pozrieť sa na moju prezentáciu na adrese
http://www.fiit.stuba.sk/~kvasnicka/DiskretnaMatematika/Chapter_07/Prezentacia_Quine_McCluskey.pdf.', 'Metóda Quinova a McCluskeyho patrí medzi veľmi efektívne prístupy k minimalizácii Boolových funkcií. Jej ďalšou výhodou je pomerne ľahká algoritmizácia pre veľké množstvo (niekoľko sto) klauzúl s mnohými literálmi (niekoľko desiatok). Pomocou tejto metódy sa zostrojí množina  tzv. redukovaných klauzúl, z ktorých hľadáme takú minimánu podmnožnu, aby plne pokrývala všetky pôvodné klauzule danej Boolovej funkcie. Tento proces sa obvykle rieši buď ručne, alebo metódou spätného prehľadávania (backtrack). Avšak, ak máme mnoho sto redukovaných klauzúl, použitie spätného prehľadávania vedie k enormnému nárastu časovej zložitosti (vieme, ze časová zložitosť spätného prehľadávania rastie exponenciálne). Z týchto dôvodov v práci bude použitý evolučný algoritmus k nájdeniu optimálného pokrytia pôvodných klazúl redukovanými klauzulami. Prípadným záujemcom doporučujem pozrieť sa na moju prezentáciu na adrese
http://www.fiit.stuba.sk/~kvasnicka/DiskretnaMatematika/Chapter_07/Prezentacia_Quine_McCluskey.pdf.', 1);
INSERT INTO projects VALUES (316, 'ZP', 294, NULL, 300, '2005/2006', 'Sledovanie pohybu ľudskej kostry  v prostredí augmented reality', 'Sledovanie pohybu ľudskej kostry  v prostredí augmented reality', 'Na základe výsledkov prác [1], [2], [3],  analyzujte možnosti integrovania modulu pre sledovanie pohybu  časti  ľudskej kostry do prostredia augmented reality v systéme ARToolkit  [4]. Navrhnite a implementujte program pre pohyb časti virtuálnej kostry sledujúcej reálnu kostru snímanú kamerou.
   [1] Gejguš, P., Šperka, M.: Face tracking in color video sequences. Proceedings SCCG 2003,
   Budmerice, Pp.268-273.
  [2]  Mareták, P.: Analýza a animácia chôdze človeka. Tímový projekt FIIT STU Bratislava (2004)
  [3] Lučenič, Ľ.:  Analýza a animácia chôdze človeka. Tímový projekt FIIT STU Bratislava (2005)
  [4] ARToolkit: Stránka University of Washington. http://www.hitl.washington.edu/projects/shared_space/ 
', 'Na základe výsledkov prác [1], [2], [3],  analyzujte možnosti integrovania modulu pre sledovanie pohybu  časti  ľudskej kostry do prostredia augmented reality v systéme ARToolkit  [4]. Navrhnite a implementujte program pre pohyb časti virtuálnej kostry sledujúcej reálnu kostru snímanú kamerou.
   [1] Gejguš, P., Šperka, M.: Face tracking in color video sequences. Proceedings SCCG 2003,
   Budmerice, Pp.268-273.
  [2]  Mareták, P.: Analýza a animácia chôdze človeka. Tímový projekt FIIT STU Bratislava (2004)
  [3] Lučenič, Ľ.:  Analýza a animácia chôdze človeka. Tímový projekt FIIT STU Bratislava (2005)
  [4] ARToolkit: Stránka University of Washington. http://www.hitl.washington.edu/projects/shared_space/ 
', 1);
INSERT INTO projects VALUES (317, 'ZP', 360, NULL, 302, '2005/2006', 'Zobrazenie údajov v počítači – demonštračný a výučbový systém, HTML aplikácia', 'Zobrazenie údajov v počítači – demonštračný a výučbový systém, HTML aplikácia', 'Analyzujte problematiku pozičných číselných sústav a zobrazenia údajov v počítači.
Navrhnite a implementujte demonštračný a výučbový systém použiteľný  na výučbu prevodov medzi číselnými sústavami, zobrazovania údajov v počítači a celočíselnej aritmetiky v dvojkovej číselnej sústave. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Má byť funkčný  ako HTML aplikácia.

', 'Analyzujte problematiku pozičných číselných sústav a zobrazenia údajov v počítači.
Navrhnite a implementujte demonštračný a výučbový systém použiteľný  na výučbu prevodov medzi číselnými sústavami, zobrazovania údajov v počítači a celočíselnej aritmetiky v dvojkovej číselnej sústave. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Má byť funkčný  ako HTML aplikácia.

', 0);
INSERT INTO projects VALUES (318, 'ZP', 360, NULL, 303, '2005/2006', 'Programový systém  na výučbu zobrazenia údajov v počítači', 'Programový systém  na výučbu zobrazenia údajov v počítači', 'Analyzujte problematiku pozičných číselných sústav a zobrazenia údajov v počítači.
Navrhnite a implementujte programový systém použiteľný  na výučbu prevodov medzi číselnými sústavami, zobrazovania údajov v počítači a celočíselnej aritmetiky v dvojkovej číselnej sústave. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Má byť funkčný  v textovom režime pod ľubovoľným operačným systémom.
', 'Analyzujte problematiku pozičných číselných sústav a zobrazenia údajov v počítači.
Navrhnite a implementujte programový systém použiteľný  na výučbu prevodov medzi číselnými sústavami, zobrazovania údajov v počítači a celočíselnej aritmetiky v dvojkovej číselnej sústave. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Má byť funkčný  v textovom režime pod ľubovoľným operačným systémom.
', 0);
INSERT INTO projects VALUES (319, 'ZP', 382, NULL, 304, '2005/2006', 'Ako chodiť do baru?', 'Ako chodiť do baru?', 'Cieľom projektu je riešiť problém obmedzenej racionality na príklade návštevy baru.
Bar  “El Farol” v Santa Fe každú sobotu večer uvádza írsku hudbu. Do baru sa zmestí  asi 60 ľudí, pričom počet celkových záujemcov je okolo 100 ľudí. Na to, aby sa poslucháči sobotňajšieho predstavenia vyhli návalu v bare, si každý hľadá svoju stratégiu (heuristiku), ako na základe predošlých predstavení odhadnúť návštevnosť aktuálneho predstavenia. Poslucháči medzi sebou nekomunikujú o tom, či navštívia, alebo nenavštívia bar.
Cieľom je vytvoriť pomocou genetického programovania agenta, ktorý bude mať čo najlepšie skóre predikcie návštevnosti baru v prípade, že ostatní návštevníci si vytvárajú učiacu sa stratégiu s veľkosťou pamäti tri návštevy dozadu, a s tým, že pokiaľ im konkrétna súčasť stratégie (predpredminule preplnené, predminule prázdno, minule plno)-> choď do baru) nefunguje, s nejakou pravdepodobnosťou ju prehodia na "nechoď do baru".
Literatura:
V. Kvasnička, J. Pospíchal: Informatika pre sociálne vedy. UK Bratislava 2005.
B. Edmonds:  Gossip, Sexual Recombination and the El Farol bar: modelling the emergence of heterogeneity, Journal of Artificial Societies and Social Simulation vol. 2, no. 3, 1999, http://jasss.soc.surrey.ac.uk/2/3/2.html', 'Cieľom projektu je riešiť problém obmedzenej racionality na príklade návštevy baru.
Bar  “El Farol” v Santa Fe každú sobotu večer uvádza írsku hudbu. Do baru sa zmestí  asi 60 ľudí, pričom počet celkových záujemcov je okolo 100 ľudí. Na to, aby sa poslucháči sobotňajšieho predstavenia vyhli návalu v bare, si každý hľadá svoju stratégiu (heuristiku), ako na základe predošlých predstavení odhadnúť návštevnosť aktuálneho predstavenia. Poslucháči medzi sebou nekomunikujú o tom, či navštívia, alebo nenavštívia bar.
Cieľom je vytvoriť pomocou genetického programovania agenta, ktorý bude mať čo najlepšie skóre predikcie návštevnosti baru v prípade, že ostatní návštevníci si vytvárajú učiacu sa stratégiu s veľkosťou pamäti tri návštevy dozadu, a s tým, že pokiaľ im konkrétna súčasť stratégie (predpredminule preplnené, predminule prázdno, minule plno)-> choď do baru) nefunguje, s nejakou pravdepodobnosťou ju prehodia na "nechoď do baru".
Literatura:
V. Kvasnička, J. Pospíchal: Informatika pre sociálne vedy. UK Bratislava 2005.
B. Edmonds:  Gossip, Sexual Recombination and the El Farol bar: modelling the emergence of heterogeneity, Journal of Artificial Societies and Social Simulation vol. 2, no. 3, 1999, http://jasss.soc.surrey.ac.uk/2/3/2.html', 1);
INSERT INTO projects VALUES (320, 'ZP', 260, NULL, 305, '2003/2004', 'Prostriedky pre heuristické definovanie bezpečnostnej politiky', 'A Tool for Heuristic Definition of Security Policy', 'Vytvorte nástroj, ktorý umožní sledovať činnosti používateľa v systéme, ktoré sú relevantné z pohľadu definovania bezpečnostnej politiky riadenia prístupu. Príkladom môžu byť súbory, ku ktorým používateľ pristupuje, ich klasifikácia časová (kedy pristupuje, ako často, ...) aj priestorová (umiestenie v súborovom systéme, ...), spôsob prístupu (čítanie, zápis, vykonanie, pridávanie, ...) ako aj sledovanie postupností prístupov. Výstupy nástroja štatisticky spracujte a vytvorte základ profilu používateľa', 'Vytvorte nástroj, ktorý umožní sledovať činnosti používateľa v systéme, ktoré sú relevantné z pohľadu definovania bezpečnostnej politiky riadenia prístupu. Príkladom môžu byť súbory, ku ktorým používateľ pristupuje, ich klasifikácia časová (kedy pristupuje, ako často, ...) aj priestorová (umiestenie v súborovom systéme, ...), spôsob prístupu (čítanie, zápis, vykonanie, pridávanie, ...) ako aj sledovanie postupností prístupov. Výstupy nástroja štatisticky spracujte a vytvorte základ profilu používateľa', 1);
INSERT INTO projects VALUES (321, 'DP', 388, NULL, 305, '2005/2006', 'Správa a publikovanie dokumentov  v prostredí sémantického webu.', 'Správa a publikovanie dokumentov  v prostredí sémantického webu.', NULL, NULL, 4);
INSERT INTO projects VALUES (322, 'ZP', 672, 387, 306, '2005/2006', 'Tvorba jazykového grafu v procese učenia', 'Tvorba jazykového grafu v procese učenia', 'V poslednej dobe sa veľa báda v oblasti sietí, ktoré integrujú vlastnosti sietí usporiadaných a sietí náhodných. Sú to siete malého sveta. Majú široké možnosti aplikácií. Jednou z nich je aj tzv "word net", kde sa lexikón jazyka chápe ako graf. Ak graf nie je súvislý, reč nemôže byť plynulá. 
Úlohou projektu je pozrieť sa na proces tvorby "word net" pri učení sa angličtiny. Budeme analyzovať postup učenia sa cudzieho jazyka a spôsob, akým sa nové slová pridávajú do slovnej zásoby. Použijeme pri tom rôzne učebnice angličtiny, poprípade internetové kurzy a podobne. 
Literatúra: Watts, Small Worlds, Princeton University Press, 2004
                    Rybár a spol, Jazyk a kognícia, Kalligram, 2005', 'V poslednej dobe sa veľa báda v oblasti sietí, ktoré integrujú vlastnosti sietí usporiadaných a sietí náhodných. Sú to siete malého sveta. Majú široké možnosti aplikácií. Jednou z nich je aj tzv "word net", kde sa lexikón jazyka chápe ako graf. Ak graf nie je súvislý, reč nemôže byť plynulá. 
Úlohou projektu je pozrieť sa na proces tvorby "word net" pri učení sa angličtiny. Budeme analyzovať postup učenia sa cudzieho jazyka a spôsob, akým sa nové slová pridávajú do slovnej zásoby. Použijeme pri tom rôzne učebnice angličtiny, poprípade internetové kurzy a podobne. 
Literatúra: Watts, Small Worlds, Princeton University Press, 2004
                    Rybár a spol, Jazyk a kognícia, Kalligram, 2005', 1);
INSERT INTO projects VALUES (323, 'ZP', 566, NULL, 307, '2005/2006', 'Evolučná minimalizácia Boolovej funkcie pomocou Quinovej McCluskeyho metódy', 'Evolučná minimalizácia Boolovej funkcie pomocou Quinovej McCluskeyho metódy', 'Metóda Quinova a McCluskeyho patrí medzi veľmi efektívne prístupy k minimalizácii Boolových funkcií. Jej ďalšou výhodou je pomerne ľahká algoritmizácia pre veľké množstvo (niekoľko sto) klauzúl s mnohými literálmi (niekoľko desiatok). Pomocou tejto metódy sa zostrojí množina  tzv. redukovaných klauzúl, z ktorých hľadáme takú minimánu podmnožnu, aby plne pokrývala všetky pôvodné klauzule danej Boolovej funkcie. Tento proces sa obvykle rieši buď ručne, alebo metódou spätného prehľadávania (backtrack). Avšak, ak máme mnoho sto redukovaných klauzúl, použitie spätného prehľadávania vedie k enormnému nárastu časovej zložitosti (vieme, ze časová zložitosť spätného prehľadávania rastie exponenciálne). Z týchto dôvodov v práci bude použitý evolučný algoritmus k nájdeniu optimálného pokrytia pôvodných klazúl redukovanými klauzulami. Prípadným záujemcom doporučujem pozrieť sa na moju prezentáciu na adrese
http://www.fiit.stuba.sk/~kvasnicka/DiskretnaMatematika/Chapter_07/Prezentacia_Quine_McCluskey.pdf.', 'Metóda Quinova a McCluskeyho patrí medzi veľmi efektívne prístupy k minimalizácii Boolových funkcií. Jej ďalšou výhodou je pomerne ľahká algoritmizácia pre veľké množstvo (niekoľko sto) klauzúl s mnohými literálmi (niekoľko desiatok). Pomocou tejto metódy sa zostrojí množina  tzv. redukovaných klauzúl, z ktorých hľadáme takú minimánu podmnožnu, aby plne pokrývala všetky pôvodné klauzule danej Boolovej funkcie. Tento proces sa obvykle rieši buď ručne, alebo metódou spätného prehľadávania (backtrack). Avšak, ak máme mnoho sto redukovaných klauzúl, použitie spätného prehľadávania vedie k enormnému nárastu časovej zložitosti (vieme, ze časová zložitosť spätného prehľadávania rastie exponenciálne). Z týchto dôvodov v práci bude použitý evolučný algoritmus k nájdeniu optimálného pokrytia pôvodných klazúl redukovanými klauzulami. Prípadným záujemcom doporučujem pozrieť sa na moju prezentáciu na adrese
http://www.fiit.stuba.sk/~kvasnicka/DiskretnaMatematika/Chapter_07/Prezentacia_Quine_McCluskey.pdf.', 1);
INSERT INTO projects VALUES (324, 'ZP', 44, NULL, 308, '2005/2006', 'Simulátor výpočtových zariadení', 'Simulátor výpočtových zariadení', 'Konečný automat, zásobníkový automat a Turingov stroj sú tri základné modely počítačov v Teórii formálnych jazykov a automatov. Predmetom práce by mala byť simulácia týchto troch výpočtových zariadení. Simulátor má mať grafické užívateľské rozhranie.', 'Konečný automat, zásobníkový automat a Turingov stroj sú tri základné modely počítačov v Teórii formálnych jazykov a automatov. Predmetom práce by mala byť simulácia týchto troch výpočtových zariadení. Simulátor má mať grafické užívateľské rozhranie.', 1);
INSERT INTO projects VALUES (325, 'ZP', 445, NULL, 309, '2006/2007', 'Prostredie pre tvorbu dokumentov s využitím štandardu DocBook', 'Prostredie pre tvorbu dokumentov s využitím štandardu DocBook', 'Preskúmajte štandard DocBook (www.docbook.org). Analyzujte súčasné prostriedky podporujúce proces tvorby dokumentov s využitím tohto štandardu, od písania samotných dokumentov, cez ich formátovanie až po generovanie výsledných dokumentov v cieľovej sadzbe. Zamerajte sa pritom na voľne dostupné riešenia. S použitím vhodnej kombinácie týchto prostriedkov vytvorte jednotné prostredie pre tvorbu dokumentov.
Pri riešení projektu sa tiež zamerajte na úpravu existujúcich šablón pre formátovanie dokumentov tak, aby tieto bolo možné využiť na tvorbu dokumentácie s profesionálnym vzhľadom.', 'Preskúmajte štandard DocBook (www.docbook.org). Analyzujte súčasné prostriedky podporujúce proces tvorby dokumentov s využitím tohto štandardu, od písania samotných dokumentov, cez ich formátovanie až po generovanie výsledných dokumentov v cieľovej sadzbe. Zamerajte sa pritom na voľne dostupné riešenia. S použitím vhodnej kombinácie týchto prostriedkov vytvorte jednotné prostredie pre tvorbu dokumentov.
Pri riešení projektu sa tiež zamerajte na úpravu existujúcich šablón pre formátovanie dokumentov tak, aby tieto bolo možné využiť na tvorbu dokumentácie s profesionálnym vzhľadom.', 1);
INSERT INTO projects VALUES (326, 'ZP', 690, NULL, 310, '2006/2007', 'Podobnosť dokumentov', 'Podobnosť dokumentov', 'Na webe sa nachádza veľa dokumentov, mnohé sa nachádzajú na rôznych miestach v tej istej podobe, niektoré sú rôzne iba formátom, alebo majú zmenený obsah. Cieľom zadania je navrhnúť prístup ako spoznať podobnosť medzi dokumentmi, určiť nakoľko sa dokumenty podobajú svojim obsahom. Riešiteľ by sa mal opierať o už existujúce prístupy (shingles, „vektorový checksum“ dokumentu), ale nakoľko je veľký priestor na vylepšenia, očakávajú sa aj nové nápady.
Literatúra: Soumen Chakrabati: Mining the Web', 'Na webe sa nachádza veľa dokumentov, mnohé sa nachádzajú na rôznych miestach v tej istej podobe, niektoré sú rôzne iba formátom, alebo majú zmenený obsah. Cieľom zadania je navrhnúť prístup ako spoznať podobnosť medzi dokumentmi, určiť nakoľko sa dokumenty podobajú svojim obsahom. Riešiteľ by sa mal opierať o už existujúce prístupy (shingles, „vektorový checksum“ dokumentu), ale nakoľko je veľký priestor na vylepšenia, očakávajú sa aj nové nápady.
Literatúra: Soumen Chakrabati: Mining the Web', 1);
INSERT INTO projects VALUES (327, 'ZP', 98, NULL, 311, '2005/2006', 'Adaptívna archivácia informácií', 'Adaptívna archivácia informácií', 'Pri vytváraní prednášok, seminárov, workshopov atď., má autor, resp. prednášateľ k dispozícii informácie rôzneho typu a formátov. Pomohlo by mu, keby mal tieto informácie systematicky uložené - archivované, aby sa mohol ľahko a rýchlo k relevantnej informácii dostať. Takýto adaptívny archivačný systém  informácií by slúžil ako báza údajov pre nástroj na vytváranie kurzov. 
Spravte analýzu problematiky a na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu, ktorá bude slúžiť na  ukladanie, archivovanie a spracovanie informácií. ', 'Pri vytváraní prednášok, seminárov, workshopov atď., má autor, resp. prednášateľ k dispozícii informácie rôzneho typu a formátov. Pomohlo by mu, keby mal tieto informácie systematicky uložené - archivované, aby sa mohol ľahko a rýchlo k relevantnej informácii dostať. Takýto adaptívny archivačný systém  informácií by slúžil ako báza údajov pre nástroj na vytváranie kurzov. 
Spravte analýzu problematiky a na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu, ktorá bude slúžiť na  ukladanie, archivovanie a spracovanie informácií. ', 1);
INSERT INTO projects VALUES (328, 'ZP', 358, NULL, 312, '2005/2006', 'Testovanie bezpečnostných slabín počítačových sietí', 'Testovanie bezpečnostných slabín počítačových sietí', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy bezpečnostných slabín. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú testovať vybraté typy bezpečnostných slabín na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy bezpečnostných slabín. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú testovať vybraté typy bezpečnostných slabín na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.', 0);
INSERT INTO projects VALUES (329, 'ZP', 674, NULL, 313, '2005/2006', 'Exploratívne vytváranie modelu hráča a jeho využitie v tímovej hre', 'Exploratívne vytváranie modelu hráča a jeho využitie v tímovej hre', 'Predpokladajme model futbalovej hry, v ktorej hrajú proti sebe dva tímy softvérových agentov. Správanie každého hráča je modelované pomocou automatu, na základe ktorého sa rozhoduje, akú akciu vykoná agent v danej situácii. Navrhnite a implementujte spôsob, ktorým bude možné počas hry zisťovať reakcie súperov na podnety a na základe toho vytvárať ich model vo forme automatu, ktorý sa následne použije pri predikcii správania súpera a rozhodovaní počas hry. Svoje riešenie porovnajte s niektorými inými už existujúcimi riešeniami a zaraďte ho do kontextu sučasného stavu v oblasti modelovania tímových hier.', 'Predpokladajme model futbalovej hry, v ktorej hrajú proti sebe dva tímy softvérových agentov. Správanie každého hráča je modelované pomocou automatu, na základe ktorého sa rozhoduje, akú akciu vykoná agent v danej situácii. Navrhnite a implementujte spôsob, ktorým bude možné počas hry zisťovať reakcie súperov na podnety a na základe toho vytvárať ich model vo forme automatu, ktorý sa následne použije pri predikcii správania súpera a rozhodovaní počas hry. Svoje riešenie porovnajte s niektorými inými už existujúcimi riešeniami a zaraďte ho do kontextu sučasného stavu v oblasti modelovania tímových hier.', 1);
INSERT INTO projects VALUES (330, 'ZP', 27, NULL, 314, '2005/2006', 'Simulačná knižnica pre agentové modely', 'Simulačná knižnica pre agentové modely', '   Preštudujte dostupné simulačné metódy a nástroje pre simuláciu modelov s kolóniami agentov. Navrhnite a zrealizujte simulačnú knižnicu, ktorá poskytne základné prostredie pre vytváranie agentových modelov. Implementujte vybrané príklady simulácií s využitím tejto knižnice a vyhodnoťte ich vlastnosti.

Odporúčaná literatúra:

1. Kvasnička V., Pospíchal J., Tiňo P.: Evolučné algoritmy. STU Bratislava, 2000, ISBN 80-227-1377-5.

2. Kognitívne vedy, CHTF STU
http://math.chtf.stuba.sk/kog_vedy.htm', '   Preštudujte dostupné simulačné metódy a nástroje pre simuláciu modelov s kolóniami agentov. Navrhnite a zrealizujte simulačnú knižnicu, ktorá poskytne základné prostredie pre vytváranie agentových modelov. Implementujte vybrané príklady simulácií s využitím tejto knižnice a vyhodnoťte ich vlastnosti.

Odporúčaná literatúra:

1. Kvasnička V., Pospíchal J., Tiňo P.: Evolučné algoritmy. STU Bratislava, 2000, ISBN 80-227-1377-5.

2. Kognitívne vedy, CHTF STU
http://math.chtf.stuba.sk/kog_vedy.htm', 1);
INSERT INTO projects VALUES (331, 'ZP', 294, NULL, 315, '2005/2006', 'Systém pre animovanie chôdze ľudskej kostry', 'Systém pre animovanie chôdze ľudskej kostry', 'Urobte rešerš literatúry o počítačových modeloch ľudskej kostry a animácie chôdze a  na základe výsledkov tímových projektov [1], [2] doplňte model  kostry človeka a jeho animácie o chrbticu, hrudný kôš, horné končatiny a hlavu. Použite rovnakú reprezentáciu 3D modelu, štruktúru dát modelu kostry, formát súboru pre simuláciu pohybu ako aj metodiku transformácie existujúcich modelov do požadovanej štruktúry dát.  

[1]  Mareták, P.: Analýza a animácia chôdze človeka. Tímový projekt FIIT STU Bratislava (2004)
[2] Lučenič, Ľ.:  Analýza a animácia chôdze človeka. Tímový projekt FIIT STU Bratislava (2005)

', 'Urobte rešerš literatúry o počítačových modeloch ľudskej kostry a animácie chôdze a  na základe výsledkov tímových projektov [1], [2] doplňte model  kostry človeka a jeho animácie o chrbticu, hrudný kôš, horné končatiny a hlavu. Použite rovnakú reprezentáciu 3D modelu, štruktúru dát modelu kostry, formát súboru pre simuláciu pohybu ako aj metodiku transformácie existujúcich modelov do požadovanej štruktúry dát.  

[1]  Mareták, P.: Analýza a animácia chôdze človeka. Tímový projekt FIIT STU Bratislava (2004)
[2] Lučenič, Ľ.:  Analýza a animácia chôdze človeka. Tímový projekt FIIT STU Bratislava (2005)

', 1);
INSERT INTO projects VALUES (332, 'ZP', 12, NULL, 316, '2005/2006', 'Interaktívny cestovný poriadok na mobilnej platforme', 'Interaktívny cestovný poriadok na mobilnej platforme', 'Analyzujte mobilné platformy umožňujúce beh používateľských aplikácií (PDA, telefóny,atď.). Porovnajte možnosti jednotlivých platforiem a vývojových prostriedkov pre ne určených. Sústreďte sa na rámce (framework) poskytované pre podporu vývoja interaktívnych aplikácii na jednotlivých platformách a možnosti spolupráce viacerých mobilných agentov v heterogénnom prostredí. Pre zvolenú platformu navrhnite a implementujte aplikáciu, ktorá poskytne používateľovi informácie o odchodoch hromadnej dopravy, prípadne odporučí vhodnú trasu. Uvažujte aj o efektívnosti uloženia a komunikácii údajov, o udržovaní aktuálnosti údajov v prostredí bez trvalého pripojenia k internetu alebo inej sieti a o možnostiach poskytovania služieb založených na lokalizácii.

', 'Analyzujte mobilné platformy umožňujúce beh používateľských aplikácií (PDA, telefóny,atď.). Porovnajte možnosti jednotlivých platforiem a vývojových prostriedkov pre ne určených. Sústreďte sa na rámce (framework) poskytované pre podporu vývoja interaktívnych aplikácii na jednotlivých platformách a možnosti spolupráce viacerých mobilných agentov v heterogénnom prostredí. Pre zvolenú platformu navrhnite a implementujte aplikáciu, ktorá poskytne používateľovi informácie o odchodoch hromadnej dopravy, prípadne odporučí vhodnú trasu. Uvažujte aj o efektívnosti uloženia a komunikácii údajov, o udržovaní aktuálnosti údajov v prostredí bez trvalého pripojenia k internetu alebo inej sieti a o možnostiach poskytovania služieb založených na lokalizácii.

', 1);
INSERT INTO projects VALUES (333, 'ZP', 579, NULL, 317, '2005/2006', 'Systém na podporu tvorby semestrálnych rozvrhov', 'Systém na podporu tvorby semestrálnych rozvrhov', 'Analyzujte údajové množiny a postupy pri vytváraní semestrálnych rozvrhov a následne navrhnite systém, ktorý by tieto činnosti podporoval. Základné časti návrhu realizujte v podobe prototypu a zaistite nevyhnutnú kompatibilitu s informačným systémom používaným na FIIT.', 'Analyzujte údajové množiny a postupy pri vytváraní semestrálnych rozvrhov a následne navrhnite systém, ktorý by tieto činnosti podporoval. Základné časti návrhu realizujte v podobe prototypu a zaistite nevyhnutnú kompatibilitu s informačným systémom používaným na FIIT.', 1);
INSERT INTO projects VALUES (334, 'ZP', 541, NULL, 318, '2005/2006', 'Rozpoznávanie obrazov z infrakamery', 'Rozpoznávanie obrazov z infrakamery', 'Navrhnite a realizujte systém pre rozpoznanie  človeka z obrazu infrakamery. Systém má umožniť v reálnom čase rozpoznať, či sa v práve snímanom obraze infrakamery nachádza silueta človeka a indikovať takýto stav. Systém môže byť využitý v autách na indikáciu chodcov a cyklistov za zníženej viditeľnosti a v inteligentných alarmoch.', 'Navrhnite a realizujte systém pre rozpoznanie  človeka z obrazu infrakamery. Systém má umožniť v reálnom čase rozpoznať, či sa v práve snímanom obraze infrakamery nachádza silueta človeka a indikovať takýto stav. Systém môže byť využitý v autách na indikáciu chodcov a cyklistov za zníženej viditeľnosti a v inteligentných alarmoch.', 1);
INSERT INTO projects VALUES (335, 'ZP', 566, NULL, 319, '2005/2006', 'Symbolický prístup k riešeniu problému Copycat', 'Symbolický prístup k riešeniu problému Copycat', 'Copycat systém bol zostrojený počiatkom 80. rokov americkým informatikom D. Hofstadterom a jeho doktorandkou M. Mitchellovou. Pomocou systému je možné modelovať elementárne procesy analógie, ktoré sú integrálnou súčasťou indukčného procesu zovšeobecňovania. Úlohu vysvetlíme na jednoduchom príklade: Majme reláciu abc==>abd, pomocou tejto relácie (využívajúc analógiu) je potrebné doplniť druhú reláciu ijk==>?
Je potrebné nahradiť otáznik takým reťazcom delta tak, aby relácia ijk==>delta bola analogická k pôvodnej relácii abc==>abd. Príklad riešenia je delta=ijl, ktoré vychádza zo skutočnosti, že v pôvodnej relácii abc==>abd bol posledný symbol zmenený na nasledovníka v abecede.
Je potrebné rozanalyzovať tento problém a naprogramovať tak, aby bol user fiendly pre užívateľov, ktorí si chcú testovať svoje IQ. ', 'Copycat systém bol zostrojený počiatkom 80. rokov americkým informatikom D. Hofstadterom a jeho doktorandkou M. Mitchellovou. Pomocou systému je možné modelovať elementárne procesy analógie, ktoré sú integrálnou súčasťou indukčného procesu zovšeobecňovania. Úlohu vysvetlíme na jednoduchom príklade: Majme reláciu abc==>abd, pomocou tejto relácie (využívajúc analógiu) je potrebné doplniť druhú reláciu ijk==>?
Je potrebné nahradiť otáznik takým reťazcom delta tak, aby relácia ijk==>delta bola analogická k pôvodnej relácii abc==>abd. Príklad riešenia je delta=ijl, ktoré vychádza zo skutočnosti, že v pôvodnej relácii abc==>abd bol posledný symbol zmenený na nasledovníka v abecede.
Je potrebné rozanalyzovať tento problém a naprogramovať tak, aby bol user fiendly pre užívateľov, ktorí si chcú testovať svoje IQ. ', 1);
INSERT INTO projects VALUES (336, 'ZP', 43, NULL, 320, '2005/2006', 'Riešenie hlavolamu symbolickým a subsymbolickým prístupom umelej inteligencie', 'Riešenie hlavolamu symbolickým a subsymbolickým prístupom umelej inteligencie', 'Na vybranom hlavolame porovnajte rôzne prístupy jeho riešenia. Porovnajte  vybraných zástupcov symbolickej a subsymbolickej umelej inteligencie na riešenie daného hlavolamu. Zhodnoťte časovú a pamäťovú náročnosť testovaných prístupov.', 'Na vybranom hlavolame porovnajte rôzne prístupy jeho riešenia. Porovnajte  vybraných zástupcov symbolickej a subsymbolickej umelej inteligencie na riešenie daného hlavolamu. Zhodnoťte časovú a pamäťovú náročnosť testovaných prístupov.', 1);
INSERT INTO projects VALUES (337, 'ZP', 387, NULL, 321, '2005/2006', 'Využitie pravdepodobnostných modelov so skrytými triedami na organizovanie dokumentov', 'Využitie pravdepodobnostných modelov so skrytými triedami na organizovanie dokumentov', 'Cieľom tohto projektu bude skúmať pravdepodobnostné modely so skrytými triedami a ich použitie na automatické organizovanie dokumentov a slov. Od študenta sa najprv predpokladá pochopenie modelov so skrytými triedami a experimentovanie s vybranými modelmi. V práci nás bude zaujímať správanie sa modelov, ktoré vychádzajú z aspektového modelu. Bude potrebné vytvoriť softvérový balík na organizovanie dokumentov.', 'Cieľom tohto projektu bude skúmať pravdepodobnostné modely so skrytými triedami a ich použitie na automatické organizovanie dokumentov a slov. Od študenta sa najprv predpokladá pochopenie modelov so skrytými triedami a experimentovanie s vybranými modelmi. V práci nás bude zaujímať správanie sa modelov, ktoré vychádzajú z aspektového modelu. Bude potrebné vytvoriť softvérový balík na organizovanie dokumentov.', 1);
INSERT INTO projects VALUES (338, 'ZP', 563, NULL, 322, '2005/2006', 'Experimentálny mikropočítač EMP386EX', 'Experimentálny mikropočítač EMP386EX', 'Navrhnite a zrealizujte experimentálny mikropočítač na báze mikroprocesora 80386EX s nasledovnými požiadavkami:  8-bitová pamäť ROM s kapacitou 512 kB s možnosťou rozšírenia, 16-bitová pamäť RWM s kapacitou 64 kB s možnosťou rozšírenia, možnosť krokovania programu po stroj. cykloch cez stav WAIT, 6-miestny numerický displej, 2 sériové interfejsy RS232C, podpora pripojenia monitorovacej jednotky.', 'Navrhnite a zrealizujte experimentálny mikropočítač na báze mikroprocesora 80386EX s nasledovnými požiadavkami:  8-bitová pamäť ROM s kapacitou 512 kB s možnosťou rozšírenia, 16-bitová pamäť RWM s kapacitou 64 kB s možnosťou rozšírenia, možnosť krokovania programu po stroj. cykloch cez stav WAIT, 6-miestny numerický displej, 2 sériové interfejsy RS232C, podpora pripojenia monitorovacej jednotky.', 0);
INSERT INTO projects VALUES (339, 'ZP', 375, NULL, 323, '2006/2007', 'Odolnosť proti poruchám v distribuovanom prostredí', 'Odolnosť proti poruchám v distribuovanom prostredí', 'Pre distribuované počítačové systémy analyzujte rôzne prístupy odolnosti proti poruchám založené na technike vkladania bodov návratu. Navrhnite a implementujte jednoduchý systém vkladania bodov návratu a zotavenia sa v prostredí lokálnych počítačových sietí. Navrhnutý systém overte v reálnej sieti.

Pozn. Riešenie projektu vyžaduje znalosti z Diagnostiky a spoľahlivosti.', 'Pre distribuované počítačové systémy analyzujte rôzne prístupy odolnosti proti poruchám založené na technike vkladania bodov návratu. Navrhnite a implementujte jednoduchý systém vkladania bodov návratu a zotavenia sa v prostredí lokálnych počítačových sietí. Navrhnutý systém overte v reálnej sieti.

Pozn. Riešenie projektu vyžaduje znalosti z Diagnostiky a spoľahlivosti.', 0);
INSERT INTO projects VALUES (340, 'ZP', 20, NULL, 324, '2005/2006', 'Aplikácia pre mobilné zariadenie', 'Aplikácia pre mobilné zariadenie', 'Mobilné zariadenia umožňujúce vykonávanie užívateľom dodaných programov sú čoraz dostupnejšie. Naštudujte možnosti programovania aplikácií pre mobilné zariadenia a vytvorte aplikáciu – hru využívajúcu komunikačné možnosti týchto zariadení.
', 'Mobilné zariadenia umožňujúce vykonávanie užívateľom dodaných programov sú čoraz dostupnejšie. Naštudujte možnosti programovania aplikácií pre mobilné zariadenia a vytvorte aplikáciu – hru využívajúcu komunikačné možnosti týchto zariadení.
', 1);
INSERT INTO projects VALUES (341, 'ZP', 359, NULL, 325, '2005/2006', 'Programová podpora pre výučbu počítačových sietí', 'Programová podpora pre výučbu počítačových sietí', 'Analyzujte CLI prostredie v CISCO smerovačoch. Navrhnite a implementujte programový systém, ktorý bude simulovať činnosť CISCO smerovača pre vybranú skupinu príkazov. Systém má umožňiť trénovanie konfigurovania smerovačov v prostredí OS Windows. ', 'Analyzujte CLI prostredie v CISCO smerovačoch. Navrhnite a implementujte programový systém, ktorý bude simulovať činnosť CISCO smerovača pre vybranú skupinu príkazov. Systém má umožňiť trénovanie konfigurovania smerovačov v prostredí OS Windows. ', 0);
INSERT INTO projects VALUES (342, 'ZP', 660, NULL, 326, '2005/2006', 'Dolovanie charakteristík používateľa v textoch', 'Dolovanie charakteristík používateľa v textoch', 'Efektívne sprístupňovanie informácií vyžaduje poskytnutie správnej informácie, správnym osobám v správnom čase. Uvedenú požiadavku možno realizovať tzv. adaptívnymi systémami, ktoré prispôsobujú prezentované informácie a prezentáciu informácií používateľovi alebo prostrediu, v ktorom sa nachádza. Na prispôsobovanie je nevyhnutné poznať charakteristiky používateľa, ktoré sa reprezentujú modelom používateľa. Skúmajte možnosti automatického získavania charakteristík používateľa a tvorby modelov používateľa. Zamerajte sa pri tom na dolovanie v textoch, ktoré používateľ poskytne a to v špecifickej oblasti vyhľadávania pracovných príležitostí. Ako základný vstup použite životopis používateľa. Navrhnite metódu analýzy životopisu s cieľom získania charakteristiky používateľa. Navrhnutú metódu overte implementáciou prototypu, ktorý na základe životopisov nájdených na Internete vytvorí model používateľa.', 'Efektívne sprístupňovanie informácií vyžaduje poskytnutie správnej informácie, správnym osobám v správnom čase. Uvedenú požiadavku možno realizovať tzv. adaptívnymi systémami, ktoré prispôsobujú prezentované informácie a prezentáciu informácií používateľovi alebo prostrediu, v ktorom sa nachádza. Na prispôsobovanie je nevyhnutné poznať charakteristiky používateľa, ktoré sa reprezentujú modelom používateľa. Skúmajte možnosti automatického získavania charakteristík používateľa a tvorby modelov používateľa. Zamerajte sa pri tom na dolovanie v textoch, ktoré používateľ poskytne a to v špecifickej oblasti vyhľadávania pracovných príležitostí. Ako základný vstup použite životopis používateľa. Navrhnite metódu analýzy životopisu s cieľom získania charakteristiky používateľa. Navrhnutú metódu overte implementáciou prototypu, ktorý na základe životopisov nájdených na Internete vytvorí model používateľa.', 1);
INSERT INTO projects VALUES (343, 'ZP', 44, NULL, 327, '2005/2006', 'Implementácia algoritmov na hľadanie hamiltonovských kružníc v grafe', 'Implementácia algoritmov na hľadanie hamiltonovských kružníc v grafe', 'Úloha zistiť, či v grafe existuje hamiltonovská kružnica je NP-úplný problém. Jeden možný prístup, ako zvládnuť tento problém v praxi, je overiť nejakú postačujúcu podmienku hamiltonovskosti (napr. podmienku Bondyho a Chvátala - dá sa overiť v polynomiálnom čase). Tým však zúžime množinu hamiltonovských grafov, pretože nie všetky hamiltonovské grafy jej vyhovujú.
Inou možnosťou je implemetovať nejaký heuristický algoritmus a hľadať hamiltonovskú kružnicu podľa neho.
Projekt by mal riešiť daný problém obidvomi prístupmi.', 'Úloha zistiť, či v grafe existuje hamiltonovská kružnica je NP-úplný problém. Jeden možný prístup, ako zvládnuť tento problém v praxi, je overiť nejakú postačujúcu podmienku hamiltonovskosti (napr. podmienku Bondyho a Chvátala - dá sa overiť v polynomiálnom čase). Tým však zúžime množinu hamiltonovských grafov, pretože nie všetky hamiltonovské grafy jej vyhovujú.
Inou možnosťou je implemetovať nejaký heuristický algoritmus a hľadať hamiltonovskú kružnicu podľa neho.
Projekt by mal riešiť daný problém obidvomi prístupmi.', 1);
INSERT INTO projects VALUES (344, 'ZP', 704, NULL, 328, '2005/2006', 'Podporný prostriedok pre zmeny v zdrojových materiáloch pre virtuálnu univerzitu ', 'Podporný prostriedok pre zmeny v zdrojových materiáloch pre virtuálnu univerzitu ', 'Navrhnúť softvérový prostriedok na podporu zmeny obsahu  zdrojových materiálov pre tvorbu kurzov – virtuálnu univerzitu, ktoré majú zdrojové materiály ( DB) katalogizované a znovu ich používajú. Takéto prostriedky majú svoju cenu  (a sú vyzdvihované), pretože prerábať staré kurzy je rýchlejšie , ako vytvárať celkom od začiatku nové.  V súvislosti s tým sa hovorí najmä o meta-dátach, teda aby informácie o objektoch boli dostupné, aby objekty dostatočne popisovali a aby meta-dáta boli v štandardizovanom tvare ( IMS – EDUCASE a Ariadne). )


', 'Navrhnúť softvérový prostriedok na podporu zmeny obsahu  zdrojových materiálov pre tvorbu kurzov – virtuálnu univerzitu, ktoré majú zdrojové materiály ( DB) katalogizované a znovu ich používajú. Takéto prostriedky majú svoju cenu  (a sú vyzdvihované), pretože prerábať staré kurzy je rýchlejšie , ako vytvárať celkom od začiatku nové.  V súvislosti s tým sa hovorí najmä o meta-dátach, teda aby informácie o objektoch boli dostupné, aby objekty dostatočne popisovali a aby meta-dáta boli v štandardizovanom tvare ( IMS – EDUCASE a Ariadne). )


', 1);
INSERT INTO projects VALUES (345, 'ZP', 260, NULL, 329, '2005/2006', 'Podpora automatizovaného hodnotenia programov', 'Podpora automatizovaného hodnotenia programov', 'Analyzujte problematiku automatizovaného overovania funkčnosti programov, navrhnite a vytvorte nástroj, ktorý jednak umožní vyhodnotiť správnosť fungovania programu na základe definovaných vstupov a k nim prislúchajúcich očakávaných výstupov a tiež umožní zistiť rôzne kvantitatívne a kvalitatívne parametre programov. Pri riešení sa zaoberajte aj problematikou kontrolovaného behu programu v obmedzenom prostredí tak, aby ste zabránili jeho možným nežiadúcim vplyvom na ostatné časti systému. Nástroj implementujte v operačnom systéme FreeBSD alebo Linux.
V rámci projektu sa zamerajte na časť venovanú kontrolovanému behu programu v obmedzenom prostredí. ', 'Analyzujte problematiku automatizovaného overovania funkčnosti programov, navrhnite a vytvorte nástroj, ktorý jednak umožní vyhodnotiť správnosť fungovania programu na základe definovaných vstupov a k nim prislúchajúcich očakávaných výstupov a tiež umožní zistiť rôzne kvantitatívne a kvalitatívne parametre programov. Pri riešení sa zaoberajte aj problematikou kontrolovaného behu programu v obmedzenom prostredí tak, aby ste zabránili jeho možným nežiadúcim vplyvom na ostatné časti systému. Nástroj implementujte v operačnom systéme FreeBSD alebo Linux.
V rámci projektu sa zamerajte na časť venovanú kontrolovanému behu programu v obmedzenom prostredí. ', 1);
INSERT INTO projects VALUES (346, 'ZP', 563, NULL, 330, '2005/2006', 'Generátor cieľových súborov pre napaľovanie pamätí', 'Generátor cieľových súborov pre napaľovanie pamätí', 'Navrhnite a implementujte programový systém na generovanie cieľových súborov pre napaľovanie pamätí s nasledujúcimi požiadavkami:
vstupný súbor v plnom formáte INTEL-HEX, podpora transformačnej tabuľky, možnosť rozdelenia vstupného súboru na 2, 4 a 8 výstupných súborov.
', 'Navrhnite a implementujte programový systém na generovanie cieľových súborov pre napaľovanie pamätí s nasledujúcimi požiadavkami:
vstupný súbor v plnom formáte INTEL-HEX, podpora transformačnej tabuľky, možnosť rozdelenia vstupného súboru na 2, 4 a 8 výstupných súborov.
', 0);
INSERT INTO projects VALUES (347, 'ZP', 10, NULL, 331, '2005/2006', 'Simulovaný robotický futbal - tréner', 'Simulovaný robotický futbal - tréner', 'Simulovaný robotický futbal sa zaoberá vytváraním tímov spolupracujúcich agentov, ktoré v simulovanom prostredí navzájom súperia. Jednotliví hráči-agenti predstavujú samostatné programy, ktoré prostredníctvom siete komunikujú so simulačným serverom. Počas testovania a učenia hráčov je možné použiť špeciálny nástroj - trénera, ktorý umožňuje nastavovanie pozícií hráčov, lopty a ďalších parametrov hry podľa vopred definovaných pravidiel. Navrhnite a implementujte pomocný nástroj - trénera, ktorý umožní pomocou jednoduchého rozhrania definovať pravidlá na nastavenie hernej situácie. Pri návrhu a implementácii je možné vychádzať z už existujúcich nástrojov.', 'Simulovaný robotický futbal sa zaoberá vytváraním tímov spolupracujúcich agentov, ktoré v simulovanom prostredí navzájom súperia. Jednotliví hráči-agenti predstavujú samostatné programy, ktoré prostredníctvom siete komunikujú so simulačným serverom. Počas testovania a učenia hráčov je možné použiť špeciálny nástroj - trénera, ktorý umožňuje nastavovanie pozícií hráčov, lopty a ďalších parametrov hry podľa vopred definovaných pravidiel. Navrhnite a implementujte pomocný nástroj - trénera, ktorý umožní pomocou jednoduchého rozhrania definovať pravidlá na nastavenie hernej situácie. Pri návrhu a implementácii je možné vychádzať z už existujúcich nástrojov.', 1);
INSERT INTO projects VALUES (348, 'ZP', 541, NULL, 332, '2005/2006', 'Rozpoznávanie obrazov z infrakamery', 'Rozpoznávanie obrazov z infrakamery', 'Navrhnite a realizujte systém pre rozpoznanie  človeka z obrazu infrakamery. Systém má umožniť v reálnom čase rozpoznať, či sa v práve snímanom obraze infrakamery nachádza silueta človeka a indikovať takýto stav. Systém môže byť využitý v autách na indikáciu chodcov a cyklistov za zníženej viditeľnosti a v inteligentných alarmoch.', 'Navrhnite a realizujte systém pre rozpoznanie  človeka z obrazu infrakamery. Systém má umožniť v reálnom čase rozpoznať, či sa v práve snímanom obraze infrakamery nachádza silueta človeka a indikovať takýto stav. Systém môže byť využitý v autách na indikáciu chodcov a cyklistov za zníženej viditeľnosti a v inteligentných alarmoch.', 1);
INSERT INTO projects VALUES (349, 'ZP', 19, NULL, 333, '2005/2006', 'Ontológie pre doménu pracovných príležitostí', 'Ontológie pre doménu pracovných príležitostí', 'Súčasný web obsahuje veľké množstvo informácií. Ich prehľadávanie komplikuje skutočnosť, že väčšina techník použitých na zobrazenie informácií nehovorí nič o sémantike prezentovaných informácií. Analyzujte vlastnosti portálov orientovaných na ponúkanie pracovných príležitostí. Vytvorte a formálne zapíšte ontológiu pre doménu pracovných príležitosti v niektorom z ontologických jazykov. Navrhnite model aplikačnej domény, na ktorom experimentálne overíte vytvorenú ontológiu. Na prezentáciu informácií z domény použite niektorú z techník adaptívnej prezentácie, prípadne kombináciu viacerých techník. ', 'Súčasný web obsahuje veľké množstvo informácií. Ich prehľadávanie komplikuje skutočnosť, že väčšina techník použitých na zobrazenie informácií nehovorí nič o sémantike prezentovaných informácií. Analyzujte vlastnosti portálov orientovaných na ponúkanie pracovných príležitostí. Vytvorte a formálne zapíšte ontológiu pre doménu pracovných príležitosti v niektorom z ontologických jazykov. Navrhnite model aplikačnej domény, na ktorom experimentálne overíte vytvorenú ontológiu. Na prezentáciu informácií z domény použite niektorú z techník adaptívnej prezentácie, prípadne kombináciu viacerých techník. ', 1);
INSERT INTO projects VALUES (350, 'ZP', 563, NULL, 335, '2005/2006', 'Monitorovacia jednotka číslicových systémov', 'Monitorovacia jednotka číslicových systémov', 'Navrhnite a zrealizujte monitorovaciu jednotku na báze mikropočítača s nasledovnými vlastnosťami:  64 vstupných kanálov, 12-miestny hexadecimálny displej, 16 indikačných LED diód, 2 externé synchronizačné vstupy, 1 manuálny synchronizačný vstup, spojenie s hostiteľským počítačom cez rozhranie RS232C.', 'Navrhnite a zrealizujte monitorovaciu jednotku na báze mikropočítača s nasledovnými vlastnosťami:  64 vstupných kanálov, 12-miestny hexadecimálny displej, 16 indikačných LED diód, 2 externé synchronizačné vstupy, 1 manuálny synchronizačný vstup, spojenie s hostiteľským počítačom cez rozhranie RS232C.', 0);
INSERT INTO projects VALUES (351, 'ZP', 563, NULL, 336, '2005/2006', 'Generátor cieľových súborov pre napaľovanie pamätí', 'Generátor cieľových súborov pre napaľovanie pamätí', 'Navrhnite a implementujte programový systém na generovanie cieľových súborov pre napaľovanie pamätí s nasledujúcimi požiadavkami:  vstupný súbor v plnom formáte INTEL-HEX, podpora transformačnej tabuľky, možnosť rozdelenia vstupného súboru na 2, 4 a 8 výstupných súborov.
', 'Navrhnite a implementujte programový systém na generovanie cieľových súborov pre napaľovanie pamätí s nasledujúcimi požiadavkami:  vstupný súbor v plnom formáte INTEL-HEX, podpora transformačnej tabuľky, možnosť rozdelenia vstupného súboru na 2, 4 a 8 výstupných súborov.
', 0);
INSERT INTO projects VALUES (352, 'DP', 447, NULL, 337, '2005/2006', 'Vyhľadávanie znalostí vo webe so sémantikou', 'Searching informations and knowledges in the Semantic Web', NULL, NULL, 1);
INSERT INTO projects VALUES (353, 'ZP', 388, NULL, 337, '2003/2004', 'OOP  pomocou príkladov', 'OOP using examples', 'Analyzujte metódy tvorby a prezentácie znalostí z oblasti programovania vo forme riešených príkladov s využitím hypertextu. Analyzujte výsledky prác vytvorených v tejto oblasti v rámci študentských projektov na KIVT v minulých rokoch. 
Navrhnite a implementujte softvérovú aplikáciu, ktorá umožní tvorbu, prezentáciu, použitie a údržbu príručky objektovo orientovaného programovania vo forme riešených príkladov.  
Navrhnite jednoduchú príručku riešených príkladov  OOP v jazyku C++.  Vaše riešenie softvérovej aplikácie overte tým, že pomocou implementovaného protototypu vytvoríte a prezentujete navrhnutú príručku.', 'Analyzujte metódy tvorby a prezentácie znalostí z oblasti programovania vo forme riešených príkladov s využitím hypertextu. Analyzujte výsledky prác vytvorených v tejto oblasti v rámci študentských projektov na KIVT v minulých rokoch. 
Navrhnite a implementujte softvérovú aplikáciu, ktorá umožní tvorbu, prezentáciu, použitie a údržbu príručky objektovo orientovaného programovania vo forme riešených príkladov.  
Navrhnite jednoduchú príručku riešených príkladov  OOP v jazyku C++.  Vaše riešenie softvérovej aplikácie overte tým, že pomocou implementovaného protototypu vytvoríte a prezentujete navrhnutú príručku.', 1);
INSERT INTO projects VALUES (354, 'ZP', 301, NULL, 338, '2005/2006', 'Návrh a implementácia systému na grafickú vizualizáciu vybraných činností pamäťového podsystému počítača', 'Návrh a implementácia systému na grafickú vizualizáciu vybraných činností pamäťového podsystému počítača', 'Navrhnite a implementujte systém, ktorý bude s využitím multimediálnych technológií umožňovať  naštudovanie, grafické zobrazenie a demonštráciu vybraných funkčných princípov a činností  pamäťového podsystému počítača. Produkt implementujte ako hypermediálnu prezentáciu vo voľne dostupnom webovom prehliadači.', 'Navrhnite a implementujte systém, ktorý bude s využitím multimediálnych technológií umožňovať  naštudovanie, grafické zobrazenie a demonštráciu vybraných funkčných princípov a činností  pamäťového podsystému počítača. Produkt implementujte ako hypermediálnu prezentáciu vo voľne dostupnom webovom prehliadači.', 0);
INSERT INTO projects VALUES (355, 'ZP', 431, NULL, 339, '2005/2006', 'Vizualizácia VHDL opisu', 'Vizualizácia VHDL opisu', 'Analyzujte problematiku vizualizácie VHDL opisu a možnosti, ktoré poskytujú dostupné návrhové systémy. Na základe analýzy navrhnite a implementujte systém, ktorý transformuje zadaný VHDL opis na zodpovedajúci schématický zápis so zachovaním hierarchie pôvodného opisu. Pri návrhu uvažujte s možnosťou ďalšieho rozšírenia systému o vizualizáciu simulácie VHDL opisu.', 'Analyzujte problematiku vizualizácie VHDL opisu a možnosti, ktoré poskytujú dostupné návrhové systémy. Na základe analýzy navrhnite a implementujte systém, ktorý transformuje zadaný VHDL opis na zodpovedajúci schématický zápis so zachovaním hierarchie pôvodného opisu. Pri návrhu uvažujte s možnosťou ďalšieho rozšírenia systému o vizualizáciu simulácie VHDL opisu.', 0);
INSERT INTO projects VALUES (356, 'ZP', 297, NULL, 340, '2005/2006', 'Simulátor toku strojových inštrukcií', 'Simulátor toku strojových inštrukcií', 'Analyzujte možnosti a prostriedky na simuláciu definovanej inštrukčnej sady strojových inštrukcií. Vytvorte simulačné prostredie, v ktorom názorne zobrazte procesy a stavy počas vykonávania inštrukcie daného programu pre zvolený typ procesora.', 'Analyzujte možnosti a prostriedky na simuláciu definovanej inštrukčnej sady strojových inštrukcií. Vytvorte simulačné prostredie, v ktorom názorne zobrazte procesy a stavy počas vykonávania inštrukcie daného programu pre zvolený typ procesora.', 1);
INSERT INTO projects VALUES (357, 'ZP', 541, NULL, 343, '2005/2006', 'Model používateľa pre jeho identifikáciu', 'Model používateľa pre jeho identifikáciu', 'Navrhnite metódy a prostriedky pre budovanie modelu používateľa na základe jeho charakteristík správania sa v počítačovom systéme. Navrhnutý systém implementujte vo vybranom prostredí. Systém má slúžiť na potvrdenie identifikácie používateľa za účelom zvýšenia bezpečnosti prevádzky informačných systémov.', 'Navrhnite metódy a prostriedky pre budovanie modelu používateľa na základe jeho charakteristík správania sa v počítačovom systéme. Navrhnutý systém implementujte vo vybranom prostredí. Systém má slúžiť na potvrdenie identifikácie používateľa za účelom zvýšenia bezpečnosti prevádzky informačných systémov.', 1);
INSERT INTO projects VALUES (358, 'ZP', 655, NULL, 344, '2005/2006', 'Webový portál pre správu študentských projetkov', 'Webový portál pre správu študentských projetkov', 'Analyzujte problematiku podpory zadávania a odovzdávania študentských projektov na fakulte. Navrhnite a implementujte systém - webovskú aplikáciu, ktorá by umožnila pedagógom zadávať témy projektov a študentom prihlasovať sa na vypísané témy. Aplikáciu je možné rozšíriť napríklad aj o zadávanie hodnotení posudkov a pod. Vytvorený systém naplňte údajmi z už existujúcich systémov využívaných na fakulte. Vzhľadom k rozsahu projektu a aj predpokladu nasadania v reálnom prostredí vyžadujú sa znalosti uchádzačov z oblasti vývoja webovských aplikácií (napríklad Postgres / PHP, JSP a pod.).', 'Analyzujte problematiku podpory zadávania a odovzdávania študentských projektov na fakulte. Navrhnite a implementujte systém - webovskú aplikáciu, ktorá by umožnila pedagógom zadávať témy projektov a študentom prihlasovať sa na vypísané témy. Aplikáciu je možné rozšíriť napríklad aj o zadávanie hodnotení posudkov a pod. Vytvorený systém naplňte údajmi z už existujúcich systémov využívaných na fakulte. Vzhľadom k rozsahu projektu a aj predpokladu nasadania v reálnom prostredí vyžadujú sa znalosti uchádzačov z oblasti vývoja webovských aplikácií (napríklad Postgres / PHP, JSP a pod.).', 1);
INSERT INTO projects VALUES (359, 'ZP', 579, NULL, 345, '2005/2006', 'Systém na podporu tvorby skúškových rozvrhov', 'Systém na podporu tvorby skúškových rozvrhov', 'Analyzujte údajové množiny a postupy pri vytváraní  rozvrhov skúšok a následne navrhnite systém, ktorý by tieto činnosti podporoval. Základné časti návrhu realizujte v podobe prototypu a zaistite nevyhnutnú kompatibilitu s informačným systémom používaným na FIIT.
', 'Analyzujte údajové množiny a postupy pri vytváraní  rozvrhov skúšok a následne navrhnite systém, ktorý by tieto činnosti podporoval. Základné časti návrhu realizujte v podobe prototypu a zaistite nevyhnutnú kompatibilitu s informačným systémom používaným na FIIT.
', 1);
INSERT INTO projects VALUES (360, 'ZP', 12, NULL, 346, '2005/2006', 'Podpora organizácie času', 'Podpora organizácie času', 'Analyzujte komunikačné protokoly a súborové formáty používané na výmenu informácií medzi systémami pre organizáciu času a plánovanie (PDA, osobné organizéry, telefóny, MS Exchange, a pod.). Navrhnite spôsob personalizovanej distribúcie rozvrhov prednášok a cvičení na univerzite ako časových plánov. Na základe návrhu implementujte internetovú aplikáciu s použitím vhodných aplikačných rámcov a existujúcich komponentov.', 'Analyzujte komunikačné protokoly a súborové formáty používané na výmenu informácií medzi systémami pre organizáciu času a plánovanie (PDA, osobné organizéry, telefóny, MS Exchange, a pod.). Navrhnite spôsob personalizovanej distribúcie rozvrhov prednášok a cvičení na univerzite ako časových plánov. Na základe návrhu implementujte internetovú aplikáciu s použitím vhodných aplikačných rámcov a existujúcich komponentov.', 1);
INSERT INTO projects VALUES (361, 'ZP', 98, NULL, 347, '2005/2006', 'Nástroj pre vytváranie kurzov', 'Nástroj pre vytváranie kurzov', 'Pri vytváraní prednášok, seminárov, kurzov, workshopov atď., má autor, resp. prednášateľ k dispozícii informácie rôzných typov a formátov. Cieľom je vytvoriť prostriedok, ktorý by podporil proces vytvárania  takýchto učebných celkov. Autor by vyberal buď z databázy informácií (otázky, učebné texty, obrázky, diagramy), alebo  by mal možnosť vytvárať nové základné učebné celky.  
Spravte analýzu problematiky a na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu, ktorá bude slúžiť ako nástroj pre vytváranie kurzov.', 'Pri vytváraní prednášok, seminárov, kurzov, workshopov atď., má autor, resp. prednášateľ k dispozícii informácie rôzných typov a formátov. Cieľom je vytvoriť prostriedok, ktorý by podporil proces vytvárania  takýchto učebných celkov. Autor by vyberal buď z databázy informácií (otázky, učebné texty, obrázky, diagramy), alebo  by mal možnosť vytvárať nové základné učebné celky.  
Spravte analýzu problematiky a na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu, ktorá bude slúžiť ako nástroj pre vytváranie kurzov.', 1);
INSERT INTO projects VALUES (362, 'ZP', 704, NULL, 348, '2005/2006', 'Editor zdrojových programov v stave ich  zdieľania', 'Editor zdrojových programov v stave ich  zdieľania', 'Analyzujte vlastnosti editorov zdrojových programov  a  možnosti zdieľania dokumentov obsahujúcich zdrojové  programy pri tímovej práci .  Analyzujte  možnosti , spôsoby a princípy podpory tímovej práce pri tvorbe takýchto dokumentov .  Navrhnite editor zdrojových programov , ktorý bude podporovať  zvýrazňovanie syntaxe (vybraného)  programovacieho jazyka a umožní zostavovanie celku z jednotlivých častí vytvorených v tíme. Doporučený implementačný jazyk - jazyk Java.
 
', 'Analyzujte vlastnosti editorov zdrojových programov  a  možnosti zdieľania dokumentov obsahujúcich zdrojové  programy pri tímovej práci .  Analyzujte  možnosti , spôsoby a princípy podpory tímovej práce pri tvorbe takýchto dokumentov .  Navrhnite editor zdrojových programov , ktorý bude podporovať  zvýrazňovanie syntaxe (vybraného)  programovacieho jazyka a umožní zostavovanie celku z jednotlivých častí vytvorených v tíme. Doporučený implementačný jazyk - jazyk Java.
 
', 1);
INSERT INTO projects VALUES (363, 'ZP', 35, NULL, 349, '2005/2006', 'Interpret lambda-výrazov', 'Interpret lambda-výrazov', 'Vašou úlohou bude naštudovať lambda-kalkulus a vytvoriť program, ktorý bude schopný interpretovať lambda-výrazy. Z určitého pohľadu môžeme lambda-kalkulus považovať za programovací jazyk. Jedná sa o úplný programovací jazykâ€”umožňuje nám opísať ľubovoľný výpočet. Jedná sa (z pohľadu sémantiky) o jednoduchý programovací jazyk. Je ho možné kompletne opísať na niekoľko málo stranách. Vďaka tejto jednoduchosti bude možné pomerne ľahko vytvoriť príslušný interpret schopný interpretovať programy napísané v tomto jazykuâ€”lambda-výrazy. 

Výstupom tohto projektu by mal byť program schopný redukovať (vyhodnotiť) ľubovoľný lambda-výraz do normálnej formy (v ktorej už nie je možné robiť žiadne ďalšie redukcie), ak zadaný lambda-výraz má normálnu formu. Váš program by mal vedieť zobraziť jednotlivé kroky redukcie (vyhodnocovania) tak ako ten program postupoval od zadaného lambda-výrazu až k výsledku. Tiež zvážte užitočnosť tzv. „syntactic-suggar“ konštrukcií, ktoré v určitých prípadoch sprehľadňujú opis dát a opis výpočtu a je ich možné používať namiesto surových lambda-výrazov. Tie, ktoré uznáte za užitočné, zahrňte do svojho jazyka.
', 'Vašou úlohou bude naštudovať lambda-kalkulus a vytvoriť program, ktorý bude schopný interpretovať lambda-výrazy. Z určitého pohľadu môžeme lambda-kalkulus považovať za programovací jazyk. Jedná sa o úplný programovací jazykâ€”umožňuje nám opísať ľubovoľný výpočet. Jedná sa (z pohľadu sémantiky) o jednoduchý programovací jazyk. Je ho možné kompletne opísať na niekoľko málo stranách. Vďaka tejto jednoduchosti bude možné pomerne ľahko vytvoriť príslušný interpret schopný interpretovať programy napísané v tomto jazykuâ€”lambda-výrazy. 

Výstupom tohto projektu by mal byť program schopný redukovať (vyhodnotiť) ľubovoľný lambda-výraz do normálnej formy (v ktorej už nie je možné robiť žiadne ďalšie redukcie), ak zadaný lambda-výraz má normálnu formu. Váš program by mal vedieť zobraziť jednotlivé kroky redukcie (vyhodnocovania) tak ako ten program postupoval od zadaného lambda-výrazu až k výsledku. Tiež zvážte užitočnosť tzv. „syntactic-suggar“ konštrukcií, ktoré v určitých prípadoch sprehľadňujú opis dát a opis výpočtu a je ich možné používať namiesto surových lambda-výrazov. Tie, ktoré uznáte za užitočné, zahrňte do svojho jazyka.
', 1);
INSERT INTO projects VALUES (364, 'ZP', 400, NULL, 350, '2005/2006', 'Zabezpečenie webových aplikacií pred zlomyseľnými používateľmi', 'Zabezpečenie webových aplikacií pred zlomyseľnými používateľmi', 'Verejne dostupné webové aplikácie sú sústavne vystavované
útokom na ich aplikačnú logiku, teda pokusom zlomyseľných používateľov 
o ich skompromitovanie. Zanalyzujte možnosti útokov na webové aplikácie 
na vrstve HTTP a vyššie (nie útoky na web server a operačný systém). Vytvorte postup profilovania zlomyseľného používateľa a navrhnite možnosť využitia takého profilu pri detekcii prebiehajúcich útokov.

Výstup projektu:
Návrh profilovania zlomyseľných používateľov,
Nástroj na vytváranie profilov, výstup v XML,
Odporúčania pre nasadenie takýchto profilov v aplikácii Webrella [1] alebo inej ochrannej aplikácii.

', 'Verejne dostupné webové aplikácie sú sústavne vystavované
útokom na ich aplikačnú logiku, teda pokusom zlomyseľných používateľov 
o ich skompromitovanie. Zanalyzujte možnosti útokov na webové aplikácie 
na vrstve HTTP a vyššie (nie útoky na web server a operačný systém). Vytvorte postup profilovania zlomyseľného používateľa a navrhnite možnosť využitia takého profilu pri detekcii prebiehajúcich útokov.

Výstup projektu:
Návrh profilovania zlomyseľných používateľov,
Nástroj na vytváranie profilov, výstup v XML,
Odporúčania pre nasadenie takýchto profilov v aplikácii Webrella [1] alebo inej ochrannej aplikácii.

', 1);
INSERT INTO projects VALUES (365, 'ZP', 16, NULL, 351, '2006/2007', 'Reprezentácia zmeny aspektom', 'Reprezentácia zmeny aspektom', 'Riadenie zmeny je dôležitou súčasťou konfiguračného manažmentu. Aspektovo-orientované programovanie umožňuje modularizáciu pretínajúcich záležitostí, ktoré predstavujú problém aj v objektovo-orientovanom programovaní. Analyzujte možnosti uplatnenia aspektovo-orientovaného prístupu na zlepšenie riadenia zmeny z hľadiska rôznych aspektovo-orientovaných jazykov. Predveďte ich na príkladoch.', 'Riadenie zmeny je dôležitou súčasťou konfiguračného manažmentu. Aspektovo-orientované programovanie umožňuje modularizáciu pretínajúcich záležitostí, ktoré predstavujú problém aj v objektovo-orientovanom programovaní. Analyzujte možnosti uplatnenia aspektovo-orientovaného prístupu na zlepšenie riadenia zmeny z hľadiska rôznych aspektovo-orientovaných jazykov. Predveďte ich na príkladoch.', 1);
INSERT INTO projects VALUES (366, 'ZP', 35, NULL, 352, '2005/2006', 'Expertný systém', 'Expertný systém', 'Informácie expertov je možné nájsť v neformálnej forme v rôznych, napr. HOWTO dokumentoch. Takáto forma má svoje výhody (jeho zostavovanie nie je zvlášť problematické) avšak prináša so sebou aj nevýhody. Najmä pre používateľov. Čítanie takýchto dokumentov je zdĺhavé.

Nájdite vhodnú reprezentáciu vedomostí z Vami vybraných HOWTO dokumentov. Vytvorte takého softvérového experta, ktorý bude vedieť používateľovi prezentovať čo vie, t.j. s čím vie používateľovi pomôcť. Ak tam nájde používateľ nejaké užitočné vedomosti, tak môže experta požiadať, aby vykonal príslušné akcie nevyhnutné na rozchodenie príslušnej funkcionality, ktorá ho zaujíma.', 'Informácie expertov je možné nájsť v neformálnej forme v rôznych, napr. HOWTO dokumentoch. Takáto forma má svoje výhody (jeho zostavovanie nie je zvlášť problematické) avšak prináša so sebou aj nevýhody. Najmä pre používateľov. Čítanie takýchto dokumentov je zdĺhavé.

Nájdite vhodnú reprezentáciu vedomostí z Vami vybraných HOWTO dokumentov. Vytvorte takého softvérového experta, ktorý bude vedieť používateľovi prezentovať čo vie, t.j. s čím vie používateľovi pomôcť. Ak tam nájde používateľ nejaké užitočné vedomosti, tak môže experta požiadať, aby vykonal príslušné akcie nevyhnutné na rozchodenie príslušnej funkcionality, ktorá ho zaujíma.', 1);
INSERT INTO projects VALUES (367, 'ZP', 260, NULL, 353, '2005/2006', 'Podpora automatizovaného hodnotenia programov', 'Podpora automatizovaného hodnotenia programov', 'Analyzujte problematiku automatizovaného overovania funkčnosti programov, navrhnite a vytvorte nástroj, ktorý jednak umožní vyhodnotiť správnosť fungovania programu na základe definovaných vstupov a k nim prislúchajúcich očakávaných výstupov a tiež umožní zistiť rôzne kvantitatívne a kvalitatívne parametre programov. Pri riešení sa zaoberajte aj problematikou kontrolovaného behu programu v obmedzenom prostredí tak, aby ste zabránili jeho možným nežiadúcim vplyvom na ostatné časti systému. Nástroj implementujte v operačnom systéme FreeBSD alebo Linux.
V rámci projektu sa zamerajte na vytvorenie distribuovaného prostredia na riadenie testovania a overovania vlastností programov.
', 'Analyzujte problematiku automatizovaného overovania funkčnosti programov, navrhnite a vytvorte nástroj, ktorý jednak umožní vyhodnotiť správnosť fungovania programu na základe definovaných vstupov a k nim prislúchajúcich očakávaných výstupov a tiež umožní zistiť rôzne kvantitatívne a kvalitatívne parametre programov. Pri riešení sa zaoberajte aj problematikou kontrolovaného behu programu v obmedzenom prostredí tak, aby ste zabránili jeho možným nežiadúcim vplyvom na ostatné časti systému. Nástroj implementujte v operačnom systéme FreeBSD alebo Linux.
V rámci projektu sa zamerajte na vytvorenie distribuovaného prostredia na riadenie testovania a overovania vlastností programov.
', 1);
INSERT INTO projects VALUES (368, 'ZP', 10, NULL, 354, '2005/2006', 'Simulovaný robotický futbal - analýza správania hráčov', 'Simulovaný robotický futbal - analýza správania hráčov', 'Simulovaný robotický futbal sa zaoberá vytváraním tímov spolupracujúcich agentov, ktoré v simulovanom prostredí navzájom súperia. Navrhnite a implementujte nástroj na analýzu správania sa hráčov počas hry. Vytvorený nástroj by mal byť schopný rozpoznať základné vzory správania sa (proti)hráčov, ktoré by mali byť použiteľné pri predvídaní správania sa hráčov.', 'Simulovaný robotický futbal sa zaoberá vytváraním tímov spolupracujúcich agentov, ktoré v simulovanom prostredí navzájom súperia. Navrhnite a implementujte nástroj na analýzu správania sa hráčov počas hry. Vytvorený nástroj by mal byť schopný rozpoznať základné vzory správania sa (proti)hráčov, ktoré by mali byť použiteľné pri predvídaní správania sa hráčov.', 1);
INSERT INTO projects VALUES (369, 'ZP', 299, NULL, 355, '2005/2006', 'UML diagramy v prostredí TeXu', 'UML diagramy v prostredí TeXu', 'UML je de facto priemyselný štandard pre modelovanie softvérových systémov. V akademickej komunite, z ktorej veľká časť využíva prostredie TeX, sa UML rovnako bohato využíva ako jazyk pre popis a modelovanie softvéru.
Úlohou študenta je analyzovať možnosti zachytenia diagramov zapísaných v UML v prostredí TeXu. Cieľom je analyzovať grafické možnosti prostredia a navrhnúť riešenie pre zápis UML v TeXu, pričom preferované riešenie je vytvorenie balíka na zápis niektorých typov diagramov jazyka UML. Študent by mal v práci aj predviesť možnosti zvoleného riešenia na vhodných príkladoch.', 'UML je de facto priemyselný štandard pre modelovanie softvérových systémov. V akademickej komunite, z ktorej veľká časť využíva prostredie TeX, sa UML rovnako bohato využíva ako jazyk pre popis a modelovanie softvéru.
Úlohou študenta je analyzovať možnosti zachytenia diagramov zapísaných v UML v prostredí TeXu. Cieľom je analyzovať grafické možnosti prostredia a navrhnúť riešenie pre zápis UML v TeXu, pričom preferované riešenie je vytvorenie balíka na zápis niektorých typov diagramov jazyka UML. Študent by mal v práci aj predviesť možnosti zvoleného riešenia na vhodných príkladoch.', 1);
INSERT INTO projects VALUES (370, 'ZP', 43, NULL, 356, '2005/2006', 'Vznik kooperácie agentov', 'Vznik kooperácie agentov', 'Použite genetické programovanie na vytvorenie kognitívneho orgánu agentov, ktorí budú riešiť spoločnú úlohu. Úloha bude navrhnutá tak, aby ju bolo možné vyriešiť len skupinovo (napríklad presunutie ťažkého bremena v simulovanom priestore). Agenti budú teda donútení kooperovať.', 'Použite genetické programovanie na vytvorenie kognitívneho orgánu agentov, ktorí budú riešiť spoločnú úlohu. Úloha bude navrhnutá tak, aby ju bolo možné vyriešiť len skupinovo (napríklad presunutie ťažkého bremena v simulovanom priestore). Agenti budú teda donútení kooperovať.', 1);
INSERT INTO projects VALUES (371, 'ZP', 294, NULL, 362, '2005/2006', 'Segmentácia obrazu v počítačovom videní ', 'Segmentácia obrazu v počítačovom videní ', 'Urobte analýzu rôznych metód a algoritmov segmentácie digitálneho obrazu. Implementujte pilotnú aplikáciu segmentácie obrazu v dvoch oblastiach - segmentácia scény s mnoho objektami ale s ostrými hranicami, napríklad ulica s cieľom rozpoznávať ľudské postavy a segmentácia obrazu oblohy s objektami jedného druhu ale s nejasnými hranicami a s cieľom klasifikácie typu oblačnosti. V prvej aplikácii použite algoritmy založené na multifokálnom stereoobraze a v druhom experimentujte s rôznymi farebnými modelmi.', 'Urobte analýzu rôznych metód a algoritmov segmentácie digitálneho obrazu. Implementujte pilotnú aplikáciu segmentácie obrazu v dvoch oblastiach - segmentácia scény s mnoho objektami ale s ostrými hranicami, napríklad ulica s cieľom rozpoznávať ľudské postavy a segmentácia obrazu oblohy s objektami jedného druhu ale s nejasnými hranicami a s cieľom klasifikácie typu oblačnosti. V prvej aplikácii použite algoritmy založené na multifokálnom stereoobraze a v druhom experimentujte s rôznymi farebnými modelmi.', 1);
INSERT INTO projects VALUES (372, 'ZP', 294, NULL, 363, '2005/2006', 'Segmentácia obrazu v počítačovom videní ', 'Segmentácia obrazu v počítačovom videní ', 'Urobte analýzu rôznych metód a algoritmov segmentácie digitálneho obrazu. Implementujte pilotnú aplikáciu segmentácie obrazu v dvoch oblastiach - segmentácia scény s mnoho objektami ale s ostrými hranicami, napríklad ulica s cieľom rozpoznávať ľudské postavy a segmentácia obrazu oblohy s objektami jedného druhu ale s nejasnými hranicami a s cieľom klasifikácie typu oblačnosti. V prvej aplikácii použite algoritmy založené na multifokálnom stereoobraze a v druhom experimentujte s rôznymi farebnými modelmi.', 'Urobte analýzu rôznych metód a algoritmov segmentácie digitálneho obrazu. Implementujte pilotnú aplikáciu segmentácie obrazu v dvoch oblastiach - segmentácia scény s mnoho objektami ale s ostrými hranicami, napríklad ulica s cieľom rozpoznávať ľudské postavy a segmentácia obrazu oblohy s objektami jedného druhu ale s nejasnými hranicami a s cieľom klasifikácie typu oblačnosti. V prvej aplikácii použite algoritmy založené na multifokálnom stereoobraze a v druhom experimentujte s rôznymi farebnými modelmi.', 1);
INSERT INTO projects VALUES (373, 'ZP', 40, NULL, 365, '2005/2006', 'Objektovo relačné mapre pre jazyk JAVA', 'Objektovo relačné mapre pre jazyk JAVA', 'Naštudujte princípy a charakteristiky Objektovo-Relačných maprov vo všeobecnosti. Analyzujte existujúce O–R mapre pre programovací jazyk Java. Naštudujte podrobnosti pre Vami vybrané O-R mapre (min. 2) pre jazyk Java. S využitím vybraných O-R maprov vytvorte jednoduchú databázovú aplikáciu, resp. aplikácie na spoločnom základe. Vybrané mapre porovnajte s využitím osobných skúseností získaných pri vytváraní aplikácie/aplikácií.', 'Naštudujte princípy a charakteristiky Objektovo-Relačných maprov vo všeobecnosti. Analyzujte existujúce O–R mapre pre programovací jazyk Java. Naštudujte podrobnosti pre Vami vybrané O-R mapre (min. 2) pre jazyk Java. S využitím vybraných O-R maprov vytvorte jednoduchú databázovú aplikáciu, resp. aplikácie na spoločnom základe. Vybrané mapre porovnajte s využitím osobných skúseností získaných pri vytváraní aplikácie/aplikácií.', 1);
INSERT INTO projects VALUES (374, 'ZP', 382, NULL, 366, '2005/2006', 'Ako chodiť do baru?', 'Ako chodiť do baru?', 'Cieľom projektu je riešiť problém obmedzenej racionality na príklade návštevy baru.
Bar  “El Farol” v Santa Fe každú sobotu večer uvádza írsku hudbu. Do baru sa zmestí  asi 60 ľudí, pričom počet celkových záujemcov je okolo 100 ľudí. Na to, aby sa poslucháči sobotňajšieho predstavenia vyhli návalu v bare, si každý hľadá svoju stratégiu (heuristiku), ako na základe predošlých predstavení odhadnúť návštevnosť aktuálneho predstavenia. Poslucháči medzi sebou nekomunikujú o tom, či navštívia, alebo nenavštívia bar.
Cieľom je vytvoriť pomocou genetického programovania agenta, ktorý bude mať čo najlepšie skóre predikcie návštevnosti baru v prípade, že ostatní návštevníci si vytvárajú učiacu sa stratégiu s veľkosťou pamäti tri návštevy dozadu, a s tým, že pokiaľ im konkrétna súčasť stratégie (predpredminule preplnené, predminule prázdno, minule plno)-> choď do baru) nefunguje, s nejakou pravdepodobnosťou ju prehodia na "nechoď do baru".
Literatura:
V. Kvasnička, J. Pospíchal: Informatika pre sociálne vedy. UK Bratislava 2005.
B. Edmonds:  Gossip, Sexual Recombination and the El Farol bar: modelling the emergence of heterogeneity, Journal of Artificial Societies and Social Simulation vol. 2, no. 3, 1999, http://jasss.soc.surrey.ac.uk/2/3/2.html', 'Cieľom projektu je riešiť problém obmedzenej racionality na príklade návštevy baru.
Bar  “El Farol” v Santa Fe každú sobotu večer uvádza írsku hudbu. Do baru sa zmestí  asi 60 ľudí, pričom počet celkových záujemcov je okolo 100 ľudí. Na to, aby sa poslucháči sobotňajšieho predstavenia vyhli návalu v bare, si každý hľadá svoju stratégiu (heuristiku), ako na základe predošlých predstavení odhadnúť návštevnosť aktuálneho predstavenia. Poslucháči medzi sebou nekomunikujú o tom, či navštívia, alebo nenavštívia bar.
Cieľom je vytvoriť pomocou genetického programovania agenta, ktorý bude mať čo najlepšie skóre predikcie návštevnosti baru v prípade, že ostatní návštevníci si vytvárajú učiacu sa stratégiu s veľkosťou pamäti tri návštevy dozadu, a s tým, že pokiaľ im konkrétna súčasť stratégie (predpredminule preplnené, predminule prázdno, minule plno)-> choď do baru) nefunguje, s nejakou pravdepodobnosťou ju prehodia na "nechoď do baru".
Literatura:
V. Kvasnička, J. Pospíchal: Informatika pre sociálne vedy. UK Bratislava 2005.
B. Edmonds:  Gossip, Sexual Recombination and the El Farol bar: modelling the emergence of heterogeneity, Journal of Artificial Societies and Social Simulation vol. 2, no. 3, 1999, http://jasss.soc.surrey.ac.uk/2/3/2.html', 1);
INSERT INTO projects VALUES (375, 'ZP', 43, NULL, 368, '2005/2006', 'Použitie evolučných algoritmov na riešenie astrofyzikálneho problému', 'Použitie evolučných algoritmov na riešenie astrofyzikálneho problému', 'Navrhnite a implementujte algoritmus na riešenie problému hľadania pravých anomálií pri výpočte optimálneho prechodu medzi orbitami. Použite evolučný prístup, ktorý porovnajte s existujúcim analytickým riešením.
', 'Navrhnite a implementujte algoritmus na riešenie problému hľadania pravých anomálií pri výpočte optimálneho prechodu medzi orbitami. Použite evolučný prístup, ktorý porovnajte s existujúcim analytickým riešením.
', 1);
INSERT INTO projects VALUES (376, 'ZP', 382, NULL, 369, '2005/2006', 'Mravci v bare', 'Mravci v bare', 'Cieľom projektu je riešiť problém obmedzenej racionality na príklade návštevy baru pomocou prístupu kolónie mravcov.
Bar  “El Farol” v Santa Fe každú sobotu večer uvádza írsku hudbu. Do baru sa zmestí  asi 60 ľudí, pričom počet celkových záujemcov je okolo 100 ľudí. Na to, aby sa poslucháči sobotňajšieho predstavenia vyhli návalu v bare, si každý hľadá svoju stratégiu (heuristiku), ako na základe predošlých predstavení odhadnúť návštevnosť aktuálneho predstavenia. Poslucháči medzi sebou nekomunikujú o tom, či navštívia, alebo nenavštívia bar.
Cieľom je vytvoriť pomocou ant colony optimisation populáciu agentov, ktorá bude mať čo najlepšie skóre predikcie návštevnosti baru. Jednotlivé
body, cez ktoré sa mravci budú pohybovať, budú tvoriť prvky stratégie (predpredminule preplnené, predminule prázdno, minule plno)-> choď do baru) .
Literatura:
V. Kvasnička, J. Pospíchal: Informatika pre sociálne vedy. UK Bratislava 2005.
Informácie o ant colony optimalizácii na www http://iridia.ulb.ac.be/~mdorigo/ACO/publications.html
', 'Cieľom projektu je riešiť problém obmedzenej racionality na príklade návštevy baru pomocou prístupu kolónie mravcov.
Bar  “El Farol” v Santa Fe každú sobotu večer uvádza írsku hudbu. Do baru sa zmestí  asi 60 ľudí, pričom počet celkových záujemcov je okolo 100 ľudí. Na to, aby sa poslucháči sobotňajšieho predstavenia vyhli návalu v bare, si každý hľadá svoju stratégiu (heuristiku), ako na základe predošlých predstavení odhadnúť návštevnosť aktuálneho predstavenia. Poslucháči medzi sebou nekomunikujú o tom, či navštívia, alebo nenavštívia bar.
Cieľom je vytvoriť pomocou ant colony optimisation populáciu agentov, ktorá bude mať čo najlepšie skóre predikcie návštevnosti baru. Jednotlivé
body, cez ktoré sa mravci budú pohybovať, budú tvoriť prvky stratégie (predpredminule preplnené, predminule prázdno, minule plno)-> choď do baru) .
Literatura:
V. Kvasnička, J. Pospíchal: Informatika pre sociálne vedy. UK Bratislava 2005.
Informácie o ant colony optimalizácii na www http://iridia.ulb.ac.be/~mdorigo/ACO/publications.html
', 1);
INSERT INTO projects VALUES (377, 'ZP', 35, NULL, 370, '2005/2006', 'Interpret lambda-výrazov', 'Interpret lambda-výrazov', 'Vašou úlohou bude naštudovať lambda-kalkulus a vytvoriť program, ktorý bude schopný interpretovať lambda-výrazy. Z určitého pohľadu môžeme lambda-kalkulus považovať za programovací jazyk. Jedná sa o úplný programovací jazykâ€”umožňuje nám opísať ľubovoľný výpočet. Jedná sa (z pohľadu sémantiky) o jednoduchý programovací jazyk. Je ho možné kompletne opísať na niekoľko málo stranách. Vďaka tejto jednoduchosti bude možné pomerne ľahko vytvoriť príslušný interpret schopný interpretovať programy napísané v tomto jazykuâ€”lambda-výrazy. 

Výstupom tohto projektu by mal byť program schopný redukovať (vyhodnotiť) ľubovoľný lambda-výraz do normálnej formy (v ktorej už nie je možné robiť žiadne ďalšie redukcie), ak zadaný lambda-výraz má normálnu formu. Váš program by mal vedieť zobraziť jednotlivé kroky redukcie (vyhodnocovania) tak ako ten program postupoval od zadaného lambda-výrazu až k výsledku. Tiež zvážte užitočnosť tzv. „syntactic-suggar“ konštrukcií, ktoré v určitých prípadoch sprehľadňujú opis dát a opis výpočtu a je ich možné používať namiesto surových lambda-výrazov. Tie, ktoré uznáte za užitočné, zahrňte do svojho jazyka.
', 'Vašou úlohou bude naštudovať lambda-kalkulus a vytvoriť program, ktorý bude schopný interpretovať lambda-výrazy. Z určitého pohľadu môžeme lambda-kalkulus považovať za programovací jazyk. Jedná sa o úplný programovací jazykâ€”umožňuje nám opísať ľubovoľný výpočet. Jedná sa (z pohľadu sémantiky) o jednoduchý programovací jazyk. Je ho možné kompletne opísať na niekoľko málo stranách. Vďaka tejto jednoduchosti bude možné pomerne ľahko vytvoriť príslušný interpret schopný interpretovať programy napísané v tomto jazykuâ€”lambda-výrazy. 

Výstupom tohto projektu by mal byť program schopný redukovať (vyhodnotiť) ľubovoľný lambda-výraz do normálnej formy (v ktorej už nie je možné robiť žiadne ďalšie redukcie), ak zadaný lambda-výraz má normálnu formu. Váš program by mal vedieť zobraziť jednotlivé kroky redukcie (vyhodnocovania) tak ako ten program postupoval od zadaného lambda-výrazu až k výsledku. Tiež zvážte užitočnosť tzv. „syntactic-suggar“ konštrukcií, ktoré v určitých prípadoch sprehľadňujú opis dát a opis výpočtu a je ich možné používať namiesto surových lambda-výrazov. Tie, ktoré uznáte za užitočné, zahrňte do svojho jazyka.
', 1);
INSERT INTO projects VALUES (378, 'ZP', 375, NULL, 373, '2005/2006', 'Demonštračné príklady sieťovej komunikácie', 'Demonštračné príklady sieťovej komunikácie', 'Analyzujte systémy na podporu výučby počítačových sietí. Navrhnite a implementujte vybrané praktické úlohy - ukážky sieťovej komunikácie v TCP/IP sieťach. Pre jednotlivé demonštračné úlohy spracujte používateľské
príručky.  ', 'Analyzujte systémy na podporu výučby počítačových sietí. Navrhnite a implementujte vybrané praktické úlohy - ukážky sieťovej komunikácie v TCP/IP sieťach. Pre jednotlivé demonštračné úlohy spracujte používateľské
príručky.  ', 0);
INSERT INTO projects VALUES (379, 'ZP', 270, NULL, 376, '2006/2007', 'Vytvorenie webovej aplikácie na spracovanie publikačnej činnosti pracoviska', 'Vytvorenie webovej aplikácie na spracovanie publikačnej činnosti pracoviska', 'Spôsob spracovania informácií, ktoré ponúka súčasný web je veľmi výhodný pre zadávanie, evidenciu, spracovanie a archiváciu rôznych typov údajov, ako napr. publikačnej činnosti pracoviska. Analyzujte prístupy v súčasných systémoch pre spracovanie údajov podobného typu. Preskúmajte, ktoré nástroje sú pre aplikácie tohoto druhu najvhodnejšie. Navrhnite systém, ktorý bude realizovať distribuované zadávanie publikácií do databázy pracoviska a umožní nad ňou realizovať bežné operácie, ako je výber podľa istých kritérií, triedenie, atď. Navrhnutý systém implementujte a experimentálne overte na zozname publikačnej činnosti FIIT STU.', 'Spôsob spracovania informácií, ktoré ponúka súčasný web je veľmi výhodný pre zadávanie, evidenciu, spracovanie a archiváciu rôznych typov údajov, ako napr. publikačnej činnosti pracoviska. Analyzujte prístupy v súčasných systémoch pre spracovanie údajov podobného typu. Preskúmajte, ktoré nástroje sú pre aplikácie tohoto druhu najvhodnejšie. Navrhnite systém, ktorý bude realizovať distribuované zadávanie publikácií do databázy pracoviska a umožní nad ňou realizovať bežné operácie, ako je výber podľa istých kritérií, triedenie, atď. Navrhnutý systém implementujte a experimentálne overte na zozname publikačnej činnosti FIIT STU.', 1);
INSERT INTO projects VALUES (380, 'ZP', 298, NULL, 377, '2005/2006', 'Generátor konfigurácií pre Cisco smerovače', 'Generátor konfigurácií pre Cisco smerovače', 'Analyzujte syntax príkazov pre konfiguráciu Cisco smerovačov (IOS). Navrhnite a implementujte programový systém, generujúci takúto konfiguráciu z neformálneho opisu vyžadovaného správania sa smerovača. Vstupná špecifikácia bude napr. v tvare obrázku, definujúcom vzťahy a vlastnosti jednotlivých prepojených smerovačov. Výstupný súbor bude obsahovať konfiguračné príkazy podobne, ako sú uvedené na konzole smerovača pri výpise konfigurácie (príkaz sh run). ', 'Analyzujte syntax príkazov pre konfiguráciu Cisco smerovačov (IOS). Navrhnite a implementujte programový systém, generujúci takúto konfiguráciu z neformálneho opisu vyžadovaného správania sa smerovača. Vstupná špecifikácia bude napr. v tvare obrázku, definujúcom vzťahy a vlastnosti jednotlivých prepojených smerovačov. Výstupný súbor bude obsahovať konfiguračné príkazy podobne, ako sú uvedené na konzole smerovača pri výpise konfigurácie (príkaz sh run). ', 0);
INSERT INTO projects VALUES (381, 'ZP', 396, 358, 384, '2004/2005', 'Šifrátor na báze kvantovej kryptografie', 'Cipher device based on quantum cryptography.', 'Analyzujte možnosti praktickej realizácie získania náhodnej postupnosti bitov technikou kvantovej kryptografie vzhľadom na technické vybavenie na FEI STU. Navrhnite technickú realizáciu takéhoto zariadenia a implementujte jeho softvérovú simuláciu. Funkčnosť zariadenia overte simuláciou.', 'Analyzujte možnosti praktickej realizácie získania náhodnej postupnosti bitov technikou kvantovej kryptografie vzhľadom na technické vybavenie na FEI STU. Navrhnite technickú realizáciu takéhoto zariadenia a implementujte jeho softvérovú simuláciu. Funkčnosť zariadenia overte simuláciou.', 1);
INSERT INTO projects VALUES (382, 'ZP', 20, NULL, 395, '2002/2003', 'Trénovanie rekurentných neurónových sietí algoritmom spätného šírenia v čase (BPTT – Backpropagation Through Time)', 'Training recurrent neural networks using error backpropagation through time', NULL, NULL, 1);
INSERT INTO projects VALUES (383, 'DP', 20, NULL, 395, '2003/2004', 'Trénovanie neurónových sietí pomocou duálnych Kalmanových filtrov', 'Training of neural networks using dual Kalman filters', NULL, NULL, 1);
INSERT INTO projects VALUES (384, 'DP', 419, NULL, 402, '2004/2005', 'Bohusov projekt', 'Bohusov projekt', NULL, NULL, 1);
INSERT INTO projects VALUES (385, 'ZP', 517, NULL, 405, '2003/2004', 'Simulátor abstraktného počítača RAM', 'Random Access Machine Simulator', 'Analyzujte, navrhnite a implemetnujte simulátor abstraktného počítača Random Access Machine (RAM). Postupujte tak, ako pri vytváraní kompilátora pre nejaký programovací jazyk. Vytvorený simulátor overte', 'Analyzujte, navrhnite a implemetnujte simulátor abstraktného počítača Random Access Machine (RAM). Postupujte tak, ako pri vytváraní kompilátora pre nejaký programovací jazyk. Vytvorený simulátor overte', 1);
INSERT INTO projects VALUES (386, 'DP', 690, NULL, 405, '2005/2006', 'Internet ako sieť malého sveta', 'Internet ako sieť malého sveta', NULL, NULL, 1);
INSERT INTO projects VALUES (387, 'DP', 10, NULL, 406, '2004/2005', 'Simulovaný robotický futbal - automatizované učenie', 'Simulovaný robotický futbal - automatizované učenie', NULL, NULL, 1);
INSERT INTO projects VALUES (388, 'ZP', 342, NULL, 407, '2004/2005', 'Prostriedky pre podporu výučby predmetu ASP.', 'Prostriedky pre podporu výučby predmetu ASP.', 'Analyzujte možnosti technických a programových prostriedkov pre podporu vyučovania predmetu Assemblery  a systémové programovanie. Navrhnite vhodnú zostavu technických a programových prostriedkov použiteľných pre podporu výučby ASP v aplikácii s počítačom typu PC. Zrealizujte vybranú časť prototypu navrhnutých technických a programových prostriedkov.', 'Analyzujte možnosti technických a programových prostriedkov pre podporu vyučovania predmetu Assemblery  a systémové programovanie. Navrhnite vhodnú zostavu technických a programových prostriedkov použiteľných pre podporu výučby ASP v aplikácii s počítačom typu PC. Zrealizujte vybranú časť prototypu navrhnutých technických a programových prostriedkov.', 0);
INSERT INTO projects VALUES (389, 'ZP', 294, NULL, 408, '2003/2004', 'Aplikácia obohatenej skutočnosti pri virtuálnych prehliadkach architektúry', 'Augmented Reality Aplication in Virtual Presentations of Architecture', 'Urobte rešerš, výber a analýzu možností aplikácie programového systému AR Toolkit  (zdrojový kód, projekt a  existujúca bežiaca verzia v prostredí MS Visual C a OpenGl bude k dispozícii) pre virtuálnu prhliadku   architektonických pamiatok. Implementujte jednoduchú aplikáciu tohto nástroja v spojení s VRML na vybranú   časť starej Bratislavy (podklady budú k dispozícii).', 'Urobte rešerš, výber a analýzu možností aplikácie programového systému AR Toolkit  (zdrojový kód, projekt a  existujúca bežiaca verzia v prostredí MS Visual C a OpenGl bude k dispozícii) pre virtuálnu prhliadku   architektonických pamiatok. Implementujte jednoduchú aplikáciu tohto nástroja v spojení s VRML na vybranú   časť starej Bratislavy (podklady budú k dispozícii).', 1);
INSERT INTO projects VALUES (390, 'DP', 27, NULL, 408, '2004/2005', 'Tlačené dokumenty s virtuálnymi ilustráciami', 'Tlačené dokumenty s virtuálnymi ilustráciami', NULL, NULL, 1);
INSERT INTO projects VALUES (391, 'DP', 579, NULL, 410, '2003/2004', 'Dištančné vzdelávania a virtuálna univerzita – testovanie vedomostí', 'Dištančné vzdelávania a virtuálna univerzita – testovanie vedomostí', NULL, NULL, 1);
INSERT INTO projects VALUES (392, 'DP', 412, NULL, 411, '2004/2005', 'Možnosti ochrany prístupu do informačno-komunikačnej infraštruktúry Slovenskej technickej univerzity', 'Possibilities of protection of access to informational-communicational infrastructure of Slovak University of Technology', NULL, NULL, 0);
INSERT INTO projects VALUES (393, 'ZP', 660, NULL, 413, '2004/2005', 'Adaptívny web a výučba programovania', 'Adaptive hypermedia and courses of programming', 'Pre vzdelávanie je veľmi výhodné využiť ako prezentačné médium Internet (resp. web) najmä vďaka jeho dostupnosti. Aby sme dosiahli čo najvyššiu efektívnosť učenia prostredníctvom Internetu, je dôležté, aby sa výučbový systém dokázal prispôsobovať jednotlivým študentom, resp. skupinám študentov. Skúmajte vlastnosti adaptívnych systémov pre vzdelávanie, ktoré ako prezentačné médium využívajú Internet (resp. web). Vyhodnoťte využitie existujúceho otvoreného systému AHA! vydaného pod licenciou GNU Public License 2.0 pre výučbu programovania (systém AHA! je vyvinutý modernými technológiami – Java SDK 1.4, Tomcat web server, XML a ďalšie a je dostupný na adrese http://aha.win.tue.nl). Navrhnite doménový model pre oblasť programovania a tiež model používateľa tak, aby sa systém dal využiť v predmetoch, kde sa vyučujú základy programovania (napr. Algoritmizácia a programovanie, Funkcionálne a logické programovanie). Navrhnuté riešenie experimentálne overte.
', 'Pre vzdelávanie je veľmi výhodné využiť ako prezentačné médium Internet (resp. web) najmä vďaka jeho dostupnosti. Aby sme dosiahli čo najvyššiu efektívnosť učenia prostredníctvom Internetu, je dôležté, aby sa výučbový systém dokázal prispôsobovať jednotlivým študentom, resp. skupinám študentov. Skúmajte vlastnosti adaptívnych systémov pre vzdelávanie, ktoré ako prezentačné médium využívajú Internet (resp. web). Vyhodnoťte využitie existujúceho otvoreného systému AHA! vydaného pod licenciou GNU Public License 2.0 pre výučbu programovania (systém AHA! je vyvinutý modernými technológiami – Java SDK 1.4, Tomcat web server, XML a ďalšie a je dostupný na adrese http://aha.win.tue.nl). Navrhnite doménový model pre oblasť programovania a tiež model používateľa tak, aby sa systém dal využiť v predmetoch, kde sa vyučujú základy programovania (napr. Algoritmizácia a programovanie, Funkcionálne a logické programovanie). Navrhnuté riešenie experimentálne overte.
', 1);
INSERT INTO projects VALUES (394, 'DP', 437, NULL, 413, '2005/2006', 'Odhaľovanie webových stránok so zaujímavou informáciou vo webe s významom', 'Odhaľovanie webových stránok so zaujímavou informáciou vo webe s významom', NULL, NULL, 4);
INSERT INTO projects VALUES (395, 'ZP', 98, NULL, 414, '2002/2003', 'Jazyk PERL', 'PERL Programming Language', NULL, NULL, 1);
INSERT INTO projects VALUES (396, 'DP', 704, NULL, 414, '2003/2004', 'Diskusné fórum pre systém Virtuálnej univerzity', 'Discussion forum for system of Virtual University', NULL, NULL, 1);
INSERT INTO projects VALUES (397, 'DP', 299, NULL, 415, '2005/2006', 'Jazyk ako nástroj špecifikácie ', 'Jazyk ako nástroj špecifikácie ', NULL, NULL, 1);
INSERT INTO projects VALUES (398, 'ZP', 655, NULL, 415, '2003/2004', 'Generátor symbolických postupností pre neurónové siete', 'Symbol sequence generator for neural networks', 'Pri trénovaní a testovaní rekurentných sietí vznika potreba spracúvať vstupy s časopriestorovou štruktúrou, ako sú napríklad časové postupnosti symbolov.  Na ich generovanie sa používajú formalizmy slúžiace na opis jednotlivých tried gramatík (regulárne, bezkontextové, kontextové gramatiky), ktoré sú rozšírené napríklad o pravdepodobnosti aplikovania odvodzovacích pravidiel.
Navrhnite a vytvorte nástroj, ktorý by umožnil definovanie abecedy a gramatických pravidiel s pravdepodobnosťami pre generovanie symbolických postupností. Súčasťou nástroja by mala byť aj štatistická analýza vytvorenej postupnosti, t.j. napríklad určenie entropie daného generátora s ohľadom na predikciu nasledujúceho symbolu, stanovenie prechodových pravdepodobností po danej sekvencii symbolov a pod. Vytvorené riešenie overte na vami navrhnutých a vytvorených postupnostiach.', 'Pri trénovaní a testovaní rekurentných sietí vznika potreba spracúvať vstupy s časopriestorovou štruktúrou, ako sú napríklad časové postupnosti symbolov.  Na ich generovanie sa používajú formalizmy slúžiace na opis jednotlivých tried gramatík (regulárne, bezkontextové, kontextové gramatiky), ktoré sú rozšírené napríklad o pravdepodobnosti aplikovania odvodzovacích pravidiel.
Navrhnite a vytvorte nástroj, ktorý by umožnil definovanie abecedy a gramatických pravidiel s pravdepodobnosťami pre generovanie symbolických postupností. Súčasťou nástroja by mala byť aj štatistická analýza vytvorenej postupnosti, t.j. napríklad určenie entropie daného generátora s ohľadom na predikciu nasledujúceho symbolu, stanovenie prechodových pravdepodobností po danej sekvencii symbolov a pod. Vytvorené riešenie overte na vami navrhnutých a vytvorených postupnostiach.', 1);
INSERT INTO projects VALUES (399, 'DP', 298, NULL, 416, '2005/2006', 'Podpora dištančného vzdelávania na regionálnej Cisco akadémii', 'Podpora dištančného vzdelávania na regionálnej Cisco akadémii', NULL, NULL, 0);
INSERT INTO projects VALUES (400, 'ZP', 98, NULL, 416, '2003/2004', 'Systém pre odovzdávanie študentských prác prostredníctvom Internetu', 'System for dispatching of student works through Internet', 'Analyzujte problematiku zberu a vyhodnocovania informácií. Analyzujte možnosti implementačných prostriedkov vhodných pre takéto typy aplikácií. Posúďte možnosti PHP a jeho vývojového a ladiaceho prostredia ako prostriedku pre tvorbu webovských aplikácií. Na základe analýzy problému navrhnite a vytvorte aplikáciu vhodnú pre systém odovzdávania prác prostredníctvom internetu.', 'Analyzujte problematiku zberu a vyhodnocovania informácií. Analyzujte možnosti implementačných prostriedkov vhodných pre takéto typy aplikácií. Posúďte možnosti PHP a jeho vývojového a ladiaceho prostredia ako prostriedku pre tvorbu webovských aplikácií. Na základe analýzy problému navrhnite a vytvorte aplikáciu vhodnú pre systém odovzdávania prác prostredníctvom internetu.', 1);
INSERT INTO projects VALUES (401, 'ZP', 357, NULL, 418, '2005/2006', 'Podpora výučby Počítačových sietí', 'Podpora výučby Počítačových sietí', 'Analyzujte súčasné metódy výučby predmetu Počítačové siete na popredných svetových univerzitách.
Navrhnite a spracujte materiál pre podporu teórie a praktických cvičení s
dôrazom na praktické cvičenia.
Súčasťou práce je aj spôsob overenia praktických cvičení, napr.
debugy/konfigy a pod.', 'Analyzujte súčasné metódy výučby predmetu Počítačové siete na popredných svetových univerzitách.
Navrhnite a spracujte materiál pre podporu teórie a praktických cvičení s
dôrazom na praktické cvičenia.
Súčasťou práce je aj spôsob overenia praktických cvičení, napr.
debugy/konfigy a pod.', 0);
INSERT INTO projects VALUES (402, 'ZP', 579, NULL, 420, '2006/2007', 'Systém pre správu webových stránok - administrátor', 'Systém pre správu webových stránok - administrátor', 'Cieľom projektu je vytvorenie prostredia, ktoré umožní spravovanie webových stránok. Analyzujte existujúce systémy podobného charakteru z pohľadu administátora a vlastností prostredia, v ktorom bude vytváraný systém.  Navrhnite štruktúru použitej databázy, štruktúru obrazoviek pre administrátora, grafické prvky a štýly. Následne implementujte kľúčové časti systému a použiteľnosť overte na vybranej množine stránok používaných v pedagogike FIIT', 'Cieľom projektu je vytvorenie prostredia, ktoré umožní spravovanie webových stránok. Analyzujte existujúce systémy podobného charakteru z pohľadu administátora a vlastností prostredia, v ktorom bude vytváraný systém.  Navrhnite štruktúru použitej databázy, štruktúru obrazoviek pre administrátora, grafické prvky a štýly. Následne implementujte kľúčové časti systému a použiteľnosť overte na vybranej množine stránok používaných v pedagogike FIIT', 1);
INSERT INTO projects VALUES (403, 'DP', 250, NULL, 421, '2004/2005', 'Správanie sa finančného trhu vzhľadom na neočakávané zmeny', 'PATTERN OF FINANCIAL MARKET CONSIDERING UNEXPECTED FLUCTION', NULL, NULL, 3);
INSERT INTO projects VALUES (404, 'ZP', 297, NULL, 423, '2005/2006', 'Simulátor toku strojových inštrukcií v sieti Internet', 'Simulátor toku strojových inštrukcií v sieti Internet', 'Analyzujte možnosti a prostriedky na simuláciu definovanej inštrukčnej sady strojových inštrukcií. Vytvorte simulačné prostredie, v ktorom názorne zobrazte procesy a stavy počas vykonávania inštrukcie daného programu pre zvolený typ procesora. Simulátor  pripravte na prezentáciu vo forme web aplikácie.
', 'Analyzujte možnosti a prostriedky na simuláciu definovanej inštrukčnej sady strojových inštrukcií. Vytvorte simulačné prostredie, v ktorom názorne zobrazte procesy a stavy počas vykonávania inštrukcie daného programu pre zvolený typ procesora. Simulátor  pripravte na prezentáciu vo forme web aplikácie.
', 1);
INSERT INTO projects VALUES (405, 'ZP', 294, NULL, 424, '2003/2004', 'Prostredie pre vnorenú virtuálnu realitu CAVE', 'Prostredie pre vnorenú virtuálnu realitu CAVE', 'Urobte prehľad existujúcich riešení prostredia pre vnorenú virtuálnu realitu typu CAVE (zadná projekcia syntetického obrazu na jednu až šesť stien). Realizujte zjednodušený funkčný model takéhoto prostredia s použitím grafických API ako aj VRML, ktorý by slúžil pre pedagogické účely ako aj na základné experimentovanie ako demonštrácie možností aplikácií takéhoto prostredia. Demonštrujte funkciu modelu na jednoduchej scéne naprogramovanej pomocou API OpenGl, Open Inventor alebo VRML ', 'Urobte prehľad existujúcich riešení prostredia pre vnorenú virtuálnu realitu typu CAVE (zadná projekcia syntetického obrazu na jednu až šesť stien). Realizujte zjednodušený funkčný model takéhoto prostredia s použitím grafických API ako aj VRML, ktorý by slúžil pre pedagogické účely ako aj na základné experimentovanie ako demonštrácie možností aplikácií takéhoto prostredia. Demonštrujte funkciu modelu na jednoduchej scéne naprogramovanej pomocou API OpenGl, Open Inventor alebo VRML ', 1);
INSERT INTO projects VALUES (406, 'DP', 579, NULL, 424, '2005/2006', 'Využitie znalostí v tvorbe plánov (rozvrhov)', 'Application of knowledge in timetabling / scheduling', NULL, NULL, 1);
INSERT INTO projects VALUES (407, 'DP', 359, NULL, 425, '2004/2005', 'Programová podpora simulácie vybraných meraní na elektrických strojoch', 'Programová podpora simulácie vybraných meraní na elektrických strojoch', NULL, NULL, 0);
INSERT INTO projects VALUES (408, 'DP', 260, NULL, 426, '2005/2006', 'Autentifikačné centrum biometrických údajov', 'Authentication centre of biometric data', NULL, NULL, 1);
INSERT INTO projects VALUES (409, 'ZP', 98, NULL, 426, '2003/2004', 'Systém pre odovzdávanie študentských prác prostredníctvom Internetu', 'System for managing student works via Internet', 'Analyzujte problematiku zberu a vyhodnocovania informácií. Analyzujte možnosti implementačných prostriedkov vhodných pre takéto typy aplikácií. Posúďte možnosti Perlu a jeho vývojového a ladiaceho prostredia ako prostriedku pre tvorbu webovských aplikácií. Na základe analýzy problému navrhnite a vytvorte aplikáciu vhodnú pre systém odovzdávania prác prostredníctvom internetu', 'Analyzujte problematiku zberu a vyhodnocovania informácií. Analyzujte možnosti implementačných prostriedkov vhodných pre takéto typy aplikácií. Posúďte možnosti Perlu a jeho vývojového a ladiaceho prostredia ako prostriedku pre tvorbu webovských aplikácií. Na základe analýzy problému navrhnite a vytvorte aplikáciu vhodnú pre systém odovzdávania prác prostredníctvom internetu', 1);
INSERT INTO projects VALUES (410, 'DP', 672, NULL, 427, '2004/2005', 'Jazyk ako sieť malého sveta', 'Jazyk ako sieť malého sveta', NULL, NULL, 1);
INSERT INTO projects VALUES (411, 'ZP', 297, NULL, 428, '2003/2004', 'Vyučovanie v sieti Internet', 'Learning in the Internet Environment', 'Analyzujte nové smery v oblasti výučby a vzdelávania ako dôsledok nových informačných technológií. Zamerajte sa na e-learning paradigmu. Špecifikujte model systému orientovaný pre vyučovanie odborných predmetov a navrhnite  jeho štruktúru , ktorá bude vyhovovať prezentácii v sieti Internet. Navrhnite model v súlade so štandardami modelu e-learning. Systém skúšobne naplňte do štruktúrovaných celkov. Overte  funkčnosť navrhnutého systému. ', 'Analyzujte nové smery v oblasti výučby a vzdelávania ako dôsledok nových informačných technológií. Zamerajte sa na e-learning paradigmu. Špecifikujte model systému orientovaný pre vyučovanie odborných predmetov a navrhnite  jeho štruktúru , ktorá bude vyhovovať prezentácii v sieti Internet. Navrhnite model v súlade so štandardami modelu e-learning. Systém skúšobne naplňte do štruktúrovaných celkov. Overte  funkčnosť navrhnutého systému. ', 1);
INSERT INTO projects VALUES (412, 'DP', 447, NULL, 428, '2004/2005', 'Prezentácia informácií reprezentovaných ontológiou', 'Prezentácia informácií reprezentovaných ontológiou', NULL, NULL, 1);
INSERT INTO projects VALUES (413, 'ZP', 433, NULL, 429, '2002/2003', 'Modelovanie návrhových vzorov', 'Modeling of Design Patterns', NULL, NULL, 1);
INSERT INTO projects VALUES (414, 'DP', 541, NULL, 429, '2004/2005', 'Monitorovanie zdravotného stavu klienta', 'Health state monitoring systems', NULL, NULL, 1);
INSERT INTO projects VALUES (415, 'ZP', 260, NULL, 432, '2003/2004', 'Prostriedky pre heuristické definovanie bezpečnostnej politiky', 'Tools for heuristic definition of security policy', 'Vytvorte nástroj, ktorý umožní sledovať činnosti používateľa v systéme, ktoré sú relevantné z pohľadu definovania bezpečnostnej politiky riadenia prístupu. Príkladom môžu byť súbory, ku ktorým používateľ pristupuje, ich klasifikácia časová (kedy pristupuje, ako často, ...) aj priestorová (umiestenie v súborovom systéme, ...), spôsob prístupu (čítanie, zápis, vykonanie, pridávanie, ...) ako aj sledovanie postupností prístupov. Výstupy nástroja štatisticky spracujte a vytvorte základ profilu používateľa', 'Vytvorte nástroj, ktorý umožní sledovať činnosti používateľa v systéme, ktoré sú relevantné z pohľadu definovania bezpečnostnej politiky riadenia prístupu. Príkladom môžu byť súbory, ku ktorým používateľ pristupuje, ich klasifikácia časová (kedy pristupuje, ako často, ...) aj priestorová (umiestenie v súborovom systéme, ...), spôsob prístupu (čítanie, zápis, vykonanie, pridávanie, ...) ako aj sledovanie postupností prístupov. Výstupy nástroja štatisticky spracujte a vytvorte základ profilu používateľa', 1);
INSERT INTO projects VALUES (416, 'DP', 25, NULL, 432, '2004/2005', 'Neštandardné možnosti komunikácie v TCP/IP sieťach', 'Neštandardné možnosti komunikácie v TCP/IP sieťach', NULL, NULL, 0);
INSERT INTO projects VALUES (417, 'DP', 541, NULL, 434, '2005/2006', 'Systém pre bezpečnú komunikáciu  IS v GPRS sieti', 'A system for secure communication of IS over a GPRS network', NULL, NULL, 1);
INSERT INTO projects VALUES (418, 'ZP', 20, NULL, 434, '2003/2004', 'Simulátor neurónových sietí založených na echo stavoch', 'Simulator of echo state neural networks', 'Medzi nové zaujímavé prístupy v oblasti neurónových sietí patria siete založené na echo stavoch (Echo-State Networks – ESN). Na rozdiel od klasických rekurentných sietí, ktoré je potrebné trénovať, ESN siete využívajú dynamiku náhodne inicializovanej stavovej časti. Cieľom projektu je naštudovať prolematiku sietí založených na echo stavoch a v zvolenom programovacom jazyku vytvoriť simulátor takéhoto typu sietí. Následne je potrebné experimentálne overiť niektoré vlastnosti ESN sietí.', 'Medzi nové zaujímavé prístupy v oblasti neurónových sietí patria siete založené na echo stavoch (Echo-State Networks – ESN). Na rozdiel od klasických rekurentných sietí, ktoré je potrebné trénovať, ESN siete využívajú dynamiku náhodne inicializovanej stavovej časti. Cieľom projektu je naštudovať prolematiku sietí založených na echo stavoch a v zvolenom programovacom jazyku vytvoriť simulátor takéhoto typu sietí. Následne je potrebné experimentálne overiť niektoré vlastnosti ESN sietí.', 1);
INSERT INTO projects VALUES (419, 'DP', 92, 375, 435, '2004/2005', 'Centralizovaná správa používateľov', 'Centralizovaná správa používateľov', NULL, NULL, 0);
INSERT INTO projects VALUES (420, 'ZP', 342, NULL, 438, '2003/2004', 'Programový systém pre návrh riadiacich jednotiek na báze  mikropočítača', 'Control Unit Development Application System on a Microcomputer Basis', 'Analyzujte možnosti využitia existujúcich mikropočítačových modulov na návrh a realizáciu riadiacich jednotiek.  Navrhnite inštrukčný súbor virtuálneho procesora vhodného na realizáciu vybranej triedy riadiacich jednotiek. Navrhnite a zrealizujte vybranú časť prekladača programu  virtuálneho procesora na program v JSI vybraného mikropočítača.
', 'Analyzujte možnosti využitia existujúcich mikropočítačových modulov na návrh a realizáciu riadiacich jednotiek.  Navrhnite inštrukčný súbor virtuálneho procesora vhodného na realizáciu vybranej triedy riadiacich jednotiek. Navrhnite a zrealizujte vybranú časť prekladača programu  virtuálneho procesora na program v JSI vybraného mikropočítača.
', 0);
INSERT INTO projects VALUES (421, 'DP', 298, NULL, 438, '2005/2006', 'Analýza a vyhodnotenie sieťovej komunikácie', 'Analýza a vyhodnotenie sieťovej komunikácie', NULL, NULL, 0);
INSERT INTO projects VALUES (422, 'DP', 690, NULL, 439, '2005/2006', 'Grafovo-teoretický model kolaboratívnych sietí', 'Graph-theoretical model of the collaboration networks', NULL, NULL, 1);
INSERT INTO projects VALUES (423, 'ZP', 272, NULL, 439, '2003/2004', 'Podpora výučby OOP', 'The educational support of the object oriented programming', 'Analyzujte objektovo orientovaný prístup k tvorbe programov a porovnajte existujúce objektovo orientované programovacie jazyky (C++, Java, Eiffel, SmallTalk, â€¦). Navrhnite a implementujte aplikáciu, ktorá bude slúžiť ako pomôcka pri výučbe objektovo orientovaného programovania. Navrhnutý systém naplňte textom s príkladmi zadelených do ucelených celkov. Overte funkčnosť navrhnutého systému', 'Analyzujte objektovo orientovaný prístup k tvorbe programov a porovnajte existujúce objektovo orientované programovacie jazyky (C++, Java, Eiffel, SmallTalk, â€¦). Navrhnite a implementujte aplikáciu, ktorá bude slúžiť ako pomôcka pri výučbe objektovo orientovaného programovania. Navrhnutý systém naplňte textom s príkladmi zadelených do ucelených celkov. Overte funkčnosť navrhnutého systému', 1);
INSERT INTO projects VALUES (424, 'DP', 579, NULL, 440, '2004/2005', 'Využitie multimédií pri filmových súťažiach', 'Využitie multimédií pri filmových súťažiach', NULL, NULL, 1);
INSERT INTO projects VALUES (425, 'DP', 360, NULL, 441, '2004/2005', 'Nedokonalosti v realizácii kombinačných logických obvodov', 'Nedokonalosti v realizácii kombinačných logických obvodov', NULL, NULL, 0);
INSERT INTO projects VALUES (426, 'DP', 569, NULL, 442, '2005/2006', 'Modelovanie, špecifikácia a verifikácia logických obvodov', 'Modeling, specification and verification of logic circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (427, 'ZP', 294, NULL, 442, '2003/2004', 'Program pre simulovanie a zobrazovanie hôr', 'Program for simulation and visualization of mountains', 'Vytvorte simulátor hôr, ktorý rešpektuje podstatné horotvorné procesy ako je tektonika, zvetravanie atď. V simulačnom programe použite známe metódy generovania dát hôr (fraktály) ale len ako doplnok ku globálnym procesom. Pomocou animácií demonštrujte hlavné charakteristiky geomorfných procesov na globálnej a lokálnej úrovni. Výsledný profil vizualizujte s vyšším stupňom realistického zobrazenia, zatiaľ čo geofyzikálne procesy stačí zobraziť schematicky.', 'Vytvorte simulátor hôr, ktorý rešpektuje podstatné horotvorné procesy ako je tektonika, zvetravanie atď. V simulačnom programe použite známe metódy generovania dát hôr (fraktály) ale len ako doplnok ku globálnym procesom. Pomocou animácií demonštrujte hlavné charakteristiky geomorfných procesov na globálnej a lokálnej úrovni. Výsledný profil vizualizujte s vyšším stupňom realistického zobrazenia, zatiaľ čo geofyzikálne procesy stačí zobraziť schematicky.', 1);
INSERT INTO projects VALUES (428, 'DP', 358, NULL, 443, '2005/2006', 'Presadzovanie bezpečnostnej politiky v databázach', 'Enforcement of security policies in databases', NULL, NULL, 0);
INSERT INTO projects VALUES (429, 'ZP', 541, NULL, 443, '2003/2004', 'Zálohovanie a obnova dát v databázach', 'Backup & recovery in relation database management system Oracle', 'Analyzujte metódy a prostriedky zálohovania a obnovy dát v relačných databázových systémoch. Definujte výhody a nedostatky zálohovania a obnovy dát v DBS Oracle. Navrhnite možné metódy zlepšenia a rozšírenia funkcií zálohovania a obnovy dát. Vybraté  metódy implementujte v prostredí Oracle. Funkčnosť systému demonštrujte na vybratom príklade.', 'Analyzujte metódy a prostriedky zálohovania a obnovy dát v relačných databázových systémoch. Definujte výhody a nedostatky zálohovania a obnovy dát v DBS Oracle. Navrhnite možné metódy zlepšenia a rozšírenia funkcií zálohovania a obnovy dát. Vybraté  metódy implementujte v prostredí Oracle. Funkčnosť systému demonštrujte na vybratom príklade.', 0);
INSERT INTO projects VALUES (430, 'ZP', 579, NULL, 444, '2003/2004', 'Multimediálne informácie v regionálnom IS - 1', 'Multimedia information in regional information system - 1', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie existujúceho základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe obrázkov, grafov, animácií. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb KIVT.', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie existujúceho základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe obrázkov, grafov, animácií. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb KIVT.', 1);
INSERT INTO projects VALUES (431, 'DP', 569, NULL, 444, '2005/2006', 'Modelovanie a implementácia znalosti agenta v multiagentovom prostredí', 'Modelovanie a implementácia znalosti agenta v multiagentovom prostredí', NULL, NULL, 0);
INSERT INTO projects VALUES (432, 'ZP', 660, NULL, 446, '2003/2004', 'Adaptívna prezentácia informácií o univerzitných predmetoch', 'Adaptive presentation of information about university courses', 'Analyzujte metódy a prostriedky adaptívnej prezentácie a navigácie v hypertextových dokumentoch. Zamerajte sa pri tom na skúmanie možností využitia meniaceho sa času pri prezentácii informácií o univerzitných predmetoch. Skúmajte aspekty súvisiace s vhodnosťou jednotlivých techník prispôsobovania pre tento účel. Vychádzajte pri tom z existujúceho prototypu časovo závislej prezentácie vytvoreného v jazyku Java (prvýkrát použitý v akademickom roku 2002/2003 v predmete Princípy softvérového inžinierstva). Navrhnite softvérovú aplikáciu, ktorá umožní napĺňanie informačného obsahu takéhoto systému. Ďalej navrhnite modifikácie existujúceho systému tak, aby to odrážalo výsledky analýzy. Navrhnuté riešenie overte implementovaním softvérového prototypu pre vybraný predmet v odbore informatika. ', 'Analyzujte metódy a prostriedky adaptívnej prezentácie a navigácie v hypertextových dokumentoch. Zamerajte sa pri tom na skúmanie možností využitia meniaceho sa času pri prezentácii informácií o univerzitných predmetoch. Skúmajte aspekty súvisiace s vhodnosťou jednotlivých techník prispôsobovania pre tento účel. Vychádzajte pri tom z existujúceho prototypu časovo závislej prezentácie vytvoreného v jazyku Java (prvýkrát použitý v akademickom roku 2002/2003 v predmete Princípy softvérového inžinierstva). Navrhnite softvérovú aplikáciu, ktorá umožní napĺňanie informačného obsahu takéhoto systému. Ďalej navrhnite modifikácie existujúceho systému tak, aby to odrážalo výsledky analýzy. Navrhnuté riešenie overte implementovaním softvérového prototypu pre vybraný predmet v odbore informatika. ', 1);
INSERT INTO projects VALUES (433, 'DP', 660, NULL, 446, '2005/2006', 'Prispôsobovanie prezentácie informácií v elektronickom kurze s využitím vlastností ľudskej pamäte ', 'Prispôsobovanie prezentácie informácií v elektronickom kurze s využitím vlastností ľudskej pamäte ', NULL, NULL, 1);
INSERT INTO projects VALUES (434, 'ZP', 359, NULL, 448, '2003/2004', 'Skladový informačný systém', 'Storage information system', 'Analyzujte, navrhnite a implementujte informačný systém, ktorý bude riadiť skladové hospodárstvo na základe predaného tovaru jednotlivým zákazníkom. Systém má umožňovať prístup k skladovému hospodárstvu z viacerých pracovných staníc, vtvárať zostavy pre nákup tovarov na základe ich zostatkov v klade, vytvárať zostavy vydaného tovaru jednotlivým zákazníkom, generovať štatistiky predajnosti podľa jednotlivých druhov tovaru.', 'Analyzujte, navrhnite a implementujte informačný systém, ktorý bude riadiť skladové hospodárstvo na základe predaného tovaru jednotlivým zákazníkom. Systém má umožňovať prístup k skladovému hospodárstvu z viacerých pracovných staníc, vtvárať zostavy pre nákup tovarov na základe ich zostatkov v klade, vytvárať zostavy vydaného tovaru jednotlivým zákazníkom, generovať štatistiky predajnosti podľa jednotlivých druhov tovaru.', 1);
INSERT INTO projects VALUES (435, 'DP', 359, NULL, 448, '2004/2005', 'Poskytovanie IT služieb a technológií prostredníctvom siete internetu a intranetu. ', 'Poskytovanie IT služieb a technológií prostredníctvom siete internetu a intranetu. ', NULL, NULL, 0);
INSERT INTO projects VALUES (436, 'DP', 670, NULL, 449, '2004/2005', 'Rozhranie Ethernet siete pre signálový procesor', 'Rozhranie Ethernet siete pre signálový procesor', NULL, NULL, 0);
INSERT INTO projects VALUES (437, 'DP', 31, NULL, 450, '2005/2006', 'Prostredie pre modelovanie a simuláciu diskrétnych systémov', 'Toolset for modeling and simulation of discrete systems', NULL, NULL, 1);
INSERT INTO projects VALUES (438, 'ZP', 260, NULL, 450, '2003/2004', 'Vizuálny návrh bezpečnostnej politiky pre systém Medusa DS9', 'Visual design of security policy for Medusa DS9 system', 'Preštudujte bezpečnostný systém Medusa DS9 [1, 2]  z pohľadu mechanizmov, ktoré poskytuje pre definovanie bezpečnostných politík. Navrhnite a vytvorte nástroj pre vizuálny návrh bezpečnostných politík, ktoré je možné implementovať použitím systému Medusa DS9. Úlohu riešte ako modul existujúceho všeobecného nástoja pre definovanie bezpečnostných politík [3].

Odporúčaná literatúra:
[1] Zelem, M., "Integrácia rôznych bezpečnostných politík do OS Linux", Diplomová práca, FEI STU Bratislava, 2001
[2] Pikula, M., "Distribuovaný systém na zvýšenie bezpečnosti heterogénnej počítačovej siete", Diplomová práca, FEI STU Bratislava, 2002
[3] Trebula, R., "Vizuálny návrh bezpečnostnej politiky", Diplomová práca, FEI STU Bratislava, 2003
', 'Preštudujte bezpečnostný systém Medusa DS9 [1, 2]  z pohľadu mechanizmov, ktoré poskytuje pre definovanie bezpečnostných politík. Navrhnite a vytvorte nástroj pre vizuálny návrh bezpečnostných politík, ktoré je možné implementovať použitím systému Medusa DS9. Úlohu riešte ako modul existujúceho všeobecného nástoja pre definovanie bezpečnostných politík [3].

Odporúčaná literatúra:
[1] Zelem, M., "Integrácia rôznych bezpečnostných politík do OS Linux", Diplomová práca, FEI STU Bratislava, 2001
[2] Pikula, M., "Distribuovaný systém na zvýšenie bezpečnosti heterogénnej počítačovej siete", Diplomová práca, FEI STU Bratislava, 2002
[3] Trebula, R., "Vizuálny návrh bezpečnostnej politiky", Diplomová práca, FEI STU Bratislava, 2003
', 1);
INSERT INTO projects VALUES (439, 'DP', 98, NULL, 451, '2004/2005', 'Zber a vyhodnocovanie informácií', 'Zber a vyhodnocovanie informácií', NULL, NULL, 1);
INSERT INTO projects VALUES (440, 'ZP', 541, NULL, 452, '2003/2004', 'Archivačný systém pre manažment projektov', 'Archivačný systém pre manažment projektov', 'Urobte prieskum trhu a analyzujte dostupné archivačné systémy pre manažment projektov. Špecifikujte požadované vlastnosti takéhoto systému.  Navrhnite funkčný model inteligentného archivačného systému pre manažment projektov. Navrhnutý systém implementujte vo vybratom prostredí. Funkčnosť systému demonštrujte na vybratom príklade', 'Urobte prieskum trhu a analyzujte dostupné archivačné systémy pre manažment projektov. Špecifikujte požadované vlastnosti takéhoto systému.  Navrhnite funkčný model inteligentného archivačného systému pre manažment projektov. Navrhnutý systém implementujte vo vybratom prostredí. Funkčnosť systému demonštrujte na vybratom príklade', 1);
INSERT INTO projects VALUES (441, 'DP', 660, NULL, 452, '2005/2006', 'Modelovanie adaptívnych webových systémov', 'Modelovanie adaptívnych webových systémov', NULL, NULL, 1);
INSERT INTO projects VALUES (442, 'DP', 437, NULL, 453, '2005/2006', 'Dekompresia vykonateľných programov', 'Decompression of executable files', NULL, NULL, 1);
INSERT INTO projects VALUES (443, 'ZP', 437, NULL, 453, '2003/2004', 'Rekonštruovanie starnúceho softvéru', 'Refactoring decayed code', 'Softvér starne. Analyzujte prejavy, príčiny a dôsledky tohto javu. Opíšte podrobnejšie problémy spojené s rekonštruovaním softvéru, t.j. procesom menenia návrhu sofvtérového systému pri zachovaní jeho celkového správania. Analyzujte možnosti podpory pri rozpoznávaní potreby rekonštruovania, pri identifikovaní špeciálnej techniky a miesta, kde sa má použiť a pri automatickom vykonaní rekonštrukcie. Zvážte možnosti metaprogramovania pri opise a implementácii rekonštruovania.  Pomenujte prípady výskytov zostarnutej časti v texte programu, ktoré navrhujete rekoštruovať. Navrhnite nástroj, ktorý podporuje softvérového návrhára pri rekonštruovaní. Vaše riešenie experimentálne overte', 'Softvér starne. Analyzujte prejavy, príčiny a dôsledky tohto javu. Opíšte podrobnejšie problémy spojené s rekonštruovaním softvéru, t.j. procesom menenia návrhu sofvtérového systému pri zachovaní jeho celkového správania. Analyzujte možnosti podpory pri rozpoznávaní potreby rekonštruovania, pri identifikovaní špeciálnej techniky a miesta, kde sa má použiť a pri automatickom vykonaní rekonštrukcie. Zvážte možnosti metaprogramovania pri opise a implementácii rekonštruovania.  Pomenujte prípady výskytov zostarnutej časti v texte programu, ktoré navrhujete rekoštruovať. Navrhnite nástroj, ktorý podporuje softvérového návrhára pri rekonštruovaní. Vaše riešenie experimentálne overte', 1);
INSERT INTO projects VALUES (444, 'ZP', 260, NULL, 454, '2003/2004', 'Vizuálny návrh bezpečnostnej politiky pre systém Medusa DS9', 'Vizuálny návrh bezpečnostnej politiky pre systém Medusa DS9', 'Preštudujte bezpečnostný systém Medusa DS9 [1, 2]  z pohľadu mechanizmov, ktoré poskytuje pre definovanie bezpečnostných politík. Navrhnite a vytvorte nástroj pre vizuálny návrh bezpečnostných politík, ktoré je možné implementovať použitím systému Medusa DS9. Úlohu riešte ako modul existujúceho všeobecného nástoja pre definovanie bezpečnostných politík [3].

Odporúčaná literatúra:
[1] Zelem, M., "Integrácia rôznych bezpečnostných politík do OS Linux", Diplomová práca, FEI STU Bratislava, 2001
[2] Pikula, M., "Distribuovaný systém na zvýšenie bezpečnosti heterogénnej počítačovej siete", Diplomová práca, FEI STU Bratislava, 2002
[3] Trebula, R., "Vizuálny návrh bezpečnostnej politiky", Diplomová práca, FEI STU Bratislava, 2003
', 'Preštudujte bezpečnostný systém Medusa DS9 [1, 2]  z pohľadu mechanizmov, ktoré poskytuje pre definovanie bezpečnostných politík. Navrhnite a vytvorte nástroj pre vizuálny návrh bezpečnostných politík, ktoré je možné implementovať použitím systému Medusa DS9. Úlohu riešte ako modul existujúceho všeobecného nástoja pre definovanie bezpečnostných politík [3].

Odporúčaná literatúra:
[1] Zelem, M., "Integrácia rôznych bezpečnostných politík do OS Linux", Diplomová práca, FEI STU Bratislava, 2001
[2] Pikula, M., "Distribuovaný systém na zvýšenie bezpečnosti heterogénnej počítačovej siete", Diplomová práca, FEI STU Bratislava, 2002
[3] Trebula, R., "Vizuálny návrh bezpečnostnej politiky", Diplomová práca, FEI STU Bratislava, 2003
', 1);
INSERT INTO projects VALUES (445, 'DP', 260, NULL, 454, '2004/2005', 'Detekcia neštandardných stavov v operačnom systéme', 'Detekcia neštandardných stavov v operačnom systéme', NULL, NULL, 1);
INSERT INTO projects VALUES (446, 'DP', 445, NULL, 455, '2004/2005', 'Podpora metód a techník adaptívnych hypertextov', 'Podpora metód a techník adaptívnych hypertextov', NULL, NULL, 1);
INSERT INTO projects VALUES (447, 'ZP', 563, NULL, 456, '2005/2006', '24-vstupová prerušovacia karta pre PC', '24-vstupová prerušovacia karta pre PC', 'Navrhnite a zrealizujte 24-vstupovú prerušovaciu kartu pre PC na báze obvodov 8259A. Funkčnosť overte testovacím programom.', 'Navrhnite a zrealizujte 24-vstupovú prerušovaciu kartu pre PC na báze obvodov 8259A. Funkčnosť overte testovacím programom.', 0);
INSERT INTO projects VALUES (448, 'DP', 361, NULL, 457, '2004/2005', 'Plánovací algoritmus  v programovateľných smerovačoch', 'Plánovací algoritmus  v programovateľných smerovačoch', NULL, NULL, 0);
INSERT INTO projects VALUES (449, 'ZP', 24, NULL, 458, '2003/2004', 'Algoritmizácia v príkladoch -  usporadúvanie', 'Algorithms in examples – sorting', 'Analyzujte vybrané algoritmické metódy využívané v databázových systémoch (prehľadávanie a usporadúvanie záznamov)  z hľadiska ich využitia v súčasných softvérových aplikáciách. Porovnajte jednotlivé metódy podľa vybraných kritérií. Spracujte  vybrané algoritmy do množiny  príkladov vo forme  hypertextu, s presne stanovenou štruktúrou. Štruktúra bude odrážať životný cyklus programu a zároveň algoritmy rovnakého typu budú vyhodnocované na reprezentatívnej vzorke údajov a navzájom porovnávané.  Vizualizujte  prezentáciu vykonávania algoritmov', 'Analyzujte vybrané algoritmické metódy využívané v databázových systémoch (prehľadávanie a usporadúvanie záznamov)  z hľadiska ich využitia v súčasných softvérových aplikáciách. Porovnajte jednotlivé metódy podľa vybraných kritérií. Spracujte  vybrané algoritmy do množiny  príkladov vo forme  hypertextu, s presne stanovenou štruktúrou. Štruktúra bude odrážať životný cyklus programu a zároveň algoritmy rovnakého typu budú vyhodnocované na reprezentatívnej vzorke údajov a navzájom porovnávané.  Vizualizujte  prezentáciu vykonávania algoritmov', 1);
INSERT INTO projects VALUES (450, 'DP', 704, NULL, 458, '2005/2006', 'Rozšírenie návrhu a implementácie webovskej reprezentácie pracoviska', 'Rozšírenie návrhu a implementácie webovskej reprezentácie pracoviska', NULL, NULL, 1);
INSERT INTO projects VALUES (451, 'ZP', 579, NULL, 460, '2004/2005', 'Systém na podporu tvorby semestrálnych rozvrhov', 'System for support of making semestral schedules', 'Analyzujte údajové množiny a postupy pri vytváraní semestrálnych rozvrhov a následne navrhnite systém, ktorý by tieto činnosti podporoval. Základné časti návrhu realizujte v podobe prototypu a zaistite nevyhnutnú kompatibilitu s informačným systémom používaným na FIIT.', 'Analyzujte údajové množiny a postupy pri vytváraní semestrálnych rozvrhov a následne navrhnite systém, ktorý by tieto činnosti podporoval. Základné časti návrhu realizujte v podobe prototypu a zaistite nevyhnutnú kompatibilitu s informačným systémom používaným na FIIT.', 1);
INSERT INTO projects VALUES (452, 'DP', 673, 46, 460, '2005/2006', 'Aplikácia OCL v UML profiloch', 'Aplikácia OCL v UML profiloch', NULL, NULL, 1);
INSERT INTO projects VALUES (453, 'DP', 298, NULL, 461, '2005/2006', 'Podpora dištančného vzdelávania - prezentačný modul', 'Podpora dištančného vzdelávania - prezentačný modul', NULL, NULL, 0);
INSERT INTO projects VALUES (454, 'ZP', 298, NULL, 461, '2004/2005', 'Vytvorenie aplikácie vo Visual C++ krok za krokom', 'Dialog based application in Visual C++ step by step', 'Analyzujte spôsob vytváranie aplikácie v prostredí Microsoft Visual Studio pre Visual C++. Navrhnite a vytvorte výučbový systém pre naučenie vytvárania aplikácií v tomto prostredí. Predpokladá sa vytvorenie prezentácie postupu vytvárania aplikácií, ako aj vzorových príkladov.', 'Analyzujte spôsob vytváranie aplikácie v prostredí Microsoft Visual Studio pre Visual C++. Navrhnite a vytvorte výučbový systém pre naučenie vytvárania aplikácií v tomto prostredí. Predpokladá sa vytvorenie prezentácie postupu vytvárania aplikácií, ako aj vzorových príkladov.', 0);
INSERT INTO projects VALUES (455, 'DP', 298, NULL, 462, '2005/2006', 'Podpora dištančného vzdelávania - modul overovania znalostí', 'Podpora dištančného vzdelávania - modul overovania znalostí', NULL, NULL, 0);
INSERT INTO projects VALUES (456, 'ZP', 298, NULL, 462, '2004/2005', 'Multimediálna prezentácia informácií', 'A Multimedia Presentation of Information', 'Analyzujte možnosti multimediálnej prezentácie informácií. Navrhnite a implementujte výučbový systém pre prezentáciu informácií z predmetu Periférne zariadenia – témy 1 až 5. Systém má obsahovať možnosť poskytnúť záujemcovi študijné materiály, ako aj mechanizmy overovania znalostí naštudovaných textov.', 'Analyzujte možnosti multimediálnej prezentácie informácií. Navrhnite a implementujte výučbový systém pre prezentáciu informácií z predmetu Periférne zariadenia – témy 1 až 5. Systém má obsahovať možnosť poskytnúť záujemcovi študijné materiály, ako aj mechanizmy overovania znalostí naštudovaných textov.', 0);
INSERT INTO projects VALUES (457, 'ZP', 541, NULL, 463, '2002/2003', 'Inteligentné spracovanie v distribuovanom systéme', 'Intelligent processing in distributed system', NULL, NULL, 1);
INSERT INTO projects VALUES (458, 'DP', 433, NULL, 463, '2005/2006', 'Asistent v prostredí webu so sémantikou', 'Digital assistant in the semantic web environment', NULL, NULL, 1);
INSERT INTO projects VALUES (459, 'ZP', 563, NULL, 464, '2002/2003', 'Osciloskopická karta pre PC', 'Oscilloscope card for PC', NULL, NULL, 0);
INSERT INTO projects VALUES (460, 'DP', 705, NULL, 464, '2004/2005', 'Automatická syntéza synchrónnych sekvenčných logických obvodov s integrovanými obvodmi 74F298', 'Automatická syntéza synchrónnych sekvenčných logických obvodov s integrovanými obvodmi 74F298', NULL, NULL, 0);
INSERT INTO projects VALUES (461, 'ZP', 24, NULL, 465, '2003/2004', 'Algoritmizácia v príkladoch –abstraktné údajové štruktúry', 'Algorithmization in examples - Abstract data types', 'Analyzujte vybrané abstraktné údajové štruktúry (zoznamy, zásobníky, rady, a grafy, stromy) z hľadiska ich využitia v súčasných softvérových aplikáciách. Spracujte a implementujte ich  množiny  príkladov vo forme  hypertextu, s presne stanovenou štruktúrou. Štruktúra bude odrážať životný cyklus programu.  Vizualizujte  prezentáciu vykonávania príkladov', 'Analyzujte vybrané abstraktné údajové štruktúry (zoznamy, zásobníky, rady, a grafy, stromy) z hľadiska ich využitia v súčasných softvérových aplikáciách. Spracujte a implementujte ich  množiny  príkladov vo forme  hypertextu, s presne stanovenou štruktúrou. Štruktúra bude odrážať životný cyklus programu.  Vizualizujte  prezentáciu vykonávania príkladov', 1);
INSERT INTO projects VALUES (462, 'DP', 566, NULL, 465, '2005/2006', 'Koevolúcia univerzálnej gramatiky ', 'Koevolúcia univerzálnej gramatiky ', NULL, NULL, 1);
INSERT INTO projects VALUES (463, 'ZP', 375, NULL, 466, '2003/2004', 'Systém pre podporu e-vzdelávania', 'Systém pre podporu e-vzdelávania', 'Analyzujte rôzne výučbové systémy, ktoré podporujú učenie sa elektronickou formou. Pri analýze sa zamerajte najmä na metodiku vytvárania obsahovej náplne kurzov e-vzdelávania. Navrhnite a implementujte modulárny programový systém, ktorý poskytne dostatočne univerzálny rámec pre multimediálne spracovanie obsahovej náplne rôznych kurzov. Funkčnosť systému overte vytvorením vybratej časti kurzu podľa požiadaviek inštruktora kurzu. ', 'Analyzujte rôzne výučbové systémy, ktoré podporujú učenie sa elektronickou formou. Pri analýze sa zamerajte najmä na metodiku vytvárania obsahovej náplne kurzov e-vzdelávania. Navrhnite a implementujte modulárny programový systém, ktorý poskytne dostatočne univerzálny rámec pre multimediálne spracovanie obsahovej náplne rôznych kurzov. Funkčnosť systému overte vytvorením vybratej časti kurzu podľa požiadaviek inštruktora kurzu. ', 0);
INSERT INTO projects VALUES (464, 'DP', 670, 563, 466, '2005/2006', 'Operačný systém pre signálový processor', 'Operačný systém pre signálový processor', NULL, NULL, 0);
INSERT INTO projects VALUES (465, 'DP', 704, NULL, 467, '2005/2006', 'Problémovo orientovaný informačný systém ', 'Problem oriented information system', NULL, NULL, 1);
INSERT INTO projects VALUES (466, 'ZP', 704, NULL, 467, '2003/2004', 'Diagnostické vyhodnocovanie CT snímkov', 'Diagnostic evaluation of CT scans', 'Analyzujte možnosti vyhodnocovania CT snímkov, ich kategorizáciu vzhľadom na vhodnú metriku, ktorá môže byť podstatnou informáciou v diagnóze onkologického pacienta. Podstatný problém riešenej témy je: Priestorové   výpočty  o  tumore a  ich  uchovávanie  v DB  diagnóz  v  tvare, ktorý  je vhodný ako diagnostická informácia aj pre ďalšie (napr. štatistické) vyhodnocovanie. Na základe analýzy navrhnite  a odskúšajte vhodné algoritmy.', 'Analyzujte možnosti vyhodnocovania CT snímkov, ich kategorizáciu vzhľadom na vhodnú metriku, ktorá môže byť podstatnou informáciou v diagnóze onkologického pacienta. Podstatný problém riešenej témy je: Priestorové   výpočty  o  tumore a  ich  uchovávanie  v DB  diagnóz  v  tvare, ktorý  je vhodný ako diagnostická informácia aj pre ďalšie (napr. štatistické) vyhodnocovanie. Na základe analýzy navrhnite  a odskúšajte vhodné algoritmy.', 1);
INSERT INTO projects VALUES (467, 'DP', 674, NULL, 469, '2005/2006', 'Multi-agentový simulátor adaptívnej ekonomiky', 'Multi-agent simulation of adaptive economics', NULL, NULL, 1);
INSERT INTO projects VALUES (468, 'ZP', 98, NULL, 469, '2003/2004', 'Systém pre odovzdávanie študentských prác prostredníctvom Internetu', 'System for collecting students projects by means of internet', 'Analyzujte problematiku zberu a vyhodnocovania informácií. Analyzujte možnosti implementačných prostriedkov vhodných pre takéto typy aplikácií. Posúďte možnosti PHP a jeho vývojového a ladiaceho prostredia ako prostriedku pre tvorbu webovských aplikácií. Na základe analýzy problému navrhnite a vytvorte aplikáciu vhodnú pre systém odovzdávania prác prostredníctvom internetu', 'Analyzujte problematiku zberu a vyhodnocovania informácií. Analyzujte možnosti implementačných prostriedkov vhodných pre takéto typy aplikácií. Posúďte možnosti PHP a jeho vývojového a ladiaceho prostredia ako prostriedku pre tvorbu webovských aplikácií. Na základe analýzy problému navrhnite a vytvorte aplikáciu vhodnú pre systém odovzdávania prác prostredníctvom internetu', 1);
INSERT INTO projects VALUES (469, 'DP', 387, NULL, 470, '2005/2006', 'Vizualizácia kolekcie textových dokumentov', 'Visualization of text document collection', NULL, NULL, 1);
INSERT INTO projects VALUES (470, 'ZP', 387, NULL, 470, '2003/2004', 'Pravdepodobnostné modely pre odporúčanie informácií', 'Probabilistic models for recommendation', 'Metódy pre odporúčanie informácií odhadujú na základe hodnotení prvkov používateľmi, ako by používateľ ohodnotil nový prvok. V prípade vysokého odhadnutého hodnotenia, sa nový prvok používateľovi odporučí. Existuje mnoho rôznych metód odporúčania a medzi ne patria aj pravdepodobnostné modely. Výhodou pravdepodobnostných modelov je, že explicitne rozdeľujú profily používateľov do vzorov podľa záujmu používateľov, čím umožňujú zdieľať odporúčania medzi používateľmi a identifikovať komunity používateľov. Analyzujte aspektový a klasterový model, navrhnite spôsob na ich porovnanie a porovnajte presnosť odporúčania jednotlivých modelov.', 'Metódy pre odporúčanie informácií odhadujú na základe hodnotení prvkov používateľmi, ako by používateľ ohodnotil nový prvok. V prípade vysokého odhadnutého hodnotenia, sa nový prvok používateľovi odporučí. Existuje mnoho rôznych metód odporúčania a medzi ne patria aj pravdepodobnostné modely. Výhodou pravdepodobnostných modelov je, že explicitne rozdeľujú profily používateľov do vzorov podľa záujmu používateľov, čím umožňujú zdieľať odporúčania medzi používateľmi a identifikovať komunity používateľov. Analyzujte aspektový a klasterový model, navrhnite spôsob na ich porovnanie a porovnajte presnosť odporúčania jednotlivých modelov.', 1);
INSERT INTO projects VALUES (471, 'DP', 357, NULL, 471, '2005/2006', 'Sieťová aplikácia pre interaktívne internetové testovanie študentov', 'Network application for interactive internet assessment of students', NULL, NULL, 0);
INSERT INTO projects VALUES (472, 'ZP', 358, NULL, 471, '2003/2004', 'Testovanie bezpečnostných slabín počítačových sietí', 'Testing the Security Weaknesses of Computer Networks', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy prienikov. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú simulovať vybraté typy útokov na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.

', 'V prostredí protokolov na báze TCP/IP analyzujte bezpečnostné vlastnosti počítačových sietí a možné typy prienikov. Do základného programového modulu navrhnite a implementujte ďalšie programové moduly, ktoré budú simulovať vybraté typy útokov na jednotlivých vrstvách modelu TCP/IP sieťovej architektúry.

', 0);
INSERT INTO projects VALUES (473, 'ZP', 95, NULL, 472, '2003/2004', 'Tvorba špecifikácií v Z jazyku', 'Making formal specifications in Z language', 'Analyzujte problematiku tvorby Z-špecifikácií z hľadiska možnosti vizualizácie schém a formúl Z-jazyka. Analyzujte možnosti, ktoré poskytuje prostriedok na prezeranie Z-špecifikácií, Z-Browser. Na základe tejto analýzy  navrhnite a implementujte model systému, ktorý podporí vizualizáciu čítania a zápisu Z-formúl.', 'Analyzujte problematiku tvorby Z-špecifikácií z hľadiska možnosti vizualizácie schém a formúl Z-jazyka. Analyzujte možnosti, ktoré poskytuje prostriedok na prezeranie Z-špecifikácií, Z-Browser. Na základe tejto analýzy  navrhnite a implementujte model systému, ktorý podporí vizualizáciu čítania a zápisu Z-formúl.', 1);
INSERT INTO projects VALUES (474, 'DP', 16, NULL, 472, '2005/2006', 'Podpora modelovania vlastností', 'Support for feature modeling', NULL, NULL, 1);
INSERT INTO projects VALUES (475, 'ZP', 27, NULL, 473, '2002/2003', 'Štúdia jadra objektovo orientovaného operačného systému', 'Study of kernel for object oriented operating system', NULL, NULL, 1);
INSERT INTO projects VALUES (476, 'DP', 27, NULL, 473, '2003/2004', 'Štúdia servera pre interaktívne systémy obohatenej reality', 'A study of server for interactive augmented reality systems', NULL, NULL, 1);
INSERT INTO projects VALUES (477, 'ZP', 387, NULL, 474, '2003/2004', 'Zdieľanie a sprístupňovanie dokumentov', 'Documents sharing and retrieval', 'Vo výskume pracujú skupiny učiteľov a študentov na jednotlivých projektoch, alebo výskumných témach. Pri svojej práci potrebujú často čerpať  z tých istých zdrojov, čítať tie isté články. Preto vzniká potreba nájsť spôsob ako jednoducho zdielať články (v elektronickej forme) v hierarchii adresárov,  umožňovať jednotlivým členom skupiny hodnotiť články, či pridávať k nim poznámky. Ďalej vytvárať referencie medzi článkami, ktoré sa navzájom citujú, poprípade nachádzať a poskytovať na Internete články podľa bibliografie, alebo kľúčových slov.
Analyzujte potreby výskumných skupín na zdielanie a sprístupňovanie článkov v elektronickej forme a existujúce prístupy k tejto problematike. Navrhnite systém na zdielanie a sprístupňovanie článkov a návrh overte prototypom.
', 'Vo výskume pracujú skupiny učiteľov a študentov na jednotlivých projektoch, alebo výskumných témach. Pri svojej práci potrebujú často čerpať  z tých istých zdrojov, čítať tie isté články. Preto vzniká potreba nájsť spôsob ako jednoducho zdielať články (v elektronickej forme) v hierarchii adresárov,  umožňovať jednotlivým členom skupiny hodnotiť články, či pridávať k nim poznámky. Ďalej vytvárať referencie medzi článkami, ktoré sa navzájom citujú, poprípade nachádzať a poskytovať na Internete články podľa bibliografie, alebo kľúčových slov.
Analyzujte potreby výskumných skupín na zdielanie a sprístupňovanie článkov v elektronickej forme a existujúce prístupy k tejto problematike. Navrhnite systém na zdielanie a sprístupňovanie článkov a návrh overte prototypom.
', 1);
INSERT INTO projects VALUES (478, 'DP', 579, NULL, 474, '2004/2005', 'Systém získavania doplňujúcich informácií', 'Systém získavania doplňujúcich informácií', NULL, NULL, 1);
INSERT INTO projects VALUES (479, 'ZP', 272, NULL, 475, '2003/2004', 'Systém pre generovanie fraktálov', 'System for generating fractals', 'Objekty v prírode sa vyznačujú svojou geometrickou nepravidelnosťou. Nepravidelnosť spôsobuje značné problémy pri ich matematickom opise z hľadiska množstva dát  potrebných pre reprezentáciu objektov. Dané nedostatky je možné riešiť pomocou modelovania vhodnými typmi fraktálov. Analyzujte problematiku fraktálovej geometrie. Vypracujte prehľad známych typov fraktálov a ich matematického opisu. Navrhnite a implementujte systém umožňujúci generovanie, vizualizáciu a následné uchovanie vygenerovaných fraktálov v ľubovolnom formáte.', 'Objekty v prírode sa vyznačujú svojou geometrickou nepravidelnosťou. Nepravidelnosť spôsobuje značné problémy pri ich matematickom opise z hľadiska množstva dát  potrebných pre reprezentáciu objektov. Dané nedostatky je možné riešiť pomocou modelovania vhodnými typmi fraktálov. Analyzujte problematiku fraktálovej geometrie. Vypracujte prehľad známych typov fraktálov a ich matematického opisu. Navrhnite a implementujte systém umožňujúci generovanie, vizualizáciu a následné uchovanie vygenerovaných fraktálov v ľubovolnom formáte.', 1);
INSERT INTO projects VALUES (480, 'DP', 294, NULL, 475, '2004/2005', 'Zobrazovanie grafov v prostredí virtuálnej reality', 'Zobrazovanie grafov v prostredí virtuálnej reality', NULL, NULL, 1);
INSERT INTO projects VALUES (481, 'DP', 433, NULL, 476, '2005/2006', 'Katalóg softvérových znalostí', 'Catalogue of software knowledge', NULL, NULL, 1);
INSERT INTO projects VALUES (482, 'ZP', 433, NULL, 476, '2003/2004', 'Prezentácia dokumentov pre Semantic Web', 'Prezentácia dokumentov pre Semantic Web', 'Analyzujte metódy a prostriedky uchovávania a prezentácie dokumentov pre novú generáciu siete Internet – Semantic Web. Zamerajte sa pritom na reprezentáciu RDF modelu a existujúce schémy opisu dát. Skúmajte možnosti automatizovanej extrakcie a pridávania metainformácií do existujúcich dokumentov. Navrhnite systém, ktorý bude sprístupňovať archivované dokumenty spolu s metainformáciami, umožnite sémantický prístup k systému aj iným agentom. Navrhnuté riešenie overte implementovaním web-systému na centralizované sprístupňovanie publikovaných prác pracovníkov katedry. ', 'Analyzujte metódy a prostriedky uchovávania a prezentácie dokumentov pre novú generáciu siete Internet – Semantic Web. Zamerajte sa pritom na reprezentáciu RDF modelu a existujúce schémy opisu dát. Skúmajte možnosti automatizovanej extrakcie a pridávania metainformácií do existujúcich dokumentov. Navrhnite systém, ktorý bude sprístupňovať archivované dokumenty spolu s metainformáciami, umožnite sémantický prístup k systému aj iným agentom. Navrhnuté riešenie overte implementovaním web-systému na centralizované sprístupňovanie publikovaných prác pracovníkov katedry. ', 1);
INSERT INTO projects VALUES (483, 'ZP', 705, NULL, 477, '2003/2004', 'Schématický editor logických obvodov s hradlovou štruktúrou', 'Gate-structure logical circuits editor', 'Treba navrhnúť programový systém vykonávajúci funkciu schématického editora logických obvodov s hradlovou štruktúrou. Editor má umožniť kresliť sériovo-paralelné a mostíkové hradlové obvody. Hradlový obvod okrem štruktúrnej schémy má byť automaticky opísaný prepojovacím predpisom. ', 'Treba navrhnúť programový systém vykonávajúci funkciu schématického editora logických obvodov s hradlovou štruktúrou. Editor má umožniť kresliť sériovo-paralelné a mostíkové hradlové obvody. Hradlový obvod okrem štruktúrnej schémy má byť automaticky opísaný prepojovacím predpisom. ', 0);
INSERT INTO projects VALUES (484, 'DP', 705, NULL, 477, '2004/2005', 'Virtuálna stavebnica logických obvodov s hradlovou štruktúrou', 'Virtuálna stavebnica logických obvodov s hradlovou štruktúrou', NULL, NULL, 0);
INSERT INTO projects VALUES (485, 'DP', 562, 358, 478, '2005/2006', 'Modifikácia meracieho systému s PC', 'Modification of computer measurement system', NULL, NULL, 0);
INSERT INTO projects VALUES (486, 'ZP', 562, 358, 478, '2003/2004', 'Modifikácia meracieho systému s PC', 'Modification of computer measurement system', 'Pre merací systém merania závislosti C-U a výpočtu profilu nosičov náboja v kremíku modifikujte riadiaci program podľa technologickej špecifikácie,
Odskúšajte riadiaci program meracieho systému. Vypracujte dokumentáciu a návod na obsluhu
', 'Pre merací systém merania závislosti C-U a výpočtu profilu nosičov náboja v kremíku modifikujte riadiaci program podľa technologickej špecifikácie,
Odskúšajte riadiaci program meracieho systému. Vypracujte dokumentáciu a návod na obsluhu
', 0);
INSERT INTO projects VALUES (487, 'ZP', 218, NULL, 479, '2002/2003', 'Využitie čínskej zvyškovej vety v kryptografii', 'The utilization of Chinese Remainder Theorem in Cryptography', NULL, NULL, 1);
INSERT INTO projects VALUES (488, 'DP', 660, NULL, 479, '2005/2006', 'Personalizovaná navigácia v informačnom priestore', 'Personalized Navigation in An Information Space', NULL, NULL, 1);
INSERT INTO projects VALUES (489, 'ZP', 98, NULL, 480, '2003/2004', 'Systém pre odovzdávanie študentských prác prostredníctvom Internetu', 'Systém pre odovzdávanie študentských prác prostredníctvom Internetu', 'Analyzujte problematiku zberu a vyhodnocovania informácií. Analyzujte možnosti implementačných prostriedkov vhodných pre takéto typy aplikácií. Posúďte možnosti jazyka Java a jeho vývojového a ladiaceho prostredia ako prostriedku pre tvorbu webovských aplikácií. Na základe analýzy problému navrhnite a vytvorte aplikáciu vhodnú pre systém odovzdávania prác prostredníctvom internetu.', 'Analyzujte problematiku zberu a vyhodnocovania informácií. Analyzujte možnosti implementačných prostriedkov vhodných pre takéto typy aplikácií. Posúďte možnosti jazyka Java a jeho vývojového a ladiaceho prostredia ako prostriedku pre tvorbu webovských aplikácií. Na základe analýzy problému navrhnite a vytvorte aplikáciu vhodnú pre systém odovzdávania prác prostredníctvom internetu.', 1);
INSERT INTO projects VALUES (490, 'ZP', 704, NULL, 481, '2003/2004', 'Databáza zdrojových textov materiálov pre kurzy virtuálnej univerzity (VU)', 'Databáza zdrojových textov materiálov pre kurzy virtuálnej univerzity (VU)', 'Analyzujte možnosti vytvárania DB zdrojových materiálov pre tvorbu kurzov VU, ich katalogizáciu, znovu-používanie, prerábanie a viacužívateľský prístup k nim. V súvislosti s týmto problémom sa hovorí o meta-dátach, aby boli informácie dostupné, dostačujúce a aby boli v štandardizovanom tvare (projekty IMS-EDUCASE a Ariadne).', 'Analyzujte možnosti vytvárania DB zdrojových materiálov pre tvorbu kurzov VU, ich katalogizáciu, znovu-používanie, prerábanie a viacužívateľský prístup k nim. V súvislosti s týmto problémom sa hovorí o meta-dátach, aby boli informácie dostupné, dostačujúce a aby boli v štandardizovanom tvare (projekty IMS-EDUCASE a Ariadne).', 1);
INSERT INTO projects VALUES (491, 'DP', 431, NULL, 481, '2004/2005', 'Rozšírenie výučbového systému konfigurácie smerovačov', 'Rozšírenie výučbového systému konfigurácie smerovačov', NULL, NULL, 0);
INSERT INTO projects VALUES (492, 'DP', 704, NULL, 482, '2005/2006', 'Vyhľadávanie znalostí v databáze', 'Extracting knowledge from databases', NULL, NULL, 1);
INSERT INTO projects VALUES (493, 'ZP', 704, NULL, 482, '2003/2004', 'Vyhľadávanie znalostí v databáze', 'Information retrieval in database', 'Analyzujte problematiku  vyhľadávania  podstatných informácií v databázach. Tieto informácie môžu byť rôzneho typu (text, čísla ) a sú súčasťou diagnózy pacientov. Na základe analýzy navrhnite programový systém ,ktorý poskytne možnosť experimentovať so získanými informáciami a overte ho na údajoch z DB (existujúcej)o pacientoch.', 'Analyzujte problematiku  vyhľadávania  podstatných informácií v databázach. Tieto informácie môžu byť rôzneho typu (text, čísla ) a sú súčasťou diagnózy pacientov. Na základe analýzy navrhnite programový systém ,ktorý poskytne možnosť experimentovať so získanými informáciami a overte ho na údajoch z DB (existujúcej)o pacientoch.', 1);
INSERT INTO projects VALUES (494, 'ZP', 579, NULL, 483, '2002/2003', 'Multimediálne informácie v regionálnom IS - 1', 'Multimediálne informácie v regionálnom IS - 1', NULL, NULL, 1);
INSERT INTO projects VALUES (495, 'DP', 374, NULL, 483, '2004/2005', 'Prepojenie významov objektov GIS', 'Prepojenie významov objektov GIS', NULL, NULL, 1);
INSERT INTO projects VALUES (496, 'ZP', 374, NULL, 484, '2003/2004', 'Spoločenstvo agentov s jednoduchou spoluprácou', 'Community of Agents Showing Simple Cooperation', 'Analyzujte vlastnosti a možnosti multi-agentových systémov, zamerajte sa hlavne na komunikáciu a spoluprácu agentov. Preskúmajte spôsoby spolupráce v spoločenstve agentov, zloženom s jedného organizačného a viacerých výkonných agentov. Organizačný agent získava úlohy a prideľuje ich tým agentom, s ktorými sa dohodne na vykonaní úlohy. Výkonný agent vie spracovať zvyčajne jeden druh úlohy a môže mať aj krátky zásobník úloh. Ponúkanú úlohu môže akceptovať len ak ju vie vyriešiť a má si ju kam uložiť. Navrhnite prostredie, ktoré umožní odskúšať viaceré spôsoby komunikácie takýchto agentov. Navrhnuté riešenie overte implementovaním softvérového prototypu', 'Analyzujte vlastnosti a možnosti multi-agentových systémov, zamerajte sa hlavne na komunikáciu a spoluprácu agentov. Preskúmajte spôsoby spolupráce v spoločenstve agentov, zloženom s jedného organizačného a viacerých výkonných agentov. Organizačný agent získava úlohy a prideľuje ich tým agentom, s ktorými sa dohodne na vykonaní úlohy. Výkonný agent vie spracovať zvyčajne jeden druh úlohy a môže mať aj krátky zásobník úloh. Ponúkanú úlohu môže akceptovať len ak ju vie vyriešiť a má si ju kam uložiť. Navrhnite prostredie, ktoré umožní odskúšať viaceré spôsoby komunikácie takýchto agentov. Navrhnuté riešenie overte implementovaním softvérového prototypu', 1);
INSERT INTO projects VALUES (497, 'DP', 382, NULL, 484, '2004/2005', 'Optimalizácia Echo state neurónových sietí evolučnými algoritmami', 'Optimalizácia Echo state neurónových sietí evolučnými algoritmami', NULL, NULL, 1);
INSERT INTO projects VALUES (498, 'DP', 374, NULL, 486, '2005/2006', 'Hráč pre simulované hry typu RoboCup', 'The player in simulated environment of RoboCup games', NULL, NULL, 1);
INSERT INTO projects VALUES (499, 'ZP', 704, NULL, 486, '2002/2003', 'Návrh a implementácia problémovo orientovaného IS a návrh vyšpecifikovanej bázy dát', 'Design and implementation of problem oriented IS and design of specified database', 'Návrh a implementácia problémovo orientovaného IS a návrh vyšpecifikovanej bázy dát', 'Návrh a implementácia problémovo orientovaného IS a návrh vyšpecifikovanej bázy dát', 1);
INSERT INTO projects VALUES (500, 'ZP', 20, NULL, 487, '2005/2006', 'Vizualizačná a komunikačná knižnica pre platformu TwinCAT Backhoff PLC', 'Vizualizačná a komunikačná knižnica pre platformu TwinCAT Backhoff PLC', 'Nástroj TwinCAT Beckhoff PLC umožňuje riadenie procesov v reálnom čase. Na rozdiel od klasických hardvérových PLC systémov pracuje na platforme Windows 2000/XP. Komunikácia s ostatnými úlohami v systéme môže byť realizovaná prostredníctvom ADS komunikácie, či štandardnej OPC komunikácie. Naštudujte možnosti realizovania komunikácie s uvedeným systémom a vytvorte knižnicu vizualizačných komponent na platforme C#, komponenty použite vo vzorovej aplikácii vizualizácie jednoduchého procesu.', 'Nástroj TwinCAT Beckhoff PLC umožňuje riadenie procesov v reálnom čase. Na rozdiel od klasických hardvérových PLC systémov pracuje na platforme Windows 2000/XP. Komunikácia s ostatnými úlohami v systéme môže byť realizovaná prostredníctvom ADS komunikácie, či štandardnej OPC komunikácie. Naštudujte možnosti realizovania komunikácie s uvedeným systémom a vytvorte knižnicu vizualizačných komponent na platforme C#, komponenty použite vo vzorovej aplikácii vizualizácie jednoduchého procesu.', 1);
INSERT INTO projects VALUES (501, 'ZP', 387, NULL, 488, '2003/2004', 'Asistent pri čítaní internetových novín', 'An asistant for reading the internet newpapers', 'Mnohé noviny prezentujú články aj v Internetovej verzii. Obsah internetových novín sa denne mení a tak poskytuje čitateľovi každý deň množstvo nových článkov. Témy, ktorým sa noviny venujú sa pritom radikálne nemenia každý deň, ale články venujúce sa nejakej téme, napr. voľbám, športovým majstrovstvám, alebo prírodným katastrofám, sa v novinách objavujú v rámci určitého obdobia. Výber článkov v novinách sa preto dá považovať za čiastočne sa opakujúcu činnosť. Na uľahčenie vykonávania opakujúcich sa činností sa používajú personálni asistenti, ktorí pozorujú správanie sa používateľa a pomáhajú mu vykonávať opakujúce sa činnosti.
Analyzujte potreby a správanie sa používateľov čítajúcich internetové noviny, metódy učenia sa správania používateľa v neustále sa meniacom prostredí a metódy odporúčania dokumentov. Navrhnite personálneho asistenta na odporúčanie článkov internetových novín. Návrh overte prototypom
', 'Mnohé noviny prezentujú články aj v Internetovej verzii. Obsah internetových novín sa denne mení a tak poskytuje čitateľovi každý deň množstvo nových článkov. Témy, ktorým sa noviny venujú sa pritom radikálne nemenia každý deň, ale články venujúce sa nejakej téme, napr. voľbám, športovým majstrovstvám, alebo prírodným katastrofám, sa v novinách objavujú v rámci určitého obdobia. Výber článkov v novinách sa preto dá považovať za čiastočne sa opakujúcu činnosť. Na uľahčenie vykonávania opakujúcich sa činností sa používajú personálni asistenti, ktorí pozorujú správanie sa používateľa a pomáhajú mu vykonávať opakujúce sa činnosti.
Analyzujte potreby a správanie sa používateľov čítajúcich internetové noviny, metódy učenia sa správania používateľa v neustále sa meniacom prostredí a metódy odporúčania dokumentov. Navrhnite personálneho asistenta na odporúčanie článkov internetových novín. Návrh overte prototypom
', 1);
INSERT INTO projects VALUES (502, 'DP', 387, NULL, 488, '2004/2005', 'Využitie pravdepodobnostných modelov so skrytými premennými na odporúčanie informácií ', 'Využitie pravdepodobnostných modelov so skrytými premennými na odporúčanie informácií ', NULL, NULL, 1);
INSERT INTO projects VALUES (503, 'ZP', 13, 431, 489, '2003/2004', 'Generátor testov pre poruchy skratov v kombinačných obvodoch', 'Test pattern generator for bridging faults in combinational circuits', 'a', 'a', 0);
INSERT INTO projects VALUES (504, 'DP', 13, 301, 489, '2004/2005', 'Platforma pre dištančnú elektronickú výučbu diagnostiky  a testovateľnosti digitálnych systémov', 'Platforma pre dištančnú elektronickú výučbu diagnostiky  a testovateľnosti digitálnych systémov', NULL, NULL, 0);
INSERT INTO projects VALUES (505, 'DP', 374, NULL, 490, '2005/2006', 'Informačná podpora procesov územného plánovania', 'Computer support of the processes of spatial planning using the scientific prototyping methodology', NULL, NULL, 1);
INSERT INTO projects VALUES (506, 'ZP', 46, NULL, 490, '2003/2004', 'Tvorba návrhových vzorov –šablón', 'Tvorba návrhových vzorov –šablón', 'Preštudujte si problematiku tvorby a používanie parametrizovaných tried a generických algoritmov  a ich ukladanie do knižníc. Sústreďte sa na tvorbu šablón resp. návrhových vzorov vo vybraných objektovo orientovaných programovacích jazykoch. Na základe analýzy navrhnite a vytvorte knižnicu pre vybrané generické algoritmy vytvorené pomocou šablón. Súčasťou vytvorenej knižnice bude príručka  - sprievodca   pre používateľa ako vytvárať šablóny vo vybranom jazyku.  ', 'Preštudujte si problematiku tvorby a používanie parametrizovaných tried a generických algoritmov  a ich ukladanie do knižníc. Sústreďte sa na tvorbu šablón resp. návrhových vzorov vo vybraných objektovo orientovaných programovacích jazykoch. Na základe analýzy navrhnite a vytvorte knižnicu pre vybrané generické algoritmy vytvorené pomocou šablón. Súčasťou vytvorenej knižnice bude príručka  - sprievodca   pre používateľa ako vytvárať šablóny vo vybranom jazyku.  ', 1);
INSERT INTO projects VALUES (507, 'DP', 374, NULL, 491, '2005/2006', 'Prostredie pre simuláciu hry futsal', 'Prostredie pre simuláciu hry futsal', NULL, NULL, 1);
INSERT INTO projects VALUES (508, 'ZP', 655, NULL, 491, '2003/2004', 'Generátor symbolických postupností pre neurónové siete', 'Generator of symbolic sequences for neural networks', 'Pri trénovaní a testovaní rekurentných sietí vznika potreba spracúvať vstupy s časopriestorovou štruktúrou, ako sú napríklad časové postupnosti symbolov.  Na ich generovanie sa používajú formalizmy slúžiace na opis jednotlivých tried gramatík (regulárne, bezkontextové, kontextové gramatiky), ktoré sú rozšírené napríklad o pravdepodobnosti aplikovania odvodzovacích pravidiel.
Navrhnite a vytvorte nástroj, ktorý by umožnil definovanie abecedy a gramatických pravidiel s pravdepodobnosťami pre generovanie symbolických postupností. Súčasťou nástroja by mala byť aj štatistická analýza vytvorenej postupnosti, t.j. napríklad určenie entropie daného generátora s ohľadom na predikciu nasledujúceho symbolu, stanovenie prechodových pravdepodobností po danej sekvencii symbolov a pod. Vytvorené riešenie overte na vami navrhnutých a vytvorených postupnostiach.', 'Pri trénovaní a testovaní rekurentných sietí vznika potreba spracúvať vstupy s časopriestorovou štruktúrou, ako sú napríklad časové postupnosti symbolov.  Na ich generovanie sa používajú formalizmy slúžiace na opis jednotlivých tried gramatík (regulárne, bezkontextové, kontextové gramatiky), ktoré sú rozšírené napríklad o pravdepodobnosti aplikovania odvodzovacích pravidiel.
Navrhnite a vytvorte nástroj, ktorý by umožnil definovanie abecedy a gramatických pravidiel s pravdepodobnosťami pre generovanie symbolických postupností. Súčasťou nástroja by mala byť aj štatistická analýza vytvorenej postupnosti, t.j. napríklad určenie entropie daného generátora s ohľadom na predikciu nasledujúceho symbolu, stanovenie prechodových pravdepodobností po danej sekvencii symbolov a pod. Vytvorené riešenie overte na vami navrhnutých a vytvorených postupnostiach.', 1);
INSERT INTO projects VALUES (509, 'DP', 704, NULL, 492, '2005/2006', 'Integrácia modulov správy CT snímok so základným IS NOCIS', 'Integration of Module for CT Images Management with IS NOCIS', NULL, NULL, 1);
INSERT INTO projects VALUES (510, 'ZP', 704, NULL, 492, '2003/2004', 'Spravovanie a využitie CT snímkov pre podporu diagnózy pacienta', 'CT Images Processing and Using CT Images for Diagnostics of Patients', 'Analyzujte súčasné možnosti a metódy prezerania, správy, exportu a vyhodnocovania  CT snímkov. Podstatnou úlohou je nájsť a aplikovať algoritmy pre ich   hodnotenie  vhodnou  metrikou, ktorou sa dajú vyhodnocovať prípadné zmeny počas sledovania stavu pacienta. Podmienkou  je  možnosť  prezerania   a vyhodnocovania CT  snímkov   mimo  snímacieho  zariadenia   CT. Prácu  možno  rozdeliť  na  minimálne  tieto  časti, resp. problémy: Import/ Export  CT  snímkov, Experimentovanie s CT  snímkami, t.j. modifikácia objektu, vytvorenie  objektu, jeho  zobrazenie  v 2D a v 3D. Podmienkou  je  vývojové  a  implementačné  prostredie  Borland  Delphi.', 'Analyzujte súčasné možnosti a metódy prezerania, správy, exportu a vyhodnocovania  CT snímkov. Podstatnou úlohou je nájsť a aplikovať algoritmy pre ich   hodnotenie  vhodnou  metrikou, ktorou sa dajú vyhodnocovať prípadné zmeny počas sledovania stavu pacienta. Podmienkou  je  možnosť  prezerania   a vyhodnocovania CT  snímkov   mimo  snímacieho  zariadenia   CT. Prácu  možno  rozdeliť  na  minimálne  tieto  časti, resp. problémy: Import/ Export  CT  snímkov, Experimentovanie s CT  snímkami, t.j. modifikácia objektu, vytvorenie  objektu, jeho  zobrazenie  v 2D a v 3D. Podmienkou  je  vývojové  a  implementačné  prostredie  Borland  Delphi.', 1);
INSERT INTO projects VALUES (511, 'DP', 541, NULL, 493, '2005/2006', 'Informačný systém pre mobilnú komunikáciu', 'Information system for mobile communication', NULL, NULL, 1);
INSERT INTO projects VALUES (512, 'ZP', 387, NULL, 493, '2003/2004', 'Zdieľanie a sprístupňovanie dokumentov', 'Sharing and accessing of documents', 'Vo výskume pracujú skupiny učiteľov a študentov na jednotlivých projektoch, alebo výskumných témach. Pri svojej práci potrebujú často čerpať  z tých istých zdrojov, čítať tie isté články. Preto vzniká potreba nájsť spôsob ako jednoducho zdielať články (v elektronickej forme) v hierarchii adresárov,  umožňovať jednotlivým členom skupiny hodnotiť články, či pridávať k nim poznámky. Ďalej vytvárať referencie medzi článkami, ktoré sa navzájom citujú, poprípade nachádzať a poskytovať na Internete články podľa bibliografie, alebo kľúčových slov.
Analyzujte potreby výskumných skupín na zdielanie a sprístupňovanie článkov v elektronickej forme a existujúce prístupy k tejto problematike. Navrhnite systém na zdielanie a sprístupňovanie článkov a návrh overte prototypom.
', 'Vo výskume pracujú skupiny učiteľov a študentov na jednotlivých projektoch, alebo výskumných témach. Pri svojej práci potrebujú často čerpať  z tých istých zdrojov, čítať tie isté články. Preto vzniká potreba nájsť spôsob ako jednoducho zdielať články (v elektronickej forme) v hierarchii adresárov,  umožňovať jednotlivým členom skupiny hodnotiť články, či pridávať k nim poznámky. Ďalej vytvárať referencie medzi článkami, ktoré sa navzájom citujú, poprípade nachádzať a poskytovať na Internete články podľa bibliografie, alebo kľúčových slov.
Analyzujte potreby výskumných skupín na zdielanie a sprístupňovanie článkov v elektronickej forme a existujúce prístupy k tejto problematike. Navrhnite systém na zdielanie a sprístupňovanie článkov a návrh overte prototypom.
', 1);
INSERT INTO projects VALUES (513, 'ZP', 660, NULL, 494, '2003/2004', 'CSIDC 2004', 'CSIDC 2004', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 1);
INSERT INTO projects VALUES (514, 'ZP', 437, NULL, 495, '2004/2005', 'Softvér ako výsledok technickej tvorivej duševnej činnosti', 'Softvér ako výsledok technickej tvorivej duševnej činnosti', 'Uveďte pojem softvér z pohľadu technického aj právneho, pričom uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Vysvetlite, aké sú práva na softvér, čo je to ochrana takýchto práv, prečo treba takéto práva chrániť s dôrazom na etické a spoločenské súvislosti. Opíšte známe právne riešenia ochrany softvéru, pričom opäť uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Analyzujte súčasný stav, pomenujte prípadné otvorené problémy a naznačte možnosti ich riešenia. O celej problematike vytvorte tématické pavučinové sídlo, ktoré bude slúžiť ako zdroj informácií aj odkazov na ne. ', 'Uveďte pojem softvér z pohľadu technického aj právneho, pričom uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Vysvetlite, aké sú práva na softvér, čo je to ochrana takýchto práv, prečo treba takéto práva chrániť s dôrazom na etické a spoločenské súvislosti. Opíšte známe právne riešenia ochrany softvéru, pričom opäť uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Analyzujte súčasný stav, pomenujte prípadné otvorené problémy a naznačte možnosti ich riešenia. O celej problematike vytvorte tématické pavučinové sídlo, ktoré bude slúžiť ako zdroj informácií aj odkazov na ne. ', 1);
INSERT INTO projects VALUES (515, 'ZP', 672, NULL, 496, '2003/2004', 'Komunikačná sieť ako graf typu „malý svet“', 'Communication network as a graph  of the “small world”', 'Siete „malého sveta“ sú v súčasnosti v popredí záujmu matematikov a fyzikov.  Pomocou modelov „malého sveta“  môžeme  pochopiť štruktúru sociálnych a komunikačných sietí, ako sietí, ktoré v sebe zahĹ•ňajú jednak prvok náhodnosti, jednak prvok lokálnej usporiadanosti. Prvok náhodnosti je zodpovedný za efektívnosť prepojení uzlov v sieti a ich malú separáciu, prvok usporiadanosti  za lokálnu štruktúru uzlov a klasterizáciu. Úlohou riešiteľa je: Preštudovať teóriu sietí „malého sveta“ a dostupné modely. Analyzovať prepojenosť a štruktúru www stránok podľa vybranej špecifikácie. Navrhnúť model prepojení www stránok ako model „malého sveta“. Overiť funkčnosť modelu.  Pracovať v Linuxe', 'Siete „malého sveta“ sú v súčasnosti v popredí záujmu matematikov a fyzikov.  Pomocou modelov „malého sveta“  môžeme  pochopiť štruktúru sociálnych a komunikačných sietí, ako sietí, ktoré v sebe zahĹ•ňajú jednak prvok náhodnosti, jednak prvok lokálnej usporiadanosti. Prvok náhodnosti je zodpovedný za efektívnosť prepojení uzlov v sieti a ich malú separáciu, prvok usporiadanosti  za lokálnu štruktúru uzlov a klasterizáciu. Úlohou riešiteľa je: Preštudovať teóriu sietí „malého sveta“ a dostupné modely. Analyzovať prepojenosť a štruktúru www stránok podľa vybranej špecifikácie. Navrhnúť model prepojení www stránok ako model „malého sveta“. Overiť funkčnosť modelu.  Pracovať v Linuxe', 1);
INSERT INTO projects VALUES (516, 'DP', 422, 297, 496, '2004/2005', 'Metóda grid computingu na riešenie šachových úloh', 'Metóda grid computingu na riešenie šachových úloh', NULL, NULL, 1);
INSERT INTO projects VALUES (517, 'DP', 20, NULL, 497, '2005/2006', 'Spracovanie časových postupností pomocou LSTM sietí', 'Time series processing with LSTM networks', NULL, NULL, 1);
INSERT INTO projects VALUES (518, 'ZP', 20, NULL, 497, '2003/2004', 'Modely rekurentných neurónových sietí založené na architekturálnom biase', 'Models of recurrent neural networks based on architectural bias', 'Rekurentné neurónové siete sú na rozdiel od klasických dopredných neurónových sietí schopné spracovávať vstupy s časovou štruktúrou. Rekurentné siete inicializované s malými váhami vykazujú pri spracovaní postupností symbolov vlastnosti markovovských modelov – ich stavový priestor odráža históriu symbolov prezentovaných sieti. Túto vlastnosť vyplývajúcu z architektúry rekurentnej siete nazývame architekturálny bias. 
Cieľom projektu je lepšie preskúmanie tejto vlastnosti experimentovaním s modelmi, ktorých rekurentná časť nie je trénovaná, popr. je pevne nastavená na určité hodnoty. Na probléme predikcie nasledujúceho symbolu vstupnej postupnosti porovnajte vlastnosti týchto modelov a vlastnosti markovovských modelov. Je potrebné vytvoriť zodpovedajúce simulačné nástroje, zvoliť vhodné trénovacie postupnosti, vykonať potrebné experimenty a spracovať ich výsledky.
', 'Rekurentné neurónové siete sú na rozdiel od klasických dopredných neurónových sietí schopné spracovávať vstupy s časovou štruktúrou. Rekurentné siete inicializované s malými váhami vykazujú pri spracovaní postupností symbolov vlastnosti markovovských modelov – ich stavový priestor odráža históriu symbolov prezentovaných sieti. Túto vlastnosť vyplývajúcu z architektúry rekurentnej siete nazývame architekturálny bias. 
Cieľom projektu je lepšie preskúmanie tejto vlastnosti experimentovaním s modelmi, ktorých rekurentná časť nie je trénovaná, popr. je pevne nastavená na určité hodnoty. Na probléme predikcie nasledujúceho symbolu vstupnej postupnosti porovnajte vlastnosti týchto modelov a vlastnosti markovovských modelov. Je potrebné vytvoriť zodpovedajúce simulačné nástroje, zvoliť vhodné trénovacie postupnosti, vykonať potrebné experimenty a spracovať ich výsledky.
', 1);
INSERT INTO projects VALUES (519, 'DP', 566, NULL, 498, '2005/2006', 'Emergencia stratégie v multiagentových systémoch', 'Strategy emergence in multiagent systems', NULL, NULL, 1);
INSERT INTO projects VALUES (520, 'ZP', 374, NULL, 498, '2003/2004', 'Spoločenstvo agentov s jednoduchou spoluprácou', 'Agents community with simple kind of communication', 'Analyzujte vlastnosti a možnosti multi-agentových systémov, zamerajte sa hlavne na komunikáciu a spoluprácu agentov. Preskúmajte spôsoby spolupráce v spoločenstve agentov, zloženom s jedného organizačného a viacerých výkonných agentov. Organizačný agent získava úlohy a prideľuje ich tým agentom, s ktorými sa dohodne na vykonaní úlohy. Výkonný agent vie spracovať zvyčajne jeden druh úlohy a môže mať aj krátky zásobník úloh. Ponúkanú úlohu môže akceptovať len ak ju vie vyriešiť a má si ju kam uložiť. Navrhnite prostredie, ktoré umožní odskúšať viaceré spôsoby komunikácie takýchto agentov. Navrhnuté riešenie overte implementovaním softvérového prototypu', 'Analyzujte vlastnosti a možnosti multi-agentových systémov, zamerajte sa hlavne na komunikáciu a spoluprácu agentov. Preskúmajte spôsoby spolupráce v spoločenstve agentov, zloženom s jedného organizačného a viacerých výkonných agentov. Organizačný agent získava úlohy a prideľuje ich tým agentom, s ktorými sa dohodne na vykonaní úlohy. Výkonný agent vie spracovať zvyčajne jeden druh úlohy a môže mať aj krátky zásobník úloh. Ponúkanú úlohu môže akceptovať len ak ju vie vyriešiť a má si ju kam uložiť. Navrhnite prostredie, ktoré umožní odskúšať viaceré spôsoby komunikácie takýchto agentov. Navrhnuté riešenie overte implementovaním softvérového prototypu', 1);
INSERT INTO projects VALUES (521, 'ZP', 374, NULL, 499, '2003/2004', 'Mobilné agenty', 'Mobile agents', 'Analyzujte vlastnosti a možnosti multi-agentových systémov, zamerajte sa hlavne na mobilitu agentov. Preskúmajte spôsoby vytvárania hostiteľských prostredí pre mobilné agenty v rôznych operačných systémoch a podporu, ktorú poskytujú knižnice jazyka C (C++). Špecifikujte podstatné vlastnosti, ktoré zabezpečia mobilitu agenta. Navrhnite hostiteľské prostredie a jednoduchého agenta, ktorý je schopný podľa určeného plánu cestovať medzi zvolenými počítačmi. Navrhnuté riešenie overte implementovaním softvérového prototypu.', 'Analyzujte vlastnosti a možnosti multi-agentových systémov, zamerajte sa hlavne na mobilitu agentov. Preskúmajte spôsoby vytvárania hostiteľských prostredí pre mobilné agenty v rôznych operačných systémoch a podporu, ktorú poskytujú knižnice jazyka C (C++). Špecifikujte podstatné vlastnosti, ktoré zabezpečia mobilitu agenta. Navrhnite hostiteľské prostredie a jednoduchého agenta, ktorý je schopný podľa určeného plánu cestovať medzi zvolenými počítačmi. Navrhnuté riešenie overte implementovaním softvérového prototypu.', 1);
INSERT INTO projects VALUES (522, 'DP', 374, NULL, 499, '2004/2005', 'Využitie platforiem pre mobilné agenty', 'Využitie platforiem pre mobilné agenty', NULL, NULL, 1);
INSERT INTO projects VALUES (523, 'ZP', 361, NULL, 500, '2003/2004', 'Využitie WANPIPE – smerovača', 'Utilization of WANIPIPE - router', 'Analyzujte súčasné možnosti WAN - LAN spojenia, problematiku IP adresovania (IP adresy, triedy, and sieťové masky) a WANPIPE- smerovača (spoľahlivosť, úspora, špecifikácia, etc.). Navrhnite  a implementujte WAN - LAN spojenie  pomocou    WANPIPE- smerovača. Riešenie porovnajte s inými riešeniami z hľadiska technicko – ekonomických parametrov.', 'Analyzujte súčasné možnosti WAN - LAN spojenia, problematiku IP adresovania (IP adresy, triedy, and sieťové masky) a WANPIPE- smerovača (spoľahlivosť, úspora, špecifikácia, etc.). Navrhnite  a implementujte WAN - LAN spojenie  pomocou    WANPIPE- smerovača. Riešenie porovnajte s inými riešeniami z hľadiska technicko – ekonomických parametrov.', 0);
INSERT INTO projects VALUES (524, 'DP', 361, NULL, 500, '2005/2006', 'Využitie smerovačov', 'Využitie smerovačov', NULL, NULL, 0);
INSERT INTO projects VALUES (525, 'DP', 297, NULL, 501, '2005/2006', 'Integrované prostredie na tvorbu súborov', 'An integrated development environment for creating source files', NULL, NULL, 1);
INSERT INTO projects VALUES (526, 'ZP', 433, NULL, 501, '2003/2004', 'Podpora výberu vhodnej technológie spracovania textových dokumentov', 'Support for choosing convenient technology of text document processing', 'Analyzujte súčasné metódy a jazyky generovania textových dokumentov (PHP, XML/XSLT, JSP, Perl  a pod.), používané vo web-aplikáciách. Navrhnite a vytvorte sadu  príkladov so vzorovým riešením pre jednotlivé technológie. Vytvorené príklady sprístupnite na pavučine ako študijný materiál k daným technológiám. Na podporu výberu navrhnite a vykonajte sadu testov výkonnosti jednotlivých technológií a ich výsledky vyhodnoťte. Navrhnite a protypom overte interaktívnu web-aplikáciu, ktorá umožní jednoduché vizuálne prototypovanie riešenia pre zvolené problémy transformácie a generovania (hyper)textových dokumentov.', 'Analyzujte súčasné metódy a jazyky generovania textových dokumentov (PHP, XML/XSLT, JSP, Perl  a pod.), používané vo web-aplikáciách. Navrhnite a vytvorte sadu  príkladov so vzorovým riešením pre jednotlivé technológie. Vytvorené príklady sprístupnite na pavučine ako študijný materiál k daným technológiám. Na podporu výberu navrhnite a vykonajte sadu testov výkonnosti jednotlivých technológií a ich výsledky vyhodnoťte. Navrhnite a protypom overte interaktívnu web-aplikáciu, ktorá umožní jednoduché vizuálne prototypovanie riešenia pre zvolené problémy transformácie a generovania (hyper)textových dokumentov.', 1);
INSERT INTO projects VALUES (527, 'ZP', 25, NULL, 502, '2005/2006', 'Riadenie vytvárania procesov', 'Riadenie vytvárania procesov', 'Analyzujte mechanizmus vytvárania procesov v OS Unix. Navrhnite rozšírenie jadra OS, ktoré umožní sledovať, obmedziť, resp. modifikovať postup vytvárania nových procesov, v závislosti od zadanej konfigurácie, ktorá bude založená na relevantných parametroch (napr. používateľ, skupina, príkaz, argumenty) prípadne celkovom stave systému (vyťaženie, počet bežiacich procesov, atď.). Riešenie implmentujte a otestujte.', 'Analyzujte mechanizmus vytvárania procesov v OS Unix. Navrhnite rozšírenie jadra OS, ktoré umožní sledovať, obmedziť, resp. modifikovať postup vytvárania nových procesov, v závislosti od zadanej konfigurácie, ktorá bude založená na relevantných parametroch (napr. používateľ, skupina, príkaz, argumenty) prípadne celkovom stave systému (vyťaženie, počet bežiacich procesov, atď.). Riešenie implmentujte a otestujte.', 0);
INSERT INTO projects VALUES (528, 'DP', 24, NULL, 503, '2005/2006', 'Optimalizácia úloh prepravy', 'TRANSPORT TASKS OPTIMALIZATION', NULL, NULL, 1);
INSERT INTO projects VALUES (529, 'ZP', 24, NULL, 503, '2003/2004', 'Algoritmizácia v príkladoch – vyhľadávanie', 'Algorithms in examples – searching', 'Analyzujte vybrané algoritmické metódy využívané v databázových systémoch (prehľadávanie a usporadúvanie záznamov)  z hľadiska ich využitia v súčasných softvérových aplikáciách. Porovnajte jednotlivé metódy podľa vybraných kritérií. Spracujte  vybrané algoritmy do množiny  príkladov vo forme  hypertextu, s presne stanovenou štruktúrou. Štruktúra bude odrážať životný cyklus programu a zároveň algoritmy rovnakého typu budú vyhodnocované na reprezentatívnej vzorke údajov a navzájom porovnávané.  Vizualizujte  prezentáciu vykonávania algoritmov.', 'Analyzujte vybrané algoritmické metódy využívané v databázových systémoch (prehľadávanie a usporadúvanie záznamov)  z hľadiska ich využitia v súčasných softvérových aplikáciách. Porovnajte jednotlivé metódy podľa vybraných kritérií. Spracujte  vybrané algoritmy do množiny  príkladov vo forme  hypertextu, s presne stanovenou štruktúrou. Štruktúra bude odrážať životný cyklus programu a zároveň algoritmy rovnakého typu budú vyhodnocované na reprezentatívnej vzorke údajov a navzájom porovnávané.  Vizualizujte  prezentáciu vykonávania algoritmov.', 1);
INSERT INTO projects VALUES (530, 'ZP', 447, NULL, 504, '2004/2005', 'xxxx', 'xxxx', 'xxx.', 'xxx.', 1);
INSERT INTO projects VALUES (531, 'DP', 10, NULL, 505, '2005/2006', 'Simulovaný robotický futbal - tímová spolupráca', 'RoboCup - team cooperation', NULL, NULL, 1);
INSERT INTO projects VALUES (532, 'ZP', 46, NULL, 505, '2003/2004', 'Podpora objektovo orientovaného návrhu', 'Support of object oriented design', 'V súčasnej dobe existuje viacero metód podporujúcich objektovo orientovanú analýzu a návrh, ktoré stanovujú postupnosť činností pri vytváraní softvérového systému. Analyzujte metódy, ktoré vychádzajú z podpory notácie UML.  Na základe vybranej metódy navrhnite a implementujte objektovo orientovanú aplikáciu. Proces tvorby vybranej aplikácie  prezentujte formou demo prostriedku v tvare vhodnom na prezentáciu. Navrhnuté riešenie overte. Pri vizualizácii procesu tvorby programového systému využite Rational Rose. ', 'V súčasnej dobe existuje viacero metód podporujúcich objektovo orientovanú analýzu a návrh, ktoré stanovujú postupnosť činností pri vytváraní softvérového systému. Analyzujte metódy, ktoré vychádzajú z podpory notácie UML.  Na základe vybranej metódy navrhnite a implementujte objektovo orientovanú aplikáciu. Proces tvorby vybranej aplikácie  prezentujte formou demo prostriedku v tvare vhodnom na prezentáciu. Navrhnuté riešenie overte. Pri vizualizácii procesu tvorby programového systému využite Rational Rose. ', 1);
INSERT INTO projects VALUES (533, 'ZP', 541, NULL, 506, '2003/2004', 'Zálohovanie a obnova dát v databázach', 'Database backup and recovery', 'Analyzujte metódy a prostriedky zálohovania a obnovy dát v relačných databázových systémoch. Definujte výhody a nedostatky zálohovania a obnovy dát v DBS Oracle. Navrhnite možné metódy zlepšenia a rozšírenia funkcií zálohovania a obnovy dát. Vybraté  metódy implementujte v prostredí Oracle. Funkčnosť systému demonštrujte na vybratom príklade.', 'Analyzujte metódy a prostriedky zálohovania a obnovy dát v relačných databázových systémoch. Definujte výhody a nedostatky zálohovania a obnovy dát v DBS Oracle. Navrhnite možné metódy zlepšenia a rozšírenia funkcií zálohovania a obnovy dát. Vybraté  metódy implementujte v prostredí Oracle. Funkčnosť systému demonštrujte na vybratom príklade.', 1);
INSERT INTO projects VALUES (534, 'DP', 358, NULL, 506, '2004/2005', 'Testovanie bezpečnostných slabín počítačových sietí', 'Testovanie bezpečnostných slabín počítačových sietí', NULL, NULL, 0);
INSERT INTO projects VALUES (535, 'ZP', 221, NULL, 507, '2002/2003', 'Kryptoanalýza binárnych postupností použitím FCSR (spatnoväzbových posuvných registrov s prenosom)', 'Kryptoanalýza binárnych postupností použitím FCSR (spatnoväzbových posuvných registrov s prenosom)', NULL, NULL, 1);
INSERT INTO projects VALUES (536, 'DP', 342, NULL, 507, '2004/2005', 'Programová podpora výučby návrhu a projektovania počítačových sietí', 'Programová podpora výučby návrhu a projektovania počítačových sietí', NULL, NULL, 0);
INSERT INTO projects VALUES (537, 'DP', 252, 46, 508, '2005/2006', 'Použitie nástroja pre sledovanie činnosti programu pomocou databázy symbolov v ladiacom mode', 'Monitoring of software system in graphical mode', NULL, NULL, 1);
INSERT INTO projects VALUES (538, 'ZP', 252, 46, 508, '2002/2003', 'Návrh konceptov pre sledovanie činnosti programu', 'Návrh konceptov pre sledovanie činnosti programu', NULL, NULL, 1);
INSERT INTO projects VALUES (539, 'ZP', 46, NULL, 509, '2003/2004', 'Podpora objektovo orientovaného návrhu', 'The support of object oriented  analysis and design', 'V súčasnej dobe existuje viacero metód podporujúcich objektovo orientovanú analýzu a návrh, ktoré stanovujú postupnosť činností pri vytváraní softvérového systému. Analyzujte metódy, ktoré vychádzajú z podpory notácie UML.  Na základe vybranej metódy navrhnite a implementujte objektovo orientovanú aplikáciu. Proces tvorby vybranej aplikácie  prezentujte    formou demo prostriedku v tvare vhodnom na prezentáciu. Navrhnuté riešenie overte. Pri vizualizácii procesu tvorby programového systému využite Rational Rose. ', 'V súčasnej dobe existuje viacero metód podporujúcich objektovo orientovanú analýzu a návrh, ktoré stanovujú postupnosť činností pri vytváraní softvérového systému. Analyzujte metódy, ktoré vychádzajú z podpory notácie UML.  Na základe vybranej metódy navrhnite a implementujte objektovo orientovanú aplikáciu. Proces tvorby vybranej aplikácie  prezentujte    formou demo prostriedku v tvare vhodnom na prezentáciu. Navrhnuté riešenie overte. Pri vizualizácii procesu tvorby programového systému využite Rational Rose. ', 1);
INSERT INTO projects VALUES (540, 'DP', 46, NULL, 509, '2004/2005', 'Podpora objektovo orientovaného návrhu', 'Podpora objektovo orientovaného návrhu', NULL, NULL, 1);
INSERT INTO projects VALUES (541, 'DP', 374, NULL, 510, '2005/2006', 'Informačná podpora procesov územného plánovania', 'INFORMATION SUPPORT OF SPATIAL DEVELOPMENT PROCESSES', NULL, NULL, 1);
INSERT INTO projects VALUES (542, 'ZP', 660, NULL, 510, '2003/2004', 'CSIDC 2004', 'CSIDC 2004', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 1);
INSERT INTO projects VALUES (543, 'DP', 549, 298, 511, '2003/2004', 'Programový systém pre meranie s programovateľnými meracími prístrojmi', 'Programový systém pre meranie s programovateľnými meracími prístrojmi', NULL, NULL, 0);
INSERT INTO projects VALUES (544, 'ZP', 563, NULL, 512, '2002/2003', 'Osciloskopická karta pre PC', 'Oscilloscope card for PC', NULL, NULL, 0);
INSERT INTO projects VALUES (545, 'DP', 705, NULL, 512, '2003/2004', 'Automatický detektor dynamických hazardov', 'Automatic detector of dynamic hazards', NULL, NULL, 0);
INSERT INTO projects VALUES (546, 'DP', 98, NULL, 513, '2005/2006', 'Generovanie a rozpoznávanie digitálnych grafických objektov', 'Digital graphical objects generation and recognition', NULL, NULL, 1);
INSERT INTO projects VALUES (547, 'ZP', 98, NULL, 513, '2003/2004', 'Systém pre odovzdávanie študentských prác prostredníctvom Internetu', 'System for dispatching student works through internet', 'Analyzujte problematiku zberu a vyhodnocovania informácií. Analyzujte možnosti implementačných prostriedkov vhodných pre takéto typy aplikácií. Posúďte možnosti Perlu a jeho vývojového a ladiaceho prostredia ako prostriedku pre tvorbu webovských aplikácií. Na základe analýzy problému navrhnite a vytvorte aplikáciu vhodnú pre systém odovzdávania prác prostredníctvom internetu', 'Analyzujte problematiku zberu a vyhodnocovania informácií. Analyzujte možnosti implementačných prostriedkov vhodných pre takéto typy aplikácií. Posúďte možnosti Perlu a jeho vývojového a ladiaceho prostredia ako prostriedku pre tvorbu webovských aplikácií. Na základe analýzy problému navrhnite a vytvorte aplikáciu vhodnú pre systém odovzdávania prác prostredníctvom internetu', 1);
INSERT INTO projects VALUES (548, 'DP', 359, NULL, 514, '2005/2006', 'Programová podpora simulácie vybraných meraní na elektrických strojoch ', 'Programová podpora simulácie vybraných meraní na elektrických strojoch ', NULL, NULL, 0);
INSERT INTO projects VALUES (549, 'ZP', 375, NULL, 514, '2003/2004', 'Systém pre podporu e-vzdelávania', 'systém pre podporu e-vzdelávania', 'Analyzujte rôzne výučbové systémy, ktoré podporujú učenie sa elektronickou formou. Pri analýze sa zamerajte najmä na metodiku správy kurzov e-vzdelávania. Navrhnite a implementujte modulárny programový systém, ktorý poskytne dostatočne univerzálny rámec pre správu kurzov – definovanie kurzov, inštruktorov, frekventantov, časový harmonogram kurzu, diskusné panely, definovanie úloh, a pod. Funkčnosť systému overte správou niektorých zadaných kurzov.
', 'Analyzujte rôzne výučbové systémy, ktoré podporujú učenie sa elektronickou formou. Pri analýze sa zamerajte najmä na metodiku správy kurzov e-vzdelávania. Navrhnite a implementujte modulárny programový systém, ktorý poskytne dostatočne univerzálny rámec pre správu kurzov – definovanie kurzov, inštruktorov, frekventantov, časový harmonogram kurzu, diskusné panely, definovanie úloh, a pod. Funkčnosť systému overte správou niektorých zadaných kurzov.
', 1);
INSERT INTO projects VALUES (550, 'DP', 27, NULL, 515, '2005/2006', 'Tlačené dokumenty s virtuálnymi ilustráciami', 'Printed documents with virtual illustrations', NULL, NULL, 1);
INSERT INTO projects VALUES (551, 'ZP', 27, NULL, 515, '2003/2004', 'Vytlačený dokument s obohatenou realitou', 'Printed document with Augmented Reality', 'Analyzujte dostupné prostriedky pre tvorbu obohatenej (augmented) reality, založené na kombinovaní reálneho a syntetického obrazu. Navrhnite a realizujte jednoduchý príklad obohatenej reality vo forme kombinácie učebných dokumentov na papieri s virtuálnymi obrazmi. Pri realizácii príkladu využite dostupné metódy snímania obrazu, rozpoznávania značiek v obraze a generovania virtuálnych obrazov', 'Analyzujte dostupné prostriedky pre tvorbu obohatenej (augmented) reality, založené na kombinovaní reálneho a syntetického obrazu. Navrhnite a realizujte jednoduchý príklad obohatenej reality vo forme kombinácie učebných dokumentov na papieri s virtuálnymi obrazmi. Pri realizácii príkladu využite dostupné metódy snímania obrazu, rozpoznávania značiek v obraze a generovania virtuálnych obrazov', 1);
INSERT INTO projects VALUES (552, 'ZP', 342, NULL, 516, '2003/2004', 'Programové prostredie pre návrh riadiacich jednotiek na báze mikroprocesorových modulov.', 'Control unit developmet aplication enviroment on the microprocessor module basis', 'Analyzujte jazyky pre opis správania sa číslicových systémov z hľadiska automatizovaného návrhu riadiacich jednotiek. Navrhnite inštrukčný súbor virtuálneho procesora vhodného na realizáciu vybranej triedy riadiacich jednotiek. Navrhnite a zrealizujte vybranú časť programového systému pre  generovanie kódu programu virtuálneho procesora realizujúceho  funkcie riadiacej jednotky,  ktorej správanie je dané vybraným opisným prostriedkom.
', 'Analyzujte jazyky pre opis správania sa číslicových systémov z hľadiska automatizovaného návrhu riadiacich jednotiek. Navrhnite inštrukčný súbor virtuálneho procesora vhodného na realizáciu vybranej triedy riadiacich jednotiek. Navrhnite a zrealizujte vybranú časť programového systému pre  generovanie kódu programu virtuálneho procesora realizujúceho  funkcie riadiacej jednotky,  ktorej správanie je dané vybraným opisným prostriedkom.
', 0);
INSERT INTO projects VALUES (553, 'DP', 342, NULL, 516, '2005/2006', 'Programová podpora návrhu riadiacich systémov', 'Programová podpora návrhu riadiacich systémov', NULL, NULL, 0);
INSERT INTO projects VALUES (554, 'DP', 298, NULL, 518, '2005/2006', 'Generátor konfigurácií pre Cisco smerovače', 'Configuration generator for Cisco routers', NULL, NULL, 0);
INSERT INTO projects VALUES (555, 'ZP', 357, NULL, 518, '2003/2004', 'Internetová aplikácia na registráciu užívateľských dát', 'Internet Application for User Data Registration', 'Analyzujte a navrhnite bezpečný interaktívny web na registráciu klientov, ktorý umožní ukladanie a editovanie dát klientov do databázy. Analyzujte využitie rôznych implementačných nástrojov ako aj vhodnosti operačných systémov. Realizujte funkčný model takéhoto  systému na báze Linuxu, PHP a MySQL databázy. Otestujte funkčnosť a stabilitu systému.
Túto tému je vhodné riešiť v súčinnosti s témou „ Internetová aplikácia na bezpečnú autentifikáciu klientov “.
', 'Analyzujte a navrhnite bezpečný interaktívny web na registráciu klientov, ktorý umožní ukladanie a editovanie dát klientov do databázy. Analyzujte využitie rôznych implementačných nástrojov ako aj vhodnosti operačných systémov. Realizujte funkčný model takéhoto  systému na báze Linuxu, PHP a MySQL databázy. Otestujte funkčnosť a stabilitu systému.
Túto tému je vhodné riešiť v súčinnosti s témou „ Internetová aplikácia na bezpečnú autentifikáciu klientov “.
', 0);
INSERT INTO projects VALUES (556, 'DP', 672, NULL, 519, '2005/2006', 'Pravdepodobnostná štruktúra modelu smerovanej perkolácie na štvorcovej mriežke', 'Probabilistic structure of directed percolation model in square lattice', NULL, NULL, 1);
INSERT INTO projects VALUES (557, 'ZP', 672, NULL, 519, '2003/2004', 'Pravdepodobnostná štruktúra modelu smerovanej  perkolácie na štvorcovej mriežke', 'Probabilistic structure of directed percolation model in square lattice', 'V práci sa počíta pravdepodobnostná štruktúra modelu smerovanej perkolácie na štvorcovej   mriežke. Model smerovanej perkolácie je vhodný na štúdium takých fyzikálnych procesov ako polymerizácia, šírenie porúch, šírenie požiarov, presakovanie jedného média do druhého a podobne. Základným pojmom perkolačnej teórie je perkolačný klaster, ktorý sa po orezaní nikam nevedúcich vetiev stáva perkolačnou kostrou („ backbone“). 
Úlohou záverečného projektu projektu bude analyzovať numericky perkolačné „backbones“ istého typu, a pokúsiť sa rozpracovať numerickú metódu ich triedenia. Táto metóda by mala uľahčiť hľadanie súvislostí medzi typom backbones a výslednou pravdepodobnostnou štruktúrou.
', 'V práci sa počíta pravdepodobnostná štruktúra modelu smerovanej perkolácie na štvorcovej   mriežke. Model smerovanej perkolácie je vhodný na štúdium takých fyzikálnych procesov ako polymerizácia, šírenie porúch, šírenie požiarov, presakovanie jedného média do druhého a podobne. Základným pojmom perkolačnej teórie je perkolačný klaster, ktorý sa po orezaní nikam nevedúcich vetiev stáva perkolačnou kostrou („ backbone“). 
Úlohou záverečného projektu projektu bude analyzovať numericky perkolačné „backbones“ istého typu, a pokúsiť sa rozpracovať numerickú metódu ich triedenia. Táto metóda by mala uľahčiť hľadanie súvislostí medzi typom backbones a výslednou pravdepodobnostnou štruktúrou.
', 1);
INSERT INTO projects VALUES (558, 'ZP', 342, NULL, 520, '2004/2005', 'Programový systém pre návrh riadiacich jednotiek na báze  mikropočítača. ', 'Program system for design of control systems based on microcomputers', 'Analyzujte možnosti využitia existujúcich mikropočítačových modulov na návrh a realizáciu riadiacich jednotiek. 
Navrhnite inštrukčný súbor virtuálneho procesora vhodného na realizáciu vybranej triedy riadiacich jednotiek.
Navrhnite a zrealizujte vybranú časť prekladača programu  virtuálneho procesora na program v JSI vybraného mikropočítača.
', 'Analyzujte možnosti využitia existujúcich mikropočítačových modulov na návrh a realizáciu riadiacich jednotiek. 
Navrhnite inštrukčný súbor virtuálneho procesora vhodného na realizáciu vybranej triedy riadiacich jednotiek.
Navrhnite a zrealizujte vybranú časť prekladača programu  virtuálneho procesora na program v JSI vybraného mikropočítača.
', 0);
INSERT INTO projects VALUES (559, 'DP', 358, NULL, 520, '2005/2006', 'Penetračné testovanie', 'Penetračné testovanie', NULL, NULL, 0);
INSERT INTO projects VALUES (560, 'DP', 260, NULL, 521, '2005/2006', 'Detekcia neštandardných stavov v operačnom systéme', 'Detection of exceptional states in the operating system', NULL, NULL, 1);
INSERT INTO projects VALUES (561, 'ZP', 260, NULL, 521, '2003/2004', 'Monitorovanie procesov v operačnom systéme UNIX', 'Monitoring processes in UNIX operating system', 'Vytvorte nástroj, ktorý umožní sledovať aktivitu procesov v operačnom systéme. Príkladom informácií, ktoré je potrebné získať môže byť: kto, kedy a ako spúšťa procesy; ktoré procesy a kedy bežia v systéme; aké sú vzťahy medzi bežiacimi procesmi (vzťah rodič-potomok, medziprocesová komunikácia, ...); ako sa mení stav procesu. Výstupy nástroja štatisticky spracujte a vytvorte základ profilu operačného systému.', 'Vytvorte nástroj, ktorý umožní sledovať aktivitu procesov v operačnom systéme. Príkladom informácií, ktoré je potrebné získať môže byť: kto, kedy a ako spúšťa procesy; ktoré procesy a kedy bežia v systéme; aké sú vzťahy medzi bežiacimi procesmi (vzťah rodič-potomok, medziprocesová komunikácia, ...); ako sa mení stav procesu. Výstupy nástroja štatisticky spracujte a vytvorte základ profilu operačného systému.', 1);
INSERT INTO projects VALUES (562, 'ZP', 660, NULL, 522, '2003/2004', 'CSIDC 2004', 'CSIDC 2004', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 1);
INSERT INTO projects VALUES (563, 'DP', 541, NULL, 522, '2005/2006', 'Informačný systém pre bezpečnú mobilnú komunikáciu', 'Information system for secure mobile communication', NULL, NULL, 1);
INSERT INTO projects VALUES (564, 'DP', 27, NULL, 523, '2005/2006', 'Virtuálne graffiti', 'Virtual graffiti', NULL, NULL, 1);
INSERT INTO projects VALUES (565, 'ZP', 27, NULL, 523, '2003/2004', 'Virtuálne graffiti', 'Virtual graffity', 'Analyzujte dostupné prostriedky pre tvorbu obohatenej (augmented) reality, založené na kombinovaní reálneho a syntetického obrazu. Navrhnite a realizujte jednoduchý príklad vo forme kombinácie obrazových predlôh a snímok reálneho okolia. Pri realizácii využite dostupné metódy snímania obrazu, rozpoznávania značiek v obraze a generovania virtuálnych obrazov', 'Analyzujte dostupné prostriedky pre tvorbu obohatenej (augmented) reality, založené na kombinovaní reálneho a syntetického obrazu. Navrhnite a realizujte jednoduchý príklad vo forme kombinácie obrazových predlôh a snímok reálneho okolia. Pri realizácii využite dostupné metódy snímania obrazu, rozpoznávania značiek v obraze a generovania virtuálnych obrazov', 1);
INSERT INTO projects VALUES (566, 'DP', 541, NULL, 524, '2005/2006', 'Informačný systém pre mobilnú kanceláriu', 'Information system for mobile office', NULL, NULL, 1);
INSERT INTO projects VALUES (567, 'ZP', 660, NULL, 524, '2003/2004', 'CSIDC 2004', 'CSIDC 2004', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 1);
INSERT INTO projects VALUES (568, 'ZP', 580, 358, 525, '2004/2005', 'Zostrojenie a riadenie šesťnohého robota', 'Construction and control of six legged robot', 'Zostrojiť šesťnohého chodiaceho autonómneho robota, schopného vyhýbať sa prekážkam a sledovať čiernu čiaru na bielom podklade.
 
Úlohou projektu je naštudovať princípy chôdze a udržania stability v systéme so šiestimi nohami, naštudovať existujúce riešenia šesťnohých robotov a porovnať ich medzi sebou,  na základe týchto poznatkov navrhnúť vlastnú konštrukciu,  navrhnúť obvodové riešenie riadiaceho obvodu a riadiaci algoritmus,  riadiaci obvod zrealizovať, vykonať základné merania, otestovať a napísať  program pre prácu jednotky a vypracovať dokumentáciu (schéma zapojenia riadiacej časti, pripojenie, vývojový diagram a výpis programu).
', 'Zostrojiť šesťnohého chodiaceho autonómneho robota, schopného vyhýbať sa prekážkam a sledovať čiernu čiaru na bielom podklade.
 
Úlohou projektu je naštudovať princípy chôdze a udržania stability v systéme so šiestimi nohami, naštudovať existujúce riešenia šesťnohých robotov a porovnať ich medzi sebou,  na základe týchto poznatkov navrhnúť vlastnú konštrukciu,  navrhnúť obvodové riešenie riadiaceho obvodu a riadiaci algoritmus,  riadiaci obvod zrealizovať, vykonať základné merania, otestovať a napísať  program pre prácu jednotky a vypracovať dokumentáciu (schéma zapojenia riadiacej časti, pripojenie, vývojový diagram a výpis programu).
', 0);
INSERT INTO projects VALUES (569, 'DP', 96, NULL, 525, '2005/2006', 'Získanie hľbkovej informácie pomocou vizuálneho systému', 'Získanie hľbkovej informácie pomocou vizuálneho systému', NULL, NULL, 4);
INSERT INTO projects VALUES (570, 'ZP', 517, NULL, 526, '2004/2005', 'Zložitostná analýza algoritmov smerovania na počítačových sieťach', 'Complexity analysis of routing algorithms in computer networks', 'Uvažujme rôzne smerovacie stratégie na počítačových sieťach ako sú: smerovacie tabuľky, intervalové smerovanie, prefixové smerovanie a pod.  
Cieľom práce je teoretická/zložitostná analýza rôznych typov smerovacích algortimov a ich porovnanie. Základný teoretický model je abstrakný počítač RAM. Dosiahnuté teoretické výsledky je nutné prakticky overiť na RAM-simulátore.  ', 'Uvažujme rôzne smerovacie stratégie na počítačových sieťach ako sú: smerovacie tabuľky, intervalové smerovanie, prefixové smerovanie a pod.  
Cieľom práce je teoretická/zložitostná analýza rôznych typov smerovacích algortimov a ich porovnanie. Základný teoretický model je abstrakný počítač RAM. Dosiahnuté teoretické výsledky je nutné prakticky overiť na RAM-simulátore.  ', 1);
INSERT INTO projects VALUES (571, 'DP', 517, NULL, 526, '2005/2006', 'Smerovacie algoritmy na špeciálnych druhoch sietí', 'Smerovacie algoritmy na špeciálnych druhoch sietí', NULL, NULL, 1);
INSERT INTO projects VALUES (572, 'DP', 437, NULL, 527, '2005/2006', 'Vyhľadávanie údajov v pavučine s významom', 'Retrieval information in semantic web', NULL, NULL, 1);
INSERT INTO projects VALUES (573, 'ZP', 24, NULL, 527, '2003/2004', 'Algoritmizácia v príkladoch -  usporadúvanie', 'Algorithms in examples - sorting', 'Analyzujte vybrané algoritmické metódy využívané v databázových systémoch (prehľadávanie a usporadúvanie záznamov)  z hľadiska ich využitia v súčasných softvérových aplikáciách. Porovnajte jednotlivé metódy podľa vybraných kritérií. Spracujte  vybrané algoritmy do množiny  príkladov vo forme  hypertextu, s presne stanovenou štruktúrou. Štruktúra bude odrážať životný cyklus programu a zároveň algoritmy rovnakého typu budú vyhodnocované na reprezentatívnej vzorke údajov a navzájom porovnávané.  Vizualizujte  prezentáciu vykonávania algoritmov', 'Analyzujte vybrané algoritmické metódy využívané v databázových systémoch (prehľadávanie a usporadúvanie záznamov)  z hľadiska ich využitia v súčasných softvérových aplikáciách. Porovnajte jednotlivé metódy podľa vybraných kritérií. Spracujte  vybrané algoritmy do množiny  príkladov vo forme  hypertextu, s presne stanovenou štruktúrou. Štruktúra bude odrážať životný cyklus programu a zároveň algoritmy rovnakého typu budú vyhodnocované na reprezentatívnej vzorke údajov a navzájom porovnávané.  Vizualizujte  prezentáciu vykonávania algoritmov', 1);
INSERT INTO projects VALUES (574, 'DP', 655, NULL, 528, '2005/2006', 'Dynamický rezervoár Echo state neurónových sietí', 'Dynamický rezervoár Echo state neurónových sietí', NULL, NULL, 1);
INSERT INTO projects VALUES (575, 'ZP', 541, NULL, 528, '2004/2005', 'Zálohovanie a obnova dát v databázach', 'Backup and recovery in relation database management systems', 'Analyzujte metódy a prostriedky zálohovania a obnovy dát v relačných databázových systémoch. Definujte výhody a nedostatky zálohovania a obnovy dát v DBS Oracle. Navrhnite možné metódy zlepšenia a rozšírenia funkcií zálohovania a obnovy dát. Vybraté  metódy implementujte v prostredí Oracle. Funkčnosť systému demonštrujte na vybratom príklade.', 'Analyzujte metódy a prostriedky zálohovania a obnovy dát v relačných databázových systémoch. Definujte výhody a nedostatky zálohovania a obnovy dát v DBS Oracle. Navrhnite možné metódy zlepšenia a rozšírenia funkcií zálohovania a obnovy dát. Vybraté  metódy implementujte v prostredí Oracle. Funkčnosť systému demonštrujte na vybratom príklade.', 1);
INSERT INTO projects VALUES (576, 'ZP', 388, NULL, 529, '2003/2004', 'Spracovanie študentských projektov', 'Spracovanie študentských projektov', 'Analyzujte typické činnosti v životnom cykle študentských projektov riešených v rámci informatických predmetov na KIVT. Analyzujte  možnosti spracovania týchto činností v prostredí internetu a navrhnite softvérový systém na ich podporu.  Systém musí podporovať činnosti ako: tvorbu tém projektov k predmetu zo strany učiteľov, výber a schválenie konečnej množiny tém, prezentáciu tém v pavučine pre študentov, výber preferovaných tém zo strany študentov, proces pridelenia témy, prezentáciu konečného pridelenia,  odovzdanie riešenia v jednotlivých kontrolných bodoch, atď. Musí zabezpečiť autorizovaný prístup rôznych kategórií používateľov. 
Navrhnuté riešenie overte implementovaním softvérového prototypu pre vybrané činnosti životného cyklu projektu. 
', 'Analyzujte typické činnosti v životnom cykle študentských projektov riešených v rámci informatických predmetov na KIVT. Analyzujte  možnosti spracovania týchto činností v prostredí internetu a navrhnite softvérový systém na ich podporu.  Systém musí podporovať činnosti ako: tvorbu tém projektov k predmetu zo strany učiteľov, výber a schválenie konečnej množiny tém, prezentáciu tém v pavučine pre študentov, výber preferovaných tém zo strany študentov, proces pridelenia témy, prezentáciu konečného pridelenia,  odovzdanie riešenia v jednotlivých kontrolných bodoch, atď. Musí zabezpečiť autorizovaný prístup rôznych kategórií používateľov. 
Navrhnuté riešenie overte implementovaním softvérového prototypu pre vybrané činnosti životného cyklu projektu. 
', 1);
INSERT INTO projects VALUES (577, 'DP', 388, NULL, 529, '2005/2006', 'Správa a publikovanie dokumentov  v prostredí sémantického webu.', 'Správa a publikovanie dokumentov  v prostredí sémantického webu.', NULL, NULL, 1);
INSERT INTO projects VALUES (578, 'ZP', 447, NULL, 530, '2004/2005', 'Informačný portál ústavu na báze webu so sémantikou', 'Semantic web based portal of the institute', 'Pod ontológiou rozumieme konceptuálny opis znalostí vyjadrený explicitne s dôrazom na jej zdieľateľnosť. Analyzujte funkcie ontológií v prostredí Sémantického webu. Pri analýze vychádzajte z množiny jazykov používaných v prostredí webu so sémantikou, ktoré podporujú jeho architektúru (XML, RDF, RDFS, OWL). Navrhnite ontológiu Ústavu informatiky a softvérového inžinierstva. Navrhnutú ontológiu naplňte znalosťami a tieto prezentujte vo forme informačného portálu ústavu.', 'Pod ontológiou rozumieme konceptuálny opis znalostí vyjadrený explicitne s dôrazom na jej zdieľateľnosť. Analyzujte funkcie ontológií v prostredí Sémantického webu. Pri analýze vychádzajte z množiny jazykov používaných v prostredí webu so sémantikou, ktoré podporujú jeho architektúru (XML, RDF, RDFS, OWL). Navrhnite ontológiu Ústavu informatiky a softvérového inžinierstva. Navrhnutú ontológiu naplňte znalosťami a tieto prezentujte vo forme informačného portálu ústavu.', 1);
INSERT INTO projects VALUES (579, 'DP', 447, NULL, 530, '2005/2006', 'Integrovanie a organizácia informácií na webe so sémantikou', 'Integrovanie a organizácia informácií na webe so sémantikou', NULL, NULL, 1);
INSERT INTO projects VALUES (580, 'ZP', 588, 563, 531, '2004/2005', 'Identifikačné systémy', 'Identification systems', 'Analyzujte technické a programové prostredie pre realizáciu identifikačných systémov. Porovnajte kontaktné a bezdrôtové systémy uvedené (minimálne od dvoch výrobcov) na základe definovaných technických parametrov. Navrhnite obvodovú schému pre jednoduchý identifikačný systém riadený vhodným mikroprocesorom. Napíšte a overte program pre riadenie mikroprocesoru.

', 'Analyzujte technické a programové prostredie pre realizáciu identifikačných systémov. Porovnajte kontaktné a bezdrôtové systémy uvedené (minimálne od dvoch výrobcov) na základe definovaných technických parametrov. Navrhnite obvodovú schému pre jednoduchý identifikačný systém riadený vhodným mikroprocesorom. Napíšte a overte program pre riadenie mikroprocesoru.

', 0);
INSERT INTO projects VALUES (581, 'DP', 360, NULL, 531, '2005/2006', 'Nedokonalosti v realizácii kombinačných logických obvodov', 'Nedokonalosti v realizácii kombinačných logických obvodov', NULL, NULL, 0);
INSERT INTO projects VALUES (582, 'DP', 13, 301, 532, '2005/2006', 'E-systém pre spoľahivosť digitálnych systémov', 'E-systém pre spoľahivosť digitálnych systémov', NULL, NULL, 0);
INSERT INTO projects VALUES (583, 'ZP', 13, 301, 532, '2004/2005', 'Parametre a hodnotenie spoľahlivosti elektronických systémov', 'Parameters and evaluating of  reliability of electronic systems', 'Preštudujte základné parametre spoľahlivosti a architektúry spoľahlivostných systémov a metódy ich hodnotenia. Navrhnite systém pre automatické hodnotenie spoľahlivostných modelov, t.j. výpočty pravdepodobnosti bezporuchovej prevádzky, pravdepodobnosť do poruchy, atď.  Zadaná architektúra by mala byť zadávaná graficky a celý systém by mal byť implementovaný v jazyku JAVA s grafickým rozhraním.
Systém by mal byť doplnený vysvetľujúcimi príkladmi. Systém bude využívaný na cvičeniach predmetu Diagnostika a spoľahlivosť. ', 'Preštudujte základné parametre spoľahlivosti a architektúry spoľahlivostných systémov a metódy ich hodnotenia. Navrhnite systém pre automatické hodnotenie spoľahlivostných modelov, t.j. výpočty pravdepodobnosti bezporuchovej prevádzky, pravdepodobnosť do poruchy, atď.  Zadaná architektúra by mala byť zadávaná graficky a celý systém by mal byť implementovaný v jazyku JAVA s grafickým rozhraním.
Systém by mal byť doplnený vysvetľujúcimi príkladmi. Systém bude využívaný na cvičeniach predmetu Diagnostika a spoľahlivosť. ', 0);
INSERT INTO projects VALUES (584, 'ZP', 579, NULL, 533, '2004/2005', 'Multimediálne informácie v regionálnom IS', 'Multimedial information in regional IS', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie existujúceho základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb FIIT.', 'Analyzujte možnosti využitia multimediálnej informácie v systémoch na podporu turistického ruchu. Navrhnite rozšírenie existujúceho základného systému o vhodné štruktúry a funkcie, ktoré by zvýraznili využitie textového a číselného obsahu o rôzne iné formy ich prezentácie, ako aj doplnenie nových informácií v podobe zvukov, animácií, videosekvencií a pod. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na údajoch podľa potrieb FIIT.', 1);
INSERT INTO projects VALUES (585, 'DP', 374, NULL, 533, '2005/2006', 'Informačná podpora procesov ochrany kultúrneho dedičstva metódou výskumného prototypovania', 'Informačná podpora procesov ochrany kultúrneho dedičstva metódou výskumného prototypovania', NULL, NULL, 4);
INSERT INTO projects VALUES (586, 'DP', 437, NULL, 534, '2005/2006', 'Vyhľadávanie údajov v pavučine s významom', 'Vyhľadávanie údajov v pavučine s významom', NULL, NULL, 1);
INSERT INTO projects VALUES (587, 'ZP', 437, NULL, 534, '2003/2004', 'Softvér ako výsledok technickej tvorivej duševnej činnosti', 'Software as a result of creative mental technical activity', 'Uveďte pojem softvér z pohľadu technického aj právneho, pričom uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Vysvetlite, aké sú práva na softvér, čo je to ochrana takýchto práv, prečo treba takéto práva chrániť s dôrazom na etické a spoločenské súvislosti. Opíšte známe právne riešenia ochrany softvéru, pričom opäť uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Analyzujte súčasný stav, pomenujte prípadné otvorené problémy a naznačte možnosti ich riešenia. O celej problematike vytvorte tématické pavučinové sídlo, ktoré bude slúžiť ako zdroj informácií aj odkazov na ne. ', 'Uveďte pojem softvér z pohľadu technického aj právneho, pričom uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Vysvetlite, aké sú práva na softvér, čo je to ochrana takýchto práv, prečo treba takéto práva chrániť s dôrazom na etické a spoločenské súvislosti. Opíšte známe právne riešenia ochrany softvéru, pričom opäť uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Analyzujte súčasný stav, pomenujte prípadné otvorené problémy a naznačte možnosti ich riešenia. O celej problematike vytvorte tématické pavučinové sídlo, ktoré bude slúžiť ako zdroj informácií aj odkazov na ne. ', 1);
INSERT INTO projects VALUES (588, 'ZP', 436, NULL, 535, '2004/2005', 'Prípadova štúdia formálneho opisu komunikačného protokolu ', 'Prípadova štúdia formálneho opisu komunikačného protokolu ', 'Pre zadaný prípad komunikačného protokolu zostavte jeho formálny 
(matematicky presný) opis. Pri formálnom opise treba vychádzať z komunikačných formúl vypracovaných na FIIT.  ', 'Pre zadaný prípad komunikačného protokolu zostavte jeho formálny 
(matematicky presný) opis. Pri formálnom opise treba vychádzať z komunikačných formúl vypracovaných na FIIT.  ', 0);
INSERT INTO projects VALUES (589, 'ZP', 160, 704, 536, '2003/2004', 'Monitorovanie automobilov v reálnom čase', 'Real-time car monitoring', 'V súčasnosti existuje veľké množstvo spoločností vlastniacich niekoľko pracovných automobilov. Z hľadiska starostlivosti o ne je rozumné mať nepretržité informácie o polohe týchto vozidiel. Vzniká potreba systému na sledovanie polohy automobilov v reálnom čase. Systém by mal byť schopný pracovať aj s databázou a realizovať rekonštrukcie výjazdov vozidiel, pripadne poskytovať doplňujúce informácie o automobile, jeho vodičovi a konkrétnom výjazde.
Analyzujte problematiku monitorovania automobilov v reálnom čase. Navrhnite riešenie mapového podkladu a jeho zobrazovanie v rôznych mierkach. Analyzujte riešenie zberu potrebných údajov a ich následné použitie na presné zaznamenávanie trajektórie pohybu vozidla do systému máp. Ďalej analyzujte možnosti implementačných riešení pre  takýto typ aplikácie. Na základe analýzy problému navrhnite a vytvorte prototyp sieťovej aplikácie na  sledovanie vozidiel.
', 'V súčasnosti existuje veľké množstvo spoločností vlastniacich niekoľko pracovných automobilov. Z hľadiska starostlivosti o ne je rozumné mať nepretržité informácie o polohe týchto vozidiel. Vzniká potreba systému na sledovanie polohy automobilov v reálnom čase. Systém by mal byť schopný pracovať aj s databázou a realizovať rekonštrukcie výjazdov vozidiel, pripadne poskytovať doplňujúce informácie o automobile, jeho vodičovi a konkrétnom výjazde.
Analyzujte problematiku monitorovania automobilov v reálnom čase. Navrhnite riešenie mapového podkladu a jeho zobrazovanie v rôznych mierkach. Analyzujte riešenie zberu potrebných údajov a ich následné použitie na presné zaznamenávanie trajektórie pohybu vozidla do systému máp. Ďalej analyzujte možnosti implementačných riešení pre  takýto typ aplikácie. Na základe analýzy problému navrhnite a vytvorte prototyp sieťovej aplikácie na  sledovanie vozidiel.
', 1);
INSERT INTO projects VALUES (590, 'DP', 704, NULL, 536, '2005/2006', 'Digitálny video záznamník', 'DIGITAL VIDEORECORDER', NULL, NULL, 1);
INSERT INTO projects VALUES (591, 'ZP', 13, 431, 537, '2003/2004', 'Návrh a simulácia vzorového číslicového systému na čipe pre overovanie architektúr testovateľnosti', 'The design and simulation of benchmark digital system on chip for verification of testing architectures ', 'Analyzujte existujúce “benchmark” obvody modelované vo VHDL alebo Verilog. Navrhnite a odsimulujte čislicový systém na čipe vhodný pre overovanie funkčnosti a efektívnosti metód i algoritmov návrhu na ľahkú a samočinnú testovateľnosť. Výsledný vzorový systém na čipe musí byť odsimulovaný a syntetizovateľný v prostredí FPGA Advantages a overený na príkladoch s aplikáciou vybraných metód návrhu na testovateľnosť.', 'Analyzujte existujúce “benchmark” obvody modelované vo VHDL alebo Verilog. Navrhnite a odsimulujte čislicový systém na čipe vhodný pre overovanie funkčnosti a efektívnosti metód i algoritmov návrhu na ľahkú a samočinnú testovateľnosť. Výsledný vzorový systém na čipe musí byť odsimulovaný a syntetizovateľný v prostredí FPGA Advantages a overený na príkladoch s aplikáciou vybraných metód návrhu na testovateľnosť.', 0);
INSERT INTO projects VALUES (592, 'DP', 13, 431, 537, '2004/2005', 'Automatický systém pre integráciu digitálnych blokov v  návrhu SOC', 'Automatický systém pre integráciu digitálnych blokov v  návrhu SOC', NULL, NULL, 0);
INSERT INTO projects VALUES (593, 'DP', 548, 298, 538, '2005/2006', 'Telemetrický zberový systém s využitím GPRS technológie', 'Telemetric gathering system with the use of GPRS technology', NULL, NULL, 0);
INSERT INTO projects VALUES (594, 'ZP', 705, NULL, 538, '2003/2004', 'Analyzátor logických kombinačných obvodov s normálnou štruktúrou', 'Analyzer of combinatorial logical circuits with normal structure', 'Treba navrhnúť programový systém pre analýzu logických kombinačných obvodov s normálnou štruktúrou. Logický kombinačný obvod s viacerými výstupmi sa má zadávať svojou štruktúrou. Systém funkcií, ktoré obvod realizuje,  má byť zapísaný  formou mapy, pravdivostnou tabuľkou, vektorovým a číselným zápisom. ', 'Treba navrhnúť programový systém pre analýzu logických kombinačných obvodov s normálnou štruktúrou. Logický kombinačný obvod s viacerými výstupmi sa má zadávať svojou štruktúrou. Systém funkcií, ktoré obvod realizuje,  má byť zapísaný  formou mapy, pravdivostnou tabuľkou, vektorovým a číselným zápisom. ', 0);
INSERT INTO projects VALUES (595, 'ZP', 27, NULL, 539, '2004/2005', 'Vývojové prostredie pre algoritmy správy paralelných procesov', 'Vývojové prostredie pre algoritmy správy paralelných procesov', 'Analyzujte dostupné otvorené modely správy paralelných procesov, z hľadiska ich použiteľnosti ako vývojového a testovacieho prostredia pre nové implementačné metódy v architektúrach operačných systémov. Navrhnite a realizujte vývojové a testovacie prostredie, zamerané na správu procesov. V tomto prostredí demonštrujte príklady vytvorených a testovaných algoritmov.', 'Analyzujte dostupné otvorené modely správy paralelných procesov, z hľadiska ich použiteľnosti ako vývojového a testovacieho prostredia pre nové implementačné metódy v architektúrach operačných systémov. Navrhnite a realizujte vývojové a testovacie prostredie, zamerané na správu procesov. V tomto prostredí demonštrujte príklady vytvorených a testovaných algoritmov.', 1);
INSERT INTO projects VALUES (596, 'ZP', 704, NULL, 542, '2004/2005', 'Návrh a implementácia  webovskej reprezentácie centrálneho kultúrneho pracoviska', 'Návrh a implementácia  webovskej reprezentácie centrálneho kultúrneho pracoviska', 'Pojednajte o existujúcich systémoch na správu webovského obsahu (CMS-Web Content Management Systems) a analyzujte ich. Na základe prvotnej špecifikácie pracoviska  a  na základe analýzy navrhnite vhodný CMS pre správu  webovského portálu kultúrnej ustanovizne. Návrh realizujte a vzhľadom na charakter a aktivity ustanovizne uvažujte  s možnosťou diskusného fóra. Vybraný CMS  apoň čiastočne naplňte. ', 'Pojednajte o existujúcich systémoch na správu webovského obsahu (CMS-Web Content Management Systems) a analyzujte ich. Na základe prvotnej špecifikácie pracoviska  a  na základe analýzy navrhnite vhodný CMS pre správu  webovského portálu kultúrnej ustanovizne. Návrh realizujte a vzhľadom na charakter a aktivity ustanovizne uvažujte  s možnosťou diskusného fóra. Vybraný CMS  apoň čiastočne naplňte. ', 1);
INSERT INTO projects VALUES (597, 'DP', 13, 301, 543, '2004/2005', 'Automatický generátor testov funkčných testov pre digitálne systémy', 'Automatic functional test generator for digital systems', NULL, NULL, 0);
INSERT INTO projects VALUES (598, 'DP', 545, 301, 544, '2004/2005', 'Systém automatického generovania blokov samočinného testovania pamätí modelovaných vo VHDL', 'Automatic generation system of self-test blocks  for  memories modeled in VHDL', NULL, NULL, 0);
INSERT INTO projects VALUES (599, 'DP', 219, 27, 546, '2004/2005', 'Modelovanie komplexných systémov', 'Modeling of Complex Systems', NULL, NULL, 1);
INSERT INTO projects VALUES (600, 'ZP', 358, NULL, 550, '2002/2003', 'Testovanie bezpečnostnej brány', 'Firewall testing', NULL, NULL, 0);
INSERT INTO projects VALUES (601, 'DP', 551, 358, 550, '2003/2004', 'Modelovanie počítačovej siete', 'Modeling of computer network', NULL, NULL, 0);
INSERT INTO projects VALUES (602, 'ZP', 359, NULL, 552, '2004/2005', 'Monitorovací panel do PC', 'Monitoring panel for PC', 'Navrhnite a zostrojte hardwarový monitorovací panel pre osobný počítač/server. Jeho úlohou je kontrola správnej činnosti a stavu PC a jeho ovládanie. Pod kontrolou a ovládaním sa myslí monitorovanie teploty komponentov PC (aspoň 4 teplotné senzory), monitorovanie a riadenie otáčok ventilátorov, monitorovanie iných snímačov (otvorenie case počítača, výpadok napájania), riadenie signálu reset a power on/off. Takýto hw monitor bude komunikovať s používateľom prostredníctvom displaya a jednoduchej klávesnice. Konfigurovanie a čítanie aktuálneho stavu bude možné aj priamo z PC cez sériový port (resp. USB) (naprogramované ako PnP zariadenie s vlastným driverom). Podpora OS Windows poprípade UNIX/Linux. Hw monitor bude obsahovať signalizačnú sirénu na indikáciu poruchového stavu.', 'Navrhnite a zostrojte hardwarový monitorovací panel pre osobný počítač/server. Jeho úlohou je kontrola správnej činnosti a stavu PC a jeho ovládanie. Pod kontrolou a ovládaním sa myslí monitorovanie teploty komponentov PC (aspoň 4 teplotné senzory), monitorovanie a riadenie otáčok ventilátorov, monitorovanie iných snímačov (otvorenie case počítača, výpadok napájania), riadenie signálu reset a power on/off. Takýto hw monitor bude komunikovať s používateľom prostredníctvom displaya a jednoduchej klávesnice. Konfigurovanie a čítanie aktuálneho stavu bude možné aj priamo z PC cez sériový port (resp. USB) (naprogramované ako PnP zariadenie s vlastným driverom). Podpora OS Windows poprípade UNIX/Linux. Hw monitor bude obsahovať signalizačnú sirénu na indikáciu poruchového stavu.', 0);
INSERT INTO projects VALUES (603, 'DP', 541, NULL, 552, '2005/2006', 'Systém automatizovaného odčítavania plynomerov a vodomerov', 'Systém automatizovaného odčítavania plynomerov a vodomerov', NULL, NULL, 4);
INSERT INTO projects VALUES (604, 'ZP', 297, NULL, 553, '2004/2005', 'Útoky v sieťach a obrana', 'Computer network attacks and security', 'Analyzujte typy vírusov v počítačovej sieti. Skúmajte metódy identifikácie vírusov. Oboznámte sa s existujúcimi antivírovými systémami. Vytvorte softvérový prostriedok, ktorý  dokáže odhaliť z poslanej e-mailovej správy pravdepodobnú prítomnosť vírusu a vydedukovať možný spôsob jeho rozvinutia. Výstupom bude odporúčanie pre príjemcu správy, do akej miery je bezpečné správu otvárať, prípadne s ňou manipulovať.', 'Analyzujte typy vírusov v počítačovej sieti. Skúmajte metódy identifikácie vírusov. Oboznámte sa s existujúcimi antivírovými systémami. Vytvorte softvérový prostriedok, ktorý  dokáže odhaliť z poslanej e-mailovej správy pravdepodobnú prítomnosť vírusu a vydedukovať možný spôsob jeho rozvinutia. Výstupom bude odporúčanie pre príjemcu správy, do akej miery je bezpečné správu otvárať, prípadne s ňou manipulovať.', 1);
INSERT INTO projects VALUES (605, 'DP', 294, NULL, 553, '2005/2006', 'Aplikácie virtuálnej reality vo vizuálnom dolovaní v dátach', 'Aplikácie virtuálnej reality vo vizuálnom dolovaní v dátach', NULL, NULL, 4);
INSERT INTO projects VALUES (606, 'ZP', 655, NULL, 554, '2004/2005', 'Nástroj pre analýzu javov v neurónových sieťach', 'Visual demonstration of various phenomena in field of neural networks', 'Rekurentné neurónové siete sú na rozdiel od klasických dopredných neurónových sietí schopné spracovávať vstupy s časopriestorovou štruktúrou, ako sú napríklad časové postupnosti symbolov. Pri ich skúmaní boli opísané viaceré zaujímavé javy, ktoré vyžadujú podrobnejšiu analýzu pre ich lepšie pochopenie.
Naštudujte problematiku rekurentných neurónových sietí, zamerajte sa na javy v rekurentných sieťach ako architektutálny bias (fraktálová štruktúra stavového priestoru), zmena stavovej reprezentácie v procese učenia, prípadne strácanie chybových signálov v čase. Navrhnite a vytvorte nástroj (napr. JAVA applet), ktorý by umožnil pomocou zaujímavých vizualizácii prehľadné znázornenie týchto javov a tak ich následné skúmanie.  Vytvorené riešenie overte na zvolených testovacích postupnostiach.', 'Rekurentné neurónové siete sú na rozdiel od klasických dopredných neurónových sietí schopné spracovávať vstupy s časopriestorovou štruktúrou, ako sú napríklad časové postupnosti symbolov. Pri ich skúmaní boli opísané viaceré zaujímavé javy, ktoré vyžadujú podrobnejšiu analýzu pre ich lepšie pochopenie.
Naštudujte problematiku rekurentných neurónových sietí, zamerajte sa na javy v rekurentných sieťach ako architektutálny bias (fraktálová štruktúra stavového priestoru), zmena stavovej reprezentácie v procese učenia, prípadne strácanie chybových signálov v čase. Navrhnite a vytvorte nástroj (napr. JAVA applet), ktorý by umožnil pomocou zaujímavých vizualizácii prehľadné znázornenie týchto javov a tak ich následné skúmanie.  Vytvorené riešenie overte na zvolených testovacích postupnostiach.', 1);
INSERT INTO projects VALUES (607, 'DP', 387, NULL, 554, '2005/2006', 'Štatistické modelovanie hypertextu', 'Štatistické modelovanie hypertextu', NULL, NULL, 1);
INSERT INTO projects VALUES (608, 'ZP', 294, NULL, 555, '2004/2005', 'Prostredia pre tvorbu a prehliadanie modelov virtuálnej reality', 'Systems for modeling and viewing virtual reality models', 'Urobte prehľad existujúcich systémov pre tvorbu a prezentáciu systémov pre aplikácie Web3D. Porovnajte  existujúce systémy a zamerajte sa na VRML a EON Reality.  Demonštrujte funkciu modelu na jednoduchej interaktívnej scény naprogramovanej pomocou VRML a EON Reality.
Informácie:
 1. Oficiálna stránka konzorcia Web3D: http://www.web3d.org
 2. Stránka firmy EON Reality: http://www.eonreality.com
 3. Stránka VRML:http://www.vrml.org
 ', 'Urobte prehľad existujúcich systémov pre tvorbu a prezentáciu systémov pre aplikácie Web3D. Porovnajte  existujúce systémy a zamerajte sa na VRML a EON Reality.  Demonštrujte funkciu modelu na jednoduchej interaktívnej scény naprogramovanej pomocou VRML a EON Reality.
Informácie:
 1. Oficiálna stránka konzorcia Web3D: http://www.web3d.org
 2. Stránka firmy EON Reality: http://www.eonreality.com
 3. Stránka VRML:http://www.vrml.org
 ', 1);
INSERT INTO projects VALUES (609, 'DP', 33, NULL, 555, '2005/2006', 'Tvorba a porovnanie náučnej 2D a 3D simulácie', 'Tvorba a porovnanie náučnej 2D a 3D simulácie', NULL, NULL, 1);
INSERT INTO projects VALUES (610, 'ZP', 20, NULL, 556, '2004/2005', 'Hra pre mobilné zariadenia', 'Game for mobile devices', 'Mobilné zariadenia umožňujúce vykonávanie užívateľom dodaných programov sú čoraz dostupnejšie. Naštudujte možnosti programovania aplikácií pre mobilné zariadenia pomocou Java 2 Micro Edition. Vytvorte  aplikáciu – hru vyžadujúcu oponenta, pričom logika oponenta bude realizovaná priamo na mobilnom zariadení.
', 'Mobilné zariadenia umožňujúce vykonávanie užívateľom dodaných programov sú čoraz dostupnejšie. Naštudujte možnosti programovania aplikácií pre mobilné zariadenia pomocou Java 2 Micro Edition. Vytvorte  aplikáciu – hru vyžadujúcu oponenta, pričom logika oponenta bude realizovaná priamo na mobilnom zariadení.
', 1);
INSERT INTO projects VALUES (611, 'DP', 98, NULL, 556, '2005/2006', 'Generovanie, spracovanie a rozpoznávanie digitálnych kriviek', 'Generovanie, spracovanie a rozpoznávanie digitálnych kriviek', NULL, NULL, 1);
INSERT INTO projects VALUES (612, 'ZP', 25, NULL, 558, '2004/2005', 'Koncentrátor paralelných rozhraní', 'System for concentration of parallel interfaces', 'Analyzujte funkciu snímača odtlačkov prstov BioMouse a spôsob komunikácie s nadradeným počítačom. Navrhnite spôsob konverzie paralelného rozhrania na sériové za účelom zvýšenia prenosovej vzdialenosti a s možnosťou pripojenia viacerých zariadení súčasne. Navrhnutý systém implementujte spolu s potrebným programovým vybavením na strane nadradeného počítača. Overte funkčnosť a spoľahlivosť riešenia.', 'Analyzujte funkciu snímača odtlačkov prstov BioMouse a spôsob komunikácie s nadradeným počítačom. Navrhnite spôsob konverzie paralelného rozhrania na sériové za účelom zvýšenia prenosovej vzdialenosti a s možnosťou pripojenia viacerých zariadení súčasne. Navrhnutý systém implementujte spolu s potrebným programovým vybavením na strane nadradeného počítača. Overte funkčnosť a spoľahlivosť riešenia.', 0);
INSERT INTO projects VALUES (613, 'DP', 358, NULL, 558, '2005/2006', 'Certifikačná autorita', 'Certifikačná autorita', NULL, NULL, 0);
INSERT INTO projects VALUES (614, 'ZP', 361, NULL, 559, '2004/2005', 'Problémová štúdia  škodlivosti EM žiarenia z mobilného počítačového systému (GSM)', 'The case study of harmfulness of the EM radiance from the mobile computer system (GSM)', 'Analyzujte problematiku škodlivosti EM žiarenia  z mobilného počítačového systému (GSM) a jeho vplyvu na ľudský organizmus. Navrhnite a implementujte antiradiačné modely (zariadenia) na účinnú ochranu a porovnajte ich účinnosť.', 'Analyzujte problematiku škodlivosti EM žiarenia  z mobilného počítačového systému (GSM) a jeho vplyvu na ľudský organizmus. Navrhnite a implementujte antiradiačné modely (zariadenia) na účinnú ochranu a porovnajte ich účinnosť.', 0);
INSERT INTO projects VALUES (615, 'DP', 562, 358, 559, '2005/2006', 'Modifikácia meracieho systému s PC', 'Modifikácia meracieho systému s PC', NULL, NULL, 0);
INSERT INTO projects VALUES (616, 'ZP', 301, NULL, 560, '2004/2005', 'Návrh a implementácia algoritmu pre funkčný generátor testov  VLSI obvodov', 'Design and implementation of algorithm for functional test generator of VLSI circuits', 'Analyzujte metódy a spôsoby generovania funkčných testov, navrhnite a  realizujte algoritmus pre systém generovania  funkčných testov vnorených systémov, ktorý zostavuje funkčné testy na základe opisu obvodu v istom špecifikačnom jazyku (VHDL). Algoritmus implementujte a vytvorte grafické užívateľské rozhranie. Funkčnosť implementovaného algoritmu a vyhodnotenie účinnosti generovaných testovacích mixov overte na príkladoch. ', 'Analyzujte metódy a spôsoby generovania funkčných testov, navrhnite a  realizujte algoritmus pre systém generovania  funkčných testov vnorených systémov, ktorý zostavuje funkčné testy na základe opisu obvodu v istom špecifikačnom jazyku (VHDL). Algoritmus implementujte a vytvorte grafické užívateľské rozhranie. Funkčnosť implementovaného algoritmu a vyhodnotenie účinnosti generovaných testovacích mixov overte na príkladoch. ', 0);
INSERT INTO projects VALUES (617, 'DP', 25, NULL, 560, '2005/2006', 'Perzistentné procesy v OS Unix', 'Perzistentné procesy v OS Unix', NULL, NULL, 0);
INSERT INTO projects VALUES (618, 'ZP', 358, NULL, 561, '2004/2005', 'Podpora vypracovania znaleckého posudku v odbore elektrotechnika', 'Support in elaborating an experts opinion in field of electrotechnics', 'Navrhnite a implementujte podporný systém na vypracovanie znaleckého posudku na stanovenie hodnoty elektrotechnického zariadenia. Postup a metodika na stanovenie hodnoty sú určené v Znaleckom štandarde. Podporný systém by mal interaktívne spolupracovať so znalcom a mal by poskytovať používateľsky príjemné prostredie. ', 'Navrhnite a implementujte podporný systém na vypracovanie znaleckého posudku na stanovenie hodnoty elektrotechnického zariadenia. Postup a metodika na stanovenie hodnoty sú určené v Znaleckom štandarde. Podporný systém by mal interaktívne spolupracovať so znalcom a mal by poskytovať používateľsky príjemné prostredie. ', 0);
INSERT INTO projects VALUES (619, 'ZP', 612, 357, 564, '2004/2005', 'Analýza implementácie QoS na produktoch CISCO existujúcej IP siete', 'Analýza implementácie QoS na produktoch CISCO existujúcej IP siete', 'Úlohou projektu je vypracovať analýzu implementácie QoS na produktoch
CISCO v už existujúcej IP sieti. Analýza okrem iného obsahuje prehľad 
Požiadaviek už teraz pripojených aplikácií a tiež v budúcnosti očakávaných.
Zhodnotenie úrovne QoS v daných podmienkach, návrhy iných alternatív
a implementáciu prípadných zmien. Zmeny otestujte so zameraním na 
funkčnosť
', 'Úlohou projektu je vypracovať analýzu implementácie QoS na produktoch
CISCO v už existujúcej IP sieti. Analýza okrem iného obsahuje prehľad 
Požiadaviek už teraz pripojených aplikácií a tiež v budúcnosti očakávaných.
Zhodnotenie úrovne QoS v daných podmienkach, návrhy iných alternatív
a implementáciu prípadných zmien. Zmeny otestujte so zameraním na 
funkčnosť
', 0);
INSERT INTO projects VALUES (620, 'DP', 27, NULL, 564, '2005/2006', 'Správa distribuovaných údajov', 'Správa distribuovaných údajov', NULL, NULL, 0);
INSERT INTO projects VALUES (621, 'ZP', 24, NULL, 565, '2004/2005', 'Optimalizácia turnusov v autobusovej doprave', 'Optimalizácia turnusov v autobusovej doprave', 'Pomocou grafového modelu riešte optimalizáciu turnusov v autobusovej doprave.
Analyzujte vybrané metódy, ktoré sa používajú v teórii grafov 
na modelovanie dopravných sietí. Analyzujte použité algoritmy, ktorými problém optimalizujete.
Navrhnite model, pre optimalizáciu turnusov v autobusovej doprave.
Nájdite maximálny tok v  dopravnej sieti. Model optimalizujte a zistite najlacnejší maximálny tok. Navrhnutý model vizualizujte vytvorením softvérového prototypu.
', 'Pomocou grafového modelu riešte optimalizáciu turnusov v autobusovej doprave.
Analyzujte vybrané metódy, ktoré sa používajú v teórii grafov 
na modelovanie dopravných sietí. Analyzujte použité algoritmy, ktorými problém optimalizujete.
Navrhnite model, pre optimalizáciu turnusov v autobusovej doprave.
Nájdite maximálny tok v  dopravnej sieti. Model optimalizujte a zistite najlacnejší maximálny tok. Navrhnutý model vizualizujte vytvorením softvérového prototypu.
', 1);
INSERT INTO projects VALUES (622, 'DP', 47, 705, 567, '2005/2006', 'Návrh a realizácia HW generátora náhodných čísel', 'Návrh a realizácia HW generátora náhodných čísel', NULL, NULL, 0);
INSERT INTO projects VALUES (623, 'ZP', 25, NULL, 567, '2003/2004', 'Autentifikácia používateľov čipovými kartami', 'RFID card users authentication', 'Analyzujte vlastnosti identifikačných čipových kariet a možnosti ich využitia pri autentifikácii používateľov z pohľadu operačného systému s využitím modulov PAM (Pluggable Authentication Modules). Navrhnite a implementujte periférne zariadenie umožňujúce načítanie kódu z bezpečnostných kariet a jeho následné spracovanie, ako aj príslušný autentifikačný modul PAM. Celý systém otestujte so zameraním na funkčnosť a bezpečnosť.', 'Analyzujte vlastnosti identifikačných čipových kariet a možnosti ich využitia pri autentifikácii používateľov z pohľadu operačného systému s využitím modulov PAM (Pluggable Authentication Modules). Navrhnite a implementujte periférne zariadenie umožňujúce načítanie kódu z bezpečnostných kariet a jeho následné spracovanie, ako aj príslušný autentifikačný modul PAM. Celý systém otestujte so zameraním na funkčnosť a bezpečnosť.', 0);
INSERT INTO projects VALUES (624, 'ZP', 655, NULL, 568, '2004/2005', 'Neurónové siete a evolučné algoritmy', 'Neural networks and evolutionary algorithms', 'Neurónové siete a evolučné algoritmy sa v poslednom období stali populárne najmä na riešenie problémov v oblastiach, kde klasické prístupy a známe algoritmy zlyhávajú. Naštudujte problematiku evolučných algoritmov najmä s ohľadom na možnosť ich aplikovania v oblasti neurónových sietí. Navrhnite a implementujte program (simulátor) umožňujúci pri trénovaní neurónovej siete evolúciou zároveň vyvíjať a upravovať aj jej topológiu. Vytvorené riešenie overte na zvolenom probléme.', 'Neurónové siete a evolučné algoritmy sa v poslednom období stali populárne najmä na riešenie problémov v oblastiach, kde klasické prístupy a známe algoritmy zlyhávajú. Naštudujte problematiku evolučných algoritmov najmä s ohľadom na možnosť ich aplikovania v oblasti neurónových sietí. Navrhnite a implementujte program (simulátor) umožňujúci pri trénovaní neurónovej siete evolúciou zároveň vyvíjať a upravovať aj jej topológiu. Vytvorené riešenie overte na zvolenom probléme.', 1);
INSERT INTO projects VALUES (625, 'DP', 660, NULL, 568, '2005/2006', 'Vizuálne prehľadávanie RDF dokumentov', 'Vizuálne prehľadávanie RDF dokumentov', NULL, NULL, 1);
INSERT INTO projects VALUES (626, 'ZP', 360, NULL, 570, '2003/2004', 'Používateľské rozhranie pre simulátor jednoduchého počítača', 'User interface for a simulator of a simple computer', 'Analyzujte problematiku simulácie činnosti jednoduchého počítača. Navrhnite a implementujte integrované používateľské rozhranie pre simulátor pracujúci na úrovni medziregistrových prenosov.
Rozhranie má umožňovať aj vizualizáciu simulácie programu pozostávajúceho z postupnosti vybraných strojových inštrukcií. Má byť funkčný pod OS Windows.
Túto tému je možné robiť len v súčinnosti s témou „ Simulátor počítača na úrovni medziregistrových prenosov “.
', 'Analyzujte problematiku simulácie činnosti jednoduchého počítača. Navrhnite a implementujte integrované používateľské rozhranie pre simulátor pracujúci na úrovni medziregistrových prenosov.
Rozhranie má umožňovať aj vizualizáciu simulácie programu pozostávajúceho z postupnosti vybraných strojových inštrukcií. Má byť funkčný pod OS Windows.
Túto tému je možné robiť len v súčinnosti s témou „ Simulátor počítača na úrovni medziregistrových prenosov “.
', 0);
INSERT INTO projects VALUES (627, 'DP', 360, NULL, 570, '2005/2006', 'Programový systém podporujúci syntézu asynchrónnych sekvenčných obvodov ', 'Programový systém podporujúci syntézu asynchrónnych sekvenčných obvodov ', NULL, NULL, 0);
INSERT INTO projects VALUES (628, 'ZP', 342, NULL, 571, '2003/2004', 'Technické prostriedky pre podporu výučby strojového programovania.', 'Technical support for teaching of Machine Level Languages ', 'Analyzujte možnosti technických prostriedkov pre podporu vyučovania programovania na strojovej úrovni. Navrhnite vhodnú zostavu technických prostriedkov použiteľných pre podporu výučby v aplikácii s počítačom typu PC. Zrealizujte vybranú časť prototypu navrhnutých technických prostriedkov vrátane potrebného programového  vybavenia.', 'Analyzujte možnosti technických prostriedkov pre podporu vyučovania programovania na strojovej úrovni. Navrhnite vhodnú zostavu technických prostriedkov použiteľných pre podporu výučby v aplikácii s počítačom typu PC. Zrealizujte vybranú časť prototypu navrhnutých technických prostriedkov vrátane potrebného programového  vybavenia.', 0);
INSERT INTO projects VALUES (629, 'DP', 562, 358, 571, '2005/2006', 'Merací systém s PC', 'Merací systém s PC', NULL, NULL, 0);
INSERT INTO projects VALUES (630, 'ZP', 297, NULL, 572, '2003/2004', 'Preklad strojových programov', 'Compilation of machine programs', NULL, NULL, 1);
INSERT INTO projects VALUES (631, 'ZP', 437, NULL, 573, '2003/2004', 'Osobné údaje v informačných systémoch', 'Personal data in information systems', 'Uveďte pojmy osobné údaje a informačný systém z pohľadu technického aj právneho, pričom uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Vysvetlite, čo je to ochrana údajov v informačných systémoch, prečo treba osobné údaje chrániť s dôrazom na etické a spoločenské súvislosti. Opíšte známe právne riešenia ochrany osobných údajov, pričom opäť uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Analyzujte súčasný stav, pomenujte prípadné otvorené problémy a naznačte možnosti  ich riešenia. O celej problematike vytvorte tématické pavučinové sídlo, ktoré bude slúžiť ako zdroj informácií aj odkazov na ne. ', 'Uveďte pojmy osobné údaje a informačný systém z pohľadu technického aj právneho, pričom uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Vysvetlite, čo je to ochrana údajov v informačných systémoch, prečo treba osobné údaje chrániť s dôrazom na etické a spoločenské súvislosti. Opíšte známe právne riešenia ochrany osobných údajov, pričom opäť uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Analyzujte súčasný stav, pomenujte prípadné otvorené problémy a naznačte možnosti  ich riešenia. O celej problematike vytvorte tématické pavučinové sídlo, ktoré bude slúžiť ako zdroj informácií aj odkazov na ne. ', 1);
INSERT INTO projects VALUES (632, 'DP', 704, NULL, 573, '2005/2006', 'Prezentácia histórie informatiky na STU', 'Prezentácia histórie informatiky na STU', NULL, NULL, 4);
INSERT INTO projects VALUES (633, 'ZP', 360, NULL, 574, '2003/2004', 'Simulátor počítača na úrovni medziregistrových prenosov', 'Simulátor počítača na úrovni medziregistrových prenosov', 'Analyzujte problematiku simulácie činnosti jednoduchého počítača. Navrhnite a implementujte simulátor počítača pracujúceho na úrovni medziregistrových prenosov.
Simulátor má vedieť odsimulovať program pozostávajúci z vybraných strojových inštrukcií.
Má pracovať pod OS Windows.
', 'Analyzujte problematiku simulácie činnosti jednoduchého počítača. Navrhnite a implementujte simulátor počítača pracujúceho na úrovni medziregistrových prenosov.
Simulátor má vedieť odsimulovať program pozostávajúci z vybraných strojových inštrukcií.
Má pracovať pod OS Windows.
', 0);
INSERT INTO projects VALUES (634, 'DP', 301, NULL, 574, '2005/2006', 'Funkčný generátor testov VLSI obvodov', 'Funkčný generátor testov VLSI obvodov', NULL, NULL, 0);
INSERT INTO projects VALUES (635, 'ZP', 13, 431, 575, '2003/2004', 'Samočinný generátor testov a príznakový analyzátor ako súčasť automatického generátora testov DefGen', 'Self-test generator as a part of the automatic test generator DefGen.', 'Analyzujte architektúry vstavaných generátorov pseudonáhodných testov a generovanie príznakov pre číslicové obvody. Navrhnite a implementujte vybrané architektúry ako škálovateľné štruktúry a ako súčasť automatického generátora testov DefGen s prepojením na poruchový simulátor a deterministický generátor testov pre vyhodnocovanie diagnostického pokrytia porúch vstavaného generátora testov pre cieľený obvod.  Funkčnosť dokumentujte príkladmi. ', 'Analyzujte architektúry vstavaných generátorov pseudonáhodných testov a generovanie príznakov pre číslicové obvody. Navrhnite a implementujte vybrané architektúry ako škálovateľné štruktúry a ako súčasť automatického generátora testov DefGen s prepojením na poruchový simulátor a deterministický generátor testov pre vyhodnocovanie diagnostického pokrytia porúch vstavaného generátora testov pre cieľený obvod.  Funkčnosť dokumentujte príkladmi. ', 0);
INSERT INTO projects VALUES (636, 'DP', 13, 301, 575, '2005/2006', 'E-systém generovania testov pre digitálne obvody', 'E-systém generovania testov pre digitálne obvody', NULL, NULL, 0);
INSERT INTO projects VALUES (637, 'ZP', 220, NULL, 576, '2002/2003', 'Posudzovanie náhodných postupnopstí z hľadiska potrieb kryptografie', 'Posudzovanie náhodných postupnopstí z hľadiska potrieb kryptografie', NULL, NULL, 1);
INSERT INTO projects VALUES (638, 'ZP', 360, NULL, 577, '2004/2005', 'Simulátor počítača na úrovni medziregistrových prenosov', 'Simulátor počítača na úrovni medziregistrových prenosov', 'Analyzujte problematiku simulácie činnosti jednoduchého počítača. 
Navrhnite a implementujte simulátor počítača pracujúceho na úrovni medziregistrových prenosov. Simulátor má vedieť odsimulovať program pozostávajúci z vybraných strojových inštrukcií. Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. Má pracovať pod OS Windows.', 'Analyzujte problematiku simulácie činnosti jednoduchého počítača. 
Navrhnite a implementujte simulátor počítača pracujúceho na úrovni medziregistrových prenosov. Simulátor má vedieť odsimulovať program pozostávajúci z vybraných strojových inštrukcií. Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. Má pracovať pod OS Windows.', 0);
INSERT INTO projects VALUES (639, 'ZP', 360, NULL, 581, '2004/2005', 'Programový systém podporujúci syntézu asynchrónnych sekvenčných obvodov ', 'Program system supports synthesis of asynchronous sequential circuits', 'Analyzujte problematiku, dostupné metódy a  existujúce programové prostriedky  
podporujúce syntézu asynchrónnych sekvenčných obvodov .
Navrhnite a implementujte programový systém na voľbu vhodného vnútorného kódu pre daný stavový stroj.
Systém  má poskytovať vizualizáciu postupu návrhu  tak, aby mohol byť použitý ako názorná učebná pomôcka. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch.
Navrhnutý systém je možné implementovať v ľubovolnom programovacom jazyku pod OS Windows.

', 'Analyzujte problematiku, dostupné metódy a  existujúce programové prostriedky  
podporujúce syntézu asynchrónnych sekvenčných obvodov .
Navrhnite a implementujte programový systém na voľbu vhodného vnútorného kódu pre daný stavový stroj.
Systém  má poskytovať vizualizáciu postupu návrhu  tak, aby mohol byť použitý ako názorná učebná pomôcka. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch.
Navrhnutý systém je možné implementovať v ľubovolnom programovacom jazyku pod OS Windows.

', 0);
INSERT INTO projects VALUES (640, 'DP', 358, NULL, 581, '2005/2006', 'Elektronická podateľňa', 'Elektronická podateľňa', NULL, NULL, 0);
INSERT INTO projects VALUES (641, 'ZP', 387, NULL, 582, '2005/2006', 'Štatistické modelovanie hypertextového prepojenia', 'Štatistické modelovanie hypertextového prepojenia', 'Medzi dokumentami s odkazmi môžeme zahrnúť webové stránky s hypertextovými odkazmi, či odborné vedecké články s odkazmi na literatúru. Pre množiny takýchto dokumentov nás často zaujímajú otázky ako „Kto je významným autorom v danej oblasti?“, „Koľko neprepojených komunít zaoberajúcich sa jednou oblasťou sa dá nájsť?“. 
Cieľom tohto projektu bude skúmať pravdepodobnostné modely a ich použitie na modelovanie dokumentov s odkazmi. Od študenta sa najprv predpokladá pochopenie pravdepodobnostných modelov a experimentovanie s vybraným modelom. Výsledkom projektu bude softvérový balík na modelovanie dokumentov s odkazmi. Výsledky získané z modelu vhodne prezentujte.
', 'Medzi dokumentami s odkazmi môžeme zahrnúť webové stránky s hypertextovými odkazmi, či odborné vedecké články s odkazmi na literatúru. Pre množiny takýchto dokumentov nás často zaujímajú otázky ako „Kto je významným autorom v danej oblasti?“, „Koľko neprepojených komunít zaoberajúcich sa jednou oblasťou sa dá nájsť?“. 
Cieľom tohto projektu bude skúmať pravdepodobnostné modely a ich použitie na modelovanie dokumentov s odkazmi. Od študenta sa najprv predpokladá pochopenie pravdepodobnostných modelov a experimentovanie s vybraným modelom. Výsledkom projektu bude softvérový balík na modelovanie dokumentov s odkazmi. Výsledky získané z modelu vhodne prezentujte.
', 1);
INSERT INTO projects VALUES (642, 'DP', 431, NULL, 583, '2005/2006', 'Podpora dištančného vzdelávania v predmete Špecifikačné a opisné jazyky', 'Podpora dištančného vzdelávania v predmete Špecifikačné a opisné jazyky', NULL, NULL, 0);
INSERT INTO projects VALUES (643, 'ZP', 431, NULL, 583, '2004/2005', 'Multimediálny výučbový modul pre jazyk VHDL', 'Multimedial learning module for VHDL language', 'Analyzujte problematiku tvorby multimediálnych výučbových systémov. Na základe analýzy navrhnite a implementujte multimediálny výučbový modul pre podporu výučby jazyka VHDL v rozsahu predmetu Špecifikačné a opisné jazyky.  Navrhnutý modul by mal vhodným názorným spôsobom prezentovať učivo, umožniť cvičné testovanie získaných vedomostí a podporovať aj získavanie praktických zručností v návrhu VHDL modelov.', 'Analyzujte problematiku tvorby multimediálnych výučbových systémov. Na základe analýzy navrhnite a implementujte multimediálny výučbový modul pre podporu výučby jazyka VHDL v rozsahu predmetu Špecifikačné a opisné jazyky.  Navrhnutý modul by mal vhodným názorným spôsobom prezentovať učivo, umožniť cvičné testovanie získaných vedomostí a podporovať aj získavanie praktických zručností v návrhu VHDL modelov.', 0);
INSERT INTO projects VALUES (644, 'ZP', 357, NULL, 589, '2004/2005', 'Internetová aplikácia na bezpečnú autentifikáciu klientov', 'Internet application for safe user authentication', 'Analyzujte možné prístupy bezpečnej autentifikácie na dostupných OS a pri použití bežných implementačných nástrojov. Navrhnite a realizujte funkčný model takéhoto  systému v spolupráci s riešiteľom témy „Internetová aplikácia na registráciu užívateľských údajov “. Otestujte funkčnosť, stabilitu a bezpečnosť systému proti zlyhaniu a prienikom.', 'Analyzujte možné prístupy bezpečnej autentifikácie na dostupných OS a pri použití bežných implementačných nástrojov. Navrhnite a realizujte funkčný model takéhoto  systému v spolupráci s riešiteľom témy „Internetová aplikácia na registráciu užívateľských údajov “. Otestujte funkčnosť, stabilitu a bezpečnosť systému proti zlyhaniu a prienikom.', 0);
INSERT INTO projects VALUES (645, 'ZP', 672, 387, 590, '2005/2006', 'Tvorba jazykového grafu v procese učenia', 'Tvorba jazykového grafu v procese učenia', 'V poslednej dobe sa veľa báda v oblasti sietí, ktoré integrujú vlastnosti sietí usporiadaných a sietí náhodných. Sú to siete malého sveta. Majú široké možnosti aplikácií. Jednou z nich je aj tzv "word net", kde sa lexikón jazyka chápe ako graf. Ak graf nie je súvislý, reč nemôže byť plynulá. 
Úlohou projektu je pozrieť sa na proces tvorby "word net" pri učení sa angličtiny. Budeme analyzovať postup učenia sa cudzieho jazyka a spôsob, akým sa nové slová pridávajú do slovnej zásoby. Použijeme pri tom rôzne učebnice angličtiny, poprípade internetové kurzy a podobne. 
Literatúra: Watts, Small Worlds, Princeton University Press, 2004
                    Rybár a spol, Jazyk a kognícia, Kalligram, 2005', 'V poslednej dobe sa veľa báda v oblasti sietí, ktoré integrujú vlastnosti sietí usporiadaných a sietí náhodných. Sú to siete malého sveta. Majú široké možnosti aplikácií. Jednou z nich je aj tzv "word net", kde sa lexikón jazyka chápe ako graf. Ak graf nie je súvislý, reč nemôže byť plynulá. 
Úlohou projektu je pozrieť sa na proces tvorby "word net" pri učení sa angličtiny. Budeme analyzovať postup učenia sa cudzieho jazyka a spôsob, akým sa nové slová pridávajú do slovnej zásoby. Použijeme pri tom rôzne učebnice angličtiny, poprípade internetové kurzy a podobne. 
Literatúra: Watts, Small Worlds, Princeton University Press, 2004
                    Rybár a spol, Jazyk a kognícia, Kalligram, 2005', 1);
INSERT INTO projects VALUES (646, 'ZP', 374, NULL, 592, '2004/2005', 'Využitie vlastností heterogénnych hráčov', 'Využitie vlastností heterogénnych hráčov', 'Naštudujte problematiku hry hráčov simulovaného robotického futbalu RoboCup. Oboznámte sa s hráčmi, ktorí boli vytvorení študentmi FIIT STU. Analyzujte vlastnosti klasického a heterogénneho hráča. Špecifikujte možné spôsoby využitia heterogénnych hráčov. Navrhnite rozšírenie existujúceho hráča a taktiky hry, aby bolo možné využiť špecifikované výhody. Navrhnuté riešenie overte implementáciou rozšírenia existujúceho hráča.', 'Naštudujte problematiku hry hráčov simulovaného robotického futbalu RoboCup. Oboznámte sa s hráčmi, ktorí boli vytvorení študentmi FIIT STU. Analyzujte vlastnosti klasického a heterogénneho hráča. Špecifikujte možné spôsoby využitia heterogénnych hráčov. Navrhnite rozšírenie existujúceho hráča a taktiky hry, aby bolo možné využiť špecifikované výhody. Navrhnuté riešenie overte implementáciou rozšírenia existujúceho hráča.', 1);
INSERT INTO projects VALUES (647, 'ZP', 566, NULL, 593, '2004/2005', 'Použitie genetického algoritmu k optimalizácii funkcií', 'Use of genetic algorithm for optimalization', 'Geneticky algoritmus patri v súčasnosti medzi efektivne globálne optimalizačné prostriedky, ktorý je schopný poskytnúť s veľkou pravdepodobnosťou globálne minimum n-rozmernej funkcii. Riešenie problému (napr. premenné funkcie) sú reprezentované v binárnom kóde. Pri zahájení algoritmu je vygenerovaná populácia riešení, pričom každé riešenie je ohodnotene "fitnes", ktoré odráža kvalitu riešenia. V rámci reprodukčného procesu sa vyberajú tie riešenia, ktoré majú vysoké fitnes, pričom pri reprodukčnom procese sa používajú dva genetické operátory: mutácia a kríženie. V priebehu opakovaného reprodukčného procesu v populácii vznikajú riešenia, ktoré majú vysoké fitnes, t.j. sú priradené kvalitnému riešeniu optimalizačného problému. Práca bude spočívať vo vypracovaní teoretického popisu metódy a taktiež aj v jednoduchel implementácii programu buď v Pascale alebo v C.
', 'Geneticky algoritmus patri v súčasnosti medzi efektivne globálne optimalizačné prostriedky, ktorý je schopný poskytnúť s veľkou pravdepodobnosťou globálne minimum n-rozmernej funkcii. Riešenie problému (napr. premenné funkcie) sú reprezentované v binárnom kóde. Pri zahájení algoritmu je vygenerovaná populácia riešení, pričom každé riešenie je ohodnotene "fitnes", ktoré odráža kvalitu riešenia. V rámci reprodukčného procesu sa vyberajú tie riešenia, ktoré majú vysoké fitnes, pričom pri reprodukčnom procese sa používajú dva genetické operátory: mutácia a kríženie. V priebehu opakovaného reprodukčného procesu v populácii vznikajú riešenia, ktoré majú vysoké fitnes, t.j. sú priradené kvalitnému riešeniu optimalizačného problému. Práca bude spočívať vo vypracovaní teoretického popisu metódy a taktiež aj v jednoduchel implementácii programu buď v Pascale alebo v C.
', 1);
INSERT INTO projects VALUES (648, 'ZP', 361, NULL, 594, '2004/2005', 'Problémová štúdia  škodlivosti EM žiarenia z mobilného počítačového systému (GSM)', 'Problem study about malignance of Electromagnetic emission from Global Systems for Mobile Communications (GSM)', 'Analyzujte problematiku škodlivosti EM žiarenia  z mobilného počítačového systému (GSM) a jeho vplyvu na ľudský organizmus. Navrhnite a implementujte antiradiačné modely (zariadenia) na účinnú ochranu a porovnajte ich účinnosť.', 'Analyzujte problematiku škodlivosti EM žiarenia  z mobilného počítačového systému (GSM) a jeho vplyvu na ľudský organizmus. Navrhnite a implementujte antiradiačné modely (zariadenia) na účinnú ochranu a porovnajte ich účinnosť.', 0);
INSERT INTO projects VALUES (649, 'ZP', 437, NULL, 595, '2003/2004', 'Objavovanie znalostí a e-učenie', 'Objavovanie znalostí a e-učenie', 'Analyzujte problematiku objavovania znalostí a v rámci nej špeciálne dolovania údajov a možností ich využitia v procese e-učenia. Posúďte možnosti ich využitia pri štúdiu v knižniciach, obzvlášť v digitálnych. Opíšte vlastnosti softvérového nástroja, ktorý by objavovaniu znalostí v knižniciach napomáhal. Urobte prehľad existujúcich nástrojov. Porovnajte vybrané dostupné spomedzi nich. Zvoľte vhodnú metodiku na porovnanie, vykonajte príslušné experimenty a vyhodnoťte ich.', 'Analyzujte problematiku objavovania znalostí a v rámci nej špeciálne dolovania údajov a možností ich využitia v procese e-učenia. Posúďte možnosti ich využitia pri štúdiu v knižniciach, obzvlášť v digitálnych. Opíšte vlastnosti softvérového nástroja, ktorý by objavovaniu znalostí v knižniciach napomáhal. Urobte prehľad existujúcich nástrojov. Porovnajte vybrané dostupné spomedzi nich. Zvoľte vhodnú metodiku na porovnanie, vykonajte príslušné experimenty a vyhodnoťte ich.', 1);
INSERT INTO projects VALUES (650, 'DP', 24, NULL, 595, '2005/2006', 'Klasifikácia textových dokumentov metódami strojového učenia', 'Klasifikácia textových dokumentov metódami strojového učenia', NULL, NULL, 4);
INSERT INTO projects VALUES (651, 'ZP', 588, 670, 596, '2004/2005', 'Kódové zámky', 'Code locks', 'Analyzujte technické a programové prostriedky pre realizáciu kódových zámkov. Porovnajte výhody kontaktných a bezdrôtových systémov na základe definovaných technických parametrov s vyššou úrovňou zabezpečenia.
Navrhnite obvodovú schému pre jednoduchý kódový zámok riadený  mikroprocesorom. 
Napíšte a overte program pre riadenie mikroprocesora.
', 'Analyzujte technické a programové prostriedky pre realizáciu kódových zámkov. Porovnajte výhody kontaktných a bezdrôtových systémov na základe definovaných technických parametrov s vyššou úrovňou zabezpečenia.
Navrhnite obvodovú schému pre jednoduchý kódový zámok riadený  mikroprocesorom. 
Napíšte a overte program pre riadenie mikroprocesora.
', 0);
INSERT INTO projects VALUES (652, 'DP', 541, NULL, 596, '2005/2006', 'Systém automatizovaného odčítavania plynomerov a vodomerov', 'Systém automatizovaného odčítavania plynomerov a vodomerov', NULL, NULL, 4);
INSERT INTO projects VALUES (653, 'ZP', 98, NULL, 597, '2004/2005', 'Systém pre odovzdávanie prác prostredníctvom Internetu', 'System for managing student works via Internet', 'C# je pomerne nový jazyk, ktorý vycháza z jazyka C++  a z jazyka Java. Naštudujte tento programovací jazyk a posúďte jeho možnosti ako prostriedku pre tvorbu webovských aplikácii.
Na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu pre odovzdávanie prác prostredníctvom Internetu.
', 'C# je pomerne nový jazyk, ktorý vycháza z jazyka C++  a z jazyka Java. Naštudujte tento programovací jazyk a posúďte jeho možnosti ako prostriedku pre tvorbu webovských aplikácii.
Na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu pre odovzdávanie prác prostredníctvom Internetu.
', 1);
INSERT INTO projects VALUES (654, 'DP', 437, NULL, 597, '2005/2006', 'Opoznámkovanie sprístupňovaných webových stránok vopred', 'Opoznámkovanie sprístupňovaných webových stránok vopred', NULL, NULL, 1);
INSERT INTO projects VALUES (655, 'ZP', 382, NULL, 598, '2004/2005', 'Automatická kosačka genetickým programovaním ', 'Automatic grass-cutter developed by genetic programming', 'Vyviňte genetickým programovaním program, ktorý bude riadiť automatickú kosačku (presnejšie jej formálny model, ktorému sa iba povie: otoč sa naľavo, napravo, alebo choď dopredu) na toroidálnej mriežke tak, aby ideálne prešla cez všetky políčka (kosačka môže mať aj automaticky dodávanú svoju pozíciu, pozíciu navštívených a nenavštívených políčok). Doplňte o náhodne rozmiestnené prekážky na mriežke.', 'Vyviňte genetickým programovaním program, ktorý bude riadiť automatickú kosačku (presnejšie jej formálny model, ktorému sa iba povie: otoč sa naľavo, napravo, alebo choď dopredu) na toroidálnej mriežke tak, aby ideálne prešla cez všetky políčka (kosačka môže mať aj automaticky dodávanú svoju pozíciu, pozíciu navštívených a nenavštívených políčok). Doplňte o náhodne rozmiestnené prekážky na mriežke.', 1);
INSERT INTO projects VALUES (656, 'DP', 260, NULL, 598, '2005/2006', 'Výpočtové prostredie pre aktívny súborový systém', 'Výpočtové prostredie pre aktívny súborový systém', NULL, NULL, 1);
INSERT INTO projects VALUES (657, 'ZP', 579, NULL, 599, '2004/2005', 'Systém na podporu tvorby skúškových rozvrhov', 'System of exam schedules generating support', 'Analyzujte údajové množiny a postupy pri vytváraní  rozvrhov skúšok a následne navrhnite systém, ktorý by tieto činnosti podporoval. Základné časti návrhu realizujte v podobe prototypu a zaistite nevyhnutnú kompatibilitu s informačným systémom používaným na FIIT.', 'Analyzujte údajové množiny a postupy pri vytváraní  rozvrhov skúšok a následne navrhnite systém, ktorý by tieto činnosti podporoval. Základné časti návrhu realizujte v podobe prototypu a zaistite nevyhnutnú kompatibilitu s informačným systémom používaným na FIIT.', 1);
INSERT INTO projects VALUES (658, 'DP', 579, NULL, 599, '2005/2006', 'Systém získavania doplňujúcich informácií pre tvorbu rozvrhov', 'Systém získavania doplňujúcich informácií pre tvorbu rozvrhov', NULL, NULL, 4);
INSERT INTO projects VALUES (659, 'ZP', 294, NULL, 600, '2004/2005', 'Nadstavba pre aplikácie otvoreného systému obohatenej skutočnosti  ARToolkit', ':  EXTENSION OF APPLICATIONS FOR OPEN STANDARD AUGMENTED REALITY SYSTEM ARTTOOLKIT', 'Vytvorte nadstavbu existujúceho otvoreného systému ARToolkit (www.hitl.washington.edu/artoolkit)  pre obohatenú skutočnosť (augmented reality) pre rôzne aplikácie s dôrazom na tvorbu dynamických 2D a 3D scén  naprogramovaných v API OpenGl a využívajúcich realistické zobrazovanie vrátane mapovania textúr. Realizujte vzorové príklady umožňujúce naučiť sa tvoriť dynamické scény pre programátorov bez skúseností s používaním Open Gl. Zdrojový kód, projekt a  existujúca bežiaca verzia v prostredí MS Visual C a OpenGl bude k dispozícii.

', 'Vytvorte nadstavbu existujúceho otvoreného systému ARToolkit (www.hitl.washington.edu/artoolkit)  pre obohatenú skutočnosť (augmented reality) pre rôzne aplikácie s dôrazom na tvorbu dynamických 2D a 3D scén  naprogramovaných v API OpenGl a využívajúcich realistické zobrazovanie vrátane mapovania textúr. Realizujte vzorové príklady umožňujúce naučiť sa tvoriť dynamické scény pre programátorov bez skúseností s používaním Open Gl. Zdrojový kód, projekt a  existujúca bežiaca verzia v prostredí MS Visual C a OpenGl bude k dispozícii.

', 1);
INSERT INTO projects VALUES (660, 'DP', 294, NULL, 600, '2005/2006', 'Aplikácia obohatenej skutočnosti pri virtuálnych prehliadkach architektúry', 'Aplikácia obohatenej skutočnosti pri virtuálnych prehliadkach architektúry', NULL, NULL, 1);
INSERT INTO projects VALUES (661, 'ZP', 12, NULL, 601, '2004/2005', 'Vedecký kalkulátor na mobilnej platforme', 'Scientific calculator for mobile platform', 'Veľké rozšírenie vzájomne kompatibilných a hardvérovo dobre vybavených mobilných zariadení umožňuje vytvorenie jednotného systému, ktorý môže plniť funkciu vedeckej kalkulačky. Analyzujte perspektívne mobilné softvérové platformy a ich vlastnosti. Navrhnite interaktívny výpočtový systém, ktorý by umožňoval vyhodnotenie aritmetických výrazov. Systém by mal podporovať operátory a funkcie bežné pri vedeckých kalkulačkách. Implementujte systém pre zvolenú mobilnú platformu s použitim existujúcich priemyselných štandardov.', 'Veľké rozšírenie vzájomne kompatibilných a hardvérovo dobre vybavených mobilných zariadení umožňuje vytvorenie jednotného systému, ktorý môže plniť funkciu vedeckej kalkulačky. Analyzujte perspektívne mobilné softvérové platformy a ich vlastnosti. Navrhnite interaktívny výpočtový systém, ktorý by umožňoval vyhodnotenie aritmetických výrazov. Systém by mal podporovať operátory a funkcie bežné pri vedeckých kalkulačkách. Implementujte systém pre zvolenú mobilnú platformu s použitim existujúcich priemyselných štandardov.', 1);
INSERT INTO projects VALUES (662, 'DP', 566, NULL, 601, '2005/2006', 'Hľadenie globálneho minima funkcie pomocou kvantového počítania', 'Hľadenie globálneho minima funkcie pomocou kvantového počítania', NULL, NULL, 1);
INSERT INTO projects VALUES (663, 'ZP', 660, NULL, 602, '2004/2005', 'CSIDC 2005', 'CSIDC 2005', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 1);
INSERT INTO projects VALUES (664, 'DP', 40, NULL, 602, '2005/2006', 'Návrhové vzory v prostriedkoch objektovo-relačného mapovania', 'Návrhové vzory v prostriedkoch objektovo-relačného mapovania', NULL, NULL, 1);
INSERT INTO projects VALUES (665, 'ZP', 361, NULL, 603, '2004/2005', 'Analýza opisu správania sa v jazyku VHDL', 'Analysis of behavior in VHDL language', 'Analyzujte opis správania sa v jazyku VHDL a vzťahy medzi entitami a architektúrami v prostredí ActiveVHDL. Navrhnite 8b10b kodér a dekodér. Vytvorte funkčný a štrukturálny opis modulov v jazyku VHDL. Overte funkčnosť kodéra a dekodéra v simulačnom prostredí  Active VHDL. 
', 'Analyzujte opis správania sa v jazyku VHDL a vzťahy medzi entitami a architektúrami v prostredí ActiveVHDL. Navrhnite 8b10b kodér a dekodér. Vytvorte funkčný a štrukturálny opis modulov v jazyku VHDL. Overte funkčnosť kodéra a dekodéra v simulačnom prostredí  Active VHDL. 
', 0);
INSERT INTO projects VALUES (666, 'DP', 360, NULL, 603, '2005/2006', 'Programový systém podporujúci syntézu asynchrónnych sekvenčných obvodov, HTML aplikácia ', 'Programový systém podporujúci syntézu asynchrónnych sekvenčných obvodov, HTML aplikácia ', NULL, NULL, 0);
INSERT INTO projects VALUES (667, 'ZP', 382, NULL, 604, '2004/2005', 'Prenasledovanie neurónovou sieťou ', 'Pursuit evasion by neural networks', 'Na toroidálnu mriežku umiestnite troch agentov, jedného ako korisť, dvoch prenasledovateľov. Korisť je rovnako rýchla ako prenasledovatelia, a je riadená dopredu daným algoritmom. Korisť aj prenasledovatelia majú úplnú informáciu o pozíciach agentov na mriežke. Agenti sú riadení neurónovými sieťami, ktoré sú vyvíjané evolučnými algoritmami (každá zvlášť), ohodnotenie je čas, za ktorý dostihnú korisť. Analyzujte kooperatívne stratégie agentov, zistite, či rovnako rýchlo dosiahnete výsledku, keď obidvoch prenasledovateľov riadite jednou veľkou neurónovou sieťou.', 'Na toroidálnu mriežku umiestnite troch agentov, jedného ako korisť, dvoch prenasledovateľov. Korisť je rovnako rýchla ako prenasledovatelia, a je riadená dopredu daným algoritmom. Korisť aj prenasledovatelia majú úplnú informáciu o pozíciach agentov na mriežke. Agenti sú riadení neurónovými sieťami, ktoré sú vyvíjané evolučnými algoritmami (každá zvlášť), ohodnotenie je čas, za ktorý dostihnú korisť. Analyzujte kooperatívne stratégie agentov, zistite, či rovnako rýchlo dosiahnete výsledku, keď obidvoch prenasledovateľov riadite jednou veľkou neurónovou sieťou.', 1);
INSERT INTO projects VALUES (668, 'DP', 382, NULL, 604, '2005/2006', 'Model malého sveta v Echo state neurónových sieťach', 'Model malého sveta v Echo state neurónových sieťach', NULL, NULL, 1);
INSERT INTO projects VALUES (669, 'ZP', 357, NULL, 605, '2004/2005', 'Prehľadová štúdia softvérových nástrojov pre potreby interaktívneho webu.', 'Prehľadová štúdia softvérových nástrojov pre potreby interaktívneho webu', 'Analyzujte dostupné softverové prostriedky, ktoré sa v súčasnosti využívajú pre potreby interaktívneho webu. Implementačné nástroje posudzujte z rôznych hľadisk: dostupnosti, využiteľnosti v rôznych oblastiach praxe, client vs. server based, spoľahlivosti, jednoduchosti syntaxe, stabilite a pod.
Po konzultácii s vedúcim práce si niektoré implementačné nástroje osvojte a vytvorte funkčný prezentačný interaktívny model, v ktorom demonštrujete niektoré vlastnosti naštudovanej problematiky.
', 'Analyzujte dostupné softverové prostriedky, ktoré sa v súčasnosti využívajú pre potreby interaktívneho webu. Implementačné nástroje posudzujte z rôznych hľadisk: dostupnosti, využiteľnosti v rôznych oblastiach praxe, client vs. server based, spoľahlivosti, jednoduchosti syntaxe, stabilite a pod.
Po konzultácii s vedúcim práce si niektoré implementačné nástroje osvojte a vytvorte funkčný prezentačný interaktívny model, v ktorom demonštrujete niektoré vlastnosti naštudovanej problematiky.
', 0);
INSERT INTO projects VALUES (670, 'DP', 359, NULL, 605, '2005/2006', 'Metódy modelovania web aplikácií', 'Metódy modelovania web aplikácií', NULL, NULL, 0);
INSERT INTO projects VALUES (671, 'ZP', 298, NULL, 606, '2004/2005', 'Systém pre podporu výučby peer-to-peer technológie', 'Education support system for peer-to-peer technology', 'Vytvorte prehľad existujúcich riešení v oblasti technológie p2p vhodnej pre vytvorenie kostry obsahovej náplne samostatného predmetu Peer-to-peer a grid technológie. V analýze sa sústreďte na opis existujúcich riešení neštrukturovaných, semi-štrukturovaných a štrukturovaných p2p sietí, na ich vzájomné kvantitatívne a kvalitatívne porovnanie a doterajšie výsledky ich zapracovania do technológie grid. Vytvorte niekoľko vizualizácií pre ukážku štruktúry a funkcie, spôsob využitia údajových štruktúr.', 'Vytvorte prehľad existujúcich riešení v oblasti technológie p2p vhodnej pre vytvorenie kostry obsahovej náplne samostatného predmetu Peer-to-peer a grid technológie. V analýze sa sústreďte na opis existujúcich riešení neštrukturovaných, semi-štrukturovaných a štrukturovaných p2p sietí, na ich vzájomné kvantitatívne a kvalitatívne porovnanie a doterajšie výsledky ich zapracovania do technológie grid. Vytvorte niekoľko vizualizácií pre ukážku štruktúry a funkcie, spôsob využitia údajových štruktúr.', 0);
INSERT INTO projects VALUES (672, 'DP', 357, NULL, 606, '2005/2006', 'Princípy a vizualizácia STP', 'Princípy a vizualizácia STP', NULL, NULL, 0);
INSERT INTO projects VALUES (673, 'DP', 301, NULL, 607, '2005/2006', 'Návrh funkcií sieťového adaptéra v prostredí PLD', 'Návrh funkcií sieťového adaptéra v prostredí PLD', NULL, NULL, 0);
INSERT INTO projects VALUES (674, 'ZP', 301, NULL, 607, '2004/2005', 'Testovanie rozšírenej MAC vrstvy sieťového adaptéra a návrh v prostredí PLD', 'The testing of the MAC control sublayer of the Network Interface Card and the design in the PLD environment. ', 'Analyzujte a navrhnite vybrané časti a špeciálne funkcie sieťového adaptéra. Opíšte architektúru a funkciu v jazyku VHDL, implementujte systém do zvolenej technológie PLD/FPGA v návrhovom prostredí XILINX Foundation M1 technology, navrhnite metódu testovania MAC vrstvy, overte činnosť.', 'Analyzujte a navrhnite vybrané časti a špeciálne funkcie sieťového adaptéra. Opíšte architektúru a funkciu v jazyku VHDL, implementujte systém do zvolenej technológie PLD/FPGA v návrhovom prostredí XILINX Foundation M1 technology, navrhnite metódu testovania MAC vrstvy, overte činnosť.', 0);
INSERT INTO projects VALUES (675, 'DP', 294, NULL, 608, '2005/2006', 'Distribuované simulačné prostredie založené na technike Web3D  ', 'Distribuované simulačné prostredie založené na technike Web3D  ', NULL, NULL, 1);
INSERT INTO projects VALUES (676, 'ZP', 387, NULL, 608, '2004/2005', 'Vizualizácia kolekcie textových dokumentov', 'Vizualizácia kolekcie textových dokumentov', 'Cieľom projektu bude skúmať pravdepodobnostné modely s latentnými premennými a ich použitie na vizualizáciu textových databáz. Od študenta sa najprv sa predpokladá pochopenie modelov s latentnými premennými, ktoré sú topograficky organizované, a experimentovanie s vybranými modelmi. V práci nás bude zaujímať správanie sa modelov, ktoré vychádzajú z ProbMap modelu. Bude potrebné vytvoriť softvérový balík na vizualiizáciu dokumentov, pomocou ktorého bude možné používateľovi vhodným spôsobom prezentovať výsledky.', 'Cieľom projektu bude skúmať pravdepodobnostné modely s latentnými premennými a ich použitie na vizualizáciu textových databáz. Od študenta sa najprv sa predpokladá pochopenie modelov s latentnými premennými, ktoré sú topograficky organizované, a experimentovanie s vybranými modelmi. V práci nás bude zaujímať správanie sa modelov, ktoré vychádzajú z ProbMap modelu. Bude potrebné vytvoriť softvérový balík na vizualiizáciu dokumentov, pomocou ktorého bude možné používateľovi vhodným spôsobom prezentovať výsledky.', 1);
INSERT INTO projects VALUES (677, 'ZP', 301, NULL, 609, '2004/2005', 'Návrh a implementácia systému na grafickú vizualizáciu prúdového spracovania inštrukcií', 'Suggest and implement system for graphic visualization of pipeline processing', 'Navrhnite a implementujte systém, ktorý bude s využitím multimediálnych technológií umožňovať  naštudovanie, grafické zobrazenie a demonštráciu  dejov pri prúdovom spracovaní inštrukcií.
Produkt implementujte ako hypermediálnu prezentáciu vo voľne dostupnom webovom prehliadači.', 'Navrhnite a implementujte systém, ktorý bude s využitím multimediálnych technológií umožňovať  naštudovanie, grafické zobrazenie a demonštráciu  dejov pri prúdovom spracovaní inštrukcií.
Produkt implementujte ako hypermediálnu prezentáciu vo voľne dostupnom webovom prehliadači.', 0);
INSERT INTO projects VALUES (678, 'DP', 431, NULL, 609, '2005/2006', 'Výučbový systém konfigurácie smerovačov', 'Výučbový systém konfigurácie smerovačov', NULL, NULL, 0);
INSERT INTO projects VALUES (679, 'ZP', 541, NULL, 610, '2003/2004', 'Zálohovanie a obnova dát v databázach', 'Zálohovanie a obnova dát v databázach', 'Analyzujte metódy a prostriedky zálohovania a obnovy dát v relačných databázových systémoch. Definujte výhody a nedostatky zálohovania a obnovy dát v DBS Oracle. Navrhnite možné metódy zlepšenia a rozšírenia funkcií zálohovania a obnovy dát. Vybraté  metódy implementujte v prostredí Oracle. Funkčnosť systému demonštrujte na vybratom príklade.', 'Analyzujte metódy a prostriedky zálohovania a obnovy dát v relačných databázových systémoch. Definujte výhody a nedostatky zálohovania a obnovy dát v DBS Oracle. Navrhnite možné metódy zlepšenia a rozšírenia funkcií zálohovania a obnovy dát. Vybraté  metódy implementujte v prostredí Oracle. Funkčnosť systému demonštrujte na vybratom príklade.', 1);
INSERT INTO projects VALUES (680, 'DP', 10, NULL, 610, '2005/2006', 'Simulovaný robotický futbal – tímová spolupráca', 'Simulovaný robotický futbal – tímová spolupráca', NULL, NULL, 1);
INSERT INTO projects VALUES (681, 'ZP', 20, NULL, 611, '2004/2005', 'Editor neurónových sietí', 'Editor of neural networks', 'Rekurentné neurónové siete sú na rozdiel od klasických dopredných neurónových sietí schopné spracovávať vstupy s časopriestorovou štruktúrou. Existujú rôzne architektúry rekurentných sietí s rôznymi schopnosťami z hľadiska spracovania vstupných dát.
Naštudujte problematiku neurónových sietí a rekurentných neurónových sietí, zamerajte sa na možnosti zakódovania architektúry neurónových sietí vzhľadom na potreby trénovacích algoritmov. Vytvorte editor umožňujúci používateľovi vytvoriť neurónovú sieť využívajúci navrhnutý formát.
', 'Rekurentné neurónové siete sú na rozdiel od klasických dopredných neurónových sietí schopné spracovávať vstupy s časopriestorovou štruktúrou. Existujú rôzne architektúry rekurentných sietí s rôznymi schopnosťami z hľadiska spracovania vstupných dát.
Naštudujte problematiku neurónových sietí a rekurentných neurónových sietí, zamerajte sa na možnosti zakódovania architektúry neurónových sietí vzhľadom na potreby trénovacích algoritmov. Vytvorte editor umožňujúci používateľovi vytvoriť neurónovú sieť využívajúci navrhnutý formát.
', 1);
INSERT INTO projects VALUES (682, 'DP', 20, NULL, 611, '2005/2006', 'Riešenie úloh pomocou prístupov založených na podporných vektoroch', 'Riešenie úloh pomocou prístupov založených na podporných vektoroch', NULL, NULL, 1);
INSERT INTO projects VALUES (683, 'ZP', 588, 563, 613, '2004/2005', 'Identifikačné systémy', 'Identifikačné systémy', 'Analyzujte technické a programové prostredie pre realizáciu identifikačných systémov. Porovnajte kontaktné a bezdrôtové systémy uvedené (minimálne od dvoch výrobcov) na základe definovaných technických parametrov. Navrhnite obvodovú schému pre jednoduchý identifikačný systém riadený vhodným mikroprocesorom. Napíšte a overte program pre riadenie mikroprocesoru.

', 'Analyzujte technické a programové prostredie pre realizáciu identifikačných systémov. Porovnajte kontaktné a bezdrôtové systémy uvedené (minimálne od dvoch výrobcov) na základe definovaných technických parametrov. Navrhnite obvodovú schému pre jednoduchý identifikačný systém riadený vhodným mikroprocesorom. Napíšte a overte program pre riadenie mikroprocesoru.

', 0);
INSERT INTO projects VALUES (684, 'ZP', 445, NULL, 614, '2004/2005', 'Systémy na správu webového obsahu a ich vhodné využitie', 'Systémy na správu webového obsahu a ich vhodné využitie', 'Analyzujte existujúce systémy na správu webového obsahu (z angl. Web Content Management Systems). Zamerajte sa pritom na open-source riešenia. Na základe analýzy vytvorte rozhodovací strom, ktorý na základe požiadaviek kladených na CMS odporučí najvhodnejšie riešenia. Pomocou tohto stromu vyberte najvhodnejší CMS pre správu webového sídla vybraného podľa potrieb fakulty (napr. stránka ústavu). Vybraný CMS následne ukážkovo naplňte.', 'Analyzujte existujúce systémy na správu webového obsahu (z angl. Web Content Management Systems). Zamerajte sa pritom na open-source riešenia. Na základe analýzy vytvorte rozhodovací strom, ktorý na základe požiadaviek kladených na CMS odporučí najvhodnejšie riešenia. Pomocou tohto stromu vyberte najvhodnejší CMS pre správu webového sídla vybraného podľa potrieb fakulty (napr. stránka ústavu). Vybraný CMS následne ukážkovo naplňte.', 1);
INSERT INTO projects VALUES (685, 'ZP', 12, NULL, 615, '2004/2005', 'Podpora vizuálneho návrhu architektonického štýlu dátovody a filtre', 'SUPPORT OF VISUAL DESIGN OF ARCHITECTURAL STYLES PIPES AND FILTERS', 'Analyzujte vlastnosti architektonického štýlu dátovody a filtre. Sústreďte sa na možnosť podporenia návrhu softvéru s použitím tohoto architektonického štýlu. Navrhnite a implementujte aplikáciu, ktorá uľahčí návrh a údržbu aplikácií vyvíjaných nad niektorým existujúcim frameworkom založených na uvedenom architektonickom štýle. Riešenie overte implementovaním a zdokumentovaním informačného WWW portálu.', 'Analyzujte vlastnosti architektonického štýlu dátovody a filtre. Sústreďte sa na možnosť podporenia návrhu softvéru s použitím tohoto architektonického štýlu. Navrhnite a implementujte aplikáciu, ktorá uľahčí návrh a údržbu aplikácií vyvíjaných nad niektorým existujúcim frameworkom založených na uvedenom architektonickom štýle. Riešenie overte implementovaním a zdokumentovaním informačného WWW portálu.', 1);
INSERT INTO projects VALUES (686, 'ZP', 24, NULL, 616, '2004/2005', 'Problém obchodného cestujúceho v praxi', 'Problém obchodného cestujúceho v praxi', 'Analyzujte problém obchodného cestujúceho. Porovnajte ho 
s problémom čínskeho poštára. Analyzujte heuristiky, ktoré sa 
používajú na optimalizáciu tohto problému.
Na základe poznatkov z analýzy týchto problémov navrhnite 
model, ktorý bude využívať tieto poznatky v praxi.
Model optimalizujte a vizualizujte vytvorením softvérového prototypu.
', 'Analyzujte problém obchodného cestujúceho. Porovnajte ho 
s problémom čínskeho poštára. Analyzujte heuristiky, ktoré sa 
používajú na optimalizáciu tohto problému.
Na základe poznatkov z analýzy týchto problémov navrhnite 
model, ktorý bude využívať tieto poznatky v praxi.
Model optimalizujte a vizualizujte vytvorením softvérového prototypu.
', 1);
INSERT INTO projects VALUES (687, 'ZP', 660, NULL, 618, '2004/2005', 'Identifikácia slovanských jazykov na webe', 'Language Identification of slavic web pages', 'Na webe sa nachádza veľké množstvo dokumentov zapísaných v najrôznejších jazykoch. Analyzujte možnosti identifikácie jazyka dokumentu v rámci skupiny slovanských jazykov a znakovej sady použitej na zapísanie dokumentov dostupných na webe. Navrhnite metódu analýzy. Navrhnutú metódu overte vytvorením softvérového prototypu. Analyzujte zložitosť navrhnutej metódy a vyhodnoťte jej efektívnosť (s súvislosti s rozsahom analyzovaných dát). Pri experimentoch s navrhnutou metódou použite obsah webu v štruktúrovanej podobe získaný v rámci projektu Language Observatory (http://www.language-observatory.org/) - tento bude pri riešení projektu dostupný.', 'Na webe sa nachádza veľké množstvo dokumentov zapísaných v najrôznejších jazykoch. Analyzujte možnosti identifikácie jazyka dokumentu v rámci skupiny slovanských jazykov a znakovej sady použitej na zapísanie dokumentov dostupných na webe. Navrhnite metódu analýzy. Navrhnutú metódu overte vytvorením softvérového prototypu. Analyzujte zložitosť navrhnutej metódy a vyhodnoťte jej efektívnosť (s súvislosti s rozsahom analyzovaných dát). Pri experimentoch s navrhnutou metódou použite obsah webu v štruktúrovanej podobe získaný v rámci projektu Language Observatory (http://www.language-observatory.org/) - tento bude pri riešení projektu dostupný.', 1);
INSERT INTO projects VALUES (688, 'ZP', 705, NULL, 619, '2005/2006', 'Automatický návrh logických kombinačných obvodov s integrovanými obvodmi MSI', 'Automatický návrh logických kombinačných obvodov s integrovanými obvodmi MSI', 'Treba vypracovať metodiku automatického návrhu logických kombinačných obvodov s viacerými výstupmi s použitím dekodérov a členov OR alebo NAND zo stavebnice integrovaných obvodov MSI. Vstupom má byť systém boolovských funkcií zadaných ľubovoľným boolovským výrazom alebo pravdivostnou tabuľkou. Výstupom má byť prepojovací predpis opisujúci štruktúru navrhnutého logického obvodu.', 'Treba vypracovať metodiku automatického návrhu logických kombinačných obvodov s viacerými výstupmi s použitím dekodérov a členov OR alebo NAND zo stavebnice integrovaných obvodov MSI. Vstupom má byť systém boolovských funkcií zadaných ľubovoľným boolovským výrazom alebo pravdivostnou tabuľkou. Výstupom má byť prepojovací predpis opisujúci štruktúru navrhnutého logického obvodu.', 0);
INSERT INTO projects VALUES (689, 'ZP', 297, NULL, 620, '2002/2003', 'Pružné vzdelávanie', 'Flexible learning', NULL, NULL, 1);
INSERT INTO projects VALUES (690, 'DP', 397, 358, 620, '2005/2006', 'Zrušené certifikáty a elektronický podpis', 'Revoked certificates and digital signature', NULL, NULL, 2);
INSERT INTO projects VALUES (691, 'ZP', 660, NULL, 621, '2002/2003', 'Podpora vyhodnocovania výsledkov ankiet v prostredí WWW', 'Support of web questionnaires evaluation', NULL, NULL, 1);
INSERT INTO projects VALUES (692, 'DP', 387, NULL, 621, '2003/2004', 'Zdieľanie a sprístupňovanie dokumentov', 'Document sharing and access', NULL, NULL, 1);
INSERT INTO projects VALUES (693, 'ZP', 272, NULL, 622, '2003/2004', 'Systém pre generovanie fraktálov', 'The system for generating fractals', 'Objekty v prírode sa vyznačujú svojou geometrickou nepravidelnosťou. Nepravidelnosť spôsobuje značné problémy pri ich matematickom opise z hľadiska množstva dát  potrebných pre reprezentáciu objektov. Dané nedostatky je možné riešiť pomocou modelovania vhodnými typmi fraktálov. Analyzujte problematiku fraktálovej geometrie. Vypracujte prehľad známych typov fraktálov a ich matematického opisu. Navrhnite a implementujte systém umožňujúci generovanie, vizualizáciu a následné uchovanie vygenerovaných fraktálov v ľubovolnom formáte.', 'Objekty v prírode sa vyznačujú svojou geometrickou nepravidelnosťou. Nepravidelnosť spôsobuje značné problémy pri ich matematickom opise z hľadiska množstva dát  potrebných pre reprezentáciu objektov. Dané nedostatky je možné riešiť pomocou modelovania vhodnými typmi fraktálov. Analyzujte problematiku fraktálovej geometrie. Vypracujte prehľad známych typov fraktálov a ich matematického opisu. Navrhnite a implementujte systém umožňujúci generovanie, vizualizáciu a následné uchovanie vygenerovaných fraktálov v ľubovolnom formáte.', 1);
INSERT INTO projects VALUES (694, 'DP', 579, NULL, 622, '2004/2005', 'Využitie znalostí v tvorbe plánov (rozvrhov)', 'Využitie znalostí v tvorbe plánov (rozvrhov)', NULL, NULL, 1);
INSERT INTO projects VALUES (695, 'ZP', 579, NULL, 623, '2003/2004', 'Využitie multimediálnych foriem výučby informatiky – 1', 'Multimedia versions of teaching 1', 'Analyzujte možnosti využitia multimediálnej podoby informácií v systémoch na podporu výučby informatiky. Navrhnite základný systém a následne ho rozšírte o vhodné štruktúry a funkcie, ktoré by zvýraznili obohatenie textového obsahu o rôzne iné formy prezentácie, ako aj doplnenie nových informácií v podobe obrázkov, grafov, animácií. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na niektorom predmete podľa potrieb KIVT.', 'Analyzujte možnosti využitia multimediálnej podoby informácií v systémoch na podporu výučby informatiky. Navrhnite základný systém a následne ho rozšírte o vhodné štruktúry a funkcie, ktoré by zvýraznili obohatenie textového obsahu o rôzne iné formy prezentácie, ako aj doplnenie nových informácií v podobe obrázkov, grafov, animácií. Podstatné časti z návrhu implementujte vo vhodnom implementačnom prostredí a overte na niektorom predmete podľa potrieb KIVT.', 1);
INSERT INTO projects VALUES (696, 'DP', 705, NULL, 623, '2005/2006', 'Virtuálna stavebnica logických obvodov s normálnou štruktúrou', 'Virtuálna stavebnica logických obvodov s normálnou štruktúrou', NULL, NULL, 0);
INSERT INTO projects VALUES (697, 'ZP', 672, 541, 625, '2004/2005', 'Jazyk ako sieť malého sveta', 'Jazyk ako sieť malého sveta', 'Siete malého sveta sú grafy, ktorých vlastnosti integrujú v sebe vlastnosti náhodných grafov aj usporiadaných mriežok. Pomocou takýchto grafov možno modelovať vlastnosti reálnych sietí, ako je www, napr. ukazuje sa, že aj ľudský jazyk možno popísať ako graf malého sveta, kde uzly sú slová a hrany interakcie medzi nimi. Analyzujte anglický preklad Biblie z hľadiska siete malého sveta a overte hypotézu o škálovaní počtu hrán v grafe, ktorá tvrdí, že iné vlastnosti má ustálená časť jazyka a iné moderná. Ak v grafe zostavenom z biblického textu bude chýbať režim škálovania typický pre slová, ktoré sú relatívne nové (ako napr počítač, world wide web, chromozóm), možno hypotézu považovať za overenú. ', 'Siete malého sveta sú grafy, ktorých vlastnosti integrujú v sebe vlastnosti náhodných grafov aj usporiadaných mriežok. Pomocou takýchto grafov možno modelovať vlastnosti reálnych sietí, ako je www, napr. ukazuje sa, že aj ľudský jazyk možno popísať ako graf malého sveta, kde uzly sú slová a hrany interakcie medzi nimi. Analyzujte anglický preklad Biblie z hľadiska siete malého sveta a overte hypotézu o škálovaní počtu hrán v grafe, ktorá tvrdí, že iné vlastnosti má ustálená časť jazyka a iné moderná. Ak v grafe zostavenom z biblického textu bude chýbať režim škálovania typický pre slová, ktoré sú relatívne nové (ako napr počítač, world wide web, chromozóm), možno hypotézu považovať za overenú. ', 1);
INSERT INTO projects VALUES (698, 'ZP', 270, NULL, 626, '2005/2006', 'Vytvorenie webovej aplikácie na spracovanie publikačnej činnosti pracoviska', 'Vytvorenie webovej aplikácie na spracovanie publikačnej činnosti pracoviska', 'Spôsob spracovania informácií, ktoré ponúka súčasný web je veľmi výhodný pre zadávanie, evidenciu, spracovanie a archiváciu rôznych typov údajov, ako napr. publikačnej činnosti pracoviska. Analyzujte prístupy v súčasných systémoch pre spracovanie údajov podobného typu. Preskúmajte, ktoré nástroje sú pre aplikácie tohoto druhu najvhodnejšie. Navrhnite systém, ktorý bude realizovať distribuované zadávanie publikácií do databázy pracoviska a umožní nad ňou realizovať bežné operácie, ako je výber podľa istých kritérií, triedenie, atď. Navrhnutý systém implementujte a experimentálne overte na zozname publikačnej činnosti FIIT STU.', 'Spôsob spracovania informácií, ktoré ponúka súčasný web je veľmi výhodný pre zadávanie, evidenciu, spracovanie a archiváciu rôznych typov údajov, ako napr. publikačnej činnosti pracoviska. Analyzujte prístupy v súčasných systémoch pre spracovanie údajov podobného typu. Preskúmajte, ktoré nástroje sú pre aplikácie tohoto druhu najvhodnejšie. Navrhnite systém, ktorý bude realizovať distribuované zadávanie publikácií do databázy pracoviska a umožní nad ňou realizovať bežné operácie, ako je výber podľa istých kritérií, triedenie, atď. Navrhnutý systém implementujte a experimentálne overte na zozname publikačnej činnosti FIIT STU.', 1);
INSERT INTO projects VALUES (699, 'ZP', 433, NULL, 627, '2005/2006', 'Ohodnocovanie softvérových systémov', 'Ohodnocovanie softvérových systémov', 'Softvérové inžiniersvo neustále hľadá nové spôsoby merania kvality softvérových systémov. Medzi základné sledované charakteristiky partia zviazanosť a súdržnosť. Modelujte zdrojový kód softvérového systému ako graf, ktorého uzly predstavujú entity objektovo-orientovanej realizácie systému, a ktorého hrany reprezentujú väzby medzi týmito entitami. Vytvorte nástroj, ktorý na základe analýzy rozsiahleho softvérového systému zmeria takúto reprezentáciu. Pomocou tohto nástroja vyhodnoťte niekoľko rozsiahlejších systémov s voľne dostupným zdrojovým kódom.', 'Softvérové inžiniersvo neustále hľadá nové spôsoby merania kvality softvérových systémov. Medzi základné sledované charakteristiky partia zviazanosť a súdržnosť. Modelujte zdrojový kód softvérového systému ako graf, ktorého uzly predstavujú entity objektovo-orientovanej realizácie systému, a ktorého hrany reprezentujú väzby medzi týmito entitami. Vytvorte nástroj, ktorý na základe analýzy rozsiahleho softvérového systému zmeria takúto reprezentáciu. Pomocou tohto nástroja vyhodnoťte niekoľko rozsiahlejších systémov s voľne dostupným zdrojovým kódom.', 1);
INSERT INTO projects VALUES (700, 'ZP', 294, NULL, 628, '2003/2004', 'Počítačom generovaná holografia', 'Počítačom generovaná holografia', 'Urobte rešerš publikácií, naštudujte a urobte analýzu možností výpočtov počítačom generovaných hologramov (CGH) značka premietaná laserom pre aplikácie v obohatenej skutočnosti (augmented reality). Vytvorte program pre výpočet a overte algoritmus vygenerovaním dát digitálneho hologramu jednoduchého geometrického vzoru vo formáte elektrónového litografiu (DWG). Pojednajte o možnostiach urýchlenia výpočtov CGH pomocou viacerých  počítačov súčasne.', 'Urobte rešerš publikácií, naštudujte a urobte analýzu možností výpočtov počítačom generovaných hologramov (CGH) značka premietaná laserom pre aplikácie v obohatenej skutočnosti (augmented reality). Vytvorte program pre výpočet a overte algoritmus vygenerovaním dát digitálneho hologramu jednoduchého geometrického vzoru vo formáte elektrónového litografiu (DWG). Pojednajte o možnostiach urýchlenia výpočtov CGH pomocou viacerých  počítačov súčasne.', 1);
INSERT INTO projects VALUES (701, 'ZP', 27, NULL, 629, '2004/2005', 'Vývojové prostredie pre algoritmy systémov súborov', 'Integrated Development Environment for Filesystem Algorithms', 'Analyzujte dostupné otvorené modely systémov súborov, z hľadiska ich použiteľnosti ako vývojového a testovacieho prostredia pre nové implementačné metódy v architektúrach operačných systémov. Navrhnite a realizujte vývojové a testovacie prostredie, zamerané na systémy súborov. V tomto prostredí demonštrujte príklady vytvorených a testovaných algoritmov.', 'Analyzujte dostupné otvorené modely systémov súborov, z hľadiska ich použiteľnosti ako vývojového a testovacieho prostredia pre nové implementačné metódy v architektúrach operačných systémov. Navrhnite a realizujte vývojové a testovacie prostredie, zamerané na systémy súborov. V tomto prostredí demonštrujte príklady vytvorených a testovaných algoritmov.', 1);
INSERT INTO projects VALUES (702, 'ZP', 98, NULL, 630, '2004/2005', 'Objektovo orientované programovanie a Smalltalk.', 'Object Oriented programming and Smalltalk', 'Smalltalk nie je len programovací jazyk, je to vlastne celé prostredie s niektorými charakteristikami samostatného operačného systému. Ide o čiste objektovo orientovaný jazyk. Vzhľadom k tomu, že celé jeho vývojové prostredie je tiež vytvorené v Smalltalku a vykonáva sa vlastne sám v sebe, je vhodný pre tvorbu aplikácie, ktorá vie “simulovať”  návrhový proces aplikácie. Preštudujte Smalltalk resp.  jeho jednotlivé verzie hlavne  jeho objektovo orientované črty. 
Na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu, ktorá bude vizualizovať  návrhový proces objektovo orientovanej aplikácie.
', 'Smalltalk nie je len programovací jazyk, je to vlastne celé prostredie s niektorými charakteristikami samostatného operačného systému. Ide o čiste objektovo orientovaný jazyk. Vzhľadom k tomu, že celé jeho vývojové prostredie je tiež vytvorené v Smalltalku a vykonáva sa vlastne sám v sebe, je vhodný pre tvorbu aplikácie, ktorá vie “simulovať”  návrhový proces aplikácie. Preštudujte Smalltalk resp.  jeho jednotlivé verzie hlavne  jeho objektovo orientované črty. 
Na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu, ktorá bude vizualizovať  návrhový proces objektovo orientovanej aplikácie.
', 1);
INSERT INTO projects VALUES (703, 'ZP', 298, NULL, 632, '2005/2006', 'Generátor konfigurácií pre Cisco prepínače', 'Generátor konfigurácií pre Cisco prepínače', 'Analyzujte syntax príkazov pre konfiguráciu Cisco prepínačov. Navrhnite a implementujte programový systém, generujúci takúto konfiguráciu z neformálneho opisu vyžadovaného správania sa prepínača. Vstupná špecifikácia bude napr. v tvare obrázku, definujúcom vzťahy a vlastnosti jednotlivých prepojených zariadení. Výstupný súbor bude obsahovať konfiguračné príkazy podobne, ako sú zobrazené na termináli počítača pri zobrazení konfigurácie prepínača. Uvažujte aj konfigurácie pre vytváranie virtuálnych sietí (VLAN). ', 'Analyzujte syntax príkazov pre konfiguráciu Cisco prepínačov. Navrhnite a implementujte programový systém, generujúci takúto konfiguráciu z neformálneho opisu vyžadovaného správania sa prepínača. Vstupná špecifikácia bude napr. v tvare obrázku, definujúcom vzťahy a vlastnosti jednotlivých prepojených zariadení. Výstupný súbor bude obsahovať konfiguračné príkazy podobne, ako sú zobrazené na termináli počítača pri zobrazení konfigurácie prepínača. Uvažujte aj konfigurácie pre vytváranie virtuálnych sietí (VLAN). ', 0);
INSERT INTO projects VALUES (704, 'ZP', 27, NULL, 633, '2005/2006', 'Centrálne monitorovanie prvkov počítačovej siete', 'Centrálne monitorovanie prvkov počítačovej siete', '   Preštudujte vlastnosti a architektúru existujúcich aplikácií zabezpečujúcich zber, filtrovanie, vyhodnocovanie a archiváciu správ zasielaných aktívnymi prvkami počítačovej siete. Zamerajte sa na bezpečnosť, konfigurovateľnosť a podporu viacerých platforiem. Analyzujte viaceré možnosti riešenia, navrhnite a implementujte aplikáciu pre monitorovanie prvkov siete, ktorú otestujete v reálnej prevádzke a vyhodnotíte jej vlastnosti. 

Odporúčaná literatúra:

1. Dostálek, L.: Velký průvodce protokoly TCP/IP, bezpečnost. Computer Press, 2003,  ISBN 80-7226-849-X.

2. Network Monitoring Tools: a list of tools used for Network (both LAN and WAN) http://www.slac.stanford.edu/xorg/nmtf/nmtf-tools.html
(Stanford Linear Accelerator Center)


', '   Preštudujte vlastnosti a architektúru existujúcich aplikácií zabezpečujúcich zber, filtrovanie, vyhodnocovanie a archiváciu správ zasielaných aktívnymi prvkami počítačovej siete. Zamerajte sa na bezpečnosť, konfigurovateľnosť a podporu viacerých platforiem. Analyzujte viaceré možnosti riešenia, navrhnite a implementujte aplikáciu pre monitorovanie prvkov siete, ktorú otestujete v reálnej prevádzke a vyhodnotíte jej vlastnosti. 

Odporúčaná literatúra:

1. Dostálek, L.: Velký průvodce protokoly TCP/IP, bezpečnost. Computer Press, 2003,  ISBN 80-7226-849-X.

2. Network Monitoring Tools: a list of tools used for Network (both LAN and WAN) http://www.slac.stanford.edu/xorg/nmtf/nmtf-tools.html
(Stanford Linear Accelerator Center)


', 0);
INSERT INTO projects VALUES (705, 'ZP', 517, NULL, 634, '2003/2004', 'Analýza  zložitosti vybraných smerovacích algortimov', 'Analýza  zložitosti vybraných smerovacích algortimov', 'Analyzujte aspoň dva druhy smerovacích algoritmov vzhľadom na pamäťovú a časovú zložitosť. Navrhnite algoritmy pre nejaký abstraktný model počítača, pomocou ktorých je možné analyzovať uvedené zložitostné miery.  Overte získané výsledky a porovnajte jednotlivé smerovacie algoritmy vzhľadom na zistené parametre', 'Analyzujte aspoň dva druhy smerovacích algoritmov vzhľadom na pamäťovú a časovú zložitosť. Navrhnite algoritmy pre nejaký abstraktný model počítača, pomocou ktorých je možné analyzovať uvedené zložitostné miery.  Overte získané výsledky a porovnajte jednotlivé smerovacie algoritmy vzhľadom na zistené parametre', 1);
INSERT INTO projects VALUES (706, 'ZP', 98, NULL, 635, '2004/2005', 'Systém pre odovzdávanie prác prostredníctvom Internetu', 'Systém pre odovzdávanie prác prostredníctvom Internetu', 'C# je pomerne nový jazyk, ktorý vycháza z jazyka C++  a z jazyka Java. Naštudujte tento programovací jazyk a posúďte jeho možnosti ako prostriedku pre tvorbu webovských aplikácii.
Na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu pre odovzdávanie prác prostredníctvom Internetu.', 'C# je pomerne nový jazyk, ktorý vycháza z jazyka C++  a z jazyka Java. Naštudujte tento programovací jazyk a posúďte jeho možnosti ako prostriedku pre tvorbu webovských aplikácii.
Na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu pre odovzdávanie prác prostredníctvom Internetu.', 1);
INSERT INTO projects VALUES (707, 'ZP', 672, NULL, 636, '2004/2005', 'Jazyk ako sieť malého sveta', 'Jazyk ako sieť malého sveta', 'Siete malého sveta sú grafy, ktorých vlastnosti integrujú v sebe vlastnosti náhodných grafov aj usporiadaných mriežok. Pomocou takýchto grafov možno modelovať vlastnosti reálnych sietí, ako je www, napr. ukazuje sa, že aj ľudský jazyk možno popísať ako graf malého sveta, kde uzly sú slová a hrany interakcie medzi nimi. Analyzujte anglický preklad Biblie z hľadiska siete malého sveta a overte hypotézu o škálovaní počtu hrán v grafe, ktorá tvrdí, že iné vlastnosti má ustálená časť jazyka a iné moderná. Ak v grafe zostavenom z biblického textu bude chýbať režim škálovania typický pre slová, ktoré sú relatívne nové (ako napr počítač, world wide web, chromozóm), možno hypotézu považovať za overenú. ', 'Siete malého sveta sú grafy, ktorých vlastnosti integrujú v sebe vlastnosti náhodných grafov aj usporiadaných mriežok. Pomocou takýchto grafov možno modelovať vlastnosti reálnych sietí, ako je www, napr. ukazuje sa, že aj ľudský jazyk možno popísať ako graf malého sveta, kde uzly sú slová a hrany interakcie medzi nimi. Analyzujte anglický preklad Biblie z hľadiska siete malého sveta a overte hypotézu o škálovaní počtu hrán v grafe, ktorá tvrdí, že iné vlastnosti má ustálená časť jazyka a iné moderná. Ak v grafe zostavenom z biblického textu bude chýbať režim škálovania typický pre slová, ktoré sú relatívne nové (ako napr počítač, world wide web, chromozóm), možno hypotézu považovať za overenú. ', 1);
INSERT INTO projects VALUES (708, 'ZP', 10, NULL, 637, '2004/2005', 'Simulovaný robotický futbal - analýza správania hráčov', 'Simulovaný robotický futbal - analýza správania hráčov', 'Simulovaný robotický futbal sa zaoberá vytváraním tímov spolupracujúcich agentov, ktoré v simulovanom prostredí navzájom súperia. Navrhnite a implementujte nástroj na analýzu správania sa hráčov počas hry. Vytvorený nástroj by mal byť schopný rozpoznať základné vzory správania (proti)hráčov, ktoré by mali byť použiteľné pri predvídaní správania hráčov.', 'Simulovaný robotický futbal sa zaoberá vytváraním tímov spolupracujúcich agentov, ktoré v simulovanom prostredí navzájom súperia. Navrhnite a implementujte nástroj na analýzu správania sa hráčov počas hry. Vytvorený nástroj by mal byť schopný rozpoznať základné vzory správania (proti)hráčov, ktoré by mali byť použiteľné pri predvídaní správania hráčov.', 1);
INSERT INTO projects VALUES (709, 'ZP', 95, NULL, 638, '2004/2005', 'Podpora výučby v predmete MaPŠ', 'Support of teaching of subject MaPŠ', 'Analyzujte problematiku, ktorou sa zaoberá výučba formálnych špecifikácií 
v predmete Metódy a prostriedky špecifikácií. Navrhnite a implementujte
systém, ktorý podporí výučbu v tomto predmete s využitím  prostriedku
Z-Browser alebo iného dostupného prostriedku pre vizualizáciu schém 
a formúl Z-jazyka. Navrhnite vhodnú metódu pre podporu overovania
vedomostí v predmete MaPŠ. Špecifikujte požiadavky na softvérový
prostriedok, ktorý by podporoval testovanie alebo hodnotenie vedomostí 
špecifických pre oblast použitia Z-jazyka. Podľa týchto požiadaviek
navrhnite a implementuje systém a overte jeho funkčnosť podľa 
špecifikovaných požiadaviek.', 'Analyzujte problematiku, ktorou sa zaoberá výučba formálnych špecifikácií 
v predmete Metódy a prostriedky špecifikácií. Navrhnite a implementujte
systém, ktorý podporí výučbu v tomto predmete s využitím  prostriedku
Z-Browser alebo iného dostupného prostriedku pre vizualizáciu schém 
a formúl Z-jazyka. Navrhnite vhodnú metódu pre podporu overovania
vedomostí v predmete MaPŠ. Špecifikujte požiadavky na softvérový
prostriedok, ktorý by podporoval testovanie alebo hodnotenie vedomostí 
špecifických pre oblast použitia Z-jazyka. Podľa týchto požiadaviek
navrhnite a implementuje systém a overte jeho funkčnosť podľa 
špecifikovaných požiadaviek.', 1);
INSERT INTO projects VALUES (710, 'DP', 27, NULL, 638, '2005/2006', 'Dátové služby pre virtuálnu realitu', 'Dátové služby pre virtuálnu realitu', NULL, NULL, 4);
INSERT INTO projects VALUES (711, 'ZP', 20, NULL, 639, '2004/2005', 'Hra pre mobilné zariadenia', 'Game for mobile devices', 'Mobilné zariadenia umožňujúce vykonávanie užívateľom dodaných programov sú čoraz dostupnejšie. Naštudujte možnosti programovania aplikácií pre mobilné zariadenia pomocou Java 2 Micro Edition. Vytvorte  aplikáciu – hru vyžadujúcu oponenta, pričom logika oponenta bude realizovaná priamo na mobilnom zariadení.
', 'Mobilné zariadenia umožňujúce vykonávanie užívateľom dodaných programov sú čoraz dostupnejšie. Naštudujte možnosti programovania aplikácií pre mobilné zariadenia pomocou Java 2 Micro Edition. Vytvorte  aplikáciu – hru vyžadujúcu oponenta, pričom logika oponenta bude realizovaná priamo na mobilnom zariadení.
', 1);
INSERT INTO projects VALUES (712, 'DP', 20, NULL, 639, '2005/2006', 'Adaptácia vhodnej dynamiky v neurónových sieťach založených na echo stavoch', 'Adaptácia vhodnej dynamiky v neurónových sieťach založených na echo stavoch', NULL, NULL, 1);
INSERT INTO projects VALUES (713, 'ZP', 20, NULL, 640, '2004/2005', 'Hra pre mobilné zariadenia', 'Game for the mobile devices', 'Mobilné zariadenia umožňujúce vykonávanie užívateľom dodaných programov sú čoraz dostupnejšie. Naštudujte možnosti programovania aplikácií pre mobilné zariadenia pomocou Java 2 Micro Edition. Vytvorte  aplikáciu – hru vyžadujúcu oponenta, pričom logika oponenta bude realizovaná priamo na mobilnom zariadení.
', 'Mobilné zariadenia umožňujúce vykonávanie užívateľom dodaných programov sú čoraz dostupnejšie. Naštudujte možnosti programovania aplikácií pre mobilné zariadenia pomocou Java 2 Micro Edition. Vytvorte  aplikáciu – hru vyžadujúcu oponenta, pričom logika oponenta bude realizovaná priamo na mobilnom zariadení.
', 1);
INSERT INTO projects VALUES (714, 'DP', 20, NULL, 640, '2005/2006', 'Aplikácie nových prístupov z oblasti rekurentných neurónových sietí v robotike', 'Aplikácie nových prístupov z oblasti rekurentných neurónových sietí v robotike', NULL, NULL, 1);
INSERT INTO projects VALUES (715, 'ZP', 517, NULL, 641, '2004/2005', 'Simulátor abstraktného počítača RASP', 'Abstract computer RASP simulator ', 'Model abstraktých výpočtov RASP je analógiou počítača programovateľného v strojovo-orientovanom jazyku.  Analyzujte, navrhnite a implemetnujte simulátor abstraktného počítača RASP ako modifikácie abstraktného počítača RAM. Postupujte tak, ako pri vytváraní kompilátora pre nejaký programovací jazyk. Vytvorený simulátor overte.', 'Model abstraktých výpočtov RASP je analógiou počítača programovateľného v strojovo-orientovanom jazyku.  Analyzujte, navrhnite a implemetnujte simulátor abstraktného počítača RASP ako modifikácie abstraktného počítača RAM. Postupujte tak, ako pri vytváraní kompilátora pre nejaký programovací jazyk. Vytvorený simulátor overte.', 1);
INSERT INTO projects VALUES (716, 'DP', 46, NULL, 641, '2005/2006', 'Návrhové vzory v tvorbe softvéru', 'Návrhové vzory v tvorbe softvéru', NULL, NULL, 1);
INSERT INTO projects VALUES (717, 'ZP', 44, NULL, 642, '2004/2005', 'Simulátor abstraktného počítača RASP', 'Random Access Machine with Stored Program Simulator', 'Model abstraktých výpočtov RASP je analógiou počítača programovateľného v strojovo-orientovanom jazyku.  Analyzujte, navrhnite a implemetnujte simulátor abstraktného počítača RASP ako modifikácie abstraktného počítača RAM. Postupujte tak, ako pri vytváraní kompilátora pre nejaký programovací jazyk. Vytvorený simulátor overte.', 'Model abstraktých výpočtov RASP je analógiou počítača programovateľného v strojovo-orientovanom jazyku.  Analyzujte, navrhnite a implemetnujte simulátor abstraktného počítača RASP ako modifikácie abstraktného počítača RAM. Postupujte tak, ako pri vytváraní kompilátora pre nejaký programovací jazyk. Vytvorený simulátor overte.', 1);
INSERT INTO projects VALUES (718, 'DP', 31, NULL, 642, '2005/2006', 'Interpret pre jazyk Occam', 'Interpret pre jazyk Occam', NULL, NULL, 1);
INSERT INTO projects VALUES (719, 'ZP', 660, NULL, 643, '2004/2005', 'CSIDC 2005', 'CSIDC 2005', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 1);
INSERT INTO projects VALUES (720, 'DP', 660, NULL, 643, '2005/2006', 'Personalizovaná navigácia v priestore webu so sémantikou', 'Personalizovaná navigácia v priestore webu so sémantikou', NULL, NULL, 1);
INSERT INTO projects VALUES (721, 'ZP', 541, NULL, 644, '2004/2005', 'Zálohovanie a obnova dát v databázach', 'Backup and recovery in databases', 'Analyzujte metódy a prostriedky zálohovania a obnovy dát v relačných databázových systémoch. Definujte výhody a nedostatky zálohovania a obnovy dát v DBS Oracle. Navrhnite možné metódy zlepšenia a rozšírenia funkcií zálohovania a obnovy dát. Vybraté  metódy implementujte v prostredí Oracle. Funkčnosť systému demonštrujte na vybratom príklade.', 'Analyzujte metódy a prostriedky zálohovania a obnovy dát v relačných databázových systémoch. Definujte výhody a nedostatky zálohovania a obnovy dát v DBS Oracle. Navrhnite možné metódy zlepšenia a rozšírenia funkcií zálohovania a obnovy dát. Vybraté  metódy implementujte v prostredí Oracle. Funkčnosť systému demonštrujte na vybratom príklade.', 1);
INSERT INTO projects VALUES (722, 'ZP', 433, NULL, 645, '2004/2005', 'Prezentácia dokumentov pre web so sémantikou', 'Presentation of documents for web with semantic information', 'Analyzujte metódy a prostriedky uchovávania a prezentácie dokumentov pre novú generáciu siete Internet, web so sémantikou. Zamerajte sa pritom na reprezentáciu RDF modelu a existujúce schémy opisu dát. Skúmajte možnosti automatizovanej extrakcie a pridávania sémantických informácií do existujúcich dokumentov. Navrhnite systém, ktorý bude sprístupňovať archivované dokumenty spolu s sémantickým opisom, umožnite sémantický prístup k systému aj iným agentom. Navrhnuté riešenie overte implementovaním web-systému na sprístupňovanie dokumentov. ', 'Analyzujte metódy a prostriedky uchovávania a prezentácie dokumentov pre novú generáciu siete Internet, web so sémantikou. Zamerajte sa pritom na reprezentáciu RDF modelu a existujúce schémy opisu dát. Skúmajte možnosti automatizovanej extrakcie a pridávania sémantických informácií do existujúcich dokumentov. Navrhnite systém, ktorý bude sprístupňovať archivované dokumenty spolu s sémantickým opisom, umožnite sémantický prístup k systému aj iným agentom. Navrhnuté riešenie overte implementovaním web-systému na sprístupňovanie dokumentov. ', 1);
INSERT INTO projects VALUES (723, 'ZP', 359, NULL, 646, '2003/2004', 'Programová podpora pre výučbu základných systémov hromadnej obsluhy', 'Programová podpora pre výučbu základných systémov hromadnej obsluhy', 'Analyzujte základné systémy hromadnej obsluhy. Navrhnite a implementujte aplikáciu, ktorá bude vizualizovať činnosť vybraných systémov HO.

', 'Analyzujte základné systémy hromadnej obsluhy. Navrhnite a implementujte aplikáciu, ktorá bude vizualizovať činnosť vybraných systémov HO.

', 0);
INSERT INTO projects VALUES (724, 'ZP', 297, NULL, 647, '2003/2004', 'Vizualizácia  algoritmov', 'Algorithm Visualisation', 'Analyzujte vizualizačné softvérové systémy a metódy vizualizácie. Špecifikujte podmienky na tvorbu systému pre vizualizáciu v etape algoritmizácie. Podľa špecifikácie algoritmu navrhnite systém, ktorý názorne demonštruje algoritmus pomocou zvolených vizualizačných metód a prostriedkov.  Navrhnutý systém implementujte a overte realizovaním niektorých vybraných algoritmov.', 'Analyzujte vizualizačné softvérové systémy a metódy vizualizácie. Špecifikujte podmienky na tvorbu systému pre vizualizáciu v etape algoritmizácie. Podľa špecifikácie algoritmu navrhnite systém, ktorý názorne demonštruje algoritmus pomocou zvolených vizualizačných metód a prostriedkov.  Navrhnutý systém implementujte a overte realizovaním niektorých vybraných algoritmov.', 1);
INSERT INTO projects VALUES (725, 'DP', 16, NULL, 647, '2004/2005', 'Získavanie a spracovanie výsledkov výskumu a vývoja z webu', 'Získavanie a spracovanie výsledkov výskumu a vývoja z webu', NULL, NULL, 1);
INSERT INTO projects VALUES (726, 'ZP', 660, NULL, 648, '2004/2005', 'CSIDC 2005', 'CSIDC 2005', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 'V rámci medzinárodnej súťaže v navrhovaní, ktorú organizuje Počítačová spoločnosť IEEE (CSIDC – Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte riešenie problému podľa zadania Počítačovej spoločnosti IEEE. Analyzujte správy a prezentácie vybraných projektov tímov študentov, ktorí sa zúčastnili finále v predchádzajúcich ročníkoch súťaže, preštudujte technológie a softvérové prostriedky, ktoré budú tvoriť základ riešenia. Ďalej navrhnite a implementujte prototyp systému podľa špecifikácie a ohraničujúcich podmienok dodaných Počítačovou spoločnosťou IEEE. Vytvorený prototyp overte, vyhodnoťte jeho použiteľnosť, udržovateľnosť a možnosti výroby. Výsledok riešenia je súčasťou širšej úlohy, na ktorej sa podieľa tím štyroch študentov.', 1);
INSERT INTO projects VALUES (727, 'DP', 660, NULL, 648, '2005/2006', 'Zachytenie záujmov používateľov na webe', 'Zachytenie záujmov používateľov na webe', NULL, NULL, 1);
INSERT INTO projects VALUES (728, 'ZP', 579, NULL, 649, '2004/2005', 'Systém na podporu tvorby semestrálnych rozvrhov', 'System for support of semestral schedules generation', 'Analyzujte údajové množiny a postupy pri vytváraní semestrálnych rozvrhov a následne navrhnite systém, ktorý by tieto činnosti podporoval. Základné časti návrhu realizujte v podobe prototypu a zaistite nevyhnutnú kompatibilitu s informačným systémom používaným na FIIT.', 'Analyzujte údajové množiny a postupy pri vytváraní semestrálnych rozvrhov a následne navrhnite systém, ktorý by tieto činnosti podporoval. Základné časti návrhu realizujte v podobe prototypu a zaistite nevyhnutnú kompatibilitu s informačným systémom používaným na FIIT.', 1);
INSERT INTO projects VALUES (729, 'DP', 579, NULL, 649, '2005/2006', 'Systém získavania doplňujúcich informácií pre tvorbu rozvrhov', 'Systém získavania doplňujúcich informácií pre tvorbu rozvrhov', NULL, NULL, 4);
INSERT INTO projects VALUES (730, 'ZP', 660, NULL, 650, '2004/2005', 'Adaptívny web a výučba programovania', 'Adaptive web and programming education', 'Pre vzdelávanie je veľmi výhodné využiť ako prezentačné médium Internet (resp. web) najmä vďaka jeho dostupnosti. Aby sme dosiahli čo najvyššiu efektívnosť učenia prostredníctvom Internetu, je dôležté, aby sa výučbový systém dokázal prispôsobovať jednotlivým študentom, resp. skupinám študentov. Skúmajte vlastnosti adaptívnych systémov pre vzdelávanie, ktoré ako prezentačné médium využívajú Internet (resp. web). Vyhodnoťte využitie existujúceho otvoreného systému AHA! vydaného pod licenciou GNU Public License 2.0 pre výučbu programovania (systém AHA! je vyvinutý modernými technológiami – Java SDK 1.4, Tomcat web server, XML a ďalšie a je dostupný na adrese http://aha.win.tue.nl). Navrhnite doménový model pre oblasť programovania a tiež model používateľa tak, aby sa systém dal využiť v predmetoch, kde sa vyučujú základy programovania (napr. Algoritmizácia a programovanie, Funkcionálne a logické programovanie). Navrhnuté riešenie experimentálne overte.
', 'Pre vzdelávanie je veľmi výhodné využiť ako prezentačné médium Internet (resp. web) najmä vďaka jeho dostupnosti. Aby sme dosiahli čo najvyššiu efektívnosť učenia prostredníctvom Internetu, je dôležté, aby sa výučbový systém dokázal prispôsobovať jednotlivým študentom, resp. skupinám študentov. Skúmajte vlastnosti adaptívnych systémov pre vzdelávanie, ktoré ako prezentačné médium využívajú Internet (resp. web). Vyhodnoťte využitie existujúceho otvoreného systému AHA! vydaného pod licenciou GNU Public License 2.0 pre výučbu programovania (systém AHA! je vyvinutý modernými technológiami – Java SDK 1.4, Tomcat web server, XML a ďalšie a je dostupný na adrese http://aha.win.tue.nl). Navrhnite doménový model pre oblasť programovania a tiež model používateľa tak, aby sa systém dal využiť v predmetoch, kde sa vyučujú základy programovania (napr. Algoritmizácia a programovanie, Funkcionálne a logické programovanie). Navrhnuté riešenie experimentálne overte.
', 1);
INSERT INTO projects VALUES (731, 'DP', 382, NULL, 650, '2005/2006', 'Algoritmická chémia v genetickom programovaní', 'Algoritmická chémia v genetickom programovaní', NULL, NULL, 1);
INSERT INTO projects VALUES (732, 'ZP', 541, NULL, 651, '2004/2005', 'Interfejs pre identifikáciu používateľa', 'Interface for user''s identification', 'Navrhnite  a implementujte interfejs pre identifikáciu používateľa. Urobte analýzu exitujúcich prístupov v tejto oblasti. Navrhnite spôsob identifikácie používateľa na základe jeho štýlu práce s klávesnicou a myšou. Systém implementujte v C alebo Jave. Urobte experiment na skupine používateľov.', 'Navrhnite  a implementujte interfejs pre identifikáciu používateľa. Urobte analýzu exitujúcich prístupov v tejto oblasti. Navrhnite spôsob identifikácie používateľa na základe jeho štýlu práce s klávesnicou a myšou. Systém implementujte v C alebo Jave. Urobte experiment na skupine používateľov.', 1);
INSERT INTO projects VALUES (733, 'DP', 655, NULL, 651, '2005/2006', 'Online adaptácia Echo state neurónových sietí', 'Online adaptácia Echo state neurónových sietí', NULL, NULL, 1);
INSERT INTO projects VALUES (734, 'DP', 357, NULL, 652, '2005/2006', 'Samoopravné Reed Solomonové kódy na interaktívnom webe', 'Error correcting Reed-Solomon codes on interactive web', NULL, NULL, 0);
INSERT INTO projects VALUES (735, 'ZP', 260, NULL, 652, '2003/2004', 'Monitorovanie procesov v operačnom systéme UNIX', 'Monitoring of processes in operating system UNIX', 'Vytvorte nástroj, ktorý umožní sledovať aktivitu procesov v operačnom systéme. Príkladom informácií, ktoré je potrebné získať môže byť: kto, kedy a ako spúšťa procesy; ktoré procesy a kedy bežia v systéme; aké sú vzťahy medzi bežiacimi procesmi (vzťah rodič-potomok, medziprocesová komunikácia, ...); ako sa mení stav procesu. Výstupy nástroja štatisticky spracujte a vytvorte základ profilu operačného systému.', 'Vytvorte nástroj, ktorý umožní sledovať aktivitu procesov v operačnom systéme. Príkladom informácií, ktoré je potrebné získať môže byť: kto, kedy a ako spúšťa procesy; ktoré procesy a kedy bežia v systéme; aké sú vzťahy medzi bežiacimi procesmi (vzťah rodič-potomok, medziprocesová komunikácia, ...); ako sa mení stav procesu. Výstupy nástroja štatisticky spracujte a vytvorte základ profilu operačného systému.', 1);
INSERT INTO projects VALUES (736, 'ZP', 705, NULL, 653, '2004/2005', 'Analyzátor logických kombinačných obvodov s hradlovou štruktúrou', 'Analyzer of combinational circuits with gate structure', 'Treba navrhnúť programový systém pre analýzu logických kombinačných obvodov s hradlovou štruktúrou. Logický kombinačný obvod s viacerými výstupmi sa má zadávať svojou štruktúrou. Systém funkcií, ktoré obvod realizuje,  má byť zapísaný  formou mapy, pravdivostnou tabuľkou, vektorovým a číselným zápisom. ', 'Treba navrhnúť programový systém pre analýzu logických kombinačných obvodov s hradlovou štruktúrou. Logický kombinačný obvod s viacerými výstupmi sa má zadávať svojou štruktúrou. Systém funkcií, ktoré obvod realizuje,  má byť zapísaný  formou mapy, pravdivostnou tabuľkou, vektorovým a číselným zápisom. ', 0);
INSERT INTO projects VALUES (737, 'DP', 27, NULL, 653, '2005/2006', 'Dátové služby pre virtuálnu realitu', 'Dátové služby pre virtuálnu realitu', NULL, NULL, 0);
INSERT INTO projects VALUES (738, 'ZP', 294, NULL, 654, '2005/2006', 'Simulovanie virtuálnych objektívov pri interaktívnom zobrazovaní grafových modelov komplexných štruktúr ', 'Simulovanie virtuálnych objektívov pri interaktívnom zobrazovaní grafových modelov komplexných štruktúr ', 'Urobte rešerš, výber, analýzu možností navigácie, navrhnite a implementujte systém pre interaktívne zobrazovanie grafových reprezentácií komplexných štruktúr napr.  hyperdokumentov  vo forme premietania pomocou rôznych simulovaných objektívov napríklad rybieho oka. Systém musí umožňovať popis grafu, definovanie topológie a vzhľadu, popis uzlov a hrán grafu, definovanie citlivých bodov a navigáciu pomocou ukázania na citlivú plochu (hyperlink) a stlačenia tlačítka myši, jednoduché a rýchle ovládanie bodu pozorovateľa ako aj zmenu úrovne detailu. Analyzujte možnosti realizácie zmeny úrovne detailu, pomocou vrstiev virtuálnej gule prechodom z jednej vrsty na inú.

 ', 'Urobte rešerš, výber, analýzu možností navigácie, navrhnite a implementujte systém pre interaktívne zobrazovanie grafových reprezentácií komplexných štruktúr napr.  hyperdokumentov  vo forme premietania pomocou rôznych simulovaných objektívov napríklad rybieho oka. Systém musí umožňovať popis grafu, definovanie topológie a vzhľadu, popis uzlov a hrán grafu, definovanie citlivých bodov a navigáciu pomocou ukázania na citlivú plochu (hyperlink) a stlačenia tlačítka myši, jednoduché a rýchle ovládanie bodu pozorovateľa ako aj zmenu úrovne detailu. Analyzujte možnosti realizácie zmeny úrovne detailu, pomocou vrstiev virtuálnej gule prechodom z jednej vrsty na inú.

 ', 1);
INSERT INTO projects VALUES (739, 'ZP', 294, NULL, 656, '2003/2004', 'Distribuované simulačné prostredie založené na technike Web3D', 'Distribuované simulačné prostredie založené na technike Web3D', 'Urobte rešerš publikácií, naštudujte a urobte analýzu existujúcich systémov pri distribuovanú simuláciu pohybu 3D modelov v distribuovanom  prostredí Web3D založenom na VRML a príbuzných systémov virtuálnej reality pre internet. Adaptujete niektoré z voľne dostupných prostredí a urobte experimenty s jednoduchou scénou tak aby mohli objekty scény ovládať viaceré osoby z rôznych klientských počítačov. Realizujte  s adaptovaným  a modifikovaným alebo vlastne vyvinutým prostredím jednoduchú aplikáciu zameranú na e-Learning, napríklad kooperatívne experimenty vo virtuálnom laboratóriu', 'Urobte rešerš publikácií, naštudujte a urobte analýzu existujúcich systémov pri distribuovanú simuláciu pohybu 3D modelov v distribuovanom  prostredí Web3D založenom na VRML a príbuzných systémov virtuálnej reality pre internet. Adaptujete niektoré z voľne dostupných prostredí a urobte experimenty s jednoduchou scénou tak aby mohli objekty scény ovládať viaceré osoby z rôznych klientských počítačov. Realizujte  s adaptovaným  a modifikovaným alebo vlastne vyvinutým prostredím jednoduchú aplikáciu zameranú na e-Learning, napríklad kooperatívne experimenty vo virtuálnom laboratóriu', 1);
INSERT INTO projects VALUES (740, 'DP', 294, NULL, 656, '2005/2006', 'Distribuované simulačné prostredie založené na technike Web3D  a Java', 'Distributed simulation environment based on Web3D and Java techniques', NULL, NULL, 1);
INSERT INTO projects VALUES (741, 'ZP', 359, NULL, 657, '2005/2006', 'Programová podpora pre výučbu počítačových sietí', 'Programová podpora pre výučbu počítačových sietí', 'Analyzujte CLI prostredie v CISCO smerovačoch. Navrhnite a implementujte programový systém, ktorý bude simulovať činnosť CISCO smerovača pre vybranú skupinu príkazov. Systém má umožňiť trénovanie konfigurovania smerovačov v prostredí OS Windows. ', 'Analyzujte CLI prostredie v CISCO smerovačoch. Navrhnite a implementujte programový systém, ktorý bude simulovať činnosť CISCO smerovača pre vybranú skupinu príkazov. Systém má umožňiť trénovanie konfigurovania smerovačov v prostredí OS Windows. ', 0);
INSERT INTO projects VALUES (742, 'ZP', 360, NULL, 658, '2005/2006', 'Zobrazenie údajov v počítači', 'Zobrazenie údajov v počítači', 'Analyzujte problematiku pozičných číselných sústav a zobrazenia údajov v počítači.
Navrhnite a implementujte demonštračný a výučbový systém použiteľný  na výučbu prevodov medzi číselnými sústavami, zobrazovania údajov v počítači a celočíselnej aritmetiky v dvojkovej číselnej sústave. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Má byť funkčný  v textovom režime pod ľubovoľným operačným systémom.
', 'Analyzujte problematiku pozičných číselných sústav a zobrazenia údajov v počítači.
Navrhnite a implementujte demonštračný a výučbový systém použiteľný  na výučbu prevodov medzi číselnými sústavami, zobrazovania údajov v počítači a celočíselnej aritmetiky v dvojkovej číselnej sústave. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Má byť funkčný  v textovom režime pod ľubovoľným operačným systémom.
', 0);
INSERT INTO projects VALUES (743, 'ZP', 660, NULL, 659, '2002/2003', 'CSIDC', 'Computer Society International Design Competition', NULL, NULL, 0);
INSERT INTO projects VALUES (744, 'DP', 436, NULL, 659, '2005/2006', 'Návrh a implementácia programovej podpory pre modelovanie a verifikáciu vnorených systémov v jazyku UML', 'Návrh a implementácia programovej podpory pre modelovanie a verifikáciu vnorených systémov v jazyku UML', NULL, NULL, 0);
INSERT INTO projects VALUES (745, 'DP', 27, NULL, 661, '2005/2006', 'Optická orientácia v meste a v budovách', 'Optical orientation in the city and in buildings', NULL, NULL, 1);
INSERT INTO projects VALUES (746, 'ZP', 27, NULL, 661, '2003/2004', 'Optická orientácia v mestskom centre', 'Optical orientation in the centre of city', 'Analyzujte dostupné metódy pre optickú orientáciu v priestore (tracking). Navrhnite a realizujte jednoduchý príklad s použitím snímok reálneho okolia v centre mesta. Pri realizácii využite jednotný grafický vzhľad domových čísiel, tabuliek s názvami ulíc a prípadne iných orientačných objektov.', 'Analyzujte dostupné metódy pre optickú orientáciu v priestore (tracking). Navrhnite a realizujte jednoduchý príklad s použitím snímok reálneho okolia v centre mesta. Pri realizácii využite jednotný grafický vzhľad domových čísiel, tabuliek s názvami ulíc a prípadne iných orientačných objektov.', 1);
INSERT INTO projects VALUES (747, 'ZP', 655, NULL, 662, '2004/2005', 'Neurónové siete a evolučné algoritmy', 'Neural networks and evolutionary algorithms', 'Neurónové siete a evolučné algoritmy sa v poslednom období stali populárne najmä na riešenie problémov v oblastiach, kde klasické prístupy a známe algoritmy zlyhávajú. Naštudujte problematiku evolučných algoritmov najmä s ohľadom na možnosť ich aplikovania v oblasti neurónových sietí. Navrhnite a implementujte program (simulátor) umožňujúci pri trénovaní neurónovej siete evolúciou zároveň vyvíjať a upravovať aj jej topológiu. Vytvorené riešenie overte na zvolenom probléme.', 'Neurónové siete a evolučné algoritmy sa v poslednom období stali populárne najmä na riešenie problémov v oblastiach, kde klasické prístupy a známe algoritmy zlyhávajú. Naštudujte problematiku evolučných algoritmov najmä s ohľadom na možnosť ich aplikovania v oblasti neurónových sietí. Navrhnite a implementujte program (simulátor) umožňujúci pri trénovaní neurónovej siete evolúciou zároveň vyvíjať a upravovať aj jej topológiu. Vytvorené riešenie overte na zvolenom probléme.', 1);
INSERT INTO projects VALUES (748, 'DP', 655, NULL, 662, '2005/2006', 'Neuroevolúcia cez rozširovanie topológie', 'Neuroevolúcia cez rozširovanie topológie', NULL, NULL, 1);
INSERT INTO projects VALUES (749, 'DP', 25, NULL, 663, '2005/2006', 'Koncentrátor sériových rozhraní', 'Serial interface concentrator', NULL, NULL, 0);
INSERT INTO projects VALUES (750, 'ZP', 25, NULL, 663, '2003/2004', 'Autentifikácia používateľov čipovými kartami', 'Chip card user authentication', 'Analyzujte možnosti využitia identifikačných čipových kariet pri autentifikácii používateľov z pohľadu operačného systému. Navrhnite a implementujte periférne zariadenie umožňujúce načítaný kód z bezpečnostných kariet cez vhodné rozhranie (napr. USB) preniesť bezpečným a spoľahlivým spôsobom do počítača, ako aj ovládač pre operačný systém umožňujúci prácu so zariadením vyšším vrstvám. Celý systém  otestujte so zameraním na funkčnosť a bezpečnosť.', 'Analyzujte možnosti využitia identifikačných čipových kariet pri autentifikácii používateľov z pohľadu operačného systému. Navrhnite a implementujte periférne zariadenie umožňujúce načítaný kód z bezpečnostných kariet cez vhodné rozhranie (napr. USB) preniesť bezpečným a spoľahlivým spôsobom do počítača, ako aj ovládač pre operačný systém umožňujúci prácu so zariadením vyšším vrstvám. Celý systém  otestujte so zameraním na funkčnosť a bezpečnosť.', 0);
INSERT INTO projects VALUES (751, 'DP', 660, NULL, 664, '2005/2006', 'Identifikácia a manažment zmien ontológií', 'Identification and management of ontology changes', NULL, NULL, 1);
INSERT INTO projects VALUES (752, 'ZP', 437, NULL, 664, '2003/2004', 'Softvér ako výsledok technickej tvorivej duševnej činnosti', 'Software as the result of technical creative mentation', 'Uveďte pojem softvér z pohľadu technického aj právneho, pričom uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Vysvetlite, aké sú práva na softvér, čo je to ochrana takýchto práv, prečo treba takéto práva chrániť s dôrazom na etické a spoločenské súvislosti. Opíšte známe právne riešenia ochrany softvéru, pričom opäť uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Analyzujte súčasný stav, pomenujte prípadné otvorené problémy a naznačte možnosti ich riešenia. O celej problematike vytvorte tématické pavučinové sídlo, ktoré bude slúžiť ako zdroj informácií aj odkazov na ne. ', 'Uveďte pojem softvér z pohľadu technického aj právneho, pričom uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Vysvetlite, aké sú práva na softvér, čo je to ochrana takýchto práv, prečo treba takéto práva chrániť s dôrazom na etické a spoločenské súvislosti. Opíšte známe právne riešenia ochrany softvéru, pričom opäť uvažujte nielen slovenský právny systém, ale aj inonárodné a medzinárodné právne úpravy. Analyzujte súčasný stav, pomenujte prípadné otvorené problémy a naznačte možnosti ich riešenia. O celej problematike vytvorte tématické pavučinové sídlo, ktoré bude slúžiť ako zdroj informácií aj odkazov na ne. ', 1);
INSERT INTO projects VALUES (753, 'ZP', 27, NULL, 665, '2002/2003', 'Štúdia aplikácií objektovo orientovaného operačného systému', 'Study of applications of object–oriented operating system', NULL, NULL, 1);
INSERT INTO projects VALUES (754, 'DP', 27, NULL, 665, '2005/2006', 'Príspevok ku grafickému softvéru pre mobilné zariadenia', 'Improvements on a graphics engine for mobile devices', NULL, NULL, 1);
INSERT INTO projects VALUES (755, 'ZP', 436, NULL, 666, '2004/2005', 'Transformačný program zápisu špecifikácie správania digitálneho subsystému  do jazyka C jeho softvérovej implementácii', 'Program for transformation record of specification for behavior digital subsystem to language C in software implementation', 'Navrhnite a implementujte transformačný program zo zápisu formálnej špecifikácie správania synchrónneho digitálneho systému na úrovni registrových prenosov (t.j. na úrovni abstrakcie RTL) do jazyka C. Predpokladá sa, že vstupný zápis špecifikácie obsahuje iba elementárne operácie (mikrooperácie) nad obsahmi registrov  (+,-,., and a pod.) a jeden sekvenčný  proces. Špecifikácia je zadaná v jazyku VHDL.  ', 'Navrhnite a implementujte transformačný program zo zápisu formálnej špecifikácie správania synchrónneho digitálneho systému na úrovni registrových prenosov (t.j. na úrovni abstrakcie RTL) do jazyka C. Predpokladá sa, že vstupný zápis špecifikácie obsahuje iba elementárne operácie (mikrooperácie) nad obsahmi registrov  (+,-,., and a pod.) a jeden sekvenčný  proces. Špecifikácia je zadaná v jazyku VHDL.  ', 1);
INSERT INTO projects VALUES (756, 'DP', 95, NULL, 666, '2005/2006', 'Podpora vyučovania MaPŠ - verifikácia', 'Podpora vyučovania MaPŠ - verifikácia', NULL, NULL, 1);
INSERT INTO projects VALUES (757, 'DP', 16, NULL, 667, '2005/2006', 'Integrácia modelovania vlastností do UML', 'Integrating Feature Modeling into UML', NULL, NULL, 1);
INSERT INTO projects VALUES (758, 'ZP', 433, NULL, 667, '2003/2004', 'Vyhľadávanie a navigácia v priestore záverečných prác', 'Vyhľadávanie a navigácia v priestore záverečných prác', 'Efektívne vyhľadávanie relevantných informácií a navigácia v rozsiahlych informačných priestoroch predstavuje dnes jeden z aktuálnych problémov. Analyzujte možnosti vyhľadávania a navigácie v uzavretom informačnom priestore, v ktorom sa nachádzajú abstrakty a texty záverečných prác (bakalárskeho aj inžinierskeho štúdia). Využite pri tom informačnú bázu vytváranú v systéme FEIPRO, ktorý bol prvýkrát nasadený v akademickom roku 2002/2003 pre záverečné projekty bakalárskeho štúdia. Ďalej analyzujte možnosti vyhľadávania a navigácie v priestore záverečných prác na základe rôznych požiadaviek používateľa. Navrhnite vhodnú alternatívnu reprezentáciu takéhoto informačného priestoru so zameraním na efektívne vyhľadávanie a navigáciu. Pri vyhľadávaní a odporúčaní záverečných prác môže poslúžiť aj obsah posudkov na vybrané práce. Skúmajte možnosti využitia sémantiky informácií v informačnej báze. Uvažujte pri tom pravidelné dopĺňanie prác do informačného priestoru. Navrhnuté riešenie overte vytvorením softvérového prototypu systému na vyhľadávanie a odporúčanie záverečných prác.', 'Efektívne vyhľadávanie relevantných informácií a navigácia v rozsiahlych informačných priestoroch predstavuje dnes jeden z aktuálnych problémov. Analyzujte možnosti vyhľadávania a navigácie v uzavretom informačnom priestore, v ktorom sa nachádzajú abstrakty a texty záverečných prác (bakalárskeho aj inžinierskeho štúdia). Využite pri tom informačnú bázu vytváranú v systéme FEIPRO, ktorý bol prvýkrát nasadený v akademickom roku 2002/2003 pre záverečné projekty bakalárskeho štúdia. Ďalej analyzujte možnosti vyhľadávania a navigácie v priestore záverečných prác na základe rôznych požiadaviek používateľa. Navrhnite vhodnú alternatívnu reprezentáciu takéhoto informačného priestoru so zameraním na efektívne vyhľadávanie a navigáciu. Pri vyhľadávaní a odporúčaní záverečných prác môže poslúžiť aj obsah posudkov na vybrané práce. Skúmajte možnosti využitia sémantiky informácií v informačnej báze. Uvažujte pri tom pravidelné dopĺňanie prác do informačného priestoru. Navrhnuté riešenie overte vytvorením softvérového prototypu systému na vyhľadávanie a odporúčanie záverečných prác.', 1);
INSERT INTO projects VALUES (759, 'DP', 563, NULL, 668, '2005/2006', 'Simulátor technologického zariadenia ', 'Simulator of a technological system', NULL, NULL, 0);
INSERT INTO projects VALUES (760, 'ZP', 563, NULL, 668, '2003/2004', 'Experimentálny mikropočítač', 'Experimental microcomputer', 'Navrhnite a zrealizujte experimentálny mikropočítač s nasledovnými požiadavkami:

-  mikroprocesor 80386EX
-  8-bitová pamäť EPROM 64 kB
- 16-bitová pamäť EPROM 128 kB
- 16-bitová pamäť RWM 64 kB
- 2 sériové rozhrania RS232C
- 8-bitový vstupný a 8-bitový výstupný paralelný port s indikáciou,  oddelený optočlenmi
- 6-miestny displej
- možnosť generovania žiadostí o prerušenie tlačidlami
- možnosť krokovania programu po strojových cykloch cez stav WAIT procesora
', 'Navrhnite a zrealizujte experimentálny mikropočítač s nasledovnými požiadavkami:

-  mikroprocesor 80386EX
-  8-bitová pamäť EPROM 64 kB
- 16-bitová pamäť EPROM 128 kB
- 16-bitová pamäť RWM 64 kB
- 2 sériové rozhrania RS232C
- 8-bitový vstupný a 8-bitový výstupný paralelný port s indikáciou,  oddelený optočlenmi
- 6-miestny displej
- možnosť generovania žiadostí o prerušenie tlačidlami
- možnosť krokovania programu po strojových cykloch cez stav WAIT procesora
', 0);
INSERT INTO projects VALUES (761, 'DP', 260, NULL, 669, '2005/2006', 'Tvorba poradovníka s využitím biometrických údajov', 'Development of list with use of biometric data', NULL, NULL, 1);
INSERT INTO projects VALUES (762, 'ZP', 20, NULL, 669, '2003/2004', 'Architekturálny bias rekurentných neurónových sietí', 'Architectural bias of reccurent neural networks', 'Rekurentné neurónové siete sú na rozdiel od klasických dopredných neurónových sietí schopné spracovávať vstupy s časovou štruktúrou. Rekurentné siete inicializované s malými váhami vykazujú pri spracovaní postupností symbolov vlastnosti markovovských modelov – ich stavový priestor odráža históriu symbolov prezentovaných sieti. Túto vlastnosť vyplývajúcu z architektúry rekurentnej siete nazývame architekturálny bias.
Cieľom projektu je vytvorenie simulačného nástroja umožňujúceho vizualizovať stavovú časť rekurentnej neurónovej siete. Následne, na zvolených postupnostiach symbolov, je potrebné ukázať schopnosť stavového priestoru siete odrážať históriu vstupných symbolov. Dôraz je potrebné klásť na prezentačnú funkciu simulačného nástroja a zvážiť jeho realizáciu napr. ako Java apletu. 
', 'Rekurentné neurónové siete sú na rozdiel od klasických dopredných neurónových sietí schopné spracovávať vstupy s časovou štruktúrou. Rekurentné siete inicializované s malými váhami vykazujú pri spracovaní postupností symbolov vlastnosti markovovských modelov – ich stavový priestor odráža históriu symbolov prezentovaných sieti. Túto vlastnosť vyplývajúcu z architektúry rekurentnej siete nazývame architekturálny bias.
Cieľom projektu je vytvorenie simulačného nástroja umožňujúceho vizualizovať stavovú časť rekurentnej neurónovej siete. Následne, na zvolených postupnostiach symbolov, je potrebné ukázať schopnosť stavového priestoru siete odrážať históriu vstupných symbolov. Dôraz je potrebné klásť na prezentačnú funkciu simulačného nástroja a zvážiť jeho realizáciu napr. ako Java apletu. 
', 1);
INSERT INTO projects VALUES (763, 'ZP', 297, NULL, 671, '2005/2006', 'Návrh dátového modelu', 'Návrh dátového modelu', 'Vykonajte analýzu metód modelovania dát pre databázové spracovanie. Vytvorte prostriedok , ktorý podla zvolenej metódy modelovania dát vygeneruje vhodný návrh dátového modelu na úrovni dátových tokov. Akceptujte normalizáciu návrhu dátového modelu.', 'Vykonajte analýzu metód modelovania dát pre databázové spracovanie. Vytvorte prostriedok , ktorý podla zvolenej metódy modelovania dát vygeneruje vhodný návrh dátového modelu na úrovni dátových tokov. Akceptujte normalizáciu návrhu dátového modelu.', 1);
INSERT INTO projects VALUES (764, 'ZP', 566, NULL, 675, '2005/2006', 'Použitie neurónových sietí k "dištančnému" riadeniu zložitých systémov', 'Použitie neurónových sietí k "dištančnému" riadeniu zložitých systémov', 'Ak stojíme pred problémom, ako riadiť nejaký zložitý systém, obvykle tento problém riešime pomocou modelu "dištančného" riadenia, ktorý v kognitívnej vede patrí medzi základné modely. V prvej etape si vytvoríme vnútorný model systému, ktorý odráža základné vlastnosti riadeného systému. V ďalšej etape už zložitý systém riadime pomocou tohto modelu.
Podrobnosti prístupu sú uvedené v kapitole, ktorá je uvedená na adrese
ftp://math.chtf.stuba.sk/pub/vlado/FSEV_Informatika/skripta/pdf_final/Kapitola12.pdf
', 'Ak stojíme pred problémom, ako riadiť nejaký zložitý systém, obvykle tento problém riešime pomocou modelu "dištančného" riadenia, ktorý v kognitívnej vede patrí medzi základné modely. V prvej etape si vytvoríme vnútorný model systému, ktorý odráža základné vlastnosti riadeného systému. V ďalšej etape už zložitý systém riadime pomocou tohto modelu.
Podrobnosti prístupu sú uvedené v kapitole, ktorá je uvedená na adrese
ftp://math.chtf.stuba.sk/pub/vlado/FSEV_Informatika/skripta/pdf_final/Kapitola12.pdf
', 1);
INSERT INTO projects VALUES (765, 'ZP', 98, NULL, 676, '2005/2006', 'Spracovanie obrazu', 'Spracovanie obrazu', 'V súčasnosti sa často pracuje s obrázkami v elekronickej forme vytvorené v rôznych formátoch. Nie vždy sú tieto obrazové informácie v dobrej kvalite. Bolo by dobré mať prostriedok, ktorý by aspoň čiastočne zlepšil kvalitu takýchto informácií.
Spravte analýzu problémovej oblasti a na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu, ktorá bude slúžiť na  spracovanie obrazových informácii. ', 'V súčasnosti sa často pracuje s obrázkami v elekronickej forme vytvorené v rôznych formátoch. Nie vždy sú tieto obrazové informácie v dobrej kvalite. Bolo by dobré mať prostriedok, ktorý by aspoň čiastočne zlepšil kvalitu takýchto informácií.
Spravte analýzu problémovej oblasti a na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu, ktorá bude slúžiť na  spracovanie obrazových informácii. ', 1);
INSERT INTO projects VALUES (766, 'DP', 549, 375, 677, '2004/2005', 'Vzdialená komunikácia  s meracím pracoviskom ', 'Vzdialená komunikácia  s meracím pracoviskom ', NULL, NULL, 0);
INSERT INTO projects VALUES (767, 'ZP', 40, NULL, 678, '2005/2006', 'Objektovo relačné mapre pre jazyk JAVA', 'Objektovo relačné mapre pre jazyk JAVA', 'Naštudujte princípy a charakteristiky Objektovo-Relačných maprov vo všeobecnosti. Analyzujte existujúce O–R mapre pre programovací jazyk Java. Naštudujte podrobnosti pre Vami vybrané O-R mapre (min. 2) pre jazyk Java. S využitím vybraných O-R maprov vytvorte jednoduchú databázovú aplikáciu, resp. aplikácie na spoločnom základe. Vybrané mapre porovnajte s využitím osobných skúseností získaných pri vytváraní aplikácie/aplikácií.', 'Naštudujte princípy a charakteristiky Objektovo-Relačných maprov vo všeobecnosti. Analyzujte existujúce O–R mapre pre programovací jazyk Java. Naštudujte podrobnosti pre Vami vybrané O-R mapre (min. 2) pre jazyk Java. S využitím vybraných O-R maprov vytvorte jednoduchú databázovú aplikáciu, resp. aplikácie na spoločnom základe. Vybrané mapre porovnajte s využitím osobných skúseností získaných pri vytváraní aplikácie/aplikácií.', 1);
INSERT INTO projects VALUES (768, 'ZP', 98, NULL, 679, '2005/2006', 'Adaptívna archivácia informácií', 'Adaptívna archivácia informácií', 'Pri vytváraní prednášok, seminárov, workshopov atď., má autor, resp. prednášateľ k dispozícii informácie rôzneho typu a formátov. Pomohlo by mu, keby mal tieto informácie systematicky uložené - archivované, aby sa mohol ľahko a rýchlo k relevantnej informácii dostať. Takýto adaptívny archivačný systém  informácií by slúžil ako báza údajov pre nástroj na vytváranie kurzov. 
Spravte analýzu problematiky a na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu, ktorá bude slúžiť na  ukladanie, archivovanie a spracovanie informácií. ', 'Pri vytváraní prednášok, seminárov, workshopov atď., má autor, resp. prednášateľ k dispozícii informácie rôzneho typu a formátov. Pomohlo by mu, keby mal tieto informácie systematicky uložené - archivované, aby sa mohol ľahko a rýchlo k relevantnej informácii dostať. Takýto adaptívny archivačný systém  informácií by slúžil ako báza údajov pre nástroj na vytváranie kurzov. 
Spravte analýzu problematiky a na základe analýzy špecifikujte, navrhnite a vytvorte aplikáciu, ktorá bude slúžiť na  ukladanie, archivovanie a spracovanie informácií. ', 1);
INSERT INTO projects VALUES (769, 'ZP', 44, NULL, 680, '2005/2006', 'Simulátor výpočtových zariadení', 'Simulátor výpočtových zariadení', 'Konečný automat, zásobníkový automat a Turingov stroj sú tri základné modely počítačov v Teórii formálnych jazykov a automatov. Predmetom práce by mala byť simulácia týchto troch výpočtových zariadení. Simulátor má mať grafické užívateľské rozhranie.', 'Konečný automat, zásobníkový automat a Turingov stroj sú tri základné modely počítačov v Teórii formálnych jazykov a automatov. Predmetom práce by mala byť simulácia týchto troch výpočtových zariadení. Simulátor má mať grafické užívateľské rozhranie.', 1);
INSERT INTO projects VALUES (770, 'ZP', 447, NULL, 681, '2005/2006', 'Generovanie bibliografických záznamov pri použití štandardu DocBook', 'Generovanie bibliografických záznamov pri použití štandardu DocBook', 'Preskúmajte štandard DocBook (www.docbook.org). Analyzujte súčasné prostriedky podporujúce proces tvorby dokumentov s využitím tohto štandardu, od písania samotných dokumentov, cez ich formátovanie až po generovanie výsledných dokumentov v cieľovej sadzbe. Zamerajte sa pritom na voľne dostupné riešenia. S použitím vhodnej kombinácie týchto prostriedkov vytvorte jednotné prostredie pre tvorbu dokumentov.
Pri riešení projektu sa tiež zamerajte na úpravu existujúcich šablón pre generovanie bibliografických záznamov a citácií podľa rôznych štandardov (IEEE, ISO, Harvard apod.).', 'Preskúmajte štandard DocBook (www.docbook.org). Analyzujte súčasné prostriedky podporujúce proces tvorby dokumentov s využitím tohto štandardu, od písania samotných dokumentov, cez ich formátovanie až po generovanie výsledných dokumentov v cieľovej sadzbe. Zamerajte sa pritom na voľne dostupné riešenia. S použitím vhodnej kombinácie týchto prostriedkov vytvorte jednotné prostredie pre tvorbu dokumentov.
Pri riešení projektu sa tiež zamerajte na úpravu existujúcich šablón pre generovanie bibliografických záznamov a citácií podľa rôznych štandardov (IEEE, ISO, Harvard apod.).', 1);
INSERT INTO projects VALUES (771, 'ZP', 342, NULL, 682, '2005/2006', 'Prostriedky pre podporu správy cestných meteorologických staníc', 'Prostriedky pre podporu správy cestných meteorologických staníc', 'Analyzujte možnosti technických a programových prostriedkov pre  testovanie  a nastavovanie parametrov meteorologických staníc vybraného typu.
Navrhnite programové vybavenie podporujúce správu, ktoré umožní testovať, nastavovať a vyhodnocovať technický stav meteorologických staníc vybraného typu. Zrealizujte vybranú časť navrhnutých programových prostriedkov.
', 'Analyzujte možnosti technických a programových prostriedkov pre  testovanie  a nastavovanie parametrov meteorologických staníc vybraného typu.
Navrhnite programové vybavenie podporujúce správu, ktoré umožní testovať, nastavovať a vyhodnocovať technický stav meteorologických staníc vybraného typu. Zrealizujte vybranú časť navrhnutých programových prostriedkov.
', 0);
INSERT INTO projects VALUES (772, 'ZP', 382, NULL, 683, '2005/2006', 'Tvorba analógií', 'Tvorba analógií', 'V zjednodušenom prípade sa zamerať na primitívne príklady analógií typu: „Keď sa abc transformuje na abd, ako transformovať iijjkk analogickým spôsobom?" Práca bude vychádzať z myšlienkových princípov programových systémov COPYCAT a METACAT Douglase Hofstadtera a Melanie Mitchell. V prvej etape bude cieľom navrhnúť výhodnejší evolučný algoritmus pracujúci nad agentami spracujúcimi analógie, v druhej etape bude cieľom vypracovať mechanizmus vyrovnávajúci súperenie a spoluprácu agentov na získanie lepších výsledkov a návrh bayesovského pravdepodobnostného prístupu na vyhodnotenie kvality predikovaných analógií. Implementovať navrhnutý model a diskutovať získané výsledky.
', 'V zjednodušenom prípade sa zamerať na primitívne príklady analógií typu: „Keď sa abc transformuje na abd, ako transformovať iijjkk analogickým spôsobom?" Práca bude vychádzať z myšlienkových princípov programových systémov COPYCAT a METACAT Douglase Hofstadtera a Melanie Mitchell. V prvej etape bude cieľom navrhnúť výhodnejší evolučný algoritmus pracujúci nad agentami spracujúcimi analógie, v druhej etape bude cieľom vypracovať mechanizmus vyrovnávajúci súperenie a spoluprácu agentov na získanie lepších výsledkov a návrh bayesovského pravdepodobnostného prístupu na vyhodnotenie kvality predikovaných analógií. Implementovať navrhnutý model a diskutovať získané výsledky.
', 1);
INSERT INTO projects VALUES (773, 'ZP', 375, NULL, 684, '2005/2006', 'Niekoré vybrané úlohy smerovania v počítačových sieťach', 'Niekoré vybrané úlohy smerovania v počítačových sieťach', 'Analyzujte problematiku smerovania v počítačových sieťach - rôzne algoritmy a stratégie. Navrhnite a implementujte interaktívny programový systém umožňujúci zostaviť a modifikovať grafickú reprezentáciu počítačovej siete na sieťovej vrstve (prepojovacia sieť) s možnosťou definovania parametrov uzlov a hrán. V navrhnutom prostredí overte a porovnajte niektoré stratégie a algoritmy smerovania. ', 'Analyzujte problematiku smerovania v počítačových sieťach - rôzne algoritmy a stratégie. Navrhnite a implementujte interaktívny programový systém umožňujúci zostaviť a modifikovať grafickú reprezentáciu počítačovej siete na sieťovej vrstve (prepojovacia sieť) s možnosťou definovania parametrov uzlov a hrán. V navrhnutom prostredí overte a porovnajte niektoré stratégie a algoritmy smerovania. ', 0);
INSERT INTO projects VALUES (774, 'ZP', 27, NULL, 685, '2005/2006', 'Simulačná knižnica pre optimalizačné algoritmy', 'Simulačná knižnica pre optimalizačné algoritmy', '   Preštudujte základné deterministické aj nedeterministické optimalizačné algoritmy. Navrhnite a zrealizujte podpornú knižnicu pre použitie týchto algoritmov pri tvorbe aplikácií. Implementujte vybrané príklady s využitím tejto knižnice a vyhodnoťte ich vlastnosti.


Odporúčaná literatúra:

1. Kvasnička V., Pospíchal J., Tiňo P.: Evolučné algoritmy. STU Bratislava, 2000, ISBN 80-227-1377-5.

2. Kognitívne vedy, CHTF STU
http://math.chtf.stuba.sk/kog_vedy.htm
', '   Preštudujte základné deterministické aj nedeterministické optimalizačné algoritmy. Navrhnite a zrealizujte podpornú knižnicu pre použitie týchto algoritmov pri tvorbe aplikácií. Implementujte vybrané príklady s využitím tejto knižnice a vyhodnoťte ich vlastnosti.


Odporúčaná literatúra:

1. Kvasnička V., Pospíchal J., Tiňo P.: Evolučné algoritmy. STU Bratislava, 2000, ISBN 80-227-1377-5.

2. Kognitívne vedy, CHTF STU
http://math.chtf.stuba.sk/kog_vedy.htm
', 1);
INSERT INTO projects VALUES (775, 'ZP', 437, NULL, 686, '2005/2006', 'Katalóg návrhových vzorov', 'Katalóg návrhových vzorov', 'Návrhové vzory sa stávajú dôležitým nástrojom na  vyjadrenie opakujúcich sa riešení pri navrhovaní softvérových systémov. Existujú viaceré sady návrhových vzorov aj viaceré samostatné vzory. Pokúste sa ich zhromaždiť a vytvoriť jednotný katalóg. Navrhnite pre ne vhodný spôsob reprezentácie. Zvážte použitie jazyka UML. ', 'Návrhové vzory sa stávajú dôležitým nástrojom na  vyjadrenie opakujúcich sa riešení pri navrhovaní softvérových systémov. Existujú viaceré sady návrhových vzorov aj viaceré samostatné vzory. Pokúste sa ich zhromaždiť a vytvoriť jednotný katalóg. Navrhnite pre ne vhodný spôsob reprezentácie. Zvážte použitie jazyka UML. ', 1);
INSERT INTO projects VALUES (776, 'ZP', 541, NULL, 687, '2004/2005', 'Dispečerský systém', 'Dispatching system', 'Vytvorte program pre dispečerský systém pre montérov. Jedná sa o mobilné zariadenie do auta. Má GPS a na komunikáciu využíva GPRS Orange. Musí umožňovať sledovať polohu auta, robiť archív jázd, zadávať montérovi úlohy, navigovať ho a umožniť mu komunikovať s dispečerom.', 'Vytvorte program pre dispečerský systém pre montérov. Jedná sa o mobilné zariadenie do auta. Má GPS a na komunikáciu využíva GPRS Orange. Musí umožňovať sledovať polohu auta, robiť archív jázd, zadávať montérovi úlohy, navigovať ho a umožniť mu komunikovať s dispečerom.', 1);
INSERT INTO projects VALUES (777, 'DP', 97, NULL, 687, '2005/2006', 'Alternatívna notácia pre procesy transformácie objektových štruktúr', 'Alternatívna notácia pre procesy transformácie objektových štruktúr', NULL, NULL, 1);
INSERT INTO projects VALUES (778, 'ZP', 433, NULL, 688, '2005/2006', 'Ohodnocovanie softvérových systémov', 'Ohodnocovanie softvérových systémov', 'Softvérové inžiniersvo neustále hľadá nové spôsoby merania kvality softvérových systémov. Medzi základné sledované charakteristiky partia zviazanosť a súdržnosť. Modelujte zdrojový kód softvérového systému ako graf, ktorého uzly predstavujú entity objektovo-orientovanej realizácie systému, a ktorého hrany reprezentujú väzby medzi týmito entitami. Vytvorte nástroj, ktorý na základe analýzy rozsiahleho softvérového systému zmeria takúto reprezentáciu. Pomocou tohto nástroja vyhodnoťte niekoľko rozsiahlejších systémov s voľne dostupným zdrojovým kódom.', 'Softvérové inžiniersvo neustále hľadá nové spôsoby merania kvality softvérových systémov. Medzi základné sledované charakteristiky partia zviazanosť a súdržnosť. Modelujte zdrojový kód softvérového systému ako graf, ktorého uzly predstavujú entity objektovo-orientovanej realizácie systému, a ktorého hrany reprezentujú väzby medzi týmito entitami. Vytvorte nástroj, ktorý na základe analýzy rozsiahleho softvérového systému zmeria takúto reprezentáciu. Pomocou tohto nástroja vyhodnoťte niekoľko rozsiahlejších systémov s voľne dostupným zdrojovým kódom.', 1);
INSERT INTO projects VALUES (779, 'ZP', 270, NULL, 689, '2005/2006', 'Automatické spracovanie informácií získaných z webovej stránky', 'Automatické spracovanie informácií získaných z webovej stránky', 'Vyhľadávanie na webe často spočíva v pracnom prechádzaní jednotlivých stránok, ktoré obsahujú používateľom požadované informácie. V tomto ohľade by bol užitočný nástroj, ktorý webové stránky prehľadá, vyberie z nich potrebné informácie a ponúkne ich používateľovi. 
Cieľom práce je návrh nástroja, ktorý spracuje výsledky vyhľadávania z viacerých stránok podobného zamerania, extrahuje z nich relevantné informácie, integruje ich a vhodne prezentuje používateľovi. Navrhnutý systém experimentálne overte pre oblasť trhu pracovných príležitostí.', 'Vyhľadávanie na webe často spočíva v pracnom prechádzaní jednotlivých stránok, ktoré obsahujú používateľom požadované informácie. V tomto ohľade by bol užitočný nástroj, ktorý webové stránky prehľadá, vyberie z nich potrebné informácie a ponúkne ich používateľovi. 
Cieľom práce je návrh nástroja, ktorý spracuje výsledky vyhľadávania z viacerých stránok podobného zamerania, extrahuje z nich relevantné informácie, integruje ich a vhodne prezentuje používateľovi. Navrhnutý systém experimentálne overte pre oblasť trhu pracovných príležitostí.', 1);
INSERT INTO projects VALUES (780, 'ZP', 447, NULL, 691, '2005/2006', 'Tvorba schém a štýlov bibliografických záznamov pre typografický systém LaTeX', 'Tvorba schém a štýlov bibliografických záznamov pre typografický systém LaTeX', 'Pre oddelenie typov (schém) bibliografických záznamov od ich vzhľadu (štýlu) v konkrétnom dokumente pri jeho príprave pomocou typografického systému LaTeX sa najčastejšie používa BibTeX (ako program pre generovanie prezentácie schém, aj ako formát pre reprezentáciu jednotlivých schém). Analyzujte možnosti použitia BibTeX-u pri príprave dokumentov v slovenskom jazyku. Navrhnite schémy a jednotný štýl bibliografických záznamov v podobe, v akej sú uvedené v norme STN ISO 690 (resp. 690-2). Navrhnuté schémy a štýl overte vytvorením elektronickej verzie dokumentu (záverečnej práce) v slovenskom jazyku s použitím systémov LaTeX a BibTeX.', 'Pre oddelenie typov (schém) bibliografických záznamov od ich vzhľadu (štýlu) v konkrétnom dokumente pri jeho príprave pomocou typografického systému LaTeX sa najčastejšie používa BibTeX (ako program pre generovanie prezentácie schém, aj ako formát pre reprezentáciu jednotlivých schém). Analyzujte možnosti použitia BibTeX-u pri príprave dokumentov v slovenskom jazyku. Navrhnite schémy a jednotný štýl bibliografických záznamov v podobe, v akej sú uvedené v norme STN ISO 690 (resp. 690-2). Navrhnuté schémy a štýl overte vytvorením elektronickej verzie dokumentu (záverečnej práce) v slovenskom jazyku s použitím systémov LaTeX a BibTeX.', 1);
INSERT INTO projects VALUES (781, 'ZP', 298, NULL, 692, '2005/2006', 'Virtuálna univerzita - modul vyhodnocovania znalostí', 'Virtuálna univerzita - modul vyhodnocovania znalostí', 'Do existujúceho systému Virtuálnej univerzity doplňte modul testovania znalostí. Navrhnite a implementujte potrebné zmeny. Riešenie overte na príklade predmetu Periférne zariadenia.', 'Do existujúceho systému Virtuálnej univerzity doplňte modul testovania znalostí. Navrhnite a implementujte potrebné zmeny. Riešenie overte na príklade predmetu Periférne zariadenia.', 0);
INSERT INTO projects VALUES (782, 'ZP', 375, NULL, 693, '2005/2006', 'Distribuované výpočty', 'Distribuované výpočty', 'Analyzujte možnosti riešenia výpočtových úloh v prostredí počítačových sietí. Navrhnite systém distribúcie úloh na rôzne uzly v sieti a ich vykonanie.   Navrhnutý a implementovaný systém overte v TCP/IP sieti.  ', 'Analyzujte možnosti riešenia výpočtových úloh v prostredí počítačových sietí. Navrhnite systém distribúcie úloh na rôzne uzly v sieti a ich vykonanie.   Navrhnutý a implementovaný systém overte v TCP/IP sieti.  ', 0);
INSERT INTO projects VALUES (783, 'ZP', 375, NULL, 694, '2005/2006', 'Distribuované výpočty', 'Distribuované výpočty', 'Analyzujte možnosti riešenia výpočtových úloh v prostredí počítačových sietí. Navrhnite systém distribúcie úloh na rôzne uzly v sieti a ich vykonanie.   Navrhnutý a implementovaný systém overte v TCP/IP sieti.  ', 'Analyzujte možnosti riešenia výpočtových úloh v prostredí počítačových sietí. Navrhnite systém distribúcie úloh na rôzne uzly v sieti a ich vykonanie.   Navrhnutý a implementovaný systém overte v TCP/IP sieti.  ', 0);
INSERT INTO projects VALUES (784, 'ZP', 260, NULL, 695, '2004/2005', 'Podpora automatizovaného hodnotenia programov', 'Podpora automatizovaného hodnotenia programov', 'Analyzujte problematiku automatizovaného overovania funkčnosti programov, navrhnite a vytvorte nástroj, ktorý umožní vyhodnotiť správnosť fungovania programu na základe definovaných vstupov a k nim prislúchajúcich očakavaných výstupov. Zaoberajte sa  tiež problematikou kontrolovaného behu programu v obmedzenom prostredí tak, aby ste zabránili jeho možným nežiadúcim vplyvom na ostatné časti systému. Nástroj implementujte v operačnom systéme FreeBSD alebo Linux.', 'Analyzujte problematiku automatizovaného overovania funkčnosti programov, navrhnite a vytvorte nástroj, ktorý umožní vyhodnotiť správnosť fungovania programu na základe definovaných vstupov a k nim prislúchajúcich očakavaných výstupov. Zaoberajte sa  tiež problematikou kontrolovaného behu programu v obmedzenom prostredí tak, aby ste zabránili jeho možným nežiadúcim vplyvom na ostatné časti systému. Nástroj implementujte v operačnom systéme FreeBSD alebo Linux.', 1);
INSERT INTO projects VALUES (785, 'ZP', 433, NULL, 696, '2005/2006', 'Prezentácia dokumentov pre web so sémantikou', 'Prezentácia dokumentov pre web so sémantikou', 'Analyzujte nové prístupy k reprezentácií dokumentov pre novú generáciu siete Internet, web so sémantikou. Zamerajte sa pritom na existujúce schémy opisu dát a ontológie. Navrhnite systém, ktorý bude sprístupňovať  dokumenty dostupné na webe a umožní spracovanie na základe nimi poskytnutých metadát. Navrhnuté riešenie overte implementovaním web-systému na sprístupňovanie dokumentov.', 'Analyzujte nové prístupy k reprezentácií dokumentov pre novú generáciu siete Internet, web so sémantikou. Zamerajte sa pritom na existujúce schémy opisu dát a ontológie. Navrhnite systém, ktorý bude sprístupňovať  dokumenty dostupné na webe a umožní spracovanie na základe nimi poskytnutých metadát. Navrhnuté riešenie overte implementovaním web-systému na sprístupňovanie dokumentov.', 1);
INSERT INTO projects VALUES (786, 'ZP', 360, NULL, 697, '2005/2006', 'HTML aplikácia na výučbu zobrazenia údajov v počítači', 'HTML aplikácia na výučbu zobrazenia údajov v počítači', 'Analyzujte problematiku pozičných číselných sústav a zobrazenia údajov v počítači.
Navrhnite a implementujte programový systém použiteľný  na výučbu prevodov medzi číselnými sústavami, zobrazovania údajov v počítači a celočíselnej aritmetiky v dvojkovej číselnej sústave. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Má byť funkčný  ako HTML aplikácia.

', 'Analyzujte problematiku pozičných číselných sústav a zobrazenia údajov v počítači.
Navrhnite a implementujte programový systém použiteľný  na výučbu prevodov medzi číselnými sústavami, zobrazovania údajov v počítači a celočíselnej aritmetiky v dvojkovej číselnej sústave. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Má byť funkčný  ako HTML aplikácia.

', 0);
INSERT INTO projects VALUES (787, 'ZP', 584, NULL, 698, '2004/2005', 'Analýza, monitorovanie a testovanie bezpečnosti mobilných kódov', 'Analýza, monitorovanie a testovanie bezpečnosti mobilných kódov', 'Navrhnite a implementujte monitorovanie sieťových a systémových aktivít cudzích kódov spúšťaných na lokálnom počítačovom systéme. Teoretická a praktická analýza bezpečenosti mobilných kódov.', 'Navrhnite a implementujte monitorovanie sieťových a systémových aktivít cudzích kódov spúšťaných na lokálnom počítačovom systéme. Teoretická a praktická analýza bezpečenosti mobilných kódov.', 0);
INSERT INTO projects VALUES (788, 'ZP', 260, NULL, 699, '2005/2006', 'Podpora automatizovaného hodnotenia programov', 'Podpora automatizovaného hodnotenia programov', 'Analyzujte problematiku automatizovaného overovania funkčnosti programov, navrhnite a vytvorte nástroj, ktorý jednak umožní vyhodnotiť správnosť fungovania programu na základe definovaných vstupov a k nim prislúchajúcich očakávaných výstupov a tiež umožní zistiť rôzne kvantitatívne a kvalitatívne parametre programov. Pri riešení sa zaoberajte aj problematikou kontrolovaného behu programu v obmedzenom prostredí tak, aby ste zabránili jeho možným nežiadúcim vplyvom na ostatné časti systému. Nástroj implementujte v operačnom systéme FreeBSD alebo Linux.
V rámci projektu sa zamerajte na tvorbu nástrojov na overovanie vlastností programov. ', 'Analyzujte problematiku automatizovaného overovania funkčnosti programov, navrhnite a vytvorte nástroj, ktorý jednak umožní vyhodnotiť správnosť fungovania programu na základe definovaných vstupov a k nim prislúchajúcich očakávaných výstupov a tiež umožní zistiť rôzne kvantitatívne a kvalitatívne parametre programov. Pri riešení sa zaoberajte aj problematikou kontrolovaného behu programu v obmedzenom prostredí tak, aby ste zabránili jeho možným nežiadúcim vplyvom na ostatné časti systému. Nástroj implementujte v operačnom systéme FreeBSD alebo Linux.
V rámci projektu sa zamerajte na tvorbu nástrojov na overovanie vlastností programov. ', 1);
INSERT INTO projects VALUES (789, 'ZP', 360, NULL, 700, '2005/2006', 'Programová podpora výučby zobrazenia údajov v počítači', 'Programová podpora výučby zobrazenia údajov v počítači', 'Analyzujte problematiku pozičných číselných sústav a zobrazenia údajov v počítači.
Navrhnite a implementujte demonštračný a výučbový systém použiteľný  na výučbu zobrazovania údajov v počítači a celočíselnej aritmetiky v dvojkovej číselnej sústave. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Má byť funkčný  pod OS Windows.

', 'Analyzujte problematiku pozičných číselných sústav a zobrazenia údajov v počítači.
Navrhnite a implementujte demonštračný a výučbový systém použiteľný  na výučbu zobrazovania údajov v počítači a celočíselnej aritmetiky v dvojkovej číselnej sústave. 
Systém treba overiť na jednoduchých, vhodne vybraných príkladoch. 
Má byť funkčný  pod OS Windows.

', 0);
INSERT INTO projects VALUES (790, 'ZP', 25, NULL, 701, '2005/2006', 'Implementácia bezpečnostných mechanizmov v systéme vzdialeného prístupu k hardvéru', 'Implementácia bezpečnostných mechanizmov v systéme vzdialeného prístupu k hardvéru', 'Analyzujte štandardné spôsoby zabezpečenia prístupu k súborom a sieťovým službám, ako aj spôsoby ochrany prenášaných dát (napr. SSL), v prostredí operačného systému unix-ového typu. Navrhnite vhodný spôsob využitia týchto bezpečnostných mechanizmov v existujúcom systéme vzdialeného prístupu k hardvérovým prostriedkom počítača pomocou siete (ide o aplikáciu typu klient - server). Navrhnuté riešenie implementujte a overte jeho funkčnosť a spoľahlivosť.', 'Analyzujte štandardné spôsoby zabezpečenia prístupu k súborom a sieťovým službám, ako aj spôsoby ochrany prenášaných dát (napr. SSL), v prostredí operačného systému unix-ového typu. Navrhnite vhodný spôsob využitia týchto bezpečnostných mechanizmov v existujúcom systéme vzdialeného prístupu k hardvérovým prostriedkom počítača pomocou siete (ide o aplikáciu typu klient - server). Navrhnuté riešenie implementujte a overte jeho funkčnosť a spoľahlivosť.', 0);
INSERT INTO projects VALUES (791, 'DP', 670, NULL, 702, '2005/2006', 'Laserový prenos dát voľným priestorom', 'Laserový prenos dát voľným priestorom', NULL, NULL, 0);
INSERT INTO projects VALUES (792, 'ZP', 361, NULL, 702, '2004/2005', 'Problémová štúdia mobilného počítačového systému (GSM)', 'Case study of mobile computing system (GSM)', 'Analyzujte problematiku súčasného  stavu v oblasti technickej časti mobilného počítačového systému (GSM).
Urobte štrukturálnu analýzu architektúry GSM siete (mobile station, base station subsystem, network subsystem). Navrhnite a implementujte rádio-komunikačné aspekty  mobilného počítačového systému (GSM).
', 'Analyzujte problematiku súčasného  stavu v oblasti technickej časti mobilného počítačového systému (GSM).
Urobte štrukturálnu analýzu architektúry GSM siete (mobile station, base station subsystem, network subsystem). Navrhnite a implementujte rádio-komunikačné aspekty  mobilného počítačového systému (GSM).
', 0);
INSERT INTO projects VALUES (793, 'ZP', 301, NULL, 703, '2005/2006', 'Návrh a implementácia systému na grafickú vizualizáciu prúdového spracovania inštrukcií', 'Návrh a implementácia systému na grafickú vizualizáciu prúdového spracovania inštrukcií', 'Navrhnite a implementujte systém, ktorý bude s využitím multimediálnych technológií umožňovať  naštudovanie, grafické zobrazenie a demonštráciu  dejov pri prúdovom spracovaní inštrukcií.
Produkt implementujte ako hypermediálnu prezentáciu vo voľne dostupnom webovom prehliadači.', 'Navrhnite a implementujte systém, ktorý bude s využitím multimediálnych technológií umožňovať  naštudovanie, grafické zobrazenie a demonštráciu  dejov pri prúdovom spracovaní inštrukcií.
Produkt implementujte ako hypermediálnu prezentáciu vo voľne dostupnom webovom prehliadači.', 0);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO roles VALUES (1, 'administrator', 'Administratorska rola');
INSERT INTO roles VALUES (2, 'academic', 'Akademicky pracovnik');
INSERT INTO roles VALUES (3, 'graduate', 'Absolvent fakulty');


--
-- Data for Name: roles_clearances; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO roles_clearances VALUES (1, 1, 1);
INSERT INTO roles_clearances VALUES (2, 1, 2);
INSERT INTO roles_clearances VALUES (3, 1, 3);
INSERT INTO roles_clearances VALUES (4, 1, 4);
INSERT INTO roles_clearances VALUES (5, 1, 5);
INSERT INTO roles_clearances VALUES (6, 2, 2);
INSERT INTO roles_clearances VALUES (7, 2, 3);
INSERT INTO roles_clearances VALUES (8, 2, 4);
INSERT INTO roles_clearances VALUES (9, 3, 2);
INSERT INTO roles_clearances VALUES (10, 3, 3);


--
-- Data for Name: specializations; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO specializations VALUES (0, 'Počítačové systémy a siete', 2);
INSERT INTO specializations VALUES (1, 'Softvérové inžinierstvo', 2);
INSERT INTO specializations VALUES (2, 'Bezpečnosť informačných technológií', 3);
INSERT INTO specializations VALUES (3, 'Podnikanie v informatike', 3);
INSERT INTO specializations VALUES (4, 'Informačné systémy', 2);


--
-- Data for Name: study_types; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO study_types VALUES (1, 'Bakalárske štúdium', 1);
INSERT INTO study_types VALUES (2, 'Inžinierske štúdium', 2);
INSERT INTO study_types VALUES (3, 'Doktorandské štúdium', 3);


--
-- Data for Name: user_languages; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO user_languages VALUES (8, 1, 1, 1);
INSERT INTO user_languages VALUES (9, 1, 3, 2);
INSERT INTO user_languages VALUES (10, 1, 4, 4);


--
-- Data for Name: user_mail_states; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO user_mail_states VALUES ('NEW');
INSERT INTO user_mail_states VALUES ('READED');
INSERT INTO user_mail_states VALUES ('DELETED');


--
-- Data for Name: user_mails; Type: TABLE DATA; Schema: public; Owner: team14
--



--
-- Data for Name: user_professions; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO user_professions VALUES (1, 1, 1, 2000, 2000, 'text sk', 'text en');
INSERT INTO user_professions VALUES (2, 1, 2, 2002, 2002, 'text dalsi sk', 'text dalsi en');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO users VALUES (225, 't0203', 'ja', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jano', NULL, 'Antala', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (2, 'te22112', 'test2', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Test2', NULL, 'Testerovic2', 'Bc.', 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (3, 'test3', 'test3', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Test3', NULL, '', 'Mhdfgr', 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (4, 'a002', 'bielikova', NULL, '098f6bcd4621d373cade4e832627b4f6', 'admin', NULL, 'Bielikova', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (5, '22145', 'rd22145', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roland', NULL, 'Dobai', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (6, '4', 'bielekovaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Alexandra', NULL, 'Bieleková', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (7, '25809', 'mm25809', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'Minárik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (8, '20730', 'ms20730', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Skuhra', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (9, '21180', 'af21180', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Fenik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (10, '57', 'lekavym', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marián', NULL, 'Lekavý', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (11, 'ext0013', 'wittlingerr', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Robert', NULL, 'Wittlinger', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (12, '50', 'markov', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimír', NULL, 'Marko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (13, '13', 'gramatovae', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Elena', NULL, 'Gramatová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (14, '22165', 'rf22165', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rudolf', NULL, 'Fáber', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (15, '10007', 'flochovaj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jana', NULL, 'Flochova', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (16, '48', 'vranicv', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Valentino', NULL, 'VraniÄ‡', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (17, '21', 'husarovaz', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zuzana', NULL, 'Husárová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (18, '20006', 'ra20006', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'Ambruš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (19, '702003', 'andrejkoa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Anton', NULL, 'Andrejko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (20, '7', 'cernanskym', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Čerňanský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (21, '22491', 'sk22491', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Štefan', NULL, 'Kušnír', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (22, '22492', 'mk22492', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Kútny', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (23, '17', 'hassana', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ahmed Abdallah', NULL, 'Hassan', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (24, '6', 'ezzeddinea', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Anna', 'Bou', 'Ezzeddine', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (25, '3', 'bernatd', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Dušan', NULL, 'Bernát', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (26, '33', 'molnarl', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľudovít', NULL, 'Molnár', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (27, '44', 'stefanovicj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Štefanovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (28, '22694', 'pp22694', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Péti', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (29, '52064', 'mk52064', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Kočár', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (30, '22696', 'zp22696', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zuzana', NULL, 'Petráková', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (31, '40', 'solcanyv', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Viliam', NULL, 'Solčány', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (32, '21451', 'mk21451', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Krakovský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (33, '72', 'kovarovaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Alena', NULL, 'Kovárová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (34, '21539', 'rm21539', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Malast', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (35, '96', 'kosikm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'Košík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (36, '98706', 'trencan', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Ševčík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (37, '21987', 'rb21987', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rami', 'Al', 'Beyrouti', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (38, '25805', 'sk25805', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Silvia', NULL, 'Kocsisová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (39, '25815', 'bs25815', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Boris', NULL, 'Slávik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (40, '68', 'jakubikj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Jakubik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (41, '25812', 'jp25812', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Porubský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (42, '21122', 'sc21122', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Slavomír', NULL, 'Červeň', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (43, '63548', 'lackop', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Lacko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (44, '70', 'polickyi', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Polický', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (45, '25803', 'ig25803', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Gramblička', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (46, '31', 'minarovaj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jana', NULL, 'Minárová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (47, '10005', 'vargam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Varga', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (48, '52092', 'rn52092', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Róbert', NULL, 'Neubauer', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (49, '25806', 'ok25806', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Krško', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (50, '25808', 'mm25808', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Matuška', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (51, '25813', 'mp25813', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martina', NULL, 'Práznovská', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (52, '21578', 'pm21578', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Mešťaník', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (53, '21125', 'rd21125', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rudolf', NULL, 'Dačo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (54, '52072', 'vk52072', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimír', NULL, 'Krivuš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (55, '21150', 'pd21150', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Dragúň', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (56, '52103', 'zs52103', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zdeno', NULL, 'Slanický', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (57, '52100', 'mr52100', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miloš', NULL, 'Radošinský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (58, '21175', 'lf21175', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľuboš', NULL, 'Fazekaš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (59, '21297', 'lh21297', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľubomír', NULL, 'Hromádka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (60, '21399', 'lk21399', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Kočiš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (61, '21466', 'lk21466', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Lukáš', NULL, 'Kročka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (62, '21503', 'pl21503', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ledňa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (63, '21533', 'mm21533', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'Macháč', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (64, '21606', 'tm21606', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Minčeff', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (65, '21837', 'ms21837', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Šefara', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (66, '21942', 'pv21942', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Vojtek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (67, '21977', 'oz21977', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Žáry', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (68, '21253', 'lh21253', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľubomír', NULL, 'Hanuliak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (69, '21286', 'mh21286', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Hornáček', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (70, '21415', 'rk21415', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Korček', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (71, '21417', 'mk21417', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Korenica', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (72, '20428', 'jk20428', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Krištof', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (73, '21492', 'jk21492', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Kytka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (74, '20527', 'mm20527', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Mateja', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (75, '21714', 'pp21714', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Polačko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (76, '21796', 'rs21796', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Róbert', NULL, 'Smiščík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (77, '25816', 'os25816', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Šabík', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (78, '25804', 'tk25804', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Klempa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (79, '25802', 'mf25802', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matúš', NULL, 'Fila', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (80, '25801', 'pf25801', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavel', NULL, 'Fekiač', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (81, '21540', 'jm21540', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Malečka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (82, '24817', 'an24817', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Neczli', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (83, '20219', 'mh20219', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Hablák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (84, '52114', 'js52114', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Šimončič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (85, '21437', 'mk21437', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Kováčik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (86, '21607', 'mm21607', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marián', NULL, 'Miština', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (87, '21002', 'ma21002', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Adam', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (88, '25800', 'jb25800', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Beňo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (89, '21123', 'mc21123', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marián', NULL, 'Červenák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (90, '97410', 'pk97410', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Krajčík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (91, '54678', 'smolaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Alfonz', NULL, 'Smola', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (92, '12007', 'semancik', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radovan', NULL, 'Semančík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (93, '20769', 'bs20769', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Bohuslav', NULL, 'Szabo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (94, '23840', 'mt23840', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Tomša', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (95, '25', 'komorovad', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Dagmar', NULL, 'Komorová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (96, '10004', 'janglovad', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Danica', NULL, 'Janglova', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (97, '97', 'polasek', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Polášek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (98, '39', 'povazanovaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Anna', NULL, 'Považanová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (99, '23165', 'ld23165', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Lukáš', NULL, 'Džunko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (100, '23039', 'sb23039', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Stanislav', NULL, 'Bebej', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (101, '23177', 'mf23177', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Figura', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (102, '23059', 'pb23059', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Benovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (103, '52038', 'mb52038', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Bilík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (104, '99623', 'as99623', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Adrián', NULL, 'Slavkovský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (105, '99221', 'mh99221', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Herchl', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (106, '20036', 'kb20036', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Kristína', NULL, 'Bartová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (107, '99728', 'rv99728', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Válik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (108, '99387', 'ak99387', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Krištofič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (109, '99133', 'pd99133', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Drahoš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (110, '23273', 'ph23273', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Hovanec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (111, '99708', 'st99708', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Štefan', NULL, 'Trgala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (112, '23282', 'mh23282', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Hronec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (113, '22467', 'jk22467', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jakub', NULL, 'Krištofík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (114, '99637', 'is99637', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Straka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (115, '20325', 'mj20325', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Márk', NULL, 'Jónás', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (116, '22854', 'ds22854', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Daniel', NULL, 'Ščibrany', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (117, '20477', 'ml20477', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Mário', NULL, 'Lenický', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (118, '20867', 'tv20867', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Vanderka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (119, '23642', 'ro23642', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radoslav', NULL, 'Oršula', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (120, '99426', 'ml99426', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Lehocký', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (121, '20929', 'mz20929', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Žitňanský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (122, '20875', 'dv20875', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Dušan', NULL, 'Velický', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (123, '99038', 'vb99038', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Viliam', NULL, 'Bedeč', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (124, '22758', 'ts22758', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Sabo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (125, '99621', 'ps99621', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Slaný', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (126, 'a005', 'makula', NULL, '098f6bcd4621d373cade4e832627b4f6', 'admin', NULL, 'Makula', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (127, '52046', 'af52046', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Adrien', NULL, 'Farkaš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (128, '23867', 'dv23867', NULL, '098f6bcd4621d373cade4e832627b4f6', 'David', NULL, 'Vallner', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (129, '21683', 'jp21683', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Perďoch', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (130, '53006', 'mz53006', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matúš', NULL, 'Zeman', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (131, '22423', 'rk22423', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Róbert', NULL, 'Komáromy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (132, '98017', 'mb98017', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Bálik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (133, '20441', 'mk20441', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'Kubík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (134, '22019', 'ob22019', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Oliver', NULL, 'Bachtík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (135, '22914', 'tt22914', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Taraba', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (136, '22437', 'mk22437', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Košťál', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (137, '99473', 'mm99473', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Melicherčík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (138, '20183', 'rf20183', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Fülöp', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (139, '23681', 'vp23681', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimír', NULL, 'Popelka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (140, '23061', 'tb23061', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Bielčík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (141, '23800', 'ps23800', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Šiška', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (142, '23656', 'vp23656', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimír', NULL, 'Pekník', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (143, '22763', 'ms22763', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Samiec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (144, '22311', 'ph22311', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Humay', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (145, '23765', 'ms23765', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Staňo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (146, '99316', 'pk99316', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Kapec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (147, '22066', 'mb22066', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Mário', NULL, 'Blaho', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (148, '23408', 'mk23408', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Kováčik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (149, '99026', 'ab99026', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Anna', NULL, 'Balážová', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (150, '22999', 'pv22999', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Vrba', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (151, '23251', 'mh23251', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matúš', NULL, 'Hlava', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (152, '23940', 'km23940', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Kristína', NULL, 'Matúška', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (153, '23406', 'mk23406', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Kováč', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (154, '98737', 'as98737', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Attila', NULL, 'Štrba', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (155, '99766', 'jw99766', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Július', NULL, 'Weissensteiner', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (156, '99372', 'ak99372', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Kováčik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (157, '63500', 'dk63500', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Dušan', NULL, 'Kysel', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (158, '22225', 'rg22225', NULL, '098f6bcd4621d373cade4e832627b4f6', 'RamonVladim', NULL, 'Gomez', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (159, '99348', 'mk99348', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Mario', NULL, 'Komjathy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (160, '10003', 'svingalj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Július', NULL, 'Švingál', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (161, '99464', 'im99464', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Masarovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (162, '23264', 'lh23264', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľubomír', NULL, 'Horňák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (163, '52095', 'jo52095', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Ondruška', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (164, '99048', 'jb99048', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Belluš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (165, '99061', 'mb99061', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Biščo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (166, '95078', 'tb95078', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Branický', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (167, '23610', 'ln23610', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Lukáš', NULL, 'Nemčík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (168, '23881', 'rv23881', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'Veselý', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (169, '99158', 'sf99158', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Samuel', NULL, 'Ferenčík', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (170, '99159', 'pf99159', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Fiala', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (171, '99193', 'pg99193', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Grodovský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (172, '23761', 'ps23761', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Soviš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (173, '20303', 'mj20303', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Jakubík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (174, '99241', 'ph99241', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Horný', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (175, '23484', 'fl23484', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Filip', NULL, 'Lörinc', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (176, '98238', 'mh98238', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Hron', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (177, '99267', 'tc99267', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Chmel', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (178, '99228', 'ph99228', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Hlocký', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (179, '99283', 'jj99283', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Jakubík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (180, '99285', 'mj99285', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Jamrich', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (181, '99309', 'mk99309', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Kadlic', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (182, '23981', 'mm23981', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Mihálik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (183, '99247', 'mh99247', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Hrablay', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (184, '23272', 'sh23272', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Štefan', NULL, 'Horváth', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (185, '20431', 'mk20431', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'Križan', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (186, '99400', 'pk99400', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Kuľka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (187, '99409', 'ml99409', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Lacko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (188, '37649', 'trebatickyp', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Trebaticky', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (189, '99225', 'lh99225', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľubomír', NULL, 'Hlávek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (190, '99465', 'jm99465', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Máté', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (191, '23617', 'mn23617', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Novák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (192, '99490', 'mm99490', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marián', NULL, 'Mirc', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (193, '98497', 'pm98497', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Mišík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (194, '22679', 'mp22679', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Palkovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (195, '20080', 'tb20080', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Búci', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (196, '23905', 'ov23905', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Oto', NULL, 'Vozár', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (197, '98584', 'jp98584', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Petreje', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (198, '22229', 'vg22229', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimír', NULL, 'Gregor', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (199, '99581', 'pp99581', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Procházka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (200, '99582', 'jp99582', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Prokša', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (201, '99557', 'tp99557', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Teodor', NULL, 'Petrík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (202, '97715', 'is97715', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Sás', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (203, '99607', 'ms99607', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Sečkár', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (204, '99608', 'ms99608', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marián', NULL, 'Sedláček', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (205, '99145', 'id99145', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Dysko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (206, '99544', 'rp99544', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Páterek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (207, '99642', 'ss99642', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Štefan', NULL, 'Sudolský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (208, '23428', 'sk23428', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Štefan', NULL, 'Krištofík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (209, '52048', 'pf52048', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Fillo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (210, '53051', 'ba53051', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Bader', NULL, 'Almethen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (211, '99737', 'jv99737', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Variny', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (212, '99744', 'mv99744', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marián', NULL, 'Vevurka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (213, '99767', 'dz99767', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Darina', NULL, 'Záhradná', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (214, '22174', 'rl22174', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'Lacko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (215, '12010', 'jzajac', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Zajac', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (216, '23760', 'js23760', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Somorovský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (217, '98167', 'lf98167', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľudovít', NULL, 'Fülop', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (218, '12006', 'rajskyp', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Rajský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (219, '12003', 'hurton', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Hurtoň', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (220, '12004', 'lichardova', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Hana', NULL, 'Lichardová', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (221, '45678', 'greskom', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Greško', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (222, '23056', 'ab23056', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Alexander', NULL, 'Benko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (223, '97224', 'sg97224', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Serguei', NULL, 'Gorbatchev', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (224, 't0202', 'jm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Mlynar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (226, 't0204', 'kv', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Kristian', NULL, 'Vedroody', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (227, '97046', 'jb97046', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Beňo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (228, '97103', 'lc97103', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľuboš', NULL, 'Cabánik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (229, '97181', 'pf97181', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Fekiač', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (230, '22388', 'rk22388', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radoslav', NULL, 'Katreniak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (231, '98383', 'ek98383', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Eugen', NULL, 'Križo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (232, '96497', 'jm96497', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Majerský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (233, '98478', 'mm98478', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Matuška', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (234, '95739', 'iv95739', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Verčinský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (235, 'ped200', 'tyslerm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Tyšler', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (236, 'ped201', 'kocalkap', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Kočalka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (237, 'ped203', 'trabalkam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Trabalka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (238, '23623', 'jn23623', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jana', NULL, 'Novoveská', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (239, '22468', 'mk22468', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Kropáček', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (240, '23139', 'md23139', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Dobiš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (241, '23200', 'im23200', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Malich', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (242, '22198', 'mm22198', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marcel', NULL, 'Mésároš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (243, '96717', 'mr96717', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Rusnák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (244, '98651', 'js98651', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Sebestyén', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (245, '97808', 'ps97808', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Švába', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (246, '23326', 'jv23326', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Války', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (247, '12012', 'brabcovak', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Karin', NULL, 'Brabcová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (248, '23134', 'dj23134', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Daniel', NULL, 'Jókai', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (249, '12014', 'Vojvoda', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Vojvoda', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (250, '12016', 'Zajac', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Zajac', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (251, '12017', 'Horniaček', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Horniaček', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (252, '12008', 'unger', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Unger', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (253, '12018', 'Andrasikl', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Andrášik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (254, '23674', 'mp23674', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Mária', NULL, 'Pohronská', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (255, '23505', 'fm23505', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Filip', NULL, 'Majerník', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (256, '23732', 'is23732', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Seman', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (257, '53001', 'rt53001', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'Tóth', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (258, '99631', 'ms99631', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Spevák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (259, '22490', 'mk22490', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Kurťák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (260, '45', 'steimullerb', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Branislav', NULL, 'Steinmüller', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (261, '23380', 'pk23380', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Knotka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (262, '22144', 'sd22144', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Štefan', NULL, 'Dlugolinský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (263, '99229', 'oh99229', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Hluchý', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (264, '20038', 'hb20038', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Helmut', NULL, 'Bauer', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (265, '23739', 'ts23739', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Schwandner', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (266, '22762', 'ms22762', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marian', NULL, 'Salaj', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (267, '23511', 'mm23511', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Makýš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (268, '23510', 'mm23510', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Makový', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (269, '20314', 'aj20314', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Janžo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (270, '58', 'rozinajovav', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Viera', NULL, 'Rozinajová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (271, '49', 'jancir', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'Janči', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (272, '42', 'smutnyo', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Smutný', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (273, '22402', 'ik22402', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Kišac', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (274, '22676', 'mp22676', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Pálka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (275, '23254', 'ph23254', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Hlinka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (276, '23578', 'mm23578', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Mlatiček', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (277, '23638', 'jo23638', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Orgonáš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (278, '23458', 'dl23458', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Dušan', NULL, 'Lamoš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (279, '23599', 'pn23599', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Nadanyi', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (280, '23005', 'la23005', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Lukáš', NULL, 'Adamko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (281, '22339', 'mj22339', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Jackovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (282, '22715', 'op22715', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Pok', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (283, 'a004', 'matusik', NULL, '098f6bcd4621d373cade4e832627b4f6', 'admin', NULL, 'Matušík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (284, '23924', 'pz23924', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Zubčák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (285, '23707', 'rr23707', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Rodák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (286, '22867', 'ms22867', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Šimún', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (287, '23184', 'af23184', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Frlička', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (288, '22258', 'mh22258', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'Haulik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (289, '22928', 'pt22928', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Tomek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (290, '22975', 'jv22975', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jakub', NULL, 'Vaňo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (291, '22638', 'mn22638', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Nágl', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (292, '22399', 'pk22399', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Kiršner', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (293, 'aaa', 'aaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'a', NULL, 'a', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (294, '43', 'sperkam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Šperka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (295, '22085', 'zb22085', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zuzana', NULL, 'Božoňová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (296, '22098', 'mb22098', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marian', NULL, 'Buchta', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (297, '36', 'parizkovaj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jana', NULL, 'Parízková', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (298, '9', 'dadob', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Boris', NULL, 'Dado', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (299, '54', 'navarcikm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matúš', NULL, 'Navarčik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (300, '22730', 'zp22730', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zoltán', NULL, 'Pulai', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (301, '19', 'hudecj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Hudec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (302, '22264', 'lh22264', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľuboš', NULL, 'Heriban', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (303, '22303', 'th22303', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Hubatý', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (304, '22425', 'tk22425', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Konečný', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (305, '20497', 'pl20497', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Luciak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (306, '22549', 'jm22549', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Majer', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (307, '22511', 'sl22511', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Stanislava', NULL, 'Leitmanová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (308, '22990', 'pv22990', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Vilina', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (309, '23418', 'jk23418', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jakub', NULL, 'Krajčovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (310, '23912', 'vz23912', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladislav', NULL, 'Zálešák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (311, '22341', 'mj22341', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Jajcaj', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (312, '23632', 'mo23632', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Ondrovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (313, '22931', 'tt22931', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Tóth', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (314, '22756', 'pr22756', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ruttkay-Nedecký', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (315, '22816', 'ms22816', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Stanček', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (316, '22017', 'ob22017', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Bachratý', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (317, '23154', 'jd23154', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Ďuriš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (318, '23214', 'mg23214', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Grežďo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (319, '23780', 'os23780', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Székely', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (320, '22018', 'vb22018', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Viktor', NULL, 'Bachratý', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (321, '22734', 'lr22734', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Rado', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (322, '22918', 'vt22918', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Viktor', NULL, 'Tlacháč', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (323, '23653', 'ap23653', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Anton', NULL, 'Pavlovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (324, '22317', 'lc22317', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľubomír', NULL, 'Chamraz', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (325, '23563', 'mm23563', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Mikula', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (326, '23469', 'll23469', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Lenčucha', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (327, '23258', 'xh23258', NULL, '098f6bcd4621d373cade4e832627b4f6', 'XuanLinh', NULL, 'Hoang', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (328, '22852', 'js22852', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Šarmír', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (329, '23527', 'zm23527', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zuzana', NULL, 'Maslenová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (330, '22006', 'sa22006', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Stanislav', NULL, 'Angelovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (331, '22699', 'mp22699', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Petriščák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (332, '22835', 'ms22835', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'Svetlík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (333, '22463', 'jk22463', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Krausko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (334, 'a006', 'rozinaj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'admin', NULL, 'Rozinajová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (335, '22674', 'do22674', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Drahomír', NULL, 'Osvald', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (336, '22882', 'bs22882', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Branislav', NULL, 'Šoral', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (337, '20191', 'mg20191', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Gális', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (338, '22782', 'rs22782', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'Schwartz', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (339, '22697', 'jp22697', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Petráš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (340, '23665', 'ap23665', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Piňák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (341, '73', 'bottr', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roland', NULL, 'Bott', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (342, '8', 'cicakp', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavel', NULL, 'Čičák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (343, '52040', 'mb52040', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Bubeník', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (344, '22937', 'mt22937', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Tréger', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (345, '22376', 'ak22376', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Kadora', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (346, '22349', 'pj22349', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Janičkovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (347, '23252', 'vh23252', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimír', NULL, 'Hlaváček', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (348, '22908', 'ps22908', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Šupina', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (349, '22297', 'jh22297', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Hric', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (350, '22809', 'ts22809', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tibor', NULL, 'Somogyi', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (351, '22023', 'jb22023', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Baláž', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (352, '22690', 'lp22690', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľuboš', NULL, 'Pazdera', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (353, '22661', 'mo22661', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Okresa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (354, '22652', 'pn22652', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Nociar', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (355, '22507', 'ml22507', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Legéň', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (356, '22617', 'pm22617', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Mišák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (357, '14', 'grellnethi', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Grellneth', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (358, '20', 'hudecl', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Hudec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (359, '29', 'malinad', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Dušan', NULL, 'Malina', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (360, '46', 'tomalovae', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Elena', NULL, 'Tomalová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (361, '302492', 'hasanj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jamal', NULL, 'Hasan', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (362, '22031', 'mb22031', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Bartal', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (363, '22036', 'mb22036', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Bebjak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (364, '22086', 'gb22086', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Gabriel', NULL, 'Braniša', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (365, '22106', 'mc22106', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Cichý', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (366, '22107', 'pc22107', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Cséfalvay', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (367, '22176', 'mf22176', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Fenin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (368, '22283', 'mh22283', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Homola', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (369, '22346', 'mj22346', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Jakuš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (370, '22493', 'tk22493', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Kuzár', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (371, '23672', 'mp23672', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Plávka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (372, '23692', 'lr23692', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľuboš', NULL, 'Rabčan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (373, '23779', 'ss23779', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Štefan', NULL, 'Szabó', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (374, '23', 'kapustiki', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Kapustík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (375, '26', 'kotocovam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Margaréta', NULL, 'Kotočová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (376, '23317', 'mi23317', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Ivanič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (377, '22314', 'bh22314', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Bohuslav', NULL, 'Hvizdák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (378, '23979', 'mm23979', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Maroš', NULL, 'Matúš', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (379, '21026', 'mb21026', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Bálint', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (380, '23987', 'mp23987', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Pálka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (381, '23722', 'js23722', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Sakáloš', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (382, '12005', 'pospichal', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JiĹ™í', NULL, 'Pospíchal', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (383, '23055', 'jb23055', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Beňák', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (384, '20323', 'mj20323', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matúš', NULL, 'Jókay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (385, '23245', 'mh23245', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Herko', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (386, '23498', 'tm23498', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Madaj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (387, '38', 'koskova', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Gabriela', NULL, 'Kosková', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (388, '303928', 'hanuloval', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Luba', NULL, 'Hanulová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (389, '23502', 'mm23502', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Mach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (390, '22094', 'jb22094', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Budinský', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (391, '22247', 'rh22247', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Riad', NULL, 'Hammoud', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (392, '22480', 'pk22480', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Kubizniak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (393, '23424', 'ak23424', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Alojz', NULL, 'Krenn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (394, '23500', 'dk23500', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Dušan', NULL, 'Kysel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (395, '98464', 'jm98464', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Mareták', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (396, '12002', 'groseko', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Otokar', NULL, 'Grošek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (397, '12013', 'Vavra', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Vávra', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (398, 'abc3', 'abc3', NULL, '098f6bcd4621d373cade4e832627b4f6', 'abc3', NULL, 'abc3', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (399, 'ped206', 'sirota', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimír', NULL, 'Sirota', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (400, '34261', 'takacsm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Takács', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (401, '34245', 'angelovicp', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Angelovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (402, '007', 'novy_student', NULL, '098f6bcd4621d373cade4e832627b4f6', 'student', NULL, 'novy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (403, 'ped208', 'simlastikm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Simlastik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (404, 'ped207', 'pikulat', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Pikula', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (405, '20473', 'll20473', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľuboš', NULL, 'Lečko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (406, 'd13', 'jvd13', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Vančík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (407, '20517', 'pm20517', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Marcinkovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (408, '20839', 'pt20839', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Tóth', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (409, 'abc', 'abc', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Abc', NULL, 'Abc', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (410, 't0201', 'rk', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'Klč', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (411, '98138', 'vf98138', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vít', NULL, 'Fargaš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (412, 'ped205', 'horvathp', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Horváth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (413, '20728', 'as20728', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Adam', NULL, 'Skalný', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (414, '99585', 'sp99585', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Szabolcs', NULL, 'Puskás', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (415, '52066', 'mk52066', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Konôpka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (416, '52039', 'jb52039', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Brosz', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (417, '1', 'balgaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Attila', NULL, 'Balga', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (418, '21575', 'pm21575', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Mesjar', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (419, '20769a', 'bohus', NULL, '098f6bcd4621d373cade4e832627b4f6', 'bohus', NULL, 'szabo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (420, '21961', 'jz21961', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Zeman', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (421, '12345', 'ra12345', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'Arvay', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (422, '10002', 'jarolini', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Jarolin', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (423, '20835', 'jt20835', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Tomko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (424, '20545', 'pm20545', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Mihalik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (425, 'd06', 'mhd06', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Hreňák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (426, '20107', 'mc20107', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Čambál', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (427, 'd11', 'skd11', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Stanislava', NULL, 'Kekerová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (428, '20804', 'ms20804', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Štípek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (429, '99714', 'zt99714', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zdenek', NULL, 'Tubel', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (430, 'd09', 'jbd09', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Beňo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (431, '22', 'jelemenskak', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Katarína', NULL, 'Jelemenská', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (432, '20225', 'jh20225', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Hamar', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (433, '10', 'filkornr', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Filkorn', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (434, '20213', 'mg20213', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Grosoš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (435, 'd03', 'ppd03', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Procházka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (436, '11', 'fristackyn', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Norbert', NULL, 'Frištacký', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (437, '34', 'navratp', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Návrat', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (438, '20091', 'jb20091', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Burák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (439, '20711', 'pr20711', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ružička', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (440, 'd05', 'fpd05', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Filip', NULL, 'Pucher', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (441, 'd02', 'mmd02', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Mačica', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (442, '20575', 'pm20575', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Mulinka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (443, '20766', 'ms20766', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miloš', NULL, 'Sýkora', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (444, '20736', 'ts20736', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Smolek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (445, '51', 'kurucj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Kuruc', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (446, '20584', 'pn20584', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Nagy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (447, '52', 'grlickyv', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimír', NULL, 'Grlický', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (448, '20689', 'pp20689', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Pullmann', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (449, 'd08', 'jkd08', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Kulich', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (450, '20092', 'ab20092', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Burger', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (451, 'd12', 'msd12', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marian', NULL, 'Stankovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (452, '20570', 'mm20570', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Moravčík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (453, '20882', 'mv20882', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Vnuk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (454, '20207', 'pg20207', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Gono', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (455, 'd04', 'jbd04', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Belluš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (456, '21966', 'mz21966', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Zubal', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (457, 'd01', 'phd01', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Hronček', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (458, '20565', 'tm20565', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Molnár', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (459, 'd07', 'rkd07', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Robert', NULL, 'Kubovics', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (460, '21027', 'ib21027', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Imrich', NULL, 'Balko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (461, '21109', 'mc21109', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Cerva', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (462, '20106', 'ic20106', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Čahoj', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (463, '99470', 'lm99470', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Lukáš', NULL, 'Matušík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (464, '99525', 'jo99525', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Olbert', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (465, '20053', 'ib20053', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Bernaťák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (466, '20411', 'jk20411', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Kovaľ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (467, '20498', 'll20498', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľudovít', NULL, 'Lučenič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (468, 'ped204', 'gaspariki', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Gašparik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (469, '20643', 'jp20643', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Pavlovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (470, '20845', 'pt20845', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Trnovský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (471, '99331', 'mk99331', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Kerni', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (472, '20791', 'ms20791', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miloslav', NULL, 'Šipka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (473, '99333', 'mk99333', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Kiselkov', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (474, '20896', 'dz20896', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Dalibor', NULL, 'Zahorák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (475, '20678', 'mp20678', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Pozor', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (476, '20512', 'lm20512', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľubomír', NULL, 'Majtás', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (477, '99618', 'ps99618', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Skočík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (478, '20344', 'dk20344', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Daniel', NULL, 'Katana', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (479, '99718', 'ku99718', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Katarína', NULL, 'Uherková', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (480, '20023', 'mb20023', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Bali', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (481, '99520', 'sn99520', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Štefan', NULL, 'Novák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (482, '20254', 'mh20254', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Holečka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (483, '99601', 'ms99601', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Salai', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (484, '20013', 'ra20013', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'Arpáš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (485, 'd10', 'ahd10', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Alexander', NULL, 'Hýbal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (486, '99110', 'jc99110', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Čúzy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (487, '22616', 'rm22616', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Mirc', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (488, '20534', 'jm20534', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jakub', NULL, 'Mažgut', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (489, '99023', 'vb99023', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimír', NULL, 'Balaš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (490, '20550', 'om20550', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Mikita', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (491, '20930', 'mz20930', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Žužo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (492, '20585', 'en20585', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Emil', NULL, 'Náhlik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (493, '20597', 'mn20597', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Niejadlik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (494, '20609', 'jo20609', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Obert', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (495, '21363', 'dk21363', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Dávid', NULL, 'Kaleta', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (496, '20617', 'po20617', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Orosi', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (497, '20656', 'mp20656', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Petrov', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (498, '20710', 'mr20710', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Rusnák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (499, '20742', 'rs20742', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'Solín', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (500, '20782', 'es20782', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Erik', NULL, 'Šille', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (501, '20788', 'ps20788', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Šimún', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (502, '21932', 'mv21932', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Vesel', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (503, '20798', 'ms20798', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Šoltis', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (504, '21098', 'jb21098', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Brutenič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (505, '20897', 'jz20897', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Zajac', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (506, '52116', 'rs52116', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radomír', NULL, 'Škrib', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (507, '99040', 'pb99040', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Bednár', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (508, '99057', 'rb99057', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'Bertušek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (509, '99222', 'mh99222', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Hinka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (510, '20209', 'mg20209', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Gregor', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (511, '98049', 'blazekj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Blažek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (512, '99271', 'ec99271', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Eduard', NULL, 'Chrvala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (513, '20014', 'mb20014', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Babala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (514, '20009', 'ma20009', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'Aradský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (515, '20010', 'pa20010', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Argaláš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (516, '20017', 'tb20017', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Backo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (517, '35', 'nehezm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Nehéz', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (518, '20067', 'rb20067', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'Bódi', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (519, '20077', 'db20077', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Daniel', NULL, 'Brnák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (520, '21130', 'pd21130', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Daniš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (521, '20128', 'md20128', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Dávid', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (522, '20142', 'md20142', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Donoval', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (523, '20157', 'pd20157', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Dušek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (524, '20198', 'lg20198', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Gažo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (525, '21814', 'rs21814', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radim', NULL, 'Stoklasa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (526, '21039', 'pb21039', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Bartalos', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (527, '20222', 'zh20222', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zuzana', NULL, 'Halanová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (528, '21061', 'ib21061', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Berta', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (529, '20508', 'jm20508', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Májek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (530, '21561', 'tm21561', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Matúšek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (531, '21333', 'mj21333', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Jánoš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (532, '20544', 'mm20544', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Maroš', NULL, 'Mičuda', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (533, '20651', 'pp20651', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Perec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (534, '20294', 'vi20294', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vojtech', NULL, 'Imrecze', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (535, '21929', 'mv21929', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Velecký', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (536, '20347', 'mk20347', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Kelemen', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (537, '20351', 'pk20351', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Khandl', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (538, '20370', 'lk20370', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Kluka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (539, '21744', 'lr21744', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Rendek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (540, 'dek001', 'mackovaz', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zuzana', NULL, 'Macková', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (541, '47', 'vojtekv', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimir', NULL, 'Vojtek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (542, '21003', 'la21003', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Lukáš', NULL, 'Adamec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (543, '98419', 'rl98419', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'Lauko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (544, '98160', 'rf98160', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radovan', NULL, 'Fraňo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (545, '60', 'fischerovam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Mária', NULL, 'Fischerová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (546, '97308', 'ivancom', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Maroš', NULL, 'Ivančo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (547, '98320', 'p', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Palo', NULL, 'Kiša', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (548, '67', 'kycinap', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavel', NULL, 'Kyčina', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (549, '66', 'cicakovao', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Oľga', NULL, 'Čičáková', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (550, '99619', 'as99619', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Slamka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (551, '12001', 'hantuch', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Hantuch', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (552, '21230', 'vg21230', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladislav', NULL, 'German', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (553, '21543', 'jm21543', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Manduch', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (554, '21820', 'js21820', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Suchal', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (555, '21851', 'is21851', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Škovran', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (556, '21981', 'pz21981', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Židek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (557, '12009', 'vojvodam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Vojvoda', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (558, '21074', 'mb21074', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Blesák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (559, '21874', 'ps21874', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Štuller', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (560, '21913', 'jv21913', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Václavík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (561, '21918', 'fv21918', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Filip', NULL, 'Valašek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (562, '10001', 'kinderr', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rudolf', NULL, 'Kinder', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (563, '27', 'krajcovict', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tibor', NULL, 'Krajčovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (564, '21973', 'az21973', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Adam', NULL, 'Žák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (565, '21642', 'po21642', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ochodnický', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (566, '12011', 'kvasnicka', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimír', NULL, 'Kvasnička', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (567, '20243', 'mh20243', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Herceg', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (568, '21341', 'mj21341', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Jemala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (569, '59', 'kotmanovad', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Daniela', NULL, 'Kotmanová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (570, '20479', 'rl20479', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Lenz', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (571, '22354', 'mj22354', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marian', NULL, 'Janovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (572, '99509', 'in99509', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Nemčovský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (573, '20283', 'mc20283', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Chalány', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (574, '20465', 'tl20465', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Laho', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (575, '20520', 'pm20520', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Markusek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (576, '99289', 'rj99289', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Jančiga', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (577, '21623', 'bn21623', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Benedikt', NULL, 'Nagy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (578, '98050', 'turbo', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Blšták', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (579, '12', 'galbavym', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Galbavý', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (580, 'ped202', 'baloghr', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'Balogh', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (581, '21610', 'mm21610', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Močol', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (582, '21495', 'll21495', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ľubomír', NULL, 'Lajoš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (583, '21844', 'ps21844', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Šinkovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (584, '56', 'bagalaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Adrian', NULL, 'Bagala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (585, 'a001', 'filkorn', NULL, '098f6bcd4621d373cade4e832627b4f6', 'admin', NULL, 'Filkorn', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (586, 'a003', 'singer', NULL, '098f6bcd4621d373cade4e832627b4f6', 'admin', NULL, 'Spevák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (587, 'mikol', 'mk', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Kolarovic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (588, '12020', 'talandam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Talanda', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (589, '21679', 'ip21679', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Peev', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (590, '21269', 'th21269', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Hlatký', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (591, '21434', 'ik21434', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Kováč', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (592, '21374', 'rk21374', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Kažimír', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (593, '21203', 'pf21203', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Fülöp', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (594, '21327', 'pj21327', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Jalec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (595, '20562', 'vm20562', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimír', NULL, 'Mlynarovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (596, '21763', 'ms21763', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Sabo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (597, '21727', 'pp21727', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Prikryl', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (598, '21824', 'ps21824', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Sýkora', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (599, '20706', 'mr20706', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Roháček', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (600, '21186', 'af21186', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Fiflík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (601, '21410', 'mk21410', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Komara', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (602, '21787', 'ps21787', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Sivák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (603, '20071', 'jb20071', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Borlok', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (604, '21887', 'tt21887', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Tatranský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (605, '21225', 'sg21225', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Štefan', NULL, 'Gembický', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (606, '21818', 'ms21818', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Strhan', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (607, '20876', 'lv20876', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Venczel', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (608, '21132', 'md21132', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Darula', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (609, '21980', 'jz21980', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Žiak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (610, '20892', 'jw20892', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Wagner', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (611, '21828', 'ks21828', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Kristián', NULL, 'Szobi', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (612, '12019', 'chomistr', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'Chomist', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (613, '21438', 'mk21438', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matúš', NULL, 'Kováčik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (614, '21155', 'fd21155', NULL, '098f6bcd4621d373cade4e832627b4f6', 'František', NULL, 'Ďurajka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (615, '21156', 'md21156', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Ďurfina', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (616, '21270', 'jh21270', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Hlaváč', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (617, '20425', 'mk20425', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Krchňavý', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (618, '21644', 'to21644', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Ă–lvecký', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (619, '21909', 'mu21909', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matúš', NULL, 'Uherčík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (620, '98815', 'vv98815', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Viliam', NULL, 'Vesek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (621, '99396', 'jk99396', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Kudják', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (622, '20829', 'mt20829', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marián', NULL, 'Tínes', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (623, '20384', 'mk20384', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Koprla', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (624, '21279', 'kh21279', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Kieu Hung', NULL, 'Hoang', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (625, '21917', 'pv21917', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Valachovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (626, '20078', 'mb20078', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Bubanský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (627, '20165', 'mf20165', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Fabok', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (628, '20866', 'mv20866', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Mikuláš', NULL, 'Vallo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (629, '21924', 'mv21924', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marián', NULL, 'Vašš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (630, '52213', 'th52213', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Hajas', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (631, '111111', 'bielik', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Mária', NULL, 'Bielik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (632, '20887', 'mv20887', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Vrábel', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (633, '21875', 'rs21875', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radko', NULL, 'Štulrajter', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (634, '20020', 'tb20020', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Bača', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (635, '21165', 'je21165', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Eliáš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (636, '21251', 'mh21251', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Handrlica', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (637, '21084', 'tb21084', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tibor', NULL, 'Borka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (638, '20221', 'mh20221', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Halák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (639, '21245', 'mh21245', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Habala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (640, '21372', 'pk21372', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Kasan', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (641, '21429', 'ak21429', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Attila', NULL, 'Kotrba', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (642, '21728', 'pp21728', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Prikryl', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (643, '21908', 'mt21908', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Tvarožek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (644, '21051', 'mb21051', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Belušík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (645, '21092', 'mb21092', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Braun', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (646, '99043', 'pb99043', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Beláň', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (647, '20265', 'eh20265', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Erik', NULL, 'Horváth', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (648, '21037', 'mb21037', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Barla', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (649, '20753', 'vs20753', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimír', NULL, 'Straka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (650, '21829', 'vs21829', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vojtech', NULL, 'Szöcs', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (651, '21072', 'ib21072', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Blanárik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (652, '20304', 'mj20304', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Jakubovský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (653, '21381', 'pk21381', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Kiselkov', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (654, '22268', 'oh22268', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Hirjak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (655, '28', 'makulam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'Makula', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (656, '20401', 'mk20401', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Kováč', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (657, '23778', 'ms23778', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'Szabó', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (658, '22497', 'mk22497', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Kvasnička', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (659, '99531', 'do99531', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Dalimír', NULL, 'Orfánus', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (660, '5', 'bielikovam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Mária', NULL, 'Bieliková', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (661, '20180', 'mf20180', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Fučila', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (662, '21462', 'jk21462', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Kriška', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (663, '20090', 'jb20090', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Buno', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (664, '20851', 'mt20851', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Tury', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (665, '99102', 'mc99102', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Čatloš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (666, '20492', 'ml20492', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Lokša', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (667, '20797', 'js20797', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Šnirc', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (668, '99455', 'jm99455', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Malcho', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (669, '20317', 'mj20317', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Jenčo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (670, '55', 'torokt', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Timotej', NULL, 'Török', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (671, '22060', 'tb22060', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Bielik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (672, '30', 'markm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Mária', NULL, 'Markošová', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (673, 'ext0008', 'liskam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Líška', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (674, '53', 'ziakj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ján', NULL, 'Žiak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (675, '23731', 'ts23731', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tomáš', NULL, 'Selnekovič', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (676, '22353', 'ij22353', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Jánoš', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (677, '98389', 'mk98389', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Kubik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (678, '23763', 'js23763', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Staník', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (679, '22336', 'pi22336', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ivanka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (680, '23383', 'pk23383', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Kohaut', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (681, '22863', 'ms22863', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marián', NULL, 'Šimko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (682, '23001', 'ja23001', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Abaffy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (683, '23836', 'jt23836', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Tomaschek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (684, '23592', 'im23592', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Mrva', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (685, '22414', 'mk22414', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Kobza', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (686, '22866', 'ls22866', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Lukáš', NULL, 'Šimon', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (687, '21157', 'ad21157', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Ďurica', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (688, '22793', 'js22793', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Slezák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (689, '22134', 'od22134', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Dančík', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (690, '71', 'frivoltgy', NULL, '098f6bcd4621d373cade4e832627b4f6', 'György', NULL, 'Frivolt', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (691, '22380', 'mk22380', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Kallo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (692, '23211', 'mg23211', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Gregor', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (693, '23290', 'rh23290', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'Hudák', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (694, '23688', 'jp23688', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Pristach', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (695, '21102', 'mb21102', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Bujna', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (696, '22865', 'ps22865', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Šimno', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (697, '22655', 'ln22655', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Lucia', NULL, 'Novická', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (698, '20288', 'mc20288', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marián', NULL, 'Chovanec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (699, '23626', 'so23626', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Stanislav', NULL, 'Ondáč', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (700, '23781', 'bs23781', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Branislav', NULL, 'Szeliga', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (701, '23856', 'pt23856', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Tylka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (702, '21223', 'mg21223', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Gecelovský', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (703, '21183', 'mf21183', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Fiala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (704, '41', 'simakovav', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Valéria', NULL, 'Šimáková', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (705, '24', 'kolesar', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Kolesár', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (1, 'te22111', 'test', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Test', NULL, 'Testerovic', 'Bc.', 'hidden@franto.sk', 'xxxx fdgsfdsf', '', '', '', NULL, 75, 0);


--
-- Data for Name: users_clearances; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO users_clearances VALUES (1, 1, 8, 'allow');
INSERT INTO users_clearances VALUES (4, 1, 5, 'allow');
INSERT INTO users_clearances VALUES (5, 1, 4, 'allow');
INSERT INTO users_clearances VALUES (6, 1, 3, 'allow');
INSERT INTO users_clearances VALUES (7, 1, 2, 'allow');
INSERT INTO users_clearances VALUES (8, 1, 1, 'allow');


--
-- Data for Name: users_online; Type: TABLE DATA; Schema: public; Owner: team14
--



--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO users_roles VALUES (2, 2, 2);
INSERT INTO users_roles VALUES (3, 3, 3);
INSERT INTO users_roles VALUES (4, 5, 3);
INSERT INTO users_roles VALUES (5, 563, 2);
INSERT INTO users_roles VALUES (6, 7, 3);
INSERT INTO users_roles VALUES (7, 24, 2);
INSERT INTO users_roles VALUES (8, 8, 3);
INSERT INTO users_roles VALUES (9, 17, 2);
INSERT INTO users_roles VALUES (10, 660, 2);
INSERT INTO users_roles VALUES (11, 9, 3);
INSERT INTO users_roles VALUES (12, 358, 2);
INSERT INTO users_roles VALUES (13, 674, 2);
INSERT INTO users_roles VALUES (14, 14, 3);
INSERT INTO users_roles VALUES (15, 40, 2);
INSERT INTO users_roles VALUES (16, 18, 3);
INSERT INTO users_roles VALUES (17, 360, 2);
INSERT INTO users_roles VALUES (18, 579, 2);
INSERT INTO users_roles VALUES (19, 21, 3);
INSERT INTO users_roles VALUES (20, 22, 3);
INSERT INTO users_roles VALUES (21, 541, 2);
INSERT INTO users_roles VALUES (22, 28, 3);
INSERT INTO users_roles VALUES (23, 655, 2);
INSERT INTO users_roles VALUES (24, 29, 3);
INSERT INTO users_roles VALUES (25, 301, 2);
INSERT INTO users_roles VALUES (26, 30, 3);
INSERT INTO users_roles VALUES (27, 32, 3);
INSERT INTO users_roles VALUES (28, 13, 2);
INSERT INTO users_roles VALUES (29, 431, 2);
INSERT INTO users_roles VALUES (30, 34, 3);
INSERT INTO users_roles VALUES (31, 375, 2);
INSERT INTO users_roles VALUES (32, 359, 2);
INSERT INTO users_roles VALUES (33, 37, 3);
INSERT INTO users_roles VALUES (34, 361, 2);
INSERT INTO users_roles VALUES (35, 38, 3);
INSERT INTO users_roles VALUES (36, 382, 2);
INSERT INTO users_roles VALUES (37, 39, 3);
INSERT INTO users_roles VALUES (38, 437, 2);
INSERT INTO users_roles VALUES (39, 41, 3);
INSERT INTO users_roles VALUES (40, 704, 2);
INSERT INTO users_roles VALUES (41, 42, 3);
INSERT INTO users_roles VALUES (42, 374, 2);
INSERT INTO users_roles VALUES (43, 45, 3);
INSERT INTO users_roles VALUES (44, 48, 3);
INSERT INTO users_roles VALUES (45, 49, 3);
INSERT INTO users_roles VALUES (46, 16, 2);
INSERT INTO users_roles VALUES (47, 50, 3);
INSERT INTO users_roles VALUES (48, 51, 3);
INSERT INTO users_roles VALUES (49, 27, 2);
INSERT INTO users_roles VALUES (50, 52, 3);
INSERT INTO users_roles VALUES (51, 566, 2);
INSERT INTO users_roles VALUES (52, 53, 3);
INSERT INTO users_roles VALUES (53, 517, 2);
INSERT INTO users_roles VALUES (54, 54, 3);
INSERT INTO users_roles VALUES (55, 388, 2);
INSERT INTO users_roles VALUES (56, 20, 2);
INSERT INTO users_roles VALUES (57, 55, 3);
INSERT INTO users_roles VALUES (58, 97, 2);
INSERT INTO users_roles VALUES (59, 56, 3);
INSERT INTO users_roles VALUES (60, 57, 3);
INSERT INTO users_roles VALUES (61, 433, 2);
INSERT INTO users_roles VALUES (62, 58, 3);
INSERT INTO users_roles VALUES (63, 59, 3);
INSERT INTO users_roles VALUES (64, 43, 2);
INSERT INTO users_roles VALUES (65, 60, 3);
INSERT INTO users_roles VALUES (66, 98, 2);
INSERT INTO users_roles VALUES (67, 61, 3);
INSERT INTO users_roles VALUES (68, 62, 3);
INSERT INTO users_roles VALUES (69, 63, 3);
INSERT INTO users_roles VALUES (70, 31, 2);
INSERT INTO users_roles VALUES (71, 10, 2);
INSERT INTO users_roles VALUES (72, 64, 3);
INSERT INTO users_roles VALUES (73, 294, 2);
INSERT INTO users_roles VALUES (74, 11, 2);
INSERT INTO users_roles VALUES (75, 297, 2);
INSERT INTO users_roles VALUES (76, 65, 3);
INSERT INTO users_roles VALUES (77, 66, 3);
INSERT INTO users_roles VALUES (78, 447, 2);
INSERT INTO users_roles VALUES (79, 67, 3);
INSERT INTO users_roles VALUES (80, 260, 2);
INSERT INTO users_roles VALUES (81, 68, 3);
INSERT INTO users_roles VALUES (82, 584, 2);
INSERT INTO users_roles VALUES (83, 69, 3);
INSERT INTO users_roles VALUES (84, 588, 2);
INSERT INTO users_roles VALUES (85, 357, 2);
INSERT INTO users_roles VALUES (86, 70, 3);
INSERT INTO users_roles VALUES (87, 71, 3);
INSERT INTO users_roles VALUES (88, 25, 2);
INSERT INTO users_roles VALUES (89, 298, 2);
INSERT INTO users_roles VALUES (90, 72, 3);
INSERT INTO users_roles VALUES (91, 73, 3);
INSERT INTO users_roles VALUES (92, 74, 3);
INSERT INTO users_roles VALUES (93, 75, 3);
INSERT INTO users_roles VALUES (94, 76, 3);
INSERT INTO users_roles VALUES (95, 78, 3);
INSERT INTO users_roles VALUES (96, 19, 2);
INSERT INTO users_roles VALUES (97, 80, 3);
INSERT INTO users_roles VALUES (98, 81, 3);
INSERT INTO users_roles VALUES (99, 270, 2);
INSERT INTO users_roles VALUES (100, 83, 3);
INSERT INTO users_roles VALUES (101, 401, 2);
INSERT INTO users_roles VALUES (102, 85, 3);
INSERT INTO users_roles VALUES (103, 86, 3);
INSERT INTO users_roles VALUES (104, 387, 2);
INSERT INTO users_roles VALUES (105, 87, 3);
INSERT INTO users_roles VALUES (106, 88, 3);
INSERT INTO users_roles VALUES (107, 89, 3);
INSERT INTO users_roles VALUES (108, 90, 3);
INSERT INTO users_roles VALUES (109, 93, 3);
INSERT INTO users_roles VALUES (110, 94, 3);
INSERT INTO users_roles VALUES (111, 99, 3);
INSERT INTO users_roles VALUES (112, 100, 3);
INSERT INTO users_roles VALUES (113, 101, 3);
INSERT INTO users_roles VALUES (114, 102, 3);
INSERT INTO users_roles VALUES (115, 103, 3);
INSERT INTO users_roles VALUES (116, 104, 3);
INSERT INTO users_roles VALUES (117, 215, 2);
INSERT INTO users_roles VALUES (118, 105, 3);
INSERT INTO users_roles VALUES (119, 46, 2);
INSERT INTO users_roles VALUES (120, 106, 3);
INSERT INTO users_roles VALUES (121, 108, 3);
INSERT INTO users_roles VALUES (122, 109, 3);
INSERT INTO users_roles VALUES (123, 110, 3);
INSERT INTO users_roles VALUES (124, 111, 3);
INSERT INTO users_roles VALUES (125, 557, 2);
INSERT INTO users_roles VALUES (126, 113, 3);
INSERT INTO users_roles VALUES (127, 114, 3);
INSERT INTO users_roles VALUES (128, 705, 2);
INSERT INTO users_roles VALUES (129, 115, 3);
INSERT INTO users_roles VALUES (130, 672, 2);
INSERT INTO users_roles VALUES (131, 116, 3);
INSERT INTO users_roles VALUES (132, 117, 3);
INSERT INTO users_roles VALUES (133, 95, 2);
INSERT INTO users_roles VALUES (134, 118, 3);
INSERT INTO users_roles VALUES (135, 119, 3);
INSERT INTO users_roles VALUES (136, 120, 3);
INSERT INTO users_roles VALUES (137, 121, 3);
INSERT INTO users_roles VALUES (138, 122, 3);
INSERT INTO users_roles VALUES (139, 422, 2);
INSERT INTO users_roles VALUES (140, 123, 3);
INSERT INTO users_roles VALUES (141, 124, 3);
INSERT INTO users_roles VALUES (142, 125, 3);
INSERT INTO users_roles VALUES (143, 127, 3);
INSERT INTO users_roles VALUES (144, 128, 3);
INSERT INTO users_roles VALUES (145, 342, 2);
INSERT INTO users_roles VALUES (146, 129, 3);
INSERT INTO users_roles VALUES (147, 130, 3);
INSERT INTO users_roles VALUES (148, 131, 3);
INSERT INTO users_roles VALUES (149, 188, 2);
INSERT INTO users_roles VALUES (150, 132, 3);
INSERT INTO users_roles VALUES (151, 133, 3);
INSERT INTO users_roles VALUES (152, 134, 3);
INSERT INTO users_roles VALUES (153, 135, 3);
INSERT INTO users_roles VALUES (154, 136, 3);
INSERT INTO users_roles VALUES (155, 137, 3);
INSERT INTO users_roles VALUES (156, 138, 3);
INSERT INTO users_roles VALUES (157, 139, 3);
INSERT INTO users_roles VALUES (158, 140, 3);
INSERT INTO users_roles VALUES (159, 141, 3);
INSERT INTO users_roles VALUES (160, 143, 3);
INSERT INTO users_roles VALUES (161, 145, 3);
INSERT INTO users_roles VALUES (162, 146, 3);
INSERT INTO users_roles VALUES (163, 147, 3);
INSERT INTO users_roles VALUES (164, 148, 3);
INSERT INTO users_roles VALUES (165, 400, 2);
INSERT INTO users_roles VALUES (166, 150, 3);
INSERT INTO users_roles VALUES (167, 152, 3);
INSERT INTO users_roles VALUES (168, 154, 3);
INSERT INTO users_roles VALUES (169, 155, 3);
INSERT INTO users_roles VALUES (170, 156, 3);
INSERT INTO users_roles VALUES (171, 157, 3);
INSERT INTO users_roles VALUES (172, 159, 3);
INSERT INTO users_roles VALUES (173, 161, 3);
INSERT INTO users_roles VALUES (174, 162, 3);
INSERT INTO users_roles VALUES (175, 163, 3);
INSERT INTO users_roles VALUES (176, 164, 3);
INSERT INTO users_roles VALUES (177, 165, 3);
INSERT INTO users_roles VALUES (178, 166, 3);
INSERT INTO users_roles VALUES (179, 417, 2);
INSERT INTO users_roles VALUES (180, 167, 3);
INSERT INTO users_roles VALUES (181, 168, 3);
INSERT INTO users_roles VALUES (182, 169, 3);
INSERT INTO users_roles VALUES (183, 219, 2);
INSERT INTO users_roles VALUES (184, 170, 3);
INSERT INTO users_roles VALUES (185, 171, 3);
INSERT INTO users_roles VALUES (186, 172, 3);
INSERT INTO users_roles VALUES (187, 173, 3);
INSERT INTO users_roles VALUES (188, 174, 3);
INSERT INTO users_roles VALUES (189, 176, 3);
INSERT INTO users_roles VALUES (190, 177, 3);
INSERT INTO users_roles VALUES (191, 562, 2);
INSERT INTO users_roles VALUES (192, 178, 3);
INSERT INTO users_roles VALUES (193, 179, 3);
INSERT INTO users_roles VALUES (194, 180, 3);
INSERT INTO users_roles VALUES (195, 181, 3);
INSERT INTO users_roles VALUES (196, 182, 3);
INSERT INTO users_roles VALUES (197, 183, 3);
INSERT INTO users_roles VALUES (198, 185, 3);
INSERT INTO users_roles VALUES (199, 221, 2);
INSERT INTO users_roles VALUES (200, 396, 2);
INSERT INTO users_roles VALUES (201, 186, 3);
INSERT INTO users_roles VALUES (202, 187, 3);
INSERT INTO users_roles VALUES (203, 189, 3);
INSERT INTO users_roles VALUES (204, 436, 2);
INSERT INTO users_roles VALUES (205, 190, 3);
INSERT INTO users_roles VALUES (206, 191, 3);
INSERT INTO users_roles VALUES (207, 192, 3);
INSERT INTO users_roles VALUES (208, 193, 3);
INSERT INTO users_roles VALUES (209, 194, 3);
INSERT INTO users_roles VALUES (210, 195, 3);
INSERT INTO users_roles VALUES (211, 196, 3);
INSERT INTO users_roles VALUES (212, 197, 3);
INSERT INTO users_roles VALUES (213, 198, 3);
INSERT INTO users_roles VALUES (214, 199, 3);
INSERT INTO users_roles VALUES (215, 92, 2);
INSERT INTO users_roles VALUES (216, 200, 3);
INSERT INTO users_roles VALUES (217, 201, 3);
INSERT INTO users_roles VALUES (218, 202, 3);
INSERT INTO users_roles VALUES (219, 203, 3);
INSERT INTO users_roles VALUES (220, 204, 3);
INSERT INTO users_roles VALUES (221, 272, 2);
INSERT INTO users_roles VALUES (222, 205, 3);
INSERT INTO users_roles VALUES (223, 206, 3);
INSERT INTO users_roles VALUES (224, 207, 3);
INSERT INTO users_roles VALUES (225, 208, 3);
INSERT INTO users_roles VALUES (226, 209, 3);
INSERT INTO users_roles VALUES (227, 210, 3);
INSERT INTO users_roles VALUES (228, 211, 3);
INSERT INTO users_roles VALUES (229, 212, 3);
INSERT INTO users_roles VALUES (230, 213, 3);
INSERT INTO users_roles VALUES (231, 214, 3);
INSERT INTO users_roles VALUES (232, 253, 2);
INSERT INTO users_roles VALUES (233, 216, 3);
INSERT INTO users_roles VALUES (234, 217, 3);
INSERT INTO users_roles VALUES (235, 222, 3);
INSERT INTO users_roles VALUES (236, 44, 2);
INSERT INTO users_roles VALUES (237, 223, 3);
INSERT INTO users_roles VALUES (238, 227, 3);
INSERT INTO users_roles VALUES (239, 228, 3);
INSERT INTO users_roles VALUES (240, 229, 3);
INSERT INTO users_roles VALUES (241, 230, 3);
INSERT INTO users_roles VALUES (242, 231, 3);
INSERT INTO users_roles VALUES (243, 232, 3);
INSERT INTO users_roles VALUES (244, 235, 2);
INSERT INTO users_roles VALUES (245, 247, 2);
INSERT INTO users_roles VALUES (246, 233, 3);
INSERT INTO users_roles VALUES (247, 236, 2);
INSERT INTO users_roles VALUES (248, 234, 3);
INSERT INTO users_roles VALUES (249, 237, 2);
INSERT INTO users_roles VALUES (250, 238, 3);
INSERT INTO users_roles VALUES (251, 239, 3);
INSERT INTO users_roles VALUES (252, 670, 2);
INSERT INTO users_roles VALUES (253, 240, 3);
INSERT INTO users_roles VALUES (254, 241, 3);
INSERT INTO users_roles VALUES (255, 242, 3);
INSERT INTO users_roles VALUES (256, 243, 3);
INSERT INTO users_roles VALUES (257, 248, 3);
INSERT INTO users_roles VALUES (258, 254, 3);
INSERT INTO users_roles VALUES (259, 255, 3);
INSERT INTO users_roles VALUES (260, 257, 3);
INSERT INTO users_roles VALUES (261, 258, 3);
INSERT INTO users_roles VALUES (262, 259, 3);
INSERT INTO users_roles VALUES (263, 262, 3);
INSERT INTO users_roles VALUES (264, 263, 3);
INSERT INTO users_roles VALUES (265, 264, 3);
INSERT INTO users_roles VALUES (266, 265, 3);
INSERT INTO users_roles VALUES (267, 266, 3);
INSERT INTO users_roles VALUES (268, 267, 3);
INSERT INTO users_roles VALUES (269, 268, 3);
INSERT INTO users_roles VALUES (270, 269, 3);
INSERT INTO users_roles VALUES (271, 273, 3);
INSERT INTO users_roles VALUES (272, 274, 3);
INSERT INTO users_roles VALUES (273, 275, 3);
INSERT INTO users_roles VALUES (274, 276, 3);
INSERT INTO users_roles VALUES (275, 278, 3);
INSERT INTO users_roles VALUES (276, 279, 3);
INSERT INTO users_roles VALUES (277, 280, 3);
INSERT INTO users_roles VALUES (278, 281, 3);
INSERT INTO users_roles VALUES (279, 282, 3);
INSERT INTO users_roles VALUES (280, 690, 2);
INSERT INTO users_roles VALUES (281, 284, 3);
INSERT INTO users_roles VALUES (282, 285, 3);
INSERT INTO users_roles VALUES (283, 286, 3);
INSERT INTO users_roles VALUES (284, 287, 3);
INSERT INTO users_roles VALUES (285, 288, 3);
INSERT INTO users_roles VALUES (286, 289, 3);
INSERT INTO users_roles VALUES (287, 290, 3);
INSERT INTO users_roles VALUES (288, 291, 3);
INSERT INTO users_roles VALUES (289, 12, 2);
INSERT INTO users_roles VALUES (290, 292, 3);
INSERT INTO users_roles VALUES (291, 293, 3);
INSERT INTO users_roles VALUES (292, 295, 3);
INSERT INTO users_roles VALUES (293, 569, 2);
INSERT INTO users_roles VALUES (294, 296, 3);
INSERT INTO users_roles VALUES (295, 300, 3);
INSERT INTO users_roles VALUES (296, 302, 3);
INSERT INTO users_roles VALUES (297, 303, 3);
INSERT INTO users_roles VALUES (298, 304, 3);
INSERT INTO users_roles VALUES (299, 305, 3);
INSERT INTO users_roles VALUES (300, 306, 3);
INSERT INTO users_roles VALUES (301, 307, 3);
INSERT INTO users_roles VALUES (302, 308, 3);
INSERT INTO users_roles VALUES (303, 309, 3);
INSERT INTO users_roles VALUES (304, 445, 2);
INSERT INTO users_roles VALUES (305, 310, 3);
INSERT INTO users_roles VALUES (306, 311, 3);
INSERT INTO users_roles VALUES (307, 312, 3);
INSERT INTO users_roles VALUES (308, 313, 3);
INSERT INTO users_roles VALUES (309, 314, 3);
INSERT INTO users_roles VALUES (310, 315, 3);
INSERT INTO users_roles VALUES (311, 316, 3);
INSERT INTO users_roles VALUES (312, 317, 3);
INSERT INTO users_roles VALUES (313, 318, 3);
INSERT INTO users_roles VALUES (314, 319, 3);
INSERT INTO users_roles VALUES (315, 320, 3);
INSERT INTO users_roles VALUES (316, 321, 3);
INSERT INTO users_roles VALUES (317, 322, 3);
INSERT INTO users_roles VALUES (318, 323, 3);
INSERT INTO users_roles VALUES (319, 324, 3);
INSERT INTO users_roles VALUES (320, 325, 3);
INSERT INTO users_roles VALUES (321, 326, 3);
INSERT INTO users_roles VALUES (322, 327, 3);
INSERT INTO users_roles VALUES (323, 328, 3);
INSERT INTO users_roles VALUES (324, 329, 3);
INSERT INTO users_roles VALUES (325, 330, 3);
INSERT INTO users_roles VALUES (326, 331, 3);
INSERT INTO users_roles VALUES (327, 332, 3);
INSERT INTO users_roles VALUES (328, 333, 3);
INSERT INTO users_roles VALUES (329, 335, 3);
INSERT INTO users_roles VALUES (330, 336, 3);
INSERT INTO users_roles VALUES (331, 337, 3);
INSERT INTO users_roles VALUES (332, 338, 3);
INSERT INTO users_roles VALUES (333, 339, 3);
INSERT INTO users_roles VALUES (334, 340, 3);
INSERT INTO users_roles VALUES (335, 343, 3);
INSERT INTO users_roles VALUES (336, 344, 3);
INSERT INTO users_roles VALUES (337, 345, 3);
INSERT INTO users_roles VALUES (338, 346, 3);
INSERT INTO users_roles VALUES (339, 347, 3);
INSERT INTO users_roles VALUES (340, 348, 3);
INSERT INTO users_roles VALUES (341, 349, 3);
INSERT INTO users_roles VALUES (342, 35, 2);
INSERT INTO users_roles VALUES (343, 350, 3);
INSERT INTO users_roles VALUES (344, 351, 3);
INSERT INTO users_roles VALUES (345, 352, 3);
INSERT INTO users_roles VALUES (346, 353, 3);
INSERT INTO users_roles VALUES (347, 354, 3);
INSERT INTO users_roles VALUES (348, 355, 3);
INSERT INTO users_roles VALUES (349, 299, 2);
INSERT INTO users_roles VALUES (350, 356, 3);
INSERT INTO users_roles VALUES (351, 362, 3);
INSERT INTO users_roles VALUES (352, 363, 3);
INSERT INTO users_roles VALUES (353, 365, 3);
INSERT INTO users_roles VALUES (354, 366, 3);
INSERT INTO users_roles VALUES (355, 368, 3);
INSERT INTO users_roles VALUES (356, 369, 3);
INSERT INTO users_roles VALUES (357, 370, 3);
INSERT INTO users_roles VALUES (358, 373, 3);
INSERT INTO users_roles VALUES (359, 376, 3);
INSERT INTO users_roles VALUES (360, 377, 3);
INSERT INTO users_roles VALUES (361, 384, 3);
INSERT INTO users_roles VALUES (362, 395, 3);
INSERT INTO users_roles VALUES (363, 402, 3);
INSERT INTO users_roles VALUES (364, 419, 2);
INSERT INTO users_roles VALUES (365, 405, 3);
INSERT INTO users_roles VALUES (366, 406, 3);
INSERT INTO users_roles VALUES (367, 407, 3);
INSERT INTO users_roles VALUES (368, 408, 3);
INSERT INTO users_roles VALUES (369, 410, 3);
INSERT INTO users_roles VALUES (370, 411, 3);
INSERT INTO users_roles VALUES (371, 412, 2);
INSERT INTO users_roles VALUES (372, 413, 3);
INSERT INTO users_roles VALUES (373, 414, 3);
INSERT INTO users_roles VALUES (374, 415, 3);
INSERT INTO users_roles VALUES (375, 416, 3);
INSERT INTO users_roles VALUES (376, 418, 3);
INSERT INTO users_roles VALUES (377, 420, 3);
INSERT INTO users_roles VALUES (378, 421, 3);
INSERT INTO users_roles VALUES (379, 250, 2);
INSERT INTO users_roles VALUES (380, 423, 3);
INSERT INTO users_roles VALUES (381, 424, 3);
INSERT INTO users_roles VALUES (382, 425, 3);
INSERT INTO users_roles VALUES (383, 426, 3);
INSERT INTO users_roles VALUES (384, 427, 3);
INSERT INTO users_roles VALUES (385, 428, 3);
INSERT INTO users_roles VALUES (386, 429, 3);
INSERT INTO users_roles VALUES (387, 432, 3);
INSERT INTO users_roles VALUES (388, 434, 3);
INSERT INTO users_roles VALUES (389, 435, 3);
INSERT INTO users_roles VALUES (390, 438, 3);
INSERT INTO users_roles VALUES (391, 439, 3);
INSERT INTO users_roles VALUES (392, 440, 3);
INSERT INTO users_roles VALUES (393, 441, 3);
INSERT INTO users_roles VALUES (394, 442, 3);
INSERT INTO users_roles VALUES (395, 443, 3);
INSERT INTO users_roles VALUES (396, 444, 3);
INSERT INTO users_roles VALUES (397, 446, 3);
INSERT INTO users_roles VALUES (398, 448, 3);
INSERT INTO users_roles VALUES (399, 449, 3);
INSERT INTO users_roles VALUES (400, 450, 3);
INSERT INTO users_roles VALUES (401, 451, 3);
INSERT INTO users_roles VALUES (402, 452, 3);
INSERT INTO users_roles VALUES (403, 453, 3);
INSERT INTO users_roles VALUES (404, 454, 3);
INSERT INTO users_roles VALUES (405, 455, 3);
INSERT INTO users_roles VALUES (406, 456, 3);
INSERT INTO users_roles VALUES (407, 457, 3);
INSERT INTO users_roles VALUES (408, 458, 3);
INSERT INTO users_roles VALUES (409, 460, 3);
INSERT INTO users_roles VALUES (410, 673, 2);
INSERT INTO users_roles VALUES (411, 461, 3);
INSERT INTO users_roles VALUES (412, 462, 3);
INSERT INTO users_roles VALUES (413, 463, 3);
INSERT INTO users_roles VALUES (414, 464, 3);
INSERT INTO users_roles VALUES (415, 465, 3);
INSERT INTO users_roles VALUES (416, 466, 3);
INSERT INTO users_roles VALUES (417, 467, 3);
INSERT INTO users_roles VALUES (418, 469, 3);
INSERT INTO users_roles VALUES (419, 470, 3);
INSERT INTO users_roles VALUES (420, 471, 3);
INSERT INTO users_roles VALUES (421, 472, 3);
INSERT INTO users_roles VALUES (422, 473, 3);
INSERT INTO users_roles VALUES (423, 474, 3);
INSERT INTO users_roles VALUES (424, 475, 3);
INSERT INTO users_roles VALUES (425, 476, 3);
INSERT INTO users_roles VALUES (426, 477, 3);
INSERT INTO users_roles VALUES (427, 478, 3);
INSERT INTO users_roles VALUES (428, 479, 3);
INSERT INTO users_roles VALUES (429, 218, 2);
INSERT INTO users_roles VALUES (430, 480, 3);
INSERT INTO users_roles VALUES (431, 481, 3);
INSERT INTO users_roles VALUES (432, 482, 3);
INSERT INTO users_roles VALUES (433, 483, 3);
INSERT INTO users_roles VALUES (434, 484, 3);
INSERT INTO users_roles VALUES (435, 486, 3);
INSERT INTO users_roles VALUES (436, 487, 3);
INSERT INTO users_roles VALUES (437, 488, 3);
INSERT INTO users_roles VALUES (438, 489, 3);
INSERT INTO users_roles VALUES (439, 490, 3);
INSERT INTO users_roles VALUES (440, 491, 3);
INSERT INTO users_roles VALUES (441, 492, 3);
INSERT INTO users_roles VALUES (442, 493, 3);
INSERT INTO users_roles VALUES (443, 494, 3);
INSERT INTO users_roles VALUES (444, 495, 3);
INSERT INTO users_roles VALUES (445, 496, 3);
INSERT INTO users_roles VALUES (446, 497, 3);
INSERT INTO users_roles VALUES (447, 498, 3);
INSERT INTO users_roles VALUES (448, 499, 3);
INSERT INTO users_roles VALUES (449, 500, 3);
INSERT INTO users_roles VALUES (450, 501, 3);
INSERT INTO users_roles VALUES (451, 502, 3);
INSERT INTO users_roles VALUES (452, 503, 3);
INSERT INTO users_roles VALUES (453, 504, 3);
INSERT INTO users_roles VALUES (454, 505, 3);
INSERT INTO users_roles VALUES (455, 506, 3);
INSERT INTO users_roles VALUES (456, 507, 3);
INSERT INTO users_roles VALUES (457, 508, 3);
INSERT INTO users_roles VALUES (458, 252, 2);
INSERT INTO users_roles VALUES (459, 509, 3);
INSERT INTO users_roles VALUES (460, 510, 3);
INSERT INTO users_roles VALUES (461, 511, 3);
INSERT INTO users_roles VALUES (462, 549, 2);
INSERT INTO users_roles VALUES (463, 512, 3);
INSERT INTO users_roles VALUES (464, 513, 3);
INSERT INTO users_roles VALUES (465, 514, 3);
INSERT INTO users_roles VALUES (466, 515, 3);
INSERT INTO users_roles VALUES (467, 516, 3);
INSERT INTO users_roles VALUES (468, 518, 3);
INSERT INTO users_roles VALUES (469, 519, 3);
INSERT INTO users_roles VALUES (470, 520, 3);
INSERT INTO users_roles VALUES (471, 521, 3);
INSERT INTO users_roles VALUES (472, 522, 3);
INSERT INTO users_roles VALUES (473, 523, 3);
INSERT INTO users_roles VALUES (474, 524, 3);
INSERT INTO users_roles VALUES (475, 525, 3);
INSERT INTO users_roles VALUES (476, 580, 2);
INSERT INTO users_roles VALUES (477, 96, 2);
INSERT INTO users_roles VALUES (478, 526, 3);
INSERT INTO users_roles VALUES (479, 527, 3);
INSERT INTO users_roles VALUES (480, 528, 3);
INSERT INTO users_roles VALUES (481, 529, 3);
INSERT INTO users_roles VALUES (482, 530, 3);
INSERT INTO users_roles VALUES (483, 531, 3);
INSERT INTO users_roles VALUES (484, 532, 3);
INSERT INTO users_roles VALUES (485, 533, 3);
INSERT INTO users_roles VALUES (486, 534, 3);
INSERT INTO users_roles VALUES (487, 535, 3);
INSERT INTO users_roles VALUES (488, 536, 3);
INSERT INTO users_roles VALUES (489, 160, 2);
INSERT INTO users_roles VALUES (490, 537, 3);
INSERT INTO users_roles VALUES (491, 538, 3);
INSERT INTO users_roles VALUES (492, 548, 2);
INSERT INTO users_roles VALUES (493, 539, 3);
INSERT INTO users_roles VALUES (494, 542, 3);
INSERT INTO users_roles VALUES (495, 543, 3);
INSERT INTO users_roles VALUES (496, 544, 3);
INSERT INTO users_roles VALUES (497, 545, 2);
INSERT INTO users_roles VALUES (498, 546, 3);
INSERT INTO users_roles VALUES (499, 550, 3);
INSERT INTO users_roles VALUES (500, 551, 2);
INSERT INTO users_roles VALUES (501, 552, 3);
INSERT INTO users_roles VALUES (502, 553, 3);
INSERT INTO users_roles VALUES (503, 554, 3);
INSERT INTO users_roles VALUES (504, 555, 3);
INSERT INTO users_roles VALUES (505, 33, 2);
INSERT INTO users_roles VALUES (506, 556, 3);
INSERT INTO users_roles VALUES (507, 558, 3);
INSERT INTO users_roles VALUES (508, 559, 3);
INSERT INTO users_roles VALUES (509, 560, 3);
INSERT INTO users_roles VALUES (510, 561, 3);
INSERT INTO users_roles VALUES (511, 564, 3);
INSERT INTO users_roles VALUES (512, 612, 2);
INSERT INTO users_roles VALUES (513, 565, 3);
INSERT INTO users_roles VALUES (514, 567, 3);
INSERT INTO users_roles VALUES (515, 47, 2);
INSERT INTO users_roles VALUES (516, 568, 3);
INSERT INTO users_roles VALUES (517, 570, 3);
INSERT INTO users_roles VALUES (518, 571, 3);
INSERT INTO users_roles VALUES (519, 572, 3);
INSERT INTO users_roles VALUES (520, 573, 3);
INSERT INTO users_roles VALUES (521, 574, 3);
INSERT INTO users_roles VALUES (522, 575, 3);
INSERT INTO users_roles VALUES (523, 576, 3);
INSERT INTO users_roles VALUES (524, 220, 2);
INSERT INTO users_roles VALUES (525, 577, 3);
INSERT INTO users_roles VALUES (526, 581, 3);
INSERT INTO users_roles VALUES (527, 582, 3);
INSERT INTO users_roles VALUES (528, 583, 3);
INSERT INTO users_roles VALUES (529, 589, 3);
INSERT INTO users_roles VALUES (530, 590, 3);
INSERT INTO users_roles VALUES (531, 592, 3);
INSERT INTO users_roles VALUES (532, 593, 3);
INSERT INTO users_roles VALUES (533, 594, 3);
INSERT INTO users_roles VALUES (534, 595, 3);
INSERT INTO users_roles VALUES (535, 596, 3);
INSERT INTO users_roles VALUES (536, 597, 3);
INSERT INTO users_roles VALUES (537, 598, 3);
INSERT INTO users_roles VALUES (538, 599, 3);
INSERT INTO users_roles VALUES (539, 600, 3);
INSERT INTO users_roles VALUES (540, 601, 3);
INSERT INTO users_roles VALUES (541, 602, 3);
INSERT INTO users_roles VALUES (542, 603, 3);
INSERT INTO users_roles VALUES (543, 604, 3);
INSERT INTO users_roles VALUES (544, 605, 3);
INSERT INTO users_roles VALUES (545, 606, 3);
INSERT INTO users_roles VALUES (546, 607, 3);
INSERT INTO users_roles VALUES (547, 608, 3);
INSERT INTO users_roles VALUES (548, 609, 3);
INSERT INTO users_roles VALUES (549, 610, 3);
INSERT INTO users_roles VALUES (550, 611, 3);
INSERT INTO users_roles VALUES (551, 613, 3);
INSERT INTO users_roles VALUES (552, 614, 3);
INSERT INTO users_roles VALUES (553, 615, 3);
INSERT INTO users_roles VALUES (554, 616, 3);
INSERT INTO users_roles VALUES (555, 618, 3);
INSERT INTO users_roles VALUES (556, 619, 3);
INSERT INTO users_roles VALUES (557, 620, 3);
INSERT INTO users_roles VALUES (558, 397, 2);
INSERT INTO users_roles VALUES (559, 621, 3);
INSERT INTO users_roles VALUES (560, 622, 3);
INSERT INTO users_roles VALUES (561, 623, 3);
INSERT INTO users_roles VALUES (562, 625, 3);
INSERT INTO users_roles VALUES (563, 626, 3);
INSERT INTO users_roles VALUES (564, 627, 3);
INSERT INTO users_roles VALUES (565, 628, 3);
INSERT INTO users_roles VALUES (566, 629, 3);
INSERT INTO users_roles VALUES (567, 630, 3);
INSERT INTO users_roles VALUES (568, 632, 3);
INSERT INTO users_roles VALUES (569, 633, 3);
INSERT INTO users_roles VALUES (570, 634, 3);
INSERT INTO users_roles VALUES (571, 635, 3);
INSERT INTO users_roles VALUES (572, 636, 3);
INSERT INTO users_roles VALUES (573, 637, 3);
INSERT INTO users_roles VALUES (574, 638, 3);
INSERT INTO users_roles VALUES (575, 639, 3);
INSERT INTO users_roles VALUES (576, 640, 3);
INSERT INTO users_roles VALUES (577, 641, 3);
INSERT INTO users_roles VALUES (578, 642, 3);
INSERT INTO users_roles VALUES (579, 643, 3);
INSERT INTO users_roles VALUES (580, 644, 3);
INSERT INTO users_roles VALUES (581, 645, 3);
INSERT INTO users_roles VALUES (582, 646, 3);
INSERT INTO users_roles VALUES (583, 647, 3);
INSERT INTO users_roles VALUES (584, 648, 3);
INSERT INTO users_roles VALUES (585, 649, 3);
INSERT INTO users_roles VALUES (586, 650, 3);
INSERT INTO users_roles VALUES (587, 651, 3);
INSERT INTO users_roles VALUES (588, 652, 3);
INSERT INTO users_roles VALUES (589, 653, 3);
INSERT INTO users_roles VALUES (590, 654, 3);
INSERT INTO users_roles VALUES (591, 656, 3);
INSERT INTO users_roles VALUES (592, 657, 3);
INSERT INTO users_roles VALUES (593, 658, 3);
INSERT INTO users_roles VALUES (594, 659, 3);
INSERT INTO users_roles VALUES (595, 661, 3);
INSERT INTO users_roles VALUES (596, 662, 3);
INSERT INTO users_roles VALUES (597, 663, 3);
INSERT INTO users_roles VALUES (598, 664, 3);
INSERT INTO users_roles VALUES (599, 665, 3);
INSERT INTO users_roles VALUES (600, 666, 3);
INSERT INTO users_roles VALUES (601, 667, 3);
INSERT INTO users_roles VALUES (602, 668, 3);
INSERT INTO users_roles VALUES (603, 669, 3);
INSERT INTO users_roles VALUES (604, 671, 3);
INSERT INTO users_roles VALUES (605, 675, 3);
INSERT INTO users_roles VALUES (606, 676, 3);
INSERT INTO users_roles VALUES (607, 677, 3);
INSERT INTO users_roles VALUES (608, 678, 3);
INSERT INTO users_roles VALUES (609, 679, 3);
INSERT INTO users_roles VALUES (610, 680, 3);
INSERT INTO users_roles VALUES (611, 681, 3);
INSERT INTO users_roles VALUES (612, 682, 3);
INSERT INTO users_roles VALUES (613, 683, 3);
INSERT INTO users_roles VALUES (614, 684, 3);
INSERT INTO users_roles VALUES (615, 685, 3);
INSERT INTO users_roles VALUES (616, 686, 3);
INSERT INTO users_roles VALUES (617, 687, 3);
INSERT INTO users_roles VALUES (618, 688, 3);
INSERT INTO users_roles VALUES (619, 689, 3);
INSERT INTO users_roles VALUES (620, 691, 3);
INSERT INTO users_roles VALUES (621, 692, 3);
INSERT INTO users_roles VALUES (622, 693, 3);
INSERT INTO users_roles VALUES (623, 694, 3);
INSERT INTO users_roles VALUES (624, 695, 3);
INSERT INTO users_roles VALUES (625, 696, 3);
INSERT INTO users_roles VALUES (626, 697, 3);
INSERT INTO users_roles VALUES (627, 698, 3);
INSERT INTO users_roles VALUES (628, 699, 3);
INSERT INTO users_roles VALUES (629, 700, 3);
INSERT INTO users_roles VALUES (630, 701, 3);
INSERT INTO users_roles VALUES (631, 702, 3);
INSERT INTO users_roles VALUES (632, 703, 3);


--
-- Data for Name: wall_posters; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO wall_posters VALUES (1, '01 Test2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2007-03-20', '2007-04-25', NULL, NULL, NULL, NULL, NULL, '2007-04-21 00:19:04', NULL, NULL, false, false, false, NULL, 2);
INSERT INTO wall_posters VALUES (2, NULL, NULL, NULL, NULL, '02 Test2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2007-03-20', '2007-03-25', 'Oznam nepodlieha kriteriam nastenky', '2007-04-21 00:21:03', NULL, '2007-04-23 17:50:24', true, true, false, 'a', 2);
INSERT INTO wall_posters VALUES (3, NULL, NULL, NULL, NULL, '03 Test3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2007-03-20', '2007-03-25', NULL, '2007-04-21 00:24:15', NULL, NULL, true, false, false, 'a', 3);
INSERT INTO wall_posters VALUES (4, NULL, NULL, NULL, NULL, '04 Test2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2007-03-20', '2007-05-25', NULL, '2007-04-21 00:21:03', NULL, '2007-04-21 09:21:03', true, true, false, 'a', 2);
INSERT INTO wall_posters VALUES (5, '05 Test3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2007-03-20', '2007-04-25', NULL, NULL, NULL, NULL, NULL, '2007-04-21 00:21:03', NULL, NULL, false, false, false, NULL, 3);
INSERT INTO wall_posters VALUES (6, NULL, NULL, NULL, NULL, '06 Test2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2007-03-20', '2007-04-25', NULL, '2007-04-21 00:24:15', NULL, NULL, true, false, false, 'a', 2);
INSERT INTO wall_posters VALUES (7, '07 Test2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2007-03-20', '2007-04-25', NULL, NULL, NULL, NULL, NULL, '2007-04-21 00:24:15', NULL, NULL, false, false, false, NULL, 2);
INSERT INTO wall_posters VALUES (8, '08 Test2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2007-02-20', '2007-05-25', NULL, NULL, NULL, NULL, NULL, '2007-04-22 22:04:35', NULL, NULL, false, false, false, NULL, 2);
INSERT INTO wall_posters VALUES (9, '09 Test3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2007-02-20', '2007-05-25', NULL, NULL, NULL, NULL, NULL, '2007-04-22 22:05:40', NULL, NULL, false, false, false, NULL, 3);


--
-- Name: academic_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY academics
    ADD CONSTRAINT academic_pkey PRIMARY KEY (id);


--
-- Name: clearances_key_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY clearances
    ADD CONSTRAINT clearances_key_key UNIQUE ("key");


--
-- Name: clearances_name_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY clearances
    ADD CONSTRAINT clearances_name_key UNIQUE (name);


--
-- Name: clearances_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY clearances
    ADD CONSTRAINT clearances_pkey PRIMARY KEY (id);


--
-- Name: graduate_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY graduates
    ADD CONSTRAINT graduate_pkey PRIMARY KEY (id);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: levels_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);


--
-- Name: login_history_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY login_history
    ADD CONSTRAINT login_history_pkey PRIMARY KEY (id);


--
-- Name: mail_address_groups_mail_id_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY mail_address_groups
    ADD CONSTRAINT mail_address_groups_mail_id_key UNIQUE (mail_id, mail_group_id);


--
-- Name: mail_address_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY mail_address_groups
    ADD CONSTRAINT mail_address_groups_pkey PRIMARY KEY (id);


--
-- Name: mail_address_users_mail_id_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY mail_address_users
    ADD CONSTRAINT mail_address_users_mail_id_key UNIQUE (mail_id, user_id);


--
-- Name: mail_address_users_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY mail_address_users
    ADD CONSTRAINT mail_address_users_pkey PRIMARY KEY (id);


--
-- Name: mail_group_users_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY mail_group_users
    ADD CONSTRAINT mail_group_users_pkey PRIMARY KEY (id);


--
-- Name: mail_group_users_user_id_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY mail_group_users
    ADD CONSTRAINT mail_group_users_user_id_key UNIQUE (user_id, mail_group_id);


--
-- Name: mail_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY mail_groups
    ADD CONSTRAINT mail_groups_pkey PRIMARY KEY (id);


--
-- Name: mails_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY mails
    ADD CONSTRAINT mails_pkey PRIMARY KEY (id);


--
-- Name: news_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: professions_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY professions
    ADD CONSTRAINT professions_pkey PRIMARY KEY (id);


--
-- Name: project_types_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY project_types
    ADD CONSTRAINT project_types_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: roles_clearances_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY roles_clearances
    ADD CONSTRAINT roles_clearances_pkey PRIMARY KEY (id);


--
-- Name: roles_clearances_role_id_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY roles_clearances
    ADD CONSTRAINT roles_clearances_role_id_key UNIQUE (role_id, clearance_id);


--
-- Name: roles_name_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: specializations_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY specializations
    ADD CONSTRAINT specializations_pkey PRIMARY KEY (id);


--
-- Name: study_types_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY study_types
    ADD CONSTRAINT study_types_pkey PRIMARY KEY (id);


--
-- Name: user_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY user_languages
    ADD CONSTRAINT user_languages_pkey PRIMARY KEY (id);


--
-- Name: user_mail_states_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY user_mail_states
    ADD CONSTRAINT user_mail_states_pkey PRIMARY KEY (id);


--
-- Name: user_mails_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY user_mails
    ADD CONSTRAINT user_mails_pkey PRIMARY KEY (id);


--
-- Name: user_mails_user_id_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY user_mails
    ADD CONSTRAINT user_mails_user_id_key UNIQUE (user_id, mail_id);


--
-- Name: user_professions_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY user_professions
    ADD CONSTRAINT user_professions_pkey PRIMARY KEY (id);


--
-- Name: users_clearances_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY users_clearances
    ADD CONSTRAINT users_clearances_pkey PRIMARY KEY (id);


--
-- Name: users_clearances_user_id_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY users_clearances
    ADD CONSTRAINT users_clearances_user_id_key UNIQUE (user_id, clearance_id);


--
-- Name: users_online_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY users_online
    ADD CONSTRAINT users_online_pkey PRIMARY KEY (id);


--
-- Name: users_online_session_id_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY users_online
    ADD CONSTRAINT users_online_session_id_key UNIQUE (session_id);


--
-- Name: users_personal_number_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_personal_number_key UNIQUE (personal_number);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (id);


--
-- Name: users_roles_user_id_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_user_id_key UNIQUE (user_id, role_id);


--
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: wall_posters_pkey; Type: CONSTRAINT; Schema: public; Owner: team14; Tablespace: 
--

ALTER TABLE ONLY wall_posters
    ADD CONSTRAINT wall_posters_pkey PRIMARY KEY (id);


--
-- Name: academic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY academics
    ADD CONSTRAINT academic_id_fkey FOREIGN KEY (id) REFERENCES users(id);


--
-- Name: clearances_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY clearances
    ADD CONSTRAINT clearances_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES clearances(id);


--
-- Name: graduate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY graduates
    ADD CONSTRAINT graduate_id_fkey FOREIGN KEY (id) REFERENCES users(id);


--
-- Name: graduates_specialization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY graduates
    ADD CONSTRAINT graduates_specialization_id_fkey FOREIGN KEY (specialization_id) REFERENCES specializations(id);


--
-- Name: login_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY login_history
    ADD CONSTRAINT login_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mail_address_groups_mail_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY mail_address_groups
    ADD CONSTRAINT mail_address_groups_mail_group_id_fkey FOREIGN KEY (mail_group_id) REFERENCES mail_groups(id);


--
-- Name: mail_address_groups_mail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY mail_address_groups
    ADD CONSTRAINT mail_address_groups_mail_id_fkey FOREIGN KEY (mail_id) REFERENCES mails(id);


--
-- Name: mail_address_users_mail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY mail_address_users
    ADD CONSTRAINT mail_address_users_mail_id_fkey FOREIGN KEY (mail_id) REFERENCES mails(id);


--
-- Name: mail_address_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY mail_address_users
    ADD CONSTRAINT mail_address_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: mail_group_users_mail_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY mail_group_users
    ADD CONSTRAINT mail_group_users_mail_group_id_fkey FOREIGN KEY (mail_group_id) REFERENCES mail_groups(id);


--
-- Name: mail_group_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY mail_group_users
    ADD CONSTRAINT mail_group_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: mail_groups_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY mail_groups
    ADD CONSTRAINT mail_groups_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: mails_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY mails
    ADD CONSTRAINT mails_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: news_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: projects_academic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_academic_id_fkey FOREIGN KEY (academic_id) REFERENCES academics(id);


--
-- Name: projects_graduate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_graduate_id_fkey FOREIGN KEY (graduate_id) REFERENCES graduates(id);


--
-- Name: projects_master_academic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_master_academic_id_fkey FOREIGN KEY (master_academic_id) REFERENCES academics(id);


--
-- Name: projects_project_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_project_type_id_fkey FOREIGN KEY (project_type_id) REFERENCES project_types(id);


--
-- Name: projects_specialization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_specialization_id_fkey FOREIGN KEY (specialization_id) REFERENCES specializations(id);


--
-- Name: roles_clearances_clearance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY roles_clearances
    ADD CONSTRAINT roles_clearances_clearance_id_fkey FOREIGN KEY (clearance_id) REFERENCES clearances(id);


--
-- Name: roles_clearances_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY roles_clearances
    ADD CONSTRAINT roles_clearances_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: specializations_study_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY specializations
    ADD CONSTRAINT specializations_study_type_id_fkey FOREIGN KEY (study_type_id) REFERENCES study_types(id);


--
-- Name: user_mails_mail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY user_mails
    ADD CONSTRAINT user_mails_mail_id_fkey FOREIGN KEY (mail_id) REFERENCES mails(id);


--
-- Name: user_mails_mail_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY user_mails
    ADD CONSTRAINT user_mails_mail_status_id_fkey FOREIGN KEY (user_mail_state_id) REFERENCES user_mail_states(id);


--
-- Name: user_mails_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY user_mails
    ADD CONSTRAINT user_mails_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: users_clearances_clearance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY users_clearances
    ADD CONSTRAINT users_clearances_clearance_id_fkey FOREIGN KEY (clearance_id) REFERENCES clearances(id);


--
-- Name: users_clearances_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY users_clearances
    ADD CONSTRAINT users_clearances_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: users_online_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY users_online
    ADD CONSTRAINT users_online_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: users_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: users_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: team14
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--



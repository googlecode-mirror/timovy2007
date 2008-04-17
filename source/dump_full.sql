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
INSERT INTO clearances VALUES (8, 'MANAGE_NEWS', 'Actualities management', 'Manazovanie aktualĂ­t', NULL);


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

INSERT INTO news VALUES (1, 'Testing - Vitajte na naĹˇej strĂˇnke', 'Testing - Welcome to our page', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque mollis, magna et laoreet dignissim, risus tellus interdum est, a varius felis nisi ut sapien. Phasellus eget nunc in mi consectetuer molestie. Fusce tempor, odio eu blandit imperdiet, lorem libero bibendum risus, a malesuada tellus lacus id est. Mauris eu ligula nec risus mollis accumsan. Praesent fermentum sapien sit amet tellus. Proin ac elit at pede mollis molestie. Mauris euismod, lectus in condimentum dapibus, velit nisi pellentesque nibh, et faucibus ligula dolor vitae lectus. Curabitur malesuada. In feugiat lorem quis tortor. Nulla nec quam. Ut nec nibh. Sed nibh lacus, tristique vitae, commodo faucibus, vulputate at, quam. Vestibulum et quam. Pellentesque porttitor vehicula tellus. Pellentesque eleifend venenatis mi.</p><p>Integer sem sapien, fringilla sed, volutpat ut, iaculis in, augue. Integer convallis. Proin pede turpis, consectetuer ut, convallis id, molestie ac, ligula. Aenean gravida nulla vitae nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec varius lobortis diam. Donec neque eros, vulputate quis, aliquam vel, scelerisque vel, felis. Ut scelerisque pede ac urna. Nulla et metus vel risus tincidunt blandit. In hac habitasse platea dictumst. Etiam viverra enim vel turpis. Donec purus tortor, mattis sed, consequat quis, cursus sit amet, massa. Morbi a nulla ac lectus ultricies congue. Nam commodo luctus nulla. Duis volutpat. Phasellus porttitor ligula in turpis. Sed bibendum ipsum id mauris.</p>', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque mollis, magna et laoreet dignissim, risus tellus interdum est, a varius felis nisi ut sapien. Phasellus eget nunc in mi consectetuer molestie. Fusce tempor, odio eu blandit imperdiet, lorem libero bibendum risus, a malesuada tellus lacus id est. Mauris eu ligula nec risus mollis accumsan. Praesent fermentum sapien sit amet tellus. Proin ac elit at pede mollis molestie. Mauris euismod, lectus in condimentum dapibus, velit nisi pellentesque nibh, et faucibus ligula dolor vitae lectus. Curabitur malesuada. In feugiat lorem quis tortor. Nulla nec quam. Ut nec nibh. Sed nibh lacus, tristique vitae, commodo faucibus, vulputate at, quam. Vestibulum et quam. Pellentesque porttitor vehicula tellus. Pellentesque eleifend venenatis mi.</p><p>Integer sem sapien, fringilla sed, volutpat ut, iaculis in, augue. Integer convallis. Proin pede turpis, consectetuer ut, convallis id, molestie ac, ligula. Aenean gravida nulla vitae nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec varius lobortis diam. Donec neque eros, vulputate quis, aliquam vel, scelerisque vel, felis. Ut scelerisque pede ac urna. Nulla et metus vel risus tincidunt blandit. In hac habitasse platea dictumst. Etiam viverra enim vel turpis. Donec purus tortor, mattis sed, consequat quis, cursus sit amet, massa. Morbi a nulla ac lectus ultricies congue. Nam commodo luctus nulla. Duis volutpat. Phasellus porttitor ligula in turpis. Sed bibendum ipsum id mauris.</p>', '2001-01-11', '2001-01-01', 1);


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

INSERT INTO project_types VALUES ('DP', 'DiplomovĂ˝ projekt', 'Diplom project');
INSERT INTO project_types VALUES ('ZP', 'BakalĂˇrsky projekt', 'Bachelor project');


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO projects VALUES (1, 'ZP', 563, NULL, 5, '2005/2006', 'ExperimentĂˇlny mikropoÄŤĂ­taÄŤ', 'ExperimentĂˇlny mikropoÄŤĂ­taÄŤ', 'Navrhnite a zrealizujte experimentĂˇlny mikropoÄŤĂ­taÄŤ na bĂˇze jednoÄŤipovĂ©ho mikropoÄŤĂ­taÄŤa 80C552 s nasledovnĂ˝mi poĹľiadavkami:  
kompatibilita s MPS51/52/552,
8-bitovĂ˝ vstupnĂ˝ port so spĂ­naÄŤmi a 8-bitovĂ˝ vĂ˝stupnĂ˝ port s indikĂˇciou,
generovanie externĂ˝ch ĹľiadostĂ­ o preruĹˇenie tlaÄŤidlami,
6-miestny numerickĂ˝ displej,
10-bitovĂ˝ A/D prevodnĂ­k,
8-bitovĂ˝ prevodnĂ­k s PWM,
podpora pripojenia monitorovacej jednotky,
sada testovacĂ­ch programov.
', 'Navrhnite a zrealizujte experimentĂˇlny mikropoÄŤĂ­taÄŤ na bĂˇze jednoÄŤipovĂ©ho mikropoÄŤĂ­taÄŤa 80C552 s nasledovnĂ˝mi poĹľiadavkami:  
kompatibilita s MPS51/52/552,
8-bitovĂ˝ vstupnĂ˝ port so spĂ­naÄŤmi a 8-bitovĂ˝ vĂ˝stupnĂ˝ port s indikĂˇciou,
generovanie externĂ˝ch ĹľiadostĂ­ o preruĹˇenie tlaÄŤidlami,
6-miestny numerickĂ˝ displej,
10-bitovĂ˝ A/D prevodnĂ­k,
8-bitovĂ˝ prevodnĂ­k s PWM,
podpora pripojenia monitorovacej jednotky,
sada testovacĂ­ch programov.
', 0);
INSERT INTO projects VALUES (2, 'DP', 24, NULL, 7, '2005/2006', 'Zhlukovanie a klasifikĂˇcia textovĂ˝ch dokumentov', 'Zhlukovanie a klasifikĂˇcia textovĂ˝ch dokumentov', NULL, NULL, 4);
INSERT INTO projects VALUES (3, 'ZP', 17, NULL, 8, '2004/2005', 'Editor tvorby algoritmov â€“ prĂˇca s reĹĄazcami', 'Editor for the creation of algorithms â€“ working with strings', 'Analyzujte problĂ©m tvorby algoritmu resp. programu ako skladanie predpripravenĂ˝ch modulov. JednotlivĂ© moduly nech obsahujĂş vybranĂ© algoritmickĂ© a programovĂ© (jazykovĂ©) konĹˇtrukcie. ProblĂ©movo sa orientujte na vybranĂş oblasĹĄ. Navrhnite a implementujte aplikĂˇciu, ktorĂˇ by podporovala takĂ˝to modulĂˇrny prĂ­stup. AplikĂˇcia by mala podporovaĹĄ celĂ˝ ĹľivotnĂ˝ cyklus tvorby programov', 'Analyzujte problĂ©m tvorby algoritmu resp. programu ako skladanie predpripravenĂ˝ch modulov. JednotlivĂ© moduly nech obsahujĂş vybranĂ© algoritmickĂ© a programovĂ© (jazykovĂ©) konĹˇtrukcie. ProblĂ©movo sa orientujte na vybranĂş oblasĹĄ. Navrhnite a implementujte aplikĂˇciu, ktorĂˇ by podporovala takĂ˝to modulĂˇrny prĂ­stup. AplikĂˇcia by mala podporovaĹĄ celĂ˝ ĹľivotnĂ˝ cyklus tvorby programov', 1);
INSERT INTO projects VALUES (4, 'DP', 660, NULL, 8, '2005/2006', 'PrezentĂˇcia vedomostĂ­ v adaptĂ­vnom webovom systĂ©me', 'PrezentĂˇcia vedomostĂ­ v adaptĂ­vnom webovom systĂ©me', NULL, NULL, 4);
INSERT INTO projects VALUES (5, 'ZP', 358, NULL, 9, '2004/2005', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Testing the Security Weaknesses of Computer Networks', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş testovaĹĄ vybratĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş testovaĹĄ vybratĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.', 0);
INSERT INTO projects VALUES (6, 'DP', 674, NULL, 9, '2005/2006', 'InteraktĂ­vna kolaboratĂ­vna trojrozmernĂˇ vizualizĂˇcia modelov a dĂˇt', 'InteraktĂ­vna kolaboratĂ­vna trojrozmernĂˇ vizualizĂˇcia modelov a dĂˇt', NULL, NULL, 4);
INSERT INTO projects VALUES (7, 'ZP', 40, NULL, 14, '2005/2006', 'Objektovo relaÄŤnĂ© mapre pre jazyk C#', 'Objektovo relaÄŤnĂ© mapre pre jazyk C#', 'NaĹˇtudujte princĂ­py a charakteristiky Objektovo-RelaÄŤnĂ˝ch maprov vo vĹˇeobecnosti. Analyzujte existujĂşce Oâ€“R mapre pre programovacĂ­ jazyk C#. NaĹˇtudujte podrobnosti pre Vami vybranĂ© O-R mapre (min. 2) pre jazyk C#. S vyuĹľitĂ­m vybranĂ˝ch O-R maprov vytvorte jednoduchĂş databĂˇzovĂş aplikĂˇciu, resp. aplikĂˇcie na spoloÄŤnom zĂˇklade. VybranĂ© mapre porovnajte s vyuĹľitĂ­m osobnĂ˝ch skĂşsenostĂ­ zĂ­skanĂ˝ch pri vytvĂˇranĂ­ aplikĂˇcie/aplikĂˇciĂ­.', 'NaĹˇtudujte princĂ­py a charakteristiky Objektovo-RelaÄŤnĂ˝ch maprov vo vĹˇeobecnosti. Analyzujte existujĂşce Oâ€“R mapre pre programovacĂ­ jazyk C#. NaĹˇtudujte podrobnosti pre Vami vybranĂ© O-R mapre (min. 2) pre jazyk C#. S vyuĹľitĂ­m vybranĂ˝ch O-R maprov vytvorte jednoduchĂş databĂˇzovĂş aplikĂˇciu, resp. aplikĂˇcie na spoloÄŤnom zĂˇklade. VybranĂ© mapre porovnajte s vyuĹľitĂ­m osobnĂ˝ch skĂşsenostĂ­ zĂ­skanĂ˝ch pri vytvĂˇranĂ­ aplikĂˇcie/aplikĂˇciĂ­.', 1);
INSERT INTO projects VALUES (8, 'DP', 360, NULL, 18, '2005/2006', 'OptimĂˇlne kĂłdovanie stavov synchrĂłnnych sekvenÄŤnĂ˝ch obvodov', 'OptimĂˇlne kĂłdovanie stavov synchrĂłnnych sekvenÄŤnĂ˝ch obvodov', NULL, NULL, 0);
INSERT INTO projects VALUES (9, 'ZP', 579, NULL, 18, '2003/2004', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS â€“ 2', 'Multimedia information in regional IS - 2', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie existujĂşceho zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb KIVT.', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie existujĂşceho zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb KIVT.', 1);
INSERT INTO projects VALUES (10, 'ZP', 674, NULL, 21, '2005/2006', 'VĂ˝voj sprĂˇvania sa hrĂˇÄŤov v tĂ­movej hre proti statickĂ©mu sĂşperovi', 'VĂ˝voj sprĂˇvania sa hrĂˇÄŤov v tĂ­movej hre proti statickĂ©mu sĂşperovi', 'Predpokladajme model futbalovej hry, v ktorej hrajĂş proti sebe dva tĂ­my softvĂ©rovĂ˝ch agentov. SprĂˇvanie kaĹľdĂ©ho hrĂˇÄŤa je modelovanĂ© pomocou automatu, na zĂˇklade ktorĂ©ho sa rozhoduje, akĂş akciu vykonĂˇ agent v danej situĂˇcii. Navrhnite a implementuje spĂ´sob, na zĂˇklade ktorĂ©ho bude moĹľnĂ© nahradzovaĹĄ doterajĹˇĂ­ model sprĂˇvania sa hrĂˇÄŤa novĂ˝m lepĹˇĂ­m modelom. Predpokladajte, Ĺľe sĂş znĂˇme statickĂ© (t.j. nevyvĂ­jajĂşce sa) modely sprĂˇvania sa sĂşperov poÄŤas hry. Svoje rieĹˇenie porovnajte s niektorĂ˝mi inĂ˝mi uĹľ existujĂşcimi rieĹˇeniami a zaraÄŹte ho do kontextu suÄŤasnĂ©ho stavu v oblasti modelovania tĂ­movĂ˝ch hier.', 'Predpokladajme model futbalovej hry, v ktorej hrajĂş proti sebe dva tĂ­my softvĂ©rovĂ˝ch agentov. SprĂˇvanie kaĹľdĂ©ho hrĂˇÄŤa je modelovanĂ© pomocou automatu, na zĂˇklade ktorĂ©ho sa rozhoduje, akĂş akciu vykonĂˇ agent v danej situĂˇcii. Navrhnite a implementuje spĂ´sob, na zĂˇklade ktorĂ©ho bude moĹľnĂ© nahradzovaĹĄ doterajĹˇĂ­ model sprĂˇvania sa hrĂˇÄŤa novĂ˝m lepĹˇĂ­m modelom. Predpokladajte, Ĺľe sĂş znĂˇme statickĂ© (t.j. nevyvĂ­jajĂşce sa) modely sprĂˇvania sa sĂşperov poÄŤas hry. Svoje rieĹˇenie porovnajte s niektorĂ˝mi inĂ˝mi uĹľ existujĂşcimi rieĹˇeniami a zaraÄŹte ho do kontextu suÄŤasnĂ©ho stavu v oblasti modelovania tĂ­movĂ˝ch hier.', 1);
INSERT INTO projects VALUES (11, 'ZP', 541, NULL, 22, '2005/2006', 'Model pouĹľĂ­vateÄľa pre jeho identifikĂˇciu', 'Model pouĹľĂ­vateÄľa pre jeho identifikĂˇciu', 'Navrhnite metĂłdy a prostriedky pre budovanie modelu pouĹľĂ­vateÄľa na zĂˇklade jeho charakteristĂ­k sprĂˇvania sa v poÄŤĂ­taÄŤovom systĂ©me. NavrhnutĂ˝ systĂ©m implementujte vo vybranom prostredĂ­. SystĂ©m mĂˇ slĂşĹľiĹĄ na potvrdenie identifikĂˇcie pouĹľĂ­vateÄľa za ĂşÄŤelom zvĂ˝Ĺˇenia bezpeÄŤnosti prevĂˇdzky informaÄŤnĂ˝ch systĂ©mov.', 'Navrhnite metĂłdy a prostriedky pre budovanie modelu pouĹľĂ­vateÄľa na zĂˇklade jeho charakteristĂ­k sprĂˇvania sa v poÄŤĂ­taÄŤovom systĂ©me. NavrhnutĂ˝ systĂ©m implementujte vo vybranom prostredĂ­. SystĂ©m mĂˇ slĂşĹľiĹĄ na potvrdenie identifikĂˇcie pouĹľĂ­vateÄľa za ĂşÄŤelom zvĂ˝Ĺˇenia bezpeÄŤnosti prevĂˇdzky informaÄŤnĂ˝ch systĂ©mov.', 1);
INSERT INTO projects VALUES (12, 'ZP', 655, NULL, 28, '2005/2006', 'WebovĂ˝ portĂˇl pre sprĂˇvu ĹˇtudentskĂ˝ch projetkov', 'WebovĂ˝ portĂˇl pre sprĂˇvu ĹˇtudentskĂ˝ch projetkov', 'Analyzujte problematiku podpory zadĂˇvania a odovzdĂˇvania ĹˇtudentskĂ˝ch projektov na fakulte. Navrhnite a implementujte systĂ©m - webovskĂş aplikĂˇciu, ktorĂˇ by umoĹľnila pedagĂłgom zadĂˇvaĹĄ tĂ©my projektov a Ĺˇtudentom prihlasovaĹĄ sa na vypĂ­sanĂ© tĂ©my. AplikĂˇciu je moĹľnĂ© rozĹˇĂ­riĹĄ naprĂ­klad aj o zadĂˇvanie hodnotenĂ­ posudkov a pod. VytvorenĂ˝ systĂ©m naplĹte Ăşdajmi z uĹľ existujĂşcich systĂ©mov vyuĹľĂ­vanĂ˝ch na fakulte. VzhÄľadom k rozsahu projektu a aj predpokladu nasadania v reĂˇlnom prostredĂ­ vyĹľadujĂş sa znalosti uchĂˇdzaÄŤov z oblasti vĂ˝voja webovskĂ˝ch aplikĂˇciĂ­ (naprĂ­klad Postgres / PHP, JSP a pod.).', 'Analyzujte problematiku podpory zadĂˇvania a odovzdĂˇvania ĹˇtudentskĂ˝ch projektov na fakulte. Navrhnite a implementujte systĂ©m - webovskĂş aplikĂˇciu, ktorĂˇ by umoĹľnila pedagĂłgom zadĂˇvaĹĄ tĂ©my projektov a Ĺˇtudentom prihlasovaĹĄ sa na vypĂ­sanĂ© tĂ©my. AplikĂˇciu je moĹľnĂ© rozĹˇĂ­riĹĄ naprĂ­klad aj o zadĂˇvanie hodnotenĂ­ posudkov a pod. VytvorenĂ˝ systĂ©m naplĹte Ăşdajmi z uĹľ existujĂşcich systĂ©mov vyuĹľĂ­vanĂ˝ch na fakulte. VzhÄľadom k rozsahu projektu a aj predpokladu nasadania v reĂˇlnom prostredĂ­ vyĹľadujĂş sa znalosti uchĂˇdzaÄŤov z oblasti vĂ˝voja webovskĂ˝ch aplikĂˇciĂ­ (naprĂ­klad Postgres / PHP, JSP a pod.).', 1);
INSERT INTO projects VALUES (13, 'ZP', 301, NULL, 29, '2005/2006', 'NĂˇvrh a implementĂˇcia algoritmu pre funkÄŤnĂ˝ generĂˇtor testov  VLSI obvodov', 'NĂˇvrh a implementĂˇcia algoritmu pre funkÄŤnĂ˝ generĂˇtor testov  VLSI obvodov', 'Analyzujte metĂłdy a spĂ´soby generovania funkÄŤnĂ˝ch testov, navrhnite a  realizujte vybranĂ© moduly algoritmu pre systĂ©m generovania  funkÄŤnĂ˝ch testov vnorenĂ˝ch systĂ©mov, ktorĂ˝ zostavuje funkÄŤnĂ© testy na zĂˇklade opisu obvodu v istom ĹˇpecifikaÄŤnom jazyku (VHDL). Algoritmus implementujte a vytvorte grafickĂ© uĹľĂ­vateÄľskĂ© rozhranie. FunkÄŤnosĹĄ implementovanĂ©ho algoritmu a vyhodnotenie ĂşÄŤinnosti generovanĂ˝ch testovacĂ­ch mixov overte na prĂ­kladoch. ', 'Analyzujte metĂłdy a spĂ´soby generovania funkÄŤnĂ˝ch testov, navrhnite a  realizujte vybranĂ© moduly algoritmu pre systĂ©m generovania  funkÄŤnĂ˝ch testov vnorenĂ˝ch systĂ©mov, ktorĂ˝ zostavuje funkÄŤnĂ© testy na zĂˇklade opisu obvodu v istom ĹˇpecifikaÄŤnom jazyku (VHDL). Algoritmus implementujte a vytvorte grafickĂ© uĹľĂ­vateÄľskĂ© rozhranie. FunkÄŤnosĹĄ implementovanĂ©ho algoritmu a vyhodnotenie ĂşÄŤinnosti generovanĂ˝ch testovacĂ­ch mixov overte na prĂ­kladoch. ', 0);
INSERT INTO projects VALUES (14, 'ZP', 579, NULL, 30, '2005/2006', 'SystĂ©m pre sprĂˇvu webovĂ˝ch strĂˇnok - pouĹľĂ­vateÄľ', 'SystĂ©m pre sprĂˇvu webovĂ˝ch strĂˇnok - pouĹľĂ­vateÄľ', 'CieÄľom projektu je vytvorenie prostredia, ktorĂ© umoĹľnĂ­ spravovanie webovĂ˝ch strĂˇnok. Analyzujte existujĂşce systĂ©my podobnĂ©ho charakteru z pohÄľadu pouĹľĂ­vateÄľov a vlastnostĂ­ prostredia, v ktorom bude vytvĂˇranĂ˝ systĂ©m.  Navrhnite ĹˇtruktĂşru pouĹľitej databĂˇzy, ĹˇtruktĂşru obrazoviek pre pouĹľĂ­vateÄľov, grafickĂ© prvky a ĹˇtĂ˝ly. NĂˇsledne implementujte kÄľĂşÄŤovĂ© ÄŤasti systĂ©mu a pouĹľiteÄľnosĹĄ overte na vybranej mnoĹľine strĂˇnok pouĹľĂ­vanĂ˝ch v pedagogike FIIT.
', 'CieÄľom projektu je vytvorenie prostredia, ktorĂ© umoĹľnĂ­ spravovanie webovĂ˝ch strĂˇnok. Analyzujte existujĂşce systĂ©my podobnĂ©ho charakteru z pohÄľadu pouĹľĂ­vateÄľov a vlastnostĂ­ prostredia, v ktorom bude vytvĂˇranĂ˝ systĂ©m.  Navrhnite ĹˇtruktĂşru pouĹľitej databĂˇzy, ĹˇtruktĂşru obrazoviek pre pouĹľĂ­vateÄľov, grafickĂ© prvky a ĹˇtĂ˝ly. NĂˇsledne implementujte kÄľĂşÄŤovĂ© ÄŤasti systĂ©mu a pouĹľiteÄľnosĹĄ overte na vybranej mnoĹľine strĂˇnok pouĹľĂ­vanĂ˝ch v pedagogike FIIT.
', 1);
INSERT INTO projects VALUES (15, 'ZP', 13, 431, 32, '2004/2005', 'PriebeĹľnĂˇ diagnostika a nĂˇvrh kontrolĂłrov ', 'Online diagnostics and designing of checkers', 'PreĹˇtudujte metodiky priebeĹľnej diagnostiky, nĂˇvrhy kontrolĂłrov pre digitĂˇlne obvody. OpĂ­Ĺˇte ich funkÄŤnost vo VHDL. Navrhnite systĂ©m pre automatickĂş syntĂ©zu vybranĂ˝ch blokov priebeĹľnej diagnostiky k obvodom modelovanĂ˝m vo VHDL. SystĂ©m implementujte v jazyku JAVA, funkÄŤnosĹĄ overte na prĂ­kladoch. ', 'PreĹˇtudujte metodiky priebeĹľnej diagnostiky, nĂˇvrhy kontrolĂłrov pre digitĂˇlne obvody. OpĂ­Ĺˇte ich funkÄŤnost vo VHDL. Navrhnite systĂ©m pre automatickĂş syntĂ©zu vybranĂ˝ch blokov priebeĹľnej diagnostiky k obvodom modelovanĂ˝m vo VHDL. SystĂ©m implementujte v jazyku JAVA, funkÄŤnosĹĄ overte na prĂ­kladoch. ', 0);
INSERT INTO projects VALUES (16, 'DP', 431, NULL, 32, '2005/2006', 'SimulĂˇtor jazyka VHDL', 'SimulĂˇtor jazyka VHDL', NULL, NULL, 0);
INSERT INTO projects VALUES (17, 'DP', 375, NULL, 34, '2005/2006', 'Meranie  a vyhodnocovanie parametrov kvality sluĹľieb v TCP/IP sieĹĄach', 'Meranie  a vyhodnocovanie parametrov kvality sluĹľieb v TCP/IP sieĹĄach', NULL, NULL, 0);
INSERT INTO projects VALUES (18, 'ZP', 359, NULL, 34, '2004/2005', 'VĂ˝uÄŤbovĂ˝ systĂ©m pre vizualizĂˇciu bezpeÄŤnosti Ăşdajov.', 'Educational system for visualization of data security', 'Analyzujte z pohÄľadu bezpeÄŤnosti Ăşdajov a funknÄŤosti technolĂłgie poÄŤĂ­taÄŤovĂ˝ch sietĂ­ (router, switch, hub, wifi ... ) na bĂˇze protokolu TCP/IP so zameranim na LAN.
Analyzujte moĹľnosti multimediĂˇlnej prezentĂˇcie informĂˇciĂ­ (napr. flash).
Navrhnite a implementujte vĂ˝uÄŤbovĂ˝ systĂ©m pre prezentĂˇciu informĂˇciĂ­ o bezpeÄŤnosti Ăşdajov jednotlivych protokolov aplikaÄŤnej vrstvy.
', 'Analyzujte z pohÄľadu bezpeÄŤnosti Ăşdajov a funknÄŤosti technolĂłgie poÄŤĂ­taÄŤovĂ˝ch sietĂ­ (router, switch, hub, wifi ... ) na bĂˇze protokolu TCP/IP so zameranim na LAN.
Analyzujte moĹľnosti multimediĂˇlnej prezentĂˇcie informĂˇciĂ­ (napr. flash).
Navrhnite a implementujte vĂ˝uÄŤbovĂ˝ systĂ©m pre prezentĂˇciu informĂˇciĂ­ o bezpeÄŤnosti Ăşdajov jednotlivych protokolov aplikaÄŤnej vrstvy.
', 0);
INSERT INTO projects VALUES (19, 'ZP', 361, NULL, 37, '2004/2005', 'ProblĂ©movĂˇ ĹˇtĂşdia mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM)', 'Situation study of mobile computing system (GSM) ', 'Analyzujte problematiku sĂşÄŤasnĂ©ho  stavu v oblasti technickej ÄŤasti mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM).
Urobte ĹˇtrukturĂˇlnu analĂ˝zu architektĂşry GSM siete (mobile station, base station subsystem, network subsystem). Navrhnite a implementujte rĂˇdio-komunikaÄŤnĂ© aspekty  mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM).
', 'Analyzujte problematiku sĂşÄŤasnĂ©ho  stavu v oblasti technickej ÄŤasti mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM).
Urobte ĹˇtrukturĂˇlnu analĂ˝zu architektĂşry GSM siete (mobile station, base station subsystem, network subsystem). Navrhnite a implementujte rĂˇdio-komunikaÄŤnĂ© aspekty  mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM).
', 0);
INSERT INTO projects VALUES (20, 'DP', 359, NULL, 37, '2005/2006', 'ProgramovĂˇ podpora simulĂˇcie vybranĂ˝ch kombinovanĂ˝ch ARQ metĂłd.', 'ProgramovĂˇ podpora simulĂˇcie vybranĂ˝ch kombinovanĂ˝ch ARQ metĂłd.', NULL, NULL, 0);
INSERT INTO projects VALUES (21, 'DP', 382, NULL, 38, '2005/2006', 'Klastrovanie mravcami', 'Klastrovanie mravcami', NULL, NULL, 4);
INSERT INTO projects VALUES (22, 'DP', 437, NULL, 39, '2005/2006', 'OdhaÄľovanie webovĂ˝ch strĂˇnok so zaujĂ­mavou informĂˇciou pomocou poznĂˇmok', 'OdhaÄľovanie webovĂ˝ch strĂˇnok so zaujĂ­mavou informĂˇciou pomocou poznĂˇmok', NULL, NULL, 1);
INSERT INTO projects VALUES (23, 'DP', 704, NULL, 41, '2005/2006', 'NĂˇvrh a implementĂˇcia webovej prezentĂˇcie pracoviska z oblasti kultĂşry', 'NĂˇvrh a implementĂˇcia webovej prezentĂˇcie pracoviska z oblasti kultĂşry', NULL, NULL, 1);
INSERT INTO projects VALUES (24, 'DP', 374, NULL, 42, '2005/2006', 'MoĹľnosti ochrany mobilnĂ˝ch agentov', 'MoĹľnosti ochrany mobilnĂ˝ch agentov', NULL, NULL, 4);
INSERT INTO projects VALUES (25, 'ZP', 375, NULL, 42, '2004/2005', 'Peer-to-peer klient pre zdieÄľanie sĂşborov', 'Peer-to-peer client for files sharing', 'Analyzujte peer-to-peer (P2P) siete. UveÄŹte ich zĂˇkladnĂ© parametre a struÄŤne charakterizujte niektorĂ© typickĂ© P2P siete. Navrhnite a implementujte programovĂ˝ systĂ©m, ktorĂ˝ poskytne zĂˇkladnĂ© komunikaÄŤnĂ© vlastnosti uzla P2P sietĂ­ nad TCP/IP sieĹĄami. Overte navrhnutĂ˝ programovĂ˝ systĂ©m v reĂˇlnej sieti. ', 'Analyzujte peer-to-peer (P2P) siete. UveÄŹte ich zĂˇkladnĂ© parametre a struÄŤne charakterizujte niektorĂ© typickĂ© P2P siete. Navrhnite a implementujte programovĂ˝ systĂ©m, ktorĂ˝ poskytne zĂˇkladnĂ© komunikaÄŤnĂ© vlastnosti uzla P2P sietĂ­ nad TCP/IP sieĹĄami. Overte navrhnutĂ˝ programovĂ˝ systĂ©m v reĂˇlnej sieti. ', 0);
INSERT INTO projects VALUES (26, 'DP', 361, NULL, 45, '2005/2006', 'NĂˇvrh modelu charakterizujĂşceho urÄŤitĂ˝ systĂ©m, pomocou systĂ©mu level design methodology (LDM) ', 'NĂˇvrh modelu charakterizujĂşceho urÄŤitĂ˝ systĂ©m, pomocou systĂ©mu level design methodology (LDM) ', NULL, NULL, 0);
INSERT INTO projects VALUES (27, 'ZP', 374, NULL, 48, '2004/2005', 'MobilnĂ© agenty', 'Mobile Agents', 'Analyzujte vlastnosti a moĹľnosti multi-agentovĂ˝ch systĂ©mov, zamerajte sa hlavne na mobilitu agentov. PreskĂşmajte spĂ´soby vytvĂˇrania hostiteÄľskĂ˝ch prostredĂ­ pre mobilnĂ© agenty v rĂ´znych operaÄŤnĂ˝ch systĂ©moch a podporu, ktorĂş poskytujĂş kniĹľnice jazyka JAVA. Ĺ pecifikujte podstatnĂ© vlastnosti, ktorĂ© zabezpeÄŤia mobilitu agenta. Navrhnite hostiteÄľskĂ© prostredie a jednoduchĂ©ho agenta, ktorĂ˝ je schopnĂ˝ podÄľa urÄŤenĂ©ho plĂˇnu cestovaĹĄ medzi zvolenĂ˝mi poÄŤĂ­taÄŤmi. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu.', 'Analyzujte vlastnosti a moĹľnosti multi-agentovĂ˝ch systĂ©mov, zamerajte sa hlavne na mobilitu agentov. PreskĂşmajte spĂ´soby vytvĂˇrania hostiteÄľskĂ˝ch prostredĂ­ pre mobilnĂ© agenty v rĂ´znych operaÄŤnĂ˝ch systĂ©moch a podporu, ktorĂş poskytujĂş kniĹľnice jazyka JAVA. Ĺ pecifikujte podstatnĂ© vlastnosti, ktorĂ© zabezpeÄŤia mobilitu agenta. Navrhnite hostiteÄľskĂ© prostredie a jednoduchĂ©ho agenta, ktorĂ˝ je schopnĂ˝ podÄľa urÄŤenĂ©ho plĂˇnu cestovaĹĄ medzi zvolenĂ˝mi poÄŤĂ­taÄŤmi. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu.', 1);
INSERT INTO projects VALUES (28, 'DP', 16, NULL, 49, '2005/2006', 'Aspektovo-orientovanĂ© nĂˇvrhovĂ© vzory', 'Aspektovo-orientovanĂ© nĂˇvrhovĂ© vzory', NULL, NULL, 1);
INSERT INTO projects VALUES (29, 'DP', 541, NULL, 50, '2005/2006', 'SystĂ©m automatizovanĂ©ho odÄŤĂ­tania elektromerov', 'SystĂ©m automatizovanĂ©ho odÄŤĂ­tania elektromerov', NULL, NULL, 4);
INSERT INTO projects VALUES (30, 'DP', 27, NULL, 51, '2005/2006', 'SprĂˇva distribuovanĂ˝ch Ăşdajov', 'SprĂˇva distribuovanĂ˝ch Ăşdajov', NULL, NULL, 4);
INSERT INTO projects VALUES (31, 'ZP', 566, NULL, 52, '2004/2005', 'NeurĂłnovĂ© siete s logickĂ˝m prahovĂ˝m neurĂłnom ', 'Neural networks with logical threshold neurons', 'NeurĂłnovĂ© siete s logickĂ˝m prahovĂ˝m neurĂłnom patria medzi najjednoduchĹˇie typy neurĂłnovĂ˝ch sietĂ­, boli objavenĂ© McCulluchom a Pittsom v r. 1943. TĂ­to autori dokĂˇzali, Ĺľe ÄľubovolnĂˇ Boolova funkcia je simulovanĂˇ trojvrstvovou neurĂłnovou sieĹĄou, ÄŤĂ­m vlastne dokĂˇzali, Ĺľe tento typ neurĂłnovĂ˝ch sietĂ­ je univerzĂˇlnym vĂ˝poÄŤtovĂ˝m zariadenĂ­m v domĂ©ne BoolovĂ˝ch funkciĂ­. Tento teoretickĂ˝ prĂ­stup je nĂˇzorne ilustrovanĂ˝ schĂ©mami neurĂłnovĂ˝ch sietĂ­, ktorĂ© sĂş schopnĂ© vykonĂˇvaĹĄ rĂ´zne boolovskĂ© operĂˇcie. Predmetom projektu bude teoretickĂˇ rekapitulĂˇcia tĂ˝chto neurĂłnovĂ˝ch sietĂ­ a implementĂˇcia jednoduchĂ©ho programu s grafickĂ˝m znĂˇzornenĂ­m neurĂłnovej siete, ktorĂ˝ bude simulovaĹĄ Boolove funkcie pomocou prahovĂ˝ch logickĂ˝ch neurĂłnov.
', 'NeurĂłnovĂ© siete s logickĂ˝m prahovĂ˝m neurĂłnom patria medzi najjednoduchĹˇie typy neurĂłnovĂ˝ch sietĂ­, boli objavenĂ© McCulluchom a Pittsom v r. 1943. TĂ­to autori dokĂˇzali, Ĺľe ÄľubovolnĂˇ Boolova funkcia je simulovanĂˇ trojvrstvovou neurĂłnovou sieĹĄou, ÄŤĂ­m vlastne dokĂˇzali, Ĺľe tento typ neurĂłnovĂ˝ch sietĂ­ je univerzĂˇlnym vĂ˝poÄŤtovĂ˝m zariadenĂ­m v domĂ©ne BoolovĂ˝ch funkciĂ­. Tento teoretickĂ˝ prĂ­stup je nĂˇzorne ilustrovanĂ˝ schĂ©mami neurĂłnovĂ˝ch sietĂ­, ktorĂ© sĂş schopnĂ© vykonĂˇvaĹĄ rĂ´zne boolovskĂ© operĂˇcie. Predmetom projektu bude teoretickĂˇ rekapitulĂˇcia tĂ˝chto neurĂłnovĂ˝ch sietĂ­ a implementĂˇcia jednoduchĂ©ho programu s grafickĂ˝m znĂˇzornenĂ­m neurĂłnovej siete, ktorĂ˝ bude simulovaĹĄ Boolove funkcie pomocou prahovĂ˝ch logickĂ˝ch neurĂłnov.
', 1);
INSERT INTO projects VALUES (32, 'DP', 566, NULL, 52, '2005/2006', 'AdaptĂ­vna kombinĂˇcia lokĂˇlnych neurĂłnovĂ˝ch sietĂ­', 'AdaptĂ­vna kombinĂˇcia lokĂˇlnych neurĂłnovĂ˝ch sietĂ­', NULL, NULL, 1);
INSERT INTO projects VALUES (33, 'ZP', 517, NULL, 53, '2004/2005', 'VizualizĂˇcia parametrov komunikaÄŤnĂ˝ch protokolov na nespoÄľahlivĂ˝ch sieĹĄach', 'Visualization of parameters on communication protocols in unreliable networks', 'CieÄľom prĂˇce je simulovaĹĄ vybranĂ© typy komunikaÄŤnĂ˝ch protokolov na nespoÄľahlivĂ˝ch poÄŤĂ­taÄŤovĂ˝ch sieĹĄach s nĂˇhodne chybnĂ˝mi linkami/uzlami.
Analyzujte, navrhnite a simulujte problĂ©m uvedenĂ˝ch komunikaÄŤnĂ˝ch protokolov na vybranĂ˝ch topolĂłgiĂˇch. Pre nasimulovanĂ© protokoly je tieĹľ potrebnĂ© vyhodnotiĹĄ a spracovaĹĄ ich vlastnosti sprĂˇvania sa.', 'CieÄľom prĂˇce je simulovaĹĄ vybranĂ© typy komunikaÄŤnĂ˝ch protokolov na nespoÄľahlivĂ˝ch poÄŤĂ­taÄŤovĂ˝ch sieĹĄach s nĂˇhodne chybnĂ˝mi linkami/uzlami.
Analyzujte, navrhnite a simulujte problĂ©m uvedenĂ˝ch komunikaÄŤnĂ˝ch protokolov na vybranĂ˝ch topolĂłgiĂˇch. Pre nasimulovanĂ© protokoly je tieĹľ potrebnĂ© vyhodnotiĹĄ a spracovaĹĄ ich vlastnosti sprĂˇvania sa.', 1);
INSERT INTO projects VALUES (34, 'DP', 374, NULL, 53, '2005/2006', 'MoĹľnosti ochrany mobilnĂ˝ch agentov', 'MoĹľnosti ochrany mobilnĂ˝ch agentov', NULL, NULL, 1);
INSERT INTO projects VALUES (35, 'ZP', 388, NULL, 54, '2003/2004', 'OOP  pomocou prĂ­kladov', 'OOP using examples', 'Analyzujte metĂłdy tvorby a prezentĂˇcie znalostĂ­ z oblasti programovania vo forme rieĹˇenĂ˝ch prĂ­kladov s vyuĹľitĂ­m hypertextu. Analyzujte vĂ˝sledky prĂˇc vytvorenĂ˝ch v tejto oblasti v rĂˇmci ĹˇtudentskĂ˝ch projektov na KIVT v minulĂ˝ch rokoch. 
Navrhnite a implementujte softvĂ©rovĂş aplikĂˇciu, ktorĂˇ umoĹľnĂ­ tvorbu, prezentĂˇciu, pouĹľitie a ĂşdrĹľbu prĂ­ruÄŤky objektovo orientovanĂ©ho programovania vo forme rieĹˇenĂ˝ch prĂ­kladov.  
Navrhnite jednoduchĂş prĂ­ruÄŤku rieĹˇenĂ˝ch prĂ­kladov  OOP v jazyku C++.  VaĹˇe rieĹˇenie softvĂ©rovej aplikĂˇcie overte tĂ˝m, Ĺľe pomocou implementovanĂ©ho protototypu vytvorĂ­te a prezentujete navrhnutĂş prĂ­ruÄŤku.', 'Analyzujte metĂłdy tvorby a prezentĂˇcie znalostĂ­ z oblasti programovania vo forme rieĹˇenĂ˝ch prĂ­kladov s vyuĹľitĂ­m hypertextu. Analyzujte vĂ˝sledky prĂˇc vytvorenĂ˝ch v tejto oblasti v rĂˇmci ĹˇtudentskĂ˝ch projektov na KIVT v minulĂ˝ch rokoch. 
Navrhnite a implementujte softvĂ©rovĂş aplikĂˇciu, ktorĂˇ umoĹľnĂ­ tvorbu, prezentĂˇciu, pouĹľitie a ĂşdrĹľbu prĂ­ruÄŤky objektovo orientovanĂ©ho programovania vo forme rieĹˇenĂ˝ch prĂ­kladov.  
Navrhnite jednoduchĂş prĂ­ruÄŤku rieĹˇenĂ˝ch prĂ­kladov  OOP v jazyku C++.  VaĹˇe rieĹˇenie softvĂ©rovej aplikĂˇcie overte tĂ˝m, Ĺľe pomocou implementovanĂ©ho protototypu vytvorĂ­te a prezentujete navrhnutĂş prĂ­ruÄŤku.', 1);
INSERT INTO projects VALUES (36, 'DP', 20, NULL, 54, '2005/2006', 'RieĹˇenie Ăşloh pomocou prĂ­stupov zaloĹľenĂ˝ch architekturĂˇlnom biase', 'RieĹˇenie Ăşloh pomocou prĂ­stupov zaloĹľenĂ˝ch architekturĂˇlnom biase', NULL, NULL, 1);
INSERT INTO projects VALUES (37, 'ZP', 541, NULL, 55, '2004/2005', 'DispeÄŤerskĂ˝ systĂ©m', 'Dispatcher system', 'Vytvorte program pre dispeÄŤerskĂ˝ systĂ©m pre montĂ©rov. JednĂˇ sa o mobilnĂ© zariadenie do auta. MĂˇ GPS a na komunikĂˇciu vyuĹľĂ­va GPRS Orange. MusĂ­ umoĹľĹovaĹĄ sledovaĹĄ polohu auta, robiĹĄ archĂ­v jĂˇzd, zadĂˇvaĹĄ montĂ©rovi Ăşlohy, navigovaĹĄ ho a umoĹľniĹĄ mu komunikovaĹĄ s dispeÄŤerom.', 'Vytvorte program pre dispeÄŤerskĂ˝ systĂ©m pre montĂ©rov. JednĂˇ sa o mobilnĂ© zariadenie do auta. MĂˇ GPS a na komunikĂˇciu vyuĹľĂ­va GPRS Orange. MusĂ­ umoĹľĹovaĹĄ sledovaĹĄ polohu auta, robiĹĄ archĂ­v jĂˇzd, zadĂˇvaĹĄ montĂ©rovi Ăşlohy, navigovaĹĄ ho a umoĹľniĹĄ mu komunikovaĹĄ s dispeÄŤerom.', 1);
INSERT INTO projects VALUES (38, 'DP', 97, NULL, 55, '2005/2006', 'Generovanie zdrojovĂ©ho kĂłdu z UML 2.0 diagramov ', 'Generovanie zdrojovĂ©ho kĂłdu z UML 2.0 diagramov ', NULL, NULL, 1);
INSERT INTO projects VALUES (39, 'DP', 24, NULL, 56, '2005/2006', 'UrÄŤovanie autorstva textovĂ©ho dokumentu', 'UrÄŤovanie autorstva textovĂ©ho dokumentu', NULL, NULL, 4);
INSERT INTO projects VALUES (40, 'ZP', 660, NULL, 56, '2003/2004', 'Podpora vĂ˝uÄŤby programovania pomocou prĂ­kladov', 'Podpora vĂ˝uÄŤby programovania pomocou prĂ­kladov', 'Analyzujte metĂłdy tvorby a prezentĂˇcie znalostĂ­ z oblasti programovania vo forme rieĹˇenĂ˝ch prĂ­kladov s vyuĹľitĂ­m hypertextu. VychĂˇdzajte pri tom z modelu hypertextovĂ©ho dokumentu, ktorĂ˝ zahĹ•Ĺa takĂ©to znalosti z oblasti tvorby programov v programovacĂ­ch jazykoch lisp a prolog (pouĹľitĂ˝ v existujĂşcom softvĂ©rovom prototype, ktorĂ˝ bol prvĂ˝krĂˇt nasadenĂ˝ v akademickom roku 2002/2003 v predmete FunkcionĂˇlne a logickĂ© programovanie). Navrhnite softvĂ©rovĂş aplikĂˇciu, ktorĂˇ umoĹľnĂ­ napÄşĹanie informaÄŤnĂ©ho obsahu takĂ©hoto systĂ©mu. ÄŽalej navrhnite modifikĂˇcie existujĂşceho systĂ©mu tak, aby to odrĂˇĹľalo vĂ˝sledky analĂ˝zy. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu.  ', 'Analyzujte metĂłdy tvorby a prezentĂˇcie znalostĂ­ z oblasti programovania vo forme rieĹˇenĂ˝ch prĂ­kladov s vyuĹľitĂ­m hypertextu. VychĂˇdzajte pri tom z modelu hypertextovĂ©ho dokumentu, ktorĂ˝ zahĹ•Ĺa takĂ©to znalosti z oblasti tvorby programov v programovacĂ­ch jazykoch lisp a prolog (pouĹľitĂ˝ v existujĂşcom softvĂ©rovom prototype, ktorĂ˝ bol prvĂ˝krĂˇt nasadenĂ˝ v akademickom roku 2002/2003 v predmete FunkcionĂˇlne a logickĂ© programovanie). Navrhnite softvĂ©rovĂş aplikĂˇciu, ktorĂˇ umoĹľnĂ­ napÄşĹanie informaÄŤnĂ©ho obsahu takĂ©hoto systĂ©mu. ÄŽalej navrhnite modifikĂˇcie existujĂşceho systĂ©mu tak, aby to odrĂˇĹľalo vĂ˝sledky analĂ˝zy. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu.  ', 1);
INSERT INTO projects VALUES (41, 'DP', 433, NULL, 57, '2005/2006', 'KatalĂłg softvĂ©rovĂ˝ch znalostĂ­ s modelovanĂ­m variablity', 'KatalĂłg softvĂ©rovĂ˝ch znalostĂ­ s modelovanĂ­m variablity', NULL, NULL, 1);
INSERT INTO projects VALUES (42, 'ZP', 541, NULL, 57, '2003/2004', 'ArchivaÄŤnĂ˝ systĂ©m pre manaĹľment projektov', 'Archiving system for project management', 'Urobte prieskum trhu a analyzujte dostupnĂ© archivaÄŤnĂ© systĂ©my pre manaĹľment projektov. Ĺ pecifikujte poĹľadovanĂ© vlastnosti takĂ©hoto systĂ©mu.  Navrhnite funkÄŤnĂ˝ model inteligentnĂ©ho archivaÄŤnĂ©ho systĂ©mu pre manaĹľment projektov. NavrhnutĂ˝ systĂ©m implementujte vo vybratom prostredĂ­. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade', 'Urobte prieskum trhu a analyzujte dostupnĂ© archivaÄŤnĂ© systĂ©my pre manaĹľment projektov. Ĺ pecifikujte poĹľadovanĂ© vlastnosti takĂ©hoto systĂ©mu.  Navrhnite funkÄŤnĂ˝ model inteligentnĂ©ho archivaÄŤnĂ©ho systĂ©mu pre manaĹľment projektov. NavrhnutĂ˝ systĂ©m implementujte vo vybratom prostredĂ­. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade', 1);
INSERT INTO projects VALUES (43, 'ZP', 382, NULL, 58, '2004/2005', 'RieĹˇenie hry evoluÄŤnĂ˝m algoritmom', 'Solving a game with evolution algorithm', 'ProblĂ©m â€ždeviatkaâ€ś â€“ vyrieĹˇte detskĂş hru, pri ktorej mĂˇte 9 polĂ­ÄŤok v Ĺˇtvorci, na ktorom je rozmiestnenĂ˝ch 8 kociek oÄŤĂ­slovanĂ˝ch od 1 po 8 a vy ich mĂˇte usporiadaĹĄ posĂşvanĂ­m tak, aby iĹˇli podÄľa veÄľkosti po riadkoch. ZadĂˇvate poÄŤiatoÄŤnĂ˝ stav. Na rieĹˇenie pouĹľite jednu z â€žostatnĂ˝ch technĂ­k rieĹˇeniaâ€ś a evoluÄŤnĂ˝ algoritmus. Zobecniete Ăşlohu na obdÄşĹľnik n x m. Vyrobte grafy so ĹˇtatistickĂ˝mi meraniami (priemer, maximum, minimum, smerodajnĂˇ odchĂ˝lka) zĂˇvislosti rĂ˝chlosti nĂˇjdenĂ©ho rieĹˇenia na ÄŤase s veÄľkosĹĄou problĂ©mu.
Porovnajte, ktorĂˇ z metĂłd je lepĹˇia v zmysle optimality (poÄŤtu posunov, resp. kvality rieĹˇenia â€“ koÄľko kociek je eĹˇte neusporiadanĂ˝ch) a celkovej optimality (najlepĹˇie rieĹˇenie za minimum ÄŤasu s minimom pouĹľitej pamĂ¤ti).

', 'ProblĂ©m â€ždeviatkaâ€ś â€“ vyrieĹˇte detskĂş hru, pri ktorej mĂˇte 9 polĂ­ÄŤok v Ĺˇtvorci, na ktorom je rozmiestnenĂ˝ch 8 kociek oÄŤĂ­slovanĂ˝ch od 1 po 8 a vy ich mĂˇte usporiadaĹĄ posĂşvanĂ­m tak, aby iĹˇli podÄľa veÄľkosti po riadkoch. ZadĂˇvate poÄŤiatoÄŤnĂ˝ stav. Na rieĹˇenie pouĹľite jednu z â€žostatnĂ˝ch technĂ­k rieĹˇeniaâ€ś a evoluÄŤnĂ˝ algoritmus. Zobecniete Ăşlohu na obdÄşĹľnik n x m. Vyrobte grafy so ĹˇtatistickĂ˝mi meraniami (priemer, maximum, minimum, smerodajnĂˇ odchĂ˝lka) zĂˇvislosti rĂ˝chlosti nĂˇjdenĂ©ho rieĹˇenia na ÄŤase s veÄľkosĹĄou problĂ©mu.
Porovnajte, ktorĂˇ z metĂłd je lepĹˇia v zmysle optimality (poÄŤtu posunov, resp. kvality rieĹˇenia â€“ koÄľko kociek je eĹˇte neusporiadanĂ˝ch) a celkovej optimality (najlepĹˇie rieĹˇenie za minimum ÄŤasu s minimom pouĹľitej pamĂ¤ti).

', 1);
INSERT INTO projects VALUES (44, 'DP', 97, NULL, 58, '2005/2006', 'RefaktorizĂˇcia objektovĂ˝ch ĹˇtruktĂşr', 'RefaktorizĂˇcia objektovĂ˝ch ĹˇtruktĂşr', NULL, NULL, 1);
INSERT INTO projects VALUES (45, 'ZP', 541, NULL, 59, '2004/2005', 'DispeÄŤerskĂ˝ systĂ©m', 'Dispatching System', 'Vytvorte program pre dispeÄŤerskĂ˝ systĂ©m pre montĂ©rov. JednĂˇ sa o mobilnĂ© zariadenie do auta. MĂˇ GPS a na komunikĂˇciu vyuĹľĂ­va GPRS Orange. MusĂ­ umoĹľĹovaĹĄ sledovaĹĄ polohu auta, robiĹĄ archĂ­v jĂˇzd, zadĂˇvaĹĄ montĂ©rovi Ăşlohy, navigovaĹĄ ho a umoĹľniĹĄ mu komunikovaĹĄ s dispeÄŤerom.', 'Vytvorte program pre dispeÄŤerskĂ˝ systĂ©m pre montĂ©rov. JednĂˇ sa o mobilnĂ© zariadenie do auta. MĂˇ GPS a na komunikĂˇciu vyuĹľĂ­va GPRS Orange. MusĂ­ umoĹľĹovaĹĄ sledovaĹĄ polohu auta, robiĹĄ archĂ­v jĂˇzd, zadĂˇvaĹĄ montĂ©rovi Ăşlohy, navigovaĹĄ ho a umoĹľniĹĄ mu komunikovaĹĄ s dispeÄŤerom.', 1);
INSERT INTO projects VALUES (46, 'DP', 43, NULL, 59, '2005/2006', 'ParalelnĂ© prehÄľadĂˇvanie hernĂ©ho stromu', 'ParalelnĂ© prehÄľadĂˇvanie hernĂ©ho stromu', NULL, NULL, 1);
INSERT INTO projects VALUES (47, 'DP', 374, NULL, 60, '2005/2006', 'Ĺ truktĂşrovanĂ˝ hrĂˇÄŤ pre simulovanĂ© hry typu RoboCup', 'Ĺ truktĂşrovanĂ˝ hrĂˇÄŤ pre simulovanĂ© hry typu RoboCup', NULL, NULL, 1);
INSERT INTO projects VALUES (48, 'ZP', 98, NULL, 60, '2004/2005', 'SystĂ©m pre odovzdĂˇvanie prĂˇc prostrednĂ­ctvom Internetu', 'SystĂ©m na odovzdĂˇvanie prĂˇc prostrednĂ­ctvom internetu', 'C# je pomerne novĂ˝ jazyk, ktorĂ˝ vychĂˇza z jazyka C++  a z jazyka Java. NaĹˇtudujte tento programovacĂ­ jazyk a posĂşÄŹte jeho moĹľnosti ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇcii.
Na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu pre odovzdĂˇvanie prĂˇc prostrednĂ­ctvom Internetu.
', 'C# je pomerne novĂ˝ jazyk, ktorĂ˝ vychĂˇza z jazyka C++  a z jazyka Java. NaĹˇtudujte tento programovacĂ­ jazyk a posĂşÄŹte jeho moĹľnosti ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇcii.
Na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu pre odovzdĂˇvanie prĂˇc prostrednĂ­ctvom Internetu.
', 1);
INSERT INTO projects VALUES (49, 'ZP', 579, NULL, 61, '2004/2005', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS', 'Multimedia information in regional IS', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie existujĂşceho zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb FIIT.', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie existujĂşceho zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb FIIT.', 1);
INSERT INTO projects VALUES (50, 'DP', 388, NULL, 61, '2005/2006', 'SprĂˇva a publikovanie dokumentov  v prostredĂ­ sĂ©mantickĂ©ho webu.', 'SprĂˇva a publikovanie dokumentov  v prostredĂ­ sĂ©mantickĂ©ho webu.', NULL, NULL, 1);
INSERT INTO projects VALUES (51, 'ZP', 566, NULL, 62, '2004/2005', 'PouĹľitie simulovanĂ©ho ĹľĂ­hania k globĂˇlnej optimalizĂˇcii funkciĂ­', 'PouĹľitie simulovanĂ©ho ĹľĂ­hania k globĂˇlnej optimalizĂˇcii funkciĂ­', 'SimulovanĂ© ĹľĂ­hanie patrĂ­ v sĂşÄŤasnosti medzi efektĂ­vne metĂłdy globĂˇlnej optimalizĂˇcie funkciĂ­. RieĹˇenie je zaloĹľenĂ© na fyzikĂˇlnej analĂłgii ochladzovania tuhĂ©ho telesa, v ktorom sĂş ĹˇtrukturĂˇlne poruchy. RieĹˇenie daneho optimalizaÄŤnĂ©ho problĂ©mu je formĂˇlne chĂˇpanĂ© ako systĂ©m, ktorĂ©ho funkÄŤnĂˇ hodnota popisuje vnĂştornĂş energiu. CieÄľom je nĂˇjsĹĄ takĂ© rieĹˇenie, ktorĂ© minimalizuje vnĂştornĂş energiu modelovĂ©ho systĂ©mu, t.j. funkÄŤnĂş hodnotu. MetĂłda je zahĂˇjenĂˇ poÄŤiatoÄŤnou teplotou, ktorĂˇ Ĺˇpecifikuje pravdepodobonosĹĄ akceptovania novĂ©ho rieĹˇenia, ktorĂ© vznikne malou poruchou z pĂ´vodnĂ©ho rieĹˇenia. ÄŚĂ­m je teplota vyĹˇĹˇia, tĂ˝m s vĂ¤ÄŤĹˇou pravdepodobnosĹĄou akceptujeme novĂ© rieĹˇenie. V priebehu vĂ˝poÄŤtu teplotu postupne zniĹľujeme. Na zĂˇver, keÄŹ je teplota malĂˇ, akceptujĂş sa obvykle len takĂ© rieĹˇenia, ktorĂ© nie sĂş horĹˇie od pĂ´vodnĂ©ho. DĂˇ sa dokĂˇzaĹĄ, Ĺľe tento postup musĂ­ konvergovaĹĄ k rieĹˇeniu, ktorĂ© je veÄľmi blĂ­zke globĂˇlnemu rieĹˇeniu. PreĹˇtudujte metĂłdu a napĂ­Ĺˇte jej teoretickĂ˝ prehÄľad. ÄŽalej navrhnite jej jednoduchĂş implementĂˇciu a nĂˇvrh realizujte v jazyku Pascal alebo C.', 'SimulovanĂ© ĹľĂ­hanie patrĂ­ v sĂşÄŤasnosti medzi efektĂ­vne metĂłdy globĂˇlnej optimalizĂˇcie funkciĂ­. RieĹˇenie je zaloĹľenĂ© na fyzikĂˇlnej analĂłgii ochladzovania tuhĂ©ho telesa, v ktorom sĂş ĹˇtrukturĂˇlne poruchy. RieĹˇenie daneho optimalizaÄŤnĂ©ho problĂ©mu je formĂˇlne chĂˇpanĂ© ako systĂ©m, ktorĂ©ho funkÄŤnĂˇ hodnota popisuje vnĂştornĂş energiu. CieÄľom je nĂˇjsĹĄ takĂ© rieĹˇenie, ktorĂ© minimalizuje vnĂştornĂş energiu modelovĂ©ho systĂ©mu, t.j. funkÄŤnĂş hodnotu. MetĂłda je zahĂˇjenĂˇ poÄŤiatoÄŤnou teplotou, ktorĂˇ Ĺˇpecifikuje pravdepodobonosĹĄ akceptovania novĂ©ho rieĹˇenia, ktorĂ© vznikne malou poruchou z pĂ´vodnĂ©ho rieĹˇenia. ÄŚĂ­m je teplota vyĹˇĹˇia, tĂ˝m s vĂ¤ÄŤĹˇou pravdepodobnosĹĄou akceptujeme novĂ© rieĹˇenie. V priebehu vĂ˝poÄŤtu teplotu postupne zniĹľujeme. Na zĂˇver, keÄŹ je teplota malĂˇ, akceptujĂş sa obvykle len takĂ© rieĹˇenia, ktorĂ© nie sĂş horĹˇie od pĂ´vodnĂ©ho. DĂˇ sa dokĂˇzaĹĄ, Ĺľe tento postup musĂ­ konvergovaĹĄ k rieĹˇeniu, ktorĂ© je veÄľmi blĂ­zke globĂˇlnemu rieĹˇeniu. PreĹˇtudujte metĂłdu a napĂ­Ĺˇte jej teoretickĂ˝ prehÄľad. ÄŽalej navrhnite jej jednoduchĂş implementĂˇciu a nĂˇvrh realizujte v jazyku Pascal alebo C.', 1);
INSERT INTO projects VALUES (52, 'DP', 566, NULL, 62, '2005/2006', 'Ĺ tĂşdium vlastnosti algoritmov kvantovĂ©ho poÄŤĂ­tania pomocou programu Mathematica', 'Ĺ tĂşdium vlastnosti algoritmov kvantovĂ©ho poÄŤĂ­tania pomocou programu Mathematica', NULL, NULL, 1);
INSERT INTO projects VALUES (53, 'ZP', 31, NULL, 63, '2004/2005', 'AutomatickĂ© rozmiestĹovanie grafov v aplikĂˇcii EGRET', 'Automatic graph deployment in application EGRET', 'AplikĂˇcia EGRET  umoĹľĹuje pohodlnĂş prĂˇcu s grafmi udalostĂ­. NaĹˇtudujte architektĂşru  a implementĂˇciu aplikĂˇcie EGRET so zameranĂ­m na tvorbu zĂˇsuvnĂ˝ch modulov pre tĂşto aplikĂˇciu. Analyzujte existujĂşce algoritmy pre kreslenie grafov. Navrhnite a implementujte zĂˇsuvnĂ˝ modul, ktorĂ˝ umoĹľnĂ­ automatickĂ© rozmiestnenie grafu v aplikĂˇcii EGRET. ImplementĂˇcia  v jazyku C++, Win32. ', 'AplikĂˇcia EGRET  umoĹľĹuje pohodlnĂş prĂˇcu s grafmi udalostĂ­. NaĹˇtudujte architektĂşru  a implementĂˇciu aplikĂˇcie EGRET so zameranĂ­m na tvorbu zĂˇsuvnĂ˝ch modulov pre tĂşto aplikĂˇciu. Analyzujte existujĂşce algoritmy pre kreslenie grafov. Navrhnite a implementujte zĂˇsuvnĂ˝ modul, ktorĂ˝ umoĹľnĂ­ automatickĂ© rozmiestnenie grafu v aplikĂˇcii EGRET. ImplementĂˇcia  v jazyku C++, Win32. ', 1);
INSERT INTO projects VALUES (54, 'DP', 10, NULL, 63, '2005/2006', 'SimulovanĂ˝ robotickĂ˝ futbal - automatizovanĂ© uÄŤenie', 'SimulovanĂ˝ robotickĂ˝ futbal - automatizovanĂ© uÄŤenie', NULL, NULL, 1);
INSERT INTO projects VALUES (55, 'ZP', 294, NULL, 64, '2004/2005', 'DistribuovanĂ© simulaÄŤnĂ© prostredie zaloĹľenĂ© na technike Web3D ', 'Distributed simulation environment based on Web3D technique', 'NaĹˇtudujte existujĂşce rieĹˇenia,  urobte analĂ˝zu existujĂşcich systĂ©mov pre distribuovanĂş simulĂˇciu pohybu 3D modelov v distribuovanom  prostredĂ­ Web3D  (http://www.web3d.org) zaloĹľenom na VRML  (http://www.vrml.org) alebo EONReality (http://www.eonreality.com) reality pre internet. Urobte experimenty s jednoduchou scĂ©nou tak, aby mohli objekty scĂ©ny ovlĂˇdaĹĄ viacerĂ© osoby z rĂ´znych klientskĂ˝ch poÄŤĂ­taÄŤov. Realizujte  s adaptovanĂ˝m  a modifikovanĂ˝m alebo vlastnĂ˝m vyvinutĂ˝m prostredĂ­m jednoduchĂş aplikĂˇciu zameranĂş na e-vzdelĂˇvanie, naprĂ­klad kooperatĂ­vne experimenty vo virtuĂˇlnom laboratĂłriu. 

', 'NaĹˇtudujte existujĂşce rieĹˇenia,  urobte analĂ˝zu existujĂşcich systĂ©mov pre distribuovanĂş simulĂˇciu pohybu 3D modelov v distribuovanom  prostredĂ­ Web3D  (http://www.web3d.org) zaloĹľenom na VRML  (http://www.vrml.org) alebo EONReality (http://www.eonreality.com) reality pre internet. Urobte experimenty s jednoduchou scĂ©nou tak, aby mohli objekty scĂ©ny ovlĂˇdaĹĄ viacerĂ© osoby z rĂ´znych klientskĂ˝ch poÄŤĂ­taÄŤov. Realizujte  s adaptovanĂ˝m  a modifikovanĂ˝m alebo vlastnĂ˝m vyvinutĂ˝m prostredĂ­m jednoduchĂş aplikĂˇciu zameranĂş na e-vzdelĂˇvanie, naprĂ­klad kooperatĂ­vne experimenty vo virtuĂˇlnom laboratĂłriu. 

', 1);
INSERT INTO projects VALUES (56, 'DP', 11, 297, 64, '2005/2006', 'VĂ˝vojovĂ˝ nĂˇstroj pre sprĂˇvu riadiacich Ăşdajov v informaÄŤnĂ˝ch systĂ©moch', 'VĂ˝vojovĂ˝ nĂˇstroj pre sprĂˇvu riadiacich Ăşdajov v informaÄŤnĂ˝ch systĂ©moch', NULL, NULL, 1);
INSERT INTO projects VALUES (57, 'ZP', 20, NULL, 65, '2004/2005', 'Editor neurĂłnovĂ˝ch sietĂ­', 'Editor of recurent neural networks', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch doprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou. ExistujĂş rĂ´zne architektĂşry rekurentnĂ˝ch sietĂ­ s rĂ´znymi schopnosĹĄami z hÄľadiska spracovania vstupnĂ˝ch dĂˇt.
NaĹˇtudujte problematiku neurĂłnovĂ˝ch sietĂ­ a rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­, zamerajte sa na moĹľnosti zakĂłdovania architektĂşry neurĂłnovĂ˝ch sietĂ­ vzhÄľadom na potreby trĂ©novacĂ­ch algoritmov. Vytvorte editor umoĹľĹujĂşci pouĹľĂ­vateÄľovi vytvoriĹĄ neurĂłnovĂş sieĹĄ vyuĹľĂ­vajĂşci navrhnutĂ˝ formĂˇt.', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch doprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou. ExistujĂş rĂ´zne architektĂşry rekurentnĂ˝ch sietĂ­ s rĂ´znymi schopnosĹĄami z hÄľadiska spracovania vstupnĂ˝ch dĂˇt.
NaĹˇtudujte problematiku neurĂłnovĂ˝ch sietĂ­ a rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­, zamerajte sa na moĹľnosti zakĂłdovania architektĂşry neurĂłnovĂ˝ch sietĂ­ vzhÄľadom na potreby trĂ©novacĂ­ch algoritmov. Vytvorte editor umoĹľĹujĂşci pouĹľĂ­vateÄľovi vytvoriĹĄ neurĂłnovĂş sieĹĄ vyuĹľĂ­vajĂşci navrhnutĂ˝ formĂˇt.', 1);
INSERT INTO projects VALUES (58, 'DP', 98, NULL, 65, '2005/2006', 'NĂˇstroj na vytvĂˇranie uÄŤebnĂ˝ch textov', 'NĂˇstroj na vytvĂˇranie uÄŤebnĂ˝ch textov', NULL, NULL, 1);
INSERT INTO projects VALUES (59, 'ZP', 447, NULL, 66, '2004/2005', 'ObservatĂłrium jazykov v priestore WWW', 'Language Observatory Project in World Wide Web', 'CelosvetovĂˇ sieĹĄ WWW obsahuje obrovskĂ© mnoĹľstvo textovĂ˝ch dokumentov napĂ­sanĂ˝ch v rĂ´znych prirodzenĂ˝ch jazykoch (slovenÄŤina, angliÄŤtina a pod.). Analyzujte problematiku identifikĂˇcie jazyka textovĂ©ho dokumentu v sieti WWW. Navrhnite spĂ´sob identifikĂˇcie vybranĂ˝ch jazykov, v ktorĂ˝ch sĂş textovĂ© dokumenty napĂ­sanĂ© a navrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho nĂˇstroja na ich klasifikĂˇciu. Pri experimentoch s navrhnutou metĂłdou pouĹľite obsah webu v ĹˇtruktĂşrovanej podobe zĂ­skanĂ˝ v rĂˇmci projektu Language Observatory (http://www.language-observatory.org/) - tento bude pri rieĹˇenĂ­ projektu dostupnĂ˝.', 'CelosvetovĂˇ sieĹĄ WWW obsahuje obrovskĂ© mnoĹľstvo textovĂ˝ch dokumentov napĂ­sanĂ˝ch v rĂ´znych prirodzenĂ˝ch jazykoch (slovenÄŤina, angliÄŤtina a pod.). Analyzujte problematiku identifikĂˇcie jazyka textovĂ©ho dokumentu v sieti WWW. Navrhnite spĂ´sob identifikĂˇcie vybranĂ˝ch jazykov, v ktorĂ˝ch sĂş textovĂ© dokumenty napĂ­sanĂ© a navrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho nĂˇstroja na ich klasifikĂˇciu. Pri experimentoch s navrhnutou metĂłdou pouĹľite obsah webu v ĹˇtruktĂşrovanej podobe zĂ­skanĂ˝ v rĂˇmci projektu Language Observatory (http://www.language-observatory.org/) - tento bude pri rieĹˇenĂ­ projektu dostupnĂ˝.', 1);
INSERT INTO projects VALUES (60, 'DP', 447, NULL, 66, '2005/2006', 'IdentifikĂˇcia prirodzenĂ˝ch jazykov na webe', 'IdentifikĂˇcia prirodzenĂ˝ch jazykov na webe', NULL, NULL, 1);
INSERT INTO projects VALUES (61, 'ZP', 260, NULL, 67, '2004/2005', 'Prostriedky pre heuristickĂ© definovanie bezpeÄŤnostnej politiky', 'Tools for heuristic definition of security policy', 'Analyzujte moĹľnosti sledovania operĂˇciĂ­ pouĹľĂ­vateÄľa nad sĂşborovĂ˝m systĂ©mom a spracovania nazbieranĂ˝ch Ăşdajov.  Navrhnite a vytvorte nĂˇstroj, ktorĂ˝ umoĹľnĂ­ sledovaĹĄ ÄŤinnosti pouĹľĂ­vateÄľa v systĂ©me, ktorĂ© sĂş relevantnĂ© z pohÄľadu definovania bezpeÄŤnostnej politiky riadenia prĂ­stupu. PrĂ­kladom mĂ´Ĺľu byĹĄ sĂşbory, ku ktorĂ˝m pouĹľĂ­vateÄľ pristupuje, ich klasifikĂˇcia ÄŤasovĂˇ (kedy pristupuje, ako ÄŤasto, ...) aj priestorovĂˇ (umiestenie v sĂşborovom systĂ©me, ...), spĂ´sob prĂ­stupu (ÄŤĂ­tanie, zĂˇpis, vykonanie, pridĂˇvanie, ...) ako aj sledovanie postupnostĂ­ prĂ­stupov. VĂ˝stupy nĂˇstroja Ĺˇtatisticky spracujte a vytvorte zĂˇklad profilu pouĹľĂ­vateÄľa.', 'Analyzujte moĹľnosti sledovania operĂˇciĂ­ pouĹľĂ­vateÄľa nad sĂşborovĂ˝m systĂ©mom a spracovania nazbieranĂ˝ch Ăşdajov.  Navrhnite a vytvorte nĂˇstroj, ktorĂ˝ umoĹľnĂ­ sledovaĹĄ ÄŤinnosti pouĹľĂ­vateÄľa v systĂ©me, ktorĂ© sĂş relevantnĂ© z pohÄľadu definovania bezpeÄŤnostnej politiky riadenia prĂ­stupu. PrĂ­kladom mĂ´Ĺľu byĹĄ sĂşbory, ku ktorĂ˝m pouĹľĂ­vateÄľ pristupuje, ich klasifikĂˇcia ÄŤasovĂˇ (kedy pristupuje, ako ÄŤasto, ...) aj priestorovĂˇ (umiestenie v sĂşborovom systĂ©me, ...), spĂ´sob prĂ­stupu (ÄŤĂ­tanie, zĂˇpis, vykonanie, pridĂˇvanie, ...) ako aj sledovanie postupnostĂ­ prĂ­stupov. VĂ˝stupy nĂˇstroja Ĺˇtatisticky spracujte a vytvorte zĂˇklad profilu pouĹľĂ­vateÄľa.', 1);
INSERT INTO projects VALUES (62, 'DP', 260, NULL, 67, '2005/2006', 'Detekcia neĹˇtandardnĂ˝ch stavov v operaÄŤnom systĂ©me', 'Detekcia neĹˇtandardnĂ˝ch stavov v operaÄŤnom systĂ©me', NULL, NULL, 1);
INSERT INTO projects VALUES (63, 'DP', 584, NULL, 68, '2005/2006', 'BezpeÄŤnosĹĄ v grid computingu.', 'BezpeÄŤnosĹĄ v grid computingu.', NULL, NULL, 0);
INSERT INTO projects VALUES (64, 'ZP', 358, NULL, 68, '2004/2005', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Testing the security weaknesses of computer networks', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş testovaĹĄ vybratĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş testovaĹĄ vybratĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.', 0);
INSERT INTO projects VALUES (65, 'ZP', 588, 563, 69, '2004/2005', 'IdentifikaÄŤnĂ© systĂ©my', 'Identification systems', 'Analyzujte technickĂ© a programovĂ© prostredie pre realizĂˇciu identifikaÄŤnĂ˝ch systĂ©mov. Porovnajte kontaktnĂ© a bezdrĂ´tovĂ© systĂ©my uvedenĂ© (minimĂˇlne od dvoch vĂ˝robcov) na zĂˇklade definovanĂ˝ch technickĂ˝ch parametrov. Navrhnite obvodovĂş schĂ©mu pre jednoduchĂ˝ identifikaÄŤnĂ˝ systĂ©m riadenĂ˝ vhodnĂ˝m mikroprocesorom. NapĂ­Ĺˇte a overte program pre riadenie mikroprocesoru.

', 'Analyzujte technickĂ© a programovĂ© prostredie pre realizĂˇciu identifikaÄŤnĂ˝ch systĂ©mov. Porovnajte kontaktnĂ© a bezdrĂ´tovĂ© systĂ©my uvedenĂ© (minimĂˇlne od dvoch vĂ˝robcov) na zĂˇklade definovanĂ˝ch technickĂ˝ch parametrov. Navrhnite obvodovĂş schĂ©mu pre jednoduchĂ˝ identifikaÄŤnĂ˝ systĂ©m riadenĂ˝ vhodnĂ˝m mikroprocesorom. NapĂ­Ĺˇte a overte program pre riadenie mikroprocesoru.

', 0);
INSERT INTO projects VALUES (66, 'DP', 357, NULL, 69, '2005/2006', 'PrincĂ­py a vizualizĂˇcia STP', 'PrincĂ­py a vizualizĂˇcia STP', NULL, NULL, 0);
INSERT INTO projects VALUES (67, 'ZP', 358, NULL, 70, '2004/2005', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Testing for Security Vulnerabilities of Computer Networks', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş testovaĹĄ vybratĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş testovaĹĄ vybratĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.', 0);
INSERT INTO projects VALUES (68, 'DP', 375, NULL, 70, '2005/2006', 'Meranie  a vyhodnocovanie parametrov kvality sluĹľieb v TCP/IP sieĹĄach', 'Meranie  a vyhodnocovanie parametrov kvality sluĹľieb v TCP/IP sieĹĄach', NULL, NULL, 0);
INSERT INTO projects VALUES (69, 'ZP', 25, NULL, 71, '2004/2005', 'KlasifikĂˇcia pouĹľĂ­vateÄľov a sĂşborov na zĂˇklade ich vzĂˇjomnĂ˝ch interakciĂ­', 'Classification of users and files based upon their mutual interactions', 'Navrhnite spĂ´sob zbierania relevantnĂ˝ch informĂˇciĂ­ o prĂ­stupoch pouĹľĂ­vateÄľov k sĂşborom. Na zĂˇklade tĂ˝chto informĂˇciĂ­ zvoÄľte vhodnĂ˝ model pre klasifikĂˇciu pouĹľĂ­vateÄľov a sĂşborov podÄľa ich podobnĂ˝ch vlastnostĂ­ a vzĂˇjomnĂ˝ch sĂşvislostĂ­, priÄŤom zohÄľadnite aj typickĂ© postupnosti v skĂşmanĂ˝ch Ăşdajoch. Implementujte nĂˇstroj (napr. v podobe modulu jadra OS) ktorĂ˝ umoĹľnĂ­ zaznamenĂˇvaĹĄ potrebnĂ© Ăşdaje poÄŤas beĹľnej prevĂˇdzky (on-line). ZĂ­skanĂ© Ăşdaje vyhodnoĹĄte podÄľa navrhnutĂ©ho modelu skupĂ­n podobnĂ˝ch sĂşborov a pouĹľĂ­vateÄľov.', 'Navrhnite spĂ´sob zbierania relevantnĂ˝ch informĂˇciĂ­ o prĂ­stupoch pouĹľĂ­vateÄľov k sĂşborom. Na zĂˇklade tĂ˝chto informĂˇciĂ­ zvoÄľte vhodnĂ˝ model pre klasifikĂˇciu pouĹľĂ­vateÄľov a sĂşborov podÄľa ich podobnĂ˝ch vlastnostĂ­ a vzĂˇjomnĂ˝ch sĂşvislostĂ­, priÄŤom zohÄľadnite aj typickĂ© postupnosti v skĂşmanĂ˝ch Ăşdajoch. Implementujte nĂˇstroj (napr. v podobe modulu jadra OS) ktorĂ˝ umoĹľnĂ­ zaznamenĂˇvaĹĄ potrebnĂ© Ăşdaje poÄŤas beĹľnej prevĂˇdzky (on-line). ZĂ­skanĂ© Ăşdaje vyhodnoĹĄte podÄľa navrhnutĂ©ho modelu skupĂ­n podobnĂ˝ch sĂşborov a pouĹľĂ­vateÄľov.', 0);
INSERT INTO projects VALUES (70, 'DP', 298, NULL, 71, '2005/2006', 'VirtuĂˇlna univerzita', 'VirtuĂˇlna univerzita', NULL, NULL, 0);
INSERT INTO projects VALUES (71, 'DP', 359, NULL, 72, '2005/2006', 'ProgramovĂˇ podpora simulĂˇcie vybranĂ˝ch hybridnĂ˝ch ARQ metĂłd.', 'ProgramovĂˇ podpora simulĂˇcie vybranĂ˝ch hybridnĂ˝ch ARQ metĂłd.', NULL, NULL, 0);
INSERT INTO projects VALUES (72, 'ZP', 25, NULL, 72, '2004/2005', 'SystĂ©m pre podporu vĂ˝uÄŤby peer-to-peer technolĂłgie', 'System for support learning of Peer-to-peer technology', 'Vytvorte prehÄľad existujĂşcich rieĹˇenĂ­ v oblasti technolĂłgie p2p. V analĂ˝ze sa sĂşstreÄŹte na opis existujĂşcich rieĹˇenĂ­ neĹˇtrukturovanĂ˝ch, semi-ĹˇtrukturovanĂ˝ch a ĹˇtrukturovanĂ˝ch p2p sietĂ­, na ich vzĂˇjomnĂ© kvantitatĂ­vne a kvalitatĂ­vne porovnanie a doterajĹˇie vĂ˝sledky ich zapracovania do technolĂłgie grid. Vytvorte niekoÄľko vizualizĂˇciĂ­ pre ukĂˇĹľku ĹˇtruktĂşry a funkcie. Navrhnite a implementujte jednoduchĂ˝ systĂ©m demonĹˇtrujĂşci moĹľnosti rozkladania zĂˇĹĄaĹľe na Ăşrovni Ăşloh v sieti poÄŤĂ­taÄŤov (cluster). ', 'Vytvorte prehÄľad existujĂşcich rieĹˇenĂ­ v oblasti technolĂłgie p2p. V analĂ˝ze sa sĂşstreÄŹte na opis existujĂşcich rieĹˇenĂ­ neĹˇtrukturovanĂ˝ch, semi-ĹˇtrukturovanĂ˝ch a ĹˇtrukturovanĂ˝ch p2p sietĂ­, na ich vzĂˇjomnĂ© kvantitatĂ­vne a kvalitatĂ­vne porovnanie a doterajĹˇie vĂ˝sledky ich zapracovania do technolĂłgie grid. Vytvorte niekoÄľko vizualizĂˇciĂ­ pre ukĂˇĹľku ĹˇtruktĂşry a funkcie. Navrhnite a implementujte jednoduchĂ˝ systĂ©m demonĹˇtrujĂşci moĹľnosti rozkladania zĂˇĹĄaĹľe na Ăşrovni Ăşloh v sieti poÄŤĂ­taÄŤov (cluster). ', 0);
INSERT INTO projects VALUES (73, 'ZP', 431, NULL, 73, '2004/2005', 'MultimediĂˇlny vĂ˝uÄŤbovĂ˝ modul pre Petriho siete', 'Multimedial education module for Petri nets', 'Analyzujte problematiku tvorby multimediĂˇlnych vĂ˝uÄŤbovĂ˝ch systĂ©mov. Na zĂˇklade analĂ˝zy navrhnite a implementujte multimediĂˇlny vĂ˝uÄŤbovĂ˝ modul pre podporu vĂ˝uÄŤby Petriho sietĂ­ v rozsahu predmetu Ĺ pecifikaÄŤnĂ© a opisnĂ© jazyky.  NavrhnutĂ˝ modul by mal vhodnĂ˝m nĂˇzornĂ˝m spĂ´sobom prezentovaĹĄ uÄŤivo, umoĹľniĹĄ cviÄŤnĂ© testovanie zĂ­skanĂ˝ch vedomostĂ­ a podporovaĹĄ aj zĂ­skavanie praktickĂ˝ch zruÄŤnostĂ­ v nĂˇvrhu Petriho sietĂ­.', 'Analyzujte problematiku tvorby multimediĂˇlnych vĂ˝uÄŤbovĂ˝ch systĂ©mov. Na zĂˇklade analĂ˝zy navrhnite a implementujte multimediĂˇlny vĂ˝uÄŤbovĂ˝ modul pre podporu vĂ˝uÄŤby Petriho sietĂ­ v rozsahu predmetu Ĺ pecifikaÄŤnĂ© a opisnĂ© jazyky.  NavrhnutĂ˝ modul by mal vhodnĂ˝m nĂˇzornĂ˝m spĂ´sobom prezentovaĹĄ uÄŤivo, umoĹľniĹĄ cviÄŤnĂ© testovanie zĂ­skanĂ˝ch vedomostĂ­ a podporovaĹĄ aj zĂ­skavanie praktickĂ˝ch zruÄŤnostĂ­ v nĂˇvrhu Petriho sietĂ­.', 0);
INSERT INTO projects VALUES (74, 'DP', 431, NULL, 73, '2005/2006', 'Podpora diĹˇtanÄŤnĂ©ho vzdelĂˇvania v predmete Ĺ pecifikaÄŤnĂ© a opisnĂ© jazyky', 'Podpora diĹˇtanÄŤnĂ©ho vzdelĂˇvania v predmete Ĺ pecifikaÄŤnĂ© a opisnĂ© jazyky', NULL, NULL, 0);
INSERT INTO projects VALUES (75, 'ZP', 359, NULL, 74, '2004/2005', 'SystĂ©my so skupinovou obsluhou a skupinovĂ˝mi prĂ­chodmi', 'Systems with group servicing and group incoming', 'Vytvorte programovĂ© rieĹˇenie pre vĂ˝poÄŤet zĂˇkladnĂ˝ch charakteristĂ­k danĂ˝ch systĂ©mov s ohÄľadom na ich neerlangovskĂ© sprĂˇvanie. Urobte jednu zvolenĂş stredohodnotovĂş analĂ˝zu. Urobte jednoduchĂş grafickĂş vizualizĂˇciu procesu.', 'Vytvorte programovĂ© rieĹˇenie pre vĂ˝poÄŤet zĂˇkladnĂ˝ch charakteristĂ­k danĂ˝ch systĂ©mov s ohÄľadom na ich neerlangovskĂ© sprĂˇvanie. Urobte jednu zvolenĂş stredohodnotovĂş analĂ˝zu. Urobte jednoduchĂş grafickĂş vizualizĂˇciu procesu.', 0);
INSERT INTO projects VALUES (76, 'DP', 360, NULL, 74, '2005/2006', 'Nedokonalosti v realizĂˇcii kombinaÄŤnĂ˝ch logickĂ˝ch obvodov, HTML aplikĂˇcia', 'Nedokonalosti v realizĂˇcii kombinaÄŤnĂ˝ch logickĂ˝ch obvodov, HTML aplikĂˇcia', NULL, NULL, 0);
INSERT INTO projects VALUES (77, 'DP', 431, NULL, 75, '2005/2006', 'Podpora diĹˇtanÄŤnĂ©ho vzdelĂˇvania v predmete Ĺ pecifikaÄŤnĂ© a opisnĂ© jazyky', 'Podpora diĹˇtanÄŤnĂ©ho vzdelĂˇvania v predmete Ĺ pecifikaÄŤnĂ© a opisnĂ© jazyky', NULL, NULL, 0);
INSERT INTO projects VALUES (78, 'ZP', 431, NULL, 75, '2004/2005', 'MultimediĂˇlny vĂ˝uÄŤbovĂ˝ modul pre SystemC', 'Multimedial learning module for SystemC', 'Analyzujte problematiku tvorby multimediĂˇlnych vĂ˝uÄŤbovĂ˝ch systĂ©mov. Na zĂˇklade analĂ˝zy navrhnite a implementujte multimediĂˇlny vĂ˝uÄŤbovĂ˝ modul pre podporu vĂ˝uÄŤby jazyka SystemC. NavrhnutĂ˝ modul by mal vhodnĂ˝m nĂˇzornĂ˝m spĂ´sobom prezentovaĹĄ uÄŤivo, umoĹľniĹĄ cviÄŤnĂ© testovanie zĂ­skanĂ˝ch vedomostĂ­ a podporovaĹĄ aj zĂ­skavanie praktickĂ˝ch zruÄŤnostĂ­ v nĂˇvrhu SystemC modelov.', 'Analyzujte problematiku tvorby multimediĂˇlnych vĂ˝uÄŤbovĂ˝ch systĂ©mov. Na zĂˇklade analĂ˝zy navrhnite a implementujte multimediĂˇlny vĂ˝uÄŤbovĂ˝ modul pre podporu vĂ˝uÄŤby jazyka SystemC. NavrhnutĂ˝ modul by mal vhodnĂ˝m nĂˇzornĂ˝m spĂ´sobom prezentovaĹĄ uÄŤivo, umoĹľniĹĄ cviÄŤnĂ© testovanie zĂ­skanĂ˝ch vedomostĂ­ a podporovaĹĄ aj zĂ­skavanie praktickĂ˝ch zruÄŤnostĂ­ v nĂˇvrhu SystemC modelov.', 0);
INSERT INTO projects VALUES (79, 'ZP', 13, 431, 76, '2004/2005', 'PriebeĹľnĂˇ diagnostika a nĂˇvrh kontrolĂłrov ', 'On-line testing and design of checkers', 'PreĹˇtudujte metodiky priebeĹľnej diagnostiky, nĂˇvrhy kontrolĂłrov pre digitĂˇlne obvody. OpĂ­Ĺˇte ich funkÄŤnost vo VHDL. Navrhnite systĂ©m pre automatickĂş syntĂ©zu vybranĂ˝ch blokov priebeĹľnej diagnostiky k obvodom modelovanĂ˝m vo VHDL. SystĂ©m implementujte v jazyku JAVA, funkÄŤnosĹĄ overte na prĂ­kladoch. ', 'PreĹˇtudujte metodiky priebeĹľnej diagnostiky, nĂˇvrhy kontrolĂłrov pre digitĂˇlne obvody. OpĂ­Ĺˇte ich funkÄŤnost vo VHDL. Navrhnite systĂ©m pre automatickĂş syntĂ©zu vybranĂ˝ch blokov priebeĹľnej diagnostiky k obvodom modelovanĂ˝m vo VHDL. SystĂ©m implementujte v jazyku JAVA, funkÄŤnosĹĄ overte na prĂ­kladoch. ', 0);
INSERT INTO projects VALUES (80, 'DP', 13, 301, 76, '2005/2006', 'E-systĂ©m pre priebeĹľnĂş diagnostiku', 'E-systĂ©m pre priebeĹľnĂş diagnostiku', NULL, NULL, 0);
INSERT INTO projects VALUES (81, 'DP', 19, NULL, 78, '2005/2006', 'Vytvorenie a udrĹľiavanie modelu pouĹľĂ­vateÄľa', 'Vytvorenie a udrĹľiavanie modelu pouĹľĂ­vateÄľa', NULL, NULL, 1);
INSERT INTO projects VALUES (82, 'DP', 301, NULL, 80, '2005/2006', 'MultimediĂˇlny vĂ˝uÄŤbovĂ˝ systĂ©m pre ArchitektĂşru poÄŤĂ­taÄŤov', 'MultimediĂˇlny vĂ˝uÄŤbovĂ˝ systĂ©m pre ArchitektĂşru poÄŤĂ­taÄŤov', NULL, NULL, 0);
INSERT INTO projects VALUES (83, 'ZP', 375, NULL, 81, '2004/2005', 'Prostriedky pre podporu vĂ˝uÄŤby poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Tools for teaching support of computer networking', 'Analyzujte rĂ´zne systĂ©my zaoberajĂşce sa problematikou efektĂ­vnej vĂ˝uÄŤby
poÄŤĂ­taÄŤovĂ˝ch sietĂ­ - od jednoduchĂ©ho zobrazovania komunikĂˇcie po multimediĂˇlne systĂ©my.  Navrhnite a implementujte vĂ˝vojove prostredie pre jednoduchĂ© vytvĂˇranie komunikaÄŤnĂ˝ch modulov a aplikĂˇciĂ­ nad API rozhranĂ­m. Navrhite niekoÄľko jednoduchĂ˝ch sieĹĄovĂ˝ch aplikĂˇciĂ­, ktorĂ˝mi overĂ­te funkÄŤnosĹĄ rieĹˇenia.    ', 'Analyzujte rĂ´zne systĂ©my zaoberajĂşce sa problematikou efektĂ­vnej vĂ˝uÄŤby
poÄŤĂ­taÄŤovĂ˝ch sietĂ­ - od jednoduchĂ©ho zobrazovania komunikĂˇcie po multimediĂˇlne systĂ©my.  Navrhnite a implementujte vĂ˝vojove prostredie pre jednoduchĂ© vytvĂˇranie komunikaÄŤnĂ˝ch modulov a aplikĂˇciĂ­ nad API rozhranĂ­m. Navrhite niekoÄľko jednoduchĂ˝ch sieĹĄovĂ˝ch aplikĂˇciĂ­, ktorĂ˝mi overĂ­te funkÄŤnosĹĄ rieĹˇenia.    ', 0);
INSERT INTO projects VALUES (84, 'DP', 270, NULL, 81, '2005/2006', 'SprĂ­stupĹovanie dokumentov s vyuĹľitĂ­m metadĂˇt', 'SprĂ­stupĹovanie dokumentov s vyuĹľitĂ­m metadĂˇt', NULL, NULL, 4);
INSERT INTO projects VALUES (85, 'ZP', 297, NULL, 83, '2003/2004', 'SpĂˇjanie programov v rĂ´znych programovacĂ­ch jazykoch', 'SpĂˇjanie programov v rĂ´znych programovacĂ­ch jazykoch', 'Analyzujte spĂ´soby a metĂłdy spojenia dvoch programovacĂ­ch jazykov do vĂ˝slednĂ©ho programu. Urobte zhodnotenie podÄľa najvhodnejĹˇĂ­ch kritĂ©riĂ­. NapĂ­Ĺˇte niekoÄľko  jednoduchĂ˝ch prĂ­kladov , ktorĂ© poslĂşĹľia na porovnanie vybranĂ˝ch metĂłd. Vypracujte prĂ­ruÄŤku s nĂˇvodom na pouĹľĂ­vanie danĂ˝ch metĂłd v zvolenom implementaÄŤnom prostredĂ­. Vyberte najlepĹˇiu metĂłdu, ktorou docielite s ÄŤo najmenĹˇou nĂˇmahou efektĂ­vnejĹˇĂ­ vĂ˝slednĂ˝ program', 'Analyzujte spĂ´soby a metĂłdy spojenia dvoch programovacĂ­ch jazykov do vĂ˝slednĂ©ho programu. Urobte zhodnotenie podÄľa najvhodnejĹˇĂ­ch kritĂ©riĂ­. NapĂ­Ĺˇte niekoÄľko  jednoduchĂ˝ch prĂ­kladov , ktorĂ© poslĂşĹľia na porovnanie vybranĂ˝ch metĂłd. Vypracujte prĂ­ruÄŤku s nĂˇvodom na pouĹľĂ­vanie danĂ˝ch metĂłd v zvolenom implementaÄŤnom prostredĂ­. Vyberte najlepĹˇiu metĂłdu, ktorou docielite s ÄŤo najmenĹˇou nĂˇmahou efektĂ­vnejĹˇĂ­ vĂ˝slednĂ˝ program', 1);
INSERT INTO projects VALUES (86, 'DP', 401, NULL, 83, '2005/2006', 'PredikÄŤnĂ© dolovanie v dĂˇtach pomocou modelovĂ˝ch stromov', 'PredikÄŤnĂ© dolovanie v dĂˇtach pomocou modelovĂ˝ch stromov', NULL, NULL, 4);
INSERT INTO projects VALUES (87, 'ZP', 357, NULL, 85, '2004/2005', 'Web aplikĂˇcia na interkatĂ­vnu registrĂˇciu pouĹľĂ­vateÄľskĂ˝ch Ăşdajov', 'Web application for interactive registration of userâ€™s data', 'Analyzujte a navrhnite bezpeÄŤnĂ˝ interaktĂ­vny web na registrĂˇciu klientov, ktorĂ˝ umoĹľnĂ­ ukladanie a editovanie Ăşdajov klientov do databĂˇzy.
Analyzujte vyuĹľitie rĂ´znych implementaÄŤnĂ˝ch nĂˇstrojov ako aj vhodnosti operaÄŤnĂ˝ch systĂ©mov.
Realizujte funkÄŤnĂ˝ model takĂ©hoto  systĂ©mu na bĂˇze Linuxu, PHP a MySQL databĂˇzy.
Otestujte funkÄŤnosĹĄ, stabilitu systĂ©mu.
', 'Analyzujte a navrhnite bezpeÄŤnĂ˝ interaktĂ­vny web na registrĂˇciu klientov, ktorĂ˝ umoĹľnĂ­ ukladanie a editovanie Ăşdajov klientov do databĂˇzy.
Analyzujte vyuĹľitie rĂ´znych implementaÄŤnĂ˝ch nĂˇstrojov ako aj vhodnosti operaÄŤnĂ˝ch systĂ©mov.
Realizujte funkÄŤnĂ˝ model takĂ©hoto  systĂ©mu na bĂˇze Linuxu, PHP a MySQL databĂˇzy.
Otestujte funkÄŤnosĹĄ, stabilitu systĂ©mu.
', 0);
INSERT INTO projects VALUES (88, 'DP', 437, NULL, 85, '2005/2006', 'OdporĂşÄŤanie webovĂ˝ch strĂˇnok so zaujĂ­mavou informĂˇciou pomocou vÄŤiel', 'OdporĂşÄŤanie webovĂ˝ch strĂˇnok so zaujĂ­mavou informĂˇciou pomocou vÄŤiel', NULL, NULL, 4);
INSERT INTO projects VALUES (89, 'ZP', 298, NULL, 86, '2004/2005', 'MultimediĂˇlna prezentĂˇcia informĂˇciĂ­', 'Multimedia Presentation Of Information', 'Analyzujte moĹľnosti multimediĂˇlnej prezentĂˇcie informĂˇciĂ­. Navrhnite a implementujte vĂ˝uÄŤbovĂ˝ systĂ©m pre prezentĂˇciu informĂˇciĂ­ z predmetu PerifĂ©rne zariadenia â€“ tĂ©my 6 aĹľ 10. SystĂ©m mĂˇ obsahovaĹĄ moĹľnosĹĄ poskytnĂşĹĄ zĂˇujemcovi ĹˇtudijnĂ© materiĂˇly, ako aj mechanizmy overovania znalostĂ­ naĹˇtudovanĂ˝ch textov.', 'Analyzujte moĹľnosti multimediĂˇlnej prezentĂˇcie informĂˇciĂ­. Navrhnite a implementujte vĂ˝uÄŤbovĂ˝ systĂ©m pre prezentĂˇciu informĂˇciĂ­ z predmetu PerifĂ©rne zariadenia â€“ tĂ©my 6 aĹľ 10. SystĂ©m mĂˇ obsahovaĹĄ moĹľnosĹĄ poskytnĂşĹĄ zĂˇujemcovi ĹˇtudijnĂ© materiĂˇly, ako aj mechanizmy overovania znalostĂ­ naĹˇtudovanĂ˝ch textov.', 0);
INSERT INTO projects VALUES (90, 'DP', 387, NULL, 86, '2005/2006', 'OdporĂşÄŤanie pomocou asociaÄŤnĂ˝ch pravidiel', 'OdporĂşÄŤanie pomocou asociaÄŤnĂ˝ch pravidiel', NULL, NULL, 4);
INSERT INTO projects VALUES (91, 'DP', 437, NULL, 87, '2005/2006', 'OpoznĂˇmkovanie sprĂ­stupĹovanĂ˝ch webovĂ˝ch strĂˇnok poÄŤas sprĂ­stupĹovania', 'OpoznĂˇmkovanie sprĂ­stupĹovanĂ˝ch webovĂ˝ch strĂˇnok poÄŤas sprĂ­stupĹovania', NULL, NULL, 1);
INSERT INTO projects VALUES (92, 'ZP', 660, NULL, 87, '2004/2005', 'CSIDC 2005', 'CSIDC 2005', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 1);
INSERT INTO projects VALUES (93, 'DP', 97, NULL, 88, '2005/2006', 'TransformĂˇcie UML diagramov v prostredĂ­ IBM Rational Software Architect', 'TransformĂˇcie UML diagramov v prostredĂ­ IBM Rational Software Architect', NULL, NULL, 1);
INSERT INTO projects VALUES (94, 'ZP', 674, NULL, 89, '2004/2005', 'InteraktĂ­vna kolaboratĂ­vna trojrozmernĂˇ vizualizĂˇcia modelov a dĂˇt', 'Interactive Collaboration Three-dimensional Visualization Models and Data ', 'Analyzujte niektorĂ© sĂşÄŤasnĂ© prĂ­stupy k interaktĂ­vnej kolaboratĂ­vnej vizualizĂˇcii. Navrhnite a vytvorte systĂ©m umoĹľĹujĂşci vizualizĂˇciu modelov a z nich zĂ­skanĂ˝ch dĂˇt v trojrozmernom priestore. S vizualizovanĂ˝mi dĂˇtami, parametrami modelov a objektami budĂş mĂ´cĹĄ manipulovaĹĄ viacerĂ­ pouĹľĂ­vatelia (z rĂ´znych poÄŤĂ­taÄŤov pripojenĂ˝ch do siete) sĂşÄŤasne. ZabezpeÄŤte, aby pouĹľĂ­vatelia, ktorĂ­ sa nevidia, mohli koordinovaĹĄ svoju prĂˇcu vo vizualizovanej scĂ©ne. RieĹˇenie realizujte v jazyku Java s pouĹľitĂ­m kniĹľnice Java3D (prĂ­padne v inom jazyku a prostredĂ­, ktorĂ© mĂˇ vhodnĂ© vlastnosti). FunkÄŤnosĹĄ rieĹˇenia otestujte na prĂ­kladoch.', 'Analyzujte niektorĂ© sĂşÄŤasnĂ© prĂ­stupy k interaktĂ­vnej kolaboratĂ­vnej vizualizĂˇcii. Navrhnite a vytvorte systĂ©m umoĹľĹujĂşci vizualizĂˇciu modelov a z nich zĂ­skanĂ˝ch dĂˇt v trojrozmernom priestore. S vizualizovanĂ˝mi dĂˇtami, parametrami modelov a objektami budĂş mĂ´cĹĄ manipulovaĹĄ viacerĂ­ pouĹľĂ­vatelia (z rĂ´znych poÄŤĂ­taÄŤov pripojenĂ˝ch do siete) sĂşÄŤasne. ZabezpeÄŤte, aby pouĹľĂ­vatelia, ktorĂ­ sa nevidia, mohli koordinovaĹĄ svoju prĂˇcu vo vizualizovanej scĂ©ne. RieĹˇenie realizujte v jazyku Java s pouĹľitĂ­m kniĹľnice Java3D (prĂ­padne v inom jazyku a prostredĂ­, ktorĂ© mĂˇ vhodnĂ© vlastnosti). FunkÄŤnosĹĄ rieĹˇenia otestujte na prĂ­kladoch.', 1);
INSERT INTO projects VALUES (95, 'ZP', 16, NULL, 90, '2004/2005', 'SystĂ©m na podporu multiparadigmovĂ©ho nĂˇvrhu', 'System for support of multi-paradigm design', 'Programovacie jazyky poskytujĂş rĂ´zne mechanizmy (paradigmy) na modelovanie domĂ©ny aplikĂˇcie. V multiparadigmovom nĂˇvrhu sa vĂ˝ber tĂ˝chto mechanizmov uskutoÄŤĹuje explicitne na zĂˇklade analĂ˝zy domĂ©ny aplikĂˇcie a domĂ©ny rieĹˇenia (t.j. programovacieho jazyka).
Analyzujte moĹľnosti podpory modelovania vlastnostĂ­ (feature modeling) â€” predovĹˇetkĂ˝m diagramov vlastnostĂ­ (feature diagrams) â€” pre potreby multiparadigmovĂ©ho nĂˇvrhu. Analyzujte aj moĹľnosĹĄ podpory transformaÄŤnej analĂ˝zy, t.j. mapovania modelu vlastnostĂ­ domĂ©ny aplikĂˇcie na model vlastnostĂ­ domĂ©ny rieĹˇenia.
Navrhnite a implementujte systĂ©m na podporu multiparadigmovĂ©ho nĂˇvrhu zaloĹľenĂ˝ na modelovanĂ­ vlastnostĂ­. Pri tvorbe systĂ©mu zvĂˇĹľte pouĹľitie multiparadigmovĂ©ho nĂˇvrhu a implementĂˇcie v jazyku AspectJ (aspektovo-orientovanĂ© rozĹˇĂ­renie Javy).
', 'Programovacie jazyky poskytujĂş rĂ´zne mechanizmy (paradigmy) na modelovanie domĂ©ny aplikĂˇcie. V multiparadigmovom nĂˇvrhu sa vĂ˝ber tĂ˝chto mechanizmov uskutoÄŤĹuje explicitne na zĂˇklade analĂ˝zy domĂ©ny aplikĂˇcie a domĂ©ny rieĹˇenia (t.j. programovacieho jazyka).
Analyzujte moĹľnosti podpory modelovania vlastnostĂ­ (feature modeling) â€” predovĹˇetkĂ˝m diagramov vlastnostĂ­ (feature diagrams) â€” pre potreby multiparadigmovĂ©ho nĂˇvrhu. Analyzujte aj moĹľnosĹĄ podpory transformaÄŤnej analĂ˝zy, t.j. mapovania modelu vlastnostĂ­ domĂ©ny aplikĂˇcie na model vlastnostĂ­ domĂ©ny rieĹˇenia.
Navrhnite a implementujte systĂ©m na podporu multiparadigmovĂ©ho nĂˇvrhu zaloĹľenĂ˝ na modelovanĂ­ vlastnostĂ­. Pri tvorbe systĂ©mu zvĂˇĹľte pouĹľitie multiparadigmovĂ©ho nĂˇvrhu a implementĂˇcie v jazyku AspectJ (aspektovo-orientovanĂ© rozĹˇĂ­renie Javy).
', 1);
INSERT INTO projects VALUES (96, 'DP', 579, NULL, 93, '2005/2006', 'SystĂ©m zĂ­skavania doplĹujĂşcich informĂˇciĂ­', 'System for obtaining additional information', NULL, NULL, 1);
INSERT INTO projects VALUES (97, 'ZP', 579, NULL, 93, '2003/2004', 'VyuĹľitie multimediĂˇlnych foriem vĂ˝uÄŤby informatiky - 2', 'Multimedia utilization in teaching Informatics - 2', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej podoby informĂˇciĂ­ v systĂ©moch na podporu vĂ˝uÄŤby informatiky. Navrhnite zĂˇkladnĂ˝ systĂ©m a nĂˇsledne ho rozĹˇĂ­rte o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili obohatenie textovĂ©ho obsahu o rĂ´zne inĂ© formy prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na niektorom predmete podÄľa potrieb KIVT.', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej podoby informĂˇciĂ­ v systĂ©moch na podporu vĂ˝uÄŤby informatiky. Navrhnite zĂˇkladnĂ˝ systĂ©m a nĂˇsledne ho rozĹˇĂ­rte o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili obohatenie textovĂ©ho obsahu o rĂ´zne inĂ© formy prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na niektorom predmete podÄľa potrieb KIVT.', 1);
INSERT INTO projects VALUES (98, 'ZP', 660, NULL, 94, '2005/2006', 'CSIDC 2006', 'CSIDC 2006', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.
', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.
', 1);
INSERT INTO projects VALUES (99, 'ZP', 25, NULL, 99, '2005/2006', 'Monitorovanie pouĹľĂ­vateÄľskĂ˝ch procesov', 'Monitorovanie pouĹľĂ­vateÄľskĂ˝ch procesov', 'Analyzujte moĹľnosti zĂ­skania Ăşdajov o beĹľiacich procesoch (ako nĂˇzov prĂ­kazu, argumenty, pouĹľĂ­vateÄľ, alokovanĂ© prostriedky, atÄŹ.) v OS. Vypracujte nĂˇvrh systĂ©mu, ktorĂ˝ na zĂˇklade tĂ˝chto Ăşdajov a konfigurĂˇcie zadanej pouĹľĂ­vateÄľom bude sledovaĹĄ a ovplyvĹovaĹĄ stav procesov. SystĂ©m implementujte a otestujte.', 'Analyzujte moĹľnosti zĂ­skania Ăşdajov o beĹľiacich procesoch (ako nĂˇzov prĂ­kazu, argumenty, pouĹľĂ­vateÄľ, alokovanĂ© prostriedky, atÄŹ.) v OS. Vypracujte nĂˇvrh systĂ©mu, ktorĂ˝ na zĂˇklade tĂ˝chto Ăşdajov a konfigurĂˇcie zadanej pouĹľĂ­vateÄľom bude sledovaĹĄ a ovplyvĹovaĹĄ stav procesov. SystĂ©m implementujte a otestujte.', 0);
INSERT INTO projects VALUES (100, 'ZP', 360, NULL, 100, '2005/2006', 'SkupinovĂˇ minimalizĂˇcia logickĂ˝ch funkciĂ­', 'SkupinovĂˇ minimalizĂˇcia logickĂ˝ch funkciĂ­', 'Analyzujte problematiku  skupinovej minimalizĂˇcie logickĂ˝ch funkciĂ­.
Navrhnite a implementujte systĂ©m na programovĂş podporu vĂ˝uÄŤby minimalizĂˇcie booleovskĂ˝ch funkciĂ­. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch.
MĂˇ byĹĄ funkÄŤnĂ˝  pod OS Windows.

', 'Analyzujte problematiku  skupinovej minimalizĂˇcie logickĂ˝ch funkciĂ­.
Navrhnite a implementujte systĂ©m na programovĂş podporu vĂ˝uÄŤby minimalizĂˇcie booleovskĂ˝ch funkciĂ­. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch.
MĂˇ byĹĄ funkÄŤnĂ˝  pod OS Windows.

', 0);
INSERT INTO projects VALUES (101, 'ZP', 360, NULL, 101, '2005/2006', 'SkupinovĂˇ minimalizĂˇcia logickĂ˝ch funkciĂ­', 'SkupinovĂˇ minimalizĂˇcia logickĂ˝ch funkciĂ­', 'Analyzujte problematiku  skupinovej minimalizĂˇcie logickĂ˝ch funkciĂ­.
Navrhnite a implementujte systĂ©m na programovĂş podporu vĂ˝uÄŤby minimalizĂˇcie booleovskĂ˝ch funkciĂ­. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch.
MĂˇ byĹĄ funkÄŤnĂ˝  pod OS Windows.

', 'Analyzujte problematiku  skupinovej minimalizĂˇcie logickĂ˝ch funkciĂ­.
Navrhnite a implementujte systĂ©m na programovĂş podporu vĂ˝uÄŤby minimalizĂˇcie booleovskĂ˝ch funkciĂ­. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch.
MĂˇ byĹĄ funkÄŤnĂ˝  pod OS Windows.

', 0);
INSERT INTO projects VALUES (102, 'ZP', 361, NULL, 102, '2005/2006', 'Riadenie bezpeÄŤnosti informaÄŤnĂ˝ch systĂ©mov', 'Riadenie bezpeÄŤnosti informaÄŤnĂ˝ch systĂ©mov', 'Analyzujte prax v riadenĂ­ bezpeÄŤnosti poÄŤĂ­taÄŤovĂ˝ch systĂ©mov. UveÄŹte 
sĂşÄŤasnĂ˝ stav domĂ©ny bezpeÄŤnosti informaÄŤnĂ˝ch systĂ©mov (InfoSec),  prvkov a konceptov, ktorĂ© sa prekrĂ˝vajĂş. Analyzujte  nĂˇstroje na posudzovanie riadenia rizĂ­k a navhrnite vhodnĂ© nĂˇstroje na posudzovanie riadenia rizĂ­k.
', 'Analyzujte prax v riadenĂ­ bezpeÄŤnosti poÄŤĂ­taÄŤovĂ˝ch systĂ©mov. UveÄŹte 
sĂşÄŤasnĂ˝ stav domĂ©ny bezpeÄŤnosti informaÄŤnĂ˝ch systĂ©mov (InfoSec),  prvkov a konceptov, ktorĂ© sa prekrĂ˝vajĂş. Analyzujte  nĂˇstroje na posudzovanie riadenia rizĂ­k a navhrnite vhodnĂ© nĂˇstroje na posudzovanie riadenia rizĂ­k.
', 0);
INSERT INTO projects VALUES (103, 'ZP', 301, NULL, 103, '2005/2006', 'FunkÄŤnĂ˝ generĂˇtor testov VLSI obvodov - vybranĂ© moduly', 'FunkÄŤnĂ˝ generĂˇtor testov VLSI obvodov - vybranĂ© moduly', 'Analyzujte metĂłdy a spĂ´soby generovania funkÄŤnĂ˝ch testov, navrhnite a  realizujte vybranĂ© moduly systĂ©mu generovania  funkÄŤnĂ˝ch testov vnorenĂ˝ch systĂ©mov, ktorĂ˝ zostavuje funkÄŤnĂ© testy na zĂˇklade opisu obvodu v istom ĹˇpecifikaÄŤnom jazyku (VHDL). VybranĂ© moduly na vyhodnotenie ĂşÄŤinnosti generovanĂ˝ch testovacĂ­ch mixov implementujte v existujĂşcom grafickom uĹľĂ­vateÄľskom rozhranĂ­. FunkÄŤnosĹĄ implementovanĂ©ho algoritmu a vyhodnotenie ĂşÄŤinnosti generovanĂ˝ch testovacĂ­ch mixov overte na prĂ­kladoch. ', 'Analyzujte metĂłdy a spĂ´soby generovania funkÄŤnĂ˝ch testov, navrhnite a  realizujte vybranĂ© moduly systĂ©mu generovania  funkÄŤnĂ˝ch testov vnorenĂ˝ch systĂ©mov, ktorĂ˝ zostavuje funkÄŤnĂ© testy na zĂˇklade opisu obvodu v istom ĹˇpecifikaÄŤnom jazyku (VHDL). VybranĂ© moduly na vyhodnotenie ĂşÄŤinnosti generovanĂ˝ch testovacĂ­ch mixov implementujte v existujĂşcom grafickom uĹľĂ­vateÄľskom rozhranĂ­. FunkÄŤnosĹĄ implementovanĂ©ho algoritmu a vyhodnotenie ĂşÄŤinnosti generovanĂ˝ch testovacĂ­ch mixov overte na prĂ­kladoch. ', 0);
INSERT INTO projects VALUES (104, 'ZP', 215, NULL, 104, '2002/2003', 'Modelovanie sprĂˇvania sa v podmienkach neurÄŤitosti, kapitĂˇlu, danĂ­, tovarov, preferenciĂ­ z hÄľadiska cyklov a na kapitĂˇlovĂ˝ch trhoch', 'Modeling of behaviour in uncertain conditions of capital, taxes, goods, preferences, as in cycles and on the financial markets', NULL, NULL, 1);
INSERT INTO projects VALUES (105, 'DP', 437, NULL, 104, '2003/2004', 'Ĺ pecializaÄŤnĂ© vzory v navrhovanĂ­ programov', 'Specialization patterns in program design', NULL, NULL, 1);
INSERT INTO projects VALUES (106, 'ZP', 704, NULL, 105, '2002/2003', 'NĂˇvrh a implementĂˇcia rozhrania pre problĂ©movo-orientovanĂ˝ IS s predpokladom moĹľnosti zĂ­skavania podstatnĂ˝ch informĂˇcii z databĂˇz', 'Design and Implementation of Interface Problem-oriented IS with Possibility Proposal in Discovering Hidden Knowledge from DB', 'NĂˇvrh a implementĂˇcia rozhrania pre problĂ©movo-orientovanĂ˝ IS s predpokladom moĹľnosti zĂ­skavania podstatnĂ˝ch informĂˇcii z databĂˇz', 'NĂˇvrh a implementĂˇcia rozhrania pre problĂ©movo-orientovanĂ˝ IS s predpokladom moĹľnosti zĂ­skavania podstatnĂ˝ch informĂˇcii z databĂˇz', 1);
INSERT INTO projects VALUES (107, 'DP', 46, NULL, 105, '2005/2006', 'VyuĹľitie CRM v elektronickom obchode', 'CRM Utilization in E-business', NULL, NULL, 1);
INSERT INTO projects VALUES (108, 'ZP', 579, NULL, 106, '2003/2004', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS â€“ 2', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS â€“ 2', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie existujĂşceho zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb KIVT.', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie existujĂşceho zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb KIVT.', 1);
INSERT INTO projects VALUES (109, 'ZP', 660, NULL, 108, '2002/2003', 'CSIDC', 'CSIDC', NULL, NULL, 1);
INSERT INTO projects VALUES (110, 'DP', 660, NULL, 108, '2003/2004', 'Objavovanie znalostĂ­ o sprĂˇvanĂ­ sa Ĺˇtudenta pri uÄŤenĂ­ sa programovaĹĄ', 'Discovery of knowledge about student`s behavior during the process of learning programming', NULL, NULL, 1);
INSERT INTO projects VALUES (111, 'ZP', 294, NULL, 109, '2002/2003', 'NavigĂˇcia v informaÄŤnom hyperpriestore pomocou virtuĂˇlnej reality formou 3D modelov', 'Navigation in information hyperspaces using virtual reality in form of 3D models', NULL, NULL, 1);
INSERT INTO projects VALUES (112, 'DP', 294, NULL, 109, '2003/2004', 'AnimĂˇcia vĂ˝razov tvĂˇre', 'Eacial Expressions Animation', NULL, NULL, 1);
INSERT INTO projects VALUES (113, 'ZP', 298, NULL, 110, '2005/2006', 'GenerĂˇtor konfigurĂˇciĂ­ pre Cisco smerovaÄŤe', 'GenerĂˇtor konfigurĂˇciĂ­ pre Cisco smerovaÄŤe', 'Analyzujte syntax prĂ­kazov pre konfigurĂˇciu Cisco smerovaÄŤov (IOS). Navrhnite a implementujte programovĂ˝ systĂ©m, generujĂşci takĂşto konfigurĂˇciu z neformĂˇlneho opisu vyĹľadovanĂ©ho sprĂˇvania sa smerovaÄŤa. VstupnĂˇ ĹˇpecifikĂˇcia bude napr. v tvare obrĂˇzku, definujĂşcom vzĹĄahy a vlastnosti jednotlivĂ˝ch prepojenĂ˝ch smerovaÄŤov. VĂ˝stupnĂ˝ sĂşbor bude obsahovaĹĄ konfiguraÄŤnĂ© prĂ­kazy podobne, ako sĂş uvedenĂ© na konzole smerovaÄŤa pri vĂ˝pise konfigurĂˇcie (prĂ­kaz sh run). ', 'Analyzujte syntax prĂ­kazov pre konfigurĂˇciu Cisco smerovaÄŤov (IOS). Navrhnite a implementujte programovĂ˝ systĂ©m, generujĂşci takĂşto konfigurĂˇciu z neformĂˇlneho opisu vyĹľadovanĂ©ho sprĂˇvania sa smerovaÄŤa. VstupnĂˇ ĹˇpecifikĂˇcia bude napr. v tvare obrĂˇzku, definujĂşcom vzĹĄahy a vlastnosti jednotlivĂ˝ch prepojenĂ˝ch smerovaÄŤov. VĂ˝stupnĂ˝ sĂşbor bude obsahovaĹĄ konfiguraÄŤnĂ© prĂ­kazy podobne, ako sĂş uvedenĂ© na konzole smerovaÄŤa pri vĂ˝pise konfigurĂˇcie (prĂ­kaz sh run). ', 0);
INSERT INTO projects VALUES (114, 'ZP', 557, NULL, 111, '2002/2003', 'VyuĹľitie aditĂ­vnych generĂˇtorov v kryptografii', 'Usage of additive generators in cryptography', NULL, NULL, 1);
INSERT INTO projects VALUES (115, 'DP', 704, NULL, 111, '2003/2004', 'VizualizĂˇcia modulov pre system VU', 'Visualization of modules for the system of VU', NULL, NULL, 1);
INSERT INTO projects VALUES (116, 'ZP', 25, NULL, 113, '2005/2006', 'Monitorovanie stavu operaÄŤnĂ©ho systĂ©mu', 'Monitorovanie stavu operaÄŤnĂ©ho systĂ©mu', 'Analyzujte parametre podstatnĂ© pre sprĂˇvnu a spoÄľahlivĂş ÄŤinnosĹĄ operaÄŤnĂ©ho systĂ©mu, ako naprĂ­klad IP adresy, sieĹĄovĂ© spojenia, pravidlĂˇ "firewall-u", vyĹĄaĹľenosĹĄ, beĹľiace procesy, zavedenĂ© moduly, atÄŹ. Navrhnite systĂ©m sledovania a vyhodnocovania tĂ˝chto parametrov, ako aj spĂ´sob reakcie na ich zmeny za ĂşÄŤelom udrĹľania korektnĂ©ho stavu. SledovanĂ© parametre, ich hodnoty ako aj poĹľadovanĂ© reakcie musia byĹĄ konfigurovateÄľnĂ©. ZvĂˇĹľte moĹľnosĹĄ implementĂˇcie ako pouĹľĂ­vateÄľskĂ©ho procesu, respektĂ­ve ako sĂşÄŤasĹĄ jadra OS. NavrhnutĂ˝ systĂ©m implementujte a otestujte.', 'Analyzujte parametre podstatnĂ© pre sprĂˇvnu a spoÄľahlivĂş ÄŤinnosĹĄ operaÄŤnĂ©ho systĂ©mu, ako naprĂ­klad IP adresy, sieĹĄovĂ© spojenia, pravidlĂˇ "firewall-u", vyĹĄaĹľenosĹĄ, beĹľiace procesy, zavedenĂ© moduly, atÄŹ. Navrhnite systĂ©m sledovania a vyhodnocovania tĂ˝chto parametrov, ako aj spĂ´sob reakcie na ich zmeny za ĂşÄŤelom udrĹľania korektnĂ©ho stavu. SledovanĂ© parametre, ich hodnoty ako aj poĹľadovanĂ© reakcie musia byĹĄ konfigurovateÄľnĂ©. ZvĂˇĹľte moĹľnosĹĄ implementĂˇcie ako pouĹľĂ­vateÄľskĂ©ho procesu, respektĂ­ve ako sĂşÄŤasĹĄ jadra OS. NavrhnutĂ˝ systĂ©m implementujte a otestujte.', 0);
INSERT INTO projects VALUES (117, 'ZP', 705, NULL, 114, '2002/2003', 'AutomatickĂ˝ nĂˇvrh mostĂ­kovĂ˝ch hradlovĂ˝ch obvodov', 'Automatic design bridge-gates circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (118, 'DP', 25, NULL, 114, '2003/2004', 'Riadenie vlastnostĂ­ prenosovĂ©ho kanĂˇlu', 'Control of network channel characteristic', NULL, NULL, 0);
INSERT INTO projects VALUES (119, 'ZP', 672, NULL, 115, '2003/2004', 'KomunikaÄŤnĂˇ sieĹĄ ako graf typu â€žmalĂ˝ svetâ€ś', 'KomunikaÄŤnĂˇ sieĹĄ ako graf typu â€žmalĂ˝ svetâ€ś', 'Siete â€žmalĂ©ho svetaâ€ś sĂş v sĂşÄŤasnosti v popredĂ­ zĂˇujmu matematikov a fyzikov.  Pomocou modelov â€žmalĂ©ho svetaâ€ś  mĂ´Ĺľeme  pochopiĹĄ ĹˇtruktĂşru sociĂˇlnych a komunikaÄŤnĂ˝ch sietĂ­, ako sietĂ­, ktorĂ© v sebe zahĹ•ĹajĂş jednak prvok nĂˇhodnosti, jednak prvok lokĂˇlnej usporiadanosti. Prvok nĂˇhodnosti je zodpovednĂ˝ za efektĂ­vnosĹĄ prepojenĂ­ uzlov v sieti a ich malĂş separĂˇciu, prvok usporiadanosti  za lokĂˇlnu ĹˇtruktĂşru uzlov a klasterizĂˇciu. Ăšlohou rieĹˇiteÄľa je: PreĹˇtudovaĹĄ teĂłriu sietĂ­ â€žmalĂ©ho svetaâ€ś a dostupnĂ© modely. AnalyzovaĹĄ prepojenosĹĄ a ĹˇtruktĂşru www strĂˇnok, alebo ineho reĂˇlneho problĂ©mu (napr. graf semantickej blĂ­zkosti slov) podÄľa vybranej ĹˇpecifikĂˇcie. NavrhnĂşĹĄ model prepojenĂ­  ako model â€žmalĂ©ho svetaâ€ś. OveriĹĄ funkÄŤnosĹĄ modelu.  PracovaĹĄ v Linuxe', 'Siete â€žmalĂ©ho svetaâ€ś sĂş v sĂşÄŤasnosti v popredĂ­ zĂˇujmu matematikov a fyzikov.  Pomocou modelov â€žmalĂ©ho svetaâ€ś  mĂ´Ĺľeme  pochopiĹĄ ĹˇtruktĂşru sociĂˇlnych a komunikaÄŤnĂ˝ch sietĂ­, ako sietĂ­, ktorĂ© v sebe zahĹ•ĹajĂş jednak prvok nĂˇhodnosti, jednak prvok lokĂˇlnej usporiadanosti. Prvok nĂˇhodnosti je zodpovednĂ˝ za efektĂ­vnosĹĄ prepojenĂ­ uzlov v sieti a ich malĂş separĂˇciu, prvok usporiadanosti  za lokĂˇlnu ĹˇtruktĂşru uzlov a klasterizĂˇciu. Ăšlohou rieĹˇiteÄľa je: PreĹˇtudovaĹĄ teĂłriu sietĂ­ â€žmalĂ©ho svetaâ€ś a dostupnĂ© modely. AnalyzovaĹĄ prepojenosĹĄ a ĹˇtruktĂşru www strĂˇnok, alebo ineho reĂˇlneho problĂ©mu (napr. graf semantickej blĂ­zkosti slov) podÄľa vybranej ĹˇpecifikĂˇcie. NavrhnĂşĹĄ model prepojenĂ­  ako model â€žmalĂ©ho svetaâ€ś. OveriĹĄ funkÄŤnosĹĄ modelu.  PracovaĹĄ v Linuxe', 1);
INSERT INTO projects VALUES (120, 'ZP', 579, NULL, 116, '2005/2006', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili informaÄŤnĂ© vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb FIIT.', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili informaÄŤnĂ© vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb FIIT.', 1);
INSERT INTO projects VALUES (121, 'ZP', 95, NULL, 117, '2004/2005', 'SystĂ©m na vizuĂˇlnu evidenciu inventĂˇra', 'Building inventory visualization system', 'Analyzujte spĂ´sob uchovĂˇvania a grafickej reprezentĂˇcie objektov v 2D priestore na obrazovke poÄŤĂ­taÄŤa. Na zĂˇklade tejto analĂ˝zy navrhnite a implementujte systĂ©m, ktorĂ˝ umoĹľnĂ­ zobrazenie a interaktĂ­vnu prĂˇcu s inventĂˇrom firmy v budovĂˇch na viacerĂ˝ch podlaĹľiach', 'Analyzujte spĂ´sob uchovĂˇvania a grafickej reprezentĂˇcie objektov v 2D priestore na obrazovke poÄŤĂ­taÄŤa. Na zĂˇklade tejto analĂ˝zy navrhnite a implementujte systĂ©m, ktorĂ˝ umoĹľnĂ­ zobrazenie a interaktĂ­vnu prĂˇcu s inventĂˇrom firmy v budovĂˇch na viacerĂ˝ch podlaĹľiach', 1);
INSERT INTO projects VALUES (122, 'DP', 674, NULL, 117, '2005/2006', 'IntencionĂˇlne programovanie', 'IntencionĂˇlne programovanie', NULL, NULL, 1);
INSERT INTO projects VALUES (123, 'ZP', 297, NULL, 118, '2004/2005', 'EfektĂ­vnosĹĄ programov v jazyku strojovej Ăşrovne', 'Effectiveness of machine language programs', 'Analyzujte sprĂˇvanie  sa programu na zĂˇklade danej inĹˇtrukÄŤnej sady a znĂˇmych programovacĂ­ch technĂ­k.  Navrhnite kritĂ©rium efektĂ­vnosti strojovo orientovanĂ©ho programu viacerĂ˝mi spĂ´sobmi alebo prostriedkami.  NapĂ­Ĺˇte viacero krĂˇtkych, jednoduchĂ˝ch prĂ­kladov, ktorĂ© budĂş nĂˇzorne demonĹˇtrovaĹĄ navrhnutĂ© spĂ´soby zlepĹˇenia efektĂ­vnosti programu. VyhodnoĹĄte navrhnutĂ© spĂ´soby.', 'Analyzujte sprĂˇvanie  sa programu na zĂˇklade danej inĹˇtrukÄŤnej sady a znĂˇmych programovacĂ­ch technĂ­k.  Navrhnite kritĂ©rium efektĂ­vnosti strojovo orientovanĂ©ho programu viacerĂ˝mi spĂ´sobmi alebo prostriedkami.  NapĂ­Ĺˇte viacero krĂˇtkych, jednoduchĂ˝ch prĂ­kladov, ktorĂ© budĂş nĂˇzorne demonĹˇtrovaĹĄ navrhnutĂ© spĂ´soby zlepĹˇenia efektĂ­vnosti programu. VyhodnoĹĄte navrhnutĂ© spĂ´soby.', 1);
INSERT INTO projects VALUES (124, 'DP', 16, NULL, 118, '2005/2006', 'Prekonanie rozdielov medzi aspektovo-orientovanĂ˝mi jazykmi pomocou prĂ­stupu MDA', 'Prekonanie rozdielov medzi aspektovo-orientovanĂ˝mi jazykmi pomocou prĂ­stupu MDA', NULL, NULL, 1);
INSERT INTO projects VALUES (125, 'ZP', 46, NULL, 119, '2006/2007', 'VizualizĂˇcia procesu vytvĂˇrania a pouĹľĂ­vania ADT softvĂ©rovĂ˝ch v aplikĂˇciach', 'VizualizĂˇcia procesu vytvĂˇrania a pouĹľĂ­vania ADT softvĂ©rovĂ˝ch v aplikĂˇciach', 'AbstraktnĂ© ĂşdajovĂ© typy  (ADT) povaĹľujeme za urÄŤitĂ© stavebnĂ© bloky  pri budovanĂ­ aplikĂˇciĂ­ zaloĹľenĂ˝ch na objektovo orientovanej paradigme. PreĹˇtudujte  problematiku tvorby ADT a tieĹľ moĹľnosti implementaÄŤnĂ˝ch prostriedkov. Na zĂˇklade analĂ˝zy, vytvorte aplikĂˇciu, ktorĂˇ vysvetlĂ­ vybranĂ© ADTs a bude vizualizovaĹĄ proces vytvĂˇrania a pouĹľĂ­vania vybranĂ˝ch ADT vo zvolenej aplikĂˇcii.  ', 'AbstraktnĂ© ĂşdajovĂ© typy  (ADT) povaĹľujeme za urÄŤitĂ© stavebnĂ© bloky  pri budovanĂ­ aplikĂˇciĂ­ zaloĹľenĂ˝ch na objektovo orientovanej paradigme. PreĹˇtudujte  problematiku tvorby ADT a tieĹľ moĹľnosti implementaÄŤnĂ˝ch prostriedkov. Na zĂˇklade analĂ˝zy, vytvorte aplikĂˇciu, ktorĂˇ vysvetlĂ­ vybranĂ© ADTs a bude vizualizovaĹĄ proces vytvĂˇrania a pouĹľĂ­vania vybranĂ˝ch ADT vo zvolenej aplikĂˇcii.  ', 1);
INSERT INTO projects VALUES (126, 'ZP', 27, NULL, 120, '2002/2003', 'Ĺ tĂşdia rozhrania objektovo orientovanĂ©ho operaÄŤnĂ©ho systĂ©mu', 'Ĺ tĂşdia rozhrania objektovo orientovanĂ©ho operaÄŤnĂ©ho systĂ©mu', NULL, NULL, 1);
INSERT INTO projects VALUES (127, 'DP', 27, NULL, 120, '2003/2004', 'RozĹˇĂ­renie kniĹľnice Open Inventor', 'Extension of Open Inventor library', NULL, NULL, 1);
INSERT INTO projects VALUES (128, 'DP', 98, NULL, 121, '2005/2006', 'Rodostrom', 'Rodostrom', NULL, NULL, 4);
INSERT INTO projects VALUES (129, 'ZP', 95, NULL, 121, '2003/2004', 'Tvorba ĹˇpecifikĂˇciĂ­ v Z jazyku', 'Creating specifications in Z Language', 'Analyzujte problematiku tvorby Z-ĹˇpecifikĂˇciĂ­ z hÄľadiska moĹľnosti vizualizĂˇcie schĂ©m a formĂşl Z-jazyka. Analyzujte moĹľnosti, ktorĂ© poskytuje prostriedok na prezeranie Z-ĹˇpecifikĂˇciĂ­, Z-Browser. Na zĂˇklade tejto analĂ˝zy  navrhnite a implementujte model systĂ©mu, ktorĂ˝ podporĂ­ vizualizĂˇciu ÄŤĂ­tania a zĂˇpisu Z-formĂşl.', 'Analyzujte problematiku tvorby Z-ĹˇpecifikĂˇciĂ­ z hÄľadiska moĹľnosti vizualizĂˇcie schĂ©m a formĂşl Z-jazyka. Analyzujte moĹľnosti, ktorĂ© poskytuje prostriedok na prezeranie Z-ĹˇpecifikĂˇciĂ­, Z-Browser. Na zĂˇklade tejto analĂ˝zy  navrhnite a implementujte model systĂ©mu, ktorĂ˝ podporĂ­ vizualizĂˇciu ÄŤĂ­tania a zĂˇpisu Z-formĂşl.', 1);
INSERT INTO projects VALUES (130, 'ZP', 422, 704, 122, '2003/2004', 'NovĂ˝ design www.rubriky.sk', 'Design of www.rubriky.net', 'Navrhnite novĂ˝ design strĂˇnok www.rubriky.sk s vyuĹľitĂ­m MYSQL databĂˇz. Realizujte tento nĂˇvrh tak, aby boli uloĹľenĂ© jednotlivĂ© rubriky z www.rubriky.sk v databĂˇze a vytvorte GUI (grafickĂ˝ uĹľĂ­vateÄľskĂ˝ nĂˇstroj) pre sprĂˇvu tĂ˝chto rubrĂ­k pre superuĹľĂ­vateÄľa a prĂ­stup na prezeranie pre ĹˇtandardnĂ©ho uĹľĂ­vateÄľa. UĹľĂ­vateÄľ mĂˇ maĹĄ k dispozĂ­cii novĂş funkciu vyhÄľadaj (search) text alebo skladatela.  PrĂˇcu realizujte v jazyku PHP.', 'Navrhnite novĂ˝ design strĂˇnok www.rubriky.sk s vyuĹľitĂ­m MYSQL databĂˇz. Realizujte tento nĂˇvrh tak, aby boli uloĹľenĂ© jednotlivĂ© rubriky z www.rubriky.sk v databĂˇze a vytvorte GUI (grafickĂ˝ uĹľĂ­vateÄľskĂ˝ nĂˇstroj) pre sprĂˇvu tĂ˝chto rubrĂ­k pre superuĹľĂ­vateÄľa a prĂ­stup na prezeranie pre ĹˇtandardnĂ©ho uĹľĂ­vateÄľa. UĹľĂ­vateÄľ mĂˇ maĹĄ k dispozĂ­cii novĂş funkciu vyhÄľadaj (search) text alebo skladatela.  PrĂˇcu realizujte v jazyku PHP.', 1);
INSERT INTO projects VALUES (131, 'DP', 579, NULL, 122, '2005/2006', 'SystĂ©m optimalizĂˇcie rozvrhov', 'SystĂ©m optimalizĂˇcie rozvrhov', NULL, NULL, 1);
INSERT INTO projects VALUES (132, 'ZP', 375, NULL, 123, '2002/2003', 'Spracovanie cyklickĂ˝ch voltamperometrickĂ˝ch meranĂ­', 'Elaboration of Cyclical Voltampermetric Measuring', NULL, NULL, 0);
INSERT INTO projects VALUES (133, 'DP', 298, NULL, 123, '2003/2004', 'SystĂ©m pre vytvĂˇranie HTML prezentĂˇcie informaÄŤnĂ˝ch materiĂˇlov', 'System for creating HTML presentations from information materials', NULL, NULL, 0);
INSERT INTO projects VALUES (134, 'ZP', 704, NULL, 124, '2005/2006', 'Editor zdrojovĂ˝ch programov v stave ich  zdieÄľania', 'Editor zdrojovĂ˝ch programov v stave ich  zdieÄľania', 'Analyzujte vlastnosti editorov zdrojovĂ˝ch programov  a  moĹľnosti zdieÄľania dokumentov obsahujĂşcich zdrojovĂ©  programy pri tĂ­movej prĂˇci .  Analyzujte  moĹľnosti , spĂ´soby a princĂ­py podpory tĂ­movej prĂˇce pri tvorbe takĂ˝chto dokumentov .  Navrhnite editor zdrojovĂ˝ch programov , ktorĂ˝ bude podporovaĹĄ  zvĂ˝razĹovanie syntaxe (vybranĂ©ho)  programovacieho jazyka a umoĹľnĂ­ zostavovanie celku z jednotlivĂ˝ch ÄŤastĂ­ vytvorenĂ˝ch v tĂ­me. DoporuÄŤenĂ˝ implementaÄŤnĂ˝ jazyk - jazyk Java.
 
', 'Analyzujte vlastnosti editorov zdrojovĂ˝ch programov  a  moĹľnosti zdieÄľania dokumentov obsahujĂşcich zdrojovĂ©  programy pri tĂ­movej prĂˇci .  Analyzujte  moĹľnosti , spĂ´soby a princĂ­py podpory tĂ­movej prĂˇce pri tvorbe takĂ˝chto dokumentov .  Navrhnite editor zdrojovĂ˝ch programov , ktorĂ˝ bude podporovaĹĄ  zvĂ˝razĹovanie syntaxe (vybranĂ©ho)  programovacieho jazyka a umoĹľnĂ­ zostavovanie celku z jednotlivĂ˝ch ÄŤastĂ­ vytvorenĂ˝ch v tĂ­me. DoporuÄŤenĂ˝ implementaÄŤnĂ˝ jazyk - jazyk Java.
 
', 1);
INSERT INTO projects VALUES (135, 'ZP', 95, NULL, 125, '2002/2003', 'Podpora vyuÄŤovania MaPĹ  â€“ kontrola vedomostĂ­', 'Support for education in subject Methods and Techniques for Program Specification â€“ proof of learning', NULL, NULL, 1);
INSERT INTO projects VALUES (136, 'DP', 541, NULL, 125, '2004/2005', 'Monitorovanie stacionĂˇrnych objektov', 'Stationary object monitoring', NULL, NULL, 1);
INSERT INTO projects VALUES (137, 'ZP', 25, NULL, 127, '2003/2004', 'AnalĂ˝za implementĂˇcie TCP/IP protokolovĂ©ho zĂˇsobnĂ­ka', 'Analysis of TCP/IP stack implementation', 'Podrobne analyzujte protokolovĂ˝ zĂˇsobnĂ­k TCP/IP, priÄŤom zvlĂˇĹˇtnu pozornosĹĄ venujte preddefinovanĂ˝m hodnotĂˇm parametrov v rĂ´znych implementĂˇciĂˇch. Navrhnite sadu testov na zisĹĄovanie hodnĂ´t relevantnĂ˝ch parametrov vybranĂ˝ch protokolov. Navrhnite a implementujte systĂ©m pre zostavovanie komplexnĂ˝ch testov implementĂˇcie TCP/IP zĂˇsobnĂ­ka vzdialenĂ˝ch uzlov siete. SystĂ©m otestujte v laboratĂłrnych podmienkach a urobte odhad spoÄľahlivosti jeho vĂ˝stupov.', 'Podrobne analyzujte protokolovĂ˝ zĂˇsobnĂ­k TCP/IP, priÄŤom zvlĂˇĹˇtnu pozornosĹĄ venujte preddefinovanĂ˝m hodnotĂˇm parametrov v rĂ´znych implementĂˇciĂˇch. Navrhnite sadu testov na zisĹĄovanie hodnĂ´t relevantnĂ˝ch parametrov vybranĂ˝ch protokolov. Navrhnite a implementujte systĂ©m pre zostavovanie komplexnĂ˝ch testov implementĂˇcie TCP/IP zĂˇsobnĂ­ka vzdialenĂ˝ch uzlov siete. SystĂ©m otestujte v laboratĂłrnych podmienkach a urobte odhad spoÄľahlivosti jeho vĂ˝stupov.', 0);
INSERT INTO projects VALUES (138, 'ZP', 342, NULL, 128, '2005/2006', 'Prostriedky pre podporu vĂ˝uÄŤby predmetu ASP', 'Prostriedky pre podporu vĂ˝uÄŤby predmetu ASP', 'Analyzujte moĹľnosti programovĂ˝ch prostriedkov pre podporu vyuÄŤovania predmetu Assemblery  a systĂ©movĂ© programovanie. Navrhnite vhodnĂ© programovĂ© vybavenie pouĹľiteÄľnĂ© pre podporu vĂ˝uÄŤby ASP v aplikĂˇcii s poÄŤĂ­taÄŤom typu PC. Zrealizujte vybranĂş skupinu programovĂ˝ch prostriedkov vrĂˇtane zostavy vzorovĂ˝ch prĂ­kladov.', 'Analyzujte moĹľnosti programovĂ˝ch prostriedkov pre podporu vyuÄŤovania predmetu Assemblery  a systĂ©movĂ© programovanie. Navrhnite vhodnĂ© programovĂ© vybavenie pouĹľiteÄľnĂ© pre podporu vĂ˝uÄŤby ASP v aplikĂˇcii s poÄŤĂ­taÄŤom typu PC. Zrealizujte vybranĂş skupinu programovĂ˝ch prostriedkov vrĂˇtane zostavy vzorovĂ˝ch prĂ­kladov.', 0);
INSERT INTO projects VALUES (139, 'ZP', 704, NULL, 129, '2004/2005', 'PrezentĂˇcia histĂłrie informatiky na STU', 'Presentation of history of informatics at SUT', 'Pojednajte  o metĂłdach, technike a prostriedkoch navigĂˇcie v hypermediĂˇlnych systĂ©moch. ExperimentovanĂ­m zefektĂ­vnite navigovanie uĹľ v ÄŤiastoÄŤne vytvorenom systĂ©me v rĂˇmci tĂ­movĂ©ho projektu v ak. roku 2003/2004 a tento systĂ©m skompletizujte. Navrhnite kategorizĂˇciu pouĹľĂ­vateÄľov vzhÄľadom na ich stupeĹ vzdelania a zĂˇujmu o informatiku a zĂˇroveĹ tento fakt zohÄľadnite v efektivite  navigĂˇcie v systĂ©me a v ĹˇtruktĂşre samotnĂ©ho IS. PoĹľiadavka na vĂ˝stupy: adaptĂ­vna prezentĂˇcia  na Webe a CD.', 'Pojednajte  o metĂłdach, technike a prostriedkoch navigĂˇcie v hypermediĂˇlnych systĂ©moch. ExperimentovanĂ­m zefektĂ­vnite navigovanie uĹľ v ÄŤiastoÄŤne vytvorenom systĂ©me v rĂˇmci tĂ­movĂ©ho projektu v ak. roku 2003/2004 a tento systĂ©m skompletizujte. Navrhnite kategorizĂˇciu pouĹľĂ­vateÄľov vzhÄľadom na ich stupeĹ vzdelania a zĂˇujmu o informatiku a zĂˇroveĹ tento fakt zohÄľadnite v efektivite  navigĂˇcie v systĂ©me a v ĹˇtruktĂşre samotnĂ©ho IS. PoĹľiadavka na vĂ˝stupy: adaptĂ­vna prezentĂˇcia  na Webe a CD.', 1);
INSERT INTO projects VALUES (140, 'ZP', 20, NULL, 130, '2005/2006', 'AplikĂˇcia pre mobilnĂ© zariadenie', 'AplikĂˇcia pre mobilnĂ© zariadenie', 'MobilnĂ© zariadenia umoĹľĹujĂşce vykonĂˇvanie uĹľĂ­vateÄľom dodanĂ˝ch programov sĂş ÄŤoraz dostupnejĹˇie. NaĹˇtudujte moĹľnosti programovania aplikĂˇciĂ­ pre mobilnĂ© zariadenia a vytvorte aplikĂˇciu â€“ hru vyuĹľĂ­vajĂşcu komunikaÄŤnĂ© moĹľnosti tĂ˝chto zariadenĂ­.
', 'MobilnĂ© zariadenia umoĹľĹujĂşce vykonĂˇvanie uĹľĂ­vateÄľom dodanĂ˝ch programov sĂş ÄŤoraz dostupnejĹˇie. NaĹˇtudujte moĹľnosti programovania aplikĂˇciĂ­ pre mobilnĂ© zariadenia a vytvorte aplikĂˇciu â€“ hru vyuĹľĂ­vajĂşcu komunikaÄŤnĂ© moĹľnosti tĂ˝chto zariadenĂ­.
', 1);
INSERT INTO projects VALUES (141, 'ZP', 188, NULL, 131, '2005/2006', 'Tvorba rozpisu zĂˇpasov', 'Tvorba rozpisu zĂˇpasov', 'Navrhnite a implementujte program pre tvorbu rozpisu zĂˇpasov amatĂ©rskej ligy. Liga sa skladĂˇ z niekoÄľkĂ˝ch divĂ­ziĂ­, priÄŤom v kaĹľdej hrĂˇ urÄŤitĂ˝ poÄŤet tĂ­mov. V rĂˇmci kaĹľdej divĂ­zie sa hrĂˇ systĂ©mom kaĹľdĂ˝ s kaĹľdĂ˝m. KvĂ´li finanÄŤnej nĂˇroÄŤnosti profesionĂˇlnych rozhodcov si tĂ­my rozhodujĂş zĂˇpasy navzĂˇjom. ZĂˇpasy prebiehajĂş v exteriĂ©ri cez vĂ­kendy, prĂ­padne sviatky, priÄŤom na jednom ihrisku sa mĂ´Ĺľu striedaĹĄ zĂˇpasy viacerĂ˝ch divĂ­ziĂ­.
VĂˇĹˇ program musĂ­ zabezpeÄŤiĹĄ vytvorenie rozpisu zĂˇpasov tak, aby ÄŤo najlepĹˇie splnil rĂ´zne ohraniÄŤenia: hraĹĄ sa mĂ´Ĺľe len za prirodzenĂ©ho svetla, kaĹľdĂ˝ tĂ­m by mal rozhodovaĹĄ pribliĹľne rovnakĂ˝ poÄŤet zĂˇpasov, kaĹľdĂ˝ tĂ­m mĂ´Ĺľe maĹĄ preferencie tĂ˝kajĂşce sa ÄŤasov ich zĂˇpasov, a pod.
Pozn.: ZvĂˇĹľte pouĹľitie evoluÄŤnĂ˝ch algoritmov.', 'Navrhnite a implementujte program pre tvorbu rozpisu zĂˇpasov amatĂ©rskej ligy. Liga sa skladĂˇ z niekoÄľkĂ˝ch divĂ­ziĂ­, priÄŤom v kaĹľdej hrĂˇ urÄŤitĂ˝ poÄŤet tĂ­mov. V rĂˇmci kaĹľdej divĂ­zie sa hrĂˇ systĂ©mom kaĹľdĂ˝ s kaĹľdĂ˝m. KvĂ´li finanÄŤnej nĂˇroÄŤnosti profesionĂˇlnych rozhodcov si tĂ­my rozhodujĂş zĂˇpasy navzĂˇjom. ZĂˇpasy prebiehajĂş v exteriĂ©ri cez vĂ­kendy, prĂ­padne sviatky, priÄŤom na jednom ihrisku sa mĂ´Ĺľu striedaĹĄ zĂˇpasy viacerĂ˝ch divĂ­ziĂ­.
VĂˇĹˇ program musĂ­ zabezpeÄŤiĹĄ vytvorenie rozpisu zĂˇpasov tak, aby ÄŤo najlepĹˇie splnil rĂ´zne ohraniÄŤenia: hraĹĄ sa mĂ´Ĺľe len za prirodzenĂ©ho svetla, kaĹľdĂ˝ tĂ­m by mal rozhodovaĹĄ pribliĹľne rovnakĂ˝ poÄŤet zĂˇpasov, kaĹľdĂ˝ tĂ­m mĂ´Ĺľe maĹĄ preferencie tĂ˝kajĂşce sa ÄŤasov ich zĂˇpasov, a pod.
Pozn.: ZvĂˇĹľte pouĹľitie evoluÄŤnĂ˝ch algoritmov.', 1);
INSERT INTO projects VALUES (142, 'ZP', 298, NULL, 132, '2002/2003', 'InformaÄŤnĂ˝ systĂ©m regionĂˇlnej CISCO akadĂ©mie, sprĂˇva dĂˇt', 'Information system for regional  CISCO  academy - data management', NULL, NULL, 1);
INSERT INTO projects VALUES (143, 'DP', 557, 672, 132, '2003/2004', 'Ăštoky na prĂşdovĂ˝ ĹˇifrĂˇtor A5/1', 'Attacks on A5/1 stream cipher', NULL, NULL, 2);
INSERT INTO projects VALUES (144, 'ZP', 358, NULL, 133, '2003/2004', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Penetration testing of computer networks', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy prienikov. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş simulovaĹĄ vybratĂ© typy Ăştokov na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.

', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy prienikov. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş simulovaĹĄ vybratĂ© typy Ăştokov na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.

', 0);
INSERT INTO projects VALUES (145, 'DP', 25, NULL, 133, '2005/2006', 'Ĺ tatistickĂ© vlastnosti uzla v poÄŤĂ­taÄŤovej sieti', 'Ĺ tatistickĂ© vlastnosti uzla v poÄŤĂ­taÄŤovej sieti', NULL, NULL, 0);
INSERT INTO projects VALUES (146, 'ZP', 584, NULL, 134, '2005/2006', 'BezpeÄŤnostnĂ© mechanizmy grid computingu prostrednĂ­ctvom web rozhrania', 'BezpeÄŤnostnĂ© mechanizmy grid computingu prostrednĂ­ctvom web rozhrania', 'Analyzujte sĂşÄŤasnĂ© bezpeÄŤnostnĂ© mechanizmy a rieĹˇenia v prostredĂ­ grid computingu. PopĂ­Ĺˇte a podrobne analyzujte aspoĹ jeden z tĂ˝chto mechanizmov. OpĂ­Ĺˇte jeho vĂ˝hody a nevĂ˝hody, porovnajte s daÄľĹˇĂ­mi moĹľnĂ˝mi rieĹˇeniami. Navrhnite a implementujte web rozhranie k prostrediu grid computingu s aplikĂˇciou a implementĂˇciou vybranĂ©ho bezpeÄŤnostnĂ©ho mechanizmu.
', 'Analyzujte sĂşÄŤasnĂ© bezpeÄŤnostnĂ© mechanizmy a rieĹˇenia v prostredĂ­ grid computingu. PopĂ­Ĺˇte a podrobne analyzujte aspoĹ jeden z tĂ˝chto mechanizmov. OpĂ­Ĺˇte jeho vĂ˝hody a nevĂ˝hody, porovnajte s daÄľĹˇĂ­mi moĹľnĂ˝mi rieĹˇeniami. Navrhnite a implementujte web rozhranie k prostrediu grid computingu s aplikĂˇciou a implementĂˇciou vybranĂ©ho bezpeÄŤnostnĂ©ho mechanizmu.
', 0);
INSERT INTO projects VALUES (147, 'ZP', 579, NULL, 135, '2005/2006', 'SystĂ©m pre sprĂˇvu webovĂ˝ch strĂˇnok - pouĹľĂ­vateÄľ', 'SystĂ©m pre sprĂˇvu webovĂ˝ch strĂˇnok - pouĹľĂ­vateÄľ', 'CieÄľom projektu je vytvorenie prostredia, ktorĂ© umoĹľnĂ­ spravovanie webovĂ˝ch strĂˇnok. Analyzujte existujĂşce systĂ©my podobnĂ©ho charakteru z pohÄľadu pouĹľĂ­vateÄľov a vlastnostĂ­ prostredia, v ktorom bude vytvĂˇranĂ˝ systĂ©m.  Navrhnite ĹˇtruktĂşru pouĹľitej databĂˇzy, ĹˇtruktĂşru obrazoviek pre pouĹľĂ­vateÄľov, grafickĂ© prvky a ĹˇtĂ˝ly. NĂˇsledne implementujte kÄľĂşÄŤovĂ© ÄŤasti systĂ©mu a pouĹľiteÄľnosĹĄ overte na vybranej mnoĹľine strĂˇnok pouĹľĂ­vanĂ˝ch v pedagogike FIIT.
', 'CieÄľom projektu je vytvorenie prostredia, ktorĂ© umoĹľnĂ­ spravovanie webovĂ˝ch strĂˇnok. Analyzujte existujĂşce systĂ©my podobnĂ©ho charakteru z pohÄľadu pouĹľĂ­vateÄľov a vlastnostĂ­ prostredia, v ktorom bude vytvĂˇranĂ˝ systĂ©m.  Navrhnite ĹˇtruktĂşru pouĹľitej databĂˇzy, ĹˇtruktĂşru obrazoviek pre pouĹľĂ­vateÄľov, grafickĂ© prvky a ĹˇtĂ˝ly. NĂˇsledne implementujte kÄľĂşÄŤovĂ© ÄŤasti systĂ©mu a pouĹľiteÄľnosĹĄ overte na vybranej mnoĹľine strĂˇnok pouĹľĂ­vanĂ˝ch v pedagogike FIIT.
', 1);
INSERT INTO projects VALUES (148, 'ZP', 579, NULL, 136, '2005/2006', 'SystĂ©m na podporu tvorby skĂşĹˇkovĂ˝ch rozvrhov', 'SystĂ©m na podporu tvorby skĂşĹˇkovĂ˝ch rozvrhov', 'Analyzujte ĂşdajovĂ© mnoĹľiny a postupy pri vytvĂˇranĂ­  rozvrhov skĂşĹˇok a nĂˇsledne navrhnite systĂ©m, ktorĂ˝ by tieto ÄŤinnosti podporoval. ZĂˇkladnĂ© ÄŤasti nĂˇvrhu realizujte v podobe prototypu a zaistite nevyhnutnĂş kompatibilitu s informaÄŤnĂ˝m systĂ©mom pouĹľĂ­vanĂ˝m na FIIT.
', 'Analyzujte ĂşdajovĂ© mnoĹľiny a postupy pri vytvĂˇranĂ­  rozvrhov skĂşĹˇok a nĂˇsledne navrhnite systĂ©m, ktorĂ˝ by tieto ÄŤinnosti podporoval. ZĂˇkladnĂ© ÄŤasti nĂˇvrhu realizujte v podobe prototypu a zaistite nevyhnutnĂş kompatibilitu s informaÄŤnĂ˝m systĂ©mom pouĹľĂ­vanĂ˝m na FIIT.
', 1);
INSERT INTO projects VALUES (149, 'DP', 301, NULL, 137, '2005/2006', 'NĂˇvrh ĹˇpeciĂˇlnych funkciĂ­ sieĹĄovĂ©ho adaptĂ©ra v prostredĂ­ PLD', 'NĂˇvrh ĹˇpeciĂˇlnych funkciĂ­ sieĹĄovĂ©ho adaptĂ©ra v prostredĂ­ PLD', NULL, NULL, 0);
INSERT INTO projects VALUES (150, 'ZP', 301, NULL, 137, '2003/2004', 'Testovanie rozĹˇĂ­renej MAC vrstvy sieĹĄovĂ©ho adaptĂ©ra a nĂˇvrh v prostredĂ­ PLD', 'Testing of extended MAC layer of network interface card and design by PLD
tTesting of extended MAC layer of network interface card and design by PLD echnology', 'Navrhnite vybranĂ© ÄŤasti a ĹˇpeciĂˇlne funkcie sieĹĄovĂ©ho adaptĂ©ra. OpĂ­Ĺˇte architektĂşru a funkciu v jazyku VHDL, implementujte systĂ©m do zvolenej technolĂłgie PLD/FPGA v nĂˇvrhovom prostredĂ­ XILINX Foundation M1 technology, navrhnite metĂłdu testovania MAC vrstvy, overte ÄŤinnosĹĄ.', 'Navrhnite vybranĂ© ÄŤasti a ĹˇpeciĂˇlne funkcie sieĹĄovĂ©ho adaptĂ©ra. OpĂ­Ĺˇte architektĂşru a funkciu v jazyku VHDL, implementujte systĂ©m do zvolenej technolĂłgie PLD/FPGA v nĂˇvrhovom prostredĂ­ XILINX Foundation M1 technology, navrhnite metĂłdu testovania MAC vrstvy, overte ÄŤinnosĹĄ.', 0);
INSERT INTO projects VALUES (151, 'DP', 25, NULL, 138, '2005/2006', 'AdaptĂ­vne riadenie vlastnostĂ­ prenosovĂ©ho kanĂˇlu', 'AdaptĂ­vne riadenie vlastnostĂ­ prenosovĂ©ho kanĂˇlu', NULL, NULL, 0);
INSERT INTO projects VALUES (152, 'ZP', 563, NULL, 138, '2004/2005', 'Ladiaci program pre experimentĂˇlny mikropoÄŤĂ­taÄŤ', 'Debugging program for experimental microcomputer', 'Navrhnite a implemetujte ladiaci program pre experimentĂˇlny mikropoÄŤĂ­taÄŤ na bĂˇze I80386EX s nasledovnĂ˝mi poĹľiadavkami:

- znakovo orientovanĂˇ komunikĂˇcia s hostiteÄľskĂ˝m poÄŤĂ­taÄŤom cez sĂ©riovĂ˝ port
- naplnenie pouĹľĂ­vateÄľskĂ©ho programu z hostiteÄľskĂ©ho poÄŤĂ­taÄŤa
- krokovanie pouĹľĂ­vateÄľskĂ©ho programu po inĹˇtrukciĂˇch
- spustenie pouĹľĂ­vateÄľskĂ©ho programu v reĂˇlnom ÄŤase
- nastavenie ladiacich bodov
- prezeranie/modifikĂˇcia obsahu registrov a pamĂ¤te
- priama prĂˇca s portami mikropoÄŤĂ­taÄŤa
', 'Navrhnite a implemetujte ladiaci program pre experimentĂˇlny mikropoÄŤĂ­taÄŤ na bĂˇze I80386EX s nasledovnĂ˝mi poĹľiadavkami:

- znakovo orientovanĂˇ komunikĂˇcia s hostiteÄľskĂ˝m poÄŤĂ­taÄŤom cez sĂ©riovĂ˝ port
- naplnenie pouĹľĂ­vateÄľskĂ©ho programu z hostiteÄľskĂ©ho poÄŤĂ­taÄŤa
- krokovanie pouĹľĂ­vateÄľskĂ©ho programu po inĹˇtrukciĂˇch
- spustenie pouĹľĂ­vateÄľskĂ©ho programu v reĂˇlnom ÄŤase
- nastavenie ladiacich bodov
- prezeranie/modifikĂˇcia obsahu registrov a pamĂ¤te
- priama prĂˇca s portami mikropoÄŤĂ­taÄŤa
', 0);
INSERT INTO projects VALUES (153, 'ZP', 374, NULL, 139, '2005/2006', 'Zobrazovanie objektov GIS podÄľa poĹľadovanej mierky', 'Zobrazovanie objektov GIS podÄľa poĹľadovanej mierky', 'GeografickĂ© informaÄŤnĂ© systĂ©my obsahujĂş mnoĹľstvo rĂ´znych, prevaĹľne grafickĂ˝ch objektov, z ktorĂ˝ch je moĹľnĂ© skladaĹĄ a vytvĂˇraĹĄ rozliÄŤnĂ© druhy mĂˇp. GrafickĂ© objekty sĂş na mape reprezentovanĂ© ÄŤiarami, mnohouholnĂ­kmi a symbolmi. NiektorĂ© rozmery tĂ˝chto objektov a tĂ˝m aj ich viditeÄľnosĹĄ je zĂˇvislĂˇ od zvolenej mierky zobrazenia. SĂşÄŤasnĂ© systĂ©my ÄŤasto zobrazujĂş prĂ­liĹˇ malĂ© objekty ÄŤiarami alebo bodkami, ktorĂ© sĂş na vĂ˝slednej mape ruĹˇivĂ©. Ăšlohou je eliminovaĹĄ takĂ©to objekty. Najprv analyzujte spĂ´soby zobrazovania geografickĂ˝ch informĂˇciĂ­ a na zĂˇklade analĂ˝zy navrhnite spĂ´sob predspracovania zobrazovanĂ˝ch objektov. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m prototypu.', 'GeografickĂ© informaÄŤnĂ© systĂ©my obsahujĂş mnoĹľstvo rĂ´znych, prevaĹľne grafickĂ˝ch objektov, z ktorĂ˝ch je moĹľnĂ© skladaĹĄ a vytvĂˇraĹĄ rozliÄŤnĂ© druhy mĂˇp. GrafickĂ© objekty sĂş na mape reprezentovanĂ© ÄŤiarami, mnohouholnĂ­kmi a symbolmi. NiektorĂ© rozmery tĂ˝chto objektov a tĂ˝m aj ich viditeÄľnosĹĄ je zĂˇvislĂˇ od zvolenej mierky zobrazenia. SĂşÄŤasnĂ© systĂ©my ÄŤasto zobrazujĂş prĂ­liĹˇ malĂ© objekty ÄŤiarami alebo bodkami, ktorĂ© sĂş na vĂ˝slednej mape ruĹˇivĂ©. Ăšlohou je eliminovaĹĄ takĂ©to objekty. Najprv analyzujte spĂ´soby zobrazovania geografickĂ˝ch informĂˇciĂ­ a na zĂˇklade analĂ˝zy navrhnite spĂ´sob predspracovania zobrazovanĂ˝ch objektov. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m prototypu.', 1);
INSERT INTO projects VALUES (154, 'ZP', 388, NULL, 140, '2005/2006', 'InformaÄŤnĂ˝ portĂˇl predmetu', 'InformaÄŤnĂ˝ portĂˇl predmetu', 'Analyzujte typickĂ© prvky informaÄŤnĂ©ho portĂˇlu univerzitnĂ©ho predmetu a vhodnĂ© prostriedky na ich vytvorenie a ĂşdrĹľbu v prostredĂ­ webu. Navrhnite softvĂ©rovĂ˝ systĂ©m - webovskĂş aplikĂˇciu, ktorĂˇ podporĂ­ jednoduchĂş tvorbu informaÄŤnĂ˝ch portĂˇlov pre predmety informatickĂ©ho zamerania na naĹˇej fakulte. NĂˇvrh rieĹˇenia overte implementĂˇciou prototypu podpornĂ©ho softvĂ©rovĂ©ho systĂ©mu.', 'Analyzujte typickĂ© prvky informaÄŤnĂ©ho portĂˇlu univerzitnĂ©ho predmetu a vhodnĂ© prostriedky na ich vytvorenie a ĂşdrĹľbu v prostredĂ­ webu. Navrhnite softvĂ©rovĂ˝ systĂ©m - webovskĂş aplikĂˇciu, ktorĂˇ podporĂ­ jednoduchĂş tvorbu informaÄŤnĂ˝ch portĂˇlov pre predmety informatickĂ©ho zamerania na naĹˇej fakulte. NĂˇvrh rieĹˇenia overte implementĂˇciou prototypu podpornĂ©ho softvĂ©rovĂ©ho systĂ©mu.', 1);
INSERT INTO projects VALUES (155, 'ZP', 387, NULL, 141, '2005/2006', 'PrehliadaÄŤ strĂˇnok na Internete ', 'PrehliadaÄŤ strĂˇnok na Internete ', 'RĂ´zne internetovĂ© prehliadaÄŤe majĂş ÄŤasto problĂ©m zobraziĹĄ
strĂˇnky presne podÄľa Ĺˇtandardov w3c.org. Preto analyzujte
vhodnosĹĄ rĂ´znych formĂˇtov a spĂ´soby ich zobrazovania.
Navrhnite vlastnĂ˝ formĂˇt vychĂˇdzajĂşci z XML, do ktorĂ©ho
je moĹľnĂ© strĂˇnky v rĂ´znych html formĂˇtoch (napr. html40,html41,xhtml1)
prekonvertovaĹĄ. ÄŽalej navrhnite prehliadaÄŤ tohto formĂˇtu.
Svoje rieĹˇenie overte prototypom. ', 'RĂ´zne internetovĂ© prehliadaÄŤe majĂş ÄŤasto problĂ©m zobraziĹĄ
strĂˇnky presne podÄľa Ĺˇtandardov w3c.org. Preto analyzujte
vhodnosĹĄ rĂ´znych formĂˇtov a spĂ´soby ich zobrazovania.
Navrhnite vlastnĂ˝ formĂˇt vychĂˇdzajĂşci z XML, do ktorĂ©ho
je moĹľnĂ© strĂˇnky v rĂ´znych html formĂˇtoch (napr. html40,html41,xhtml1)
prekonvertovaĹĄ. ÄŽalej navrhnite prehliadaÄŤ tohto formĂˇtu.
Svoje rieĹˇenie overte prototypom. ', 1);
INSERT INTO projects VALUES (156, 'ZP', 660, NULL, 143, '2005/2006', 'Vyhodnocovanie vedomostĂ­ Ĺˇtudenta pri ĹˇtĂşdiu prostrednĂ­ctvom webovĂ©ho adaptĂ­vneho systĂ©mu', 'Vyhodnocovanie vedomostĂ­ Ĺˇtudenta pri ĹˇtĂşdiu prostrednĂ­ctvom webovĂ©ho adaptĂ­vneho systĂ©mu', 'WebovĂ© adaptĂ­vne vĂ˝uÄŤbovĂ© systĂ©my umoĹľĹujĂş dosiahnutie vyĹˇĹˇej efektĂ­vnosti uÄŤenia sa tĂ˝m, Ĺľe vĂ˝uÄŤbovĂ˝ systĂ©m sa dokĂˇĹľe prispĂ´sobiĹĄ jednotlivĂ˝m Ĺˇtudentom, resp. skupinĂˇm Ĺˇtudentov. Pri prispĂ´sobovanĂ­ hrĂˇ vĂ˝znamnĂş Ăşlohu prĂˇve schopnosĹĄ systĂ©mu vyhodnotiĹĄ charakteristiky pouĹľĂ­vateÄľa vzhÄľadom na jeho predchĂˇdzajĂşcu ÄŤinnosĹĄ vo vĂ˝uÄŤbovom systĂ©me. SkĂşmajte moĹľnosti vyhodnotenia charakteristĂ­k pouĹľĂ­vateÄľa vzhÄľadom na prezentovanĂ© vedomosti (ktorĂ© ÄŤasti len videl, ktorĂ© pochopil). Zamerajte sa na systĂ©my na vĂ˝uÄŤbu programovania. Zoberte pri tom do Ăşvahy pohyb pouĹľĂ­vateÄľa v informaÄŤnom priestore, vyhodnotenie otĂˇzok pouĹľĂ­vateÄľovi po preĹˇtudovanĂ­ jednotlivĂ˝ch ÄŤastĂ­ a tieĹľ moĹľnosĹĄ vyhodnotenia prĂ­kladov programov, ktorĂ© Ĺˇtudent pri prĂˇci so systĂ©mom vyrieĹˇil. Navrhnite spĂ´sob ako tieto charakteristiky vyhodnocovaĹĄ v kontexte vĂ˝uÄŤby programovania (vo zvolenej paradigme: procedurĂˇlna, objektovo-orientovanĂˇ, funkcionĂˇlna alebo logickĂˇ). NĂˇvrh experimentĂˇlne overte tak, Ĺľe doplnĂ­te a obohatĂ­te existujĂşci otvorenĂ˝ systĂ©m AHA! pre vĂ˝uÄŤbu programovania (systĂ©m AHA! je vyvinutĂ˝ modernĂ˝mi technolĂłgiami â€“ Java servlety, Tomcat web server, XML a ÄŹalĹˇie a je dostupnĂ˝ na adrese http://aha.win.tue.nl).', 'WebovĂ© adaptĂ­vne vĂ˝uÄŤbovĂ© systĂ©my umoĹľĹujĂş dosiahnutie vyĹˇĹˇej efektĂ­vnosti uÄŤenia sa tĂ˝m, Ĺľe vĂ˝uÄŤbovĂ˝ systĂ©m sa dokĂˇĹľe prispĂ´sobiĹĄ jednotlivĂ˝m Ĺˇtudentom, resp. skupinĂˇm Ĺˇtudentov. Pri prispĂ´sobovanĂ­ hrĂˇ vĂ˝znamnĂş Ăşlohu prĂˇve schopnosĹĄ systĂ©mu vyhodnotiĹĄ charakteristiky pouĹľĂ­vateÄľa vzhÄľadom na jeho predchĂˇdzajĂşcu ÄŤinnosĹĄ vo vĂ˝uÄŤbovom systĂ©me. SkĂşmajte moĹľnosti vyhodnotenia charakteristĂ­k pouĹľĂ­vateÄľa vzhÄľadom na prezentovanĂ© vedomosti (ktorĂ© ÄŤasti len videl, ktorĂ© pochopil). Zamerajte sa na systĂ©my na vĂ˝uÄŤbu programovania. Zoberte pri tom do Ăşvahy pohyb pouĹľĂ­vateÄľa v informaÄŤnom priestore, vyhodnotenie otĂˇzok pouĹľĂ­vateÄľovi po preĹˇtudovanĂ­ jednotlivĂ˝ch ÄŤastĂ­ a tieĹľ moĹľnosĹĄ vyhodnotenia prĂ­kladov programov, ktorĂ© Ĺˇtudent pri prĂˇci so systĂ©mom vyrieĹˇil. Navrhnite spĂ´sob ako tieto charakteristiky vyhodnocovaĹĄ v kontexte vĂ˝uÄŤby programovania (vo zvolenej paradigme: procedurĂˇlna, objektovo-orientovanĂˇ, funkcionĂˇlna alebo logickĂˇ). NĂˇvrh experimentĂˇlne overte tak, Ĺľe doplnĂ­te a obohatĂ­te existujĂşci otvorenĂ˝ systĂ©m AHA! pre vĂ˝uÄŤbu programovania (systĂ©m AHA! je vyvinutĂ˝ modernĂ˝mi technolĂłgiami â€“ Java servlety, Tomcat web server, XML a ÄŹalĹˇie a je dostupnĂ˝ na adrese http://aha.win.tue.nl).', 1);
INSERT INTO projects VALUES (157, 'ZP', 358, NULL, 145, '2005/2006', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş testovaĹĄ vybratĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş testovaĹĄ vybratĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.', 0);
INSERT INTO projects VALUES (158, 'ZP', 294, NULL, 146, '2002/2003', 'NavigĂˇcia v informaÄŤnom hyperpriestore pomocou virtuĂˇlnej reality formou sfĂ©rickej panorĂˇmy', 'Navigation in information hyperspace with use of virtual reality in form of spherical panoramas', NULL, NULL, 1);
INSERT INTO projects VALUES (159, 'DP', 294, NULL, 146, '2003/2004', 'PouĹľitie optiky rybieho oka pri interaktĂ­vnom zobrazovanĂ­ hyperdokumentov', 'Using fish-eye views to interactively display hyperdocuments', NULL, NULL, 1);
INSERT INTO projects VALUES (160, 'ZP', 40, NULL, 147, '2005/2006', 'Objektovo relaÄŤnĂ© mapre pre jazyk C++', 'Objektovo relaÄŤnĂ© mapre pre jazyk C++', 'NaĹˇtudujte princĂ­py a charakteristiky Objektovo-RelaÄŤnĂ˝ch maprov vo vĹˇeobecnosti. Analyzujte existujĂşce Oâ€“R mapre pre programovacĂ­ jazyk C++. NaĹˇtudujte podrobnosti pre Vami vybranĂ© O-R mapre (min. 2) pre jazyk C++. S vyuĹľitĂ­m vybranĂ˝ch O-R maprov vytvorte jednoduchĂş databĂˇzovĂş aplikĂˇciu, resp. aplikĂˇcie na spoloÄŤnom zĂˇklade. VybranĂ© mapre porovnajte s vyuĹľitĂ­m osobnĂ˝ch skĂşsenostĂ­ zĂ­skanĂ˝ch pri vytvĂˇranĂ­ aplikĂˇcie/aplikĂˇciĂ­.', 'NaĹˇtudujte princĂ­py a charakteristiky Objektovo-RelaÄŤnĂ˝ch maprov vo vĹˇeobecnosti. Analyzujte existujĂşce Oâ€“R mapre pre programovacĂ­ jazyk C++. NaĹˇtudujte podrobnosti pre Vami vybranĂ© O-R mapre (min. 2) pre jazyk C++. S vyuĹľitĂ­m vybranĂ˝ch O-R maprov vytvorte jednoduchĂş databĂˇzovĂş aplikĂˇciu, resp. aplikĂˇcie na spoloÄŤnom zĂˇklade. VybranĂ© mapre porovnajte s vyuĹľitĂ­m osobnĂ˝ch skĂşsenostĂ­ zĂ­skanĂ˝ch pri vytvĂˇranĂ­ aplikĂˇcie/aplikĂˇciĂ­.', 1);
INSERT INTO projects VALUES (161, 'ZP', 400, NULL, 148, '2005/2006', 'KomunitnĂˇ katalogizĂˇcia roztrĂşsenĂ˝ch informĂˇciĂ­', 'KomunitnĂˇ katalogizĂˇcia roztrĂşsenĂ˝ch informĂˇciĂ­', 'MnoĹľstvo informĂˇciĂ­ je roztrĂşsenĂ˝ch medzi vzĂˇjomne neprepojenĂ˝mi subjektami. V procese informatizĂˇcie, digitalizĂˇcie a Ĺˇtrukturovania informĂˇciĂ­ je potrebnĂ© katalogizovaĹĄ a prepĂˇjaĹĄ takĂ©to informĂˇcie informĂˇcie. Pre zefektĂ­vnenie tohto procesu je moĹľnĂ© vyuĹľiĹĄ samotnĂ˝ch nositeÄľov tĂ˝chto informĂˇciĂ­. Existuje niekoÄľko projektov na rieĹˇenie tohto problĂ©mu [napr. 1], tieto vĹˇak fungujĂş iba pri dostatoÄŤne veÄľkĂ˝ch komunitĂˇch, kde sĂş vĂ˝kyvy automaticky pohltenĂ©. Navrhnite aplikĂˇciu takĂ˝chto technolĂłgiĂ­ na menĹˇie komunity , prĂ­kladom nech
je zhromaĹľÄŹovanie lokĂˇlnych turistickĂ˝ch informĂˇciĂ­ na Slovensku.

VĂ˝stupy projektu:
AnalĂ˝za postupu pri veÄľkĂ˝ch komunitĂˇch, 
NĂˇvrh potrebnĂ˝ch zmien v prostredĂ­ bez automatickĂ˝ch oprĂˇv chĂ˝b, 
ImplementĂˇcia jednoduchĂ©ho systĂ©mu na podporu komunitnej katalogizĂˇcie v menĹˇĂ­ch komunitĂˇch.

[1] http://www.wikipedia.org/', 'MnoĹľstvo informĂˇciĂ­ je roztrĂşsenĂ˝ch medzi vzĂˇjomne neprepojenĂ˝mi subjektami. V procese informatizĂˇcie, digitalizĂˇcie a Ĺˇtrukturovania informĂˇciĂ­ je potrebnĂ© katalogizovaĹĄ a prepĂˇjaĹĄ takĂ©to informĂˇcie informĂˇcie. Pre zefektĂ­vnenie tohto procesu je moĹľnĂ© vyuĹľiĹĄ samotnĂ˝ch nositeÄľov tĂ˝chto informĂˇciĂ­. Existuje niekoÄľko projektov na rieĹˇenie tohto problĂ©mu [napr. 1], tieto vĹˇak fungujĂş iba pri dostatoÄŤne veÄľkĂ˝ch komunitĂˇch, kde sĂş vĂ˝kyvy automaticky pohltenĂ©. Navrhnite aplikĂˇciu takĂ˝chto technolĂłgiĂ­ na menĹˇie komunity , prĂ­kladom nech
je zhromaĹľÄŹovanie lokĂˇlnych turistickĂ˝ch informĂˇciĂ­ na Slovensku.

VĂ˝stupy projektu:
AnalĂ˝za postupu pri veÄľkĂ˝ch komunitĂˇch, 
NĂˇvrh potrebnĂ˝ch zmien v prostredĂ­ bez automatickĂ˝ch oprĂˇv chĂ˝b, 
ImplementĂˇcia jednoduchĂ©ho systĂ©mu na podporu komunitnej katalogizĂˇcie v menĹˇĂ­ch komunitĂˇch.

[1] http://www.wikipedia.org/', 1);
INSERT INTO projects VALUES (162, 'ZP', 297, NULL, 150, '2005/2006', 'SimulĂˇtor toku strojovĂ˝ch inĹˇtrukciĂ­', 'SimulĂˇtor toku strojovĂ˝ch inĹˇtrukciĂ­', 'Analyzujte moĹľnosti a prostriedky na simulĂˇciu definovanej inĹˇtrukÄŤnej sady strojovĂ˝ch inĹˇtrukciĂ­. Vytvorte simulaÄŤnĂ© prostredie, v ktorom nĂˇzorne zobrazte procesy a stavy poÄŤas vykonĂˇvania inĹˇtrukcie danĂ©ho programu pre zvolenĂ˝ typ procesora.', 'Analyzujte moĹľnosti a prostriedky na simulĂˇciu definovanej inĹˇtrukÄŤnej sady strojovĂ˝ch inĹˇtrukciĂ­. Vytvorte simulaÄŤnĂ© prostredie, v ktorom nĂˇzorne zobrazte procesy a stavy poÄŤas vykonĂˇvania inĹˇtrukcie danĂ©ho programu pre zvolenĂ˝ typ procesora.', 1);
INSERT INTO projects VALUES (163, 'ZP', 24, NULL, 152, '2005/2006', 'OptimalizĂˇcia turnusov v autobusovej doprave', 'OptimalizĂˇcia turnusov v autobusovej doprave', 'Pomocou grafovĂ©ho modelu rieĹˇte optimalizĂˇciu turnusov v autobusovej doprave.
Analyzujte vybranĂ© metĂłdy, ktorĂ© sa pouĹľĂ­vajĂş v teĂłrii grafov 
na modelovanie dopravnĂ˝ch sietĂ­. Analyzujte pouĹľitĂ© algoritmy, ktorĂ˝mi problĂ©m optimalizujete.
Navrhnite model, pre optimalizĂˇciu turnusov v autobusovej doprave.
NĂˇjdite maximĂˇlny tok v  dopravnej sieti. Model optimalizujte a zistite najlacnejĹˇĂ­ maximĂˇlny tok. NavrhnutĂ˝ model vizualizujte vytvorenĂ­m softvĂ©rovĂ©ho prototypu.
', 'Pomocou grafovĂ©ho modelu rieĹˇte optimalizĂˇciu turnusov v autobusovej doprave.
Analyzujte vybranĂ© metĂłdy, ktorĂ© sa pouĹľĂ­vajĂş v teĂłrii grafov 
na modelovanie dopravnĂ˝ch sietĂ­. Analyzujte pouĹľitĂ© algoritmy, ktorĂ˝mi problĂ©m optimalizujete.
Navrhnite model, pre optimalizĂˇciu turnusov v autobusovej doprave.
NĂˇjdite maximĂˇlny tok v  dopravnej sieti. Model optimalizujte a zistite najlacnejĹˇĂ­ maximĂˇlny tok. NavrhnutĂ˝ model vizualizujte vytvorenĂ­m softvĂ©rovĂ©ho prototypu.
', 1);
INSERT INTO projects VALUES (164, 'ZP', 563, NULL, 154, '2002/2003', 'VnorenĂ˝ systĂ©m pre polohovacie zariadenie', 'Embeded system for positioning equipment', NULL, NULL, 0);
INSERT INTO projects VALUES (165, 'DP', 563, NULL, 154, '2003/2004', 'ExperimentĂˇlny mikropoÄŤĂ­taÄŤ', 'Experimental microcomputer', NULL, NULL, 0);
INSERT INTO projects VALUES (166, 'ZP', 655, NULL, 155, '2003/2004', 'NĂˇstroj pre analĂ˝zu javov v neurĂłnovĂ˝ch sieĹĄach', 'NĂˇstroj pre analĂ˝zu javov v neurĂłnovĂ˝ch sieĹĄach', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch doprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou, ako sĂş naprĂ­klad ÄŤasovĂ© postupnosti symbolov. Pri ich skĂşmanĂ­ boli opĂ­sanĂ© viacerĂ© zaujĂ­mavĂ© javy, ktorĂ© vyĹľadujĂş podrobnejĹˇiu analĂ˝zu pre ich lepĹˇie pochopenie.
NaĹˇtudujte problematiku rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­, zamerajte sa na javy v rekurentnĂ˝ch sieĹĄach ako architektutĂˇlny bias (fraktĂˇlovĂˇ ĹˇtruktĂşra stavovĂ©ho priestoru), zmena stavovej reprezentĂˇcie v procese uÄŤenia, prĂ­padne strĂˇcanie chybovĂ˝ch signĂˇlov v ÄŤase. Navrhnite a vytvorte nĂˇstroj (napr. JAVA applet), ktorĂ˝ by umoĹľnil pomocou zaujĂ­mavĂ˝ch vizualizĂˇcii prehÄľadnĂ© znĂˇzornenie tĂ˝chto javov a tak ich nĂˇslednĂ© skĂşmanie.  VytvorenĂ© rieĹˇenie overte na zvolenĂ˝ch testovacĂ­ch postupnostiach.
', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch doprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou, ako sĂş naprĂ­klad ÄŤasovĂ© postupnosti symbolov. Pri ich skĂşmanĂ­ boli opĂ­sanĂ© viacerĂ© zaujĂ­mavĂ© javy, ktorĂ© vyĹľadujĂş podrobnejĹˇiu analĂ˝zu pre ich lepĹˇie pochopenie.
NaĹˇtudujte problematiku rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­, zamerajte sa na javy v rekurentnĂ˝ch sieĹĄach ako architektutĂˇlny bias (fraktĂˇlovĂˇ ĹˇtruktĂşra stavovĂ©ho priestoru), zmena stavovej reprezentĂˇcie v procese uÄŤenia, prĂ­padne strĂˇcanie chybovĂ˝ch signĂˇlov v ÄŤase. Navrhnite a vytvorte nĂˇstroj (napr. JAVA applet), ktorĂ˝ by umoĹľnil pomocou zaujĂ­mavĂ˝ch vizualizĂˇcii prehÄľadnĂ© znĂˇzornenie tĂ˝chto javov a tak ich nĂˇslednĂ© skĂşmanie.  VytvorenĂ© rieĹˇenie overte na zvolenĂ˝ch testovacĂ­ch postupnostiach.
', 1);
INSERT INTO projects VALUES (167, 'ZP', 301, NULL, 156, '2002/2003', 'NĂˇvrh a implementĂˇcia algoritmu pre funkÄŤnĂ˝ generĂˇtor testov  VLSI obvodov', 'Functional test generator for VLSI circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (168, 'DP', 301, NULL, 156, '2003/2004', 'FunkÄŤnĂ˝ generĂˇtor testov VLSI obvodov', 'Functional test generator for VLSI circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (169, 'ZP', 660, NULL, 157, '2005/2006', 'CSIDC 2006', 'CSIDC 2006', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.
', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.
', 1);
INSERT INTO projects VALUES (170, 'ZP', 579, NULL, 159, '2003/2004', 'VyuĹľitie multimediĂˇlnych foriem vĂ˝uÄŤby informatiky - 2', 'VyuĹľitie multimediĂˇlnych foriem vĂ˝uÄŤby informatiky - 2', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej podoby informĂˇciĂ­ v systĂ©moch na podporu vĂ˝uÄŤby informatiky. Navrhnite zĂˇkladnĂ˝ systĂ©m a nĂˇsledne ho rozĹˇĂ­rte o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili obohatenie textovĂ©ho obsahu o rĂ´zne inĂ© formy prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na niektorom predmete podÄľa potrieb KIVT.', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej podoby informĂˇciĂ­ v systĂ©moch na podporu vĂ˝uÄŤby informatiky. Navrhnite zĂˇkladnĂ˝ systĂ©m a nĂˇsledne ho rozĹˇĂ­rte o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili obohatenie textovĂ©ho obsahu o rĂ´zne inĂ© formy prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na niektorom predmete podÄľa potrieb KIVT.', 1);
INSERT INTO projects VALUES (171, 'ZP', 297, NULL, 161, '2003/2004', 'VĂ˝uÄŤba odbornĂ©ho predmetu cez Internet', 'VĂ˝uÄŤba odbornĂ©ho predmetu cez Internet', 'Analyzujte novĂ© smery v oblasti vĂ˝uÄŤby a vzdelĂˇvania ako dĂ´sledok novĂ˝ch informaÄŤnĂ˝ch technolĂłgiĂ­. Zamerajte sa na e-learning paradigmu. Ĺ pecifikujte model systĂ©mu orientovanĂ˝ pre vyuÄŤovanie odbornĂ©ho predmetu a navrhnite  jeho ĹˇtruktĂşru , ktorĂˇ bude vyhovovaĹĄ prezentĂˇcii v sieti Internet. Navrhnite model v sĂşlade so Ĺˇtandardami modelu e-learning. SystĂ©m skĂşĹˇobne naplĹte  textom s prĂ­kladmi do ĹˇtruktĂşrovanĂ˝ch jednotiek. Overte  funkÄŤnosĹĄ navrhnutĂ©ho systĂ©mu.', 'Analyzujte novĂ© smery v oblasti vĂ˝uÄŤby a vzdelĂˇvania ako dĂ´sledok novĂ˝ch informaÄŤnĂ˝ch technolĂłgiĂ­. Zamerajte sa na e-learning paradigmu. Ĺ pecifikujte model systĂ©mu orientovanĂ˝ pre vyuÄŤovanie odbornĂ©ho predmetu a navrhnite  jeho ĹˇtruktĂşru , ktorĂˇ bude vyhovovaĹĄ prezentĂˇcii v sieti Internet. Navrhnite model v sĂşlade so Ĺˇtandardami modelu e-learning. SystĂ©m skĂşĹˇobne naplĹte  textom s prĂ­kladmi do ĹˇtruktĂşrovanĂ˝ch jednotiek. Overte  funkÄŤnosĹĄ navrhnutĂ©ho systĂ©mu.', 1);
INSERT INTO projects VALUES (172, 'ZP', 579, NULL, 162, '2005/2006', 'SystĂ©m pre sprĂˇvu webovĂ˝ch strĂˇnok - pouĹľĂ­vateÄľ', 'SystĂ©m pre sprĂˇvu webovĂ˝ch strĂˇnok - pouĹľĂ­vateÄľ', 'CieÄľom projektu je vytvorenie prostredia, ktorĂ© umoĹľnĂ­ spravovanie webovĂ˝ch strĂˇnok. Analyzujte existujĂşce systĂ©my podobnĂ©ho charakteru z pohÄľadu pouĹľĂ­vateÄľov a vlastnostĂ­ prostredia, v ktorom bude vytvĂˇranĂ˝ systĂ©m.  Navrhnite ĹˇtruktĂşru pouĹľitej databĂˇzy, ĹˇtruktĂşru obrazoviek pre pouĹľĂ­vateÄľov, grafickĂ© prvky a ĹˇtĂ˝ly. NĂˇsledne implementujte kÄľĂşÄŤovĂ© ÄŤasti systĂ©mu a pouĹľiteÄľnosĹĄ overte na vybranej mnoĹľine strĂˇnok pouĹľĂ­vanĂ˝ch v pedagogike FIIT.
', 'CieÄľom projektu je vytvorenie prostredia, ktorĂ© umoĹľnĂ­ spravovanie webovĂ˝ch strĂˇnok. Analyzujte existujĂşce systĂ©my podobnĂ©ho charakteru z pohÄľadu pouĹľĂ­vateÄľov a vlastnostĂ­ prostredia, v ktorom bude vytvĂˇranĂ˝ systĂ©m.  Navrhnite ĹˇtruktĂşru pouĹľitej databĂˇzy, ĹˇtruktĂşru obrazoviek pre pouĹľĂ­vateÄľov, grafickĂ© prvky a ĹˇtĂ˝ly. NĂˇsledne implementujte kÄľĂşÄŤovĂ© ÄŤasti systĂ©mu a pouĹľiteÄľnosĹĄ overte na vybranej mnoĹľine strĂˇnok pouĹľĂ­vanĂ˝ch v pedagogike FIIT.
', 1);
INSERT INTO projects VALUES (173, 'ZP', 294, NULL, 163, '2005/2006', 'SystĂ©m pre animovanie chĂ´dze Äľudskej kostry', 'SystĂ©m pre animovanie chĂ´dze Äľudskej kostry', 'Urobte reĹˇerĹˇ literatĂşry o poÄŤĂ­taÄŤovĂ˝ch modeloch Äľudskej kostry a animĂˇcie chĂ´dze a  na zĂˇklade vĂ˝sledkov tĂ­movĂ˝ch projektov [1], [2] doplĹte model  kostry ÄŤloveka a jeho animĂˇcie o chrbticu, hrudnĂ˝ kĂ´Ĺˇ, hornĂ© konÄŤatiny a hlavu. PouĹľite rovnakĂş reprezentĂˇciu 3D modelu, ĹˇtruktĂşru dĂˇt modelu kostry, formĂˇt sĂşboru pre simulĂˇciu pohybu ako aj metodiku transformĂˇcie existujĂşcich modelov do poĹľadovanej ĹˇtruktĂşry dĂˇt..  

[1]  MaretĂˇk, P.: AnalĂ˝za a animĂˇcia chĂ´dze ÄŤloveka. TĂ­movĂ˝ projekt FIIT STU Bratislava (2004)
[2] LuÄŤeniÄŤ, Ä˝.:  AnalĂ˝za a animĂˇcia chĂ´dze ÄŤloveka. TĂ­movĂ˝ projekt FIIT STU Bratislava (2005)

', 'Urobte reĹˇerĹˇ literatĂşry o poÄŤĂ­taÄŤovĂ˝ch modeloch Äľudskej kostry a animĂˇcie chĂ´dze a  na zĂˇklade vĂ˝sledkov tĂ­movĂ˝ch projektov [1], [2] doplĹte model  kostry ÄŤloveka a jeho animĂˇcie o chrbticu, hrudnĂ˝ kĂ´Ĺˇ, hornĂ© konÄŤatiny a hlavu. PouĹľite rovnakĂş reprezentĂˇciu 3D modelu, ĹˇtruktĂşru dĂˇt modelu kostry, formĂˇt sĂşboru pre simulĂˇciu pohybu ako aj metodiku transformĂˇcie existujĂşcich modelov do poĹľadovanej ĹˇtruktĂşry dĂˇt..  

[1]  MaretĂˇk, P.: AnalĂ˝za a animĂˇcia chĂ´dze ÄŤloveka. TĂ­movĂ˝ projekt FIIT STU Bratislava (2004)
[2] LuÄŤeniÄŤ, Ä˝.:  AnalĂ˝za a animĂˇcia chĂ´dze ÄŤloveka. TĂ­movĂ˝ projekt FIIT STU Bratislava (2005)

', 1);
INSERT INTO projects VALUES (174, 'ZP', 705, NULL, 164, '2002/2003', 'AutomatickĂ˝ nĂˇvrh sĂ©riovo-paralelnĂ˝ch hradlovĂ˝ch obvodov', 'Automatic design of serial-parallel gate circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (175, 'ZP', 298, NULL, 165, '2002/2003', 'InformaÄŤnĂ˝ systĂ©m regionĂˇlnej CISCO akadĂ©mie, prezentĂˇcia dĂˇt', 'Regional Cisco Academy information system, data presentation', NULL, NULL, 1);
INSERT INTO projects VALUES (176, 'DP', 433, NULL, 165, '2004/2005', 'SystĂ©m pre sprĂˇvu dokumentov v prostredĂ­ webu so sĂ©mantikou', 'Semantic web based system for document management', NULL, NULL, 1);
INSERT INTO projects VALUES (177, 'ZP', 417, NULL, 166, '2002/2003', 'SimulĂˇtor poÄŤĂ­taÄŤovej siete', 'SimulĂˇtor poÄŤĂ­taÄŤovej siete', NULL, NULL, 0);
INSERT INTO projects VALUES (178, 'ZP', 579, NULL, 167, '2005/2006', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili informaÄŤnĂ© vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb FIIT.', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili informaÄŤnĂ© vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb FIIT.', 1);
INSERT INTO projects VALUES (179, 'ZP', 660, NULL, 168, '2005/2006', 'CSIDC 2006', 'CSIDC 2006', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.
', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.
', 1);
INSERT INTO projects VALUES (180, 'ZP', 219, 260, 169, '2002/2003', 'Trhovo orientovanĂ˝ prĂ­stup k sprĂˇve prostriedkov vĂ˝poÄŤtovĂ©ho systĂ©mu', 'The market-oriented approach to the management of computational system', 'Trhovo orientovanĂ˝ prĂ­stup k sprĂˇve prostriedkov vĂ˝poÄŤtovĂ©ho systĂ©mu', 'Trhovo orientovanĂ˝ prĂ­stup k sprĂˇve prostriedkov vĂ˝poÄŤtovĂ©ho systĂ©mu', 1);
INSERT INTO projects VALUES (181, 'ZP', 374, NULL, 170, '2002/2003', 'Vlastnosti evoluÄŤnĂ˝ch algoritmov', 'Vlastnosti evoluÄŤnĂ˝ch algoritmov', NULL, NULL, 1);
INSERT INTO projects VALUES (182, 'ZP', 25, NULL, 171, '2002/2003', 'VzdialenĂ˝ prĂ­stup k hardwareovĂ˝m prostriedkom poÄŤĂ­taÄŤa', 'Hardware sharing in Unix operating systems', NULL, NULL, 0);
INSERT INTO projects VALUES (183, 'DP', 358, NULL, 171, '2003/2004', 'ImplementĂˇcia modelu bezpeÄŤnostnej politiky v bezpeÄŤnostnĂ˝ch brĂˇnach', 'Implementation of security policy model in firewalls', NULL, NULL, 0);
INSERT INTO projects VALUES (184, 'ZP', 358, NULL, 172, '2005/2006', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş testovaĹĄ vybratĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş testovaĹĄ vybratĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.', 0);
INSERT INTO projects VALUES (185, 'DP', 704, NULL, 173, '2005/2006', 'DiskusnĂ© fĂłrum virtuĂˇlnej univerzity', 'Virtual University â€“ discusion forums ', NULL, NULL, 1);
INSERT INTO projects VALUES (186, 'ZP', 704, NULL, 173, '2003/2004', 'DiskusnĂ© fĂłrum  univerzity', 'Virtual University â€“ discusion forums', 'Analyzujte sĂşÄŤasnĂ© spĂ´soby on-line  spĂ´soby konverzĂˇcie ( talkery) na sieti Internet. Analyzujte a porovnajte existujĂşce prostriedky. Na zĂˇklade analĂ˝zy  navrhnite vlastnĂ˝ takĂ˝to prostriedok. Pri nĂˇvrhu uvaĹľujte s jeho  vyuĹľitĂ­m ako prostriedku diskusnĂ©ho fĂłra pre systĂ©m virtuĂˇlnej univerzity. Treba zabezpeÄŤiĹĄ hierarchiu prĂ­stupovĂ˝ch prĂˇv jednotlivĂ˝ch pouĹľĂ­vateÄľov aj v sĂşvislosti ich zadelenia do tried a formu jednoduchĂ˝ch uĹľĂ­vateÄľskĂ˝ch prĂ­kazov. NĂˇvrh modulu pre viacuĹľĂ­vateÄľskĂş konverzĂˇciu implementujte a odskĂşĹˇajte ako prototyp. ', 'Analyzujte sĂşÄŤasnĂ© spĂ´soby on-line  spĂ´soby konverzĂˇcie ( talkery) na sieti Internet. Analyzujte a porovnajte existujĂşce prostriedky. Na zĂˇklade analĂ˝zy  navrhnite vlastnĂ˝ takĂ˝to prostriedok. Pri nĂˇvrhu uvaĹľujte s jeho  vyuĹľitĂ­m ako prostriedku diskusnĂ©ho fĂłra pre systĂ©m virtuĂˇlnej univerzity. Treba zabezpeÄŤiĹĄ hierarchiu prĂ­stupovĂ˝ch prĂˇv jednotlivĂ˝ch pouĹľĂ­vateÄľov aj v sĂşvislosti ich zadelenia do tried a formu jednoduchĂ˝ch uĹľĂ­vateÄľskĂ˝ch prĂ­kazov. NĂˇvrh modulu pre viacuĹľĂ­vateÄľskĂş konverzĂˇciu implementujte a odskĂşĹˇajte ako prototyp. ', 1);
INSERT INTO projects VALUES (187, 'ZP', 660, NULL, 174, '2002/2003', 'CSIDC', 'CSIDC', NULL, NULL, 1);
INSERT INTO projects VALUES (188, 'DP', 24, NULL, 174, '2003/2004', 'VyuĹľitie metĂłd zĂ­skavania znalostĂ­ z databĂˇz pre bankovĂ˝ sektor', 'Application of Knowledge Discovery in Databases Methods to Banking', NULL, NULL, 1);
INSERT INTO projects VALUES (189, 'ZP', 374, NULL, 176, '2002/2003', 'VylepĹˇenie prostredia pre simulĂˇcie robotickĂ©ho hokeja', 'Improvement of robotic hockey simulation environment', NULL, NULL, 1);
INSERT INTO projects VALUES (190, 'ZP', 562, 358, 177, '2002/2003', 'MeracĂ­ systĂ©m s PC', 'Measuring system with PC', NULL, NULL, 0);
INSERT INTO projects VALUES (191, 'DP', 562, 358, 177, '2003/2004', 'AutomatickĂ˝ meracĂ­ systĂ©m na diagnostiku polovodiÄŤovĂ˝ch ĹˇtruktĂşr', 'Automatic measurement system for diagnostics of semiconductor structures', NULL, NULL, 0);
INSERT INTO projects VALUES (192, 'ZP', 563, NULL, 178, '2002/2003', 'StatickĂ˝ vnĂştroobvodovĂ˝ emulĂˇtor', 'Static in-circuit emulator', NULL, NULL, 0);
INSERT INTO projects VALUES (193, 'DP', 563, NULL, 178, '2004/2005', 'VnorenĂ˝ multiprocesorovĂ˝ systĂ©m', 'Embedded multiprocessor system', NULL, NULL, 0);
INSERT INTO projects VALUES (194, 'ZP', 46, NULL, 179, '2002/2003', 'Tvorba nĂˇvrhovĂ˝ch vzorov  - ĹˇablĂłn', 'Creating design paterns â€“ templates', NULL, NULL, 1);
INSERT INTO projects VALUES (195, 'DP', 46, NULL, 179, '2004/2005', 'NĂˇvrhovĂ© vzory v tvorbe softvĂ©ru', 'DESIGN PATTERNS IN SOFTWARE DEVELOPMENT', NULL, NULL, 1);
INSERT INTO projects VALUES (196, 'ZP', 579, NULL, 180, '2002/2003', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS - 2', 'Multimedia information in regional information system - 2', NULL, NULL, 1);
INSERT INTO projects VALUES (197, 'DP', 655, NULL, 180, '2003/2004', 'TrĂ©novanie Echo state neurĂłnovĂ˝ch sietĂ­ algoritmom simulovanĂ©ho ĹľĂ­hania', 'Training of Echo state neural networks using simulated annealing algorithm', NULL, NULL, 1);
INSERT INTO projects VALUES (198, 'ZP', 660, NULL, 181, '2002/2003', 'CSIDC', 'CSIDC', NULL, NULL, 1);
INSERT INTO projects VALUES (199, 'DP', 342, NULL, 181, '2003/2004', 'ProgramovĂ© vybavenie pre spracovanie meteorologickĂ˝ch Ăşdajov', 'Software for processing of meteorological data', NULL, NULL, 1);
INSERT INTO projects VALUES (200, 'ZP', 188, NULL, 182, '2005/2006', 'SystĂ©m pre realizĂˇciu turnaja programov', 'SystĂ©m pre realizĂˇciu turnaja programov', 'Analyzujte, Ĺˇpecifikujte, navrhnite a implementujte systĂ©m, ktorĂ˝ umoĹľnĂ­ samostatne fungujĂşcim programom (hrĂˇÄŤom) odohraĹĄ turnaj vo zvolenej hre a urÄŤiĹĄ vĂ­ĹĄaza. Turnaj musĂ­ prebiehaĹĄ plne automaticky, predpokladajte moĹľnĂş ĂşÄŤasĹĄ desiatok hrĂˇÄŤov. Implementujte niekoÄľko takĂ˝chto hrĂˇÄŤov a prostrednĂ­ctvom vĂˇĹˇho systĂ©mu usporiadajte medzi nimi ukĂˇĹľkovĂ˝ turnaj.', 'Analyzujte, Ĺˇpecifikujte, navrhnite a implementujte systĂ©m, ktorĂ˝ umoĹľnĂ­ samostatne fungujĂşcim programom (hrĂˇÄŤom) odohraĹĄ turnaj vo zvolenej hre a urÄŤiĹĄ vĂ­ĹĄaza. Turnaj musĂ­ prebiehaĹĄ plne automaticky, predpokladajte moĹľnĂş ĂşÄŤasĹĄ desiatok hrĂˇÄŤov. Implementujte niekoÄľko takĂ˝chto hrĂˇÄŤov a prostrednĂ­ctvom vĂˇĹˇho systĂ©mu usporiadajte medzi nimi ukĂˇĹľkovĂ˝ turnaj.', 1);
INSERT INTO projects VALUES (201, 'ZP', 563, NULL, 183, '2002/2003', 'StatickĂ˝ vnĂştroobvodovĂ˝ emulĂˇtor', 'Static in-circuit emulator', NULL, NULL, 0);
INSERT INTO projects VALUES (202, 'DP', 563, NULL, 183, '2004/2005', 'VnorenĂ˝ multiprocesorovĂ˝ systĂ©m', 'Embedded multiprocessor system', NULL, NULL, 0);
INSERT INTO projects VALUES (203, 'ZP', 221, NULL, 185, '2002/2003', 'KryptoanalĂ˝za a pouĹľitie kryptosystĂ©mu XTR', 'Cryptanalysis and applications of XTR', NULL, NULL, 1);
INSERT INTO projects VALUES (204, 'DP', 396, NULL, 185, '2004/2005', 'KryptosystĂ©m XTR', 'The XTR Cryptosystem', NULL, NULL, 2);
INSERT INTO projects VALUES (205, 'ZP', 20, NULL, 186, '2002/2003', 'Modely rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­ zaloĹľenĂ© na architekturĂˇlnom biase', 'Models of recurrent neural networks based on architectural bias', NULL, NULL, 1);
INSERT INTO projects VALUES (206, 'DP', 579, NULL, 186, '2003/2004', 'VirtuĂˇlna univerzita â€“ sprĂˇva nevirtuĂˇlnych prostriedkov â€“ rezervaÄŤnĂ˝ podsystĂ©m', 'Virtual university - non-virtual resources management â€“ reservation subsystem', NULL, NULL, 1);
INSERT INTO projects VALUES (207, 'ZP', 705, NULL, 187, '2002/2003', 'AutomatickĂ˝ nĂˇvrh mostĂ­kovĂ˝ch hradlovĂ˝ch obvodov', 'Automatic design of bridge-gate circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (208, 'DP', 357, NULL, 187, '2004/2005', 'KĂłdovanie/dekĂłdovanie Reed Solomonovych kĂłdov na interaktĂ­vnom webe', 'Coding/decoding Reed Solomon codes on interactive web', NULL, NULL, 0);
INSERT INTO projects VALUES (209, 'ZP', 436, NULL, 189, '2002/2003', 'Program pre automatickĂş syntĂ©zu sekvenÄŤnĂ˝ch obvodov s preklĂˇpacĂ­mi obvodmi', 'Program for automatic synthesis of sequential circuits with flip â€“ flop circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (210, 'DP', 705, NULL, 189, '2003/2004', 'ProgramovĂ˝ systĂ©m na detekciu a eliminĂˇciu statickĂ˝ch hazardov', 'Program system for detection and elimination of static hazards', NULL, NULL, 0);
INSERT INTO projects VALUES (211, 'ZP', 660, NULL, 190, '2002/2003', 'Podpora organizovania ankiet v prostredĂ­ WWW', 'Support of design and operating web questionnaires', NULL, NULL, 1);
INSERT INTO projects VALUES (212, 'DP', 260, NULL, 190, '2003/2004', 'VĂ˝poÄŤtovĂ© prostredie pre aktĂ­vny sĂşborovĂ˝ systĂ©m', 'Computing environment for active file system', NULL, NULL, 1);
INSERT INTO projects VALUES (213, 'ZP', 563, NULL, 191, '2005/2006', 'ExperimentĂˇlny mikropoÄŤĂ­taÄŤ EMP386EX', 'ExperimentĂˇlny mikropoÄŤĂ­taÄŤ EMP386EX', 'Navrhnite a zrealizujte experimentĂˇlny mikropoÄŤĂ­taÄŤ na bĂˇze mikroprocesora 80386EX s nasledovnĂ˝mi poĹľiadavkami: 8-bitovĂˇ pamĂ¤ĹĄ ROM s kapacitou 512 kB s moĹľnosĹĄou rozĹˇĂ­renia, 16-bitovĂˇ pamĂ¤ĹĄ RWM s kapacitou 64 kB s moĹľnosĹĄou rozĹˇĂ­renia, moĹľnosĹĄ krokovania programu po stroj. cykloch cez stav WAIT, 6-miestny numerickĂ˝ displej, 2 sĂ©riovĂ© interfejsy RS232C, podpora pripojenia monitorovacej jednotky.', 'Navrhnite a zrealizujte experimentĂˇlny mikropoÄŤĂ­taÄŤ na bĂˇze mikroprocesora 80386EX s nasledovnĂ˝mi poĹľiadavkami: 8-bitovĂˇ pamĂ¤ĹĄ ROM s kapacitou 512 kB s moĹľnosĹĄou rozĹˇĂ­renia, 16-bitovĂˇ pamĂ¤ĹĄ RWM s kapacitou 64 kB s moĹľnosĹĄou rozĹˇĂ­renia, moĹľnosĹĄ krokovania programu po stroj. cykloch cez stav WAIT, 6-miestny numerickĂ˝ displej, 2 sĂ©riovĂ© interfejsy RS232C, podpora pripojenia monitorovacej jednotky.', 0);
INSERT INTO projects VALUES (214, 'ZP', 297, NULL, 192, '2002/2003', 'VirtuĂˇlny stroj', 'Virtual Machine', NULL, NULL, 1);
INSERT INTO projects VALUES (215, 'DP', 297, NULL, 192, '2004/2005', 'AnimĂˇcia ÄŤinnosti procesora', 'Animation of processor activity', NULL, NULL, 1);
INSERT INTO projects VALUES (216, 'ZP', 422, 297, 193, '2002/2003', 'Kontrola ĹˇachovĂ˝ch ĹĄahov', 'Checking of chess moves', NULL, NULL, 1);
INSERT INTO projects VALUES (217, 'DP', 422, NULL, 193, '2004/2005', 'AutomatickĂˇ oprava chĂ˝b v zĂˇpise Ĺˇachovej partie', 'Automatic errors corrections in text game of chess', NULL, NULL, 1);
INSERT INTO projects VALUES (218, 'ZP', 705, NULL, 194, '2005/2006', 'AutomatickĂ˝ nĂˇvrh logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s integrovanĂ˝mi obvodmi MSI', 'AutomatickĂ˝ nĂˇvrh logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s integrovanĂ˝mi obvodmi MSI', 'Treba vypracovaĹĄ metodiku automatickĂ©ho nĂˇvrhu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s jednĂ˝m vĂ˝stupom s pouĹľitĂ­m multiplexorov zo stavebnice  integrovanĂ˝ch obvodov MSI, a navrhnĂşĹĄ a odladiĹĄ programovĂ˝ systĂ©m pre osobnĂ˝ poÄŤĂ­taÄŤ. Vstupom mĂˇ byĹĄ boolovskĂˇ funkcia s najviac piatimi premennĂ˝mi zadanĂˇ ÄľubovoÄľnĂ˝m boolovskĂ˝m vĂ˝razom alebo pravdivostnou tabuÄľkou. VĂ˝stupom mĂˇ byĹĄ prepojovacĂ­ predpis opisujĂşci ĹˇtruktĂşru navrhnutĂ©ho logickĂ©ho obvodu.', 'Treba vypracovaĹĄ metodiku automatickĂ©ho nĂˇvrhu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s jednĂ˝m vĂ˝stupom s pouĹľitĂ­m multiplexorov zo stavebnice  integrovanĂ˝ch obvodov MSI, a navrhnĂşĹĄ a odladiĹĄ programovĂ˝ systĂ©m pre osobnĂ˝ poÄŤĂ­taÄŤ. Vstupom mĂˇ byĹĄ boolovskĂˇ funkcia s najviac piatimi premennĂ˝mi zadanĂˇ ÄľubovoÄľnĂ˝m boolovskĂ˝m vĂ˝razom alebo pravdivostnou tabuÄľkou. VĂ˝stupom mĂˇ byĹĄ prepojovacĂ­ predpis opisujĂşci ĹˇtruktĂşru navrhnutĂ©ho logickĂ©ho obvodu.', 0);
INSERT INTO projects VALUES (219, 'DP', 387, NULL, 195, '2005/2006', 'VyuĹľitie pravdepodobnostnĂ˝ch modelov so skrytĂ˝mi premennĂ˝mi na dolovanie v textovĂ˝ch databĂˇzach', 'Use of probabilistic models with unobserved variables for data mining in textual databases', NULL, NULL, 1);
INSERT INTO projects VALUES (220, 'ZP', 388, NULL, 195, '2003/2004', 'Spracovanie ĹˇtudentskĂ˝ch projektov', 'Processing of students assignments', 'Analyzujte typickĂ© ÄŤinnosti v Ĺľivotnom cykle ĹˇtudentskĂ˝ch projektov rieĹˇenĂ˝ch v rĂˇmci informatickĂ˝ch predmetov na KIVT. Analyzujte  moĹľnosti spracovania tĂ˝chto ÄŤinnostĂ­ v prostredĂ­ internetu a navrhnite softvĂ©rovĂ˝ systĂ©m na ich podporu.  SystĂ©m musĂ­ podporovaĹĄ ÄŤinnosti ako: tvorbu tĂ©m projektov k predmetu zo strany uÄŤiteÄľov, vĂ˝ber a schvĂˇlenie koneÄŤnej mnoĹľiny tĂ©m, prezentĂˇciu tĂ©m v pavuÄŤine pre Ĺˇtudentov, vĂ˝ber preferovanĂ˝ch tĂ©m zo strany Ĺˇtudentov, proces pridelenia tĂ©my, prezentĂˇciu koneÄŤnĂ©ho pridelenia,  odovzdanie rieĹˇenia v jednotlivĂ˝ch kontrolnĂ˝ch bodoch, atÄŹ. MusĂ­ zabezpeÄŤiĹĄ autorizovanĂ˝ prĂ­stup rĂ´znych kategĂłriĂ­ pouĹľĂ­vateÄľov. 
NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu pre vybranĂ© ÄŤinnosti ĹľivotnĂ©ho cyklu projektu. 

', 'Analyzujte typickĂ© ÄŤinnosti v Ĺľivotnom cykle ĹˇtudentskĂ˝ch projektov rieĹˇenĂ˝ch v rĂˇmci informatickĂ˝ch predmetov na KIVT. Analyzujte  moĹľnosti spracovania tĂ˝chto ÄŤinnostĂ­ v prostredĂ­ internetu a navrhnite softvĂ©rovĂ˝ systĂ©m na ich podporu.  SystĂ©m musĂ­ podporovaĹĄ ÄŤinnosti ako: tvorbu tĂ©m projektov k predmetu zo strany uÄŤiteÄľov, vĂ˝ber a schvĂˇlenie koneÄŤnej mnoĹľiny tĂ©m, prezentĂˇciu tĂ©m v pavuÄŤine pre Ĺˇtudentov, vĂ˝ber preferovanĂ˝ch tĂ©m zo strany Ĺˇtudentov, proces pridelenia tĂ©my, prezentĂˇciu koneÄŤnĂ©ho pridelenia,  odovzdanie rieĹˇenia v jednotlivĂ˝ch kontrolnĂ˝ch bodoch, atÄŹ. MusĂ­ zabezpeÄŤiĹĄ autorizovanĂ˝ prĂ­stup rĂ´znych kategĂłriĂ­ pouĹľĂ­vateÄľov. 
NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu pre vybranĂ© ÄŤinnosti ĹľivotnĂ©ho cyklu projektu. 

', 1);
INSERT INTO projects VALUES (221, 'ZP', 20, NULL, 196, '2005/2006', 'Editor neurĂłnovĂ˝ch sietĂ­', 'Editor neurĂłnovĂ˝ch sietĂ­', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch poprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou. NaĹˇtudujte problematiku neurĂłnovĂ˝ch sietĂ­ a rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­, zamerajte sa na moĹľnosti zakĂłdovania architektĂşry neurĂłnovĂ˝ch sietĂ­ vzhÄľadom na potreby trĂ©novacĂ­ch algoritmov. Vytvorte editor umoĹľĹujĂşci pouĹľĂ­vateÄľovi vytvoriĹĄ neurĂłnovĂş sieĹĄ vyuĹľĂ­vajĂşci navrhnutĂ˝ formĂˇt.', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch poprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou. NaĹˇtudujte problematiku neurĂłnovĂ˝ch sietĂ­ a rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­, zamerajte sa na moĹľnosti zakĂłdovania architektĂşry neurĂłnovĂ˝ch sietĂ­ vzhÄľadom na potreby trĂ©novacĂ­ch algoritmov. Vytvorte editor umoĹľĹujĂşci pouĹľĂ­vateÄľovi vytvoriĹĄ neurĂłnovĂş sieĹĄ vyuĹľĂ­vajĂşci navrhnutĂ˝ formĂˇt.', 1);
INSERT INTO projects VALUES (222, 'ZP', 25, NULL, 197, '2002/2003', 'VzdialenĂ˝ prĂ­stup k hardwareovĂ˝m prostriedkom poÄŤĂ­taÄŤa', 'Remote access to the computerâ€™s hardware', NULL, NULL, 1);
INSERT INTO projects VALUES (223, 'DP', 297, NULL, 197, '2003/2004', 'AnimĂˇcia vizualizovanĂ©ho programu', 'Animation of visualised program', NULL, NULL, 1);
INSERT INTO projects VALUES (224, 'ZP', 705, NULL, 198, '2005/2006', 'AutomatickĂ˝ nĂˇvrh logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s integrovanĂ˝mi obvodmi SSI', 'AutomatickĂ˝ nĂˇvrh logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s integrovanĂ˝mi obvodmi SSI', 'Treba vypracovaĹĄ metodiku automatickĂ©ho nĂˇvrhu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s jednĂ˝m vĂ˝stupom s pouĹľitĂ­m ÄŤlenov NAND zo stavebnice integrovanĂ˝ch obvodov SSI a  navrhnĂşĹĄ a odladiĹĄ programovĂ˝ systĂ©m pre osobnĂ˝ poÄŤĂ­taÄŤ. Vstupom mĂˇ byĹĄ boolovskĂˇ funkcia zadanĂˇ ÄľubovoÄľnĂ˝m boolovskĂ˝m vĂ˝razom alebo pravdivostnou tabuÄľkou. VĂ˝stupom mĂˇ byĹĄ prepojovacĂ­ predpis opisujĂşci ĹˇtruktĂşru navrhnutĂ©ho logickĂ©ho obvodu.', 'Treba vypracovaĹĄ metodiku automatickĂ©ho nĂˇvrhu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s jednĂ˝m vĂ˝stupom s pouĹľitĂ­m ÄŤlenov NAND zo stavebnice integrovanĂ˝ch obvodov SSI a  navrhnĂşĹĄ a odladiĹĄ programovĂ˝ systĂ©m pre osobnĂ˝ poÄŤĂ­taÄŤ. Vstupom mĂˇ byĹĄ boolovskĂˇ funkcia zadanĂˇ ÄľubovoÄľnĂ˝m boolovskĂ˝m vĂ˝razom alebo pravdivostnou tabuÄľkou. VĂ˝stupom mĂˇ byĹĄ prepojovacĂ­ predpis opisujĂşci ĹˇtruktĂşru navrhnutĂ©ho logickĂ©ho obvodu.', 0);
INSERT INTO projects VALUES (225, 'ZP', 92, 375, 199, '2002/2003', 'JednotnĂ© prihlĂˇsenie na bĂˇze XML v poÄŤĂ­taÄŤovĂ˝ch sieĹĄach', 'XML based single sign-on for comuter networks', NULL, NULL, 0);
INSERT INTO projects VALUES (226, 'DP', 92, 375, 199, '2003/2004', 'CentralizovanĂˇ sprĂˇva pouĹľĂ­vateÄľov', 'CentralizovanĂˇ sprĂˇva pouĹľĂ­vateÄľov', NULL, NULL, 0);
INSERT INTO projects VALUES (227, 'ZP', 13, 431, 200, '2002/2003', 'GenerĂˇtor testov pre poruchy oneskorenĂ­ v ÄŤĂ­slicovĂ˝ch obvodoch', 'Delay faults test generator for digital circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (228, 'DP', 13, NULL, 200, '2004/2005', 'GenerĂˇtor testov pre poruchy oneskorenĂ­ pre ĹˇtrukturovanĂ© sekvenÄŤnĂ© obvody', 'Delay faults test generator for full-scan sequential circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (229, 'ZP', 396, NULL, 201, '2002/2003', 'HistĂłria rotorovĂ˝ch ĹˇifrĂˇtorov a moĹľnosti ich dneĹˇnĂ©ho vyuĹľitia', 'The history of rotor systems and the possibilities of their application to date', NULL, NULL, 1);
INSERT INTO projects VALUES (230, 'DP', 517, NULL, 201, '2003/2004', 'StochastickĂ© CDGS nĂˇhodnĂ© grafy s vlastnosĹĄami grafov malĂ©ho sveta', 'Networks generation with properties of small world graphs â€“ genetic algorithm utilization', NULL, NULL, 1);
INSERT INTO projects VALUES (231, 'ZP', 541, NULL, 202, '2002/2003', 'InteligentnĂ© spracovanie informĂˇciĂ­ v distribuovanom prostredĂ­', 'Inteligent data processing in distributed systems', NULL, NULL, 1);
INSERT INTO projects VALUES (232, 'DP', 387, NULL, 202, '2004/2005', 'Klastrovanie dokumentov pomocou pravdepodobnostnĂ˝ch modelov', 'Unsupervised clustering of documents using probability models ', NULL, NULL, 1);
INSERT INTO projects VALUES (233, 'ZP', 215, NULL, 203, '2002/2003', 'FinanÄŤnĂ© operĂˇcie, ĹˇtruktĂşra nĂˇkladov, cykly a kapitĂˇlovĂ˝ trh v podmienkach rizika', 'FinanÄŤnĂ© operĂˇcie, ĹˇtruktĂşra nĂˇkladov, cykly a kapitĂˇlovĂ˝ trh v podmienkach rizika', NULL, NULL, 1);
INSERT INTO projects VALUES (234, 'ZP', 272, NULL, 204, '2002/2003', 'Podpora vĂ˝uÄŤby OOP', 'The support of teaching object oriented programming', NULL, NULL, 1);
INSERT INTO projects VALUES (235, 'DP', 437, NULL, 204, '2003/2004', 'VĂ˝voj otvorenĂ˝ch zdrojov a celosvetovĂˇ pavuÄŤina', 'Open Source Development and the World Wide Web', NULL, NULL, 1);
INSERT INTO projects VALUES (236, 'ZP', 396, NULL, 205, '2002/2003', 'Shannonov prĂ­stup ku bezpeÄŤnosti komunikĂˇcie a jeho aktuĂˇlnosĹĄ', 'Shannonâ€™s approach to the security of the communication and its current utilization.', NULL, NULL, 1);
INSERT INTO projects VALUES (237, 'DP', 437, NULL, 205, '2003/2004', 'Ĺ pecializaÄŤnĂ© vzory v navrhovanĂ­ programov v jazyku Java', 'Specialization patterns in program designing in Java language', NULL, NULL, 1);
INSERT INTO projects VALUES (238, 'ZP', 375, NULL, 206, '2002/2003', 'SystĂ©m pre sprĂˇvu a rieĹˇenie Ăşloh', 'System for administration and solving problems', NULL, NULL, 0);
INSERT INTO projects VALUES (239, 'DP', 375, NULL, 206, '2003/2004', 'ManaĹľment sieĹĄovĂ˝ch prvkov', 'System for management network elements', NULL, NULL, 0);
INSERT INTO projects VALUES (240, 'ZP', 297, NULL, 207, '2002/2003', 'VizualizĂˇcia programov', 'Program visualization', NULL, NULL, 1);
INSERT INTO projects VALUES (241, 'DP', 437, NULL, 207, '2003/2004', 'StratĂ©gie spoluprĂˇce vo viacagentovĂ˝ch systĂ©moch', 'Teamwork strategies in multiagent systems', NULL, NULL, 1);
INSERT INTO projects VALUES (242, 'ZP', 705, NULL, 208, '2006/2007', 'AutomatickĂ˝ nĂˇvrh logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s integrovanĂ˝mi obvodmi MSI', 'AutomatickĂ˝ nĂˇvrh logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s integrovanĂ˝mi obvodmi MSI', 'Treba vypracovaĹĄ metodiku automatickĂ©ho nĂˇvrhu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s jednĂ˝m vĂ˝stupom s pouĹľitĂ­m ÄŤlenov NOR zo stavebnice integrovanĂ˝ch obvodov SSI a navrhnĂşĹĄ a odladiĹĄ programovĂ˝ systĂ©m pre osobnĂ˝ poÄŤĂ­taÄŤ. Vstupom mĂˇ byĹĄ boolovskĂˇ funkcia zadanĂˇ ÄľubovoÄľnĂ˝m boolovskĂ˝m vĂ˝razom alebo pravdivostnou tabuÄľkou. VĂ˝stupom mĂˇ byĹĄ prepojovacĂ­ predpis opisujĂşci ĹˇtruktĂşru navrhnutĂ©ho logickĂ©ho obvodu.', 'Treba vypracovaĹĄ metodiku automatickĂ©ho nĂˇvrhu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s jednĂ˝m vĂ˝stupom s pouĹľitĂ­m ÄŤlenov NOR zo stavebnice integrovanĂ˝ch obvodov SSI a navrhnĂşĹĄ a odladiĹĄ programovĂ˝ systĂ©m pre osobnĂ˝ poÄŤĂ­taÄŤ. Vstupom mĂˇ byĹĄ boolovskĂˇ funkcia zadanĂˇ ÄľubovoÄľnĂ˝m boolovskĂ˝m vĂ˝razom alebo pravdivostnou tabuÄľkou. VĂ˝stupom mĂˇ byĹĄ prepojovacĂ­ predpis opisujĂşci ĹˇtruktĂşru navrhnutĂ©ho logickĂ©ho obvodu.', 0);
INSERT INTO projects VALUES (243, 'ZP', 25, NULL, 209, '2005/2006', 'Monitorovanie pouĹľĂ­vateÄľskĂ˝ch procesov', 'Monitorovanie pouĹľĂ­vateÄľskĂ˝ch procesov', 'Analyzujte moĹľnosti zĂ­skania Ăşdajov o beĹľiacich procesoch (ako nĂˇzov prĂ­kazu, argumenty, pouĹľĂ­vateÄľ, alokovanĂ© prostriedky, atÄŹ.) v OS. Vypracujte nĂˇvrh systĂ©mu, ktorĂ˝ na zĂˇklade tĂ˝chto Ăşdajov a konfigurĂˇcie zadanej pouĹľĂ­vateÄľom bude sledovaĹĄ a ovplyvĹovaĹĄ stav procesov. SystĂ©m implementujte a otestujte.', 'Analyzujte moĹľnosti zĂ­skania Ăşdajov o beĹľiacich procesoch (ako nĂˇzov prĂ­kazu, argumenty, pouĹľĂ­vateÄľ, alokovanĂ© prostriedky, atÄŹ.) v OS. Vypracujte nĂˇvrh systĂ©mu, ktorĂ˝ na zĂˇklade tĂ˝chto Ăşdajov a konfigurĂˇcie zadanej pouĹľĂ­vateÄľom bude sledovaĹĄ a ovplyvĹovaĹĄ stav procesov. SystĂ©m implementujte a otestujte.', 0);
INSERT INTO projects VALUES (244, 'ZP', 387, NULL, 210, '2005/2006', 'Sharing book reviews', 'Sharing book reviews', 'On the Internet, one can find book reviews on sites of Internet book stores (e.g. Amazon.com). But information about books and book reviews
is writteln only in one language and it is not possible to add a new book that is not offered by the store. That is why, there is need for Internet portal that enables the user to add information about new books and publish their reviews. Analyze existing portals, design an implement Internet portal that provides a hierarchy of categories where users can
add the  information about new books and write their reviews. All those
information should be reviesed by administrator. He might be also able
to edit hierarchy of categories â€“ based on different characteristics (e.g. language, genre).', 'On the Internet, one can find book reviews on sites of Internet book stores (e.g. Amazon.com). But information about books and book reviews
is writteln only in one language and it is not possible to add a new book that is not offered by the store. That is why, there is need for Internet portal that enables the user to add information about new books and publish their reviews. Analyze existing portals, design an implement Internet portal that provides a hierarchy of categories where users can
add the  information about new books and write their reviews. All those
information should be reviesed by administrator. He might be also able
to edit hierarchy of categories â€“ based on different characteristics (e.g. language, genre).', 1);
INSERT INTO projects VALUES (245, 'ZP', 360, NULL, 211, '2002/2003', 'ProgramovĂˇ podpora vĂ˝uÄŤby jazyka VHDL', 'Software support for VHDL language teaching', NULL, NULL, 0);
INSERT INTO projects VALUES (246, 'DP', 25, NULL, 211, '2003/2004', 'ImplementĂˇcia politiky prideÄľovania systĂ©movĂ˝ch zdrojov', 'Implementation of system resources allocation policy', NULL, NULL, 0);
INSERT INTO projects VALUES (247, 'ZP', 31, NULL, 212, '2002/2003', 'NovĂ© ÄŤrty pre aplikĂˇciu EGRET', 'New features for application EGRET', NULL, NULL, 1);
INSERT INTO projects VALUES (248, 'DP', 294, NULL, 212, '2005/2006', 'Hovoriaca hlava so simulovanĂ­m vĂ˝razov tvĂˇre', 'Hovoriaca hlava so simulovanĂ­m vĂ˝razov tvĂˇre', NULL, NULL, 1);
INSERT INTO projects VALUES (249, 'ZP', 375, NULL, 213, '2002/2003', 'SystĂ©m pre sprĂˇvu a rieĹˇenie Ăşloh', 'Administrating and Solving Task System', NULL, NULL, 1);
INSERT INTO projects VALUES (250, 'DP', 388, NULL, 213, '2003/2004', 'Podpora sprĂ­stupĹovania dokumentov', 'Support for documents accessing', NULL, NULL, 1);
INSERT INTO projects VALUES (251, 'DP', 253, NULL, 214, '2004/2005', 'MultimediĂˇlna vĂ˝uÄŤba ekonĂłmie', 'Multimedia Economics Training', NULL, NULL, 3);
INSERT INTO projects VALUES (252, 'ZP', 566, NULL, 216, '2005/2006', 'PouĹľitie neurĂłnovĂ˝ch sietĂ­ k "diĹˇtanÄŤnĂ©mu" riadeniu zloĹľitĂ˝ch systĂ©mov', 'PouĹľitie neurĂłnovĂ˝ch sietĂ­ k "diĹˇtanÄŤnĂ©mu" riadeniu zloĹľitĂ˝ch systĂ©mov', 'Ak stojĂ­me pred problĂ©mom, ako riadiĹĄ nejakĂ˝ zloĹľitĂ˝ systĂ©m, obvykle tento problĂ©m rieĹˇime pomocou modelu "diĹˇtanÄŤnĂ©ho" riadenia, ktorĂ˝ v kognitĂ­vnej vede patrĂ­ medzi zĂˇkladnĂ© modely. V prvej etape si vytvorĂ­me vnĂştornĂ˝ model systĂ©mu, ktorĂ˝ odrĂˇĹľa zĂˇkladnĂ© vlastnosti riadenĂ©ho systĂ©mu. V ÄŹalĹˇej etape uĹľ zloĹľitĂ˝ systĂ©m riadime pomocou tohto modelu.
Podrobnosti prĂ­stupu sĂş uvedenĂ© v kapitole, ktorĂˇ je uvedenĂˇ na adrese
ftp://math.chtf.stuba.sk/pub/vlado/FSEV_Informatika/skripta/pdf_final/Kapitola12.pdf
', 'Ak stojĂ­me pred problĂ©mom, ako riadiĹĄ nejakĂ˝ zloĹľitĂ˝ systĂ©m, obvykle tento problĂ©m rieĹˇime pomocou modelu "diĹˇtanÄŤnĂ©ho" riadenia, ktorĂ˝ v kognitĂ­vnej vede patrĂ­ medzi zĂˇkladnĂ© modely. V prvej etape si vytvorĂ­me vnĂştornĂ˝ model systĂ©mu, ktorĂ˝ odrĂˇĹľa zĂˇkladnĂ© vlastnosti riadenĂ©ho systĂ©mu. V ÄŹalĹˇej etape uĹľ zloĹľitĂ˝ systĂ©m riadime pomocou tohto modelu.
Podrobnosti prĂ­stupu sĂş uvedenĂ© v kapitole, ktorĂˇ je uvedenĂˇ na adrese
ftp://math.chtf.stuba.sk/pub/vlado/FSEV_Informatika/skripta/pdf_final/Kapitola12.pdf
', 1);
INSERT INTO projects VALUES (253, 'DP', 298, NULL, 217, '2003/2004', 'VirtuĂˇlna univerzita', 'Virtual University', NULL, NULL, 0);
INSERT INTO projects VALUES (254, 'ZP', 44, NULL, 222, '2005/2006', 'ImplementĂˇcia algoritmov na hÄľadanie hamiltonovskĂ˝ch kruĹľnĂ­c v grafe', 'ImplementĂˇcia algoritmov na hÄľadanie hamiltonovskĂ˝ch kruĹľnĂ­c v grafe', 'Ăšloha zistiĹĄ, ÄŤi v grafe existuje hamiltonovskĂˇ kruĹľnica je NP-ĂşplnĂ˝ problĂ©m. Jeden moĹľnĂ˝ prĂ­stup, ako zvlĂˇdnuĹĄ tento problĂ©m v praxi, je overiĹĄ nejakĂş postaÄŤujĂşcu podmienku hamiltonovskosti (napr. podmienku Bondyho a ChvĂˇtala - dĂˇ sa overiĹĄ v polynomiĂˇlnom ÄŤase). TĂ˝m vĹˇak zĂşĹľime mnoĹľinu hamiltonovskĂ˝ch grafov, pretoĹľe nie vĹˇetky hamiltonovskĂ© grafy jej vyhovujĂş.
Inou moĹľnosĹĄou je implemetovaĹĄ nejakĂ˝ heuristickĂ˝ algoritmus a hÄľadaĹĄ hamiltonovskĂş kruĹľnicu podÄľa neho.
Projekt by mal rieĹˇiĹĄ danĂ˝ problĂ©m obidvomi prĂ­stupmi.', 'Ăšloha zistiĹĄ, ÄŤi v grafe existuje hamiltonovskĂˇ kruĹľnica je NP-ĂşplnĂ˝ problĂ©m. Jeden moĹľnĂ˝ prĂ­stup, ako zvlĂˇdnuĹĄ tento problĂ©m v praxi, je overiĹĄ nejakĂş postaÄŤujĂşcu podmienku hamiltonovskosti (napr. podmienku Bondyho a ChvĂˇtala - dĂˇ sa overiĹĄ v polynomiĂˇlnom ÄŤase). TĂ˝m vĹˇak zĂşĹľime mnoĹľinu hamiltonovskĂ˝ch grafov, pretoĹľe nie vĹˇetky hamiltonovskĂ© grafy jej vyhovujĂş.
Inou moĹľnosĹĄou je implemetovaĹĄ nejakĂ˝ heuristickĂ˝ algoritmus a hÄľadaĹĄ hamiltonovskĂş kruĹľnicu podÄľa neho.
Projekt by mal rieĹˇiĹĄ danĂ˝ problĂ©m obidvomi prĂ­stupmi.', 1);
INSERT INTO projects VALUES (255, 'ZP', 297, NULL, 223, '2002/2003', 'SimulĂˇtor strojovĂ˝ch inĹˇtrukciĂ­ procesora', 'Simulation of machine level instructions for a microprocessor', NULL, NULL, 1);
INSERT INTO projects VALUES (256, 'DP', 374, NULL, 223, '2003/2004', 'Vlastnosti mobilnĂ˝ch agentov z rĂ´znych vĂ˝vojovĂ˝ch prostredĂ­', 'Characteristics of mobile agents from different development environments', NULL, NULL, 1);
INSERT INTO projects VALUES (257, 'ZP', 387, NULL, 227, '2002/2003', 'OdhaÄľovanie zĂˇujmov a odporĂşÄŤanie informĂˇciĂ­', 'Relevant information recommendation', NULL, NULL, 1);
INSERT INTO projects VALUES (258, 'DP', 566, NULL, 227, '2003/2004', 'KoevolĂşcia univerzĂˇlnej gramatiky a gramatiky', 'KoevolĂşcia univerzĂˇlnej gramatiky a gramatiky', NULL, NULL, 1);
INSERT INTO projects VALUES (259, 'ZP', 46, NULL, 228, '2002/2003', 'VyuĹľitie CASE prostriedku na objektovo-orientovanĂş tvorbu softvĂ©rovĂ©ho systĂ©mu', 'VyuĹľitie CASE prostriedku na objektovo-orientovanĂş tvorbu softvĂ©rovĂ©ho systĂ©mu', 'Na zĂˇklade analĂ˝zy pouĹľiteÄľnosti a dostupnosti CASE prostriedkov v univerzitnom prostredĂ­ vyberte takĂ˝, ktorĂ˝ podporuje objektovo-orientovanĂş tvorbu softvĂ©ru. V Ĺom Ĺˇpecifikujte a navrhnite softvĂ©rovĂ˝ systĂ©m pre poĹľiÄŤovĹu videokaziet. PouĹľite pritom znĂˇme techniky objektovo-orientovanej analĂ˝zy a nĂˇvrhu (UML). Na implementĂˇciu vyuĹľite moĹľnosĹĄ generovania kĂłdu z vytvorenĂ˝ch modelov', 'Na zĂˇklade analĂ˝zy pouĹľiteÄľnosti a dostupnosti CASE prostriedkov v univerzitnom prostredĂ­ vyberte takĂ˝, ktorĂ˝ podporuje objektovo-orientovanĂş tvorbu softvĂ©ru. V Ĺom Ĺˇpecifikujte a navrhnite softvĂ©rovĂ˝ systĂ©m pre poĹľiÄŤovĹu videokaziet. PouĹľite pritom znĂˇme techniky objektovo-orientovanej analĂ˝zy a nĂˇvrhu (UML). Na implementĂˇciu vyuĹľite moĹľnosĹĄ generovania kĂłdu z vytvorenĂ˝ch modelov', 1);
INSERT INTO projects VALUES (260, 'ZP', 431, NULL, 229, '2002/2003', 'AutomatizovanĂ© testovanie vedomostĂ­', 'Computer assisted testing system', NULL, NULL, 0);
INSERT INTO projects VALUES (261, 'DP', 431, NULL, 229, '2004/2005', 'AutomatizovanĂ© testovanie vedomostĂ­', 'AutomatizovanĂ© testovanie vedomostĂ­', NULL, NULL, 0);
INSERT INTO projects VALUES (262, 'ZP', 375, NULL, 230, '2005/2006', 'DistribuovanĂ© vĂ˝poÄŤty', 'DistribuovanĂ© vĂ˝poÄŤty', 'Analyzujte moĹľnosti rieĹˇenia vĂ˝poÄŤtovĂ˝ch Ăşloh v prostredĂ­ poÄŤĂ­taÄŤovĂ˝ch sietĂ­. Navrhnite systĂ©m distribĂşcie Ăşloh na rĂ´zne uzly v sieti a ich vykonanie.   NavrhnutĂ˝ a implementovanĂ˝ systĂ©m overte v TCP/IP sieti.  ', 'Analyzujte moĹľnosti rieĹˇenia vĂ˝poÄŤtovĂ˝ch Ăşloh v prostredĂ­ poÄŤĂ­taÄŤovĂ˝ch sietĂ­. Navrhnite systĂ©m distribĂşcie Ăşloh na rĂ´zne uzly v sieti a ich vykonanie.   NavrhnutĂ˝ a implementovanĂ˝ systĂ©m overte v TCP/IP sieti.  ', 0);
INSERT INTO projects VALUES (263, 'ZP', 95, NULL, 231, '2002/2003', 'Podpora vyuÄŤovania MaPĹ  - B-jazyk', 'Support of teaching course on formal methods - B language', NULL, NULL, 1);
INSERT INTO projects VALUES (264, 'DP', 672, NULL, 231, '2003/2004', 'PravdepodobnostnĂˇ ĹˇtruktĂşra modelu smerovanej  perkolĂˇcie na Ĺˇtvorcovej mrieĹľke', 'Percolation Backbones on the Square Lattice', NULL, NULL, 1);
INSERT INTO projects VALUES (265, 'ZP', 235, 297, 232, '2002/2003', 'ProgramovĂ˝ systĂ©m na simulĂˇciu bioelektrickĂ˝ch polĂ­', 'Program System for Bio-electrical Fields Simulation', NULL, NULL, 1);
INSERT INTO projects VALUES (266, 'DP', 247, 358, 232, '2004/2005', 'HavarijnĂ© plĂˇny informaÄŤnĂ˝ch systĂ©mov', 'HavarijnĂ© plĂˇny informaÄŤnĂ˝ch systĂ©mov', NULL, NULL, 2);
INSERT INTO projects VALUES (267, 'DP', 437, NULL, 233, '2003/2004', 'Modelovanie architektonickĂ©ho nĂˇvrhu softvĂ©rovĂ©ho systĂ©mu pomocou UML', 'Modelovanie architektonickĂ©ho nĂˇvrhu softvĂ©rovĂ©ho systĂ©mu pomocou UML', NULL, NULL, 1);
INSERT INTO projects VALUES (268, 'ZP', 236, 98, 233, '2002/2003', 'eBiznis, implementĂˇcia aplikĂˇcie umoĹľĹujĂşcej obchodovanie na Internete.', 'eBusiness, Implementation of Application to Allow Business Transactions on Internet', NULL, NULL, 1);
INSERT INTO projects VALUES (269, 'ZP', 237, 704, 234, '2002/2003', 'WebovskĂ˝ dokumentaÄŤnĂ˝ nĂˇstroj pre nĂˇvrh databĂˇz', 'Web application for database modeling and documentation', NULL, NULL, 1);
INSERT INTO projects VALUES (270, 'DP', 660, NULL, 234, '2003/2004', 'VyhÄľadĂˇvanie elektronickĂ˝ch dokumentov v osobnom informaÄŤnom priestore', 'VyhÄľadĂˇvanie elektronickĂ˝ch dokumentov v osobnom informaÄŤnom priestore', NULL, NULL, 1);
INSERT INTO projects VALUES (271, 'ZP', 705, NULL, 238, '2005/2006', 'AutomatickĂ˝ nĂˇvrh logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s integrovanĂ˝mi obvodmi SSI', 'AutomatickĂ˝ nĂˇvrh logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s integrovanĂ˝mi obvodmi SSI', 'Treba vypracovaĹĄ metodiku automatickĂ©ho nĂˇvrhu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s jednĂ˝m vĂ˝stupom s pouĹľitĂ­m ÄŤlenov NOR zo stavebnice integrovanĂ˝ch obvodov SSI a navrhnĂşĹĄ a odladiĹĄ programovĂ˝ systĂ©m pre osobnĂ˝ poÄŤĂ­taÄŤ. Vstupom mĂˇ byĹĄ boolovskĂˇ funkcia zadanĂˇ ÄľubovoÄľnĂ˝m boolovskĂ˝m vĂ˝razom alebo pravdivostnou tabuÄľkou. VĂ˝stupom mĂˇ byĹĄ prepojovacĂ­ predpis opisujĂşci ĹˇtruktĂşru navrhnutĂ©ho logickĂ©ho obvodu.', 'Treba vypracovaĹĄ metodiku automatickĂ©ho nĂˇvrhu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s jednĂ˝m vĂ˝stupom s pouĹľitĂ­m ÄŤlenov NOR zo stavebnice integrovanĂ˝ch obvodov SSI a navrhnĂşĹĄ a odladiĹĄ programovĂ˝ systĂ©m pre osobnĂ˝ poÄŤĂ­taÄŤ. Vstupom mĂˇ byĹĄ boolovskĂˇ funkcia zadanĂˇ ÄľubovoÄľnĂ˝m boolovskĂ˝m vĂ˝razom alebo pravdivostnou tabuÄľkou. VĂ˝stupom mĂˇ byĹĄ prepojovacĂ­ predpis opisujĂşci ĹˇtruktĂşru navrhnutĂ©ho logickĂ©ho obvodu.', 0);
INSERT INTO projects VALUES (272, 'ZP', 670, NULL, 239, '2005/2006', 'Odhad ÄŤasovej nĂˇroÄŤnosti softvĂ©rovĂ©ho modulu', 'Odhad ÄŤasovej nĂˇroÄŤnosti softvĂ©rovĂ©ho modulu', 'Na zĂˇklade opisu softvĂ©rovĂ©ho modulu v danom ĹˇpecifikaÄŤnom jazyku odhadnite jeho ÄŤasovĂş nĂˇroÄŤnosĹĄ pomocou minimĂˇlne 2 rĂ´znych metĂłd. UmoĹľnite tvorbu kniĹľnice modulov, kde kaĹľdĂ˝ modul je moĹľnĂ© oceniĹĄ pre rĂ´zne architektĂşry (podÄľa toho na akom procesore je modul spustenĂ˝). VybranĂ© metĂłdy opĂ­Ĺˇte a zhodnoĹĄte ich vlastnosti.

OdporĂşÄŤanĂˇ literatĂşra:
[1] J. Straustrup, W. Wolf: Hardware/Software Co-Design: Principles and Practise, Kluwer 1997, p. 395
[2] P. Giusto, G. Martin: Reliable Estimation of Execution Time of Embedded Software, Cadence, 2001, p. 8
[3] A. V. Aho, et. al.: Compilers: Principles, Techniques, and Tools, Addison Wesley, 1986, p. 796

Pozn.: PrĂ­stupnĂ© elektronickĂ© kniĹľnice z domĂ©ny stuba.sk
http://portal.acm.org/
http://www.computer.org/dlsearch.htm', 'Na zĂˇklade opisu softvĂ©rovĂ©ho modulu v danom ĹˇpecifikaÄŤnom jazyku odhadnite jeho ÄŤasovĂş nĂˇroÄŤnosĹĄ pomocou minimĂˇlne 2 rĂ´znych metĂłd. UmoĹľnite tvorbu kniĹľnice modulov, kde kaĹľdĂ˝ modul je moĹľnĂ© oceniĹĄ pre rĂ´zne architektĂşry (podÄľa toho na akom procesore je modul spustenĂ˝). VybranĂ© metĂłdy opĂ­Ĺˇte a zhodnoĹĄte ich vlastnosti.

OdporĂşÄŤanĂˇ literatĂşra:
[1] J. Straustrup, W. Wolf: Hardware/Software Co-Design: Principles and Practise, Kluwer 1997, p. 395
[2] P. Giusto, G. Martin: Reliable Estimation of Execution Time of Embedded Software, Cadence, 2001, p. 8
[3] A. V. Aho, et. al.: Compilers: Principles, Techniques, and Tools, Addison Wesley, 1986, p. 796

Pozn.: PrĂ­stupnĂ© elektronickĂ© kniĹľnice z domĂ©ny stuba.sk
http://portal.acm.org/
http://www.computer.org/dlsearch.htm', 0);
INSERT INTO projects VALUES (273, 'ZP', 660, NULL, 240, '2005/2006', 'CSIDC 2006', 'CSIDC 2006', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.
', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.
', 1);
INSERT INTO projects VALUES (274, 'DP', 25, NULL, 241, '2003/2004', 'NeĹˇtandardnĂ© moĹľnosti komunikĂˇcie v TCP/IP sieĹĄach', 'NeĹˇtandardnĂ© moĹľnosti komunikĂˇcie v TCP/IP sieĹĄach', NULL, NULL, 0);
INSERT INTO projects VALUES (275, 'DP', 358, NULL, 242, '2004/2005', 'Riadenie testovania bezpeÄŤnosti poÄŤĂ­taÄŤovej siete', 'Computer Network Security Testing Control', NULL, NULL, 0);
INSERT INTO projects VALUES (276, 'DP', 98, NULL, 243, '2004/2005', 'RozpoznĂˇvanie digitĂˇlnych kriviek', 'Recognition of digital curves', NULL, NULL, 1);
INSERT INTO projects VALUES (277, 'DP', 342, NULL, 248, '2003/2004', 'ProgramovĂˇ podpora nĂˇvrhu riadiacich systĂ©mov', 'Program support for control systemâ€™s design', NULL, NULL, 0);
INSERT INTO projects VALUES (278, 'ZP', 342, NULL, 254, '2005/2006', 'ProgramovĂ˝ systĂ©m pre nĂˇvrh riadiacich jednotiek na bĂˇze  mikropoÄŤĂ­taÄŤa', 'ProgramovĂ˝ systĂ©m pre nĂˇvrh riadiacich jednotiek na bĂˇze  mikropoÄŤĂ­taÄŤa', 'Analyzujte moĹľnosti vyuĹľitia existujĂşcich mikropoÄŤĂ­taÄŤovĂ˝ch modulov na nĂˇvrh a realizĂˇciu riadiacich jednotiek. 
Navrhnite inĹˇtrukÄŤnĂ˝ sĂşbor virtuĂˇlneho procesora vhodnĂ©ho na realizĂˇciu vybranej triedy riadiacich jednotiek.
Navrhnite a zrealizujte vybranĂş ÄŤasĹĄ prekladaÄŤa programu  virtuĂˇlneho procesora na program v JSI vybranĂ©ho mikropoÄŤĂ­taÄŤa.
', 'Analyzujte moĹľnosti vyuĹľitia existujĂşcich mikropoÄŤĂ­taÄŤovĂ˝ch modulov na nĂˇvrh a realizĂˇciu riadiacich jednotiek. 
Navrhnite inĹˇtrukÄŤnĂ˝ sĂşbor virtuĂˇlneho procesora vhodnĂ©ho na realizĂˇciu vybranej triedy riadiacich jednotiek.
Navrhnite a zrealizujte vybranĂş ÄŤasĹĄ prekladaÄŤa programu  virtuĂˇlneho procesora na program v JSI vybranĂ©ho mikropoÄŤĂ­taÄŤa.
', 0);
INSERT INTO projects VALUES (279, 'ZP', 25, NULL, 255, '2005/2006', 'ImplementĂˇcia bezpeÄŤnostnĂ˝ch mechanizmov v systĂ©me vzdialenĂ©ho prĂ­stupu k hardvĂ©ru', 'ImplementĂˇcia bezpeÄŤnostnĂ˝ch mechanizmov v systĂ©me vzdialenĂ©ho prĂ­stupu k hardvĂ©ru', 'Analyzujte ĹˇtandardnĂ© spĂ´soby zabezpeÄŤenia prĂ­stupu k sĂşborom a sieĹĄovĂ˝m sluĹľbĂˇm, ako aj spĂ´soby ochrany prenĂˇĹˇanĂ˝ch dĂˇt (napr. SSL), v prostredĂ­ operaÄŤnĂ©ho systĂ©mu unix-ovĂ©ho typu. Navrhnite vhodnĂ˝ spĂ´sob vyuĹľitia tĂ˝chto bezpeÄŤnostnĂ˝ch mechanizmov v existujĂşcom systĂ©me vzdialenĂ©ho prĂ­stupu k hardvĂ©rovĂ˝m prostriedkom poÄŤĂ­taÄŤa pomocou siete (ide o aplikĂˇciu typu klient - server). NavrhnutĂ© rieĹˇenie implementujte a overte jeho funkÄŤnosĹĄ a spoÄľahlivosĹĄ.', 'Analyzujte ĹˇtandardnĂ© spĂ´soby zabezpeÄŤenia prĂ­stupu k sĂşborom a sieĹĄovĂ˝m sluĹľbĂˇm, ako aj spĂ´soby ochrany prenĂˇĹˇanĂ˝ch dĂˇt (napr. SSL), v prostredĂ­ operaÄŤnĂ©ho systĂ©mu unix-ovĂ©ho typu. Navrhnite vhodnĂ˝ spĂ´sob vyuĹľitia tĂ˝chto bezpeÄŤnostnĂ˝ch mechanizmov v existujĂşcom systĂ©me vzdialenĂ©ho prĂ­stupu k hardvĂ©rovĂ˝m prostriedkom poÄŤĂ­taÄŤa pomocou siete (ide o aplikĂˇciu typu klient - server). NavrhnutĂ© rieĹˇenie implementujte a overte jeho funkÄŤnosĹĄ a spoÄľahlivosĹĄ.', 0);
INSERT INTO projects VALUES (280, 'ZP', 301, NULL, 257, '2006/2007', 'NĂˇvrh a implementĂˇcia systĂ©mu na grafickĂş vizualizĂˇciu ÄŤinnosti vyrovnĂˇvacej pamĂ¤ti poÄŤĂ­taÄŤa', 'NĂˇvrh a implementĂˇcia systĂ©mu na grafickĂş vizualizĂˇciu ÄŤinnosti vyrovnĂˇvacej pamĂ¤ti poÄŤĂ­taÄŤa', 'Navrhnite a implementujte systĂ©m, ktorĂ˝ bude s vyuĹľitĂ­m multimediĂˇlnych technolĂłgiĂ­ umoĹľĹovaĹĄ  naĹˇtudovanie, grafickĂ© zobrazenie a demonĹˇtrĂˇciu  dejov pri ÄŤinnosti vyrovnĂˇvacej pamĂ¤te poÄŤĂ­taÄŤa.
Produkt implementujte ako hypermediĂˇlnu prezentĂˇciu vo voÄľne dostupnom webovom prehliadaÄŤi.', 'Navrhnite a implementujte systĂ©m, ktorĂ˝ bude s vyuĹľitĂ­m multimediĂˇlnych technolĂłgiĂ­ umoĹľĹovaĹĄ  naĹˇtudovanie, grafickĂ© zobrazenie a demonĹˇtrĂˇciu  dejov pri ÄŤinnosti vyrovnĂˇvacej pamĂ¤te poÄŤĂ­taÄŤa.
Produkt implementujte ako hypermediĂˇlnu prezentĂˇciu vo voÄľne dostupnom webovom prehliadaÄŤi.', 0);
INSERT INTO projects VALUES (281, 'ZP', 46, NULL, 258, '2002/2003', 'VyuĹľitie CRM v elektronickom obchode', 'Usage of CRM in e-bussines', NULL, NULL, 1);
INSERT INTO projects VALUES (282, 'DP', 46, NULL, 258, '2003/2004', 'VyuĹľitie CRM v elektronickom obchode', 'Usage of CRM in e-bussines', NULL, NULL, 1);
INSERT INTO projects VALUES (283, 'ZP', 437, NULL, 259, '2005/2006', 'KatalĂłg nĂˇvrhovĂ˝ch vzorov', 'KatalĂłg nĂˇvrhovĂ˝ch vzorov', 'NĂˇvrhovĂ© vzory sa stĂˇvajĂş dĂ´leĹľitĂ˝m nĂˇstrojom na  vyjadrenie opakujĂşcich sa rieĹˇenĂ­ pri navrhovanĂ­ softvĂ©rovĂ˝ch systĂ©mov. ExistujĂş viacerĂ© sady nĂˇvrhovĂ˝ch vzorov aj viacerĂ© samostatnĂ© vzory. PokĂşste sa ich zhromaĹľdiĹĄ a vytvoriĹĄ jednotnĂ˝ katalĂłg. Navrhnite pre ne vhodnĂ˝ spĂ´sob reprezentĂˇcie. ZvĂˇĹľte pouĹľitie jazyka UML. ', 'NĂˇvrhovĂ© vzory sa stĂˇvajĂş dĂ´leĹľitĂ˝m nĂˇstrojom na  vyjadrenie opakujĂşcich sa rieĹˇenĂ­ pri navrhovanĂ­ softvĂ©rovĂ˝ch systĂ©mov. ExistujĂş viacerĂ© sady nĂˇvrhovĂ˝ch vzorov aj viacerĂ© samostatnĂ© vzory. PokĂşste sa ich zhromaĹľdiĹĄ a vytvoriĹĄ jednotnĂ˝ katalĂłg. Navrhnite pre ne vhodnĂ˝ spĂ´sob reprezentĂˇcie. ZvĂˇĹľte pouĹľitie jazyka UML. ', 1);
INSERT INTO projects VALUES (284, 'ZP', 541, NULL, 262, '2005/2006', 'RozpoznĂˇvanie obrazov z infrakamery', 'RozpoznĂˇvanie obrazov z infrakamery', 'Navrhnite a realizujte systĂ©m pre rozpoznanie  ÄŤloveka z obrazu infrakamery. SystĂ©m mĂˇ umoĹľniĹĄ v reĂˇlnom ÄŤase rozpoznaĹĄ, ÄŤi sa v prĂˇve snĂ­manom obraze infrakamery nachĂˇdza silueta ÄŤloveka a indikovaĹĄ takĂ˝to stav. SystĂ©m mĂ´Ĺľe byĹĄ vyuĹľitĂ˝ v autĂˇch na indikĂˇciu chodcov a cyklistov za znĂ­Ĺľenej viditeÄľnosti a v inteligentnĂ˝ch alarmoch.', 'Navrhnite a realizujte systĂ©m pre rozpoznanie  ÄŤloveka z obrazu infrakamery. SystĂ©m mĂˇ umoĹľniĹĄ v reĂˇlnom ÄŤase rozpoznaĹĄ, ÄŤi sa v prĂˇve snĂ­manom obraze infrakamery nachĂˇdza silueta ÄŤloveka a indikovaĹĄ takĂ˝to stav. SystĂ©m mĂ´Ĺľe byĹĄ vyuĹľitĂ˝ v autĂˇch na indikĂˇciu chodcov a cyklistov za znĂ­Ĺľenej viditeÄľnosti a v inteligentnĂ˝ch alarmoch.', 1);
INSERT INTO projects VALUES (285, 'DP', 270, NULL, 263, '2005/2006', 'VyhÄľadĂˇvanie a prezentĂˇcia informĂˇciĂ­ na webe', 'VyhÄľadĂˇvanie a prezentĂˇcia informĂˇciĂ­ na webe', NULL, NULL, 1);
INSERT INTO projects VALUES (286, 'ZP', 375, NULL, 263, '2003/2004', 'SystĂ©m pre sprĂˇvu Ăşloh pre e-vzdelĂˇvanie', 'The system for task administration for e-learning.', 'Analyzujte rĂ´zne vĂ˝uÄŤbovĂ© systĂ©my, ktorĂ© podporujĂş uÄŤenie sa elektronickou formou. Pri analĂ˝ze sa zamerajte najmĂ¤ na metodiku e-testovania poznatkov zĂ­skanĂ˝ch ĹˇtĂşdiom rĂ´znych uÄŤebnĂ˝ch materiĂˇlov. Navrhnite a implementujte modulĂˇrny programovĂ˝ systĂ©m, ktorĂ˝ poskytne dostatoÄŤne univerzĂˇlny rĂˇmec pre tvorbu rĂ´znych foriem testov (triviĂˇlne, kontextovo zĂˇvislĂ©, a pod.) ako aj spĂ´sob ich vyhodnocovania. FunkÄŤnosĹĄ systĂ©mu overte vytvorenĂ­m rĂ´znych typov testov a ich hodnotenĂ­.', 'Analyzujte rĂ´zne vĂ˝uÄŤbovĂ© systĂ©my, ktorĂ© podporujĂş uÄŤenie sa elektronickou formou. Pri analĂ˝ze sa zamerajte najmĂ¤ na metodiku e-testovania poznatkov zĂ­skanĂ˝ch ĹˇtĂşdiom rĂ´znych uÄŤebnĂ˝ch materiĂˇlov. Navrhnite a implementujte modulĂˇrny programovĂ˝ systĂ©m, ktorĂ˝ poskytne dostatoÄŤne univerzĂˇlny rĂˇmec pre tvorbu rĂ´znych foriem testov (triviĂˇlne, kontextovo zĂˇvislĂ©, a pod.) ako aj spĂ´sob ich vyhodnocovania. FunkÄŤnosĹĄ systĂ©mu overte vytvorenĂ­m rĂ´znych typov testov a ich hodnotenĂ­.', 1);
INSERT INTO projects VALUES (287, 'ZP', 358, NULL, 264, '2003/2004', 'CertifikaÄŤnĂˇ autorita', 'Certification Authority', 'Analyzujte ÄŤinnosĹĄ a funkcie certifikaÄŤnej autority na vydĂˇvanie certifikĂˇtov verejnĂ˝ch kÄľĂşÄŤov. Pri analĂ˝ze berte do Ăşvahy aj voÄľne ĹˇĂ­riteÄľnĂ© programovĂ© moduly. Navrhnite a implementujte certifikaÄŤnĂş autoritu. Pri nĂˇvrhu reĹˇpektujte odporĂşÄŤanĂ© Ĺˇtandardy', 'Analyzujte ÄŤinnosĹĄ a funkcie certifikaÄŤnej autority na vydĂˇvanie certifikĂˇtov verejnĂ˝ch kÄľĂşÄŤov. Pri analĂ˝ze berte do Ăşvahy aj voÄľne ĹˇĂ­riteÄľnĂ© programovĂ© moduly. Navrhnite a implementujte certifikaÄŤnĂş autoritu. Pri nĂˇvrhu reĹˇpektujte odporĂşÄŤanĂ© Ĺˇtandardy', 0);
INSERT INTO projects VALUES (288, 'DP', 361, NULL, 264, '2005/2006', 'NĂˇvrh bezpeÄŤnostnej architektĂşry poÄŤĂ­taÄŤovĂ˝ch systĂ©mov', 'NĂˇvrh bezpeÄŤnostnej architektĂşry poÄŤĂ­taÄŤovĂ˝ch systĂ©mov', NULL, NULL, 0);
INSERT INTO projects VALUES (289, 'ZP', 357, NULL, 265, '2005/2006', 'IPv6 - teĂłria a prax', 'IPv6 - teĂłria a prax', 'NaĹˇtudujte a analyzujte IPv6. Porovnanie s IPv4, koexistencia, kompatibilita, integrĂˇcia do sĂşÄŤasnĂ˝ch poÄŤ. sietĂ­ a problĂ©my s tĂ˝m spojenĂ©.
Na zĂˇklade analĂ˝zy navrhnite minimĂˇlnu reĂˇlnu topolĂłgiu, v ktorej by ste implementovali a otestovali IPv6. V prĂ­pade nereĂˇlnosti skutoÄŤnej topolĂłgie navrhnite a zrealizujte poÄŤĂ­taÄŤovĂş simulĂˇciu IPv6 komunikĂˇcie min 2 poÄŤĂ­taÄŤov.', 'NaĹˇtudujte a analyzujte IPv6. Porovnanie s IPv4, koexistencia, kompatibilita, integrĂˇcia do sĂşÄŤasnĂ˝ch poÄŤ. sietĂ­ a problĂ©my s tĂ˝m spojenĂ©.
Na zĂˇklade analĂ˝zy navrhnite minimĂˇlnu reĂˇlnu topolĂłgiu, v ktorej by ste implementovali a otestovali IPv6. V prĂ­pade nereĂˇlnosti skutoÄŤnej topolĂłgie navrhnite a zrealizujte poÄŤĂ­taÄŤovĂş simulĂˇciu IPv6 komunikĂˇcie min 2 poÄŤĂ­taÄŤov.', 0);
INSERT INTO projects VALUES (290, 'ZP', 10, NULL, 266, '2005/2006', 'SimulovanĂ˝ robotickĂ˝ futbal - vyĹˇĹˇie schopnosti hrĂˇÄŤov', 'SimulovanĂ˝ robotickĂ˝ futbal - vyĹˇĹˇie schopnosti hrĂˇÄŤov', 'SimulovanĂ˝ robotickĂ˝ futbal sa zaoberĂˇ vytvĂˇranĂ­m tĂ­mov spolupracujĂşcich agentov, ktorĂ© v simulovanom prostredĂ­ navzĂˇjom sĂşperia. JednotlivĂ­ hrĂˇÄŤi-agenti predstavujĂş samostatnĂ© programy, ktorĂ© prostrednĂ­ctvom siete komunikujĂş so simulaÄŤnĂ˝m serverom. Venujte sa vyĹˇĹˇĂ­m schopnostiam hrĂˇÄŤov. Navrhnite a implementujte niektorĂş z vyĹˇĹˇĂ­ch schopnostĂ­ hrĂˇÄŤa, prĂ­padne vylepĹˇite niektorĂ˝ z existujĂşcich prĂ­stupov.', 'SimulovanĂ˝ robotickĂ˝ futbal sa zaoberĂˇ vytvĂˇranĂ­m tĂ­mov spolupracujĂşcich agentov, ktorĂ© v simulovanom prostredĂ­ navzĂˇjom sĂşperia. JednotlivĂ­ hrĂˇÄŤi-agenti predstavujĂş samostatnĂ© programy, ktorĂ© prostrednĂ­ctvom siete komunikujĂş so simulaÄŤnĂ˝m serverom. Venujte sa vyĹˇĹˇĂ­m schopnostiam hrĂˇÄŤov. Navrhnite a implementujte niektorĂş z vyĹˇĹˇĂ­ch schopnostĂ­ hrĂˇÄŤa, prĂ­padne vylepĹˇite niektorĂ˝ z existujĂşcich prĂ­stupov.', 1);
INSERT INTO projects VALUES (291, 'ZP', 357, NULL, 267, '2005/2006', 'PrehÄľadovĂˇ ĹˇtĂşdia autentifikĂˇcie klientov prostrednĂ­ctvom Internetu', 'PrehÄľadovĂˇ ĹˇtĂşdia autentifikĂˇcie klientov prostrednĂ­ctvom Internetu', 'Analyzujte sĂşÄŤasnĂ© prĂ­stupy autentifikĂˇcie a bezpeÄŤnej autentifikĂˇcie na dostupnĂ˝ch OS a pri pouĹľitĂ­ beĹľnĂ˝ch implementaÄŤnĂ˝ch nĂˇstrojov. Navrhnite a realizujte implementĂˇciu, v ktorej demonĹˇtrujete viacero rieĹˇenĂ­ zĂ­skanĂ˝ch v analĂ˝ze. RieĹˇenia vzĂˇjomne porovnajte a otestujte na funkÄŤnosĹĄ, stabilitu a bezpeÄŤnosĹĄ systĂ©mu proti zlyhaniu a prienikom.', 'Analyzujte sĂşÄŤasnĂ© prĂ­stupy autentifikĂˇcie a bezpeÄŤnej autentifikĂˇcie na dostupnĂ˝ch OS a pri pouĹľitĂ­ beĹľnĂ˝ch implementaÄŤnĂ˝ch nĂˇstrojov. Navrhnite a realizujte implementĂˇciu, v ktorej demonĹˇtrujete viacero rieĹˇenĂ­ zĂ­skanĂ˝ch v analĂ˝ze. RieĹˇenia vzĂˇjomne porovnajte a otestujte na funkÄŤnosĹĄ, stabilitu a bezpeÄŤnosĹĄ systĂ©mu proti zlyhaniu a prienikom.', 0);
INSERT INTO projects VALUES (292, 'ZP', 359, NULL, 268, '2005/2006', 'SkladovĂ˝ informaÄŤnĂ˝ system', 'SkladovĂ˝ informaÄŤnĂ˝ system', 'Analyzujte, navrhnite a implementujte informaÄŤnĂ˝ systĂ©m, ktorĂ˝ bude riadiĹĄ skladovĂ© hospodĂˇrstvo na zĂˇklade predanĂ©ho tovaru jednotlivĂ˝m zĂˇkaznĂ­kom. SystĂ©m mĂˇ umoĹľĹovaĹĄ prĂ­stup k skladovĂ©mu hospodĂˇrstvu z viacerĂ˝ch pracovnĂ˝ch stanĂ­c, vytvĂˇraĹĄ zostavy pre nĂˇkup tovarov na zĂˇklade ich zostatkov v sklade, vytvĂˇraĹĄ zostavy vydanĂ©ho tovaru jednotlivĂ˝m zĂˇkaznĂ­kom, generovaĹĄ Ĺˇtatistiky predajnosti podÄľa jednotlivĂ˝ch druhov tovaru. Treba navrhnĂşĹĄ sieĹĄovĂş komunikĂˇciu a synchronizĂˇciu Ăşdajov medzi jednotlivĂ˝mi stanicami. 

', 'Analyzujte, navrhnite a implementujte informaÄŤnĂ˝ systĂ©m, ktorĂ˝ bude riadiĹĄ skladovĂ© hospodĂˇrstvo na zĂˇklade predanĂ©ho tovaru jednotlivĂ˝m zĂˇkaznĂ­kom. SystĂ©m mĂˇ umoĹľĹovaĹĄ prĂ­stup k skladovĂ©mu hospodĂˇrstvu z viacerĂ˝ch pracovnĂ˝ch stanĂ­c, vytvĂˇraĹĄ zostavy pre nĂˇkup tovarov na zĂˇklade ich zostatkov v sklade, vytvĂˇraĹĄ zostavy vydanĂ©ho tovaru jednotlivĂ˝m zĂˇkaznĂ­kom, generovaĹĄ Ĺˇtatistiky predajnosti podÄľa jednotlivĂ˝ch druhov tovaru. Treba navrhnĂşĹĄ sieĹĄovĂş komunikĂˇciu a synchronizĂˇciu Ăşdajov medzi jednotlivĂ˝mi stanicami. 

', 0);
INSERT INTO projects VALUES (293, 'ZP', 98, NULL, 269, '2003/2004', 'Perl a objektovo orientovanĂ© programovanie', 'Perl and object oriented programming', 'Perl je voÄľne ĹˇĂ­ritelnĂ˝ skriptovacĂ­ jazyk so syntaxou podobnou jazyku C. Jazyk mĂˇ dispozĂ­cii vĂ˝konnĂ© a pruĹľnĂ© programovacie prostredie. UmoĹľĹuje objektovo orientovanĂ© programovanie, spracovanie textu. Analyzujte  jazyk a prostredie pre vĂ˝voj objektovo orientovanĂ˝ch aplikĂˇciĂ­. Porovnajte jeho objektovo orientovanĂ© ÄŤrty s moĹľnosĹĄami C++ . Na zĂˇklade analĂ˝zy navrhnite a vytvorte aplikĂˇciu,ktorĂˇ ukĂˇĹľe objektovo orientovanĂ© ÄŤrty jazyka ', 'Perl je voÄľne ĹˇĂ­ritelnĂ˝ skriptovacĂ­ jazyk so syntaxou podobnou jazyku C. Jazyk mĂˇ dispozĂ­cii vĂ˝konnĂ© a pruĹľnĂ© programovacie prostredie. UmoĹľĹuje objektovo orientovanĂ© programovanie, spracovanie textu. Analyzujte  jazyk a prostredie pre vĂ˝voj objektovo orientovanĂ˝ch aplikĂˇciĂ­. Porovnajte jeho objektovo orientovanĂ© ÄŤrty s moĹľnosĹĄami C++ . Na zĂˇklade analĂ˝zy navrhnite a vytvorte aplikĂˇciu,ktorĂˇ ukĂˇĹľe objektovo orientovanĂ© ÄŤrty jazyka ', 1);
INSERT INTO projects VALUES (294, 'DP', 297, NULL, 269, '2005/2006', 'SpĂ´soby optimalizovania programu v jazykoch rĂ´znej Ăşrovne', 'SpĂ´soby optimalizovania programu v jazykoch rĂ´znej Ăşrovne', NULL, NULL, 1);
INSERT INTO projects VALUES (295, 'ZP', 655, NULL, 273, '2005/2006', 'ZisĹĄovanie charakteristĂ­k pripojenia v rĂˇmci SR na zĂˇklade IP adresy', 'ZisĹĄovanie charakteristĂ­k pripojenia v rĂˇmci SR na zĂˇklade IP adresy', 'Analyzujte moĹľnosti vytvorenia aplikĂˇcie, ktorĂˇ by umoĹľnila na zĂˇklade IP adresy pouĹľĂ­vateÄľa identifikovaĹĄ charakteristickĂ© informĂˇcie o jeho pripojenĂ­. Medzi tie patrĂ­ naprĂ­klad regiĂłn (mesto), poskytovateÄľ pripojenia, typ pripojenia (pevnĂˇ linka, modem, bezdrĂˇtovĂ© pripojenie, wifi,...) a pod. Na vytvorenie databĂˇzy mĂ´Ĺľete pouĹľiĹĄ naprĂ­klad databĂˇzu RIPE, informĂˇciu o reverznom DNS zĂˇzname pre danĂş IP adresu, alebo ÄŹalĹˇie verejne dostupnĂ© informĂˇcie.', 'Analyzujte moĹľnosti vytvorenia aplikĂˇcie, ktorĂˇ by umoĹľnila na zĂˇklade IP adresy pouĹľĂ­vateÄľa identifikovaĹĄ charakteristickĂ© informĂˇcie o jeho pripojenĂ­. Medzi tie patrĂ­ naprĂ­klad regiĂłn (mesto), poskytovateÄľ pripojenia, typ pripojenia (pevnĂˇ linka, modem, bezdrĂˇtovĂ© pripojenie, wifi,...) a pod. Na vytvorenie databĂˇzy mĂ´Ĺľete pouĹľiĹĄ naprĂ­klad databĂˇzu RIPE, informĂˇciu o reverznom DNS zĂˇzname pre danĂş IP adresu, alebo ÄŹalĹˇie verejne dostupnĂ© informĂˇcie.', 1);
INSERT INTO projects VALUES (296, 'ZP', 579, NULL, 274, '2005/2006', 'SystĂ©m pre sprĂˇvu webovĂ˝ch strĂˇnok - administrĂˇtor', 'SystĂ©m pre sprĂˇvu webovĂ˝ch strĂˇnok - administrĂˇtor', 'CieÄľom projektu je vytvorenie prostredia, ktorĂ© umoĹľnĂ­ spravovanie webovĂ˝ch strĂˇnok. Analyzujte existujĂşce systĂ©my podobnĂ©ho charakteru z pohÄľadu administĂˇtora a vlastnostĂ­ prostredia, v ktorom bude vytvĂˇranĂ˝ systĂ©m.  Navrhnite ĹˇtruktĂşru pouĹľitej databĂˇzy, ĹˇtruktĂşru obrazoviek pre administrĂˇtora, grafickĂ© prvky a ĹˇtĂ˝ly. NĂˇsledne implementujte kÄľĂşÄŤovĂ© ÄŤasti systĂ©mu a pouĹľiteÄľnosĹĄ overte na vybranej mnoĹľine strĂˇnok pouĹľĂ­vanĂ˝ch v pedagogike FIIT', 'CieÄľom projektu je vytvorenie prostredia, ktorĂ© umoĹľnĂ­ spravovanie webovĂ˝ch strĂˇnok. Analyzujte existujĂşce systĂ©my podobnĂ©ho charakteru z pohÄľadu administĂˇtora a vlastnostĂ­ prostredia, v ktorom bude vytvĂˇranĂ˝ systĂ©m.  Navrhnite ĹˇtruktĂşru pouĹľitej databĂˇzy, ĹˇtruktĂşru obrazoviek pre administrĂˇtora, grafickĂ© prvky a ĹˇtĂ˝ly. NĂˇsledne implementujte kÄľĂşÄŤovĂ© ÄŤasti systĂ©mu a pouĹľiteÄľnosĹĄ overte na vybranej mnoĹľine strĂˇnok pouĹľĂ­vanĂ˝ch v pedagogike FIIT', 1);
INSERT INTO projects VALUES (297, 'ZP', 357, NULL, 275, '2005/2006', 'STP -Spanning Tree Protocol 802.1D - vizualizĂˇcia na poÄŤĂ­taÄŤi', 'STP -Spanning Tree Protocol 802.1D - vizualizĂˇcia na poÄŤĂ­taÄŤi', 'NaĹˇtudujte a analyzujte princĂ­p fungovania STP -Spanning Tree Protocol 802.1D.  Navrhnite spĂ´sob grafickej vizualizĂˇcie vĂ˝slednĂ©ho STP stromu na poÄŤĂ­taÄŤi, v ktorej si navrhnete ÄľubovolnĂş topolĂłgiu ethernet. siete. Zrealizujte funkÄŤnĂ˝ model - pomĂ´cka pre pedagogiku.', 'NaĹˇtudujte a analyzujte princĂ­p fungovania STP -Spanning Tree Protocol 802.1D.  Navrhnite spĂ´sob grafickej vizualizĂˇcie vĂ˝slednĂ©ho STP stromu na poÄŤĂ­taÄŤi, v ktorej si navrhnete ÄľubovolnĂş topolĂłgiu ethernet. siete. Zrealizujte funkÄŤnĂ˝ model - pomĂ´cka pre pedagogiku.', 0);
INSERT INTO projects VALUES (298, 'ZP', 374, NULL, 276, '2006/2007', 'Rozhodovanie sa hrĂˇÄŤov pri vedenĂ­ lopty', 'Rozhodovanie sa hrĂˇÄŤov pri vedenĂ­ lopty', 'NaĹˇtudujte problematiku hry hrĂˇÄŤov simulovanĂ©ho robotickĂ©ho futbalu RoboCup. OboznĂˇmte sa s najnovĹˇĂ­mi hrĂˇÄŤmi, ktorĂ­ boli vytvorenĂ­ Ĺˇtudentmi FIIT STU. Podrobne analyzujte sĂşÄŤasnĂş stratĂ©giu a moĹľnosti rozhodovania sa hrĂˇÄŤov pri vedenĂ­ lopty. Navrhnite takĂ© zmeny v hrĂˇÄŤovej stratĂ©gii, aby adekvĂˇtnejĹˇie reagoval na aktuĂˇlnu situĂˇciu a zlepĹˇil sa hlavne jeho presun s loptou. NavrhnutĂ© rieĹˇenie overte implementĂˇciou rozĹˇĂ­renia existujĂşceho hrĂˇÄŤa.', 'NaĹˇtudujte problematiku hry hrĂˇÄŤov simulovanĂ©ho robotickĂ©ho futbalu RoboCup. OboznĂˇmte sa s najnovĹˇĂ­mi hrĂˇÄŤmi, ktorĂ­ boli vytvorenĂ­ Ĺˇtudentmi FIIT STU. Podrobne analyzujte sĂşÄŤasnĂş stratĂ©giu a moĹľnosti rozhodovania sa hrĂˇÄŤov pri vedenĂ­ lopty. Navrhnite takĂ© zmeny v hrĂˇÄŤovej stratĂ©gii, aby adekvĂˇtnejĹˇie reagoval na aktuĂˇlnu situĂˇciu a zlepĹˇil sa hlavne jeho presun s loptou. NavrhnutĂ© rieĹˇenie overte implementĂˇciou rozĹˇĂ­renia existujĂşceho hrĂˇÄŤa.', 1);
INSERT INTO projects VALUES (299, 'ZP', 24, NULL, 278, '2005/2006', 'Modelovanie a rieĹˇenie alokaÄŤnĂ˝ch problĂ©mov', 'Modelovanie a rieĹˇenie alokaÄŤnĂ˝ch problĂ©mov', 'Analyzujte vybranĂ© metĂłdy, ktorĂ© sa pouĹľĂ­vajĂş v teĂłrii grafov 
na modelovanie a rieĹˇenie alokaÄŤnĂ˝ch problĂ©mov. Analyzujte pouĹľitĂ© heuristiky, ktorĂ˝mi hÄľadĂˇme rieĹˇenie blĂ­zke optimĂˇlnemu rieĹˇeniu. 
Navrhnite model, v ktorom rozmiestnite strediskĂˇ (napr. zĂˇchrannĂ© stredisko, havarijnĂ© stredisko, sklady) podÄľa urÄŤitej poĹľadovanej dostupnosti.
ProblĂ©m umiestnenia minimĂˇlneho poÄŤtu tĂ˝chto stredĂ­sk s urÄŤitou dostupnosĹĄou rieĹˇte ako problĂ©m hÄľadania pokrĂ˝vajĂşcej mnoĹľiny 
v grafe s najmenĹˇou mohutnosĹĄou.
NavrhnutĂ˝ model vizualizujte vytvorenĂ­m softvĂ©rovĂ©ho prototypu.', 'Analyzujte vybranĂ© metĂłdy, ktorĂ© sa pouĹľĂ­vajĂş v teĂłrii grafov 
na modelovanie a rieĹˇenie alokaÄŤnĂ˝ch problĂ©mov. Analyzujte pouĹľitĂ© heuristiky, ktorĂ˝mi hÄľadĂˇme rieĹˇenie blĂ­zke optimĂˇlnemu rieĹˇeniu. 
Navrhnite model, v ktorom rozmiestnite strediskĂˇ (napr. zĂˇchrannĂ© stredisko, havarijnĂ© stredisko, sklady) podÄľa urÄŤitej poĹľadovanej dostupnosti.
ProblĂ©m umiestnenia minimĂˇlneho poÄŤtu tĂ˝chto stredĂ­sk s urÄŤitou dostupnosĹĄou rieĹˇte ako problĂ©m hÄľadania pokrĂ˝vajĂşcej mnoĹľiny 
v grafe s najmenĹˇou mohutnosĹĄou.
NavrhnutĂ˝ model vizualizujte vytvorenĂ­m softvĂ©rovĂ©ho prototypu.', 1);
INSERT INTO projects VALUES (300, 'ZP', 297, NULL, 279, '2005/2006', 'SimulĂˇtor toku strojovĂ˝ch inĹˇtrukciĂ­ v sieti Internet', 'SimulĂˇtor toku strojovĂ˝ch inĹˇtrukciĂ­ v sieti Internet', 'Analyzujte moĹľnosti a prostriedky na simulĂˇciu definovanej inĹˇtrukÄŤnej sady strojovĂ˝ch inĹˇtrukciĂ­. Vytvorte simulaÄŤnĂ© prostredie, v ktorom nĂˇzorne zobrazte procesy a stavy poÄŤas vykonĂˇvania inĹˇtrukcie danĂ©ho programu pre zvolenĂ˝ typ procesora. SimulĂˇtor  pripravte na prezentĂˇciu vo forme web aplikĂˇcie.
', 'Analyzujte moĹľnosti a prostriedky na simulĂˇciu definovanej inĹˇtrukÄŤnej sady strojovĂ˝ch inĹˇtrukciĂ­. Vytvorte simulaÄŤnĂ© prostredie, v ktorom nĂˇzorne zobrazte procesy a stavy poÄŤas vykonĂˇvania inĹˇtrukcie danĂ©ho programu pre zvolenĂ˝ typ procesora. SimulĂˇtor  pripravte na prezentĂˇciu vo forme web aplikĂˇcie.
', 1);
INSERT INTO projects VALUES (301, 'ZP', 361, NULL, 280, '2005/2006', 'BezpeÄŤnostnĂˇ architektĂşra poÄŤĂ­taÄŤovĂ˝ch systĂ©mov', 'BezpeÄŤnostnĂˇ architektĂşra poÄŤĂ­taÄŤovĂ˝ch systĂ©mov', 'Analyzujte sĂşÄŤasnĂ© stavy a efektĂ­vnosĹĄ metĂłd, ktorĂ© sa zaoberajĂş vyhodnotenĂ­m zabezpeÄŤenia, pravidlami a Ĺˇtandardmi certifikĂˇcie a akreditĂˇcie. KritĂ©riĂˇ vyhodnoĹĄte z hÄľadiska bezpeÄŤnostnej politiky poÄŤĂ­taÄŤovĂ˝ch systĂ©mov.
', 'Analyzujte sĂşÄŤasnĂ© stavy a efektĂ­vnosĹĄ metĂłd, ktorĂ© sa zaoberajĂş vyhodnotenĂ­m zabezpeÄŤenia, pravidlami a Ĺˇtandardmi certifikĂˇcie a akreditĂˇcie. KritĂ©riĂˇ vyhodnoĹĄte z hÄľadiska bezpeÄŤnostnej politiky poÄŤĂ­taÄŤovĂ˝ch systĂ©mov.
', 0);
INSERT INTO projects VALUES (302, 'ZP', 188, NULL, 281, '2005/2006', 'MaÄľovanĂ© krĂ­Ĺľovky', 'MaÄľovanĂ© krĂ­Ĺľovky', 'Navrhnite algoritmy na rieĹˇenie rĂ´znych druhov maÄľovanĂ˝ch krĂ­Ĺľoviek (klasickĂ© ÄŤiernobiele, viacfarebnĂ©;  trojuholnĂ­kovĂ©, viacfarebnĂ© trojuholnĂ­kovĂ©) a porovnajte ich vĂ˝konnosĹĄ. ÄŽalej vytvorte program na automatickĂ© spracovanie krĂ­Ĺľovky z naskenovanĂ©ho obrĂˇzka aspoĹ pre klasickĂ© ÄŤiernobiele.', 'Navrhnite algoritmy na rieĹˇenie rĂ´znych druhov maÄľovanĂ˝ch krĂ­Ĺľoviek (klasickĂ© ÄŤiernobiele, viacfarebnĂ©;  trojuholnĂ­kovĂ©, viacfarebnĂ© trojuholnĂ­kovĂ©) a porovnajte ich vĂ˝konnosĹĄ. ÄŽalej vytvorte program na automatickĂ© spracovanie krĂ­Ĺľovky z naskenovanĂ©ho obrĂˇzka aspoĹ pre klasickĂ© ÄŤiernobiele.', 1);
INSERT INTO projects VALUES (303, 'ZP', 690, NULL, 282, '2005/2006', 'VykresÄľovanie veÄľkĂ˝ch grafov', 'VykresÄľovanie veÄľkĂ˝ch grafov', 'Pre niektorĂ© aplikĂˇcie je dĂ´leĹľitĂ© rozumnĂ© vykreslenie veÄľkĂ˝ch grafov s rĂˇdovo niekoÄľko tisĂ­cmi uzlami. Existuje niekoÄľko prĂ­stupov na zobrazenie takĂ˝chto grafov, napr. prĂ­stup na vykreslenia pomocou gravitaÄŤnĂ©ho modelu: zaÄŤiatoÄŤnĂ© nĂˇhodnĂ© rozloĹľenie grafu sa postupne dostane do ustĂˇlenĂ©ho rozloĹľenia na zĂˇklade prĂ­ĹĄaĹľlivosti, resp. odporu medzi uzlami. Vo vykresÄľovanĂ­ grafov by sa mala zohÄľadniĹĄ ĹˇtruktĂşra komunĂ­t, prĂ­stupy na zjednotenie viacerĂ˝ch uzlov do jednĂ©ho telesa, zjednoduĹˇenie zobrazenia ĹˇtruktĂşry v grafe sĂş vĂ­tanĂ©. Ako odrazovĂ˝ most k vĂ˝beru layoutovacieho algoritmu rieĹˇiteÄľa odporuÄŤĂ­m na projekt pajek (http://vlado.fmf.uni-lj.si/pub/networks/pajek/), kde sĂş implementovanĂ© rĂ´zne vykreslovacie algoritmy.', 'Pre niektorĂ© aplikĂˇcie je dĂ´leĹľitĂ© rozumnĂ© vykreslenie veÄľkĂ˝ch grafov s rĂˇdovo niekoÄľko tisĂ­cmi uzlami. Existuje niekoÄľko prĂ­stupov na zobrazenie takĂ˝chto grafov, napr. prĂ­stup na vykreslenia pomocou gravitaÄŤnĂ©ho modelu: zaÄŤiatoÄŤnĂ© nĂˇhodnĂ© rozloĹľenie grafu sa postupne dostane do ustĂˇlenĂ©ho rozloĹľenia na zĂˇklade prĂ­ĹĄaĹľlivosti, resp. odporu medzi uzlami. Vo vykresÄľovanĂ­ grafov by sa mala zohÄľadniĹĄ ĹˇtruktĂşra komunĂ­t, prĂ­stupy na zjednotenie viacerĂ˝ch uzlov do jednĂ©ho telesa, zjednoduĹˇenie zobrazenia ĹˇtruktĂşry v grafe sĂş vĂ­tanĂ©. Ako odrazovĂ˝ most k vĂ˝beru layoutovacieho algoritmu rieĹˇiteÄľa odporuÄŤĂ­m na projekt pajek (http://vlado.fmf.uni-lj.si/pub/networks/pajek/), kde sĂş implementovanĂ© rĂ´zne vykreslovacie algoritmy.', 1);
INSERT INTO projects VALUES (304, 'ZP', 357, NULL, 284, '2005/2006', 'STP -Spanning Tree Protocol 802.1D - vizualizĂˇcia na poÄŤĂ­taÄŤi', 'STP -Spanning Tree Protocol 802.1D - vizualizĂˇcia na poÄŤĂ­taÄŤi', 'NaĹˇtudujte a analyzujte princĂ­p fungovania STP - Spanning Tree Protocol 802.1D .
Navrhnite spĂ´sob grafickej vizualizĂˇcie vĂ˝slednĂ©ho STP stromu na poÄŤĂ­taÄŤi, v ktorej si navrhnete ÄľubovolnĂş topolĂłgiu ethernet. siete.
Zrealizujte funkÄŤnĂ˝ model - pomĂ´cka pre pedagogiku.', 'NaĹˇtudujte a analyzujte princĂ­p fungovania STP - Spanning Tree Protocol 802.1D .
Navrhnite spĂ´sob grafickej vizualizĂˇcie vĂ˝slednĂ©ho STP stromu na poÄŤĂ­taÄŤi, v ktorej si navrhnete ÄľubovolnĂş topolĂłgiu ethernet. siete.
Zrealizujte funkÄŤnĂ˝ model - pomĂ´cka pre pedagogiku.', 0);
INSERT INTO projects VALUES (305, 'ZP', 375, NULL, 285, '2005/2006', 'DemonĹˇtraÄŤnĂ© prĂ­klady sieĹĄovej komunikĂˇcie', 'DemonĹˇtraÄŤnĂ© prĂ­klady sieĹĄovej komunikĂˇcie', 'Analyzujte systĂ©my na podporu vĂ˝uÄŤby poÄŤĂ­taÄŤovĂ˝ch sietĂ­. Navrhnite a implementujte vybranĂ© praktickĂ© Ăşlohy - ukĂˇĹľky sieĹĄovej komunikĂˇcie v TCP/IP sieĹĄach. Pre jednotlivĂ© demonĹˇtraÄŤnĂ© Ăşlohy spracujte pouĹľĂ­vateÄľskĂ©
prĂ­ruÄŤky.  ', 'Analyzujte systĂ©my na podporu vĂ˝uÄŤby poÄŤĂ­taÄŤovĂ˝ch sietĂ­. Navrhnite a implementujte vybranĂ© praktickĂ© Ăşlohy - ukĂˇĹľky sieĹĄovej komunikĂˇcie v TCP/IP sieĹĄach. Pre jednotlivĂ© demonĹˇtraÄŤnĂ© Ăşlohy spracujte pouĹľĂ­vateÄľskĂ©
prĂ­ruÄŤky.  ', 0);
INSERT INTO projects VALUES (306, 'ZP', 19, NULL, 286, '2005/2006', 'PravidlĂˇ pre prispĂ´sobovanie modelu pouĹľĂ­vateÄľa', 'PravidlĂˇ pre prispĂ´sobovanie modelu pouĹľĂ­vateÄľa', 'SĂşÄŤasnĂ˝ web obsahuje veÄľkĂ© mnoĹľstvo informĂˇciĂ­. PouĹľĂ­vateÄľovi je ÄŤasto 
poskytnutĂ˝ch veÄľa nerelevantnĂ˝ch informĂˇciĂ­, ÄŤo ho mĂ´Ĺľe odradiĹĄ pri 
skĂşmanĂ­ problĂ©movej oblasti. To si vyĹľaduje personalizovanĂ˝ prĂ­stup k 
pouĹľĂ­vateÄľovi. Analyzujte model pouĹľĂ­vateÄľa a spĂ´soby jeho aktualizĂˇcie 
v existujĂşcich adaptĂ­vnych hypermediĂˇlnych systĂ©moch. Na zĂˇklade tejto 
analĂ˝zy navrhnite model pouĹľĂ­vateÄľa a sĂşbor pravidiel pre jeho 
prispĂ´sobovanie v domĂ©ne pracovnĂ˝ch prĂ­leĹľitostĂ­. NavrhovanĂ© rieĹˇenie 
experimentĂˇlne overte.
', 'SĂşÄŤasnĂ˝ web obsahuje veÄľkĂ© mnoĹľstvo informĂˇciĂ­. PouĹľĂ­vateÄľovi je ÄŤasto 
poskytnutĂ˝ch veÄľa nerelevantnĂ˝ch informĂˇciĂ­, ÄŤo ho mĂ´Ĺľe odradiĹĄ pri 
skĂşmanĂ­ problĂ©movej oblasti. To si vyĹľaduje personalizovanĂ˝ prĂ­stup k 
pouĹľĂ­vateÄľovi. Analyzujte model pouĹľĂ­vateÄľa a spĂ´soby jeho aktualizĂˇcie 
v existujĂşcich adaptĂ­vnych hypermediĂˇlnych systĂ©moch. Na zĂˇklade tejto 
analĂ˝zy navrhnite model pouĹľĂ­vateÄľa a sĂşbor pravidiel pre jeho 
prispĂ´sobovanie v domĂ©ne pracovnĂ˝ch prĂ­leĹľitostĂ­. NavrhovanĂ© rieĹˇenie 
experimentĂˇlne overte.
', 1);
INSERT INTO projects VALUES (307, 'ZP', 388, NULL, 287, '2005/2006', 'InformaÄŤnĂ˝ portĂˇl predmetu', 'InformaÄŤnĂ˝ portĂˇl predmetu', 'Analyzujte typickĂ© prvky informaÄŤnĂ©ho portĂˇlu univerzitnĂ©ho predmetu a vhodnĂ© prostriedky na ich vytvorenie a ĂşdrĹľbu v prostredĂ­ webu. Navrhnite softvĂ©rovĂ˝ systĂ©m - webovskĂş aplikĂˇciu, ktorĂˇ podporĂ­ jednoduchĂş tvorbu informaÄŤnĂ˝ch portĂˇlov pre predmety informatickĂ©ho zamerania na naĹˇej fakulte. NĂˇvrh rieĹˇenia overte implementĂˇciou prototypu podpornĂ©ho softvĂ©rovĂ©ho systĂ©mu.', 'Analyzujte typickĂ© prvky informaÄŤnĂ©ho portĂˇlu univerzitnĂ©ho predmetu a vhodnĂ© prostriedky na ich vytvorenie a ĂşdrĹľbu v prostredĂ­ webu. Navrhnite softvĂ©rovĂ˝ systĂ©m - webovskĂş aplikĂˇciu, ktorĂˇ podporĂ­ jednoduchĂş tvorbu informaÄŤnĂ˝ch portĂˇlov pre predmety informatickĂ©ho zamerania na naĹˇej fakulte. NĂˇvrh rieĹˇenia overte implementĂˇciou prototypu podpornĂ©ho softvĂ©rovĂ©ho systĂ©mu.', 1);
INSERT INTO projects VALUES (308, 'ZP', 563, NULL, 288, '2005/2006', 'UniverzĂˇlny generĂˇtor preruĹˇenĂ­', 'UniverzĂˇlny generĂˇtor preruĹˇenĂ­', 'Navrhnite a zrealizujte univerzĂˇlny generĂˇtor 8 ĹľiadostĂ­ o preruĹˇenie. GenerĂˇtor musĂ­ umoĹľĹovaĹĄ individuĂˇlne nastavenie parametrov (okamih spustenia, periĂłda, doba trvania) pre kaĹľdĂş ĹľiadosĹĄ a vzĂˇjomnĂş synchronizĂˇciu ĹľiadostĂ­.

', 'Navrhnite a zrealizujte univerzĂˇlny generĂˇtor 8 ĹľiadostĂ­ o preruĹˇenie. GenerĂˇtor musĂ­ umoĹľĹovaĹĄ individuĂˇlne nastavenie parametrov (okamih spustenia, periĂłda, doba trvania) pre kaĹľdĂş ĹľiadosĹĄ a vzĂˇjomnĂş synchronizĂˇciu ĹľiadostĂ­.

', 0);
INSERT INTO projects VALUES (309, 'ZP', 98, NULL, 289, '2005/2006', 'NĂˇstroj pre vytvĂˇranie kurzov', 'NĂˇstroj pre vytvĂˇranie kurzov', 'Pri vytvĂˇranĂ­ prednĂˇĹˇok, seminĂˇrov, kurzov, workshopov atÄŹ., mĂˇ autor, resp. prednĂˇĹˇateÄľ k dispozĂ­cii informĂˇcie rĂ´znĂ˝ch typov a formĂˇtov. CieÄľom je vytvoriĹĄ prostriedok, ktorĂ˝ by podporil proces vytvĂˇrania  takĂ˝chto uÄŤebnĂ˝ch celkov. Autor by vyberal buÄŹ z databĂˇzy informĂˇciĂ­ (otĂˇzky, uÄŤebnĂ© texty, obrĂˇzky, diagramy), alebo  by mal moĹľnosĹĄ vytvĂˇraĹĄ novĂ© zĂˇkladnĂ© uÄŤebnĂ© celky.  
Spravte analĂ˝zu problematiky a na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu, ktorĂˇ bude slĂşĹľiĹĄ ako nĂˇstroj pre vytvĂˇranie kurzov.', 'Pri vytvĂˇranĂ­ prednĂˇĹˇok, seminĂˇrov, kurzov, workshopov atÄŹ., mĂˇ autor, resp. prednĂˇĹˇateÄľ k dispozĂ­cii informĂˇcie rĂ´znĂ˝ch typov a formĂˇtov. CieÄľom je vytvoriĹĄ prostriedok, ktorĂ˝ by podporil proces vytvĂˇrania  takĂ˝chto uÄŤebnĂ˝ch celkov. Autor by vyberal buÄŹ z databĂˇzy informĂˇciĂ­ (otĂˇzky, uÄŤebnĂ© texty, obrĂˇzky, diagramy), alebo  by mal moĹľnosĹĄ vytvĂˇraĹĄ novĂ© zĂˇkladnĂ© uÄŤebnĂ© celky.  
Spravte analĂ˝zu problematiky a na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu, ktorĂˇ bude slĂşĹľiĹĄ ako nĂˇstroj pre vytvĂˇranie kurzov.', 1);
INSERT INTO projects VALUES (310, 'ZP', 188, NULL, 290, '2005/2006', 'Monitor pre RoboCup urÄŤenĂ˝ na prezentĂˇciu', 'Monitor pre RoboCup urÄŤenĂ˝ na prezentĂˇciu', 'Vytvorte multiplatformovĂ˝ monitor pre RoboCup, ktorĂ©ho cieÄľom bude prezentovaĹĄ zĂˇpasy pĂştavou formou pre divĂˇkov. Mal by podporovaĹĄ zobrazenie opakovanĂ˝ch zĂˇznamov zaujĂ­mavĂ˝ch situĂˇciĂ­, ozvuÄŤenie zĂˇpasu zvukmi pĂ­ĹˇĹĄaÄľky, prĂ­p. obecenstva, zobrazovaĹĄ logĂˇ hrajĂşcich tĂ­mov a pod.', 'Vytvorte multiplatformovĂ˝ monitor pre RoboCup, ktorĂ©ho cieÄľom bude prezentovaĹĄ zĂˇpasy pĂştavou formou pre divĂˇkov. Mal by podporovaĹĄ zobrazenie opakovanĂ˝ch zĂˇznamov zaujĂ­mavĂ˝ch situĂˇciĂ­, ozvuÄŤenie zĂˇpasu zvukmi pĂ­ĹˇĹĄaÄľky, prĂ­p. obecenstva, zobrazovaĹĄ logĂˇ hrajĂşcich tĂ­mov a pod.', 1);
INSERT INTO projects VALUES (311, 'ZP', 12, NULL, 291, '2005/2006', 'Ĺ tudentskĂ˝ portĂˇl', 'Ĺ tudentskĂ˝ portĂˇl', 'Analyzujte potreby Ĺˇtudentov na prĂ­stup a zdieÄľanie informĂˇciĂ­. ÄŽalej preskĂşmajte existujĂşce rĂˇmce (framework) umoĹľĹujĂşce tvorbu portĂˇlov â€“ aplikĂˇciĂ­ umoĹľĹujĂşcich integrĂˇciu informĂˇciĂ­ z viacerĂ˝ch rĂ´znorodĂ˝ch zdrojov (novinky, oznamy, termĂ­ny). Zamerajte sa na moĹľnosti personalizĂˇcie, jednotnĂ© pouĹľĂ­vateÄľskĂ© rozhranie a vyhÄľadĂˇvanie. S pouĹľitĂ­m vybranĂ©ho rĂˇmca navrhnite a implementujte ĹˇtudentskĂ˝ portĂˇl na webe, ktorĂ˝ umoĹľnĂ­ Ĺˇtudentom personalizovanĂ˝ a bezpeÄŤnĂ˝ prĂ­stup k informĂˇciĂˇm.
[1] Venkatacharya, P., Techniques for Creating User-Friendly Enterprise Portals, Oracle Corporation, October 2000
[2] Townsend, J., Riz, D., Schaffer, D., Building Portals, Intranets, and Corporate Web Sites Using Microsoft Servers, Addison-Wesley, 2004
', 'Analyzujte potreby Ĺˇtudentov na prĂ­stup a zdieÄľanie informĂˇciĂ­. ÄŽalej preskĂşmajte existujĂşce rĂˇmce (framework) umoĹľĹujĂşce tvorbu portĂˇlov â€“ aplikĂˇciĂ­ umoĹľĹujĂşcich integrĂˇciu informĂˇciĂ­ z viacerĂ˝ch rĂ´znorodĂ˝ch zdrojov (novinky, oznamy, termĂ­ny). Zamerajte sa na moĹľnosti personalizĂˇcie, jednotnĂ© pouĹľĂ­vateÄľskĂ© rozhranie a vyhÄľadĂˇvanie. S pouĹľitĂ­m vybranĂ©ho rĂˇmca navrhnite a implementujte ĹˇtudentskĂ˝ portĂˇl na webe, ktorĂ˝ umoĹľnĂ­ Ĺˇtudentom personalizovanĂ˝ a bezpeÄŤnĂ˝ prĂ­stup k informĂˇciĂˇm.
[1] Venkatacharya, P., Techniques for Creating User-Friendly Enterprise Portals, Oracle Corporation, October 2000
[2] Townsend, J., Riz, D., Schaffer, D., Building Portals, Intranets, and Corporate Web Sites Using Microsoft Servers, Addison-Wesley, 2004
', 1);
INSERT INTO projects VALUES (312, 'ZP', 360, NULL, 292, '2005/2006', 'VĂ˝uÄŤbovĂ˝ a demonĹˇtraÄŤnĂ˝ systĂ©m na vĂ˝uÄŤbu problematiky zobrazenia Ăşdajov v poÄŤĂ­taÄŤi', 'VĂ˝uÄŤbovĂ˝ a demonĹˇtraÄŤnĂ˝ systĂ©m na vĂ˝uÄŤbu problematiky zobrazenia Ăşdajov v poÄŤĂ­taÄŤi', 'Analyzujte problematiku zobrazenia Ăşdajov v poÄŤĂ­taÄŤi. Navrhnite a implementujte programovĂ˝ systĂ©m pouĹľiteÄľnĂ˝  na vĂ˝uÄŤbu prevodov medzi ÄŤĂ­selnĂ˝mi sĂşstavami, zobrazovania Ăşdajov v poÄŤĂ­taÄŤi a celoÄŤĂ­selnej aritmetiky v dvojkovej ÄŤĂ­selnej sĂşstave. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
MĂˇ byĹĄ funkÄŤnĂ˝  pod OS Windows.
', 'Analyzujte problematiku zobrazenia Ăşdajov v poÄŤĂ­taÄŤi. Navrhnite a implementujte programovĂ˝ systĂ©m pouĹľiteÄľnĂ˝  na vĂ˝uÄŤbu prevodov medzi ÄŤĂ­selnĂ˝mi sĂşstavami, zobrazovania Ăşdajov v poÄŤĂ­taÄŤi a celoÄŤĂ­selnej aritmetiky v dvojkovej ÄŤĂ­selnej sĂşstave. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
MĂˇ byĹĄ funkÄŤnĂ˝  pod OS Windows.
', 0);
INSERT INTO projects VALUES (313, 'ZP', 655, NULL, 293, '2003/2004', 'test1', 're', 'aaa', 'aaa', 1);
INSERT INTO projects VALUES (314, 'ZP', 569, NULL, 295, '2005/2006', 'ProgramovĂ˝ systĂ©m na tvorbu usporiadanĂ˝ch binĂˇrnych rozhodovacĂ­ch diagramov ', 'ProgramovĂ˝ systĂ©m na tvorbu usporiadanĂ˝ch binĂˇrnych rozhodovacĂ­ch diagramov ', 'Analyzujte problematiku, metĂłdu a  existujĂşce programovĂ© prostriedky 
podporujĂşce tvorbu a vykreslovanie binĂˇrnych rozhodovacĂ­ch diagramov
vychĂˇdzajĂşc zo zadanej booleovskej funkcie. VytvorenĂ˝ diagram konvertujte do redukovanej formy a vĂ˝slednĂ˝ diagram vykreslite.
Navrhnite a implementujte programovĂ˝ systĂ©m, ktorĂ˝ bude poskytovaĹĄ vizualizĂˇciu postupu tvorby diagramu tak, aby mohol byĹĄ pouĹľitĂ˝ ako nĂˇzornĂˇ   uÄŤebnĂˇ pomĂ´cka.
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
NavrhnutĂ˝ systĂ©m je moĹľnĂ© implementovaĹĄ v Äľubovolnom programovacom jazyku pod OS Windows.
', 'Analyzujte problematiku, metĂłdu a  existujĂşce programovĂ© prostriedky 
podporujĂşce tvorbu a vykreslovanie binĂˇrnych rozhodovacĂ­ch diagramov
vychĂˇdzajĂşc zo zadanej booleovskej funkcie. VytvorenĂ˝ diagram konvertujte do redukovanej formy a vĂ˝slednĂ˝ diagram vykreslite.
Navrhnite a implementujte programovĂ˝ systĂ©m, ktorĂ˝ bude poskytovaĹĄ vizualizĂˇciu postupu tvorby diagramu tak, aby mohol byĹĄ pouĹľitĂ˝ ako nĂˇzornĂˇ   uÄŤebnĂˇ pomĂ´cka.
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
NavrhnutĂ˝ systĂ©m je moĹľnĂ© implementovaĹĄ v Äľubovolnom programovacom jazyku pod OS Windows.
', 0);
INSERT INTO projects VALUES (315, 'ZP', 566, NULL, 296, '2005/2006', 'EvoluÄŤnĂˇ minimalizĂˇcia Boolovej funkcie pomocou Quinovej McCluskeyho metĂłdy', 'EvoluÄŤnĂˇ minimalizĂˇcia Boolovej funkcie pomocou Quinovej McCluskeyho metĂłdy', 'MetĂłda Quinova a McCluskeyho patrĂ­ medzi veÄľmi efektĂ­vne prĂ­stupy k minimalizĂˇcii BoolovĂ˝ch funkciĂ­. Jej ÄŹalĹˇou vĂ˝hodou je pomerne ÄľahkĂˇ algoritmizĂˇcia pre veÄľkĂ© mnoĹľstvo (niekoÄľko sto) klauzĂşl s mnohĂ˝mi literĂˇlmi (niekoÄľko desiatok). Pomocou tejto metĂłdy sa zostrojĂ­ mnoĹľina  tzv. redukovanĂ˝ch klauzĂşl, z ktorĂ˝ch hÄľadĂˇme takĂş minimĂˇnu podmnoĹľnu, aby plne pokrĂ˝vala vĹˇetky pĂ´vodnĂ© klauzule danej Boolovej funkcie. Tento proces sa obvykle rieĹˇi buÄŹ ruÄŤne, alebo metĂłdou spĂ¤tnĂ©ho prehÄľadĂˇvania (backtrack). AvĹˇak, ak mĂˇme mnoho sto redukovanĂ˝ch klauzĂşl, pouĹľitie spĂ¤tnĂ©ho prehÄľadĂˇvania vedie k enormnĂ©mu nĂˇrastu ÄŤasovej zloĹľitosti (vieme, ze ÄŤasovĂˇ zloĹľitosĹĄ spĂ¤tnĂ©ho prehÄľadĂˇvania rastie exponenciĂˇlne). Z tĂ˝chto dĂ´vodov v prĂˇci bude pouĹľitĂ˝ evoluÄŤnĂ˝ algoritmus k nĂˇjdeniu optimĂˇlnĂ©ho pokrytia pĂ´vodnĂ˝ch klazĂşl redukovanĂ˝mi klauzulami. PrĂ­padnĂ˝m zĂˇujemcom doporuÄŤujem pozrieĹĄ sa na moju prezentĂˇciu na adrese
http://www.fiit.stuba.sk/~kvasnicka/DiskretnaMatematika/Chapter_07/Prezentacia_Quine_McCluskey.pdf.', 'MetĂłda Quinova a McCluskeyho patrĂ­ medzi veÄľmi efektĂ­vne prĂ­stupy k minimalizĂˇcii BoolovĂ˝ch funkciĂ­. Jej ÄŹalĹˇou vĂ˝hodou je pomerne ÄľahkĂˇ algoritmizĂˇcia pre veÄľkĂ© mnoĹľstvo (niekoÄľko sto) klauzĂşl s mnohĂ˝mi literĂˇlmi (niekoÄľko desiatok). Pomocou tejto metĂłdy sa zostrojĂ­ mnoĹľina  tzv. redukovanĂ˝ch klauzĂşl, z ktorĂ˝ch hÄľadĂˇme takĂş minimĂˇnu podmnoĹľnu, aby plne pokrĂ˝vala vĹˇetky pĂ´vodnĂ© klauzule danej Boolovej funkcie. Tento proces sa obvykle rieĹˇi buÄŹ ruÄŤne, alebo metĂłdou spĂ¤tnĂ©ho prehÄľadĂˇvania (backtrack). AvĹˇak, ak mĂˇme mnoho sto redukovanĂ˝ch klauzĂşl, pouĹľitie spĂ¤tnĂ©ho prehÄľadĂˇvania vedie k enormnĂ©mu nĂˇrastu ÄŤasovej zloĹľitosti (vieme, ze ÄŤasovĂˇ zloĹľitosĹĄ spĂ¤tnĂ©ho prehÄľadĂˇvania rastie exponenciĂˇlne). Z tĂ˝chto dĂ´vodov v prĂˇci bude pouĹľitĂ˝ evoluÄŤnĂ˝ algoritmus k nĂˇjdeniu optimĂˇlnĂ©ho pokrytia pĂ´vodnĂ˝ch klazĂşl redukovanĂ˝mi klauzulami. PrĂ­padnĂ˝m zĂˇujemcom doporuÄŤujem pozrieĹĄ sa na moju prezentĂˇciu na adrese
http://www.fiit.stuba.sk/~kvasnicka/DiskretnaMatematika/Chapter_07/Prezentacia_Quine_McCluskey.pdf.', 1);
INSERT INTO projects VALUES (316, 'ZP', 294, NULL, 300, '2005/2006', 'Sledovanie pohybu Äľudskej kostry  v prostredĂ­ augmented reality', 'Sledovanie pohybu Äľudskej kostry  v prostredĂ­ augmented reality', 'Na zĂˇklade vĂ˝sledkov prĂˇc [1], [2], [3],  analyzujte moĹľnosti integrovania modulu pre sledovanie pohybu  ÄŤasti  Äľudskej kostry do prostredia augmented reality v systĂ©me ARToolkit  [4]. Navrhnite a implementujte program pre pohyb ÄŤasti virtuĂˇlnej kostry sledujĂşcej reĂˇlnu kostru snĂ­manĂş kamerou.
   [1] GejguĹˇ, P., Ĺ perka, M.: Face tracking in color video sequences. Proceedings SCCG 2003,
   Budmerice, Pp.268-273.
  [2]  MaretĂˇk, P.: AnalĂ˝za a animĂˇcia chĂ´dze ÄŤloveka. TĂ­movĂ˝ projekt FIIT STU Bratislava (2004)
  [3] LuÄŤeniÄŤ, Ä˝.:  AnalĂ˝za a animĂˇcia chĂ´dze ÄŤloveka. TĂ­movĂ˝ projekt FIIT STU Bratislava (2005)
  [4] ARToolkit: StrĂˇnka University of Washington. http://www.hitl.washington.edu/projects/shared_space/ 
', 'Na zĂˇklade vĂ˝sledkov prĂˇc [1], [2], [3],  analyzujte moĹľnosti integrovania modulu pre sledovanie pohybu  ÄŤasti  Äľudskej kostry do prostredia augmented reality v systĂ©me ARToolkit  [4]. Navrhnite a implementujte program pre pohyb ÄŤasti virtuĂˇlnej kostry sledujĂşcej reĂˇlnu kostru snĂ­manĂş kamerou.
   [1] GejguĹˇ, P., Ĺ perka, M.: Face tracking in color video sequences. Proceedings SCCG 2003,
   Budmerice, Pp.268-273.
  [2]  MaretĂˇk, P.: AnalĂ˝za a animĂˇcia chĂ´dze ÄŤloveka. TĂ­movĂ˝ projekt FIIT STU Bratislava (2004)
  [3] LuÄŤeniÄŤ, Ä˝.:  AnalĂ˝za a animĂˇcia chĂ´dze ÄŤloveka. TĂ­movĂ˝ projekt FIIT STU Bratislava (2005)
  [4] ARToolkit: StrĂˇnka University of Washington. http://www.hitl.washington.edu/projects/shared_space/ 
', 1);
INSERT INTO projects VALUES (317, 'ZP', 360, NULL, 302, '2005/2006', 'Zobrazenie Ăşdajov v poÄŤĂ­taÄŤi â€“ demonĹˇtraÄŤnĂ˝ a vĂ˝uÄŤbovĂ˝ systĂ©m, HTML aplikĂˇcia', 'Zobrazenie Ăşdajov v poÄŤĂ­taÄŤi â€“ demonĹˇtraÄŤnĂ˝ a vĂ˝uÄŤbovĂ˝ systĂ©m, HTML aplikĂˇcia', 'Analyzujte problematiku poziÄŤnĂ˝ch ÄŤĂ­selnĂ˝ch sĂşstav a zobrazenia Ăşdajov v poÄŤĂ­taÄŤi.
Navrhnite a implementujte demonĹˇtraÄŤnĂ˝ a vĂ˝uÄŤbovĂ˝ systĂ©m pouĹľiteÄľnĂ˝  na vĂ˝uÄŤbu prevodov medzi ÄŤĂ­selnĂ˝mi sĂşstavami, zobrazovania Ăşdajov v poÄŤĂ­taÄŤi a celoÄŤĂ­selnej aritmetiky v dvojkovej ÄŤĂ­selnej sĂşstave. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
MĂˇ byĹĄ funkÄŤnĂ˝  ako HTML aplikĂˇcia.

', 'Analyzujte problematiku poziÄŤnĂ˝ch ÄŤĂ­selnĂ˝ch sĂşstav a zobrazenia Ăşdajov v poÄŤĂ­taÄŤi.
Navrhnite a implementujte demonĹˇtraÄŤnĂ˝ a vĂ˝uÄŤbovĂ˝ systĂ©m pouĹľiteÄľnĂ˝  na vĂ˝uÄŤbu prevodov medzi ÄŤĂ­selnĂ˝mi sĂşstavami, zobrazovania Ăşdajov v poÄŤĂ­taÄŤi a celoÄŤĂ­selnej aritmetiky v dvojkovej ÄŤĂ­selnej sĂşstave. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
MĂˇ byĹĄ funkÄŤnĂ˝  ako HTML aplikĂˇcia.

', 0);
INSERT INTO projects VALUES (318, 'ZP', 360, NULL, 303, '2005/2006', 'ProgramovĂ˝ systĂ©m  na vĂ˝uÄŤbu zobrazenia Ăşdajov v poÄŤĂ­taÄŤi', 'ProgramovĂ˝ systĂ©m  na vĂ˝uÄŤbu zobrazenia Ăşdajov v poÄŤĂ­taÄŤi', 'Analyzujte problematiku poziÄŤnĂ˝ch ÄŤĂ­selnĂ˝ch sĂşstav a zobrazenia Ăşdajov v poÄŤĂ­taÄŤi.
Navrhnite a implementujte programovĂ˝ systĂ©m pouĹľiteÄľnĂ˝  na vĂ˝uÄŤbu prevodov medzi ÄŤĂ­selnĂ˝mi sĂşstavami, zobrazovania Ăşdajov v poÄŤĂ­taÄŤi a celoÄŤĂ­selnej aritmetiky v dvojkovej ÄŤĂ­selnej sĂşstave. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
MĂˇ byĹĄ funkÄŤnĂ˝  v textovom reĹľime pod ÄľubovoÄľnĂ˝m operaÄŤnĂ˝m systĂ©mom.
', 'Analyzujte problematiku poziÄŤnĂ˝ch ÄŤĂ­selnĂ˝ch sĂşstav a zobrazenia Ăşdajov v poÄŤĂ­taÄŤi.
Navrhnite a implementujte programovĂ˝ systĂ©m pouĹľiteÄľnĂ˝  na vĂ˝uÄŤbu prevodov medzi ÄŤĂ­selnĂ˝mi sĂşstavami, zobrazovania Ăşdajov v poÄŤĂ­taÄŤi a celoÄŤĂ­selnej aritmetiky v dvojkovej ÄŤĂ­selnej sĂşstave. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
MĂˇ byĹĄ funkÄŤnĂ˝  v textovom reĹľime pod ÄľubovoÄľnĂ˝m operaÄŤnĂ˝m systĂ©mom.
', 0);
INSERT INTO projects VALUES (319, 'ZP', 382, NULL, 304, '2005/2006', 'Ako chodiĹĄ do baru?', 'Ako chodiĹĄ do baru?', 'CieÄľom projektu je rieĹˇiĹĄ problĂ©m obmedzenej racionality na prĂ­klade nĂˇvĹˇtevy baru.
Bar  â€śEl Farolâ€ť v Santa Fe kaĹľdĂş sobotu veÄŤer uvĂˇdza Ă­rsku hudbu. Do baru sa zmestĂ­  asi 60 ÄľudĂ­, priÄŤom poÄŤet celkovĂ˝ch zĂˇujemcov je okolo 100 ÄľudĂ­. Na to, aby sa posluchĂˇÄŤi sobotĹajĹˇieho predstavenia vyhli nĂˇvalu v bare, si kaĹľdĂ˝ hÄľadĂˇ svoju stratĂ©giu (heuristiku), ako na zĂˇklade predoĹˇlĂ˝ch predstavenĂ­ odhadnĂşĹĄ nĂˇvĹˇtevnosĹĄ aktuĂˇlneho predstavenia. PosluchĂˇÄŤi medzi sebou nekomunikujĂş o tom, ÄŤi navĹˇtĂ­via, alebo nenavĹˇtĂ­via bar.
CieÄľom je vytvoriĹĄ pomocou genetickĂ©ho programovania agenta, ktorĂ˝ bude maĹĄ ÄŤo najlepĹˇie skĂłre predikcie nĂˇvĹˇtevnosti baru v prĂ­pade, Ĺľe ostatnĂ­ nĂˇvĹˇtevnĂ­ci si vytvĂˇrajĂş uÄŤiacu sa stratĂ©giu s veÄľkosĹĄou pamĂ¤ti tri nĂˇvĹˇtevy dozadu, a s tĂ˝m, Ĺľe pokiaÄľ im konkrĂ©tna sĂşÄŤasĹĄ stratĂ©gie (predpredminule preplnenĂ©, predminule prĂˇzdno, minule plno)-> choÄŹ do baru) nefunguje, s nejakou pravdepodobnosĹĄou ju prehodia na "nechoÄŹ do baru".
Literatura:
V. KvasniÄŤka, J. PospĂ­chal: Informatika pre sociĂˇlne vedy. UK Bratislava 2005.
B. Edmonds:  Gossip, Sexual Recombination and the El Farol bar: modelling the emergence of heterogeneity, Journal of Artificial Societies and Social Simulation vol. 2, no. 3, 1999, http://jasss.soc.surrey.ac.uk/2/3/2.html', 'CieÄľom projektu je rieĹˇiĹĄ problĂ©m obmedzenej racionality na prĂ­klade nĂˇvĹˇtevy baru.
Bar  â€śEl Farolâ€ť v Santa Fe kaĹľdĂş sobotu veÄŤer uvĂˇdza Ă­rsku hudbu. Do baru sa zmestĂ­  asi 60 ÄľudĂ­, priÄŤom poÄŤet celkovĂ˝ch zĂˇujemcov je okolo 100 ÄľudĂ­. Na to, aby sa posluchĂˇÄŤi sobotĹajĹˇieho predstavenia vyhli nĂˇvalu v bare, si kaĹľdĂ˝ hÄľadĂˇ svoju stratĂ©giu (heuristiku), ako na zĂˇklade predoĹˇlĂ˝ch predstavenĂ­ odhadnĂşĹĄ nĂˇvĹˇtevnosĹĄ aktuĂˇlneho predstavenia. PosluchĂˇÄŤi medzi sebou nekomunikujĂş o tom, ÄŤi navĹˇtĂ­via, alebo nenavĹˇtĂ­via bar.
CieÄľom je vytvoriĹĄ pomocou genetickĂ©ho programovania agenta, ktorĂ˝ bude maĹĄ ÄŤo najlepĹˇie skĂłre predikcie nĂˇvĹˇtevnosti baru v prĂ­pade, Ĺľe ostatnĂ­ nĂˇvĹˇtevnĂ­ci si vytvĂˇrajĂş uÄŤiacu sa stratĂ©giu s veÄľkosĹĄou pamĂ¤ti tri nĂˇvĹˇtevy dozadu, a s tĂ˝m, Ĺľe pokiaÄľ im konkrĂ©tna sĂşÄŤasĹĄ stratĂ©gie (predpredminule preplnenĂ©, predminule prĂˇzdno, minule plno)-> choÄŹ do baru) nefunguje, s nejakou pravdepodobnosĹĄou ju prehodia na "nechoÄŹ do baru".
Literatura:
V. KvasniÄŤka, J. PospĂ­chal: Informatika pre sociĂˇlne vedy. UK Bratislava 2005.
B. Edmonds:  Gossip, Sexual Recombination and the El Farol bar: modelling the emergence of heterogeneity, Journal of Artificial Societies and Social Simulation vol. 2, no. 3, 1999, http://jasss.soc.surrey.ac.uk/2/3/2.html', 1);
INSERT INTO projects VALUES (320, 'ZP', 260, NULL, 305, '2003/2004', 'Prostriedky pre heuristickĂ© definovanie bezpeÄŤnostnej politiky', 'A Tool for Heuristic Definition of Security Policy', 'Vytvorte nĂˇstroj, ktorĂ˝ umoĹľnĂ­ sledovaĹĄ ÄŤinnosti pouĹľĂ­vateÄľa v systĂ©me, ktorĂ© sĂş relevantnĂ© z pohÄľadu definovania bezpeÄŤnostnej politiky riadenia prĂ­stupu. PrĂ­kladom mĂ´Ĺľu byĹĄ sĂşbory, ku ktorĂ˝m pouĹľĂ­vateÄľ pristupuje, ich klasifikĂˇcia ÄŤasovĂˇ (kedy pristupuje, ako ÄŤasto, ...) aj priestorovĂˇ (umiestenie v sĂşborovom systĂ©me, ...), spĂ´sob prĂ­stupu (ÄŤĂ­tanie, zĂˇpis, vykonanie, pridĂˇvanie, ...) ako aj sledovanie postupnostĂ­ prĂ­stupov. VĂ˝stupy nĂˇstroja Ĺˇtatisticky spracujte a vytvorte zĂˇklad profilu pouĹľĂ­vateÄľa', 'Vytvorte nĂˇstroj, ktorĂ˝ umoĹľnĂ­ sledovaĹĄ ÄŤinnosti pouĹľĂ­vateÄľa v systĂ©me, ktorĂ© sĂş relevantnĂ© z pohÄľadu definovania bezpeÄŤnostnej politiky riadenia prĂ­stupu. PrĂ­kladom mĂ´Ĺľu byĹĄ sĂşbory, ku ktorĂ˝m pouĹľĂ­vateÄľ pristupuje, ich klasifikĂˇcia ÄŤasovĂˇ (kedy pristupuje, ako ÄŤasto, ...) aj priestorovĂˇ (umiestenie v sĂşborovom systĂ©me, ...), spĂ´sob prĂ­stupu (ÄŤĂ­tanie, zĂˇpis, vykonanie, pridĂˇvanie, ...) ako aj sledovanie postupnostĂ­ prĂ­stupov. VĂ˝stupy nĂˇstroja Ĺˇtatisticky spracujte a vytvorte zĂˇklad profilu pouĹľĂ­vateÄľa', 1);
INSERT INTO projects VALUES (321, 'DP', 388, NULL, 305, '2005/2006', 'SprĂˇva a publikovanie dokumentov  v prostredĂ­ sĂ©mantickĂ©ho webu.', 'SprĂˇva a publikovanie dokumentov  v prostredĂ­ sĂ©mantickĂ©ho webu.', NULL, NULL, 4);
INSERT INTO projects VALUES (322, 'ZP', 672, 387, 306, '2005/2006', 'Tvorba jazykovĂ©ho grafu v procese uÄŤenia', 'Tvorba jazykovĂ©ho grafu v procese uÄŤenia', 'V poslednej dobe sa veÄľa bĂˇda v oblasti sietĂ­, ktorĂ© integrujĂş vlastnosti sietĂ­ usporiadanĂ˝ch a sietĂ­ nĂˇhodnĂ˝ch. SĂş to siete malĂ©ho sveta. MajĂş ĹˇirokĂ© moĹľnosti aplikĂˇciĂ­. Jednou z nich je aj tzv "word net", kde sa lexikĂłn jazyka chĂˇpe ako graf. Ak graf nie je sĂşvislĂ˝, reÄŤ nemĂ´Ĺľe byĹĄ plynulĂˇ. 
Ăšlohou projektu je pozrieĹĄ sa na proces tvorby "word net" pri uÄŤenĂ­ sa angliÄŤtiny. Budeme analyzovaĹĄ postup uÄŤenia sa cudzieho jazyka a spĂ´sob, akĂ˝m sa novĂ© slovĂˇ pridĂˇvajĂş do slovnej zĂˇsoby. PouĹľijeme pri tom rĂ´zne uÄŤebnice angliÄŤtiny, poprĂ­pade internetovĂ© kurzy a podobne. 
LiteratĂşra: Watts, Small Worlds, Princeton University Press, 2004
                    RybĂˇr a spol, Jazyk a kognĂ­cia, Kalligram, 2005', 'V poslednej dobe sa veÄľa bĂˇda v oblasti sietĂ­, ktorĂ© integrujĂş vlastnosti sietĂ­ usporiadanĂ˝ch a sietĂ­ nĂˇhodnĂ˝ch. SĂş to siete malĂ©ho sveta. MajĂş ĹˇirokĂ© moĹľnosti aplikĂˇciĂ­. Jednou z nich je aj tzv "word net", kde sa lexikĂłn jazyka chĂˇpe ako graf. Ak graf nie je sĂşvislĂ˝, reÄŤ nemĂ´Ĺľe byĹĄ plynulĂˇ. 
Ăšlohou projektu je pozrieĹĄ sa na proces tvorby "word net" pri uÄŤenĂ­ sa angliÄŤtiny. Budeme analyzovaĹĄ postup uÄŤenia sa cudzieho jazyka a spĂ´sob, akĂ˝m sa novĂ© slovĂˇ pridĂˇvajĂş do slovnej zĂˇsoby. PouĹľijeme pri tom rĂ´zne uÄŤebnice angliÄŤtiny, poprĂ­pade internetovĂ© kurzy a podobne. 
LiteratĂşra: Watts, Small Worlds, Princeton University Press, 2004
                    RybĂˇr a spol, Jazyk a kognĂ­cia, Kalligram, 2005', 1);
INSERT INTO projects VALUES (323, 'ZP', 566, NULL, 307, '2005/2006', 'EvoluÄŤnĂˇ minimalizĂˇcia Boolovej funkcie pomocou Quinovej McCluskeyho metĂłdy', 'EvoluÄŤnĂˇ minimalizĂˇcia Boolovej funkcie pomocou Quinovej McCluskeyho metĂłdy', 'MetĂłda Quinova a McCluskeyho patrĂ­ medzi veÄľmi efektĂ­vne prĂ­stupy k minimalizĂˇcii BoolovĂ˝ch funkciĂ­. Jej ÄŹalĹˇou vĂ˝hodou je pomerne ÄľahkĂˇ algoritmizĂˇcia pre veÄľkĂ© mnoĹľstvo (niekoÄľko sto) klauzĂşl s mnohĂ˝mi literĂˇlmi (niekoÄľko desiatok). Pomocou tejto metĂłdy sa zostrojĂ­ mnoĹľina  tzv. redukovanĂ˝ch klauzĂşl, z ktorĂ˝ch hÄľadĂˇme takĂş minimĂˇnu podmnoĹľnu, aby plne pokrĂ˝vala vĹˇetky pĂ´vodnĂ© klauzule danej Boolovej funkcie. Tento proces sa obvykle rieĹˇi buÄŹ ruÄŤne, alebo metĂłdou spĂ¤tnĂ©ho prehÄľadĂˇvania (backtrack). AvĹˇak, ak mĂˇme mnoho sto redukovanĂ˝ch klauzĂşl, pouĹľitie spĂ¤tnĂ©ho prehÄľadĂˇvania vedie k enormnĂ©mu nĂˇrastu ÄŤasovej zloĹľitosti (vieme, ze ÄŤasovĂˇ zloĹľitosĹĄ spĂ¤tnĂ©ho prehÄľadĂˇvania rastie exponenciĂˇlne). Z tĂ˝chto dĂ´vodov v prĂˇci bude pouĹľitĂ˝ evoluÄŤnĂ˝ algoritmus k nĂˇjdeniu optimĂˇlnĂ©ho pokrytia pĂ´vodnĂ˝ch klazĂşl redukovanĂ˝mi klauzulami. PrĂ­padnĂ˝m zĂˇujemcom doporuÄŤujem pozrieĹĄ sa na moju prezentĂˇciu na adrese
http://www.fiit.stuba.sk/~kvasnicka/DiskretnaMatematika/Chapter_07/Prezentacia_Quine_McCluskey.pdf.', 'MetĂłda Quinova a McCluskeyho patrĂ­ medzi veÄľmi efektĂ­vne prĂ­stupy k minimalizĂˇcii BoolovĂ˝ch funkciĂ­. Jej ÄŹalĹˇou vĂ˝hodou je pomerne ÄľahkĂˇ algoritmizĂˇcia pre veÄľkĂ© mnoĹľstvo (niekoÄľko sto) klauzĂşl s mnohĂ˝mi literĂˇlmi (niekoÄľko desiatok). Pomocou tejto metĂłdy sa zostrojĂ­ mnoĹľina  tzv. redukovanĂ˝ch klauzĂşl, z ktorĂ˝ch hÄľadĂˇme takĂş minimĂˇnu podmnoĹľnu, aby plne pokrĂ˝vala vĹˇetky pĂ´vodnĂ© klauzule danej Boolovej funkcie. Tento proces sa obvykle rieĹˇi buÄŹ ruÄŤne, alebo metĂłdou spĂ¤tnĂ©ho prehÄľadĂˇvania (backtrack). AvĹˇak, ak mĂˇme mnoho sto redukovanĂ˝ch klauzĂşl, pouĹľitie spĂ¤tnĂ©ho prehÄľadĂˇvania vedie k enormnĂ©mu nĂˇrastu ÄŤasovej zloĹľitosti (vieme, ze ÄŤasovĂˇ zloĹľitosĹĄ spĂ¤tnĂ©ho prehÄľadĂˇvania rastie exponenciĂˇlne). Z tĂ˝chto dĂ´vodov v prĂˇci bude pouĹľitĂ˝ evoluÄŤnĂ˝ algoritmus k nĂˇjdeniu optimĂˇlnĂ©ho pokrytia pĂ´vodnĂ˝ch klazĂşl redukovanĂ˝mi klauzulami. PrĂ­padnĂ˝m zĂˇujemcom doporuÄŤujem pozrieĹĄ sa na moju prezentĂˇciu na adrese
http://www.fiit.stuba.sk/~kvasnicka/DiskretnaMatematika/Chapter_07/Prezentacia_Quine_McCluskey.pdf.', 1);
INSERT INTO projects VALUES (324, 'ZP', 44, NULL, 308, '2005/2006', 'SimulĂˇtor vĂ˝poÄŤtovĂ˝ch zariadenĂ­', 'SimulĂˇtor vĂ˝poÄŤtovĂ˝ch zariadenĂ­', 'KoneÄŤnĂ˝ automat, zĂˇsobnĂ­kovĂ˝ automat a Turingov stroj sĂş tri zĂˇkladnĂ© modely poÄŤĂ­taÄŤov v TeĂłrii formĂˇlnych jazykov a automatov. Predmetom prĂˇce by mala byĹĄ simulĂˇcia tĂ˝chto troch vĂ˝poÄŤtovĂ˝ch zariadenĂ­. SimulĂˇtor mĂˇ maĹĄ grafickĂ© uĹľĂ­vateÄľskĂ© rozhranie.', 'KoneÄŤnĂ˝ automat, zĂˇsobnĂ­kovĂ˝ automat a Turingov stroj sĂş tri zĂˇkladnĂ© modely poÄŤĂ­taÄŤov v TeĂłrii formĂˇlnych jazykov a automatov. Predmetom prĂˇce by mala byĹĄ simulĂˇcia tĂ˝chto troch vĂ˝poÄŤtovĂ˝ch zariadenĂ­. SimulĂˇtor mĂˇ maĹĄ grafickĂ© uĹľĂ­vateÄľskĂ© rozhranie.', 1);
INSERT INTO projects VALUES (325, 'ZP', 445, NULL, 309, '2006/2007', 'Prostredie pre tvorbu dokumentov s vyuĹľitĂ­m Ĺˇtandardu DocBook', 'Prostredie pre tvorbu dokumentov s vyuĹľitĂ­m Ĺˇtandardu DocBook', 'PreskĂşmajte Ĺˇtandard DocBook (www.docbook.org). Analyzujte sĂşÄŤasnĂ© prostriedky podporujĂşce proces tvorby dokumentov s vyuĹľitĂ­m tohto Ĺˇtandardu, od pĂ­sania samotnĂ˝ch dokumentov, cez ich formĂˇtovanie aĹľ po generovanie vĂ˝slednĂ˝ch dokumentov v cieÄľovej sadzbe. Zamerajte sa pritom na voÄľne dostupnĂ© rieĹˇenia. S pouĹľitĂ­m vhodnej kombinĂˇcie tĂ˝chto prostriedkov vytvorte jednotnĂ© prostredie pre tvorbu dokumentov.
Pri rieĹˇenĂ­ projektu sa tieĹľ zamerajte na Ăşpravu existujĂşcich ĹˇablĂłn pre formĂˇtovanie dokumentov tak, aby tieto bolo moĹľnĂ© vyuĹľiĹĄ na tvorbu dokumentĂˇcie s profesionĂˇlnym vzhÄľadom.', 'PreskĂşmajte Ĺˇtandard DocBook (www.docbook.org). Analyzujte sĂşÄŤasnĂ© prostriedky podporujĂşce proces tvorby dokumentov s vyuĹľitĂ­m tohto Ĺˇtandardu, od pĂ­sania samotnĂ˝ch dokumentov, cez ich formĂˇtovanie aĹľ po generovanie vĂ˝slednĂ˝ch dokumentov v cieÄľovej sadzbe. Zamerajte sa pritom na voÄľne dostupnĂ© rieĹˇenia. S pouĹľitĂ­m vhodnej kombinĂˇcie tĂ˝chto prostriedkov vytvorte jednotnĂ© prostredie pre tvorbu dokumentov.
Pri rieĹˇenĂ­ projektu sa tieĹľ zamerajte na Ăşpravu existujĂşcich ĹˇablĂłn pre formĂˇtovanie dokumentov tak, aby tieto bolo moĹľnĂ© vyuĹľiĹĄ na tvorbu dokumentĂˇcie s profesionĂˇlnym vzhÄľadom.', 1);
INSERT INTO projects VALUES (326, 'ZP', 690, NULL, 310, '2006/2007', 'PodobnosĹĄ dokumentov', 'PodobnosĹĄ dokumentov', 'Na webe sa nachĂˇdza veÄľa dokumentov, mnohĂ© sa nachĂˇdzajĂş na rĂ´znych miestach v tej istej podobe, niektorĂ© sĂş rĂ´zne iba formĂˇtom, alebo majĂş zmenenĂ˝ obsah. CieÄľom zadania je navrhnĂşĹĄ prĂ­stup ako spoznaĹĄ podobnosĹĄ medzi dokumentmi, urÄŤiĹĄ nakoÄľko sa dokumenty podobajĂş svojim obsahom. RieĹˇiteÄľ by sa mal opieraĹĄ o uĹľ existujĂşce prĂ­stupy (shingles, â€žvektorovĂ˝ checksumâ€ś dokumentu), ale nakoÄľko je veÄľkĂ˝ priestor na vylepĹˇenia, oÄŤakĂˇvajĂş sa aj novĂ© nĂˇpady.
LiteratĂşra: Soumen Chakrabati: Mining the Web', 'Na webe sa nachĂˇdza veÄľa dokumentov, mnohĂ© sa nachĂˇdzajĂş na rĂ´znych miestach v tej istej podobe, niektorĂ© sĂş rĂ´zne iba formĂˇtom, alebo majĂş zmenenĂ˝ obsah. CieÄľom zadania je navrhnĂşĹĄ prĂ­stup ako spoznaĹĄ podobnosĹĄ medzi dokumentmi, urÄŤiĹĄ nakoÄľko sa dokumenty podobajĂş svojim obsahom. RieĹˇiteÄľ by sa mal opieraĹĄ o uĹľ existujĂşce prĂ­stupy (shingles, â€žvektorovĂ˝ checksumâ€ś dokumentu), ale nakoÄľko je veÄľkĂ˝ priestor na vylepĹˇenia, oÄŤakĂˇvajĂş sa aj novĂ© nĂˇpady.
LiteratĂşra: Soumen Chakrabati: Mining the Web', 1);
INSERT INTO projects VALUES (327, 'ZP', 98, NULL, 311, '2005/2006', 'AdaptĂ­vna archivĂˇcia informĂˇciĂ­', 'AdaptĂ­vna archivĂˇcia informĂˇciĂ­', 'Pri vytvĂˇranĂ­ prednĂˇĹˇok, seminĂˇrov, workshopov atÄŹ., mĂˇ autor, resp. prednĂˇĹˇateÄľ k dispozĂ­cii informĂˇcie rĂ´zneho typu a formĂˇtov. Pomohlo by mu, keby mal tieto informĂˇcie systematicky uloĹľenĂ© - archivovanĂ©, aby sa mohol Äľahko a rĂ˝chlo k relevantnej informĂˇcii dostaĹĄ. TakĂ˝to adaptĂ­vny archivaÄŤnĂ˝ systĂ©m  informĂˇciĂ­ by slĂşĹľil ako bĂˇza Ăşdajov pre nĂˇstroj na vytvĂˇranie kurzov. 
Spravte analĂ˝zu problematiky a na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu, ktorĂˇ bude slĂşĹľiĹĄ na  ukladanie, archivovanie a spracovanie informĂˇciĂ­. ', 'Pri vytvĂˇranĂ­ prednĂˇĹˇok, seminĂˇrov, workshopov atÄŹ., mĂˇ autor, resp. prednĂˇĹˇateÄľ k dispozĂ­cii informĂˇcie rĂ´zneho typu a formĂˇtov. Pomohlo by mu, keby mal tieto informĂˇcie systematicky uloĹľenĂ© - archivovanĂ©, aby sa mohol Äľahko a rĂ˝chlo k relevantnej informĂˇcii dostaĹĄ. TakĂ˝to adaptĂ­vny archivaÄŤnĂ˝ systĂ©m  informĂˇciĂ­ by slĂşĹľil ako bĂˇza Ăşdajov pre nĂˇstroj na vytvĂˇranie kurzov. 
Spravte analĂ˝zu problematiky a na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu, ktorĂˇ bude slĂşĹľiĹĄ na  ukladanie, archivovanie a spracovanie informĂˇciĂ­. ', 1);
INSERT INTO projects VALUES (328, 'ZP', 358, NULL, 312, '2005/2006', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş testovaĹĄ vybratĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş testovaĹĄ vybratĂ© typy bezpeÄŤnostnĂ˝ch slabĂ­n na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.', 0);
INSERT INTO projects VALUES (329, 'ZP', 674, NULL, 313, '2005/2006', 'ExploratĂ­vne vytvĂˇranie modelu hrĂˇÄŤa a jeho vyuĹľitie v tĂ­movej hre', 'ExploratĂ­vne vytvĂˇranie modelu hrĂˇÄŤa a jeho vyuĹľitie v tĂ­movej hre', 'Predpokladajme model futbalovej hry, v ktorej hrajĂş proti sebe dva tĂ­my softvĂ©rovĂ˝ch agentov. SprĂˇvanie kaĹľdĂ©ho hrĂˇÄŤa je modelovanĂ© pomocou automatu, na zĂˇklade ktorĂ©ho sa rozhoduje, akĂş akciu vykonĂˇ agent v danej situĂˇcii. Navrhnite a implementujte spĂ´sob, ktorĂ˝m bude moĹľnĂ© poÄŤas hry zisĹĄovaĹĄ reakcie sĂşperov na podnety a na zĂˇklade toho vytvĂˇraĹĄ ich model vo forme automatu, ktorĂ˝ sa nĂˇsledne pouĹľije pri predikcii sprĂˇvania sĂşpera a rozhodovanĂ­ poÄŤas hry. Svoje rieĹˇenie porovnajte s niektorĂ˝mi inĂ˝mi uĹľ existujĂşcimi rieĹˇeniami a zaraÄŹte ho do kontextu suÄŤasnĂ©ho stavu v oblasti modelovania tĂ­movĂ˝ch hier.', 'Predpokladajme model futbalovej hry, v ktorej hrajĂş proti sebe dva tĂ­my softvĂ©rovĂ˝ch agentov. SprĂˇvanie kaĹľdĂ©ho hrĂˇÄŤa je modelovanĂ© pomocou automatu, na zĂˇklade ktorĂ©ho sa rozhoduje, akĂş akciu vykonĂˇ agent v danej situĂˇcii. Navrhnite a implementujte spĂ´sob, ktorĂ˝m bude moĹľnĂ© poÄŤas hry zisĹĄovaĹĄ reakcie sĂşperov na podnety a na zĂˇklade toho vytvĂˇraĹĄ ich model vo forme automatu, ktorĂ˝ sa nĂˇsledne pouĹľije pri predikcii sprĂˇvania sĂşpera a rozhodovanĂ­ poÄŤas hry. Svoje rieĹˇenie porovnajte s niektorĂ˝mi inĂ˝mi uĹľ existujĂşcimi rieĹˇeniami a zaraÄŹte ho do kontextu suÄŤasnĂ©ho stavu v oblasti modelovania tĂ­movĂ˝ch hier.', 1);
INSERT INTO projects VALUES (330, 'ZP', 27, NULL, 314, '2005/2006', 'SimulaÄŤnĂˇ kniĹľnica pre agentovĂ© modely', 'SimulaÄŤnĂˇ kniĹľnica pre agentovĂ© modely', '   PreĹˇtudujte dostupnĂ© simulaÄŤnĂ© metĂłdy a nĂˇstroje pre simulĂˇciu modelov s kolĂłniami agentov. Navrhnite a zrealizujte simulaÄŤnĂş kniĹľnicu, ktorĂˇ poskytne zĂˇkladnĂ© prostredie pre vytvĂˇranie agentovĂ˝ch modelov. Implementujte vybranĂ© prĂ­klady simulĂˇciĂ­ s vyuĹľitĂ­m tejto kniĹľnice a vyhodnoĹĄte ich vlastnosti.

OdporĂşÄŤanĂˇ literatĂşra:

1. KvasniÄŤka V., PospĂ­chal J., TiĹo P.: EvoluÄŤnĂ© algoritmy. STU Bratislava, 2000, ISBN 80-227-1377-5.

2. KognitĂ­vne vedy, CHTF STU
http://math.chtf.stuba.sk/kog_vedy.htm', '   PreĹˇtudujte dostupnĂ© simulaÄŤnĂ© metĂłdy a nĂˇstroje pre simulĂˇciu modelov s kolĂłniami agentov. Navrhnite a zrealizujte simulaÄŤnĂş kniĹľnicu, ktorĂˇ poskytne zĂˇkladnĂ© prostredie pre vytvĂˇranie agentovĂ˝ch modelov. Implementujte vybranĂ© prĂ­klady simulĂˇciĂ­ s vyuĹľitĂ­m tejto kniĹľnice a vyhodnoĹĄte ich vlastnosti.

OdporĂşÄŤanĂˇ literatĂşra:

1. KvasniÄŤka V., PospĂ­chal J., TiĹo P.: EvoluÄŤnĂ© algoritmy. STU Bratislava, 2000, ISBN 80-227-1377-5.

2. KognitĂ­vne vedy, CHTF STU
http://math.chtf.stuba.sk/kog_vedy.htm', 1);
INSERT INTO projects VALUES (331, 'ZP', 294, NULL, 315, '2005/2006', 'SystĂ©m pre animovanie chĂ´dze Äľudskej kostry', 'SystĂ©m pre animovanie chĂ´dze Äľudskej kostry', 'Urobte reĹˇerĹˇ literatĂşry o poÄŤĂ­taÄŤovĂ˝ch modeloch Äľudskej kostry a animĂˇcie chĂ´dze a  na zĂˇklade vĂ˝sledkov tĂ­movĂ˝ch projektov [1], [2] doplĹte model  kostry ÄŤloveka a jeho animĂˇcie o chrbticu, hrudnĂ˝ kĂ´Ĺˇ, hornĂ© konÄŤatiny a hlavu. PouĹľite rovnakĂş reprezentĂˇciu 3D modelu, ĹˇtruktĂşru dĂˇt modelu kostry, formĂˇt sĂşboru pre simulĂˇciu pohybu ako aj metodiku transformĂˇcie existujĂşcich modelov do poĹľadovanej ĹˇtruktĂşry dĂˇt.  

[1]  MaretĂˇk, P.: AnalĂ˝za a animĂˇcia chĂ´dze ÄŤloveka. TĂ­movĂ˝ projekt FIIT STU Bratislava (2004)
[2] LuÄŤeniÄŤ, Ä˝.:  AnalĂ˝za a animĂˇcia chĂ´dze ÄŤloveka. TĂ­movĂ˝ projekt FIIT STU Bratislava (2005)

', 'Urobte reĹˇerĹˇ literatĂşry o poÄŤĂ­taÄŤovĂ˝ch modeloch Äľudskej kostry a animĂˇcie chĂ´dze a  na zĂˇklade vĂ˝sledkov tĂ­movĂ˝ch projektov [1], [2] doplĹte model  kostry ÄŤloveka a jeho animĂˇcie o chrbticu, hrudnĂ˝ kĂ´Ĺˇ, hornĂ© konÄŤatiny a hlavu. PouĹľite rovnakĂş reprezentĂˇciu 3D modelu, ĹˇtruktĂşru dĂˇt modelu kostry, formĂˇt sĂşboru pre simulĂˇciu pohybu ako aj metodiku transformĂˇcie existujĂşcich modelov do poĹľadovanej ĹˇtruktĂşry dĂˇt.  

[1]  MaretĂˇk, P.: AnalĂ˝za a animĂˇcia chĂ´dze ÄŤloveka. TĂ­movĂ˝ projekt FIIT STU Bratislava (2004)
[2] LuÄŤeniÄŤ, Ä˝.:  AnalĂ˝za a animĂˇcia chĂ´dze ÄŤloveka. TĂ­movĂ˝ projekt FIIT STU Bratislava (2005)

', 1);
INSERT INTO projects VALUES (332, 'ZP', 12, NULL, 316, '2005/2006', 'InteraktĂ­vny cestovnĂ˝ poriadok na mobilnej platforme', 'InteraktĂ­vny cestovnĂ˝ poriadok na mobilnej platforme', 'Analyzujte mobilnĂ© platformy umoĹľĹujĂşce beh pouĹľĂ­vateÄľskĂ˝ch aplikĂˇciĂ­ (PDA, telefĂłny,atÄŹ.). Porovnajte moĹľnosti jednotlivĂ˝ch platforiem a vĂ˝vojovĂ˝ch prostriedkov pre ne urÄŤenĂ˝ch. SĂşstreÄŹte sa na rĂˇmce (framework) poskytovanĂ© pre podporu vĂ˝voja interaktĂ­vnych aplikĂˇcii na jednotlivĂ˝ch platformĂˇch a moĹľnosti spoluprĂˇce viacerĂ˝ch mobilnĂ˝ch agentov v heterogĂ©nnom prostredĂ­. Pre zvolenĂş platformu navrhnite a implementujte aplikĂˇciu, ktorĂˇ poskytne pouĹľĂ­vateÄľovi informĂˇcie o odchodoch hromadnej dopravy, prĂ­padne odporuÄŤĂ­ vhodnĂş trasu. UvaĹľujte aj o efektĂ­vnosti uloĹľenia a komunikĂˇcii Ăşdajov, o udrĹľovanĂ­ aktuĂˇlnosti Ăşdajov v prostredĂ­ bez trvalĂ©ho pripojenia k internetu alebo inej sieti a o moĹľnostiach poskytovania sluĹľieb zaloĹľenĂ˝ch na lokalizĂˇcii.

', 'Analyzujte mobilnĂ© platformy umoĹľĹujĂşce beh pouĹľĂ­vateÄľskĂ˝ch aplikĂˇciĂ­ (PDA, telefĂłny,atÄŹ.). Porovnajte moĹľnosti jednotlivĂ˝ch platforiem a vĂ˝vojovĂ˝ch prostriedkov pre ne urÄŤenĂ˝ch. SĂşstreÄŹte sa na rĂˇmce (framework) poskytovanĂ© pre podporu vĂ˝voja interaktĂ­vnych aplikĂˇcii na jednotlivĂ˝ch platformĂˇch a moĹľnosti spoluprĂˇce viacerĂ˝ch mobilnĂ˝ch agentov v heterogĂ©nnom prostredĂ­. Pre zvolenĂş platformu navrhnite a implementujte aplikĂˇciu, ktorĂˇ poskytne pouĹľĂ­vateÄľovi informĂˇcie o odchodoch hromadnej dopravy, prĂ­padne odporuÄŤĂ­ vhodnĂş trasu. UvaĹľujte aj o efektĂ­vnosti uloĹľenia a komunikĂˇcii Ăşdajov, o udrĹľovanĂ­ aktuĂˇlnosti Ăşdajov v prostredĂ­ bez trvalĂ©ho pripojenia k internetu alebo inej sieti a o moĹľnostiach poskytovania sluĹľieb zaloĹľenĂ˝ch na lokalizĂˇcii.

', 1);
INSERT INTO projects VALUES (333, 'ZP', 579, NULL, 317, '2005/2006', 'SystĂ©m na podporu tvorby semestrĂˇlnych rozvrhov', 'SystĂ©m na podporu tvorby semestrĂˇlnych rozvrhov', 'Analyzujte ĂşdajovĂ© mnoĹľiny a postupy pri vytvĂˇranĂ­ semestrĂˇlnych rozvrhov a nĂˇsledne navrhnite systĂ©m, ktorĂ˝ by tieto ÄŤinnosti podporoval. ZĂˇkladnĂ© ÄŤasti nĂˇvrhu realizujte v podobe prototypu a zaistite nevyhnutnĂş kompatibilitu s informaÄŤnĂ˝m systĂ©mom pouĹľĂ­vanĂ˝m na FIIT.', 'Analyzujte ĂşdajovĂ© mnoĹľiny a postupy pri vytvĂˇranĂ­ semestrĂˇlnych rozvrhov a nĂˇsledne navrhnite systĂ©m, ktorĂ˝ by tieto ÄŤinnosti podporoval. ZĂˇkladnĂ© ÄŤasti nĂˇvrhu realizujte v podobe prototypu a zaistite nevyhnutnĂş kompatibilitu s informaÄŤnĂ˝m systĂ©mom pouĹľĂ­vanĂ˝m na FIIT.', 1);
INSERT INTO projects VALUES (334, 'ZP', 541, NULL, 318, '2005/2006', 'RozpoznĂˇvanie obrazov z infrakamery', 'RozpoznĂˇvanie obrazov z infrakamery', 'Navrhnite a realizujte systĂ©m pre rozpoznanie  ÄŤloveka z obrazu infrakamery. SystĂ©m mĂˇ umoĹľniĹĄ v reĂˇlnom ÄŤase rozpoznaĹĄ, ÄŤi sa v prĂˇve snĂ­manom obraze infrakamery nachĂˇdza silueta ÄŤloveka a indikovaĹĄ takĂ˝to stav. SystĂ©m mĂ´Ĺľe byĹĄ vyuĹľitĂ˝ v autĂˇch na indikĂˇciu chodcov a cyklistov za znĂ­Ĺľenej viditeÄľnosti a v inteligentnĂ˝ch alarmoch.', 'Navrhnite a realizujte systĂ©m pre rozpoznanie  ÄŤloveka z obrazu infrakamery. SystĂ©m mĂˇ umoĹľniĹĄ v reĂˇlnom ÄŤase rozpoznaĹĄ, ÄŤi sa v prĂˇve snĂ­manom obraze infrakamery nachĂˇdza silueta ÄŤloveka a indikovaĹĄ takĂ˝to stav. SystĂ©m mĂ´Ĺľe byĹĄ vyuĹľitĂ˝ v autĂˇch na indikĂˇciu chodcov a cyklistov za znĂ­Ĺľenej viditeÄľnosti a v inteligentnĂ˝ch alarmoch.', 1);
INSERT INTO projects VALUES (335, 'ZP', 566, NULL, 319, '2005/2006', 'SymbolickĂ˝ prĂ­stup k rieĹˇeniu problĂ©mu Copycat', 'SymbolickĂ˝ prĂ­stup k rieĹˇeniu problĂ©mu Copycat', 'Copycat systĂ©m bol zostrojenĂ˝ poÄŤiatkom 80. rokov americkĂ˝m informatikom D. Hofstadterom a jeho doktorandkou M. Mitchellovou. Pomocou systĂ©mu je moĹľnĂ© modelovaĹĄ elementĂˇrne procesy analĂłgie, ktorĂ© sĂş integrĂˇlnou sĂşÄŤasĹĄou indukÄŤnĂ©ho procesu zovĹˇeobecĹovania. Ăšlohu vysvetlĂ­me na jednoduchom prĂ­klade: Majme relĂˇciu abc==>abd, pomocou tejto relĂˇcie (vyuĹľĂ­vajĂşc analĂłgiu) je potrebnĂ© doplniĹĄ druhĂş relĂˇciu ijk==>?
Je potrebnĂ© nahradiĹĄ otĂˇznik takĂ˝m reĹĄazcom delta tak, aby relĂˇcia ijk==>delta bola analogickĂˇ k pĂ´vodnej relĂˇcii abc==>abd. PrĂ­klad rieĹˇenia je delta=ijl, ktorĂ© vychĂˇdza zo skutoÄŤnosti, Ĺľe v pĂ´vodnej relĂˇcii abc==>abd bol poslednĂ˝ symbol zmenenĂ˝ na nasledovnĂ­ka v abecede.
Je potrebnĂ© rozanalyzovaĹĄ tento problĂ©m a naprogramovaĹĄ tak, aby bol user fiendly pre uĹľĂ­vateÄľov, ktorĂ­ si chcĂş testovaĹĄ svoje IQ. ', 'Copycat systĂ©m bol zostrojenĂ˝ poÄŤiatkom 80. rokov americkĂ˝m informatikom D. Hofstadterom a jeho doktorandkou M. Mitchellovou. Pomocou systĂ©mu je moĹľnĂ© modelovaĹĄ elementĂˇrne procesy analĂłgie, ktorĂ© sĂş integrĂˇlnou sĂşÄŤasĹĄou indukÄŤnĂ©ho procesu zovĹˇeobecĹovania. Ăšlohu vysvetlĂ­me na jednoduchom prĂ­klade: Majme relĂˇciu abc==>abd, pomocou tejto relĂˇcie (vyuĹľĂ­vajĂşc analĂłgiu) je potrebnĂ© doplniĹĄ druhĂş relĂˇciu ijk==>?
Je potrebnĂ© nahradiĹĄ otĂˇznik takĂ˝m reĹĄazcom delta tak, aby relĂˇcia ijk==>delta bola analogickĂˇ k pĂ´vodnej relĂˇcii abc==>abd. PrĂ­klad rieĹˇenia je delta=ijl, ktorĂ© vychĂˇdza zo skutoÄŤnosti, Ĺľe v pĂ´vodnej relĂˇcii abc==>abd bol poslednĂ˝ symbol zmenenĂ˝ na nasledovnĂ­ka v abecede.
Je potrebnĂ© rozanalyzovaĹĄ tento problĂ©m a naprogramovaĹĄ tak, aby bol user fiendly pre uĹľĂ­vateÄľov, ktorĂ­ si chcĂş testovaĹĄ svoje IQ. ', 1);
INSERT INTO projects VALUES (336, 'ZP', 43, NULL, 320, '2005/2006', 'RieĹˇenie hlavolamu symbolickĂ˝m a subsymbolickĂ˝m prĂ­stupom umelej inteligencie', 'RieĹˇenie hlavolamu symbolickĂ˝m a subsymbolickĂ˝m prĂ­stupom umelej inteligencie', 'Na vybranom hlavolame porovnajte rĂ´zne prĂ­stupy jeho rieĹˇenia. Porovnajte  vybranĂ˝ch zĂˇstupcov symbolickej a subsymbolickej umelej inteligencie na rieĹˇenie danĂ©ho hlavolamu. ZhodnoĹĄte ÄŤasovĂş a pamĂ¤ĹĄovĂş nĂˇroÄŤnosĹĄ testovanĂ˝ch prĂ­stupov.', 'Na vybranom hlavolame porovnajte rĂ´zne prĂ­stupy jeho rieĹˇenia. Porovnajte  vybranĂ˝ch zĂˇstupcov symbolickej a subsymbolickej umelej inteligencie na rieĹˇenie danĂ©ho hlavolamu. ZhodnoĹĄte ÄŤasovĂş a pamĂ¤ĹĄovĂş nĂˇroÄŤnosĹĄ testovanĂ˝ch prĂ­stupov.', 1);
INSERT INTO projects VALUES (337, 'ZP', 387, NULL, 321, '2005/2006', 'VyuĹľitie pravdepodobnostnĂ˝ch modelov so skrytĂ˝mi triedami na organizovanie dokumentov', 'VyuĹľitie pravdepodobnostnĂ˝ch modelov so skrytĂ˝mi triedami na organizovanie dokumentov', 'CieÄľom tohto projektu bude skĂşmaĹĄ pravdepodobnostnĂ© modely so skrytĂ˝mi triedami a ich pouĹľitie na automatickĂ© organizovanie dokumentov a slov. Od Ĺˇtudenta sa najprv predpokladĂˇ pochopenie modelov so skrytĂ˝mi triedami a experimentovanie s vybranĂ˝mi modelmi. V prĂˇci nĂˇs bude zaujĂ­maĹĄ sprĂˇvanie sa modelov, ktorĂ© vychĂˇdzajĂş z aspektovĂ©ho modelu. Bude potrebnĂ© vytvoriĹĄ softvĂ©rovĂ˝ balĂ­k na organizovanie dokumentov.', 'CieÄľom tohto projektu bude skĂşmaĹĄ pravdepodobnostnĂ© modely so skrytĂ˝mi triedami a ich pouĹľitie na automatickĂ© organizovanie dokumentov a slov. Od Ĺˇtudenta sa najprv predpokladĂˇ pochopenie modelov so skrytĂ˝mi triedami a experimentovanie s vybranĂ˝mi modelmi. V prĂˇci nĂˇs bude zaujĂ­maĹĄ sprĂˇvanie sa modelov, ktorĂ© vychĂˇdzajĂş z aspektovĂ©ho modelu. Bude potrebnĂ© vytvoriĹĄ softvĂ©rovĂ˝ balĂ­k na organizovanie dokumentov.', 1);
INSERT INTO projects VALUES (338, 'ZP', 563, NULL, 322, '2005/2006', 'ExperimentĂˇlny mikropoÄŤĂ­taÄŤ EMP386EX', 'ExperimentĂˇlny mikropoÄŤĂ­taÄŤ EMP386EX', 'Navrhnite a zrealizujte experimentĂˇlny mikropoÄŤĂ­taÄŤ na bĂˇze mikroprocesora 80386EX s nasledovnĂ˝mi poĹľiadavkami:  8-bitovĂˇ pamĂ¤ĹĄ ROM s kapacitou 512 kB s moĹľnosĹĄou rozĹˇĂ­renia, 16-bitovĂˇ pamĂ¤ĹĄ RWM s kapacitou 64 kB s moĹľnosĹĄou rozĹˇĂ­renia, moĹľnosĹĄ krokovania programu po stroj. cykloch cez stav WAIT, 6-miestny numerickĂ˝ displej, 2 sĂ©riovĂ© interfejsy RS232C, podpora pripojenia monitorovacej jednotky.', 'Navrhnite a zrealizujte experimentĂˇlny mikropoÄŤĂ­taÄŤ na bĂˇze mikroprocesora 80386EX s nasledovnĂ˝mi poĹľiadavkami:  8-bitovĂˇ pamĂ¤ĹĄ ROM s kapacitou 512 kB s moĹľnosĹĄou rozĹˇĂ­renia, 16-bitovĂˇ pamĂ¤ĹĄ RWM s kapacitou 64 kB s moĹľnosĹĄou rozĹˇĂ­renia, moĹľnosĹĄ krokovania programu po stroj. cykloch cez stav WAIT, 6-miestny numerickĂ˝ displej, 2 sĂ©riovĂ© interfejsy RS232C, podpora pripojenia monitorovacej jednotky.', 0);
INSERT INTO projects VALUES (339, 'ZP', 375, NULL, 323, '2006/2007', 'OdolnosĹĄ proti poruchĂˇm v distribuovanom prostredĂ­', 'OdolnosĹĄ proti poruchĂˇm v distribuovanom prostredĂ­', 'Pre distribuovanĂ© poÄŤĂ­taÄŤovĂ© systĂ©my analyzujte rĂ´zne prĂ­stupy odolnosti proti poruchĂˇm zaloĹľenĂ© na technike vkladania bodov nĂˇvratu. Navrhnite a implementujte jednoduchĂ˝ systĂ©m vkladania bodov nĂˇvratu a zotavenia sa v prostredĂ­ lokĂˇlnych poÄŤĂ­taÄŤovĂ˝ch sietĂ­. NavrhnutĂ˝ systĂ©m overte v reĂˇlnej sieti.

Pozn. RieĹˇenie projektu vyĹľaduje znalosti z Diagnostiky a spoÄľahlivosti.', 'Pre distribuovanĂ© poÄŤĂ­taÄŤovĂ© systĂ©my analyzujte rĂ´zne prĂ­stupy odolnosti proti poruchĂˇm zaloĹľenĂ© na technike vkladania bodov nĂˇvratu. Navrhnite a implementujte jednoduchĂ˝ systĂ©m vkladania bodov nĂˇvratu a zotavenia sa v prostredĂ­ lokĂˇlnych poÄŤĂ­taÄŤovĂ˝ch sietĂ­. NavrhnutĂ˝ systĂ©m overte v reĂˇlnej sieti.

Pozn. RieĹˇenie projektu vyĹľaduje znalosti z Diagnostiky a spoÄľahlivosti.', 0);
INSERT INTO projects VALUES (340, 'ZP', 20, NULL, 324, '2005/2006', 'AplikĂˇcia pre mobilnĂ© zariadenie', 'AplikĂˇcia pre mobilnĂ© zariadenie', 'MobilnĂ© zariadenia umoĹľĹujĂşce vykonĂˇvanie uĹľĂ­vateÄľom dodanĂ˝ch programov sĂş ÄŤoraz dostupnejĹˇie. NaĹˇtudujte moĹľnosti programovania aplikĂˇciĂ­ pre mobilnĂ© zariadenia a vytvorte aplikĂˇciu â€“ hru vyuĹľĂ­vajĂşcu komunikaÄŤnĂ© moĹľnosti tĂ˝chto zariadenĂ­.
', 'MobilnĂ© zariadenia umoĹľĹujĂşce vykonĂˇvanie uĹľĂ­vateÄľom dodanĂ˝ch programov sĂş ÄŤoraz dostupnejĹˇie. NaĹˇtudujte moĹľnosti programovania aplikĂˇciĂ­ pre mobilnĂ© zariadenia a vytvorte aplikĂˇciu â€“ hru vyuĹľĂ­vajĂşcu komunikaÄŤnĂ© moĹľnosti tĂ˝chto zariadenĂ­.
', 1);
INSERT INTO projects VALUES (341, 'ZP', 359, NULL, 325, '2005/2006', 'ProgramovĂˇ podpora pre vĂ˝uÄŤbu poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'ProgramovĂˇ podpora pre vĂ˝uÄŤbu poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Analyzujte CLI prostredie v CISCO smerovaÄŤoch. Navrhnite a implementujte programovĂ˝ systĂ©m, ktorĂ˝ bude simulovaĹĄ ÄŤinnosĹĄ CISCO smerovaÄŤa pre vybranĂş skupinu prĂ­kazov. SystĂ©m mĂˇ umoĹľĹiĹĄ trĂ©novanie konfigurovania smerovaÄŤov v prostredĂ­ OS Windows. ', 'Analyzujte CLI prostredie v CISCO smerovaÄŤoch. Navrhnite a implementujte programovĂ˝ systĂ©m, ktorĂ˝ bude simulovaĹĄ ÄŤinnosĹĄ CISCO smerovaÄŤa pre vybranĂş skupinu prĂ­kazov. SystĂ©m mĂˇ umoĹľĹiĹĄ trĂ©novanie konfigurovania smerovaÄŤov v prostredĂ­ OS Windows. ', 0);
INSERT INTO projects VALUES (342, 'ZP', 660, NULL, 326, '2005/2006', 'Dolovanie charakteristĂ­k pouĹľĂ­vateÄľa v textoch', 'Dolovanie charakteristĂ­k pouĹľĂ­vateÄľa v textoch', 'EfektĂ­vne sprĂ­stupĹovanie informĂˇciĂ­ vyĹľaduje poskytnutie sprĂˇvnej informĂˇcie, sprĂˇvnym osobĂˇm v sprĂˇvnom ÄŤase. UvedenĂş poĹľiadavku moĹľno realizovaĹĄ tzv. adaptĂ­vnymi systĂ©mami, ktorĂ© prispĂ´sobujĂş prezentovanĂ© informĂˇcie a prezentĂˇciu informĂˇciĂ­ pouĹľĂ­vateÄľovi alebo prostrediu, v ktorom sa nachĂˇdza. Na prispĂ´sobovanie je nevyhnutnĂ© poznaĹĄ charakteristiky pouĹľĂ­vateÄľa, ktorĂ© sa reprezentujĂş modelom pouĹľĂ­vateÄľa. SkĂşmajte moĹľnosti automatickĂ©ho zĂ­skavania charakteristĂ­k pouĹľĂ­vateÄľa a tvorby modelov pouĹľĂ­vateÄľa. Zamerajte sa pri tom na dolovanie v textoch, ktorĂ© pouĹľĂ­vateÄľ poskytne a to v Ĺˇpecifickej oblasti vyhÄľadĂˇvania pracovnĂ˝ch prĂ­leĹľitostĂ­. Ako zĂˇkladnĂ˝ vstup pouĹľite Ĺľivotopis pouĹľĂ­vateÄľa. Navrhnite metĂłdu analĂ˝zy Ĺľivotopisu s cieÄľom zĂ­skania charakteristiky pouĹľĂ­vateÄľa. NavrhnutĂş metĂłdu overte implementĂˇciou prototypu, ktorĂ˝ na zĂˇklade Ĺľivotopisov nĂˇjdenĂ˝ch na Internete vytvorĂ­ model pouĹľĂ­vateÄľa.', 'EfektĂ­vne sprĂ­stupĹovanie informĂˇciĂ­ vyĹľaduje poskytnutie sprĂˇvnej informĂˇcie, sprĂˇvnym osobĂˇm v sprĂˇvnom ÄŤase. UvedenĂş poĹľiadavku moĹľno realizovaĹĄ tzv. adaptĂ­vnymi systĂ©mami, ktorĂ© prispĂ´sobujĂş prezentovanĂ© informĂˇcie a prezentĂˇciu informĂˇciĂ­ pouĹľĂ­vateÄľovi alebo prostrediu, v ktorom sa nachĂˇdza. Na prispĂ´sobovanie je nevyhnutnĂ© poznaĹĄ charakteristiky pouĹľĂ­vateÄľa, ktorĂ© sa reprezentujĂş modelom pouĹľĂ­vateÄľa. SkĂşmajte moĹľnosti automatickĂ©ho zĂ­skavania charakteristĂ­k pouĹľĂ­vateÄľa a tvorby modelov pouĹľĂ­vateÄľa. Zamerajte sa pri tom na dolovanie v textoch, ktorĂ© pouĹľĂ­vateÄľ poskytne a to v Ĺˇpecifickej oblasti vyhÄľadĂˇvania pracovnĂ˝ch prĂ­leĹľitostĂ­. Ako zĂˇkladnĂ˝ vstup pouĹľite Ĺľivotopis pouĹľĂ­vateÄľa. Navrhnite metĂłdu analĂ˝zy Ĺľivotopisu s cieÄľom zĂ­skania charakteristiky pouĹľĂ­vateÄľa. NavrhnutĂş metĂłdu overte implementĂˇciou prototypu, ktorĂ˝ na zĂˇklade Ĺľivotopisov nĂˇjdenĂ˝ch na Internete vytvorĂ­ model pouĹľĂ­vateÄľa.', 1);
INSERT INTO projects VALUES (343, 'ZP', 44, NULL, 327, '2005/2006', 'ImplementĂˇcia algoritmov na hÄľadanie hamiltonovskĂ˝ch kruĹľnĂ­c v grafe', 'ImplementĂˇcia algoritmov na hÄľadanie hamiltonovskĂ˝ch kruĹľnĂ­c v grafe', 'Ăšloha zistiĹĄ, ÄŤi v grafe existuje hamiltonovskĂˇ kruĹľnica je NP-ĂşplnĂ˝ problĂ©m. Jeden moĹľnĂ˝ prĂ­stup, ako zvlĂˇdnuĹĄ tento problĂ©m v praxi, je overiĹĄ nejakĂş postaÄŤujĂşcu podmienku hamiltonovskosti (napr. podmienku Bondyho a ChvĂˇtala - dĂˇ sa overiĹĄ v polynomiĂˇlnom ÄŤase). TĂ˝m vĹˇak zĂşĹľime mnoĹľinu hamiltonovskĂ˝ch grafov, pretoĹľe nie vĹˇetky hamiltonovskĂ© grafy jej vyhovujĂş.
Inou moĹľnosĹĄou je implemetovaĹĄ nejakĂ˝ heuristickĂ˝ algoritmus a hÄľadaĹĄ hamiltonovskĂş kruĹľnicu podÄľa neho.
Projekt by mal rieĹˇiĹĄ danĂ˝ problĂ©m obidvomi prĂ­stupmi.', 'Ăšloha zistiĹĄ, ÄŤi v grafe existuje hamiltonovskĂˇ kruĹľnica je NP-ĂşplnĂ˝ problĂ©m. Jeden moĹľnĂ˝ prĂ­stup, ako zvlĂˇdnuĹĄ tento problĂ©m v praxi, je overiĹĄ nejakĂş postaÄŤujĂşcu podmienku hamiltonovskosti (napr. podmienku Bondyho a ChvĂˇtala - dĂˇ sa overiĹĄ v polynomiĂˇlnom ÄŤase). TĂ˝m vĹˇak zĂşĹľime mnoĹľinu hamiltonovskĂ˝ch grafov, pretoĹľe nie vĹˇetky hamiltonovskĂ© grafy jej vyhovujĂş.
Inou moĹľnosĹĄou je implemetovaĹĄ nejakĂ˝ heuristickĂ˝ algoritmus a hÄľadaĹĄ hamiltonovskĂş kruĹľnicu podÄľa neho.
Projekt by mal rieĹˇiĹĄ danĂ˝ problĂ©m obidvomi prĂ­stupmi.', 1);
INSERT INTO projects VALUES (344, 'ZP', 704, NULL, 328, '2005/2006', 'PodpornĂ˝ prostriedok pre zmeny v zdrojovĂ˝ch materiĂˇloch pre virtuĂˇlnu univerzitu ', 'PodpornĂ˝ prostriedok pre zmeny v zdrojovĂ˝ch materiĂˇloch pre virtuĂˇlnu univerzitu ', 'NavrhnĂşĹĄ softvĂ©rovĂ˝ prostriedok na podporu zmeny obsahu  zdrojovĂ˝ch materiĂˇlov pre tvorbu kurzov â€“ virtuĂˇlnu univerzitu, ktorĂ© majĂş zdrojovĂ© materiĂˇly ( DB) katalogizovanĂ© a znovu ich pouĹľĂ­vajĂş. TakĂ©to prostriedky majĂş svoju cenu  (a sĂş vyzdvihovanĂ©), pretoĹľe prerĂˇbaĹĄ starĂ© kurzy je rĂ˝chlejĹˇie , ako vytvĂˇraĹĄ celkom od zaÄŤiatku novĂ©.  V sĂşvislosti s tĂ˝m sa hovorĂ­ najmĂ¤ o meta-dĂˇtach, teda aby informĂˇcie o objektoch boli dostupnĂ©, aby objekty dostatoÄŤne popisovali a aby meta-dĂˇta boli v Ĺˇtandardizovanom tvare ( IMS â€“ EDUCASE a Ariadne). )


', 'NavrhnĂşĹĄ softvĂ©rovĂ˝ prostriedok na podporu zmeny obsahu  zdrojovĂ˝ch materiĂˇlov pre tvorbu kurzov â€“ virtuĂˇlnu univerzitu, ktorĂ© majĂş zdrojovĂ© materiĂˇly ( DB) katalogizovanĂ© a znovu ich pouĹľĂ­vajĂş. TakĂ©to prostriedky majĂş svoju cenu  (a sĂş vyzdvihovanĂ©), pretoĹľe prerĂˇbaĹĄ starĂ© kurzy je rĂ˝chlejĹˇie , ako vytvĂˇraĹĄ celkom od zaÄŤiatku novĂ©.  V sĂşvislosti s tĂ˝m sa hovorĂ­ najmĂ¤ o meta-dĂˇtach, teda aby informĂˇcie o objektoch boli dostupnĂ©, aby objekty dostatoÄŤne popisovali a aby meta-dĂˇta boli v Ĺˇtandardizovanom tvare ( IMS â€“ EDUCASE a Ariadne). )


', 1);
INSERT INTO projects VALUES (345, 'ZP', 260, NULL, 329, '2005/2006', 'Podpora automatizovanĂ©ho hodnotenia programov', 'Podpora automatizovanĂ©ho hodnotenia programov', 'Analyzujte problematiku automatizovanĂ©ho overovania funkÄŤnosti programov, navrhnite a vytvorte nĂˇstroj, ktorĂ˝ jednak umoĹľnĂ­ vyhodnotiĹĄ sprĂˇvnosĹĄ fungovania programu na zĂˇklade definovanĂ˝ch vstupov a k nim prislĂşchajĂşcich oÄŤakĂˇvanĂ˝ch vĂ˝stupov a tieĹľ umoĹľnĂ­ zistiĹĄ rĂ´zne kvantitatĂ­vne a kvalitatĂ­vne parametre programov. Pri rieĹˇenĂ­ sa zaoberajte aj problematikou kontrolovanĂ©ho behu programu v obmedzenom prostredĂ­ tak, aby ste zabrĂˇnili jeho moĹľnĂ˝m neĹľiadĂşcim vplyvom na ostatnĂ© ÄŤasti systĂ©mu. NĂˇstroj implementujte v operaÄŤnom systĂ©me FreeBSD alebo Linux.
V rĂˇmci projektu sa zamerajte na ÄŤasĹĄ venovanĂş kontrolovanĂ©mu behu programu v obmedzenom prostredĂ­. ', 'Analyzujte problematiku automatizovanĂ©ho overovania funkÄŤnosti programov, navrhnite a vytvorte nĂˇstroj, ktorĂ˝ jednak umoĹľnĂ­ vyhodnotiĹĄ sprĂˇvnosĹĄ fungovania programu na zĂˇklade definovanĂ˝ch vstupov a k nim prislĂşchajĂşcich oÄŤakĂˇvanĂ˝ch vĂ˝stupov a tieĹľ umoĹľnĂ­ zistiĹĄ rĂ´zne kvantitatĂ­vne a kvalitatĂ­vne parametre programov. Pri rieĹˇenĂ­ sa zaoberajte aj problematikou kontrolovanĂ©ho behu programu v obmedzenom prostredĂ­ tak, aby ste zabrĂˇnili jeho moĹľnĂ˝m neĹľiadĂşcim vplyvom na ostatnĂ© ÄŤasti systĂ©mu. NĂˇstroj implementujte v operaÄŤnom systĂ©me FreeBSD alebo Linux.
V rĂˇmci projektu sa zamerajte na ÄŤasĹĄ venovanĂş kontrolovanĂ©mu behu programu v obmedzenom prostredĂ­. ', 1);
INSERT INTO projects VALUES (346, 'ZP', 563, NULL, 330, '2005/2006', 'GenerĂˇtor cieÄľovĂ˝ch sĂşborov pre napaÄľovanie pamĂ¤tĂ­', 'GenerĂˇtor cieÄľovĂ˝ch sĂşborov pre napaÄľovanie pamĂ¤tĂ­', 'Navrhnite a implementujte programovĂ˝ systĂ©m na generovanie cieÄľovĂ˝ch sĂşborov pre napaÄľovanie pamĂ¤tĂ­ s nasledujĂşcimi poĹľiadavkami:
vstupnĂ˝ sĂşbor v plnom formĂˇte INTEL-HEX, podpora transformaÄŤnej tabuÄľky, moĹľnosĹĄ rozdelenia vstupnĂ©ho sĂşboru na 2, 4 a 8 vĂ˝stupnĂ˝ch sĂşborov.
', 'Navrhnite a implementujte programovĂ˝ systĂ©m na generovanie cieÄľovĂ˝ch sĂşborov pre napaÄľovanie pamĂ¤tĂ­ s nasledujĂşcimi poĹľiadavkami:
vstupnĂ˝ sĂşbor v plnom formĂˇte INTEL-HEX, podpora transformaÄŤnej tabuÄľky, moĹľnosĹĄ rozdelenia vstupnĂ©ho sĂşboru na 2, 4 a 8 vĂ˝stupnĂ˝ch sĂşborov.
', 0);
INSERT INTO projects VALUES (347, 'ZP', 10, NULL, 331, '2005/2006', 'SimulovanĂ˝ robotickĂ˝ futbal - trĂ©ner', 'SimulovanĂ˝ robotickĂ˝ futbal - trĂ©ner', 'SimulovanĂ˝ robotickĂ˝ futbal sa zaoberĂˇ vytvĂˇranĂ­m tĂ­mov spolupracujĂşcich agentov, ktorĂ© v simulovanom prostredĂ­ navzĂˇjom sĂşperia. JednotlivĂ­ hrĂˇÄŤi-agenti predstavujĂş samostatnĂ© programy, ktorĂ© prostrednĂ­ctvom siete komunikujĂş so simulaÄŤnĂ˝m serverom. PoÄŤas testovania a uÄŤenia hrĂˇÄŤov je moĹľnĂ© pouĹľiĹĄ ĹˇpeciĂˇlny nĂˇstroj - trĂ©nera, ktorĂ˝ umoĹľĹuje nastavovanie pozĂ­ciĂ­ hrĂˇÄŤov, lopty a ÄŹalĹˇĂ­ch parametrov hry podÄľa vopred definovanĂ˝ch pravidiel. Navrhnite a implementujte pomocnĂ˝ nĂˇstroj - trĂ©nera, ktorĂ˝ umoĹľnĂ­ pomocou jednoduchĂ©ho rozhrania definovaĹĄ pravidlĂˇ na nastavenie hernej situĂˇcie. Pri nĂˇvrhu a implementĂˇcii je moĹľnĂ© vychĂˇdzaĹĄ z uĹľ existujĂşcich nĂˇstrojov.', 'SimulovanĂ˝ robotickĂ˝ futbal sa zaoberĂˇ vytvĂˇranĂ­m tĂ­mov spolupracujĂşcich agentov, ktorĂ© v simulovanom prostredĂ­ navzĂˇjom sĂşperia. JednotlivĂ­ hrĂˇÄŤi-agenti predstavujĂş samostatnĂ© programy, ktorĂ© prostrednĂ­ctvom siete komunikujĂş so simulaÄŤnĂ˝m serverom. PoÄŤas testovania a uÄŤenia hrĂˇÄŤov je moĹľnĂ© pouĹľiĹĄ ĹˇpeciĂˇlny nĂˇstroj - trĂ©nera, ktorĂ˝ umoĹľĹuje nastavovanie pozĂ­ciĂ­ hrĂˇÄŤov, lopty a ÄŹalĹˇĂ­ch parametrov hry podÄľa vopred definovanĂ˝ch pravidiel. Navrhnite a implementujte pomocnĂ˝ nĂˇstroj - trĂ©nera, ktorĂ˝ umoĹľnĂ­ pomocou jednoduchĂ©ho rozhrania definovaĹĄ pravidlĂˇ na nastavenie hernej situĂˇcie. Pri nĂˇvrhu a implementĂˇcii je moĹľnĂ© vychĂˇdzaĹĄ z uĹľ existujĂşcich nĂˇstrojov.', 1);
INSERT INTO projects VALUES (348, 'ZP', 541, NULL, 332, '2005/2006', 'RozpoznĂˇvanie obrazov z infrakamery', 'RozpoznĂˇvanie obrazov z infrakamery', 'Navrhnite a realizujte systĂ©m pre rozpoznanie  ÄŤloveka z obrazu infrakamery. SystĂ©m mĂˇ umoĹľniĹĄ v reĂˇlnom ÄŤase rozpoznaĹĄ, ÄŤi sa v prĂˇve snĂ­manom obraze infrakamery nachĂˇdza silueta ÄŤloveka a indikovaĹĄ takĂ˝to stav. SystĂ©m mĂ´Ĺľe byĹĄ vyuĹľitĂ˝ v autĂˇch na indikĂˇciu chodcov a cyklistov za znĂ­Ĺľenej viditeÄľnosti a v inteligentnĂ˝ch alarmoch.', 'Navrhnite a realizujte systĂ©m pre rozpoznanie  ÄŤloveka z obrazu infrakamery. SystĂ©m mĂˇ umoĹľniĹĄ v reĂˇlnom ÄŤase rozpoznaĹĄ, ÄŤi sa v prĂˇve snĂ­manom obraze infrakamery nachĂˇdza silueta ÄŤloveka a indikovaĹĄ takĂ˝to stav. SystĂ©m mĂ´Ĺľe byĹĄ vyuĹľitĂ˝ v autĂˇch na indikĂˇciu chodcov a cyklistov za znĂ­Ĺľenej viditeÄľnosti a v inteligentnĂ˝ch alarmoch.', 1);
INSERT INTO projects VALUES (349, 'ZP', 19, NULL, 333, '2005/2006', 'OntolĂłgie pre domĂ©nu pracovnĂ˝ch prĂ­leĹľitostĂ­', 'OntolĂłgie pre domĂ©nu pracovnĂ˝ch prĂ­leĹľitostĂ­', 'SĂşÄŤasnĂ˝ web obsahuje veÄľkĂ© mnoĹľstvo informĂˇciĂ­. Ich prehÄľadĂˇvanie komplikuje skutoÄŤnosĹĄ, Ĺľe vĂ¤ÄŤĹˇina technĂ­k pouĹľitĂ˝ch na zobrazenie informĂˇciĂ­ nehovorĂ­ niÄŤ o sĂ©mantike prezentovanĂ˝ch informĂˇciĂ­. Analyzujte vlastnosti portĂˇlov orientovanĂ˝ch na ponĂşkanie pracovnĂ˝ch prĂ­leĹľitostĂ­. Vytvorte a formĂˇlne zapĂ­Ĺˇte ontolĂłgiu pre domĂ©nu pracovnĂ˝ch prĂ­leĹľitosti v niektorom z ontologickĂ˝ch jazykov. Navrhnite model aplikaÄŤnej domĂ©ny, na ktorom experimentĂˇlne overĂ­te vytvorenĂş ontolĂłgiu. Na prezentĂˇciu informĂˇciĂ­ z domĂ©ny pouĹľite niektorĂş z technĂ­k adaptĂ­vnej prezentĂˇcie, prĂ­padne kombinĂˇciu viacerĂ˝ch technĂ­k. ', 'SĂşÄŤasnĂ˝ web obsahuje veÄľkĂ© mnoĹľstvo informĂˇciĂ­. Ich prehÄľadĂˇvanie komplikuje skutoÄŤnosĹĄ, Ĺľe vĂ¤ÄŤĹˇina technĂ­k pouĹľitĂ˝ch na zobrazenie informĂˇciĂ­ nehovorĂ­ niÄŤ o sĂ©mantike prezentovanĂ˝ch informĂˇciĂ­. Analyzujte vlastnosti portĂˇlov orientovanĂ˝ch na ponĂşkanie pracovnĂ˝ch prĂ­leĹľitostĂ­. Vytvorte a formĂˇlne zapĂ­Ĺˇte ontolĂłgiu pre domĂ©nu pracovnĂ˝ch prĂ­leĹľitosti v niektorom z ontologickĂ˝ch jazykov. Navrhnite model aplikaÄŤnej domĂ©ny, na ktorom experimentĂˇlne overĂ­te vytvorenĂş ontolĂłgiu. Na prezentĂˇciu informĂˇciĂ­ z domĂ©ny pouĹľite niektorĂş z technĂ­k adaptĂ­vnej prezentĂˇcie, prĂ­padne kombinĂˇciu viacerĂ˝ch technĂ­k. ', 1);
INSERT INTO projects VALUES (350, 'ZP', 563, NULL, 335, '2005/2006', 'Monitorovacia jednotka ÄŤĂ­slicovĂ˝ch systĂ©mov', 'Monitorovacia jednotka ÄŤĂ­slicovĂ˝ch systĂ©mov', 'Navrhnite a zrealizujte monitorovaciu jednotku na bĂˇze mikropoÄŤĂ­taÄŤa s nasledovnĂ˝mi vlastnosĹĄami:  64 vstupnĂ˝ch kanĂˇlov, 12-miestny hexadecimĂˇlny displej, 16 indikaÄŤnĂ˝ch LED diĂłd, 2 externĂ© synchronizaÄŤnĂ© vstupy, 1 manuĂˇlny synchronizaÄŤnĂ˝ vstup, spojenie s hostiteÄľskĂ˝m poÄŤĂ­taÄŤom cez rozhranie RS232C.', 'Navrhnite a zrealizujte monitorovaciu jednotku na bĂˇze mikropoÄŤĂ­taÄŤa s nasledovnĂ˝mi vlastnosĹĄami:  64 vstupnĂ˝ch kanĂˇlov, 12-miestny hexadecimĂˇlny displej, 16 indikaÄŤnĂ˝ch LED diĂłd, 2 externĂ© synchronizaÄŤnĂ© vstupy, 1 manuĂˇlny synchronizaÄŤnĂ˝ vstup, spojenie s hostiteÄľskĂ˝m poÄŤĂ­taÄŤom cez rozhranie RS232C.', 0);
INSERT INTO projects VALUES (351, 'ZP', 563, NULL, 336, '2005/2006', 'GenerĂˇtor cieÄľovĂ˝ch sĂşborov pre napaÄľovanie pamĂ¤tĂ­', 'GenerĂˇtor cieÄľovĂ˝ch sĂşborov pre napaÄľovanie pamĂ¤tĂ­', 'Navrhnite a implementujte programovĂ˝ systĂ©m na generovanie cieÄľovĂ˝ch sĂşborov pre napaÄľovanie pamĂ¤tĂ­ s nasledujĂşcimi poĹľiadavkami:  vstupnĂ˝ sĂşbor v plnom formĂˇte INTEL-HEX, podpora transformaÄŤnej tabuÄľky, moĹľnosĹĄ rozdelenia vstupnĂ©ho sĂşboru na 2, 4 a 8 vĂ˝stupnĂ˝ch sĂşborov.
', 'Navrhnite a implementujte programovĂ˝ systĂ©m na generovanie cieÄľovĂ˝ch sĂşborov pre napaÄľovanie pamĂ¤tĂ­ s nasledujĂşcimi poĹľiadavkami:  vstupnĂ˝ sĂşbor v plnom formĂˇte INTEL-HEX, podpora transformaÄŤnej tabuÄľky, moĹľnosĹĄ rozdelenia vstupnĂ©ho sĂşboru na 2, 4 a 8 vĂ˝stupnĂ˝ch sĂşborov.
', 0);
INSERT INTO projects VALUES (352, 'DP', 447, NULL, 337, '2005/2006', 'VyhÄľadĂˇvanie znalostĂ­ vo webe so sĂ©mantikou', 'Searching informations and knowledges in the Semantic Web', NULL, NULL, 1);
INSERT INTO projects VALUES (353, 'ZP', 388, NULL, 337, '2003/2004', 'OOP  pomocou prĂ­kladov', 'OOP using examples', 'Analyzujte metĂłdy tvorby a prezentĂˇcie znalostĂ­ z oblasti programovania vo forme rieĹˇenĂ˝ch prĂ­kladov s vyuĹľitĂ­m hypertextu. Analyzujte vĂ˝sledky prĂˇc vytvorenĂ˝ch v tejto oblasti v rĂˇmci ĹˇtudentskĂ˝ch projektov na KIVT v minulĂ˝ch rokoch. 
Navrhnite a implementujte softvĂ©rovĂş aplikĂˇciu, ktorĂˇ umoĹľnĂ­ tvorbu, prezentĂˇciu, pouĹľitie a ĂşdrĹľbu prĂ­ruÄŤky objektovo orientovanĂ©ho programovania vo forme rieĹˇenĂ˝ch prĂ­kladov.  
Navrhnite jednoduchĂş prĂ­ruÄŤku rieĹˇenĂ˝ch prĂ­kladov  OOP v jazyku C++.  VaĹˇe rieĹˇenie softvĂ©rovej aplikĂˇcie overte tĂ˝m, Ĺľe pomocou implementovanĂ©ho protototypu vytvorĂ­te a prezentujete navrhnutĂş prĂ­ruÄŤku.', 'Analyzujte metĂłdy tvorby a prezentĂˇcie znalostĂ­ z oblasti programovania vo forme rieĹˇenĂ˝ch prĂ­kladov s vyuĹľitĂ­m hypertextu. Analyzujte vĂ˝sledky prĂˇc vytvorenĂ˝ch v tejto oblasti v rĂˇmci ĹˇtudentskĂ˝ch projektov na KIVT v minulĂ˝ch rokoch. 
Navrhnite a implementujte softvĂ©rovĂş aplikĂˇciu, ktorĂˇ umoĹľnĂ­ tvorbu, prezentĂˇciu, pouĹľitie a ĂşdrĹľbu prĂ­ruÄŤky objektovo orientovanĂ©ho programovania vo forme rieĹˇenĂ˝ch prĂ­kladov.  
Navrhnite jednoduchĂş prĂ­ruÄŤku rieĹˇenĂ˝ch prĂ­kladov  OOP v jazyku C++.  VaĹˇe rieĹˇenie softvĂ©rovej aplikĂˇcie overte tĂ˝m, Ĺľe pomocou implementovanĂ©ho protototypu vytvorĂ­te a prezentujete navrhnutĂş prĂ­ruÄŤku.', 1);
INSERT INTO projects VALUES (354, 'ZP', 301, NULL, 338, '2005/2006', 'NĂˇvrh a implementĂˇcia systĂ©mu na grafickĂş vizualizĂˇciu vybranĂ˝ch ÄŤinnostĂ­ pamĂ¤ĹĄovĂ©ho podsystĂ©mu poÄŤĂ­taÄŤa', 'NĂˇvrh a implementĂˇcia systĂ©mu na grafickĂş vizualizĂˇciu vybranĂ˝ch ÄŤinnostĂ­ pamĂ¤ĹĄovĂ©ho podsystĂ©mu poÄŤĂ­taÄŤa', 'Navrhnite a implementujte systĂ©m, ktorĂ˝ bude s vyuĹľitĂ­m multimediĂˇlnych technolĂłgiĂ­ umoĹľĹovaĹĄ  naĹˇtudovanie, grafickĂ© zobrazenie a demonĹˇtrĂˇciu vybranĂ˝ch funkÄŤnĂ˝ch princĂ­pov a ÄŤinnostĂ­  pamĂ¤ĹĄovĂ©ho podsystĂ©mu poÄŤĂ­taÄŤa. Produkt implementujte ako hypermediĂˇlnu prezentĂˇciu vo voÄľne dostupnom webovom prehliadaÄŤi.', 'Navrhnite a implementujte systĂ©m, ktorĂ˝ bude s vyuĹľitĂ­m multimediĂˇlnych technolĂłgiĂ­ umoĹľĹovaĹĄ  naĹˇtudovanie, grafickĂ© zobrazenie a demonĹˇtrĂˇciu vybranĂ˝ch funkÄŤnĂ˝ch princĂ­pov a ÄŤinnostĂ­  pamĂ¤ĹĄovĂ©ho podsystĂ©mu poÄŤĂ­taÄŤa. Produkt implementujte ako hypermediĂˇlnu prezentĂˇciu vo voÄľne dostupnom webovom prehliadaÄŤi.', 0);
INSERT INTO projects VALUES (355, 'ZP', 431, NULL, 339, '2005/2006', 'VizualizĂˇcia VHDL opisu', 'VizualizĂˇcia VHDL opisu', 'Analyzujte problematiku vizualizĂˇcie VHDL opisu a moĹľnosti, ktorĂ© poskytujĂş dostupnĂ© nĂˇvrhovĂ© systĂ©my. Na zĂˇklade analĂ˝zy navrhnite a implementujte systĂ©m, ktorĂ˝ transformuje zadanĂ˝ VHDL opis na zodpovedajĂşci schĂ©matickĂ˝ zĂˇpis so zachovanĂ­m hierarchie pĂ´vodnĂ©ho opisu. Pri nĂˇvrhu uvaĹľujte s moĹľnosĹĄou ÄŹalĹˇieho rozĹˇĂ­renia systĂ©mu o vizualizĂˇciu simulĂˇcie VHDL opisu.', 'Analyzujte problematiku vizualizĂˇcie VHDL opisu a moĹľnosti, ktorĂ© poskytujĂş dostupnĂ© nĂˇvrhovĂ© systĂ©my. Na zĂˇklade analĂ˝zy navrhnite a implementujte systĂ©m, ktorĂ˝ transformuje zadanĂ˝ VHDL opis na zodpovedajĂşci schĂ©matickĂ˝ zĂˇpis so zachovanĂ­m hierarchie pĂ´vodnĂ©ho opisu. Pri nĂˇvrhu uvaĹľujte s moĹľnosĹĄou ÄŹalĹˇieho rozĹˇĂ­renia systĂ©mu o vizualizĂˇciu simulĂˇcie VHDL opisu.', 0);
INSERT INTO projects VALUES (356, 'ZP', 297, NULL, 340, '2005/2006', 'SimulĂˇtor toku strojovĂ˝ch inĹˇtrukciĂ­', 'SimulĂˇtor toku strojovĂ˝ch inĹˇtrukciĂ­', 'Analyzujte moĹľnosti a prostriedky na simulĂˇciu definovanej inĹˇtrukÄŤnej sady strojovĂ˝ch inĹˇtrukciĂ­. Vytvorte simulaÄŤnĂ© prostredie, v ktorom nĂˇzorne zobrazte procesy a stavy poÄŤas vykonĂˇvania inĹˇtrukcie danĂ©ho programu pre zvolenĂ˝ typ procesora.', 'Analyzujte moĹľnosti a prostriedky na simulĂˇciu definovanej inĹˇtrukÄŤnej sady strojovĂ˝ch inĹˇtrukciĂ­. Vytvorte simulaÄŤnĂ© prostredie, v ktorom nĂˇzorne zobrazte procesy a stavy poÄŤas vykonĂˇvania inĹˇtrukcie danĂ©ho programu pre zvolenĂ˝ typ procesora.', 1);
INSERT INTO projects VALUES (357, 'ZP', 541, NULL, 343, '2005/2006', 'Model pouĹľĂ­vateÄľa pre jeho identifikĂˇciu', 'Model pouĹľĂ­vateÄľa pre jeho identifikĂˇciu', 'Navrhnite metĂłdy a prostriedky pre budovanie modelu pouĹľĂ­vateÄľa na zĂˇklade jeho charakteristĂ­k sprĂˇvania sa v poÄŤĂ­taÄŤovom systĂ©me. NavrhnutĂ˝ systĂ©m implementujte vo vybranom prostredĂ­. SystĂ©m mĂˇ slĂşĹľiĹĄ na potvrdenie identifikĂˇcie pouĹľĂ­vateÄľa za ĂşÄŤelom zvĂ˝Ĺˇenia bezpeÄŤnosti prevĂˇdzky informaÄŤnĂ˝ch systĂ©mov.', 'Navrhnite metĂłdy a prostriedky pre budovanie modelu pouĹľĂ­vateÄľa na zĂˇklade jeho charakteristĂ­k sprĂˇvania sa v poÄŤĂ­taÄŤovom systĂ©me. NavrhnutĂ˝ systĂ©m implementujte vo vybranom prostredĂ­. SystĂ©m mĂˇ slĂşĹľiĹĄ na potvrdenie identifikĂˇcie pouĹľĂ­vateÄľa za ĂşÄŤelom zvĂ˝Ĺˇenia bezpeÄŤnosti prevĂˇdzky informaÄŤnĂ˝ch systĂ©mov.', 1);
INSERT INTO projects VALUES (358, 'ZP', 655, NULL, 344, '2005/2006', 'WebovĂ˝ portĂˇl pre sprĂˇvu ĹˇtudentskĂ˝ch projetkov', 'WebovĂ˝ portĂˇl pre sprĂˇvu ĹˇtudentskĂ˝ch projetkov', 'Analyzujte problematiku podpory zadĂˇvania a odovzdĂˇvania ĹˇtudentskĂ˝ch projektov na fakulte. Navrhnite a implementujte systĂ©m - webovskĂş aplikĂˇciu, ktorĂˇ by umoĹľnila pedagĂłgom zadĂˇvaĹĄ tĂ©my projektov a Ĺˇtudentom prihlasovaĹĄ sa na vypĂ­sanĂ© tĂ©my. AplikĂˇciu je moĹľnĂ© rozĹˇĂ­riĹĄ naprĂ­klad aj o zadĂˇvanie hodnotenĂ­ posudkov a pod. VytvorenĂ˝ systĂ©m naplĹte Ăşdajmi z uĹľ existujĂşcich systĂ©mov vyuĹľĂ­vanĂ˝ch na fakulte. VzhÄľadom k rozsahu projektu a aj predpokladu nasadania v reĂˇlnom prostredĂ­ vyĹľadujĂş sa znalosti uchĂˇdzaÄŤov z oblasti vĂ˝voja webovskĂ˝ch aplikĂˇciĂ­ (naprĂ­klad Postgres / PHP, JSP a pod.).', 'Analyzujte problematiku podpory zadĂˇvania a odovzdĂˇvania ĹˇtudentskĂ˝ch projektov na fakulte. Navrhnite a implementujte systĂ©m - webovskĂş aplikĂˇciu, ktorĂˇ by umoĹľnila pedagĂłgom zadĂˇvaĹĄ tĂ©my projektov a Ĺˇtudentom prihlasovaĹĄ sa na vypĂ­sanĂ© tĂ©my. AplikĂˇciu je moĹľnĂ© rozĹˇĂ­riĹĄ naprĂ­klad aj o zadĂˇvanie hodnotenĂ­ posudkov a pod. VytvorenĂ˝ systĂ©m naplĹte Ăşdajmi z uĹľ existujĂşcich systĂ©mov vyuĹľĂ­vanĂ˝ch na fakulte. VzhÄľadom k rozsahu projektu a aj predpokladu nasadania v reĂˇlnom prostredĂ­ vyĹľadujĂş sa znalosti uchĂˇdzaÄŤov z oblasti vĂ˝voja webovskĂ˝ch aplikĂˇciĂ­ (naprĂ­klad Postgres / PHP, JSP a pod.).', 1);
INSERT INTO projects VALUES (359, 'ZP', 579, NULL, 345, '2005/2006', 'SystĂ©m na podporu tvorby skĂşĹˇkovĂ˝ch rozvrhov', 'SystĂ©m na podporu tvorby skĂşĹˇkovĂ˝ch rozvrhov', 'Analyzujte ĂşdajovĂ© mnoĹľiny a postupy pri vytvĂˇranĂ­  rozvrhov skĂşĹˇok a nĂˇsledne navrhnite systĂ©m, ktorĂ˝ by tieto ÄŤinnosti podporoval. ZĂˇkladnĂ© ÄŤasti nĂˇvrhu realizujte v podobe prototypu a zaistite nevyhnutnĂş kompatibilitu s informaÄŤnĂ˝m systĂ©mom pouĹľĂ­vanĂ˝m na FIIT.
', 'Analyzujte ĂşdajovĂ© mnoĹľiny a postupy pri vytvĂˇranĂ­  rozvrhov skĂşĹˇok a nĂˇsledne navrhnite systĂ©m, ktorĂ˝ by tieto ÄŤinnosti podporoval. ZĂˇkladnĂ© ÄŤasti nĂˇvrhu realizujte v podobe prototypu a zaistite nevyhnutnĂş kompatibilitu s informaÄŤnĂ˝m systĂ©mom pouĹľĂ­vanĂ˝m na FIIT.
', 1);
INSERT INTO projects VALUES (360, 'ZP', 12, NULL, 346, '2005/2006', 'Podpora organizĂˇcie ÄŤasu', 'Podpora organizĂˇcie ÄŤasu', 'Analyzujte komunikaÄŤnĂ© protokoly a sĂşborovĂ© formĂˇty pouĹľĂ­vanĂ© na vĂ˝menu informĂˇciĂ­ medzi systĂ©mami pre organizĂˇciu ÄŤasu a plĂˇnovanie (PDA, osobnĂ© organizĂ©ry, telefĂłny, MS Exchange, a pod.). Navrhnite spĂ´sob personalizovanej distribĂşcie rozvrhov prednĂˇĹˇok a cviÄŤenĂ­ na univerzite ako ÄŤasovĂ˝ch plĂˇnov. Na zĂˇklade nĂˇvrhu implementujte internetovĂş aplikĂˇciu s pouĹľitĂ­m vhodnĂ˝ch aplikaÄŤnĂ˝ch rĂˇmcov a existujĂşcich komponentov.', 'Analyzujte komunikaÄŤnĂ© protokoly a sĂşborovĂ© formĂˇty pouĹľĂ­vanĂ© na vĂ˝menu informĂˇciĂ­ medzi systĂ©mami pre organizĂˇciu ÄŤasu a plĂˇnovanie (PDA, osobnĂ© organizĂ©ry, telefĂłny, MS Exchange, a pod.). Navrhnite spĂ´sob personalizovanej distribĂşcie rozvrhov prednĂˇĹˇok a cviÄŤenĂ­ na univerzite ako ÄŤasovĂ˝ch plĂˇnov. Na zĂˇklade nĂˇvrhu implementujte internetovĂş aplikĂˇciu s pouĹľitĂ­m vhodnĂ˝ch aplikaÄŤnĂ˝ch rĂˇmcov a existujĂşcich komponentov.', 1);
INSERT INTO projects VALUES (361, 'ZP', 98, NULL, 347, '2005/2006', 'NĂˇstroj pre vytvĂˇranie kurzov', 'NĂˇstroj pre vytvĂˇranie kurzov', 'Pri vytvĂˇranĂ­ prednĂˇĹˇok, seminĂˇrov, kurzov, workshopov atÄŹ., mĂˇ autor, resp. prednĂˇĹˇateÄľ k dispozĂ­cii informĂˇcie rĂ´znĂ˝ch typov a formĂˇtov. CieÄľom je vytvoriĹĄ prostriedok, ktorĂ˝ by podporil proces vytvĂˇrania  takĂ˝chto uÄŤebnĂ˝ch celkov. Autor by vyberal buÄŹ z databĂˇzy informĂˇciĂ­ (otĂˇzky, uÄŤebnĂ© texty, obrĂˇzky, diagramy), alebo  by mal moĹľnosĹĄ vytvĂˇraĹĄ novĂ© zĂˇkladnĂ© uÄŤebnĂ© celky.  
Spravte analĂ˝zu problematiky a na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu, ktorĂˇ bude slĂşĹľiĹĄ ako nĂˇstroj pre vytvĂˇranie kurzov.', 'Pri vytvĂˇranĂ­ prednĂˇĹˇok, seminĂˇrov, kurzov, workshopov atÄŹ., mĂˇ autor, resp. prednĂˇĹˇateÄľ k dispozĂ­cii informĂˇcie rĂ´znĂ˝ch typov a formĂˇtov. CieÄľom je vytvoriĹĄ prostriedok, ktorĂ˝ by podporil proces vytvĂˇrania  takĂ˝chto uÄŤebnĂ˝ch celkov. Autor by vyberal buÄŹ z databĂˇzy informĂˇciĂ­ (otĂˇzky, uÄŤebnĂ© texty, obrĂˇzky, diagramy), alebo  by mal moĹľnosĹĄ vytvĂˇraĹĄ novĂ© zĂˇkladnĂ© uÄŤebnĂ© celky.  
Spravte analĂ˝zu problematiky a na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu, ktorĂˇ bude slĂşĹľiĹĄ ako nĂˇstroj pre vytvĂˇranie kurzov.', 1);
INSERT INTO projects VALUES (362, 'ZP', 704, NULL, 348, '2005/2006', 'Editor zdrojovĂ˝ch programov v stave ich  zdieÄľania', 'Editor zdrojovĂ˝ch programov v stave ich  zdieÄľania', 'Analyzujte vlastnosti editorov zdrojovĂ˝ch programov  a  moĹľnosti zdieÄľania dokumentov obsahujĂşcich zdrojovĂ©  programy pri tĂ­movej prĂˇci .  Analyzujte  moĹľnosti , spĂ´soby a princĂ­py podpory tĂ­movej prĂˇce pri tvorbe takĂ˝chto dokumentov .  Navrhnite editor zdrojovĂ˝ch programov , ktorĂ˝ bude podporovaĹĄ  zvĂ˝razĹovanie syntaxe (vybranĂ©ho)  programovacieho jazyka a umoĹľnĂ­ zostavovanie celku z jednotlivĂ˝ch ÄŤastĂ­ vytvorenĂ˝ch v tĂ­me. DoporuÄŤenĂ˝ implementaÄŤnĂ˝ jazyk - jazyk Java.
 
', 'Analyzujte vlastnosti editorov zdrojovĂ˝ch programov  a  moĹľnosti zdieÄľania dokumentov obsahujĂşcich zdrojovĂ©  programy pri tĂ­movej prĂˇci .  Analyzujte  moĹľnosti , spĂ´soby a princĂ­py podpory tĂ­movej prĂˇce pri tvorbe takĂ˝chto dokumentov .  Navrhnite editor zdrojovĂ˝ch programov , ktorĂ˝ bude podporovaĹĄ  zvĂ˝razĹovanie syntaxe (vybranĂ©ho)  programovacieho jazyka a umoĹľnĂ­ zostavovanie celku z jednotlivĂ˝ch ÄŤastĂ­ vytvorenĂ˝ch v tĂ­me. DoporuÄŤenĂ˝ implementaÄŤnĂ˝ jazyk - jazyk Java.
 
', 1);
INSERT INTO projects VALUES (363, 'ZP', 35, NULL, 349, '2005/2006', 'Interpret lambda-vĂ˝razov', 'Interpret lambda-vĂ˝razov', 'VaĹˇou Ăşlohou bude naĹˇtudovaĹĄ lambda-kalkulus a vytvoriĹĄ program, ktorĂ˝ bude schopnĂ˝ interpretovaĹĄ lambda-vĂ˝razy. Z urÄŤitĂ©ho pohÄľadu mĂ´Ĺľeme lambda-kalkulus povaĹľovaĹĄ za programovacĂ­ jazyk. JednĂˇ sa o ĂşplnĂ˝ programovacĂ­ jazykâ€”umoĹľĹuje nĂˇm opĂ­saĹĄ ÄľubovoÄľnĂ˝ vĂ˝poÄŤet. JednĂˇ sa (z pohÄľadu sĂ©mantiky) o jednoduchĂ˝ programovacĂ­ jazyk. Je ho moĹľnĂ© kompletne opĂ­saĹĄ na niekoÄľko mĂˇlo stranĂˇch. VÄŹaka tejto jednoduchosti bude moĹľnĂ© pomerne Äľahko vytvoriĹĄ prĂ­sluĹˇnĂ˝ interpret schopnĂ˝ interpretovaĹĄ programy napĂ­sanĂ© v tomto jazykuâ€”lambda-vĂ˝razy. 

VĂ˝stupom tohto projektu by mal byĹĄ program schopnĂ˝ redukovaĹĄ (vyhodnotiĹĄ) ÄľubovoÄľnĂ˝ lambda-vĂ˝raz do normĂˇlnej formy (v ktorej uĹľ nie je moĹľnĂ© robiĹĄ Ĺľiadne ÄŹalĹˇie redukcie), ak zadanĂ˝ lambda-vĂ˝raz mĂˇ normĂˇlnu formu. VĂˇĹˇ program by mal vedieĹĄ zobraziĹĄ jednotlivĂ© kroky redukcie (vyhodnocovania) tak ako ten program postupoval od zadanĂ©ho lambda-vĂ˝razu aĹľ k vĂ˝sledku. TieĹľ zvĂˇĹľte uĹľitoÄŤnosĹĄ tzv. â€žsyntactic-suggarâ€ś konĹˇtrukciĂ­, ktorĂ© v urÄŤitĂ˝ch prĂ­padoch sprehÄľadĹujĂş opis dĂˇt a opis vĂ˝poÄŤtu a je ich moĹľnĂ© pouĹľĂ­vaĹĄ namiesto surovĂ˝ch lambda-vĂ˝razov. Tie, ktorĂ© uznĂˇte za uĹľitoÄŤnĂ©, zahrĹte do svojho jazyka.
', 'VaĹˇou Ăşlohou bude naĹˇtudovaĹĄ lambda-kalkulus a vytvoriĹĄ program, ktorĂ˝ bude schopnĂ˝ interpretovaĹĄ lambda-vĂ˝razy. Z urÄŤitĂ©ho pohÄľadu mĂ´Ĺľeme lambda-kalkulus povaĹľovaĹĄ za programovacĂ­ jazyk. JednĂˇ sa o ĂşplnĂ˝ programovacĂ­ jazykâ€”umoĹľĹuje nĂˇm opĂ­saĹĄ ÄľubovoÄľnĂ˝ vĂ˝poÄŤet. JednĂˇ sa (z pohÄľadu sĂ©mantiky) o jednoduchĂ˝ programovacĂ­ jazyk. Je ho moĹľnĂ© kompletne opĂ­saĹĄ na niekoÄľko mĂˇlo stranĂˇch. VÄŹaka tejto jednoduchosti bude moĹľnĂ© pomerne Äľahko vytvoriĹĄ prĂ­sluĹˇnĂ˝ interpret schopnĂ˝ interpretovaĹĄ programy napĂ­sanĂ© v tomto jazykuâ€”lambda-vĂ˝razy. 

VĂ˝stupom tohto projektu by mal byĹĄ program schopnĂ˝ redukovaĹĄ (vyhodnotiĹĄ) ÄľubovoÄľnĂ˝ lambda-vĂ˝raz do normĂˇlnej formy (v ktorej uĹľ nie je moĹľnĂ© robiĹĄ Ĺľiadne ÄŹalĹˇie redukcie), ak zadanĂ˝ lambda-vĂ˝raz mĂˇ normĂˇlnu formu. VĂˇĹˇ program by mal vedieĹĄ zobraziĹĄ jednotlivĂ© kroky redukcie (vyhodnocovania) tak ako ten program postupoval od zadanĂ©ho lambda-vĂ˝razu aĹľ k vĂ˝sledku. TieĹľ zvĂˇĹľte uĹľitoÄŤnosĹĄ tzv. â€žsyntactic-suggarâ€ś konĹˇtrukciĂ­, ktorĂ© v urÄŤitĂ˝ch prĂ­padoch sprehÄľadĹujĂş opis dĂˇt a opis vĂ˝poÄŤtu a je ich moĹľnĂ© pouĹľĂ­vaĹĄ namiesto surovĂ˝ch lambda-vĂ˝razov. Tie, ktorĂ© uznĂˇte za uĹľitoÄŤnĂ©, zahrĹte do svojho jazyka.
', 1);
INSERT INTO projects VALUES (364, 'ZP', 400, NULL, 350, '2005/2006', 'ZabezpeÄŤenie webovĂ˝ch aplikaciĂ­ pred zlomyseÄľnĂ˝mi pouĹľĂ­vateÄľmi', 'ZabezpeÄŤenie webovĂ˝ch aplikaciĂ­ pred zlomyseÄľnĂ˝mi pouĹľĂ­vateÄľmi', 'Verejne dostupnĂ© webovĂ© aplikĂˇcie sĂş sĂşstavne vystavovanĂ©
Ăştokom na ich aplikaÄŤnĂş logiku, teda pokusom zlomyseÄľnĂ˝ch pouĹľĂ­vateÄľov 
o ich skompromitovanie. Zanalyzujte moĹľnosti Ăştokov na webovĂ© aplikĂˇcie 
na vrstve HTTP a vyĹˇĹˇie (nie Ăştoky na web server a operaÄŤnĂ˝ systĂ©m). Vytvorte postup profilovania zlomyseÄľnĂ©ho pouĹľĂ­vateÄľa a navrhnite moĹľnosĹĄ vyuĹľitia takĂ©ho profilu pri detekcii prebiehajĂşcich Ăştokov.

VĂ˝stup projektu:
NĂˇvrh profilovania zlomyseÄľnĂ˝ch pouĹľĂ­vateÄľov,
NĂˇstroj na vytvĂˇranie profilov, vĂ˝stup v XML,
OdporĂşÄŤania pre nasadenie takĂ˝chto profilov v aplikĂˇcii Webrella [1] alebo inej ochrannej aplikĂˇcii.

', 'Verejne dostupnĂ© webovĂ© aplikĂˇcie sĂş sĂşstavne vystavovanĂ©
Ăştokom na ich aplikaÄŤnĂş logiku, teda pokusom zlomyseÄľnĂ˝ch pouĹľĂ­vateÄľov 
o ich skompromitovanie. Zanalyzujte moĹľnosti Ăştokov na webovĂ© aplikĂˇcie 
na vrstve HTTP a vyĹˇĹˇie (nie Ăştoky na web server a operaÄŤnĂ˝ systĂ©m). Vytvorte postup profilovania zlomyseÄľnĂ©ho pouĹľĂ­vateÄľa a navrhnite moĹľnosĹĄ vyuĹľitia takĂ©ho profilu pri detekcii prebiehajĂşcich Ăştokov.

VĂ˝stup projektu:
NĂˇvrh profilovania zlomyseÄľnĂ˝ch pouĹľĂ­vateÄľov,
NĂˇstroj na vytvĂˇranie profilov, vĂ˝stup v XML,
OdporĂşÄŤania pre nasadenie takĂ˝chto profilov v aplikĂˇcii Webrella [1] alebo inej ochrannej aplikĂˇcii.

', 1);
INSERT INTO projects VALUES (365, 'ZP', 16, NULL, 351, '2006/2007', 'ReprezentĂˇcia zmeny aspektom', 'ReprezentĂˇcia zmeny aspektom', 'Riadenie zmeny je dĂ´leĹľitou sĂşÄŤasĹĄou konfiguraÄŤnĂ©ho manaĹľmentu. Aspektovo-orientovanĂ© programovanie umoĹľĹuje modularizĂˇciu pretĂ­najĂşcich zĂˇleĹľitostĂ­, ktorĂ© predstavujĂş problĂ©m aj v objektovo-orientovanom programovanĂ­. Analyzujte moĹľnosti uplatnenia aspektovo-orientovanĂ©ho prĂ­stupu na zlepĹˇenie riadenia zmeny z hÄľadiska rĂ´znych aspektovo-orientovanĂ˝ch jazykov. PredveÄŹte ich na prĂ­kladoch.', 'Riadenie zmeny je dĂ´leĹľitou sĂşÄŤasĹĄou konfiguraÄŤnĂ©ho manaĹľmentu. Aspektovo-orientovanĂ© programovanie umoĹľĹuje modularizĂˇciu pretĂ­najĂşcich zĂˇleĹľitostĂ­, ktorĂ© predstavujĂş problĂ©m aj v objektovo-orientovanom programovanĂ­. Analyzujte moĹľnosti uplatnenia aspektovo-orientovanĂ©ho prĂ­stupu na zlepĹˇenie riadenia zmeny z hÄľadiska rĂ´znych aspektovo-orientovanĂ˝ch jazykov. PredveÄŹte ich na prĂ­kladoch.', 1);
INSERT INTO projects VALUES (366, 'ZP', 35, NULL, 352, '2005/2006', 'ExpertnĂ˝ systĂ©m', 'ExpertnĂ˝ systĂ©m', 'InformĂˇcie expertov je moĹľnĂ© nĂˇjsĹĄ v neformĂˇlnej forme v rĂ´znych, napr. HOWTO dokumentoch. TakĂˇto forma mĂˇ svoje vĂ˝hody (jeho zostavovanie nie je zvlĂˇĹˇĹĄ problematickĂ©) avĹˇak prinĂˇĹˇa so sebou aj nevĂ˝hody. NajmĂ¤ pre pouĹľĂ­vateÄľov. ÄŚĂ­tanie takĂ˝chto dokumentov je zdÄşhavĂ©.

NĂˇjdite vhodnĂş reprezentĂˇciu vedomostĂ­ z Vami vybranĂ˝ch HOWTO dokumentov. Vytvorte takĂ©ho softvĂ©rovĂ©ho experta, ktorĂ˝ bude vedieĹĄ pouĹľĂ­vateÄľovi prezentovaĹĄ ÄŤo vie, t.j. s ÄŤĂ­m vie pouĹľĂ­vateÄľovi pomĂ´cĹĄ. Ak tam nĂˇjde pouĹľĂ­vateÄľ nejakĂ© uĹľitoÄŤnĂ© vedomosti, tak mĂ´Ĺľe experta poĹľiadaĹĄ, aby vykonal prĂ­sluĹˇnĂ© akcie nevyhnutnĂ© na rozchodenie prĂ­sluĹˇnej funkcionality, ktorĂˇ ho zaujĂ­ma.', 'InformĂˇcie expertov je moĹľnĂ© nĂˇjsĹĄ v neformĂˇlnej forme v rĂ´znych, napr. HOWTO dokumentoch. TakĂˇto forma mĂˇ svoje vĂ˝hody (jeho zostavovanie nie je zvlĂˇĹˇĹĄ problematickĂ©) avĹˇak prinĂˇĹˇa so sebou aj nevĂ˝hody. NajmĂ¤ pre pouĹľĂ­vateÄľov. ÄŚĂ­tanie takĂ˝chto dokumentov je zdÄşhavĂ©.

NĂˇjdite vhodnĂş reprezentĂˇciu vedomostĂ­ z Vami vybranĂ˝ch HOWTO dokumentov. Vytvorte takĂ©ho softvĂ©rovĂ©ho experta, ktorĂ˝ bude vedieĹĄ pouĹľĂ­vateÄľovi prezentovaĹĄ ÄŤo vie, t.j. s ÄŤĂ­m vie pouĹľĂ­vateÄľovi pomĂ´cĹĄ. Ak tam nĂˇjde pouĹľĂ­vateÄľ nejakĂ© uĹľitoÄŤnĂ© vedomosti, tak mĂ´Ĺľe experta poĹľiadaĹĄ, aby vykonal prĂ­sluĹˇnĂ© akcie nevyhnutnĂ© na rozchodenie prĂ­sluĹˇnej funkcionality, ktorĂˇ ho zaujĂ­ma.', 1);
INSERT INTO projects VALUES (367, 'ZP', 260, NULL, 353, '2005/2006', 'Podpora automatizovanĂ©ho hodnotenia programov', 'Podpora automatizovanĂ©ho hodnotenia programov', 'Analyzujte problematiku automatizovanĂ©ho overovania funkÄŤnosti programov, navrhnite a vytvorte nĂˇstroj, ktorĂ˝ jednak umoĹľnĂ­ vyhodnotiĹĄ sprĂˇvnosĹĄ fungovania programu na zĂˇklade definovanĂ˝ch vstupov a k nim prislĂşchajĂşcich oÄŤakĂˇvanĂ˝ch vĂ˝stupov a tieĹľ umoĹľnĂ­ zistiĹĄ rĂ´zne kvantitatĂ­vne a kvalitatĂ­vne parametre programov. Pri rieĹˇenĂ­ sa zaoberajte aj problematikou kontrolovanĂ©ho behu programu v obmedzenom prostredĂ­ tak, aby ste zabrĂˇnili jeho moĹľnĂ˝m neĹľiadĂşcim vplyvom na ostatnĂ© ÄŤasti systĂ©mu. NĂˇstroj implementujte v operaÄŤnom systĂ©me FreeBSD alebo Linux.
V rĂˇmci projektu sa zamerajte na vytvorenie distribuovanĂ©ho prostredia na riadenie testovania a overovania vlastnostĂ­ programov.
', 'Analyzujte problematiku automatizovanĂ©ho overovania funkÄŤnosti programov, navrhnite a vytvorte nĂˇstroj, ktorĂ˝ jednak umoĹľnĂ­ vyhodnotiĹĄ sprĂˇvnosĹĄ fungovania programu na zĂˇklade definovanĂ˝ch vstupov a k nim prislĂşchajĂşcich oÄŤakĂˇvanĂ˝ch vĂ˝stupov a tieĹľ umoĹľnĂ­ zistiĹĄ rĂ´zne kvantitatĂ­vne a kvalitatĂ­vne parametre programov. Pri rieĹˇenĂ­ sa zaoberajte aj problematikou kontrolovanĂ©ho behu programu v obmedzenom prostredĂ­ tak, aby ste zabrĂˇnili jeho moĹľnĂ˝m neĹľiadĂşcim vplyvom na ostatnĂ© ÄŤasti systĂ©mu. NĂˇstroj implementujte v operaÄŤnom systĂ©me FreeBSD alebo Linux.
V rĂˇmci projektu sa zamerajte na vytvorenie distribuovanĂ©ho prostredia na riadenie testovania a overovania vlastnostĂ­ programov.
', 1);
INSERT INTO projects VALUES (368, 'ZP', 10, NULL, 354, '2005/2006', 'SimulovanĂ˝ robotickĂ˝ futbal - analĂ˝za sprĂˇvania hrĂˇÄŤov', 'SimulovanĂ˝ robotickĂ˝ futbal - analĂ˝za sprĂˇvania hrĂˇÄŤov', 'SimulovanĂ˝ robotickĂ˝ futbal sa zaoberĂˇ vytvĂˇranĂ­m tĂ­mov spolupracujĂşcich agentov, ktorĂ© v simulovanom prostredĂ­ navzĂˇjom sĂşperia. Navrhnite a implementujte nĂˇstroj na analĂ˝zu sprĂˇvania sa hrĂˇÄŤov poÄŤas hry. VytvorenĂ˝ nĂˇstroj by mal byĹĄ schopnĂ˝ rozpoznaĹĄ zĂˇkladnĂ© vzory sprĂˇvania sa (proti)hrĂˇÄŤov, ktorĂ© by mali byĹĄ pouĹľiteÄľnĂ© pri predvĂ­danĂ­ sprĂˇvania sa hrĂˇÄŤov.', 'SimulovanĂ˝ robotickĂ˝ futbal sa zaoberĂˇ vytvĂˇranĂ­m tĂ­mov spolupracujĂşcich agentov, ktorĂ© v simulovanom prostredĂ­ navzĂˇjom sĂşperia. Navrhnite a implementujte nĂˇstroj na analĂ˝zu sprĂˇvania sa hrĂˇÄŤov poÄŤas hry. VytvorenĂ˝ nĂˇstroj by mal byĹĄ schopnĂ˝ rozpoznaĹĄ zĂˇkladnĂ© vzory sprĂˇvania sa (proti)hrĂˇÄŤov, ktorĂ© by mali byĹĄ pouĹľiteÄľnĂ© pri predvĂ­danĂ­ sprĂˇvania sa hrĂˇÄŤov.', 1);
INSERT INTO projects VALUES (369, 'ZP', 299, NULL, 355, '2005/2006', 'UML diagramy v prostredĂ­ TeXu', 'UML diagramy v prostredĂ­ TeXu', 'UML je de facto priemyselnĂ˝ Ĺˇtandard pre modelovanie softvĂ©rovĂ˝ch systĂ©mov. V akademickej komunite, z ktorej veÄľkĂˇ ÄŤasĹĄ vyuĹľĂ­va prostredie TeX, sa UML rovnako bohato vyuĹľĂ­va ako jazyk pre popis a modelovanie softvĂ©ru.
Ăšlohou Ĺˇtudenta je analyzovaĹĄ moĹľnosti zachytenia diagramov zapĂ­sanĂ˝ch v UML v prostredĂ­ TeXu. CieÄľom je analyzovaĹĄ grafickĂ© moĹľnosti prostredia a navrhnĂşĹĄ rieĹˇenie pre zĂˇpis UML v TeXu, priÄŤom preferovanĂ© rieĹˇenie je vytvorenie balĂ­ka na zĂˇpis niektorĂ˝ch typov diagramov jazyka UML. Ĺ tudent by mal v prĂˇci aj predviesĹĄ moĹľnosti zvolenĂ©ho rieĹˇenia na vhodnĂ˝ch prĂ­kladoch.', 'UML je de facto priemyselnĂ˝ Ĺˇtandard pre modelovanie softvĂ©rovĂ˝ch systĂ©mov. V akademickej komunite, z ktorej veÄľkĂˇ ÄŤasĹĄ vyuĹľĂ­va prostredie TeX, sa UML rovnako bohato vyuĹľĂ­va ako jazyk pre popis a modelovanie softvĂ©ru.
Ăšlohou Ĺˇtudenta je analyzovaĹĄ moĹľnosti zachytenia diagramov zapĂ­sanĂ˝ch v UML v prostredĂ­ TeXu. CieÄľom je analyzovaĹĄ grafickĂ© moĹľnosti prostredia a navrhnĂşĹĄ rieĹˇenie pre zĂˇpis UML v TeXu, priÄŤom preferovanĂ© rieĹˇenie je vytvorenie balĂ­ka na zĂˇpis niektorĂ˝ch typov diagramov jazyka UML. Ĺ tudent by mal v prĂˇci aj predviesĹĄ moĹľnosti zvolenĂ©ho rieĹˇenia na vhodnĂ˝ch prĂ­kladoch.', 1);
INSERT INTO projects VALUES (370, 'ZP', 43, NULL, 356, '2005/2006', 'Vznik kooperĂˇcie agentov', 'Vznik kooperĂˇcie agentov', 'PouĹľite genetickĂ© programovanie na vytvorenie kognitĂ­vneho orgĂˇnu agentov, ktorĂ­ budĂş rieĹˇiĹĄ spoloÄŤnĂş Ăşlohu. Ăšloha bude navrhnutĂˇ tak, aby ju bolo moĹľnĂ© vyrieĹˇiĹĄ len skupinovo (naprĂ­klad presunutie ĹĄaĹľkĂ©ho bremena v simulovanom priestore). Agenti budĂş teda donĂştenĂ­ kooperovaĹĄ.', 'PouĹľite genetickĂ© programovanie na vytvorenie kognitĂ­vneho orgĂˇnu agentov, ktorĂ­ budĂş rieĹˇiĹĄ spoloÄŤnĂş Ăşlohu. Ăšloha bude navrhnutĂˇ tak, aby ju bolo moĹľnĂ© vyrieĹˇiĹĄ len skupinovo (naprĂ­klad presunutie ĹĄaĹľkĂ©ho bremena v simulovanom priestore). Agenti budĂş teda donĂştenĂ­ kooperovaĹĄ.', 1);
INSERT INTO projects VALUES (371, 'ZP', 294, NULL, 362, '2005/2006', 'SegmentĂˇcia obrazu v poÄŤĂ­taÄŤovom videnĂ­ ', 'SegmentĂˇcia obrazu v poÄŤĂ­taÄŤovom videnĂ­ ', 'Urobte analĂ˝zu rĂ´znych metĂłd a algoritmov segmentĂˇcie digitĂˇlneho obrazu. Implementujte pilotnĂş aplikĂˇciu segmentĂˇcie obrazu v dvoch oblastiach - segmentĂˇcia scĂ©ny s mnoho objektami ale s ostrĂ˝mi hranicami, naprĂ­klad ulica s cieÄľom rozpoznĂˇvaĹĄ ÄľudskĂ© postavy a segmentĂˇcia obrazu oblohy s objektami jednĂ©ho druhu ale s nejasnĂ˝mi hranicami a s cieÄľom klasifikĂˇcie typu oblaÄŤnosti. V prvej aplikĂˇcii pouĹľite algoritmy zaloĹľenĂ© na multifokĂˇlnom stereoobraze a v druhom experimentujte s rĂ´znymi farebnĂ˝mi modelmi.', 'Urobte analĂ˝zu rĂ´znych metĂłd a algoritmov segmentĂˇcie digitĂˇlneho obrazu. Implementujte pilotnĂş aplikĂˇciu segmentĂˇcie obrazu v dvoch oblastiach - segmentĂˇcia scĂ©ny s mnoho objektami ale s ostrĂ˝mi hranicami, naprĂ­klad ulica s cieÄľom rozpoznĂˇvaĹĄ ÄľudskĂ© postavy a segmentĂˇcia obrazu oblohy s objektami jednĂ©ho druhu ale s nejasnĂ˝mi hranicami a s cieÄľom klasifikĂˇcie typu oblaÄŤnosti. V prvej aplikĂˇcii pouĹľite algoritmy zaloĹľenĂ© na multifokĂˇlnom stereoobraze a v druhom experimentujte s rĂ´znymi farebnĂ˝mi modelmi.', 1);
INSERT INTO projects VALUES (372, 'ZP', 294, NULL, 363, '2005/2006', 'SegmentĂˇcia obrazu v poÄŤĂ­taÄŤovom videnĂ­ ', 'SegmentĂˇcia obrazu v poÄŤĂ­taÄŤovom videnĂ­ ', 'Urobte analĂ˝zu rĂ´znych metĂłd a algoritmov segmentĂˇcie digitĂˇlneho obrazu. Implementujte pilotnĂş aplikĂˇciu segmentĂˇcie obrazu v dvoch oblastiach - segmentĂˇcia scĂ©ny s mnoho objektami ale s ostrĂ˝mi hranicami, naprĂ­klad ulica s cieÄľom rozpoznĂˇvaĹĄ ÄľudskĂ© postavy a segmentĂˇcia obrazu oblohy s objektami jednĂ©ho druhu ale s nejasnĂ˝mi hranicami a s cieÄľom klasifikĂˇcie typu oblaÄŤnosti. V prvej aplikĂˇcii pouĹľite algoritmy zaloĹľenĂ© na multifokĂˇlnom stereoobraze a v druhom experimentujte s rĂ´znymi farebnĂ˝mi modelmi.', 'Urobte analĂ˝zu rĂ´znych metĂłd a algoritmov segmentĂˇcie digitĂˇlneho obrazu. Implementujte pilotnĂş aplikĂˇciu segmentĂˇcie obrazu v dvoch oblastiach - segmentĂˇcia scĂ©ny s mnoho objektami ale s ostrĂ˝mi hranicami, naprĂ­klad ulica s cieÄľom rozpoznĂˇvaĹĄ ÄľudskĂ© postavy a segmentĂˇcia obrazu oblohy s objektami jednĂ©ho druhu ale s nejasnĂ˝mi hranicami a s cieÄľom klasifikĂˇcie typu oblaÄŤnosti. V prvej aplikĂˇcii pouĹľite algoritmy zaloĹľenĂ© na multifokĂˇlnom stereoobraze a v druhom experimentujte s rĂ´znymi farebnĂ˝mi modelmi.', 1);
INSERT INTO projects VALUES (373, 'ZP', 40, NULL, 365, '2005/2006', 'Objektovo relaÄŤnĂ© mapre pre jazyk JAVA', 'Objektovo relaÄŤnĂ© mapre pre jazyk JAVA', 'NaĹˇtudujte princĂ­py a charakteristiky Objektovo-RelaÄŤnĂ˝ch maprov vo vĹˇeobecnosti. Analyzujte existujĂşce Oâ€“R mapre pre programovacĂ­ jazyk Java. NaĹˇtudujte podrobnosti pre Vami vybranĂ© O-R mapre (min. 2) pre jazyk Java. S vyuĹľitĂ­m vybranĂ˝ch O-R maprov vytvorte jednoduchĂş databĂˇzovĂş aplikĂˇciu, resp. aplikĂˇcie na spoloÄŤnom zĂˇklade. VybranĂ© mapre porovnajte s vyuĹľitĂ­m osobnĂ˝ch skĂşsenostĂ­ zĂ­skanĂ˝ch pri vytvĂˇranĂ­ aplikĂˇcie/aplikĂˇciĂ­.', 'NaĹˇtudujte princĂ­py a charakteristiky Objektovo-RelaÄŤnĂ˝ch maprov vo vĹˇeobecnosti. Analyzujte existujĂşce Oâ€“R mapre pre programovacĂ­ jazyk Java. NaĹˇtudujte podrobnosti pre Vami vybranĂ© O-R mapre (min. 2) pre jazyk Java. S vyuĹľitĂ­m vybranĂ˝ch O-R maprov vytvorte jednoduchĂş databĂˇzovĂş aplikĂˇciu, resp. aplikĂˇcie na spoloÄŤnom zĂˇklade. VybranĂ© mapre porovnajte s vyuĹľitĂ­m osobnĂ˝ch skĂşsenostĂ­ zĂ­skanĂ˝ch pri vytvĂˇranĂ­ aplikĂˇcie/aplikĂˇciĂ­.', 1);
INSERT INTO projects VALUES (374, 'ZP', 382, NULL, 366, '2005/2006', 'Ako chodiĹĄ do baru?', 'Ako chodiĹĄ do baru?', 'CieÄľom projektu je rieĹˇiĹĄ problĂ©m obmedzenej racionality na prĂ­klade nĂˇvĹˇtevy baru.
Bar  â€śEl Farolâ€ť v Santa Fe kaĹľdĂş sobotu veÄŤer uvĂˇdza Ă­rsku hudbu. Do baru sa zmestĂ­  asi 60 ÄľudĂ­, priÄŤom poÄŤet celkovĂ˝ch zĂˇujemcov je okolo 100 ÄľudĂ­. Na to, aby sa posluchĂˇÄŤi sobotĹajĹˇieho predstavenia vyhli nĂˇvalu v bare, si kaĹľdĂ˝ hÄľadĂˇ svoju stratĂ©giu (heuristiku), ako na zĂˇklade predoĹˇlĂ˝ch predstavenĂ­ odhadnĂşĹĄ nĂˇvĹˇtevnosĹĄ aktuĂˇlneho predstavenia. PosluchĂˇÄŤi medzi sebou nekomunikujĂş o tom, ÄŤi navĹˇtĂ­via, alebo nenavĹˇtĂ­via bar.
CieÄľom je vytvoriĹĄ pomocou genetickĂ©ho programovania agenta, ktorĂ˝ bude maĹĄ ÄŤo najlepĹˇie skĂłre predikcie nĂˇvĹˇtevnosti baru v prĂ­pade, Ĺľe ostatnĂ­ nĂˇvĹˇtevnĂ­ci si vytvĂˇrajĂş uÄŤiacu sa stratĂ©giu s veÄľkosĹĄou pamĂ¤ti tri nĂˇvĹˇtevy dozadu, a s tĂ˝m, Ĺľe pokiaÄľ im konkrĂ©tna sĂşÄŤasĹĄ stratĂ©gie (predpredminule preplnenĂ©, predminule prĂˇzdno, minule plno)-> choÄŹ do baru) nefunguje, s nejakou pravdepodobnosĹĄou ju prehodia na "nechoÄŹ do baru".
Literatura:
V. KvasniÄŤka, J. PospĂ­chal: Informatika pre sociĂˇlne vedy. UK Bratislava 2005.
B. Edmonds:  Gossip, Sexual Recombination and the El Farol bar: modelling the emergence of heterogeneity, Journal of Artificial Societies and Social Simulation vol. 2, no. 3, 1999, http://jasss.soc.surrey.ac.uk/2/3/2.html', 'CieÄľom projektu je rieĹˇiĹĄ problĂ©m obmedzenej racionality na prĂ­klade nĂˇvĹˇtevy baru.
Bar  â€śEl Farolâ€ť v Santa Fe kaĹľdĂş sobotu veÄŤer uvĂˇdza Ă­rsku hudbu. Do baru sa zmestĂ­  asi 60 ÄľudĂ­, priÄŤom poÄŤet celkovĂ˝ch zĂˇujemcov je okolo 100 ÄľudĂ­. Na to, aby sa posluchĂˇÄŤi sobotĹajĹˇieho predstavenia vyhli nĂˇvalu v bare, si kaĹľdĂ˝ hÄľadĂˇ svoju stratĂ©giu (heuristiku), ako na zĂˇklade predoĹˇlĂ˝ch predstavenĂ­ odhadnĂşĹĄ nĂˇvĹˇtevnosĹĄ aktuĂˇlneho predstavenia. PosluchĂˇÄŤi medzi sebou nekomunikujĂş o tom, ÄŤi navĹˇtĂ­via, alebo nenavĹˇtĂ­via bar.
CieÄľom je vytvoriĹĄ pomocou genetickĂ©ho programovania agenta, ktorĂ˝ bude maĹĄ ÄŤo najlepĹˇie skĂłre predikcie nĂˇvĹˇtevnosti baru v prĂ­pade, Ĺľe ostatnĂ­ nĂˇvĹˇtevnĂ­ci si vytvĂˇrajĂş uÄŤiacu sa stratĂ©giu s veÄľkosĹĄou pamĂ¤ti tri nĂˇvĹˇtevy dozadu, a s tĂ˝m, Ĺľe pokiaÄľ im konkrĂ©tna sĂşÄŤasĹĄ stratĂ©gie (predpredminule preplnenĂ©, predminule prĂˇzdno, minule plno)-> choÄŹ do baru) nefunguje, s nejakou pravdepodobnosĹĄou ju prehodia na "nechoÄŹ do baru".
Literatura:
V. KvasniÄŤka, J. PospĂ­chal: Informatika pre sociĂˇlne vedy. UK Bratislava 2005.
B. Edmonds:  Gossip, Sexual Recombination and the El Farol bar: modelling the emergence of heterogeneity, Journal of Artificial Societies and Social Simulation vol. 2, no. 3, 1999, http://jasss.soc.surrey.ac.uk/2/3/2.html', 1);
INSERT INTO projects VALUES (375, 'ZP', 43, NULL, 368, '2005/2006', 'PouĹľitie evoluÄŤnĂ˝ch algoritmov na rieĹˇenie astrofyzikĂˇlneho problĂ©mu', 'PouĹľitie evoluÄŤnĂ˝ch algoritmov na rieĹˇenie astrofyzikĂˇlneho problĂ©mu', 'Navrhnite a implementujte algoritmus na rieĹˇenie problĂ©mu hÄľadania pravĂ˝ch anomĂˇliĂ­ pri vĂ˝poÄŤte optimĂˇlneho prechodu medzi orbitami. PouĹľite evoluÄŤnĂ˝ prĂ­stup, ktorĂ˝ porovnajte s existujĂşcim analytickĂ˝m rieĹˇenĂ­m.
', 'Navrhnite a implementujte algoritmus na rieĹˇenie problĂ©mu hÄľadania pravĂ˝ch anomĂˇliĂ­ pri vĂ˝poÄŤte optimĂˇlneho prechodu medzi orbitami. PouĹľite evoluÄŤnĂ˝ prĂ­stup, ktorĂ˝ porovnajte s existujĂşcim analytickĂ˝m rieĹˇenĂ­m.
', 1);
INSERT INTO projects VALUES (376, 'ZP', 382, NULL, 369, '2005/2006', 'Mravci v bare', 'Mravci v bare', 'CieÄľom projektu je rieĹˇiĹĄ problĂ©m obmedzenej racionality na prĂ­klade nĂˇvĹˇtevy baru pomocou prĂ­stupu kolĂłnie mravcov.
Bar  â€śEl Farolâ€ť v Santa Fe kaĹľdĂş sobotu veÄŤer uvĂˇdza Ă­rsku hudbu. Do baru sa zmestĂ­  asi 60 ÄľudĂ­, priÄŤom poÄŤet celkovĂ˝ch zĂˇujemcov je okolo 100 ÄľudĂ­. Na to, aby sa posluchĂˇÄŤi sobotĹajĹˇieho predstavenia vyhli nĂˇvalu v bare, si kaĹľdĂ˝ hÄľadĂˇ svoju stratĂ©giu (heuristiku), ako na zĂˇklade predoĹˇlĂ˝ch predstavenĂ­ odhadnĂşĹĄ nĂˇvĹˇtevnosĹĄ aktuĂˇlneho predstavenia. PosluchĂˇÄŤi medzi sebou nekomunikujĂş o tom, ÄŤi navĹˇtĂ­via, alebo nenavĹˇtĂ­via bar.
CieÄľom je vytvoriĹĄ pomocou ant colony optimisation populĂˇciu agentov, ktorĂˇ bude maĹĄ ÄŤo najlepĹˇie skĂłre predikcie nĂˇvĹˇtevnosti baru. JednotlivĂ©
body, cez ktorĂ© sa mravci budĂş pohybovaĹĄ, budĂş tvoriĹĄ prvky stratĂ©gie (predpredminule preplnenĂ©, predminule prĂˇzdno, minule plno)-> choÄŹ do baru) .
Literatura:
V. KvasniÄŤka, J. PospĂ­chal: Informatika pre sociĂˇlne vedy. UK Bratislava 2005.
InformĂˇcie o ant colony optimalizĂˇcii na www http://iridia.ulb.ac.be/~mdorigo/ACO/publications.html
', 'CieÄľom projektu je rieĹˇiĹĄ problĂ©m obmedzenej racionality na prĂ­klade nĂˇvĹˇtevy baru pomocou prĂ­stupu kolĂłnie mravcov.
Bar  â€śEl Farolâ€ť v Santa Fe kaĹľdĂş sobotu veÄŤer uvĂˇdza Ă­rsku hudbu. Do baru sa zmestĂ­  asi 60 ÄľudĂ­, priÄŤom poÄŤet celkovĂ˝ch zĂˇujemcov je okolo 100 ÄľudĂ­. Na to, aby sa posluchĂˇÄŤi sobotĹajĹˇieho predstavenia vyhli nĂˇvalu v bare, si kaĹľdĂ˝ hÄľadĂˇ svoju stratĂ©giu (heuristiku), ako na zĂˇklade predoĹˇlĂ˝ch predstavenĂ­ odhadnĂşĹĄ nĂˇvĹˇtevnosĹĄ aktuĂˇlneho predstavenia. PosluchĂˇÄŤi medzi sebou nekomunikujĂş o tom, ÄŤi navĹˇtĂ­via, alebo nenavĹˇtĂ­via bar.
CieÄľom je vytvoriĹĄ pomocou ant colony optimisation populĂˇciu agentov, ktorĂˇ bude maĹĄ ÄŤo najlepĹˇie skĂłre predikcie nĂˇvĹˇtevnosti baru. JednotlivĂ©
body, cez ktorĂ© sa mravci budĂş pohybovaĹĄ, budĂş tvoriĹĄ prvky stratĂ©gie (predpredminule preplnenĂ©, predminule prĂˇzdno, minule plno)-> choÄŹ do baru) .
Literatura:
V. KvasniÄŤka, J. PospĂ­chal: Informatika pre sociĂˇlne vedy. UK Bratislava 2005.
InformĂˇcie o ant colony optimalizĂˇcii na www http://iridia.ulb.ac.be/~mdorigo/ACO/publications.html
', 1);
INSERT INTO projects VALUES (377, 'ZP', 35, NULL, 370, '2005/2006', 'Interpret lambda-vĂ˝razov', 'Interpret lambda-vĂ˝razov', 'VaĹˇou Ăşlohou bude naĹˇtudovaĹĄ lambda-kalkulus a vytvoriĹĄ program, ktorĂ˝ bude schopnĂ˝ interpretovaĹĄ lambda-vĂ˝razy. Z urÄŤitĂ©ho pohÄľadu mĂ´Ĺľeme lambda-kalkulus povaĹľovaĹĄ za programovacĂ­ jazyk. JednĂˇ sa o ĂşplnĂ˝ programovacĂ­ jazykâ€”umoĹľĹuje nĂˇm opĂ­saĹĄ ÄľubovoÄľnĂ˝ vĂ˝poÄŤet. JednĂˇ sa (z pohÄľadu sĂ©mantiky) o jednoduchĂ˝ programovacĂ­ jazyk. Je ho moĹľnĂ© kompletne opĂ­saĹĄ na niekoÄľko mĂˇlo stranĂˇch. VÄŹaka tejto jednoduchosti bude moĹľnĂ© pomerne Äľahko vytvoriĹĄ prĂ­sluĹˇnĂ˝ interpret schopnĂ˝ interpretovaĹĄ programy napĂ­sanĂ© v tomto jazykuâ€”lambda-vĂ˝razy. 

VĂ˝stupom tohto projektu by mal byĹĄ program schopnĂ˝ redukovaĹĄ (vyhodnotiĹĄ) ÄľubovoÄľnĂ˝ lambda-vĂ˝raz do normĂˇlnej formy (v ktorej uĹľ nie je moĹľnĂ© robiĹĄ Ĺľiadne ÄŹalĹˇie redukcie), ak zadanĂ˝ lambda-vĂ˝raz mĂˇ normĂˇlnu formu. VĂˇĹˇ program by mal vedieĹĄ zobraziĹĄ jednotlivĂ© kroky redukcie (vyhodnocovania) tak ako ten program postupoval od zadanĂ©ho lambda-vĂ˝razu aĹľ k vĂ˝sledku. TieĹľ zvĂˇĹľte uĹľitoÄŤnosĹĄ tzv. â€žsyntactic-suggarâ€ś konĹˇtrukciĂ­, ktorĂ© v urÄŤitĂ˝ch prĂ­padoch sprehÄľadĹujĂş opis dĂˇt a opis vĂ˝poÄŤtu a je ich moĹľnĂ© pouĹľĂ­vaĹĄ namiesto surovĂ˝ch lambda-vĂ˝razov. Tie, ktorĂ© uznĂˇte za uĹľitoÄŤnĂ©, zahrĹte do svojho jazyka.
', 'VaĹˇou Ăşlohou bude naĹˇtudovaĹĄ lambda-kalkulus a vytvoriĹĄ program, ktorĂ˝ bude schopnĂ˝ interpretovaĹĄ lambda-vĂ˝razy. Z urÄŤitĂ©ho pohÄľadu mĂ´Ĺľeme lambda-kalkulus povaĹľovaĹĄ za programovacĂ­ jazyk. JednĂˇ sa o ĂşplnĂ˝ programovacĂ­ jazykâ€”umoĹľĹuje nĂˇm opĂ­saĹĄ ÄľubovoÄľnĂ˝ vĂ˝poÄŤet. JednĂˇ sa (z pohÄľadu sĂ©mantiky) o jednoduchĂ˝ programovacĂ­ jazyk. Je ho moĹľnĂ© kompletne opĂ­saĹĄ na niekoÄľko mĂˇlo stranĂˇch. VÄŹaka tejto jednoduchosti bude moĹľnĂ© pomerne Äľahko vytvoriĹĄ prĂ­sluĹˇnĂ˝ interpret schopnĂ˝ interpretovaĹĄ programy napĂ­sanĂ© v tomto jazykuâ€”lambda-vĂ˝razy. 

VĂ˝stupom tohto projektu by mal byĹĄ program schopnĂ˝ redukovaĹĄ (vyhodnotiĹĄ) ÄľubovoÄľnĂ˝ lambda-vĂ˝raz do normĂˇlnej formy (v ktorej uĹľ nie je moĹľnĂ© robiĹĄ Ĺľiadne ÄŹalĹˇie redukcie), ak zadanĂ˝ lambda-vĂ˝raz mĂˇ normĂˇlnu formu. VĂˇĹˇ program by mal vedieĹĄ zobraziĹĄ jednotlivĂ© kroky redukcie (vyhodnocovania) tak ako ten program postupoval od zadanĂ©ho lambda-vĂ˝razu aĹľ k vĂ˝sledku. TieĹľ zvĂˇĹľte uĹľitoÄŤnosĹĄ tzv. â€žsyntactic-suggarâ€ś konĹˇtrukciĂ­, ktorĂ© v urÄŤitĂ˝ch prĂ­padoch sprehÄľadĹujĂş opis dĂˇt a opis vĂ˝poÄŤtu a je ich moĹľnĂ© pouĹľĂ­vaĹĄ namiesto surovĂ˝ch lambda-vĂ˝razov. Tie, ktorĂ© uznĂˇte za uĹľitoÄŤnĂ©, zahrĹte do svojho jazyka.
', 1);
INSERT INTO projects VALUES (378, 'ZP', 375, NULL, 373, '2005/2006', 'DemonĹˇtraÄŤnĂ© prĂ­klady sieĹĄovej komunikĂˇcie', 'DemonĹˇtraÄŤnĂ© prĂ­klady sieĹĄovej komunikĂˇcie', 'Analyzujte systĂ©my na podporu vĂ˝uÄŤby poÄŤĂ­taÄŤovĂ˝ch sietĂ­. Navrhnite a implementujte vybranĂ© praktickĂ© Ăşlohy - ukĂˇĹľky sieĹĄovej komunikĂˇcie v TCP/IP sieĹĄach. Pre jednotlivĂ© demonĹˇtraÄŤnĂ© Ăşlohy spracujte pouĹľĂ­vateÄľskĂ©
prĂ­ruÄŤky.  ', 'Analyzujte systĂ©my na podporu vĂ˝uÄŤby poÄŤĂ­taÄŤovĂ˝ch sietĂ­. Navrhnite a implementujte vybranĂ© praktickĂ© Ăşlohy - ukĂˇĹľky sieĹĄovej komunikĂˇcie v TCP/IP sieĹĄach. Pre jednotlivĂ© demonĹˇtraÄŤnĂ© Ăşlohy spracujte pouĹľĂ­vateÄľskĂ©
prĂ­ruÄŤky.  ', 0);
INSERT INTO projects VALUES (379, 'ZP', 270, NULL, 376, '2006/2007', 'Vytvorenie webovej aplikĂˇcie na spracovanie publikaÄŤnej ÄŤinnosti pracoviska', 'Vytvorenie webovej aplikĂˇcie na spracovanie publikaÄŤnej ÄŤinnosti pracoviska', 'SpĂ´sob spracovania informĂˇciĂ­, ktorĂ© ponĂşka sĂşÄŤasnĂ˝ web je veÄľmi vĂ˝hodnĂ˝ pre zadĂˇvanie, evidenciu, spracovanie a archivĂˇciu rĂ´znych typov Ăşdajov, ako napr. publikaÄŤnej ÄŤinnosti pracoviska. Analyzujte prĂ­stupy v sĂşÄŤasnĂ˝ch systĂ©moch pre spracovanie Ăşdajov podobnĂ©ho typu. PreskĂşmajte, ktorĂ© nĂˇstroje sĂş pre aplikĂˇcie tohoto druhu najvhodnejĹˇie. Navrhnite systĂ©m, ktorĂ˝ bude realizovaĹĄ distribuovanĂ© zadĂˇvanie publikĂˇciĂ­ do databĂˇzy pracoviska a umoĹľnĂ­ nad Ĺou realizovaĹĄ beĹľnĂ© operĂˇcie, ako je vĂ˝ber podÄľa istĂ˝ch kritĂ©riĂ­, triedenie, atÄŹ. NavrhnutĂ˝ systĂ©m implementujte a experimentĂˇlne overte na zozname publikaÄŤnej ÄŤinnosti FIIT STU.', 'SpĂ´sob spracovania informĂˇciĂ­, ktorĂ© ponĂşka sĂşÄŤasnĂ˝ web je veÄľmi vĂ˝hodnĂ˝ pre zadĂˇvanie, evidenciu, spracovanie a archivĂˇciu rĂ´znych typov Ăşdajov, ako napr. publikaÄŤnej ÄŤinnosti pracoviska. Analyzujte prĂ­stupy v sĂşÄŤasnĂ˝ch systĂ©moch pre spracovanie Ăşdajov podobnĂ©ho typu. PreskĂşmajte, ktorĂ© nĂˇstroje sĂş pre aplikĂˇcie tohoto druhu najvhodnejĹˇie. Navrhnite systĂ©m, ktorĂ˝ bude realizovaĹĄ distribuovanĂ© zadĂˇvanie publikĂˇciĂ­ do databĂˇzy pracoviska a umoĹľnĂ­ nad Ĺou realizovaĹĄ beĹľnĂ© operĂˇcie, ako je vĂ˝ber podÄľa istĂ˝ch kritĂ©riĂ­, triedenie, atÄŹ. NavrhnutĂ˝ systĂ©m implementujte a experimentĂˇlne overte na zozname publikaÄŤnej ÄŤinnosti FIIT STU.', 1);
INSERT INTO projects VALUES (380, 'ZP', 298, NULL, 377, '2005/2006', 'GenerĂˇtor konfigurĂˇciĂ­ pre Cisco smerovaÄŤe', 'GenerĂˇtor konfigurĂˇciĂ­ pre Cisco smerovaÄŤe', 'Analyzujte syntax prĂ­kazov pre konfigurĂˇciu Cisco smerovaÄŤov (IOS). Navrhnite a implementujte programovĂ˝ systĂ©m, generujĂşci takĂşto konfigurĂˇciu z neformĂˇlneho opisu vyĹľadovanĂ©ho sprĂˇvania sa smerovaÄŤa. VstupnĂˇ ĹˇpecifikĂˇcia bude napr. v tvare obrĂˇzku, definujĂşcom vzĹĄahy a vlastnosti jednotlivĂ˝ch prepojenĂ˝ch smerovaÄŤov. VĂ˝stupnĂ˝ sĂşbor bude obsahovaĹĄ konfiguraÄŤnĂ© prĂ­kazy podobne, ako sĂş uvedenĂ© na konzole smerovaÄŤa pri vĂ˝pise konfigurĂˇcie (prĂ­kaz sh run). ', 'Analyzujte syntax prĂ­kazov pre konfigurĂˇciu Cisco smerovaÄŤov (IOS). Navrhnite a implementujte programovĂ˝ systĂ©m, generujĂşci takĂşto konfigurĂˇciu z neformĂˇlneho opisu vyĹľadovanĂ©ho sprĂˇvania sa smerovaÄŤa. VstupnĂˇ ĹˇpecifikĂˇcia bude napr. v tvare obrĂˇzku, definujĂşcom vzĹĄahy a vlastnosti jednotlivĂ˝ch prepojenĂ˝ch smerovaÄŤov. VĂ˝stupnĂ˝ sĂşbor bude obsahovaĹĄ konfiguraÄŤnĂ© prĂ­kazy podobne, ako sĂş uvedenĂ© na konzole smerovaÄŤa pri vĂ˝pise konfigurĂˇcie (prĂ­kaz sh run). ', 0);
INSERT INTO projects VALUES (381, 'ZP', 396, 358, 384, '2004/2005', 'Ĺ ifrĂˇtor na bĂˇze kvantovej kryptografie', 'Cipher device based on quantum cryptography.', 'Analyzujte moĹľnosti praktickej realizĂˇcie zĂ­skania nĂˇhodnej postupnosti bitov technikou kvantovej kryptografie vzhÄľadom na technickĂ© vybavenie na FEI STU. Navrhnite technickĂş realizĂˇciu takĂ©hoto zariadenia a implementujte jeho softvĂ©rovĂş simulĂˇciu. FunkÄŤnosĹĄ zariadenia overte simulĂˇciou.', 'Analyzujte moĹľnosti praktickej realizĂˇcie zĂ­skania nĂˇhodnej postupnosti bitov technikou kvantovej kryptografie vzhÄľadom na technickĂ© vybavenie na FEI STU. Navrhnite technickĂş realizĂˇciu takĂ©hoto zariadenia a implementujte jeho softvĂ©rovĂş simulĂˇciu. FunkÄŤnosĹĄ zariadenia overte simulĂˇciou.', 1);
INSERT INTO projects VALUES (382, 'ZP', 20, NULL, 395, '2002/2003', 'TrĂ©novanie rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­ algoritmom spĂ¤tnĂ©ho ĹˇĂ­renia v ÄŤase (BPTT â€“ Backpropagation Through Time)', 'Training recurrent neural networks using error backpropagation through time', NULL, NULL, 1);
INSERT INTO projects VALUES (383, 'DP', 20, NULL, 395, '2003/2004', 'TrĂ©novanie neurĂłnovĂ˝ch sietĂ­ pomocou duĂˇlnych KalmanovĂ˝ch filtrov', 'Training of neural networks using dual Kalman filters', NULL, NULL, 1);
INSERT INTO projects VALUES (384, 'DP', 419, NULL, 402, '2004/2005', 'Bohusov projekt', 'Bohusov projekt', NULL, NULL, 1);
INSERT INTO projects VALUES (385, 'ZP', 517, NULL, 405, '2003/2004', 'SimulĂˇtor abstraktnĂ©ho poÄŤĂ­taÄŤa RAM', 'Random Access Machine Simulator', 'Analyzujte, navrhnite a implemetnujte simulĂˇtor abstraktnĂ©ho poÄŤĂ­taÄŤa Random Access Machine (RAM). Postupujte tak, ako pri vytvĂˇranĂ­ kompilĂˇtora pre nejakĂ˝ programovacĂ­ jazyk. VytvorenĂ˝ simulĂˇtor overte', 'Analyzujte, navrhnite a implemetnujte simulĂˇtor abstraktnĂ©ho poÄŤĂ­taÄŤa Random Access Machine (RAM). Postupujte tak, ako pri vytvĂˇranĂ­ kompilĂˇtora pre nejakĂ˝ programovacĂ­ jazyk. VytvorenĂ˝ simulĂˇtor overte', 1);
INSERT INTO projects VALUES (386, 'DP', 690, NULL, 405, '2005/2006', 'Internet ako sieĹĄ malĂ©ho sveta', 'Internet ako sieĹĄ malĂ©ho sveta', NULL, NULL, 1);
INSERT INTO projects VALUES (387, 'DP', 10, NULL, 406, '2004/2005', 'SimulovanĂ˝ robotickĂ˝ futbal - automatizovanĂ© uÄŤenie', 'SimulovanĂ˝ robotickĂ˝ futbal - automatizovanĂ© uÄŤenie', NULL, NULL, 1);
INSERT INTO projects VALUES (388, 'ZP', 342, NULL, 407, '2004/2005', 'Prostriedky pre podporu vĂ˝uÄŤby predmetu ASP.', 'Prostriedky pre podporu vĂ˝uÄŤby predmetu ASP.', 'Analyzujte moĹľnosti technickĂ˝ch a programovĂ˝ch prostriedkov pre podporu vyuÄŤovania predmetu Assemblery  a systĂ©movĂ© programovanie. Navrhnite vhodnĂş zostavu technickĂ˝ch a programovĂ˝ch prostriedkov pouĹľiteÄľnĂ˝ch pre podporu vĂ˝uÄŤby ASP v aplikĂˇcii s poÄŤĂ­taÄŤom typu PC. Zrealizujte vybranĂş ÄŤasĹĄ prototypu navrhnutĂ˝ch technickĂ˝ch a programovĂ˝ch prostriedkov.', 'Analyzujte moĹľnosti technickĂ˝ch a programovĂ˝ch prostriedkov pre podporu vyuÄŤovania predmetu Assemblery  a systĂ©movĂ© programovanie. Navrhnite vhodnĂş zostavu technickĂ˝ch a programovĂ˝ch prostriedkov pouĹľiteÄľnĂ˝ch pre podporu vĂ˝uÄŤby ASP v aplikĂˇcii s poÄŤĂ­taÄŤom typu PC. Zrealizujte vybranĂş ÄŤasĹĄ prototypu navrhnutĂ˝ch technickĂ˝ch a programovĂ˝ch prostriedkov.', 0);
INSERT INTO projects VALUES (389, 'ZP', 294, NULL, 408, '2003/2004', 'AplikĂˇcia obohatenej skutoÄŤnosti pri virtuĂˇlnych prehliadkach architektĂşry', 'Augmented Reality Aplication in Virtual Presentations of Architecture', 'Urobte reĹˇerĹˇ, vĂ˝ber a analĂ˝zu moĹľnostĂ­ aplikĂˇcie programovĂ©ho systĂ©mu AR Toolkit  (zdrojovĂ˝ kĂłd, projekt a  existujĂşca beĹľiaca verzia v prostredĂ­ MS Visual C a OpenGl bude k dispozĂ­cii) pre virtuĂˇlnu prhliadku   architektonickĂ˝ch pamiatok. Implementujte jednoduchĂş aplikĂˇciu tohto nĂˇstroja v spojenĂ­ s VRML na vybranĂş   ÄŤasĹĄ starej Bratislavy (podklady budĂş k dispozĂ­cii).', 'Urobte reĹˇerĹˇ, vĂ˝ber a analĂ˝zu moĹľnostĂ­ aplikĂˇcie programovĂ©ho systĂ©mu AR Toolkit  (zdrojovĂ˝ kĂłd, projekt a  existujĂşca beĹľiaca verzia v prostredĂ­ MS Visual C a OpenGl bude k dispozĂ­cii) pre virtuĂˇlnu prhliadku   architektonickĂ˝ch pamiatok. Implementujte jednoduchĂş aplikĂˇciu tohto nĂˇstroja v spojenĂ­ s VRML na vybranĂş   ÄŤasĹĄ starej Bratislavy (podklady budĂş k dispozĂ­cii).', 1);
INSERT INTO projects VALUES (390, 'DP', 27, NULL, 408, '2004/2005', 'TlaÄŤenĂ© dokumenty s virtuĂˇlnymi ilustrĂˇciami', 'TlaÄŤenĂ© dokumenty s virtuĂˇlnymi ilustrĂˇciami', NULL, NULL, 1);
INSERT INTO projects VALUES (391, 'DP', 579, NULL, 410, '2003/2004', 'DiĹˇtanÄŤnĂ© vzdelĂˇvania a virtuĂˇlna univerzita â€“ testovanie vedomostĂ­', 'DiĹˇtanÄŤnĂ© vzdelĂˇvania a virtuĂˇlna univerzita â€“ testovanie vedomostĂ­', NULL, NULL, 1);
INSERT INTO projects VALUES (392, 'DP', 412, NULL, 411, '2004/2005', 'MoĹľnosti ochrany prĂ­stupu do informaÄŤno-komunikaÄŤnej infraĹˇtruktĂşry Slovenskej technickej univerzity', 'Possibilities of protection of access to informational-communicational infrastructure of Slovak University of Technology', NULL, NULL, 0);
INSERT INTO projects VALUES (393, 'ZP', 660, NULL, 413, '2004/2005', 'AdaptĂ­vny web a vĂ˝uÄŤba programovania', 'Adaptive hypermedia and courses of programming', 'Pre vzdelĂˇvanie je veÄľmi vĂ˝hodnĂ© vyuĹľiĹĄ ako prezentaÄŤnĂ© mĂ©dium Internet (resp. web) najmĂ¤ vÄŹaka jeho dostupnosti. Aby sme dosiahli ÄŤo najvyĹˇĹˇiu efektĂ­vnosĹĄ uÄŤenia prostrednĂ­ctvom Internetu, je dĂ´leĹľtĂ©, aby sa vĂ˝uÄŤbovĂ˝ systĂ©m dokĂˇzal prispĂ´sobovaĹĄ jednotlivĂ˝m Ĺˇtudentom, resp. skupinĂˇm Ĺˇtudentov. SkĂşmajte vlastnosti adaptĂ­vnych systĂ©mov pre vzdelĂˇvanie, ktorĂ© ako prezentaÄŤnĂ© mĂ©dium vyuĹľĂ­vajĂş Internet (resp. web). VyhodnoĹĄte vyuĹľitie existujĂşceho otvorenĂ©ho systĂ©mu AHA! vydanĂ©ho pod licenciou GNU Public License 2.0 pre vĂ˝uÄŤbu programovania (systĂ©m AHA! je vyvinutĂ˝ modernĂ˝mi technolĂłgiami â€“ Java SDK 1.4, Tomcat web server, XML a ÄŹalĹˇie a je dostupnĂ˝ na adrese http://aha.win.tue.nl). Navrhnite domĂ©novĂ˝ model pre oblasĹĄ programovania a tieĹľ model pouĹľĂ­vateÄľa tak, aby sa systĂ©m dal vyuĹľiĹĄ v predmetoch, kde sa vyuÄŤujĂş zĂˇklady programovania (napr. AlgoritmizĂˇcia a programovanie, FunkcionĂˇlne a logickĂ© programovanie). NavrhnutĂ© rieĹˇenie experimentĂˇlne overte.
', 'Pre vzdelĂˇvanie je veÄľmi vĂ˝hodnĂ© vyuĹľiĹĄ ako prezentaÄŤnĂ© mĂ©dium Internet (resp. web) najmĂ¤ vÄŹaka jeho dostupnosti. Aby sme dosiahli ÄŤo najvyĹˇĹˇiu efektĂ­vnosĹĄ uÄŤenia prostrednĂ­ctvom Internetu, je dĂ´leĹľtĂ©, aby sa vĂ˝uÄŤbovĂ˝ systĂ©m dokĂˇzal prispĂ´sobovaĹĄ jednotlivĂ˝m Ĺˇtudentom, resp. skupinĂˇm Ĺˇtudentov. SkĂşmajte vlastnosti adaptĂ­vnych systĂ©mov pre vzdelĂˇvanie, ktorĂ© ako prezentaÄŤnĂ© mĂ©dium vyuĹľĂ­vajĂş Internet (resp. web). VyhodnoĹĄte vyuĹľitie existujĂşceho otvorenĂ©ho systĂ©mu AHA! vydanĂ©ho pod licenciou GNU Public License 2.0 pre vĂ˝uÄŤbu programovania (systĂ©m AHA! je vyvinutĂ˝ modernĂ˝mi technolĂłgiami â€“ Java SDK 1.4, Tomcat web server, XML a ÄŹalĹˇie a je dostupnĂ˝ na adrese http://aha.win.tue.nl). Navrhnite domĂ©novĂ˝ model pre oblasĹĄ programovania a tieĹľ model pouĹľĂ­vateÄľa tak, aby sa systĂ©m dal vyuĹľiĹĄ v predmetoch, kde sa vyuÄŤujĂş zĂˇklady programovania (napr. AlgoritmizĂˇcia a programovanie, FunkcionĂˇlne a logickĂ© programovanie). NavrhnutĂ© rieĹˇenie experimentĂˇlne overte.
', 1);
INSERT INTO projects VALUES (394, 'DP', 437, NULL, 413, '2005/2006', 'OdhaÄľovanie webovĂ˝ch strĂˇnok so zaujĂ­mavou informĂˇciou vo webe s vĂ˝znamom', 'OdhaÄľovanie webovĂ˝ch strĂˇnok so zaujĂ­mavou informĂˇciou vo webe s vĂ˝znamom', NULL, NULL, 4);
INSERT INTO projects VALUES (395, 'ZP', 98, NULL, 414, '2002/2003', 'Jazyk PERL', 'PERL Programming Language', NULL, NULL, 1);
INSERT INTO projects VALUES (396, 'DP', 704, NULL, 414, '2003/2004', 'DiskusnĂ© fĂłrum pre systĂ©m VirtuĂˇlnej univerzity', 'Discussion forum for system of Virtual University', NULL, NULL, 1);
INSERT INTO projects VALUES (397, 'DP', 299, NULL, 415, '2005/2006', 'Jazyk ako nĂˇstroj ĹˇpecifikĂˇcie ', 'Jazyk ako nĂˇstroj ĹˇpecifikĂˇcie ', NULL, NULL, 1);
INSERT INTO projects VALUES (398, 'ZP', 655, NULL, 415, '2003/2004', 'GenerĂˇtor symbolickĂ˝ch postupnostĂ­ pre neurĂłnovĂ© siete', 'Symbol sequence generator for neural networks', 'Pri trĂ©novanĂ­ a testovanĂ­ rekurentnĂ˝ch sietĂ­ vznika potreba spracĂşvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou, ako sĂş naprĂ­klad ÄŤasovĂ© postupnosti symbolov.  Na ich generovanie sa pouĹľĂ­vajĂş formalizmy slĂşĹľiace na opis jednotlivĂ˝ch tried gramatĂ­k (regulĂˇrne, bezkontextovĂ©, kontextovĂ© gramatiky), ktorĂ© sĂş rozĹˇĂ­renĂ© naprĂ­klad o pravdepodobnosti aplikovania odvodzovacĂ­ch pravidiel.
Navrhnite a vytvorte nĂˇstroj, ktorĂ˝ by umoĹľnil definovanie abecedy a gramatickĂ˝ch pravidiel s pravdepodobnosĹĄami pre generovanie symbolickĂ˝ch postupnostĂ­. SĂşÄŤasĹĄou nĂˇstroja by mala byĹĄ aj ĹˇtatistickĂˇ analĂ˝za vytvorenej postupnosti, t.j. naprĂ­klad urÄŤenie entropie danĂ©ho generĂˇtora s ohÄľadom na predikciu nasledujĂşceho symbolu, stanovenie prechodovĂ˝ch pravdepodobnostĂ­ po danej sekvencii symbolov a pod. VytvorenĂ© rieĹˇenie overte na vami navrhnutĂ˝ch a vytvorenĂ˝ch postupnostiach.', 'Pri trĂ©novanĂ­ a testovanĂ­ rekurentnĂ˝ch sietĂ­ vznika potreba spracĂşvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou, ako sĂş naprĂ­klad ÄŤasovĂ© postupnosti symbolov.  Na ich generovanie sa pouĹľĂ­vajĂş formalizmy slĂşĹľiace na opis jednotlivĂ˝ch tried gramatĂ­k (regulĂˇrne, bezkontextovĂ©, kontextovĂ© gramatiky), ktorĂ© sĂş rozĹˇĂ­renĂ© naprĂ­klad o pravdepodobnosti aplikovania odvodzovacĂ­ch pravidiel.
Navrhnite a vytvorte nĂˇstroj, ktorĂ˝ by umoĹľnil definovanie abecedy a gramatickĂ˝ch pravidiel s pravdepodobnosĹĄami pre generovanie symbolickĂ˝ch postupnostĂ­. SĂşÄŤasĹĄou nĂˇstroja by mala byĹĄ aj ĹˇtatistickĂˇ analĂ˝za vytvorenej postupnosti, t.j. naprĂ­klad urÄŤenie entropie danĂ©ho generĂˇtora s ohÄľadom na predikciu nasledujĂşceho symbolu, stanovenie prechodovĂ˝ch pravdepodobnostĂ­ po danej sekvencii symbolov a pod. VytvorenĂ© rieĹˇenie overte na vami navrhnutĂ˝ch a vytvorenĂ˝ch postupnostiach.', 1);
INSERT INTO projects VALUES (399, 'DP', 298, NULL, 416, '2005/2006', 'Podpora diĹˇtanÄŤnĂ©ho vzdelĂˇvania na regionĂˇlnej Cisco akadĂ©mii', 'Podpora diĹˇtanÄŤnĂ©ho vzdelĂˇvania na regionĂˇlnej Cisco akadĂ©mii', NULL, NULL, 0);
INSERT INTO projects VALUES (400, 'ZP', 98, NULL, 416, '2003/2004', 'SystĂ©m pre odovzdĂˇvanie ĹˇtudentskĂ˝ch prĂˇc prostrednĂ­ctvom Internetu', 'System for dispatching of student works through Internet', 'Analyzujte problematiku zberu a vyhodnocovania informĂˇciĂ­. Analyzujte moĹľnosti implementaÄŤnĂ˝ch prostriedkov vhodnĂ˝ch pre takĂ©to typy aplikĂˇciĂ­. PosĂşÄŹte moĹľnosti PHP a jeho vĂ˝vojovĂ©ho a ladiaceho prostredia ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇciĂ­. Na zĂˇklade analĂ˝zy problĂ©mu navrhnite a vytvorte aplikĂˇciu vhodnĂş pre systĂ©m odovzdĂˇvania prĂˇc prostrednĂ­ctvom internetu.', 'Analyzujte problematiku zberu a vyhodnocovania informĂˇciĂ­. Analyzujte moĹľnosti implementaÄŤnĂ˝ch prostriedkov vhodnĂ˝ch pre takĂ©to typy aplikĂˇciĂ­. PosĂşÄŹte moĹľnosti PHP a jeho vĂ˝vojovĂ©ho a ladiaceho prostredia ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇciĂ­. Na zĂˇklade analĂ˝zy problĂ©mu navrhnite a vytvorte aplikĂˇciu vhodnĂş pre systĂ©m odovzdĂˇvania prĂˇc prostrednĂ­ctvom internetu.', 1);
INSERT INTO projects VALUES (401, 'ZP', 357, NULL, 418, '2005/2006', 'Podpora vĂ˝uÄŤby PoÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Podpora vĂ˝uÄŤby PoÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Analyzujte sĂşÄŤasnĂ© metĂłdy vĂ˝uÄŤby predmetu PoÄŤĂ­taÄŤovĂ© siete na poprednĂ˝ch svetovĂ˝ch univerzitĂˇch.
Navrhnite a spracujte materiĂˇl pre podporu teĂłrie a praktickĂ˝ch cviÄŤenĂ­ s
dĂ´razom na praktickĂ© cviÄŤenia.
SĂşÄŤasĹĄou prĂˇce je aj spĂ´sob overenia praktickĂ˝ch cviÄŤenĂ­, napr.
debugy/konfigy a pod.', 'Analyzujte sĂşÄŤasnĂ© metĂłdy vĂ˝uÄŤby predmetu PoÄŤĂ­taÄŤovĂ© siete na poprednĂ˝ch svetovĂ˝ch univerzitĂˇch.
Navrhnite a spracujte materiĂˇl pre podporu teĂłrie a praktickĂ˝ch cviÄŤenĂ­ s
dĂ´razom na praktickĂ© cviÄŤenia.
SĂşÄŤasĹĄou prĂˇce je aj spĂ´sob overenia praktickĂ˝ch cviÄŤenĂ­, napr.
debugy/konfigy a pod.', 0);
INSERT INTO projects VALUES (402, 'ZP', 579, NULL, 420, '2006/2007', 'SystĂ©m pre sprĂˇvu webovĂ˝ch strĂˇnok - administrĂˇtor', 'SystĂ©m pre sprĂˇvu webovĂ˝ch strĂˇnok - administrĂˇtor', 'CieÄľom projektu je vytvorenie prostredia, ktorĂ© umoĹľnĂ­ spravovanie webovĂ˝ch strĂˇnok. Analyzujte existujĂşce systĂ©my podobnĂ©ho charakteru z pohÄľadu administĂˇtora a vlastnostĂ­ prostredia, v ktorom bude vytvĂˇranĂ˝ systĂ©m.  Navrhnite ĹˇtruktĂşru pouĹľitej databĂˇzy, ĹˇtruktĂşru obrazoviek pre administrĂˇtora, grafickĂ© prvky a ĹˇtĂ˝ly. NĂˇsledne implementujte kÄľĂşÄŤovĂ© ÄŤasti systĂ©mu a pouĹľiteÄľnosĹĄ overte na vybranej mnoĹľine strĂˇnok pouĹľĂ­vanĂ˝ch v pedagogike FIIT', 'CieÄľom projektu je vytvorenie prostredia, ktorĂ© umoĹľnĂ­ spravovanie webovĂ˝ch strĂˇnok. Analyzujte existujĂşce systĂ©my podobnĂ©ho charakteru z pohÄľadu administĂˇtora a vlastnostĂ­ prostredia, v ktorom bude vytvĂˇranĂ˝ systĂ©m.  Navrhnite ĹˇtruktĂşru pouĹľitej databĂˇzy, ĹˇtruktĂşru obrazoviek pre administrĂˇtora, grafickĂ© prvky a ĹˇtĂ˝ly. NĂˇsledne implementujte kÄľĂşÄŤovĂ© ÄŤasti systĂ©mu a pouĹľiteÄľnosĹĄ overte na vybranej mnoĹľine strĂˇnok pouĹľĂ­vanĂ˝ch v pedagogike FIIT', 1);
INSERT INTO projects VALUES (403, 'DP', 250, NULL, 421, '2004/2005', 'SprĂˇvanie sa finanÄŤnĂ©ho trhu vzhÄľadom na neoÄŤakĂˇvanĂ© zmeny', 'PATTERN OF FINANCIAL MARKET CONSIDERING UNEXPECTED FLUCTION', NULL, NULL, 3);
INSERT INTO projects VALUES (404, 'ZP', 297, NULL, 423, '2005/2006', 'SimulĂˇtor toku strojovĂ˝ch inĹˇtrukciĂ­ v sieti Internet', 'SimulĂˇtor toku strojovĂ˝ch inĹˇtrukciĂ­ v sieti Internet', 'Analyzujte moĹľnosti a prostriedky na simulĂˇciu definovanej inĹˇtrukÄŤnej sady strojovĂ˝ch inĹˇtrukciĂ­. Vytvorte simulaÄŤnĂ© prostredie, v ktorom nĂˇzorne zobrazte procesy a stavy poÄŤas vykonĂˇvania inĹˇtrukcie danĂ©ho programu pre zvolenĂ˝ typ procesora. SimulĂˇtor  pripravte na prezentĂˇciu vo forme web aplikĂˇcie.
', 'Analyzujte moĹľnosti a prostriedky na simulĂˇciu definovanej inĹˇtrukÄŤnej sady strojovĂ˝ch inĹˇtrukciĂ­. Vytvorte simulaÄŤnĂ© prostredie, v ktorom nĂˇzorne zobrazte procesy a stavy poÄŤas vykonĂˇvania inĹˇtrukcie danĂ©ho programu pre zvolenĂ˝ typ procesora. SimulĂˇtor  pripravte na prezentĂˇciu vo forme web aplikĂˇcie.
', 1);
INSERT INTO projects VALUES (405, 'ZP', 294, NULL, 424, '2003/2004', 'Prostredie pre vnorenĂş virtuĂˇlnu realitu CAVE', 'Prostredie pre vnorenĂş virtuĂˇlnu realitu CAVE', 'Urobte prehÄľad existujĂşcich rieĹˇenĂ­ prostredia pre vnorenĂş virtuĂˇlnu realitu typu CAVE (zadnĂˇ projekcia syntetickĂ©ho obrazu na jednu aĹľ ĹˇesĹĄ stien). Realizujte zjednoduĹˇenĂ˝ funkÄŤnĂ˝ model takĂ©hoto prostredia s pouĹľitĂ­m grafickĂ˝ch API ako aj VRML, ktorĂ˝ by slĂşĹľil pre pedagogickĂ© ĂşÄŤely ako aj na zĂˇkladnĂ© experimentovanie ako demonĹˇtrĂˇcie moĹľnostĂ­ aplikĂˇciĂ­ takĂ©hoto prostredia. DemonĹˇtrujte funkciu modelu na jednoduchej scĂ©ne naprogramovanej pomocou API OpenGl, Open Inventor alebo VRML ', 'Urobte prehÄľad existujĂşcich rieĹˇenĂ­ prostredia pre vnorenĂş virtuĂˇlnu realitu typu CAVE (zadnĂˇ projekcia syntetickĂ©ho obrazu na jednu aĹľ ĹˇesĹĄ stien). Realizujte zjednoduĹˇenĂ˝ funkÄŤnĂ˝ model takĂ©hoto prostredia s pouĹľitĂ­m grafickĂ˝ch API ako aj VRML, ktorĂ˝ by slĂşĹľil pre pedagogickĂ© ĂşÄŤely ako aj na zĂˇkladnĂ© experimentovanie ako demonĹˇtrĂˇcie moĹľnostĂ­ aplikĂˇciĂ­ takĂ©hoto prostredia. DemonĹˇtrujte funkciu modelu na jednoduchej scĂ©ne naprogramovanej pomocou API OpenGl, Open Inventor alebo VRML ', 1);
INSERT INTO projects VALUES (406, 'DP', 579, NULL, 424, '2005/2006', 'VyuĹľitie znalostĂ­ v tvorbe plĂˇnov (rozvrhov)', 'Application of knowledge in timetabling / scheduling', NULL, NULL, 1);
INSERT INTO projects VALUES (407, 'DP', 359, NULL, 425, '2004/2005', 'ProgramovĂˇ podpora simulĂˇcie vybranĂ˝ch meranĂ­ na elektrickĂ˝ch strojoch', 'ProgramovĂˇ podpora simulĂˇcie vybranĂ˝ch meranĂ­ na elektrickĂ˝ch strojoch', NULL, NULL, 0);
INSERT INTO projects VALUES (408, 'DP', 260, NULL, 426, '2005/2006', 'AutentifikaÄŤnĂ© centrum biometrickĂ˝ch Ăşdajov', 'Authentication centre of biometric data', NULL, NULL, 1);
INSERT INTO projects VALUES (409, 'ZP', 98, NULL, 426, '2003/2004', 'SystĂ©m pre odovzdĂˇvanie ĹˇtudentskĂ˝ch prĂˇc prostrednĂ­ctvom Internetu', 'System for managing student works via Internet', 'Analyzujte problematiku zberu a vyhodnocovania informĂˇciĂ­. Analyzujte moĹľnosti implementaÄŤnĂ˝ch prostriedkov vhodnĂ˝ch pre takĂ©to typy aplikĂˇciĂ­. PosĂşÄŹte moĹľnosti Perlu a jeho vĂ˝vojovĂ©ho a ladiaceho prostredia ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇciĂ­. Na zĂˇklade analĂ˝zy problĂ©mu navrhnite a vytvorte aplikĂˇciu vhodnĂş pre systĂ©m odovzdĂˇvania prĂˇc prostrednĂ­ctvom internetu', 'Analyzujte problematiku zberu a vyhodnocovania informĂˇciĂ­. Analyzujte moĹľnosti implementaÄŤnĂ˝ch prostriedkov vhodnĂ˝ch pre takĂ©to typy aplikĂˇciĂ­. PosĂşÄŹte moĹľnosti Perlu a jeho vĂ˝vojovĂ©ho a ladiaceho prostredia ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇciĂ­. Na zĂˇklade analĂ˝zy problĂ©mu navrhnite a vytvorte aplikĂˇciu vhodnĂş pre systĂ©m odovzdĂˇvania prĂˇc prostrednĂ­ctvom internetu', 1);
INSERT INTO projects VALUES (410, 'DP', 672, NULL, 427, '2004/2005', 'Jazyk ako sieĹĄ malĂ©ho sveta', 'Jazyk ako sieĹĄ malĂ©ho sveta', NULL, NULL, 1);
INSERT INTO projects VALUES (411, 'ZP', 297, NULL, 428, '2003/2004', 'VyuÄŤovanie v sieti Internet', 'Learning in the Internet Environment', 'Analyzujte novĂ© smery v oblasti vĂ˝uÄŤby a vzdelĂˇvania ako dĂ´sledok novĂ˝ch informaÄŤnĂ˝ch technolĂłgiĂ­. Zamerajte sa na e-learning paradigmu. Ĺ pecifikujte model systĂ©mu orientovanĂ˝ pre vyuÄŤovanie odbornĂ˝ch predmetov a navrhnite  jeho ĹˇtruktĂşru , ktorĂˇ bude vyhovovaĹĄ prezentĂˇcii v sieti Internet. Navrhnite model v sĂşlade so Ĺˇtandardami modelu e-learning. SystĂ©m skĂşĹˇobne naplĹte do ĹˇtruktĂşrovanĂ˝ch celkov. Overte  funkÄŤnosĹĄ navrhnutĂ©ho systĂ©mu. ', 'Analyzujte novĂ© smery v oblasti vĂ˝uÄŤby a vzdelĂˇvania ako dĂ´sledok novĂ˝ch informaÄŤnĂ˝ch technolĂłgiĂ­. Zamerajte sa na e-learning paradigmu. Ĺ pecifikujte model systĂ©mu orientovanĂ˝ pre vyuÄŤovanie odbornĂ˝ch predmetov a navrhnite  jeho ĹˇtruktĂşru , ktorĂˇ bude vyhovovaĹĄ prezentĂˇcii v sieti Internet. Navrhnite model v sĂşlade so Ĺˇtandardami modelu e-learning. SystĂ©m skĂşĹˇobne naplĹte do ĹˇtruktĂşrovanĂ˝ch celkov. Overte  funkÄŤnosĹĄ navrhnutĂ©ho systĂ©mu. ', 1);
INSERT INTO projects VALUES (412, 'DP', 447, NULL, 428, '2004/2005', 'PrezentĂˇcia informĂˇciĂ­ reprezentovanĂ˝ch ontolĂłgiou', 'PrezentĂˇcia informĂˇciĂ­ reprezentovanĂ˝ch ontolĂłgiou', NULL, NULL, 1);
INSERT INTO projects VALUES (413, 'ZP', 433, NULL, 429, '2002/2003', 'Modelovanie nĂˇvrhovĂ˝ch vzorov', 'Modeling of Design Patterns', NULL, NULL, 1);
INSERT INTO projects VALUES (414, 'DP', 541, NULL, 429, '2004/2005', 'Monitorovanie zdravotnĂ©ho stavu klienta', 'Health state monitoring systems', NULL, NULL, 1);
INSERT INTO projects VALUES (415, 'ZP', 260, NULL, 432, '2003/2004', 'Prostriedky pre heuristickĂ© definovanie bezpeÄŤnostnej politiky', 'Tools for heuristic definition of security policy', 'Vytvorte nĂˇstroj, ktorĂ˝ umoĹľnĂ­ sledovaĹĄ ÄŤinnosti pouĹľĂ­vateÄľa v systĂ©me, ktorĂ© sĂş relevantnĂ© z pohÄľadu definovania bezpeÄŤnostnej politiky riadenia prĂ­stupu. PrĂ­kladom mĂ´Ĺľu byĹĄ sĂşbory, ku ktorĂ˝m pouĹľĂ­vateÄľ pristupuje, ich klasifikĂˇcia ÄŤasovĂˇ (kedy pristupuje, ako ÄŤasto, ...) aj priestorovĂˇ (umiestenie v sĂşborovom systĂ©me, ...), spĂ´sob prĂ­stupu (ÄŤĂ­tanie, zĂˇpis, vykonanie, pridĂˇvanie, ...) ako aj sledovanie postupnostĂ­ prĂ­stupov. VĂ˝stupy nĂˇstroja Ĺˇtatisticky spracujte a vytvorte zĂˇklad profilu pouĹľĂ­vateÄľa', 'Vytvorte nĂˇstroj, ktorĂ˝ umoĹľnĂ­ sledovaĹĄ ÄŤinnosti pouĹľĂ­vateÄľa v systĂ©me, ktorĂ© sĂş relevantnĂ© z pohÄľadu definovania bezpeÄŤnostnej politiky riadenia prĂ­stupu. PrĂ­kladom mĂ´Ĺľu byĹĄ sĂşbory, ku ktorĂ˝m pouĹľĂ­vateÄľ pristupuje, ich klasifikĂˇcia ÄŤasovĂˇ (kedy pristupuje, ako ÄŤasto, ...) aj priestorovĂˇ (umiestenie v sĂşborovom systĂ©me, ...), spĂ´sob prĂ­stupu (ÄŤĂ­tanie, zĂˇpis, vykonanie, pridĂˇvanie, ...) ako aj sledovanie postupnostĂ­ prĂ­stupov. VĂ˝stupy nĂˇstroja Ĺˇtatisticky spracujte a vytvorte zĂˇklad profilu pouĹľĂ­vateÄľa', 1);
INSERT INTO projects VALUES (416, 'DP', 25, NULL, 432, '2004/2005', 'NeĹˇtandardnĂ© moĹľnosti komunikĂˇcie v TCP/IP sieĹĄach', 'NeĹˇtandardnĂ© moĹľnosti komunikĂˇcie v TCP/IP sieĹĄach', NULL, NULL, 0);
INSERT INTO projects VALUES (417, 'DP', 541, NULL, 434, '2005/2006', 'SystĂ©m pre bezpeÄŤnĂş komunikĂˇciu  IS v GPRS sieti', 'A system for secure communication of IS over a GPRS network', NULL, NULL, 1);
INSERT INTO projects VALUES (418, 'ZP', 20, NULL, 434, '2003/2004', 'SimulĂˇtor neurĂłnovĂ˝ch sietĂ­ zaloĹľenĂ˝ch na echo stavoch', 'Simulator of echo state neural networks', 'Medzi novĂ© zaujĂ­mavĂ© prĂ­stupy v oblasti neurĂłnovĂ˝ch sietĂ­ patria siete zaloĹľenĂ© na echo stavoch (Echo-State Networks â€“ ESN). Na rozdiel od klasickĂ˝ch rekurentnĂ˝ch sietĂ­, ktorĂ© je potrebnĂ© trĂ©novaĹĄ, ESN siete vyuĹľĂ­vajĂş dynamiku nĂˇhodne inicializovanej stavovej ÄŤasti. CieÄľom projektu je naĹˇtudovaĹĄ prolematiku sietĂ­ zaloĹľenĂ˝ch na echo stavoch a v zvolenom programovacom jazyku vytvoriĹĄ simulĂˇtor takĂ©hoto typu sietĂ­. NĂˇsledne je potrebnĂ© experimentĂˇlne overiĹĄ niektorĂ© vlastnosti ESN sietĂ­.', 'Medzi novĂ© zaujĂ­mavĂ© prĂ­stupy v oblasti neurĂłnovĂ˝ch sietĂ­ patria siete zaloĹľenĂ© na echo stavoch (Echo-State Networks â€“ ESN). Na rozdiel od klasickĂ˝ch rekurentnĂ˝ch sietĂ­, ktorĂ© je potrebnĂ© trĂ©novaĹĄ, ESN siete vyuĹľĂ­vajĂş dynamiku nĂˇhodne inicializovanej stavovej ÄŤasti. CieÄľom projektu je naĹˇtudovaĹĄ prolematiku sietĂ­ zaloĹľenĂ˝ch na echo stavoch a v zvolenom programovacom jazyku vytvoriĹĄ simulĂˇtor takĂ©hoto typu sietĂ­. NĂˇsledne je potrebnĂ© experimentĂˇlne overiĹĄ niektorĂ© vlastnosti ESN sietĂ­.', 1);
INSERT INTO projects VALUES (419, 'DP', 92, 375, 435, '2004/2005', 'CentralizovanĂˇ sprĂˇva pouĹľĂ­vateÄľov', 'CentralizovanĂˇ sprĂˇva pouĹľĂ­vateÄľov', NULL, NULL, 0);
INSERT INTO projects VALUES (420, 'ZP', 342, NULL, 438, '2003/2004', 'ProgramovĂ˝ systĂ©m pre nĂˇvrh riadiacich jednotiek na bĂˇze  mikropoÄŤĂ­taÄŤa', 'Control Unit Development Application System on a Microcomputer Basis', 'Analyzujte moĹľnosti vyuĹľitia existujĂşcich mikropoÄŤĂ­taÄŤovĂ˝ch modulov na nĂˇvrh a realizĂˇciu riadiacich jednotiek.  Navrhnite inĹˇtrukÄŤnĂ˝ sĂşbor virtuĂˇlneho procesora vhodnĂ©ho na realizĂˇciu vybranej triedy riadiacich jednotiek. Navrhnite a zrealizujte vybranĂş ÄŤasĹĄ prekladaÄŤa programu  virtuĂˇlneho procesora na program v JSI vybranĂ©ho mikropoÄŤĂ­taÄŤa.
', 'Analyzujte moĹľnosti vyuĹľitia existujĂşcich mikropoÄŤĂ­taÄŤovĂ˝ch modulov na nĂˇvrh a realizĂˇciu riadiacich jednotiek.  Navrhnite inĹˇtrukÄŤnĂ˝ sĂşbor virtuĂˇlneho procesora vhodnĂ©ho na realizĂˇciu vybranej triedy riadiacich jednotiek. Navrhnite a zrealizujte vybranĂş ÄŤasĹĄ prekladaÄŤa programu  virtuĂˇlneho procesora na program v JSI vybranĂ©ho mikropoÄŤĂ­taÄŤa.
', 0);
INSERT INTO projects VALUES (421, 'DP', 298, NULL, 438, '2005/2006', 'AnalĂ˝za a vyhodnotenie sieĹĄovej komunikĂˇcie', 'AnalĂ˝za a vyhodnotenie sieĹĄovej komunikĂˇcie', NULL, NULL, 0);
INSERT INTO projects VALUES (422, 'DP', 690, NULL, 439, '2005/2006', 'Grafovo-teoretickĂ˝ model kolaboratĂ­vnych sietĂ­', 'Graph-theoretical model of the collaboration networks', NULL, NULL, 1);
INSERT INTO projects VALUES (423, 'ZP', 272, NULL, 439, '2003/2004', 'Podpora vĂ˝uÄŤby OOP', 'The educational support of the object oriented programming', 'Analyzujte objektovo orientovanĂ˝ prĂ­stup k tvorbe programov a porovnajte existujĂşce objektovo orientovanĂ© programovacie jazyky (C++, Java, Eiffel, SmallTalk, â€¦). Navrhnite a implementujte aplikĂˇciu, ktorĂˇ bude slĂşĹľiĹĄ ako pomĂ´cka pri vĂ˝uÄŤbe objektovo orientovanĂ©ho programovania. NavrhnutĂ˝ systĂ©m naplĹte textom s prĂ­kladmi zadelenĂ˝ch do ucelenĂ˝ch celkov. Overte funkÄŤnosĹĄ navrhnutĂ©ho systĂ©mu', 'Analyzujte objektovo orientovanĂ˝ prĂ­stup k tvorbe programov a porovnajte existujĂşce objektovo orientovanĂ© programovacie jazyky (C++, Java, Eiffel, SmallTalk, â€¦). Navrhnite a implementujte aplikĂˇciu, ktorĂˇ bude slĂşĹľiĹĄ ako pomĂ´cka pri vĂ˝uÄŤbe objektovo orientovanĂ©ho programovania. NavrhnutĂ˝ systĂ©m naplĹte textom s prĂ­kladmi zadelenĂ˝ch do ucelenĂ˝ch celkov. Overte funkÄŤnosĹĄ navrhnutĂ©ho systĂ©mu', 1);
INSERT INTO projects VALUES (424, 'DP', 579, NULL, 440, '2004/2005', 'VyuĹľitie multimĂ©diĂ­ pri filmovĂ˝ch sĂşĹĄaĹľiach', 'VyuĹľitie multimĂ©diĂ­ pri filmovĂ˝ch sĂşĹĄaĹľiach', NULL, NULL, 1);
INSERT INTO projects VALUES (425, 'DP', 360, NULL, 441, '2004/2005', 'Nedokonalosti v realizĂˇcii kombinaÄŤnĂ˝ch logickĂ˝ch obvodov', 'Nedokonalosti v realizĂˇcii kombinaÄŤnĂ˝ch logickĂ˝ch obvodov', NULL, NULL, 0);
INSERT INTO projects VALUES (426, 'DP', 569, NULL, 442, '2005/2006', 'Modelovanie, ĹˇpecifikĂˇcia a verifikĂˇcia logickĂ˝ch obvodov', 'Modeling, specification and verification of logic circuits', NULL, NULL, 0);
INSERT INTO projects VALUES (427, 'ZP', 294, NULL, 442, '2003/2004', 'Program pre simulovanie a zobrazovanie hĂ´r', 'Program for simulation and visualization of mountains', 'Vytvorte simulĂˇtor hĂ´r, ktorĂ˝ reĹˇpektuje podstatnĂ© horotvornĂ© procesy ako je tektonika, zvetravanie atÄŹ. V simulaÄŤnom programe pouĹľite znĂˇme metĂłdy generovania dĂˇt hĂ´r (fraktĂˇly) ale len ako doplnok ku globĂˇlnym procesom. Pomocou animĂˇciĂ­ demonĹˇtrujte hlavnĂ© charakteristiky geomorfnĂ˝ch procesov na globĂˇlnej a lokĂˇlnej Ăşrovni. VĂ˝slednĂ˝ profil vizualizujte s vyĹˇĹˇĂ­m stupĹom realistickĂ©ho zobrazenia, zatiaÄľ ÄŤo geofyzikĂˇlne procesy staÄŤĂ­ zobraziĹĄ schematicky.', 'Vytvorte simulĂˇtor hĂ´r, ktorĂ˝ reĹˇpektuje podstatnĂ© horotvornĂ© procesy ako je tektonika, zvetravanie atÄŹ. V simulaÄŤnom programe pouĹľite znĂˇme metĂłdy generovania dĂˇt hĂ´r (fraktĂˇly) ale len ako doplnok ku globĂˇlnym procesom. Pomocou animĂˇciĂ­ demonĹˇtrujte hlavnĂ© charakteristiky geomorfnĂ˝ch procesov na globĂˇlnej a lokĂˇlnej Ăşrovni. VĂ˝slednĂ˝ profil vizualizujte s vyĹˇĹˇĂ­m stupĹom realistickĂ©ho zobrazenia, zatiaÄľ ÄŤo geofyzikĂˇlne procesy staÄŤĂ­ zobraziĹĄ schematicky.', 1);
INSERT INTO projects VALUES (428, 'DP', 358, NULL, 443, '2005/2006', 'Presadzovanie bezpeÄŤnostnej politiky v databĂˇzach', 'Enforcement of security policies in databases', NULL, NULL, 0);
INSERT INTO projects VALUES (429, 'ZP', 541, NULL, 443, '2003/2004', 'ZĂˇlohovanie a obnova dĂˇt v databĂˇzach', 'Backup & recovery in relation database management system Oracle', 'Analyzujte metĂłdy a prostriedky zĂˇlohovania a obnovy dĂˇt v relaÄŤnĂ˝ch databĂˇzovĂ˝ch systĂ©moch. Definujte vĂ˝hody a nedostatky zĂˇlohovania a obnovy dĂˇt v DBS Oracle. Navrhnite moĹľnĂ© metĂłdy zlepĹˇenia a rozĹˇĂ­renia funkciĂ­ zĂˇlohovania a obnovy dĂˇt. VybratĂ©  metĂłdy implementujte v prostredĂ­ Oracle. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade.', 'Analyzujte metĂłdy a prostriedky zĂˇlohovania a obnovy dĂˇt v relaÄŤnĂ˝ch databĂˇzovĂ˝ch systĂ©moch. Definujte vĂ˝hody a nedostatky zĂˇlohovania a obnovy dĂˇt v DBS Oracle. Navrhnite moĹľnĂ© metĂłdy zlepĹˇenia a rozĹˇĂ­renia funkciĂ­ zĂˇlohovania a obnovy dĂˇt. VybratĂ©  metĂłdy implementujte v prostredĂ­ Oracle. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade.', 0);
INSERT INTO projects VALUES (430, 'ZP', 579, NULL, 444, '2003/2004', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS - 1', 'Multimedia information in regional information system - 1', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie existujĂşceho zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe obrĂˇzkov, grafov, animĂˇciĂ­. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb KIVT.', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie existujĂşceho zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe obrĂˇzkov, grafov, animĂˇciĂ­. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb KIVT.', 1);
INSERT INTO projects VALUES (431, 'DP', 569, NULL, 444, '2005/2006', 'Modelovanie a implementĂˇcia znalosti agenta v multiagentovom prostredĂ­', 'Modelovanie a implementĂˇcia znalosti agenta v multiagentovom prostredĂ­', NULL, NULL, 0);
INSERT INTO projects VALUES (432, 'ZP', 660, NULL, 446, '2003/2004', 'AdaptĂ­vna prezentĂˇcia informĂˇciĂ­ o univerzitnĂ˝ch predmetoch', 'Adaptive presentation of information about university courses', 'Analyzujte metĂłdy a prostriedky adaptĂ­vnej prezentĂˇcie a navigĂˇcie v hypertextovĂ˝ch dokumentoch. Zamerajte sa pri tom na skĂşmanie moĹľnostĂ­ vyuĹľitia meniaceho sa ÄŤasu pri prezentĂˇcii informĂˇciĂ­ o univerzitnĂ˝ch predmetoch. SkĂşmajte aspekty sĂşvisiace s vhodnosĹĄou jednotlivĂ˝ch technĂ­k prispĂ´sobovania pre tento ĂşÄŤel. VychĂˇdzajte pri tom z existujĂşceho prototypu ÄŤasovo zĂˇvislej prezentĂˇcie vytvorenĂ©ho v jazyku Java (prvĂ˝krĂˇt pouĹľitĂ˝ v akademickom roku 2002/2003 v predmete PrincĂ­py softvĂ©rovĂ©ho inĹľinierstva). Navrhnite softvĂ©rovĂş aplikĂˇciu, ktorĂˇ umoĹľnĂ­ napÄşĹanie informaÄŤnĂ©ho obsahu takĂ©hoto systĂ©mu. ÄŽalej navrhnite modifikĂˇcie existujĂşceho systĂ©mu tak, aby to odrĂˇĹľalo vĂ˝sledky analĂ˝zy. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu pre vybranĂ˝ predmet v odbore informatika. ', 'Analyzujte metĂłdy a prostriedky adaptĂ­vnej prezentĂˇcie a navigĂˇcie v hypertextovĂ˝ch dokumentoch. Zamerajte sa pri tom na skĂşmanie moĹľnostĂ­ vyuĹľitia meniaceho sa ÄŤasu pri prezentĂˇcii informĂˇciĂ­ o univerzitnĂ˝ch predmetoch. SkĂşmajte aspekty sĂşvisiace s vhodnosĹĄou jednotlivĂ˝ch technĂ­k prispĂ´sobovania pre tento ĂşÄŤel. VychĂˇdzajte pri tom z existujĂşceho prototypu ÄŤasovo zĂˇvislej prezentĂˇcie vytvorenĂ©ho v jazyku Java (prvĂ˝krĂˇt pouĹľitĂ˝ v akademickom roku 2002/2003 v predmete PrincĂ­py softvĂ©rovĂ©ho inĹľinierstva). Navrhnite softvĂ©rovĂş aplikĂˇciu, ktorĂˇ umoĹľnĂ­ napÄşĹanie informaÄŤnĂ©ho obsahu takĂ©hoto systĂ©mu. ÄŽalej navrhnite modifikĂˇcie existujĂşceho systĂ©mu tak, aby to odrĂˇĹľalo vĂ˝sledky analĂ˝zy. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu pre vybranĂ˝ predmet v odbore informatika. ', 1);
INSERT INTO projects VALUES (433, 'DP', 660, NULL, 446, '2005/2006', 'PrispĂ´sobovanie prezentĂˇcie informĂˇciĂ­ v elektronickom kurze s vyuĹľitĂ­m vlastnostĂ­ Äľudskej pamĂ¤te ', 'PrispĂ´sobovanie prezentĂˇcie informĂˇciĂ­ v elektronickom kurze s vyuĹľitĂ­m vlastnostĂ­ Äľudskej pamĂ¤te ', NULL, NULL, 1);
INSERT INTO projects VALUES (434, 'ZP', 359, NULL, 448, '2003/2004', 'SkladovĂ˝ informaÄŤnĂ˝ systĂ©m', 'Storage information system', 'Analyzujte, navrhnite a implementujte informaÄŤnĂ˝ systĂ©m, ktorĂ˝ bude riadiĹĄ skladovĂ© hospodĂˇrstvo na zĂˇklade predanĂ©ho tovaru jednotlivĂ˝m zĂˇkaznĂ­kom. SystĂ©m mĂˇ umoĹľĹovaĹĄ prĂ­stup k skladovĂ©mu hospodĂˇrstvu z viacerĂ˝ch pracovnĂ˝ch stanĂ­c, vtvĂˇraĹĄ zostavy pre nĂˇkup tovarov na zĂˇklade ich zostatkov v klade, vytvĂˇraĹĄ zostavy vydanĂ©ho tovaru jednotlivĂ˝m zĂˇkaznĂ­kom, generovaĹĄ Ĺˇtatistiky predajnosti podÄľa jednotlivĂ˝ch druhov tovaru.', 'Analyzujte, navrhnite a implementujte informaÄŤnĂ˝ systĂ©m, ktorĂ˝ bude riadiĹĄ skladovĂ© hospodĂˇrstvo na zĂˇklade predanĂ©ho tovaru jednotlivĂ˝m zĂˇkaznĂ­kom. SystĂ©m mĂˇ umoĹľĹovaĹĄ prĂ­stup k skladovĂ©mu hospodĂˇrstvu z viacerĂ˝ch pracovnĂ˝ch stanĂ­c, vtvĂˇraĹĄ zostavy pre nĂˇkup tovarov na zĂˇklade ich zostatkov v klade, vytvĂˇraĹĄ zostavy vydanĂ©ho tovaru jednotlivĂ˝m zĂˇkaznĂ­kom, generovaĹĄ Ĺˇtatistiky predajnosti podÄľa jednotlivĂ˝ch druhov tovaru.', 1);
INSERT INTO projects VALUES (435, 'DP', 359, NULL, 448, '2004/2005', 'Poskytovanie IT sluĹľieb a technolĂłgiĂ­ prostrednĂ­ctvom siete internetu a intranetu. ', 'Poskytovanie IT sluĹľieb a technolĂłgiĂ­ prostrednĂ­ctvom siete internetu a intranetu. ', NULL, NULL, 0);
INSERT INTO projects VALUES (436, 'DP', 670, NULL, 449, '2004/2005', 'Rozhranie Ethernet siete pre signĂˇlovĂ˝ procesor', 'Rozhranie Ethernet siete pre signĂˇlovĂ˝ procesor', NULL, NULL, 0);
INSERT INTO projects VALUES (437, 'DP', 31, NULL, 450, '2005/2006', 'Prostredie pre modelovanie a simulĂˇciu diskrĂ©tnych systĂ©mov', 'Toolset for modeling and simulation of discrete systems', NULL, NULL, 1);
INSERT INTO projects VALUES (438, 'ZP', 260, NULL, 450, '2003/2004', 'VizuĂˇlny nĂˇvrh bezpeÄŤnostnej politiky pre systĂ©m Medusa DS9', 'Visual design of security policy for Medusa DS9 system', 'PreĹˇtudujte bezpeÄŤnostnĂ˝ systĂ©m Medusa DS9 [1, 2]  z pohÄľadu mechanizmov, ktorĂ© poskytuje pre definovanie bezpeÄŤnostnĂ˝ch politĂ­k. Navrhnite a vytvorte nĂˇstroj pre vizuĂˇlny nĂˇvrh bezpeÄŤnostnĂ˝ch politĂ­k, ktorĂ© je moĹľnĂ© implementovaĹĄ pouĹľitĂ­m systĂ©mu Medusa DS9. Ăšlohu rieĹˇte ako modul existujĂşceho vĹˇeobecnĂ©ho nĂˇstoja pre definovanie bezpeÄŤnostnĂ˝ch politĂ­k [3].

OdporĂşÄŤanĂˇ literatĂşra:
[1] Zelem, M., "IntegrĂˇcia rĂ´znych bezpeÄŤnostnĂ˝ch politĂ­k do OS Linux", DiplomovĂˇ prĂˇca, FEI STU Bratislava, 2001
[2] Pikula, M., "DistribuovanĂ˝ systĂ©m na zvĂ˝Ĺˇenie bezpeÄŤnosti heterogĂ©nnej poÄŤĂ­taÄŤovej siete", DiplomovĂˇ prĂˇca, FEI STU Bratislava, 2002
[3] Trebula, R., "VizuĂˇlny nĂˇvrh bezpeÄŤnostnej politiky", DiplomovĂˇ prĂˇca, FEI STU Bratislava, 2003
', 'PreĹˇtudujte bezpeÄŤnostnĂ˝ systĂ©m Medusa DS9 [1, 2]  z pohÄľadu mechanizmov, ktorĂ© poskytuje pre definovanie bezpeÄŤnostnĂ˝ch politĂ­k. Navrhnite a vytvorte nĂˇstroj pre vizuĂˇlny nĂˇvrh bezpeÄŤnostnĂ˝ch politĂ­k, ktorĂ© je moĹľnĂ© implementovaĹĄ pouĹľitĂ­m systĂ©mu Medusa DS9. Ăšlohu rieĹˇte ako modul existujĂşceho vĹˇeobecnĂ©ho nĂˇstoja pre definovanie bezpeÄŤnostnĂ˝ch politĂ­k [3].

OdporĂşÄŤanĂˇ literatĂşra:
[1] Zelem, M., "IntegrĂˇcia rĂ´znych bezpeÄŤnostnĂ˝ch politĂ­k do OS Linux", DiplomovĂˇ prĂˇca, FEI STU Bratislava, 2001
[2] Pikula, M., "DistribuovanĂ˝ systĂ©m na zvĂ˝Ĺˇenie bezpeÄŤnosti heterogĂ©nnej poÄŤĂ­taÄŤovej siete", DiplomovĂˇ prĂˇca, FEI STU Bratislava, 2002
[3] Trebula, R., "VizuĂˇlny nĂˇvrh bezpeÄŤnostnej politiky", DiplomovĂˇ prĂˇca, FEI STU Bratislava, 2003
', 1);
INSERT INTO projects VALUES (439, 'DP', 98, NULL, 451, '2004/2005', 'Zber a vyhodnocovanie informĂˇciĂ­', 'Zber a vyhodnocovanie informĂˇciĂ­', NULL, NULL, 1);
INSERT INTO projects VALUES (440, 'ZP', 541, NULL, 452, '2003/2004', 'ArchivaÄŤnĂ˝ systĂ©m pre manaĹľment projektov', 'ArchivaÄŤnĂ˝ systĂ©m pre manaĹľment projektov', 'Urobte prieskum trhu a analyzujte dostupnĂ© archivaÄŤnĂ© systĂ©my pre manaĹľment projektov. Ĺ pecifikujte poĹľadovanĂ© vlastnosti takĂ©hoto systĂ©mu.  Navrhnite funkÄŤnĂ˝ model inteligentnĂ©ho archivaÄŤnĂ©ho systĂ©mu pre manaĹľment projektov. NavrhnutĂ˝ systĂ©m implementujte vo vybratom prostredĂ­. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade', 'Urobte prieskum trhu a analyzujte dostupnĂ© archivaÄŤnĂ© systĂ©my pre manaĹľment projektov. Ĺ pecifikujte poĹľadovanĂ© vlastnosti takĂ©hoto systĂ©mu.  Navrhnite funkÄŤnĂ˝ model inteligentnĂ©ho archivaÄŤnĂ©ho systĂ©mu pre manaĹľment projektov. NavrhnutĂ˝ systĂ©m implementujte vo vybratom prostredĂ­. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade', 1);
INSERT INTO projects VALUES (441, 'DP', 660, NULL, 452, '2005/2006', 'Modelovanie adaptĂ­vnych webovĂ˝ch systĂ©mov', 'Modelovanie adaptĂ­vnych webovĂ˝ch systĂ©mov', NULL, NULL, 1);
INSERT INTO projects VALUES (442, 'DP', 437, NULL, 453, '2005/2006', 'Dekompresia vykonateÄľnĂ˝ch programov', 'Decompression of executable files', NULL, NULL, 1);
INSERT INTO projects VALUES (443, 'ZP', 437, NULL, 453, '2003/2004', 'RekonĹˇtruovanie starnĂşceho softvĂ©ru', 'Refactoring decayed code', 'SoftvĂ©r starne. Analyzujte prejavy, prĂ­ÄŤiny a dĂ´sledky tohto javu. OpĂ­Ĺˇte podrobnejĹˇie problĂ©my spojenĂ© s rekonĹˇtruovanĂ­m softvĂ©ru, t.j. procesom menenia nĂˇvrhu sofvtĂ©rovĂ©ho systĂ©mu pri zachovanĂ­ jeho celkovĂ©ho sprĂˇvania. Analyzujte moĹľnosti podpory pri rozpoznĂˇvanĂ­ potreby rekonĹˇtruovania, pri identifikovanĂ­ ĹˇpeciĂˇlnej techniky a miesta, kde sa mĂˇ pouĹľiĹĄ a pri automatickom vykonanĂ­ rekonĹˇtrukcie. ZvĂˇĹľte moĹľnosti metaprogramovania pri opise a implementĂˇcii rekonĹˇtruovania.  Pomenujte prĂ­pady vĂ˝skytov zostarnutej ÄŤasti v texte programu, ktorĂ© navrhujete rekoĹˇtruovaĹĄ. Navrhnite nĂˇstroj, ktorĂ˝ podporuje softvĂ©rovĂ©ho nĂˇvrhĂˇra pri rekonĹˇtruovanĂ­. VaĹˇe rieĹˇenie experimentĂˇlne overte', 'SoftvĂ©r starne. Analyzujte prejavy, prĂ­ÄŤiny a dĂ´sledky tohto javu. OpĂ­Ĺˇte podrobnejĹˇie problĂ©my spojenĂ© s rekonĹˇtruovanĂ­m softvĂ©ru, t.j. procesom menenia nĂˇvrhu sofvtĂ©rovĂ©ho systĂ©mu pri zachovanĂ­ jeho celkovĂ©ho sprĂˇvania. Analyzujte moĹľnosti podpory pri rozpoznĂˇvanĂ­ potreby rekonĹˇtruovania, pri identifikovanĂ­ ĹˇpeciĂˇlnej techniky a miesta, kde sa mĂˇ pouĹľiĹĄ a pri automatickom vykonanĂ­ rekonĹˇtrukcie. ZvĂˇĹľte moĹľnosti metaprogramovania pri opise a implementĂˇcii rekonĹˇtruovania.  Pomenujte prĂ­pady vĂ˝skytov zostarnutej ÄŤasti v texte programu, ktorĂ© navrhujete rekoĹˇtruovaĹĄ. Navrhnite nĂˇstroj, ktorĂ˝ podporuje softvĂ©rovĂ©ho nĂˇvrhĂˇra pri rekonĹˇtruovanĂ­. VaĹˇe rieĹˇenie experimentĂˇlne overte', 1);
INSERT INTO projects VALUES (444, 'ZP', 260, NULL, 454, '2003/2004', 'VizuĂˇlny nĂˇvrh bezpeÄŤnostnej politiky pre systĂ©m Medusa DS9', 'VizuĂˇlny nĂˇvrh bezpeÄŤnostnej politiky pre systĂ©m Medusa DS9', 'PreĹˇtudujte bezpeÄŤnostnĂ˝ systĂ©m Medusa DS9 [1, 2]  z pohÄľadu mechanizmov, ktorĂ© poskytuje pre definovanie bezpeÄŤnostnĂ˝ch politĂ­k. Navrhnite a vytvorte nĂˇstroj pre vizuĂˇlny nĂˇvrh bezpeÄŤnostnĂ˝ch politĂ­k, ktorĂ© je moĹľnĂ© implementovaĹĄ pouĹľitĂ­m systĂ©mu Medusa DS9. Ăšlohu rieĹˇte ako modul existujĂşceho vĹˇeobecnĂ©ho nĂˇstoja pre definovanie bezpeÄŤnostnĂ˝ch politĂ­k [3].

OdporĂşÄŤanĂˇ literatĂşra:
[1] Zelem, M., "IntegrĂˇcia rĂ´znych bezpeÄŤnostnĂ˝ch politĂ­k do OS Linux", DiplomovĂˇ prĂˇca, FEI STU Bratislava, 2001
[2] Pikula, M., "DistribuovanĂ˝ systĂ©m na zvĂ˝Ĺˇenie bezpeÄŤnosti heterogĂ©nnej poÄŤĂ­taÄŤovej siete", DiplomovĂˇ prĂˇca, FEI STU Bratislava, 2002
[3] Trebula, R., "VizuĂˇlny nĂˇvrh bezpeÄŤnostnej politiky", DiplomovĂˇ prĂˇca, FEI STU Bratislava, 2003
', 'PreĹˇtudujte bezpeÄŤnostnĂ˝ systĂ©m Medusa DS9 [1, 2]  z pohÄľadu mechanizmov, ktorĂ© poskytuje pre definovanie bezpeÄŤnostnĂ˝ch politĂ­k. Navrhnite a vytvorte nĂˇstroj pre vizuĂˇlny nĂˇvrh bezpeÄŤnostnĂ˝ch politĂ­k, ktorĂ© je moĹľnĂ© implementovaĹĄ pouĹľitĂ­m systĂ©mu Medusa DS9. Ăšlohu rieĹˇte ako modul existujĂşceho vĹˇeobecnĂ©ho nĂˇstoja pre definovanie bezpeÄŤnostnĂ˝ch politĂ­k [3].

OdporĂşÄŤanĂˇ literatĂşra:
[1] Zelem, M., "IntegrĂˇcia rĂ´znych bezpeÄŤnostnĂ˝ch politĂ­k do OS Linux", DiplomovĂˇ prĂˇca, FEI STU Bratislava, 2001
[2] Pikula, M., "DistribuovanĂ˝ systĂ©m na zvĂ˝Ĺˇenie bezpeÄŤnosti heterogĂ©nnej poÄŤĂ­taÄŤovej siete", DiplomovĂˇ prĂˇca, FEI STU Bratislava, 2002
[3] Trebula, R., "VizuĂˇlny nĂˇvrh bezpeÄŤnostnej politiky", DiplomovĂˇ prĂˇca, FEI STU Bratislava, 2003
', 1);
INSERT INTO projects VALUES (445, 'DP', 260, NULL, 454, '2004/2005', 'Detekcia neĹˇtandardnĂ˝ch stavov v operaÄŤnom systĂ©me', 'Detekcia neĹˇtandardnĂ˝ch stavov v operaÄŤnom systĂ©me', NULL, NULL, 1);
INSERT INTO projects VALUES (446, 'DP', 445, NULL, 455, '2004/2005', 'Podpora metĂłd a technĂ­k adaptĂ­vnych hypertextov', 'Podpora metĂłd a technĂ­k adaptĂ­vnych hypertextov', NULL, NULL, 1);
INSERT INTO projects VALUES (447, 'ZP', 563, NULL, 456, '2005/2006', '24-vstupovĂˇ preruĹˇovacia karta pre PC', '24-vstupovĂˇ preruĹˇovacia karta pre PC', 'Navrhnite a zrealizujte 24-vstupovĂş preruĹˇovaciu kartu pre PC na bĂˇze obvodov 8259A. FunkÄŤnosĹĄ overte testovacĂ­m programom.', 'Navrhnite a zrealizujte 24-vstupovĂş preruĹˇovaciu kartu pre PC na bĂˇze obvodov 8259A. FunkÄŤnosĹĄ overte testovacĂ­m programom.', 0);
INSERT INTO projects VALUES (448, 'DP', 361, NULL, 457, '2004/2005', 'PlĂˇnovacĂ­ algoritmus  v programovateÄľnĂ˝ch smerovaÄŤoch', 'PlĂˇnovacĂ­ algoritmus  v programovateÄľnĂ˝ch smerovaÄŤoch', NULL, NULL, 0);
INSERT INTO projects VALUES (449, 'ZP', 24, NULL, 458, '2003/2004', 'AlgoritmizĂˇcia v prĂ­kladoch -  usporadĂşvanie', 'Algorithms in examples â€“ sorting', 'Analyzujte vybranĂ© algoritmickĂ© metĂłdy vyuĹľĂ­vanĂ© v databĂˇzovĂ˝ch systĂ©moch (prehÄľadĂˇvanie a usporadĂşvanie zĂˇznamov)  z hÄľadiska ich vyuĹľitia v sĂşÄŤasnĂ˝ch softvĂ©rovĂ˝ch aplikĂˇciĂˇch. Porovnajte jednotlivĂ© metĂłdy podÄľa vybranĂ˝ch kritĂ©riĂ­. Spracujte  vybranĂ© algoritmy do mnoĹľiny  prĂ­kladov vo forme  hypertextu, s presne stanovenou ĹˇtruktĂşrou. Ĺ truktĂşra bude odrĂˇĹľaĹĄ ĹľivotnĂ˝ cyklus programu a zĂˇroveĹ algoritmy rovnakĂ©ho typu budĂş vyhodnocovanĂ© na reprezentatĂ­vnej vzorke Ăşdajov a navzĂˇjom porovnĂˇvanĂ©.  Vizualizujte  prezentĂˇciu vykonĂˇvania algoritmov', 'Analyzujte vybranĂ© algoritmickĂ© metĂłdy vyuĹľĂ­vanĂ© v databĂˇzovĂ˝ch systĂ©moch (prehÄľadĂˇvanie a usporadĂşvanie zĂˇznamov)  z hÄľadiska ich vyuĹľitia v sĂşÄŤasnĂ˝ch softvĂ©rovĂ˝ch aplikĂˇciĂˇch. Porovnajte jednotlivĂ© metĂłdy podÄľa vybranĂ˝ch kritĂ©riĂ­. Spracujte  vybranĂ© algoritmy do mnoĹľiny  prĂ­kladov vo forme  hypertextu, s presne stanovenou ĹˇtruktĂşrou. Ĺ truktĂşra bude odrĂˇĹľaĹĄ ĹľivotnĂ˝ cyklus programu a zĂˇroveĹ algoritmy rovnakĂ©ho typu budĂş vyhodnocovanĂ© na reprezentatĂ­vnej vzorke Ăşdajov a navzĂˇjom porovnĂˇvanĂ©.  Vizualizujte  prezentĂˇciu vykonĂˇvania algoritmov', 1);
INSERT INTO projects VALUES (450, 'DP', 704, NULL, 458, '2005/2006', 'RozĹˇĂ­renie nĂˇvrhu a implementĂˇcie webovskej reprezentĂˇcie pracoviska', 'RozĹˇĂ­renie nĂˇvrhu a implementĂˇcie webovskej reprezentĂˇcie pracoviska', NULL, NULL, 1);
INSERT INTO projects VALUES (451, 'ZP', 579, NULL, 460, '2004/2005', 'SystĂ©m na podporu tvorby semestrĂˇlnych rozvrhov', 'System for support of making semestral schedules', 'Analyzujte ĂşdajovĂ© mnoĹľiny a postupy pri vytvĂˇranĂ­ semestrĂˇlnych rozvrhov a nĂˇsledne navrhnite systĂ©m, ktorĂ˝ by tieto ÄŤinnosti podporoval. ZĂˇkladnĂ© ÄŤasti nĂˇvrhu realizujte v podobe prototypu a zaistite nevyhnutnĂş kompatibilitu s informaÄŤnĂ˝m systĂ©mom pouĹľĂ­vanĂ˝m na FIIT.', 'Analyzujte ĂşdajovĂ© mnoĹľiny a postupy pri vytvĂˇranĂ­ semestrĂˇlnych rozvrhov a nĂˇsledne navrhnite systĂ©m, ktorĂ˝ by tieto ÄŤinnosti podporoval. ZĂˇkladnĂ© ÄŤasti nĂˇvrhu realizujte v podobe prototypu a zaistite nevyhnutnĂş kompatibilitu s informaÄŤnĂ˝m systĂ©mom pouĹľĂ­vanĂ˝m na FIIT.', 1);
INSERT INTO projects VALUES (452, 'DP', 673, 46, 460, '2005/2006', 'AplikĂˇcia OCL v UML profiloch', 'AplikĂˇcia OCL v UML profiloch', NULL, NULL, 1);
INSERT INTO projects VALUES (453, 'DP', 298, NULL, 461, '2005/2006', 'Podpora diĹˇtanÄŤnĂ©ho vzdelĂˇvania - prezentaÄŤnĂ˝ modul', 'Podpora diĹˇtanÄŤnĂ©ho vzdelĂˇvania - prezentaÄŤnĂ˝ modul', NULL, NULL, 0);
INSERT INTO projects VALUES (454, 'ZP', 298, NULL, 461, '2004/2005', 'Vytvorenie aplikĂˇcie vo Visual C++ krok za krokom', 'Dialog based application in Visual C++ step by step', 'Analyzujte spĂ´sob vytvĂˇranie aplikĂˇcie v prostredĂ­ Microsoft Visual Studio pre Visual C++. Navrhnite a vytvorte vĂ˝uÄŤbovĂ˝ systĂ©m pre nauÄŤenie vytvĂˇrania aplikĂˇciĂ­ v tomto prostredĂ­. PredpokladĂˇ sa vytvorenie prezentĂˇcie postupu vytvĂˇrania aplikĂˇciĂ­, ako aj vzorovĂ˝ch prĂ­kladov.', 'Analyzujte spĂ´sob vytvĂˇranie aplikĂˇcie v prostredĂ­ Microsoft Visual Studio pre Visual C++. Navrhnite a vytvorte vĂ˝uÄŤbovĂ˝ systĂ©m pre nauÄŤenie vytvĂˇrania aplikĂˇciĂ­ v tomto prostredĂ­. PredpokladĂˇ sa vytvorenie prezentĂˇcie postupu vytvĂˇrania aplikĂˇciĂ­, ako aj vzorovĂ˝ch prĂ­kladov.', 0);
INSERT INTO projects VALUES (455, 'DP', 298, NULL, 462, '2005/2006', 'Podpora diĹˇtanÄŤnĂ©ho vzdelĂˇvania - modul overovania znalostĂ­', 'Podpora diĹˇtanÄŤnĂ©ho vzdelĂˇvania - modul overovania znalostĂ­', NULL, NULL, 0);
INSERT INTO projects VALUES (456, 'ZP', 298, NULL, 462, '2004/2005', 'MultimediĂˇlna prezentĂˇcia informĂˇciĂ­', 'A Multimedia Presentation of Information', 'Analyzujte moĹľnosti multimediĂˇlnej prezentĂˇcie informĂˇciĂ­. Navrhnite a implementujte vĂ˝uÄŤbovĂ˝ systĂ©m pre prezentĂˇciu informĂˇciĂ­ z predmetu PerifĂ©rne zariadenia â€“ tĂ©my 1 aĹľ 5. SystĂ©m mĂˇ obsahovaĹĄ moĹľnosĹĄ poskytnĂşĹĄ zĂˇujemcovi ĹˇtudijnĂ© materiĂˇly, ako aj mechanizmy overovania znalostĂ­ naĹˇtudovanĂ˝ch textov.', 'Analyzujte moĹľnosti multimediĂˇlnej prezentĂˇcie informĂˇciĂ­. Navrhnite a implementujte vĂ˝uÄŤbovĂ˝ systĂ©m pre prezentĂˇciu informĂˇciĂ­ z predmetu PerifĂ©rne zariadenia â€“ tĂ©my 1 aĹľ 5. SystĂ©m mĂˇ obsahovaĹĄ moĹľnosĹĄ poskytnĂşĹĄ zĂˇujemcovi ĹˇtudijnĂ© materiĂˇly, ako aj mechanizmy overovania znalostĂ­ naĹˇtudovanĂ˝ch textov.', 0);
INSERT INTO projects VALUES (457, 'ZP', 541, NULL, 463, '2002/2003', 'InteligentnĂ© spracovanie v distribuovanom systĂ©me', 'Intelligent processing in distributed system', NULL, NULL, 1);
INSERT INTO projects VALUES (458, 'DP', 433, NULL, 463, '2005/2006', 'Asistent v prostredĂ­ webu so sĂ©mantikou', 'Digital assistant in the semantic web environment', NULL, NULL, 1);
INSERT INTO projects VALUES (459, 'ZP', 563, NULL, 464, '2002/2003', 'OsciloskopickĂˇ karta pre PC', 'Oscilloscope card for PC', NULL, NULL, 0);
INSERT INTO projects VALUES (460, 'DP', 705, NULL, 464, '2004/2005', 'AutomatickĂˇ syntĂ©za synchrĂłnnych sekvenÄŤnĂ˝ch logickĂ˝ch obvodov s integrovanĂ˝mi obvodmi 74F298', 'AutomatickĂˇ syntĂ©za synchrĂłnnych sekvenÄŤnĂ˝ch logickĂ˝ch obvodov s integrovanĂ˝mi obvodmi 74F298', NULL, NULL, 0);
INSERT INTO projects VALUES (461, 'ZP', 24, NULL, 465, '2003/2004', 'AlgoritmizĂˇcia v prĂ­kladoch â€“abstraktnĂ© ĂşdajovĂ© ĹˇtruktĂşry', 'Algorithmization in examples - Abstract data types', 'Analyzujte vybranĂ© abstraktnĂ© ĂşdajovĂ© ĹˇtruktĂşry (zoznamy, zĂˇsobnĂ­ky, rady, a grafy, stromy) z hÄľadiska ich vyuĹľitia v sĂşÄŤasnĂ˝ch softvĂ©rovĂ˝ch aplikĂˇciĂˇch. Spracujte a implementujte ich  mnoĹľiny  prĂ­kladov vo forme  hypertextu, s presne stanovenou ĹˇtruktĂşrou. Ĺ truktĂşra bude odrĂˇĹľaĹĄ ĹľivotnĂ˝ cyklus programu.  Vizualizujte  prezentĂˇciu vykonĂˇvania prĂ­kladov', 'Analyzujte vybranĂ© abstraktnĂ© ĂşdajovĂ© ĹˇtruktĂşry (zoznamy, zĂˇsobnĂ­ky, rady, a grafy, stromy) z hÄľadiska ich vyuĹľitia v sĂşÄŤasnĂ˝ch softvĂ©rovĂ˝ch aplikĂˇciĂˇch. Spracujte a implementujte ich  mnoĹľiny  prĂ­kladov vo forme  hypertextu, s presne stanovenou ĹˇtruktĂşrou. Ĺ truktĂşra bude odrĂˇĹľaĹĄ ĹľivotnĂ˝ cyklus programu.  Vizualizujte  prezentĂˇciu vykonĂˇvania prĂ­kladov', 1);
INSERT INTO projects VALUES (462, 'DP', 566, NULL, 465, '2005/2006', 'KoevolĂşcia univerzĂˇlnej gramatiky ', 'KoevolĂşcia univerzĂˇlnej gramatiky ', NULL, NULL, 1);
INSERT INTO projects VALUES (463, 'ZP', 375, NULL, 466, '2003/2004', 'SystĂ©m pre podporu e-vzdelĂˇvania', 'SystĂ©m pre podporu e-vzdelĂˇvania', 'Analyzujte rĂ´zne vĂ˝uÄŤbovĂ© systĂ©my, ktorĂ© podporujĂş uÄŤenie sa elektronickou formou. Pri analĂ˝ze sa zamerajte najmĂ¤ na metodiku vytvĂˇrania obsahovej nĂˇplne kurzov e-vzdelĂˇvania. Navrhnite a implementujte modulĂˇrny programovĂ˝ systĂ©m, ktorĂ˝ poskytne dostatoÄŤne univerzĂˇlny rĂˇmec pre multimediĂˇlne spracovanie obsahovej nĂˇplne rĂ´znych kurzov. FunkÄŤnosĹĄ systĂ©mu overte vytvorenĂ­m vybratej ÄŤasti kurzu podÄľa poĹľiadaviek inĹˇtruktora kurzu. ', 'Analyzujte rĂ´zne vĂ˝uÄŤbovĂ© systĂ©my, ktorĂ© podporujĂş uÄŤenie sa elektronickou formou. Pri analĂ˝ze sa zamerajte najmĂ¤ na metodiku vytvĂˇrania obsahovej nĂˇplne kurzov e-vzdelĂˇvania. Navrhnite a implementujte modulĂˇrny programovĂ˝ systĂ©m, ktorĂ˝ poskytne dostatoÄŤne univerzĂˇlny rĂˇmec pre multimediĂˇlne spracovanie obsahovej nĂˇplne rĂ´znych kurzov. FunkÄŤnosĹĄ systĂ©mu overte vytvorenĂ­m vybratej ÄŤasti kurzu podÄľa poĹľiadaviek inĹˇtruktora kurzu. ', 0);
INSERT INTO projects VALUES (464, 'DP', 670, 563, 466, '2005/2006', 'OperaÄŤnĂ˝ systĂ©m pre signĂˇlovĂ˝ processor', 'OperaÄŤnĂ˝ systĂ©m pre signĂˇlovĂ˝ processor', NULL, NULL, 0);
INSERT INTO projects VALUES (465, 'DP', 704, NULL, 467, '2005/2006', 'ProblĂ©movo orientovanĂ˝ informaÄŤnĂ˝ systĂ©m ', 'Problem oriented information system', NULL, NULL, 1);
INSERT INTO projects VALUES (466, 'ZP', 704, NULL, 467, '2003/2004', 'DiagnostickĂ© vyhodnocovanie CT snĂ­mkov', 'Diagnostic evaluation of CT scans', 'Analyzujte moĹľnosti vyhodnocovania CT snĂ­mkov, ich kategorizĂˇciu vzhÄľadom na vhodnĂş metriku, ktorĂˇ mĂ´Ĺľe byĹĄ podstatnou informĂˇciou v diagnĂłze onkologickĂ©ho pacienta. PodstatnĂ˝ problĂ©m rieĹˇenej tĂ©my je: PriestorovĂ©   vĂ˝poÄŤty  o  tumore a  ich  uchovĂˇvanie  v DB  diagnĂłz  v  tvare, ktorĂ˝  je vhodnĂ˝ ako diagnostickĂˇ informĂˇcia aj pre ÄŹalĹˇie (napr. ĹˇtatistickĂ©) vyhodnocovanie. Na zĂˇklade analĂ˝zy navrhnite  a odskĂşĹˇajte vhodnĂ© algoritmy.', 'Analyzujte moĹľnosti vyhodnocovania CT snĂ­mkov, ich kategorizĂˇciu vzhÄľadom na vhodnĂş metriku, ktorĂˇ mĂ´Ĺľe byĹĄ podstatnou informĂˇciou v diagnĂłze onkologickĂ©ho pacienta. PodstatnĂ˝ problĂ©m rieĹˇenej tĂ©my je: PriestorovĂ©   vĂ˝poÄŤty  o  tumore a  ich  uchovĂˇvanie  v DB  diagnĂłz  v  tvare, ktorĂ˝  je vhodnĂ˝ ako diagnostickĂˇ informĂˇcia aj pre ÄŹalĹˇie (napr. ĹˇtatistickĂ©) vyhodnocovanie. Na zĂˇklade analĂ˝zy navrhnite  a odskĂşĹˇajte vhodnĂ© algoritmy.', 1);
INSERT INTO projects VALUES (467, 'DP', 674, NULL, 469, '2005/2006', 'Multi-agentovĂ˝ simulĂˇtor adaptĂ­vnej ekonomiky', 'Multi-agent simulation of adaptive economics', NULL, NULL, 1);
INSERT INTO projects VALUES (468, 'ZP', 98, NULL, 469, '2003/2004', 'SystĂ©m pre odovzdĂˇvanie ĹˇtudentskĂ˝ch prĂˇc prostrednĂ­ctvom Internetu', 'System for collecting students projects by means of internet', 'Analyzujte problematiku zberu a vyhodnocovania informĂˇciĂ­. Analyzujte moĹľnosti implementaÄŤnĂ˝ch prostriedkov vhodnĂ˝ch pre takĂ©to typy aplikĂˇciĂ­. PosĂşÄŹte moĹľnosti PHP a jeho vĂ˝vojovĂ©ho a ladiaceho prostredia ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇciĂ­. Na zĂˇklade analĂ˝zy problĂ©mu navrhnite a vytvorte aplikĂˇciu vhodnĂş pre systĂ©m odovzdĂˇvania prĂˇc prostrednĂ­ctvom internetu', 'Analyzujte problematiku zberu a vyhodnocovania informĂˇciĂ­. Analyzujte moĹľnosti implementaÄŤnĂ˝ch prostriedkov vhodnĂ˝ch pre takĂ©to typy aplikĂˇciĂ­. PosĂşÄŹte moĹľnosti PHP a jeho vĂ˝vojovĂ©ho a ladiaceho prostredia ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇciĂ­. Na zĂˇklade analĂ˝zy problĂ©mu navrhnite a vytvorte aplikĂˇciu vhodnĂş pre systĂ©m odovzdĂˇvania prĂˇc prostrednĂ­ctvom internetu', 1);
INSERT INTO projects VALUES (469, 'DP', 387, NULL, 470, '2005/2006', 'VizualizĂˇcia kolekcie textovĂ˝ch dokumentov', 'Visualization of text document collection', NULL, NULL, 1);
INSERT INTO projects VALUES (470, 'ZP', 387, NULL, 470, '2003/2004', 'PravdepodobnostnĂ© modely pre odporĂşÄŤanie informĂˇciĂ­', 'Probabilistic models for recommendation', 'MetĂłdy pre odporĂşÄŤanie informĂˇciĂ­ odhadujĂş na zĂˇklade hodnotenĂ­ prvkov pouĹľĂ­vateÄľmi, ako by pouĹľĂ­vateÄľ ohodnotil novĂ˝ prvok. V prĂ­pade vysokĂ©ho odhadnutĂ©ho hodnotenia, sa novĂ˝ prvok pouĹľĂ­vateÄľovi odporuÄŤĂ­. Existuje mnoho rĂ´znych metĂłd odporĂşÄŤania a medzi ne patria aj pravdepodobnostnĂ© modely. VĂ˝hodou pravdepodobnostnĂ˝ch modelov je, Ĺľe explicitne rozdeÄľujĂş profily pouĹľĂ­vateÄľov do vzorov podÄľa zĂˇujmu pouĹľĂ­vateÄľov, ÄŤĂ­m umoĹľĹujĂş zdieÄľaĹĄ odporĂşÄŤania medzi pouĹľĂ­vateÄľmi a identifikovaĹĄ komunity pouĹľĂ­vateÄľov. Analyzujte aspektovĂ˝ a klasterovĂ˝ model, navrhnite spĂ´sob na ich porovnanie a porovnajte presnosĹĄ odporĂşÄŤania jednotlivĂ˝ch modelov.', 'MetĂłdy pre odporĂşÄŤanie informĂˇciĂ­ odhadujĂş na zĂˇklade hodnotenĂ­ prvkov pouĹľĂ­vateÄľmi, ako by pouĹľĂ­vateÄľ ohodnotil novĂ˝ prvok. V prĂ­pade vysokĂ©ho odhadnutĂ©ho hodnotenia, sa novĂ˝ prvok pouĹľĂ­vateÄľovi odporuÄŤĂ­. Existuje mnoho rĂ´znych metĂłd odporĂşÄŤania a medzi ne patria aj pravdepodobnostnĂ© modely. VĂ˝hodou pravdepodobnostnĂ˝ch modelov je, Ĺľe explicitne rozdeÄľujĂş profily pouĹľĂ­vateÄľov do vzorov podÄľa zĂˇujmu pouĹľĂ­vateÄľov, ÄŤĂ­m umoĹľĹujĂş zdieÄľaĹĄ odporĂşÄŤania medzi pouĹľĂ­vateÄľmi a identifikovaĹĄ komunity pouĹľĂ­vateÄľov. Analyzujte aspektovĂ˝ a klasterovĂ˝ model, navrhnite spĂ´sob na ich porovnanie a porovnajte presnosĹĄ odporĂşÄŤania jednotlivĂ˝ch modelov.', 1);
INSERT INTO projects VALUES (471, 'DP', 357, NULL, 471, '2005/2006', 'SieĹĄovĂˇ aplikĂˇcia pre interaktĂ­vne internetovĂ© testovanie Ĺˇtudentov', 'Network application for interactive internet assessment of students', NULL, NULL, 0);
INSERT INTO projects VALUES (472, 'ZP', 358, NULL, 471, '2003/2004', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Testing the Security Weaknesses of Computer Networks', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy prienikov. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş simulovaĹĄ vybratĂ© typy Ăştokov na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.

', 'V prostredĂ­ protokolov na bĂˇze TCP/IP analyzujte bezpeÄŤnostnĂ© vlastnosti poÄŤĂ­taÄŤovĂ˝ch sietĂ­ a moĹľnĂ© typy prienikov. Do zĂˇkladnĂ©ho programovĂ©ho modulu navrhnite a implementujte ÄŹalĹˇie programovĂ© moduly, ktorĂ© budĂş simulovaĹĄ vybratĂ© typy Ăştokov na jednotlivĂ˝ch vrstvĂˇch modelu TCP/IP sieĹĄovej architektĂşry.

', 0);
INSERT INTO projects VALUES (473, 'ZP', 95, NULL, 472, '2003/2004', 'Tvorba ĹˇpecifikĂˇciĂ­ v Z jazyku', 'Making formal specifications in Z language', 'Analyzujte problematiku tvorby Z-ĹˇpecifikĂˇciĂ­ z hÄľadiska moĹľnosti vizualizĂˇcie schĂ©m a formĂşl Z-jazyka. Analyzujte moĹľnosti, ktorĂ© poskytuje prostriedok na prezeranie Z-ĹˇpecifikĂˇciĂ­, Z-Browser. Na zĂˇklade tejto analĂ˝zy  navrhnite a implementujte model systĂ©mu, ktorĂ˝ podporĂ­ vizualizĂˇciu ÄŤĂ­tania a zĂˇpisu Z-formĂşl.', 'Analyzujte problematiku tvorby Z-ĹˇpecifikĂˇciĂ­ z hÄľadiska moĹľnosti vizualizĂˇcie schĂ©m a formĂşl Z-jazyka. Analyzujte moĹľnosti, ktorĂ© poskytuje prostriedok na prezeranie Z-ĹˇpecifikĂˇciĂ­, Z-Browser. Na zĂˇklade tejto analĂ˝zy  navrhnite a implementujte model systĂ©mu, ktorĂ˝ podporĂ­ vizualizĂˇciu ÄŤĂ­tania a zĂˇpisu Z-formĂşl.', 1);
INSERT INTO projects VALUES (474, 'DP', 16, NULL, 472, '2005/2006', 'Podpora modelovania vlastnostĂ­', 'Support for feature modeling', NULL, NULL, 1);
INSERT INTO projects VALUES (475, 'ZP', 27, NULL, 473, '2002/2003', 'Ĺ tĂşdia jadra objektovo orientovanĂ©ho operaÄŤnĂ©ho systĂ©mu', 'Study of kernel for object oriented operating system', NULL, NULL, 1);
INSERT INTO projects VALUES (476, 'DP', 27, NULL, 473, '2003/2004', 'Ĺ tĂşdia servera pre interaktĂ­vne systĂ©my obohatenej reality', 'A study of server for interactive augmented reality systems', NULL, NULL, 1);
INSERT INTO projects VALUES (477, 'ZP', 387, NULL, 474, '2003/2004', 'ZdieÄľanie a sprĂ­stupĹovanie dokumentov', 'Documents sharing and retrieval', 'Vo vĂ˝skume pracujĂş skupiny uÄŤiteÄľov a Ĺˇtudentov na jednotlivĂ˝ch projektoch, alebo vĂ˝skumnĂ˝ch tĂ©mach. Pri svojej prĂˇci potrebujĂş ÄŤasto ÄŤerpaĹĄ  z tĂ˝ch istĂ˝ch zdrojov, ÄŤĂ­taĹĄ tie istĂ© ÄŤlĂˇnky. Preto vznikĂˇ potreba nĂˇjsĹĄ spĂ´sob ako jednoducho zdielaĹĄ ÄŤlĂˇnky (v elektronickej forme) v hierarchii adresĂˇrov,  umoĹľĹovaĹĄ jednotlivĂ˝m ÄŤlenom skupiny hodnotiĹĄ ÄŤlĂˇnky, ÄŤi pridĂˇvaĹĄ k nim poznĂˇmky. ÄŽalej vytvĂˇraĹĄ referencie medzi ÄŤlĂˇnkami, ktorĂ© sa navzĂˇjom citujĂş, poprĂ­pade nachĂˇdzaĹĄ a poskytovaĹĄ na Internete ÄŤlĂˇnky podÄľa bibliografie, alebo kÄľĂşÄŤovĂ˝ch slov.
Analyzujte potreby vĂ˝skumnĂ˝ch skupĂ­n na zdielanie a sprĂ­stupĹovanie ÄŤlĂˇnkov v elektronickej forme a existujĂşce prĂ­stupy k tejto problematike. Navrhnite systĂ©m na zdielanie a sprĂ­stupĹovanie ÄŤlĂˇnkov a nĂˇvrh overte prototypom.
', 'Vo vĂ˝skume pracujĂş skupiny uÄŤiteÄľov a Ĺˇtudentov na jednotlivĂ˝ch projektoch, alebo vĂ˝skumnĂ˝ch tĂ©mach. Pri svojej prĂˇci potrebujĂş ÄŤasto ÄŤerpaĹĄ  z tĂ˝ch istĂ˝ch zdrojov, ÄŤĂ­taĹĄ tie istĂ© ÄŤlĂˇnky. Preto vznikĂˇ potreba nĂˇjsĹĄ spĂ´sob ako jednoducho zdielaĹĄ ÄŤlĂˇnky (v elektronickej forme) v hierarchii adresĂˇrov,  umoĹľĹovaĹĄ jednotlivĂ˝m ÄŤlenom skupiny hodnotiĹĄ ÄŤlĂˇnky, ÄŤi pridĂˇvaĹĄ k nim poznĂˇmky. ÄŽalej vytvĂˇraĹĄ referencie medzi ÄŤlĂˇnkami, ktorĂ© sa navzĂˇjom citujĂş, poprĂ­pade nachĂˇdzaĹĄ a poskytovaĹĄ na Internete ÄŤlĂˇnky podÄľa bibliografie, alebo kÄľĂşÄŤovĂ˝ch slov.
Analyzujte potreby vĂ˝skumnĂ˝ch skupĂ­n na zdielanie a sprĂ­stupĹovanie ÄŤlĂˇnkov v elektronickej forme a existujĂşce prĂ­stupy k tejto problematike. Navrhnite systĂ©m na zdielanie a sprĂ­stupĹovanie ÄŤlĂˇnkov a nĂˇvrh overte prototypom.
', 1);
INSERT INTO projects VALUES (478, 'DP', 579, NULL, 474, '2004/2005', 'SystĂ©m zĂ­skavania doplĹujĂşcich informĂˇciĂ­', 'SystĂ©m zĂ­skavania doplĹujĂşcich informĂˇciĂ­', NULL, NULL, 1);
INSERT INTO projects VALUES (479, 'ZP', 272, NULL, 475, '2003/2004', 'SystĂ©m pre generovanie fraktĂˇlov', 'System for generating fractals', 'Objekty v prĂ­rode sa vyznaÄŤujĂş svojou geometrickou nepravidelnosĹĄou. NepravidelnosĹĄ spĂ´sobuje znaÄŤnĂ© problĂ©my pri ich matematickom opise z hÄľadiska mnoĹľstva dĂˇt  potrebnĂ˝ch pre reprezentĂˇciu objektov. DanĂ© nedostatky je moĹľnĂ© rieĹˇiĹĄ pomocou modelovania vhodnĂ˝mi typmi fraktĂˇlov. Analyzujte problematiku fraktĂˇlovej geometrie. Vypracujte prehÄľad znĂˇmych typov fraktĂˇlov a ich matematickĂ©ho opisu. Navrhnite a implementujte systĂ©m umoĹľĹujĂşci generovanie, vizualizĂˇciu a nĂˇslednĂ© uchovanie vygenerovanĂ˝ch fraktĂˇlov v Äľubovolnom formĂˇte.', 'Objekty v prĂ­rode sa vyznaÄŤujĂş svojou geometrickou nepravidelnosĹĄou. NepravidelnosĹĄ spĂ´sobuje znaÄŤnĂ© problĂ©my pri ich matematickom opise z hÄľadiska mnoĹľstva dĂˇt  potrebnĂ˝ch pre reprezentĂˇciu objektov. DanĂ© nedostatky je moĹľnĂ© rieĹˇiĹĄ pomocou modelovania vhodnĂ˝mi typmi fraktĂˇlov. Analyzujte problematiku fraktĂˇlovej geometrie. Vypracujte prehÄľad znĂˇmych typov fraktĂˇlov a ich matematickĂ©ho opisu. Navrhnite a implementujte systĂ©m umoĹľĹujĂşci generovanie, vizualizĂˇciu a nĂˇslednĂ© uchovanie vygenerovanĂ˝ch fraktĂˇlov v Äľubovolnom formĂˇte.', 1);
INSERT INTO projects VALUES (480, 'DP', 294, NULL, 475, '2004/2005', 'Zobrazovanie grafov v prostredĂ­ virtuĂˇlnej reality', 'Zobrazovanie grafov v prostredĂ­ virtuĂˇlnej reality', NULL, NULL, 1);
INSERT INTO projects VALUES (481, 'DP', 433, NULL, 476, '2005/2006', 'KatalĂłg softvĂ©rovĂ˝ch znalostĂ­', 'Catalogue of software knowledge', NULL, NULL, 1);
INSERT INTO projects VALUES (482, 'ZP', 433, NULL, 476, '2003/2004', 'PrezentĂˇcia dokumentov pre Semantic Web', 'PrezentĂˇcia dokumentov pre Semantic Web', 'Analyzujte metĂłdy a prostriedky uchovĂˇvania a prezentĂˇcie dokumentov pre novĂş generĂˇciu siete Internet â€“ Semantic Web. Zamerajte sa pritom na reprezentĂˇciu RDF modelu a existujĂşce schĂ©my opisu dĂˇt. SkĂşmajte moĹľnosti automatizovanej extrakcie a pridĂˇvania metainformĂˇciĂ­ do existujĂşcich dokumentov. Navrhnite systĂ©m, ktorĂ˝ bude sprĂ­stupĹovaĹĄ archivovanĂ© dokumenty spolu s metainformĂˇciami, umoĹľnite sĂ©mantickĂ˝ prĂ­stup k systĂ©mu aj inĂ˝m agentom. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m web-systĂ©mu na centralizovanĂ© sprĂ­stupĹovanie publikovanĂ˝ch prĂˇc pracovnĂ­kov katedry. ', 'Analyzujte metĂłdy a prostriedky uchovĂˇvania a prezentĂˇcie dokumentov pre novĂş generĂˇciu siete Internet â€“ Semantic Web. Zamerajte sa pritom na reprezentĂˇciu RDF modelu a existujĂşce schĂ©my opisu dĂˇt. SkĂşmajte moĹľnosti automatizovanej extrakcie a pridĂˇvania metainformĂˇciĂ­ do existujĂşcich dokumentov. Navrhnite systĂ©m, ktorĂ˝ bude sprĂ­stupĹovaĹĄ archivovanĂ© dokumenty spolu s metainformĂˇciami, umoĹľnite sĂ©mantickĂ˝ prĂ­stup k systĂ©mu aj inĂ˝m agentom. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m web-systĂ©mu na centralizovanĂ© sprĂ­stupĹovanie publikovanĂ˝ch prĂˇc pracovnĂ­kov katedry. ', 1);
INSERT INTO projects VALUES (483, 'ZP', 705, NULL, 477, '2003/2004', 'SchĂ©matickĂ˝ editor logickĂ˝ch obvodov s hradlovou ĹˇtruktĂşrou', 'Gate-structure logical circuits editor', 'Treba navrhnĂşĹĄ programovĂ˝ systĂ©m vykonĂˇvajĂşci funkciu schĂ©matickĂ©ho editora logickĂ˝ch obvodov s hradlovou ĹˇtruktĂşrou. Editor mĂˇ umoĹľniĹĄ kresliĹĄ sĂ©riovo-paralelnĂ© a mostĂ­kovĂ© hradlovĂ© obvody. HradlovĂ˝ obvod okrem ĹˇtruktĂşrnej schĂ©my mĂˇ byĹĄ automaticky opĂ­sanĂ˝ prepojovacĂ­m predpisom. ', 'Treba navrhnĂşĹĄ programovĂ˝ systĂ©m vykonĂˇvajĂşci funkciu schĂ©matickĂ©ho editora logickĂ˝ch obvodov s hradlovou ĹˇtruktĂşrou. Editor mĂˇ umoĹľniĹĄ kresliĹĄ sĂ©riovo-paralelnĂ© a mostĂ­kovĂ© hradlovĂ© obvody. HradlovĂ˝ obvod okrem ĹˇtruktĂşrnej schĂ©my mĂˇ byĹĄ automaticky opĂ­sanĂ˝ prepojovacĂ­m predpisom. ', 0);
INSERT INTO projects VALUES (484, 'DP', 705, NULL, 477, '2004/2005', 'VirtuĂˇlna stavebnica logickĂ˝ch obvodov s hradlovou ĹˇtruktĂşrou', 'VirtuĂˇlna stavebnica logickĂ˝ch obvodov s hradlovou ĹˇtruktĂşrou', NULL, NULL, 0);
INSERT INTO projects VALUES (485, 'DP', 562, 358, 478, '2005/2006', 'ModifikĂˇcia meracieho systĂ©mu s PC', 'Modification of computer measurement system', NULL, NULL, 0);
INSERT INTO projects VALUES (486, 'ZP', 562, 358, 478, '2003/2004', 'ModifikĂˇcia meracieho systĂ©mu s PC', 'Modification of computer measurement system', 'Pre meracĂ­ systĂ©m merania zĂˇvislosti C-U a vĂ˝poÄŤtu profilu nosiÄŤov nĂˇboja v kremĂ­ku modifikujte riadiaci program podÄľa technologickej ĹˇpecifikĂˇcie,
OdskĂşĹˇajte riadiaci program meracieho systĂ©mu. Vypracujte dokumentĂˇciu a nĂˇvod na obsluhu
', 'Pre meracĂ­ systĂ©m merania zĂˇvislosti C-U a vĂ˝poÄŤtu profilu nosiÄŤov nĂˇboja v kremĂ­ku modifikujte riadiaci program podÄľa technologickej ĹˇpecifikĂˇcie,
OdskĂşĹˇajte riadiaci program meracieho systĂ©mu. Vypracujte dokumentĂˇciu a nĂˇvod na obsluhu
', 0);
INSERT INTO projects VALUES (487, 'ZP', 218, NULL, 479, '2002/2003', 'VyuĹľitie ÄŤĂ­nskej zvyĹˇkovej vety v kryptografii', 'The utilization of Chinese Remainder Theorem in Cryptography', NULL, NULL, 1);
INSERT INTO projects VALUES (488, 'DP', 660, NULL, 479, '2005/2006', 'PersonalizovanĂˇ navigĂˇcia v informaÄŤnom priestore', 'Personalized Navigation in An Information Space', NULL, NULL, 1);
INSERT INTO projects VALUES (489, 'ZP', 98, NULL, 480, '2003/2004', 'SystĂ©m pre odovzdĂˇvanie ĹˇtudentskĂ˝ch prĂˇc prostrednĂ­ctvom Internetu', 'SystĂ©m pre odovzdĂˇvanie ĹˇtudentskĂ˝ch prĂˇc prostrednĂ­ctvom Internetu', 'Analyzujte problematiku zberu a vyhodnocovania informĂˇciĂ­. Analyzujte moĹľnosti implementaÄŤnĂ˝ch prostriedkov vhodnĂ˝ch pre takĂ©to typy aplikĂˇciĂ­. PosĂşÄŹte moĹľnosti jazyka Java a jeho vĂ˝vojovĂ©ho a ladiaceho prostredia ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇciĂ­. Na zĂˇklade analĂ˝zy problĂ©mu navrhnite a vytvorte aplikĂˇciu vhodnĂş pre systĂ©m odovzdĂˇvania prĂˇc prostrednĂ­ctvom internetu.', 'Analyzujte problematiku zberu a vyhodnocovania informĂˇciĂ­. Analyzujte moĹľnosti implementaÄŤnĂ˝ch prostriedkov vhodnĂ˝ch pre takĂ©to typy aplikĂˇciĂ­. PosĂşÄŹte moĹľnosti jazyka Java a jeho vĂ˝vojovĂ©ho a ladiaceho prostredia ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇciĂ­. Na zĂˇklade analĂ˝zy problĂ©mu navrhnite a vytvorte aplikĂˇciu vhodnĂş pre systĂ©m odovzdĂˇvania prĂˇc prostrednĂ­ctvom internetu.', 1);
INSERT INTO projects VALUES (490, 'ZP', 704, NULL, 481, '2003/2004', 'DatabĂˇza zdrojovĂ˝ch textov materiĂˇlov pre kurzy virtuĂˇlnej univerzity (VU)', 'DatabĂˇza zdrojovĂ˝ch textov materiĂˇlov pre kurzy virtuĂˇlnej univerzity (VU)', 'Analyzujte moĹľnosti vytvĂˇrania DB zdrojovĂ˝ch materiĂˇlov pre tvorbu kurzov VU, ich katalogizĂˇciu, znovu-pouĹľĂ­vanie, prerĂˇbanie a viacuĹľĂ­vateÄľskĂ˝ prĂ­stup k nim. V sĂşvislosti s tĂ˝mto problĂ©mom sa hovorĂ­ o meta-dĂˇtach, aby boli informĂˇcie dostupnĂ©, dostaÄŤujĂşce a aby boli v Ĺˇtandardizovanom tvare (projekty IMS-EDUCASE a Ariadne).', 'Analyzujte moĹľnosti vytvĂˇrania DB zdrojovĂ˝ch materiĂˇlov pre tvorbu kurzov VU, ich katalogizĂˇciu, znovu-pouĹľĂ­vanie, prerĂˇbanie a viacuĹľĂ­vateÄľskĂ˝ prĂ­stup k nim. V sĂşvislosti s tĂ˝mto problĂ©mom sa hovorĂ­ o meta-dĂˇtach, aby boli informĂˇcie dostupnĂ©, dostaÄŤujĂşce a aby boli v Ĺˇtandardizovanom tvare (projekty IMS-EDUCASE a Ariadne).', 1);
INSERT INTO projects VALUES (491, 'DP', 431, NULL, 481, '2004/2005', 'RozĹˇĂ­renie vĂ˝uÄŤbovĂ©ho systĂ©mu konfigurĂˇcie smerovaÄŤov', 'RozĹˇĂ­renie vĂ˝uÄŤbovĂ©ho systĂ©mu konfigurĂˇcie smerovaÄŤov', NULL, NULL, 0);
INSERT INTO projects VALUES (492, 'DP', 704, NULL, 482, '2005/2006', 'VyhÄľadĂˇvanie znalostĂ­ v databĂˇze', 'Extracting knowledge from databases', NULL, NULL, 1);
INSERT INTO projects VALUES (493, 'ZP', 704, NULL, 482, '2003/2004', 'VyhÄľadĂˇvanie znalostĂ­ v databĂˇze', 'Information retrieval in database', 'Analyzujte problematiku  vyhÄľadĂˇvania  podstatnĂ˝ch informĂˇciĂ­ v databĂˇzach. Tieto informĂˇcie mĂ´Ĺľu byĹĄ rĂ´zneho typu (text, ÄŤĂ­sla ) a sĂş sĂşÄŤasĹĄou diagnĂłzy pacientov. Na zĂˇklade analĂ˝zy navrhnite programovĂ˝ systĂ©m ,ktorĂ˝ poskytne moĹľnosĹĄ experimentovaĹĄ so zĂ­skanĂ˝mi informĂˇciami a overte ho na Ăşdajoch z DB (existujĂşcej)o pacientoch.', 'Analyzujte problematiku  vyhÄľadĂˇvania  podstatnĂ˝ch informĂˇciĂ­ v databĂˇzach. Tieto informĂˇcie mĂ´Ĺľu byĹĄ rĂ´zneho typu (text, ÄŤĂ­sla ) a sĂş sĂşÄŤasĹĄou diagnĂłzy pacientov. Na zĂˇklade analĂ˝zy navrhnite programovĂ˝ systĂ©m ,ktorĂ˝ poskytne moĹľnosĹĄ experimentovaĹĄ so zĂ­skanĂ˝mi informĂˇciami a overte ho na Ăşdajoch z DB (existujĂşcej)o pacientoch.', 1);
INSERT INTO projects VALUES (494, 'ZP', 579, NULL, 483, '2002/2003', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS - 1', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS - 1', NULL, NULL, 1);
INSERT INTO projects VALUES (495, 'DP', 374, NULL, 483, '2004/2005', 'Prepojenie vĂ˝znamov objektov GIS', 'Prepojenie vĂ˝znamov objektov GIS', NULL, NULL, 1);
INSERT INTO projects VALUES (496, 'ZP', 374, NULL, 484, '2003/2004', 'SpoloÄŤenstvo agentov s jednoduchou spoluprĂˇcou', 'Community of Agents Showing Simple Cooperation', 'Analyzujte vlastnosti a moĹľnosti multi-agentovĂ˝ch systĂ©mov, zamerajte sa hlavne na komunikĂˇciu a spoluprĂˇcu agentov. PreskĂşmajte spĂ´soby spoluprĂˇce v spoloÄŤenstve agentov, zloĹľenom s jednĂ©ho organizaÄŤnĂ©ho a viacerĂ˝ch vĂ˝konnĂ˝ch agentov. OrganizaÄŤnĂ˝ agent zĂ­skava Ăşlohy a prideÄľuje ich tĂ˝m agentom, s ktorĂ˝mi sa dohodne na vykonanĂ­ Ăşlohy. VĂ˝konnĂ˝ agent vie spracovaĹĄ zvyÄŤajne jeden druh Ăşlohy a mĂ´Ĺľe maĹĄ aj krĂˇtky zĂˇsobnĂ­k Ăşloh. PonĂşkanĂş Ăşlohu mĂ´Ĺľe akceptovaĹĄ len ak ju vie vyrieĹˇiĹĄ a mĂˇ si ju kam uloĹľiĹĄ. Navrhnite prostredie, ktorĂ© umoĹľnĂ­ odskĂşĹˇaĹĄ viacerĂ© spĂ´soby komunikĂˇcie takĂ˝chto agentov. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu', 'Analyzujte vlastnosti a moĹľnosti multi-agentovĂ˝ch systĂ©mov, zamerajte sa hlavne na komunikĂˇciu a spoluprĂˇcu agentov. PreskĂşmajte spĂ´soby spoluprĂˇce v spoloÄŤenstve agentov, zloĹľenom s jednĂ©ho organizaÄŤnĂ©ho a viacerĂ˝ch vĂ˝konnĂ˝ch agentov. OrganizaÄŤnĂ˝ agent zĂ­skava Ăşlohy a prideÄľuje ich tĂ˝m agentom, s ktorĂ˝mi sa dohodne na vykonanĂ­ Ăşlohy. VĂ˝konnĂ˝ agent vie spracovaĹĄ zvyÄŤajne jeden druh Ăşlohy a mĂ´Ĺľe maĹĄ aj krĂˇtky zĂˇsobnĂ­k Ăşloh. PonĂşkanĂş Ăşlohu mĂ´Ĺľe akceptovaĹĄ len ak ju vie vyrieĹˇiĹĄ a mĂˇ si ju kam uloĹľiĹĄ. Navrhnite prostredie, ktorĂ© umoĹľnĂ­ odskĂşĹˇaĹĄ viacerĂ© spĂ´soby komunikĂˇcie takĂ˝chto agentov. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu', 1);
INSERT INTO projects VALUES (497, 'DP', 382, NULL, 484, '2004/2005', 'OptimalizĂˇcia Echo state neurĂłnovĂ˝ch sietĂ­ evoluÄŤnĂ˝mi algoritmami', 'OptimalizĂˇcia Echo state neurĂłnovĂ˝ch sietĂ­ evoluÄŤnĂ˝mi algoritmami', NULL, NULL, 1);
INSERT INTO projects VALUES (498, 'DP', 374, NULL, 486, '2005/2006', 'HrĂˇÄŤ pre simulovanĂ© hry typu RoboCup', 'The player in simulated environment of RoboCup games', NULL, NULL, 1);
INSERT INTO projects VALUES (499, 'ZP', 704, NULL, 486, '2002/2003', 'NĂˇvrh a implementĂˇcia problĂ©movo orientovanĂ©ho IS a nĂˇvrh vyĹˇpecifikovanej bĂˇzy dĂˇt', 'Design and implementation of problem oriented IS and design of specified database', 'NĂˇvrh a implementĂˇcia problĂ©movo orientovanĂ©ho IS a nĂˇvrh vyĹˇpecifikovanej bĂˇzy dĂˇt', 'NĂˇvrh a implementĂˇcia problĂ©movo orientovanĂ©ho IS a nĂˇvrh vyĹˇpecifikovanej bĂˇzy dĂˇt', 1);
INSERT INTO projects VALUES (500, 'ZP', 20, NULL, 487, '2005/2006', 'VizualizaÄŤnĂˇ a komunikaÄŤnĂˇ kniĹľnica pre platformu TwinCAT Backhoff PLC', 'VizualizaÄŤnĂˇ a komunikaÄŤnĂˇ kniĹľnica pre platformu TwinCAT Backhoff PLC', 'NĂˇstroj TwinCAT Beckhoff PLC umoĹľĹuje riadenie procesov v reĂˇlnom ÄŤase. Na rozdiel od klasickĂ˝ch hardvĂ©rovĂ˝ch PLC systĂ©mov pracuje na platforme Windows 2000/XP. KomunikĂˇcia s ostatnĂ˝mi Ăşlohami v systĂ©me mĂ´Ĺľe byĹĄ realizovanĂˇ prostrednĂ­ctvom ADS komunikĂˇcie, ÄŤi Ĺˇtandardnej OPC komunikĂˇcie. NaĹˇtudujte moĹľnosti realizovania komunikĂˇcie s uvedenĂ˝m systĂ©mom a vytvorte kniĹľnicu vizualizaÄŤnĂ˝ch komponent na platforme C#, komponenty pouĹľite vo vzorovej aplikĂˇcii vizualizĂˇcie jednoduchĂ©ho procesu.', 'NĂˇstroj TwinCAT Beckhoff PLC umoĹľĹuje riadenie procesov v reĂˇlnom ÄŤase. Na rozdiel od klasickĂ˝ch hardvĂ©rovĂ˝ch PLC systĂ©mov pracuje na platforme Windows 2000/XP. KomunikĂˇcia s ostatnĂ˝mi Ăşlohami v systĂ©me mĂ´Ĺľe byĹĄ realizovanĂˇ prostrednĂ­ctvom ADS komunikĂˇcie, ÄŤi Ĺˇtandardnej OPC komunikĂˇcie. NaĹˇtudujte moĹľnosti realizovania komunikĂˇcie s uvedenĂ˝m systĂ©mom a vytvorte kniĹľnicu vizualizaÄŤnĂ˝ch komponent na platforme C#, komponenty pouĹľite vo vzorovej aplikĂˇcii vizualizĂˇcie jednoduchĂ©ho procesu.', 1);
INSERT INTO projects VALUES (501, 'ZP', 387, NULL, 488, '2003/2004', 'Asistent pri ÄŤĂ­tanĂ­ internetovĂ˝ch novĂ­n', 'An asistant for reading the internet newpapers', 'MnohĂ© noviny prezentujĂş ÄŤlĂˇnky aj v Internetovej verzii. Obsah internetovĂ˝ch novĂ­n sa denne menĂ­ a tak poskytuje ÄŤitateÄľovi kaĹľdĂ˝ deĹ mnoĹľstvo novĂ˝ch ÄŤlĂˇnkov. TĂ©my, ktorĂ˝m sa noviny venujĂş sa pritom radikĂˇlne nemenia kaĹľdĂ˝ deĹ, ale ÄŤlĂˇnky venujĂşce sa nejakej tĂ©me, napr. voÄľbĂˇm, ĹˇportovĂ˝m majstrovstvĂˇm, alebo prĂ­rodnĂ˝m katastrofĂˇm, sa v novinĂˇch objavujĂş v rĂˇmci urÄŤitĂ©ho obdobia. VĂ˝ber ÄŤlĂˇnkov v novinĂˇch sa preto dĂˇ povaĹľovaĹĄ za ÄŤiastoÄŤne sa opakujĂşcu ÄŤinnosĹĄ. Na uÄľahÄŤenie vykonĂˇvania opakujĂşcich sa ÄŤinnostĂ­ sa pouĹľĂ­vajĂş personĂˇlni asistenti, ktorĂ­ pozorujĂş sprĂˇvanie sa pouĹľĂ­vateÄľa a pomĂˇhajĂş mu vykonĂˇvaĹĄ opakujĂşce sa ÄŤinnosti.
Analyzujte potreby a sprĂˇvanie sa pouĹľĂ­vateÄľov ÄŤĂ­tajĂşcich internetovĂ© noviny, metĂłdy uÄŤenia sa sprĂˇvania pouĹľĂ­vateÄľa v neustĂˇle sa meniacom prostredĂ­ a metĂłdy odporĂşÄŤania dokumentov. Navrhnite personĂˇlneho asistenta na odporĂşÄŤanie ÄŤlĂˇnkov internetovĂ˝ch novĂ­n. NĂˇvrh overte prototypom
', 'MnohĂ© noviny prezentujĂş ÄŤlĂˇnky aj v Internetovej verzii. Obsah internetovĂ˝ch novĂ­n sa denne menĂ­ a tak poskytuje ÄŤitateÄľovi kaĹľdĂ˝ deĹ mnoĹľstvo novĂ˝ch ÄŤlĂˇnkov. TĂ©my, ktorĂ˝m sa noviny venujĂş sa pritom radikĂˇlne nemenia kaĹľdĂ˝ deĹ, ale ÄŤlĂˇnky venujĂşce sa nejakej tĂ©me, napr. voÄľbĂˇm, ĹˇportovĂ˝m majstrovstvĂˇm, alebo prĂ­rodnĂ˝m katastrofĂˇm, sa v novinĂˇch objavujĂş v rĂˇmci urÄŤitĂ©ho obdobia. VĂ˝ber ÄŤlĂˇnkov v novinĂˇch sa preto dĂˇ povaĹľovaĹĄ za ÄŤiastoÄŤne sa opakujĂşcu ÄŤinnosĹĄ. Na uÄľahÄŤenie vykonĂˇvania opakujĂşcich sa ÄŤinnostĂ­ sa pouĹľĂ­vajĂş personĂˇlni asistenti, ktorĂ­ pozorujĂş sprĂˇvanie sa pouĹľĂ­vateÄľa a pomĂˇhajĂş mu vykonĂˇvaĹĄ opakujĂşce sa ÄŤinnosti.
Analyzujte potreby a sprĂˇvanie sa pouĹľĂ­vateÄľov ÄŤĂ­tajĂşcich internetovĂ© noviny, metĂłdy uÄŤenia sa sprĂˇvania pouĹľĂ­vateÄľa v neustĂˇle sa meniacom prostredĂ­ a metĂłdy odporĂşÄŤania dokumentov. Navrhnite personĂˇlneho asistenta na odporĂşÄŤanie ÄŤlĂˇnkov internetovĂ˝ch novĂ­n. NĂˇvrh overte prototypom
', 1);
INSERT INTO projects VALUES (502, 'DP', 387, NULL, 488, '2004/2005', 'VyuĹľitie pravdepodobnostnĂ˝ch modelov so skrytĂ˝mi premennĂ˝mi na odporĂşÄŤanie informĂˇciĂ­ ', 'VyuĹľitie pravdepodobnostnĂ˝ch modelov so skrytĂ˝mi premennĂ˝mi na odporĂşÄŤanie informĂˇciĂ­ ', NULL, NULL, 1);
INSERT INTO projects VALUES (503, 'ZP', 13, 431, 489, '2003/2004', 'GenerĂˇtor testov pre poruchy skratov v kombinaÄŤnĂ˝ch obvodoch', 'Test pattern generator for bridging faults in combinational circuits', 'a', 'a', 0);
INSERT INTO projects VALUES (504, 'DP', 13, 301, 489, '2004/2005', 'Platforma pre diĹˇtanÄŤnĂş elektronickĂş vĂ˝uÄŤbu diagnostiky  a testovateÄľnosti digitĂˇlnych systĂ©mov', 'Platforma pre diĹˇtanÄŤnĂş elektronickĂş vĂ˝uÄŤbu diagnostiky  a testovateÄľnosti digitĂˇlnych systĂ©mov', NULL, NULL, 0);
INSERT INTO projects VALUES (505, 'DP', 374, NULL, 490, '2005/2006', 'InformaÄŤnĂˇ podpora procesov ĂşzemnĂ©ho plĂˇnovania', 'Computer support of the processes of spatial planning using the scientific prototyping methodology', NULL, NULL, 1);
INSERT INTO projects VALUES (506, 'ZP', 46, NULL, 490, '2003/2004', 'Tvorba nĂˇvrhovĂ˝ch vzorov â€“ĹˇablĂłn', 'Tvorba nĂˇvrhovĂ˝ch vzorov â€“ĹˇablĂłn', 'PreĹˇtudujte si problematiku tvorby a pouĹľĂ­vanie parametrizovanĂ˝ch tried a generickĂ˝ch algoritmov  a ich ukladanie do kniĹľnĂ­c. SĂşstreÄŹte sa na tvorbu ĹˇablĂłn resp. nĂˇvrhovĂ˝ch vzorov vo vybranĂ˝ch objektovo orientovanĂ˝ch programovacĂ­ch jazykoch. Na zĂˇklade analĂ˝zy navrhnite a vytvorte kniĹľnicu pre vybranĂ© generickĂ© algoritmy vytvorenĂ© pomocou ĹˇablĂłn. SĂşÄŤasĹĄou vytvorenej kniĹľnice bude prĂ­ruÄŤka  - sprievodca   pre pouĹľĂ­vateÄľa ako vytvĂˇraĹĄ ĹˇablĂłny vo vybranom jazyku.  ', 'PreĹˇtudujte si problematiku tvorby a pouĹľĂ­vanie parametrizovanĂ˝ch tried a generickĂ˝ch algoritmov  a ich ukladanie do kniĹľnĂ­c. SĂşstreÄŹte sa na tvorbu ĹˇablĂłn resp. nĂˇvrhovĂ˝ch vzorov vo vybranĂ˝ch objektovo orientovanĂ˝ch programovacĂ­ch jazykoch. Na zĂˇklade analĂ˝zy navrhnite a vytvorte kniĹľnicu pre vybranĂ© generickĂ© algoritmy vytvorenĂ© pomocou ĹˇablĂłn. SĂşÄŤasĹĄou vytvorenej kniĹľnice bude prĂ­ruÄŤka  - sprievodca   pre pouĹľĂ­vateÄľa ako vytvĂˇraĹĄ ĹˇablĂłny vo vybranom jazyku.  ', 1);
INSERT INTO projects VALUES (507, 'DP', 374, NULL, 491, '2005/2006', 'Prostredie pre simulĂˇciu hry futsal', 'Prostredie pre simulĂˇciu hry futsal', NULL, NULL, 1);
INSERT INTO projects VALUES (508, 'ZP', 655, NULL, 491, '2003/2004', 'GenerĂˇtor symbolickĂ˝ch postupnostĂ­ pre neurĂłnovĂ© siete', 'Generator of symbolic sequences for neural networks', 'Pri trĂ©novanĂ­ a testovanĂ­ rekurentnĂ˝ch sietĂ­ vznika potreba spracĂşvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou, ako sĂş naprĂ­klad ÄŤasovĂ© postupnosti symbolov.  Na ich generovanie sa pouĹľĂ­vajĂş formalizmy slĂşĹľiace na opis jednotlivĂ˝ch tried gramatĂ­k (regulĂˇrne, bezkontextovĂ©, kontextovĂ© gramatiky), ktorĂ© sĂş rozĹˇĂ­renĂ© naprĂ­klad o pravdepodobnosti aplikovania odvodzovacĂ­ch pravidiel.
Navrhnite a vytvorte nĂˇstroj, ktorĂ˝ by umoĹľnil definovanie abecedy a gramatickĂ˝ch pravidiel s pravdepodobnosĹĄami pre generovanie symbolickĂ˝ch postupnostĂ­. SĂşÄŤasĹĄou nĂˇstroja by mala byĹĄ aj ĹˇtatistickĂˇ analĂ˝za vytvorenej postupnosti, t.j. naprĂ­klad urÄŤenie entropie danĂ©ho generĂˇtora s ohÄľadom na predikciu nasledujĂşceho symbolu, stanovenie prechodovĂ˝ch pravdepodobnostĂ­ po danej sekvencii symbolov a pod. VytvorenĂ© rieĹˇenie overte na vami navrhnutĂ˝ch a vytvorenĂ˝ch postupnostiach.', 'Pri trĂ©novanĂ­ a testovanĂ­ rekurentnĂ˝ch sietĂ­ vznika potreba spracĂşvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou, ako sĂş naprĂ­klad ÄŤasovĂ© postupnosti symbolov.  Na ich generovanie sa pouĹľĂ­vajĂş formalizmy slĂşĹľiace na opis jednotlivĂ˝ch tried gramatĂ­k (regulĂˇrne, bezkontextovĂ©, kontextovĂ© gramatiky), ktorĂ© sĂş rozĹˇĂ­renĂ© naprĂ­klad o pravdepodobnosti aplikovania odvodzovacĂ­ch pravidiel.
Navrhnite a vytvorte nĂˇstroj, ktorĂ˝ by umoĹľnil definovanie abecedy a gramatickĂ˝ch pravidiel s pravdepodobnosĹĄami pre generovanie symbolickĂ˝ch postupnostĂ­. SĂşÄŤasĹĄou nĂˇstroja by mala byĹĄ aj ĹˇtatistickĂˇ analĂ˝za vytvorenej postupnosti, t.j. naprĂ­klad urÄŤenie entropie danĂ©ho generĂˇtora s ohÄľadom na predikciu nasledujĂşceho symbolu, stanovenie prechodovĂ˝ch pravdepodobnostĂ­ po danej sekvencii symbolov a pod. VytvorenĂ© rieĹˇenie overte na vami navrhnutĂ˝ch a vytvorenĂ˝ch postupnostiach.', 1);
INSERT INTO projects VALUES (509, 'DP', 704, NULL, 492, '2005/2006', 'IntegrĂˇcia modulov sprĂˇvy CT snĂ­mok so zĂˇkladnĂ˝m IS NOCIS', 'Integration of Module for CT Images Management with IS NOCIS', NULL, NULL, 1);
INSERT INTO projects VALUES (510, 'ZP', 704, NULL, 492, '2003/2004', 'Spravovanie a vyuĹľitie CT snĂ­mkov pre podporu diagnĂłzy pacienta', 'CT Images Processing and Using CT Images for Diagnostics of Patients', 'Analyzujte sĂşÄŤasnĂ© moĹľnosti a metĂłdy prezerania, sprĂˇvy, exportu a vyhodnocovania  CT snĂ­mkov. Podstatnou Ăşlohou je nĂˇjsĹĄ a aplikovaĹĄ algoritmy pre ich   hodnotenie  vhodnou  metrikou, ktorou sa dajĂş vyhodnocovaĹĄ prĂ­padnĂ© zmeny poÄŤas sledovania stavu pacienta. Podmienkou  je  moĹľnosĹĄ  prezerania   a vyhodnocovania CT  snĂ­mkov   mimo  snĂ­macieho  zariadenia   CT. PrĂˇcu  moĹľno  rozdeliĹĄ  na  minimĂˇlne  tieto  ÄŤasti, resp. problĂ©my: Import/ Export  CT  snĂ­mkov, Experimentovanie s CT  snĂ­mkami, t.j. modifikĂˇcia objektu, vytvorenie  objektu, jeho  zobrazenie  v 2D a v 3D. Podmienkou  je  vĂ˝vojovĂ©  a  implementaÄŤnĂ©  prostredie  Borland  Delphi.', 'Analyzujte sĂşÄŤasnĂ© moĹľnosti a metĂłdy prezerania, sprĂˇvy, exportu a vyhodnocovania  CT snĂ­mkov. Podstatnou Ăşlohou je nĂˇjsĹĄ a aplikovaĹĄ algoritmy pre ich   hodnotenie  vhodnou  metrikou, ktorou sa dajĂş vyhodnocovaĹĄ prĂ­padnĂ© zmeny poÄŤas sledovania stavu pacienta. Podmienkou  je  moĹľnosĹĄ  prezerania   a vyhodnocovania CT  snĂ­mkov   mimo  snĂ­macieho  zariadenia   CT. PrĂˇcu  moĹľno  rozdeliĹĄ  na  minimĂˇlne  tieto  ÄŤasti, resp. problĂ©my: Import/ Export  CT  snĂ­mkov, Experimentovanie s CT  snĂ­mkami, t.j. modifikĂˇcia objektu, vytvorenie  objektu, jeho  zobrazenie  v 2D a v 3D. Podmienkou  je  vĂ˝vojovĂ©  a  implementaÄŤnĂ©  prostredie  Borland  Delphi.', 1);
INSERT INTO projects VALUES (511, 'DP', 541, NULL, 493, '2005/2006', 'InformaÄŤnĂ˝ systĂ©m pre mobilnĂş komunikĂˇciu', 'Information system for mobile communication', NULL, NULL, 1);
INSERT INTO projects VALUES (512, 'ZP', 387, NULL, 493, '2003/2004', 'ZdieÄľanie a sprĂ­stupĹovanie dokumentov', 'Sharing and accessing of documents', 'Vo vĂ˝skume pracujĂş skupiny uÄŤiteÄľov a Ĺˇtudentov na jednotlivĂ˝ch projektoch, alebo vĂ˝skumnĂ˝ch tĂ©mach. Pri svojej prĂˇci potrebujĂş ÄŤasto ÄŤerpaĹĄ  z tĂ˝ch istĂ˝ch zdrojov, ÄŤĂ­taĹĄ tie istĂ© ÄŤlĂˇnky. Preto vznikĂˇ potreba nĂˇjsĹĄ spĂ´sob ako jednoducho zdielaĹĄ ÄŤlĂˇnky (v elektronickej forme) v hierarchii adresĂˇrov,  umoĹľĹovaĹĄ jednotlivĂ˝m ÄŤlenom skupiny hodnotiĹĄ ÄŤlĂˇnky, ÄŤi pridĂˇvaĹĄ k nim poznĂˇmky. ÄŽalej vytvĂˇraĹĄ referencie medzi ÄŤlĂˇnkami, ktorĂ© sa navzĂˇjom citujĂş, poprĂ­pade nachĂˇdzaĹĄ a poskytovaĹĄ na Internete ÄŤlĂˇnky podÄľa bibliografie, alebo kÄľĂşÄŤovĂ˝ch slov.
Analyzujte potreby vĂ˝skumnĂ˝ch skupĂ­n na zdielanie a sprĂ­stupĹovanie ÄŤlĂˇnkov v elektronickej forme a existujĂşce prĂ­stupy k tejto problematike. Navrhnite systĂ©m na zdielanie a sprĂ­stupĹovanie ÄŤlĂˇnkov a nĂˇvrh overte prototypom.
', 'Vo vĂ˝skume pracujĂş skupiny uÄŤiteÄľov a Ĺˇtudentov na jednotlivĂ˝ch projektoch, alebo vĂ˝skumnĂ˝ch tĂ©mach. Pri svojej prĂˇci potrebujĂş ÄŤasto ÄŤerpaĹĄ  z tĂ˝ch istĂ˝ch zdrojov, ÄŤĂ­taĹĄ tie istĂ© ÄŤlĂˇnky. Preto vznikĂˇ potreba nĂˇjsĹĄ spĂ´sob ako jednoducho zdielaĹĄ ÄŤlĂˇnky (v elektronickej forme) v hierarchii adresĂˇrov,  umoĹľĹovaĹĄ jednotlivĂ˝m ÄŤlenom skupiny hodnotiĹĄ ÄŤlĂˇnky, ÄŤi pridĂˇvaĹĄ k nim poznĂˇmky. ÄŽalej vytvĂˇraĹĄ referencie medzi ÄŤlĂˇnkami, ktorĂ© sa navzĂˇjom citujĂş, poprĂ­pade nachĂˇdzaĹĄ a poskytovaĹĄ na Internete ÄŤlĂˇnky podÄľa bibliografie, alebo kÄľĂşÄŤovĂ˝ch slov.
Analyzujte potreby vĂ˝skumnĂ˝ch skupĂ­n na zdielanie a sprĂ­stupĹovanie ÄŤlĂˇnkov v elektronickej forme a existujĂşce prĂ­stupy k tejto problematike. Navrhnite systĂ©m na zdielanie a sprĂ­stupĹovanie ÄŤlĂˇnkov a nĂˇvrh overte prototypom.
', 1);
INSERT INTO projects VALUES (513, 'ZP', 660, NULL, 494, '2003/2004', 'CSIDC 2004', 'CSIDC 2004', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 1);
INSERT INTO projects VALUES (514, 'ZP', 437, NULL, 495, '2004/2005', 'SoftvĂ©r ako vĂ˝sledok technickej tvorivej duĹˇevnej ÄŤinnosti', 'SoftvĂ©r ako vĂ˝sledok technickej tvorivej duĹˇevnej ÄŤinnosti', 'UveÄŹte pojem softvĂ©r z pohÄľadu technickĂ©ho aj prĂˇvneho, priÄŤom uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Vysvetlite, akĂ© sĂş prĂˇva na softvĂ©r, ÄŤo je to ochrana takĂ˝chto prĂˇv, preÄŤo treba takĂ©to prĂˇva chrĂˇniĹĄ s dĂ´razom na etickĂ© a spoloÄŤenskĂ© sĂşvislosti. OpĂ­Ĺˇte znĂˇme prĂˇvne rieĹˇenia ochrany softvĂ©ru, priÄŤom opĂ¤ĹĄ uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Analyzujte sĂşÄŤasnĂ˝ stav, pomenujte prĂ­padnĂ© otvorenĂ© problĂ©my a naznaÄŤte moĹľnosti ich rieĹˇenia. O celej problematike vytvorte tĂ©matickĂ© pavuÄŤinovĂ© sĂ­dlo, ktorĂ© bude slĂşĹľiĹĄ ako zdroj informĂˇciĂ­ aj odkazov na ne. ', 'UveÄŹte pojem softvĂ©r z pohÄľadu technickĂ©ho aj prĂˇvneho, priÄŤom uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Vysvetlite, akĂ© sĂş prĂˇva na softvĂ©r, ÄŤo je to ochrana takĂ˝chto prĂˇv, preÄŤo treba takĂ©to prĂˇva chrĂˇniĹĄ s dĂ´razom na etickĂ© a spoloÄŤenskĂ© sĂşvislosti. OpĂ­Ĺˇte znĂˇme prĂˇvne rieĹˇenia ochrany softvĂ©ru, priÄŤom opĂ¤ĹĄ uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Analyzujte sĂşÄŤasnĂ˝ stav, pomenujte prĂ­padnĂ© otvorenĂ© problĂ©my a naznaÄŤte moĹľnosti ich rieĹˇenia. O celej problematike vytvorte tĂ©matickĂ© pavuÄŤinovĂ© sĂ­dlo, ktorĂ© bude slĂşĹľiĹĄ ako zdroj informĂˇciĂ­ aj odkazov na ne. ', 1);
INSERT INTO projects VALUES (515, 'ZP', 672, NULL, 496, '2003/2004', 'KomunikaÄŤnĂˇ sieĹĄ ako graf typu â€žmalĂ˝ svetâ€ś', 'Communication network as a graph  of the â€śsmall worldâ€ť', 'Siete â€žmalĂ©ho svetaâ€ś sĂş v sĂşÄŤasnosti v popredĂ­ zĂˇujmu matematikov a fyzikov.  Pomocou modelov â€žmalĂ©ho svetaâ€ś  mĂ´Ĺľeme  pochopiĹĄ ĹˇtruktĂşru sociĂˇlnych a komunikaÄŤnĂ˝ch sietĂ­, ako sietĂ­, ktorĂ© v sebe zahĹ•ĹajĂş jednak prvok nĂˇhodnosti, jednak prvok lokĂˇlnej usporiadanosti. Prvok nĂˇhodnosti je zodpovednĂ˝ za efektĂ­vnosĹĄ prepojenĂ­ uzlov v sieti a ich malĂş separĂˇciu, prvok usporiadanosti  za lokĂˇlnu ĹˇtruktĂşru uzlov a klasterizĂˇciu. Ăšlohou rieĹˇiteÄľa je: PreĹˇtudovaĹĄ teĂłriu sietĂ­ â€žmalĂ©ho svetaâ€ś a dostupnĂ© modely. AnalyzovaĹĄ prepojenosĹĄ a ĹˇtruktĂşru www strĂˇnok podÄľa vybranej ĹˇpecifikĂˇcie. NavrhnĂşĹĄ model prepojenĂ­ www strĂˇnok ako model â€žmalĂ©ho svetaâ€ś. OveriĹĄ funkÄŤnosĹĄ modelu.  PracovaĹĄ v Linuxe', 'Siete â€žmalĂ©ho svetaâ€ś sĂş v sĂşÄŤasnosti v popredĂ­ zĂˇujmu matematikov a fyzikov.  Pomocou modelov â€žmalĂ©ho svetaâ€ś  mĂ´Ĺľeme  pochopiĹĄ ĹˇtruktĂşru sociĂˇlnych a komunikaÄŤnĂ˝ch sietĂ­, ako sietĂ­, ktorĂ© v sebe zahĹ•ĹajĂş jednak prvok nĂˇhodnosti, jednak prvok lokĂˇlnej usporiadanosti. Prvok nĂˇhodnosti je zodpovednĂ˝ za efektĂ­vnosĹĄ prepojenĂ­ uzlov v sieti a ich malĂş separĂˇciu, prvok usporiadanosti  za lokĂˇlnu ĹˇtruktĂşru uzlov a klasterizĂˇciu. Ăšlohou rieĹˇiteÄľa je: PreĹˇtudovaĹĄ teĂłriu sietĂ­ â€žmalĂ©ho svetaâ€ś a dostupnĂ© modely. AnalyzovaĹĄ prepojenosĹĄ a ĹˇtruktĂşru www strĂˇnok podÄľa vybranej ĹˇpecifikĂˇcie. NavrhnĂşĹĄ model prepojenĂ­ www strĂˇnok ako model â€žmalĂ©ho svetaâ€ś. OveriĹĄ funkÄŤnosĹĄ modelu.  PracovaĹĄ v Linuxe', 1);
INSERT INTO projects VALUES (516, 'DP', 422, 297, 496, '2004/2005', 'MetĂłda grid computingu na rieĹˇenie ĹˇachovĂ˝ch Ăşloh', 'MetĂłda grid computingu na rieĹˇenie ĹˇachovĂ˝ch Ăşloh', NULL, NULL, 1);
INSERT INTO projects VALUES (517, 'DP', 20, NULL, 497, '2005/2006', 'Spracovanie ÄŤasovĂ˝ch postupnostĂ­ pomocou LSTM sietĂ­', 'Time series processing with LSTM networks', NULL, NULL, 1);
INSERT INTO projects VALUES (518, 'ZP', 20, NULL, 497, '2003/2004', 'Modely rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­ zaloĹľenĂ© na architekturĂˇlnom biase', 'Models of recurrent neural networks based on architectural bias', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch doprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasovou ĹˇtruktĂşrou. RekurentnĂ© siete inicializovanĂ© s malĂ˝mi vĂˇhami vykazujĂş pri spracovanĂ­ postupnostĂ­ symbolov vlastnosti markovovskĂ˝ch modelov â€“ ich stavovĂ˝ priestor odrĂˇĹľa histĂłriu symbolov prezentovanĂ˝ch sieti. TĂşto vlastnosĹĄ vyplĂ˝vajĂşcu z architektĂşry rekurentnej siete nazĂ˝vame architekturĂˇlny bias. 
CieÄľom projektu je lepĹˇie preskĂşmanie tejto vlastnosti experimentovanĂ­m s modelmi, ktorĂ˝ch rekurentnĂˇ ÄŤasĹĄ nie je trĂ©novanĂˇ, popr. je pevne nastavenĂˇ na urÄŤitĂ© hodnoty. Na problĂ©me predikcie nasledujĂşceho symbolu vstupnej postupnosti porovnajte vlastnosti tĂ˝chto modelov a vlastnosti markovovskĂ˝ch modelov. Je potrebnĂ© vytvoriĹĄ zodpovedajĂşce simulaÄŤnĂ© nĂˇstroje, zvoliĹĄ vhodnĂ© trĂ©novacie postupnosti, vykonaĹĄ potrebnĂ© experimenty a spracovaĹĄ ich vĂ˝sledky.
', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch doprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasovou ĹˇtruktĂşrou. RekurentnĂ© siete inicializovanĂ© s malĂ˝mi vĂˇhami vykazujĂş pri spracovanĂ­ postupnostĂ­ symbolov vlastnosti markovovskĂ˝ch modelov â€“ ich stavovĂ˝ priestor odrĂˇĹľa histĂłriu symbolov prezentovanĂ˝ch sieti. TĂşto vlastnosĹĄ vyplĂ˝vajĂşcu z architektĂşry rekurentnej siete nazĂ˝vame architekturĂˇlny bias. 
CieÄľom projektu je lepĹˇie preskĂşmanie tejto vlastnosti experimentovanĂ­m s modelmi, ktorĂ˝ch rekurentnĂˇ ÄŤasĹĄ nie je trĂ©novanĂˇ, popr. je pevne nastavenĂˇ na urÄŤitĂ© hodnoty. Na problĂ©me predikcie nasledujĂşceho symbolu vstupnej postupnosti porovnajte vlastnosti tĂ˝chto modelov a vlastnosti markovovskĂ˝ch modelov. Je potrebnĂ© vytvoriĹĄ zodpovedajĂşce simulaÄŤnĂ© nĂˇstroje, zvoliĹĄ vhodnĂ© trĂ©novacie postupnosti, vykonaĹĄ potrebnĂ© experimenty a spracovaĹĄ ich vĂ˝sledky.
', 1);
INSERT INTO projects VALUES (519, 'DP', 566, NULL, 498, '2005/2006', 'Emergencia stratĂ©gie v multiagentovĂ˝ch systĂ©moch', 'Strategy emergence in multiagent systems', NULL, NULL, 1);
INSERT INTO projects VALUES (520, 'ZP', 374, NULL, 498, '2003/2004', 'SpoloÄŤenstvo agentov s jednoduchou spoluprĂˇcou', 'Agents community with simple kind of communication', 'Analyzujte vlastnosti a moĹľnosti multi-agentovĂ˝ch systĂ©mov, zamerajte sa hlavne na komunikĂˇciu a spoluprĂˇcu agentov. PreskĂşmajte spĂ´soby spoluprĂˇce v spoloÄŤenstve agentov, zloĹľenom s jednĂ©ho organizaÄŤnĂ©ho a viacerĂ˝ch vĂ˝konnĂ˝ch agentov. OrganizaÄŤnĂ˝ agent zĂ­skava Ăşlohy a prideÄľuje ich tĂ˝m agentom, s ktorĂ˝mi sa dohodne na vykonanĂ­ Ăşlohy. VĂ˝konnĂ˝ agent vie spracovaĹĄ zvyÄŤajne jeden druh Ăşlohy a mĂ´Ĺľe maĹĄ aj krĂˇtky zĂˇsobnĂ­k Ăşloh. PonĂşkanĂş Ăşlohu mĂ´Ĺľe akceptovaĹĄ len ak ju vie vyrieĹˇiĹĄ a mĂˇ si ju kam uloĹľiĹĄ. Navrhnite prostredie, ktorĂ© umoĹľnĂ­ odskĂşĹˇaĹĄ viacerĂ© spĂ´soby komunikĂˇcie takĂ˝chto agentov. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu', 'Analyzujte vlastnosti a moĹľnosti multi-agentovĂ˝ch systĂ©mov, zamerajte sa hlavne na komunikĂˇciu a spoluprĂˇcu agentov. PreskĂşmajte spĂ´soby spoluprĂˇce v spoloÄŤenstve agentov, zloĹľenom s jednĂ©ho organizaÄŤnĂ©ho a viacerĂ˝ch vĂ˝konnĂ˝ch agentov. OrganizaÄŤnĂ˝ agent zĂ­skava Ăşlohy a prideÄľuje ich tĂ˝m agentom, s ktorĂ˝mi sa dohodne na vykonanĂ­ Ăşlohy. VĂ˝konnĂ˝ agent vie spracovaĹĄ zvyÄŤajne jeden druh Ăşlohy a mĂ´Ĺľe maĹĄ aj krĂˇtky zĂˇsobnĂ­k Ăşloh. PonĂşkanĂş Ăşlohu mĂ´Ĺľe akceptovaĹĄ len ak ju vie vyrieĹˇiĹĄ a mĂˇ si ju kam uloĹľiĹĄ. Navrhnite prostredie, ktorĂ© umoĹľnĂ­ odskĂşĹˇaĹĄ viacerĂ© spĂ´soby komunikĂˇcie takĂ˝chto agentov. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu', 1);
INSERT INTO projects VALUES (521, 'ZP', 374, NULL, 499, '2003/2004', 'MobilnĂ© agenty', 'Mobile agents', 'Analyzujte vlastnosti a moĹľnosti multi-agentovĂ˝ch systĂ©mov, zamerajte sa hlavne na mobilitu agentov. PreskĂşmajte spĂ´soby vytvĂˇrania hostiteÄľskĂ˝ch prostredĂ­ pre mobilnĂ© agenty v rĂ´znych operaÄŤnĂ˝ch systĂ©moch a podporu, ktorĂş poskytujĂş kniĹľnice jazyka C (C++). Ĺ pecifikujte podstatnĂ© vlastnosti, ktorĂ© zabezpeÄŤia mobilitu agenta. Navrhnite hostiteÄľskĂ© prostredie a jednoduchĂ©ho agenta, ktorĂ˝ je schopnĂ˝ podÄľa urÄŤenĂ©ho plĂˇnu cestovaĹĄ medzi zvolenĂ˝mi poÄŤĂ­taÄŤmi. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu.', 'Analyzujte vlastnosti a moĹľnosti multi-agentovĂ˝ch systĂ©mov, zamerajte sa hlavne na mobilitu agentov. PreskĂşmajte spĂ´soby vytvĂˇrania hostiteÄľskĂ˝ch prostredĂ­ pre mobilnĂ© agenty v rĂ´znych operaÄŤnĂ˝ch systĂ©moch a podporu, ktorĂş poskytujĂş kniĹľnice jazyka C (C++). Ĺ pecifikujte podstatnĂ© vlastnosti, ktorĂ© zabezpeÄŤia mobilitu agenta. Navrhnite hostiteÄľskĂ© prostredie a jednoduchĂ©ho agenta, ktorĂ˝ je schopnĂ˝ podÄľa urÄŤenĂ©ho plĂˇnu cestovaĹĄ medzi zvolenĂ˝mi poÄŤĂ­taÄŤmi. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu.', 1);
INSERT INTO projects VALUES (522, 'DP', 374, NULL, 499, '2004/2005', 'VyuĹľitie platforiem pre mobilnĂ© agenty', 'VyuĹľitie platforiem pre mobilnĂ© agenty', NULL, NULL, 1);
INSERT INTO projects VALUES (523, 'ZP', 361, NULL, 500, '2003/2004', 'VyuĹľitie WANPIPE â€“ smerovaÄŤa', 'Utilization of WANIPIPE - router', 'Analyzujte sĂşÄŤasnĂ© moĹľnosti WAN - LAN spojenia, problematiku IP adresovania (IP adresy, triedy, and sieĹĄovĂ© masky) a WANPIPE- smerovaÄŤa (spoÄľahlivosĹĄ, Ăşspora, ĹˇpecifikĂˇcia, etc.). Navrhnite  a implementujte WAN - LAN spojenie  pomocou    WANPIPE- smerovaÄŤa. RieĹˇenie porovnajte s inĂ˝mi rieĹˇeniami z hÄľadiska technicko â€“ ekonomickĂ˝ch parametrov.', 'Analyzujte sĂşÄŤasnĂ© moĹľnosti WAN - LAN spojenia, problematiku IP adresovania (IP adresy, triedy, and sieĹĄovĂ© masky) a WANPIPE- smerovaÄŤa (spoÄľahlivosĹĄ, Ăşspora, ĹˇpecifikĂˇcia, etc.). Navrhnite  a implementujte WAN - LAN spojenie  pomocou    WANPIPE- smerovaÄŤa. RieĹˇenie porovnajte s inĂ˝mi rieĹˇeniami z hÄľadiska technicko â€“ ekonomickĂ˝ch parametrov.', 0);
INSERT INTO projects VALUES (524, 'DP', 361, NULL, 500, '2005/2006', 'VyuĹľitie smerovaÄŤov', 'VyuĹľitie smerovaÄŤov', NULL, NULL, 0);
INSERT INTO projects VALUES (525, 'DP', 297, NULL, 501, '2005/2006', 'IntegrovanĂ© prostredie na tvorbu sĂşborov', 'An integrated development environment for creating source files', NULL, NULL, 1);
INSERT INTO projects VALUES (526, 'ZP', 433, NULL, 501, '2003/2004', 'Podpora vĂ˝beru vhodnej technolĂłgie spracovania textovĂ˝ch dokumentov', 'Support for choosing convenient technology of text document processing', 'Analyzujte sĂşÄŤasnĂ© metĂłdy a jazyky generovania textovĂ˝ch dokumentov (PHP, XML/XSLT, JSP, Perl  a pod.), pouĹľĂ­vanĂ© vo web-aplikĂˇciĂˇch. Navrhnite a vytvorte sadu  prĂ­kladov so vzorovĂ˝m rieĹˇenĂ­m pre jednotlivĂ© technolĂłgie. VytvorenĂ© prĂ­klady sprĂ­stupnite na pavuÄŤine ako ĹˇtudijnĂ˝ materiĂˇl k danĂ˝m technolĂłgiĂˇm. Na podporu vĂ˝beru navrhnite a vykonajte sadu testov vĂ˝konnosti jednotlivĂ˝ch technolĂłgiĂ­ a ich vĂ˝sledky vyhodnoĹĄte. Navrhnite a protypom overte interaktĂ­vnu web-aplikĂˇciu, ktorĂˇ umoĹľnĂ­ jednoduchĂ© vizuĂˇlne prototypovanie rieĹˇenia pre zvolenĂ© problĂ©my transformĂˇcie a generovania (hyper)textovĂ˝ch dokumentov.', 'Analyzujte sĂşÄŤasnĂ© metĂłdy a jazyky generovania textovĂ˝ch dokumentov (PHP, XML/XSLT, JSP, Perl  a pod.), pouĹľĂ­vanĂ© vo web-aplikĂˇciĂˇch. Navrhnite a vytvorte sadu  prĂ­kladov so vzorovĂ˝m rieĹˇenĂ­m pre jednotlivĂ© technolĂłgie. VytvorenĂ© prĂ­klady sprĂ­stupnite na pavuÄŤine ako ĹˇtudijnĂ˝ materiĂˇl k danĂ˝m technolĂłgiĂˇm. Na podporu vĂ˝beru navrhnite a vykonajte sadu testov vĂ˝konnosti jednotlivĂ˝ch technolĂłgiĂ­ a ich vĂ˝sledky vyhodnoĹĄte. Navrhnite a protypom overte interaktĂ­vnu web-aplikĂˇciu, ktorĂˇ umoĹľnĂ­ jednoduchĂ© vizuĂˇlne prototypovanie rieĹˇenia pre zvolenĂ© problĂ©my transformĂˇcie a generovania (hyper)textovĂ˝ch dokumentov.', 1);
INSERT INTO projects VALUES (527, 'ZP', 25, NULL, 502, '2005/2006', 'Riadenie vytvĂˇrania procesov', 'Riadenie vytvĂˇrania procesov', 'Analyzujte mechanizmus vytvĂˇrania procesov v OS Unix. Navrhnite rozĹˇĂ­renie jadra OS, ktorĂ© umoĹľnĂ­ sledovaĹĄ, obmedziĹĄ, resp. modifikovaĹĄ postup vytvĂˇrania novĂ˝ch procesov, v zĂˇvislosti od zadanej konfigurĂˇcie, ktorĂˇ bude zaloĹľenĂˇ na relevantnĂ˝ch parametroch (napr. pouĹľĂ­vateÄľ, skupina, prĂ­kaz, argumenty) prĂ­padne celkovom stave systĂ©mu (vyĹĄaĹľenie, poÄŤet beĹľiacich procesov, atÄŹ.). RieĹˇenie implmentujte a otestujte.', 'Analyzujte mechanizmus vytvĂˇrania procesov v OS Unix. Navrhnite rozĹˇĂ­renie jadra OS, ktorĂ© umoĹľnĂ­ sledovaĹĄ, obmedziĹĄ, resp. modifikovaĹĄ postup vytvĂˇrania novĂ˝ch procesov, v zĂˇvislosti od zadanej konfigurĂˇcie, ktorĂˇ bude zaloĹľenĂˇ na relevantnĂ˝ch parametroch (napr. pouĹľĂ­vateÄľ, skupina, prĂ­kaz, argumenty) prĂ­padne celkovom stave systĂ©mu (vyĹĄaĹľenie, poÄŤet beĹľiacich procesov, atÄŹ.). RieĹˇenie implmentujte a otestujte.', 0);
INSERT INTO projects VALUES (528, 'DP', 24, NULL, 503, '2005/2006', 'OptimalizĂˇcia Ăşloh prepravy', 'TRANSPORT TASKS OPTIMALIZATION', NULL, NULL, 1);
INSERT INTO projects VALUES (529, 'ZP', 24, NULL, 503, '2003/2004', 'AlgoritmizĂˇcia v prĂ­kladoch â€“ vyhÄľadĂˇvanie', 'Algorithms in examples â€“ searching', 'Analyzujte vybranĂ© algoritmickĂ© metĂłdy vyuĹľĂ­vanĂ© v databĂˇzovĂ˝ch systĂ©moch (prehÄľadĂˇvanie a usporadĂşvanie zĂˇznamov)  z hÄľadiska ich vyuĹľitia v sĂşÄŤasnĂ˝ch softvĂ©rovĂ˝ch aplikĂˇciĂˇch. Porovnajte jednotlivĂ© metĂłdy podÄľa vybranĂ˝ch kritĂ©riĂ­. Spracujte  vybranĂ© algoritmy do mnoĹľiny  prĂ­kladov vo forme  hypertextu, s presne stanovenou ĹˇtruktĂşrou. Ĺ truktĂşra bude odrĂˇĹľaĹĄ ĹľivotnĂ˝ cyklus programu a zĂˇroveĹ algoritmy rovnakĂ©ho typu budĂş vyhodnocovanĂ© na reprezentatĂ­vnej vzorke Ăşdajov a navzĂˇjom porovnĂˇvanĂ©.  Vizualizujte  prezentĂˇciu vykonĂˇvania algoritmov.', 'Analyzujte vybranĂ© algoritmickĂ© metĂłdy vyuĹľĂ­vanĂ© v databĂˇzovĂ˝ch systĂ©moch (prehÄľadĂˇvanie a usporadĂşvanie zĂˇznamov)  z hÄľadiska ich vyuĹľitia v sĂşÄŤasnĂ˝ch softvĂ©rovĂ˝ch aplikĂˇciĂˇch. Porovnajte jednotlivĂ© metĂłdy podÄľa vybranĂ˝ch kritĂ©riĂ­. Spracujte  vybranĂ© algoritmy do mnoĹľiny  prĂ­kladov vo forme  hypertextu, s presne stanovenou ĹˇtruktĂşrou. Ĺ truktĂşra bude odrĂˇĹľaĹĄ ĹľivotnĂ˝ cyklus programu a zĂˇroveĹ algoritmy rovnakĂ©ho typu budĂş vyhodnocovanĂ© na reprezentatĂ­vnej vzorke Ăşdajov a navzĂˇjom porovnĂˇvanĂ©.  Vizualizujte  prezentĂˇciu vykonĂˇvania algoritmov.', 1);
INSERT INTO projects VALUES (530, 'ZP', 447, NULL, 504, '2004/2005', 'xxxx', 'xxxx', 'xxx.', 'xxx.', 1);
INSERT INTO projects VALUES (531, 'DP', 10, NULL, 505, '2005/2006', 'SimulovanĂ˝ robotickĂ˝ futbal - tĂ­movĂˇ spoluprĂˇca', 'RoboCup - team cooperation', NULL, NULL, 1);
INSERT INTO projects VALUES (532, 'ZP', 46, NULL, 505, '2003/2004', 'Podpora objektovo orientovanĂ©ho nĂˇvrhu', 'Support of object oriented design', 'V sĂşÄŤasnej dobe existuje viacero metĂłd podporujĂşcich objektovo orientovanĂş analĂ˝zu a nĂˇvrh, ktorĂ© stanovujĂş postupnosĹĄ ÄŤinnostĂ­ pri vytvĂˇranĂ­ softvĂ©rovĂ©ho systĂ©mu. Analyzujte metĂłdy, ktorĂ© vychĂˇdzajĂş z podpory notĂˇcie UML.  Na zĂˇklade vybranej metĂłdy navrhnite a implementujte objektovo orientovanĂş aplikĂˇciu. Proces tvorby vybranej aplikĂˇcie  prezentujte formou demo prostriedku v tvare vhodnom na prezentĂˇciu. NavrhnutĂ© rieĹˇenie overte. Pri vizualizĂˇcii procesu tvorby programovĂ©ho systĂ©mu vyuĹľite Rational Rose. ', 'V sĂşÄŤasnej dobe existuje viacero metĂłd podporujĂşcich objektovo orientovanĂş analĂ˝zu a nĂˇvrh, ktorĂ© stanovujĂş postupnosĹĄ ÄŤinnostĂ­ pri vytvĂˇranĂ­ softvĂ©rovĂ©ho systĂ©mu. Analyzujte metĂłdy, ktorĂ© vychĂˇdzajĂş z podpory notĂˇcie UML.  Na zĂˇklade vybranej metĂłdy navrhnite a implementujte objektovo orientovanĂş aplikĂˇciu. Proces tvorby vybranej aplikĂˇcie  prezentujte formou demo prostriedku v tvare vhodnom na prezentĂˇciu. NavrhnutĂ© rieĹˇenie overte. Pri vizualizĂˇcii procesu tvorby programovĂ©ho systĂ©mu vyuĹľite Rational Rose. ', 1);
INSERT INTO projects VALUES (533, 'ZP', 541, NULL, 506, '2003/2004', 'ZĂˇlohovanie a obnova dĂˇt v databĂˇzach', 'Database backup and recovery', 'Analyzujte metĂłdy a prostriedky zĂˇlohovania a obnovy dĂˇt v relaÄŤnĂ˝ch databĂˇzovĂ˝ch systĂ©moch. Definujte vĂ˝hody a nedostatky zĂˇlohovania a obnovy dĂˇt v DBS Oracle. Navrhnite moĹľnĂ© metĂłdy zlepĹˇenia a rozĹˇĂ­renia funkciĂ­ zĂˇlohovania a obnovy dĂˇt. VybratĂ©  metĂłdy implementujte v prostredĂ­ Oracle. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade.', 'Analyzujte metĂłdy a prostriedky zĂˇlohovania a obnovy dĂˇt v relaÄŤnĂ˝ch databĂˇzovĂ˝ch systĂ©moch. Definujte vĂ˝hody a nedostatky zĂˇlohovania a obnovy dĂˇt v DBS Oracle. Navrhnite moĹľnĂ© metĂłdy zlepĹˇenia a rozĹˇĂ­renia funkciĂ­ zĂˇlohovania a obnovy dĂˇt. VybratĂ©  metĂłdy implementujte v prostredĂ­ Oracle. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade.', 1);
INSERT INTO projects VALUES (534, 'DP', 358, NULL, 506, '2004/2005', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Testovanie bezpeÄŤnostnĂ˝ch slabĂ­n poÄŤĂ­taÄŤovĂ˝ch sietĂ­', NULL, NULL, 0);
INSERT INTO projects VALUES (535, 'ZP', 221, NULL, 507, '2002/2003', 'KryptoanalĂ˝za binĂˇrnych postupnostĂ­ pouĹľitĂ­m FCSR (spatnovĂ¤zbovĂ˝ch posuvnĂ˝ch registrov s prenosom)', 'KryptoanalĂ˝za binĂˇrnych postupnostĂ­ pouĹľitĂ­m FCSR (spatnovĂ¤zbovĂ˝ch posuvnĂ˝ch registrov s prenosom)', NULL, NULL, 1);
INSERT INTO projects VALUES (536, 'DP', 342, NULL, 507, '2004/2005', 'ProgramovĂˇ podpora vĂ˝uÄŤby nĂˇvrhu a projektovania poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'ProgramovĂˇ podpora vĂ˝uÄŤby nĂˇvrhu a projektovania poÄŤĂ­taÄŤovĂ˝ch sietĂ­', NULL, NULL, 0);
INSERT INTO projects VALUES (537, 'DP', 252, 46, 508, '2005/2006', 'PouĹľitie nĂˇstroja pre sledovanie ÄŤinnosti programu pomocou databĂˇzy symbolov v ladiacom mode', 'Monitoring of software system in graphical mode', NULL, NULL, 1);
INSERT INTO projects VALUES (538, 'ZP', 252, 46, 508, '2002/2003', 'NĂˇvrh konceptov pre sledovanie ÄŤinnosti programu', 'NĂˇvrh konceptov pre sledovanie ÄŤinnosti programu', NULL, NULL, 1);
INSERT INTO projects VALUES (539, 'ZP', 46, NULL, 509, '2003/2004', 'Podpora objektovo orientovanĂ©ho nĂˇvrhu', 'The support of object oriented  analysis and design', 'V sĂşÄŤasnej dobe existuje viacero metĂłd podporujĂşcich objektovo orientovanĂş analĂ˝zu a nĂˇvrh, ktorĂ© stanovujĂş postupnosĹĄ ÄŤinnostĂ­ pri vytvĂˇranĂ­ softvĂ©rovĂ©ho systĂ©mu. Analyzujte metĂłdy, ktorĂ© vychĂˇdzajĂş z podpory notĂˇcie UML.  Na zĂˇklade vybranej metĂłdy navrhnite a implementujte objektovo orientovanĂş aplikĂˇciu. Proces tvorby vybranej aplikĂˇcie  prezentujte    formou demo prostriedku v tvare vhodnom na prezentĂˇciu. NavrhnutĂ© rieĹˇenie overte. Pri vizualizĂˇcii procesu tvorby programovĂ©ho systĂ©mu vyuĹľite Rational Rose. ', 'V sĂşÄŤasnej dobe existuje viacero metĂłd podporujĂşcich objektovo orientovanĂş analĂ˝zu a nĂˇvrh, ktorĂ© stanovujĂş postupnosĹĄ ÄŤinnostĂ­ pri vytvĂˇranĂ­ softvĂ©rovĂ©ho systĂ©mu. Analyzujte metĂłdy, ktorĂ© vychĂˇdzajĂş z podpory notĂˇcie UML.  Na zĂˇklade vybranej metĂłdy navrhnite a implementujte objektovo orientovanĂş aplikĂˇciu. Proces tvorby vybranej aplikĂˇcie  prezentujte    formou demo prostriedku v tvare vhodnom na prezentĂˇciu. NavrhnutĂ© rieĹˇenie overte. Pri vizualizĂˇcii procesu tvorby programovĂ©ho systĂ©mu vyuĹľite Rational Rose. ', 1);
INSERT INTO projects VALUES (540, 'DP', 46, NULL, 509, '2004/2005', 'Podpora objektovo orientovanĂ©ho nĂˇvrhu', 'Podpora objektovo orientovanĂ©ho nĂˇvrhu', NULL, NULL, 1);
INSERT INTO projects VALUES (541, 'DP', 374, NULL, 510, '2005/2006', 'InformaÄŤnĂˇ podpora procesov ĂşzemnĂ©ho plĂˇnovania', 'INFORMATION SUPPORT OF SPATIAL DEVELOPMENT PROCESSES', NULL, NULL, 1);
INSERT INTO projects VALUES (542, 'ZP', 660, NULL, 510, '2003/2004', 'CSIDC 2004', 'CSIDC 2004', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 1);
INSERT INTO projects VALUES (543, 'DP', 549, 298, 511, '2003/2004', 'ProgramovĂ˝ systĂ©m pre meranie s programovateÄľnĂ˝mi meracĂ­mi prĂ­strojmi', 'ProgramovĂ˝ systĂ©m pre meranie s programovateÄľnĂ˝mi meracĂ­mi prĂ­strojmi', NULL, NULL, 0);
INSERT INTO projects VALUES (544, 'ZP', 563, NULL, 512, '2002/2003', 'OsciloskopickĂˇ karta pre PC', 'Oscilloscope card for PC', NULL, NULL, 0);
INSERT INTO projects VALUES (545, 'DP', 705, NULL, 512, '2003/2004', 'AutomatickĂ˝ detektor dynamickĂ˝ch hazardov', 'Automatic detector of dynamic hazards', NULL, NULL, 0);
INSERT INTO projects VALUES (546, 'DP', 98, NULL, 513, '2005/2006', 'Generovanie a rozpoznĂˇvanie digitĂˇlnych grafickĂ˝ch objektov', 'Digital graphical objects generation and recognition', NULL, NULL, 1);
INSERT INTO projects VALUES (547, 'ZP', 98, NULL, 513, '2003/2004', 'SystĂ©m pre odovzdĂˇvanie ĹˇtudentskĂ˝ch prĂˇc prostrednĂ­ctvom Internetu', 'System for dispatching student works through internet', 'Analyzujte problematiku zberu a vyhodnocovania informĂˇciĂ­. Analyzujte moĹľnosti implementaÄŤnĂ˝ch prostriedkov vhodnĂ˝ch pre takĂ©to typy aplikĂˇciĂ­. PosĂşÄŹte moĹľnosti Perlu a jeho vĂ˝vojovĂ©ho a ladiaceho prostredia ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇciĂ­. Na zĂˇklade analĂ˝zy problĂ©mu navrhnite a vytvorte aplikĂˇciu vhodnĂş pre systĂ©m odovzdĂˇvania prĂˇc prostrednĂ­ctvom internetu', 'Analyzujte problematiku zberu a vyhodnocovania informĂˇciĂ­. Analyzujte moĹľnosti implementaÄŤnĂ˝ch prostriedkov vhodnĂ˝ch pre takĂ©to typy aplikĂˇciĂ­. PosĂşÄŹte moĹľnosti Perlu a jeho vĂ˝vojovĂ©ho a ladiaceho prostredia ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇciĂ­. Na zĂˇklade analĂ˝zy problĂ©mu navrhnite a vytvorte aplikĂˇciu vhodnĂş pre systĂ©m odovzdĂˇvania prĂˇc prostrednĂ­ctvom internetu', 1);
INSERT INTO projects VALUES (548, 'DP', 359, NULL, 514, '2005/2006', 'ProgramovĂˇ podpora simulĂˇcie vybranĂ˝ch meranĂ­ na elektrickĂ˝ch strojoch ', 'ProgramovĂˇ podpora simulĂˇcie vybranĂ˝ch meranĂ­ na elektrickĂ˝ch strojoch ', NULL, NULL, 0);
INSERT INTO projects VALUES (549, 'ZP', 375, NULL, 514, '2003/2004', 'SystĂ©m pre podporu e-vzdelĂˇvania', 'systĂ©m pre podporu e-vzdelĂˇvania', 'Analyzujte rĂ´zne vĂ˝uÄŤbovĂ© systĂ©my, ktorĂ© podporujĂş uÄŤenie sa elektronickou formou. Pri analĂ˝ze sa zamerajte najmĂ¤ na metodiku sprĂˇvy kurzov e-vzdelĂˇvania. Navrhnite a implementujte modulĂˇrny programovĂ˝ systĂ©m, ktorĂ˝ poskytne dostatoÄŤne univerzĂˇlny rĂˇmec pre sprĂˇvu kurzov â€“ definovanie kurzov, inĹˇtruktorov, frekventantov, ÄŤasovĂ˝ harmonogram kurzu, diskusnĂ© panely, definovanie Ăşloh, a pod. FunkÄŤnosĹĄ systĂ©mu overte sprĂˇvou niektorĂ˝ch zadanĂ˝ch kurzov.
', 'Analyzujte rĂ´zne vĂ˝uÄŤbovĂ© systĂ©my, ktorĂ© podporujĂş uÄŤenie sa elektronickou formou. Pri analĂ˝ze sa zamerajte najmĂ¤ na metodiku sprĂˇvy kurzov e-vzdelĂˇvania. Navrhnite a implementujte modulĂˇrny programovĂ˝ systĂ©m, ktorĂ˝ poskytne dostatoÄŤne univerzĂˇlny rĂˇmec pre sprĂˇvu kurzov â€“ definovanie kurzov, inĹˇtruktorov, frekventantov, ÄŤasovĂ˝ harmonogram kurzu, diskusnĂ© panely, definovanie Ăşloh, a pod. FunkÄŤnosĹĄ systĂ©mu overte sprĂˇvou niektorĂ˝ch zadanĂ˝ch kurzov.
', 1);
INSERT INTO projects VALUES (550, 'DP', 27, NULL, 515, '2005/2006', 'TlaÄŤenĂ© dokumenty s virtuĂˇlnymi ilustrĂˇciami', 'Printed documents with virtual illustrations', NULL, NULL, 1);
INSERT INTO projects VALUES (551, 'ZP', 27, NULL, 515, '2003/2004', 'VytlaÄŤenĂ˝ dokument s obohatenou realitou', 'Printed document with Augmented Reality', 'Analyzujte dostupnĂ© prostriedky pre tvorbu obohatenej (augmented) reality, zaloĹľenĂ© na kombinovanĂ­ reĂˇlneho a syntetickĂ©ho obrazu. Navrhnite a realizujte jednoduchĂ˝ prĂ­klad obohatenej reality vo forme kombinĂˇcie uÄŤebnĂ˝ch dokumentov na papieri s virtuĂˇlnymi obrazmi. Pri realizĂˇcii prĂ­kladu vyuĹľite dostupnĂ© metĂłdy snĂ­mania obrazu, rozpoznĂˇvania znaÄŤiek v obraze a generovania virtuĂˇlnych obrazov', 'Analyzujte dostupnĂ© prostriedky pre tvorbu obohatenej (augmented) reality, zaloĹľenĂ© na kombinovanĂ­ reĂˇlneho a syntetickĂ©ho obrazu. Navrhnite a realizujte jednoduchĂ˝ prĂ­klad obohatenej reality vo forme kombinĂˇcie uÄŤebnĂ˝ch dokumentov na papieri s virtuĂˇlnymi obrazmi. Pri realizĂˇcii prĂ­kladu vyuĹľite dostupnĂ© metĂłdy snĂ­mania obrazu, rozpoznĂˇvania znaÄŤiek v obraze a generovania virtuĂˇlnych obrazov', 1);
INSERT INTO projects VALUES (552, 'ZP', 342, NULL, 516, '2003/2004', 'ProgramovĂ© prostredie pre nĂˇvrh riadiacich jednotiek na bĂˇze mikroprocesorovĂ˝ch modulov.', 'Control unit developmet aplication enviroment on the microprocessor module basis', 'Analyzujte jazyky pre opis sprĂˇvania sa ÄŤĂ­slicovĂ˝ch systĂ©mov z hÄľadiska automatizovanĂ©ho nĂˇvrhu riadiacich jednotiek. Navrhnite inĹˇtrukÄŤnĂ˝ sĂşbor virtuĂˇlneho procesora vhodnĂ©ho na realizĂˇciu vybranej triedy riadiacich jednotiek. Navrhnite a zrealizujte vybranĂş ÄŤasĹĄ programovĂ©ho systĂ©mu pre  generovanie kĂłdu programu virtuĂˇlneho procesora realizujĂşceho  funkcie riadiacej jednotky,  ktorej sprĂˇvanie je danĂ© vybranĂ˝m opisnĂ˝m prostriedkom.
', 'Analyzujte jazyky pre opis sprĂˇvania sa ÄŤĂ­slicovĂ˝ch systĂ©mov z hÄľadiska automatizovanĂ©ho nĂˇvrhu riadiacich jednotiek. Navrhnite inĹˇtrukÄŤnĂ˝ sĂşbor virtuĂˇlneho procesora vhodnĂ©ho na realizĂˇciu vybranej triedy riadiacich jednotiek. Navrhnite a zrealizujte vybranĂş ÄŤasĹĄ programovĂ©ho systĂ©mu pre  generovanie kĂłdu programu virtuĂˇlneho procesora realizujĂşceho  funkcie riadiacej jednotky,  ktorej sprĂˇvanie je danĂ© vybranĂ˝m opisnĂ˝m prostriedkom.
', 0);
INSERT INTO projects VALUES (553, 'DP', 342, NULL, 516, '2005/2006', 'ProgramovĂˇ podpora nĂˇvrhu riadiacich systĂ©mov', 'ProgramovĂˇ podpora nĂˇvrhu riadiacich systĂ©mov', NULL, NULL, 0);
INSERT INTO projects VALUES (554, 'DP', 298, NULL, 518, '2005/2006', 'GenerĂˇtor konfigurĂˇciĂ­ pre Cisco smerovaÄŤe', 'Configuration generator for Cisco routers', NULL, NULL, 0);
INSERT INTO projects VALUES (555, 'ZP', 357, NULL, 518, '2003/2004', 'InternetovĂˇ aplikĂˇcia na registrĂˇciu uĹľĂ­vateÄľskĂ˝ch dĂˇt', 'Internet Application for User Data Registration', 'Analyzujte a navrhnite bezpeÄŤnĂ˝ interaktĂ­vny web na registrĂˇciu klientov, ktorĂ˝ umoĹľnĂ­ ukladanie a editovanie dĂˇt klientov do databĂˇzy. Analyzujte vyuĹľitie rĂ´znych implementaÄŤnĂ˝ch nĂˇstrojov ako aj vhodnosti operaÄŤnĂ˝ch systĂ©mov. Realizujte funkÄŤnĂ˝ model takĂ©hoto  systĂ©mu na bĂˇze Linuxu, PHP a MySQL databĂˇzy. Otestujte funkÄŤnosĹĄ a stabilitu systĂ©mu.
TĂşto tĂ©mu je vhodnĂ© rieĹˇiĹĄ v sĂşÄŤinnosti s tĂ©mou â€ž InternetovĂˇ aplikĂˇcia na bezpeÄŤnĂş autentifikĂˇciu klientov â€ś.
', 'Analyzujte a navrhnite bezpeÄŤnĂ˝ interaktĂ­vny web na registrĂˇciu klientov, ktorĂ˝ umoĹľnĂ­ ukladanie a editovanie dĂˇt klientov do databĂˇzy. Analyzujte vyuĹľitie rĂ´znych implementaÄŤnĂ˝ch nĂˇstrojov ako aj vhodnosti operaÄŤnĂ˝ch systĂ©mov. Realizujte funkÄŤnĂ˝ model takĂ©hoto  systĂ©mu na bĂˇze Linuxu, PHP a MySQL databĂˇzy. Otestujte funkÄŤnosĹĄ a stabilitu systĂ©mu.
TĂşto tĂ©mu je vhodnĂ© rieĹˇiĹĄ v sĂşÄŤinnosti s tĂ©mou â€ž InternetovĂˇ aplikĂˇcia na bezpeÄŤnĂş autentifikĂˇciu klientov â€ś.
', 0);
INSERT INTO projects VALUES (556, 'DP', 672, NULL, 519, '2005/2006', 'PravdepodobnostnĂˇ ĹˇtruktĂşra modelu smerovanej perkolĂˇcie na Ĺˇtvorcovej mrieĹľke', 'Probabilistic structure of directed percolation model in square lattice', NULL, NULL, 1);
INSERT INTO projects VALUES (557, 'ZP', 672, NULL, 519, '2003/2004', 'PravdepodobnostnĂˇ ĹˇtruktĂşra modelu smerovanej  perkolĂˇcie na Ĺˇtvorcovej mrieĹľke', 'Probabilistic structure of directed percolation model in square lattice', 'V prĂˇci sa poÄŤĂ­ta pravdepodobnostnĂˇ ĹˇtruktĂşra modelu smerovanej perkolĂˇcie na Ĺˇtvorcovej   mrieĹľke. Model smerovanej perkolĂˇcie je vhodnĂ˝ na ĹˇtĂşdium takĂ˝ch fyzikĂˇlnych procesov ako polymerizĂˇcia, ĹˇĂ­renie porĂşch, ĹˇĂ­renie poĹľiarov, presakovanie jednĂ©ho mĂ©dia do druhĂ©ho a podobne. ZĂˇkladnĂ˝m pojmom perkolaÄŤnej teĂłrie je perkolaÄŤnĂ˝ klaster, ktorĂ˝ sa po orezanĂ­ nikam nevedĂşcich vetiev stĂˇva perkolaÄŤnou kostrou (â€ž backboneâ€ś). 
Ăšlohou zĂˇvereÄŤnĂ©ho projektu projektu bude analyzovaĹĄ numericky perkolaÄŤnĂ© â€žbackbonesâ€ś istĂ©ho typu, a pokĂşsiĹĄ sa rozpracovaĹĄ numerickĂş metĂłdu ich triedenia. TĂˇto metĂłda by mala uÄľahÄŤiĹĄ hÄľadanie sĂşvislostĂ­ medzi typom backbones a vĂ˝slednou pravdepodobnostnou ĹˇtruktĂşrou.
', 'V prĂˇci sa poÄŤĂ­ta pravdepodobnostnĂˇ ĹˇtruktĂşra modelu smerovanej perkolĂˇcie na Ĺˇtvorcovej   mrieĹľke. Model smerovanej perkolĂˇcie je vhodnĂ˝ na ĹˇtĂşdium takĂ˝ch fyzikĂˇlnych procesov ako polymerizĂˇcia, ĹˇĂ­renie porĂşch, ĹˇĂ­renie poĹľiarov, presakovanie jednĂ©ho mĂ©dia do druhĂ©ho a podobne. ZĂˇkladnĂ˝m pojmom perkolaÄŤnej teĂłrie je perkolaÄŤnĂ˝ klaster, ktorĂ˝ sa po orezanĂ­ nikam nevedĂşcich vetiev stĂˇva perkolaÄŤnou kostrou (â€ž backboneâ€ś). 
Ăšlohou zĂˇvereÄŤnĂ©ho projektu projektu bude analyzovaĹĄ numericky perkolaÄŤnĂ© â€žbackbonesâ€ś istĂ©ho typu, a pokĂşsiĹĄ sa rozpracovaĹĄ numerickĂş metĂłdu ich triedenia. TĂˇto metĂłda by mala uÄľahÄŤiĹĄ hÄľadanie sĂşvislostĂ­ medzi typom backbones a vĂ˝slednou pravdepodobnostnou ĹˇtruktĂşrou.
', 1);
INSERT INTO projects VALUES (558, 'ZP', 342, NULL, 520, '2004/2005', 'ProgramovĂ˝ systĂ©m pre nĂˇvrh riadiacich jednotiek na bĂˇze  mikropoÄŤĂ­taÄŤa. ', 'Program system for design of control systems based on microcomputers', 'Analyzujte moĹľnosti vyuĹľitia existujĂşcich mikropoÄŤĂ­taÄŤovĂ˝ch modulov na nĂˇvrh a realizĂˇciu riadiacich jednotiek. 
Navrhnite inĹˇtrukÄŤnĂ˝ sĂşbor virtuĂˇlneho procesora vhodnĂ©ho na realizĂˇciu vybranej triedy riadiacich jednotiek.
Navrhnite a zrealizujte vybranĂş ÄŤasĹĄ prekladaÄŤa programu  virtuĂˇlneho procesora na program v JSI vybranĂ©ho mikropoÄŤĂ­taÄŤa.
', 'Analyzujte moĹľnosti vyuĹľitia existujĂşcich mikropoÄŤĂ­taÄŤovĂ˝ch modulov na nĂˇvrh a realizĂˇciu riadiacich jednotiek. 
Navrhnite inĹˇtrukÄŤnĂ˝ sĂşbor virtuĂˇlneho procesora vhodnĂ©ho na realizĂˇciu vybranej triedy riadiacich jednotiek.
Navrhnite a zrealizujte vybranĂş ÄŤasĹĄ prekladaÄŤa programu  virtuĂˇlneho procesora na program v JSI vybranĂ©ho mikropoÄŤĂ­taÄŤa.
', 0);
INSERT INTO projects VALUES (559, 'DP', 358, NULL, 520, '2005/2006', 'PenetraÄŤnĂ© testovanie', 'PenetraÄŤnĂ© testovanie', NULL, NULL, 0);
INSERT INTO projects VALUES (560, 'DP', 260, NULL, 521, '2005/2006', 'Detekcia neĹˇtandardnĂ˝ch stavov v operaÄŤnom systĂ©me', 'Detection of exceptional states in the operating system', NULL, NULL, 1);
INSERT INTO projects VALUES (561, 'ZP', 260, NULL, 521, '2003/2004', 'Monitorovanie procesov v operaÄŤnom systĂ©me UNIX', 'Monitoring processes in UNIX operating system', 'Vytvorte nĂˇstroj, ktorĂ˝ umoĹľnĂ­ sledovaĹĄ aktivitu procesov v operaÄŤnom systĂ©me. PrĂ­kladom informĂˇciĂ­, ktorĂ© je potrebnĂ© zĂ­skaĹĄ mĂ´Ĺľe byĹĄ: kto, kedy a ako spĂşĹˇĹĄa procesy; ktorĂ© procesy a kedy beĹľia v systĂ©me; akĂ© sĂş vzĹĄahy medzi beĹľiacimi procesmi (vzĹĄah rodiÄŤ-potomok, medziprocesovĂˇ komunikĂˇcia, ...); ako sa menĂ­ stav procesu. VĂ˝stupy nĂˇstroja Ĺˇtatisticky spracujte a vytvorte zĂˇklad profilu operaÄŤnĂ©ho systĂ©mu.', 'Vytvorte nĂˇstroj, ktorĂ˝ umoĹľnĂ­ sledovaĹĄ aktivitu procesov v operaÄŤnom systĂ©me. PrĂ­kladom informĂˇciĂ­, ktorĂ© je potrebnĂ© zĂ­skaĹĄ mĂ´Ĺľe byĹĄ: kto, kedy a ako spĂşĹˇĹĄa procesy; ktorĂ© procesy a kedy beĹľia v systĂ©me; akĂ© sĂş vzĹĄahy medzi beĹľiacimi procesmi (vzĹĄah rodiÄŤ-potomok, medziprocesovĂˇ komunikĂˇcia, ...); ako sa menĂ­ stav procesu. VĂ˝stupy nĂˇstroja Ĺˇtatisticky spracujte a vytvorte zĂˇklad profilu operaÄŤnĂ©ho systĂ©mu.', 1);
INSERT INTO projects VALUES (562, 'ZP', 660, NULL, 522, '2003/2004', 'CSIDC 2004', 'CSIDC 2004', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 1);
INSERT INTO projects VALUES (563, 'DP', 541, NULL, 522, '2005/2006', 'InformaÄŤnĂ˝ systĂ©m pre bezpeÄŤnĂş mobilnĂş komunikĂˇciu', 'Information system for secure mobile communication', NULL, NULL, 1);
INSERT INTO projects VALUES (564, 'DP', 27, NULL, 523, '2005/2006', 'VirtuĂˇlne graffiti', 'Virtual graffiti', NULL, NULL, 1);
INSERT INTO projects VALUES (565, 'ZP', 27, NULL, 523, '2003/2004', 'VirtuĂˇlne graffiti', 'Virtual graffity', 'Analyzujte dostupnĂ© prostriedky pre tvorbu obohatenej (augmented) reality, zaloĹľenĂ© na kombinovanĂ­ reĂˇlneho a syntetickĂ©ho obrazu. Navrhnite a realizujte jednoduchĂ˝ prĂ­klad vo forme kombinĂˇcie obrazovĂ˝ch predlĂ´h a snĂ­mok reĂˇlneho okolia. Pri realizĂˇcii vyuĹľite dostupnĂ© metĂłdy snĂ­mania obrazu, rozpoznĂˇvania znaÄŤiek v obraze a generovania virtuĂˇlnych obrazov', 'Analyzujte dostupnĂ© prostriedky pre tvorbu obohatenej (augmented) reality, zaloĹľenĂ© na kombinovanĂ­ reĂˇlneho a syntetickĂ©ho obrazu. Navrhnite a realizujte jednoduchĂ˝ prĂ­klad vo forme kombinĂˇcie obrazovĂ˝ch predlĂ´h a snĂ­mok reĂˇlneho okolia. Pri realizĂˇcii vyuĹľite dostupnĂ© metĂłdy snĂ­mania obrazu, rozpoznĂˇvania znaÄŤiek v obraze a generovania virtuĂˇlnych obrazov', 1);
INSERT INTO projects VALUES (566, 'DP', 541, NULL, 524, '2005/2006', 'InformaÄŤnĂ˝ systĂ©m pre mobilnĂş kancelĂˇriu', 'Information system for mobile office', NULL, NULL, 1);
INSERT INTO projects VALUES (567, 'ZP', 660, NULL, 524, '2003/2004', 'CSIDC 2004', 'CSIDC 2004', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 1);
INSERT INTO projects VALUES (568, 'ZP', 580, 358, 525, '2004/2005', 'Zostrojenie a riadenie ĹˇesĹĄnohĂ©ho robota', 'Construction and control of six legged robot', 'ZostrojiĹĄ ĹˇesĹĄnohĂ©ho chodiaceho autonĂłmneho robota, schopnĂ©ho vyhĂ˝baĹĄ sa prekĂˇĹľkam a sledovaĹĄ ÄŤiernu ÄŤiaru na bielom podklade.
 
Ăšlohou projektu je naĹˇtudovaĹĄ princĂ­py chĂ´dze a udrĹľania stability v systĂ©me so Ĺˇiestimi nohami, naĹˇtudovaĹĄ existujĂşce rieĹˇenia ĹˇesĹĄnohĂ˝ch robotov a porovnaĹĄ ich medzi sebou,  na zĂˇklade tĂ˝chto poznatkov navrhnĂşĹĄ vlastnĂş konĹˇtrukciu,  navrhnĂşĹĄ obvodovĂ© rieĹˇenie riadiaceho obvodu a riadiaci algoritmus,  riadiaci obvod zrealizovaĹĄ, vykonaĹĄ zĂˇkladnĂ© merania, otestovaĹĄ a napĂ­saĹĄ  program pre prĂˇcu jednotky a vypracovaĹĄ dokumentĂˇciu (schĂ©ma zapojenia riadiacej ÄŤasti, pripojenie, vĂ˝vojovĂ˝ diagram a vĂ˝pis programu).
', 'ZostrojiĹĄ ĹˇesĹĄnohĂ©ho chodiaceho autonĂłmneho robota, schopnĂ©ho vyhĂ˝baĹĄ sa prekĂˇĹľkam a sledovaĹĄ ÄŤiernu ÄŤiaru na bielom podklade.
 
Ăšlohou projektu je naĹˇtudovaĹĄ princĂ­py chĂ´dze a udrĹľania stability v systĂ©me so Ĺˇiestimi nohami, naĹˇtudovaĹĄ existujĂşce rieĹˇenia ĹˇesĹĄnohĂ˝ch robotov a porovnaĹĄ ich medzi sebou,  na zĂˇklade tĂ˝chto poznatkov navrhnĂşĹĄ vlastnĂş konĹˇtrukciu,  navrhnĂşĹĄ obvodovĂ© rieĹˇenie riadiaceho obvodu a riadiaci algoritmus,  riadiaci obvod zrealizovaĹĄ, vykonaĹĄ zĂˇkladnĂ© merania, otestovaĹĄ a napĂ­saĹĄ  program pre prĂˇcu jednotky a vypracovaĹĄ dokumentĂˇciu (schĂ©ma zapojenia riadiacej ÄŤasti, pripojenie, vĂ˝vojovĂ˝ diagram a vĂ˝pis programu).
', 0);
INSERT INTO projects VALUES (569, 'DP', 96, NULL, 525, '2005/2006', 'ZĂ­skanie hÄľbkovej informĂˇcie pomocou vizuĂˇlneho systĂ©mu', 'ZĂ­skanie hÄľbkovej informĂˇcie pomocou vizuĂˇlneho systĂ©mu', NULL, NULL, 4);
INSERT INTO projects VALUES (570, 'ZP', 517, NULL, 526, '2004/2005', 'ZloĹľitostnĂˇ analĂ˝za algoritmov smerovania na poÄŤĂ­taÄŤovĂ˝ch sieĹĄach', 'Complexity analysis of routing algorithms in computer networks', 'UvaĹľujme rĂ´zne smerovacie stratĂ©gie na poÄŤĂ­taÄŤovĂ˝ch sieĹĄach ako sĂş: smerovacie tabuÄľky, intervalovĂ© smerovanie, prefixovĂ© smerovanie a pod.  
CieÄľom prĂˇce je teoretickĂˇ/zloĹľitostnĂˇ analĂ˝za rĂ´znych typov smerovacĂ­ch algortimov a ich porovnanie. ZĂˇkladnĂ˝ teoretickĂ˝ model je abstraknĂ˝ poÄŤĂ­taÄŤ RAM. DosiahnutĂ© teoretickĂ© vĂ˝sledky je nutnĂ© prakticky overiĹĄ na RAM-simulĂˇtore.  ', 'UvaĹľujme rĂ´zne smerovacie stratĂ©gie na poÄŤĂ­taÄŤovĂ˝ch sieĹĄach ako sĂş: smerovacie tabuÄľky, intervalovĂ© smerovanie, prefixovĂ© smerovanie a pod.  
CieÄľom prĂˇce je teoretickĂˇ/zloĹľitostnĂˇ analĂ˝za rĂ´znych typov smerovacĂ­ch algortimov a ich porovnanie. ZĂˇkladnĂ˝ teoretickĂ˝ model je abstraknĂ˝ poÄŤĂ­taÄŤ RAM. DosiahnutĂ© teoretickĂ© vĂ˝sledky je nutnĂ© prakticky overiĹĄ na RAM-simulĂˇtore.  ', 1);
INSERT INTO projects VALUES (571, 'DP', 517, NULL, 526, '2005/2006', 'Smerovacie algoritmy na ĹˇpeciĂˇlnych druhoch sietĂ­', 'Smerovacie algoritmy na ĹˇpeciĂˇlnych druhoch sietĂ­', NULL, NULL, 1);
INSERT INTO projects VALUES (572, 'DP', 437, NULL, 527, '2005/2006', 'VyhÄľadĂˇvanie Ăşdajov v pavuÄŤine s vĂ˝znamom', 'Retrieval information in semantic web', NULL, NULL, 1);
INSERT INTO projects VALUES (573, 'ZP', 24, NULL, 527, '2003/2004', 'AlgoritmizĂˇcia v prĂ­kladoch -  usporadĂşvanie', 'Algorithms in examples - sorting', 'Analyzujte vybranĂ© algoritmickĂ© metĂłdy vyuĹľĂ­vanĂ© v databĂˇzovĂ˝ch systĂ©moch (prehÄľadĂˇvanie a usporadĂşvanie zĂˇznamov)  z hÄľadiska ich vyuĹľitia v sĂşÄŤasnĂ˝ch softvĂ©rovĂ˝ch aplikĂˇciĂˇch. Porovnajte jednotlivĂ© metĂłdy podÄľa vybranĂ˝ch kritĂ©riĂ­. Spracujte  vybranĂ© algoritmy do mnoĹľiny  prĂ­kladov vo forme  hypertextu, s presne stanovenou ĹˇtruktĂşrou. Ĺ truktĂşra bude odrĂˇĹľaĹĄ ĹľivotnĂ˝ cyklus programu a zĂˇroveĹ algoritmy rovnakĂ©ho typu budĂş vyhodnocovanĂ© na reprezentatĂ­vnej vzorke Ăşdajov a navzĂˇjom porovnĂˇvanĂ©.  Vizualizujte  prezentĂˇciu vykonĂˇvania algoritmov', 'Analyzujte vybranĂ© algoritmickĂ© metĂłdy vyuĹľĂ­vanĂ© v databĂˇzovĂ˝ch systĂ©moch (prehÄľadĂˇvanie a usporadĂşvanie zĂˇznamov)  z hÄľadiska ich vyuĹľitia v sĂşÄŤasnĂ˝ch softvĂ©rovĂ˝ch aplikĂˇciĂˇch. Porovnajte jednotlivĂ© metĂłdy podÄľa vybranĂ˝ch kritĂ©riĂ­. Spracujte  vybranĂ© algoritmy do mnoĹľiny  prĂ­kladov vo forme  hypertextu, s presne stanovenou ĹˇtruktĂşrou. Ĺ truktĂşra bude odrĂˇĹľaĹĄ ĹľivotnĂ˝ cyklus programu a zĂˇroveĹ algoritmy rovnakĂ©ho typu budĂş vyhodnocovanĂ© na reprezentatĂ­vnej vzorke Ăşdajov a navzĂˇjom porovnĂˇvanĂ©.  Vizualizujte  prezentĂˇciu vykonĂˇvania algoritmov', 1);
INSERT INTO projects VALUES (574, 'DP', 655, NULL, 528, '2005/2006', 'DynamickĂ˝ rezervoĂˇr Echo state neurĂłnovĂ˝ch sietĂ­', 'DynamickĂ˝ rezervoĂˇr Echo state neurĂłnovĂ˝ch sietĂ­', NULL, NULL, 1);
INSERT INTO projects VALUES (575, 'ZP', 541, NULL, 528, '2004/2005', 'ZĂˇlohovanie a obnova dĂˇt v databĂˇzach', 'Backup and recovery in relation database management systems', 'Analyzujte metĂłdy a prostriedky zĂˇlohovania a obnovy dĂˇt v relaÄŤnĂ˝ch databĂˇzovĂ˝ch systĂ©moch. Definujte vĂ˝hody a nedostatky zĂˇlohovania a obnovy dĂˇt v DBS Oracle. Navrhnite moĹľnĂ© metĂłdy zlepĹˇenia a rozĹˇĂ­renia funkciĂ­ zĂˇlohovania a obnovy dĂˇt. VybratĂ©  metĂłdy implementujte v prostredĂ­ Oracle. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade.', 'Analyzujte metĂłdy a prostriedky zĂˇlohovania a obnovy dĂˇt v relaÄŤnĂ˝ch databĂˇzovĂ˝ch systĂ©moch. Definujte vĂ˝hody a nedostatky zĂˇlohovania a obnovy dĂˇt v DBS Oracle. Navrhnite moĹľnĂ© metĂłdy zlepĹˇenia a rozĹˇĂ­renia funkciĂ­ zĂˇlohovania a obnovy dĂˇt. VybratĂ©  metĂłdy implementujte v prostredĂ­ Oracle. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade.', 1);
INSERT INTO projects VALUES (576, 'ZP', 388, NULL, 529, '2003/2004', 'Spracovanie ĹˇtudentskĂ˝ch projektov', 'Spracovanie ĹˇtudentskĂ˝ch projektov', 'Analyzujte typickĂ© ÄŤinnosti v Ĺľivotnom cykle ĹˇtudentskĂ˝ch projektov rieĹˇenĂ˝ch v rĂˇmci informatickĂ˝ch predmetov na KIVT. Analyzujte  moĹľnosti spracovania tĂ˝chto ÄŤinnostĂ­ v prostredĂ­ internetu a navrhnite softvĂ©rovĂ˝ systĂ©m na ich podporu.  SystĂ©m musĂ­ podporovaĹĄ ÄŤinnosti ako: tvorbu tĂ©m projektov k predmetu zo strany uÄŤiteÄľov, vĂ˝ber a schvĂˇlenie koneÄŤnej mnoĹľiny tĂ©m, prezentĂˇciu tĂ©m v pavuÄŤine pre Ĺˇtudentov, vĂ˝ber preferovanĂ˝ch tĂ©m zo strany Ĺˇtudentov, proces pridelenia tĂ©my, prezentĂˇciu koneÄŤnĂ©ho pridelenia,  odovzdanie rieĹˇenia v jednotlivĂ˝ch kontrolnĂ˝ch bodoch, atÄŹ. MusĂ­ zabezpeÄŤiĹĄ autorizovanĂ˝ prĂ­stup rĂ´znych kategĂłriĂ­ pouĹľĂ­vateÄľov. 
NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu pre vybranĂ© ÄŤinnosti ĹľivotnĂ©ho cyklu projektu. 
', 'Analyzujte typickĂ© ÄŤinnosti v Ĺľivotnom cykle ĹˇtudentskĂ˝ch projektov rieĹˇenĂ˝ch v rĂˇmci informatickĂ˝ch predmetov na KIVT. Analyzujte  moĹľnosti spracovania tĂ˝chto ÄŤinnostĂ­ v prostredĂ­ internetu a navrhnite softvĂ©rovĂ˝ systĂ©m na ich podporu.  SystĂ©m musĂ­ podporovaĹĄ ÄŤinnosti ako: tvorbu tĂ©m projektov k predmetu zo strany uÄŤiteÄľov, vĂ˝ber a schvĂˇlenie koneÄŤnej mnoĹľiny tĂ©m, prezentĂˇciu tĂ©m v pavuÄŤine pre Ĺˇtudentov, vĂ˝ber preferovanĂ˝ch tĂ©m zo strany Ĺˇtudentov, proces pridelenia tĂ©my, prezentĂˇciu koneÄŤnĂ©ho pridelenia,  odovzdanie rieĹˇenia v jednotlivĂ˝ch kontrolnĂ˝ch bodoch, atÄŹ. MusĂ­ zabezpeÄŤiĹĄ autorizovanĂ˝ prĂ­stup rĂ´znych kategĂłriĂ­ pouĹľĂ­vateÄľov. 
NavrhnutĂ© rieĹˇenie overte implementovanĂ­m softvĂ©rovĂ©ho prototypu pre vybranĂ© ÄŤinnosti ĹľivotnĂ©ho cyklu projektu. 
', 1);
INSERT INTO projects VALUES (577, 'DP', 388, NULL, 529, '2005/2006', 'SprĂˇva a publikovanie dokumentov  v prostredĂ­ sĂ©mantickĂ©ho webu.', 'SprĂˇva a publikovanie dokumentov  v prostredĂ­ sĂ©mantickĂ©ho webu.', NULL, NULL, 1);
INSERT INTO projects VALUES (578, 'ZP', 447, NULL, 530, '2004/2005', 'InformaÄŤnĂ˝ portĂˇl Ăşstavu na bĂˇze webu so sĂ©mantikou', 'Semantic web based portal of the institute', 'Pod ontolĂłgiou rozumieme konceptuĂˇlny opis znalostĂ­ vyjadrenĂ˝ explicitne s dĂ´razom na jej zdieÄľateÄľnosĹĄ. Analyzujte funkcie ontolĂłgiĂ­ v prostredĂ­ SĂ©mantickĂ©ho webu. Pri analĂ˝ze vychĂˇdzajte z mnoĹľiny jazykov pouĹľĂ­vanĂ˝ch v prostredĂ­ webu so sĂ©mantikou, ktorĂ© podporujĂş jeho architektĂşru (XML, RDF, RDFS, OWL). Navrhnite ontolĂłgiu Ăšstavu informatiky a softvĂ©rovĂ©ho inĹľinierstva. NavrhnutĂş ontolĂłgiu naplĹte znalosĹĄami a tieto prezentujte vo forme informaÄŤnĂ©ho portĂˇlu Ăşstavu.', 'Pod ontolĂłgiou rozumieme konceptuĂˇlny opis znalostĂ­ vyjadrenĂ˝ explicitne s dĂ´razom na jej zdieÄľateÄľnosĹĄ. Analyzujte funkcie ontolĂłgiĂ­ v prostredĂ­ SĂ©mantickĂ©ho webu. Pri analĂ˝ze vychĂˇdzajte z mnoĹľiny jazykov pouĹľĂ­vanĂ˝ch v prostredĂ­ webu so sĂ©mantikou, ktorĂ© podporujĂş jeho architektĂşru (XML, RDF, RDFS, OWL). Navrhnite ontolĂłgiu Ăšstavu informatiky a softvĂ©rovĂ©ho inĹľinierstva. NavrhnutĂş ontolĂłgiu naplĹte znalosĹĄami a tieto prezentujte vo forme informaÄŤnĂ©ho portĂˇlu Ăşstavu.', 1);
INSERT INTO projects VALUES (579, 'DP', 447, NULL, 530, '2005/2006', 'Integrovanie a organizĂˇcia informĂˇciĂ­ na webe so sĂ©mantikou', 'Integrovanie a organizĂˇcia informĂˇciĂ­ na webe so sĂ©mantikou', NULL, NULL, 1);
INSERT INTO projects VALUES (580, 'ZP', 588, 563, 531, '2004/2005', 'IdentifikaÄŤnĂ© systĂ©my', 'Identification systems', 'Analyzujte technickĂ© a programovĂ© prostredie pre realizĂˇciu identifikaÄŤnĂ˝ch systĂ©mov. Porovnajte kontaktnĂ© a bezdrĂ´tovĂ© systĂ©my uvedenĂ© (minimĂˇlne od dvoch vĂ˝robcov) na zĂˇklade definovanĂ˝ch technickĂ˝ch parametrov. Navrhnite obvodovĂş schĂ©mu pre jednoduchĂ˝ identifikaÄŤnĂ˝ systĂ©m riadenĂ˝ vhodnĂ˝m mikroprocesorom. NapĂ­Ĺˇte a overte program pre riadenie mikroprocesoru.

', 'Analyzujte technickĂ© a programovĂ© prostredie pre realizĂˇciu identifikaÄŤnĂ˝ch systĂ©mov. Porovnajte kontaktnĂ© a bezdrĂ´tovĂ© systĂ©my uvedenĂ© (minimĂˇlne od dvoch vĂ˝robcov) na zĂˇklade definovanĂ˝ch technickĂ˝ch parametrov. Navrhnite obvodovĂş schĂ©mu pre jednoduchĂ˝ identifikaÄŤnĂ˝ systĂ©m riadenĂ˝ vhodnĂ˝m mikroprocesorom. NapĂ­Ĺˇte a overte program pre riadenie mikroprocesoru.

', 0);
INSERT INTO projects VALUES (581, 'DP', 360, NULL, 531, '2005/2006', 'Nedokonalosti v realizĂˇcii kombinaÄŤnĂ˝ch logickĂ˝ch obvodov', 'Nedokonalosti v realizĂˇcii kombinaÄŤnĂ˝ch logickĂ˝ch obvodov', NULL, NULL, 0);
INSERT INTO projects VALUES (582, 'DP', 13, 301, 532, '2005/2006', 'E-systĂ©m pre spoÄľahivosĹĄ digitĂˇlnych systĂ©mov', 'E-systĂ©m pre spoÄľahivosĹĄ digitĂˇlnych systĂ©mov', NULL, NULL, 0);
INSERT INTO projects VALUES (583, 'ZP', 13, 301, 532, '2004/2005', 'Parametre a hodnotenie spoÄľahlivosti elektronickĂ˝ch systĂ©mov', 'Parameters and evaluating of  reliability of electronic systems', 'PreĹˇtudujte zĂˇkladnĂ© parametre spoÄľahlivosti a architektĂşry spoÄľahlivostnĂ˝ch systĂ©mov a metĂłdy ich hodnotenia. Navrhnite systĂ©m pre automatickĂ© hodnotenie spoÄľahlivostnĂ˝ch modelov, t.j. vĂ˝poÄŤty pravdepodobnosti bezporuchovej prevĂˇdzky, pravdepodobnosĹĄ do poruchy, atÄŹ.  ZadanĂˇ architektĂşra by mala byĹĄ zadĂˇvanĂˇ graficky a celĂ˝ systĂ©m by mal byĹĄ implementovanĂ˝ v jazyku JAVA s grafickĂ˝m rozhranĂ­m.
SystĂ©m by mal byĹĄ doplnenĂ˝ vysvetÄľujĂşcimi prĂ­kladmi. SystĂ©m bude vyuĹľĂ­vanĂ˝ na cviÄŤeniach predmetu Diagnostika a spoÄľahlivosĹĄ. ', 'PreĹˇtudujte zĂˇkladnĂ© parametre spoÄľahlivosti a architektĂşry spoÄľahlivostnĂ˝ch systĂ©mov a metĂłdy ich hodnotenia. Navrhnite systĂ©m pre automatickĂ© hodnotenie spoÄľahlivostnĂ˝ch modelov, t.j. vĂ˝poÄŤty pravdepodobnosti bezporuchovej prevĂˇdzky, pravdepodobnosĹĄ do poruchy, atÄŹ.  ZadanĂˇ architektĂşra by mala byĹĄ zadĂˇvanĂˇ graficky a celĂ˝ systĂ©m by mal byĹĄ implementovanĂ˝ v jazyku JAVA s grafickĂ˝m rozhranĂ­m.
SystĂ©m by mal byĹĄ doplnenĂ˝ vysvetÄľujĂşcimi prĂ­kladmi. SystĂ©m bude vyuĹľĂ­vanĂ˝ na cviÄŤeniach predmetu Diagnostika a spoÄľahlivosĹĄ. ', 0);
INSERT INTO projects VALUES (584, 'ZP', 579, NULL, 533, '2004/2005', 'MultimediĂˇlne informĂˇcie v regionĂˇlnom IS', 'Multimedial information in regional IS', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie existujĂşceho zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb FIIT.', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej informĂˇcie v systĂ©moch na podporu turistickĂ©ho ruchu. Navrhnite rozĹˇĂ­renie existujĂşceho zĂˇkladnĂ©ho systĂ©mu o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili vyuĹľitie textovĂ©ho a ÄŤĂ­selnĂ©ho obsahu o rĂ´zne inĂ© formy ich prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe zvukov, animĂˇciĂ­, videosekvenciĂ­ a pod. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na Ăşdajoch podÄľa potrieb FIIT.', 1);
INSERT INTO projects VALUES (585, 'DP', 374, NULL, 533, '2005/2006', 'InformaÄŤnĂˇ podpora procesov ochrany kultĂşrneho dediÄŤstva metĂłdou vĂ˝skumnĂ©ho prototypovania', 'InformaÄŤnĂˇ podpora procesov ochrany kultĂşrneho dediÄŤstva metĂłdou vĂ˝skumnĂ©ho prototypovania', NULL, NULL, 4);
INSERT INTO projects VALUES (586, 'DP', 437, NULL, 534, '2005/2006', 'VyhÄľadĂˇvanie Ăşdajov v pavuÄŤine s vĂ˝znamom', 'VyhÄľadĂˇvanie Ăşdajov v pavuÄŤine s vĂ˝znamom', NULL, NULL, 1);
INSERT INTO projects VALUES (587, 'ZP', 437, NULL, 534, '2003/2004', 'SoftvĂ©r ako vĂ˝sledok technickej tvorivej duĹˇevnej ÄŤinnosti', 'Software as a result of creative mental technical activity', 'UveÄŹte pojem softvĂ©r z pohÄľadu technickĂ©ho aj prĂˇvneho, priÄŤom uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Vysvetlite, akĂ© sĂş prĂˇva na softvĂ©r, ÄŤo je to ochrana takĂ˝chto prĂˇv, preÄŤo treba takĂ©to prĂˇva chrĂˇniĹĄ s dĂ´razom na etickĂ© a spoloÄŤenskĂ© sĂşvislosti. OpĂ­Ĺˇte znĂˇme prĂˇvne rieĹˇenia ochrany softvĂ©ru, priÄŤom opĂ¤ĹĄ uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Analyzujte sĂşÄŤasnĂ˝ stav, pomenujte prĂ­padnĂ© otvorenĂ© problĂ©my a naznaÄŤte moĹľnosti ich rieĹˇenia. O celej problematike vytvorte tĂ©matickĂ© pavuÄŤinovĂ© sĂ­dlo, ktorĂ© bude slĂşĹľiĹĄ ako zdroj informĂˇciĂ­ aj odkazov na ne. ', 'UveÄŹte pojem softvĂ©r z pohÄľadu technickĂ©ho aj prĂˇvneho, priÄŤom uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Vysvetlite, akĂ© sĂş prĂˇva na softvĂ©r, ÄŤo je to ochrana takĂ˝chto prĂˇv, preÄŤo treba takĂ©to prĂˇva chrĂˇniĹĄ s dĂ´razom na etickĂ© a spoloÄŤenskĂ© sĂşvislosti. OpĂ­Ĺˇte znĂˇme prĂˇvne rieĹˇenia ochrany softvĂ©ru, priÄŤom opĂ¤ĹĄ uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Analyzujte sĂşÄŤasnĂ˝ stav, pomenujte prĂ­padnĂ© otvorenĂ© problĂ©my a naznaÄŤte moĹľnosti ich rieĹˇenia. O celej problematike vytvorte tĂ©matickĂ© pavuÄŤinovĂ© sĂ­dlo, ktorĂ© bude slĂşĹľiĹĄ ako zdroj informĂˇciĂ­ aj odkazov na ne. ', 1);
INSERT INTO projects VALUES (588, 'ZP', 436, NULL, 535, '2004/2005', 'PrĂ­padova ĹˇtĂşdia formĂˇlneho opisu komunikaÄŤnĂ©ho protokolu ', 'PrĂ­padova ĹˇtĂşdia formĂˇlneho opisu komunikaÄŤnĂ©ho protokolu ', 'Pre zadanĂ˝ prĂ­pad komunikaÄŤnĂ©ho protokolu zostavte jeho formĂˇlny 
(matematicky presnĂ˝) opis. Pri formĂˇlnom opise treba vychĂˇdzaĹĄ z komunikaÄŤnĂ˝ch formĂşl vypracovanĂ˝ch na FIIT.  ', 'Pre zadanĂ˝ prĂ­pad komunikaÄŤnĂ©ho protokolu zostavte jeho formĂˇlny 
(matematicky presnĂ˝) opis. Pri formĂˇlnom opise treba vychĂˇdzaĹĄ z komunikaÄŤnĂ˝ch formĂşl vypracovanĂ˝ch na FIIT.  ', 0);
INSERT INTO projects VALUES (589, 'ZP', 160, 704, 536, '2003/2004', 'Monitorovanie automobilov v reĂˇlnom ÄŤase', 'Real-time car monitoring', 'V sĂşÄŤasnosti existuje veÄľkĂ© mnoĹľstvo spoloÄŤnostĂ­ vlastniacich niekoÄľko pracovnĂ˝ch automobilov. Z hÄľadiska starostlivosti o ne je rozumnĂ© maĹĄ nepretrĹľitĂ© informĂˇcie o polohe tĂ˝chto vozidiel. VznikĂˇ potreba systĂ©mu na sledovanie polohy automobilov v reĂˇlnom ÄŤase. SystĂ©m by mal byĹĄ schopnĂ˝ pracovaĹĄ aj s databĂˇzou a realizovaĹĄ rekonĹˇtrukcie vĂ˝jazdov vozidiel, pripadne poskytovaĹĄ doplĹujĂşce informĂˇcie o automobile, jeho vodiÄŤovi a konkrĂ©tnom vĂ˝jazde.
Analyzujte problematiku monitorovania automobilov v reĂˇlnom ÄŤase. Navrhnite rieĹˇenie mapovĂ©ho podkladu a jeho zobrazovanie v rĂ´znych mierkach. Analyzujte rieĹˇenie zberu potrebnĂ˝ch Ăşdajov a ich nĂˇslednĂ© pouĹľitie na presnĂ© zaznamenĂˇvanie trajektĂłrie pohybu vozidla do systĂ©mu mĂˇp. ÄŽalej analyzujte moĹľnosti implementaÄŤnĂ˝ch rieĹˇenĂ­ pre  takĂ˝to typ aplikĂˇcie. Na zĂˇklade analĂ˝zy problĂ©mu navrhnite a vytvorte prototyp sieĹĄovej aplikĂˇcie na  sledovanie vozidiel.
', 'V sĂşÄŤasnosti existuje veÄľkĂ© mnoĹľstvo spoloÄŤnostĂ­ vlastniacich niekoÄľko pracovnĂ˝ch automobilov. Z hÄľadiska starostlivosti o ne je rozumnĂ© maĹĄ nepretrĹľitĂ© informĂˇcie o polohe tĂ˝chto vozidiel. VznikĂˇ potreba systĂ©mu na sledovanie polohy automobilov v reĂˇlnom ÄŤase. SystĂ©m by mal byĹĄ schopnĂ˝ pracovaĹĄ aj s databĂˇzou a realizovaĹĄ rekonĹˇtrukcie vĂ˝jazdov vozidiel, pripadne poskytovaĹĄ doplĹujĂşce informĂˇcie o automobile, jeho vodiÄŤovi a konkrĂ©tnom vĂ˝jazde.
Analyzujte problematiku monitorovania automobilov v reĂˇlnom ÄŤase. Navrhnite rieĹˇenie mapovĂ©ho podkladu a jeho zobrazovanie v rĂ´znych mierkach. Analyzujte rieĹˇenie zberu potrebnĂ˝ch Ăşdajov a ich nĂˇslednĂ© pouĹľitie na presnĂ© zaznamenĂˇvanie trajektĂłrie pohybu vozidla do systĂ©mu mĂˇp. ÄŽalej analyzujte moĹľnosti implementaÄŤnĂ˝ch rieĹˇenĂ­ pre  takĂ˝to typ aplikĂˇcie. Na zĂˇklade analĂ˝zy problĂ©mu navrhnite a vytvorte prototyp sieĹĄovej aplikĂˇcie na  sledovanie vozidiel.
', 1);
INSERT INTO projects VALUES (590, 'DP', 704, NULL, 536, '2005/2006', 'DigitĂˇlny video zĂˇznamnĂ­k', 'DIGITAL VIDEORECORDER', NULL, NULL, 1);
INSERT INTO projects VALUES (591, 'ZP', 13, 431, 537, '2003/2004', 'NĂˇvrh a simulĂˇcia vzorovĂ©ho ÄŤĂ­slicovĂ©ho systĂ©mu na ÄŤipe pre overovanie architektĂşr testovateÄľnosti', 'The design and simulation of benchmark digital system on chip for verification of testing architectures ', 'Analyzujte existujĂşce â€śbenchmarkâ€ť obvody modelovanĂ© vo VHDL alebo Verilog. Navrhnite a odsimulujte ÄŤislicovĂ˝ systĂ©m na ÄŤipe vhodnĂ˝ pre overovanie funkÄŤnosti a efektĂ­vnosti metĂłd i algoritmov nĂˇvrhu na ÄľahkĂş a samoÄŤinnĂş testovateÄľnosĹĄ. VĂ˝slednĂ˝ vzorovĂ˝ systĂ©m na ÄŤipe musĂ­ byĹĄ odsimulovanĂ˝ a syntetizovateÄľnĂ˝ v prostredĂ­ FPGA Advantages a overenĂ˝ na prĂ­kladoch s aplikĂˇciou vybranĂ˝ch metĂłd nĂˇvrhu na testovateÄľnosĹĄ.', 'Analyzujte existujĂşce â€śbenchmarkâ€ť obvody modelovanĂ© vo VHDL alebo Verilog. Navrhnite a odsimulujte ÄŤislicovĂ˝ systĂ©m na ÄŤipe vhodnĂ˝ pre overovanie funkÄŤnosti a efektĂ­vnosti metĂłd i algoritmov nĂˇvrhu na ÄľahkĂş a samoÄŤinnĂş testovateÄľnosĹĄ. VĂ˝slednĂ˝ vzorovĂ˝ systĂ©m na ÄŤipe musĂ­ byĹĄ odsimulovanĂ˝ a syntetizovateÄľnĂ˝ v prostredĂ­ FPGA Advantages a overenĂ˝ na prĂ­kladoch s aplikĂˇciou vybranĂ˝ch metĂłd nĂˇvrhu na testovateÄľnosĹĄ.', 0);
INSERT INTO projects VALUES (592, 'DP', 13, 431, 537, '2004/2005', 'AutomatickĂ˝ systĂ©m pre integrĂˇciu digitĂˇlnych blokov v  nĂˇvrhu SOC', 'AutomatickĂ˝ systĂ©m pre integrĂˇciu digitĂˇlnych blokov v  nĂˇvrhu SOC', NULL, NULL, 0);
INSERT INTO projects VALUES (593, 'DP', 548, 298, 538, '2005/2006', 'TelemetrickĂ˝ zberovĂ˝ systĂ©m s vyuĹľitĂ­m GPRS technolĂłgie', 'Telemetric gathering system with the use of GPRS technology', NULL, NULL, 0);
INSERT INTO projects VALUES (594, 'ZP', 705, NULL, 538, '2003/2004', 'AnalyzĂˇtor logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s normĂˇlnou ĹˇtruktĂşrou', 'Analyzer of combinatorial logical circuits with normal structure', 'Treba navrhnĂşĹĄ programovĂ˝ systĂ©m pre analĂ˝zu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s normĂˇlnou ĹˇtruktĂşrou. LogickĂ˝ kombinaÄŤnĂ˝ obvod s viacerĂ˝mi vĂ˝stupmi sa mĂˇ zadĂˇvaĹĄ svojou ĹˇtruktĂşrou. SystĂ©m funkciĂ­, ktorĂ© obvod realizuje,  mĂˇ byĹĄ zapĂ­sanĂ˝  formou mapy, pravdivostnou tabuÄľkou, vektorovĂ˝m a ÄŤĂ­selnĂ˝m zĂˇpisom. ', 'Treba navrhnĂşĹĄ programovĂ˝ systĂ©m pre analĂ˝zu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s normĂˇlnou ĹˇtruktĂşrou. LogickĂ˝ kombinaÄŤnĂ˝ obvod s viacerĂ˝mi vĂ˝stupmi sa mĂˇ zadĂˇvaĹĄ svojou ĹˇtruktĂşrou. SystĂ©m funkciĂ­, ktorĂ© obvod realizuje,  mĂˇ byĹĄ zapĂ­sanĂ˝  formou mapy, pravdivostnou tabuÄľkou, vektorovĂ˝m a ÄŤĂ­selnĂ˝m zĂˇpisom. ', 0);
INSERT INTO projects VALUES (595, 'ZP', 27, NULL, 539, '2004/2005', 'VĂ˝vojovĂ© prostredie pre algoritmy sprĂˇvy paralelnĂ˝ch procesov', 'VĂ˝vojovĂ© prostredie pre algoritmy sprĂˇvy paralelnĂ˝ch procesov', 'Analyzujte dostupnĂ© otvorenĂ© modely sprĂˇvy paralelnĂ˝ch procesov, z hÄľadiska ich pouĹľiteÄľnosti ako vĂ˝vojovĂ©ho a testovacieho prostredia pre novĂ© implementaÄŤnĂ© metĂłdy v architektĂşrach operaÄŤnĂ˝ch systĂ©mov. Navrhnite a realizujte vĂ˝vojovĂ© a testovacie prostredie, zameranĂ© na sprĂˇvu procesov. V tomto prostredĂ­ demonĹˇtrujte prĂ­klady vytvorenĂ˝ch a testovanĂ˝ch algoritmov.', 'Analyzujte dostupnĂ© otvorenĂ© modely sprĂˇvy paralelnĂ˝ch procesov, z hÄľadiska ich pouĹľiteÄľnosti ako vĂ˝vojovĂ©ho a testovacieho prostredia pre novĂ© implementaÄŤnĂ© metĂłdy v architektĂşrach operaÄŤnĂ˝ch systĂ©mov. Navrhnite a realizujte vĂ˝vojovĂ© a testovacie prostredie, zameranĂ© na sprĂˇvu procesov. V tomto prostredĂ­ demonĹˇtrujte prĂ­klady vytvorenĂ˝ch a testovanĂ˝ch algoritmov.', 1);
INSERT INTO projects VALUES (596, 'ZP', 704, NULL, 542, '2004/2005', 'NĂˇvrh a implementĂˇcia  webovskej reprezentĂˇcie centrĂˇlneho kultĂşrneho pracoviska', 'NĂˇvrh a implementĂˇcia  webovskej reprezentĂˇcie centrĂˇlneho kultĂşrneho pracoviska', 'Pojednajte o existujĂşcich systĂ©moch na sprĂˇvu webovskĂ©ho obsahu (CMS-Web Content Management Systems) a analyzujte ich. Na zĂˇklade prvotnej ĹˇpecifikĂˇcie pracoviska  a  na zĂˇklade analĂ˝zy navrhnite vhodnĂ˝ CMS pre sprĂˇvu  webovskĂ©ho portĂˇlu kultĂşrnej ustanovizne. NĂˇvrh realizujte a vzhÄľadom na charakter a aktivity ustanovizne uvaĹľujte  s moĹľnosĹĄou diskusnĂ©ho fĂłra. VybranĂ˝ CMS  apoĹ ÄŤiastoÄŤne naplĹte. ', 'Pojednajte o existujĂşcich systĂ©moch na sprĂˇvu webovskĂ©ho obsahu (CMS-Web Content Management Systems) a analyzujte ich. Na zĂˇklade prvotnej ĹˇpecifikĂˇcie pracoviska  a  na zĂˇklade analĂ˝zy navrhnite vhodnĂ˝ CMS pre sprĂˇvu  webovskĂ©ho portĂˇlu kultĂşrnej ustanovizne. NĂˇvrh realizujte a vzhÄľadom na charakter a aktivity ustanovizne uvaĹľujte  s moĹľnosĹĄou diskusnĂ©ho fĂłra. VybranĂ˝ CMS  apoĹ ÄŤiastoÄŤne naplĹte. ', 1);
INSERT INTO projects VALUES (597, 'DP', 13, 301, 543, '2004/2005', 'AutomatickĂ˝ generĂˇtor testov funkÄŤnĂ˝ch testov pre digitĂˇlne systĂ©my', 'Automatic functional test generator for digital systems', NULL, NULL, 0);
INSERT INTO projects VALUES (598, 'DP', 545, 301, 544, '2004/2005', 'SystĂ©m automatickĂ©ho generovania blokov samoÄŤinnĂ©ho testovania pamĂ¤tĂ­ modelovanĂ˝ch vo VHDL', 'Automatic generation system of self-test blocks  for  memories modeled in VHDL', NULL, NULL, 0);
INSERT INTO projects VALUES (599, 'DP', 219, 27, 546, '2004/2005', 'Modelovanie komplexnĂ˝ch systĂ©mov', 'Modeling of Complex Systems', NULL, NULL, 1);
INSERT INTO projects VALUES (600, 'ZP', 358, NULL, 550, '2002/2003', 'Testovanie bezpeÄŤnostnej brĂˇny', 'Firewall testing', NULL, NULL, 0);
INSERT INTO projects VALUES (601, 'DP', 551, 358, 550, '2003/2004', 'Modelovanie poÄŤĂ­taÄŤovej siete', 'Modeling of computer network', NULL, NULL, 0);
INSERT INTO projects VALUES (602, 'ZP', 359, NULL, 552, '2004/2005', 'MonitorovacĂ­ panel do PC', 'Monitoring panel for PC', 'Navrhnite a zostrojte hardwarovĂ˝ monitorovacĂ­ panel pre osobnĂ˝ poÄŤĂ­taÄŤ/server. Jeho Ăşlohou je kontrola sprĂˇvnej ÄŤinnosti a stavu PC a jeho ovlĂˇdanie. Pod kontrolou a ovlĂˇdanĂ­m sa myslĂ­ monitorovanie teploty komponentov PC (aspoĹ 4 teplotnĂ© senzory), monitorovanie a riadenie otĂˇÄŤok ventilĂˇtorov, monitorovanie inĂ˝ch snĂ­maÄŤov (otvorenie case poÄŤĂ­taÄŤa, vĂ˝padok napĂˇjania), riadenie signĂˇlu reset a power on/off. TakĂ˝to hw monitor bude komunikovaĹĄ s pouĹľĂ­vateÄľom prostrednĂ­ctvom displaya a jednoduchej klĂˇvesnice. Konfigurovanie a ÄŤĂ­tanie aktuĂˇlneho stavu bude moĹľnĂ© aj priamo z PC cez sĂ©riovĂ˝ port (resp. USB) (naprogramovanĂ© ako PnP zariadenie s vlastnĂ˝m driverom). Podpora OS Windows poprĂ­pade UNIX/Linux. Hw monitor bude obsahovaĹĄ signalizaÄŤnĂş sirĂ©nu na indikĂˇciu poruchovĂ©ho stavu.', 'Navrhnite a zostrojte hardwarovĂ˝ monitorovacĂ­ panel pre osobnĂ˝ poÄŤĂ­taÄŤ/server. Jeho Ăşlohou je kontrola sprĂˇvnej ÄŤinnosti a stavu PC a jeho ovlĂˇdanie. Pod kontrolou a ovlĂˇdanĂ­m sa myslĂ­ monitorovanie teploty komponentov PC (aspoĹ 4 teplotnĂ© senzory), monitorovanie a riadenie otĂˇÄŤok ventilĂˇtorov, monitorovanie inĂ˝ch snĂ­maÄŤov (otvorenie case poÄŤĂ­taÄŤa, vĂ˝padok napĂˇjania), riadenie signĂˇlu reset a power on/off. TakĂ˝to hw monitor bude komunikovaĹĄ s pouĹľĂ­vateÄľom prostrednĂ­ctvom displaya a jednoduchej klĂˇvesnice. Konfigurovanie a ÄŤĂ­tanie aktuĂˇlneho stavu bude moĹľnĂ© aj priamo z PC cez sĂ©riovĂ˝ port (resp. USB) (naprogramovanĂ© ako PnP zariadenie s vlastnĂ˝m driverom). Podpora OS Windows poprĂ­pade UNIX/Linux. Hw monitor bude obsahovaĹĄ signalizaÄŤnĂş sirĂ©nu na indikĂˇciu poruchovĂ©ho stavu.', 0);
INSERT INTO projects VALUES (603, 'DP', 541, NULL, 552, '2005/2006', 'SystĂ©m automatizovanĂ©ho odÄŤĂ­tavania plynomerov a vodomerov', 'SystĂ©m automatizovanĂ©ho odÄŤĂ­tavania plynomerov a vodomerov', NULL, NULL, 4);
INSERT INTO projects VALUES (604, 'ZP', 297, NULL, 553, '2004/2005', 'Ăštoky v sieĹĄach a obrana', 'Computer network attacks and security', 'Analyzujte typy vĂ­rusov v poÄŤĂ­taÄŤovej sieti. SkĂşmajte metĂłdy identifikĂˇcie vĂ­rusov. OboznĂˇmte sa s existujĂşcimi antivĂ­rovĂ˝mi systĂ©mami. Vytvorte softvĂ©rovĂ˝ prostriedok, ktorĂ˝  dokĂˇĹľe odhaliĹĄ z poslanej e-mailovej sprĂˇvy pravdepodobnĂş prĂ­tomnosĹĄ vĂ­rusu a vydedukovaĹĄ moĹľnĂ˝ spĂ´sob jeho rozvinutia. VĂ˝stupom bude odporĂşÄŤanie pre prĂ­jemcu sprĂˇvy, do akej miery je bezpeÄŤnĂ© sprĂˇvu otvĂˇraĹĄ, prĂ­padne s Ĺou manipulovaĹĄ.', 'Analyzujte typy vĂ­rusov v poÄŤĂ­taÄŤovej sieti. SkĂşmajte metĂłdy identifikĂˇcie vĂ­rusov. OboznĂˇmte sa s existujĂşcimi antivĂ­rovĂ˝mi systĂ©mami. Vytvorte softvĂ©rovĂ˝ prostriedok, ktorĂ˝  dokĂˇĹľe odhaliĹĄ z poslanej e-mailovej sprĂˇvy pravdepodobnĂş prĂ­tomnosĹĄ vĂ­rusu a vydedukovaĹĄ moĹľnĂ˝ spĂ´sob jeho rozvinutia. VĂ˝stupom bude odporĂşÄŤanie pre prĂ­jemcu sprĂˇvy, do akej miery je bezpeÄŤnĂ© sprĂˇvu otvĂˇraĹĄ, prĂ­padne s Ĺou manipulovaĹĄ.', 1);
INSERT INTO projects VALUES (605, 'DP', 294, NULL, 553, '2005/2006', 'AplikĂˇcie virtuĂˇlnej reality vo vizuĂˇlnom dolovanĂ­ v dĂˇtach', 'AplikĂˇcie virtuĂˇlnej reality vo vizuĂˇlnom dolovanĂ­ v dĂˇtach', NULL, NULL, 4);
INSERT INTO projects VALUES (606, 'ZP', 655, NULL, 554, '2004/2005', 'NĂˇstroj pre analĂ˝zu javov v neurĂłnovĂ˝ch sieĹĄach', 'Visual demonstration of various phenomena in field of neural networks', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch doprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou, ako sĂş naprĂ­klad ÄŤasovĂ© postupnosti symbolov. Pri ich skĂşmanĂ­ boli opĂ­sanĂ© viacerĂ© zaujĂ­mavĂ© javy, ktorĂ© vyĹľadujĂş podrobnejĹˇiu analĂ˝zu pre ich lepĹˇie pochopenie.
NaĹˇtudujte problematiku rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­, zamerajte sa na javy v rekurentnĂ˝ch sieĹĄach ako architektutĂˇlny bias (fraktĂˇlovĂˇ ĹˇtruktĂşra stavovĂ©ho priestoru), zmena stavovej reprezentĂˇcie v procese uÄŤenia, prĂ­padne strĂˇcanie chybovĂ˝ch signĂˇlov v ÄŤase. Navrhnite a vytvorte nĂˇstroj (napr. JAVA applet), ktorĂ˝ by umoĹľnil pomocou zaujĂ­mavĂ˝ch vizualizĂˇcii prehÄľadnĂ© znĂˇzornenie tĂ˝chto javov a tak ich nĂˇslednĂ© skĂşmanie.  VytvorenĂ© rieĹˇenie overte na zvolenĂ˝ch testovacĂ­ch postupnostiach.', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch doprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou, ako sĂş naprĂ­klad ÄŤasovĂ© postupnosti symbolov. Pri ich skĂşmanĂ­ boli opĂ­sanĂ© viacerĂ© zaujĂ­mavĂ© javy, ktorĂ© vyĹľadujĂş podrobnejĹˇiu analĂ˝zu pre ich lepĹˇie pochopenie.
NaĹˇtudujte problematiku rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­, zamerajte sa na javy v rekurentnĂ˝ch sieĹĄach ako architektutĂˇlny bias (fraktĂˇlovĂˇ ĹˇtruktĂşra stavovĂ©ho priestoru), zmena stavovej reprezentĂˇcie v procese uÄŤenia, prĂ­padne strĂˇcanie chybovĂ˝ch signĂˇlov v ÄŤase. Navrhnite a vytvorte nĂˇstroj (napr. JAVA applet), ktorĂ˝ by umoĹľnil pomocou zaujĂ­mavĂ˝ch vizualizĂˇcii prehÄľadnĂ© znĂˇzornenie tĂ˝chto javov a tak ich nĂˇslednĂ© skĂşmanie.  VytvorenĂ© rieĹˇenie overte na zvolenĂ˝ch testovacĂ­ch postupnostiach.', 1);
INSERT INTO projects VALUES (607, 'DP', 387, NULL, 554, '2005/2006', 'Ĺ tatistickĂ© modelovanie hypertextu', 'Ĺ tatistickĂ© modelovanie hypertextu', NULL, NULL, 1);
INSERT INTO projects VALUES (608, 'ZP', 294, NULL, 555, '2004/2005', 'Prostredia pre tvorbu a prehliadanie modelov virtuĂˇlnej reality', 'Systems for modeling and viewing virtual reality models', 'Urobte prehÄľad existujĂşcich systĂ©mov pre tvorbu a prezentĂˇciu systĂ©mov pre aplikĂˇcie Web3D. Porovnajte  existujĂşce systĂ©my a zamerajte sa na VRML a EON Reality.  DemonĹˇtrujte funkciu modelu na jednoduchej interaktĂ­vnej scĂ©ny naprogramovanej pomocou VRML a EON Reality.
InformĂˇcie:
 1. OficiĂˇlna strĂˇnka konzorcia Web3D: http://www.web3d.org
 2. StrĂˇnka firmy EON Reality: http://www.eonreality.com
 3. StrĂˇnka VRML:http://www.vrml.org
 ', 'Urobte prehÄľad existujĂşcich systĂ©mov pre tvorbu a prezentĂˇciu systĂ©mov pre aplikĂˇcie Web3D. Porovnajte  existujĂşce systĂ©my a zamerajte sa na VRML a EON Reality.  DemonĹˇtrujte funkciu modelu na jednoduchej interaktĂ­vnej scĂ©ny naprogramovanej pomocou VRML a EON Reality.
InformĂˇcie:
 1. OficiĂˇlna strĂˇnka konzorcia Web3D: http://www.web3d.org
 2. StrĂˇnka firmy EON Reality: http://www.eonreality.com
 3. StrĂˇnka VRML:http://www.vrml.org
 ', 1);
INSERT INTO projects VALUES (609, 'DP', 33, NULL, 555, '2005/2006', 'Tvorba a porovnanie nĂˇuÄŤnej 2D a 3D simulĂˇcie', 'Tvorba a porovnanie nĂˇuÄŤnej 2D a 3D simulĂˇcie', NULL, NULL, 1);
INSERT INTO projects VALUES (610, 'ZP', 20, NULL, 556, '2004/2005', 'Hra pre mobilnĂ© zariadenia', 'Game for mobile devices', 'MobilnĂ© zariadenia umoĹľĹujĂşce vykonĂˇvanie uĹľĂ­vateÄľom dodanĂ˝ch programov sĂş ÄŤoraz dostupnejĹˇie. NaĹˇtudujte moĹľnosti programovania aplikĂˇciĂ­ pre mobilnĂ© zariadenia pomocou Java 2 Micro Edition. Vytvorte  aplikĂˇciu â€“ hru vyĹľadujĂşcu oponenta, priÄŤom logika oponenta bude realizovanĂˇ priamo na mobilnom zariadenĂ­.
', 'MobilnĂ© zariadenia umoĹľĹujĂşce vykonĂˇvanie uĹľĂ­vateÄľom dodanĂ˝ch programov sĂş ÄŤoraz dostupnejĹˇie. NaĹˇtudujte moĹľnosti programovania aplikĂˇciĂ­ pre mobilnĂ© zariadenia pomocou Java 2 Micro Edition. Vytvorte  aplikĂˇciu â€“ hru vyĹľadujĂşcu oponenta, priÄŤom logika oponenta bude realizovanĂˇ priamo na mobilnom zariadenĂ­.
', 1);
INSERT INTO projects VALUES (611, 'DP', 98, NULL, 556, '2005/2006', 'Generovanie, spracovanie a rozpoznĂˇvanie digitĂˇlnych kriviek', 'Generovanie, spracovanie a rozpoznĂˇvanie digitĂˇlnych kriviek', NULL, NULL, 1);
INSERT INTO projects VALUES (612, 'ZP', 25, NULL, 558, '2004/2005', 'KoncentrĂˇtor paralelnĂ˝ch rozhranĂ­', 'System for concentration of parallel interfaces', 'Analyzujte funkciu snĂ­maÄŤa odtlaÄŤkov prstov BioMouse a spĂ´sob komunikĂˇcie s nadradenĂ˝m poÄŤĂ­taÄŤom. Navrhnite spĂ´sob konverzie paralelnĂ©ho rozhrania na sĂ©riovĂ© za ĂşÄŤelom zvĂ˝Ĺˇenia prenosovej vzdialenosti a s moĹľnosĹĄou pripojenia viacerĂ˝ch zariadenĂ­ sĂşÄŤasne. NavrhnutĂ˝ systĂ©m implementujte spolu s potrebnĂ˝m programovĂ˝m vybavenĂ­m na strane nadradenĂ©ho poÄŤĂ­taÄŤa. Overte funkÄŤnosĹĄ a spoÄľahlivosĹĄ rieĹˇenia.', 'Analyzujte funkciu snĂ­maÄŤa odtlaÄŤkov prstov BioMouse a spĂ´sob komunikĂˇcie s nadradenĂ˝m poÄŤĂ­taÄŤom. Navrhnite spĂ´sob konverzie paralelnĂ©ho rozhrania na sĂ©riovĂ© za ĂşÄŤelom zvĂ˝Ĺˇenia prenosovej vzdialenosti a s moĹľnosĹĄou pripojenia viacerĂ˝ch zariadenĂ­ sĂşÄŤasne. NavrhnutĂ˝ systĂ©m implementujte spolu s potrebnĂ˝m programovĂ˝m vybavenĂ­m na strane nadradenĂ©ho poÄŤĂ­taÄŤa. Overte funkÄŤnosĹĄ a spoÄľahlivosĹĄ rieĹˇenia.', 0);
INSERT INTO projects VALUES (613, 'DP', 358, NULL, 558, '2005/2006', 'CertifikaÄŤnĂˇ autorita', 'CertifikaÄŤnĂˇ autorita', NULL, NULL, 0);
INSERT INTO projects VALUES (614, 'ZP', 361, NULL, 559, '2004/2005', 'ProblĂ©movĂˇ ĹˇtĂşdia  Ĺˇkodlivosti EM Ĺľiarenia z mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM)', 'The case study of harmfulness of the EM radiance from the mobile computer system (GSM)', 'Analyzujte problematiku Ĺˇkodlivosti EM Ĺľiarenia  z mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM) a jeho vplyvu na ÄľudskĂ˝ organizmus. Navrhnite a implementujte antiradiaÄŤnĂ© modely (zariadenia) na ĂşÄŤinnĂş ochranu a porovnajte ich ĂşÄŤinnosĹĄ.', 'Analyzujte problematiku Ĺˇkodlivosti EM Ĺľiarenia  z mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM) a jeho vplyvu na ÄľudskĂ˝ organizmus. Navrhnite a implementujte antiradiaÄŤnĂ© modely (zariadenia) na ĂşÄŤinnĂş ochranu a porovnajte ich ĂşÄŤinnosĹĄ.', 0);
INSERT INTO projects VALUES (615, 'DP', 562, 358, 559, '2005/2006', 'ModifikĂˇcia meracieho systĂ©mu s PC', 'ModifikĂˇcia meracieho systĂ©mu s PC', NULL, NULL, 0);
INSERT INTO projects VALUES (616, 'ZP', 301, NULL, 560, '2004/2005', 'NĂˇvrh a implementĂˇcia algoritmu pre funkÄŤnĂ˝ generĂˇtor testov  VLSI obvodov', 'Design and implementation of algorithm for functional test generator of VLSI circuits', 'Analyzujte metĂłdy a spĂ´soby generovania funkÄŤnĂ˝ch testov, navrhnite a  realizujte algoritmus pre systĂ©m generovania  funkÄŤnĂ˝ch testov vnorenĂ˝ch systĂ©mov, ktorĂ˝ zostavuje funkÄŤnĂ© testy na zĂˇklade opisu obvodu v istom ĹˇpecifikaÄŤnom jazyku (VHDL). Algoritmus implementujte a vytvorte grafickĂ© uĹľĂ­vateÄľskĂ© rozhranie. FunkÄŤnosĹĄ implementovanĂ©ho algoritmu a vyhodnotenie ĂşÄŤinnosti generovanĂ˝ch testovacĂ­ch mixov overte na prĂ­kladoch. ', 'Analyzujte metĂłdy a spĂ´soby generovania funkÄŤnĂ˝ch testov, navrhnite a  realizujte algoritmus pre systĂ©m generovania  funkÄŤnĂ˝ch testov vnorenĂ˝ch systĂ©mov, ktorĂ˝ zostavuje funkÄŤnĂ© testy na zĂˇklade opisu obvodu v istom ĹˇpecifikaÄŤnom jazyku (VHDL). Algoritmus implementujte a vytvorte grafickĂ© uĹľĂ­vateÄľskĂ© rozhranie. FunkÄŤnosĹĄ implementovanĂ©ho algoritmu a vyhodnotenie ĂşÄŤinnosti generovanĂ˝ch testovacĂ­ch mixov overte na prĂ­kladoch. ', 0);
INSERT INTO projects VALUES (617, 'DP', 25, NULL, 560, '2005/2006', 'PerzistentnĂ© procesy v OS Unix', 'PerzistentnĂ© procesy v OS Unix', NULL, NULL, 0);
INSERT INTO projects VALUES (618, 'ZP', 358, NULL, 561, '2004/2005', 'Podpora vypracovania znaleckĂ©ho posudku v odbore elektrotechnika', 'Support in elaborating an experts opinion in field of electrotechnics', 'Navrhnite a implementujte podpornĂ˝ systĂ©m na vypracovanie znaleckĂ©ho posudku na stanovenie hodnoty elektrotechnickĂ©ho zariadenia. Postup a metodika na stanovenie hodnoty sĂş urÄŤenĂ© v Znaleckom Ĺˇtandarde. PodpornĂ˝ systĂ©m by mal interaktĂ­vne spolupracovaĹĄ so znalcom a mal by poskytovaĹĄ pouĹľĂ­vateÄľsky prĂ­jemnĂ© prostredie. ', 'Navrhnite a implementujte podpornĂ˝ systĂ©m na vypracovanie znaleckĂ©ho posudku na stanovenie hodnoty elektrotechnickĂ©ho zariadenia. Postup a metodika na stanovenie hodnoty sĂş urÄŤenĂ© v Znaleckom Ĺˇtandarde. PodpornĂ˝ systĂ©m by mal interaktĂ­vne spolupracovaĹĄ so znalcom a mal by poskytovaĹĄ pouĹľĂ­vateÄľsky prĂ­jemnĂ© prostredie. ', 0);
INSERT INTO projects VALUES (619, 'ZP', 612, 357, 564, '2004/2005', 'AnalĂ˝za implementĂˇcie QoS na produktoch CISCO existujĂşcej IP siete', 'AnalĂ˝za implementĂˇcie QoS na produktoch CISCO existujĂşcej IP siete', 'Ăšlohou projektu je vypracovaĹĄ analĂ˝zu implementĂˇcie QoS na produktoch
CISCO v uĹľ existujĂşcej IP sieti. AnalĂ˝za okrem inĂ©ho obsahuje prehÄľad 
PoĹľiadaviek uĹľ teraz pripojenĂ˝ch aplikĂˇciĂ­ a tieĹľ v budĂşcnosti oÄŤakĂˇvanĂ˝ch.
Zhodnotenie Ăşrovne QoS v danĂ˝ch podmienkach, nĂˇvrhy inĂ˝ch alternatĂ­v
a implementĂˇciu prĂ­padnĂ˝ch zmien. Zmeny otestujte so zameranĂ­m na 
funkÄŤnosĹĄ
', 'Ăšlohou projektu je vypracovaĹĄ analĂ˝zu implementĂˇcie QoS na produktoch
CISCO v uĹľ existujĂşcej IP sieti. AnalĂ˝za okrem inĂ©ho obsahuje prehÄľad 
PoĹľiadaviek uĹľ teraz pripojenĂ˝ch aplikĂˇciĂ­ a tieĹľ v budĂşcnosti oÄŤakĂˇvanĂ˝ch.
Zhodnotenie Ăşrovne QoS v danĂ˝ch podmienkach, nĂˇvrhy inĂ˝ch alternatĂ­v
a implementĂˇciu prĂ­padnĂ˝ch zmien. Zmeny otestujte so zameranĂ­m na 
funkÄŤnosĹĄ
', 0);
INSERT INTO projects VALUES (620, 'DP', 27, NULL, 564, '2005/2006', 'SprĂˇva distribuovanĂ˝ch Ăşdajov', 'SprĂˇva distribuovanĂ˝ch Ăşdajov', NULL, NULL, 0);
INSERT INTO projects VALUES (621, 'ZP', 24, NULL, 565, '2004/2005', 'OptimalizĂˇcia turnusov v autobusovej doprave', 'OptimalizĂˇcia turnusov v autobusovej doprave', 'Pomocou grafovĂ©ho modelu rieĹˇte optimalizĂˇciu turnusov v autobusovej doprave.
Analyzujte vybranĂ© metĂłdy, ktorĂ© sa pouĹľĂ­vajĂş v teĂłrii grafov 
na modelovanie dopravnĂ˝ch sietĂ­. Analyzujte pouĹľitĂ© algoritmy, ktorĂ˝mi problĂ©m optimalizujete.
Navrhnite model, pre optimalizĂˇciu turnusov v autobusovej doprave.
NĂˇjdite maximĂˇlny tok v  dopravnej sieti. Model optimalizujte a zistite najlacnejĹˇĂ­ maximĂˇlny tok. NavrhnutĂ˝ model vizualizujte vytvorenĂ­m softvĂ©rovĂ©ho prototypu.
', 'Pomocou grafovĂ©ho modelu rieĹˇte optimalizĂˇciu turnusov v autobusovej doprave.
Analyzujte vybranĂ© metĂłdy, ktorĂ© sa pouĹľĂ­vajĂş v teĂłrii grafov 
na modelovanie dopravnĂ˝ch sietĂ­. Analyzujte pouĹľitĂ© algoritmy, ktorĂ˝mi problĂ©m optimalizujete.
Navrhnite model, pre optimalizĂˇciu turnusov v autobusovej doprave.
NĂˇjdite maximĂˇlny tok v  dopravnej sieti. Model optimalizujte a zistite najlacnejĹˇĂ­ maximĂˇlny tok. NavrhnutĂ˝ model vizualizujte vytvorenĂ­m softvĂ©rovĂ©ho prototypu.
', 1);
INSERT INTO projects VALUES (622, 'DP', 47, 705, 567, '2005/2006', 'NĂˇvrh a realizĂˇcia HW generĂˇtora nĂˇhodnĂ˝ch ÄŤĂ­sel', 'NĂˇvrh a realizĂˇcia HW generĂˇtora nĂˇhodnĂ˝ch ÄŤĂ­sel', NULL, NULL, 0);
INSERT INTO projects VALUES (623, 'ZP', 25, NULL, 567, '2003/2004', 'AutentifikĂˇcia pouĹľĂ­vateÄľov ÄŤipovĂ˝mi kartami', 'RFID card users authentication', 'Analyzujte vlastnosti identifikaÄŤnĂ˝ch ÄŤipovĂ˝ch kariet a moĹľnosti ich vyuĹľitia pri autentifikĂˇcii pouĹľĂ­vateÄľov z pohÄľadu operaÄŤnĂ©ho systĂ©mu s vyuĹľitĂ­m modulov PAM (Pluggable Authentication Modules). Navrhnite a implementujte perifĂ©rne zariadenie umoĹľĹujĂşce naÄŤĂ­tanie kĂłdu z bezpeÄŤnostnĂ˝ch kariet a jeho nĂˇslednĂ© spracovanie, ako aj prĂ­sluĹˇnĂ˝ autentifikaÄŤnĂ˝ modul PAM. CelĂ˝ systĂ©m otestujte so zameranĂ­m na funkÄŤnosĹĄ a bezpeÄŤnosĹĄ.', 'Analyzujte vlastnosti identifikaÄŤnĂ˝ch ÄŤipovĂ˝ch kariet a moĹľnosti ich vyuĹľitia pri autentifikĂˇcii pouĹľĂ­vateÄľov z pohÄľadu operaÄŤnĂ©ho systĂ©mu s vyuĹľitĂ­m modulov PAM (Pluggable Authentication Modules). Navrhnite a implementujte perifĂ©rne zariadenie umoĹľĹujĂşce naÄŤĂ­tanie kĂłdu z bezpeÄŤnostnĂ˝ch kariet a jeho nĂˇslednĂ© spracovanie, ako aj prĂ­sluĹˇnĂ˝ autentifikaÄŤnĂ˝ modul PAM. CelĂ˝ systĂ©m otestujte so zameranĂ­m na funkÄŤnosĹĄ a bezpeÄŤnosĹĄ.', 0);
INSERT INTO projects VALUES (624, 'ZP', 655, NULL, 568, '2004/2005', 'NeurĂłnovĂ© siete a evoluÄŤnĂ© algoritmy', 'Neural networks and evolutionary algorithms', 'NeurĂłnovĂ© siete a evoluÄŤnĂ© algoritmy sa v poslednom obdobĂ­ stali populĂˇrne najmĂ¤ na rieĹˇenie problĂ©mov v oblastiach, kde klasickĂ© prĂ­stupy a znĂˇme algoritmy zlyhĂˇvajĂş. NaĹˇtudujte problematiku evoluÄŤnĂ˝ch algoritmov najmĂ¤ s ohÄľadom na moĹľnosĹĄ ich aplikovania v oblasti neurĂłnovĂ˝ch sietĂ­. Navrhnite a implementujte program (simulĂˇtor) umoĹľĹujĂşci pri trĂ©novanĂ­ neurĂłnovej siete evolĂşciou zĂˇroveĹ vyvĂ­jaĹĄ a upravovaĹĄ aj jej topolĂłgiu. VytvorenĂ© rieĹˇenie overte na zvolenom problĂ©me.', 'NeurĂłnovĂ© siete a evoluÄŤnĂ© algoritmy sa v poslednom obdobĂ­ stali populĂˇrne najmĂ¤ na rieĹˇenie problĂ©mov v oblastiach, kde klasickĂ© prĂ­stupy a znĂˇme algoritmy zlyhĂˇvajĂş. NaĹˇtudujte problematiku evoluÄŤnĂ˝ch algoritmov najmĂ¤ s ohÄľadom na moĹľnosĹĄ ich aplikovania v oblasti neurĂłnovĂ˝ch sietĂ­. Navrhnite a implementujte program (simulĂˇtor) umoĹľĹujĂşci pri trĂ©novanĂ­ neurĂłnovej siete evolĂşciou zĂˇroveĹ vyvĂ­jaĹĄ a upravovaĹĄ aj jej topolĂłgiu. VytvorenĂ© rieĹˇenie overte na zvolenom problĂ©me.', 1);
INSERT INTO projects VALUES (625, 'DP', 660, NULL, 568, '2005/2006', 'VizuĂˇlne prehÄľadĂˇvanie RDF dokumentov', 'VizuĂˇlne prehÄľadĂˇvanie RDF dokumentov', NULL, NULL, 1);
INSERT INTO projects VALUES (626, 'ZP', 360, NULL, 570, '2003/2004', 'PouĹľĂ­vateÄľskĂ© rozhranie pre simulĂˇtor jednoduchĂ©ho poÄŤĂ­taÄŤa', 'User interface for a simulator of a simple computer', 'Analyzujte problematiku simulĂˇcie ÄŤinnosti jednoduchĂ©ho poÄŤĂ­taÄŤa. Navrhnite a implementujte integrovanĂ© pouĹľĂ­vateÄľskĂ© rozhranie pre simulĂˇtor pracujĂşci na Ăşrovni medziregistrovĂ˝ch prenosov.
Rozhranie mĂˇ umoĹľĹovaĹĄ aj vizualizĂˇciu simulĂˇcie programu pozostĂˇvajĂşceho z postupnosti vybranĂ˝ch strojovĂ˝ch inĹˇtrukciĂ­. MĂˇ byĹĄ funkÄŤnĂ˝ pod OS Windows.
TĂşto tĂ©mu je moĹľnĂ© robiĹĄ len v sĂşÄŤinnosti s tĂ©mou â€ž SimulĂˇtor poÄŤĂ­taÄŤa na Ăşrovni medziregistrovĂ˝ch prenosov â€ś.
', 'Analyzujte problematiku simulĂˇcie ÄŤinnosti jednoduchĂ©ho poÄŤĂ­taÄŤa. Navrhnite a implementujte integrovanĂ© pouĹľĂ­vateÄľskĂ© rozhranie pre simulĂˇtor pracujĂşci na Ăşrovni medziregistrovĂ˝ch prenosov.
Rozhranie mĂˇ umoĹľĹovaĹĄ aj vizualizĂˇciu simulĂˇcie programu pozostĂˇvajĂşceho z postupnosti vybranĂ˝ch strojovĂ˝ch inĹˇtrukciĂ­. MĂˇ byĹĄ funkÄŤnĂ˝ pod OS Windows.
TĂşto tĂ©mu je moĹľnĂ© robiĹĄ len v sĂşÄŤinnosti s tĂ©mou â€ž SimulĂˇtor poÄŤĂ­taÄŤa na Ăşrovni medziregistrovĂ˝ch prenosov â€ś.
', 0);
INSERT INTO projects VALUES (627, 'DP', 360, NULL, 570, '2005/2006', 'ProgramovĂ˝ systĂ©m podporujĂşci syntĂ©zu asynchrĂłnnych sekvenÄŤnĂ˝ch obvodov ', 'ProgramovĂ˝ systĂ©m podporujĂşci syntĂ©zu asynchrĂłnnych sekvenÄŤnĂ˝ch obvodov ', NULL, NULL, 0);
INSERT INTO projects VALUES (628, 'ZP', 342, NULL, 571, '2003/2004', 'TechnickĂ© prostriedky pre podporu vĂ˝uÄŤby strojovĂ©ho programovania.', 'Technical support for teaching of Machine Level Languages ', 'Analyzujte moĹľnosti technickĂ˝ch prostriedkov pre podporu vyuÄŤovania programovania na strojovej Ăşrovni. Navrhnite vhodnĂş zostavu technickĂ˝ch prostriedkov pouĹľiteÄľnĂ˝ch pre podporu vĂ˝uÄŤby v aplikĂˇcii s poÄŤĂ­taÄŤom typu PC. Zrealizujte vybranĂş ÄŤasĹĄ prototypu navrhnutĂ˝ch technickĂ˝ch prostriedkov vrĂˇtane potrebnĂ©ho programovĂ©ho  vybavenia.', 'Analyzujte moĹľnosti technickĂ˝ch prostriedkov pre podporu vyuÄŤovania programovania na strojovej Ăşrovni. Navrhnite vhodnĂş zostavu technickĂ˝ch prostriedkov pouĹľiteÄľnĂ˝ch pre podporu vĂ˝uÄŤby v aplikĂˇcii s poÄŤĂ­taÄŤom typu PC. Zrealizujte vybranĂş ÄŤasĹĄ prototypu navrhnutĂ˝ch technickĂ˝ch prostriedkov vrĂˇtane potrebnĂ©ho programovĂ©ho  vybavenia.', 0);
INSERT INTO projects VALUES (629, 'DP', 562, 358, 571, '2005/2006', 'MeracĂ­ systĂ©m s PC', 'MeracĂ­ systĂ©m s PC', NULL, NULL, 0);
INSERT INTO projects VALUES (630, 'ZP', 297, NULL, 572, '2003/2004', 'Preklad strojovĂ˝ch programov', 'Compilation of machine programs', NULL, NULL, 1);
INSERT INTO projects VALUES (631, 'ZP', 437, NULL, 573, '2003/2004', 'OsobnĂ© Ăşdaje v informaÄŤnĂ˝ch systĂ©moch', 'Personal data in information systems', 'UveÄŹte pojmy osobnĂ© Ăşdaje a informaÄŤnĂ˝ systĂ©m z pohÄľadu technickĂ©ho aj prĂˇvneho, priÄŤom uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Vysvetlite, ÄŤo je to ochrana Ăşdajov v informaÄŤnĂ˝ch systĂ©moch, preÄŤo treba osobnĂ© Ăşdaje chrĂˇniĹĄ s dĂ´razom na etickĂ© a spoloÄŤenskĂ© sĂşvislosti. OpĂ­Ĺˇte znĂˇme prĂˇvne rieĹˇenia ochrany osobnĂ˝ch Ăşdajov, priÄŤom opĂ¤ĹĄ uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Analyzujte sĂşÄŤasnĂ˝ stav, pomenujte prĂ­padnĂ© otvorenĂ© problĂ©my a naznaÄŤte moĹľnosti  ich rieĹˇenia. O celej problematike vytvorte tĂ©matickĂ© pavuÄŤinovĂ© sĂ­dlo, ktorĂ© bude slĂşĹľiĹĄ ako zdroj informĂˇciĂ­ aj odkazov na ne. ', 'UveÄŹte pojmy osobnĂ© Ăşdaje a informaÄŤnĂ˝ systĂ©m z pohÄľadu technickĂ©ho aj prĂˇvneho, priÄŤom uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Vysvetlite, ÄŤo je to ochrana Ăşdajov v informaÄŤnĂ˝ch systĂ©moch, preÄŤo treba osobnĂ© Ăşdaje chrĂˇniĹĄ s dĂ´razom na etickĂ© a spoloÄŤenskĂ© sĂşvislosti. OpĂ­Ĺˇte znĂˇme prĂˇvne rieĹˇenia ochrany osobnĂ˝ch Ăşdajov, priÄŤom opĂ¤ĹĄ uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Analyzujte sĂşÄŤasnĂ˝ stav, pomenujte prĂ­padnĂ© otvorenĂ© problĂ©my a naznaÄŤte moĹľnosti  ich rieĹˇenia. O celej problematike vytvorte tĂ©matickĂ© pavuÄŤinovĂ© sĂ­dlo, ktorĂ© bude slĂşĹľiĹĄ ako zdroj informĂˇciĂ­ aj odkazov na ne. ', 1);
INSERT INTO projects VALUES (632, 'DP', 704, NULL, 573, '2005/2006', 'PrezentĂˇcia histĂłrie informatiky na STU', 'PrezentĂˇcia histĂłrie informatiky na STU', NULL, NULL, 4);
INSERT INTO projects VALUES (633, 'ZP', 360, NULL, 574, '2003/2004', 'SimulĂˇtor poÄŤĂ­taÄŤa na Ăşrovni medziregistrovĂ˝ch prenosov', 'SimulĂˇtor poÄŤĂ­taÄŤa na Ăşrovni medziregistrovĂ˝ch prenosov', 'Analyzujte problematiku simulĂˇcie ÄŤinnosti jednoduchĂ©ho poÄŤĂ­taÄŤa. Navrhnite a implementujte simulĂˇtor poÄŤĂ­taÄŤa pracujĂşceho na Ăşrovni medziregistrovĂ˝ch prenosov.
SimulĂˇtor mĂˇ vedieĹĄ odsimulovaĹĄ program pozostĂˇvajĂşci z vybranĂ˝ch strojovĂ˝ch inĹˇtrukciĂ­.
MĂˇ pracovaĹĄ pod OS Windows.
', 'Analyzujte problematiku simulĂˇcie ÄŤinnosti jednoduchĂ©ho poÄŤĂ­taÄŤa. Navrhnite a implementujte simulĂˇtor poÄŤĂ­taÄŤa pracujĂşceho na Ăşrovni medziregistrovĂ˝ch prenosov.
SimulĂˇtor mĂˇ vedieĹĄ odsimulovaĹĄ program pozostĂˇvajĂşci z vybranĂ˝ch strojovĂ˝ch inĹˇtrukciĂ­.
MĂˇ pracovaĹĄ pod OS Windows.
', 0);
INSERT INTO projects VALUES (634, 'DP', 301, NULL, 574, '2005/2006', 'FunkÄŤnĂ˝ generĂˇtor testov VLSI obvodov', 'FunkÄŤnĂ˝ generĂˇtor testov VLSI obvodov', NULL, NULL, 0);
INSERT INTO projects VALUES (635, 'ZP', 13, 431, 575, '2003/2004', 'SamoÄŤinnĂ˝ generĂˇtor testov a prĂ­znakovĂ˝ analyzĂˇtor ako sĂşÄŤasĹĄ automatickĂ©ho generĂˇtora testov DefGen', 'Self-test generator as a part of the automatic test generator DefGen.', 'Analyzujte architektĂşry vstavanĂ˝ch generĂˇtorov pseudonĂˇhodnĂ˝ch testov a generovanie prĂ­znakov pre ÄŤĂ­slicovĂ© obvody. Navrhnite a implementujte vybranĂ© architektĂşry ako ĹˇkĂˇlovateÄľnĂ© ĹˇtruktĂşry a ako sĂşÄŤasĹĄ automatickĂ©ho generĂˇtora testov DefGen s prepojenĂ­m na poruchovĂ˝ simulĂˇtor a deterministickĂ˝ generĂˇtor testov pre vyhodnocovanie diagnostickĂ©ho pokrytia porĂşch vstavanĂ©ho generĂˇtora testov pre cieÄľenĂ˝ obvod.  FunkÄŤnosĹĄ dokumentujte prĂ­kladmi. ', 'Analyzujte architektĂşry vstavanĂ˝ch generĂˇtorov pseudonĂˇhodnĂ˝ch testov a generovanie prĂ­znakov pre ÄŤĂ­slicovĂ© obvody. Navrhnite a implementujte vybranĂ© architektĂşry ako ĹˇkĂˇlovateÄľnĂ© ĹˇtruktĂşry a ako sĂşÄŤasĹĄ automatickĂ©ho generĂˇtora testov DefGen s prepojenĂ­m na poruchovĂ˝ simulĂˇtor a deterministickĂ˝ generĂˇtor testov pre vyhodnocovanie diagnostickĂ©ho pokrytia porĂşch vstavanĂ©ho generĂˇtora testov pre cieÄľenĂ˝ obvod.  FunkÄŤnosĹĄ dokumentujte prĂ­kladmi. ', 0);
INSERT INTO projects VALUES (636, 'DP', 13, 301, 575, '2005/2006', 'E-systĂ©m generovania testov pre digitĂˇlne obvody', 'E-systĂ©m generovania testov pre digitĂˇlne obvody', NULL, NULL, 0);
INSERT INTO projects VALUES (637, 'ZP', 220, NULL, 576, '2002/2003', 'Posudzovanie nĂˇhodnĂ˝ch postupnopstĂ­ z hÄľadiska potrieb kryptografie', 'Posudzovanie nĂˇhodnĂ˝ch postupnopstĂ­ z hÄľadiska potrieb kryptografie', NULL, NULL, 1);
INSERT INTO projects VALUES (638, 'ZP', 360, NULL, 577, '2004/2005', 'SimulĂˇtor poÄŤĂ­taÄŤa na Ăşrovni medziregistrovĂ˝ch prenosov', 'SimulĂˇtor poÄŤĂ­taÄŤa na Ăşrovni medziregistrovĂ˝ch prenosov', 'Analyzujte problematiku simulĂˇcie ÄŤinnosti jednoduchĂ©ho poÄŤĂ­taÄŤa. 
Navrhnite a implementujte simulĂˇtor poÄŤĂ­taÄŤa pracujĂşceho na Ăşrovni medziregistrovĂ˝ch prenosov. SimulĂˇtor mĂˇ vedieĹĄ odsimulovaĹĄ program pozostĂˇvajĂşci z vybranĂ˝ch strojovĂ˝ch inĹˇtrukciĂ­. SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. MĂˇ pracovaĹĄ pod OS Windows.', 'Analyzujte problematiku simulĂˇcie ÄŤinnosti jednoduchĂ©ho poÄŤĂ­taÄŤa. 
Navrhnite a implementujte simulĂˇtor poÄŤĂ­taÄŤa pracujĂşceho na Ăşrovni medziregistrovĂ˝ch prenosov. SimulĂˇtor mĂˇ vedieĹĄ odsimulovaĹĄ program pozostĂˇvajĂşci z vybranĂ˝ch strojovĂ˝ch inĹˇtrukciĂ­. SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. MĂˇ pracovaĹĄ pod OS Windows.', 0);
INSERT INTO projects VALUES (639, 'ZP', 360, NULL, 581, '2004/2005', 'ProgramovĂ˝ systĂ©m podporujĂşci syntĂ©zu asynchrĂłnnych sekvenÄŤnĂ˝ch obvodov ', 'Program system supports synthesis of asynchronous sequential circuits', 'Analyzujte problematiku, dostupnĂ© metĂłdy a  existujĂşce programovĂ© prostriedky  
podporujĂşce syntĂ©zu asynchrĂłnnych sekvenÄŤnĂ˝ch obvodov .
Navrhnite a implementujte programovĂ˝ systĂ©m na voÄľbu vhodnĂ©ho vnĂştornĂ©ho kĂłdu pre danĂ˝ stavovĂ˝ stroj.
SystĂ©m  mĂˇ poskytovaĹĄ vizualizĂˇciu postupu nĂˇvrhu  tak, aby mohol byĹĄ pouĹľitĂ˝ ako nĂˇzornĂˇ uÄŤebnĂˇ pomĂ´cka. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch.
NavrhnutĂ˝ systĂ©m je moĹľnĂ© implementovaĹĄ v Äľubovolnom programovacom jazyku pod OS Windows.

', 'Analyzujte problematiku, dostupnĂ© metĂłdy a  existujĂşce programovĂ© prostriedky  
podporujĂşce syntĂ©zu asynchrĂłnnych sekvenÄŤnĂ˝ch obvodov .
Navrhnite a implementujte programovĂ˝ systĂ©m na voÄľbu vhodnĂ©ho vnĂştornĂ©ho kĂłdu pre danĂ˝ stavovĂ˝ stroj.
SystĂ©m  mĂˇ poskytovaĹĄ vizualizĂˇciu postupu nĂˇvrhu  tak, aby mohol byĹĄ pouĹľitĂ˝ ako nĂˇzornĂˇ uÄŤebnĂˇ pomĂ´cka. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch.
NavrhnutĂ˝ systĂ©m je moĹľnĂ© implementovaĹĄ v Äľubovolnom programovacom jazyku pod OS Windows.

', 0);
INSERT INTO projects VALUES (640, 'DP', 358, NULL, 581, '2005/2006', 'ElektronickĂˇ podateÄľĹa', 'ElektronickĂˇ podateÄľĹa', NULL, NULL, 0);
INSERT INTO projects VALUES (641, 'ZP', 387, NULL, 582, '2005/2006', 'Ĺ tatistickĂ© modelovanie hypertextovĂ©ho prepojenia', 'Ĺ tatistickĂ© modelovanie hypertextovĂ©ho prepojenia', 'Medzi dokumentami s odkazmi mĂ´Ĺľeme zahrnĂşĹĄ webovĂ© strĂˇnky s hypertextovĂ˝mi odkazmi, ÄŤi odbornĂ© vedeckĂ© ÄŤlĂˇnky s odkazmi na literatĂşru. Pre mnoĹľiny takĂ˝chto dokumentov nĂˇs ÄŤasto zaujĂ­majĂş otĂˇzky ako â€žKto je vĂ˝znamnĂ˝m autorom v danej oblasti?â€ś, â€žKoÄľko neprepojenĂ˝ch komunĂ­t zaoberajĂşcich sa jednou oblasĹĄou sa dĂˇ nĂˇjsĹĄ?â€ś. 
CieÄľom tohto projektu bude skĂşmaĹĄ pravdepodobnostnĂ© modely a ich pouĹľitie na modelovanie dokumentov s odkazmi. Od Ĺˇtudenta sa najprv predpokladĂˇ pochopenie pravdepodobnostnĂ˝ch modelov a experimentovanie s vybranĂ˝m modelom. VĂ˝sledkom projektu bude softvĂ©rovĂ˝ balĂ­k na modelovanie dokumentov s odkazmi. VĂ˝sledky zĂ­skanĂ© z modelu vhodne prezentujte.
', 'Medzi dokumentami s odkazmi mĂ´Ĺľeme zahrnĂşĹĄ webovĂ© strĂˇnky s hypertextovĂ˝mi odkazmi, ÄŤi odbornĂ© vedeckĂ© ÄŤlĂˇnky s odkazmi na literatĂşru. Pre mnoĹľiny takĂ˝chto dokumentov nĂˇs ÄŤasto zaujĂ­majĂş otĂˇzky ako â€žKto je vĂ˝znamnĂ˝m autorom v danej oblasti?â€ś, â€žKoÄľko neprepojenĂ˝ch komunĂ­t zaoberajĂşcich sa jednou oblasĹĄou sa dĂˇ nĂˇjsĹĄ?â€ś. 
CieÄľom tohto projektu bude skĂşmaĹĄ pravdepodobnostnĂ© modely a ich pouĹľitie na modelovanie dokumentov s odkazmi. Od Ĺˇtudenta sa najprv predpokladĂˇ pochopenie pravdepodobnostnĂ˝ch modelov a experimentovanie s vybranĂ˝m modelom. VĂ˝sledkom projektu bude softvĂ©rovĂ˝ balĂ­k na modelovanie dokumentov s odkazmi. VĂ˝sledky zĂ­skanĂ© z modelu vhodne prezentujte.
', 1);
INSERT INTO projects VALUES (642, 'DP', 431, NULL, 583, '2005/2006', 'Podpora diĹˇtanÄŤnĂ©ho vzdelĂˇvania v predmete Ĺ pecifikaÄŤnĂ© a opisnĂ© jazyky', 'Podpora diĹˇtanÄŤnĂ©ho vzdelĂˇvania v predmete Ĺ pecifikaÄŤnĂ© a opisnĂ© jazyky', NULL, NULL, 0);
INSERT INTO projects VALUES (643, 'ZP', 431, NULL, 583, '2004/2005', 'MultimediĂˇlny vĂ˝uÄŤbovĂ˝ modul pre jazyk VHDL', 'Multimedial learning module for VHDL language', 'Analyzujte problematiku tvorby multimediĂˇlnych vĂ˝uÄŤbovĂ˝ch systĂ©mov. Na zĂˇklade analĂ˝zy navrhnite a implementujte multimediĂˇlny vĂ˝uÄŤbovĂ˝ modul pre podporu vĂ˝uÄŤby jazyka VHDL v rozsahu predmetu Ĺ pecifikaÄŤnĂ© a opisnĂ© jazyky.  NavrhnutĂ˝ modul by mal vhodnĂ˝m nĂˇzornĂ˝m spĂ´sobom prezentovaĹĄ uÄŤivo, umoĹľniĹĄ cviÄŤnĂ© testovanie zĂ­skanĂ˝ch vedomostĂ­ a podporovaĹĄ aj zĂ­skavanie praktickĂ˝ch zruÄŤnostĂ­ v nĂˇvrhu VHDL modelov.', 'Analyzujte problematiku tvorby multimediĂˇlnych vĂ˝uÄŤbovĂ˝ch systĂ©mov. Na zĂˇklade analĂ˝zy navrhnite a implementujte multimediĂˇlny vĂ˝uÄŤbovĂ˝ modul pre podporu vĂ˝uÄŤby jazyka VHDL v rozsahu predmetu Ĺ pecifikaÄŤnĂ© a opisnĂ© jazyky.  NavrhnutĂ˝ modul by mal vhodnĂ˝m nĂˇzornĂ˝m spĂ´sobom prezentovaĹĄ uÄŤivo, umoĹľniĹĄ cviÄŤnĂ© testovanie zĂ­skanĂ˝ch vedomostĂ­ a podporovaĹĄ aj zĂ­skavanie praktickĂ˝ch zruÄŤnostĂ­ v nĂˇvrhu VHDL modelov.', 0);
INSERT INTO projects VALUES (644, 'ZP', 357, NULL, 589, '2004/2005', 'InternetovĂˇ aplikĂˇcia na bezpeÄŤnĂş autentifikĂˇciu klientov', 'Internet application for safe user authentication', 'Analyzujte moĹľnĂ© prĂ­stupy bezpeÄŤnej autentifikĂˇcie na dostupnĂ˝ch OS a pri pouĹľitĂ­ beĹľnĂ˝ch implementaÄŤnĂ˝ch nĂˇstrojov. Navrhnite a realizujte funkÄŤnĂ˝ model takĂ©hoto  systĂ©mu v spoluprĂˇci s rieĹˇiteÄľom tĂ©my â€žInternetovĂˇ aplikĂˇcia na registrĂˇciu uĹľĂ­vateÄľskĂ˝ch Ăşdajov â€ś. Otestujte funkÄŤnosĹĄ, stabilitu a bezpeÄŤnosĹĄ systĂ©mu proti zlyhaniu a prienikom.', 'Analyzujte moĹľnĂ© prĂ­stupy bezpeÄŤnej autentifikĂˇcie na dostupnĂ˝ch OS a pri pouĹľitĂ­ beĹľnĂ˝ch implementaÄŤnĂ˝ch nĂˇstrojov. Navrhnite a realizujte funkÄŤnĂ˝ model takĂ©hoto  systĂ©mu v spoluprĂˇci s rieĹˇiteÄľom tĂ©my â€žInternetovĂˇ aplikĂˇcia na registrĂˇciu uĹľĂ­vateÄľskĂ˝ch Ăşdajov â€ś. Otestujte funkÄŤnosĹĄ, stabilitu a bezpeÄŤnosĹĄ systĂ©mu proti zlyhaniu a prienikom.', 0);
INSERT INTO projects VALUES (645, 'ZP', 672, 387, 590, '2005/2006', 'Tvorba jazykovĂ©ho grafu v procese uÄŤenia', 'Tvorba jazykovĂ©ho grafu v procese uÄŤenia', 'V poslednej dobe sa veÄľa bĂˇda v oblasti sietĂ­, ktorĂ© integrujĂş vlastnosti sietĂ­ usporiadanĂ˝ch a sietĂ­ nĂˇhodnĂ˝ch. SĂş to siete malĂ©ho sveta. MajĂş ĹˇirokĂ© moĹľnosti aplikĂˇciĂ­. Jednou z nich je aj tzv "word net", kde sa lexikĂłn jazyka chĂˇpe ako graf. Ak graf nie je sĂşvislĂ˝, reÄŤ nemĂ´Ĺľe byĹĄ plynulĂˇ. 
Ăšlohou projektu je pozrieĹĄ sa na proces tvorby "word net" pri uÄŤenĂ­ sa angliÄŤtiny. Budeme analyzovaĹĄ postup uÄŤenia sa cudzieho jazyka a spĂ´sob, akĂ˝m sa novĂ© slovĂˇ pridĂˇvajĂş do slovnej zĂˇsoby. PouĹľijeme pri tom rĂ´zne uÄŤebnice angliÄŤtiny, poprĂ­pade internetovĂ© kurzy a podobne. 
LiteratĂşra: Watts, Small Worlds, Princeton University Press, 2004
                    RybĂˇr a spol, Jazyk a kognĂ­cia, Kalligram, 2005', 'V poslednej dobe sa veÄľa bĂˇda v oblasti sietĂ­, ktorĂ© integrujĂş vlastnosti sietĂ­ usporiadanĂ˝ch a sietĂ­ nĂˇhodnĂ˝ch. SĂş to siete malĂ©ho sveta. MajĂş ĹˇirokĂ© moĹľnosti aplikĂˇciĂ­. Jednou z nich je aj tzv "word net", kde sa lexikĂłn jazyka chĂˇpe ako graf. Ak graf nie je sĂşvislĂ˝, reÄŤ nemĂ´Ĺľe byĹĄ plynulĂˇ. 
Ăšlohou projektu je pozrieĹĄ sa na proces tvorby "word net" pri uÄŤenĂ­ sa angliÄŤtiny. Budeme analyzovaĹĄ postup uÄŤenia sa cudzieho jazyka a spĂ´sob, akĂ˝m sa novĂ© slovĂˇ pridĂˇvajĂş do slovnej zĂˇsoby. PouĹľijeme pri tom rĂ´zne uÄŤebnice angliÄŤtiny, poprĂ­pade internetovĂ© kurzy a podobne. 
LiteratĂşra: Watts, Small Worlds, Princeton University Press, 2004
                    RybĂˇr a spol, Jazyk a kognĂ­cia, Kalligram, 2005', 1);
INSERT INTO projects VALUES (646, 'ZP', 374, NULL, 592, '2004/2005', 'VyuĹľitie vlastnostĂ­ heterogĂ©nnych hrĂˇÄŤov', 'VyuĹľitie vlastnostĂ­ heterogĂ©nnych hrĂˇÄŤov', 'NaĹˇtudujte problematiku hry hrĂˇÄŤov simulovanĂ©ho robotickĂ©ho futbalu RoboCup. OboznĂˇmte sa s hrĂˇÄŤmi, ktorĂ­ boli vytvorenĂ­ Ĺˇtudentmi FIIT STU. Analyzujte vlastnosti klasickĂ©ho a heterogĂ©nneho hrĂˇÄŤa. Ĺ pecifikujte moĹľnĂ© spĂ´soby vyuĹľitia heterogĂ©nnych hrĂˇÄŤov. Navrhnite rozĹˇĂ­renie existujĂşceho hrĂˇÄŤa a taktiky hry, aby bolo moĹľnĂ© vyuĹľiĹĄ ĹˇpecifikovanĂ© vĂ˝hody. NavrhnutĂ© rieĹˇenie overte implementĂˇciou rozĹˇĂ­renia existujĂşceho hrĂˇÄŤa.', 'NaĹˇtudujte problematiku hry hrĂˇÄŤov simulovanĂ©ho robotickĂ©ho futbalu RoboCup. OboznĂˇmte sa s hrĂˇÄŤmi, ktorĂ­ boli vytvorenĂ­ Ĺˇtudentmi FIIT STU. Analyzujte vlastnosti klasickĂ©ho a heterogĂ©nneho hrĂˇÄŤa. Ĺ pecifikujte moĹľnĂ© spĂ´soby vyuĹľitia heterogĂ©nnych hrĂˇÄŤov. Navrhnite rozĹˇĂ­renie existujĂşceho hrĂˇÄŤa a taktiky hry, aby bolo moĹľnĂ© vyuĹľiĹĄ ĹˇpecifikovanĂ© vĂ˝hody. NavrhnutĂ© rieĹˇenie overte implementĂˇciou rozĹˇĂ­renia existujĂşceho hrĂˇÄŤa.', 1);
INSERT INTO projects VALUES (647, 'ZP', 566, NULL, 593, '2004/2005', 'PouĹľitie genetickĂ©ho algoritmu k optimalizĂˇcii funkciĂ­', 'Use of genetic algorithm for optimalization', 'Geneticky algoritmus patri v sĂşÄŤasnosti medzi efektivne globĂˇlne optimalizaÄŤnĂ© prostriedky, ktorĂ˝ je schopnĂ˝ poskytnĂşĹĄ s veÄľkou pravdepodobnosĹĄou globĂˇlne minimum n-rozmernej funkcii. RieĹˇenie problĂ©mu (napr. premennĂ© funkcie) sĂş reprezentovanĂ© v binĂˇrnom kĂłde. Pri zahĂˇjenĂ­ algoritmu je vygenerovanĂˇ populĂˇcia rieĹˇenĂ­, priÄŤom kaĹľdĂ© rieĹˇenie je ohodnotene "fitnes", ktorĂ© odrĂˇĹľa kvalitu rieĹˇenia. V rĂˇmci reprodukÄŤnĂ©ho procesu sa vyberajĂş tie rieĹˇenia, ktorĂ© majĂş vysokĂ© fitnes, priÄŤom pri reprodukÄŤnom procese sa pouĹľĂ­vajĂş dva genetickĂ© operĂˇtory: mutĂˇcia a krĂ­Ĺľenie. V priebehu opakovanĂ©ho reprodukÄŤnĂ©ho procesu v populĂˇcii vznikajĂş rieĹˇenia, ktorĂ© majĂş vysokĂ© fitnes, t.j. sĂş priradenĂ© kvalitnĂ©mu rieĹˇeniu optimalizaÄŤnĂ©ho problĂ©mu. PrĂˇca bude spoÄŤĂ­vaĹĄ vo vypracovanĂ­ teoretickĂ©ho popisu metĂłdy a taktieĹľ aj v jednoduchel implementĂˇcii programu buÄŹ v Pascale alebo v C.
', 'Geneticky algoritmus patri v sĂşÄŤasnosti medzi efektivne globĂˇlne optimalizaÄŤnĂ© prostriedky, ktorĂ˝ je schopnĂ˝ poskytnĂşĹĄ s veÄľkou pravdepodobnosĹĄou globĂˇlne minimum n-rozmernej funkcii. RieĹˇenie problĂ©mu (napr. premennĂ© funkcie) sĂş reprezentovanĂ© v binĂˇrnom kĂłde. Pri zahĂˇjenĂ­ algoritmu je vygenerovanĂˇ populĂˇcia rieĹˇenĂ­, priÄŤom kaĹľdĂ© rieĹˇenie je ohodnotene "fitnes", ktorĂ© odrĂˇĹľa kvalitu rieĹˇenia. V rĂˇmci reprodukÄŤnĂ©ho procesu sa vyberajĂş tie rieĹˇenia, ktorĂ© majĂş vysokĂ© fitnes, priÄŤom pri reprodukÄŤnom procese sa pouĹľĂ­vajĂş dva genetickĂ© operĂˇtory: mutĂˇcia a krĂ­Ĺľenie. V priebehu opakovanĂ©ho reprodukÄŤnĂ©ho procesu v populĂˇcii vznikajĂş rieĹˇenia, ktorĂ© majĂş vysokĂ© fitnes, t.j. sĂş priradenĂ© kvalitnĂ©mu rieĹˇeniu optimalizaÄŤnĂ©ho problĂ©mu. PrĂˇca bude spoÄŤĂ­vaĹĄ vo vypracovanĂ­ teoretickĂ©ho popisu metĂłdy a taktieĹľ aj v jednoduchel implementĂˇcii programu buÄŹ v Pascale alebo v C.
', 1);
INSERT INTO projects VALUES (648, 'ZP', 361, NULL, 594, '2004/2005', 'ProblĂ©movĂˇ ĹˇtĂşdia  Ĺˇkodlivosti EM Ĺľiarenia z mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM)', 'Problem study about malignance of Electromagnetic emission from Global Systems for Mobile Communications (GSM)', 'Analyzujte problematiku Ĺˇkodlivosti EM Ĺľiarenia  z mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM) a jeho vplyvu na ÄľudskĂ˝ organizmus. Navrhnite a implementujte antiradiaÄŤnĂ© modely (zariadenia) na ĂşÄŤinnĂş ochranu a porovnajte ich ĂşÄŤinnosĹĄ.', 'Analyzujte problematiku Ĺˇkodlivosti EM Ĺľiarenia  z mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM) a jeho vplyvu na ÄľudskĂ˝ organizmus. Navrhnite a implementujte antiradiaÄŤnĂ© modely (zariadenia) na ĂşÄŤinnĂş ochranu a porovnajte ich ĂşÄŤinnosĹĄ.', 0);
INSERT INTO projects VALUES (649, 'ZP', 437, NULL, 595, '2003/2004', 'Objavovanie znalostĂ­ a e-uÄŤenie', 'Objavovanie znalostĂ­ a e-uÄŤenie', 'Analyzujte problematiku objavovania znalostĂ­ a v rĂˇmci nej ĹˇpeciĂˇlne dolovania Ăşdajov a moĹľnostĂ­ ich vyuĹľitia v procese e-uÄŤenia. PosĂşÄŹte moĹľnosti ich vyuĹľitia pri ĹˇtĂşdiu v kniĹľniciach, obzvlĂˇĹˇĹĄ v digitĂˇlnych. OpĂ­Ĺˇte vlastnosti softvĂ©rovĂ©ho nĂˇstroja, ktorĂ˝ by objavovaniu znalostĂ­ v kniĹľniciach napomĂˇhal. Urobte prehÄľad existujĂşcich nĂˇstrojov. Porovnajte vybranĂ© dostupnĂ© spomedzi nich. ZvoÄľte vhodnĂş metodiku na porovnanie, vykonajte prĂ­sluĹˇnĂ© experimenty a vyhodnoĹĄte ich.', 'Analyzujte problematiku objavovania znalostĂ­ a v rĂˇmci nej ĹˇpeciĂˇlne dolovania Ăşdajov a moĹľnostĂ­ ich vyuĹľitia v procese e-uÄŤenia. PosĂşÄŹte moĹľnosti ich vyuĹľitia pri ĹˇtĂşdiu v kniĹľniciach, obzvlĂˇĹˇĹĄ v digitĂˇlnych. OpĂ­Ĺˇte vlastnosti softvĂ©rovĂ©ho nĂˇstroja, ktorĂ˝ by objavovaniu znalostĂ­ v kniĹľniciach napomĂˇhal. Urobte prehÄľad existujĂşcich nĂˇstrojov. Porovnajte vybranĂ© dostupnĂ© spomedzi nich. ZvoÄľte vhodnĂş metodiku na porovnanie, vykonajte prĂ­sluĹˇnĂ© experimenty a vyhodnoĹĄte ich.', 1);
INSERT INTO projects VALUES (650, 'DP', 24, NULL, 595, '2005/2006', 'KlasifikĂˇcia textovĂ˝ch dokumentov metĂłdami strojovĂ©ho uÄŤenia', 'KlasifikĂˇcia textovĂ˝ch dokumentov metĂłdami strojovĂ©ho uÄŤenia', NULL, NULL, 4);
INSERT INTO projects VALUES (651, 'ZP', 588, 670, 596, '2004/2005', 'KĂłdovĂ© zĂˇmky', 'Code locks', 'Analyzujte technickĂ© a programovĂ© prostriedky pre realizĂˇciu kĂłdovĂ˝ch zĂˇmkov. Porovnajte vĂ˝hody kontaktnĂ˝ch a bezdrĂ´tovĂ˝ch systĂ©mov na zĂˇklade definovanĂ˝ch technickĂ˝ch parametrov s vyĹˇĹˇou ĂşrovĹou zabezpeÄŤenia.
Navrhnite obvodovĂş schĂ©mu pre jednoduchĂ˝ kĂłdovĂ˝ zĂˇmok riadenĂ˝  mikroprocesorom. 
NapĂ­Ĺˇte a overte program pre riadenie mikroprocesora.
', 'Analyzujte technickĂ© a programovĂ© prostriedky pre realizĂˇciu kĂłdovĂ˝ch zĂˇmkov. Porovnajte vĂ˝hody kontaktnĂ˝ch a bezdrĂ´tovĂ˝ch systĂ©mov na zĂˇklade definovanĂ˝ch technickĂ˝ch parametrov s vyĹˇĹˇou ĂşrovĹou zabezpeÄŤenia.
Navrhnite obvodovĂş schĂ©mu pre jednoduchĂ˝ kĂłdovĂ˝ zĂˇmok riadenĂ˝  mikroprocesorom. 
NapĂ­Ĺˇte a overte program pre riadenie mikroprocesora.
', 0);
INSERT INTO projects VALUES (652, 'DP', 541, NULL, 596, '2005/2006', 'SystĂ©m automatizovanĂ©ho odÄŤĂ­tavania plynomerov a vodomerov', 'SystĂ©m automatizovanĂ©ho odÄŤĂ­tavania plynomerov a vodomerov', NULL, NULL, 4);
INSERT INTO projects VALUES (653, 'ZP', 98, NULL, 597, '2004/2005', 'SystĂ©m pre odovzdĂˇvanie prĂˇc prostrednĂ­ctvom Internetu', 'System for managing student works via Internet', 'C# je pomerne novĂ˝ jazyk, ktorĂ˝ vychĂˇza z jazyka C++  a z jazyka Java. NaĹˇtudujte tento programovacĂ­ jazyk a posĂşÄŹte jeho moĹľnosti ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇcii.
Na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu pre odovzdĂˇvanie prĂˇc prostrednĂ­ctvom Internetu.
', 'C# je pomerne novĂ˝ jazyk, ktorĂ˝ vychĂˇza z jazyka C++  a z jazyka Java. NaĹˇtudujte tento programovacĂ­ jazyk a posĂşÄŹte jeho moĹľnosti ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇcii.
Na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu pre odovzdĂˇvanie prĂˇc prostrednĂ­ctvom Internetu.
', 1);
INSERT INTO projects VALUES (654, 'DP', 437, NULL, 597, '2005/2006', 'OpoznĂˇmkovanie sprĂ­stupĹovanĂ˝ch webovĂ˝ch strĂˇnok vopred', 'OpoznĂˇmkovanie sprĂ­stupĹovanĂ˝ch webovĂ˝ch strĂˇnok vopred', NULL, NULL, 1);
INSERT INTO projects VALUES (655, 'ZP', 382, NULL, 598, '2004/2005', 'AutomatickĂˇ kosaÄŤka genetickĂ˝m programovanĂ­m ', 'Automatic grass-cutter developed by genetic programming', 'VyviĹte genetickĂ˝m programovanĂ­m program, ktorĂ˝ bude riadiĹĄ automatickĂş kosaÄŤku (presnejĹˇie jej formĂˇlny model, ktorĂ©mu sa iba povie: otoÄŤ sa naÄľavo, napravo, alebo choÄŹ dopredu) na toroidĂˇlnej mrieĹľke tak, aby ideĂˇlne preĹˇla cez vĹˇetky polĂ­ÄŤka (kosaÄŤka mĂ´Ĺľe maĹĄ aj automaticky dodĂˇvanĂş svoju pozĂ­ciu, pozĂ­ciu navĹˇtĂ­venĂ˝ch a nenavĹˇtĂ­venĂ˝ch polĂ­ÄŤok). DoplĹte o nĂˇhodne rozmiestnenĂ© prekĂˇĹľky na mrieĹľke.', 'VyviĹte genetickĂ˝m programovanĂ­m program, ktorĂ˝ bude riadiĹĄ automatickĂş kosaÄŤku (presnejĹˇie jej formĂˇlny model, ktorĂ©mu sa iba povie: otoÄŤ sa naÄľavo, napravo, alebo choÄŹ dopredu) na toroidĂˇlnej mrieĹľke tak, aby ideĂˇlne preĹˇla cez vĹˇetky polĂ­ÄŤka (kosaÄŤka mĂ´Ĺľe maĹĄ aj automaticky dodĂˇvanĂş svoju pozĂ­ciu, pozĂ­ciu navĹˇtĂ­venĂ˝ch a nenavĹˇtĂ­venĂ˝ch polĂ­ÄŤok). DoplĹte o nĂˇhodne rozmiestnenĂ© prekĂˇĹľky na mrieĹľke.', 1);
INSERT INTO projects VALUES (656, 'DP', 260, NULL, 598, '2005/2006', 'VĂ˝poÄŤtovĂ© prostredie pre aktĂ­vny sĂşborovĂ˝ systĂ©m', 'VĂ˝poÄŤtovĂ© prostredie pre aktĂ­vny sĂşborovĂ˝ systĂ©m', NULL, NULL, 1);
INSERT INTO projects VALUES (657, 'ZP', 579, NULL, 599, '2004/2005', 'SystĂ©m na podporu tvorby skĂşĹˇkovĂ˝ch rozvrhov', 'System of exam schedules generating support', 'Analyzujte ĂşdajovĂ© mnoĹľiny a postupy pri vytvĂˇranĂ­  rozvrhov skĂşĹˇok a nĂˇsledne navrhnite systĂ©m, ktorĂ˝ by tieto ÄŤinnosti podporoval. ZĂˇkladnĂ© ÄŤasti nĂˇvrhu realizujte v podobe prototypu a zaistite nevyhnutnĂş kompatibilitu s informaÄŤnĂ˝m systĂ©mom pouĹľĂ­vanĂ˝m na FIIT.', 'Analyzujte ĂşdajovĂ© mnoĹľiny a postupy pri vytvĂˇranĂ­  rozvrhov skĂşĹˇok a nĂˇsledne navrhnite systĂ©m, ktorĂ˝ by tieto ÄŤinnosti podporoval. ZĂˇkladnĂ© ÄŤasti nĂˇvrhu realizujte v podobe prototypu a zaistite nevyhnutnĂş kompatibilitu s informaÄŤnĂ˝m systĂ©mom pouĹľĂ­vanĂ˝m na FIIT.', 1);
INSERT INTO projects VALUES (658, 'DP', 579, NULL, 599, '2005/2006', 'SystĂ©m zĂ­skavania doplĹujĂşcich informĂˇciĂ­ pre tvorbu rozvrhov', 'SystĂ©m zĂ­skavania doplĹujĂşcich informĂˇciĂ­ pre tvorbu rozvrhov', NULL, NULL, 4);
INSERT INTO projects VALUES (659, 'ZP', 294, NULL, 600, '2004/2005', 'Nadstavba pre aplikĂˇcie otvorenĂ©ho systĂ©mu obohatenej skutoÄŤnosti  ARToolkit', ':  EXTENSION OF APPLICATIONS FOR OPEN STANDARD AUGMENTED REALITY SYSTEM ARTTOOLKIT', 'Vytvorte nadstavbu existujĂşceho otvorenĂ©ho systĂ©mu ARToolkit (www.hitl.washington.edu/artoolkit)  pre obohatenĂş skutoÄŤnosĹĄ (augmented reality) pre rĂ´zne aplikĂˇcie s dĂ´razom na tvorbu dynamickĂ˝ch 2D a 3D scĂ©n  naprogramovanĂ˝ch v API OpenGl a vyuĹľĂ­vajĂşcich realistickĂ© zobrazovanie vrĂˇtane mapovania textĂşr. Realizujte vzorovĂ© prĂ­klady umoĹľĹujĂşce nauÄŤiĹĄ sa tvoriĹĄ dynamickĂ© scĂ©ny pre programĂˇtorov bez skĂşsenostĂ­ s pouĹľĂ­vanĂ­m Open Gl. ZdrojovĂ˝ kĂłd, projekt a  existujĂşca beĹľiaca verzia v prostredĂ­ MS Visual C a OpenGl bude k dispozĂ­cii.

', 'Vytvorte nadstavbu existujĂşceho otvorenĂ©ho systĂ©mu ARToolkit (www.hitl.washington.edu/artoolkit)  pre obohatenĂş skutoÄŤnosĹĄ (augmented reality) pre rĂ´zne aplikĂˇcie s dĂ´razom na tvorbu dynamickĂ˝ch 2D a 3D scĂ©n  naprogramovanĂ˝ch v API OpenGl a vyuĹľĂ­vajĂşcich realistickĂ© zobrazovanie vrĂˇtane mapovania textĂşr. Realizujte vzorovĂ© prĂ­klady umoĹľĹujĂşce nauÄŤiĹĄ sa tvoriĹĄ dynamickĂ© scĂ©ny pre programĂˇtorov bez skĂşsenostĂ­ s pouĹľĂ­vanĂ­m Open Gl. ZdrojovĂ˝ kĂłd, projekt a  existujĂşca beĹľiaca verzia v prostredĂ­ MS Visual C a OpenGl bude k dispozĂ­cii.

', 1);
INSERT INTO projects VALUES (660, 'DP', 294, NULL, 600, '2005/2006', 'AplikĂˇcia obohatenej skutoÄŤnosti pri virtuĂˇlnych prehliadkach architektĂşry', 'AplikĂˇcia obohatenej skutoÄŤnosti pri virtuĂˇlnych prehliadkach architektĂşry', NULL, NULL, 1);
INSERT INTO projects VALUES (661, 'ZP', 12, NULL, 601, '2004/2005', 'VedeckĂ˝ kalkulĂˇtor na mobilnej platforme', 'Scientific calculator for mobile platform', 'VeÄľkĂ© rozĹˇĂ­renie vzĂˇjomne kompatibilnĂ˝ch a hardvĂ©rovo dobre vybavenĂ˝ch mobilnĂ˝ch zariadenĂ­ umoĹľĹuje vytvorenie jednotnĂ©ho systĂ©mu, ktorĂ˝ mĂ´Ĺľe plniĹĄ funkciu vedeckej kalkulaÄŤky. Analyzujte perspektĂ­vne mobilnĂ© softvĂ©rovĂ© platformy a ich vlastnosti. Navrhnite interaktĂ­vny vĂ˝poÄŤtovĂ˝ systĂ©m, ktorĂ˝ by umoĹľĹoval vyhodnotenie aritmetickĂ˝ch vĂ˝razov. SystĂ©m by mal podporovaĹĄ operĂˇtory a funkcie beĹľnĂ© pri vedeckĂ˝ch kalkulaÄŤkĂˇch. Implementujte systĂ©m pre zvolenĂş mobilnĂş platformu s pouĹľitim existujĂşcich priemyselnĂ˝ch Ĺˇtandardov.', 'VeÄľkĂ© rozĹˇĂ­renie vzĂˇjomne kompatibilnĂ˝ch a hardvĂ©rovo dobre vybavenĂ˝ch mobilnĂ˝ch zariadenĂ­ umoĹľĹuje vytvorenie jednotnĂ©ho systĂ©mu, ktorĂ˝ mĂ´Ĺľe plniĹĄ funkciu vedeckej kalkulaÄŤky. Analyzujte perspektĂ­vne mobilnĂ© softvĂ©rovĂ© platformy a ich vlastnosti. Navrhnite interaktĂ­vny vĂ˝poÄŤtovĂ˝ systĂ©m, ktorĂ˝ by umoĹľĹoval vyhodnotenie aritmetickĂ˝ch vĂ˝razov. SystĂ©m by mal podporovaĹĄ operĂˇtory a funkcie beĹľnĂ© pri vedeckĂ˝ch kalkulaÄŤkĂˇch. Implementujte systĂ©m pre zvolenĂş mobilnĂş platformu s pouĹľitim existujĂşcich priemyselnĂ˝ch Ĺˇtandardov.', 1);
INSERT INTO projects VALUES (662, 'DP', 566, NULL, 601, '2005/2006', 'HÄľadenie globĂˇlneho minima funkcie pomocou kvantovĂ©ho poÄŤĂ­tania', 'HÄľadenie globĂˇlneho minima funkcie pomocou kvantovĂ©ho poÄŤĂ­tania', NULL, NULL, 1);
INSERT INTO projects VALUES (663, 'ZP', 660, NULL, 602, '2004/2005', 'CSIDC 2005', 'CSIDC 2005', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 1);
INSERT INTO projects VALUES (664, 'DP', 40, NULL, 602, '2005/2006', 'NĂˇvrhovĂ© vzory v prostriedkoch objektovo-relaÄŤnĂ©ho mapovania', 'NĂˇvrhovĂ© vzory v prostriedkoch objektovo-relaÄŤnĂ©ho mapovania', NULL, NULL, 1);
INSERT INTO projects VALUES (665, 'ZP', 361, NULL, 603, '2004/2005', 'AnalĂ˝za opisu sprĂˇvania sa v jazyku VHDL', 'Analysis of behavior in VHDL language', 'Analyzujte opis sprĂˇvania sa v jazyku VHDL a vzĹĄahy medzi entitami a architektĂşrami v prostredĂ­ ActiveVHDL. Navrhnite 8b10b kodĂ©r a dekodĂ©r. Vytvorte funkÄŤnĂ˝ a ĹˇtrukturĂˇlny opis modulov v jazyku VHDL. Overte funkÄŤnosĹĄ kodĂ©ra a dekodĂ©ra v simulaÄŤnom prostredĂ­  Active VHDL. 
', 'Analyzujte opis sprĂˇvania sa v jazyku VHDL a vzĹĄahy medzi entitami a architektĂşrami v prostredĂ­ ActiveVHDL. Navrhnite 8b10b kodĂ©r a dekodĂ©r. Vytvorte funkÄŤnĂ˝ a ĹˇtrukturĂˇlny opis modulov v jazyku VHDL. Overte funkÄŤnosĹĄ kodĂ©ra a dekodĂ©ra v simulaÄŤnom prostredĂ­  Active VHDL. 
', 0);
INSERT INTO projects VALUES (666, 'DP', 360, NULL, 603, '2005/2006', 'ProgramovĂ˝ systĂ©m podporujĂşci syntĂ©zu asynchrĂłnnych sekvenÄŤnĂ˝ch obvodov, HTML aplikĂˇcia ', 'ProgramovĂ˝ systĂ©m podporujĂşci syntĂ©zu asynchrĂłnnych sekvenÄŤnĂ˝ch obvodov, HTML aplikĂˇcia ', NULL, NULL, 0);
INSERT INTO projects VALUES (667, 'ZP', 382, NULL, 604, '2004/2005', 'Prenasledovanie neurĂłnovou sieĹĄou ', 'Pursuit evasion by neural networks', 'Na toroidĂˇlnu mrieĹľku umiestnite troch agentov, jednĂ©ho ako korisĹĄ, dvoch prenasledovateÄľov. KorisĹĄ je rovnako rĂ˝chla ako prenasledovatelia, a je riadenĂˇ dopredu danĂ˝m algoritmom. KorisĹĄ aj prenasledovatelia majĂş ĂşplnĂş informĂˇciu o pozĂ­ciach agentov na mrieĹľke. Agenti sĂş riadenĂ­ neurĂłnovĂ˝mi sieĹĄami, ktorĂ© sĂş vyvĂ­janĂ© evoluÄŤnĂ˝mi algoritmami (kaĹľdĂˇ zvlĂˇĹˇĹĄ), ohodnotenie je ÄŤas, za ktorĂ˝ dostihnĂş korisĹĄ. Analyzujte kooperatĂ­vne stratĂ©gie agentov, zistite, ÄŤi rovnako rĂ˝chlo dosiahnete vĂ˝sledku, keÄŹ obidvoch prenasledovateÄľov riadite jednou veÄľkou neurĂłnovou sieĹĄou.', 'Na toroidĂˇlnu mrieĹľku umiestnite troch agentov, jednĂ©ho ako korisĹĄ, dvoch prenasledovateÄľov. KorisĹĄ je rovnako rĂ˝chla ako prenasledovatelia, a je riadenĂˇ dopredu danĂ˝m algoritmom. KorisĹĄ aj prenasledovatelia majĂş ĂşplnĂş informĂˇciu o pozĂ­ciach agentov na mrieĹľke. Agenti sĂş riadenĂ­ neurĂłnovĂ˝mi sieĹĄami, ktorĂ© sĂş vyvĂ­janĂ© evoluÄŤnĂ˝mi algoritmami (kaĹľdĂˇ zvlĂˇĹˇĹĄ), ohodnotenie je ÄŤas, za ktorĂ˝ dostihnĂş korisĹĄ. Analyzujte kooperatĂ­vne stratĂ©gie agentov, zistite, ÄŤi rovnako rĂ˝chlo dosiahnete vĂ˝sledku, keÄŹ obidvoch prenasledovateÄľov riadite jednou veÄľkou neurĂłnovou sieĹĄou.', 1);
INSERT INTO projects VALUES (668, 'DP', 382, NULL, 604, '2005/2006', 'Model malĂ©ho sveta v Echo state neurĂłnovĂ˝ch sieĹĄach', 'Model malĂ©ho sveta v Echo state neurĂłnovĂ˝ch sieĹĄach', NULL, NULL, 1);
INSERT INTO projects VALUES (669, 'ZP', 357, NULL, 605, '2004/2005', 'PrehÄľadovĂˇ ĹˇtĂşdia softvĂ©rovĂ˝ch nĂˇstrojov pre potreby interaktĂ­vneho webu.', 'PrehÄľadovĂˇ ĹˇtĂşdia softvĂ©rovĂ˝ch nĂˇstrojov pre potreby interaktĂ­vneho webu', 'Analyzujte dostupnĂ© softverovĂ© prostriedky, ktorĂ© sa v sĂşÄŤasnosti vyuĹľĂ­vajĂş pre potreby interaktĂ­vneho webu. ImplementaÄŤnĂ© nĂˇstroje posudzujte z rĂ´znych hÄľadisk: dostupnosti, vyuĹľiteÄľnosti v rĂ´znych oblastiach praxe, client vs. server based, spoÄľahlivosti, jednoduchosti syntaxe, stabilite a pod.
Po konzultĂˇcii s vedĂşcim prĂˇce si niektorĂ© implementaÄŤnĂ© nĂˇstroje osvojte a vytvorte funkÄŤnĂ˝ prezentaÄŤnĂ˝ interaktĂ­vny model, v ktorom demonĹˇtrujete niektorĂ© vlastnosti naĹˇtudovanej problematiky.
', 'Analyzujte dostupnĂ© softverovĂ© prostriedky, ktorĂ© sa v sĂşÄŤasnosti vyuĹľĂ­vajĂş pre potreby interaktĂ­vneho webu. ImplementaÄŤnĂ© nĂˇstroje posudzujte z rĂ´znych hÄľadisk: dostupnosti, vyuĹľiteÄľnosti v rĂ´znych oblastiach praxe, client vs. server based, spoÄľahlivosti, jednoduchosti syntaxe, stabilite a pod.
Po konzultĂˇcii s vedĂşcim prĂˇce si niektorĂ© implementaÄŤnĂ© nĂˇstroje osvojte a vytvorte funkÄŤnĂ˝ prezentaÄŤnĂ˝ interaktĂ­vny model, v ktorom demonĹˇtrujete niektorĂ© vlastnosti naĹˇtudovanej problematiky.
', 0);
INSERT INTO projects VALUES (670, 'DP', 359, NULL, 605, '2005/2006', 'MetĂłdy modelovania web aplikĂˇciĂ­', 'MetĂłdy modelovania web aplikĂˇciĂ­', NULL, NULL, 0);
INSERT INTO projects VALUES (671, 'ZP', 298, NULL, 606, '2004/2005', 'SystĂ©m pre podporu vĂ˝uÄŤby peer-to-peer technolĂłgie', 'Education support system for peer-to-peer technology', 'Vytvorte prehÄľad existujĂşcich rieĹˇenĂ­ v oblasti technolĂłgie p2p vhodnej pre vytvorenie kostry obsahovej nĂˇplne samostatnĂ©ho predmetu Peer-to-peer a grid technolĂłgie. V analĂ˝ze sa sĂşstreÄŹte na opis existujĂşcich rieĹˇenĂ­ neĹˇtrukturovanĂ˝ch, semi-ĹˇtrukturovanĂ˝ch a ĹˇtrukturovanĂ˝ch p2p sietĂ­, na ich vzĂˇjomnĂ© kvantitatĂ­vne a kvalitatĂ­vne porovnanie a doterajĹˇie vĂ˝sledky ich zapracovania do technolĂłgie grid. Vytvorte niekoÄľko vizualizĂˇciĂ­ pre ukĂˇĹľku ĹˇtruktĂşry a funkcie, spĂ´sob vyuĹľitia ĂşdajovĂ˝ch ĹˇtruktĂşr.', 'Vytvorte prehÄľad existujĂşcich rieĹˇenĂ­ v oblasti technolĂłgie p2p vhodnej pre vytvorenie kostry obsahovej nĂˇplne samostatnĂ©ho predmetu Peer-to-peer a grid technolĂłgie. V analĂ˝ze sa sĂşstreÄŹte na opis existujĂşcich rieĹˇenĂ­ neĹˇtrukturovanĂ˝ch, semi-ĹˇtrukturovanĂ˝ch a ĹˇtrukturovanĂ˝ch p2p sietĂ­, na ich vzĂˇjomnĂ© kvantitatĂ­vne a kvalitatĂ­vne porovnanie a doterajĹˇie vĂ˝sledky ich zapracovania do technolĂłgie grid. Vytvorte niekoÄľko vizualizĂˇciĂ­ pre ukĂˇĹľku ĹˇtruktĂşry a funkcie, spĂ´sob vyuĹľitia ĂşdajovĂ˝ch ĹˇtruktĂşr.', 0);
INSERT INTO projects VALUES (672, 'DP', 357, NULL, 606, '2005/2006', 'PrincĂ­py a vizualizĂˇcia STP', 'PrincĂ­py a vizualizĂˇcia STP', NULL, NULL, 0);
INSERT INTO projects VALUES (673, 'DP', 301, NULL, 607, '2005/2006', 'NĂˇvrh funkciĂ­ sieĹĄovĂ©ho adaptĂ©ra v prostredĂ­ PLD', 'NĂˇvrh funkciĂ­ sieĹĄovĂ©ho adaptĂ©ra v prostredĂ­ PLD', NULL, NULL, 0);
INSERT INTO projects VALUES (674, 'ZP', 301, NULL, 607, '2004/2005', 'Testovanie rozĹˇĂ­renej MAC vrstvy sieĹĄovĂ©ho adaptĂ©ra a nĂˇvrh v prostredĂ­ PLD', 'The testing of the MAC control sublayer of the Network Interface Card and the design in the PLD environment. ', 'Analyzujte a navrhnite vybranĂ© ÄŤasti a ĹˇpeciĂˇlne funkcie sieĹĄovĂ©ho adaptĂ©ra. OpĂ­Ĺˇte architektĂşru a funkciu v jazyku VHDL, implementujte systĂ©m do zvolenej technolĂłgie PLD/FPGA v nĂˇvrhovom prostredĂ­ XILINX Foundation M1 technology, navrhnite metĂłdu testovania MAC vrstvy, overte ÄŤinnosĹĄ.', 'Analyzujte a navrhnite vybranĂ© ÄŤasti a ĹˇpeciĂˇlne funkcie sieĹĄovĂ©ho adaptĂ©ra. OpĂ­Ĺˇte architektĂşru a funkciu v jazyku VHDL, implementujte systĂ©m do zvolenej technolĂłgie PLD/FPGA v nĂˇvrhovom prostredĂ­ XILINX Foundation M1 technology, navrhnite metĂłdu testovania MAC vrstvy, overte ÄŤinnosĹĄ.', 0);
INSERT INTO projects VALUES (675, 'DP', 294, NULL, 608, '2005/2006', 'DistribuovanĂ© simulaÄŤnĂ© prostredie zaloĹľenĂ© na technike Web3D  ', 'DistribuovanĂ© simulaÄŤnĂ© prostredie zaloĹľenĂ© na technike Web3D  ', NULL, NULL, 1);
INSERT INTO projects VALUES (676, 'ZP', 387, NULL, 608, '2004/2005', 'VizualizĂˇcia kolekcie textovĂ˝ch dokumentov', 'VizualizĂˇcia kolekcie textovĂ˝ch dokumentov', 'CieÄľom projektu bude skĂşmaĹĄ pravdepodobnostnĂ© modely s latentnĂ˝mi premennĂ˝mi a ich pouĹľitie na vizualizĂˇciu textovĂ˝ch databĂˇz. Od Ĺˇtudenta sa najprv sa predpokladĂˇ pochopenie modelov s latentnĂ˝mi premennĂ˝mi, ktorĂ© sĂş topograficky organizovanĂ©, a experimentovanie s vybranĂ˝mi modelmi. V prĂˇci nĂˇs bude zaujĂ­maĹĄ sprĂˇvanie sa modelov, ktorĂ© vychĂˇdzajĂş z ProbMap modelu. Bude potrebnĂ© vytvoriĹĄ softvĂ©rovĂ˝ balĂ­k na vizualiizĂˇciu dokumentov, pomocou ktorĂ©ho bude moĹľnĂ© pouĹľĂ­vateÄľovi vhodnĂ˝m spĂ´sobom prezentovaĹĄ vĂ˝sledky.', 'CieÄľom projektu bude skĂşmaĹĄ pravdepodobnostnĂ© modely s latentnĂ˝mi premennĂ˝mi a ich pouĹľitie na vizualizĂˇciu textovĂ˝ch databĂˇz. Od Ĺˇtudenta sa najprv sa predpokladĂˇ pochopenie modelov s latentnĂ˝mi premennĂ˝mi, ktorĂ© sĂş topograficky organizovanĂ©, a experimentovanie s vybranĂ˝mi modelmi. V prĂˇci nĂˇs bude zaujĂ­maĹĄ sprĂˇvanie sa modelov, ktorĂ© vychĂˇdzajĂş z ProbMap modelu. Bude potrebnĂ© vytvoriĹĄ softvĂ©rovĂ˝ balĂ­k na vizualiizĂˇciu dokumentov, pomocou ktorĂ©ho bude moĹľnĂ© pouĹľĂ­vateÄľovi vhodnĂ˝m spĂ´sobom prezentovaĹĄ vĂ˝sledky.', 1);
INSERT INTO projects VALUES (677, 'ZP', 301, NULL, 609, '2004/2005', 'NĂˇvrh a implementĂˇcia systĂ©mu na grafickĂş vizualizĂˇciu prĂşdovĂ©ho spracovania inĹˇtrukciĂ­', 'Suggest and implement system for graphic visualization of pipeline processing', 'Navrhnite a implementujte systĂ©m, ktorĂ˝ bude s vyuĹľitĂ­m multimediĂˇlnych technolĂłgiĂ­ umoĹľĹovaĹĄ  naĹˇtudovanie, grafickĂ© zobrazenie a demonĹˇtrĂˇciu  dejov pri prĂşdovom spracovanĂ­ inĹˇtrukciĂ­.
Produkt implementujte ako hypermediĂˇlnu prezentĂˇciu vo voÄľne dostupnom webovom prehliadaÄŤi.', 'Navrhnite a implementujte systĂ©m, ktorĂ˝ bude s vyuĹľitĂ­m multimediĂˇlnych technolĂłgiĂ­ umoĹľĹovaĹĄ  naĹˇtudovanie, grafickĂ© zobrazenie a demonĹˇtrĂˇciu  dejov pri prĂşdovom spracovanĂ­ inĹˇtrukciĂ­.
Produkt implementujte ako hypermediĂˇlnu prezentĂˇciu vo voÄľne dostupnom webovom prehliadaÄŤi.', 0);
INSERT INTO projects VALUES (678, 'DP', 431, NULL, 609, '2005/2006', 'VĂ˝uÄŤbovĂ˝ systĂ©m konfigurĂˇcie smerovaÄŤov', 'VĂ˝uÄŤbovĂ˝ systĂ©m konfigurĂˇcie smerovaÄŤov', NULL, NULL, 0);
INSERT INTO projects VALUES (679, 'ZP', 541, NULL, 610, '2003/2004', 'ZĂˇlohovanie a obnova dĂˇt v databĂˇzach', 'ZĂˇlohovanie a obnova dĂˇt v databĂˇzach', 'Analyzujte metĂłdy a prostriedky zĂˇlohovania a obnovy dĂˇt v relaÄŤnĂ˝ch databĂˇzovĂ˝ch systĂ©moch. Definujte vĂ˝hody a nedostatky zĂˇlohovania a obnovy dĂˇt v DBS Oracle. Navrhnite moĹľnĂ© metĂłdy zlepĹˇenia a rozĹˇĂ­renia funkciĂ­ zĂˇlohovania a obnovy dĂˇt. VybratĂ©  metĂłdy implementujte v prostredĂ­ Oracle. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade.', 'Analyzujte metĂłdy a prostriedky zĂˇlohovania a obnovy dĂˇt v relaÄŤnĂ˝ch databĂˇzovĂ˝ch systĂ©moch. Definujte vĂ˝hody a nedostatky zĂˇlohovania a obnovy dĂˇt v DBS Oracle. Navrhnite moĹľnĂ© metĂłdy zlepĹˇenia a rozĹˇĂ­renia funkciĂ­ zĂˇlohovania a obnovy dĂˇt. VybratĂ©  metĂłdy implementujte v prostredĂ­ Oracle. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade.', 1);
INSERT INTO projects VALUES (680, 'DP', 10, NULL, 610, '2005/2006', 'SimulovanĂ˝ robotickĂ˝ futbal â€“ tĂ­movĂˇ spoluprĂˇca', 'SimulovanĂ˝ robotickĂ˝ futbal â€“ tĂ­movĂˇ spoluprĂˇca', NULL, NULL, 1);
INSERT INTO projects VALUES (681, 'ZP', 20, NULL, 611, '2004/2005', 'Editor neurĂłnovĂ˝ch sietĂ­', 'Editor of neural networks', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch doprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou. ExistujĂş rĂ´zne architektĂşry rekurentnĂ˝ch sietĂ­ s rĂ´znymi schopnosĹĄami z hÄľadiska spracovania vstupnĂ˝ch dĂˇt.
NaĹˇtudujte problematiku neurĂłnovĂ˝ch sietĂ­ a rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­, zamerajte sa na moĹľnosti zakĂłdovania architektĂşry neurĂłnovĂ˝ch sietĂ­ vzhÄľadom na potreby trĂ©novacĂ­ch algoritmov. Vytvorte editor umoĹľĹujĂşci pouĹľĂ­vateÄľovi vytvoriĹĄ neurĂłnovĂş sieĹĄ vyuĹľĂ­vajĂşci navrhnutĂ˝ formĂˇt.
', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch doprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasopriestorovou ĹˇtruktĂşrou. ExistujĂş rĂ´zne architektĂşry rekurentnĂ˝ch sietĂ­ s rĂ´znymi schopnosĹĄami z hÄľadiska spracovania vstupnĂ˝ch dĂˇt.
NaĹˇtudujte problematiku neurĂłnovĂ˝ch sietĂ­ a rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­, zamerajte sa na moĹľnosti zakĂłdovania architektĂşry neurĂłnovĂ˝ch sietĂ­ vzhÄľadom na potreby trĂ©novacĂ­ch algoritmov. Vytvorte editor umoĹľĹujĂşci pouĹľĂ­vateÄľovi vytvoriĹĄ neurĂłnovĂş sieĹĄ vyuĹľĂ­vajĂşci navrhnutĂ˝ formĂˇt.
', 1);
INSERT INTO projects VALUES (682, 'DP', 20, NULL, 611, '2005/2006', 'RieĹˇenie Ăşloh pomocou prĂ­stupov zaloĹľenĂ˝ch na podpornĂ˝ch vektoroch', 'RieĹˇenie Ăşloh pomocou prĂ­stupov zaloĹľenĂ˝ch na podpornĂ˝ch vektoroch', NULL, NULL, 1);
INSERT INTO projects VALUES (683, 'ZP', 588, 563, 613, '2004/2005', 'IdentifikaÄŤnĂ© systĂ©my', 'IdentifikaÄŤnĂ© systĂ©my', 'Analyzujte technickĂ© a programovĂ© prostredie pre realizĂˇciu identifikaÄŤnĂ˝ch systĂ©mov. Porovnajte kontaktnĂ© a bezdrĂ´tovĂ© systĂ©my uvedenĂ© (minimĂˇlne od dvoch vĂ˝robcov) na zĂˇklade definovanĂ˝ch technickĂ˝ch parametrov. Navrhnite obvodovĂş schĂ©mu pre jednoduchĂ˝ identifikaÄŤnĂ˝ systĂ©m riadenĂ˝ vhodnĂ˝m mikroprocesorom. NapĂ­Ĺˇte a overte program pre riadenie mikroprocesoru.

', 'Analyzujte technickĂ© a programovĂ© prostredie pre realizĂˇciu identifikaÄŤnĂ˝ch systĂ©mov. Porovnajte kontaktnĂ© a bezdrĂ´tovĂ© systĂ©my uvedenĂ© (minimĂˇlne od dvoch vĂ˝robcov) na zĂˇklade definovanĂ˝ch technickĂ˝ch parametrov. Navrhnite obvodovĂş schĂ©mu pre jednoduchĂ˝ identifikaÄŤnĂ˝ systĂ©m riadenĂ˝ vhodnĂ˝m mikroprocesorom. NapĂ­Ĺˇte a overte program pre riadenie mikroprocesoru.

', 0);
INSERT INTO projects VALUES (684, 'ZP', 445, NULL, 614, '2004/2005', 'SystĂ©my na sprĂˇvu webovĂ©ho obsahu a ich vhodnĂ© vyuĹľitie', 'SystĂ©my na sprĂˇvu webovĂ©ho obsahu a ich vhodnĂ© vyuĹľitie', 'Analyzujte existujĂşce systĂ©my na sprĂˇvu webovĂ©ho obsahu (z angl. Web Content Management Systems). Zamerajte sa pritom na open-source rieĹˇenia. Na zĂˇklade analĂ˝zy vytvorte rozhodovacĂ­ strom, ktorĂ˝ na zĂˇklade poĹľiadaviek kladenĂ˝ch na CMS odporuÄŤĂ­ najvhodnejĹˇie rieĹˇenia. Pomocou tohto stromu vyberte najvhodnejĹˇĂ­ CMS pre sprĂˇvu webovĂ©ho sĂ­dla vybranĂ©ho podÄľa potrieb fakulty (napr. strĂˇnka Ăşstavu). VybranĂ˝ CMS nĂˇsledne ukĂˇĹľkovo naplĹte.', 'Analyzujte existujĂşce systĂ©my na sprĂˇvu webovĂ©ho obsahu (z angl. Web Content Management Systems). Zamerajte sa pritom na open-source rieĹˇenia. Na zĂˇklade analĂ˝zy vytvorte rozhodovacĂ­ strom, ktorĂ˝ na zĂˇklade poĹľiadaviek kladenĂ˝ch na CMS odporuÄŤĂ­ najvhodnejĹˇie rieĹˇenia. Pomocou tohto stromu vyberte najvhodnejĹˇĂ­ CMS pre sprĂˇvu webovĂ©ho sĂ­dla vybranĂ©ho podÄľa potrieb fakulty (napr. strĂˇnka Ăşstavu). VybranĂ˝ CMS nĂˇsledne ukĂˇĹľkovo naplĹte.', 1);
INSERT INTO projects VALUES (685, 'ZP', 12, NULL, 615, '2004/2005', 'Podpora vizuĂˇlneho nĂˇvrhu architektonickĂ©ho ĹˇtĂ˝lu dĂˇtovody a filtre', 'SUPPORT OF VISUAL DESIGN OF ARCHITECTURAL STYLES PIPES AND FILTERS', 'Analyzujte vlastnosti architektonickĂ©ho ĹˇtĂ˝lu dĂˇtovody a filtre. SĂşstreÄŹte sa na moĹľnosĹĄ podporenia nĂˇvrhu softvĂ©ru s pouĹľitĂ­m tohoto architektonickĂ©ho ĹˇtĂ˝lu. Navrhnite a implementujte aplikĂˇciu, ktorĂˇ uÄľahÄŤĂ­ nĂˇvrh a ĂşdrĹľbu aplikĂˇciĂ­ vyvĂ­janĂ˝ch nad niektorĂ˝m existujĂşcim frameworkom zaloĹľenĂ˝ch na uvedenom architektonickom ĹˇtĂ˝le. RieĹˇenie overte implementovanĂ­m a zdokumentovanĂ­m informaÄŤnĂ©ho WWW portĂˇlu.', 'Analyzujte vlastnosti architektonickĂ©ho ĹˇtĂ˝lu dĂˇtovody a filtre. SĂşstreÄŹte sa na moĹľnosĹĄ podporenia nĂˇvrhu softvĂ©ru s pouĹľitĂ­m tohoto architektonickĂ©ho ĹˇtĂ˝lu. Navrhnite a implementujte aplikĂˇciu, ktorĂˇ uÄľahÄŤĂ­ nĂˇvrh a ĂşdrĹľbu aplikĂˇciĂ­ vyvĂ­janĂ˝ch nad niektorĂ˝m existujĂşcim frameworkom zaloĹľenĂ˝ch na uvedenom architektonickom ĹˇtĂ˝le. RieĹˇenie overte implementovanĂ­m a zdokumentovanĂ­m informaÄŤnĂ©ho WWW portĂˇlu.', 1);
INSERT INTO projects VALUES (686, 'ZP', 24, NULL, 616, '2004/2005', 'ProblĂ©m obchodnĂ©ho cestujĂşceho v praxi', 'ProblĂ©m obchodnĂ©ho cestujĂşceho v praxi', 'Analyzujte problĂ©m obchodnĂ©ho cestujĂşceho. Porovnajte ho 
s problĂ©mom ÄŤĂ­nskeho poĹˇtĂˇra. Analyzujte heuristiky, ktorĂ© sa 
pouĹľĂ­vajĂş na optimalizĂˇciu tohto problĂ©mu.
Na zĂˇklade poznatkov z analĂ˝zy tĂ˝chto problĂ©mov navrhnite 
model, ktorĂ˝ bude vyuĹľĂ­vaĹĄ tieto poznatky v praxi.
Model optimalizujte a vizualizujte vytvorenĂ­m softvĂ©rovĂ©ho prototypu.
', 'Analyzujte problĂ©m obchodnĂ©ho cestujĂşceho. Porovnajte ho 
s problĂ©mom ÄŤĂ­nskeho poĹˇtĂˇra. Analyzujte heuristiky, ktorĂ© sa 
pouĹľĂ­vajĂş na optimalizĂˇciu tohto problĂ©mu.
Na zĂˇklade poznatkov z analĂ˝zy tĂ˝chto problĂ©mov navrhnite 
model, ktorĂ˝ bude vyuĹľĂ­vaĹĄ tieto poznatky v praxi.
Model optimalizujte a vizualizujte vytvorenĂ­m softvĂ©rovĂ©ho prototypu.
', 1);
INSERT INTO projects VALUES (687, 'ZP', 660, NULL, 618, '2004/2005', 'IdentifikĂˇcia slovanskĂ˝ch jazykov na webe', 'Language Identification of slavic web pages', 'Na webe sa nachĂˇdza veÄľkĂ© mnoĹľstvo dokumentov zapĂ­sanĂ˝ch v najrĂ´znejĹˇĂ­ch jazykoch. Analyzujte moĹľnosti identifikĂˇcie jazyka dokumentu v rĂˇmci skupiny slovanskĂ˝ch jazykov a znakovej sady pouĹľitej na zapĂ­sanie dokumentov dostupnĂ˝ch na webe. Navrhnite metĂłdu analĂ˝zy. NavrhnutĂş metĂłdu overte vytvorenĂ­m softvĂ©rovĂ©ho prototypu. Analyzujte zloĹľitosĹĄ navrhnutej metĂłdy a vyhodnoĹĄte jej efektĂ­vnosĹĄ (s sĂşvislosti s rozsahom analyzovanĂ˝ch dĂˇt). Pri experimentoch s navrhnutou metĂłdou pouĹľite obsah webu v ĹˇtruktĂşrovanej podobe zĂ­skanĂ˝ v rĂˇmci projektu Language Observatory (http://www.language-observatory.org/) - tento bude pri rieĹˇenĂ­ projektu dostupnĂ˝.', 'Na webe sa nachĂˇdza veÄľkĂ© mnoĹľstvo dokumentov zapĂ­sanĂ˝ch v najrĂ´znejĹˇĂ­ch jazykoch. Analyzujte moĹľnosti identifikĂˇcie jazyka dokumentu v rĂˇmci skupiny slovanskĂ˝ch jazykov a znakovej sady pouĹľitej na zapĂ­sanie dokumentov dostupnĂ˝ch na webe. Navrhnite metĂłdu analĂ˝zy. NavrhnutĂş metĂłdu overte vytvorenĂ­m softvĂ©rovĂ©ho prototypu. Analyzujte zloĹľitosĹĄ navrhnutej metĂłdy a vyhodnoĹĄte jej efektĂ­vnosĹĄ (s sĂşvislosti s rozsahom analyzovanĂ˝ch dĂˇt). Pri experimentoch s navrhnutou metĂłdou pouĹľite obsah webu v ĹˇtruktĂşrovanej podobe zĂ­skanĂ˝ v rĂˇmci projektu Language Observatory (http://www.language-observatory.org/) - tento bude pri rieĹˇenĂ­ projektu dostupnĂ˝.', 1);
INSERT INTO projects VALUES (688, 'ZP', 705, NULL, 619, '2005/2006', 'AutomatickĂ˝ nĂˇvrh logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s integrovanĂ˝mi obvodmi MSI', 'AutomatickĂ˝ nĂˇvrh logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s integrovanĂ˝mi obvodmi MSI', 'Treba vypracovaĹĄ metodiku automatickĂ©ho nĂˇvrhu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s viacerĂ˝mi vĂ˝stupmi s pouĹľitĂ­m dekodĂ©rov a ÄŤlenov OR alebo NAND zo stavebnice integrovanĂ˝ch obvodov MSI. Vstupom mĂˇ byĹĄ systĂ©m boolovskĂ˝ch funkciĂ­ zadanĂ˝ch ÄľubovoÄľnĂ˝m boolovskĂ˝m vĂ˝razom alebo pravdivostnou tabuÄľkou. VĂ˝stupom mĂˇ byĹĄ prepojovacĂ­ predpis opisujĂşci ĹˇtruktĂşru navrhnutĂ©ho logickĂ©ho obvodu.', 'Treba vypracovaĹĄ metodiku automatickĂ©ho nĂˇvrhu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s viacerĂ˝mi vĂ˝stupmi s pouĹľitĂ­m dekodĂ©rov a ÄŤlenov OR alebo NAND zo stavebnice integrovanĂ˝ch obvodov MSI. Vstupom mĂˇ byĹĄ systĂ©m boolovskĂ˝ch funkciĂ­ zadanĂ˝ch ÄľubovoÄľnĂ˝m boolovskĂ˝m vĂ˝razom alebo pravdivostnou tabuÄľkou. VĂ˝stupom mĂˇ byĹĄ prepojovacĂ­ predpis opisujĂşci ĹˇtruktĂşru navrhnutĂ©ho logickĂ©ho obvodu.', 0);
INSERT INTO projects VALUES (689, 'ZP', 297, NULL, 620, '2002/2003', 'PruĹľnĂ© vzdelĂˇvanie', 'Flexible learning', NULL, NULL, 1);
INSERT INTO projects VALUES (690, 'DP', 397, 358, 620, '2005/2006', 'ZruĹˇenĂ© certifikĂˇty a elektronickĂ˝ podpis', 'Revoked certificates and digital signature', NULL, NULL, 2);
INSERT INTO projects VALUES (691, 'ZP', 660, NULL, 621, '2002/2003', 'Podpora vyhodnocovania vĂ˝sledkov ankiet v prostredĂ­ WWW', 'Support of web questionnaires evaluation', NULL, NULL, 1);
INSERT INTO projects VALUES (692, 'DP', 387, NULL, 621, '2003/2004', 'ZdieÄľanie a sprĂ­stupĹovanie dokumentov', 'Document sharing and access', NULL, NULL, 1);
INSERT INTO projects VALUES (693, 'ZP', 272, NULL, 622, '2003/2004', 'SystĂ©m pre generovanie fraktĂˇlov', 'The system for generating fractals', 'Objekty v prĂ­rode sa vyznaÄŤujĂş svojou geometrickou nepravidelnosĹĄou. NepravidelnosĹĄ spĂ´sobuje znaÄŤnĂ© problĂ©my pri ich matematickom opise z hÄľadiska mnoĹľstva dĂˇt  potrebnĂ˝ch pre reprezentĂˇciu objektov. DanĂ© nedostatky je moĹľnĂ© rieĹˇiĹĄ pomocou modelovania vhodnĂ˝mi typmi fraktĂˇlov. Analyzujte problematiku fraktĂˇlovej geometrie. Vypracujte prehÄľad znĂˇmych typov fraktĂˇlov a ich matematickĂ©ho opisu. Navrhnite a implementujte systĂ©m umoĹľĹujĂşci generovanie, vizualizĂˇciu a nĂˇslednĂ© uchovanie vygenerovanĂ˝ch fraktĂˇlov v Äľubovolnom formĂˇte.', 'Objekty v prĂ­rode sa vyznaÄŤujĂş svojou geometrickou nepravidelnosĹĄou. NepravidelnosĹĄ spĂ´sobuje znaÄŤnĂ© problĂ©my pri ich matematickom opise z hÄľadiska mnoĹľstva dĂˇt  potrebnĂ˝ch pre reprezentĂˇciu objektov. DanĂ© nedostatky je moĹľnĂ© rieĹˇiĹĄ pomocou modelovania vhodnĂ˝mi typmi fraktĂˇlov. Analyzujte problematiku fraktĂˇlovej geometrie. Vypracujte prehÄľad znĂˇmych typov fraktĂˇlov a ich matematickĂ©ho opisu. Navrhnite a implementujte systĂ©m umoĹľĹujĂşci generovanie, vizualizĂˇciu a nĂˇslednĂ© uchovanie vygenerovanĂ˝ch fraktĂˇlov v Äľubovolnom formĂˇte.', 1);
INSERT INTO projects VALUES (694, 'DP', 579, NULL, 622, '2004/2005', 'VyuĹľitie znalostĂ­ v tvorbe plĂˇnov (rozvrhov)', 'VyuĹľitie znalostĂ­ v tvorbe plĂˇnov (rozvrhov)', NULL, NULL, 1);
INSERT INTO projects VALUES (695, 'ZP', 579, NULL, 623, '2003/2004', 'VyuĹľitie multimediĂˇlnych foriem vĂ˝uÄŤby informatiky â€“ 1', 'Multimedia versions of teaching 1', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej podoby informĂˇciĂ­ v systĂ©moch na podporu vĂ˝uÄŤby informatiky. Navrhnite zĂˇkladnĂ˝ systĂ©m a nĂˇsledne ho rozĹˇĂ­rte o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili obohatenie textovĂ©ho obsahu o rĂ´zne inĂ© formy prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe obrĂˇzkov, grafov, animĂˇciĂ­. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na niektorom predmete podÄľa potrieb KIVT.', 'Analyzujte moĹľnosti vyuĹľitia multimediĂˇlnej podoby informĂˇciĂ­ v systĂ©moch na podporu vĂ˝uÄŤby informatiky. Navrhnite zĂˇkladnĂ˝ systĂ©m a nĂˇsledne ho rozĹˇĂ­rte o vhodnĂ© ĹˇtruktĂşry a funkcie, ktorĂ© by zvĂ˝raznili obohatenie textovĂ©ho obsahu o rĂ´zne inĂ© formy prezentĂˇcie, ako aj doplnenie novĂ˝ch informĂˇciĂ­ v podobe obrĂˇzkov, grafov, animĂˇciĂ­. PodstatnĂ© ÄŤasti z nĂˇvrhu implementujte vo vhodnom implementaÄŤnom prostredĂ­ a overte na niektorom predmete podÄľa potrieb KIVT.', 1);
INSERT INTO projects VALUES (696, 'DP', 705, NULL, 623, '2005/2006', 'VirtuĂˇlna stavebnica logickĂ˝ch obvodov s normĂˇlnou ĹˇtruktĂşrou', 'VirtuĂˇlna stavebnica logickĂ˝ch obvodov s normĂˇlnou ĹˇtruktĂşrou', NULL, NULL, 0);
INSERT INTO projects VALUES (697, 'ZP', 672, 541, 625, '2004/2005', 'Jazyk ako sieĹĄ malĂ©ho sveta', 'Jazyk ako sieĹĄ malĂ©ho sveta', 'Siete malĂ©ho sveta sĂş grafy, ktorĂ˝ch vlastnosti integrujĂş v sebe vlastnosti nĂˇhodnĂ˝ch grafov aj usporiadanĂ˝ch mrieĹľok. Pomocou takĂ˝chto grafov moĹľno modelovaĹĄ vlastnosti reĂˇlnych sietĂ­, ako je www, napr. ukazuje sa, Ĺľe aj ÄľudskĂ˝ jazyk moĹľno popĂ­saĹĄ ako graf malĂ©ho sveta, kde uzly sĂş slovĂˇ a hrany interakcie medzi nimi. Analyzujte anglickĂ˝ preklad Biblie z hÄľadiska siete malĂ©ho sveta a overte hypotĂ©zu o ĹˇkĂˇlovanĂ­ poÄŤtu hrĂˇn v grafe, ktorĂˇ tvrdĂ­, Ĺľe inĂ© vlastnosti mĂˇ ustĂˇlenĂˇ ÄŤasĹĄ jazyka a inĂ© modernĂˇ. Ak v grafe zostavenom z biblickĂ©ho textu bude chĂ˝baĹĄ reĹľim ĹˇkĂˇlovania typickĂ˝ pre slovĂˇ, ktorĂ© sĂş relatĂ­vne novĂ© (ako napr poÄŤĂ­taÄŤ, world wide web, chromozĂłm), moĹľno hypotĂ©zu povaĹľovaĹĄ za overenĂş. ', 'Siete malĂ©ho sveta sĂş grafy, ktorĂ˝ch vlastnosti integrujĂş v sebe vlastnosti nĂˇhodnĂ˝ch grafov aj usporiadanĂ˝ch mrieĹľok. Pomocou takĂ˝chto grafov moĹľno modelovaĹĄ vlastnosti reĂˇlnych sietĂ­, ako je www, napr. ukazuje sa, Ĺľe aj ÄľudskĂ˝ jazyk moĹľno popĂ­saĹĄ ako graf malĂ©ho sveta, kde uzly sĂş slovĂˇ a hrany interakcie medzi nimi. Analyzujte anglickĂ˝ preklad Biblie z hÄľadiska siete malĂ©ho sveta a overte hypotĂ©zu o ĹˇkĂˇlovanĂ­ poÄŤtu hrĂˇn v grafe, ktorĂˇ tvrdĂ­, Ĺľe inĂ© vlastnosti mĂˇ ustĂˇlenĂˇ ÄŤasĹĄ jazyka a inĂ© modernĂˇ. Ak v grafe zostavenom z biblickĂ©ho textu bude chĂ˝baĹĄ reĹľim ĹˇkĂˇlovania typickĂ˝ pre slovĂˇ, ktorĂ© sĂş relatĂ­vne novĂ© (ako napr poÄŤĂ­taÄŤ, world wide web, chromozĂłm), moĹľno hypotĂ©zu povaĹľovaĹĄ za overenĂş. ', 1);
INSERT INTO projects VALUES (698, 'ZP', 270, NULL, 626, '2005/2006', 'Vytvorenie webovej aplikĂˇcie na spracovanie publikaÄŤnej ÄŤinnosti pracoviska', 'Vytvorenie webovej aplikĂˇcie na spracovanie publikaÄŤnej ÄŤinnosti pracoviska', 'SpĂ´sob spracovania informĂˇciĂ­, ktorĂ© ponĂşka sĂşÄŤasnĂ˝ web je veÄľmi vĂ˝hodnĂ˝ pre zadĂˇvanie, evidenciu, spracovanie a archivĂˇciu rĂ´znych typov Ăşdajov, ako napr. publikaÄŤnej ÄŤinnosti pracoviska. Analyzujte prĂ­stupy v sĂşÄŤasnĂ˝ch systĂ©moch pre spracovanie Ăşdajov podobnĂ©ho typu. PreskĂşmajte, ktorĂ© nĂˇstroje sĂş pre aplikĂˇcie tohoto druhu najvhodnejĹˇie. Navrhnite systĂ©m, ktorĂ˝ bude realizovaĹĄ distribuovanĂ© zadĂˇvanie publikĂˇciĂ­ do databĂˇzy pracoviska a umoĹľnĂ­ nad Ĺou realizovaĹĄ beĹľnĂ© operĂˇcie, ako je vĂ˝ber podÄľa istĂ˝ch kritĂ©riĂ­, triedenie, atÄŹ. NavrhnutĂ˝ systĂ©m implementujte a experimentĂˇlne overte na zozname publikaÄŤnej ÄŤinnosti FIIT STU.', 'SpĂ´sob spracovania informĂˇciĂ­, ktorĂ© ponĂşka sĂşÄŤasnĂ˝ web je veÄľmi vĂ˝hodnĂ˝ pre zadĂˇvanie, evidenciu, spracovanie a archivĂˇciu rĂ´znych typov Ăşdajov, ako napr. publikaÄŤnej ÄŤinnosti pracoviska. Analyzujte prĂ­stupy v sĂşÄŤasnĂ˝ch systĂ©moch pre spracovanie Ăşdajov podobnĂ©ho typu. PreskĂşmajte, ktorĂ© nĂˇstroje sĂş pre aplikĂˇcie tohoto druhu najvhodnejĹˇie. Navrhnite systĂ©m, ktorĂ˝ bude realizovaĹĄ distribuovanĂ© zadĂˇvanie publikĂˇciĂ­ do databĂˇzy pracoviska a umoĹľnĂ­ nad Ĺou realizovaĹĄ beĹľnĂ© operĂˇcie, ako je vĂ˝ber podÄľa istĂ˝ch kritĂ©riĂ­, triedenie, atÄŹ. NavrhnutĂ˝ systĂ©m implementujte a experimentĂˇlne overte na zozname publikaÄŤnej ÄŤinnosti FIIT STU.', 1);
INSERT INTO projects VALUES (699, 'ZP', 433, NULL, 627, '2005/2006', 'Ohodnocovanie softvĂ©rovĂ˝ch systĂ©mov', 'Ohodnocovanie softvĂ©rovĂ˝ch systĂ©mov', 'SoftvĂ©rovĂ© inĹľiniersvo neustĂˇle hÄľadĂˇ novĂ© spĂ´soby merania kvality softvĂ©rovĂ˝ch systĂ©mov. Medzi zĂˇkladnĂ© sledovanĂ© charakteristiky partia zviazanosĹĄ a sĂşdrĹľnosĹĄ. Modelujte zdrojovĂ˝ kĂłd softvĂ©rovĂ©ho systĂ©mu ako graf, ktorĂ©ho uzly predstavujĂş entity objektovo-orientovanej realizĂˇcie systĂ©mu, a ktorĂ©ho hrany reprezentujĂş vĂ¤zby medzi tĂ˝mito entitami. Vytvorte nĂˇstroj, ktorĂ˝ na zĂˇklade analĂ˝zy rozsiahleho softvĂ©rovĂ©ho systĂ©mu zmeria takĂşto reprezentĂˇciu. Pomocou tohto nĂˇstroja vyhodnoĹĄte niekoÄľko rozsiahlejĹˇĂ­ch systĂ©mov s voÄľne dostupnĂ˝m zdrojovĂ˝m kĂłdom.', 'SoftvĂ©rovĂ© inĹľiniersvo neustĂˇle hÄľadĂˇ novĂ© spĂ´soby merania kvality softvĂ©rovĂ˝ch systĂ©mov. Medzi zĂˇkladnĂ© sledovanĂ© charakteristiky partia zviazanosĹĄ a sĂşdrĹľnosĹĄ. Modelujte zdrojovĂ˝ kĂłd softvĂ©rovĂ©ho systĂ©mu ako graf, ktorĂ©ho uzly predstavujĂş entity objektovo-orientovanej realizĂˇcie systĂ©mu, a ktorĂ©ho hrany reprezentujĂş vĂ¤zby medzi tĂ˝mito entitami. Vytvorte nĂˇstroj, ktorĂ˝ na zĂˇklade analĂ˝zy rozsiahleho softvĂ©rovĂ©ho systĂ©mu zmeria takĂşto reprezentĂˇciu. Pomocou tohto nĂˇstroja vyhodnoĹĄte niekoÄľko rozsiahlejĹˇĂ­ch systĂ©mov s voÄľne dostupnĂ˝m zdrojovĂ˝m kĂłdom.', 1);
INSERT INTO projects VALUES (700, 'ZP', 294, NULL, 628, '2003/2004', 'PoÄŤĂ­taÄŤom generovanĂˇ holografia', 'PoÄŤĂ­taÄŤom generovanĂˇ holografia', 'Urobte reĹˇerĹˇ publikĂˇciĂ­, naĹˇtudujte a urobte analĂ˝zu moĹľnostĂ­ vĂ˝poÄŤtov poÄŤĂ­taÄŤom generovanĂ˝ch hologramov (CGH) znaÄŤka premietanĂˇ laserom pre aplikĂˇcie v obohatenej skutoÄŤnosti (augmented reality). Vytvorte program pre vĂ˝poÄŤet a overte algoritmus vygenerovanĂ­m dĂˇt digitĂˇlneho hologramu jednoduchĂ©ho geometrickĂ©ho vzoru vo formĂˇte elektrĂłnovĂ©ho litografiu (DWG). Pojednajte o moĹľnostiach urĂ˝chlenia vĂ˝poÄŤtov CGH pomocou viacerĂ˝ch  poÄŤĂ­taÄŤov sĂşÄŤasne.', 'Urobte reĹˇerĹˇ publikĂˇciĂ­, naĹˇtudujte a urobte analĂ˝zu moĹľnostĂ­ vĂ˝poÄŤtov poÄŤĂ­taÄŤom generovanĂ˝ch hologramov (CGH) znaÄŤka premietanĂˇ laserom pre aplikĂˇcie v obohatenej skutoÄŤnosti (augmented reality). Vytvorte program pre vĂ˝poÄŤet a overte algoritmus vygenerovanĂ­m dĂˇt digitĂˇlneho hologramu jednoduchĂ©ho geometrickĂ©ho vzoru vo formĂˇte elektrĂłnovĂ©ho litografiu (DWG). Pojednajte o moĹľnostiach urĂ˝chlenia vĂ˝poÄŤtov CGH pomocou viacerĂ˝ch  poÄŤĂ­taÄŤov sĂşÄŤasne.', 1);
INSERT INTO projects VALUES (701, 'ZP', 27, NULL, 629, '2004/2005', 'VĂ˝vojovĂ© prostredie pre algoritmy systĂ©mov sĂşborov', 'Integrated Development Environment for Filesystem Algorithms', 'Analyzujte dostupnĂ© otvorenĂ© modely systĂ©mov sĂşborov, z hÄľadiska ich pouĹľiteÄľnosti ako vĂ˝vojovĂ©ho a testovacieho prostredia pre novĂ© implementaÄŤnĂ© metĂłdy v architektĂşrach operaÄŤnĂ˝ch systĂ©mov. Navrhnite a realizujte vĂ˝vojovĂ© a testovacie prostredie, zameranĂ© na systĂ©my sĂşborov. V tomto prostredĂ­ demonĹˇtrujte prĂ­klady vytvorenĂ˝ch a testovanĂ˝ch algoritmov.', 'Analyzujte dostupnĂ© otvorenĂ© modely systĂ©mov sĂşborov, z hÄľadiska ich pouĹľiteÄľnosti ako vĂ˝vojovĂ©ho a testovacieho prostredia pre novĂ© implementaÄŤnĂ© metĂłdy v architektĂşrach operaÄŤnĂ˝ch systĂ©mov. Navrhnite a realizujte vĂ˝vojovĂ© a testovacie prostredie, zameranĂ© na systĂ©my sĂşborov. V tomto prostredĂ­ demonĹˇtrujte prĂ­klady vytvorenĂ˝ch a testovanĂ˝ch algoritmov.', 1);
INSERT INTO projects VALUES (702, 'ZP', 98, NULL, 630, '2004/2005', 'Objektovo orientovanĂ© programovanie a Smalltalk.', 'Object Oriented programming and Smalltalk', 'Smalltalk nie je len programovacĂ­ jazyk, je to vlastne celĂ© prostredie s niektorĂ˝mi charakteristikami samostatnĂ©ho operaÄŤnĂ©ho systĂ©mu. Ide o ÄŤiste objektovo orientovanĂ˝ jazyk. VzhÄľadom k tomu, Ĺľe celĂ© jeho vĂ˝vojovĂ© prostredie je tieĹľ vytvorenĂ© v Smalltalku a vykonĂˇva sa vlastne sĂˇm v sebe, je vhodnĂ˝ pre tvorbu aplikĂˇcie, ktorĂˇ vie â€śsimulovaĹĄâ€ť  nĂˇvrhovĂ˝ proces aplikĂˇcie. PreĹˇtudujte Smalltalk resp.  jeho jednotlivĂ© verzie hlavne  jeho objektovo orientovanĂ© ÄŤrty. 
Na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu, ktorĂˇ bude vizualizovaĹĄ  nĂˇvrhovĂ˝ proces objektovo orientovanej aplikĂˇcie.
', 'Smalltalk nie je len programovacĂ­ jazyk, je to vlastne celĂ© prostredie s niektorĂ˝mi charakteristikami samostatnĂ©ho operaÄŤnĂ©ho systĂ©mu. Ide o ÄŤiste objektovo orientovanĂ˝ jazyk. VzhÄľadom k tomu, Ĺľe celĂ© jeho vĂ˝vojovĂ© prostredie je tieĹľ vytvorenĂ© v Smalltalku a vykonĂˇva sa vlastne sĂˇm v sebe, je vhodnĂ˝ pre tvorbu aplikĂˇcie, ktorĂˇ vie â€śsimulovaĹĄâ€ť  nĂˇvrhovĂ˝ proces aplikĂˇcie. PreĹˇtudujte Smalltalk resp.  jeho jednotlivĂ© verzie hlavne  jeho objektovo orientovanĂ© ÄŤrty. 
Na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu, ktorĂˇ bude vizualizovaĹĄ  nĂˇvrhovĂ˝ proces objektovo orientovanej aplikĂˇcie.
', 1);
INSERT INTO projects VALUES (703, 'ZP', 298, NULL, 632, '2005/2006', 'GenerĂˇtor konfigurĂˇciĂ­ pre Cisco prepĂ­naÄŤe', 'GenerĂˇtor konfigurĂˇciĂ­ pre Cisco prepĂ­naÄŤe', 'Analyzujte syntax prĂ­kazov pre konfigurĂˇciu Cisco prepĂ­naÄŤov. Navrhnite a implementujte programovĂ˝ systĂ©m, generujĂşci takĂşto konfigurĂˇciu z neformĂˇlneho opisu vyĹľadovanĂ©ho sprĂˇvania sa prepĂ­naÄŤa. VstupnĂˇ ĹˇpecifikĂˇcia bude napr. v tvare obrĂˇzku, definujĂşcom vzĹĄahy a vlastnosti jednotlivĂ˝ch prepojenĂ˝ch zariadenĂ­. VĂ˝stupnĂ˝ sĂşbor bude obsahovaĹĄ konfiguraÄŤnĂ© prĂ­kazy podobne, ako sĂş zobrazenĂ© na terminĂˇli poÄŤĂ­taÄŤa pri zobrazenĂ­ konfigurĂˇcie prepĂ­naÄŤa. UvaĹľujte aj konfigurĂˇcie pre vytvĂˇranie virtuĂˇlnych sietĂ­ (VLAN). ', 'Analyzujte syntax prĂ­kazov pre konfigurĂˇciu Cisco prepĂ­naÄŤov. Navrhnite a implementujte programovĂ˝ systĂ©m, generujĂşci takĂşto konfigurĂˇciu z neformĂˇlneho opisu vyĹľadovanĂ©ho sprĂˇvania sa prepĂ­naÄŤa. VstupnĂˇ ĹˇpecifikĂˇcia bude napr. v tvare obrĂˇzku, definujĂşcom vzĹĄahy a vlastnosti jednotlivĂ˝ch prepojenĂ˝ch zariadenĂ­. VĂ˝stupnĂ˝ sĂşbor bude obsahovaĹĄ konfiguraÄŤnĂ© prĂ­kazy podobne, ako sĂş zobrazenĂ© na terminĂˇli poÄŤĂ­taÄŤa pri zobrazenĂ­ konfigurĂˇcie prepĂ­naÄŤa. UvaĹľujte aj konfigurĂˇcie pre vytvĂˇranie virtuĂˇlnych sietĂ­ (VLAN). ', 0);
INSERT INTO projects VALUES (704, 'ZP', 27, NULL, 633, '2005/2006', 'CentrĂˇlne monitorovanie prvkov poÄŤĂ­taÄŤovej siete', 'CentrĂˇlne monitorovanie prvkov poÄŤĂ­taÄŤovej siete', '   PreĹˇtudujte vlastnosti a architektĂşru existujĂşcich aplikĂˇciĂ­ zabezpeÄŤujĂşcich zber, filtrovanie, vyhodnocovanie a archivĂˇciu sprĂˇv zasielanĂ˝ch aktĂ­vnymi prvkami poÄŤĂ­taÄŤovej siete. Zamerajte sa na bezpeÄŤnosĹĄ, konfigurovateÄľnosĹĄ a podporu viacerĂ˝ch platforiem. Analyzujte viacerĂ© moĹľnosti rieĹˇenia, navrhnite a implementujte aplikĂˇciu pre monitorovanie prvkov siete, ktorĂş otestujete v reĂˇlnej prevĂˇdzke a vyhodnotĂ­te jej vlastnosti. 

OdporĂşÄŤanĂˇ literatĂşra:

1. DostĂˇlek, L.: VelkĂ˝ prĹŻvodce protokoly TCP/IP, bezpeÄŤnost. Computer Press, 2003,  ISBN 80-7226-849-X.

2. Network Monitoring Tools: a list of tools used for Network (both LAN and WAN) http://www.slac.stanford.edu/xorg/nmtf/nmtf-tools.html
(Stanford Linear Accelerator Center)


', '   PreĹˇtudujte vlastnosti a architektĂşru existujĂşcich aplikĂˇciĂ­ zabezpeÄŤujĂşcich zber, filtrovanie, vyhodnocovanie a archivĂˇciu sprĂˇv zasielanĂ˝ch aktĂ­vnymi prvkami poÄŤĂ­taÄŤovej siete. Zamerajte sa na bezpeÄŤnosĹĄ, konfigurovateÄľnosĹĄ a podporu viacerĂ˝ch platforiem. Analyzujte viacerĂ© moĹľnosti rieĹˇenia, navrhnite a implementujte aplikĂˇciu pre monitorovanie prvkov siete, ktorĂş otestujete v reĂˇlnej prevĂˇdzke a vyhodnotĂ­te jej vlastnosti. 

OdporĂşÄŤanĂˇ literatĂşra:

1. DostĂˇlek, L.: VelkĂ˝ prĹŻvodce protokoly TCP/IP, bezpeÄŤnost. Computer Press, 2003,  ISBN 80-7226-849-X.

2. Network Monitoring Tools: a list of tools used for Network (both LAN and WAN) http://www.slac.stanford.edu/xorg/nmtf/nmtf-tools.html
(Stanford Linear Accelerator Center)


', 0);
INSERT INTO projects VALUES (705, 'ZP', 517, NULL, 634, '2003/2004', 'AnalĂ˝za  zloĹľitosti vybranĂ˝ch smerovacĂ­ch algortimov', 'AnalĂ˝za  zloĹľitosti vybranĂ˝ch smerovacĂ­ch algortimov', 'Analyzujte aspoĹ dva druhy smerovacĂ­ch algoritmov vzhÄľadom na pamĂ¤ĹĄovĂş a ÄŤasovĂş zloĹľitosĹĄ. Navrhnite algoritmy pre nejakĂ˝ abstraktnĂ˝ model poÄŤĂ­taÄŤa, pomocou ktorĂ˝ch je moĹľnĂ© analyzovaĹĄ uvedenĂ© zloĹľitostnĂ© miery.  Overte zĂ­skanĂ© vĂ˝sledky a porovnajte jednotlivĂ© smerovacie algoritmy vzhÄľadom na zistenĂ© parametre', 'Analyzujte aspoĹ dva druhy smerovacĂ­ch algoritmov vzhÄľadom na pamĂ¤ĹĄovĂş a ÄŤasovĂş zloĹľitosĹĄ. Navrhnite algoritmy pre nejakĂ˝ abstraktnĂ˝ model poÄŤĂ­taÄŤa, pomocou ktorĂ˝ch je moĹľnĂ© analyzovaĹĄ uvedenĂ© zloĹľitostnĂ© miery.  Overte zĂ­skanĂ© vĂ˝sledky a porovnajte jednotlivĂ© smerovacie algoritmy vzhÄľadom na zistenĂ© parametre', 1);
INSERT INTO projects VALUES (706, 'ZP', 98, NULL, 635, '2004/2005', 'SystĂ©m pre odovzdĂˇvanie prĂˇc prostrednĂ­ctvom Internetu', 'SystĂ©m pre odovzdĂˇvanie prĂˇc prostrednĂ­ctvom Internetu', 'C# je pomerne novĂ˝ jazyk, ktorĂ˝ vychĂˇza z jazyka C++  a z jazyka Java. NaĹˇtudujte tento programovacĂ­ jazyk a posĂşÄŹte jeho moĹľnosti ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇcii.
Na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu pre odovzdĂˇvanie prĂˇc prostrednĂ­ctvom Internetu.', 'C# je pomerne novĂ˝ jazyk, ktorĂ˝ vychĂˇza z jazyka C++  a z jazyka Java. NaĹˇtudujte tento programovacĂ­ jazyk a posĂşÄŹte jeho moĹľnosti ako prostriedku pre tvorbu webovskĂ˝ch aplikĂˇcii.
Na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu pre odovzdĂˇvanie prĂˇc prostrednĂ­ctvom Internetu.', 1);
INSERT INTO projects VALUES (707, 'ZP', 672, NULL, 636, '2004/2005', 'Jazyk ako sieĹĄ malĂ©ho sveta', 'Jazyk ako sieĹĄ malĂ©ho sveta', 'Siete malĂ©ho sveta sĂş grafy, ktorĂ˝ch vlastnosti integrujĂş v sebe vlastnosti nĂˇhodnĂ˝ch grafov aj usporiadanĂ˝ch mrieĹľok. Pomocou takĂ˝chto grafov moĹľno modelovaĹĄ vlastnosti reĂˇlnych sietĂ­, ako je www, napr. ukazuje sa, Ĺľe aj ÄľudskĂ˝ jazyk moĹľno popĂ­saĹĄ ako graf malĂ©ho sveta, kde uzly sĂş slovĂˇ a hrany interakcie medzi nimi. Analyzujte anglickĂ˝ preklad Biblie z hÄľadiska siete malĂ©ho sveta a overte hypotĂ©zu o ĹˇkĂˇlovanĂ­ poÄŤtu hrĂˇn v grafe, ktorĂˇ tvrdĂ­, Ĺľe inĂ© vlastnosti mĂˇ ustĂˇlenĂˇ ÄŤasĹĄ jazyka a inĂ© modernĂˇ. Ak v grafe zostavenom z biblickĂ©ho textu bude chĂ˝baĹĄ reĹľim ĹˇkĂˇlovania typickĂ˝ pre slovĂˇ, ktorĂ© sĂş relatĂ­vne novĂ© (ako napr poÄŤĂ­taÄŤ, world wide web, chromozĂłm), moĹľno hypotĂ©zu povaĹľovaĹĄ za overenĂş. ', 'Siete malĂ©ho sveta sĂş grafy, ktorĂ˝ch vlastnosti integrujĂş v sebe vlastnosti nĂˇhodnĂ˝ch grafov aj usporiadanĂ˝ch mrieĹľok. Pomocou takĂ˝chto grafov moĹľno modelovaĹĄ vlastnosti reĂˇlnych sietĂ­, ako je www, napr. ukazuje sa, Ĺľe aj ÄľudskĂ˝ jazyk moĹľno popĂ­saĹĄ ako graf malĂ©ho sveta, kde uzly sĂş slovĂˇ a hrany interakcie medzi nimi. Analyzujte anglickĂ˝ preklad Biblie z hÄľadiska siete malĂ©ho sveta a overte hypotĂ©zu o ĹˇkĂˇlovanĂ­ poÄŤtu hrĂˇn v grafe, ktorĂˇ tvrdĂ­, Ĺľe inĂ© vlastnosti mĂˇ ustĂˇlenĂˇ ÄŤasĹĄ jazyka a inĂ© modernĂˇ. Ak v grafe zostavenom z biblickĂ©ho textu bude chĂ˝baĹĄ reĹľim ĹˇkĂˇlovania typickĂ˝ pre slovĂˇ, ktorĂ© sĂş relatĂ­vne novĂ© (ako napr poÄŤĂ­taÄŤ, world wide web, chromozĂłm), moĹľno hypotĂ©zu povaĹľovaĹĄ za overenĂş. ', 1);
INSERT INTO projects VALUES (708, 'ZP', 10, NULL, 637, '2004/2005', 'SimulovanĂ˝ robotickĂ˝ futbal - analĂ˝za sprĂˇvania hrĂˇÄŤov', 'SimulovanĂ˝ robotickĂ˝ futbal - analĂ˝za sprĂˇvania hrĂˇÄŤov', 'SimulovanĂ˝ robotickĂ˝ futbal sa zaoberĂˇ vytvĂˇranĂ­m tĂ­mov spolupracujĂşcich agentov, ktorĂ© v simulovanom prostredĂ­ navzĂˇjom sĂşperia. Navrhnite a implementujte nĂˇstroj na analĂ˝zu sprĂˇvania sa hrĂˇÄŤov poÄŤas hry. VytvorenĂ˝ nĂˇstroj by mal byĹĄ schopnĂ˝ rozpoznaĹĄ zĂˇkladnĂ© vzory sprĂˇvania (proti)hrĂˇÄŤov, ktorĂ© by mali byĹĄ pouĹľiteÄľnĂ© pri predvĂ­danĂ­ sprĂˇvania hrĂˇÄŤov.', 'SimulovanĂ˝ robotickĂ˝ futbal sa zaoberĂˇ vytvĂˇranĂ­m tĂ­mov spolupracujĂşcich agentov, ktorĂ© v simulovanom prostredĂ­ navzĂˇjom sĂşperia. Navrhnite a implementujte nĂˇstroj na analĂ˝zu sprĂˇvania sa hrĂˇÄŤov poÄŤas hry. VytvorenĂ˝ nĂˇstroj by mal byĹĄ schopnĂ˝ rozpoznaĹĄ zĂˇkladnĂ© vzory sprĂˇvania (proti)hrĂˇÄŤov, ktorĂ© by mali byĹĄ pouĹľiteÄľnĂ© pri predvĂ­danĂ­ sprĂˇvania hrĂˇÄŤov.', 1);
INSERT INTO projects VALUES (709, 'ZP', 95, NULL, 638, '2004/2005', 'Podpora vĂ˝uÄŤby v predmete MaPĹ ', 'Support of teaching of subject MaPĹ ', 'Analyzujte problematiku, ktorou sa zaoberĂˇ vĂ˝uÄŤba formĂˇlnych ĹˇpecifikĂˇciĂ­ 
v predmete MetĂłdy a prostriedky ĹˇpecifikĂˇciĂ­. Navrhnite a implementujte
systĂ©m, ktorĂ˝ podporĂ­ vĂ˝uÄŤbu v tomto predmete s vyuĹľitĂ­m  prostriedku
Z-Browser alebo inĂ©ho dostupnĂ©ho prostriedku pre vizualizĂˇciu schĂ©m 
a formĂşl Z-jazyka. Navrhnite vhodnĂş metĂłdu pre podporu overovania
vedomostĂ­ v predmete MaPĹ . Ĺ pecifikujte poĹľiadavky na softvĂ©rovĂ˝
prostriedok, ktorĂ˝ by podporoval testovanie alebo hodnotenie vedomostĂ­ 
ĹˇpecifickĂ˝ch pre oblast pouĹľitia Z-jazyka. PodÄľa tĂ˝chto poĹľiadaviek
navrhnite a implementuje systĂ©m a overte jeho funkÄŤnosĹĄ podÄľa 
ĹˇpecifikovanĂ˝ch poĹľiadaviek.', 'Analyzujte problematiku, ktorou sa zaoberĂˇ vĂ˝uÄŤba formĂˇlnych ĹˇpecifikĂˇciĂ­ 
v predmete MetĂłdy a prostriedky ĹˇpecifikĂˇciĂ­. Navrhnite a implementujte
systĂ©m, ktorĂ˝ podporĂ­ vĂ˝uÄŤbu v tomto predmete s vyuĹľitĂ­m  prostriedku
Z-Browser alebo inĂ©ho dostupnĂ©ho prostriedku pre vizualizĂˇciu schĂ©m 
a formĂşl Z-jazyka. Navrhnite vhodnĂş metĂłdu pre podporu overovania
vedomostĂ­ v predmete MaPĹ . Ĺ pecifikujte poĹľiadavky na softvĂ©rovĂ˝
prostriedok, ktorĂ˝ by podporoval testovanie alebo hodnotenie vedomostĂ­ 
ĹˇpecifickĂ˝ch pre oblast pouĹľitia Z-jazyka. PodÄľa tĂ˝chto poĹľiadaviek
navrhnite a implementuje systĂ©m a overte jeho funkÄŤnosĹĄ podÄľa 
ĹˇpecifikovanĂ˝ch poĹľiadaviek.', 1);
INSERT INTO projects VALUES (710, 'DP', 27, NULL, 638, '2005/2006', 'DĂˇtovĂ© sluĹľby pre virtuĂˇlnu realitu', 'DĂˇtovĂ© sluĹľby pre virtuĂˇlnu realitu', NULL, NULL, 4);
INSERT INTO projects VALUES (711, 'ZP', 20, NULL, 639, '2004/2005', 'Hra pre mobilnĂ© zariadenia', 'Game for mobile devices', 'MobilnĂ© zariadenia umoĹľĹujĂşce vykonĂˇvanie uĹľĂ­vateÄľom dodanĂ˝ch programov sĂş ÄŤoraz dostupnejĹˇie. NaĹˇtudujte moĹľnosti programovania aplikĂˇciĂ­ pre mobilnĂ© zariadenia pomocou Java 2 Micro Edition. Vytvorte  aplikĂˇciu â€“ hru vyĹľadujĂşcu oponenta, priÄŤom logika oponenta bude realizovanĂˇ priamo na mobilnom zariadenĂ­.
', 'MobilnĂ© zariadenia umoĹľĹujĂşce vykonĂˇvanie uĹľĂ­vateÄľom dodanĂ˝ch programov sĂş ÄŤoraz dostupnejĹˇie. NaĹˇtudujte moĹľnosti programovania aplikĂˇciĂ­ pre mobilnĂ© zariadenia pomocou Java 2 Micro Edition. Vytvorte  aplikĂˇciu â€“ hru vyĹľadujĂşcu oponenta, priÄŤom logika oponenta bude realizovanĂˇ priamo na mobilnom zariadenĂ­.
', 1);
INSERT INTO projects VALUES (712, 'DP', 20, NULL, 639, '2005/2006', 'AdaptĂˇcia vhodnej dynamiky v neurĂłnovĂ˝ch sieĹĄach zaloĹľenĂ˝ch na echo stavoch', 'AdaptĂˇcia vhodnej dynamiky v neurĂłnovĂ˝ch sieĹĄach zaloĹľenĂ˝ch na echo stavoch', NULL, NULL, 1);
INSERT INTO projects VALUES (713, 'ZP', 20, NULL, 640, '2004/2005', 'Hra pre mobilnĂ© zariadenia', 'Game for the mobile devices', 'MobilnĂ© zariadenia umoĹľĹujĂşce vykonĂˇvanie uĹľĂ­vateÄľom dodanĂ˝ch programov sĂş ÄŤoraz dostupnejĹˇie. NaĹˇtudujte moĹľnosti programovania aplikĂˇciĂ­ pre mobilnĂ© zariadenia pomocou Java 2 Micro Edition. Vytvorte  aplikĂˇciu â€“ hru vyĹľadujĂşcu oponenta, priÄŤom logika oponenta bude realizovanĂˇ priamo na mobilnom zariadenĂ­.
', 'MobilnĂ© zariadenia umoĹľĹujĂşce vykonĂˇvanie uĹľĂ­vateÄľom dodanĂ˝ch programov sĂş ÄŤoraz dostupnejĹˇie. NaĹˇtudujte moĹľnosti programovania aplikĂˇciĂ­ pre mobilnĂ© zariadenia pomocou Java 2 Micro Edition. Vytvorte  aplikĂˇciu â€“ hru vyĹľadujĂşcu oponenta, priÄŤom logika oponenta bude realizovanĂˇ priamo na mobilnom zariadenĂ­.
', 1);
INSERT INTO projects VALUES (714, 'DP', 20, NULL, 640, '2005/2006', 'AplikĂˇcie novĂ˝ch prĂ­stupov z oblasti rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­ v robotike', 'AplikĂˇcie novĂ˝ch prĂ­stupov z oblasti rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­ v robotike', NULL, NULL, 1);
INSERT INTO projects VALUES (715, 'ZP', 517, NULL, 641, '2004/2005', 'SimulĂˇtor abstraktnĂ©ho poÄŤĂ­taÄŤa RASP', 'Abstract computer RASP simulator ', 'Model abstraktĂ˝ch vĂ˝poÄŤtov RASP je analĂłgiou poÄŤĂ­taÄŤa programovateÄľnĂ©ho v strojovo-orientovanom jazyku.  Analyzujte, navrhnite a implemetnujte simulĂˇtor abstraktnĂ©ho poÄŤĂ­taÄŤa RASP ako modifikĂˇcie abstraktnĂ©ho poÄŤĂ­taÄŤa RAM. Postupujte tak, ako pri vytvĂˇranĂ­ kompilĂˇtora pre nejakĂ˝ programovacĂ­ jazyk. VytvorenĂ˝ simulĂˇtor overte.', 'Model abstraktĂ˝ch vĂ˝poÄŤtov RASP je analĂłgiou poÄŤĂ­taÄŤa programovateÄľnĂ©ho v strojovo-orientovanom jazyku.  Analyzujte, navrhnite a implemetnujte simulĂˇtor abstraktnĂ©ho poÄŤĂ­taÄŤa RASP ako modifikĂˇcie abstraktnĂ©ho poÄŤĂ­taÄŤa RAM. Postupujte tak, ako pri vytvĂˇranĂ­ kompilĂˇtora pre nejakĂ˝ programovacĂ­ jazyk. VytvorenĂ˝ simulĂˇtor overte.', 1);
INSERT INTO projects VALUES (716, 'DP', 46, NULL, 641, '2005/2006', 'NĂˇvrhovĂ© vzory v tvorbe softvĂ©ru', 'NĂˇvrhovĂ© vzory v tvorbe softvĂ©ru', NULL, NULL, 1);
INSERT INTO projects VALUES (717, 'ZP', 44, NULL, 642, '2004/2005', 'SimulĂˇtor abstraktnĂ©ho poÄŤĂ­taÄŤa RASP', 'Random Access Machine with Stored Program Simulator', 'Model abstraktĂ˝ch vĂ˝poÄŤtov RASP je analĂłgiou poÄŤĂ­taÄŤa programovateÄľnĂ©ho v strojovo-orientovanom jazyku.  Analyzujte, navrhnite a implemetnujte simulĂˇtor abstraktnĂ©ho poÄŤĂ­taÄŤa RASP ako modifikĂˇcie abstraktnĂ©ho poÄŤĂ­taÄŤa RAM. Postupujte tak, ako pri vytvĂˇranĂ­ kompilĂˇtora pre nejakĂ˝ programovacĂ­ jazyk. VytvorenĂ˝ simulĂˇtor overte.', 'Model abstraktĂ˝ch vĂ˝poÄŤtov RASP je analĂłgiou poÄŤĂ­taÄŤa programovateÄľnĂ©ho v strojovo-orientovanom jazyku.  Analyzujte, navrhnite a implemetnujte simulĂˇtor abstraktnĂ©ho poÄŤĂ­taÄŤa RASP ako modifikĂˇcie abstraktnĂ©ho poÄŤĂ­taÄŤa RAM. Postupujte tak, ako pri vytvĂˇranĂ­ kompilĂˇtora pre nejakĂ˝ programovacĂ­ jazyk. VytvorenĂ˝ simulĂˇtor overte.', 1);
INSERT INTO projects VALUES (718, 'DP', 31, NULL, 642, '2005/2006', 'Interpret pre jazyk Occam', 'Interpret pre jazyk Occam', NULL, NULL, 1);
INSERT INTO projects VALUES (719, 'ZP', 660, NULL, 643, '2004/2005', 'CSIDC 2005', 'CSIDC 2005', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 1);
INSERT INTO projects VALUES (720, 'DP', 660, NULL, 643, '2005/2006', 'PersonalizovanĂˇ navigĂˇcia v priestore webu so sĂ©mantikou', 'PersonalizovanĂˇ navigĂˇcia v priestore webu so sĂ©mantikou', NULL, NULL, 1);
INSERT INTO projects VALUES (721, 'ZP', 541, NULL, 644, '2004/2005', 'ZĂˇlohovanie a obnova dĂˇt v databĂˇzach', 'Backup and recovery in databases', 'Analyzujte metĂłdy a prostriedky zĂˇlohovania a obnovy dĂˇt v relaÄŤnĂ˝ch databĂˇzovĂ˝ch systĂ©moch. Definujte vĂ˝hody a nedostatky zĂˇlohovania a obnovy dĂˇt v DBS Oracle. Navrhnite moĹľnĂ© metĂłdy zlepĹˇenia a rozĹˇĂ­renia funkciĂ­ zĂˇlohovania a obnovy dĂˇt. VybratĂ©  metĂłdy implementujte v prostredĂ­ Oracle. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade.', 'Analyzujte metĂłdy a prostriedky zĂˇlohovania a obnovy dĂˇt v relaÄŤnĂ˝ch databĂˇzovĂ˝ch systĂ©moch. Definujte vĂ˝hody a nedostatky zĂˇlohovania a obnovy dĂˇt v DBS Oracle. Navrhnite moĹľnĂ© metĂłdy zlepĹˇenia a rozĹˇĂ­renia funkciĂ­ zĂˇlohovania a obnovy dĂˇt. VybratĂ©  metĂłdy implementujte v prostredĂ­ Oracle. FunkÄŤnosĹĄ systĂ©mu demonĹˇtrujte na vybratom prĂ­klade.', 1);
INSERT INTO projects VALUES (722, 'ZP', 433, NULL, 645, '2004/2005', 'PrezentĂˇcia dokumentov pre web so sĂ©mantikou', 'Presentation of documents for web with semantic information', 'Analyzujte metĂłdy a prostriedky uchovĂˇvania a prezentĂˇcie dokumentov pre novĂş generĂˇciu siete Internet, web so sĂ©mantikou. Zamerajte sa pritom na reprezentĂˇciu RDF modelu a existujĂşce schĂ©my opisu dĂˇt. SkĂşmajte moĹľnosti automatizovanej extrakcie a pridĂˇvania sĂ©mantickĂ˝ch informĂˇciĂ­ do existujĂşcich dokumentov. Navrhnite systĂ©m, ktorĂ˝ bude sprĂ­stupĹovaĹĄ archivovanĂ© dokumenty spolu s sĂ©mantickĂ˝m opisom, umoĹľnite sĂ©mantickĂ˝ prĂ­stup k systĂ©mu aj inĂ˝m agentom. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m web-systĂ©mu na sprĂ­stupĹovanie dokumentov. ', 'Analyzujte metĂłdy a prostriedky uchovĂˇvania a prezentĂˇcie dokumentov pre novĂş generĂˇciu siete Internet, web so sĂ©mantikou. Zamerajte sa pritom na reprezentĂˇciu RDF modelu a existujĂşce schĂ©my opisu dĂˇt. SkĂşmajte moĹľnosti automatizovanej extrakcie a pridĂˇvania sĂ©mantickĂ˝ch informĂˇciĂ­ do existujĂşcich dokumentov. Navrhnite systĂ©m, ktorĂ˝ bude sprĂ­stupĹovaĹĄ archivovanĂ© dokumenty spolu s sĂ©mantickĂ˝m opisom, umoĹľnite sĂ©mantickĂ˝ prĂ­stup k systĂ©mu aj inĂ˝m agentom. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m web-systĂ©mu na sprĂ­stupĹovanie dokumentov. ', 1);
INSERT INTO projects VALUES (723, 'ZP', 359, NULL, 646, '2003/2004', 'ProgramovĂˇ podpora pre vĂ˝uÄŤbu zĂˇkladnĂ˝ch systĂ©mov hromadnej obsluhy', 'ProgramovĂˇ podpora pre vĂ˝uÄŤbu zĂˇkladnĂ˝ch systĂ©mov hromadnej obsluhy', 'Analyzujte zĂˇkladnĂ© systĂ©my hromadnej obsluhy. Navrhnite a implementujte aplikĂˇciu, ktorĂˇ bude vizualizovaĹĄ ÄŤinnosĹĄ vybranĂ˝ch systĂ©mov HO.

', 'Analyzujte zĂˇkladnĂ© systĂ©my hromadnej obsluhy. Navrhnite a implementujte aplikĂˇciu, ktorĂˇ bude vizualizovaĹĄ ÄŤinnosĹĄ vybranĂ˝ch systĂ©mov HO.

', 0);
INSERT INTO projects VALUES (724, 'ZP', 297, NULL, 647, '2003/2004', 'VizualizĂˇcia  algoritmov', 'Algorithm Visualisation', 'Analyzujte vizualizaÄŤnĂ© softvĂ©rovĂ© systĂ©my a metĂłdy vizualizĂˇcie. Ĺ pecifikujte podmienky na tvorbu systĂ©mu pre vizualizĂˇciu v etape algoritmizĂˇcie. PodÄľa ĹˇpecifikĂˇcie algoritmu navrhnite systĂ©m, ktorĂ˝ nĂˇzorne demonĹˇtruje algoritmus pomocou zvolenĂ˝ch vizualizaÄŤnĂ˝ch metĂłd a prostriedkov.  NavrhnutĂ˝ systĂ©m implementujte a overte realizovanĂ­m niektorĂ˝ch vybranĂ˝ch algoritmov.', 'Analyzujte vizualizaÄŤnĂ© softvĂ©rovĂ© systĂ©my a metĂłdy vizualizĂˇcie. Ĺ pecifikujte podmienky na tvorbu systĂ©mu pre vizualizĂˇciu v etape algoritmizĂˇcie. PodÄľa ĹˇpecifikĂˇcie algoritmu navrhnite systĂ©m, ktorĂ˝ nĂˇzorne demonĹˇtruje algoritmus pomocou zvolenĂ˝ch vizualizaÄŤnĂ˝ch metĂłd a prostriedkov.  NavrhnutĂ˝ systĂ©m implementujte a overte realizovanĂ­m niektorĂ˝ch vybranĂ˝ch algoritmov.', 1);
INSERT INTO projects VALUES (725, 'DP', 16, NULL, 647, '2004/2005', 'ZĂ­skavanie a spracovanie vĂ˝sledkov vĂ˝skumu a vĂ˝voja z webu', 'ZĂ­skavanie a spracovanie vĂ˝sledkov vĂ˝skumu a vĂ˝voja z webu', NULL, NULL, 1);
INSERT INTO projects VALUES (726, 'ZP', 660, NULL, 648, '2004/2005', 'CSIDC 2005', 'CSIDC 2005', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 'V rĂˇmci medzinĂˇrodnej sĂşĹĄaĹľe v navrhovanĂ­, ktorĂş organizuje PoÄŤĂ­taÄŤovĂˇ spoloÄŤnosĹĄ IEEE (CSIDC â€“ Computer Society International Design Competition, http://www.computer.org/csidc) navrhnite a implementujte rieĹˇenie problĂ©mu podÄľa zadania PoÄŤĂ­taÄŤovej spoloÄŤnosti IEEE. Analyzujte sprĂˇvy a prezentĂˇcie vybranĂ˝ch projektov tĂ­mov Ĺˇtudentov, ktorĂ­ sa zĂşÄŤastnili finĂˇle v predchĂˇdzajĂşcich roÄŤnĂ­koch sĂşĹĄaĹľe, preĹˇtudujte technolĂłgie a softvĂ©rovĂ© prostriedky, ktorĂ© budĂş tvoriĹĄ zĂˇklad rieĹˇenia. ÄŽalej navrhnite a implementujte prototyp systĂ©mu podÄľa ĹˇpecifikĂˇcie a ohraniÄŤujĂşcich podmienok dodanĂ˝ch PoÄŤĂ­taÄŤovou spoloÄŤnosĹĄou IEEE. VytvorenĂ˝ prototyp overte, vyhodnoĹĄte jeho pouĹľiteÄľnosĹĄ, udrĹľovateÄľnosĹĄ a moĹľnosti vĂ˝roby. VĂ˝sledok rieĹˇenia je sĂşÄŤasĹĄou ĹˇirĹˇej Ăşlohy, na ktorej sa podieÄľa tĂ­m Ĺˇtyroch Ĺˇtudentov.', 1);
INSERT INTO projects VALUES (727, 'DP', 660, NULL, 648, '2005/2006', 'Zachytenie zĂˇujmov pouĹľĂ­vateÄľov na webe', 'Zachytenie zĂˇujmov pouĹľĂ­vateÄľov na webe', NULL, NULL, 1);
INSERT INTO projects VALUES (728, 'ZP', 579, NULL, 649, '2004/2005', 'SystĂ©m na podporu tvorby semestrĂˇlnych rozvrhov', 'System for support of semestral schedules generation', 'Analyzujte ĂşdajovĂ© mnoĹľiny a postupy pri vytvĂˇranĂ­ semestrĂˇlnych rozvrhov a nĂˇsledne navrhnite systĂ©m, ktorĂ˝ by tieto ÄŤinnosti podporoval. ZĂˇkladnĂ© ÄŤasti nĂˇvrhu realizujte v podobe prototypu a zaistite nevyhnutnĂş kompatibilitu s informaÄŤnĂ˝m systĂ©mom pouĹľĂ­vanĂ˝m na FIIT.', 'Analyzujte ĂşdajovĂ© mnoĹľiny a postupy pri vytvĂˇranĂ­ semestrĂˇlnych rozvrhov a nĂˇsledne navrhnite systĂ©m, ktorĂ˝ by tieto ÄŤinnosti podporoval. ZĂˇkladnĂ© ÄŤasti nĂˇvrhu realizujte v podobe prototypu a zaistite nevyhnutnĂş kompatibilitu s informaÄŤnĂ˝m systĂ©mom pouĹľĂ­vanĂ˝m na FIIT.', 1);
INSERT INTO projects VALUES (729, 'DP', 579, NULL, 649, '2005/2006', 'SystĂ©m zĂ­skavania doplĹujĂşcich informĂˇciĂ­ pre tvorbu rozvrhov', 'SystĂ©m zĂ­skavania doplĹujĂşcich informĂˇciĂ­ pre tvorbu rozvrhov', NULL, NULL, 4);
INSERT INTO projects VALUES (730, 'ZP', 660, NULL, 650, '2004/2005', 'AdaptĂ­vny web a vĂ˝uÄŤba programovania', 'Adaptive web and programming education', 'Pre vzdelĂˇvanie je veÄľmi vĂ˝hodnĂ© vyuĹľiĹĄ ako prezentaÄŤnĂ© mĂ©dium Internet (resp. web) najmĂ¤ vÄŹaka jeho dostupnosti. Aby sme dosiahli ÄŤo najvyĹˇĹˇiu efektĂ­vnosĹĄ uÄŤenia prostrednĂ­ctvom Internetu, je dĂ´leĹľtĂ©, aby sa vĂ˝uÄŤbovĂ˝ systĂ©m dokĂˇzal prispĂ´sobovaĹĄ jednotlivĂ˝m Ĺˇtudentom, resp. skupinĂˇm Ĺˇtudentov. SkĂşmajte vlastnosti adaptĂ­vnych systĂ©mov pre vzdelĂˇvanie, ktorĂ© ako prezentaÄŤnĂ© mĂ©dium vyuĹľĂ­vajĂş Internet (resp. web). VyhodnoĹĄte vyuĹľitie existujĂşceho otvorenĂ©ho systĂ©mu AHA! vydanĂ©ho pod licenciou GNU Public License 2.0 pre vĂ˝uÄŤbu programovania (systĂ©m AHA! je vyvinutĂ˝ modernĂ˝mi technolĂłgiami â€“ Java SDK 1.4, Tomcat web server, XML a ÄŹalĹˇie a je dostupnĂ˝ na adrese http://aha.win.tue.nl). Navrhnite domĂ©novĂ˝ model pre oblasĹĄ programovania a tieĹľ model pouĹľĂ­vateÄľa tak, aby sa systĂ©m dal vyuĹľiĹĄ v predmetoch, kde sa vyuÄŤujĂş zĂˇklady programovania (napr. AlgoritmizĂˇcia a programovanie, FunkcionĂˇlne a logickĂ© programovanie). NavrhnutĂ© rieĹˇenie experimentĂˇlne overte.
', 'Pre vzdelĂˇvanie je veÄľmi vĂ˝hodnĂ© vyuĹľiĹĄ ako prezentaÄŤnĂ© mĂ©dium Internet (resp. web) najmĂ¤ vÄŹaka jeho dostupnosti. Aby sme dosiahli ÄŤo najvyĹˇĹˇiu efektĂ­vnosĹĄ uÄŤenia prostrednĂ­ctvom Internetu, je dĂ´leĹľtĂ©, aby sa vĂ˝uÄŤbovĂ˝ systĂ©m dokĂˇzal prispĂ´sobovaĹĄ jednotlivĂ˝m Ĺˇtudentom, resp. skupinĂˇm Ĺˇtudentov. SkĂşmajte vlastnosti adaptĂ­vnych systĂ©mov pre vzdelĂˇvanie, ktorĂ© ako prezentaÄŤnĂ© mĂ©dium vyuĹľĂ­vajĂş Internet (resp. web). VyhodnoĹĄte vyuĹľitie existujĂşceho otvorenĂ©ho systĂ©mu AHA! vydanĂ©ho pod licenciou GNU Public License 2.0 pre vĂ˝uÄŤbu programovania (systĂ©m AHA! je vyvinutĂ˝ modernĂ˝mi technolĂłgiami â€“ Java SDK 1.4, Tomcat web server, XML a ÄŹalĹˇie a je dostupnĂ˝ na adrese http://aha.win.tue.nl). Navrhnite domĂ©novĂ˝ model pre oblasĹĄ programovania a tieĹľ model pouĹľĂ­vateÄľa tak, aby sa systĂ©m dal vyuĹľiĹĄ v predmetoch, kde sa vyuÄŤujĂş zĂˇklady programovania (napr. AlgoritmizĂˇcia a programovanie, FunkcionĂˇlne a logickĂ© programovanie). NavrhnutĂ© rieĹˇenie experimentĂˇlne overte.
', 1);
INSERT INTO projects VALUES (731, 'DP', 382, NULL, 650, '2005/2006', 'AlgoritmickĂˇ chĂ©mia v genetickom programovanĂ­', 'AlgoritmickĂˇ chĂ©mia v genetickom programovanĂ­', NULL, NULL, 1);
INSERT INTO projects VALUES (732, 'ZP', 541, NULL, 651, '2004/2005', 'Interfejs pre identifikĂˇciu pouĹľĂ­vateÄľa', 'Interface for user''s identification', 'Navrhnite  a implementujte interfejs pre identifikĂˇciu pouĹľĂ­vateÄľa. Urobte analĂ˝zu exitujĂşcich prĂ­stupov v tejto oblasti. Navrhnite spĂ´sob identifikĂˇcie pouĹľĂ­vateÄľa na zĂˇklade jeho ĹˇtĂ˝lu prĂˇce s klĂˇvesnicou a myĹˇou. SystĂ©m implementujte v C alebo Jave. Urobte experiment na skupine pouĹľĂ­vateÄľov.', 'Navrhnite  a implementujte interfejs pre identifikĂˇciu pouĹľĂ­vateÄľa. Urobte analĂ˝zu exitujĂşcich prĂ­stupov v tejto oblasti. Navrhnite spĂ´sob identifikĂˇcie pouĹľĂ­vateÄľa na zĂˇklade jeho ĹˇtĂ˝lu prĂˇce s klĂˇvesnicou a myĹˇou. SystĂ©m implementujte v C alebo Jave. Urobte experiment na skupine pouĹľĂ­vateÄľov.', 1);
INSERT INTO projects VALUES (733, 'DP', 655, NULL, 651, '2005/2006', 'Online adaptĂˇcia Echo state neurĂłnovĂ˝ch sietĂ­', 'Online adaptĂˇcia Echo state neurĂłnovĂ˝ch sietĂ­', NULL, NULL, 1);
INSERT INTO projects VALUES (734, 'DP', 357, NULL, 652, '2005/2006', 'SamoopravnĂ© Reed SolomonovĂ© kĂłdy na interaktĂ­vnom webe', 'Error correcting Reed-Solomon codes on interactive web', NULL, NULL, 0);
INSERT INTO projects VALUES (735, 'ZP', 260, NULL, 652, '2003/2004', 'Monitorovanie procesov v operaÄŤnom systĂ©me UNIX', 'Monitoring of processes in operating system UNIX', 'Vytvorte nĂˇstroj, ktorĂ˝ umoĹľnĂ­ sledovaĹĄ aktivitu procesov v operaÄŤnom systĂ©me. PrĂ­kladom informĂˇciĂ­, ktorĂ© je potrebnĂ© zĂ­skaĹĄ mĂ´Ĺľe byĹĄ: kto, kedy a ako spĂşĹˇĹĄa procesy; ktorĂ© procesy a kedy beĹľia v systĂ©me; akĂ© sĂş vzĹĄahy medzi beĹľiacimi procesmi (vzĹĄah rodiÄŤ-potomok, medziprocesovĂˇ komunikĂˇcia, ...); ako sa menĂ­ stav procesu. VĂ˝stupy nĂˇstroja Ĺˇtatisticky spracujte a vytvorte zĂˇklad profilu operaÄŤnĂ©ho systĂ©mu.', 'Vytvorte nĂˇstroj, ktorĂ˝ umoĹľnĂ­ sledovaĹĄ aktivitu procesov v operaÄŤnom systĂ©me. PrĂ­kladom informĂˇciĂ­, ktorĂ© je potrebnĂ© zĂ­skaĹĄ mĂ´Ĺľe byĹĄ: kto, kedy a ako spĂşĹˇĹĄa procesy; ktorĂ© procesy a kedy beĹľia v systĂ©me; akĂ© sĂş vzĹĄahy medzi beĹľiacimi procesmi (vzĹĄah rodiÄŤ-potomok, medziprocesovĂˇ komunikĂˇcia, ...); ako sa menĂ­ stav procesu. VĂ˝stupy nĂˇstroja Ĺˇtatisticky spracujte a vytvorte zĂˇklad profilu operaÄŤnĂ©ho systĂ©mu.', 1);
INSERT INTO projects VALUES (736, 'ZP', 705, NULL, 653, '2004/2005', 'AnalyzĂˇtor logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s hradlovou ĹˇtruktĂşrou', 'Analyzer of combinational circuits with gate structure', 'Treba navrhnĂşĹĄ programovĂ˝ systĂ©m pre analĂ˝zu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s hradlovou ĹˇtruktĂşrou. LogickĂ˝ kombinaÄŤnĂ˝ obvod s viacerĂ˝mi vĂ˝stupmi sa mĂˇ zadĂˇvaĹĄ svojou ĹˇtruktĂşrou. SystĂ©m funkciĂ­, ktorĂ© obvod realizuje,  mĂˇ byĹĄ zapĂ­sanĂ˝  formou mapy, pravdivostnou tabuÄľkou, vektorovĂ˝m a ÄŤĂ­selnĂ˝m zĂˇpisom. ', 'Treba navrhnĂşĹĄ programovĂ˝ systĂ©m pre analĂ˝zu logickĂ˝ch kombinaÄŤnĂ˝ch obvodov s hradlovou ĹˇtruktĂşrou. LogickĂ˝ kombinaÄŤnĂ˝ obvod s viacerĂ˝mi vĂ˝stupmi sa mĂˇ zadĂˇvaĹĄ svojou ĹˇtruktĂşrou. SystĂ©m funkciĂ­, ktorĂ© obvod realizuje,  mĂˇ byĹĄ zapĂ­sanĂ˝  formou mapy, pravdivostnou tabuÄľkou, vektorovĂ˝m a ÄŤĂ­selnĂ˝m zĂˇpisom. ', 0);
INSERT INTO projects VALUES (737, 'DP', 27, NULL, 653, '2005/2006', 'DĂˇtovĂ© sluĹľby pre virtuĂˇlnu realitu', 'DĂˇtovĂ© sluĹľby pre virtuĂˇlnu realitu', NULL, NULL, 0);
INSERT INTO projects VALUES (738, 'ZP', 294, NULL, 654, '2005/2006', 'Simulovanie virtuĂˇlnych objektĂ­vov pri interaktĂ­vnom zobrazovanĂ­ grafovĂ˝ch modelov komplexnĂ˝ch ĹˇtruktĂşr ', 'Simulovanie virtuĂˇlnych objektĂ­vov pri interaktĂ­vnom zobrazovanĂ­ grafovĂ˝ch modelov komplexnĂ˝ch ĹˇtruktĂşr ', 'Urobte reĹˇerĹˇ, vĂ˝ber, analĂ˝zu moĹľnostĂ­ navigĂˇcie, navrhnite a implementujte systĂ©m pre interaktĂ­vne zobrazovanie grafovĂ˝ch reprezentĂˇciĂ­ komplexnĂ˝ch ĹˇtruktĂşr napr.  hyperdokumentov  vo forme premietania pomocou rĂ´znych simulovanĂ˝ch objektĂ­vov naprĂ­klad rybieho oka. SystĂ©m musĂ­ umoĹľĹovaĹĄ popis grafu, definovanie topolĂłgie a vzhÄľadu, popis uzlov a hrĂˇn grafu, definovanie citlivĂ˝ch bodov a navigĂˇciu pomocou ukĂˇzania na citlivĂş plochu (hyperlink) a stlaÄŤenia tlaÄŤĂ­tka myĹˇi, jednoduchĂ© a rĂ˝chle ovlĂˇdanie bodu pozorovateÄľa ako aj zmenu Ăşrovne detailu. Analyzujte moĹľnosti realizĂˇcie zmeny Ăşrovne detailu, pomocou vrstiev virtuĂˇlnej gule prechodom z jednej vrsty na inĂş.

 ', 'Urobte reĹˇerĹˇ, vĂ˝ber, analĂ˝zu moĹľnostĂ­ navigĂˇcie, navrhnite a implementujte systĂ©m pre interaktĂ­vne zobrazovanie grafovĂ˝ch reprezentĂˇciĂ­ komplexnĂ˝ch ĹˇtruktĂşr napr.  hyperdokumentov  vo forme premietania pomocou rĂ´znych simulovanĂ˝ch objektĂ­vov naprĂ­klad rybieho oka. SystĂ©m musĂ­ umoĹľĹovaĹĄ popis grafu, definovanie topolĂłgie a vzhÄľadu, popis uzlov a hrĂˇn grafu, definovanie citlivĂ˝ch bodov a navigĂˇciu pomocou ukĂˇzania na citlivĂş plochu (hyperlink) a stlaÄŤenia tlaÄŤĂ­tka myĹˇi, jednoduchĂ© a rĂ˝chle ovlĂˇdanie bodu pozorovateÄľa ako aj zmenu Ăşrovne detailu. Analyzujte moĹľnosti realizĂˇcie zmeny Ăşrovne detailu, pomocou vrstiev virtuĂˇlnej gule prechodom z jednej vrsty na inĂş.

 ', 1);
INSERT INTO projects VALUES (739, 'ZP', 294, NULL, 656, '2003/2004', 'DistribuovanĂ© simulaÄŤnĂ© prostredie zaloĹľenĂ© na technike Web3D', 'DistribuovanĂ© simulaÄŤnĂ© prostredie zaloĹľenĂ© na technike Web3D', 'Urobte reĹˇerĹˇ publikĂˇciĂ­, naĹˇtudujte a urobte analĂ˝zu existujĂşcich systĂ©mov pri distribuovanĂş simulĂˇciu pohybu 3D modelov v distribuovanom  prostredĂ­ Web3D zaloĹľenom na VRML a prĂ­buznĂ˝ch systĂ©mov virtuĂˇlnej reality pre internet. Adaptujete niektorĂ© z voÄľne dostupnĂ˝ch prostredĂ­ a urobte experimenty s jednoduchou scĂ©nou tak aby mohli objekty scĂ©ny ovlĂˇdaĹĄ viacerĂ© osoby z rĂ´znych klientskĂ˝ch poÄŤĂ­taÄŤov. Realizujte  s adaptovanĂ˝m  a modifikovanĂ˝m alebo vlastne vyvinutĂ˝m prostredĂ­m jednoduchĂş aplikĂˇciu zameranĂş na e-Learning, naprĂ­klad kooperatĂ­vne experimenty vo virtuĂˇlnom laboratĂłriu', 'Urobte reĹˇerĹˇ publikĂˇciĂ­, naĹˇtudujte a urobte analĂ˝zu existujĂşcich systĂ©mov pri distribuovanĂş simulĂˇciu pohybu 3D modelov v distribuovanom  prostredĂ­ Web3D zaloĹľenom na VRML a prĂ­buznĂ˝ch systĂ©mov virtuĂˇlnej reality pre internet. Adaptujete niektorĂ© z voÄľne dostupnĂ˝ch prostredĂ­ a urobte experimenty s jednoduchou scĂ©nou tak aby mohli objekty scĂ©ny ovlĂˇdaĹĄ viacerĂ© osoby z rĂ´znych klientskĂ˝ch poÄŤĂ­taÄŤov. Realizujte  s adaptovanĂ˝m  a modifikovanĂ˝m alebo vlastne vyvinutĂ˝m prostredĂ­m jednoduchĂş aplikĂˇciu zameranĂş na e-Learning, naprĂ­klad kooperatĂ­vne experimenty vo virtuĂˇlnom laboratĂłriu', 1);
INSERT INTO projects VALUES (740, 'DP', 294, NULL, 656, '2005/2006', 'DistribuovanĂ© simulaÄŤnĂ© prostredie zaloĹľenĂ© na technike Web3D  a Java', 'Distributed simulation environment based on Web3D and Java techniques', NULL, NULL, 1);
INSERT INTO projects VALUES (741, 'ZP', 359, NULL, 657, '2005/2006', 'ProgramovĂˇ podpora pre vĂ˝uÄŤbu poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'ProgramovĂˇ podpora pre vĂ˝uÄŤbu poÄŤĂ­taÄŤovĂ˝ch sietĂ­', 'Analyzujte CLI prostredie v CISCO smerovaÄŤoch. Navrhnite a implementujte programovĂ˝ systĂ©m, ktorĂ˝ bude simulovaĹĄ ÄŤinnosĹĄ CISCO smerovaÄŤa pre vybranĂş skupinu prĂ­kazov. SystĂ©m mĂˇ umoĹľĹiĹĄ trĂ©novanie konfigurovania smerovaÄŤov v prostredĂ­ OS Windows. ', 'Analyzujte CLI prostredie v CISCO smerovaÄŤoch. Navrhnite a implementujte programovĂ˝ systĂ©m, ktorĂ˝ bude simulovaĹĄ ÄŤinnosĹĄ CISCO smerovaÄŤa pre vybranĂş skupinu prĂ­kazov. SystĂ©m mĂˇ umoĹľĹiĹĄ trĂ©novanie konfigurovania smerovaÄŤov v prostredĂ­ OS Windows. ', 0);
INSERT INTO projects VALUES (742, 'ZP', 360, NULL, 658, '2005/2006', 'Zobrazenie Ăşdajov v poÄŤĂ­taÄŤi', 'Zobrazenie Ăşdajov v poÄŤĂ­taÄŤi', 'Analyzujte problematiku poziÄŤnĂ˝ch ÄŤĂ­selnĂ˝ch sĂşstav a zobrazenia Ăşdajov v poÄŤĂ­taÄŤi.
Navrhnite a implementujte demonĹˇtraÄŤnĂ˝ a vĂ˝uÄŤbovĂ˝ systĂ©m pouĹľiteÄľnĂ˝  na vĂ˝uÄŤbu prevodov medzi ÄŤĂ­selnĂ˝mi sĂşstavami, zobrazovania Ăşdajov v poÄŤĂ­taÄŤi a celoÄŤĂ­selnej aritmetiky v dvojkovej ÄŤĂ­selnej sĂşstave. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
MĂˇ byĹĄ funkÄŤnĂ˝  v textovom reĹľime pod ÄľubovoÄľnĂ˝m operaÄŤnĂ˝m systĂ©mom.
', 'Analyzujte problematiku poziÄŤnĂ˝ch ÄŤĂ­selnĂ˝ch sĂşstav a zobrazenia Ăşdajov v poÄŤĂ­taÄŤi.
Navrhnite a implementujte demonĹˇtraÄŤnĂ˝ a vĂ˝uÄŤbovĂ˝ systĂ©m pouĹľiteÄľnĂ˝  na vĂ˝uÄŤbu prevodov medzi ÄŤĂ­selnĂ˝mi sĂşstavami, zobrazovania Ăşdajov v poÄŤĂ­taÄŤi a celoÄŤĂ­selnej aritmetiky v dvojkovej ÄŤĂ­selnej sĂşstave. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
MĂˇ byĹĄ funkÄŤnĂ˝  v textovom reĹľime pod ÄľubovoÄľnĂ˝m operaÄŤnĂ˝m systĂ©mom.
', 0);
INSERT INTO projects VALUES (743, 'ZP', 660, NULL, 659, '2002/2003', 'CSIDC', 'Computer Society International Design Competition', NULL, NULL, 0);
INSERT INTO projects VALUES (744, 'DP', 436, NULL, 659, '2005/2006', 'NĂˇvrh a implementĂˇcia programovej podpory pre modelovanie a verifikĂˇciu vnorenĂ˝ch systĂ©mov v jazyku UML', 'NĂˇvrh a implementĂˇcia programovej podpory pre modelovanie a verifikĂˇciu vnorenĂ˝ch systĂ©mov v jazyku UML', NULL, NULL, 0);
INSERT INTO projects VALUES (745, 'DP', 27, NULL, 661, '2005/2006', 'OptickĂˇ orientĂˇcia v meste a v budovĂˇch', 'Optical orientation in the city and in buildings', NULL, NULL, 1);
INSERT INTO projects VALUES (746, 'ZP', 27, NULL, 661, '2003/2004', 'OptickĂˇ orientĂˇcia v mestskom centre', 'Optical orientation in the centre of city', 'Analyzujte dostupnĂ© metĂłdy pre optickĂş orientĂˇciu v priestore (tracking). Navrhnite a realizujte jednoduchĂ˝ prĂ­klad s pouĹľitĂ­m snĂ­mok reĂˇlneho okolia v centre mesta. Pri realizĂˇcii vyuĹľite jednotnĂ˝ grafickĂ˝ vzhÄľad domovĂ˝ch ÄŤĂ­siel, tabuliek s nĂˇzvami ulĂ­c a prĂ­padne inĂ˝ch orientaÄŤnĂ˝ch objektov.', 'Analyzujte dostupnĂ© metĂłdy pre optickĂş orientĂˇciu v priestore (tracking). Navrhnite a realizujte jednoduchĂ˝ prĂ­klad s pouĹľitĂ­m snĂ­mok reĂˇlneho okolia v centre mesta. Pri realizĂˇcii vyuĹľite jednotnĂ˝ grafickĂ˝ vzhÄľad domovĂ˝ch ÄŤĂ­siel, tabuliek s nĂˇzvami ulĂ­c a prĂ­padne inĂ˝ch orientaÄŤnĂ˝ch objektov.', 1);
INSERT INTO projects VALUES (747, 'ZP', 655, NULL, 662, '2004/2005', 'NeurĂłnovĂ© siete a evoluÄŤnĂ© algoritmy', 'Neural networks and evolutionary algorithms', 'NeurĂłnovĂ© siete a evoluÄŤnĂ© algoritmy sa v poslednom obdobĂ­ stali populĂˇrne najmĂ¤ na rieĹˇenie problĂ©mov v oblastiach, kde klasickĂ© prĂ­stupy a znĂˇme algoritmy zlyhĂˇvajĂş. NaĹˇtudujte problematiku evoluÄŤnĂ˝ch algoritmov najmĂ¤ s ohÄľadom na moĹľnosĹĄ ich aplikovania v oblasti neurĂłnovĂ˝ch sietĂ­. Navrhnite a implementujte program (simulĂˇtor) umoĹľĹujĂşci pri trĂ©novanĂ­ neurĂłnovej siete evolĂşciou zĂˇroveĹ vyvĂ­jaĹĄ a upravovaĹĄ aj jej topolĂłgiu. VytvorenĂ© rieĹˇenie overte na zvolenom problĂ©me.', 'NeurĂłnovĂ© siete a evoluÄŤnĂ© algoritmy sa v poslednom obdobĂ­ stali populĂˇrne najmĂ¤ na rieĹˇenie problĂ©mov v oblastiach, kde klasickĂ© prĂ­stupy a znĂˇme algoritmy zlyhĂˇvajĂş. NaĹˇtudujte problematiku evoluÄŤnĂ˝ch algoritmov najmĂ¤ s ohÄľadom na moĹľnosĹĄ ich aplikovania v oblasti neurĂłnovĂ˝ch sietĂ­. Navrhnite a implementujte program (simulĂˇtor) umoĹľĹujĂşci pri trĂ©novanĂ­ neurĂłnovej siete evolĂşciou zĂˇroveĹ vyvĂ­jaĹĄ a upravovaĹĄ aj jej topolĂłgiu. VytvorenĂ© rieĹˇenie overte na zvolenom problĂ©me.', 1);
INSERT INTO projects VALUES (748, 'DP', 655, NULL, 662, '2005/2006', 'NeuroevolĂşcia cez rozĹˇirovanie topolĂłgie', 'NeuroevolĂşcia cez rozĹˇirovanie topolĂłgie', NULL, NULL, 1);
INSERT INTO projects VALUES (749, 'DP', 25, NULL, 663, '2005/2006', 'KoncentrĂˇtor sĂ©riovĂ˝ch rozhranĂ­', 'Serial interface concentrator', NULL, NULL, 0);
INSERT INTO projects VALUES (750, 'ZP', 25, NULL, 663, '2003/2004', 'AutentifikĂˇcia pouĹľĂ­vateÄľov ÄŤipovĂ˝mi kartami', 'Chip card user authentication', 'Analyzujte moĹľnosti vyuĹľitia identifikaÄŤnĂ˝ch ÄŤipovĂ˝ch kariet pri autentifikĂˇcii pouĹľĂ­vateÄľov z pohÄľadu operaÄŤnĂ©ho systĂ©mu. Navrhnite a implementujte perifĂ©rne zariadenie umoĹľĹujĂşce naÄŤĂ­tanĂ˝ kĂłd z bezpeÄŤnostnĂ˝ch kariet cez vhodnĂ© rozhranie (napr. USB) preniesĹĄ bezpeÄŤnĂ˝m a spoÄľahlivĂ˝m spĂ´sobom do poÄŤĂ­taÄŤa, ako aj ovlĂˇdaÄŤ pre operaÄŤnĂ˝ systĂ©m umoĹľĹujĂşci prĂˇcu so zariadenĂ­m vyĹˇĹˇĂ­m vrstvĂˇm. CelĂ˝ systĂ©m  otestujte so zameranĂ­m na funkÄŤnosĹĄ a bezpeÄŤnosĹĄ.', 'Analyzujte moĹľnosti vyuĹľitia identifikaÄŤnĂ˝ch ÄŤipovĂ˝ch kariet pri autentifikĂˇcii pouĹľĂ­vateÄľov z pohÄľadu operaÄŤnĂ©ho systĂ©mu. Navrhnite a implementujte perifĂ©rne zariadenie umoĹľĹujĂşce naÄŤĂ­tanĂ˝ kĂłd z bezpeÄŤnostnĂ˝ch kariet cez vhodnĂ© rozhranie (napr. USB) preniesĹĄ bezpeÄŤnĂ˝m a spoÄľahlivĂ˝m spĂ´sobom do poÄŤĂ­taÄŤa, ako aj ovlĂˇdaÄŤ pre operaÄŤnĂ˝ systĂ©m umoĹľĹujĂşci prĂˇcu so zariadenĂ­m vyĹˇĹˇĂ­m vrstvĂˇm. CelĂ˝ systĂ©m  otestujte so zameranĂ­m na funkÄŤnosĹĄ a bezpeÄŤnosĹĄ.', 0);
INSERT INTO projects VALUES (751, 'DP', 660, NULL, 664, '2005/2006', 'IdentifikĂˇcia a manaĹľment zmien ontolĂłgiĂ­', 'Identification and management of ontology changes', NULL, NULL, 1);
INSERT INTO projects VALUES (752, 'ZP', 437, NULL, 664, '2003/2004', 'SoftvĂ©r ako vĂ˝sledok technickej tvorivej duĹˇevnej ÄŤinnosti', 'Software as the result of technical creative mentation', 'UveÄŹte pojem softvĂ©r z pohÄľadu technickĂ©ho aj prĂˇvneho, priÄŤom uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Vysvetlite, akĂ© sĂş prĂˇva na softvĂ©r, ÄŤo je to ochrana takĂ˝chto prĂˇv, preÄŤo treba takĂ©to prĂˇva chrĂˇniĹĄ s dĂ´razom na etickĂ© a spoloÄŤenskĂ© sĂşvislosti. OpĂ­Ĺˇte znĂˇme prĂˇvne rieĹˇenia ochrany softvĂ©ru, priÄŤom opĂ¤ĹĄ uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Analyzujte sĂşÄŤasnĂ˝ stav, pomenujte prĂ­padnĂ© otvorenĂ© problĂ©my a naznaÄŤte moĹľnosti ich rieĹˇenia. O celej problematike vytvorte tĂ©matickĂ© pavuÄŤinovĂ© sĂ­dlo, ktorĂ© bude slĂşĹľiĹĄ ako zdroj informĂˇciĂ­ aj odkazov na ne. ', 'UveÄŹte pojem softvĂ©r z pohÄľadu technickĂ©ho aj prĂˇvneho, priÄŤom uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Vysvetlite, akĂ© sĂş prĂˇva na softvĂ©r, ÄŤo je to ochrana takĂ˝chto prĂˇv, preÄŤo treba takĂ©to prĂˇva chrĂˇniĹĄ s dĂ´razom na etickĂ© a spoloÄŤenskĂ© sĂşvislosti. OpĂ­Ĺˇte znĂˇme prĂˇvne rieĹˇenia ochrany softvĂ©ru, priÄŤom opĂ¤ĹĄ uvaĹľujte nielen slovenskĂ˝ prĂˇvny systĂ©m, ale aj inonĂˇrodnĂ© a medzinĂˇrodnĂ© prĂˇvne Ăşpravy. Analyzujte sĂşÄŤasnĂ˝ stav, pomenujte prĂ­padnĂ© otvorenĂ© problĂ©my a naznaÄŤte moĹľnosti ich rieĹˇenia. O celej problematike vytvorte tĂ©matickĂ© pavuÄŤinovĂ© sĂ­dlo, ktorĂ© bude slĂşĹľiĹĄ ako zdroj informĂˇciĂ­ aj odkazov na ne. ', 1);
INSERT INTO projects VALUES (753, 'ZP', 27, NULL, 665, '2002/2003', 'Ĺ tĂşdia aplikĂˇciĂ­ objektovo orientovanĂ©ho operaÄŤnĂ©ho systĂ©mu', 'Study of applications of objectâ€“oriented operating system', NULL, NULL, 1);
INSERT INTO projects VALUES (754, 'DP', 27, NULL, 665, '2005/2006', 'PrĂ­spevok ku grafickĂ©mu softvĂ©ru pre mobilnĂ© zariadenia', 'Improvements on a graphics engine for mobile devices', NULL, NULL, 1);
INSERT INTO projects VALUES (755, 'ZP', 436, NULL, 666, '2004/2005', 'TransformaÄŤnĂ˝ program zĂˇpisu ĹˇpecifikĂˇcie sprĂˇvania digitĂˇlneho subsystĂ©mu  do jazyka C jeho softvĂ©rovej implementĂˇcii', 'Program for transformation record of specification for behavior digital subsystem to language C in software implementation', 'Navrhnite a implementujte transformaÄŤnĂ˝ program zo zĂˇpisu formĂˇlnej ĹˇpecifikĂˇcie sprĂˇvania synchrĂłnneho digitĂˇlneho systĂ©mu na Ăşrovni registrovĂ˝ch prenosov (t.j. na Ăşrovni abstrakcie RTL) do jazyka C. PredpokladĂˇ sa, Ĺľe vstupnĂ˝ zĂˇpis ĹˇpecifikĂˇcie obsahuje iba elementĂˇrne operĂˇcie (mikrooperĂˇcie) nad obsahmi registrov  (+,-,., and a pod.) a jeden sekvenÄŤnĂ˝  proces. Ĺ pecifikĂˇcia je zadanĂˇ v jazyku VHDL.  ', 'Navrhnite a implementujte transformaÄŤnĂ˝ program zo zĂˇpisu formĂˇlnej ĹˇpecifikĂˇcie sprĂˇvania synchrĂłnneho digitĂˇlneho systĂ©mu na Ăşrovni registrovĂ˝ch prenosov (t.j. na Ăşrovni abstrakcie RTL) do jazyka C. PredpokladĂˇ sa, Ĺľe vstupnĂ˝ zĂˇpis ĹˇpecifikĂˇcie obsahuje iba elementĂˇrne operĂˇcie (mikrooperĂˇcie) nad obsahmi registrov  (+,-,., and a pod.) a jeden sekvenÄŤnĂ˝  proces. Ĺ pecifikĂˇcia je zadanĂˇ v jazyku VHDL.  ', 1);
INSERT INTO projects VALUES (756, 'DP', 95, NULL, 666, '2005/2006', 'Podpora vyuÄŤovania MaPĹ  - verifikĂˇcia', 'Podpora vyuÄŤovania MaPĹ  - verifikĂˇcia', NULL, NULL, 1);
INSERT INTO projects VALUES (757, 'DP', 16, NULL, 667, '2005/2006', 'IntegrĂˇcia modelovania vlastnostĂ­ do UML', 'Integrating Feature Modeling into UML', NULL, NULL, 1);
INSERT INTO projects VALUES (758, 'ZP', 433, NULL, 667, '2003/2004', 'VyhÄľadĂˇvanie a navigĂˇcia v priestore zĂˇvereÄŤnĂ˝ch prĂˇc', 'VyhÄľadĂˇvanie a navigĂˇcia v priestore zĂˇvereÄŤnĂ˝ch prĂˇc', 'EfektĂ­vne vyhÄľadĂˇvanie relevantnĂ˝ch informĂˇciĂ­ a navigĂˇcia v rozsiahlych informaÄŤnĂ˝ch priestoroch predstavuje dnes jeden z aktuĂˇlnych problĂ©mov. Analyzujte moĹľnosti vyhÄľadĂˇvania a navigĂˇcie v uzavretom informaÄŤnom priestore, v ktorom sa nachĂˇdzajĂş abstrakty a texty zĂˇvereÄŤnĂ˝ch prĂˇc (bakalĂˇrskeho aj inĹľinierskeho ĹˇtĂşdia). VyuĹľite pri tom informaÄŤnĂş bĂˇzu vytvĂˇranĂş v systĂ©me FEIPRO, ktorĂ˝ bol prvĂ˝krĂˇt nasadenĂ˝ v akademickom roku 2002/2003 pre zĂˇvereÄŤnĂ© projekty bakalĂˇrskeho ĹˇtĂşdia. ÄŽalej analyzujte moĹľnosti vyhÄľadĂˇvania a navigĂˇcie v priestore zĂˇvereÄŤnĂ˝ch prĂˇc na zĂˇklade rĂ´znych poĹľiadaviek pouĹľĂ­vateÄľa. Navrhnite vhodnĂş alternatĂ­vnu reprezentĂˇciu takĂ©hoto informaÄŤnĂ©ho priestoru so zameranĂ­m na efektĂ­vne vyhÄľadĂˇvanie a navigĂˇciu. Pri vyhÄľadĂˇvanĂ­ a odporĂşÄŤanĂ­ zĂˇvereÄŤnĂ˝ch prĂˇc mĂ´Ĺľe poslĂşĹľiĹĄ aj obsah posudkov na vybranĂ© prĂˇce. SkĂşmajte moĹľnosti vyuĹľitia sĂ©mantiky informĂˇciĂ­ v informaÄŤnej bĂˇze. UvaĹľujte pri tom pravidelnĂ© dopÄşĹanie prĂˇc do informaÄŤnĂ©ho priestoru. NavrhnutĂ© rieĹˇenie overte vytvorenĂ­m softvĂ©rovĂ©ho prototypu systĂ©mu na vyhÄľadĂˇvanie a odporĂşÄŤanie zĂˇvereÄŤnĂ˝ch prĂˇc.', 'EfektĂ­vne vyhÄľadĂˇvanie relevantnĂ˝ch informĂˇciĂ­ a navigĂˇcia v rozsiahlych informaÄŤnĂ˝ch priestoroch predstavuje dnes jeden z aktuĂˇlnych problĂ©mov. Analyzujte moĹľnosti vyhÄľadĂˇvania a navigĂˇcie v uzavretom informaÄŤnom priestore, v ktorom sa nachĂˇdzajĂş abstrakty a texty zĂˇvereÄŤnĂ˝ch prĂˇc (bakalĂˇrskeho aj inĹľinierskeho ĹˇtĂşdia). VyuĹľite pri tom informaÄŤnĂş bĂˇzu vytvĂˇranĂş v systĂ©me FEIPRO, ktorĂ˝ bol prvĂ˝krĂˇt nasadenĂ˝ v akademickom roku 2002/2003 pre zĂˇvereÄŤnĂ© projekty bakalĂˇrskeho ĹˇtĂşdia. ÄŽalej analyzujte moĹľnosti vyhÄľadĂˇvania a navigĂˇcie v priestore zĂˇvereÄŤnĂ˝ch prĂˇc na zĂˇklade rĂ´znych poĹľiadaviek pouĹľĂ­vateÄľa. Navrhnite vhodnĂş alternatĂ­vnu reprezentĂˇciu takĂ©hoto informaÄŤnĂ©ho priestoru so zameranĂ­m na efektĂ­vne vyhÄľadĂˇvanie a navigĂˇciu. Pri vyhÄľadĂˇvanĂ­ a odporĂşÄŤanĂ­ zĂˇvereÄŤnĂ˝ch prĂˇc mĂ´Ĺľe poslĂşĹľiĹĄ aj obsah posudkov na vybranĂ© prĂˇce. SkĂşmajte moĹľnosti vyuĹľitia sĂ©mantiky informĂˇciĂ­ v informaÄŤnej bĂˇze. UvaĹľujte pri tom pravidelnĂ© dopÄşĹanie prĂˇc do informaÄŤnĂ©ho priestoru. NavrhnutĂ© rieĹˇenie overte vytvorenĂ­m softvĂ©rovĂ©ho prototypu systĂ©mu na vyhÄľadĂˇvanie a odporĂşÄŤanie zĂˇvereÄŤnĂ˝ch prĂˇc.', 1);
INSERT INTO projects VALUES (759, 'DP', 563, NULL, 668, '2005/2006', 'SimulĂˇtor technologickĂ©ho zariadenia ', 'Simulator of a technological system', NULL, NULL, 0);
INSERT INTO projects VALUES (760, 'ZP', 563, NULL, 668, '2003/2004', 'ExperimentĂˇlny mikropoÄŤĂ­taÄŤ', 'Experimental microcomputer', 'Navrhnite a zrealizujte experimentĂˇlny mikropoÄŤĂ­taÄŤ s nasledovnĂ˝mi poĹľiadavkami:

-  mikroprocesor 80386EX
-  8-bitovĂˇ pamĂ¤ĹĄ EPROM 64 kB
- 16-bitovĂˇ pamĂ¤ĹĄ EPROM 128 kB
- 16-bitovĂˇ pamĂ¤ĹĄ RWM 64 kB
- 2 sĂ©riovĂ© rozhrania RS232C
- 8-bitovĂ˝ vstupnĂ˝ a 8-bitovĂ˝ vĂ˝stupnĂ˝ paralelnĂ˝ port s indikĂˇciou,  oddelenĂ˝ optoÄŤlenmi
- 6-miestny displej
- moĹľnosĹĄ generovania ĹľiadostĂ­ o preruĹˇenie tlaÄŤidlami
- moĹľnosĹĄ krokovania programu po strojovĂ˝ch cykloch cez stav WAIT procesora
', 'Navrhnite a zrealizujte experimentĂˇlny mikropoÄŤĂ­taÄŤ s nasledovnĂ˝mi poĹľiadavkami:

-  mikroprocesor 80386EX
-  8-bitovĂˇ pamĂ¤ĹĄ EPROM 64 kB
- 16-bitovĂˇ pamĂ¤ĹĄ EPROM 128 kB
- 16-bitovĂˇ pamĂ¤ĹĄ RWM 64 kB
- 2 sĂ©riovĂ© rozhrania RS232C
- 8-bitovĂ˝ vstupnĂ˝ a 8-bitovĂ˝ vĂ˝stupnĂ˝ paralelnĂ˝ port s indikĂˇciou,  oddelenĂ˝ optoÄŤlenmi
- 6-miestny displej
- moĹľnosĹĄ generovania ĹľiadostĂ­ o preruĹˇenie tlaÄŤidlami
- moĹľnosĹĄ krokovania programu po strojovĂ˝ch cykloch cez stav WAIT procesora
', 0);
INSERT INTO projects VALUES (761, 'DP', 260, NULL, 669, '2005/2006', 'Tvorba poradovnĂ­ka s vyuĹľitĂ­m biometrickĂ˝ch Ăşdajov', 'Development of list with use of biometric data', NULL, NULL, 1);
INSERT INTO projects VALUES (762, 'ZP', 20, NULL, 669, '2003/2004', 'ArchitekturĂˇlny bias rekurentnĂ˝ch neurĂłnovĂ˝ch sietĂ­', 'Architectural bias of reccurent neural networks', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch doprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasovou ĹˇtruktĂşrou. RekurentnĂ© siete inicializovanĂ© s malĂ˝mi vĂˇhami vykazujĂş pri spracovanĂ­ postupnostĂ­ symbolov vlastnosti markovovskĂ˝ch modelov â€“ ich stavovĂ˝ priestor odrĂˇĹľa histĂłriu symbolov prezentovanĂ˝ch sieti. TĂşto vlastnosĹĄ vyplĂ˝vajĂşcu z architektĂşry rekurentnej siete nazĂ˝vame architekturĂˇlny bias.
CieÄľom projektu je vytvorenie simulaÄŤnĂ©ho nĂˇstroja umoĹľĹujĂşceho vizualizovaĹĄ stavovĂş ÄŤasĹĄ rekurentnej neurĂłnovej siete. NĂˇsledne, na zvolenĂ˝ch postupnostiach symbolov, je potrebnĂ© ukĂˇzaĹĄ schopnosĹĄ stavovĂ©ho priestoru siete odrĂˇĹľaĹĄ histĂłriu vstupnĂ˝ch symbolov. DĂ´raz je potrebnĂ© klĂˇsĹĄ na prezentaÄŤnĂş funkciu simulaÄŤnĂ©ho nĂˇstroja a zvĂˇĹľiĹĄ jeho realizĂˇciu napr. ako Java apletu. 
', 'RekurentnĂ© neurĂłnovĂ© siete sĂş na rozdiel od klasickĂ˝ch doprednĂ˝ch neurĂłnovĂ˝ch sietĂ­ schopnĂ© spracovĂˇvaĹĄ vstupy s ÄŤasovou ĹˇtruktĂşrou. RekurentnĂ© siete inicializovanĂ© s malĂ˝mi vĂˇhami vykazujĂş pri spracovanĂ­ postupnostĂ­ symbolov vlastnosti markovovskĂ˝ch modelov â€“ ich stavovĂ˝ priestor odrĂˇĹľa histĂłriu symbolov prezentovanĂ˝ch sieti. TĂşto vlastnosĹĄ vyplĂ˝vajĂşcu z architektĂşry rekurentnej siete nazĂ˝vame architekturĂˇlny bias.
CieÄľom projektu je vytvorenie simulaÄŤnĂ©ho nĂˇstroja umoĹľĹujĂşceho vizualizovaĹĄ stavovĂş ÄŤasĹĄ rekurentnej neurĂłnovej siete. NĂˇsledne, na zvolenĂ˝ch postupnostiach symbolov, je potrebnĂ© ukĂˇzaĹĄ schopnosĹĄ stavovĂ©ho priestoru siete odrĂˇĹľaĹĄ histĂłriu vstupnĂ˝ch symbolov. DĂ´raz je potrebnĂ© klĂˇsĹĄ na prezentaÄŤnĂş funkciu simulaÄŤnĂ©ho nĂˇstroja a zvĂˇĹľiĹĄ jeho realizĂˇciu napr. ako Java apletu. 
', 1);
INSERT INTO projects VALUES (763, 'ZP', 297, NULL, 671, '2005/2006', 'NĂˇvrh dĂˇtovĂ©ho modelu', 'NĂˇvrh dĂˇtovĂ©ho modelu', 'Vykonajte analĂ˝zu metĂłd modelovania dĂˇt pre databĂˇzovĂ© spracovanie. Vytvorte prostriedok , ktorĂ˝ podla zvolenej metĂłdy modelovania dĂˇt vygeneruje vhodnĂ˝ nĂˇvrh dĂˇtovĂ©ho modelu na Ăşrovni dĂˇtovĂ˝ch tokov. Akceptujte normalizĂˇciu nĂˇvrhu dĂˇtovĂ©ho modelu.', 'Vykonajte analĂ˝zu metĂłd modelovania dĂˇt pre databĂˇzovĂ© spracovanie. Vytvorte prostriedok , ktorĂ˝ podla zvolenej metĂłdy modelovania dĂˇt vygeneruje vhodnĂ˝ nĂˇvrh dĂˇtovĂ©ho modelu na Ăşrovni dĂˇtovĂ˝ch tokov. Akceptujte normalizĂˇciu nĂˇvrhu dĂˇtovĂ©ho modelu.', 1);
INSERT INTO projects VALUES (764, 'ZP', 566, NULL, 675, '2005/2006', 'PouĹľitie neurĂłnovĂ˝ch sietĂ­ k "diĹˇtanÄŤnĂ©mu" riadeniu zloĹľitĂ˝ch systĂ©mov', 'PouĹľitie neurĂłnovĂ˝ch sietĂ­ k "diĹˇtanÄŤnĂ©mu" riadeniu zloĹľitĂ˝ch systĂ©mov', 'Ak stojĂ­me pred problĂ©mom, ako riadiĹĄ nejakĂ˝ zloĹľitĂ˝ systĂ©m, obvykle tento problĂ©m rieĹˇime pomocou modelu "diĹˇtanÄŤnĂ©ho" riadenia, ktorĂ˝ v kognitĂ­vnej vede patrĂ­ medzi zĂˇkladnĂ© modely. V prvej etape si vytvorĂ­me vnĂştornĂ˝ model systĂ©mu, ktorĂ˝ odrĂˇĹľa zĂˇkladnĂ© vlastnosti riadenĂ©ho systĂ©mu. V ÄŹalĹˇej etape uĹľ zloĹľitĂ˝ systĂ©m riadime pomocou tohto modelu.
Podrobnosti prĂ­stupu sĂş uvedenĂ© v kapitole, ktorĂˇ je uvedenĂˇ na adrese
ftp://math.chtf.stuba.sk/pub/vlado/FSEV_Informatika/skripta/pdf_final/Kapitola12.pdf
', 'Ak stojĂ­me pred problĂ©mom, ako riadiĹĄ nejakĂ˝ zloĹľitĂ˝ systĂ©m, obvykle tento problĂ©m rieĹˇime pomocou modelu "diĹˇtanÄŤnĂ©ho" riadenia, ktorĂ˝ v kognitĂ­vnej vede patrĂ­ medzi zĂˇkladnĂ© modely. V prvej etape si vytvorĂ­me vnĂştornĂ˝ model systĂ©mu, ktorĂ˝ odrĂˇĹľa zĂˇkladnĂ© vlastnosti riadenĂ©ho systĂ©mu. V ÄŹalĹˇej etape uĹľ zloĹľitĂ˝ systĂ©m riadime pomocou tohto modelu.
Podrobnosti prĂ­stupu sĂş uvedenĂ© v kapitole, ktorĂˇ je uvedenĂˇ na adrese
ftp://math.chtf.stuba.sk/pub/vlado/FSEV_Informatika/skripta/pdf_final/Kapitola12.pdf
', 1);
INSERT INTO projects VALUES (765, 'ZP', 98, NULL, 676, '2005/2006', 'Spracovanie obrazu', 'Spracovanie obrazu', 'V sĂşÄŤasnosti sa ÄŤasto pracuje s obrĂˇzkami v elekronickej forme vytvorenĂ© v rĂ´znych formĂˇtoch. Nie vĹľdy sĂş tieto obrazovĂ© informĂˇcie v dobrej kvalite. Bolo by dobrĂ© maĹĄ prostriedok, ktorĂ˝ by aspoĹ ÄŤiastoÄŤne zlepĹˇil kvalitu takĂ˝chto informĂˇciĂ­.
Spravte analĂ˝zu problĂ©movej oblasti a na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu, ktorĂˇ bude slĂşĹľiĹĄ na  spracovanie obrazovĂ˝ch informĂˇcii. ', 'V sĂşÄŤasnosti sa ÄŤasto pracuje s obrĂˇzkami v elekronickej forme vytvorenĂ© v rĂ´znych formĂˇtoch. Nie vĹľdy sĂş tieto obrazovĂ© informĂˇcie v dobrej kvalite. Bolo by dobrĂ© maĹĄ prostriedok, ktorĂ˝ by aspoĹ ÄŤiastoÄŤne zlepĹˇil kvalitu takĂ˝chto informĂˇciĂ­.
Spravte analĂ˝zu problĂ©movej oblasti a na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu, ktorĂˇ bude slĂşĹľiĹĄ na  spracovanie obrazovĂ˝ch informĂˇcii. ', 1);
INSERT INTO projects VALUES (766, 'DP', 549, 375, 677, '2004/2005', 'VzdialenĂˇ komunikĂˇcia  s meracĂ­m pracoviskom ', 'VzdialenĂˇ komunikĂˇcia  s meracĂ­m pracoviskom ', NULL, NULL, 0);
INSERT INTO projects VALUES (767, 'ZP', 40, NULL, 678, '2005/2006', 'Objektovo relaÄŤnĂ© mapre pre jazyk JAVA', 'Objektovo relaÄŤnĂ© mapre pre jazyk JAVA', 'NaĹˇtudujte princĂ­py a charakteristiky Objektovo-RelaÄŤnĂ˝ch maprov vo vĹˇeobecnosti. Analyzujte existujĂşce Oâ€“R mapre pre programovacĂ­ jazyk Java. NaĹˇtudujte podrobnosti pre Vami vybranĂ© O-R mapre (min. 2) pre jazyk Java. S vyuĹľitĂ­m vybranĂ˝ch O-R maprov vytvorte jednoduchĂş databĂˇzovĂş aplikĂˇciu, resp. aplikĂˇcie na spoloÄŤnom zĂˇklade. VybranĂ© mapre porovnajte s vyuĹľitĂ­m osobnĂ˝ch skĂşsenostĂ­ zĂ­skanĂ˝ch pri vytvĂˇranĂ­ aplikĂˇcie/aplikĂˇciĂ­.', 'NaĹˇtudujte princĂ­py a charakteristiky Objektovo-RelaÄŤnĂ˝ch maprov vo vĹˇeobecnosti. Analyzujte existujĂşce Oâ€“R mapre pre programovacĂ­ jazyk Java. NaĹˇtudujte podrobnosti pre Vami vybranĂ© O-R mapre (min. 2) pre jazyk Java. S vyuĹľitĂ­m vybranĂ˝ch O-R maprov vytvorte jednoduchĂş databĂˇzovĂş aplikĂˇciu, resp. aplikĂˇcie na spoloÄŤnom zĂˇklade. VybranĂ© mapre porovnajte s vyuĹľitĂ­m osobnĂ˝ch skĂşsenostĂ­ zĂ­skanĂ˝ch pri vytvĂˇranĂ­ aplikĂˇcie/aplikĂˇciĂ­.', 1);
INSERT INTO projects VALUES (768, 'ZP', 98, NULL, 679, '2005/2006', 'AdaptĂ­vna archivĂˇcia informĂˇciĂ­', 'AdaptĂ­vna archivĂˇcia informĂˇciĂ­', 'Pri vytvĂˇranĂ­ prednĂˇĹˇok, seminĂˇrov, workshopov atÄŹ., mĂˇ autor, resp. prednĂˇĹˇateÄľ k dispozĂ­cii informĂˇcie rĂ´zneho typu a formĂˇtov. Pomohlo by mu, keby mal tieto informĂˇcie systematicky uloĹľenĂ© - archivovanĂ©, aby sa mohol Äľahko a rĂ˝chlo k relevantnej informĂˇcii dostaĹĄ. TakĂ˝to adaptĂ­vny archivaÄŤnĂ˝ systĂ©m  informĂˇciĂ­ by slĂşĹľil ako bĂˇza Ăşdajov pre nĂˇstroj na vytvĂˇranie kurzov. 
Spravte analĂ˝zu problematiky a na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu, ktorĂˇ bude slĂşĹľiĹĄ na  ukladanie, archivovanie a spracovanie informĂˇciĂ­. ', 'Pri vytvĂˇranĂ­ prednĂˇĹˇok, seminĂˇrov, workshopov atÄŹ., mĂˇ autor, resp. prednĂˇĹˇateÄľ k dispozĂ­cii informĂˇcie rĂ´zneho typu a formĂˇtov. Pomohlo by mu, keby mal tieto informĂˇcie systematicky uloĹľenĂ© - archivovanĂ©, aby sa mohol Äľahko a rĂ˝chlo k relevantnej informĂˇcii dostaĹĄ. TakĂ˝to adaptĂ­vny archivaÄŤnĂ˝ systĂ©m  informĂˇciĂ­ by slĂşĹľil ako bĂˇza Ăşdajov pre nĂˇstroj na vytvĂˇranie kurzov. 
Spravte analĂ˝zu problematiky a na zĂˇklade analĂ˝zy Ĺˇpecifikujte, navrhnite a vytvorte aplikĂˇciu, ktorĂˇ bude slĂşĹľiĹĄ na  ukladanie, archivovanie a spracovanie informĂˇciĂ­. ', 1);
INSERT INTO projects VALUES (769, 'ZP', 44, NULL, 680, '2005/2006', 'SimulĂˇtor vĂ˝poÄŤtovĂ˝ch zariadenĂ­', 'SimulĂˇtor vĂ˝poÄŤtovĂ˝ch zariadenĂ­', 'KoneÄŤnĂ˝ automat, zĂˇsobnĂ­kovĂ˝ automat a Turingov stroj sĂş tri zĂˇkladnĂ© modely poÄŤĂ­taÄŤov v TeĂłrii formĂˇlnych jazykov a automatov. Predmetom prĂˇce by mala byĹĄ simulĂˇcia tĂ˝chto troch vĂ˝poÄŤtovĂ˝ch zariadenĂ­. SimulĂˇtor mĂˇ maĹĄ grafickĂ© uĹľĂ­vateÄľskĂ© rozhranie.', 'KoneÄŤnĂ˝ automat, zĂˇsobnĂ­kovĂ˝ automat a Turingov stroj sĂş tri zĂˇkladnĂ© modely poÄŤĂ­taÄŤov v TeĂłrii formĂˇlnych jazykov a automatov. Predmetom prĂˇce by mala byĹĄ simulĂˇcia tĂ˝chto troch vĂ˝poÄŤtovĂ˝ch zariadenĂ­. SimulĂˇtor mĂˇ maĹĄ grafickĂ© uĹľĂ­vateÄľskĂ© rozhranie.', 1);
INSERT INTO projects VALUES (770, 'ZP', 447, NULL, 681, '2005/2006', 'Generovanie bibliografickĂ˝ch zĂˇznamov pri pouĹľitĂ­ Ĺˇtandardu DocBook', 'Generovanie bibliografickĂ˝ch zĂˇznamov pri pouĹľitĂ­ Ĺˇtandardu DocBook', 'PreskĂşmajte Ĺˇtandard DocBook (www.docbook.org). Analyzujte sĂşÄŤasnĂ© prostriedky podporujĂşce proces tvorby dokumentov s vyuĹľitĂ­m tohto Ĺˇtandardu, od pĂ­sania samotnĂ˝ch dokumentov, cez ich formĂˇtovanie aĹľ po generovanie vĂ˝slednĂ˝ch dokumentov v cieÄľovej sadzbe. Zamerajte sa pritom na voÄľne dostupnĂ© rieĹˇenia. S pouĹľitĂ­m vhodnej kombinĂˇcie tĂ˝chto prostriedkov vytvorte jednotnĂ© prostredie pre tvorbu dokumentov.
Pri rieĹˇenĂ­ projektu sa tieĹľ zamerajte na Ăşpravu existujĂşcich ĹˇablĂłn pre generovanie bibliografickĂ˝ch zĂˇznamov a citĂˇciĂ­ podÄľa rĂ´znych Ĺˇtandardov (IEEE, ISO, Harvard apod.).', 'PreskĂşmajte Ĺˇtandard DocBook (www.docbook.org). Analyzujte sĂşÄŤasnĂ© prostriedky podporujĂşce proces tvorby dokumentov s vyuĹľitĂ­m tohto Ĺˇtandardu, od pĂ­sania samotnĂ˝ch dokumentov, cez ich formĂˇtovanie aĹľ po generovanie vĂ˝slednĂ˝ch dokumentov v cieÄľovej sadzbe. Zamerajte sa pritom na voÄľne dostupnĂ© rieĹˇenia. S pouĹľitĂ­m vhodnej kombinĂˇcie tĂ˝chto prostriedkov vytvorte jednotnĂ© prostredie pre tvorbu dokumentov.
Pri rieĹˇenĂ­ projektu sa tieĹľ zamerajte na Ăşpravu existujĂşcich ĹˇablĂłn pre generovanie bibliografickĂ˝ch zĂˇznamov a citĂˇciĂ­ podÄľa rĂ´znych Ĺˇtandardov (IEEE, ISO, Harvard apod.).', 1);
INSERT INTO projects VALUES (771, 'ZP', 342, NULL, 682, '2005/2006', 'Prostriedky pre podporu sprĂˇvy cestnĂ˝ch meteorologickĂ˝ch stanĂ­c', 'Prostriedky pre podporu sprĂˇvy cestnĂ˝ch meteorologickĂ˝ch stanĂ­c', 'Analyzujte moĹľnosti technickĂ˝ch a programovĂ˝ch prostriedkov pre  testovanie  a nastavovanie parametrov meteorologickĂ˝ch stanĂ­c vybranĂ©ho typu.
Navrhnite programovĂ© vybavenie podporujĂşce sprĂˇvu, ktorĂ© umoĹľnĂ­ testovaĹĄ, nastavovaĹĄ a vyhodnocovaĹĄ technickĂ˝ stav meteorologickĂ˝ch stanĂ­c vybranĂ©ho typu. Zrealizujte vybranĂş ÄŤasĹĄ navrhnutĂ˝ch programovĂ˝ch prostriedkov.
', 'Analyzujte moĹľnosti technickĂ˝ch a programovĂ˝ch prostriedkov pre  testovanie  a nastavovanie parametrov meteorologickĂ˝ch stanĂ­c vybranĂ©ho typu.
Navrhnite programovĂ© vybavenie podporujĂşce sprĂˇvu, ktorĂ© umoĹľnĂ­ testovaĹĄ, nastavovaĹĄ a vyhodnocovaĹĄ technickĂ˝ stav meteorologickĂ˝ch stanĂ­c vybranĂ©ho typu. Zrealizujte vybranĂş ÄŤasĹĄ navrhnutĂ˝ch programovĂ˝ch prostriedkov.
', 0);
INSERT INTO projects VALUES (772, 'ZP', 382, NULL, 683, '2005/2006', 'Tvorba analĂłgiĂ­', 'Tvorba analĂłgiĂ­', 'V zjednoduĹˇenom prĂ­pade sa zameraĹĄ na primitĂ­vne prĂ­klady analĂłgiĂ­ typu: â€žKeÄŹ sa abc transformuje na abd, ako transformovaĹĄ iijjkk analogickĂ˝m spĂ´sobom?" PrĂˇca bude vychĂˇdzaĹĄ z myĹˇlienkovĂ˝ch princĂ­pov programovĂ˝ch systĂ©mov COPYCAT a METACAT Douglase Hofstadtera a Melanie Mitchell. V prvej etape bude cieÄľom navrhnĂşĹĄ vĂ˝hodnejĹˇĂ­ evoluÄŤnĂ˝ algoritmus pracujĂşci nad agentami spracujĂşcimi analĂłgie, v druhej etape bude cieÄľom vypracovaĹĄ mechanizmus vyrovnĂˇvajĂşci sĂşperenie a spoluprĂˇcu agentov na zĂ­skanie lepĹˇĂ­ch vĂ˝sledkov a nĂˇvrh bayesovskĂ©ho pravdepodobnostnĂ©ho prĂ­stupu na vyhodnotenie kvality predikovanĂ˝ch analĂłgiĂ­. ImplementovaĹĄ navrhnutĂ˝ model a diskutovaĹĄ zĂ­skanĂ© vĂ˝sledky.
', 'V zjednoduĹˇenom prĂ­pade sa zameraĹĄ na primitĂ­vne prĂ­klady analĂłgiĂ­ typu: â€žKeÄŹ sa abc transformuje na abd, ako transformovaĹĄ iijjkk analogickĂ˝m spĂ´sobom?" PrĂˇca bude vychĂˇdzaĹĄ z myĹˇlienkovĂ˝ch princĂ­pov programovĂ˝ch systĂ©mov COPYCAT a METACAT Douglase Hofstadtera a Melanie Mitchell. V prvej etape bude cieÄľom navrhnĂşĹĄ vĂ˝hodnejĹˇĂ­ evoluÄŤnĂ˝ algoritmus pracujĂşci nad agentami spracujĂşcimi analĂłgie, v druhej etape bude cieÄľom vypracovaĹĄ mechanizmus vyrovnĂˇvajĂşci sĂşperenie a spoluprĂˇcu agentov na zĂ­skanie lepĹˇĂ­ch vĂ˝sledkov a nĂˇvrh bayesovskĂ©ho pravdepodobnostnĂ©ho prĂ­stupu na vyhodnotenie kvality predikovanĂ˝ch analĂłgiĂ­. ImplementovaĹĄ navrhnutĂ˝ model a diskutovaĹĄ zĂ­skanĂ© vĂ˝sledky.
', 1);
INSERT INTO projects VALUES (773, 'ZP', 375, NULL, 684, '2005/2006', 'NiekorĂ© vybranĂ© Ăşlohy smerovania v poÄŤĂ­taÄŤovĂ˝ch sieĹĄach', 'NiekorĂ© vybranĂ© Ăşlohy smerovania v poÄŤĂ­taÄŤovĂ˝ch sieĹĄach', 'Analyzujte problematiku smerovania v poÄŤĂ­taÄŤovĂ˝ch sieĹĄach - rĂ´zne algoritmy a stratĂ©gie. Navrhnite a implementujte interaktĂ­vny programovĂ˝ systĂ©m umoĹľĹujĂşci zostaviĹĄ a modifikovaĹĄ grafickĂş reprezentĂˇciu poÄŤĂ­taÄŤovej siete na sieĹĄovej vrstve (prepojovacia sieĹĄ) s moĹľnosĹĄou definovania parametrov uzlov a hrĂˇn. V navrhnutom prostredĂ­ overte a porovnajte niektorĂ© stratĂ©gie a algoritmy smerovania. ', 'Analyzujte problematiku smerovania v poÄŤĂ­taÄŤovĂ˝ch sieĹĄach - rĂ´zne algoritmy a stratĂ©gie. Navrhnite a implementujte interaktĂ­vny programovĂ˝ systĂ©m umoĹľĹujĂşci zostaviĹĄ a modifikovaĹĄ grafickĂş reprezentĂˇciu poÄŤĂ­taÄŤovej siete na sieĹĄovej vrstve (prepojovacia sieĹĄ) s moĹľnosĹĄou definovania parametrov uzlov a hrĂˇn. V navrhnutom prostredĂ­ overte a porovnajte niektorĂ© stratĂ©gie a algoritmy smerovania. ', 0);
INSERT INTO projects VALUES (774, 'ZP', 27, NULL, 685, '2005/2006', 'SimulaÄŤnĂˇ kniĹľnica pre optimalizaÄŤnĂ© algoritmy', 'SimulaÄŤnĂˇ kniĹľnica pre optimalizaÄŤnĂ© algoritmy', '   PreĹˇtudujte zĂˇkladnĂ© deterministickĂ© aj nedeterministickĂ© optimalizaÄŤnĂ© algoritmy. Navrhnite a zrealizujte podpornĂş kniĹľnicu pre pouĹľitie tĂ˝chto algoritmov pri tvorbe aplikĂˇciĂ­. Implementujte vybranĂ© prĂ­klady s vyuĹľitĂ­m tejto kniĹľnice a vyhodnoĹĄte ich vlastnosti.


OdporĂşÄŤanĂˇ literatĂşra:

1. KvasniÄŤka V., PospĂ­chal J., TiĹo P.: EvoluÄŤnĂ© algoritmy. STU Bratislava, 2000, ISBN 80-227-1377-5.

2. KognitĂ­vne vedy, CHTF STU
http://math.chtf.stuba.sk/kog_vedy.htm
', '   PreĹˇtudujte zĂˇkladnĂ© deterministickĂ© aj nedeterministickĂ© optimalizaÄŤnĂ© algoritmy. Navrhnite a zrealizujte podpornĂş kniĹľnicu pre pouĹľitie tĂ˝chto algoritmov pri tvorbe aplikĂˇciĂ­. Implementujte vybranĂ© prĂ­klady s vyuĹľitĂ­m tejto kniĹľnice a vyhodnoĹĄte ich vlastnosti.


OdporĂşÄŤanĂˇ literatĂşra:

1. KvasniÄŤka V., PospĂ­chal J., TiĹo P.: EvoluÄŤnĂ© algoritmy. STU Bratislava, 2000, ISBN 80-227-1377-5.

2. KognitĂ­vne vedy, CHTF STU
http://math.chtf.stuba.sk/kog_vedy.htm
', 1);
INSERT INTO projects VALUES (775, 'ZP', 437, NULL, 686, '2005/2006', 'KatalĂłg nĂˇvrhovĂ˝ch vzorov', 'KatalĂłg nĂˇvrhovĂ˝ch vzorov', 'NĂˇvrhovĂ© vzory sa stĂˇvajĂş dĂ´leĹľitĂ˝m nĂˇstrojom na  vyjadrenie opakujĂşcich sa rieĹˇenĂ­ pri navrhovanĂ­ softvĂ©rovĂ˝ch systĂ©mov. ExistujĂş viacerĂ© sady nĂˇvrhovĂ˝ch vzorov aj viacerĂ© samostatnĂ© vzory. PokĂşste sa ich zhromaĹľdiĹĄ a vytvoriĹĄ jednotnĂ˝ katalĂłg. Navrhnite pre ne vhodnĂ˝ spĂ´sob reprezentĂˇcie. ZvĂˇĹľte pouĹľitie jazyka UML. ', 'NĂˇvrhovĂ© vzory sa stĂˇvajĂş dĂ´leĹľitĂ˝m nĂˇstrojom na  vyjadrenie opakujĂşcich sa rieĹˇenĂ­ pri navrhovanĂ­ softvĂ©rovĂ˝ch systĂ©mov. ExistujĂş viacerĂ© sady nĂˇvrhovĂ˝ch vzorov aj viacerĂ© samostatnĂ© vzory. PokĂşste sa ich zhromaĹľdiĹĄ a vytvoriĹĄ jednotnĂ˝ katalĂłg. Navrhnite pre ne vhodnĂ˝ spĂ´sob reprezentĂˇcie. ZvĂˇĹľte pouĹľitie jazyka UML. ', 1);
INSERT INTO projects VALUES (776, 'ZP', 541, NULL, 687, '2004/2005', 'DispeÄŤerskĂ˝ systĂ©m', 'Dispatching system', 'Vytvorte program pre dispeÄŤerskĂ˝ systĂ©m pre montĂ©rov. JednĂˇ sa o mobilnĂ© zariadenie do auta. MĂˇ GPS a na komunikĂˇciu vyuĹľĂ­va GPRS Orange. MusĂ­ umoĹľĹovaĹĄ sledovaĹĄ polohu auta, robiĹĄ archĂ­v jĂˇzd, zadĂˇvaĹĄ montĂ©rovi Ăşlohy, navigovaĹĄ ho a umoĹľniĹĄ mu komunikovaĹĄ s dispeÄŤerom.', 'Vytvorte program pre dispeÄŤerskĂ˝ systĂ©m pre montĂ©rov. JednĂˇ sa o mobilnĂ© zariadenie do auta. MĂˇ GPS a na komunikĂˇciu vyuĹľĂ­va GPRS Orange. MusĂ­ umoĹľĹovaĹĄ sledovaĹĄ polohu auta, robiĹĄ archĂ­v jĂˇzd, zadĂˇvaĹĄ montĂ©rovi Ăşlohy, navigovaĹĄ ho a umoĹľniĹĄ mu komunikovaĹĄ s dispeÄŤerom.', 1);
INSERT INTO projects VALUES (777, 'DP', 97, NULL, 687, '2005/2006', 'AlternatĂ­vna notĂˇcia pre procesy transformĂˇcie objektovĂ˝ch ĹˇtruktĂşr', 'AlternatĂ­vna notĂˇcia pre procesy transformĂˇcie objektovĂ˝ch ĹˇtruktĂşr', NULL, NULL, 1);
INSERT INTO projects VALUES (778, 'ZP', 433, NULL, 688, '2005/2006', 'Ohodnocovanie softvĂ©rovĂ˝ch systĂ©mov', 'Ohodnocovanie softvĂ©rovĂ˝ch systĂ©mov', 'SoftvĂ©rovĂ© inĹľiniersvo neustĂˇle hÄľadĂˇ novĂ© spĂ´soby merania kvality softvĂ©rovĂ˝ch systĂ©mov. Medzi zĂˇkladnĂ© sledovanĂ© charakteristiky partia zviazanosĹĄ a sĂşdrĹľnosĹĄ. Modelujte zdrojovĂ˝ kĂłd softvĂ©rovĂ©ho systĂ©mu ako graf, ktorĂ©ho uzly predstavujĂş entity objektovo-orientovanej realizĂˇcie systĂ©mu, a ktorĂ©ho hrany reprezentujĂş vĂ¤zby medzi tĂ˝mito entitami. Vytvorte nĂˇstroj, ktorĂ˝ na zĂˇklade analĂ˝zy rozsiahleho softvĂ©rovĂ©ho systĂ©mu zmeria takĂşto reprezentĂˇciu. Pomocou tohto nĂˇstroja vyhodnoĹĄte niekoÄľko rozsiahlejĹˇĂ­ch systĂ©mov s voÄľne dostupnĂ˝m zdrojovĂ˝m kĂłdom.', 'SoftvĂ©rovĂ© inĹľiniersvo neustĂˇle hÄľadĂˇ novĂ© spĂ´soby merania kvality softvĂ©rovĂ˝ch systĂ©mov. Medzi zĂˇkladnĂ© sledovanĂ© charakteristiky partia zviazanosĹĄ a sĂşdrĹľnosĹĄ. Modelujte zdrojovĂ˝ kĂłd softvĂ©rovĂ©ho systĂ©mu ako graf, ktorĂ©ho uzly predstavujĂş entity objektovo-orientovanej realizĂˇcie systĂ©mu, a ktorĂ©ho hrany reprezentujĂş vĂ¤zby medzi tĂ˝mito entitami. Vytvorte nĂˇstroj, ktorĂ˝ na zĂˇklade analĂ˝zy rozsiahleho softvĂ©rovĂ©ho systĂ©mu zmeria takĂşto reprezentĂˇciu. Pomocou tohto nĂˇstroja vyhodnoĹĄte niekoÄľko rozsiahlejĹˇĂ­ch systĂ©mov s voÄľne dostupnĂ˝m zdrojovĂ˝m kĂłdom.', 1);
INSERT INTO projects VALUES (779, 'ZP', 270, NULL, 689, '2005/2006', 'AutomatickĂ© spracovanie informĂˇciĂ­ zĂ­skanĂ˝ch z webovej strĂˇnky', 'AutomatickĂ© spracovanie informĂˇciĂ­ zĂ­skanĂ˝ch z webovej strĂˇnky', 'VyhÄľadĂˇvanie na webe ÄŤasto spoÄŤĂ­va v pracnom prechĂˇdzanĂ­ jednotlivĂ˝ch strĂˇnok, ktorĂ© obsahujĂş pouĹľĂ­vateÄľom poĹľadovanĂ© informĂˇcie. V tomto ohÄľade by bol uĹľitoÄŤnĂ˝ nĂˇstroj, ktorĂ˝ webovĂ© strĂˇnky prehÄľadĂˇ, vyberie z nich potrebnĂ© informĂˇcie a ponĂşkne ich pouĹľĂ­vateÄľovi. 
CieÄľom prĂˇce je nĂˇvrh nĂˇstroja, ktorĂ˝ spracuje vĂ˝sledky vyhÄľadĂˇvania z viacerĂ˝ch strĂˇnok podobnĂ©ho zamerania, extrahuje z nich relevantnĂ© informĂˇcie, integruje ich a vhodne prezentuje pouĹľĂ­vateÄľovi. NavrhnutĂ˝ systĂ©m experimentĂˇlne overte pre oblasĹĄ trhu pracovnĂ˝ch prĂ­leĹľitostĂ­.', 'VyhÄľadĂˇvanie na webe ÄŤasto spoÄŤĂ­va v pracnom prechĂˇdzanĂ­ jednotlivĂ˝ch strĂˇnok, ktorĂ© obsahujĂş pouĹľĂ­vateÄľom poĹľadovanĂ© informĂˇcie. V tomto ohÄľade by bol uĹľitoÄŤnĂ˝ nĂˇstroj, ktorĂ˝ webovĂ© strĂˇnky prehÄľadĂˇ, vyberie z nich potrebnĂ© informĂˇcie a ponĂşkne ich pouĹľĂ­vateÄľovi. 
CieÄľom prĂˇce je nĂˇvrh nĂˇstroja, ktorĂ˝ spracuje vĂ˝sledky vyhÄľadĂˇvania z viacerĂ˝ch strĂˇnok podobnĂ©ho zamerania, extrahuje z nich relevantnĂ© informĂˇcie, integruje ich a vhodne prezentuje pouĹľĂ­vateÄľovi. NavrhnutĂ˝ systĂ©m experimentĂˇlne overte pre oblasĹĄ trhu pracovnĂ˝ch prĂ­leĹľitostĂ­.', 1);
INSERT INTO projects VALUES (780, 'ZP', 447, NULL, 691, '2005/2006', 'Tvorba schĂ©m a ĹˇtĂ˝lov bibliografickĂ˝ch zĂˇznamov pre typografickĂ˝ systĂ©m LaTeX', 'Tvorba schĂ©m a ĹˇtĂ˝lov bibliografickĂ˝ch zĂˇznamov pre typografickĂ˝ systĂ©m LaTeX', 'Pre oddelenie typov (schĂ©m) bibliografickĂ˝ch zĂˇznamov od ich vzhÄľadu (ĹˇtĂ˝lu) v konkrĂ©tnom dokumente pri jeho prĂ­prave pomocou typografickĂ©ho systĂ©mu LaTeX sa najÄŤastejĹˇie pouĹľĂ­va BibTeX (ako program pre generovanie prezentĂˇcie schĂ©m, aj ako formĂˇt pre reprezentĂˇciu jednotlivĂ˝ch schĂ©m). Analyzujte moĹľnosti pouĹľitia BibTeX-u pri prĂ­prave dokumentov v slovenskom jazyku. Navrhnite schĂ©my a jednotnĂ˝ ĹˇtĂ˝l bibliografickĂ˝ch zĂˇznamov v podobe, v akej sĂş uvedenĂ© v norme STN ISO 690 (resp. 690-2). NavrhnutĂ© schĂ©my a ĹˇtĂ˝l overte vytvorenĂ­m elektronickej verzie dokumentu (zĂˇvereÄŤnej prĂˇce) v slovenskom jazyku s pouĹľitĂ­m systĂ©mov LaTeX a BibTeX.', 'Pre oddelenie typov (schĂ©m) bibliografickĂ˝ch zĂˇznamov od ich vzhÄľadu (ĹˇtĂ˝lu) v konkrĂ©tnom dokumente pri jeho prĂ­prave pomocou typografickĂ©ho systĂ©mu LaTeX sa najÄŤastejĹˇie pouĹľĂ­va BibTeX (ako program pre generovanie prezentĂˇcie schĂ©m, aj ako formĂˇt pre reprezentĂˇciu jednotlivĂ˝ch schĂ©m). Analyzujte moĹľnosti pouĹľitia BibTeX-u pri prĂ­prave dokumentov v slovenskom jazyku. Navrhnite schĂ©my a jednotnĂ˝ ĹˇtĂ˝l bibliografickĂ˝ch zĂˇznamov v podobe, v akej sĂş uvedenĂ© v norme STN ISO 690 (resp. 690-2). NavrhnutĂ© schĂ©my a ĹˇtĂ˝l overte vytvorenĂ­m elektronickej verzie dokumentu (zĂˇvereÄŤnej prĂˇce) v slovenskom jazyku s pouĹľitĂ­m systĂ©mov LaTeX a BibTeX.', 1);
INSERT INTO projects VALUES (781, 'ZP', 298, NULL, 692, '2005/2006', 'VirtuĂˇlna univerzita - modul vyhodnocovania znalostĂ­', 'VirtuĂˇlna univerzita - modul vyhodnocovania znalostĂ­', 'Do existujĂşceho systĂ©mu VirtuĂˇlnej univerzity doplĹte modul testovania znalostĂ­. Navrhnite a implementujte potrebnĂ© zmeny. RieĹˇenie overte na prĂ­klade predmetu PerifĂ©rne zariadenia.', 'Do existujĂşceho systĂ©mu VirtuĂˇlnej univerzity doplĹte modul testovania znalostĂ­. Navrhnite a implementujte potrebnĂ© zmeny. RieĹˇenie overte na prĂ­klade predmetu PerifĂ©rne zariadenia.', 0);
INSERT INTO projects VALUES (782, 'ZP', 375, NULL, 693, '2005/2006', 'DistribuovanĂ© vĂ˝poÄŤty', 'DistribuovanĂ© vĂ˝poÄŤty', 'Analyzujte moĹľnosti rieĹˇenia vĂ˝poÄŤtovĂ˝ch Ăşloh v prostredĂ­ poÄŤĂ­taÄŤovĂ˝ch sietĂ­. Navrhnite systĂ©m distribĂşcie Ăşloh na rĂ´zne uzly v sieti a ich vykonanie.   NavrhnutĂ˝ a implementovanĂ˝ systĂ©m overte v TCP/IP sieti.  ', 'Analyzujte moĹľnosti rieĹˇenia vĂ˝poÄŤtovĂ˝ch Ăşloh v prostredĂ­ poÄŤĂ­taÄŤovĂ˝ch sietĂ­. Navrhnite systĂ©m distribĂşcie Ăşloh na rĂ´zne uzly v sieti a ich vykonanie.   NavrhnutĂ˝ a implementovanĂ˝ systĂ©m overte v TCP/IP sieti.  ', 0);
INSERT INTO projects VALUES (783, 'ZP', 375, NULL, 694, '2005/2006', 'DistribuovanĂ© vĂ˝poÄŤty', 'DistribuovanĂ© vĂ˝poÄŤty', 'Analyzujte moĹľnosti rieĹˇenia vĂ˝poÄŤtovĂ˝ch Ăşloh v prostredĂ­ poÄŤĂ­taÄŤovĂ˝ch sietĂ­. Navrhnite systĂ©m distribĂşcie Ăşloh na rĂ´zne uzly v sieti a ich vykonanie.   NavrhnutĂ˝ a implementovanĂ˝ systĂ©m overte v TCP/IP sieti.  ', 'Analyzujte moĹľnosti rieĹˇenia vĂ˝poÄŤtovĂ˝ch Ăşloh v prostredĂ­ poÄŤĂ­taÄŤovĂ˝ch sietĂ­. Navrhnite systĂ©m distribĂşcie Ăşloh na rĂ´zne uzly v sieti a ich vykonanie.   NavrhnutĂ˝ a implementovanĂ˝ systĂ©m overte v TCP/IP sieti.  ', 0);
INSERT INTO projects VALUES (784, 'ZP', 260, NULL, 695, '2004/2005', 'Podpora automatizovanĂ©ho hodnotenia programov', 'Podpora automatizovanĂ©ho hodnotenia programov', 'Analyzujte problematiku automatizovanĂ©ho overovania funkÄŤnosti programov, navrhnite a vytvorte nĂˇstroj, ktorĂ˝ umoĹľnĂ­ vyhodnotiĹĄ sprĂˇvnosĹĄ fungovania programu na zĂˇklade definovanĂ˝ch vstupov a k nim prislĂşchajĂşcich oÄŤakavanĂ˝ch vĂ˝stupov. Zaoberajte sa  tieĹľ problematikou kontrolovanĂ©ho behu programu v obmedzenom prostredĂ­ tak, aby ste zabrĂˇnili jeho moĹľnĂ˝m neĹľiadĂşcim vplyvom na ostatnĂ© ÄŤasti systĂ©mu. NĂˇstroj implementujte v operaÄŤnom systĂ©me FreeBSD alebo Linux.', 'Analyzujte problematiku automatizovanĂ©ho overovania funkÄŤnosti programov, navrhnite a vytvorte nĂˇstroj, ktorĂ˝ umoĹľnĂ­ vyhodnotiĹĄ sprĂˇvnosĹĄ fungovania programu na zĂˇklade definovanĂ˝ch vstupov a k nim prislĂşchajĂşcich oÄŤakavanĂ˝ch vĂ˝stupov. Zaoberajte sa  tieĹľ problematikou kontrolovanĂ©ho behu programu v obmedzenom prostredĂ­ tak, aby ste zabrĂˇnili jeho moĹľnĂ˝m neĹľiadĂşcim vplyvom na ostatnĂ© ÄŤasti systĂ©mu. NĂˇstroj implementujte v operaÄŤnom systĂ©me FreeBSD alebo Linux.', 1);
INSERT INTO projects VALUES (785, 'ZP', 433, NULL, 696, '2005/2006', 'PrezentĂˇcia dokumentov pre web so sĂ©mantikou', 'PrezentĂˇcia dokumentov pre web so sĂ©mantikou', 'Analyzujte novĂ© prĂ­stupy k reprezentĂˇciĂ­ dokumentov pre novĂş generĂˇciu siete Internet, web so sĂ©mantikou. Zamerajte sa pritom na existujĂşce schĂ©my opisu dĂˇt a ontolĂłgie. Navrhnite systĂ©m, ktorĂ˝ bude sprĂ­stupĹovaĹĄ  dokumenty dostupnĂ© na webe a umoĹľnĂ­ spracovanie na zĂˇklade nimi poskytnutĂ˝ch metadĂˇt. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m web-systĂ©mu na sprĂ­stupĹovanie dokumentov.', 'Analyzujte novĂ© prĂ­stupy k reprezentĂˇciĂ­ dokumentov pre novĂş generĂˇciu siete Internet, web so sĂ©mantikou. Zamerajte sa pritom na existujĂşce schĂ©my opisu dĂˇt a ontolĂłgie. Navrhnite systĂ©m, ktorĂ˝ bude sprĂ­stupĹovaĹĄ  dokumenty dostupnĂ© na webe a umoĹľnĂ­ spracovanie na zĂˇklade nimi poskytnutĂ˝ch metadĂˇt. NavrhnutĂ© rieĹˇenie overte implementovanĂ­m web-systĂ©mu na sprĂ­stupĹovanie dokumentov.', 1);
INSERT INTO projects VALUES (786, 'ZP', 360, NULL, 697, '2005/2006', 'HTML aplikĂˇcia na vĂ˝uÄŤbu zobrazenia Ăşdajov v poÄŤĂ­taÄŤi', 'HTML aplikĂˇcia na vĂ˝uÄŤbu zobrazenia Ăşdajov v poÄŤĂ­taÄŤi', 'Analyzujte problematiku poziÄŤnĂ˝ch ÄŤĂ­selnĂ˝ch sĂşstav a zobrazenia Ăşdajov v poÄŤĂ­taÄŤi.
Navrhnite a implementujte programovĂ˝ systĂ©m pouĹľiteÄľnĂ˝  na vĂ˝uÄŤbu prevodov medzi ÄŤĂ­selnĂ˝mi sĂşstavami, zobrazovania Ăşdajov v poÄŤĂ­taÄŤi a celoÄŤĂ­selnej aritmetiky v dvojkovej ÄŤĂ­selnej sĂşstave. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
MĂˇ byĹĄ funkÄŤnĂ˝  ako HTML aplikĂˇcia.

', 'Analyzujte problematiku poziÄŤnĂ˝ch ÄŤĂ­selnĂ˝ch sĂşstav a zobrazenia Ăşdajov v poÄŤĂ­taÄŤi.
Navrhnite a implementujte programovĂ˝ systĂ©m pouĹľiteÄľnĂ˝  na vĂ˝uÄŤbu prevodov medzi ÄŤĂ­selnĂ˝mi sĂşstavami, zobrazovania Ăşdajov v poÄŤĂ­taÄŤi a celoÄŤĂ­selnej aritmetiky v dvojkovej ÄŤĂ­selnej sĂşstave. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
MĂˇ byĹĄ funkÄŤnĂ˝  ako HTML aplikĂˇcia.

', 0);
INSERT INTO projects VALUES (787, 'ZP', 584, NULL, 698, '2004/2005', 'AnalĂ˝za, monitorovanie a testovanie bezpeÄŤnosti mobilnĂ˝ch kĂłdov', 'AnalĂ˝za, monitorovanie a testovanie bezpeÄŤnosti mobilnĂ˝ch kĂłdov', 'Navrhnite a implementujte monitorovanie sieĹĄovĂ˝ch a systĂ©movĂ˝ch aktivĂ­t cudzĂ­ch kĂłdov spĂşĹˇĹĄanĂ˝ch na lokĂˇlnom poÄŤĂ­taÄŤovom systĂ©me. TeoretickĂˇ a praktickĂˇ analĂ˝za bezpeÄŤenosti mobilnĂ˝ch kĂłdov.', 'Navrhnite a implementujte monitorovanie sieĹĄovĂ˝ch a systĂ©movĂ˝ch aktivĂ­t cudzĂ­ch kĂłdov spĂşĹˇĹĄanĂ˝ch na lokĂˇlnom poÄŤĂ­taÄŤovom systĂ©me. TeoretickĂˇ a praktickĂˇ analĂ˝za bezpeÄŤenosti mobilnĂ˝ch kĂłdov.', 0);
INSERT INTO projects VALUES (788, 'ZP', 260, NULL, 699, '2005/2006', 'Podpora automatizovanĂ©ho hodnotenia programov', 'Podpora automatizovanĂ©ho hodnotenia programov', 'Analyzujte problematiku automatizovanĂ©ho overovania funkÄŤnosti programov, navrhnite a vytvorte nĂˇstroj, ktorĂ˝ jednak umoĹľnĂ­ vyhodnotiĹĄ sprĂˇvnosĹĄ fungovania programu na zĂˇklade definovanĂ˝ch vstupov a k nim prislĂşchajĂşcich oÄŤakĂˇvanĂ˝ch vĂ˝stupov a tieĹľ umoĹľnĂ­ zistiĹĄ rĂ´zne kvantitatĂ­vne a kvalitatĂ­vne parametre programov. Pri rieĹˇenĂ­ sa zaoberajte aj problematikou kontrolovanĂ©ho behu programu v obmedzenom prostredĂ­ tak, aby ste zabrĂˇnili jeho moĹľnĂ˝m neĹľiadĂşcim vplyvom na ostatnĂ© ÄŤasti systĂ©mu. NĂˇstroj implementujte v operaÄŤnom systĂ©me FreeBSD alebo Linux.
V rĂˇmci projektu sa zamerajte na tvorbu nĂˇstrojov na overovanie vlastnostĂ­ programov. ', 'Analyzujte problematiku automatizovanĂ©ho overovania funkÄŤnosti programov, navrhnite a vytvorte nĂˇstroj, ktorĂ˝ jednak umoĹľnĂ­ vyhodnotiĹĄ sprĂˇvnosĹĄ fungovania programu na zĂˇklade definovanĂ˝ch vstupov a k nim prislĂşchajĂşcich oÄŤakĂˇvanĂ˝ch vĂ˝stupov a tieĹľ umoĹľnĂ­ zistiĹĄ rĂ´zne kvantitatĂ­vne a kvalitatĂ­vne parametre programov. Pri rieĹˇenĂ­ sa zaoberajte aj problematikou kontrolovanĂ©ho behu programu v obmedzenom prostredĂ­ tak, aby ste zabrĂˇnili jeho moĹľnĂ˝m neĹľiadĂşcim vplyvom na ostatnĂ© ÄŤasti systĂ©mu. NĂˇstroj implementujte v operaÄŤnom systĂ©me FreeBSD alebo Linux.
V rĂˇmci projektu sa zamerajte na tvorbu nĂˇstrojov na overovanie vlastnostĂ­ programov. ', 1);
INSERT INTO projects VALUES (789, 'ZP', 360, NULL, 700, '2005/2006', 'ProgramovĂˇ podpora vĂ˝uÄŤby zobrazenia Ăşdajov v poÄŤĂ­taÄŤi', 'ProgramovĂˇ podpora vĂ˝uÄŤby zobrazenia Ăşdajov v poÄŤĂ­taÄŤi', 'Analyzujte problematiku poziÄŤnĂ˝ch ÄŤĂ­selnĂ˝ch sĂşstav a zobrazenia Ăşdajov v poÄŤĂ­taÄŤi.
Navrhnite a implementujte demonĹˇtraÄŤnĂ˝ a vĂ˝uÄŤbovĂ˝ systĂ©m pouĹľiteÄľnĂ˝  na vĂ˝uÄŤbu zobrazovania Ăşdajov v poÄŤĂ­taÄŤi a celoÄŤĂ­selnej aritmetiky v dvojkovej ÄŤĂ­selnej sĂşstave. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
MĂˇ byĹĄ funkÄŤnĂ˝  pod OS Windows.

', 'Analyzujte problematiku poziÄŤnĂ˝ch ÄŤĂ­selnĂ˝ch sĂşstav a zobrazenia Ăşdajov v poÄŤĂ­taÄŤi.
Navrhnite a implementujte demonĹˇtraÄŤnĂ˝ a vĂ˝uÄŤbovĂ˝ systĂ©m pouĹľiteÄľnĂ˝  na vĂ˝uÄŤbu zobrazovania Ăşdajov v poÄŤĂ­taÄŤi a celoÄŤĂ­selnej aritmetiky v dvojkovej ÄŤĂ­selnej sĂşstave. 
SystĂ©m treba overiĹĄ na jednoduchĂ˝ch, vhodne vybranĂ˝ch prĂ­kladoch. 
MĂˇ byĹĄ funkÄŤnĂ˝  pod OS Windows.

', 0);
INSERT INTO projects VALUES (790, 'ZP', 25, NULL, 701, '2005/2006', 'ImplementĂˇcia bezpeÄŤnostnĂ˝ch mechanizmov v systĂ©me vzdialenĂ©ho prĂ­stupu k hardvĂ©ru', 'ImplementĂˇcia bezpeÄŤnostnĂ˝ch mechanizmov v systĂ©me vzdialenĂ©ho prĂ­stupu k hardvĂ©ru', 'Analyzujte ĹˇtandardnĂ© spĂ´soby zabezpeÄŤenia prĂ­stupu k sĂşborom a sieĹĄovĂ˝m sluĹľbĂˇm, ako aj spĂ´soby ochrany prenĂˇĹˇanĂ˝ch dĂˇt (napr. SSL), v prostredĂ­ operaÄŤnĂ©ho systĂ©mu unix-ovĂ©ho typu. Navrhnite vhodnĂ˝ spĂ´sob vyuĹľitia tĂ˝chto bezpeÄŤnostnĂ˝ch mechanizmov v existujĂşcom systĂ©me vzdialenĂ©ho prĂ­stupu k hardvĂ©rovĂ˝m prostriedkom poÄŤĂ­taÄŤa pomocou siete (ide o aplikĂˇciu typu klient - server). NavrhnutĂ© rieĹˇenie implementujte a overte jeho funkÄŤnosĹĄ a spoÄľahlivosĹĄ.', 'Analyzujte ĹˇtandardnĂ© spĂ´soby zabezpeÄŤenia prĂ­stupu k sĂşborom a sieĹĄovĂ˝m sluĹľbĂˇm, ako aj spĂ´soby ochrany prenĂˇĹˇanĂ˝ch dĂˇt (napr. SSL), v prostredĂ­ operaÄŤnĂ©ho systĂ©mu unix-ovĂ©ho typu. Navrhnite vhodnĂ˝ spĂ´sob vyuĹľitia tĂ˝chto bezpeÄŤnostnĂ˝ch mechanizmov v existujĂşcom systĂ©me vzdialenĂ©ho prĂ­stupu k hardvĂ©rovĂ˝m prostriedkom poÄŤĂ­taÄŤa pomocou siete (ide o aplikĂˇciu typu klient - server). NavrhnutĂ© rieĹˇenie implementujte a overte jeho funkÄŤnosĹĄ a spoÄľahlivosĹĄ.', 0);
INSERT INTO projects VALUES (791, 'DP', 670, NULL, 702, '2005/2006', 'LaserovĂ˝ prenos dĂˇt voÄľnĂ˝m priestorom', 'LaserovĂ˝ prenos dĂˇt voÄľnĂ˝m priestorom', NULL, NULL, 0);
INSERT INTO projects VALUES (792, 'ZP', 361, NULL, 702, '2004/2005', 'ProblĂ©movĂˇ ĹˇtĂşdia mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM)', 'Case study of mobile computing system (GSM)', 'Analyzujte problematiku sĂşÄŤasnĂ©ho  stavu v oblasti technickej ÄŤasti mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM).
Urobte ĹˇtrukturĂˇlnu analĂ˝zu architektĂşry GSM siete (mobile station, base station subsystem, network subsystem). Navrhnite a implementujte rĂˇdio-komunikaÄŤnĂ© aspekty  mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM).
', 'Analyzujte problematiku sĂşÄŤasnĂ©ho  stavu v oblasti technickej ÄŤasti mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM).
Urobte ĹˇtrukturĂˇlnu analĂ˝zu architektĂşry GSM siete (mobile station, base station subsystem, network subsystem). Navrhnite a implementujte rĂˇdio-komunikaÄŤnĂ© aspekty  mobilnĂ©ho poÄŤĂ­taÄŤovĂ©ho systĂ©mu (GSM).
', 0);
INSERT INTO projects VALUES (793, 'ZP', 301, NULL, 703, '2005/2006', 'NĂˇvrh a implementĂˇcia systĂ©mu na grafickĂş vizualizĂˇciu prĂşdovĂ©ho spracovania inĹˇtrukciĂ­', 'NĂˇvrh a implementĂˇcia systĂ©mu na grafickĂş vizualizĂˇciu prĂşdovĂ©ho spracovania inĹˇtrukciĂ­', 'Navrhnite a implementujte systĂ©m, ktorĂ˝ bude s vyuĹľitĂ­m multimediĂˇlnych technolĂłgiĂ­ umoĹľĹovaĹĄ  naĹˇtudovanie, grafickĂ© zobrazenie a demonĹˇtrĂˇciu  dejov pri prĂşdovom spracovanĂ­ inĹˇtrukciĂ­.
Produkt implementujte ako hypermediĂˇlnu prezentĂˇciu vo voÄľne dostupnom webovom prehliadaÄŤi.', 'Navrhnite a implementujte systĂ©m, ktorĂ˝ bude s vyuĹľitĂ­m multimediĂˇlnych technolĂłgiĂ­ umoĹľĹovaĹĄ  naĹˇtudovanie, grafickĂ© zobrazenie a demonĹˇtrĂˇciu  dejov pri prĂşdovom spracovanĂ­ inĹˇtrukciĂ­.
Produkt implementujte ako hypermediĂˇlnu prezentĂˇciu vo voÄľne dostupnom webovom prehliadaÄŤi.', 0);


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

INSERT INTO specializations VALUES (0, 'PoÄŤĂ­taÄŤovĂ© systĂ©my a siete', 2);
INSERT INTO specializations VALUES (1, 'SoftvĂ©rovĂ© inĹľinierstvo', 2);
INSERT INTO specializations VALUES (2, 'BezpeÄŤnosĹĄ informaÄŤnĂ˝ch technolĂłgiĂ­', 3);
INSERT INTO specializations VALUES (3, 'Podnikanie v informatike', 3);
INSERT INTO specializations VALUES (4, 'InformaÄŤnĂ© systĂ©my', 2);


--
-- Data for Name: study_types; Type: TABLE DATA; Schema: public; Owner: team14
--

INSERT INTO study_types VALUES (1, 'BakalĂˇrske ĹˇtĂşdium', 1);
INSERT INTO study_types VALUES (2, 'InĹľinierske ĹˇtĂşdium', 2);
INSERT INTO study_types VALUES (3, 'DoktorandskĂ© ĹˇtĂşdium', 3);


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
INSERT INTO users VALUES (6, '4', 'bielekovaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Alexandra', NULL, 'BielekovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (7, '25809', 'mm25809', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'MinĂˇrik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (8, '20730', 'ms20730', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Skuhra', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (9, '21180', 'af21180', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Fenik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (10, '57', 'lekavym', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MariĂˇn', NULL, 'LekavĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (11, 'ext0013', 'wittlingerr', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Robert', NULL, 'Wittlinger', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (12, '50', 'markov', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VladimĂ­r', NULL, 'Marko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (13, '13', 'gramatovae', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Elena', NULL, 'GramatovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (14, '22165', 'rf22165', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rudolf', NULL, 'FĂˇber', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (15, '10007', 'flochovaj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jana', NULL, 'Flochova', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (16, '48', 'vranicv', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Valentino', NULL, 'VraniÄ‡', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (17, '21', 'husarovaz', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zuzana', NULL, 'HusĂˇrovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (18, '20006', 'ra20006', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'AmbruĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (19, '702003', 'andrejkoa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Anton', NULL, 'Andrejko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (20, '7', 'cernanskym', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'ÄŚerĹanskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (21, '22491', 'sk22491', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ĺ tefan', NULL, 'KuĹˇnĂ­r', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (22, '22492', 'mk22492', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'KĂştny', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (23, '17', 'hassana', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ahmed Abdallah', NULL, 'Hassan', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (24, '6', 'ezzeddinea', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Anna', 'Bou', 'Ezzeddine', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (25, '3', 'bernatd', NULL, '098f6bcd4621d373cade4e832627b4f6', 'DuĹˇan', NULL, 'BernĂˇt', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (26, '33', 'molnarl', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝udovĂ­t', NULL, 'MolnĂˇr', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (27, '44', 'stefanovicj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Ĺ tefanoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (28, '22694', 'pp22694', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'PĂ©ti', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (29, '52064', 'mk52064', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'KoÄŤĂˇr', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (30, '22696', 'zp22696', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zuzana', NULL, 'PetrĂˇkovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (31, '40', 'solcanyv', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Viliam', NULL, 'SolÄŤĂˇny', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (32, '21451', 'mk21451', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'KrakovskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (33, '72', 'kovarovaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Alena', NULL, 'KovĂˇrovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (34, '21539', 'rm21539', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Malast', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (35, '96', 'kosikm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'KoĹˇĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (36, '98706', 'trencan', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Ĺ evÄŤĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (37, '21987', 'rb21987', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rami', 'Al', 'Beyrouti', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (38, '25805', 'sk25805', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Silvia', NULL, 'KocsisovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (39, '25815', 'bs25815', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Boris', NULL, 'SlĂˇvik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (40, '68', 'jakubikj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Jakubik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (41, '25812', 'jp25812', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'PorubskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (42, '21122', 'sc21122', NULL, '098f6bcd4621d373cade4e832627b4f6', 'SlavomĂ­r', NULL, 'ÄŚerveĹ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (43, '63548', 'lackop', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Lacko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (44, '70', 'polickyi', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'PolickĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (45, '25803', 'ig25803', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'GrambliÄŤka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (46, '31', 'minarovaj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jana', NULL, 'MinĂˇrovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (47, '10005', 'vargam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Varga', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (48, '52092', 'rn52092', NULL, '098f6bcd4621d373cade4e832627b4f6', 'RĂłbert', NULL, 'Neubauer', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (49, '25806', 'ok25806', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'KrĹˇko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (50, '25808', 'mm25808', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'MatuĹˇka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (51, '25813', 'mp25813', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martina', NULL, 'PrĂˇznovskĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (52, '21578', 'pm21578', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'MeĹˇĹĄanĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (53, '21125', 'rd21125', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rudolf', NULL, 'DaÄŤo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (54, '52072', 'vk52072', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VladimĂ­r', NULL, 'KrivuĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (55, '21150', 'pd21150', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'DragĂşĹ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (56, '52103', 'zs52103', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zdeno', NULL, 'SlanickĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (57, '52100', 'mr52100', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MiloĹˇ', NULL, 'RadoĹˇinskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (58, '21175', 'lf21175', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝uboĹˇ', NULL, 'FazekaĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (59, '21297', 'lh21297', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝ubomĂ­r', NULL, 'HromĂˇdka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (60, '21399', 'lk21399', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'KoÄŤiĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (61, '21466', 'lk21466', NULL, '098f6bcd4621d373cade4e832627b4f6', 'LukĂˇĹˇ', NULL, 'KroÄŤka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (62, '21503', 'pl21503', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'LedĹa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (63, '21533', 'mm21533', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'MachĂˇÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (64, '21606', 'tm21606', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'MinÄŤeff', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (65, '21837', 'ms21837', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Ĺ efara', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (66, '21942', 'pv21942', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Vojtek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (67, '21977', 'oz21977', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Ĺ˝Ăˇry', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (68, '21253', 'lh21253', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝ubomĂ­r', NULL, 'Hanuliak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (69, '21286', 'mh21286', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'HornĂˇÄŤek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (70, '21415', 'rk21415', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'KorÄŤek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (71, '21417', 'mk21417', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Korenica', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (72, '20428', 'jk20428', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'KriĹˇtof', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (73, '21492', 'jk21492', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Kytka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (74, '20527', 'mm20527', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Mateja', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (75, '21714', 'pp21714', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'PolaÄŤko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (76, '21796', 'rs21796', NULL, '098f6bcd4621d373cade4e832627b4f6', 'RĂłbert', NULL, 'SmiĹˇÄŤĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (77, '25816', 'os25816', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Ĺ abĂ­k', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (78, '25804', 'tk25804', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Klempa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (79, '25802', 'mf25802', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MatĂşĹˇ', NULL, 'Fila', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (80, '25801', 'pf25801', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavel', NULL, 'FekiaÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (81, '21540', 'jm21540', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'MaleÄŤka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (82, '24817', 'an24817', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Neczli', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (83, '20219', 'mh20219', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'HablĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (84, '52114', 'js52114', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Ĺ imonÄŤiÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (85, '21437', 'mk21437', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'KovĂˇÄŤik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (86, '21607', 'mm21607', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MariĂˇn', NULL, 'MiĹˇtina', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (87, '21002', 'ma21002', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Adam', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (88, '25800', 'jb25800', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'BeĹo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (89, '21123', 'mc21123', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MariĂˇn', NULL, 'ÄŚervenĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (90, '97410', 'pk97410', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'KrajÄŤĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (91, '54678', 'smolaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Alfonz', NULL, 'Smola', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (92, '12007', 'semancik', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radovan', NULL, 'SemanÄŤĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (93, '20769', 'bs20769', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Bohuslav', NULL, 'Szabo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (94, '23840', 'mt23840', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'TomĹˇa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (95, '25', 'komorovad', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Dagmar', NULL, 'KomorovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (96, '10004', 'janglovad', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Danica', NULL, 'Janglova', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (97, '97', 'polasek', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'PolĂˇĹˇek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (98, '39', 'povazanovaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Anna', NULL, 'PovaĹľanovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (99, '23165', 'ld23165', NULL, '098f6bcd4621d373cade4e832627b4f6', 'LukĂˇĹˇ', NULL, 'DĹľunko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (100, '23039', 'sb23039', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Stanislav', NULL, 'Bebej', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (101, '23177', 'mf23177', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Figura', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (102, '23059', 'pb23059', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'BenoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (103, '52038', 'mb52038', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'BilĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (104, '99623', 'as99623', NULL, '098f6bcd4621d373cade4e832627b4f6', 'AdriĂˇn', NULL, 'SlavkovskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (105, '99221', 'mh99221', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Herchl', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (106, '20036', 'kb20036', NULL, '098f6bcd4621d373cade4e832627b4f6', 'KristĂ­na', NULL, 'BartovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (107, '99728', 'rv99728', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'VĂˇlik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (108, '99387', 'ak99387', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'KriĹˇtofiÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (109, '99133', 'pd99133', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'DrahoĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (110, '23273', 'ph23273', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Hovanec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (111, '99708', 'st99708', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ĺ tefan', NULL, 'Trgala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (112, '23282', 'mh23282', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Hronec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (113, '22467', 'jk22467', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jakub', NULL, 'KriĹˇtofĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (114, '99637', 'is99637', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Straka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (115, '20325', 'mj20325', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MĂˇrk', NULL, 'JĂłnĂˇs', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (116, '22854', 'ds22854', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Daniel', NULL, 'Ĺ ÄŤibrany', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (117, '20477', 'ml20477', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MĂˇrio', NULL, 'LenickĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (118, '20867', 'tv20867', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Vanderka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (119, '23642', 'ro23642', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radoslav', NULL, 'OrĹˇula', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (120, '99426', 'ml99426', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'LehockĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (121, '20929', 'mz20929', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Ĺ˝itĹanskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (122, '20875', 'dv20875', NULL, '098f6bcd4621d373cade4e832627b4f6', 'DuĹˇan', NULL, 'VelickĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (123, '99038', 'vb99038', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Viliam', NULL, 'BedeÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (124, '22758', 'ts22758', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Sabo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (125, '99621', 'ps99621', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'SlanĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (126, 'a005', 'makula', NULL, '098f6bcd4621d373cade4e832627b4f6', 'admin', NULL, 'Makula', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (127, '52046', 'af52046', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Adrien', NULL, 'FarkaĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (128, '23867', 'dv23867', NULL, '098f6bcd4621d373cade4e832627b4f6', 'David', NULL, 'Vallner', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (129, '21683', 'jp21683', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'PerÄŹoch', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (130, '53006', 'mz53006', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MatĂşĹˇ', NULL, 'Zeman', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (131, '22423', 'rk22423', NULL, '098f6bcd4621d373cade4e832627b4f6', 'RĂłbert', NULL, 'KomĂˇromy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (132, '98017', 'mb98017', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'BĂˇlik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (133, '20441', 'mk20441', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'KubĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (134, '22019', 'ob22019', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Oliver', NULL, 'BachtĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (135, '22914', 'tt22914', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Taraba', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (136, '22437', 'mk22437', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'KoĹˇĹĄĂˇl', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (137, '99473', 'mm99473', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'MelicherÄŤĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (138, '20183', 'rf20183', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'FĂĽlĂ¶p', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (139, '23681', 'vp23681', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VladimĂ­r', NULL, 'Popelka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (140, '23061', 'tb23061', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'BielÄŤĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (141, '23800', 'ps23800', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ĺ iĹˇka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (142, '23656', 'vp23656', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VladimĂ­r', NULL, 'PeknĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (143, '22763', 'ms22763', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Samiec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (144, '22311', 'ph22311', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Humay', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (145, '23765', 'ms23765', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'StaĹo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (146, '99316', 'pk99316', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Kapec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (147, '22066', 'mb22066', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MĂˇrio', NULL, 'Blaho', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (148, '23408', 'mk23408', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'KovĂˇÄŤik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (149, '99026', 'ab99026', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Anna', NULL, 'BalĂˇĹľovĂˇ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (150, '22999', 'pv22999', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Vrba', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (151, '23251', 'mh23251', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MatĂşĹˇ', NULL, 'Hlava', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (152, '23940', 'km23940', NULL, '098f6bcd4621d373cade4e832627b4f6', 'KristĂ­na', NULL, 'MatĂşĹˇka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (153, '23406', 'mk23406', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'KovĂˇÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (154, '98737', 'as98737', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Attila', NULL, 'Ĺ trba', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (155, '99766', 'jw99766', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂşlius', NULL, 'Weissensteiner', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (156, '99372', 'ak99372', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'KovĂˇÄŤik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (157, '63500', 'dk63500', NULL, '098f6bcd4621d373cade4e832627b4f6', 'DuĹˇan', NULL, 'Kysel', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (158, '22225', 'rg22225', NULL, '098f6bcd4621d373cade4e832627b4f6', 'RamonVladim', NULL, 'Gomez', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (159, '99348', 'mk99348', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Mario', NULL, 'Komjathy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (160, '10003', 'svingalj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂşlius', NULL, 'Ĺ vingĂˇl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (161, '99464', 'im99464', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'MasaroviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (162, '23264', 'lh23264', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝ubomĂ­r', NULL, 'HorĹĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (163, '52095', 'jo52095', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'OndruĹˇka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (164, '99048', 'jb99048', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'BelluĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (165, '99061', 'mb99061', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'BiĹˇÄŤo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (166, '95078', 'tb95078', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'BranickĂ˝', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (167, '23610', 'ln23610', NULL, '098f6bcd4621d373cade4e832627b4f6', 'LukĂˇĹˇ', NULL, 'NemÄŤĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (168, '23881', 'rv23881', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'VeselĂ˝', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (169, '99158', 'sf99158', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Samuel', NULL, 'FerenÄŤĂ­k', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (170, '99159', 'pf99159', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Fiala', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (171, '99193', 'pg99193', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'GrodovskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (172, '23761', 'ps23761', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'SoviĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (173, '20303', 'mj20303', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'JakubĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (174, '99241', 'ph99241', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'HornĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (175, '23484', 'fl23484', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Filip', NULL, 'LĂ¶rinc', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (176, '98238', 'mh98238', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Hron', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (177, '99267', 'tc99267', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Chmel', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (178, '99228', 'ph99228', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'HlockĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (179, '99283', 'jj99283', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'JakubĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (180, '99285', 'mj99285', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Jamrich', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (181, '99309', 'mk99309', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Kadlic', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (182, '23981', 'mm23981', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'MihĂˇlik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (183, '99247', 'mh99247', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Hrablay', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (184, '23272', 'sh23272', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ĺ tefan', NULL, 'HorvĂˇth', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (185, '20431', 'mk20431', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'KriĹľan', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (186, '99400', 'pk99400', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'KuÄľka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (187, '99409', 'ml99409', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Lacko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (188, '37649', 'trebatickyp', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Trebaticky', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (189, '99225', 'lh99225', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝ubomĂ­r', NULL, 'HlĂˇvek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (190, '99465', 'jm99465', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'MĂˇtĂ©', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (191, '23617', 'mn23617', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'NovĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (192, '99490', 'mm99490', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MariĂˇn', NULL, 'Mirc', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (193, '98497', 'pm98497', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'MiĹˇĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (194, '22679', 'mp22679', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'PalkoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (195, '20080', 'tb20080', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'BĂşci', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (196, '23905', 'ov23905', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Oto', NULL, 'VozĂˇr', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (197, '98584', 'jp98584', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Petreje', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (198, '22229', 'vg22229', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VladimĂ­r', NULL, 'Gregor', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (199, '99581', 'pp99581', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'ProchĂˇzka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (200, '99582', 'jp99582', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'ProkĹˇa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (201, '99557', 'tp99557', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Teodor', NULL, 'PetrĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (202, '97715', 'is97715', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'SĂˇs', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (203, '99607', 'ms99607', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'SeÄŤkĂˇr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (204, '99608', 'ms99608', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MariĂˇn', NULL, 'SedlĂˇÄŤek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (205, '99145', 'id99145', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Dysko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (206, '99544', 'rp99544', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'PĂˇterek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (207, '99642', 'ss99642', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ĺ tefan', NULL, 'SudolskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (208, '23428', 'sk23428', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ĺ tefan', NULL, 'KriĹˇtofĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (209, '52048', 'pf52048', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Fillo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (210, '53051', 'ba53051', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Bader', NULL, 'Almethen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (211, '99737', 'jv99737', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Variny', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (212, '99744', 'mv99744', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MariĂˇn', NULL, 'Vevurka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (213, '99767', 'dz99767', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Darina', NULL, 'ZĂˇhradnĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (214, '22174', 'rl22174', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'Lacko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (215, '12010', 'jzajac', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Zajac', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (216, '23760', 'js23760', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'SomorovskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (217, '98167', 'lf98167', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝udovĂ­t', NULL, 'FĂĽlop', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (218, '12006', 'rajskyp', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'RajskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (219, '12003', 'hurton', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'HurtoĹ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (220, '12004', 'lichardova', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Hana', NULL, 'LichardovĂˇ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (221, '45678', 'greskom', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'GreĹˇko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (222, '23056', 'ab23056', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Alexander', NULL, 'Benko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (223, '97224', 'sg97224', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Serguei', NULL, 'Gorbatchev', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (224, 't0202', 'jm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Mlynar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (226, 't0204', 'kv', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Kristian', NULL, 'Vedroody', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (227, '97046', 'jb97046', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'BeĹo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (228, '97103', 'lc97103', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝uboĹˇ', NULL, 'CabĂˇnik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (229, '97181', 'pf97181', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'FekiaÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (230, '22388', 'rk22388', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radoslav', NULL, 'Katreniak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (231, '98383', 'ek98383', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Eugen', NULL, 'KriĹľo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (232, '96497', 'jm96497', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'MajerskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (233, '98478', 'mm98478', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'MatuĹˇka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (234, '95739', 'iv95739', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'VerÄŤinskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (235, 'ped200', 'tyslerm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'TyĹˇler', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (236, 'ped201', 'kocalkap', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'KoÄŤalka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (237, 'ped203', 'trabalkam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Trabalka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (238, '23623', 'jn23623', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jana', NULL, 'NovoveskĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (239, '22468', 'mk22468', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'KropĂˇÄŤek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (240, '23139', 'md23139', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'DobiĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (241, '23200', 'im23200', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Malich', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (242, '22198', 'mm22198', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marcel', NULL, 'MĂ©sĂˇroĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (243, '96717', 'mr96717', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'RusnĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (244, '98651', 'js98651', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'SebestyĂ©n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (245, '97808', 'ps97808', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Ĺ vĂˇba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (246, '23326', 'jv23326', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'VĂˇlky', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (247, '12012', 'brabcovak', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Karin', NULL, 'BrabcovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (248, '23134', 'dj23134', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Daniel', NULL, 'JĂłkai', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (249, '12014', 'Vojvoda', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Vojvoda', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (250, '12016', 'Zajac', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Zajac', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (251, '12017', 'HorniaÄŤek', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'HorniaÄŤek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (252, '12008', 'unger', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Unger', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (253, '12018', 'Andrasikl', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'AndrĂˇĹˇik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (254, '23674', 'mp23674', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MĂˇria', NULL, 'PohronskĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (255, '23505', 'fm23505', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Filip', NULL, 'MajernĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (256, '23732', 'is23732', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Seman', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (257, '53001', 'rt53001', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'TĂłth', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (258, '99631', 'ms99631', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'SpevĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (259, '22490', 'mk22490', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'KurĹĄĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (260, '45', 'steimullerb', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Branislav', NULL, 'SteinmĂĽller', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (261, '23380', 'pk23380', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Knotka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (262, '22144', 'sd22144', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ĺ tefan', NULL, 'DlugolinskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (263, '99229', 'oh99229', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'HluchĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (264, '20038', 'hb20038', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Helmut', NULL, 'Bauer', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (265, '23739', 'ts23739', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Schwandner', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (266, '22762', 'ms22762', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marian', NULL, 'Salaj', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (267, '23511', 'mm23511', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'MakĂ˝Ĺˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (268, '23510', 'mm23510', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'MakovĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (269, '20314', 'aj20314', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'JanĹľo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (270, '58', 'rozinajovav', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Viera', NULL, 'RozinajovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (271, '49', 'jancir', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'JanÄŤi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (272, '42', 'smutnyo', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'SmutnĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (273, '22402', 'ik22402', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'KiĹˇac', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (274, '22676', 'mp22676', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'PĂˇlka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (275, '23254', 'ph23254', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Hlinka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (276, '23578', 'mm23578', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'MlatiÄŤek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (277, '23638', 'jo23638', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'OrgonĂˇĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (278, '23458', 'dl23458', NULL, '098f6bcd4621d373cade4e832627b4f6', 'DuĹˇan', NULL, 'LamoĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (279, '23599', 'pn23599', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Nadanyi', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (280, '23005', 'la23005', NULL, '098f6bcd4621d373cade4e832627b4f6', 'LukĂˇĹˇ', NULL, 'Adamko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (281, '22339', 'mj22339', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'JackoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (282, '22715', 'op22715', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Pok', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (283, 'a004', 'matusik', NULL, '098f6bcd4621d373cade4e832627b4f6', 'admin', NULL, 'MatuĹˇĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (284, '23924', 'pz23924', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'ZubÄŤĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (285, '23707', 'rr23707', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'RodĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (286, '22867', 'ms22867', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Ĺ imĂşn', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (287, '23184', 'af23184', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'FrliÄŤka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (288, '22258', 'mh22258', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'Haulik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (289, '22928', 'pt22928', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Tomek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (290, '22975', 'jv22975', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jakub', NULL, 'VaĹo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (291, '22638', 'mn22638', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'NĂˇgl', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (292, '22399', 'pk22399', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'KirĹˇner', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (293, 'aaa', 'aaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'a', NULL, 'a', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (294, '43', 'sperkam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Ĺ perka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (295, '22085', 'zb22085', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zuzana', NULL, 'BoĹľoĹovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (296, '22098', 'mb22098', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marian', NULL, 'Buchta', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (297, '36', 'parizkovaj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jana', NULL, 'ParĂ­zkovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (298, '9', 'dadob', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Boris', NULL, 'Dado', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (299, '54', 'navarcikm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MatĂşĹˇ', NULL, 'NavarÄŤik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (300, '22730', 'zp22730', NULL, '098f6bcd4621d373cade4e832627b4f6', 'ZoltĂˇn', NULL, 'Pulai', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (301, '19', 'hudecj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Hudec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (302, '22264', 'lh22264', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝uboĹˇ', NULL, 'Heriban', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (303, '22303', 'th22303', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'HubatĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (304, '22425', 'tk22425', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'KoneÄŤnĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (305, '20497', 'pl20497', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Luciak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (306, '22549', 'jm22549', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Majer', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (307, '22511', 'sl22511', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Stanislava', NULL, 'LeitmanovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (308, '22990', 'pv22990', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Vilina', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (309, '23418', 'jk23418', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jakub', NULL, 'KrajÄŤoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (310, '23912', 'vz23912', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladislav', NULL, 'ZĂˇleĹˇĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (311, '22341', 'mj22341', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Jajcaj', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (312, '23632', 'mo23632', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'OndroviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (313, '22931', 'tt22931', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'TĂłth', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (314, '22756', 'pr22756', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ruttkay-NedeckĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (315, '22816', 'ms22816', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'StanÄŤek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (316, '22017', 'ob22017', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'BachratĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (317, '23154', 'jd23154', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'ÄŽuriĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (318, '23214', 'mg23214', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'GreĹľÄŹo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (319, '23780', 'os23780', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'SzĂ©kely', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (320, '22018', 'vb22018', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Viktor', NULL, 'BachratĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (321, '22734', 'lr22734', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Rado', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (322, '22918', 'vt22918', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Viktor', NULL, 'TlachĂˇÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (323, '23653', 'ap23653', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Anton', NULL, 'PavloviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (324, '22317', 'lc22317', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝ubomĂ­r', NULL, 'Chamraz', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (325, '23563', 'mm23563', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Mikula', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (326, '23469', 'll23469', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'LenÄŤucha', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (327, '23258', 'xh23258', NULL, '098f6bcd4621d373cade4e832627b4f6', 'XuanLinh', NULL, 'Hoang', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (328, '22852', 'js22852', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Ĺ armĂ­r', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (329, '23527', 'zm23527', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zuzana', NULL, 'MaslenovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (330, '22006', 'sa22006', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Stanislav', NULL, 'AngeloviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (331, '22699', 'mp22699', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'PetriĹˇÄŤĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (332, '22835', 'ms22835', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'SvetlĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (333, '22463', 'jk22463', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Krausko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (334, 'a006', 'rozinaj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'admin', NULL, 'RozinajovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (335, '22674', 'do22674', NULL, '098f6bcd4621d373cade4e832627b4f6', 'DrahomĂ­r', NULL, 'Osvald', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (336, '22882', 'bs22882', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Branislav', NULL, 'Ĺ oral', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (337, '20191', 'mg20191', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'GĂˇlis', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (338, '22782', 'rs22782', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'Schwartz', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (339, '22697', 'jp22697', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'PetrĂˇĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (340, '23665', 'ap23665', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'PiĹĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (341, '73', 'bottr', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roland', NULL, 'Bott', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (342, '8', 'cicakp', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavel', NULL, 'ÄŚiÄŤĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (343, '52040', 'mb52040', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'BubenĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (344, '22937', 'mt22937', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'TrĂ©ger', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (345, '22376', 'ak22376', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Kadora', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (346, '22349', 'pj22349', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'JaniÄŤkoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (347, '23252', 'vh23252', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VladimĂ­r', NULL, 'HlavĂˇÄŤek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (348, '22908', 'ps22908', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ĺ upina', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (349, '22297', 'jh22297', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Hric', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (350, '22809', 'ts22809', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tibor', NULL, 'Somogyi', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (351, '22023', 'jb22023', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'BalĂˇĹľ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (352, '22690', 'lp22690', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝uboĹˇ', NULL, 'Pazdera', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (353, '22661', 'mo22661', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Okresa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (354, '22652', 'pn22652', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Nociar', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (355, '22507', 'ml22507', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'LegĂ©Ĺ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (356, '22617', 'pm22617', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'MiĹˇĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (357, '14', 'grellnethi', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Grellneth', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (358, '20', 'hudecl', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Hudec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (359, '29', 'malinad', NULL, '098f6bcd4621d373cade4e832627b4f6', 'DuĹˇan', NULL, 'Malina', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (360, '46', 'tomalovae', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Elena', NULL, 'TomalovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (361, '302492', 'hasanj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jamal', NULL, 'Hasan', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (362, '22031', 'mb22031', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Bartal', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (363, '22036', 'mb22036', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Bebjak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (364, '22086', 'gb22086', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Gabriel', NULL, 'BraniĹˇa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (365, '22106', 'mc22106', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'CichĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (366, '22107', 'pc22107', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'CsĂ©falvay', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (367, '22176', 'mf22176', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Fenin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (368, '22283', 'mh22283', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Homola', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (369, '22346', 'mj22346', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'JakuĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (370, '22493', 'tk22493', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'KuzĂˇr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (371, '23672', 'mp23672', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'PlĂˇvka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (372, '23692', 'lr23692', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝uboĹˇ', NULL, 'RabÄŤan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (373, '23779', 'ss23779', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ĺ tefan', NULL, 'SzabĂł', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (374, '23', 'kapustiki', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'KapustĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (375, '26', 'kotocovam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MargarĂ©ta', NULL, 'KotoÄŤovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (376, '23317', 'mi23317', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'IvaniÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (377, '22314', 'bh22314', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Bohuslav', NULL, 'HvizdĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (378, '23979', 'mm23979', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MaroĹˇ', NULL, 'MatĂşĹˇ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (379, '21026', 'mb21026', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'BĂˇlint', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (380, '23987', 'mp23987', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'PĂˇlka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (381, '23722', 'js23722', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'SakĂˇloĹˇ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (382, '12005', 'pospichal', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JiĹ™Ă­', NULL, 'PospĂ­chal', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (383, '23055', 'jb23055', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'BeĹĂˇk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (384, '20323', 'mj20323', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MatĂşĹˇ', NULL, 'JĂłkay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (385, '23245', 'mh23245', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Herko', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (386, '23498', 'tm23498', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Madaj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (387, '38', 'koskova', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Gabriela', NULL, 'KoskovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (388, '303928', 'hanuloval', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Luba', NULL, 'HanulovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (389, '23502', 'mm23502', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Mach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (390, '22094', 'jb22094', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'BudinskĂ˝', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (391, '22247', 'rh22247', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Riad', NULL, 'Hammoud', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (392, '22480', 'pk22480', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Kubizniak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (393, '23424', 'ak23424', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Alojz', NULL, 'Krenn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (394, '23500', 'dk23500', NULL, '098f6bcd4621d373cade4e832627b4f6', 'DuĹˇan', NULL, 'Kysel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (395, '98464', 'jm98464', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'MaretĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (396, '12002', 'groseko', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Otokar', NULL, 'GroĹˇek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (397, '12013', 'Vavra', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'VĂˇvra', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (398, 'abc3', 'abc3', NULL, '098f6bcd4621d373cade4e832627b4f6', 'abc3', NULL, 'abc3', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (399, 'ped206', 'sirota', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VladimĂ­r', NULL, 'Sirota', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (400, '34261', 'takacsm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'TakĂˇcs', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (401, '34245', 'angelovicp', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'AngeloviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (402, '007', 'novy_student', NULL, '098f6bcd4621d373cade4e832627b4f6', 'student', NULL, 'novy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (403, 'ped208', 'simlastikm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Simlastik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (404, 'ped207', 'pikulat', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Pikula', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (405, '20473', 'll20473', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝uboĹˇ', NULL, 'LeÄŤko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (406, 'd13', 'jvd13', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'VanÄŤĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (407, '20517', 'pm20517', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'MarcinkoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (408, '20839', 'pt20839', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'TĂłth', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (409, 'abc', 'abc', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Abc', NULL, 'Abc', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (410, 't0201', 'rk', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'KlÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (411, '98138', 'vf98138', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VĂ­t', NULL, 'FargaĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (412, 'ped205', 'horvathp', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'HorvĂˇth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (413, '20728', 'as20728', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Adam', NULL, 'SkalnĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (414, '99585', 'sp99585', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Szabolcs', NULL, 'PuskĂˇs', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (415, '52066', 'mk52066', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'KonĂ´pka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (416, '52039', 'jb52039', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Brosz', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (417, '1', 'balgaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Attila', NULL, 'Balga', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (418, '21575', 'pm21575', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Mesjar', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (419, '20769a', 'bohus', NULL, '098f6bcd4621d373cade4e832627b4f6', 'bohus', NULL, 'szabo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (420, '21961', 'jz21961', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Zeman', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (421, '12345', 'ra12345', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'Arvay', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (422, '10002', 'jarolini', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Jarolin', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (423, '20835', 'jt20835', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Tomko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (424, '20545', 'pm20545', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Mihalik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (425, 'd06', 'mhd06', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'HreĹĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (426, '20107', 'mc20107', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'ÄŚambĂˇl', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (427, 'd11', 'skd11', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Stanislava', NULL, 'KekerovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (428, '20804', 'ms20804', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Ĺ tĂ­pek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (429, '99714', 'zt99714', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zdenek', NULL, 'Tubel', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (430, 'd09', 'jbd09', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'BeĹo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (431, '22', 'jelemenskak', NULL, '098f6bcd4621d373cade4e832627b4f6', 'KatarĂ­na', NULL, 'JelemenskĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (432, '20225', 'jh20225', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Hamar', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (433, '10', 'filkornr', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Filkorn', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (434, '20213', 'mg20213', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'GrosoĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (435, 'd03', 'ppd03', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'ProchĂˇzka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (436, '11', 'fristackyn', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Norbert', NULL, 'FriĹˇtackĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (437, '34', 'navratp', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'NĂˇvrat', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (438, '20091', 'jb20091', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'BurĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (439, '20711', 'pr20711', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'RuĹľiÄŤka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (440, 'd05', 'fpd05', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Filip', NULL, 'Pucher', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (441, 'd02', 'mmd02', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'MaÄŤica', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (442, '20575', 'pm20575', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Mulinka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (443, '20766', 'ms20766', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MiloĹˇ', NULL, 'SĂ˝kora', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (444, '20736', 'ts20736', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Smolek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (445, '51', 'kurucj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Kuruc', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (446, '20584', 'pn20584', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Nagy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (447, '52', 'grlickyv', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VladimĂ­r', NULL, 'GrlickĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (448, '20689', 'pp20689', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Pullmann', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (449, 'd08', 'jkd08', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Kulich', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (450, '20092', 'ab20092', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Burger', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (451, 'd12', 'msd12', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marian', NULL, 'StankoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (452, '20570', 'mm20570', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'MoravÄŤĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (453, '20882', 'mv20882', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Vnuk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (454, '20207', 'pg20207', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Gono', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (455, 'd04', 'jbd04', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'BelluĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (456, '21966', 'mz21966', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Zubal', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (457, 'd01', 'phd01', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'HronÄŤek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (458, '20565', 'tm20565', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'MolnĂˇr', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (459, 'd07', 'rkd07', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Robert', NULL, 'Kubovics', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (460, '21027', 'ib21027', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Imrich', NULL, 'Balko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (461, '21109', 'mc21109', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Cerva', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (462, '20106', 'ic20106', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'ÄŚahoj', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (463, '99470', 'lm99470', NULL, '098f6bcd4621d373cade4e832627b4f6', 'LukĂˇĹˇ', NULL, 'MatuĹˇĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (464, '99525', 'jo99525', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Olbert', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (465, '20053', 'ib20053', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'BernaĹĄĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (466, '20411', 'jk20411', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'KovaÄľ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (467, '20498', 'll20498', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝udovĂ­t', NULL, 'LuÄŤeniÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (468, 'ped204', 'gaspariki', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'GaĹˇparik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (469, '20643', 'jp20643', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'PavloviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (470, '20845', 'pt20845', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'TrnovskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (471, '99331', 'mk99331', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Kerni', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (472, '20791', 'ms20791', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miloslav', NULL, 'Ĺ ipka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (473, '99333', 'mk99333', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Kiselkov', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (474, '20896', 'dz20896', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Dalibor', NULL, 'ZahorĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (475, '20678', 'mp20678', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Pozor', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (476, '20512', 'lm20512', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝ubomĂ­r', NULL, 'MajtĂˇs', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (477, '99618', 'ps99618', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'SkoÄŤĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (478, '20344', 'dk20344', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Daniel', NULL, 'Katana', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (479, '99718', 'ku99718', NULL, '098f6bcd4621d373cade4e832627b4f6', 'KatarĂ­na', NULL, 'UherkovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (480, '20023', 'mb20023', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Bali', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (481, '99520', 'sn99520', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ĺ tefan', NULL, 'NovĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (482, '20254', 'mh20254', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'HoleÄŤka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (483, '99601', 'ms99601', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Salai', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (484, '20013', 'ra20013', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'ArpĂˇĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (485, 'd10', 'ahd10', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Alexander', NULL, 'HĂ˝bal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (486, '99110', 'jc99110', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'ÄŚĂşzy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (487, '22616', 'rm22616', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Mirc', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (488, '20534', 'jm20534', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jakub', NULL, 'MaĹľgut', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (489, '99023', 'vb99023', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VladimĂ­r', NULL, 'BalaĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (490, '20550', 'om20550', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Mikita', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (491, '20930', 'mz20930', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Ĺ˝uĹľo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (492, '20585', 'en20585', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Emil', NULL, 'NĂˇhlik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (493, '20597', 'mn20597', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Niejadlik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (494, '20609', 'jo20609', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Obert', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (495, '21363', 'dk21363', NULL, '098f6bcd4621d373cade4e832627b4f6', 'DĂˇvid', NULL, 'Kaleta', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (496, '20617', 'po20617', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Orosi', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (497, '20656', 'mp20656', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Petrov', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (498, '20710', 'mr20710', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'RusnĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (499, '20742', 'rs20742', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'SolĂ­n', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (500, '20782', 'es20782', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Erik', NULL, 'Ĺ ille', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (501, '20788', 'ps20788', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ĺ imĂşn', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (502, '21932', 'mv21932', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Vesel', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (503, '20798', 'ms20798', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Ĺ oltis', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (504, '21098', 'jb21098', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'BruteniÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (505, '20897', 'jz20897', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Zajac', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (506, '52116', 'rs52116', NULL, '098f6bcd4621d373cade4e832627b4f6', 'RadomĂ­r', NULL, 'Ĺ krib', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (507, '99040', 'pb99040', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'BednĂˇr', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (508, '99057', 'rb99057', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'BertuĹˇek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (509, '99222', 'mh99222', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Hinka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (510, '20209', 'mg20209', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Gregor', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (511, '98049', 'blazekj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'BlaĹľek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (512, '99271', 'ec99271', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Eduard', NULL, 'Chrvala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (513, '20014', 'mb20014', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Babala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (514, '20009', 'ma20009', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'AradskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (515, '20010', 'pa20010', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'ArgalĂˇĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (516, '20017', 'tb20017', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Backo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (517, '35', 'nehezm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'NehĂ©z', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (518, '20067', 'rb20067', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'BĂłdi', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (519, '20077', 'db20077', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Daniel', NULL, 'BrnĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (520, '21130', 'pd21130', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'DaniĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (521, '20128', 'md20128', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'DĂˇvid', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (522, '20142', 'md20142', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Donoval', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (523, '20157', 'pd20157', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'DuĹˇek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (524, '20198', 'lg20198', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'GaĹľo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (525, '21814', 'rs21814', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radim', NULL, 'Stoklasa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (526, '21039', 'pb21039', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Bartalos', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (527, '20222', 'zh20222', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zuzana', NULL, 'HalanovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (528, '21061', 'ib21061', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Berta', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (529, '20508', 'jm20508', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'MĂˇjek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (530, '21561', 'tm21561', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'MatĂşĹˇek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (531, '21333', 'mj21333', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'JĂˇnoĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (532, '20544', 'mm20544', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MaroĹˇ', NULL, 'MiÄŤuda', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (533, '20651', 'pp20651', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Perec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (534, '20294', 'vi20294', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vojtech', NULL, 'Imrecze', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (535, '21929', 'mv21929', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'VeleckĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (536, '20347', 'mk20347', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Kelemen', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (537, '20351', 'pk20351', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Khandl', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (538, '20370', 'lk20370', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Kluka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (539, '21744', 'lr21744', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Rendek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (540, 'dek001', 'mackovaz', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Zuzana', NULL, 'MackovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (541, '47', 'vojtekv', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladimir', NULL, 'Vojtek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (542, '21003', 'la21003', NULL, '098f6bcd4621d373cade4e832627b4f6', 'LukĂˇĹˇ', NULL, 'Adamec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (543, '98419', 'rl98419', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'Lauko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (544, '98160', 'rf98160', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radovan', NULL, 'FraĹo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (545, '60', 'fischerovam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MĂˇria', NULL, 'FischerovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (546, '97308', 'ivancom', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MaroĹˇ', NULL, 'IvanÄŤo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (547, '98320', 'p', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Palo', NULL, 'KiĹˇa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (548, '67', 'kycinap', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavel', NULL, 'KyÄŤina', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (549, '66', 'cicakovao', NULL, '098f6bcd4621d373cade4e832627b4f6', 'OÄľga', NULL, 'ÄŚiÄŤĂˇkovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (550, '99619', 'as99619', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'Slamka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (551, '12001', 'hantuch', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Hantuch', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (552, '21230', 'vg21230', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vladislav', NULL, 'German', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (553, '21543', 'jm21543', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Manduch', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (554, '21820', 'js21820', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Suchal', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (555, '21851', 'is21851', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Ĺ kovran', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (556, '21981', 'pz21981', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ĺ˝idek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (557, '12009', 'vojvodam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'Vojvoda', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (558, '21074', 'mb21074', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'BlesĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (559, '21874', 'ps21874', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ĺ tuller', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (560, '21913', 'jv21913', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'VĂˇclavĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (561, '21918', 'fv21918', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Filip', NULL, 'ValaĹˇek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (562, '10001', 'kinderr', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rudolf', NULL, 'Kinder', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (563, '27', 'krajcovict', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tibor', NULL, 'KrajÄŤoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (564, '21973', 'az21973', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Adam', NULL, 'Ĺ˝Ăˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (565, '21642', 'po21642', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'OchodnickĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (566, '12011', 'kvasnicka', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VladimĂ­r', NULL, 'KvasniÄŤka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (567, '20243', 'mh20243', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Herceg', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (568, '21341', 'mj21341', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Jemala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (569, '59', 'kotmanovad', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Daniela', NULL, 'KotmanovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (570, '20479', 'rl20479', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'Lenz', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (571, '22354', 'mj22354', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marian', NULL, 'JanoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (572, '99509', 'in99509', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'NemÄŤovskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (573, '20283', 'mc20283', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'ChalĂˇny', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (574, '20465', 'tl20465', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Laho', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (575, '20520', 'pm20520', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Markusek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (576, '99289', 'rj99289', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'JanÄŤiga', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (577, '21623', 'bn21623', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Benedikt', NULL, 'Nagy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (578, '98050', 'turbo', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'BlĹˇtĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (579, '12', 'galbavym', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'GalbavĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (580, 'ped202', 'baloghr', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'Balogh', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (581, '21610', 'mm21610', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'MoÄŤol', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (582, '21495', 'll21495', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ä˝ubomĂ­r', NULL, 'LajoĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (583, '21844', 'ps21844', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ĺ inkoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (584, '56', 'bagalaa', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Adrian', NULL, 'Bagala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (585, 'a001', 'filkorn', NULL, '098f6bcd4621d373cade4e832627b4f6', 'admin', NULL, 'Filkorn', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (586, 'a003', 'singer', NULL, '098f6bcd4621d373cade4e832627b4f6', 'admin', NULL, 'SpevĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (587, 'mikol', 'mk', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Kolarovic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (588, '12020', 'talandam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Talanda', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (589, '21679', 'ip21679', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'Peev', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (590, '21269', 'th21269', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'HlatkĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (591, '21434', 'ik21434', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'KovĂˇÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (592, '21374', 'rk21374', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Roman', NULL, 'KaĹľimĂ­r', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (593, '21203', 'pf21203', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'FĂĽlĂ¶p', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (594, '21327', 'pj21327', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Jalec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (595, '20562', 'vm20562', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VladimĂ­r', NULL, 'MlynaroviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (596, '21763', 'ms21763', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Sabo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (597, '21727', 'pp21727', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Pavol', NULL, 'Prikryl', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (598, '21824', 'ps21824', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'SĂ˝kora', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (599, '20706', 'mr20706', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'RohĂˇÄŤek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (600, '21186', 'af21186', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'FiflĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (601, '21410', 'mk21410', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Komara', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (602, '21787', 'ps21787', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'SivĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (603, '20071', 'jb20071', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Borlok', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (604, '21887', 'tt21887', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'TatranskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (605, '21225', 'sg21225', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ĺ tefan', NULL, 'GembickĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (606, '21818', 'ms21818', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Strhan', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (607, '20876', 'lv20876', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ladislav', NULL, 'Venczel', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (608, '21132', 'md21132', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Darula', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (609, '21980', 'jz21980', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Ĺ˝iak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (610, '20892', 'jw20892', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'Wagner', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (611, '21828', 'ks21828', NULL, '098f6bcd4621d373cade4e832627b4f6', 'KristiĂˇn', NULL, 'Szobi', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (612, '12019', 'chomistr', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Richard', NULL, 'Chomist', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (613, '21438', 'mk21438', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MatĂşĹˇ', NULL, 'KovĂˇÄŤik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (614, '21155', 'fd21155', NULL, '098f6bcd4621d373cade4e832627b4f6', 'FrantiĹˇek', NULL, 'ÄŽurajka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (615, '21156', 'md21156', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'ÄŽurfina', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (616, '21270', 'jh21270', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'HlavĂˇÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (617, '20425', 'mk20425', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'KrchĹavĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (618, '21644', 'to21644', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Ă–lveckĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (619, '21909', 'mu21909', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MatĂşĹˇ', NULL, 'UherÄŤĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (620, '98815', 'vv98815', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Viliam', NULL, 'Vesek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (621, '99396', 'jk99396', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'KudjĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (622, '20829', 'mt20829', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MariĂˇn', NULL, 'TĂ­nes', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (623, '20384', 'mk20384', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Koprla', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (624, '21279', 'kh21279', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Kieu Hung', NULL, 'Hoang', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (625, '21917', 'pv21917', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'ValachoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (626, '20078', 'mb20078', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'BubanskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (627, '20165', 'mf20165', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Fabok', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (628, '20866', 'mv20866', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MikulĂˇĹˇ', NULL, 'Vallo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (629, '21924', 'mv21924', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MariĂˇn', NULL, 'VaĹˇĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (630, '52213', 'th52213', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Hajas', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (631, '111111', 'bielik', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MĂˇria', NULL, 'Bielik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (632, '20887', 'mv20887', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'VrĂˇbel', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (633, '21875', 'rs21875', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Radko', NULL, 'Ĺ tulrajter', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (634, '20020', 'tb20020', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'BaÄŤa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (635, '21165', 'je21165', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'EliĂˇĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (636, '21251', 'mh21251', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Handrlica', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (637, '21084', 'tb21084', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Tibor', NULL, 'Borka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (638, '20221', 'mh20221', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'HalĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (639, '21245', 'mh21245', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Habala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (640, '21372', 'pk21372', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Kasan', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (641, '21429', 'ak21429', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Attila', NULL, 'Kotrba', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (642, '21728', 'pp21728', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Prikryl', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (643, '21908', 'mt21908', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'TvaroĹľek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (644, '21051', 'mb21051', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'BeluĹˇĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (645, '21092', 'mb21092', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'Braun', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (646, '99043', 'pb99043', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'BelĂˇĹ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (647, '20265', 'eh20265', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Erik', NULL, 'HorvĂˇth', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (648, '21037', 'mb21037', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Barla', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (649, '20753', 'vs20753', NULL, '098f6bcd4621d373cade4e832627b4f6', 'VladimĂ­r', NULL, 'Straka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (650, '21829', 'vs21829', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Vojtech', NULL, 'SzĂ¶cs', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (651, '21072', 'ib21072', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'BlanĂˇrik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (652, '20304', 'mj20304', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'JakubovskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (653, '21381', 'pk21381', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Kiselkov', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (654, '22268', 'oh22268', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'Hirjak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (655, '28', 'makulam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'Makula', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (656, '20401', 'mk20401', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'KovĂˇÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (657, '23778', 'ms23778', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Matej', NULL, 'SzabĂł', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (658, '22497', 'mk22497', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'KvasniÄŤka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (659, '99531', 'do99531', NULL, '098f6bcd4621d373cade4e832627b4f6', 'DalimĂ­r', NULL, 'OrfĂˇnus', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (660, '5', 'bielikovam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MĂˇria', NULL, 'BielikovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (661, '20180', 'mf20180', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'FuÄŤila', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (662, '21462', 'jk21462', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'KriĹˇka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (663, '20090', 'jb20090', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Buno', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (664, '20851', 'mt20851', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Tury', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (665, '99102', 'mc99102', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'ÄŚatloĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (666, '20492', 'ml20492', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'LokĹˇa', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (667, '20797', 'js20797', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Ĺ nirc', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (668, '99455', 'jm99455', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Malcho', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (669, '20317', 'mj20317', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'JenÄŤo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (670, '55', 'torokt', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Timotej', NULL, 'TĂ¶rĂ¶k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (671, '22060', 'tb22060', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'Bielik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (672, '30', 'markm', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MĂˇria', NULL, 'MarkoĹˇovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (673, 'ext0008', 'liskam', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'LĂ­Ĺˇka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (674, '53', 'ziakj', NULL, '098f6bcd4621d373cade4e832627b4f6', 'JĂˇn', NULL, 'Ĺ˝iak', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (675, '23731', 'ts23731', NULL, '098f6bcd4621d373cade4e832627b4f6', 'TomĂˇĹˇ', NULL, 'SelnekoviÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (676, '22353', 'ij22353', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Igor', NULL, 'JĂˇnoĹˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (677, '98389', 'mk98389', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Kubik', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (678, '23763', 'js23763', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'StanĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (679, '22336', 'pi22336', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ivanka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (680, '23383', 'pk23383', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Kohaut', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (681, '22863', 'ms22863', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MariĂˇn', NULL, 'Ĺ imko', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (682, '23001', 'ja23001', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jaroslav', NULL, 'Abaffy', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (683, '23836', 'jt23836', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Tomaschek', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (684, '23592', 'im23592', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ivan', NULL, 'Mrva', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (685, '22414', 'mk22414', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Kobza', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (686, '22866', 'ls22866', NULL, '098f6bcd4621d373cade4e832627b4f6', 'LukĂˇĹˇ', NULL, 'Ĺ imon', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (687, '21157', 'ad21157', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Andrej', NULL, 'ÄŽurica', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (688, '22793', 'js22793', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Jozef', NULL, 'SlezĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (689, '22134', 'od22134', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Ondrej', NULL, 'DanÄŤĂ­k', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (690, '71', 'frivoltgy', NULL, '098f6bcd4621d373cade4e832627b4f6', 'GyĂ¶rgy', NULL, 'Frivolt', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (691, '22380', 'mk22380', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Miroslav', NULL, 'Kallo', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (692, '23211', 'mg23211', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Gregor', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (693, '23290', 'rh23290', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Rastislav', NULL, 'HudĂˇk', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (694, '23688', 'jp23688', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Juraj', NULL, 'Pristach', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (695, '21102', 'mb21102', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Martin', NULL, 'Bujna', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (696, '22865', 'ps22865', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Ĺ imno', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (697, '22655', 'ln22655', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Lucia', NULL, 'NovickĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (698, '20288', 'mc20288', NULL, '098f6bcd4621d373cade4e832627b4f6', 'MariĂˇn', NULL, 'Chovanec', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (699, '23626', 'so23626', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Stanislav', NULL, 'OndĂˇÄŤ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (700, '23781', 'bs23781', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Branislav', NULL, 'Szeliga', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (701, '23856', 'pt23856', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Peter', NULL, 'Tylka', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (702, '21223', 'mg21223', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Marek', NULL, 'GecelovskĂ˝', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (703, '21183', 'mf21183', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Michal', NULL, 'Fiala', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (704, '41', 'simakovav', NULL, '098f6bcd4621d373cade4e832627b4f6', 'ValĂ©ria', NULL, 'Ĺ imĂˇkovĂˇ', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
INSERT INTO users VALUES (705, '24', 'kolesar', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Milan', NULL, 'KolesĂˇr', NULL, 'hidden@franto.sk', NULL, NULL, NULL, NULL, NULL, 20, 0);
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


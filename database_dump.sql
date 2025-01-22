--
-- PostgreSQL database dump
--

-- Dumped from database version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 16.3

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ac_guitar; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.ac_guitar (
    id bigint NOT NULL,
    name character varying(255),
    dates_avaliable date[],
    email character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    times_used integer
);


ALTER TABLE public.ac_guitar OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: ac_guitar_id_seq; Type: SEQUENCE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE SEQUENCE public.ac_guitar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ac_guitar_id_seq OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: ac_guitar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER SEQUENCE public.ac_guitar_id_seq OWNED BY public.ac_guitar.id;


--
-- Name: bassists; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.bassists (
    id bigint NOT NULL,
    name character varying(255),
    dates_unavailable date[],
    email character varying(255),
    times_used integer,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.bassists OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: bassists_id_seq; Type: SEQUENCE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE SEQUENCE public.bassists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bassists_id_seq OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: bassists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER SEQUENCE public.bassists_id_seq OWNED BY public.bassists.id;


--
-- Name: drummers; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.drummers (
    id bigint NOT NULL,
    name character varying(255),
    dates_avaliable date[],
    cajon_only boolean DEFAULT false NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    email character varying(255),
    times_used integer
);


ALTER TABLE public.drummers OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: drummers_id_seq; Type: SEQUENCE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE SEQUENCE public.drummers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.drummers_id_seq OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: drummers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER SEQUENCE public.drummers_id_seq OWNED BY public.drummers.id;


--
-- Name: el_guitar; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.el_guitar (
    id bigint NOT NULL,
    name character varying(255),
    dates_avaliable date[],
    email character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    times_used integer
);


ALTER TABLE public.el_guitar OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: el_guitar_id_seq; Type: SEQUENCE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE SEQUENCE public.el_guitar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.el_guitar_id_seq OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: el_guitar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER SEQUENCE public.el_guitar_id_seq OWNED BY public.el_guitar.id;


--
-- Name: keyboards; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.keyboards (
    id bigint NOT NULL,
    name character varying(255),
    dates_avaliable date[],
    email character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    times_used integer
);


ALTER TABLE public.keyboards OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: keyboards_id_seq; Type: SEQUENCE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE SEQUENCE public.keyboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.keyboards_id_seq OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: keyboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER SEQUENCE public.keyboards_id_seq OWNED BY public.keyboards.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE public.schema_migrations OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: services; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    songs character varying(255)[],
    notes character varying(255),
    submitter character varying(255),
    rehearsal_time1 timestamp(0) without time zone,
    rehearsal_time_2 timestamp(0) without time zone,
    date timestamp(0) without time zone,
    preacher bigint,
    drummer bigint,
    acoustic bigint,
    electric bigint,
    keyboard bigint,
    vocalist1 bigint,
    vocalist2 bigint,
    vocalist3 bigint,
    vocalist4 bigint,
    slides bigint,
    sound bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    bassist_id bigint,
    sounds2 bigint,
    email_sent boolean,
    updated boolean,
    sound2 bigint,
    service_order character varying(255)
);


ALTER TABLE public.services OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: slides; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.slides (
    id bigint NOT NULL,
    name character varying(255),
    dates_avaliable date[],
    email character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    times_used integer
);


ALTER TABLE public.slides OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: slides_id_seq; Type: SEQUENCE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE SEQUENCE public.slides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.slides_id_seq OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER SEQUENCE public.slides_id_seq OWNED BY public.slides.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.songs (
    id bigint NOT NULL,
    name character varying(255),
    artist character varying(255),
    songselect character varying(255),
    youtube character varying(255),
    type character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.songs OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE SEQUENCE public.songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.songs_id_seq OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: sounds; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.sounds (
    id bigint NOT NULL,
    name character varying(255),
    dates_avaliable date[],
    email character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    times_used integer
);


ALTER TABLE public.sounds OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: sounds_id_seq; Type: SEQUENCE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE SEQUENCE public.sounds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sounds_id_seq OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: sounds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER SEQUENCE public.sounds_id_seq OWNED BY public.sounds.id;


--
-- Name: speakers; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.speakers (
    id bigint NOT NULL,
    name character varying(255),
    dates_preaching date[],
    email character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    times_used integer
);


ALTER TABLE public.speakers OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: speakers_id_seq; Type: SEQUENCE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE SEQUENCE public.speakers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.speakers_id_seq OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: speakers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER SEQUENCE public.speakers_id_seq OWNED BY public.speakers.id;


--
-- Name: submitter_autocomplete; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.submitter_autocomplete (
    id bigint NOT NULL,
    name character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.submitter_autocomplete OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: submitter_autocomplete_id_seq; Type: SEQUENCE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE SEQUENCE public.submitter_autocomplete_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submitter_autocomplete_id_seq OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: submitter_autocomplete_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER SEQUENCE public.submitter_autocomplete_id_seq OWNED BY public.submitter_autocomplete.id;


--
-- Name: test; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.test (
    name character varying(255)
);


ALTER TABLE public.test OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: vocalists; Type: TABLE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE TABLE public.vocalists (
    id bigint NOT NULL,
    name character varying(255),
    dates_avaliable date[],
    email character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    times_used integer
);


ALTER TABLE public.vocalists OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: vocalists_id_seq; Type: SEQUENCE; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE SEQUENCE public.vocalists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vocalists_id_seq OWNER TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";

--
-- Name: vocalists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER SEQUENCE public.vocalists_id_seq OWNED BY public.vocalists.id;


--
-- Name: ac_guitar id; Type: DEFAULT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.ac_guitar ALTER COLUMN id SET DEFAULT nextval('public.ac_guitar_id_seq'::regclass);


--
-- Name: bassists id; Type: DEFAULT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.bassists ALTER COLUMN id SET DEFAULT nextval('public.bassists_id_seq'::regclass);


--
-- Name: drummers id; Type: DEFAULT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.drummers ALTER COLUMN id SET DEFAULT nextval('public.drummers_id_seq'::regclass);


--
-- Name: el_guitar id; Type: DEFAULT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.el_guitar ALTER COLUMN id SET DEFAULT nextval('public.el_guitar_id_seq'::regclass);


--
-- Name: keyboards id; Type: DEFAULT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.keyboards ALTER COLUMN id SET DEFAULT nextval('public.keyboards_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: slides id; Type: DEFAULT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.slides ALTER COLUMN id SET DEFAULT nextval('public.slides_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Name: sounds id; Type: DEFAULT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.sounds ALTER COLUMN id SET DEFAULT nextval('public.sounds_id_seq'::regclass);


--
-- Name: speakers id; Type: DEFAULT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.speakers ALTER COLUMN id SET DEFAULT nextval('public.speakers_id_seq'::regclass);


--
-- Name: submitter_autocomplete id; Type: DEFAULT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.submitter_autocomplete ALTER COLUMN id SET DEFAULT nextval('public.submitter_autocomplete_id_seq'::regclass);


--
-- Name: vocalists id; Type: DEFAULT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.vocalists ALTER COLUMN id SET DEFAULT nextval('public.vocalists_id_seq'::regclass);


--
-- Data for Name: ac_guitar; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.ac_guitar (id, name, dates_avaliable, email, inserted_at, updated_at, times_used) FROM stdin;
3	 Bloodworth	{2024-09-01,2024-10-06}	jc-bloodworth@wiu.edu	2024-08-21 18:44:08	2024-08-26 14:39:19	1
1	Cody Clair	{2024-09-29,2024-10-27}	cr-clair@wiu.edu	2024-07-14 21:10:34	2024-08-31 19:23:01	0
4	Nathan Tillman	{1969-01-01}	Nr-tillman@wiu.edu	2024-11-03 22:44:01	2024-11-03 22:44:01	0
5	Luke Little	\N	Lj-little2@wiu.edu 	2024-11-12 02:27:28	2024-11-12 02:27:28	2
\.


--
-- Data for Name: bassists; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.bassists (id, name, dates_unavailable, email, times_used, inserted_at, updated_at) FROM stdin;
2	Avery Le'Jeune	{1969-01-01}	lejeuneavery@gmail.com	1	2024-08-30 19:14:42	2024-08-30 19:14:42
1	Cody Clair	{2024-09-29,2024-10-27}	cr-clair@wiu.edu	0	2024-07-19 22:13:46	2024-08-31 19:23:27
3	Josie Mullens	{1969-01-01}	josiemcsc@gmail.com	0	2024-09-29 18:32:13	2024-09-29 18:32:13
4	Luke Hobbs	{1969-01-01}	la-hobbs@wiu.edu	0	2024-10-03 05:38:42	2024-10-03 05:38:42
5	Luke Little	{1969-01-01}	Lj-little2@wiu.edu 	\N	2024-11-12 02:26:43	2024-11-12 19:30:38
6	Nathan Tillman	{1969-01-01}	nr-tillman@wiu.edu	0	2024-11-13 19:28:43	2024-11-13 19:28:43
\.


--
-- Data for Name: drummers; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.drummers (id, name, dates_avaliable, cajon_only, inserted_at, updated_at, email, times_used) FROM stdin;
4	 Bloodworth	{2024-09-01,2024-10-06}	t	2024-08-26 14:36:53	2024-08-26 14:39:41	jc-bloodworth@wiu.edu	0
1	Luke Little	{2024-09-01,2024-10-20,2024-10-27,2024-11-03}	f	2024-07-13 21:06:50	2024-08-27 19:30:49	lj-little2@wiu.edu	0
2	Cody Clair	{2024-09-29,2024-10-27}	f	2024-07-17 21:15:38	2024-08-31 19:23:51	cr-clair@wiu.edu	1
3	Allison Milby	{2024-10-06,2024-10-13}	t	2024-08-26 13:57:28	2024-10-10 15:56:06	ag-milby@wiu.edu	0
\.


--
-- Data for Name: el_guitar; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.el_guitar (id, name, dates_avaliable, email, inserted_at, updated_at, times_used) FROM stdin;
3	Abby Fleming	{2024-08-25}	a-fleming@wiu.edu	2024-08-29 01:53:11	2024-08-29 01:53:11	0
2	Cody Clair	{2024-10-27,2024-09-29}	cr-clair@wiu.edu	2024-08-21 18:38:19	2024-09-12 04:28:07	0
4	Vanya Bramasco 	{2024-09-15,2024-10-06,2024-10-13,2024-09-22}	v-bramasco@wiu.edu	2024-09-07 17:53:52	2024-09-12 16:02:59	\N
\.


--
-- Data for Name: keyboards; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.keyboards (id, name, dates_avaliable, email, inserted_at, updated_at, times_used) FROM stdin;
2	Allison Milby	{2024-10-06}	ag-milby@wiu.edu	2024-08-26 13:56:09	2024-08-26 13:56:09	0
3	Julietta Marini 	{2024-09-01,2024-09-22,2024-09-29,2024-10-06,2024-10-13,2024-10-20,2024-11-10}	JN-Marini@wiu.edu	2024-08-26 16:21:39	2024-08-26 16:21:39	0
1	Elyse Hutchins	{2024-11-03}	emhutchins4@gmail.com	2024-07-14 21:03:33	2024-09-17 15:22:15	3
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.schema_migrations (version, inserted_at) FROM stdin;
20240713210158	2024-07-13 21:02:11
20240713211735	2024-07-13 21:35:34
20240713211802	2024-07-13 21:35:34
20240713211822	2024-07-13 21:35:34
20240713211838	2024-07-13 21:35:34
20240713211904	2024-07-13 21:35:34
20240713211921	2024-07-13 21:35:34
20240713212022	2024-07-13 21:35:34
20240713212102	2024-07-13 21:35:34
20240713213208	2024-07-13 21:35:35
20240713221324	2024-07-13 22:21:31
20240714183815	2024-07-14 18:53:19
20240715013018	2024-07-15 01:32:59
20240715013513	2024-07-15 01:36:40
20240715013824	2024-07-15 01:38:51
20240717012356	2024-07-17 01:25:51
20240719164356	2024-07-19 21:46:53
20240721213836	2024-07-21 21:47:40
20240723234102	2024-07-23 23:42:12
20240806043159	2024-08-06 04:36:49
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.services (id, songs, notes, submitter, rehearsal_time1, rehearsal_time_2, date, preacher, drummer, acoustic, electric, keyboard, vocalist1, vocalist2, vocalist3, vocalist4, slides, sound, inserted_at, updated_at, bassist_id, sounds2, email_sent, updated, sound2, service_order) FROM stdin;
61	{Egypt,"Lead Me to the Cross","My Feet Are on the Rock","Rest on Us","This Is Amazing Grace"}	This is late lol- lemme know if this doesn't work	Cody	2024-11-16 15:00:00	2024-11-17 15:30:00	2024-11-17 17:00:00	1	2	3	\N	1	1	\N	\N	\N	2	3	2024-08-26 13:22:55	2024-11-15 18:24:39	\N	\N	f	t	5	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
53	{"All My Boast Is In Jesus",Cornerstone,Remembrance,"Be Thou My Vision","All The People Said Amen"}	Hey guys thanks for serving! Check out rehearsal times. See you Saturday!	Cody	2024-09-14 09:00:00	2024-09-15 15:00:00	2024-09-15 17:00:00	2	1	1	\N	1	8	\N	\N	\N	12	1	2024-08-26 13:19:48	2024-09-12 04:29:07	\N	\N	f	t	5	\N
51	{"The Lion and the Lamb",Egypt,"In Christ Alone","Reckless Love","This Is Amazing Grace"}	Hey guys! Thanks for serving. Double check rehearsal time! I'm leading LatL and In Christ Alone, Ally doing Egypt, Andrew Reckless Love	Cody	2024-08-31 15:00:00	2024-09-01 15:30:00	2024-09-01 17:00:00	1	\N	1	\N	2	9	\N	\N	\N	4	4	2024-08-26 13:18:41	2024-08-28 15:38:12	\N	\N	f	f	6	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
55	{"Goodness Of God","Nothing But The Blood","Open Up The Heavens","Unstoppable God","What A Beautiful Name"}	Hey guys, again this is pretty far in advance, but check out the dates and let us know if you can't make it. 	Cody	2024-09-25 21:15:00	2024-09-29 15:00:00	2024-09-29 17:00:00	2	1	3	\N	2	2	10	\N	\N	2	1	2024-08-26 13:20:33	2024-09-26 15:18:53	\N	\N	f	f	3	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
54	{"Graves Into Gardens",Homecoming,"How Great Thou Art",Jireh,Rattle!}	Hey guys! This is pretty far in advance so pay close attention to dates. And remember- you can always check what you will be scheduled on in the app at csc-worship-app-4.gigalixirapp.com	Cody	2024-09-18 21:08:00	2024-09-22 15:00:00	2024-09-22 17:00:00	2	1	3	2	1	9	\N	\N	\N	13	3	2024-08-26 13:20:09	2024-09-17 15:21:46	\N	\N	f	f	\N	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
36	{"Build Your Kingdom Here","Come As You Are",Freedom,"Give Us Clean Hands","Worthy Of It All"}	This is no longer a test, and you are now scheduled for CSC Worship on the 25th! Please try to come five minutes early for an informal devotion! -Cody	Cody	2024-08-24 08:55:00	2024-08-25 15:00:00	2024-08-25 17:00:00	1	2	3	\N	1	3	\N	\N	\N	2	1	2024-08-07 18:49:18	2024-09-26 15:20:36	\N	\N	t	f	3	We don't have this yet, but we will soon! The order is Freedom, CAYA, WOIA, GUCH, BYKH
64	\N	\N	\N	\N	\N	2024-10-02 19:00:00	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 17:39:12	2024-09-29 17:39:12	\N	\N	f	f	\N	\N
65	\N	\N	\N	\N	\N	2024-10-09 19:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 17:39:38	2024-09-29 17:39:38	\N	\N	f	f	\N	\N
66	\N	\N	\N	\N	\N	2024-10-16 19:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 17:40:07	2024-09-29 17:40:07	\N	\N	f	f	\N	\N
67	\N	\N	\N	\N	\N	2024-10-23 19:00:00	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 17:40:47	2024-09-29 17:40:47	\N	\N	f	f	\N	\N
68	\N	\N	\N	\N	\N	2024-10-30 19:00:00	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 17:41:16	2024-09-29 17:41:16	\N	\N	f	f	\N	\N
69	\N	\N	\N	\N	\N	2024-11-06 19:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 17:41:41	2024-09-29 17:41:41	\N	\N	f	f	\N	\N
71	\N	\N	\N	\N	\N	2024-11-20 19:00:00	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 17:42:40	2024-09-29 17:42:40	\N	\N	f	f	\N	\N
72	\N	\N	\N	\N	\N	2024-12-04 19:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-29 17:43:09	2024-09-29 17:43:09	\N	\N	f	f	\N	\N
52	{"Firm Foundation",Gratitude,"Made for More","My Testimony",Praise}	Thank you for serving! Let me know if you want to know the keys. Make sure rehearsal times work! -Cody	Cody	2024-09-07 09:00:00	2024-09-08 15:00:00	2024-09-08 17:00:00	2	2	3	\N	3	10	2	\N	\N	1	3	2024-08-26 13:19:06	2024-09-29 18:21:56	\N	\N	f	f	\N	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
56	{"All Creatures of Our God And King","Blessed Be Your Name","Great is thy Faithfulness","Open The Eyes of My Heart","There's Nothing That Our God Can't Do"}	Again a pretty far in advance service, this is fall break! Rehearsal is Wednesday as I (Cody) am busy all day Saturday.	Cody	2024-10-02 21:10:00	2024-10-06 15:30:00	2024-10-06 17:00:00	\N	\N	1	\N	1	7	\N	\N	\N	4	8	2024-08-26 13:20:54	2024-09-30 15:45:22	\N	\N	f	t	5	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
63	{"Honey in The Rock",Praise,Scatter,"So Will I","The Blessing"}	Same set as worship night big band. Only one rehearsal necessary, not including our rehearsal TONIGHT!	\N	2024-10-30 21:15:00	2024-11-10 15:45:00	2024-11-10 17:00:00	\N	1	3	2	1	7	\N	\N	\N	2	3	2024-08-26 14:53:05	2024-10-30 14:05:38	\N	\N	t	f	1	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
57	{"All Praise To Him","From The Inside Out","Good Good Father","I will Follow","Prince of Peace (You are Holy)"}	Homecoming weekend- practice is Wednesday. Order is POP, GGF, FTIO, APTH, IWF	Cody	2024-10-09 21:10:00	2024-10-13 15:30:00	2024-10-13 17:00:00	1	1	1	\N	2	\N	\N	\N	\N	4	\N	2024-08-26 13:21:15	2024-10-09 15:59:36	\N	\N	f	t	4	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
58	{"Fall Like Rain","Here Again","Highlands (Song of Ascent)","House of the Lord","I Thank God"}	Not this week but the next! Should be a good set.	\N	2024-10-16 21:10:00	2024-10-20 15:00:00	2024-10-20 17:00:00	1	2	3	\N	1	1	\N	\N	\N	13	4	2024-08-26 13:21:39	2024-10-17 18:35:11	\N	\N	f	f	5	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
60	{Abide,"Build Your Kingdom Here","Honey in The Rock","In Christ Alone",Remembrance}	Hey everyone sorry for late notice. Please respond to this email letting us know if these times work for you ASAP. We'll have song keys soon.	Cody	2024-11-02 19:00:00	2024-11-03 15:30:00	2024-11-03 17:00:00	\N	4	1	\N	3	7	10	\N	\N	4	1	2024-08-26 13:22:27	2024-10-30 15:16:06	\N	\N	f	t	3	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
59	{"New Wine"}	Sorry for the late notice. Songs are still being decided, we will let you know as soon as we decide. Let us know ASAP if you can't do 9 on Saturday	\N	2024-10-26 09:00:00	2024-10-27 15:00:00	2024-10-27 17:00:00	\N	\N	3	\N	2	9	\N	\N	\N	2	3	2024-08-26 13:21:59	2024-10-23 16:25:41	\N	\N	t	f	\N	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
70	{"Goodness Of God","Graves Into Gardens","It's Always Been You","The Potter's Hand","Your Grace is Enough "}	Testimony Night playing- Rehearsal after service and $2 on the 10th	Cody	2024-11-10 17:30:00	1982-12-04 00:40:00	2024-11-13 19:00:00	\N	1	4	\N	1	2	11	\N	\N	\N	5	2024-09-29 17:42:07	2024-11-10 06:41:13	\N	\N	t	f	3	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
62	{"Angels We Have Heard on High","Go Tell It On The Mountain","It Came Upon A Midnight Clear","Joy to the World (Unspeakable Joy)","Light of the World","Silent Night! Holy Night!"}	Christmas service! Please let us know if we need to change these rehearsals. It may have to change anyways because Cody has PMA...	Cody	2024-12-07 16:00:00	2024-12-08 15:00:00	2024-12-08 17:00:00	1	1	1	\N	1	7	\N	\N	\N	1	1	2024-08-26 13:24:17	2024-11-19 02:45:18	6	\N	t	t	8	https://docs.google.com/document/d/15-51_uo8RuBV680akRcO2H2CoJzvLJVJvxq7HJC6jag/edit
\.


--
-- Data for Name: slides; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.slides (id, name, dates_avaliable, email, inserted_at, updated_at, times_used) FROM stdin;
2	Emma Dart	{1969-01-01}	eg-dart@wiu.edu	2024-08-21 18:40:21	2024-08-21 18:40:21	1
5	John Miller (Wednesday Nights)	\N	john@wiucsc.org	2024-08-26 14:19:19	2024-08-26 14:19:19	0
6	Josie Mullens (Wednesday Nights) 	\N	josie@wiucsc.org	2024-08-26 14:19:39	2024-08-26 14:19:39	0
7	 Bloodworth	{2024-09-01,2024-10-06}	jc-bloodworth@wiu.edu	2024-08-26 14:38:12	2024-08-26 14:40:07	0
3	Avery Le'Jeune 	{1969-01-01}	lejeuneavery@gmail.com	2024-08-26 14:07:17	2024-08-26 15:47:36	0
8	Emma Bird	{2024-09-01,2024-09-29,2024-10-27}	ej-bird@wiu.edu	2024-08-26 19:45:40	2024-08-26 19:45:40	0
9	Bel Schable	{2024-09-08,2024-09-01}	il-schable@wiu.edu	2024-08-26 23:49:38	2024-08-26 23:49:38	2
10	Ellieana Walden	{2024-09-29}	ej-walden@wiu.edu	2024-08-27 03:01:12	2024-08-27 03:01:12	0
1	Andrew Allen	{2024-10-13}	ar-allen@wiu.edu	2024-07-14 21:18:29	2024-09-01 21:38:08	0
12	Julietta Marini	{2024-10-06,2024-10-20,2024-11-10,2024-09-01,2024-09-22,2024-09-29,2024-10-13}	JN-Marini@wiu.edu	2024-09-08 21:35:21	2024-09-08 21:36:38	0
13	Emerson Hicks	{1969-01-01}	ec-hicks@wiu.edu	2024-09-12 04:26:58	2024-09-12 04:27:03	0
4	Cora Gregersen	{2024-09-15,2024-09-29,2024-09-22,2024-11-13}	cs-gregersen@wiu.edu	2024-08-26 14:11:27	2024-10-18 19:38:05	\N
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.songs (id, name, artist, songselect, youtube, type, inserted_at, updated_at) FROM stdin;
1	Graves Into Gardens	Elevation Worship	https://songselect.ccli.com/songs/7138219/graves-into-gardens	https://www.youtube.com/watch?v=KwX1f2gYKZ4	upbeat	2024-07-13 22:23:02	2024-07-13 22:23:02
2	New Wine	Hillsong Worship	https://songselect.ccli.com/songs/7102397/new-wine	https://www.youtube.com/watch?v=1ozGKlOzEVc	Slow	2024-07-13 22:24:30	2024-07-13 22:24:30
4	What A Beautiful Name	Hillsong	\N	https://www.youtube.com/watch?v=nQWFzMvCfLE	\N	2024-07-28 14:56:38	2024-07-30 15:33:11
6	Holy Holy Holy	Harvest	\N	https://www.youtube.com/watch?v=gSX2INwFtlg	\N	2024-07-28 14:57:17	2024-08-04 23:05:17
7	Abide	The Worship Initiative	\N	https://youtu.be/OLFCaiDTfkA?si=plM8ah1RenGR7nYu	6/8, slow	2024-08-07 18:55:39	2024-08-07 18:55:39
8	Come As You Are	Crowder	https://songselect.ccli.com/songs/7017790/come-as-you-are	https://www.youtube.com/watch?v=r2zhf2mqEMI	Slow	2024-08-21 18:49:25	2024-08-21 18:49:25
9	Worthy Of It All	David Brymer	https://songselect.ccli.com/songs/6280644/worthy-of-it-all	https://www.youtube.com/watch?v=fff1c-HZf50	slow	2024-08-21 18:51:55	2024-08-21 18:51:55
10	Freedom	Jesus Culture	https://songselect.ccli.com/songs/7078151/freedom	https://www.youtube.com/watch?v=dKxeZsZvp7E	Fast	2024-08-21 19:02:44	2024-08-21 19:02:44
11	Give Us Clean Hands	Chris Tomlin	https://songselect.ccli.com/songs/2060208/give-us-clean-hands	https://www.youtube.com/watch?v=Rv55qS7v2-c	Slow	2024-08-21 19:03:43	2024-08-21 19:03:43
12	Build Your Kingdom Here	Rend Collective	https://songselect.ccli.com/songs/6186078/build-your-kingdom-here	https://www.youtube.com/watch?v=sbdJXKqVgtg	Fast	2024-08-21 19:04:49	2024-08-21 19:04:49
13	The Lion and the Lamb	Big Daddy Weave	\N	https://youtu.be/5iuUFf4LOOE?si=7rdTu8B4vGvpiUZk	\N	2024-08-27 19:44:42	2024-08-27 19:44:42
14	Egypt	Cory Asbury	\N	https://youtu.be/uEeCl1KyXiI?si=Trr3U2-m_NTRooZN	\N	2024-08-27 19:45:45	2024-08-27 19:45:45
15	In Christ Alone	Getty's	\N	https://youtu.be/16KYvfIc2bE?si=NNdsgDMKFt4ATSof	\N	2024-08-27 19:48:16	2024-08-27 19:48:16
16	Reckless Love	Cory Asbury	\N	https://youtu.be/Sc6SSHuZvQE?si=1Rr4j-gU8jr6GTM6	\N	2024-08-27 19:48:46	2024-08-27 19:48:46
17	This Is Amazing Grace	Phil Whickham	\N	https://youtu.be/XFRjr_x-yxU?si=1yBvHZDPeeOQrHmR	\N	2024-08-27 19:50:13	2024-08-27 19:50:13
18	My Testimony	Elevation	\N	https://www.youtube.com/watch?v=7NyH9mDYECk	\N	2024-09-01 21:42:22	2024-09-01 21:42:22
19	Made for More	Josh Baldwin	\N	https://www.youtube.com/watch?v=4HZk6fMl29E	\N	2024-09-03 00:20:57	2024-09-03 00:20:57
20	Gratitude	Brandon Lake	\N	https://www.youtube.com/watch?v=UoHrBNTfzIs	\N	2024-09-03 00:21:22	2024-09-03 00:21:22
21	Firm Foundation	Cody Carnes	\N	https://www.youtube.com/watch?v=x9ndiD0_qNk	\N	2024-09-03 00:21:55	2024-09-03 00:21:55
22	Praise	Brandon Lake	\N	https://www.youtube.com/watch?v=f2oxGYpuLkw	\N	2024-09-03 00:22:46	2024-09-03 00:22:46
23	All My Boast Is In Jesus	CityAlight	\N	https://youtu.be/Q3bV2TN7QHk?si=oVyyzOhv76RxYKgL	\N	2024-09-10 15:07:51	2024-09-10 15:07:51
24	Cornerstone	Hillsong Worship	\N	https://youtu.be/izrk-erhDdk?si=VK7kF9gr1GDpWbxD	big	2024-09-10 15:08:52	2024-09-10 15:08:52
25	Remembrance	Hillsong Worship	\N	https://www.youtube.com/watch?v=U9kbdFCSrFU	slow, communion	2024-09-12 02:21:42	2024-09-12 02:21:42
26	Be Thou My Vision	4Him	\N	https://www.youtube.com/watch?v=aTKoZZL8XRQ	hymn	2024-09-12 02:32:08	2024-09-12 02:32:08
27	All The People Said Amen	Matt Maher	\N	https://www.youtube.com/watch?v=R377Az6RQiI	upbeat	2024-09-12 02:33:38	2024-09-12 02:33:38
28	Rattle!	Elevation	\N	https://www.youtube.com/watch?v=xrAdbH28gIg	\N	2024-09-12 02:35:41	2024-09-12 02:35:41
29	Jireh	Elevation	\N	https://www.youtube.com/watch?v=mC-zw0zCCtg	\N	2024-09-12 02:37:42	2024-09-12 02:37:42
30	Homecoming	Cory Asbury	\N	https://www.youtube.com/watch?v=TM-L-L7OD_A	\N	2024-09-12 02:39:35	2024-09-12 02:39:35
31	How Great Thou Art	Lauren Daigle	\N	https://www.youtube.com/watch?v=p-hvI1nbS80	\N	2024-09-12 02:41:18	2024-09-12 02:41:18
32	Unstoppable God	Elevation Worship	\N	https://www.youtube.com/watch?v=De6gZZT1690	fast	2024-09-12 02:42:39	2024-09-12 02:42:39
33	Goodness Of God	CeCe Winans	\N	https://www.youtube.com/watch?v=y81yIo1_3o8	\N	2024-09-12 02:49:20	2024-09-12 02:49:20
34	Nothing But The Blood	Chris Tomlin	\N	https://www.youtube.com/watch?v=UtsxdtEN_G4	\N	2024-09-12 02:50:15	2024-09-12 02:50:15
35	Open Up The Heavens	Vertical	\N	https://www.youtube.com/watch?v=eF9pVCDHN_4	\N	2024-09-12 02:51:17	2024-09-12 02:51:17
36	There's Nothing That Our God Can't Do	Matt Redman	\N	https://www.youtube.com/watch?v=5MChgCghLJg	fast	2024-09-12 02:53:04	2024-09-12 02:53:04
37	All Creatures of Our God And King	N/A	\N	https://www.youtube.com/watch?v=MUZD0hgtSgE	\N	2024-09-12 02:53:46	2024-09-12 02:53:46
38	Open The Eyes of My Heart	Michael W Smith	\N	https://www.youtube.com/watch?v=yxq_6prPABs	\N	2024-09-12 02:54:24	2024-09-12 02:54:24
39	Great is thy Faithfulness	Maverick City	\N	https://www.youtube.com/watch?v=NT0HcAr9aeI	\N	2024-09-12 02:54:59	2024-09-12 02:54:59
40	Blessed Be Your Name	Matt Redman	\N	https://www.youtube.com/watch?v=tTpTQ4kBLxA	\N	2024-09-12 02:56:17	2024-09-12 02:56:17
41	Prince Of Peace	Michael W. Smith	\N	https://www.youtube.com/watch?v=QsYyuK1w3q0	\N	2024-09-29 18:34:41	2024-09-29 18:34:41
42	Good Good Father	Chris Tomlin	\N	https://www.youtube.com/watch?v=CqybaIesbuA	\N	2024-09-29 18:37:23	2024-09-29 18:37:23
43	Prince of Peace (You are Holy)	Michael W. Smith	\N	https://www.youtube.com/watch?v=QsYyuK1w3q0	\N	2024-10-07 04:08:20	2024-10-07 04:08:20
44	From The Inside Out	Hillsong Worship	\N	https://youtu.be/F881DVFZr8g?si=NhTcm8bkfp9B33y6	\N	2024-10-07 04:09:11	2024-10-07 04:09:11
45	All Praise To Him	Soverign Grace	\N	https://youtu.be/qJnuApqDenc?si=Y5FU7rE0nXvRPqpz	\N	2024-10-07 04:09:49	2024-10-07 04:09:49
46	I will Follow	Chris Tomlin	\N	https://youtu.be/1ohvhmGSfxI?si=amSChbow-ea47gId	\N	2024-10-07 04:10:13	2024-10-07 04:10:13
47	House of the Lord	Phil Whickham	\N	https://youtu.be/h8uKldEUrPE?si=8M4qlmLdP_rRl0A7	\N	2024-10-07 04:10:46	2024-10-07 04:10:46
48	Highlands (Song of Ascent)	Hillsong	\N	https://youtu.be/mkbxP0rxt6E?si=sw93KTRziFKEtB-L	\N	2024-10-07 04:11:29	2024-10-07 04:11:29
49	Here Again	Elevation Worship	\N	https://youtu.be/aIdZ5KRiakM?si=gUpw1yVe501s3NvJ	\N	2024-10-07 04:12:01	2024-10-07 04:12:01
50	Fall Like Rain	Passion	\N	https://youtu.be/EBViaxqy04w?si=-ja09QcHP64aK6-3	\N	2024-10-07 04:12:37	2024-10-07 04:12:37
51	I Thank God	Maverick City	\N	https://youtu.be/LM1qrx0Huds?si=5pSiK4lk7UKcLXuB	\N	2024-10-07 04:13:07	2024-10-07 04:13:07
52	Old Church Choir	Zach Williams	\N	https://youtu.be/-cRh8NqmXoE?si=s1wQlFpOZH2mD-Um	\N	2024-10-07 04:20:03	2024-10-07 04:20:03
53	Honey in The Rock	Brooke Lighterwood	\N	https://youtu.be/UiApoXKRYFc?si=SLW3C4Q8RhG2wkBN	\N	2024-10-07 04:20:42	2024-10-07 04:20:42
54	Scatter	Anne Wilson	\N	https://www.youtube.com/watch?v=-fpMOirga4Q	\N	2024-10-30 14:02:39	2024-10-30 14:02:39
55	So Will I	Hillsong	\N	https://youtu.be/GfVd5x9W1Xc?si=hvW0KVhDbUg8vczU	\N	2024-10-30 14:03:05	2024-10-30 14:03:05
56	The Blessing	Kari Jobe	\N	https://youtu.be/Zp6aygmvzM4?si=max8QalkQPPdDQ2j	\N	2024-10-30 14:04:11	2024-10-30 14:04:11
57	It's Always Been You	Phil Whickham	\N	https://youtu.be/BDURInx_GUk?si=GW3FykvAH53B62BJ	Slow	2024-11-08 14:49:57	2024-11-08 14:49:57
58	The Heart Of Worship	Matt Redman	\N	https://youtu.be/0XsB0ltXmRs?si=WD3nEBSYynPBuVMC	Slow	2024-11-08 14:51:13	2024-11-08 14:51:13
59	The Potter's Hand	Hillsong	\N	https://youtu.be/TleYjvNqKGo?si=FPpoIzVZjTcr6ZO_	\N	2024-11-10 06:37:00	2024-11-10 06:37:00
60	Your Grace is Enough 	Matt Redman	\N	https://youtu.be/TleYjvNqKGo?si=gy3NNfWd_5b_NOnS	\N	2024-11-10 06:37:57	2024-11-10 06:37:57
61	It Came Upon A Midnight Clear	Unknown	\N	https://youtu.be/m71c9p9a1dA?si=LT_vr4Cktj1zTAHR	\N	2024-11-13 18:38:28	2024-11-13 18:38:28
62	Joy to the World (Unspeakable Joy)	Chris Tomlin	\N	https://youtu.be/rqxMvvptf9I?si=NJuc1FVAV3pxqHWo	\N	2024-11-13 19:06:37	2024-11-13 19:06:37
64	Angels We Have Heard on High	Third Day	\N	https://youtu.be/F6_Ho-5Zbq8?si=U_MTh1Co2Ppp2Eoh	\N	2024-11-13 19:08:29	2024-11-13 19:08:29
63	Light of the World	Lauren Daigle	\N	https://youtu.be/_cLhaZIBSpo?si=tKQzQYKmeWfOxwSW	\N	2024-11-13 19:07:13	2024-11-13 19:07:13
65	Silent Night! Holy Night!	Phil Whickham	\N	https://youtu.be/TidbG3AL_LM?si=xwx9aeplERmBWA8J	\N	2024-11-13 19:10:17	2024-11-13 19:10:17
66	Go Tell It On The Mountain	Somebody	\N	https://youtu.be/HCDswefIGdQ?si=vDL0AMz03G8fkyvB	\N	2024-11-13 19:18:51	2024-11-13 19:18:51
67	Rest on Us	Maverick	\N	https://youtu.be/R8MZbl-GRdY?si=UTkI2CBecLJ34dGJ	\N	2024-11-13 19:19:23	2024-11-13 19:19:23
68	My Feet Are on the Rock	I Am They	\N	https://youtu.be/2uYiHiJTN6Y?si=EPwVEl07Eud4aHUG	\N	2024-11-13 19:20:27	2024-11-13 19:20:27
69	Lead Me to the Cross	Hillsong	\N	https://youtu.be/vdq9Q8wJdjc?si=pg-YOcV2GF5TK3S_	\N	2024-11-13 19:22:59	2024-11-13 19:22:59
\.


--
-- Data for Name: sounds; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.sounds (id, name, dates_avaliable, email, inserted_at, updated_at, times_used) FROM stdin;
4	Avery Le'Jeune 	{1969-01-01}	lejeuneavery@gmail.com	2024-08-26 14:06:28	2024-08-26 15:48:28	0
5	Bel Schable	{2024-09-08,2024-09-01}	il-schable@wiu.edu	2024-08-26 23:51:41	2024-08-26 23:51:41	0
6	Cora Wolford	{1969-01-01}	cm-wolford@wiu.edu	2024-08-27 19:33:09	2024-08-27 19:33:09	0
3	Aiden Dersien	{2024-09-01}	a-dersien@wiu.edu	2024-08-21 18:39:28	2024-08-27 19:41:23	0
2	Cody Clair	{2024-09-29,2024-10-27}	cr-clair@wiu.edu	2024-08-04 02:04:44	2024-08-31 19:24:05	0
8	Emma Dart	{1969-01-01}	eg-dart@wiu.edu	2024-09-03 00:41:13	2024-09-03 00:41:13	\N
10	Julietta Marini 	{2024-10-06,2024-10-20,2024-11-10,2024-09-01,2024-09-22,2024-09-29,2024-10-13}	JN-Marini@wiu.edu	2024-09-08 21:38:38	2024-09-08 21:39:10	0
7	 Vanya Bramasco	{2024-09-15,2024-10-06,2024-12-08,2024-10-13,2024-09-22}	v-bramasco@wiu.edu	2024-08-27 19:43:19	2024-09-12 16:01:03	0
1	Jordan Ovanic	{1969-01-01}	jovanic2000@gmail.com	2024-07-14 21:14:24	2024-09-13 14:05:47	4000
\.


--
-- Data for Name: speakers; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.speakers (id, name, dates_preaching, email, inserted_at, updated_at, times_used) FROM stdin;
1	John Miller	{2024-07-14}	jmillcsc@gmail.com	2024-07-13 23:27:52	2024-07-26 03:45:38	\N
2	Brother Mark Boley 	{2024-09-08,2024-09-22,2024-09-29,2024-10-20}	ms-boley@wiu.edu 	2024-08-26 14:17:39	2024-08-26 14:17:39	0
3	Avery Le'Jeune 	{2024-10-27}	lejeuneavery@gmail.com	2024-08-26 14:18:15	2024-08-26 14:18:15	0
\.


--
-- Data for Name: submitter_autocomplete; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.submitter_autocomplete (id, name, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.test (name) FROM stdin;
\.


--
-- Data for Name: vocalists; Type: TABLE DATA; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

COPY public.vocalists (id, name, dates_avaliable, email, inserted_at, updated_at, times_used) FROM stdin;
2	Elyse Hutchins	{2024-08-20}	emhutchins4@gmail.com	2024-08-04 18:47:01	2024-08-06 04:08:51	0
3	Mary Hammond	{1969-01-01}	mc-hammond2@wiu.edu	2024-08-07 19:02:12	2024-08-07 21:07:40	0
5	Allison Milby	{2024-10-06}	ag-milby@wiu.edu	2024-08-26 13:56:50	2024-08-26 13:56:50	0
6	 Bloodworth	{2024-09-01,2024-10-06}	jc-bloodworth@wiu.edu	2024-08-26 14:37:45	2024-08-26 14:39:52	0
7	Emma Bird	{2024-09-01,2024-09-29,2024-10-27}	ej-bird@wiu.edu	2024-08-26 19:42:14	2024-08-26 19:44:04	\N
8	Ellieana Walden	{2024-09-29}	ej-walden@wiu.edu	2024-08-27 03:01:55	2024-08-27 03:01:55	0
10	Faith Procopio	{2024-10-06,2024-11-17}	fa-procopio@wiu.edu	2024-08-27 19:38:52	2024-08-28 01:12:40	0
9	Andrew Allen	{2024-10-13}	ar-allen@wiu.edu	2024-08-27 19:35:04	2024-09-01 21:37:51	0
1	Cora Gregersen	{2024-09-15,2024-09-29,2024-09-22,2024-11-13}	cs-gregersen@wiu.edu	2024-07-14 21:19:40	2024-10-18 19:37:33	\N
11	Jordan Ovanic	{1969-01-01}	Jovanic2000@gmail.com	2024-11-03 22:47:37	2024-11-03 22:47:37	0
\.


--
-- Name: ac_guitar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

SELECT pg_catalog.setval('public.ac_guitar_id_seq', 5, true);


--
-- Name: bassists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

SELECT pg_catalog.setval('public.bassists_id_seq', 6, true);


--
-- Name: drummers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

SELECT pg_catalog.setval('public.drummers_id_seq', 4, true);


--
-- Name: el_guitar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

SELECT pg_catalog.setval('public.el_guitar_id_seq', 4, true);


--
-- Name: keyboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

SELECT pg_catalog.setval('public.keyboards_id_seq', 3, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

SELECT pg_catalog.setval('public.services_id_seq', 72, true);


--
-- Name: slides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

SELECT pg_catalog.setval('public.slides_id_seq', 13, true);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

SELECT pg_catalog.setval('public.songs_id_seq', 69, true);


--
-- Name: sounds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

SELECT pg_catalog.setval('public.sounds_id_seq', 10, true);


--
-- Name: speakers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

SELECT pg_catalog.setval('public.speakers_id_seq', 3, true);


--
-- Name: submitter_autocomplete_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

SELECT pg_catalog.setval('public.submitter_autocomplete_id_seq', 1, false);


--
-- Name: vocalists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

SELECT pg_catalog.setval('public.vocalists_id_seq', 11, true);


--
-- Name: ac_guitar ac_guitar_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.ac_guitar
    ADD CONSTRAINT ac_guitar_pkey PRIMARY KEY (id);


--
-- Name: bassists bassists_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.bassists
    ADD CONSTRAINT bassists_pkey PRIMARY KEY (id);


--
-- Name: drummers drummers_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.drummers
    ADD CONSTRAINT drummers_pkey PRIMARY KEY (id);


--
-- Name: el_guitar el_guitar_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.el_guitar
    ADD CONSTRAINT el_guitar_pkey PRIMARY KEY (id);


--
-- Name: keyboards keyboards_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.keyboards
    ADD CONSTRAINT keyboards_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: slides slides_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.slides
    ADD CONSTRAINT slides_pkey PRIMARY KEY (id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: sounds sounds_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.sounds
    ADD CONSTRAINT sounds_pkey PRIMARY KEY (id);


--
-- Name: speakers speakers_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.speakers
    ADD CONSTRAINT speakers_pkey PRIMARY KEY (id);


--
-- Name: submitter_autocomplete submitter_autocomplete_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.submitter_autocomplete
    ADD CONSTRAINT submitter_autocomplete_pkey PRIMARY KEY (id);


--
-- Name: vocalists vocalists_pkey; Type: CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.vocalists
    ADD CONSTRAINT vocalists_pkey PRIMARY KEY (id);


--
-- Name: services_acoustic_index; Type: INDEX; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE INDEX services_acoustic_index ON public.services USING btree (acoustic);


--
-- Name: services_drummer_index; Type: INDEX; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE INDEX services_drummer_index ON public.services USING btree (drummer);


--
-- Name: services_electric_index; Type: INDEX; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE INDEX services_electric_index ON public.services USING btree (electric);


--
-- Name: services_keyboard_index; Type: INDEX; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE INDEX services_keyboard_index ON public.services USING btree (keyboard);


--
-- Name: services_preacher_index; Type: INDEX; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE INDEX services_preacher_index ON public.services USING btree (preacher);


--
-- Name: services_slides_index; Type: INDEX; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE INDEX services_slides_index ON public.services USING btree (slides);


--
-- Name: services_sound_index; Type: INDEX; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE INDEX services_sound_index ON public.services USING btree (sound);


--
-- Name: services_vocalist1_index; Type: INDEX; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE INDEX services_vocalist1_index ON public.services USING btree (vocalist1);


--
-- Name: services_vocalist2_index; Type: INDEX; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE INDEX services_vocalist2_index ON public.services USING btree (vocalist2);


--
-- Name: services_vocalist3_index; Type: INDEX; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE INDEX services_vocalist3_index ON public.services USING btree (vocalist3);


--
-- Name: services_vocalist4_index; Type: INDEX; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

CREATE INDEX services_vocalist4_index ON public.services USING btree (vocalist4);


--
-- Name: services services_acoustic_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_acoustic_fkey FOREIGN KEY (acoustic) REFERENCES public.ac_guitar(id);


--
-- Name: services services_bassist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_bassist_id_fkey FOREIGN KEY (bassist_id) REFERENCES public.bassists(id);


--
-- Name: services services_drummer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_drummer_fkey FOREIGN KEY (drummer) REFERENCES public.drummers(id);


--
-- Name: services services_electric_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_electric_fkey FOREIGN KEY (electric) REFERENCES public.el_guitar(id);


--
-- Name: services services_keyboard_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_keyboard_fkey FOREIGN KEY (keyboard) REFERENCES public.keyboards(id);


--
-- Name: services services_preacher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_preacher_fkey FOREIGN KEY (preacher) REFERENCES public.speakers(id);


--
-- Name: services services_slides_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_slides_fkey FOREIGN KEY (slides) REFERENCES public.slides(id);


--
-- Name: services services_sound2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_sound2_fkey FOREIGN KEY (sound2) REFERENCES public.sounds(id);


--
-- Name: services services_sound_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_sound_fkey FOREIGN KEY (sound) REFERENCES public.sounds(id);


--
-- Name: services services_sounds2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_sounds2_fkey FOREIGN KEY (sounds2) REFERENCES public.sounds(id);


--
-- Name: services services_vocalist1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_vocalist1_fkey FOREIGN KEY (vocalist1) REFERENCES public.vocalists(id);


--
-- Name: services services_vocalist2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_vocalist2_fkey FOREIGN KEY (vocalist2) REFERENCES public.vocalists(id);


--
-- Name: services services_vocalist3_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_vocalist3_fkey FOREIGN KEY (vocalist3) REFERENCES public.vocalists(id);


--
-- Name: services services_vocalist4_fkey; Type: FK CONSTRAINT; Schema: public; Owner: e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_vocalist4_fkey FOREIGN KEY (vocalist4) REFERENCES public.vocalists(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO "e0e574fe-8e5c-44f6-ad28-f4850edf7cf3-user";


--
-- PostgreSQL database dump complete
--


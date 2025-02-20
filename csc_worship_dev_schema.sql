--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
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

ALTER TABLE ONLY public.users_tokens DROP CONSTRAINT users_tokens_user_id_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_vocalist4_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_vocalist3_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_vocalist2_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_vocalist1_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_sounds2_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_sound_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_sound2_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_slides_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_preacher_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_keyboard_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_electric_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_drummer_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_bassist_id_fkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_acoustic_fkey;
DROP INDEX public.users_tokens_user_id_index;
DROP INDEX public.users_tokens_context_token_index;
DROP INDEX public.users_email_index;
DROP INDEX public.services_vocalist4_index;
DROP INDEX public.services_vocalist3_index;
DROP INDEX public.services_vocalist2_index;
DROP INDEX public.services_vocalist1_index;
DROP INDEX public.services_sound_index;
DROP INDEX public.services_slides_index;
DROP INDEX public.services_preacher_index;
DROP INDEX public.services_keyboard_index;
DROP INDEX public.services_electric_index;
DROP INDEX public.services_drummer_index;
DROP INDEX public.services_acoustic_index;
ALTER TABLE ONLY public.vocalists DROP CONSTRAINT vocalists_pkey;
ALTER TABLE ONLY public.users_tokens DROP CONSTRAINT users_tokens_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.submitter_autocomplete DROP CONSTRAINT submitter_autocomplete_pkey;
ALTER TABLE ONLY public.speakers DROP CONSTRAINT speakers_pkey;
ALTER TABLE ONLY public.sounds DROP CONSTRAINT sounds_pkey;
ALTER TABLE ONLY public.songs DROP CONSTRAINT songs_pkey;
ALTER TABLE ONLY public.slides DROP CONSTRAINT slides_pkey;
ALTER TABLE ONLY public.services DROP CONSTRAINT services_pkey;
ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
ALTER TABLE ONLY public.keyboards DROP CONSTRAINT keyboards_pkey;
ALTER TABLE ONLY public.el_guitar DROP CONSTRAINT el_guitar_pkey;
ALTER TABLE ONLY public.drummers DROP CONSTRAINT drummers_pkey;
ALTER TABLE ONLY public.bassists DROP CONSTRAINT bassists_pkey;
ALTER TABLE ONLY public.ac_guitar DROP CONSTRAINT ac_guitar_pkey;
ALTER TABLE public.vocalists ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.users_tokens ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.submitter_autocomplete ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.speakers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.sounds ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.songs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.slides ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.services ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.keyboards ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.el_guitar ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.drummers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.bassists ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ac_guitar ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.vocalists_id_seq;
DROP TABLE public.vocalists;
DROP SEQUENCE public.users_tokens_id_seq;
DROP TABLE public.users_tokens;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.submitter_autocomplete_id_seq;
DROP TABLE public.submitter_autocomplete;
DROP SEQUENCE public.speakers_id_seq;
DROP TABLE public.speakers;
DROP SEQUENCE public.sounds_id_seq;
DROP TABLE public.sounds;
DROP SEQUENCE public.songs_id_seq;
DROP TABLE public.songs;
DROP SEQUENCE public.slides_id_seq;
DROP TABLE public.slides;
DROP SEQUENCE public.services_id_seq;
DROP TABLE public.services;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.keyboards_id_seq;
DROP TABLE public.keyboards;
DROP SEQUENCE public.el_guitar_id_seq;
DROP TABLE public.el_guitar;
DROP SEQUENCE public.drummers_id_seq;
DROP TABLE public.drummers;
DROP SEQUENCE public.bassists_id_seq;
DROP TABLE public.bassists;
DROP SEQUENCE public.ac_guitar_id_seq;
DROP TABLE public.ac_guitar;
DROP EXTENSION citext;
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
-- Name: ac_guitar; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.ac_guitar OWNER TO postgres;

--
-- Name: ac_guitar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ac_guitar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ac_guitar_id_seq OWNER TO postgres;

--
-- Name: ac_guitar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ac_guitar_id_seq OWNED BY public.ac_guitar.id;


--
-- Name: bassists; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.bassists OWNER TO postgres;

--
-- Name: bassists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bassists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bassists_id_seq OWNER TO postgres;

--
-- Name: bassists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bassists_id_seq OWNED BY public.bassists.id;


--
-- Name: drummers; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.drummers OWNER TO postgres;

--
-- Name: drummers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drummers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.drummers_id_seq OWNER TO postgres;

--
-- Name: drummers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drummers_id_seq OWNED BY public.drummers.id;


--
-- Name: el_guitar; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.el_guitar OWNER TO postgres;

--
-- Name: el_guitar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.el_guitar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.el_guitar_id_seq OWNER TO postgres;

--
-- Name: el_guitar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.el_guitar_id_seq OWNED BY public.el_guitar.id;


--
-- Name: keyboards; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.keyboards OWNER TO postgres;

--
-- Name: keyboards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.keyboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.keyboards_id_seq OWNER TO postgres;

--
-- Name: keyboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.keyboards_id_seq OWNED BY public.keyboards.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
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
    service_order character varying(255),
    updates boolean
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: slides; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.slides OWNER TO postgres;

--
-- Name: slides_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.slides_id_seq OWNER TO postgres;

--
-- Name: slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slides_id_seq OWNED BY public.slides.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.songs OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.songs_id_seq OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: sounds; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.sounds OWNER TO postgres;

--
-- Name: sounds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sounds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sounds_id_seq OWNER TO postgres;

--
-- Name: sounds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sounds_id_seq OWNED BY public.sounds.id;


--
-- Name: speakers; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.speakers OWNER TO postgres;

--
-- Name: speakers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.speakers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.speakers_id_seq OWNER TO postgres;

--
-- Name: speakers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.speakers_id_seq OWNED BY public.speakers.id;


--
-- Name: submitter_autocomplete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.submitter_autocomplete (
    id bigint NOT NULL,
    name character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.submitter_autocomplete OWNER TO postgres;

--
-- Name: submitter_autocomplete_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.submitter_autocomplete_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submitter_autocomplete_id_seq OWNER TO postgres;

--
-- Name: submitter_autocomplete_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.submitter_autocomplete_id_seq OWNED BY public.submitter_autocomplete.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email public.citext NOT NULL,
    hashed_password character varying(255) NOT NULL,
    confirmed_at timestamp(0) without time zone,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_tokens (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    token bytea NOT NULL,
    context character varying(255) NOT NULL,
    sent_to character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.users_tokens OWNER TO postgres;

--
-- Name: users_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_tokens_id_seq OWNER TO postgres;

--
-- Name: users_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_tokens_id_seq OWNED BY public.users_tokens.id;


--
-- Name: vocalists; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.vocalists OWNER TO postgres;

--
-- Name: vocalists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vocalists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vocalists_id_seq OWNER TO postgres;

--
-- Name: vocalists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vocalists_id_seq OWNED BY public.vocalists.id;


--
-- Name: ac_guitar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ac_guitar ALTER COLUMN id SET DEFAULT nextval('public.ac_guitar_id_seq'::regclass);


--
-- Name: bassists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bassists ALTER COLUMN id SET DEFAULT nextval('public.bassists_id_seq'::regclass);


--
-- Name: drummers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drummers ALTER COLUMN id SET DEFAULT nextval('public.drummers_id_seq'::regclass);


--
-- Name: el_guitar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.el_guitar ALTER COLUMN id SET DEFAULT nextval('public.el_guitar_id_seq'::regclass);


--
-- Name: keyboards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyboards ALTER COLUMN id SET DEFAULT nextval('public.keyboards_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: slides id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slides ALTER COLUMN id SET DEFAULT nextval('public.slides_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Name: sounds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sounds ALTER COLUMN id SET DEFAULT nextval('public.sounds_id_seq'::regclass);


--
-- Name: speakers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speakers ALTER COLUMN id SET DEFAULT nextval('public.speakers_id_seq'::regclass);


--
-- Name: submitter_autocomplete id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submitter_autocomplete ALTER COLUMN id SET DEFAULT nextval('public.submitter_autocomplete_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_tokens ALTER COLUMN id SET DEFAULT nextval('public.users_tokens_id_seq'::regclass);


--
-- Name: vocalists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vocalists ALTER COLUMN id SET DEFAULT nextval('public.vocalists_id_seq'::regclass);


--
-- Name: ac_guitar ac_guitar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ac_guitar
    ADD CONSTRAINT ac_guitar_pkey PRIMARY KEY (id);


--
-- Name: bassists bassists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bassists
    ADD CONSTRAINT bassists_pkey PRIMARY KEY (id);


--
-- Name: drummers drummers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drummers
    ADD CONSTRAINT drummers_pkey PRIMARY KEY (id);


--
-- Name: el_guitar el_guitar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.el_guitar
    ADD CONSTRAINT el_guitar_pkey PRIMARY KEY (id);


--
-- Name: keyboards keyboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyboards
    ADD CONSTRAINT keyboards_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: slides slides_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slides
    ADD CONSTRAINT slides_pkey PRIMARY KEY (id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: sounds sounds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sounds
    ADD CONSTRAINT sounds_pkey PRIMARY KEY (id);


--
-- Name: speakers speakers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speakers
    ADD CONSTRAINT speakers_pkey PRIMARY KEY (id);


--
-- Name: submitter_autocomplete submitter_autocomplete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submitter_autocomplete
    ADD CONSTRAINT submitter_autocomplete_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_tokens users_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_tokens
    ADD CONSTRAINT users_tokens_pkey PRIMARY KEY (id);


--
-- Name: vocalists vocalists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vocalists
    ADD CONSTRAINT vocalists_pkey PRIMARY KEY (id);


--
-- Name: services_acoustic_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_acoustic_index ON public.services USING btree (acoustic);


--
-- Name: services_drummer_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_drummer_index ON public.services USING btree (drummer);


--
-- Name: services_electric_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_electric_index ON public.services USING btree (electric);


--
-- Name: services_keyboard_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_keyboard_index ON public.services USING btree (keyboard);


--
-- Name: services_preacher_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_preacher_index ON public.services USING btree (preacher);


--
-- Name: services_slides_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_slides_index ON public.services USING btree (slides);


--
-- Name: services_sound_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_sound_index ON public.services USING btree (sound);


--
-- Name: services_vocalist1_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_vocalist1_index ON public.services USING btree (vocalist1);


--
-- Name: services_vocalist2_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_vocalist2_index ON public.services USING btree (vocalist2);


--
-- Name: services_vocalist3_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_vocalist3_index ON public.services USING btree (vocalist3);


--
-- Name: services_vocalist4_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_vocalist4_index ON public.services USING btree (vocalist4);


--
-- Name: users_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_index ON public.users USING btree (email);


--
-- Name: users_tokens_context_token_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_tokens_context_token_index ON public.users_tokens USING btree (context, token);


--
-- Name: users_tokens_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_tokens_user_id_index ON public.users_tokens USING btree (user_id);


--
-- Name: services services_acoustic_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_acoustic_fkey FOREIGN KEY (acoustic) REFERENCES public.ac_guitar(id);


--
-- Name: services services_bassist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_bassist_id_fkey FOREIGN KEY (bassist_id) REFERENCES public.bassists(id);


--
-- Name: services services_drummer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_drummer_fkey FOREIGN KEY (drummer) REFERENCES public.drummers(id);


--
-- Name: services services_electric_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_electric_fkey FOREIGN KEY (electric) REFERENCES public.el_guitar(id);


--
-- Name: services services_keyboard_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_keyboard_fkey FOREIGN KEY (keyboard) REFERENCES public.keyboards(id);


--
-- Name: services services_preacher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_preacher_fkey FOREIGN KEY (preacher) REFERENCES public.speakers(id);


--
-- Name: services services_slides_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_slides_fkey FOREIGN KEY (slides) REFERENCES public.slides(id);


--
-- Name: services services_sound2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_sound2_fkey FOREIGN KEY (sound2) REFERENCES public.sounds(id);


--
-- Name: services services_sound_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_sound_fkey FOREIGN KEY (sound) REFERENCES public.sounds(id);


--
-- Name: services services_sounds2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_sounds2_fkey FOREIGN KEY (sounds2) REFERENCES public.sounds(id);


--
-- Name: services services_vocalist1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_vocalist1_fkey FOREIGN KEY (vocalist1) REFERENCES public.vocalists(id);


--
-- Name: services services_vocalist2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_vocalist2_fkey FOREIGN KEY (vocalist2) REFERENCES public.vocalists(id);


--
-- Name: services services_vocalist3_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_vocalist3_fkey FOREIGN KEY (vocalist3) REFERENCES public.vocalists(id);


--
-- Name: services services_vocalist4_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_vocalist4_fkey FOREIGN KEY (vocalist4) REFERENCES public.vocalists(id);


--
-- Name: users_tokens users_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_tokens
    ADD CONSTRAINT users_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


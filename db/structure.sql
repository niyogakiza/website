--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

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
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE knex_migrations OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE knex_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE knex_migrations_id_seq OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE knex_migrations_id_seq OWNED BY knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE knex_migrations_lock (
    is_locked integer
);


ALTER TABLE knex_migrations_lock OWNER TO postgres;

--
-- Name: trainers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE trainers (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    cloudinary_id character varying(255) NOT NULL,
    description text NOT NULL,
    slug character varying(255) NOT NULL
);


ALTER TABLE trainers OWNER TO postgres;

--
-- Name: trainers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trainers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trainers_id_seq OWNER TO postgres;

--
-- Name: trainers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE trainers_id_seq OWNED BY trainers.id;


--
-- Name: training_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE training_locations (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    zipcode character varying(255) NOT NULL,
    country character varying(255) NOT NULL
);


ALTER TABLE training_locations OWNER TO postgres;

--
-- Name: training_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE training_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE training_locations_id_seq OWNER TO postgres;

--
-- Name: training_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE training_locations_id_seq OWNED BY training_locations.id;


--
-- Name: training_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE training_sessions (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    training_id bigint,
    training_location_id bigint
);


ALTER TABLE training_sessions OWNER TO postgres;

--
-- Name: training_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE training_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE training_sessions_id_seq OWNER TO postgres;

--
-- Name: training_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE training_sessions_id_seq OWNED BY training_sessions.id;


--
-- Name: trainings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE trainings (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    duration integer NOT NULL,
    abstract character varying(255) NOT NULL,
    description text NOT NULL,
    cloudinary_id character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    color character varying(255) NOT NULL,
    outline text NOT NULL,
    price integer NOT NULL
);


ALTER TABLE trainings OWNER TO postgres;

--
-- Name: trainings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trainings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trainings_id_seq OWNER TO postgres;

--
-- Name: trainings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE trainings_id_seq OWNED BY trainings.id;


--
-- Name: trainings_trainers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE trainings_trainers (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    training_id bigint,
    trainer_id bigint
);


ALTER TABLE trainings_trainers OWNER TO postgres;

--
-- Name: trainings_trainers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trainings_trainers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trainings_trainers_id_seq OWNER TO postgres;

--
-- Name: trainings_trainers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE trainings_trainers_id_seq OWNED BY trainings_trainers.id;


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY knex_migrations ALTER COLUMN id SET DEFAULT nextval('knex_migrations_id_seq'::regclass);


--
-- Name: trainers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trainers ALTER COLUMN id SET DEFAULT nextval('trainers_id_seq'::regclass);


--
-- Name: training_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY training_locations ALTER COLUMN id SET DEFAULT nextval('training_locations_id_seq'::regclass);


--
-- Name: training_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY training_sessions ALTER COLUMN id SET DEFAULT nextval('training_sessions_id_seq'::regclass);


--
-- Name: trainings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trainings ALTER COLUMN id SET DEFAULT nextval('trainings_id_seq'::regclass);


--
-- Name: trainings_trainers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trainings_trainers ALTER COLUMN id SET DEFAULT nextval('trainings_trainers_id_seq'::regclass);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: trainers trainers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trainers
    ADD CONSTRAINT trainers_pkey PRIMARY KEY (id);


--
-- Name: trainers trainers_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trainers
    ADD CONSTRAINT trainers_slug_unique UNIQUE (slug);


--
-- Name: training_locations training_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY training_locations
    ADD CONSTRAINT training_locations_pkey PRIMARY KEY (id);


--
-- Name: training_sessions training_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY training_sessions
    ADD CONSTRAINT training_sessions_pkey PRIMARY KEY (id);


--
-- Name: trainings trainings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trainings
    ADD CONSTRAINT trainings_pkey PRIMARY KEY (id);


--
-- Name: trainings trainings_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trainings
    ADD CONSTRAINT trainings_slug_unique UNIQUE (slug);


--
-- Name: trainings_trainers trainings_trainers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trainings_trainers
    ADD CONSTRAINT trainings_trainers_pkey PRIMARY KEY (id);


--
-- Name: training_sessions_end_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX training_sessions_end_date_index ON training_sessions USING btree (end_date);


--
-- Name: training_sessions_start_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX training_sessions_start_date_index ON training_sessions USING btree (start_date);


--
-- Name: training_sessions_training_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX training_sessions_training_id_index ON training_sessions USING btree (training_id);


--
-- Name: training_sessions_training_location_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX training_sessions_training_location_id_index ON training_sessions USING btree (training_location_id);


--
-- Name: trainings_trainers_trainer_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX trainings_trainers_trainer_id_index ON trainings_trainers USING btree (trainer_id);


--
-- Name: trainings_trainers_training_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX trainings_trainers_training_id_index ON trainings_trainers USING btree (training_id);


--
-- Name: training_sessions training_sessions_training_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY training_sessions
    ADD CONSTRAINT training_sessions_training_id_foreign FOREIGN KEY (training_id) REFERENCES trainings(id);


--
-- Name: training_sessions training_sessions_training_location_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY training_sessions
    ADD CONSTRAINT training_sessions_training_location_id_foreign FOREIGN KEY (training_location_id) REFERENCES training_locations(id);


--
-- Name: trainings_trainers trainings_trainers_trainer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trainings_trainers
    ADD CONSTRAINT trainings_trainers_trainer_id_foreign FOREIGN KEY (trainer_id) REFERENCES trainers(id);


--
-- Name: trainings_trainers trainings_trainers_training_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trainings_trainers
    ADD CONSTRAINT trainings_trainers_training_id_foreign FOREIGN KEY (training_id) REFERENCES trainings(id);


--
-- PostgreSQL database dump complete
--

-- Knex migrations

INSERT INTO knex_migrations(name, batch, migration_time) VALUES ('20170603173516_init.js, 1, NOW());
INSERT INTO knex_migrations(name, batch, migration_time) VALUES ('20170604191541_trainings-slug.js, 1, NOW());
INSERT INTO knex_migrations(name, batch, migration_time) VALUES ('20170616152405_add-columns-to-training.js, 1, NOW());
INSERT INTO knex_migrations(name, batch, migration_time) VALUES ('20170712113822_create_table_training_sessions.js, 1, NOW());
INSERT INTO knex_migrations(name, batch, migration_time) VALUES ('20170714122843_create_table_trainers.js, 1, NOW());

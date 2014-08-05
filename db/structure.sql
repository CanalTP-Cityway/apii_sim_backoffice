--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: modification_state_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE modification_state_enum AS ENUM (
    'auto',
    'manual',
    'validation_needed',
    'recalculate'
);


--
-- Name: stop_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE stop_type_enum AS ENUM (
    'GL',
    'LAMU',
    'ZE'
);


--
-- Name: transport_mode_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE transport_mode_enum AS ENUM (
    'all',
    'bus',
    'trolleybus',
    'tram',
    'coach',
    'rail',
    'intercityrail',
    'urbanrail',
    'metro',
    'air',
    'water',
    'cable',
    'funicular',
    'taxi',
    'bike',
    'car'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: mis; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mis (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    comment text,
    api_url character varying(255) NOT NULL,
    api_key character varying(255),
    start_date date NOT NULL,
    end_date date NOT NULL,
    geographic_position_compliant boolean,
    multiple_start_and_arrivals integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: mis_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mis_id_seq OWNED BY mis.id;


--
-- Name: mis_mode; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mis_mode (
    id integer NOT NULL,
    mis_id integer NOT NULL,
    mode_id integer NOT NULL
);


--
-- Name: mis_mode_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mis_mode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mis_mode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mis_mode_id_seq OWNED BY mis_mode.id;


--
-- Name: mode; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mode (
    id integer NOT NULL,
    code transport_mode_enum NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: mode_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mode_id_seq OWNED BY mode.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: stop; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stop (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    mis_id integer NOT NULL,
    name character varying(255) NOT NULL,
    lat numeric(19,16) NOT NULL,
    lon numeric(19,16) NOT NULL,
    stop_type stop_type_enum,
    administrative_code character varying(255),
    parent_id integer,
    transport_mode transport_mode_enum,
    quay_type character varying(255),
    geog geography(Point,4326),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    geom geometry
);


--
-- Name: stop_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stop_id_seq OWNED BY stop.id;


--
-- Name: transfer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE transfer (
    id integer NOT NULL,
    stop1_id integer NOT NULL,
    stop2_id integer NOT NULL,
    distance integer NOT NULL,
    duration integer NOT NULL,
    prm_duration integer,
    active boolean DEFAULT true NOT NULL,
    modification_state modification_state_enum,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: transfer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transfer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transfer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transfer_id_seq OWNED BY transfer.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mis ALTER COLUMN id SET DEFAULT nextval('mis_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mis_mode ALTER COLUMN id SET DEFAULT nextval('mis_mode_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mode ALTER COLUMN id SET DEFAULT nextval('mode_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stop ALTER COLUMN id SET DEFAULT nextval('stop_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfer ALTER COLUMN id SET DEFAULT nextval('transfer_id_seq'::regclass);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: mis_mode_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mis_mode
    ADD CONSTRAINT mis_mode_pkey PRIMARY KEY (id);


--
-- Name: mis_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mis
    ADD CONSTRAINT mis_pkey PRIMARY KEY (id);


--
-- Name: mode_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mode
    ADD CONSTRAINT mode_pkey PRIMARY KEY (id);


--
-- Name: stop_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stop
    ADD CONSTRAINT stop_pkey PRIMARY KEY (id);


--
-- Name: transfer_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transfer
    ADD CONSTRAINT transfer_pkey PRIMARY KEY (id);


--
-- Name: index_mis_on_api_url; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_mis_on_api_url ON mis USING btree (api_url);


--
-- Name: index_mis_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_mis_on_name ON mis USING btree (name);


--
-- Name: index_mode_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_mode_on_code ON mode USING btree (code);


--
-- Name: index_stop_on_mis_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stop_on_mis_id ON stop USING btree (mis_id);


--
-- Name: index_transfer_on_stop1_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_transfer_on_stop1_id ON transfer USING btree (stop1_id);


--
-- Name: index_transfer_on_stop2_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_transfer_on_stop2_id ON transfer USING btree (stop2_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO public;

INSERT INTO schema_migrations (version) VALUES ('20140422113956');

INSERT INTO schema_migrations (version) VALUES ('20140422114037');

INSERT INTO schema_migrations (version) VALUES ('20140422114138');

INSERT INTO schema_migrations (version) VALUES ('20140422115407');

INSERT INTO schema_migrations (version) VALUES ('20140422124631');

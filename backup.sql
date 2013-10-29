--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: attendences; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attendences (
    id integer NOT NULL,
    user_id integer,
    vehicle_id integer,
    pick_up_point_id integer,
    employee_id character varying(255),
    status character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    travel_type character varying(255)
);


ALTER TABLE public.attendences OWNER TO postgres;

--
-- Name: attendences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attendences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendences_id_seq OWNER TO postgres;

--
-- Name: attendences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attendences_id_seq OWNED BY attendences.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE logs (
    id integer NOT NULL,
    name character varying(255),
    comment text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE logs_id_seq OWNED BY logs.id;


--
-- Name: logs_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE logs_tags (
    log_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.logs_tags OWNER TO postgres;

--
-- Name: passengers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE passengers (
    id integer NOT NULL,
    user_id integer,
    vehicle_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.passengers OWNER TO postgres;

--
-- Name: passengers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE passengers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passengers_id_seq OWNER TO postgres;

--
-- Name: passengers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE passengers_id_seq OWNED BY passengers.id;


--
-- Name: pick_up_points; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pick_up_points (
    id integer NOT NULL,
    name character varying(255),
    address text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.pick_up_points OWNER TO postgres;

--
-- Name: pick_up_points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pick_up_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pick_up_points_id_seq OWNER TO postgres;

--
-- Name: pick_up_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pick_up_points_id_seq OWNED BY pick_up_points.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: trackpoints; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE trackpoints (
    id integer NOT NULL,
    track_id integer,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    elevation double precision,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public.trackpoints OWNER TO postgres;

--
-- Name: trackpoints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trackpoints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trackpoints_id_seq OWNER TO postgres;

--
-- Name: trackpoints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE trackpoints_id_seq OWNED BY trackpoints.id;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tracks (
    id integer NOT NULL,
    log_id integer,
    distance double precision,
    duration double precision,
    overall_average_speed double precision,
    max_speed double precision,
    ascent double precision,
    descent double precision,
    min_elevation double precision,
    max_elevation double precision,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    moving_time double precision,
    stopped_time double precision,
    moving_average_speed double precision,
    name character varying(255)
);


ALTER TABLE public.tracks OWNER TO postgres;

--
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tracks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracks_id_seq OWNER TO postgres;

--
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tracks_id_seq OWNED BY tracks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255),
    name character varying(255),
    password_digest character varying(255),
    is_admin boolean DEFAULT false,
    last_login_at timestamp without time zone,
    distance_units character varying(255),
    address text,
    contact_no character varying(255),
    blood_group character varying(255),
    emergency_contact_no character varying(255),
    family_doctor_name character varying(255),
    profile_title character varying(255),
    ref_number_1 character varying(255),
    ref_number_2 character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: vehicle_data; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vehicle_data (
    id integer NOT NULL,
    registration_data character varying(255),
    purchase_date_and_year date,
    owner_name character varying(255),
    owner_address text,
    vehicle_detail text,
    vehicle_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.vehicle_data OWNER TO postgres;

--
-- Name: vehicle_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vehicle_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_data_id_seq OWNER TO postgres;

--
-- Name: vehicle_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vehicle_data_id_seq OWNED BY vehicle_data.id;


--
-- Name: vehicle_document_photos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vehicle_document_photos (
    id integer NOT NULL,
    name character varying(255),
    vehicle_data_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone
);


ALTER TABLE public.vehicle_document_photos OWNER TO postgres;

--
-- Name: vehicle_document_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vehicle_document_photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_document_photos_id_seq OWNER TO postgres;

--
-- Name: vehicle_document_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vehicle_document_photos_id_seq OWNED BY vehicle_document_photos.id;


--
-- Name: vehicles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vehicles (
    id integer NOT NULL,
    vehicle_make character varying(255),
    vehicle_number character varying(255),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.vehicles OWNER TO postgres;

--
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vehicles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicles_id_seq OWNER TO postgres;

--
-- Name: vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vehicles_id_seq OWNED BY vehicles.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attendences ALTER COLUMN id SET DEFAULT nextval('attendences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY logs ALTER COLUMN id SET DEFAULT nextval('logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY passengers ALTER COLUMN id SET DEFAULT nextval('passengers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pick_up_points ALTER COLUMN id SET DEFAULT nextval('pick_up_points_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trackpoints ALTER COLUMN id SET DEFAULT nextval('trackpoints_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracks ALTER COLUMN id SET DEFAULT nextval('tracks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehicle_data ALTER COLUMN id SET DEFAULT nextval('vehicle_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehicle_document_photos ALTER COLUMN id SET DEFAULT nextval('vehicle_document_photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehicles ALTER COLUMN id SET DEFAULT nextval('vehicles_id_seq'::regclass);


--
-- Data for Name: attendences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attendences (id, user_id, vehicle_id, pick_up_point_id, employee_id, status, created_at, updated_at, travel_type) FROM stdin;
\.


--
-- Name: attendences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attendences_id_seq', 1, false);


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY logs (id, name, comment, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('logs_id_seq', 1, false);


--
-- Data for Name: logs_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY logs_tags (log_id, tag_id) FROM stdin;
\.


--
-- Data for Name: passengers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY passengers (id, user_id, vehicle_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: passengers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('passengers_id_seq', 1, false);


--
-- Data for Name: pick_up_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pick_up_points (id, name, address, created_at, updated_at) FROM stdin;
\.


--
-- Name: pick_up_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pick_up_points_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20110102164904
20110102164910
20110102164914
20110414161512
20110414165524
20110415121943
20110611154218
20110611161715
20110717201425
20120108031820
20120108032006
20130310145558
20130310145735
20130310145834
20130310145926
20130310150024
20130310162618
20131026024923
20131026032808
20131026040822
20131026044259
20131026044407
20131026044708
20131027070623
20131027070802
20131027071140
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tags (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tags_id_seq', 1, false);


--
-- Data for Name: trackpoints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trackpoints (id, track_id, latitude, longitude, elevation, "time") FROM stdin;
\.


--
-- Name: trackpoints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('trackpoints_id_seq', 1, false);


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tracks (id, log_id, distance, duration, overall_average_speed, max_speed, ascent, descent, min_elevation, max_elevation, start_time, end_time, created_at, updated_at, moving_time, stopped_time, moving_average_speed, name) FROM stdin;
\.


--
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tracks_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, username, name, password_digest, is_admin, last_login_at, distance_units, address, contact_no, blood_group, emergency_contact_no, family_doctor_name, profile_title, ref_number_1, ref_number_2, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at) FROM stdin;
1	sudhirsb2003	Sudhir Vishwakarma	$2a$10$vJXk6jwapXE6vAOlS9jVGehdpdi9xPCEff7.whrzD/pl3sJYLp6AO	t	\N	\N	25667 Aidan Harbors	(650)889-3367 x3596	b+	298.859.4626 x779	Maegan Windler	employee	(592)602-9250 x686	(988)718-9254	2013-10-29 03:44:27.240903	2013-10-29 03:44:27.240903	\N	\N	\N	\N
2	catherine	Milan Batz	$2a$10$NnvdaAaKLq29AnCTiAHagewpXp2g9JZCdAJXrGasl6nn8aB8YefKG	f	\N	\N	4310 Will Island	506-591-2436 x34480	b+	250-946-2383 x1520	Audra Homenick	driver	646-441-8712	(746)713-4412	2013-10-29 03:44:27.364959	2013-10-29 03:44:27.364959	\N	\N	\N	\N
3	maurine_emard	Anika Paucek DVM	$2a$10$PfElnJRQkPftpifjSj4ipO7dVVS6r3gGiPmrHJwwD9UuHQ2IArRzy	f	\N	\N	9633 Waelchi Lodge	1-996-271-0021 x64617	b+	(960)381-1708	Mrs. Torey Schuster	driver	1-221-972-9862 x51873	843.088.9746 x07585	2013-10-29 03:44:27.49211	2013-10-29 03:44:27.49211	\N	\N	\N	\N
4	gerson	Sadye Rodriguez	$2a$10$kEEzSHlHQptsPYZTsY/RJuYZWF6hiUldRCiuR2mc6vXDeRVxtyVHm	f	\N	\N	627 Upton Gateway	1-365-128-3089 x526	b+	(796)374-2653	Dock Rodriguez	driver	155-223-9301 x77079	878.120.5906	2013-10-29 03:44:27.658226	2013-10-29 03:44:27.658226	\N	\N	\N	\N
5	diego.macgyver	Mrs. Damion Murazik	$2a$10$pIoLeE9vtxYOmpjyxDtZ6.IL.DcrTnvFp5iM9EAjCOj7MuV2lK01m	f	\N	\N	68777 Burdette Keys	508.783.8825 x4255	b+	225-427-6498	Mr. Cortney Lang	driver	355.073.4349	1-380-090-5046	2013-10-29 03:44:27.870278	2013-10-29 03:44:27.870278	\N	\N	\N	\N
6	skye	Pierce Kunze	$2a$10$7U6uDZFYXJKJsu74Hr.2M.yiHM8EvsGEMSJwhME4yWCxEXEpAVxVi	f	\N	\N	947 Hodkiewicz Club	(875)480-6232 x89419	b+	(215)003-9205 x785	Enrico Tillman	driver	1-477-801-4169 x44602	(512)183-2615 x5156	2013-10-29 03:44:28.003763	2013-10-29 03:44:28.003763	\N	\N	\N	\N
7	herminia_moriette	Emmanuelle Blick	$2a$10$.ivEN2TrSSwAEFSBzIC8sedZsSYPi.uMul7dWe1foBjMtkrViYq6y	f	\N	\N	3096 Rowan Plain	582-295-9415	b+	1-261-044-7559 x352	Celestine Fadel	driver	(706)242-6235 x1307	(328)253-1341 x488	2013-10-29 03:44:28.108758	2013-10-29 03:44:28.108758	\N	\N	\N	\N
8	bernita	Gustave Morar	$2a$10$edRv.ZWBZ/kFxlY.wXiGj.la4ECkCN3gGZOr5IJA.wwx7fxY4eIqa	f	\N	\N	6637 Nestor Plains	265.797.8927	b+	(625)276-3791 x0181	Yolanda Jerde PhD	driver	(594)659-1174	1-293-678-8459	2013-10-29 03:44:28.20651	2013-10-29 03:44:28.20651	\N	\N	\N	\N
9	nora	Ms. Ernestina Jakubowski	$2a$10$eVFNnDmoC5Frb74KRFmtq.Vb4j172lI5E1pU/qFzodbPAEcvsq8o.	f	\N	\N	7278 Liliane Burg	181.110.9746	b+	637.040.4645 x23464	Imani Botsford	driver	923.761.1882 x0587	(856)770-8940 x522	2013-10-29 03:44:28.353143	2013-10-29 03:44:28.353143	\N	\N	\N	\N
10	dewitt	Dewayne Zboncak IV	$2a$10$GhPxkpPWpubeofr/yvPoquJSkyh5umHq0DJ7qo9uQLtust39fz3Ua	f	\N	\N	6522 Corkery Causeway	1-572-942-2807 x4583	b+	1-836-090-1447 x408	Gabrielle Wunsch	driver	285.692.6433 x2688	(221)721-2730 x3715	2013-10-29 03:44:28.572805	2013-10-29 03:44:28.572805	\N	\N	\N	\N
11	walter	Brady Braun III	$2a$10$dAMMEJGDxav9A.3Ap0Haz.ok6Xu2d7wjWp30OMs9C.mg5X02OzsAi	f	\N	\N	5001 Kulas Springs	739-273-2861 x6163	b+	993-161-2684 x32826	Marcellus Okuneva	driver	675-169-8455 x68812	314.636.3629	2013-10-29 03:44:28.765676	2013-10-29 03:44:28.765676	\N	\N	\N	\N
12	jamel	Madisyn Gorczany	$2a$10$9wxaDyLh3dCF3E4dl5mFGufmBtXQgrtoBDHocepPng4uz1QSScrU2	f	\N	\N	3765 Koch Cape	105.796.3885 x318	b+	1-792-925-6305 x869	Kiel Kulas	driver	443.575.2761 x22880	319-300-0811 x968	2013-10-29 03:44:28.865723	2013-10-29 03:44:28.865723	\N	\N	\N	\N
13	izabella	Sidney Christiansen IV	$2a$10$RaQlz3085y.G9pa4dNhzq.hBqAmEGf0anuAUtOuqpI1/ICeReEoCW	f	\N	\N	791 Kathlyn Hills	1-186-885-4713	b+	579-650-4636	Kaycee Luettgen	driver	(450)300-2540 x91417	565-394-1427	2013-10-29 03:44:28.972266	2013-10-29 03:44:28.972266	\N	\N	\N	\N
14	scot	Vallie Schimmel	$2a$10$384qLCtFrrRoLA3nYatFTO8pKEdMENvA3Mezd.Zfo1rBOfy51YTIi	f	\N	\N	217 Mallory Mall	450-796-8464	b+	674-543-2390 x1077	Lexi Davis	driver	1-632-303-8119	601-575-1071	2013-10-29 03:44:29.095849	2013-10-29 03:44:29.095849	\N	\N	\N	\N
15	abdullah	Frederick Orn	$2a$10$0vUmDs24Ga1FS0OoWwtCDu0ny6YK9xqP7qH.op8wlQ.9DEFx7Q2w2	f	\N	\N	23686 Clint Stream	1-312-239-1794 x4982	b+	1-607-577-2188 x6027	Roy Windler V	driver	(802)349-6755 x3938	909.249.5242 x759	2013-10-29 03:44:29.230546	2013-10-29 03:44:29.230546	\N	\N	\N	\N
16	haan_raynor	Johnathan Hamill	$2a$10$4ST8w.Vr2ooCeS/R9MgYPes1rvB1mdXj/3Yn2SKweznpdOrwO5GCO	f	\N	\N	64727 Nicholaus Knolls	617-227-8793 x4330	b+	(111)634-8915	Dr. Jovani Bogisich	driver	262-889-6617 x38459	(784)286-1549 x068	2013-10-29 03:44:29.368475	2013-10-29 03:44:29.368475	\N	\N	\N	\N
17	raleigh	Claire Collier	$2a$10$rMDw6k3QIwZUWOiTwak7sumXCvSHH6dUiYOAMQg5u1R1.LsSWezse	f	\N	\N	1153 Powlowski Junction	1-403-715-1014 x19640	b+	(451)878-2071	Carroll Murazik	driver	332-419-2247 x691	1-680-564-5822 x2825	2013-10-29 03:44:29.46752	2013-10-29 03:44:29.46752	\N	\N	\N	\N
18	elody	Dr. Tyree Fadel	$2a$10$413WiKi4ARYdoJ2JhNF8qumjUs0vbNbyYqZ0LVo3hwOoa1sNiOMbq	f	\N	\N	53665 Angelita Viaduct	1-725-186-1490 x9098	b+	302-343-8569	Andre Sawayn	driver	(521)260-1918 x31983	(105)569-2677 x9397	2013-10-29 03:44:29.617087	2013-10-29 03:44:29.617087	\N	\N	\N	\N
19	daphne	Dr. Myra Shields	$2a$10$QZEfIeiMeOOguyni.ySZK.4R9MPeO2h1eNdOQwwzuhmZfmETSQNW.	f	\N	\N	55819 Shanel Forge	1-394-510-7638	b+	551-339-1967 x65862	Iva Schroeder PhD	driver	1-551-647-4808 x03580	(627)017-3096 x68067	2013-10-29 03:44:29.788576	2013-10-29 03:44:29.788576	\N	\N	\N	\N
20	jerald_gottlieb	Eliezer Glover	$2a$10$62aAmkkKxNMQ6I5Clk6LUuUqbrFnUiddA7Shp9R.l.fibR5r/kv6u	f	\N	\N	21841 Spencer Fords	536-978-6042 x6873	b+	1-279-545-7572 x28623	Alvah Quigley	driver	425.313.1404	462.481.1707 x02125	2013-10-29 03:44:29.98324	2013-10-29 03:44:29.98324	\N	\N	\N	\N
21	laria	Ulices Homenick	$2a$10$HlydCzxF8V6HMyuoo5/ONOcXz7mtusKT7DoZu9FuajTgj0HC/ZczW	f	\N	\N	9359 Alfred Throughway	(444)647-8177	b+	646.948.9481	Nikita Purdy	driver	959-054-6975 x42063	(132)068-8742 x4735	2013-10-29 03:44:30.099192	2013-10-29 03:44:30.099192	\N	\N	\N	\N
22	ignacio	Lucienne Hoeger DDS	$2a$10$OHD3c0f6HbZl5vkolQkUpufIPM4u.cIw9LMSo0povNBkF60aas13e	f	\N	\N	591 Ada Loaf	798-051-2269 x6722	b+	1-649-483-7737 x0308	Dayana Gerhold	driver	964-473-0680 x30409	915.698.5198 x8824	2013-10-29 03:44:30.192536	2013-10-29 03:44:30.192536	\N	\N	\N	\N
23	ralph	Evie Sipes III	$2a$10$J60QAlhUVOazEQrQKnT5bOpW/pexwrJiqjmuL2JoB48z2q58h1VF6	f	\N	\N	91543 Runte Tunnel	1-490-064-1441	b+	360.727.7986 x535	Trace Hansen	driver	522.438.4302	687.554.4096	2013-10-29 03:44:30.287379	2013-10-29 03:44:30.287379	\N	\N	\N	\N
24	guido_shanahan	Miss Noemie Stracke	$2a$10$gP31RSo4nGk4qj7hr9c8Kebqug7oVNN1aVBr3opV7p60dLisl6ski	f	\N	\N	9866 Humberto Groves	1-968-303-2803	b+	906-639-9136 x84710	Queen Stroman	driver	1-121-303-8949 x941	(843)631-3696 x5720	2013-10-29 03:44:30.383509	2013-10-29 03:44:30.383509	\N	\N	\N	\N
25	ernesto	Merritt Cruickshank	$2a$10$mIzlLqXS.DMDJOsjo.gTdeG03zJJxI6cKE4WqKIIboQYq0qrJRsqK	f	\N	\N	778 Berneice Fort	679-055-1633	b+	660.059.7006 x223	Bertrand Cummings	driver	298.377.2735 x06522	286.912.4174	2013-10-29 03:44:30.481376	2013-10-29 03:44:30.481376	\N	\N	\N	\N
26	rosella	Blair Harvey	$2a$10$2fJrhPCj.fAY7f312EmjU.7u274E50oSpMvy2SL2tNYxff00Xy7CW	f	\N	\N	853 Kreiger Point	866.373.4479	b+	942.924.2651 x055	Deanna Senger	driver	1-203-093-1166	156-504-2866	2013-10-29 03:44:30.586912	2013-10-29 03:44:30.586912	\N	\N	\N	\N
27	te	Jasper Hessel	$2a$10$5OJvXKG1mQJL3BM0Tg21peGevGhIwualRIIebtjckxqmUWA/zeMWq	f	\N	\N	5680 Billy Plains	686-113-1941	b+	669.684.1354 x11599	Emile Langosh	driver	889.923.0814 x03160	(387)182-8489 x16261	2013-10-29 03:44:30.688371	2013-10-29 03:44:30.688371	\N	\N	\N	\N
28	ellis.daugherty	Lily Gaylord	$2a$10$nIEFShD.cljJ4Sh/watiqOu6ExfoVvSSnd5t5VM5t.fxsltwHvGbS	f	\N	\N	6695 Von Key	(508)632-9626 x88022	b+	(766)475-3228	Zakary Leannon DVM	driver	772.338.7945 x31484	454-665-0920	2013-10-29 03:44:30.782006	2013-10-29 03:44:30.782006	\N	\N	\N	\N
29	bret	Sandrine Stamm DVM	$2a$10$34lijPOi40fb47zDmXnwE.CQ.xgFOt8I/EOpsAjkA8ZBhvnfeMdz2	f	\N	\N	39594 Pouros Rapids	279-607-8011	b+	(417)888-2586	Boris Grimes	driver	(921)703-1332 x839	392-268-7576 x82077	2013-10-29 03:44:30.89225	2013-10-29 03:44:30.89225	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 29, true);


--
-- Data for Name: vehicle_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehicle_data (id, registration_data, purchase_date_and_year, owner_name, owner_address, vehicle_detail, vehicle_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: vehicle_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehicle_data_id_seq', 1, false);


--
-- Data for Name: vehicle_document_photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehicle_document_photos (id, name, vehicle_data_id, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at) FROM stdin;
\.


--
-- Name: vehicle_document_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehicle_document_photos_id_seq', 1, false);


--
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehicles (id, vehicle_make, vehicle_number, user_id, created_at, updated_at) FROM stdin;
1	Mahindra	MH 01 AB 1001	2	2013-10-29 03:47:01.058942	2013-10-29 03:47:01.058942
2	Renault	MH 01 AB 1002	3	2013-10-29 03:47:01.087742	2013-10-29 03:47:01.087742
3	Maruti Suzuki	MH 01 AB 1003	4	2013-10-29 03:47:01.107284	2013-10-29 03:47:01.107284
4	Toyota	MH 01 AB 1004	5	2013-10-29 03:47:01.12602	2013-10-29 03:47:01.12602
5	Mahindra	MH 01 AB 1005	6	2013-10-29 03:47:01.147577	2013-10-29 03:47:01.147577
6	Honda	MH 01 AB 1006	7	2013-10-29 03:47:01.167592	2013-10-29 03:47:01.167592
7	Opel	MH 01 AB 1007	8	2013-10-29 03:47:01.189129	2013-10-29 03:47:01.189129
8	Honda	MH 01 AB 1008	9	2013-10-29 03:47:01.209237	2013-10-29 03:47:01.209237
9	Hyundai	MH 01 AB 1009	10	2013-10-29 03:47:01.238792	2013-10-29 03:47:01.238792
10	Toyota	MH 01 AB 1010	11	2013-10-29 03:47:01.261695	2013-10-29 03:47:01.261695
11	General Motor	MH 01 AB 1011	12	2013-10-29 03:47:01.332001	2013-10-29 03:47:01.332001
12	Mahindra	MH 01 AB 1012	13	2013-10-29 03:47:01.403285	2013-10-29 03:47:01.403285
13	Toyota	MH 01 AB 1013	14	2013-10-29 03:47:01.465231	2013-10-29 03:47:01.465231
14	Hyundai	MH 01 AB 1014	15	2013-10-29 03:47:01.520129	2013-10-29 03:47:01.520129
15	Renault	MH 01 AB 1015	16	2013-10-29 03:47:01.581647	2013-10-29 03:47:01.581647
16	Renault	MH 01 AB 1016	17	2013-10-29 03:47:01.651771	2013-10-29 03:47:01.651771
17	Renault	MH 01 AB 1017	18	2013-10-29 03:47:01.719868	2013-10-29 03:47:01.719868
18	Toyota	MH 01 AB 1018	19	2013-10-29 03:47:01.785099	2013-10-29 03:47:01.785099
19	Renault	MH 01 AB 1019	20	2013-10-29 03:47:01.839734	2013-10-29 03:47:01.839734
20	Honda	MH 01 AB 1020	21	2013-10-29 03:47:01.901512	2013-10-29 03:47:01.901512
21	Renault	MH 01 AB 1021	22	2013-10-29 03:47:01.921332	2013-10-29 03:47:01.921332
22	General Motor	MH 01 AB 1022	23	2013-10-29 03:47:01.942738	2013-10-29 03:47:01.942738
23	Mahindra	MH 01 AB 1023	24	2013-10-29 03:47:01.962872	2013-10-29 03:47:01.962872
24	Renault	MH 01 AB 1024	25	2013-10-29 03:47:01.984376	2013-10-29 03:47:01.984376
25	Mahindra	MH 01 AB 1025	26	2013-10-29 03:47:02.004488	2013-10-29 03:47:02.004488
26	Mahindra	MH 01 AB 1026	27	2013-10-29 03:47:02.027638	2013-10-29 03:47:02.027638
27	Renault	MH 01 AB 1027	28	2013-10-29 03:47:02.0479	2013-10-29 03:47:02.0479
28	Honda	MH 01 AB 1028	29	2013-10-29 03:47:02.068009	2013-10-29 03:47:02.068009
\.


--
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehicles_id_seq', 28, true);


--
-- Name: attendences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attendences
    ADD CONSTRAINT attendences_pkey PRIMARY KEY (id);


--
-- Name: logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: passengers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);


--
-- Name: pick_up_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pick_up_points
    ADD CONSTRAINT pick_up_points_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: trackpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trackpoints
    ADD CONSTRAINT trackpoints_pkey PRIMARY KEY (id);


--
-- Name: tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vehicle_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehicle_data
    ADD CONSTRAINT vehicle_data_pkey PRIMARY KEY (id);


--
-- Name: vehicle_document_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehicle_document_photos
    ADD CONSTRAINT vehicle_document_photos_pkey PRIMARY KEY (id);


--
-- Name: vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- Name: index_logs_tags_on_log_id_and_tag_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_logs_tags_on_log_id_and_tag_id ON logs_tags USING btree (log_id, tag_id);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_tags_on_name ON tags USING btree (name);


--
-- Name: index_trackpoints_on_track_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_trackpoints_on_track_id ON trackpoints USING btree (track_id);


--
-- Name: index_tracks_on_log_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_tracks_on_log_id ON tracks USING btree (log_id);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_username ON users USING btree (username);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


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


--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Debian 16.8-1.pgdg120+1)
-- Dumped by pg_dump version 16.8 (Debian 16.8-1.pgdg120+1)

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

DROP DATABASE railway_reserve;
--
-- Name: railway_reserve; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE railway_reserve WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


\connect railway_reserve

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: reservations_passenger; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reservations_passenger (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    age integer NOT NULL,
    gender character varying(10) NOT NULL,
    is_child boolean NOT NULL,
    user_id integer
);


--
-- Name: reservations_passenger_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reservations_passenger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reservations_passenger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reservations_passenger_id_seq OWNED BY public.reservations_passenger.id;


--
-- Name: reservations_ticket; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reservations_ticket (
    id bigint NOT NULL,
    berth_type character varying(20),
    status character varying(15) NOT NULL,
    booking_time timestamp with time zone NOT NULL,
    passenger_id bigint NOT NULL
);


--
-- Name: reservations_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reservations_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reservations_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reservations_ticket_id_seq OWNED BY public.reservations_ticket.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: reservations_passenger id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations_passenger ALTER COLUMN id SET DEFAULT nextval('public.reservations_passenger_id_seq'::regclass);


--
-- Name: reservations_ticket id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations_ticket ALTER COLUMN id SET DEFAULT nextval('public.reservations_ticket_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add passenger	7	add_passenger
26	Can change passenger	7	change_passenger
27	Can delete passenger	7	delete_passenger
28	Can view passenger	7	view_passenger
29	Can add ticket	8	add_ticket
30	Can change ticket	8	change_ticket
31	Can delete ticket	8	delete_ticket
32	Can view ticket	8	view_ticket
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
7	pbkdf2_sha256$260000$BnlwWUEBAmS2f9iA3lpWd6$6V6q8TAI7KgdM0qcz6aCsNNjdOylHmB5JGYMjPqyyGI=	2025-03-16 06:26:38.420275+00	f	rayees				f	t	2025-03-15 09:58:22.636655+00
1	pbkdf2_sha256$260000$up2HtKFVdvdkLQfNl3oMsY$atxdmBeZsQIYUwPdAEykgZsbqvMBkCjvf9Xc6ZUyn+o=	2025-03-16 06:26:51.651716+00	t	railyway_admin			railwayadmin@gmail.com	t	t	2025-03-15 08:11:22.702756+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	reservations	passenger
8	reservations	ticket
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-03-14 16:52:40.73351+00
2	auth	0001_initial	2025-03-14 16:52:41.060861+00
3	admin	0001_initial	2025-03-14 16:52:41.112229+00
4	admin	0002_logentry_remove_auto_add	2025-03-14 16:52:41.132301+00
5	admin	0003_logentry_add_action_flag_choices	2025-03-14 16:52:41.150308+00
6	contenttypes	0002_remove_content_type_name	2025-03-14 16:52:41.170134+00
7	auth	0002_alter_permission_name_max_length	2025-03-14 16:52:41.178117+00
8	auth	0003_alter_user_email_max_length	2025-03-14 16:52:41.186236+00
9	auth	0004_alter_user_username_opts	2025-03-14 16:52:41.193593+00
10	auth	0005_alter_user_last_login_null	2025-03-14 16:52:41.201144+00
11	auth	0006_require_contenttypes_0002	2025-03-14 16:52:41.203856+00
12	auth	0007_alter_validators_add_error_messages	2025-03-14 16:52:41.210944+00
13	auth	0008_alter_user_username_max_length	2025-03-14 16:52:41.221709+00
14	auth	0009_alter_user_last_name_max_length	2025-03-14 16:52:41.2303+00
15	auth	0010_alter_group_name_max_length	2025-03-14 16:52:41.238305+00
16	auth	0011_update_proxy_permissions	2025-03-14 16:52:41.245605+00
17	auth	0012_alter_user_first_name_max_length	2025-03-14 16:52:41.253456+00
18	sessions	0001_initial	2025-03-14 16:52:41.345497+00
20	reservations	0001_initial	2025-03-15 16:47:35.533412+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
xj4ion67e0uu3jagqya50lf0b33ogzbw	e30:1ttOUv:wzPJeOkux90-8LFUiQdA2CcDFQdNZK35Q7Q7jqaKm6k	2025-03-29 10:12:05.515337+00
7cnuz2lk8z3qmfsf8xyffy7iitaike4d	.eJxVjDsOwjAQRO_iGlmJ_6akzxmsXXuNA8iW4qRC3J1ESgHSVPPezJsF2NYStk5LmBO7spFdfjuE-KR6gPSAem88trouM_JD4SftfGqJXrfT_Tso0Mu-jg6NQXB-SNlFVMIOgJZIWaWigAxSkrcqezmCJwQt3B4yVhojtEb2-QL5PDfj:1tthSV:ghc3cspz6NiJtV_d81raSCM9_zH5DysmGLsEhAOhm1A	2025-03-30 06:26:51.654906+00
\.


--
-- Data for Name: reservations_passenger; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reservations_passenger (id, name, age, gender, is_child, user_id) FROM stdin;
1	John Doe	80	F	f	1
2	John Doe	80	M	f	1
3	John Doe	80	M	t	1
4	John Doe	80	F	t	1
5	John Doe	30	M	t	1
6	John Doe	4	M	t	1
7	John Doe	4	M	t	1
8	John Doe	40	M	t	1
9	John Doe	40	M	t	1
10	John Doe	40	M	t	1
11	John Doe	40	M	t	1
12	John Doe	80	M	t	1
13	John Doe	80	M	t	1
14	John Doe	80	M	t	1
15	John Doe	80	M	t	1
16	John Doe	80	M	t	1
17	John Doe	80	M	t	1
18	John Doe	80	M	t	1
19	John Doe	80	M	t	1
20	John Doe	80	M	t	1
21	John Doe	80	M	t	1
22	John Doe	80	M	t	1
23	John Doe	80	M	t	1
24	John Doe	80	M	t	1
25	John Doe	80	M	t	1
26	John Doe	20	M	t	1
27	John Doe	20	M	f	1
28	John Doe	20	M	f	1
29	John Doe	20	M	f	1
30	John Doe	20	M	f	1
31	John Doe	20	M	f	1
32	John Doe	20	M	f	1
33	John Doe	20	M	f	1
34	John Doe	20	M	f	1
35	John Doe	20	M	f	1
36	John Doe	20	M	f	1
37	John Doe	20	M	f	1
38	John Doe	20	M	f	1
39	John Doe	20	M	f	1
40	John Doe	20	M	f	1
41	John Doe	20	M	f	1
42	John Doe	20	M	f	1
43	John Doe	20	M	f	1
45	John Doe	50	F	f	1
46	John Doe	50	F	f	1
47	John Doe	50	F	f	1
48	John Doe	50	F	f	1
49	John Doe	50	F	f	1
50	John Doe	50	F	f	1
51	John Doe	50	F	f	1
52	John Doe	50	F	f	1
53	John Doe	50	F	f	1
54	John Doe	50	F	f	1
55	John Doe	50	F	f	1
56	John Doe	50	F	f	1
57	John Doe	50	F	f	1
58	John Doe	50	F	f	1
59	John Doe	50	F	f	1
60	John Doe	50	F	f	1
61	John Doe	50	F	f	1
62	John Doe	50	F	f	1
63	John Doe	50	F	f	1
64	John Doe	50	F	f	1
65	John Doe	50	F	f	1
66	John Doe	50	F	f	1
67	John Doe	50	F	f	1
68	John Doe	50	F	f	1
69	John Doe	50	F	f	1
70	John Doe	50	F	f	1
71	John Doe	50	F	f	1
72	John Doe	50	F	f	1
73	John Doe	50	F	f	1
74	John Doe	50	F	f	1
75	John Doe	50	F	f	1
76	John Doe	50	F	f	1
77	John Doe	50	F	f	1
78	John Doe	50	F	f	1
79	John Doe	50	F	f	1
80	John Doe	50	F	f	1
81	John Doe	50	F	f	1
82	John Doe	50	F	f	1
83	John Doe	50	F	f	1
84	John Doe	50	F	f	1
85	John Doe	50	F	f	1
86	John Doe	50	F	f	1
87	John Doe	50	F	f	1
88	John Doe	50	F	f	1
89	John Doe	50	F	f	1
90	John Doe	50	F	f	1
91	John Doe	50	F	f	1
96	John Doe	50	F	f	1
97	John Doe	50	F	f	1
98	John Doe	50	F	f	1
99	John Doe	80	F	f	1
103	John Doe	20	F	f	1
104	John Doe	20	F	f	1
105	John Doe	20	F	f	1
106	John Doe	20	F	f	1
107	John Doe	20	F	f	1
108	John Doe	20	F	f	1
109	John Doe	20	F	f	1
110	John Doe	60	F	f	1
111	John Doe	60	F	f	1
112	John Doe	60	F	f	1
113	John Doe	60	F	f	1
114	John Doe	25	M	f	1
115	John Doe	25	M	f	1
116	John Doe	25	M	f	1
117	John Doe	25	M	f	1
118	John Doe	25	M	f	1
119	John Doe	25	M	f	1
120	John Doe	25	M	f	1
121	John Doe	25	M	f	1
122	John Doe	25	M	f	1
\.


--
-- Data for Name: reservations_ticket; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reservations_ticket (id, berth_type, status, booking_time, passenger_id) FROM stdin;
1	LOWER	CONFIRMED	2025-03-15 16:48:15.077432+00	1
2	LOWER	CONFIRMED	2025-03-15 16:48:50.954959+00	2
3	LOWER	CONFIRMED	2025-03-15 16:49:05.045886+00	3
4	LOWER	CONFIRMED	2025-03-15 16:49:52.732947+00	4
5	UPPER	CONFIRMED	2025-03-15 16:50:02.318334+00	5
6	NONE	NO_BERTH	2025-03-15 16:50:42.738975+00	6
7	NONE	NO_BERTH	2025-03-15 16:51:22.328506+00	7
8	UPPER	CONFIRMED	2025-03-15 16:51:28.480215+00	8
9	UPPER	CONFIRMED	2025-03-15 16:51:44.115715+00	9
10	UPPER	CONFIRMED	2025-03-15 16:51:48.839389+00	10
11	UPPER	CONFIRMED	2025-03-15 16:51:50.19779+00	11
12	LOWER	CONFIRMED	2025-03-15 16:52:01.192077+00	12
13	LOWER	CONFIRMED	2025-03-15 16:52:04.07701+00	13
14	LOWER	CONFIRMED	2025-03-15 16:52:04.427902+00	14
15	LOWER	CONFIRMED	2025-03-15 16:52:05.712038+00	15
16	LOWER	CONFIRMED	2025-03-15 16:52:08.358257+00	16
19	LOWER	CONFIRMED	2025-03-16 06:31:44.287254+00	19
21	LOWER	CONFIRMED	2025-03-16 06:31:45.83767+00	21
22	LOWER	CONFIRMED	2025-03-16 06:31:47.433624+00	22
23	LOWER	CONFIRMED	2025-03-16 06:31:48.281962+00	23
25	LOWER	CONFIRMED	2025-03-16 06:31:50.825501+00	25
26	UPPER	CONFIRMED	2025-03-16 06:32:00.049324+00	26
27	UPPER	CONFIRMED	2025-03-16 06:32:11.950971+00	27
28	UPPER	CONFIRMED	2025-03-16 06:32:12.674997+00	28
30	UPPER	CONFIRMED	2025-03-16 06:32:13.913617+00	30
31	UPPER	CONFIRMED	2025-03-16 06:32:14.464388+00	31
32	UPPER	CONFIRMED	2025-03-16 06:32:15.010944+00	32
33	UPPER	CONFIRMED	2025-03-16 06:32:15.488653+00	33
34	UPPER	CONFIRMED	2025-03-16 06:32:16.00609+00	34
35	UPPER	CONFIRMED	2025-03-16 06:32:16.575892+00	35
36	UPPER	CONFIRMED	2025-03-16 06:32:17.040241+00	36
37	UPPER	CONFIRMED	2025-03-16 06:32:17.613785+00	37
38	UPPER	CONFIRMED	2025-03-16 06:32:18.191485+00	38
39	UPPER	CONFIRMED	2025-03-16 06:32:18.726031+00	39
41	UPPER	CONFIRMED	2025-03-16 06:32:34.630036+00	41
42	MIDDLE	CONFIRMED	2025-03-16 06:32:34.898104+00	42
43	MIDDLE	CONFIRMED	2025-03-16 06:32:35.300051+00	43
44	MIDDLE	CONFIRMED	2025-03-16 06:33:31.602421+00	45
47	MIDDLE	CONFIRMED	2025-03-16 06:33:39.446346+00	48
48	MIDDLE	CONFIRMED	2025-03-16 06:33:40.263675+00	49
49	MIDDLE	CONFIRMED	2025-03-16 06:33:41.129614+00	50
50	MIDDLE	CONFIRMED	2025-03-16 06:33:41.966059+00	51
51	MIDDLE	CONFIRMED	2025-03-16 06:33:47.631306+00	52
54	MIDDLE	CONFIRMED	2025-03-16 06:33:49.813634+00	55
55	MIDDLE	CONFIRMED	2025-03-16 06:33:50.552898+00	56
56	MIDDLE	CONFIRMED	2025-03-16 06:33:50.946837+00	57
57	MIDDLE	CONFIRMED	2025-03-16 06:33:51.463463+00	58
60	MIDDLE	CONFIRMED	2025-03-16 06:33:53.136056+00	61
61	MIDDLE	CONFIRMED	2025-03-16 06:33:53.688976+00	62
62	MIDDLE	CONFIRMED	2025-03-16 06:33:54.110359+00	63
67	SIDE-LOWER	RAC	2025-03-16 06:34:02.223977+00	68
68	SIDE-LOWER	RAC	2025-03-16 06:34:03.246867+00	69
70	SIDE-LOWER	RAC	2025-03-16 06:34:05.514876+00	71
71	SIDE-LOWER	RAC	2025-03-16 06:34:06.154582+00	72
72	SIDE-LOWER	RAC	2025-03-16 06:34:06.652249+00	73
73	SIDE-LOWER	RAC	2025-03-16 06:34:07.349028+00	74
74	SIDE-LOWER	RAC	2025-03-16 06:34:08.074393+00	75
75	SIDE-LOWER	RAC	2025-03-16 06:34:08.747574+00	76
76	SIDE-LOWER	RAC	2025-03-16 06:34:09.122199+00	77
77	SIDE-LOWER	RAC	2025-03-16 06:34:09.941329+00	78
78	SIDE-LOWER	RAC	2025-03-16 06:34:10.42019+00	79
79	SIDE-LOWER	RAC	2025-03-16 06:34:11.11935+00	80
80	SIDE-LOWER	RAC	2025-03-16 06:34:11.696872+00	81
85	\N	WAITLIST	2025-03-16 06:34:16.167543+00	86
86	\N	WAITLIST	2025-03-16 06:34:16.827517+00	87
87	\N	WAITLIST	2025-03-16 06:34:17.374745+00	88
88	\N	WAITLIST	2025-03-16 06:34:17.885836+00	89
89	\N	WAITLIST	2025-03-16 06:34:18.411982+00	90
90	\N	WAITLIST	2025-03-16 06:34:18.843164+00	91
91	LOWER	CONFIRMED	2025-03-16 07:00:09.58567+00	99
92	LOWER	CONFIRMED	2025-03-16 07:19:12.894954+00	110
93	LOWER	CONFIRMED	2025-03-16 07:19:14.341166+00	111
63	SIDE-LOWER	CONFIRMED	2025-03-16 06:33:54.977302+00	64
81	\N	RAC	2025-03-16 06:34:12.761213+00	82
94	\N	WAITLIST	2025-03-16 07:58:53.05146+00	114
64	SIDE-LOWER	CONFIRMED	2025-03-16 06:33:55.700399+00	65
82	\N	RAC	2025-03-16 06:34:13.431471+00	83
65	SIDE-LOWER	CONFIRMED	2025-03-16 06:33:56.080188+00	66
83	\N	RAC	2025-03-16 06:34:14.537646+00	84
95	\N	WAITLIST	2025-03-16 08:16:47.729623+00	117
96	\N	WAITLIST	2025-03-16 08:16:55.846265+00	118
66	SIDE-LOWER	CONFIRMED	2025-03-16 06:33:57.886141+00	67
84	\N	RAC	2025-03-16 06:34:15.202657+00	85
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 7, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: reservations_passenger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reservations_passenger_id_seq', 122, true);


--
-- Name: reservations_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reservations_ticket_id_seq', 96, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: reservations_passenger reservations_passenger_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations_passenger
    ADD CONSTRAINT reservations_passenger_pkey PRIMARY KEY (id);


--
-- Name: reservations_ticket reservations_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations_ticket
    ADD CONSTRAINT reservations_ticket_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: reservations_passenger_user_id_f9e04d2a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reservations_passenger_user_id_f9e04d2a ON public.reservations_passenger USING btree (user_id);


--
-- Name: reservations_ticket_passenger_id_97186410; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reservations_ticket_passenger_id_97186410 ON public.reservations_ticket USING btree (passenger_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reservations_passenger reservations_passenger_user_id_f9e04d2a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations_passenger
    ADD CONSTRAINT reservations_passenger_user_id_f9e04d2a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reservations_ticket reservations_ticket_passenger_id_97186410_fk_reservati; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations_ticket
    ADD CONSTRAINT reservations_ticket_passenger_id_97186410_fk_reservati FOREIGN KEY (passenger_id) REFERENCES public.reservations_passenger(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


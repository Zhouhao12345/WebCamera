--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO zhouhao;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO zhouhao;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO zhouhao;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO zhouhao;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO zhouhao;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO zhouhao;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO zhouhao;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO zhouhao;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO zhouhao;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO zhouhao;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO zhouhao;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO zhouhao;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: zhouhao
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


ALTER TABLE public.django_admin_log OWNER TO zhouhao;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO zhouhao;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO zhouhao;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO zhouhao;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO zhouhao;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO zhouhao;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO zhouhao;

--
-- Name: registration_registrationprofile; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.registration_registrationprofile (
    id integer NOT NULL,
    activation_key character varying(40) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.registration_registrationprofile OWNER TO zhouhao;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.registration_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_registrationprofile_id_seq OWNER TO zhouhao;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.registration_registrationprofile_id_seq OWNED BY public.registration_registrationprofile.id;


--
-- Name: webcam_instances; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.webcam_instances (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    init_user_password character varying(20) NOT NULL,
    description text NOT NULL,
    user_number integer NOT NULL,
    real_database character varying(50) NOT NULL,
    template_database character varying(50) NOT NULL,
    subdomain character varying(50) NOT NULL,
    server_id_id integer NOT NULL,
    user_id_id integer NOT NULL
);


ALTER TABLE public.webcam_instances OWNER TO zhouhao;

--
-- Name: webcam_instances_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.webcam_instances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webcam_instances_id_seq OWNER TO zhouhao;

--
-- Name: webcam_instances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.webcam_instances_id_seq OWNED BY public.webcam_instances.id;


--
-- Name: webcam_instances_package_ids; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.webcam_instances_package_ids (
    id integer NOT NULL,
    instances_id integer NOT NULL,
    packages_id integer NOT NULL
);


ALTER TABLE public.webcam_instances_package_ids OWNER TO zhouhao;

--
-- Name: webcam_instances_package_ids_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.webcam_instances_package_ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webcam_instances_package_ids_id_seq OWNER TO zhouhao;

--
-- Name: webcam_instances_package_ids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.webcam_instances_package_ids_id_seq OWNED BY public.webcam_instances_package_ids.id;


--
-- Name: webcam_modules; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.webcam_modules (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    available boolean NOT NULL
);


ALTER TABLE public.webcam_modules OWNER TO zhouhao;

--
-- Name: webcam_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.webcam_modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webcam_modules_id_seq OWNER TO zhouhao;

--
-- Name: webcam_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.webcam_modules_id_seq OWNED BY public.webcam_modules.id;


--
-- Name: webcam_modules_package_ids; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.webcam_modules_package_ids (
    id integer NOT NULL,
    modules_id integer NOT NULL,
    packages_id integer NOT NULL
);


ALTER TABLE public.webcam_modules_package_ids OWNER TO zhouhao;

--
-- Name: webcam_modules_package_ids_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.webcam_modules_package_ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webcam_modules_package_ids_id_seq OWNER TO zhouhao;

--
-- Name: webcam_modules_package_ids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.webcam_modules_package_ids_id_seq OWNED BY public.webcam_modules_package_ids.id;


--
-- Name: webcam_packages; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.webcam_packages (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.webcam_packages OWNER TO zhouhao;

--
-- Name: webcam_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.webcam_packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webcam_packages_id_seq OWNER TO zhouhao;

--
-- Name: webcam_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.webcam_packages_id_seq OWNED BY public.webcam_packages.id;


--
-- Name: webcam_resusers; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.webcam_resusers (
    id integer NOT NULL,
    phone_number character varying(50) NOT NULL,
    about_me text NOT NULL,
    email text NOT NULL,
    picture character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.webcam_resusers OWNER TO zhouhao;

--
-- Name: webcam_resusers_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.webcam_resusers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webcam_resusers_id_seq OWNER TO zhouhao;

--
-- Name: webcam_resusers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.webcam_resusers_id_seq OWNED BY public.webcam_resusers.id;


--
-- Name: webcam_servers; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.webcam_servers (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    domain character varying(50) NOT NULL,
    admin_password character varying(50) NOT NULL,
    main_server boolean NOT NULL
);


ALTER TABLE public.webcam_servers OWNER TO zhouhao;

--
-- Name: webcam_servers_available_package_ids; Type: TABLE; Schema: public; Owner: zhouhao
--

CREATE TABLE public.webcam_servers_available_package_ids (
    id integer NOT NULL,
    servers_id integer NOT NULL,
    packages_id integer NOT NULL
);


ALTER TABLE public.webcam_servers_available_package_ids OWNER TO zhouhao;

--
-- Name: webcam_servers_available_package_ids_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.webcam_servers_available_package_ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webcam_servers_available_package_ids_id_seq OWNER TO zhouhao;

--
-- Name: webcam_servers_available_package_ids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.webcam_servers_available_package_ids_id_seq OWNED BY public.webcam_servers_available_package_ids.id;


--
-- Name: webcam_servers_id_seq; Type: SEQUENCE; Schema: public; Owner: zhouhao
--

CREATE SEQUENCE public.webcam_servers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webcam_servers_id_seq OWNER TO zhouhao;

--
-- Name: webcam_servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhouhao
--

ALTER SEQUENCE public.webcam_servers_id_seq OWNED BY public.webcam_servers.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('public.registration_registrationprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_instances ALTER COLUMN id SET DEFAULT nextval('public.webcam_instances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_instances_package_ids ALTER COLUMN id SET DEFAULT nextval('public.webcam_instances_package_ids_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_modules ALTER COLUMN id SET DEFAULT nextval('public.webcam_modules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_modules_package_ids ALTER COLUMN id SET DEFAULT nextval('public.webcam_modules_package_ids_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_packages ALTER COLUMN id SET DEFAULT nextval('public.webcam_packages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_resusers ALTER COLUMN id SET DEFAULT nextval('public.webcam_resusers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_servers ALTER COLUMN id SET DEFAULT nextval('public.webcam_servers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_servers_available_package_ids ALTER COLUMN id SET DEFAULT nextval('public.webcam_servers_available_package_ids_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add registration profile	7	add_registrationprofile
20	Can change registration profile	7	change_registrationprofile
21	Can delete registration profile	7	delete_registrationprofile
22	Can add res users	8	add_resusers
23	Can change res users	8	change_resusers
24	Can delete res users	8	delete_resusers
25	Can add packages	9	add_packages
26	Can change packages	9	change_packages
27	Can delete packages	9	delete_packages
28	Can add modules	10	add_modules
29	Can change modules	10	change_modules
30	Can delete modules	10	delete_modules
31	Can add servers	11	add_servers
32	Can change servers	11	change_servers
33	Can delete servers	11	delete_servers
34	Can add instances	12	add_instances
35	Can change instances	12	change_instances
36	Can delete instances	12	delete_instances
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$24000$JjtuxvFe7Jcf$IWW5inQpKfVbZeMmS06MN5IvoKnbCYpirnwRwNIJ8JE=	2017-09-07 03:09:15.395587+08	f	zz			zhouhao@163.com	f	t	2017-09-07 03:09:15.337315+08
3	pbkdf2_sha256$24000$hKVYYCMjETz4$KpFVqtPtYkiW6EyiXaYomHp8H+B+h9y8q8nwyJS/PyU=	2017-09-07 03:12:01.426329+08	f	zhouhao123			zhou@qq.com	f	t	2017-09-07 03:12:01.355147+08
4	pbkdf2_sha256$24000$cpK8ahID05pQ$6HcvdUs6egpeR81wz7wYhtF0xOwsxAJnqWdlcQy2IBc=	2017-09-07 14:08:09.019438+08	f	zhouhao233			zhouhao199@qq.com	f	t	2017-09-07 14:08:08.954647+08
1	pbkdf2_sha256$24000$HPUiHVG2kU62$JQkc4XlNl9BdatKKvVWmtVpEn165vZiActerweKjHbA=	2017-09-14 14:46:02.138432+08	t	zhouhao			zhouhao@qq.com	t	t	2017-09-07 02:44:05.741412+08
6	pbkdf2_sha256$24000$k7GA6fPKxYPw$juPsdz4uHg4GtOBZpL5Zam9bCFv/2kHmus+Sc16gC0o=	2017-09-22 14:00:04.390131+08	f	zhouhao19931002			zhou@zz.com	f	t	2017-09-09 00:38:00.953864+08
5	pbkdf2_sha256$24000$W7hwFxYe3xYu$hBkc2fDJnT3yt/nqmv0IKdXbYp+NsBq3XcJqQ4Rx5K4=	2017-09-09 01:03:49.872055+08	f	zhouhao1993			zhou@163.com	f	t	2017-09-09 00:35:59.491447+08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 6, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	registration	registrationprofile
8	webcam	resusers
9	webcam	packages
10	webcam	modules
11	webcam	servers
12	webcam	instances
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-09-07 02:37:48.959014+08
2	auth	0001_initial	2017-09-07 02:37:49.049355+08
3	admin	0001_initial	2017-09-07 02:37:49.104247+08
4	admin	0002_logentry_remove_auto_add	2017-09-07 02:37:49.12404+08
5	contenttypes	0002_remove_content_type_name	2017-09-07 02:37:49.157323+08
6	auth	0002_alter_permission_name_max_length	2017-09-07 02:37:49.169019+08
7	auth	0003_alter_user_email_max_length	2017-09-07 02:37:49.182299+08
8	auth	0004_alter_user_username_opts	2017-09-07 02:37:49.198064+08
9	auth	0005_alter_user_last_login_null	2017-09-07 02:37:49.229665+08
10	auth	0006_require_contenttypes_0002	2017-09-07 02:37:49.23281+08
11	auth	0007_alter_validators_add_error_messages	2017-09-07 02:37:49.243702+08
12	registration	0001_initial	2017-09-07 02:37:49.267257+08
13	sessions	0001_initial	2017-09-07 02:37:49.284289+08
14	webcam	0001_initial	2017-09-07 02:38:53.607497+08
15	webcam	0002_auto_20170906_1839	2017-09-07 02:39:12.685298+08
16	webcam	0003_auto_20170909_0813	2017-09-09 16:14:06.216609+08
17	auth	0008_alter_user_username_max_length	2018-03-20 23:30:02.97471+08
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 17, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
lrgcvv68z2szf1evn2ol4lxtqtpt7yjd	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-24 18:29:27.075841+08
70mk27zzxlu6xac6d566kvkvhvb7pq4q	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-26 11:56:35.2781+08
uic1kuia71vri2ag3ixn5fhbkoksusau	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-28 14:41:45.865914+08
f5475mr2mavqzmbebntxqaqa83w0qpst	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-28 14:41:47.870926+08
advvgzi59n13jf9z21hvkfxtqnk45xka	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-23 17:01:47.794352+08
lf018ahzbshm2570r4qyxn8epfxby6mr	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-28 14:42:05.980731+08
qkaatjfs7mkj4dsf46less91uiosaw6s	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-28 14:45:21.946226+08
wtm85zex520f1b2nsebxyrjtsjm88cv5	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-28 14:45:22.77815+08
51fw0uee9cgrloqz57mxt16wk7cznp9u	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-28 14:45:23.481618+08
w8p9f5pdov123k906e7sklj3cdhe0hnd	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-28 14:45:24.156822+08
81ryb8cs7uk67q3jozfiityooxyws892	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-28 14:45:24.816999+08
aipfv0m15roxdx4u6tfn2mpw0hsj4xjx	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-28 14:45:25.580202+08
j1g35xbeo3o6duxzhv8h4dwtxxhkrbqx	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-23 19:02:37.003322+08
5z0omcyoggegg0h82e00c2jdqqhaskk8	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-28 14:45:26.234285+08
ywzbck7iz0urpjqd01yob9jxsjjnnhb6	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-23 19:03:44.177948+08
9n9rkrepk7lbjk32urzhzna445rqvilx	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-23 19:41:43.463178+08
djlk21jf1uwb3nzbi4xu88b5emzbxnnc	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-28 14:45:26.814091+08
cajebwalc51c0yyd5jz6dkmr1461q1jd	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-23 19:43:32.097585+08
knw7h4kf16ucdngzoxodn5vnt0ibj34d	MGU2NmNiZDVkYjk0MjVhYWY5NDI1MGVhYjk4NjBhNTEyOGUzMGUwOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2MzgzNDllYjlhNzNhNTMwNTE1ZDY1MzViODY2MzAxMTI4NDg0ZmYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-28 14:45:45.344629+08
cy0rxdjcxxeplpqi8hawsxdszewr6oib	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-23 19:45:26.355305+08
qdrdp7z40sxi3sawubwwpuevsxf00kx1	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-09-28 14:48:16.172961+08
j2boe19yckc5fpzhsk9o3s8a0awlnb3k	OTg0MGY2OTQ1NTQwMzQ0Y2RiYzE4MjU2ODdlYWM0NjkyNjFhYjQyYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxYTg2NzVhMTk0NDVhMTRmOGMzZDU5MmMxZjM3YTY1Y2Y0ODQyZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-10-06 14:00:04.392171+08
\.


--
-- Data for Name: registration_registrationprofile; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.registration_registrationprofile (id, activation_key, user_id) FROM stdin;
\.


--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.registration_registrationprofile_id_seq', 1, false);


--
-- Data for Name: webcam_instances; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.webcam_instances (id, name, init_user_password, description, user_number, real_database, template_database, subdomain, server_id_id, user_id_id) FROM stdin;
\.


--
-- Name: webcam_instances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.webcam_instances_id_seq', 9, true);


--
-- Data for Name: webcam_instances_package_ids; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.webcam_instances_package_ids (id, instances_id, packages_id) FROM stdin;
\.


--
-- Name: webcam_instances_package_ids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.webcam_instances_package_ids_id_seq', 1, false);


--
-- Data for Name: webcam_modules; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.webcam_modules (id, name, description, available) FROM stdin;
1	auth_crypt	Test Description 0	f
2	auth_ldap	Test Description 1	f
3	auth_oauth	Test Description 2	f
4	auth_crypt	Test 0	f
5	auth_ldap	Test 1	f
6	auth_oauth	Test 2	f
7	auth_signup	Test 3	f
8	base	Test 4	f
9	base_action_rule	Test 5	f
10	base_gengo	Test 6	f
11	base_geolocalize	Test 7	f
12	base_import	Test 8	f
13	base_import_module	Test 9	f
14	base_setup	Test 10	f
15	board	Test 11	f
16	bus	Test 12	f
17	calendar	Test 13	f
18	decimal_precision	Test 14	f
19	fetchmail	Test 15	f
20	im_livechat	Test 16	f
21	mail	Test 17	f
22	mail_tip	Test 18	f
23	note	Test 19	f
24	product	Test 20	f
25	product_email_template	Test 21	f
26	product_expiry	Test 22	f
27	product_extended	Test 23	f
28	product_margin	Test 24	f
29	report	Test 25	f
30	resource	Test 26	f
31	web	Test 27	f
32	web_analytics	Test 28	f
33	web_calendar	Test 29	f
34	web_diagram	Test 30	f
35	web_editor	Test 31	f
36	web_kanban	Test 32	f
37	web_kanban_gauge	Test 33	f
38	web_planner	Test 34	f
39	web_settings_dashboard	Test 35	f
40	web_tip	Test 36	f
41	web_view_editor	Test 37	f
\.


--
-- Name: webcam_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.webcam_modules_id_seq', 41, true);


--
-- Data for Name: webcam_modules_package_ids; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.webcam_modules_package_ids (id, modules_id, packages_id) FROM stdin;
1	4	1
2	5	1
3	6	1
4	7	1
5	8	1
6	9	1
7	10	1
8	11	1
9	12	1
10	13	1
11	14	1
12	15	1
13	16	1
14	17	1
15	18	1
16	19	1
17	20	1
18	21	1
19	22	1
20	23	1
21	24	1
22	25	1
23	26	1
24	27	1
25	28	1
26	29	1
27	30	1
28	31	1
29	32	1
30	33	1
31	34	1
32	35	1
33	36	1
34	37	1
35	38	1
36	39	1
37	40	1
38	41	1
\.


--
-- Name: webcam_modules_package_ids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.webcam_modules_package_ids_id_seq', 38, true);


--
-- Data for Name: webcam_packages; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.webcam_packages (id, name, description) FROM stdin;
1	init_setup	Test Package 1
\.


--
-- Name: webcam_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.webcam_packages_id_seq', 1, true);


--
-- Data for Name: webcam_resusers; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.webcam_resusers (id, phone_number, about_me, email, picture, user_id) FROM stdin;
1					6
\.


--
-- Name: webcam_resusers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.webcam_resusers_id_seq', 1, true);


--
-- Data for Name: webcam_servers; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.webcam_servers (id, name, description, domain, admin_password, main_server) FROM stdin;
1	saas_odoo		Test Server	admin	t
\.


--
-- Data for Name: webcam_servers_available_package_ids; Type: TABLE DATA; Schema: public; Owner: zhouhao
--

COPY public.webcam_servers_available_package_ids (id, servers_id, packages_id) FROM stdin;
1	1	1
\.


--
-- Name: webcam_servers_available_package_ids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.webcam_servers_available_package_ids_id_seq', 1, true);


--
-- Name: webcam_servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhouhao
--

SELECT pg_catalog.setval('public.webcam_servers_id_seq', 1, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: registration_registrationprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_user_id_key UNIQUE (user_id);


--
-- Name: webcam_instances_package_ids_instances_id_1bfce8fb_uniq; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_instances_package_ids
    ADD CONSTRAINT webcam_instances_package_ids_instances_id_1bfce8fb_uniq UNIQUE (instances_id, packages_id);


--
-- Name: webcam_instances_package_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_instances_package_ids
    ADD CONSTRAINT webcam_instances_package_ids_pkey PRIMARY KEY (id);


--
-- Name: webcam_instances_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_instances
    ADD CONSTRAINT webcam_instances_pkey PRIMARY KEY (id);


--
-- Name: webcam_modules_package_ids_modules_id_ca48de25_uniq; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_modules_package_ids
    ADD CONSTRAINT webcam_modules_package_ids_modules_id_ca48de25_uniq UNIQUE (modules_id, packages_id);


--
-- Name: webcam_modules_package_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_modules_package_ids
    ADD CONSTRAINT webcam_modules_package_ids_pkey PRIMARY KEY (id);


--
-- Name: webcam_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_modules
    ADD CONSTRAINT webcam_modules_pkey PRIMARY KEY (id);


--
-- Name: webcam_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_packages
    ADD CONSTRAINT webcam_packages_pkey PRIMARY KEY (id);


--
-- Name: webcam_resusers_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_resusers
    ADD CONSTRAINT webcam_resusers_pkey PRIMARY KEY (id);


--
-- Name: webcam_resusers_user_id_key; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_resusers
    ADD CONSTRAINT webcam_resusers_user_id_key UNIQUE (user_id);


--
-- Name: webcam_servers_available_package_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_servers_available_package_ids
    ADD CONSTRAINT webcam_servers_available_package_ids_pkey PRIMARY KEY (id);


--
-- Name: webcam_servers_available_package_ids_servers_id_3fc851d2_uniq; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_servers_available_package_ids
    ADD CONSTRAINT webcam_servers_available_package_ids_servers_id_3fc851d2_uniq UNIQUE (servers_id, packages_id);


--
-- Name: webcam_servers_pkey; Type: CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_servers
    ADD CONSTRAINT webcam_servers_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX auth_user_groups_0e939a4f ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX auth_user_groups_e8701ad4 ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX auth_user_user_permissions_8373b171 ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX django_admin_log_417f1b1c ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX django_admin_log_e8701ad4 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: webcam_instances_18624dd3; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX webcam_instances_18624dd3 ON public.webcam_instances USING btree (user_id_id);


--
-- Name: webcam_instances_f5f69fca; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX webcam_instances_f5f69fca ON public.webcam_instances USING btree (server_id_id);


--
-- Name: webcam_instances_package_ids_1edfdf4c; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX webcam_instances_package_ids_1edfdf4c ON public.webcam_instances_package_ids USING btree (packages_id);


--
-- Name: webcam_instances_package_ids_4399c4f6; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX webcam_instances_package_ids_4399c4f6 ON public.webcam_instances_package_ids USING btree (instances_id);


--
-- Name: webcam_modules_package_ids_1c038344; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX webcam_modules_package_ids_1c038344 ON public.webcam_modules_package_ids USING btree (modules_id);


--
-- Name: webcam_modules_package_ids_1edfdf4c; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX webcam_modules_package_ids_1edfdf4c ON public.webcam_modules_package_ids USING btree (packages_id);


--
-- Name: webcam_servers_available_package_ids_1edfdf4c; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX webcam_servers_available_package_ids_1edfdf4c ON public.webcam_servers_available_package_ids USING btree (packages_id);


--
-- Name: webcam_servers_available_package_ids_2e2e6e8c; Type: INDEX; Schema: public; Owner: zhouhao
--

CREATE INDEX webcam_servers_available_package_ids_2e2e6e8c ON public.webcam_servers_available_package_ids USING btree (servers_id);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_registrationprofi_user_id_5fcbf725_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofi_user_id_5fcbf725_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webcam_instances_p_instances_id_1901c77d_fk_webcam_instances_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_instances_package_ids
    ADD CONSTRAINT webcam_instances_p_instances_id_1901c77d_fk_webcam_instances_id FOREIGN KEY (instances_id) REFERENCES public.webcam_instances(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webcam_instances_pac_packages_id_8895b6ed_fk_webcam_packages_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_instances_package_ids
    ADD CONSTRAINT webcam_instances_pac_packages_id_8895b6ed_fk_webcam_packages_id FOREIGN KEY (packages_id) REFERENCES public.webcam_packages(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webcam_instances_server_id_id_2627c0d7_fk_webcam_servers_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_instances
    ADD CONSTRAINT webcam_instances_server_id_id_2627c0d7_fk_webcam_servers_id FOREIGN KEY (server_id_id) REFERENCES public.webcam_servers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webcam_instances_user_id_id_f257d805_fk_webcam_resusers_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_instances
    ADD CONSTRAINT webcam_instances_user_id_id_f257d805_fk_webcam_resusers_id FOREIGN KEY (user_id_id) REFERENCES public.webcam_resusers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webcam_modules_packa_packages_id_9be099d4_fk_webcam_packages_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_modules_package_ids
    ADD CONSTRAINT webcam_modules_packa_packages_id_9be099d4_fk_webcam_packages_id FOREIGN KEY (packages_id) REFERENCES public.webcam_packages(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webcam_modules_package_modules_id_0536d5bf_fk_webcam_modules_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_modules_package_ids
    ADD CONSTRAINT webcam_modules_package_modules_id_0536d5bf_fk_webcam_modules_id FOREIGN KEY (modules_id) REFERENCES public.webcam_modules(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webcam_resusers_user_id_aa133dbe_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_resusers
    ADD CONSTRAINT webcam_resusers_user_id_aa133dbe_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webcam_servers_avail_packages_id_6b1b0c72_fk_webcam_packages_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_servers_available_package_ids
    ADD CONSTRAINT webcam_servers_avail_packages_id_6b1b0c72_fk_webcam_packages_id FOREIGN KEY (packages_id) REFERENCES public.webcam_packages(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webcam_servers_availab_servers_id_871823b5_fk_webcam_servers_id; Type: FK CONSTRAINT; Schema: public; Owner: zhouhao
--

ALTER TABLE ONLY public.webcam_servers_available_package_ids
    ADD CONSTRAINT webcam_servers_availab_servers_id_871823b5_fk_webcam_servers_id FOREIGN KEY (servers_id) REFERENCES public.webcam_servers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


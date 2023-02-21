--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-2.pgdg90+1)
-- Dumped by pg_dump version 10.5 (Debian 10.5-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: car_body_configurations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_body_configurations (
    id integer NOT NULL,
    title character varying(80) NOT NULL
);


ALTER TABLE public.car_body_configurations OWNER TO postgres;

--
-- Name: car_body_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.car_body_configurations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_body_configurations_id_seq OWNER TO postgres;

--
-- Name: car_body_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.car_body_configurations_id_seq OWNED BY public.car_body_configurations.id;


--
-- Name: colors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colors (
    id integer NOT NULL,
    title character varying(80) NOT NULL
);


ALTER TABLE public.colors OWNER TO postgres;

--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colors_id_seq OWNER TO postgres;

--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colors_id_seq OWNED BY public.colors.id;


--
-- Name: eco_standarts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eco_standarts (
    id integer NOT NULL,
    title character varying(80) NOT NULL
);


ALTER TABLE public.eco_standarts OWNER TO postgres;

--
-- Name: eco_standarts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eco_standarts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eco_standarts_id_seq OWNER TO postgres;

--
-- Name: eco_standarts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eco_standarts_id_seq OWNED BY public.eco_standarts.id;


--
-- Name: extras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extras (
    id integer NOT NULL,
    title character varying(80) NOT NULL,
    extra_category_id integer
);


ALTER TABLE public.extras OWNER TO postgres;

--
-- Name: extras_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extras_categories (
    id integer NOT NULL,
    title character varying(80) NOT NULL
);


ALTER TABLE public.extras_categories OWNER TO postgres;

--
-- Name: extras_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.extras_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_categories_id_seq OWNER TO postgres;

--
-- Name: extras_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.extras_categories_id_seq OWNED BY public.extras_categories.id;


--
-- Name: extras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.extras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_id_seq OWNER TO postgres;

--
-- Name: extras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.extras_id_seq OWNED BY public.extras.id;


--
-- Name: fuel_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fuel_types (
    id integer NOT NULL,
    title character varying(80) NOT NULL
);


ALTER TABLE public.fuel_types OWNER TO postgres;

--
-- Name: fuel_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fuel_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fuel_types_id_seq OWNER TO postgres;

--
-- Name: fuel_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fuel_types_id_seq OWNED BY public.fuel_types.id;


--
-- Name: gearboxes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gearboxes (
    id integer NOT NULL,
    title character varying(80) NOT NULL
);


ALTER TABLE public.gearboxes OWNER TO postgres;

--
-- Name: gearboxes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gearboxes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gearboxes_id_seq OWNER TO postgres;

--
-- Name: gearboxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gearboxes_id_seq OWNED BY public.gearboxes.id;


--
-- Name: makes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.makes (
    id integer NOT NULL,
    title character varying(80) NOT NULL
);


ALTER TABLE public.makes OWNER TO postgres;

--
-- Name: makes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.makes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.makes_id_seq OWNER TO postgres;

--
-- Name: makes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.makes_id_seq OWNED BY public.makes.id;


--
-- Name: models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.models (
    id integer NOT NULL,
    title character varying(80) NOT NULL,
    make_id integer
);


ALTER TABLE public.models OWNER TO postgres;

--
-- Name: models_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.models_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.models_id_seq OWNER TO postgres;

--
-- Name: models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.models_id_seq OWNED BY public.models.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    title character varying(80) NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    title character varying(80) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: settlements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settlements (
    id integer NOT NULL,
    title character varying(80) NOT NULL,
    region_id integer
);


ALTER TABLE public.settlements OWNER TO postgres;

--
-- Name: settlements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settlements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settlements_id_seq OWNER TO postgres;

--
-- Name: settlements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settlements_id_seq OWNED BY public.settlements.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    role_id integer,
    email character varying(120) NOT NULL,
    first_name character varying(80) NOT NULL,
    phone character varying(30) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vehicle_ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_ads (
    id integer NOT NULL,
    model_id integer,
    make_id integer,
    fuel_type_id integer,
    settlement_id integer,
    publisher_id integer,
    car_body_configuration_id integer,
    eco_standart_id integer,
    gearbox_id integer,
    color_id integer,
    manufacture_year integer,
    hp integer,
    price real NOT NULL,
    mileage integer,
    modification character varying(20),
    description text,
    image_names json,
    views integer,
    is_approved boolean,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.vehicle_ads OWNER TO postgres;

--
-- Name: vehicle_ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_ads_id_seq OWNER TO postgres;

--
-- Name: vehicle_ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_ads_id_seq OWNED BY public.vehicle_ads.id;


--
-- Name: vehicle_extra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_extra (
    vehicle_ad_id integer,
    extra_id integer
);


ALTER TABLE public.vehicle_extra OWNER TO postgres;

--
-- Name: car_body_configurations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_body_configurations ALTER COLUMN id SET DEFAULT nextval('public.car_body_configurations_id_seq'::regclass);


--
-- Name: colors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colors ALTER COLUMN id SET DEFAULT nextval('public.colors_id_seq'::regclass);


--
-- Name: eco_standarts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eco_standarts ALTER COLUMN id SET DEFAULT nextval('public.eco_standarts_id_seq'::regclass);


--
-- Name: extras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extras ALTER COLUMN id SET DEFAULT nextval('public.extras_id_seq'::regclass);


--
-- Name: extras_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extras_categories ALTER COLUMN id SET DEFAULT nextval('public.extras_categories_id_seq'::regclass);


--
-- Name: fuel_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuel_types ALTER COLUMN id SET DEFAULT nextval('public.fuel_types_id_seq'::regclass);


--
-- Name: gearboxes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gearboxes ALTER COLUMN id SET DEFAULT nextval('public.gearboxes_id_seq'::regclass);


--
-- Name: makes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.makes ALTER COLUMN id SET DEFAULT nextval('public.makes_id_seq'::regclass);


--
-- Name: models id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models ALTER COLUMN id SET DEFAULT nextval('public.models_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settlements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settlements ALTER COLUMN id SET DEFAULT nextval('public.settlements_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vehicle_ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_ads ALTER COLUMN id SET DEFAULT nextval('public.vehicle_ads_id_seq'::regclass);


--
-- Data for Name: car_body_configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_body_configurations (id, title) FROM stdin;
1	Хечбек
2	Джип
3	Кабрио
4	Комби
5	Купе
6	Миниван
7	Пикап
8	Седан
9	Стреч лимузина
10	Ван
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colors (id, title) FROM stdin;
1	Бежов
2	Бордо
3	Бронзов
4	Бял
5	Виолетов
6	Жълт
7	Зелен
8	Златен
9	Кафяв
10	Оранжев
11	Сив
12	Син
13	Сребърен
14	Червен
15	Черен
16	Лилав
17	Охра
18	Перла
19	Розов
20	Хамелеон
\.


--
-- Data for Name: eco_standarts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eco_standarts (id, title) FROM stdin;
1	EURO 1
2	EURO 2
3	EURO 3
4	EURO 4
5	EURO 5
6	EURO 6
\.


--
-- Data for Name: extras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.extras (id, title, extra_category_id) FROM stdin;
1	4х4	1
2	Автоматичен контрол на стабилността	1
3	Антиблокираща система (ABS)	1
4	Въздушни възглавници	1
5	Система ISOFIX	1
6	Система за динамична устойчивост	1
7	Система за защита от пробуксуване	1
8	Distronic	1
9	Система за контрол на спускането	1
10	Система за подпомагане на спирането	1
11	Контрол на налягането на гумите	1
12	Парктроник	1
13	DVD, TV	2
14	Адаптивно въздушно окачване	2
15	Климатик	2
16	Климатроник	2
17	Отопление на волана	2
18	Печка	2
19	Подгряване на седалките	2
20	Стерео уредба	2
21	Хладилна жабка	2
22	Ел. регулиране на седалките	2
23	Мултифункционален волан	2
24	Старт Стоп система	3
25	Steptronic, Tiptronic	3
26	Безключово палене	3
27	Блокаж на диференциала	3
28	Бордкомпютър	3
29	Ел. Огледала	3
30	Ел. Стъкла	3
31	Ел. регулиране на окачването	3
32	Ел. усилвател на волана	3
33	Навигация	3
34	Подгряване на предното стъкло	3
35	Регулиране на волана	3
36	Сензор за дъжд	3
37	Серво усилвател на волана	3
38	Система за измиване на фаровете	3
39	Круиз Контрол	3
40	Автопилот	3
41	2(3) Врати	4
42	4(5) Врати	4
43	LED фарове	4
44	Ксенонови фарове	4
45	Лети джанти	4
46	Металик	4
47	Панорамен люк	4
48	Спойлери	4
49	Теглич	4
50	Халогенни фарове	4
51	Шибедах	4
52	OFFROAD пакет	5
53	Аларма	5
54	Брониран	5
55	Имобилайзер	5
56	Каско	5
57	Подсилени стъкла	5
58	Централно заключване	5
59	Велурен салон	6
60	Десен волан	6
61	Кожен салон	6
62	TAXI	7
63	За хора с увреждания	7
64	Катафалка	7
65	Линейка	7
66	Учебен	7
67	Хладилен	7
68	7 места	8
69	Бартер	8
70	Дълга база	8
71	Катастрофирал	8
72	Къса база	8
73	Лизинг	8
74	На части	8
75	Напълно обслужен	8
76	Нов внос	8
77	С регистрация	8
78	Сервизна книжка	8
79	Тунинг	8
80	Филтър за твърди частици	8
\.


--
-- Data for Name: extras_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.extras_categories (id, title) FROM stdin;
1	Безопастост
2	Комфорт
3	Удобства
4	Екстериор
5	Защита
6	Интериор
7	Специализирани
8	Други
\.


--
-- Data for Name: fuel_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fuel_types (id, title) FROM stdin;
1	Бензин
2	Газ/Бензин
3	Дизел
4	Метан/Бензин
5	Електричество
6	Хибрид
\.


--
-- Data for Name: gearboxes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gearboxes (id, title) FROM stdin;
1	Ръчна
2	Автоматична
3	Полуавтоматична
\.


--
-- Data for Name: makes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.makes (id, title) FROM stdin;
1	AC
2	Abarth
3	Acura
4	Aixam
5	Alfa Romeo
6	Alpina
7	Aro
8	Asia
9	Aston martin
10	Audi
11	Austin
12	BMW
13	Bentley
14	Berliner
15	Bertone
16	Borgward
17	Brilliance
18	Bugatti
19	Buick
20	Cadillac
21	Carbodies
22	Chery
23	Chevrolet
24	Chrysler
25	Citroen
26	Corvette
27	Cupra
28	DONGFENG
29	DS
30	Dacia
31	Daewoo
32	Daihatsu
33	Daimler
34	Datsun
35	Dkw
36	Dodge
37	Dr
38	Eagle
39	FSO
40	Ferrari
41	Fiat
42	Ford
43	GOUPIL
44	Gaz
45	Geely
46	Genesis
47	Geo
48	Gmc
49	Gonow
50	Great Wall
51	Haval
52	Heinkel
53	Hillman
54	Honda
55	Hummer
56	Hyundai
57	Ifa
58	Infiniti
59	Innocenti
60	Isuzu
61	Iveco
62	JAC
63	JAS
64	Jaguar
65	Jeep
66	Jpx
67	Kia
68	Lada
69	Laforza
70	Lamborghini
71	Lancia
72	Land Rover
73	Landwind
74	Lexus
75	Lifan
76	Lincoln
77	Lotus
78	MG
79	Mahindra
80	Maserati
81	Matra
82	Maybach
83	Mazda
84	McLaren
85	Mercedes-Benz
86	Mercury
87	Mg
88	Microcar
89	Mini
90	Mitsubishi
91	Morgan
92	Moskvich
93	Nissan
94	Oldsmobile
95	Opel
96	Perodua
97	Peugeot
98	Pgo
99	Plymouth
100	Polestar
101	Polonez
102	Pontiac
103	Porsche
104	Proton
105	Qoros
106	Renault
107	Rieju
108	Rolls-Royce
109	Rover
110	SECMA
111	SH auto
112	Saab
113	Samand
114	Santana
115	Saturn
116	Scion
117	Seat
118	Shatenet
119	Shuanghuan
120	Simca
121	Skoda
122	Smart
123	Ssang yong
124	Subaru
125	Suzuki
126	Talbot
127	Tata
128	Tavria
129	Tazzari
130	Tempo
131	Terberg
132	Tesla
133	Tofas
134	Toyota
135	Trabant
136	Triumph
137	Uaz
138	VROMOS
139	VW
140	Volga
141	Volvo
142	Warszawa
143	Wartburg
144	Wiesmann
145	Xinkai
146	Xinshun
147	Yogomo
148	Zastava
149	Zaz
150	Победа
151	София
152	Чайка
\.


--
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.models (id, title, make_id) FROM stdin;
1	124	2
2	595	2
3	ILX	3
4	Integra	3
5	Mdx	3
6	NSX	3
7	Rdx	3
8	Rl	3
9	Rsx	3
10	Slx	3
11	TLX	3
12	Tl	3
13	Tsx	3
14	400	4
15	505	4
16	600	4
17	145	5
18	146	5
19	147	5
20	155	5
21	156	5
22	156 sportwagon	5
23	159	5
24	159 sportwagon	5
25	164	5
26	166	5
27	33	5
28	4C	5
29	75	5
30	76	5
31	8C Competizione	5
32	90	5
33	Alfetta	5
34	Berlina	5
35	Brera	5
36	Crosswagon q4	5
37	Giulia	5
38	Giulietta	5
39	Gt	5
40	Gtv	5
41	MiTo	5
42	Spider	5
43	Sprint	5
44	Stelvio	5
45	Sud	5
46	Tonale	5
47	B10	6
48	B11	6
49	B12	6
50	B3	6
51	B4	6
52	B5	6
53	B6	6
54	B7	6
55	B8	6
56	B9	6
57	C1	6
58	C2	6
59	D3	6
60	D4	6
61	D5	6
62	Roadster	6
63	XD3	6
64	10	7
65	24	7
66	242	7
67	243	7
68	244	7
69	246	7
70	32	7
71	320	7
72	324	7
73	328	7
74	33	7
75	Rocsta	8
76	DBS	9
77	DBX	9
78	Db7	9
79	Db9	9
80	Rapide	9
81	V12 Vantage	9
82	V8 Vantage	9
83	Vanquish	9
84	100	10
85	200	10
86	50	10
87	60	10
88	80	10
89	90	10
90	A1	10
91	A2	10
92	A3	10
93	A4	10
94	A4 Allroad	10
95	A5	10
96	A6	10
97	A6 Allroad	10
98	A7	10
99	A8	10
100	Allroad	10
101	Cabriolet	10
102	Coupe	10
103	E-Tron	10
104	Q2	10
105	Q3	10
106	Q4	10
107	Q5	10
108	Q7	10
109	Q8	10
110	Quattro	10
111	R8	10
112	RSQ8	10
113	Rs3	10
114	Rs4	10
115	Rs5	10
116	Rs6	10
117	Rs7	10
118	S1	10
119	S2	10
120	S3	10
121	S4	10
122	S5	10
123	S6	10
124	S7	10
125	S8	10
126	SQ5	10
127	SQ7	10
128	SQ8	10
129	Tt	10
130	Allegro	11
131	Ambassador	11
132	Maestro	11
133	Maxi	11
134	Metro	11
135	Mg	11
136	Mini	11
137	Montego	11
138	Princess	11
139	1	12
140	114	12
141	116	12
142	118	12
143	120	12
144	123	12
145	125	12
146	128	12
147	130	12
148	135	12
149	140	12
150	1500	12
151	1600	12
152	1602	12
153	1800	12
154	2	12
155	2 Active Tourer	12
156	2 Gran Coupe	12
157	2 Gran Tourer	12
158	2000	12
159	2002	12
160	216	12
161	218	12
162	220	12
163	220 d	12
164	225	12
165	228	12
166	230	12
167	235	12
168	240	12
169	2800	12
170	3	12
171	315	12
172	316	12
173	318	12
174	320	12
175	323	12
176	324	12
177	325	12
178	328	12
179	330	12
180	335	12
181	340	12
182	3gt	12
183	4	12
184	418	12
185	420	12
186	425	12
187	428	12
188	430	12
189	435	12
190	440	12
191	5	12
192	5 Gran Turismo	12
193	501	12
194	518	12
195	520	12
196	523	12
197	524	12
198	525	12
199	528	12
200	530	12
201	530E	12
202	535	12
203	540	12
204	545	12
205	550	12
206	6	12
207	6 GT	12
208	620	12
209	628	12
210	630	12
211	633	12
212	635	12
213	640	12
214	645	12
215	650	12
216	7	12
217	700	12
218	721	12
219	723	12
220	725	12
221	728	12
222	730	12
223	732	12
224	733	12
225	735	12
226	740	12
227	745	12
228	750	12
229	760	12
230	840	12
231	850	12
232	Izetta	12
233	M	12
234	M Coupе	12
235	M135	12
236	M140	12
237	M2	12
238	M3	12
239	M4	12
240	M5	12
241	M6	12
242	M8	12
243	X1	12
244	X2	12
245	X3	12
246	X4	12
247	X5	12
248	X5M	12
249	X6	12
250	X7	12
251	Z1	12
252	Z3	12
253	Z4	12
254	Z8	12
255	i3	12
256	i4	12
257	i7	12
258	i8	12
259	iX	12
260	iX3	12
261	Arnage	13
262	Azure	13
263	Bentayga	13
264	Continental	13
265	Continental gt	13
266	Flying Spur	13
267	GT Convertible	13
268	Mulsanne	13
269	T-series	13
270	Coupe	14
271	Freeclimber	15
272	Hansa	16
273	BC3	17
274	BS2 	17
275	BS4	17
276	BS6	17
277	Dolphin	17
278	FRV	17
279	FSV	17
280	H220	17
281	H230	17
282	H320	17
283	H330	17
284	H530	17
285	V3	17
286	V5	17
287	Chiron	18
288	Veyron	18
289	Century	19
290	Electra	19
291	Enclave	19
292	Invicta	19
293	Park avenue	19
294	Regal	19
295	Rendezvous	19
296	Riviera	19
297	Skylark	19
298	Skyline	19
299	ATS	20
300	Allante	20
301	BLS	20
302	Brougham	20
303	CT6	20
304	Cts	20
305	DTS	20
306	Deville	20
307	Eldorado	20
308	Escalade	20
309	Fleetwood	20
310	STS	20
311	Seville	20
312	Srx	20
313	XT4	20
314	XT5	20
315	XTS	20
316	Xlr	20
317	Taxi	21
318	Tigo 4	22
319	Tigo 7 Pro	22
320	Tigo 8 pro	22
321	Tigo 8 pro Max	22
322	Alero	23
323	Astro	23
324	Avalanche	23
325	Aveo	23
326	Beretta	23
327	Blazer	23
328	Bolt	23
329	Camaro	23
330	Caprice	23
331	Captiva	23
332	Cavalier	23
333	Cobalt	23
334	Colorado	23
335	Corvette	23
336	Cruze	23
337	Diamante	23
338	El Camino	23
339	Epica	23
340	Equinox	23
341	Evanda	23
342	Gmc	23
343	Hhr	23
344	Impala	23
345	Kalos	23
346	Lacetti	23
347	Lumina	23
348	Malibu	23
349	Matiz	23
350	Niva	23
351	Nova	23
352	Nubira	23
353	Orlando	23
354	Rezzo	23
355	Silverado	23
356	Spark	23
357	Ssr	23
358	Suburban	23
359	Tacuma	23
360	Tahoe	23
361	Tracker	23
362	Trailblazer	23
363	Transsport	23
364	Traverse	23
365	Trax	23
366	Volt	23
367	200	24
368	300c	24
369	300m	24
370	Cherokee	24
371	Crossfire	24
372	Daytona	24
373	Es	24
374	Gr.voyager	24
375	Grand cherokee	24
376	Gts	24
377	Interpid	24
378	Lebaron	24
379	Neon	24
380	New yorker	24
381	Pacifica	24
382	Pt cruiser	24
383	Saratoga	24
384	Sebring	24
385	Stratus	24
386	Town and Country	24
387	Vision	24
388	Voyager	24
389	Wrangler	24
390	2cv	25
391	Ax	25
392	Axel	25
393	Berlingo	25
394	Bx	25
395	C - Zero	25
396	C-Crosser	25
397	C-Elysee	25
398	C1	25
399	C15	25
400	C2	25
401	C3	25
402	C3 Aircross	25
403	C3 Picasso	25
404	C3 pluriel	25
405	C4	25
406	C4 AIRCROSS	25
407	C4 Cactus	25
408	C4 Picasso	25
409	C5	25
410	C5 Aircross	25
411	C5X	25
412	C6	25
413	C8	25
414	Cx	25
415	DS 3 Crossback	25
416	DS 4 Crossback	25
417	DS 7 Crossback	25
418	DS3	25
419	DS4	25
420	DS5	25
421	DS7	25
422	Ds	25
423	E-Mehari	25
424	Evasion	25
425	Grand C4 Picasso	25
426	Gsa	25
427	Gx	25
428	Ln	25
429	Nemo	25
430	Oltcit	25
431	Saxo	25
432	Spacetourer	25
433	Visa	25
434	Xantia	25
435	Xm	25
436	Xsara	25
437	Xsara picasso	25
438	Zx	25
439	C06 Convertible	26
440	C06 Coupe	26
441	Powa	26
442	Z06	26
443	Ateca	27
444	Formentor	27
445	580	28
446	E3	28
447	IX5	28
448	DS 3	29
449	DS 3 Crossback	29
450	DS 4	29
451	DS 4 Crossback	29
452	DS 5	29
453	DS 7	29
454	DS 7 Crossback	29
455	DS 9	29
456	1100	30
457	1300	30
458	1304	30
459	1307	30
460	1310	30
461	1350	30
462	Dokker	30
463	Duster	30
464	Jogger	30
465	Liberta	30
466	Lodgy	30
467	Logan	30
468	Nova	30
469	Pickup	30
470	Sandero	30
471	Solenza	30
472	Spring	30
473	Ace	31
474	Chairman	31
475	Cielo	31
476	Espero	31
477	Evanda	31
478	Fso	31
479	Kalos	31
480	Korando	31
481	Lacetti	31
482	Lanos	31
483	Leganza	31
484	Magnus	31
485	Matiz	31
486	Musso	31
487	Nexia	31
488	Nubira	31
489	Prince	31
490	Racer	31
491	Rezzo	31
492	Super	31
493	Tacuma	31
494	Tico	31
495	Applause	32
496	Charade	32
497	Charmant	32
498	Copen	32
499	Cuore	32
500	Feroza	32
501	Gran move	32
502	Hijet	32
503	Materia	32
504	Move	32
505	Rocky	32
506	Sharade	32
507	Sirion	32
508	Taft	32
509	Terios	32
510	Trevis	32
511	Wildcat	32
512	Yrv	32
513	Double six	33
514	Six	33
515	Sovereign	33
516	Bluebird	34
517	Cherry	34
518	Stanza	34
519	F102	35
520	Avenger	36
521	Caliber	36
522	Caravan	36
523	Challenger	36
524	Charger	36
525	Coronet	36
526	Dakota	36
527	Dart	36
528	Daytona	36
529	Durango	36
530	Interpid	36
531	Journey	36
532	Magnum	36
533	Neon	36
534	Nitro	36
535	RAM 1500	36
536	RAM 2500	36
537	RAM 3500	36
538	Ram	36
539	Shadow	36
540	Stealth	36
541	Stratus	36
542	Viper	36
543	1	37
544	2	37
545	3	37
546	4	37
547	5	37
548	6	37
549	DR4	37
550	DR6	37
551	Premire	38
552	Talon	38
553	Vision	38
554	Polonez	39
555	296GTB	40
556	308	40
557	348	40
558	360 modena	40
559	360 spider	40
560	458 Italia	40
561	488	40
562	599	40
563	812 GTS	40
564	812 Superfast	40
565	California	40
566	Enzo	40
567	F12berlinetta	40
568	F430	40
569	F456m	40
570	F575m maranello	40
571	F612 scaglietti	40
572	F8	40
573	FF	40
574	GTC4Lusso	40
575	LaFerrari	40
576	Mondial 8	40
577	Portofino	40
578	Roma	40
579	SF 90	40
580	Testarossa	40
581	1100	41
582	124	41
583	125	41
584	126	41
585	127	41
586	128	41
587	131	41
588	132	41
589	1400	41
590	1500	41
591	1800	41
592	500	41
593	500L	41
594	500X	41
595	600	41
596	650	41
597	750	41
598	Albea	41
599	Argenta	41
600	Barchetta	41
601	Bertone	41
602	Brava	41
603	Bravo	41
604	Campagnola	41
605	Cinquecento	41
606	Coupe	41
607	Croma	41
608	Doblo	41
609	Duna	41
610	Fiorino	41
611	Freemont	41
612	Fullback	41
613	Idea	41
614	Linea	41
615	Marea	41
616	Multipla	41
617	Palio	41
618	Panda	41
619	Punto	41
620	Qubo	41
621	Regata	41
622	Ritmo	41
623	Scudo	41
624	Sedici	41
625	Seicento	41
626	Siena	41
627	Stilo	41
628	Strada	41
629	Tempra	41
630	Tipo	41
631	Topolino	41
632	Ulysse	41
633	Uno	41
634	12m	42
635	15m	42
636	17m	42
637	20m	42
638	Aerostar	42
639	B-Max	42
640	Bronco	42
641	C-max	42
642	Capri	42
643	Connect	42
644	Consul	42
645	Cortina	42
646	Cosworth	42
647	Cougar	42
648	Countur	42
649	Courier	42
650	Crown victoria	42
651	EcoSport	42
652	Ecoline	42
653	Edge	42
654	Escape	42
655	Escort	42
656	Everest	42
657	Excursion	42
658	Expedition	42
659	Explorer	42
660	F150	42
661	F250	42
662	F350	42
663	F450	42
664	F550	42
665	F650	42
666	F750	42
667	Fiesta	42
668	Flex	42
669	Focus	42
670	Fusion	42
671	Galaxy	42
672	Granada	42
673	Ka	42
674	Kuga	42
675	Maverick	42
676	Mercury	42
677	Mondeo	42
678	Mustang	42
679	Orion	42
680	Probe	42
681	Puma	42
682	Ranger	42
683	Raptor	42
684	Rs	42
685	S-Max	42
686	Scorpio	42
687	Sierra	42
688	Sportka	42
689	Streetka	42
690	Taunus	42
691	Taurus	42
692	Thunderbird	42
693	Windstar	42
694	Zephyr	42
695	GEM E2	43
696	GEM E4	43
697	GEM E6	43
698	469	44
699	69	44
700	Atlas	45
701	Atlas Pro	45
702	Coolray	45
703	Tugella	45
704	G70	46
705	G80	46
706	G90	46
707	GV60	46
708	GV70	46
709	GV80	46
710	Metro	47
711	Prizm	47
712	Storm	47
713	Tracker	47
714	Acadia	48
715	Canyon	48
716	Envoy	48
717	Jimmy	48
718	Saturn	48
719	Savana	48
720	Sierra	48
721	Sonoma	48
722	Terrain	48
723	Tracker	48
724	Typhoon	48
725	Yukon	48
726	Gonow	49
727	Haval H2	50
728	Haval H6	50
729	Hover Cuv	50
730	Hover H5	50
731	Hover H6	50
732	Safe	50
733	Steed 3	50
734	Steed 5	50
735	Steed 6	50
736	Steed 7	50
737	Voleex C10	50
738	Voleex C20	50
739	Voleex C30	50
740	F7x	51
741	H2	51
742	H6	51
743	Jolion	51
744	Тrojan	52
745	Avenger	53
746	Forteen	53
747	Hawk	53
748	Hunter	53
749	Husky	53
750	Imp	53
751	Minx	53
752	Wizard	53
753	Accord	54
754	Cbr	54
755	Cbx	54
756	City	54
757	Civic	54
758	Civic ballade	54
759	Concerto	54
760	Cr-v	54
761	Crosstour	54
762	Crx	54
763	Crz	54
764	Electric	54
765	Element	54
766	Elysion	54
767	Fit	54
768	Fr-v	54
769	Hr-v	54
770	Insight	54
771	Integra	54
772	Jazz	54
773	Legend	54
774	Logo	54
775	Nsx	54
776	Odyssey	54
777	Passport	54
778	Pilot	54
779	Prelude	54
780	Quintet	54
781	Ridgeline	54
782	S2000	54
783	Shuttle	54
784	Stream	54
785	H1	55
786	H2	55
787	H3	55
788	Accent	56
789	Atos	56
790	Bayon	56
791	Coupe	56
792	Elantra	56
793	Equus	56
794	Excel	56
795	Galloper	56
796	Genesis	56
797	Getz	56
798	Grace	56
799	Grandeur	56
800	I10	56
801	I20	56
802	I30	56
803	I40	56
804	IX35	56
805	IX55	56
806	Ioniq	56
807	Ioniq 5	56
808	Ix20	56
809	Kona	56
810	Landskape	56
811	Lantra	56
812	Matrix	56
813	Palisade	56
814	Pony	56
815	Porter	56
816	S	56
817	Santa fe	56
818	Santamo	56
819	Sonata	56
820	Sonica	56
821	Starex	56
822	Staria	56
823	Stelar	56
824	Tb	56
825	Terracan	56
826	Trajet	56
827	Tucson	56
828	Veloster 	56
829	Veracruz	56
830	Xg	56
831	F9	57
832	Ex30	58
833	Ex35	58
834	Ex37	58
835	Fx 30	58
836	Fx 35	58
837	Fx 37	58
838	Fx 45	58
839	Fx 50	58
840	Fx45	58
841	G	58
842	G coupe	58
843	G sedan	58
844	G37	58
845	I	58
846	J	58
847	M	58
848	Q	58
849	Q30	58
850	Q40	58
851	Q45	58
852	Q50	58
853	QX30	58
854	QX50	58
855	QX56	58
856	QX60	58
857	QX70	58
858	QX80	58
859	Qx	58
860	Qx4	58
861	Mini	59
862	Amigo	60
863	D-max	60
864	Gemini	60
865	Piazza	60
866	Pickup	60
867	Rodeo	60
868	Tfs	60
869	Trooper	60
870	Vehi cross	60
871	Massive	61
872	E-S2	62
873	E-S4	62
874	J7	62
875	JS3	62
876	JS4	62
877	JS7	62
878	T8 PRO	62
879	E-S2	63
880	Daimler	64
881	Daimler double six	64
882	Daimler six	64
883	E-pace	64
884	F-PACE	64
885	F-Type	64
886	I-Pace	64
887	S-type	64
888	Sovereign	64
889	Super v8	64
890	X-type	64
891	XE	64
892	Xf	64
893	Xj	64
894	Xjr	64
895	Xjs	64
896	Xjsc	64
897	Xk8	64
898	Xkr	64
899	Cherokee	65
900	Commander	65
901	Compass	65
902	Grand cherokee	65
903	Patriot	65
904	Renegade	65
905	Wrangler	65
906	Montez	66
907	Avella delta	67
908	Cadenza	67
909	Carens	67
910	Carnival	67
911	Ceed	67
912	Cerato	67
913	Clarus	67
914	EV6	67
915	Forte	67
916	Joecs	67
917	Joyce	67
918	K5	67
919	K7	67
920	K9	67
921	Magentis	67
922	Mohave	67
923	Morning	67
924	Niro	67
925	Opirus	67
926	Optima	67
927	Picanto	67
928	Pride	67
929	Pro ceed	67
930	Quoris	67
931	Ray	67
932	Retona	67
933	Rio	67
934	Sedona	67
935	Sephia	67
936	Shuma	67
937	Sorento	67
938	Soul	67
939	Spectra	67
940	Sportage	67
941	Stinger	67
942	Stonic	67
943	Telluride	67
944	Venga	67
945	Visto	67
946	X-Trek	67
947	XCeed	67
948	1200	68
949	1300	68
950	1500	68
951	1600	68
952	2101	68
953	21011	68
954	21012	68
955	21013	68
956	21015	68
957	2102	68
958	2103	68
959	2104	68
960	21043	68
961	2105	68
962	21051	68
963	21053	68
964	2106	68
965	21061	68
966	21063	68
967	2107	68
968	21074	68
969	2108	68
970	21083	68
971	2109	68
972	21093	68
973	21099	68
974	2110	68
975	21213	68
976	Granta	68
977	Kalina	68
978	Niva	68
979	Nova	68
980	Oka	68
981	Priora	68
982	Samara	68
983	Travel	68
984	Urban	68
985	Vesta	68
986	XRAY	68
987	Magnum	69
988	Aventador	70
989	Countach	70
990	Diablo	70
991	Gallardo	70
992	Huracan	70
993	Murcielago	70
994	Reventon	70
995	Urus	70
996	Veneno	70
997	A112	71
998	Ardea	71
999	Aurelia	71
1000	Beta	71
1001	Dedra	71
1002	Delta	71
1003	Flaminia	71
1004	Flavia	71
1005	Fulvia	71
1006	Kappa	71
1007	Lybra	71
1008	Musa	71
1009	Phedra	71
1010	Prisma	71
1011	Thema	71
1012	Thesis	71
1013	Unior	71
1014	Voyager	71
1015	Y	71
1016	Y10	71
1017	Ypsilon	71
1018	Zeta	71
1019	Defender	72
1020	Discovery	72
1021	Freelander	72
1022	Range Rover Evoque	72
1023	Range Rover Sport	72
1024	Range Rover Velar	72
1025	Range rover	72
1026	Jx6476da	73
1027	CT200h	74
1028	Es	74
1029	Gs	74
1030	Gx470	74
1031	Is	74
1032	LC	74
1033	LFA	74
1034	LS	74
1035	Lx	74
1036	NX	74
1037	RC	74
1038	RX330	74
1039	Rx	74
1040	Rx300	74
1041	Rx350	74
1042	Rx400h	74
1043	Rx450	74
1044	Sc	74
1045	UX	74
1046	LF1010	75
1047	LF320	75
1048	LF520	75
1049	LF620	75
1050	LF6361	75
1051	LF7130	75
1052	LF7160	75
1053	X60	75
1054	Continental	76
1055	Ls	76
1056	MKC	76
1057	MKS	76
1058	MTK	76
1059	Mark	76
1060	Mark Lt	76
1061	Mark lt	76
1062	Mkx	76
1063	Mkz	76
1064	Navigator	76
1065	Town car	76
1066	Zephyr	76
1067	Elise	77
1068	Europe	77
1069	Evora	77
1070	Exige	77
1071	GS Exclusive	78
1072	Armada	79
1073	Bolero	79
1074	Cl	79
1075	Commander	79
1076	Goa	79
1077	KUV 100	79
1078	Marshall	79
1079	Quanto	79
1080	Scorpio	79
1081	XUV 500	79
1082	3200 gt	80
1083	Biturbo	80
1084	Coupe gt	80
1085	Ghibli	80
1086	GranCabrio	80
1087	GranTurismo	80
1088	Gransport	80
1089	Grecale	80
1090	Levante	80
1091	MC20	80
1092	Quattroporte	80
1093	Spyder	80
1094	Zagato	80
1095	Murena	81
1096	Rancho	81
1097	57	82
1098	62	82
1099	650	82
1100	S 560	82
1101	S580	82
1102	121	83
1103	2	83
1104	3	83
1105	323	83
1106	5	83
1107	6	83
1108	626	83
1109	929	83
1110	B2200	83
1111	B2500	83
1112	B2600	83
1113	BT-50	83
1114	CX-30	83
1115	CX-5	83
1116	CX-7	83
1117	CX-9	83
1118	Demio	83
1119	MX-30	83
1120	Mpv	83
1121	Mx-3	83
1122	Mx-5	83
1123	Mx-6	83
1124	Premacy	83
1125	Rx-7	83
1126	Rx-8	83
1127	Tribute	83
1128	Xedos	83
1129	СХ-3	83
1130	540C Coupe	84
1131	570S Coupe	84
1132	650S	84
1133	675LT	84
1134	720 S	84
1135	F1	84
1136	GT	84
1137	MP4-12C	84
1138	P1	84
1139	110	85
1140	111	85
1141	113	85
1142	114	85
1143	115	85
1144	116	85
1145	123	85
1146	124	85
1147	126	85
1148	126-260	85
1149	150	85
1150	170	85
1151	180	85
1152	190	85
1153	200	85
1154	220	85
1155	230	85
1156	240	85
1157	250	85
1158	260	85
1159	280	85
1160	290	85
1161	300	85
1162	320	85
1163	350	85
1164	380	85
1165	420	85
1166	450	85
1167	500	85
1168	560	85
1169	600	85
1170	A	85
1171	A 140	85
1172	A 150	85
1173	A 160	85
1174	A 170	85
1175	A 180	85
1176	A 190	85
1177	A 200	85
1178	A 210	85
1179	A 220	85
1180	A 250	85
1181	A 35	85
1182	A 45	85
1183	A45 AMG	85
1184	AMG GT	85
1185	AMG GT C	85
1186	AMG GT R	85
1187	AMG GT S	85
1188	Adenauer	85
1189	B	85
1190	B 150	85
1191	B 160	85
1192	B 170	85
1193	B 180	85
1194	B 200	85
1195	B 220	85
1196	B 250	85
1197	C	85
1198	C 160	85
1199	C 180	85
1200	C 200	85
1201	C 220	85
1202	C 230	85
1203	C 240	85
1204	C 250	85
1205	C 270	85
1206	C 280	85
1207	C 30 AMG	85
1208	C 300	85
1209	C 32 AMG	85
1210	C 320	85
1211	C 350	85
1212	C 36 AMG	85
1213	C 400	85
1214	C 43 AMG	85
1215	C 450 AMG	85
1216	C 55 AMG	85
1217	C 63 AMG	85
1218	CL	85
1219	CL 230	85
1220	CL 320	85
1221	CL 420	85
1222	CL 500	85
1223	CL 55 AMG	85
1224	CL 600	85
1225	CL 63 AMG	85
1226	CL 65 AMG	85
1227	CLA	85
1228	CLA 180	85
1229	CLA 200	85
1230	CLA 220	85
1231	CLA 250	85
1232	CLA 45 AMG	85
1233	CLC	85
1234	CLC 160	85
1235	CLC 180	85
1236	CLC 200	85
1237	CLC 220	85
1238	CLC 230	85
1239	CLC 250	85
1240	CLC 350	85
1241	CLK	85
1242	CLK 55 AMG	85
1243	CLK 63 AMG	85
1244	CLS	85
1245	CLS 250	85
1246	CLS 300	85
1247	CLS 320	85
1248	CLS 350	85
1249	CLS 400	85
1250	CLS 450	85
1251	CLS 500	85
1252	CLS 53 AMG	85
1253	CLS 55	85
1254	CLS 55 AMG	85
1255	CLS 550	85
1256	CLS 63	85
1257	CLS 63 AMG	85
1258	Citan	85
1259	E	85
1260	E 200	85
1261	E 220	85
1262	E 230	85
1263	E 240	85
1264	E 250	85
1265	E 260	85
1266	E 270	85
1267	E 280	85
1268	E 290	85
1269	E 300	85
1270	E 320	85
1271	E 350	85
1272	E 36 AMG	85
1273	E 400	85
1274	E 420	85
1275	E 43 AMG	85
1276	E 430	85
1277	E 450	85
1278	E 50 AMG	85
1279	E 500	85
1280	E 53 AMG	85
1281	E 55	85
1282	E 55 AMG	85
1283	E 60	85
1284	E 60 AMG	85
1285	E 63 AMG	85
1286	EQA	85
1287	EQB	85
1288	EQC	85
1289	EQE	85
1290	EQS	85
1291	EQV	85
1292	G	85
1293	G 230	85
1294	G 240	85
1295	G 250	85
1296	G 270	85
1297	G 280	85
1298	G 290	85
1299	G 300	85
1300	G 320	85
1301	G 350	85
1302	G 36 AMG	85
1303	G 400	85
1304	G 500	85
1305	G 55 AMG	85
1306	G 63 AMG	85
1307	G 65 AMG	85
1308	GL	85
1309	GL 320	85
1310	GL 350	85
1311	GL 420	85
1312	GL 450	85
1313	GL 500	85
1314	GL 55 AMG	85
1315	GL 63 AMG	85
1316	GLA	85
1317	GLA 180	85
1318	GLA 200	85
1319	GLA 220	85
1320	GLA 250	85
1321	GLA 45 AMG	85
1322	GLB	85
1323	GLC	85
1324	GLC 220	85
1325	GLC 250	85
1326	GLC 300	85
1327	GLC 350	85
1328	GLC 400	85
1329	GLC 43 AMG	85
1330	GLC 63 AMG	85
1331	GLE	85
1332	GLE 250	85
1333	GLE 350	85
1334	GLE 400	85
1335	GLE 43 AMG	85
1336	GLE 450 AMG	85
1337	GLE 500	85
1338	GLE 53 4MATIC	85
1339	GLE 580	85
1340	GLE 63 AMG	85
1341	GLE 63 S AMG	85
1342	GLE Coupe	85
1343	GLK	85
1344	GLS	85
1345	GLS 350	85
1346	GLS 400	85
1347	GLS 450	85
1348	GLS 500	85
1349	GLS 600	85
1350	GLS 63 AMG	85
1351	GLS580	85
1352	GT	85
1353	GTS	85
1354	ML	85
1355	ML 230	85
1356	ML 250	85
1357	ML 270	85
1358	ML 280	85
1359	ML 300	85
1360	ML 320	85
1361	ML 350	85
1362	ML 400	85
1363	ML 420	85
1364	ML 430	85
1365	ML 450	85
1366	ML 500	85
1367	ML 55 AMG	85
1368	ML 63 AMG	85
1369	Maybach	85
1370	R	85
1371	R 280	85
1372	R 300	85
1373	R 320	85
1374	R 350	85
1375	R 500	85
1376	R 63 AMG	85
1377	S	85
1378	S 250	85
1379	S 280	85
1380	S 300	85
1381	S 320	85
1382	S 350	85
1383	S 400	85
1384	S 420	85
1385	S 430	85
1386	S 450	85
1387	S 500	85
1388	S 55 AMG	85
1389	S 550	85
1390	S 560	85
1391	S 600	85
1392	S 63	85
1393	S 63 AMG	85
1394	S 65	85
1395	S 65 AMG	85
1396	S580	85
1397	S680	85
1398	SL	85
1399	SL 400	85
1400	SL 500	85
1401	SL 55 AMG	85
1402	SL 60 AMG	85
1403	SL 600	85
1404	SL 63 AMG	85
1405	SL 65 AMG	85
1406	SLC	85
1407	SLK	85
1408	SLK 32 AMG	85
1409	SLK 55 AMG	85
1410	SLR	85
1411	SLS	85
1412	SLS AMG	85
1413	T-класа	85
1414	Unimog	85
1415	Vaneo	85
1416	Viano	85
1417	X-Klasse	85
1418	Marauder	86
1419	Milan	86
1420	Monarch	86
1421	Mountaineer	86
1422	Villager	86
1423	Mga	87
1424	Mgb	87
1425	Mgf	87
1426	Tf	87
1427	Zr	87
1428	Zs	87
1429	Zt	87
1430	Zt-t	87
1431	MC1	88
1432	MC2	88
1433	MGO	88
1434	Clubman	89
1435	Cooper	89
1436	Cooper cabrio	89
1437	Cooper s	89
1438	Cooper s cabrio	89
1439	Countryman	89
1440	Coupe	89
1441	D one	89
1442	John Cooper Works	89
1443	One	89
1444	One cabrio	89
1445	Paceman	89
1446	3000 gt	90
1447	ASX	90
1448	Attrage	90
1449	Carisma	90
1450	Colt	90
1451	Cordia	90
1452	Eclipse	90
1453	Eclipse Cross	90
1454	Galant	90
1455	Grandis	90
1456	I-MiEV	90
1457	L200	90
1458	Lancer	90
1459	Mirage	90
1460	Montero	90
1461	Outlander	90
1462	Pajero	90
1463	Pajero pinin	90
1464	Pajero sport	90
1465	RVR	90
1466	Sapporo	90
1467	Sigma	90
1468	Space gear	90
1469	Space runner	90
1470	Space star	90
1471	Space wagon	90
1472	Starion	90
1473	Tredia	90
1474	Aero8	91
1475	1360	92
1476	1361	92
1477	1500	92
1478	2136	92
1479	2138	92
1480	2140	92
1481	2141	92
1482	21412	92
1483	21417	92
1484	2142	92
1485	2715	92
1486	401	92
1487	403	92
1488	407	92
1489	408	92
1490	412	92
1491	426	92
1492	427	92
1493	503	92
1494	Aleko	92
1495	Иж	92
1496	100 nx	93
1497	200 sx	93
1498	240 z	93
1499	280 z	93
1500	300 zx	93
1501	350z	93
1502	370Z	93
1503	Acura	93
1504	Almera	93
1505	Almera tino	93
1506	Altima	93
1507	Ariya	93
1508	Armada	93
1509	Bluebird	93
1510	Cedric	93
1511	Cherry	93
1512	Cube	93
1513	Figaro	93
1514	Frontier	93
1515	Gt-r	93
1516	Juke	93
1517	Kubistar	93
1518	Laurel	93
1519	Leaf 	93
1520	Maxima	93
1521	Micra	93
1522	Murano	93
1523	NP300	93
1524	Navara	93
1525	Note	93
1526	Pathfinder	93
1527	Patrol	93
1528	Pickup	93
1529	Pixo	93
1530	Prairie	93
1531	Primera	93
1532	Pulsar	93
1533	Qashqai	93
1534	Quest	93
1535	Rogue	93
1536	Sentra	93
1537	Serena	93
1538	Silvia	93
1539	Skyline	93
1540	Stantza	93
1541	Sunny	93
1542	Teana	93
1543	Terrano	93
1544	Tiida	93
1545	Titan crew cab	93
1546	Titan king	93
1547	Versa	93
1548	X-trail	93
1549	Xterra	93
1550	e-NV200	93
1551	Achieva	94
1552	Alero	94
1553	Aurora	94
1554	Bravada	94
1555	Cutlass	94
1556	Firenza	94
1557	Intrigue	94
1558	Regency	94
1559	Silhouette	94
1560	Toronado	94
1561	Adam	95
1562	Admiral	95
1563	Agila	95
1564	Ampera	95
1565	Antara	95
1566	Ascona	95
1567	Astra	95
1568	Calibra	95
1569	Campo	95
1570	Cascada	95
1571	Combo	95
1572	Commodore	95
1573	Corsa	95
1574	Crossland X	95
1575	Diplomat	95
1576	Frontera	95
1577	Grandland X	95
1578	Gt	95
1579	Insignia	95
1580	Kadett	95
1581	Kapitaen	95
1582	Karl	95
1583	Manta	95
1584	Meriva	95
1585	Mokka	95
1586	Monterey	95
1587	Monza	95
1588	Omega	95
1589	Rekord	95
1590	Senator	95
1591	Signum	95
1592	Sintra	95
1593	Speedster	95
1594	Tigra	95
1595	Vectra	95
1596	Zafira	95
1597	Kancil	96
1598	Kelisa	96
1599	Kembara	96
1600	Kenari	96
1601	Nippa	96
1602	Rusa	96
1603	1007	97
1604	104	97
1605	106	97
1606	107	97
1607	108	97
1608	2008	97
1609	202	97
1610	204	97
1611	205	97
1612	206	97
1613	207	97
1614	208	97
1615	3008	97
1616	301	97
1617	304	97
1618	305	97
1619	306	97
1620	307	97
1621	308	97
1622	309	97
1623	4007	97
1624	4008	97
1625	402	97
1626	403	97
1627	404	97
1628	405	97
1629	406	97
1630	407	97
1631	5008	97
1632	504	97
1633	505	97
1634	508	97
1635	604	97
1636	605	97
1637	607	97
1638	806	97
1639	807	97
1640	Bipper	97
1641	Expert	97
1642	Partner	97
1643	RCZ	97
1644	Range	97
1645	Rifter	97
1646	Traveler	97
1647	iOn	97
1648	Cevennes	98
1649	Speedster	98
1650	Acclaim	99
1651	Barracuda	99
1652	Breeze	99
1653	Colt	99
1654	Grand voyager	99
1655	Horizon	99
1656	Laser	99
1657	Neon	99
1658	Prowler	99
1659	Reliant	99
1660	Road runner	99
1661	Sundance	99
1662	Volare	99
1663	Voyager	99
1664	Polestar Electric	100
1665	Pickup	101
1666	Polestar	101
1667	Aztec	102
1668	Bonneville	102
1669	Fiero	102
1670	Firebird	102
1671	G6	102
1672	Grand am	102
1673	Grand prix	102
1674	Gto	102
1675	Lemans	102
1676	Solstice	102
1677	Sunbird	102
1678	Sunfire	102
1679	Tempest	102
1680	Torrent	102
1681	Trans am	102
1682	Trans sport	102
1683	Vibe	102
1684	356 Speedster	103
1685	911	103
1686	918 Spyder	103
1687	924	103
1688	928	103
1689	935	103
1690	944	103
1691	956	103
1692	968	103
1693	991	103
1694	993	103
1695	996	103
1696	Boxster	103
1697	Carrera	103
1698	Cayenne	103
1699	Cayman	103
1700	Macan	103
1701	Panamera	103
1702	Taycan	103
1703	400	104
1704	Arena	104
1705	Persone	104
1706	Satria	104
1707	3	105
1708	10	106
1709	11	106
1710	12	106
1711	14	106
1712	16	106
1713	18	106
1714	19	106
1715	20	106
1716	21	106
1717	25	106
1718	29	106
1719	30	106
1720	4	106
1721	5	106
1722	8	106
1723	9	106
1724	Alpine	106
1725	Arkana	106
1726	Avantime	106
1727	Bakara	106
1728	Bulgar	106
1729	Captur	106
1730	Caravelle	106
1731	Chamade	106
1732	Clio	106
1733	Duster	106
1734	Espace	106
1735	Express	106
1736	Floride	106
1737	Fluence	106
1738	Fuego	106
1739	Grand espace	106
1740	Grand scenic	106
1741	Kadjar	106
1742	Kangoo	106
1743	Koleos	106
1744	Laguna	106
1745	Laguna Coupe	106
1746	Latitude	106
1747	Megane	106
1748	Modus	106
1749	Nevada	106
1750	Rapid	106
1751	Safrane	106
1752	Scenic	106
1753	Scenic rx4	106
1754	Symbol	106
1755	Talisman	106
1756	Twingo	106
1757	Twizy	106
1758	Vel satis	106
1759	Wind	106
1760	Zoe	106
1761	Century	107
1762	MR	107
1763	Cullinan	108
1764	Dawn	108
1765	Ghost	108
1766	Phantom	108
1767	Rieju	108
1768	Silver Cloud	108
1769	Silver Seraph	108
1770	Silver Spur	108
1771	Wraith	108
1772	111	109
1773	114	109
1774	200	109
1775	213	109
1776	214	109
1777	216	109
1778	220	109
1779	25	109
1780	400	109
1781	414	109
1782	416	109
1783	418	109
1784	420	109
1785	45	109
1786	600	109
1787	618	109
1788	620	109
1789	623	109
1790	75	109
1791	800	109
1792	820	109
1793	825	109
1794	827	109
1795	City	109
1796	Estate	109
1797	Maestro	109
1798	Metro	109
1799	Mini	109
1800	Montego	109
1801	Streetwise	109
1802	F16	110
1803	F440DCI	110
1804	Fun Buggy	110
1805	Fun Extreem	110
1806	Fun Lander	110
1807	Fun Quad	110
1808	Ceo	111
1809	9-3	112
1810	9-4X	112
1811	9-5	112
1812	9-7x	112
1813	900	112
1814	9000	112
1815	LX	113
1816	PS10	114
1817	Astra	115
1818	Aura	115
1819	Outlook	115
1820	Sky	115
1821	Vue	115
1822	Tc	116
1823	Xa	116
1824	Xb	116
1825	Alhambra	117
1826	Altea	117
1827	Arona	117
1828	Arosa	117
1829	Ateca	117
1830	Cordoba	117
1831	Cupra	117
1832	Exeo	117
1833	Fura	117
1834	Ibiza	117
1835	Inka	117
1836	Leon	117
1837	Malaga	117
1838	Marbella	117
1839	Mii	117
1840	Ronda	117
1841	Tarraco	117
1842	Terra	117
1843	Toledo	117
1844	Vario	117
1845	Stella	118
1846	Ceo	119
1847	Noble	119
1848	1307	120
1849	1308	120
1850	1309	120
1851	1510	120
1852	9	120
1853	9 Sport	120
1854	Aront	120
1855	Chrysler	120
1856	Horizon	120
1857	Shambord	120
1858	Solara	120
1859	Special	120
1860	Versail	120
1861	100	121
1862	1000	121
1863	105	121
1864	120	121
1865	125	121
1866	130	121
1867	135	121
1868	136	121
1869	Citigo	121
1870	Enyaq	121
1871	Fabia	121
1872	Favorit	121
1873	Felicia	121
1874	Forman	121
1875	Kamiq	121
1876	Karoq	121
1877	Kodiaq	121
1878	Octavia	121
1879	Praktik	121
1880	Rapid	121
1881	Roomster	121
1882	Scala	121
1883	Superb	121
1884	Yeti	121
1885	Forfour	122
1886	Fortwo	122
1887	Mc	122
1888	Roadster	122
1889	Chairman	123
1890	Rodius	123
1891	Tivoli	123
1892	1800	124
1893	Ascent	124
1894	B10 Tribeka	124
1895	B9 tribeca	124
1896	BRZ	124
1897	Baja	124
1898	E12	124
1899	Forester	124
1900	G3x justy	124
1901	Impreza	124
1902	Justy	124
1903	Legacy	124
1904	Leone	124
1905	Levorg	124
1906	Libero	124
1907	Outback	124
1908	Svx	124
1909	Trezia	124
1910	Vivio	124
1911	XT	124
1912	XV	124
1913	Across	125
1914	Alto	125
1915	Baleno	125
1916	Celerio	125
1917	Forenza	125
1918	Grand vitara	125
1919	Ignis	125
1920	Jimny	125
1921	Kizashi	125
1922	Liana	125
1923	Maruti	125
1924	Reno	125
1925	SX4	125
1926	SX4 S-Cross	125
1927	Samurai	125
1928	Santana	125
1929	Sg	125
1930	Sidekick	125
1931	Sj	125
1932	Splash	125
1933	Swace	125
1934	Swift	125
1935	Vitara	125
1936	Wagon r	125
1937	X-90	125
1938	XL-7	125
1939	1100	126
1940	1310	126
1941	Horizon	126
1942	Matra	126
1943	Murena	126
1944	Samba	126
1945	Simka	126
1946	Solara	126
1947	Aria	127
1948	Estate	127
1949	Indica	127
1950	Mint	127
1951	Nano	127
1952	Safari	127
1953	Sierra	127
1954	Sumo	127
1955	Telcoline	127
1956	Xenon	127
1957	Dana	128
1958	Kombi	128
1959	Slavuta	128
1960	Zero	129
1961	Gurkha	130
1962	Judo	130
1963	Fl2850	131
1964	Sl3000	131
1965	Model 3	132
1966	Model S	132
1967	Model X	132
1968	Model Y	132
1969	Roadster	132
1970	Roadster Sport	132
1971	Dogan	133
1972	Kartal	133
1973	Sahin	133
1974	4runner	134
1975	Alphard	134
1976	Auris	134
1977	Avalon	134
1978	Avensis	134
1979	Avensis verso	134
1980	Aygo	134
1981	C-HR	134
1982	Camry	134
1983	Carina	134
1984	Celica	134
1985	Corolla	134
1986	Corolla Matrix	134
1987	Corolla verso	134
1988	Cressida	134
1989	Crown	134
1990	Fj cruiser	134
1991	GT86	134
1992	Harrier	134
1993	Highlander	134
1994	Hilux	134
1995	IQ	134
1996	Land cruiser	134
1997	Matrix	134
1998	Mr2	134
1999	Paseo	134
2000	Picnic	134
2001	Previa	134
2002	Prius	134
2003	Proace City	134
2004	Proace City Verso	134
2005	Rav4	134
2006	Scion	134
2007	Sequoia	134
2008	Sienna	134
2009	Starlet	134
2010	Supra	134
2011	Tacoma	134
2012	Tercel	134
2013	Tundra	134
2014	Urban Cruiser	134
2015	Venza	134
2016	Verso	134
2017	Verso S	134
2018	Yaris	134
2019	Yaris verso	134
2020	600	135
2021	601	135
2022	Combi	135
2023	T 1.1	135
2024	Acclaim	136
2025	Dolomite	136
2026	Herald	136
2027	Spitfire	136
2028	Stag	136
2029	Tr6	136
2030	Tr7	136
2031	2206	137
2032	23602 Cargo	137
2033	3303	137
2034	3741	137
2035	390945	137
2036	390995	137
2037	452	137
2038	460	137
2039	469	137
2040	669	137
2041	69	137
2042	Expedition	137
2043	Hunter	137
2044	Patriot	137
2045	Pickup	137
2046	Профи	137
2047	Kiwi	138
2048	Rhea	138
2049	1200	139
2050	1300	139
2051	1302	139
2052	1303	139
2053	1500	139
2054	1600	139
2055	Alltrack	139
2056	Amarok	139
2057	Arteon	139
2058	Atlas	139
2059	Bora	139
2060	CC	139
2061	Caddy	139
2062	Corrado	139
2063	Derby	139
2064	Eos	139
2065	Fox	139
2066	Golf	139
2067	Golf Plus	139
2068	Golf Variant	139
2069	ID.3	139
2070	ID.4	139
2071	ID.5	139
2072	ID.6	139
2073	Jetta	139
2074	K 70	139
2075	Karmann-ghia	139
2076	Lupo	139
2077	Multivan	139
2078	New beetle	139
2079	Passat	139
2080	Phaeton	139
2081	Polo	139
2082	Rabbit	139
2083	Santana	139
2084	Scirocco	139
2085	Sharan	139
2086	Sportsvan	139
2087	T-Cross	139
2088	T-Roc	139
2089	Taigo	139
2090	Taro	139
2091	Tiguan	139
2092	Touareg	139
2093	Touran	139
2094	Up	139
2095	Vento	139
2096	22	140
2097	24	140
2098	3102	140
2099	3110	140
2100	3111	140
2101	M 20	140
2102	M 21	140
2103	Siber	140
2104	142	141
2105	144	141
2106	145	141
2107	164	141
2108	1800 es	141
2109	240	141
2110	244	141
2111	245	141
2112	262 c	141
2113	264	141
2114	340	141
2115	343	141
2116	344	141
2117	345	141
2118	360	141
2119	440	141
2120	460	141
2121	480	141
2122	66	141
2123	740	141
2124	744	141
2125	745	141
2126	760	141
2127	765	141
2128	770	141
2129	780	141
2130	850	141
2131	940	141
2132	960	141
2133	C30	141
2134	C70	141
2135	P 1800	141
2136	S40	141
2137	S60	141
2138	S70	141
2139	S80	141
2140	S90	141
2141	V40	141
2142	V40 Cross Country	141
2143	V50	141
2144	V60	141
2145	V60 Cross Country	141
2146	V70	141
2147	V90	141
2148	V90 Cross Country	141
2149	XC40	141
2150	XC60	141
2151	Xc70	141
2152	Xc90	141
2153	223	142
2154	232	142
2155	1.3	143
2156	311	143
2157	312	143
2158	353	143
2159	Gt	144
2160	Mf3	144
2161	Mf4	144
2162	Mf5	144
2163	1021d	145
2164	1021ls	145
2165	1021s	145
2166	2021d	145
2167	2021s	145
2168	XS-D055	146
2169	MA	147
2170	600	148
2171	750	148
2172	Florida	148
2173	Gt 55	148
2174	Koral	148
2175	Miami	148
2176	Yugo 45	148
2177	1102	149
2178	1103	149
2179	1105	149
2180	965	149
2181	966	149
2182	968	149
2183	Tavria	149
2184	M	150
2185	C	151
2186	M	152
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (id, title) FROM stdin;
1	Благоевград
2	Бургас
3	Варна
4	Велико Търново
5	Видин
6	Враца
7	Габрово
8	Добрич
9	Дупница
10	Кърджали
11	Кюстендил
12	Ловеч
13	Монтана
14	Пазарджик
15	Перник
16	Плевен
17	Пловдив
18	Разград
19	Русе
20	Силистра
21	Сливен
22	Смолян
23	София
24	Стара Загора
25	Търговище
26	Хасково
27	Шумен
28	Ямбол
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, title) FROM stdin;
1	admin
2	ordinary_user
\.


--
-- Data for Name: settlements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settlements (id, title, region_id) FROM stdin;
1	гр. Благоевград	1
2	гр. Банско	1
3	гр. Белица	1
4	гр. Гоце Делчев	1
5	гр. Добринище	1
6	гр. Кресна	1
7	гр. Мелник	1
8	гр. Петрич	1
9	гр. Разлог	1
10	гр. Сандански	1
11	гр. Симитли	1
12	гр. Хаджидимово	1
13	гр. Якоруда	1
14	с. Абланица	1
15	с. Аврамово	1
16	с. Бабяк	1
17	с. Балдево	1
18	с. Баничан	1
19	с. Баня	1
20	с. Баскалци	1
21	с. Бачево	1
22	с. Бел камен	1
23	с. Беласица	1
24	с. Белевехчево	1
25	с. Бело поле	1
26	с. Бельово	1
27	с. Беслен	1
28	с. Бистрица	1
29	с. Блатска	1
30	с. Боголин	1
31	с. Богородица	1
32	с. Бождово	1
33	с. Боровичене	1
34	с. Борово	1
35	с. Брежани	1
36	с. Брезница	1
37	с. Брестово	1
38	с. Будилци	1
39	с. Буково	1
40	с. Бунцево	1
41	с. Бучино	1
42	с. Българчево	1
43	с. Ваклиново	1
44	с. Велющец	1
45	с. Виногради	1
46	с. Вихрен	1
47	с. Вишлене	1
48	с. Влахи	1
49	с. Волно	1
50	с. Вракуповица	1
51	с. Враня	1
52	с. Вълково	1
53	с. Вълкосел	1
54	с. Габрене	1
55	с. Габрово	1
56	с. Гайтаниново	1
57	с. Гега	1
58	с. Генерал Тодоров	1
59	с. Годешево	1
60	с. Годлево	1
61	с. Голем Цалим	1
62	с. Голешово	1
63	с. Гореме	1
64	с. Горна Брезница	1
65	с. Горна Крушица	1
66	с. Горна Рибница	1
67	с. Горна Сушица	1
68	с. Горно Драглище	1
69	с. Горно Дряново	1
70	с. Горно Краище	1
71	с. Горно Осеново	1
72	с. Горно Спанчево	1
73	с. Горно Хърсово	1
74	с. Горчево	1
75	с. Господинци	1
76	с. Гостун	1
77	с. Градево	1
78	с. Гълъбово	1
79	с. Гърмен	1
80	с. Гюргево	1
81	с. Дагоново	1
82	с. Дамяница	1
83	с. Дебочица	1
84	с. Дебрен	1
85	с. Дебрене	1
86	с. Делвино	1
87	с. Делчево	1
88	с. Джигурово	1
89	с. Добри лаки	1
90	с. Добротино	1
91	с. Добърско	1
92	с. Докатичево	1
93	с. Долен	1
94	с. Долене	1
95	с. Долени	1
96	с. Долна Градешница	1
97	с. Долна Крушица	1
98	с. Долна Рибница	1
99	с. Долно Драглище	1
100	с. Долно Дряново	1
101	с. Долно Осеново	1
102	с. Долно Спанчево	1
103	с. Драгуш	1
104	с. Драката	1
105	с. Дрангово	1
106	с. Дренково	1
107	с. Дреновица	1
108	с. Дреново	1
109	с. Дъбница	1
110	с. Дъбрава	1
111	с. Еленово	1
112	с. Елешница	1
113	с. Железница	1
114	с. Жижево	1
115	с. Занога	1
116	с. Зелендол	1
117	с. Златарица	1
118	с. Златолист	1
119	с. Зойчене	1
120	с. Зорница	1
121	с. Иваново	1
122	с. Игралище	1
123	с. Изгрев	1
124	с. Илинден	1
125	с. Илинденци	1
126	с. Кавракирово	1
127	с. Калиманци	1
128	с. Камена	1
129	с. Каменица	1
130	с. Капатово	1
131	с. Катунци	1
132	с. Кашина	1
133	с. Кладенци	1
134	с. Клепало	1
135	с. Клисура	1
136	с. Ключ	1
137	с. Ковачевица	1
138	с. Ковачево	1
139	с. Коларово	1
140	с. Колибите	1
141	с. Конарско	1
142	с. Копривлен	1
143	с. Корница	1
144	с. Кочан	1
145	с. Краище	1
146	с. Кремен	1
147	с. Крибул	1
148	с. Кромидово	1
149	с. Крупник	1
150	с. Крушево	1
151	с. Крънджилица	1
152	с. Кръстилци	1
153	с. Кузьово	1
154	с. Кукурахцево	1
155	с. Кулата	1
156	с. Кърланово	1
157	с. Кърналово	1
158	с. Кърпелево	1
159	с. Ладарево	1
160	с. Ласкарево	1
161	с. Лебница	1
162	с. Левуново	1
163	с. Лехово	1
164	с. Лешко	1
165	с. Лешница	1
166	с. Лещен	1
167	с. Лиляново	1
168	с. Лисия	1
169	с. Логодаж	1
170	с. Лозеница	1
171	с. Лъжница	1
172	с. Лъки	1
173	с. Любовище	1
174	с. Любовка	1
175	с. Лютово	1
176	с. Малки Цалим	1
177	с. Марикостиново	1
178	с. Марино поле	1
179	с. Марулево	1
180	с. Марчево	1
181	с. Махалата	1
182	с. Мендово	1
183	с. Места	1
184	с. Мечкул	1
185	с. Микрево	1
186	с. Митино	1
187	с. Михнево	1
188	с. Мощанец	1
189	с. Мусомища	1
190	с. Никудин	1
191	с. Нова Ловча	1
192	с. Ново Делчево	1
193	с. Ново Кономлади	1
194	с. Ново Лески	1
195	с. Ново Ходжово	1
196	с. Обел	1
197	с. Обидим	1
198	с. Огняново	1
199	с. Ореше	1
200	с. Орцево	1
201	с. Осеново	1
202	с. Осиково	1
203	с. Осина	1
204	с. Ощава	1
205	с. Падеш	1
206	с. Палат	1
207	с. Палатик	1
208	с. Парил	1
209	с. Петрелик	1
210	с. Петрово	1
211	с. Пиперица	1
212	с. Пирин	1
213	с. Плетена	1
214	с. Плоски	1
215	с. Покровник	1
216	с. Полена	1
217	с. Поленица	1
218	с. Полето	1
219	с. Право бърдо	1
220	с. Първомай	1
221	с. Раздол	1
222	с. Ракитна	1
223	с. Рибник	1
224	с. Рибново	1
225	с. Рилци	1
226	с. Рожен	1
227	с. Рупите	1
228	с. Ръждак	1
229	с. Садово	1
230	с. Самуилова крепост	1
231	с. Самуилово	1
232	с. Сатовча	1
233	с. Седелец	1
234	с. Селище	1
235	с. Сенокос	1
236	с. Склаве	1
237	с. Скребатно	1
238	с. Скрът	1
239	с. Слащен	1
240	с. Сливница	1
241	с. Смолево	1
242	с. Спатово	1
243	с. Стара Кресна	1
244	с. Старчево	1
245	с. Стожа	1
246	с. Струма	1
247	с. Струмешница	1
248	с. Струмяни	1
249	с. Сугарево	1
250	с. Сухострел	1
251	с. Сушица	1
252	с. Теплен	1
253	с. Тешово	1
254	с. Тонско дабе	1
255	с. Тополница	1
256	с. Тросково	1
257	с. Туховища	1
258	с. Филипово	1
259	с. Фъргово	1
260	с. Хвостяне	1
261	с. Хотово	1
262	с. Храсна	1
263	с. Хърсово	1
264	с. Цапарево	1
265	с. Церово	1
266	с. Черешница	1
267	с. Черешово	1
268	с. Черна Места	1
269	с. Черниче	1
270	с. Чурилово	1
271	с. Чуричени	1
272	с. Чучулигово	1
273	с. Юруково	1
274	с. Яворница	1
275	с. Яково	1
276	с. Яново	1
277	гр. Бургас	2
278	гр. Айтос	2
279	гр. Ахелой	2
280	гр. Ахтопол	2
281	гр. Българово	2
282	гр. Каблешково	2
283	гр. Камено	2
284	гр. Карнобат	2
285	гр. Китен	2
286	гр. Малко Търново	2
287	гр. Несебър	2
288	гр. Обзор	2
289	гр. Поморие	2
290	гр. Приморско	2
291	гр. Свети Влас	2
292	гр. Созопол	2
293	гр. Средец	2
294	гр. Сунгурларе	2
295	гр. Царево	2
296	гр. Черноморец	2
297	к.к. Слънчев бряг	2
298	с. Александрово	2
299	с. Аспарухово	2
300	с. Атия	2
301	с. Баня	2
302	с. Бата	2
303	с. Белеврен	2
304	с. Белила	2
305	с. Белодол	2
306	с. Бероново	2
307	с. Билка	2
308	с. Бистрец	2
309	с. Близнак	2
310	с. Богданово	2
311	с. Босилково	2
312	с. Братово	2
313	с. Бродилово	2
314	с. Бръшлян	2
315	с. Брястовец	2
316	с. Българи	2
317	с. Бяла вода	2
318	с. Варвара	2
319	с. Варовник	2
320	с. Ведрово	2
321	с. Везенково	2
322	с. Велика	2
323	с. Велислав	2
324	с. Венец	2
325	с. Веселие	2
326	с. Визица	2
327	с. Винарско	2
328	с. Вишна	2
329	с. Вратица	2
330	с. Вресово	2
331	с. Вълчаново	2
332	с. Вълчин	2
333	с. Вършило	2
334	с. Габерово	2
335	с. Габър	2
336	с. Глумче	2
337	с. Голямо Буково	2
338	с. Горица	2
339	с. Горно Ябълково	2
340	с. Горово	2
341	с. Граматиково	2
342	с. Гранитец	2
343	с. Граничар	2
344	с. Грозден	2
345	с. Гълъбец	2
346	с. Гюльовца	2
347	с. Дебелт	2
348	с. Деветак	2
349	с. Деветинци	2
350	с. Детелина	2
351	с. Димчево	2
352	с. Добра поляна	2
353	с. Добриново	2
354	с. Добромир	2
355	с. Долно Ябълково	2
356	с. Драганово	2
357	с. Драганци	2
358	с. Драгово	2
359	с. Драка	2
360	с. Драчево	2
361	с. Дропла	2
362	с. Дрянковец	2
363	с. Дъбник	2
364	с. Дъбовица	2
365	с. Дъскотна	2
366	с. Дюлево	2
367	с. Дюля	2
368	с. Евренозово	2
369	с. Екзарх Антимово	2
370	с. Емона	2
371	с. Есен	2
372	с. Железник	2
373	с. Желязово	2
374	с. Житосвят	2
375	с. Заберново	2
376	с. Завет	2
377	с. Загорци	2
378	с. Заимчево	2
379	с. Зайчар	2
380	с. Звезда	2
381	с. Звездец	2
382	с. Зетьово	2
383	с. Зидарово	2
384	с. Зимен	2
385	с. Зорница	2
386	с. Извор	2
387	с. Изворище	2
388	с. Изгрев	2
389	с. Индже войвода	2
390	с. Искра	2
391	с. Калово	2
392	с. Каменар	2
393	с. Каменяк	2
394	с. Камчия	2
395	с. Каравельово	2
396	с. Карагеоргиево	2
397	с. Караново	2
398	с. Кирово	2
399	с. Кликач	2
400	с. Климаш	2
401	с. Козаре	2
402	с. Козичино	2
403	с. Козница	2
404	с. Кондолово	2
405	с. Константиново	2
406	с. Косовец	2
407	с. Костен	2
408	с. Кости	2
409	с. Кошарица	2
410	с. Крумово градище	2
411	с. Крушевец	2
412	с. Крушово	2
413	с. Кръстина	2
414	с. Кубадин	2
415	с. Ливада	2
416	с. Листец	2
417	с. Лозарево	2
418	с. Лозенец	2
419	с. Лозица	2
420	с. Лъка	2
421	с. Люляково	2
422	с. Лясково	2
423	с. Малина	2
424	с. Малка поляна	2
425	с. Манолич	2
426	с. Маринка	2
427	с. Медово	2
428	с. Миролюбово	2
429	с. Младежко	2
430	с. Момина църква	2
431	с. Мрежичко	2
432	с. Мъглен	2
433	с. Мъдрино	2
434	с. Невестино	2
435	с. Ново Паничарево	2
436	с. Огнен	2
437	с. Оризаре	2
438	с. Орлинци	2
439	с. Паницово	2
440	с. Пещерско	2
441	с. Пирне	2
442	с. Писменово	2
443	с. Планиница	2
444	с. Подвис	2
445	с. Подгорец	2
446	с. Полски извор	2
447	с. Поляново	2
448	с. Порой	2
449	с. Преображенци	2
450	с. Прилеп	2
451	с. Припек	2
452	с. Присад	2
453	с. Приселци	2
454	с. Просеник	2
455	с. Проход	2
456	с. Пчелин	2
457	с. Пънчево	2
458	с. Равадиново	2
459	с. Равда	2
460	с. Равна гора	2
461	с. Равнец	2
462	с. Радойново	2
463	с. Разбойна	2
464	с. Раклиново	2
465	с. Раклица	2
466	с. Раковсково	2
467	с. Резово	2
468	с. Речица	2
469	с. Рожден	2
470	с. Росен	2
471	с. Росеново	2
472	с. Рудина	2
473	с. Рудник	2
474	с. Руен	2
475	с. Рупча	2
476	с. Русокастро	2
477	с. Ръжица	2
478	с. Садово	2
479	с. Сан-Стефано	2
480	с. Светлина	2
481	с. Свобода	2
482	с. Сигмен	2
483	с. Синеморец	2
484	с. Сини рид	2
485	с. Синьо камене	2
486	с. Скала	2
487	с. Скалак	2
488	с. Славянци	2
489	с. Сливарово	2
490	с. Сливово	2
491	с. Смолник	2
492	с. Снежа	2
493	с. Снягово	2
494	с. Соколец	2
495	с. Соколово	2
496	с. Средна махала	2
497	с. Стоилово	2
498	с. Страцин	2
499	с. Струя	2
500	с. Суходол	2
501	с. Съдиево	2
502	с. Съединение	2
503	с. Сърнево	2
504	с. Твърдица	2
505	с. Терзийско	2
506	с. Тополица	2
507	с. Топчийско	2
508	с. Тракийци	2
509	с. Трояново	2
510	с. Трънак	2
511	с. Тръстиково	2
512	с. Тънково	2
513	с. Фазаново	2
514	с. Факия	2
515	с. Хаджиите	2
516	с. Церковски	2
517	с. Череша	2
518	с. Черково	2
519	с. Черна могила	2
520	с. Черни връх	2
521	с. Черница	2
522	с. Черно море	2
523	с. Черноград	2
524	с. Чубра	2
525	с. Чукарка	2
526	с. Шиварово	2
527	с. Ябълчево	2
528	с. Ясеново	2
529	с. Ясна поляна	2
530	гр. Варна	3
531	гр. Аксаково	3
532	гр. Белослав	3
533	гр. Бяла	3
534	гр. Вълчи дол	3
535	гр. Девня	3
536	гр. Долни чифлик	3
537	гр. Дългопол	3
538	гр. Игнатиево	3
539	гр. Провадия	3
540	гр. Суворово	3
541	с. Аврен	3
542	с. Арковна	3
543	с. Аспарухово	3
544	с. Баново	3
545	с. Белоградец	3
546	с. Бенковски	3
547	с. Близнаци	3
548	с. Блъсково	3
549	с. Бозвелийско	3
550	с. Болярци	3
551	с. Боряна	3
552	с. Ботево	3
553	с. Бояна	3
554	с. Брестак	3
555	с. Булаир	3
556	с. Бърдарево	3
557	с. Бързица	3
558	с. Величково	3
559	с. Венелин	3
560	с. Венчан	3
561	с. Ветрино	3
562	с. Водица	3
563	с. Войводино	3
564	с. Въглен	3
565	с. Габърница	3
566	с. Генерал Кантарджиево	3
567	с. Генерал Киселово	3
568	с. Генерал Колево	3
569	с. Голица	3
570	с. Горен чифлик	3
571	с. Горица	3
572	с. Господиново	3
573	с. Градинарово	3
574	с. Гроздьово	3
575	с. Дебелец	3
576	с. Детелина	3
577	с. Добри дол	3
578	с. Добрина	3
579	с. Доброглед	3
580	с. Доброплодно	3
581	с. Добротич	3
582	с. Долище	3
583	с. Дръндар	3
584	с. Дъбравино	3
585	с. Дюлино	3
586	с. Езерово	3
587	с. Есеница	3
588	с. Житница	3
589	с. Засмяно	3
590	с. Звездица	3
591	с. Звънец	3
592	с. Здравец	3
593	с. Златина	3
594	с. Зорница	3
595	с. Изворник	3
596	с. Изворско	3
597	с. Изгрев	3
598	с. Искър	3
599	с. Казашка река	3
600	с. Казашко	3
601	с. Калиманци	3
602	с. Калоян	3
603	с. Камен дял	3
604	с. Каменар	3
605	с. Караманите	3
606	с. Кипра	3
607	с. Китен	3
608	с. Китка	3
609	с. Кичево	3
610	с. Климентово	3
611	с. Комарево	3
612	с. Комунари	3
613	с. Константиново	3
614	с. Кракра	3
615	с. Красимир	3
616	с. Кривини	3
617	с. Кривня	3
618	с. Крумово	3
619	с. Круша	3
620	с. Куманово	3
621	с. Левски	3
622	с. Лопушна	3
623	с. Любен Каравелово	3
624	с. Манастир	3
625	с. Медовец	3
626	с. Метличина	3
627	с. Михалич	3
628	с. Млада гвардия	3
629	с. Момчилово	3
630	с. Невша	3
631	с. Неново	3
632	с. Неофит Рилски	3
633	с. Николаевка	3
634	с. Нова Шипка	3
635	с. Новаково	3
636	с. Ново Оряхово	3
637	с. Оборище	3
638	с. Овчага	3
639	с. Орешак	3
640	с. Осеново	3
641	с. Падина	3
642	с. Партизани	3
643	с. Петров дол	3
644	с. Поляците	3
645	с. Попович	3
646	с. Припек	3
647	с. Приселци	3
648	с. Просечен	3
649	с. Пчелник	3
650	с. Равна	3
651	с. Равна гора	3
652	с. Радан войвода	3
653	с. Радево	3
654	с. Разделна	3
655	с. Рояк	3
656	с. Рудник	3
657	с. Сава	3
658	с. Садово	3
659	с. Самотино	3
660	с. Синдел	3
661	с. Славейково	3
662	с. Сладка вода	3
663	с. Слънчево	3
664	с. Снежина	3
665	с. Солник	3
666	с. Средно село	3
667	с. Старо Оряхово	3
668	с. Староселец	3
669	с. Стефан Караджа	3
670	с. Страхил	3
671	с. Страшимирово	3
672	с. Тополи	3
673	с. Тръстиково	3
674	с. Тутраканци	3
675	с. Храброво	3
676	с. Царевци	3
677	с. Цонево	3
678	с. Чайка	3
679	с. Червенци	3
680	с. Черковна	3
681	с. Чернево	3
682	с. Черноок	3
683	с. Шкорпиловци	3
684	с. Щипско	3
685	с. Юнак	3
686	с. Юнец	3
687	с. Ягнило	3
688	с. Яребична	3
689	гр. Велико Търново	4
690	гр. Бяла черква	4
691	гр. Горна Оряховица	4
692	гр. Дебелец	4
693	гр. Долна Оряховица	4
694	гр. Елена	4
695	гр. Златарица	4
696	гр. Килифарево	4
697	гр. Лясковец	4
698	гр. Павликени	4
699	гр. Полски Тръмбеш	4
700	гр. Свищов	4
701	гр. Стражица	4
702	гр. Сухиндол	4
703	с. Алеково	4
704	с. Александрово	4
705	с. Аплаци	4
706	с. Арбанаси	4
707	с. Асеново	4
708	с. Багалевци	4
709	с. Бадевци	4
710	с. Баевци	4
711	с. Баждари	4
712	с. Балван	4
713	с. Балканци	4
714	с. Балуци	4
715	с. Батак	4
716	с. Беброво	4
717	с. Бейковци	4
718	с. Белчевци	4
719	с. Беляковец	4
720	с. Берковци	4
721	с. Бижовци	4
722	с. Благоево	4
723	с. Блъсковци	4
724	с. Богданско	4
725	с. Бойковци	4
726	с. Бойчеви колиби	4
727	с. Бойчовци	4
728	с. Босевци	4
729	с. Бочковци	4
730	с. Бояновци	4
731	с. Бранковци	4
732	с. Брезово	4
733	с. Бръчковци	4
734	с. Бряговица	4
735	с. Буйновци	4
736	с. Буковец	4
737	с. Бутово	4
738	с. Българско Сливово	4
739	с. Бяла река	4
740	с. Бялковци	4
741	с. Валето	4
742	с. Вардим	4
743	с. Велковци	4
744	с. Велчево	4
745	с. Велювци	4
746	с. Веселина	4
747	с. Ветринци	4
748	с. Виларе	4
749	с. Виноград	4
750	с. Високовци	4
751	с. Вишовград	4
752	с. Владислав	4
753	с. Водно	4
754	с. Водолей	4
755	с. Войнежа	4
756	с. Вонеща вода	4
757	с. Въглевци	4
758	с. Вълчовци	4
759	с. Върбица	4
760	с. Върбовка	4
761	с. Вързилковци	4
762	с. Вързулица	4
763	с. Върлинка	4
764	с. Габрака	4
765	с. Габровци	4
766	с. Ганев дол	4
767	с. Гащевци	4
768	с. Глоговец	4
769	с. Големани	4
770	с. Големаните	4
771	с. Горановци	4
772	с. Горен Еневец	4
773	с. Горна Липница	4
774	с. Горна Студена	4
775	с. Горна Хаджийска	4
776	с. Горни край	4
777	с. Горни Танчевци	4
778	с. Горска	4
779	с. Горски горен Тръмбеш	4
780	с. Горски долен Тръмбеш	4
781	с. Горски Сеновец	4
782	с. Горско Калугерово	4
783	с. Горско Косово	4
784	с. Горско ново село	4
785	с. Горско Писарево	4
786	с. Граматици	4
787	с. Гърдевци	4
788	с. Давери	4
789	с. Дайновци	4
790	с. Дебели рът	4
791	с. Деветаците	4
792	с. Дедина	4
793	с. Дединци	4
794	с. Делова махала	4
795	с. Деляновци	4
796	с. Дечковци	4
797	с. Джулюница	4
798	с. Димитровци	4
799	с. Димовци	4
800	с. Димча	4
801	с. Дичин	4
802	с. Добревци	4
803	с. Добри дял	4
804	с. Дойновци	4
805	с. Долен Еневец	4
806	с. Долна Липница	4
807	с. Долни Дамяновци	4
808	с. Долни Марян	4
809	с. Долни Танчевци	4
810	с. Долно Шивачево	4
811	с. Донковци	4
812	с. Драганово	4
813	с. Драгановци	4
814	с. Драганосковци	4
815	с. Драгижево	4
816	с. Драгийци	4
817	с. Драгневци	4
818	с. Драгомирово	4
819	с. Дрента	4
820	с. Дуковци	4
821	с. Дунавци	4
822	с. Дуровци	4
823	с. Дълги припек	4
824	с. Дърлевци	4
825	с. Дъскот	4
826	с. Емен	4
827	с. Железарци	4
828	с. Зеленик	4
829	с. Иванивановци	4
830	с. Ивановци	4
831	с. Иванча	4
832	с. Игнатовци	4
833	с. Илаков рът	4
834	с. Илевци	4
835	с. Илиювци	4
836	с. Йовчевци	4
837	с. Кавлак	4
838	с. Калайджии	4
839	с. Камен	4
840	с. Каменари	4
841	с. Кантари	4
842	с. Караиванци	4
843	с. Караисен	4
844	с. Карандили	4
845	с. Каранци	4
846	с. Кесарево	4
847	с. Киревци	4
848	с. Кисьовци	4
849	с. Кладни дял	4
850	с. Климентово	4
851	с. Клъшка река	4
852	с. Коевци	4
853	с. Кожлювци	4
854	с. Козаревец	4
855	с. Козловец	4
856	с. Козя река	4
857	с. Колари	4
858	с. Константин	4
859	с. Косевци	4
860	с. Костел	4
861	с. Котуци	4
862	с. Красно градище	4
863	с. Крилювци	4
864	с. Крумчевци	4
865	с. Крушето	4
866	с. Куцаровци	4
867	с. Куцина	4
868	с. Къпиново	4
869	с. Лагерите	4
870	с. Лазарци	4
871	с. Леденик	4
872	с. Лесиче	4
873	с. Лесичери	4
874	с. Лозен	4
875	с. Любенци	4
876	с. Майско	4
877	с. Малки чифлик	4
878	с. Малчовци	4
879	с. Марафелци	4
880	с. Марговци	4
881	с. Мариновци	4
882	с. Марян	4
883	с. Масларево	4
884	с. Махалници	4
885	с. Мерданя	4
886	с. Мийковци	4
887	с. Миндя	4
888	с. Миневци	4
889	с. Мирово	4
890	с. Мирчовци	4
891	с. Михалци	4
892	с. Мишеморков хан	4
893	с. Момин сбор	4
894	с. Морава	4
895	с. Мусина	4
896	с. Мъртвината	4
897	с. Нацовци	4
898	с. Недан	4
899	с. Недялковци	4
900	с. Нешевци	4
901	с. Николаево	4
902	с. Николовци	4
903	с. Николчовци	4
904	с. Никюп	4
905	с. Ничовци	4
906	с. Нова Върбовка	4
907	с. Ново градище	4
908	с. Ново село	4
909	с. Новогорци	4
910	с. Нюшковци	4
911	с. Обединение	4
912	с. Овощна	4
913	с. Овча могила	4
914	с. Ореш	4
915	с. Орловец	4
916	с. Осенарите	4
917	с. Павел	4
918	с. Паисий	4
919	с. Палици	4
920	с. Папратлива	4
921	с. Паскалевец	4
922	с. Патреш	4
923	с. Пейковци	4
924	с. Петко Каравелово	4
925	с. Петковци	4
926	с. Пирамидата	4
927	с. Писарево	4
928	с. Плаково	4
929	с. Пожерник	4
930	с. Поликраище	4
931	с. Полски Сеновец	4
932	с. Поповци	4
933	с. Попрусевци	4
934	с. Попска	4
935	с. Правда	4
936	с. Присово	4
937	с. Продановци	4
938	с. Пушево	4
939	с. Пчелище	4
940	с. Първомайци	4
941	с. Пъровци	4
942	с. Равново	4
943	с. Раданово	4
944	с. Радковци	4
945	с. Радовци	4
946	с. Разсоха	4
947	с. Райковци	4
948	с. Райновци	4
949	с. Ралиновци	4
950	с. Рашевци	4
951	с. Раювци	4
952	с. Ребревци	4
953	с. Резач	4
954	с. Рекичка	4
955	с. Ресен	4
956	с. Родина	4
957	с. Росица	4
958	с. Росно	4
959	с. Русаля	4
960	с. Русковци	4
961	с. Руховци	4
962	с. Самоводене	4
963	с. Самсиите	4
964	с. Светославци	4
965	с. Сеймените	4
966	с. Семковци	4
967	с. Сливовица	4
968	с. Сломер	4
969	с. Совата	4
970	с. Средни колиби	4
971	с. Средно село	4
972	с. Стамболово	4
973	с. Стефан Стамболово	4
974	с. Стойчевци	4
975	с. Стояновци	4
976	с. Страхилово	4
977	с. Стрелец	4
978	с. Султани	4
979	с. Суха река	4
980	с. Сушица	4
981	с. Събковци	4
982	с. Сърненци	4
983	с. Теменуга	4
984	с. Терзиите	4
985	с. Титевци	4
986	с. Тодоровци	4
987	с. Тодювци	4
988	с. Томбето	4
989	с. Топузи	4
990	с. Трънковци	4
991	с. Тумбевци	4
992	с. Тънки рът	4
993	с. Търкашени	4
994	с. Угорялковци	4
995	с. Ушeвци	4
996	с. Хаджидимитрово	4
997	с. Харваловци	4
998	с. Хотница	4
999	с. Христовци	4
1000	с. Хъневци	4
1001	с. Царевец	4
1002	с. Царски извор	4
1003	с. Цвеклювци	4
1004	с. Цепераните	4
1005	с. Церова кория	4
1006	с. Цонковци	4
1007	с. Чавдарци	4
1008	с. Чакали	4
1009	с. Червена	4
1010	с. Червенковци	4
1011	с. Черни дял	4
1012	с. Чешма	4
1013	с. Чистово	4
1014	с. Чуката	4
1015	с. Шемшево	4
1016	с. Шереметя	4
1017	с. Шиливери	4
1018	с. Шилковци	4
1019	с. Шодековци	4
1020	с. Шубеци	4
1021	с. Яковци	4
1022	с. Ялово	4
1023	с. Янтра	4
1024	гр. Видин	5
1025	гр. Белоградчик	5
1026	гр. Брегово	5
1027	гр. Грамада	5
1028	гр. Димово	5
1029	гр. Дунавци	5
1030	гр. Кула	5
1031	с. Акациево	5
1032	с. Антимово	5
1033	с. Арчар	5
1034	с. Балей	5
1035	с. Бела	5
1036	с. Бела Рада	5
1037	с. Бело поле	5
1038	с. Бойница	5
1039	с. Бориловец	5
1040	с. Боровица	5
1041	с. Ботево	5
1042	с. Бояново	5
1043	с. Бранковци	5
1044	с. Буковец	5
1045	с. Вещица	5
1046	с. Винарово	5
1047	с. Владиченци	5
1048	с. Водна	5
1049	с. Воднянци	5
1050	с. Войница	5
1051	с. Връв	5
1052	с. Вълчек	5
1053	с. Върба	5
1054	с. Върбово	5
1055	с. Върбовчец	5
1056	с. Въртоп	5
1057	с. Гайтанци	5
1058	с. Генерал Мариново	5
1059	с. Големаново	5
1060	с. Гомотарци	5
1061	с. Горни Лом	5
1062	с. Градец	5
1063	с. Градсковски колиби	5
1064	с. Гранитово	5
1065	с. Граничак	5
1066	с. Гъмзово	5
1067	с. Гюргич	5
1068	с. Делейна	5
1069	с. Динковица	5
1070	с. Динково	5
1071	с. Долни Бошняк	5
1072	с. Долни Лом	5
1073	с. Дражинци	5
1074	с. Дреновец	5
1075	с. Дружба	5
1076	с. Дъбравка	5
1077	с. Дълго поле	5
1078	с. Държаница	5
1079	с. Жеглица	5
1080	с. Ивановци	5
1081	с. Извор	5
1082	с. Извор махала	5
1083	с. Иново	5
1084	с. Каленик	5
1085	с. Калина	5
1086	с. Каниц	5
1087	с. Капитановци	5
1088	с. Карбинци	5
1089	с. Киреево	5
1090	с. Кладоруб	5
1091	с. Косово	5
1092	с. Коста Перчево	5
1093	с. Костичовци	5
1094	с. Кошава	5
1095	с. Крачимир	5
1096	с. Куделин	5
1097	с. Кутово	5
1098	с. Лагошевци	5
1099	с. Майор Узуново	5
1100	с. Макреш	5
1101	с. Мали Дреновец	5
1102	с. Медешевци	5
1103	с. Медовница	5
1104	с. Милчина лъка	5
1105	с. Неговановци	5
1106	с. Ново село	5
1107	с. Новоселци	5
1108	с. Орешец	5
1109	с. Острокапци	5
1110	с. Ошане	5
1111	с. Периловец	5
1112	с. Пешаково	5
1113	с. Плакудер	5
1114	с. Плешивец	5
1115	с. Подгоре	5
1116	с. Покрайна	5
1117	с. Полетковци	5
1118	с. Праужда	5
1119	с. Пролазница	5
1120	с. Протопопинци	5
1121	с. Рабиша	5
1122	с. Раброво	5
1123	с. Ракитница	5
1124	с. Раковица	5
1125	с. Раяновци	5
1126	с. Репляна	5
1127	с. Роглец	5
1128	с. Ружинци	5
1129	с. Рупци	5
1130	с. Салаш	5
1131	с. Септемврийци	5
1132	с. Синаговци	5
1133	с. Скомля	5
1134	с. Слана бара	5
1135	с. Сланотрън	5
1136	с. Сливовник	5
1137	с. Срацимирово	5
1138	с. Средогрив	5
1139	с. Стакевци	5
1140	с. Старопатица	5
1141	с. Струиндол	5
1142	с. Тияновци	5
1143	с. Толовица	5
1144	с. Тополовец (Кула)	5
1145	с. Тополовец (Ружинци)	5
1146	с. Тошевци	5
1147	с. Търговище	5
1148	с. Търняне	5
1149	с. Флорентин	5
1150	с. Цар Симеоново	5
1151	с. Цар Шишманово	5
1152	с. Цар-Петрово	5
1153	с. Черно поле	5
1154	с. Чифлик	5
1155	с. Чичил	5
1156	с. Чупрене	5
1157	с. Шипикова махала	5
1158	с. Шипот	5
1159	с. Шишенци	5
1160	с. Яньовец	5
1161	с. Ярловица	5
1162	с. Ясен	5
1163	гр. Враца	6
1164	гр. Бяла Слатина	6
1165	гр. Козлодуй	6
1166	гр. Криводол	6
1167	гр. Мездра	6
1168	гр. Мизия	6
1169	гр. Оряхово	6
1170	гр. Роман	6
1171	с. Алтимир	6
1172	с. Баница	6
1173	с. Баурене	6
1174	с. Бели извор	6
1175	с. Боденец	6
1176	с. Борован	6
1177	с. Ботево	6
1178	с. Ботуня	6
1179	с. Брусен	6
1180	с. Буковец	6
1181	с. Бутан	6
1182	с. Бърдарски геран	6
1183	с. Бързина	6
1184	с. Бъркачево	6
1185	с. Веслец	6
1186	с. Вировско	6
1187	с. Власатица	6
1188	с. Войводово	6
1189	с. Враняк	6
1190	с. Върбешница	6
1191	с. Върбица	6
1192	с. Габаре	6
1193	с. Галатин	6
1194	с. Галиче	6
1195	с. Галово	6
1196	с. Главаци	6
1197	с. Гложене	6
1198	с. Големо Бабино	6
1199	с. Голямо Пещене	6
1200	с. Горна Бешовица	6
1201	с. Горна Кремена	6
1202	с. Горни Вадин	6
1203	с. Горно Пещене	6
1204	с. Градешница	6
1205	с. Девене	6
1206	с. Добролево	6
1207	с. Добруша	6
1208	с. Долна Бешовица	6
1209	с. Долна Кремена	6
1210	с. Долни Вадин	6
1211	с. Драшан	6
1212	с. Дърманци	6
1213	с. Елисейна	6
1214	с. Зверино	6
1215	с. Згориград	6
1216	с. Злидол	6
1217	с. Игнатица	6
1218	с. Кален	6
1219	с. Камено поле	6
1220	с. Караш	6
1221	с. Комарево	6
1222	с. Костелево	6
1223	с. Краводер	6
1224	с. Крапец	6
1225	с. Крета	6
1226	с. Крива бара	6
1227	с. Крушовица	6
1228	с. Кунино	6
1229	с. Курново	6
1230	с. Лесковец	6
1231	с. Лесура	6
1232	с. Лик	6
1233	с. Лиляче	6
1234	с. Липница	6
1235	с. Лютаджик	6
1236	с. Лютиброд	6
1237	с. Лютидол	6
1238	с. Мало Пещене	6
1239	с. Малорад	6
1240	с. Манастирище	6
1241	с. Марково равнище	6
1242	с. Михайлово	6
1243	с. Моравица	6
1244	с. Мраморен	6
1245	с. Нивянин	6
1246	с. Оселна	6
1247	с. Осен	6
1248	с. Ослен Криводол	6
1249	с. Остров	6
1250	с. Оходен	6
1251	с. Очиндол	6
1252	с. Паволче	6
1253	с. Попица	6
1254	с. Пудрия	6
1255	с. Радовене	6
1256	с. Ракево	6
1257	с. Ребърково	6
1258	с. Рогозен	6
1259	с. Руска Бела	6
1260	с. Сараево	6
1261	с. Селановци	6
1262	с. Синьо бърдо	6
1263	с. Сираково	6
1264	с. Соколаре	6
1265	с. Софрониево	6
1266	с. Средни рът	6
1267	с. Старо село	6
1268	с. Стояновци	6
1269	с. Струпец	6
1270	с. Типченица	6
1271	с. Тишевица	6
1272	с. Тлачене	6
1273	с. Три кладенци	6
1274	с. Търнава	6
1275	с. Търнак	6
1276	с. Уровене	6
1277	с. Фурен	6
1278	с. Хайредин	6
1279	с. Хубавене	6
1280	с. Хърлец	6
1281	с. Цаконица	6
1282	с. Царевец	6
1283	с. Челопек	6
1284	с. Чирен	6
1285	гр. Габрово	7
1286	гр. Дряново	7
1287	гр. Плачковци	7
1288	гр. Севлиево	7
1289	гр. Трявна	7
1290	с. Агатово	7
1291	с. Азманите	7
1292	с. Ангелов	7
1293	с. Армените	7
1294	с. Армянковци	7
1295	с. Баевци	7
1296	с. Балалея	7
1297	с. Баланите	7
1298	с. Балванците	7
1299	с. Балиновци	7
1300	с. Банари	7
1301	с. Бангейци	7
1302	с. Банковци	7
1303	с. Батошево	7
1304	с. Бахреци	7
1305	с. Бекриите	7
1306	с. Белица	7
1307	с. Беломъжите	7
1308	с. Бериево	7
1309	с. Бижовци	7
1310	с. Билкини	7
1311	с. Боазът	7
1312	с. Бобевци	7
1313	с. Богатово	7
1314	с. Богданчовци	7
1315	с. Боженците	7
1316	с. Бойновци	7
1317	с. Бойчета	7
1318	с. Болтата	7
1319	с. Борики	7
1320	с. Борското	7
1321	с. Брежниците	7
1322	с. Брънеците	7
1323	с. Буря	7
1324	с. Бучуковци	7
1325	с. Бърдарите	7
1326	с. Бърдени	7
1327	с. Бялково	7
1328	с. Валевци	7
1329	с. Веленци	7
1330	с. Велково	7
1331	с. Велковци	7
1332	с. Велчовци	7
1333	с. Ветрово	7
1334	с. Владовци	7
1335	с. Влайчовци	7
1336	с. Власатили	7
1337	с. Влаховци	7
1338	с. Войниците	7
1339	с. Войнишка	7
1340	с. Врабците	7
1341	с. Враниловци	7
1342	с. Вълков дол	7
1343	с. Вълковци	7
1344	с. Гайдари	7
1345	с. Гайкини	7
1346	с. Гайтаните	7
1347	с. Ганчовец	7
1348	с. Гарван	7
1349	с. Геновци	7
1350	с. Генчовци (Габрово)	7
1351	с. Генчовци (Трявна)	7
1352	с. Геня	7
1353	с. Гергини	7
1354	с. Геша	7
1355	с. Гледаци	7
1356	с. Глутниците	7
1357	с. Глушка	7
1358	с. Гоздейка	7
1359	с. Големи Българени	7
1360	с. Големи Станчовци	7
1361	с. Горна Росица	7
1362	с. Горни Върпища	7
1363	с. Горни Дамяновци	7
1364	с. Горни Драгойча	7
1365	с. Горни Маренци	7
1366	с. Горни Радковци	7
1367	с. Горни Цоневци	7
1368	с. Горнова могила	7
1369	с. Горяни	7
1370	с. Гостилица	7
1371	с. Градище	7
1372	с. Градница	7
1373	с. Гръблевци	7
1374	с. Гъбене	7
1375	с. Гърня	7
1376	с. Даевци	7
1377	с. Дамяново	7
1378	с. Дебел дял	7
1379	с. Дебелцово	7
1380	с. Денчевци	7
1381	с. Джумриите	7
1382	с. Джуровци	7
1383	с. Дивеци	7
1384	с. Димиевци	7
1385	с. Дисманица	7
1386	с. Длъгня	7
1387	с. Добревци	7
1388	с. Добрените	7
1389	с. Добромирка	7
1390	с. Долни Върпища	7
1391	с. Долни Драгойча	7
1392	с. Долни Маренци	7
1393	с. Долни Радковци	7
1394	с. Долни Томчевци	7
1395	с. Донино	7
1396	с. Донкино	7
1397	с. Дончовци	7
1398	с. Доча	7
1399	с. Драгановци	7
1400	с. Драганчетата	7
1401	с. Драгиевци	7
1402	с. Драгневци	7
1403	с. Драгомани	7
1404	с. Драндарите	7
1405	с. Думници	7
1406	с. Дурча	7
1407	с. Душево	7
1408	с. Душевски колиби	7
1409	с. Дървари	7
1410	с. Дъскарите	7
1411	с. Езерото	7
1412	с. Еленците	7
1413	с. Енев рът	7
1414	с. Енчовци	7
1415	с. Живко	7
1416	с. Жълтеш	7
1417	с. Зая	7
1418	с. Здравковец	7
1419	с. Зеленика	7
1420	с. Зелено дърво	7
1421	с. Златевци	7
1422	с. Иван Димов	7
1423	с. Иванили	7
1424	с. Иванковци	7
1425	с. Иглика	7
1426	с. Игнатовци	7
1427	с. Идилево	7
1428	с. Източник	7
1429	с. Иринеци	7
1430	с. Искра	7
1431	с. Йововци	7
1432	с. Каломен	7
1433	с. Калчовци	7
1434	с. Камещица	7
1435	с. Караиванца	7
1436	с. Карали	7
1437	с. Карамичевци	7
1438	с. Кастел	7
1439	с. Катранджии	7
1440	с. Кашенци	7
1441	с. Керека	7
1442	с. Керените	7
1443	с. Киевци	7
1444	с. Киселковци	7
1445	с. Кисийците	7
1446	с. Кметовци	7
1447	с. Кметчета	7
1448	с. Коевци	7
1449	с. Кози рог	7
1450	с. Койчовци	7
1451	с. Колишовци	7
1452	с. Колю Ганев	7
1453	с. Конарското	7
1454	с. Копчелиите	7
1455	с. Корията	7
1456	с. Кормянско	7
1457	с. Косарка	7
1458	с. Косилка	7
1459	с. Костадините	7
1460	с. Костенковци	7
1461	с. Крамолин	7
1462	с. Креслювци	7
1463	с. Крушево	7
1464	с. Кръвеник	7
1465	с. Крънча	7
1466	с. Кръстеняците	7
1467	с. Кръстец	7
1468	с. Кукля	7
1469	с. Куманите	7
1470	с. Купен	7
1471	с. Къртипъня	7
1472	с. Лесичарка	7
1473	с. Ловнидол	7
1474	с. Лоза	7
1475	с. Малини	7
1476	с. Малки Българени	7
1477	с. Малки Вършец	7
1478	с. Малки Станчовци	7
1479	с. Малуша	7
1480	с. Малчовци	7
1481	с. Маневци	7
1482	с. Маноя	7
1483	с. Маруцековци	7
1484	с. Матешовци	7
1485	с. Междени	7
1486	с. Мечковица	7
1487	с. Милевци	7
1488	с. Милковци	7
1489	с. Михайловци	7
1490	с. Миховци	7
1491	с. Мичковци	7
1492	с. Младен	7
1493	с. Млечево	7
1494	с. Могилите	7
1495	с. Моровеците	7
1496	с. Мрахори	7
1497	с. Мръзеци	7
1498	с. Музга	7
1499	с. Муця	7
1500	с. Недялковци	7
1501	с. Нейчовци	7
1502	с. Неновци	7
1503	с. Никачковци	7
1504	с. Николаево	7
1505	с. Николчовци	7
1506	с. Новаковци	7
1507	с. Ножерите	7
1508	с. Носеите	7
1509	с. Овощарци	7
1510	с. Околиите	7
1511	с. Орловци	7
1512	с. Ошаните	7
1513	с. Павлевци	7
1514	с. Парчовци	7
1515	с. Пейна	7
1516	с. Пейовци	7
1517	с. Пенковци	7
1518	с. Петко Славейков	7
1519	с. Петковци	7
1520	с. Петровци	7
1521	с. Пецовци	7
1522	с. Планинци	7
1523	с. Плачка	7
1524	с. Побък	7
1525	с. Попари	7
1526	с. Попгергевци	7
1527	с. Поповци	7
1528	с. Попрайковци	7
1529	с. Попска	7
1530	с. Поток	7
1531	с. Прахали	7
1532	с. Престой	7
1533	с. Продановци	7
1534	с. Пържиграх	7
1535	с. Пъртевци	7
1536	с. Пърша	7
1537	с. Раданчето	7
1538	с. Радевци	7
1539	с. Радино	7
1540	с. Радовци	7
1541	с. Радоевци	7
1542	с. Раевци	7
1543	с. Райновци	7
1544	с. Райнушковци	7
1545	с. Ралевци	7
1546	с. Раховци	7
1547	с. Рачевци	7
1548	с. Рачовци	7
1549	с. Рашовите	7
1550	с. Редешковци	7
1551	с. Ритя	7
1552	с. Руевци	7
1553	с. Руйчовци	7
1554	с. Руня	7
1555	с. Русиновци	7
1556	с. Рязковци	7
1557	с. Ряховците	7
1558	с. Саласука	7
1559	с. Свинарски дол	7
1560	с. Свирци	7
1561	с. Седянковци	7
1562	с. Сейковци	7
1563	с. Селище	7
1564	с. Семерджиите	7
1565	с. Сенник	7
1566	с. Сечен камък	7
1567	с. Скалско	7
1568	с. Скорците	7
1569	с. Славейково	7
1570	с. Сливово	7
1571	с. Смиловци	7
1572	с. Соколово	7
1573	с. Солари	7
1574	с. Спанци	7
1575	с. Спасовци	7
1576	с. Стайновци	7
1577	с. Станча	7
1578	с. Станчов хан	7
1579	с. Старилковци	7
1580	с. Стефаново	7
1581	с. Стоевци	7
1582	с. Стойковци	7
1583	с. Стойчовци	7
1584	с. Стоките	7
1585	с. Столът	7
1586	с. Стоманеците	7
1587	с. Стражата	7
1588	с. Стръмци	7
1589	с. Сухолоевци	7
1590	с. Съботковци	7
1591	с. Сяровци	7
1592	с. Табашка	7
1593	с. Тодореците	7
1594	с. Тодоровци	7
1595	с. Тодорчета	7
1596	с. Томчевци	7
1597	с. Торбалъжите	7
1598	с. Трапесковци	7
1599	с. Трънито	7
1600	с. Тумбалово	7
1601	с. Туркинча	7
1602	с. Търхово	7
1603	с. Угорелец	7
1604	с. Узуните	7
1605	с. Урвата	7
1606	с. Фърговци	7
1607	с. Фъревци	7
1608	с. Фъртуни	7
1609	с. Харачерите	7
1610	с. Хирево	7
1611	с. Христовци	7
1612	с. Царева ливада	7
1613	с. Цвятковци	7
1614	с. Чавеи	7
1615	с. Чакалите	7
1616	с. Чарково	7
1617	с. Червена локва	7
1618	с. Черневци	7
1619	с. Черновръх	7
1620	с. Читаковци	7
1621	с. Чукилите	7
1622	с. Чуково	7
1623	с. Шарани	7
1624	с. Шипчените	7
1625	с. Шопите	7
1626	с. Шумата	7
1627	с. Шушня	7
1628	с. Ябълковци	7
1629	с. Явор	7
1630	с. Яворец	7
1631	с. Янковци	7
1632	с. Янтра	7
1633	с. Ясените	7
1634	гр. Добрич	8
1635	гр. Балчик	8
1636	гр. Генерал Тошево	8
1637	гр. Каварна	8
1638	гр. Тервел	8
1639	гр. Шабла	8
1640	с. Абрит	8
1641	с. Ал. Стамболийски	8
1642	с. Александрия	8
1643	с. Алцек	8
1644	с. Ангеларий	8
1645	с. Балик	8
1646	с. Балканци	8
1647	с. Батово	8
1648	с. Бдинци	8
1649	с. Бежаново	8
1650	с. Безводица	8
1651	с. Безмер	8
1652	с. Белгун	8
1653	с. Бенковски	8
1654	с. Било	8
1655	с. Бистрец	8
1656	с. Бобовец	8
1657	с. Богдан	8
1658	с. Божан	8
1659	с. Божаново	8
1660	с. Божурец	8
1661	с. Божурово	8
1662	с. Бонево	8
1663	с. Бранище	8
1664	с. Брестница	8
1665	с. Брястово	8
1666	с. Българево	8
1667	с. Ваклино	8
1668	с. Василево	8
1669	с. Ведрина	8
1670	с. Великово	8
1671	с. Видно	8
1672	с. Вичово	8
1673	с. Владимирово	8
1674	с. Воднянци	8
1675	с. Войниково	8
1676	с. Вранино	8
1677	с. Вратарите	8
1678	с. Врачанци	8
1679	с. Габер	8
1680	с. Генерал Колево	8
1681	с. Гешаново	8
1682	с. Главанци	8
1683	с. Горица	8
1684	с. Горичане	8
1685	с. Горун	8
1686	с. Градини	8
1687	с. Градница	8
1688	с. Граничар	8
1689	с. Гурково	8
1690	с. Гуслар	8
1691	с. Дебрене	8
1692	с. Добрево	8
1693	с. Добрин	8
1694	с. Долина	8
1695	с. Дончево	8
1696	с. Драганово	8
1697	с. Дропла	8
1698	с. Дряновец	8
1699	с. Дуранкулак	8
1700	с. Дъбовик	8
1701	с. Дъбрава	8
1702	с. Езерец	8
1703	с. Енево	8
1704	с. Ефрейтор Бакалово	8
1705	с. Жегларци	8
1706	с. Житен	8
1707	с. Житница	8
1708	с. Загорци	8
1709	с. Захари Стояново	8
1710	с. Земенци	8
1711	с. Зимница	8
1712	с. Златия	8
1713	с. Змеево	8
1714	с. Зограф	8
1715	с. Зърнево	8
1716	с. Изворово	8
1717	с. Иречек	8
1718	с. Йовково	8
1719	с. Каблешково	8
1720	с. Калина	8
1721	с. Камен	8
1722	с. Камен бряг	8
1723	с. Капитан Димитрово	8
1724	с. Карапелит	8
1725	с. Карвуна	8
1726	с. Кардам	8
1727	с. Кладенци	8
1728	с. Козлодуйци	8
1729	с. Коларци	8
1730	с. Конаре	8
1731	с. Коритен	8
1732	с. Котленци	8
1733	с. Кочмар	8
1734	с. Крагулево	8
1735	с. Краище	8
1736	с. Кранево	8
1737	с. Крапец	8
1738	с. Красен	8
1739	с. Кремена	8
1740	с. Крупен	8
1741	с. Крушари	8
1742	с. Къпиново	8
1743	с. Ловчанци	8
1744	с. Лозенец	8
1745	с. Лозница	8
1746	с. Ломница	8
1747	с. Люляково	8
1748	с. Лясково	8
1749	с. Ляхово	8
1750	с. Мали извор	8
1751	с. Малина	8
1752	с. Малка Смолница	8
1753	с. Медово	8
1754	с. Методиево	8
1755	с. Миладиновци	8
1756	с. Могилище	8
1757	с. Нейково	8
1758	с. Нова Камена	8
1759	с. Ново Ботево	8
1760	с. Оброчище	8
1761	с. Овчарово	8
1762	с. Огняново	8
1763	с. Огражден	8
1764	с. Одринци	8
1765	с. Одърци	8
1766	с. Оногур	8
1767	с. Опанец	8
1768	с. Орлова могила	8
1769	с. Орляк	8
1770	с. Паскалево	8
1771	с. Петлешково	8
1772	с. Писарово	8
1773	с. Плачидол	8
1774	с. Пленимир	8
1775	с. Победа	8
1776	с. Подслон	8
1777	с. Полковник Дяково	8
1778	с. Полковник Иваново	8
1779	с. Полковник Минково	8
1780	с. Полковник Савово	8
1781	с. Полковник Свещарово	8
1782	с. Попгригорово	8
1783	с. Попгруево	8
1784	с. Поручик Кърджиево	8
1785	с. Поручик Чунчево	8
1786	с. Преселенци	8
1787	с. Преспа	8
1788	с. Прилеп	8
1789	с. Приморци	8
1790	с. Присад	8
1791	с. Пролез	8
1792	с. Професор Златарски	8
1793	с. Пчеларово	8
1794	с. Пчелино	8
1795	с. Пчелник	8
1796	с. Равнец	8
1797	с. Раковски	8
1798	с. Рогачево	8
1799	с. Рогозина	8
1800	с. Росен	8
1801	с. Росеново	8
1802	с. Росица	8
1803	с. Самуилово	8
1804	с. Свети Никола	8
1805	с. Свобода	8
1806	с. Северняк	8
1807	с. Северци	8
1808	с. Селце	8
1809	с. Сенокос	8
1810	с. Септемврийци	8
1811	с. Сираково	8
1812	с. Славеево	8
1813	с. Сливенци	8
1814	с. Смин	8
1815	с. Смолница	8
1816	с. Сноп	8
1817	с. Снягово	8
1818	с. Соколник	8
1819	с. Соколово	8
1820	с. Спасово	8
1821	с. Средина	8
1822	с. Стаевци	8
1823	с. Стефан Караджа	8
1824	с. Стефаново	8
1825	с. Стожер	8
1826	с. Стражица	8
1827	с. Сърнец	8
1828	с. Сърнино	8
1829	с. Твърдица	8
1830	с. Телериг	8
1831	с. Топола	8
1832	с. Травник	8
1833	с. Тригорци	8
1834	с. Тюленово	8
1835	с. Тянево	8
1836	с. Узово	8
1837	с. Фелдфебел Денково	8
1838	с. Хаджи Димитър	8
1839	с. Хитово	8
1840	с. Храброво	8
1841	с. Царевец	8
1842	с. Царичино	8
1843	с. Църква	8
1844	с. Челопечене	8
1845	с. Черна	8
1846	с. Черноморци	8
1847	с. Чернооково	8
1848	с. Честименско	8
1849	гр. Дупница	9
1850	с. Баланово	9
1851	с. Бистрица	9
1852	с. Блатино	9
1853	с. Грамаде	9
1854	с. Делян	9
1855	с. Джерман	9
1856	с. Дяково	9
1857	с. Крайни дол	9
1858	с. Крайници	9
1859	с. Кременик	9
1860	с. Палатово	9
1861	с. Пиперево	9
1862	с. Самораново	9
1863	с. Тополница	9
1864	с. Червен брег	9
1865	с. Яхиново	9
1866	гр. Кърджали	10
1867	гр. Ардино	10
1868	гр. Джебел	10
1869	гр. Крумовград	10
1870	гр. Момчилград	10
1871	с. Аврамово	10
1872	с. Аврен	10
1873	с. Айрово	10
1874	с. Албанци	10
1875	с. Априлци	10
1876	с. Ауста	10
1877	с. Ахрянско	10
1878	с. Багра	10
1879	с. Багрилци	10
1880	с. Багрянка	10
1881	с. Бакалите	10
1882	с. Балабаново	10
1883	с. Бараци	10
1884	с. Башево	10
1885	с. Бащино	10
1886	с. Бедрово	10
1887	с. Безводно	10
1888	с. Бели вир	10
1889	с. Бели пласт	10
1890	с. Бенковски	10
1891	с. Беснурка	10
1892	с. Биволяне	10
1893	с. Бистроглед	10
1894	с. Благун	10
1895	с. Бленика	10
1896	с. Богатино	10
1897	с. Божак	10
1898	с. Божурци	10
1899	с. Бойник	10
1900	с. Бойно	10
1901	с. Болярци	10
1902	с. Боровица	10
1903	с. Боровско	10
1904	с. Босилица	10
1905	с. Бостанци	10
1906	с. Брегово	10
1907	с. Брежана	10
1908	с. Брезен	10
1909	с. Брош	10
1910	с. Бряговец	10
1911	с. Бук	10
1912	с. Бърза река	10
1913	с. Бързея	10
1914	с. Бял извор	10
1915	с. Бяла поляна	10
1916	с. Бялка	10
1917	с. Велешани	10
1918	с. Великденче	10
1919	с. Верско	10
1920	с. Висока	10
1921	с. Висока поляна	10
1922	с. Вишеград	10
1923	с. Водач	10
1924	с. Воденичарско	10
1925	с. Вождово	10
1926	с. Войново	10
1927	с. Воловарци	10
1928	с. Вранско	10
1929	с. Врело	10
1930	с. Възел	10
1931	с. Вълкович	10
1932	с. Вълчанка	10
1933	с. Върбен	10
1934	с. Върбенци	10
1935	с. Върли дол	10
1936	с. Върхари	10
1937	с. Габрово	10
1938	с. Генерал Гешево	10
1939	с. Главатарци	10
1940	с. Главник	10
1941	с. Глухар	10
1942	с. Гняздово	10
1943	с. Голобрад	10
1944	с. Голям Девесил	10
1945	с. Голяма бара	10
1946	с. Голяма Чинка	10
1947	с. Голямо Каменяне	10
1948	с. Горна крепост	10
1949	с. Горна кула	10
1950	с. Горни Юруци	10
1951	с. Горно Кирково	10
1952	с. Горно Къпиново	10
1953	с. Горно Прахово	10
1954	с. Горски извор	10
1955	с. Горско Дюлево	10
1956	с. Гривка	10
1957	с. Гривяк	10
1958	с. Груево	10
1959	с. Гулийка	10
1960	с. Гулия	10
1961	с. Гургулица	10
1962	с. Гърбище	10
1963	с. Гъсково	10
1964	с. Даскалово	10
1965	с. Девесилица	10
1966	с. Девесилово	10
1967	с. Девинци	10
1968	с. Дедец	10
1969	с. Дедино	10
1970	с. Делвино	10
1971	с. Джанка	10
1972	с. Джелепско	10
1973	с. Джерово	10
1974	с. Доборско	10
1975	с. Добриново	10
1976	с. Добринци	10
1977	с. Добромирци	10
1978	с. Дойранци	10
1979	с. Долище	10
1980	с. Долна крепост	10
1981	с. Долна кула	10
1982	с. Долни Юруци	10
1983	с. Долно Къпиново	10
1984	с. Долно Прахово	10
1985	с. Домище	10
1986	с. Драганово	10
1987	с. Дрангово	10
1988	с. Дружинци	10
1989	с. Друмче	10
1990	с. Дрянова глава	10
1991	с. Душинково	10
1992	с. Душка	10
1993	с. Дъждино	10
1994	с. Дъждовник	10
1995	с. Дъждовница	10
1996	с. Дънгово	10
1997	с. Дюлица	10
1998	с. Дядовско	10
1999	с. Дядовци	10
2000	с. Егрек	10
2001	с. Едрино	10
2002	с. Енчец	10
2003	с. Еньовче	10
2004	с. Еровете	10
2005	с. Железник	10
2006	с. Желъдово	10
2007	с. Женда	10
2008	с. Жинзифово	10
2009	с. Житарник	10
2010	с. Житница	10
2011	с. Жълти рид	10
2012	с. Жълтика	10
2013	с. Жълтуша	10
2014	с. Завоя	10
2015	с. Загорски	10
2016	с. Загорско	10
2017	с. Зайчино	10
2018	с. Звездел	10
2019	с. Звезделина	10
2020	с. Звезден	10
2021	с. Звиница	10
2022	с. Звънарка	10
2023	с. Звъника	10
2024	с. Звънче	10
2025	с. Здравчец	10
2026	с. Зелениково	10
2027	с. Зимзелен	10
2028	с. Зиморница	10
2029	с. Златолист	10
2030	с. Зорница	10
2031	с. Иванци	10
2032	с. Илийско	10
2033	с. Илиница	10
2034	с. Искра	10
2035	с. Йончово	10
2036	с. Каблешково	10
2037	с. Казаците	10
2038	с. Калайджиево	10
2039	с. Калинка	10
2040	с. Калоянци	10
2041	с. Каменарци	10
2042	с. Каменец	10
2043	с. Каменка	10
2044	с. Каменяне	10
2045	с. Кандилка	10
2046	с. Каняк	10
2047	с. Карамфил	10
2048	с. Качулка	10
2049	с. Каялоба	10
2050	с. Кирково	10
2051	с. Китна	10
2052	с. Китница	10
2053	с. Кобиляне	10
2054	с. Ковил	10
2055	с. Кожухарци	10
2056	с. Козица	10
2057	с. Козлево	10
2058	с. Кокиче	10
2059	с. Кокошане	10
2060	с. Комунига	10
2061	с. Конево	10
2062	с. Контил	10
2063	с. Конче	10
2064	с. Копитник	10
2065	с. Кос	10
2066	с. Костино	10
2067	с. Костурино	10
2068	с. Котлари	10
2069	с. Крайно село	10
2070	с. Кран	10
2071	с. Красино	10
2072	с. Кремен	10
2073	с. Кременец	10
2074	с. Крилатица	10
2075	с. Крин	10
2076	с. Кроячево	10
2077	с. Крушевска	10
2078	с. Крушка	10
2079	с. Кукуряк	10
2080	с. Купците	10
2081	с. Куцово	10
2082	с. Къклица	10
2083	с. Кърчовско	10
2084	с. Кьосево	10
2085	с. Лале	10
2086	с. Латинка	10
2087	с. Лебед	10
2088	с. Левци	10
2089	с. Ленище	10
2090	с. Летовник	10
2091	с. Лещарка	10
2092	с. Лимец	10
2093	с. Лисиците	10
2094	с. Лозенградци	10
2095	с. Луличка	10
2096	с. Лъвово	10
2097	с. Любино	10
2098	с. Люляково	10
2099	с. Лясково	10
2100	с. Майсторово	10
2101	с. Мак	10
2102	с. Македонци	10
2103	с. Малка Чинка	10
2104	с. Малко Каменяне	10
2105	с. Малкоч	10
2106	с. Малък Девесил	10
2107	с. Манчево	10
2108	с. Мартино	10
2109	с. Медевци	10
2110	с. Метлика	10
2111	с. Метличина	10
2112	с. Метличка	10
2113	с. Миладиново	10
2114	с. Минзухар	10
2115	с. Мишевско	10
2116	с. Млечино	10
2117	с. Могиляне	10
2118	с. Момина сълза	10
2119	с. Морянци	10
2120	с. Мост	10
2121	с. Мрежичко	10
2122	с. Мурга	10
2123	с. Мургово	10
2124	с. Мусево	10
2125	с. Мъглене	10
2126	с. Мъдрец	10
2127	с. Нане	10
2128	с. Нановица	10
2129	с. Небеска	10
2130	с. Невестино	10
2131	с. Ненково	10
2132	с. Неофит Бозвелиево	10
2133	с. Нови пазар	10
2134	с. Новоселище	10
2135	с. Ночево	10
2136	с. Обичник	10
2137	с. Овчари	10
2138	с. Овчево	10
2139	с. Опълченско	10
2140	с. Орех	10
2141	с. Орешари	10
2142	с. Орешница	10
2143	с. Орлица	10
2144	с. Островец	10
2145	с. Островица	10
2146	с. Охлювец	10
2147	с. Падало	10
2148	с. Падина	10
2149	с. Пазарци	10
2150	с. Паничково	10
2151	с. Панчево	10
2152	с. Папрат	10
2153	с. Паспал	10
2154	с. Патица	10
2155	с. Пашинци	10
2156	с. Пелин	10
2157	с. Пеньово	10
2158	с. Пепелище	10
2159	с. Перперек	10
2160	с. Перуника	10
2161	с. Песнопой	10
2162	с. Петелово	10
2163	с. Петлино	10
2164	с. Пиявец	10
2165	с. Плазище	10
2166	с. Плешинци	10
2167	с. Пловка	10
2168	с. Повет	10
2169	с. Подвръх	10
2170	с. Подкова	10
2171	с. Подрумче	10
2172	с. Полковник Желязово	10
2173	с. Полянец	10
2174	с. Постник	10
2175	с. Поточарка	10
2176	с. Поточе	10
2177	с. Поточница	10
2178	с. Правдолюб	10
2179	с. Пресека	10
2180	с. Прилепци	10
2181	с. Припек	10
2182	с. Прогрес	10
2183	с. Пропаст	10
2184	с. Пряпорец	10
2185	с. Птичар	10
2186	с. Пчеларово	10
2187	с. Пъдарци	10
2188	с. Първенци	10
2189	с. Първица	10
2190	с. Равен	10
2191	с. Ралица	10
2192	с. Раличево	10
2193	с. Рани лист	10
2194	с. Растник	10
2195	с. Резбарци	10
2196	с. Рибарци	10
2197	с. Рибино	10
2198	с. Ридино	10
2199	с. Ридово	10
2200	с. Рогач	10
2201	с. Рогозари	10
2202	с. Рогозче	10
2203	с. Родопско	10
2204	с. Рожденско	10
2205	с. Рудина	10
2206	с. Русалина	10
2207	с. Русалско	10
2208	с. Ручей	10
2209	с. Рът	10
2210	с. Садовица	10
2211	с. Самовила	10
2212	с. Самодива	10
2213	с. Самокитка	10
2214	с. Сбор	10
2215	с. Сватбаре	10
2216	с. Светлен	10
2217	с. Светулка	10
2218	с. Свобода	10
2219	с. Свободиново	10
2220	с. Севдалина	10
2221	с. Седефче	10
2222	с. Седлари	10
2223	с. Седларци	10
2224	с. Седловина	10
2225	с. Секирка	10
2226	с. Сенце	10
2227	с. Сестринско	10
2228	с. Синделци	10
2229	с. Синигер	10
2230	с. Синчец	10
2231	с. Сипей	10
2232	с. Сипец	10
2233	с. Скалак	10
2234	с. Скалина	10
2235	с. Скалище	10
2236	с. Скална глава	10
2237	с. Скърбино	10
2238	с. Сладкодум	10
2239	с. Сливарка	10
2240	с. Слънчоглед	10
2241	с. Снежинка	10
2242	с. Соколино	10
2243	с. Соколите	10
2244	с. Соколско	10
2245	с. Соколяне	10
2246	с. Солище	10
2247	с. Софийци	10
2248	с. Сполука	10
2249	с. Срединка	10
2250	с. Среднево	10
2251	с. Средска	10
2252	с. Средско	10
2253	с. Срънско	10
2254	с. Стар читак	10
2255	с. Старейшино	10
2256	с. Стари чал	10
2257	с. Старо място	10
2258	с. Старово	10
2259	с. Стоманци	10
2260	с. Стояново	10
2261	с. Стражевци	10
2262	с. Стражец	10
2263	с. Стражница	10
2264	с. Странджево	10
2265	с. Страхил войвода	10
2266	с. Стремово	10
2267	с. Стремци	10
2268	с. Стрижба	10
2269	с. Студен кладенец	10
2270	с. Сухово	10
2271	с. Сърнак	10
2272	с. Сярци	10
2273	с. Татково	10
2274	с. Татул	10
2275	с. Телчарка	10
2276	с. Теменуга	10
2277	с. Тинтява	10
2278	с. Тихомир	10
2279	с. Токачка	10
2280	с. Тополка	10
2281	с. Тополчане	10
2282	с. Три могили	10
2283	с. Търна	10
2284	с. Търновци	10
2285	с. Търносливка	10
2286	с. Тютюнче	10
2287	с. Устрен	10
2288	с. Фотиново	10
2289	с. Хаджийско	10
2290	с. Хисар	10
2291	с. Ходжовци	10
2292	с. Храстово	10
2293	с. Хромица	10
2294	с. Царевец	10
2295	с. Царино	10
2296	с. Цвятово	10
2297	с. Църквица	10
2298	с. Чавка	10
2299	с. Чайка	10
2300	с. Чакаларово	10
2301	с. Чакалци	10
2302	с. Чал	10
2303	с. Чеганци	10
2304	с. Червена скала	10
2305	с. Черешица	10
2306	с. Черешка	10
2307	с. Черна нива	10
2308	с. Черна скала	10
2309	с. Чернигово	10
2310	с. Черничево	10
2311	с. Чернооки	10
2312	с. Черноочене	10
2313	с. Черньовци	10
2314	с. Чилик	10
2315	с. Чифлик	10
2316	с. Чичево	10
2317	с. Чобанка	10
2318	с. Чомаково	10
2319	с. Чорбаджийско	10
2320	с. Чубрика	10
2321	с. Чуково	10
2322	с. Шипок	10
2323	с. Широко поле	10
2324	с. Шопци	10
2325	с. Шумнатица	10
2326	с. Щерна	10
2327	с. Юнаци	10
2328	с. Ябълковец	10
2329	с. Ябълчени	10
2330	с. Яворово	10
2331	с. Яковица	10
2332	с. Ямино	10
2333	с. Янино	10
2334	с. Яребица	10
2335	с. Ястреб	10
2336	гр. Кюстендил	11
2337	гр. Бобов дол	11
2338	гр. Бобошево	11
2339	гр. Кочериново	11
2340	гр. Рила	11
2341	гр. Сапарева баня	11
2342	ман. Рилски манастир	11
2343	с. Бабино	11
2344	с. Бабинска река	11
2345	с. Багренци	11
2346	с. Бадино	11
2347	с. Бараково	11
2348	с. Берсин	11
2349	с. Блажиево	11
2350	с. Блатец	11
2351	с. Блато	11
2352	с. Бобешино	11
2353	с. Богослов	11
2354	с. Боровец	11
2355	с. Брест	11
2356	с. Буново	11
2357	с. Бураново	11
2358	с. Бъзовица	11
2359	с. Ваксево	11
2360	с. Ветрен	11
2361	с. Висока могила	11
2362	с. Вратца	11
2363	с. Вуково	11
2364	с. Габрешевци	11
2365	с. Гирчевци	11
2366	с. Голема Фуча	11
2367	с. Големо село	11
2368	с. Голям Върбовник	11
2369	с. Горановци	11
2370	с. Горна Брестница	11
2371	с. Горна Гращица	11
2372	с. Горна Козница	11
2373	с. Горни Коритен	11
2374	с. Горно Кобиле	11
2375	с. Горно Уйно	11
2376	с. Грамаждано	11
2377	с. Граница	11
2378	с. Гурбановци	11
2379	с. Гърбино	11
2380	с. Гърляно	11
2381	с. Гюешево	11
2382	с. Дворище	11
2383	с. Длъхчево-Сабляр	11
2384	с. Добри дол	11
2385	с. Доброво	11
2386	с. Дождевица	11
2387	с. Долистово	11
2388	с. Долна Гращица	11
2389	с. Долна Козница	11
2390	с. Долни Коритен	11
2391	с. Долно Кобиле	11
2392	с. Долно село	11
2393	с. Долно Уйно	11
2394	с. Драговищица	11
2395	с. Драгодан	11
2396	с. Драгойчинци	11
2397	с. Друмохар	11
2398	с. Еремия	11
2399	с. Жабокрът	11
2400	с. Жеравино	11
2401	с. Жиленци	11
2402	с. Згурово	11
2403	с. Злогош	11
2404	с. Ивановци	11
2405	с. Илия	11
2406	с. Кадровица	11
2407	с. Каменик	11
2408	с. Каменичка Скакавица	11
2409	с. Катрище	11
2410	с. Киселица	11
2411	с. Коняво	11
2412	с. Копиловци	11
2413	с. Коприва	11
2414	с. Коркина	11
2415	с. Косово	11
2416	с. Крумово	11
2417	с. Кутугерци	11
2418	с. Кършалево	11
2419	с. Лелинци	11
2420	с. Леска	11
2421	с. Лиляч	11
2422	с. Лисец	11
2423	с. Лозно	11
2424	с. Локвата	11
2425	с. Ломница	11
2426	с. Мазарачево	11
2427	с. Мала Фуча	11
2428	с. Мали Върбовник	11
2429	с. Мало село	11
2430	с. Метохия	11
2431	с. Мламолово	11
2432	с. Мурсалево	11
2433	с. Мърводол	11
2434	с. Невестино	11
2435	с. Неделкова Гращица	11
2436	с. Николичевци	11
2437	с. Нови чифлик	11
2438	с. Ново село	11
2439	с. Новоселяне	11
2440	с. Овчарци	11
2441	с. Падала	11
2442	с. Паничарево	11
2443	с. Паничище	11
2444	с. Пастра	11
2445	с. Пастух	11
2446	с. Пелатиково	11
2447	с. Пиперков чифлик	11
2448	с. Побит камък	11
2449	с. Полетинци	11
2450	с. Полска Скакавица	11
2451	с. Пороминово	11
2452	с. Преколница	11
2453	с. Радловци	11
2454	с. Раждавица	11
2455	с. Раково	11
2456	с. Раненци	11
2457	с. Рашка Гращица	11
2458	с. Режинци	11
2459	с. Ресилово	11
2460	с. Ръсово	11
2461	с. Савойски	11
2462	с. Сажденик	11
2463	с. Сапарево	11
2464	с. Скрино	11
2465	с. Скриняно	11
2466	с. Слатино	11
2467	с. Слокощица	11
2468	с. Смоличано	11
2469	с. Смочево	11
2470	с. Соволяно	11
2471	с. Сопово	11
2472	с. Средорек	11
2473	с. Стенско	11
2474	с. Стоб	11
2475	с. Страдалово	11
2476	с. Сушица	11
2477	с. Таваличево	11
2478	с. Тишаново	11
2479	с. Трекляно	11
2480	с. Търновлаг	11
2481	с. Търсино	11
2482	с. Усойка	11
2483	с. Уши	11
2484	с. Фролош	11
2485	с. Церовица	11
2486	с. Циклово	11
2487	с. Црешново	11
2488	с. Църварица	11
2489	с. Цървена ябълка	11
2490	с. Цървендол	11
2491	с. Цървеняно	11
2492	с. Цървище	11
2493	с. Чеканец	11
2494	с. Четирци	11
2495	с. Чешлянци	11
2496	с. Чудинци	11
2497	с. Шатрово	11
2498	с. Шипочано	11
2499	с. Шишковци	11
2500	с. Ябълково	11
2501	гр. Ловеч	12
2502	гр. Априлци	12
2503	гр. Летница	12
2504	гр. Луковит	12
2505	гр. Тетевен	12
2506	гр. Троян	12
2507	гр. Угърчин	12
2508	гр. Ябланица	12
2509	с. Абланица	12
2510	с. Александрово	12
2511	с. Бабинци	12
2512	с. Балабанско	12
2513	с. Балканец	12
2514	с. Батулци	12
2515	с. Баховица	12
2516	с. Бежаново	12
2517	с. Беленци	12
2518	с. Бели Осъм	12
2519	с. Белиш	12
2520	с. Борима	12
2521	с. Брестница	12
2522	с. Брестово	12
2523	с. Българене	12
2524	с. Български извор	12
2525	с. Василковска махала	12
2526	с. Васильово	12
2527	с. Велчево	12
2528	с. Владиня	12
2529	с. Врабево	12
2530	с. Галата	12
2531	с. Глогово	12
2532	с. Гложене	12
2533	с. Голец	12
2534	с. Голям извор	12
2535	с. Голяма Брестница	12
2536	с. Голяма Желязна	12
2537	с. Горан	12
2538	с. Горно Павликене	12
2539	с. Горно трапе	12
2540	с. Горско Сливово	12
2541	с. Гостиня	12
2542	с. Градежница	12
2543	с. Гумощник	12
2544	с. Дебнево	12
2545	с. Деветаки	12
2546	с. Дерманци	12
2547	с. Дивчовото	12
2548	с. Добревци	12
2549	с. Добродан	12
2550	с. Дойренци	12
2551	с. Драгана	12
2552	с. Драшкова поляна	12
2553	с. Дренов	12
2554	с. Дъбен	12
2555	с. Дъбрава	12
2556	с. Дъбравата	12
2557	с. Дълбок дол	12
2558	с. Златна Панега	12
2559	с. Изворче	12
2560	с. Йоглав	12
2561	с. Казачево	12
2562	с. Калейца	12
2563	с. Каленик	12
2564	с. Карлуково	12
2565	с. Катунец	12
2566	с. Киркова махала	12
2567	с. Кирчево	12
2568	с. Крушуна	12
2569	с. Къкрина	12
2570	с. Кърпачево	12
2571	с. Лесидрен	12
2572	с. Лешница	12
2573	с. Лисец	12
2574	с. Ломец	12
2575	с. Малиново	12
2576	с. Малка Желязна	12
2577	с. Малък извор	12
2578	с. Микре	12
2579	с. Орешак	12
2580	с. Орешене	12
2581	с. Орляне	12
2582	с. Патрешко	12
2583	с. Петревене	12
2584	с. Пещерна	12
2585	с. Прелом	12
2586	с. Пресяка	12
2587	с. Радювене	12
2588	с. Рибарица	12
2589	с. Румянцево	12
2590	с. Скандалото	12
2591	с. Скобелево	12
2592	с. Славщица	12
2593	с. Славяни	12
2594	с. Слатина	12
2595	с. Сливек	12
2596	с. Смочан	12
2597	с. Соколово	12
2598	с. Сопот	12
2599	с. Старо село	12
2600	с. Стефаново	12
2601	с. Тепава	12
2602	с. Терзийско	12
2603	с. Тодоричене	12
2604	с. Торос	12
2605	с. Умаревци	12
2606	с. Хлевене	12
2607	с. Чавдарци	12
2608	с. Черни Вит	12
2609	с. Черни Осъм	12
2610	с. Чифлик	12
2611	с. Шипково	12
2612	с. Ъглен	12
2613	гр. Монтана	13
2614	гр. Берковица	13
2615	гр. Бойчиновци	13
2616	гр. Брусарци	13
2617	гр. Вълчедръм	13
2618	гр. Вършец	13
2619	гр. Лом	13
2620	гр. Чипровци	13
2621	ман. Клисурски манастир	13
2622	с. Аспарухово	13
2623	с. Балювица	13
2624	с. Безденица	13
2625	с. Бели брег	13
2626	с. Бели брод	13
2627	с. Белимел	13
2628	с. Белотинци	13
2629	с. Бистрилица	13
2630	с. Благово	13
2631	с. Бокиловци	13
2632	с. Боровци	13
2633	с. Ботево	13
2634	с. Буковец	13
2635	с. Бъзовец	13
2636	с. Бързия	13
2637	с. Василовци	13
2638	с. Видлица	13
2639	с. Винище	13
2640	с. Вирове	13
2641	с. Владимирово	13
2642	с. Войници	13
2643	с. Габровница	13
2644	с. Гаврил Геново	13
2645	с. Гаганица	13
2646	с. Георги Дамяново	13
2647	с. Главановци	13
2648	с. Говежда	13
2649	с. Горна Бела речка	13
2650	с. Горна Вереница	13
2651	с. Горна Ковачица	13
2652	с. Горна Лука	13
2653	с. Горни Цибър	13
2654	с. Горно Озирово	13
2655	с. Горно Церовене	13
2656	с. Громшин	13
2657	с. Дива Слатина	13
2658	с. Добри дол	13
2659	с. Доктор Йосифово	13
2660	с. Долна Бела речка	13
2661	с. Долна Вереница	13
2662	с. Долна Рикса	13
2663	с. Долни Цибър	13
2664	с. Долно Белотинци	13
2665	с. Долно Линево	13
2666	с. Долно Озирово	13
2667	с. Долно Церовене	13
2668	с. Дондуково	13
2669	с. Драганица	13
2670	с. Дъбова махала	13
2671	с. Дълги дел	13
2672	с. Дългоделци	13
2673	с. Еловица	13
2674	с. Ерден	13
2675	с. Железна	13
2676	с. Замфир	13
2677	с. Замфирово	13
2678	с. Златия	13
2679	с. Игнатово	13
2680	с. Каменна Рикса	13
2681	с. Киселево	13
2682	с. Клисурица	13
2683	с. Княжева махала	13
2684	с. Кобиляк	13
2685	с. Ковачица	13
2686	с. Комарево	13
2687	с. Комощица	13
2688	с. Копиловци	13
2689	с. Костенци	13
2690	с. Котеновци	13
2691	с. Крапчене	13
2692	с. Крива бара	13
2693	с. Лесковец	13
2694	с. Лехчево	13
2695	с. Липен	13
2696	с. Мадан	13
2697	с. Мартиново	13
2698	с. Медковец	13
2699	с. Мездрея	13
2700	с. Меляне	13
2701	с. Митровци	13
2702	с. Мокреш	13
2703	с. Мърчево	13
2704	с. Николово	13
2705	с. Одоровци	13
2706	с. Орсоя	13
2707	с. Охрид	13
2708	с. Палилула	13
2709	с. Песочница	13
2710	с. Пишурка	13
2711	с. Помеждин	13
2712	с. Портитовци	13
2713	с. Превала	13
2714	с. Пърличево	13
2715	с. Равна	13
2716	с. Разград	13
2717	с. Расово	13
2718	с. Рашовица	13
2719	с. Септемврийци	13
2720	с. Славотин	13
2721	с. Слатина	13
2722	с. Сливата	13
2723	с. Сливовик	13
2724	с. Смирненски	13
2725	с. Смоляновци	13
2726	с. Спанчевци	13
2727	с. Сталийска махала	13
2728	с. Станево	13
2729	с. Стояново	13
2730	с. Стубел	13
2731	с. Студено буче	13
2732	с. Сумер	13
2733	с. Трайково	13
2734	с. Трифоново	13
2735	с. Цветкова бара	13
2736	с. Челюстница	13
2737	с. Чемиш	13
2738	с. Черешовица	13
2739	с. Черкаски	13
2740	с. Черни връх	13
2741	с. Ягодово	13
2742	с. Якимово	13
2743	гр. Пазарджик	14
2744	гр. Батак	14
2745	гр. Белово	14
2746	гр. Брацигово	14
2747	гр. Велинград	14
2748	гр. Ветрен	14
2749	гр. Костандово	14
2750	гр. Панагюрище	14
2751	гр. Пещера	14
2752	гр. Ракитово	14
2753	гр. Септември	14
2754	гр. Стрелча	14
2755	гр. Сърница	14
2756	с. Абланица	14
2757	с. Аканджиево	14
2758	с. Алеко Константиново	14
2759	с. Алендарова	14
2760	с. Априлци	14
2761	с. Баня	14
2762	с. Биркова	14
2763	с. Блатница	14
2764	с. Бозьова	14
2765	с. Боримечково	14
2766	с. Бошуля	14
2767	с. Братаница	14
2768	с. Бутрева	14
2769	с. Бъта	14
2770	с. Бяга	14
2771	с. Варвара	14
2772	с. Величково	14
2773	с. Ветрен дол	14
2774	с. Виноградец	14
2775	с. Враненци	14
2776	с. Всемирци	14
2777	с. Габровица	14
2778	с. Гелеменово	14
2779	с. Главиница	14
2780	с. Говедаре	14
2781	с. Голямо Белово	14
2782	с. Горна Биркова	14
2783	с. Горна Дъбева	14
2784	с. Горно вършило	14
2785	с. Грашево	14
2786	с. Дебръщица	14
2787	с. Динката	14
2788	с. Добровница	14
2789	с. Долна Дъбева	14
2790	с. Долно вършило	14
2791	с. Дорково	14
2792	с. Драгиново	14
2793	с. Драгор	14
2794	с. Дъбравите	14
2795	с. Дюлево	14
2796	с. Елшица	14
2797	с. Жребичко	14
2798	с. Звъничево	14
2799	с. Злокучене	14
2800	с. Ивайло	14
2801	с. Исперихово	14
2802	с. Калугерово	14
2803	с. Кандови	14
2804	с. Капитан Димитриево	14
2805	с. Карабунар	14
2806	с. Ковачево	14
2807	с. Козарско	14
2808	с. Крали Марко	14
2809	с. Кръстава	14
2810	с. Левски	14
2811	с. Лесичово	14
2812	с. Лозен	14
2813	с. Ляхово	14
2814	с. Мало Конаре	14
2815	с. Медени поляни	14
2816	с. Мененкьово	14
2817	с. Мирянци	14
2818	с. Мокрище	14
2819	с. Момина клисура	14
2820	с. Нова махала	14
2821	с. Оборище	14
2822	с. Овчеполци	14
2823	с. Огняново	14
2824	с. Памидово	14
2825	с. Панагюрски колонии	14
2826	с. Паталеница	14
2827	с. Пашови	14
2828	с. Пищигово	14
2829	с. Побит камък	14
2830	с. Поибрене	14
2831	с. Попинци	14
2832	с. Равногор	14
2833	с. Радилово	14
2834	с. Розово	14
2835	с. Росен	14
2836	с. Рохлева	14
2837	с. Сарая	14
2838	с. Сбор	14
2839	с. Света Петка	14
2840	с. Свобода	14
2841	с. Семчиново	14
2842	с. Сестримо	14
2843	с. Симеоновец	14
2844	с. Синитово	14
2845	с. Славовица	14
2846	с. Смилец	14
2847	с. Сребриново	14
2848	с. Тополи дол	14
2849	с. Фотиново	14
2850	с. Хаджиево	14
2851	с. Цар Асен	14
2852	с. Цветино	14
2853	с. Церово	14
2854	с. Црънча	14
2855	с. Черногорово	14
2856	с. Чолакова	14
2857	с. Щърково	14
2858	с. Юнаците	14
2859	с. Юндола	14
2860	гр. Перник	15
2861	гр. Батановци	15
2862	гр. Брезник	15
2863	гр. Земен	15
2864	гр. Радомир	15
2865	гр. Трън	15
2866	с. Арзан	15
2867	с. Бабица	15
2868	с. Байкалско	15
2869	с. Банище	15
2870	с. Банкя	15
2871	с. Бегуновци	15
2872	с. Беланица	15
2873	с. Берайнци	15
2874	с. Беренде	15
2875	с. Билинци	15
2876	с. Блатешница	15
2877	с. Бобораци	15
2878	с. Богданов дол	15
2879	с. Богойна	15
2880	с. Борнарево	15
2881	с. Боснек	15
2882	с. Бохова	15
2883	с. Брезнишки извор	15
2884	с. Брусник	15
2885	с. Бусинци	15
2886	с. Бутроинци	15
2887	с. Велиново	15
2888	с. Велковци	15
2889	с. Видрар	15
2890	с. Видрица	15
2891	с. Вискяр	15
2892	с. Витановци	15
2893	с. Владимир	15
2894	с. Врабча	15
2895	с. Враня стена	15
2896	с. Вукан	15
2897	с. Габровдол	15
2898	с. Гигинци	15
2899	с. Главановци	15
2900	с. Глоговица	15
2901	с. Гоз	15
2902	с. Големо Бучино	15
2903	с. Горна Врабча	15
2904	с. Горна Глоговица	15
2905	с. Горна Диканя	15
2906	с. Горна Мелна	15
2907	с. Горна Секирна	15
2908	с. Горни Романци	15
2909	с. Горочевци	15
2910	с. Гълъбник	15
2911	с. Гърло	15
2912	с. Дебели лаг	15
2913	с. Джинчовци	15
2914	с. Дивля	15
2915	с. Дивотино	15
2916	с. Докьовци	15
2917	с. Долна Врабча	15
2918	с. Долна Диканя	15
2919	с. Долна Мелна	15
2920	с. Долна Секирна	15
2921	с. Долни Раковец	15
2922	с. Долни Романци	15
2923	с. Драгичево	15
2924	с. Драгомирово	15
2925	с. Дрен	15
2926	с. Друган	15
2927	с. Душинци	15
2928	с. Дълга лука	15
2929	с. Егълница	15
2930	с. Ездимирци	15
2931	с. Еловдол	15
2932	с. Еловица	15
2933	с. Ерул	15
2934	с. Жабляно	15
2935	с. Жедна	15
2936	с. Житуша	15
2937	с. Забел	15
2938	с. Завала	15
2939	с. Зелениград	15
2940	с. Зидарци	15
2941	с. Извор	15
2942	с. Калище	15
2943	с. Калотинци	15
2944	с. Касилаг	15
2945	с. Кладница	15
2946	с. Кленовик	15
2947	с. Ковачевци	15
2948	с. Кожинци	15
2949	с. Кондофрей	15
2950	с. Конска	15
2951	с. Копаница	15
2952	с. Косача	15
2953	с. Костуринци	15
2954	с. Кошарево	15
2955	с. Кошарите	15
2956	с. Кралев дол	15
2957	с. Красава	15
2958	с. Кривонос	15
2959	с. Къшле	15
2960	с. Лева река	15
2961	с. Лесковец	15
2962	с. Лешниковци	15
2963	с. Лобош	15
2964	с. Ломница	15
2965	с. Люлин	15
2966	с. Лялинци	15
2967	с. Мещица	15
2968	с. Милкьовци	15
2969	с. Милославци	15
2970	с. Мракетинци	15
2971	с. Мрамор	15
2972	с. Мурено	15
2973	с. Муртинци	15
2974	с. Насалевци	15
2975	с. Негованци	15
2976	с. Неделково	15
2977	с. Непразненци	15
2978	с. Николаево	15
2979	с. Ноевци	15
2980	с. Одраница	15
2981	с. Озърновци	15
2982	с. Падине	15
2983	с. Парамун	15
2984	с. Пенкьовци	15
2985	с. Пещера	15
2986	с. Планиница	15
2987	с. Поцърненци	15
2988	с. Прибой	15
2989	с. Проданча	15
2990	с. Радибош	15
2991	с. Радово	15
2992	с. Радуй	15
2993	с. Ракиловци	15
2994	с. Рани луг	15
2995	с. Расник	15
2996	с. Раянци	15
2997	с. Ребро	15
2998	с. Режанци	15
2999	с. Реяновци	15
3000	с. Рударци	15
3001	с. Ръжавец	15
3002	с. Садовик	15
3003	с. Светля	15
3004	с. Селищен дол	15
3005	с. Сирищник	15
3006	с. Слаковци	15
3007	с. Слатино	15
3008	с. Слишовци	15
3009	с. Смиров дол	15
3010	с. Сопица	15
3011	с. Стайчовци	15
3012	с. Станьовци	15
3013	с. Старо село	15
3014	с. Стефаново	15
3015	с. Стрезимировци	15
3016	с. Студен извор	15
3017	с. Студена	15
3018	с. Туроковци	15
3019	с. Углярци	15
3020	с. Филиповци	15
3021	с. Цегриловци	15
3022	с. Чепино	15
3023	с. Червена могила	15
3024	с. Черна гора	15
3025	с. Чуйпетлово	15
3026	с. Чуковец	15
3027	с. Шипковица	15
3028	с. Ярджиловци	15
3029	с. Ярловци	15
3030	с. Ярославци	15
3031	гр. Плевен	16
3032	гр. Белене	16
3033	гр. Гулянци	16
3034	гр. Долна Митрополия	16
3035	гр. Долни Дъбник	16
3036	гр. Искър	16
3037	гр. Кнежа	16
3038	гр. Койнаре	16
3039	гр. Левски	16
3040	гр. Никопол	16
3041	гр. Пордим	16
3042	гр. Славяново	16
3043	гр. Тръстеник	16
3044	гр. Червен бряг	16
3045	с. Асеново	16
3046	с. Асеновци	16
3047	с. Аспарухово	16
3048	с. Байкал	16
3049	с. Бацова махала	16
3050	с. Беглеж	16
3051	с. Биволаре	16
3052	с. Божурица	16
3053	с. Божурлук	16
3054	с. Борислав	16
3055	с. Бохот	16
3056	с. Брегаре	16
3057	с. Бреница	16
3058	с. Брест	16
3059	с. Бресте	16
3060	с. Брестовец	16
3061	с. Бръшляница	16
3062	с. Буковлък	16
3063	с. Българене	16
3064	с. Бъркач	16
3065	с. Бяла вода	16
3066	с. Варана	16
3067	с. Въбел	16
3068	с. Вълчитрън	16
3069	с. Върбица	16
3070	с. Гиген	16
3071	с. Глава	16
3072	с. Горна Митрополия	16
3073	с. Горни Дъбник	16
3074	с. Горник	16
3075	с. Горталово	16
3076	с. Гостиля	16
3077	с. Градина	16
3078	с. Градище	16
3079	с. Гривица	16
3080	с. Дебово	16
3081	с. Девенци	16
3082	с. Деков	16
3083	с. Дисевица	16
3084	с. Долни Вит	16
3085	с. Долни Луковит	16
3086	с. Драгаш войвода	16
3087	с. Дъбован	16
3088	с. Евлогиево	16
3089	с. Еница	16
3090	с. Жернов	16
3091	с. Загражден	16
3092	с. Згалево	16
3093	с. Изгрев	16
3094	с. Искър	16
3095	с. Каменец	16
3096	с. Катерица	16
3097	с. Козар Белене	16
3098	с. Коиловци	16
3099	с. Комарево	16
3100	с. Крета	16
3101	с. Крушовене	16
3102	с. Крушовица	16
3103	с. Кулина вода	16
3104	с. Къртожабене	16
3105	с. Къшин	16
3106	с. Лазарово	16
3107	с. Ласкар	16
3108	с. Ленково	16
3109	с. Лепица	16
3110	с. Лозица	16
3111	с. Любеново	16
3112	с. Малчика	16
3113	с. Мечка	16
3114	с. Милковица	16
3115	с. Муселиево	16
3116	с. Николаево	16
3117	с. Новачене	16
3118	с. Обнова	16
3119	с. Одърне	16
3120	с. Опанец	16
3121	с. Ореховица	16
3122	с. Пелишат	16
3123	с. Петокладенци	16
3124	с. Петърница	16
3125	с. Писарово	16
3126	с. Победа	16
3127	с. Подем	16
3128	с. Радишево	16
3129	с. Радомирци	16
3130	с. Ракита	16
3131	с. Ралево	16
3132	с. Реселец	16
3133	с. Рибен	16
3134	с. Рупци	16
3135	с. Садовец	16
3136	с. Санадиново	16
3137	с. Славовица	16
3138	с. Сомовит	16
3139	с. Ставерци	16
3140	с. Староселци	16
3141	с. Стежерово	16
3142	с. Сухаче	16
3143	с. Татари	16
3144	с. Телиш	16
3145	с. Тодорово	16
3146	с. Тотлебен	16
3147	с. Трънчовица	16
3148	с. Тученица	16
3149	с. Търнене	16
3150	с. Черковица	16
3151	с. Чомаковци	16
3152	с. Шияково	16
3153	с. Ясен	16
3154	гр. Пловдив	17
3155	гр. Асеновград	17
3156	гр. Баня	17
3157	гр. Брезово	17
3158	гр. Калофер	17
3159	гр. Карлово	17
3160	гр. Клисура	17
3161	гр. Кричим	17
3162	гр. Куклен	17
3163	гр. Лъки	17
3164	гр. Перущица	17
3165	гр. Първомай	17
3166	гр. Раковски	17
3167	гр. Садово	17
3168	гр. Сопот	17
3169	гр. Стамболийски	17
3170	гр. Съединение	17
3171	гр. Хисаря	17
3172	с. Анево	17
3173	с. Ахматово	17
3174	с. Бабек	17
3175	с. Балкан махала	17
3176	с. Бачково	17
3177	с. Бегово	17
3178	с. Бегунци	17
3179	с. Белащица	17
3180	с. Белица	17
3181	с. Беловица	17
3182	с. Белозем	17
3183	с. Бенковски	17
3184	с. Богдан	17
3185	с. Богданица	17
3186	с. Бойково	17
3187	с. Болярино	17
3188	с. Болярци	17
3189	с. Бор	17
3190	с. Борец	17
3191	с. Борово	17
3192	с. Боянци	17
3193	с. Браниполе	17
3194	с. Брестник	17
3195	с. Брестовица	17
3196	с. Брягово	17
3197	с. Буково	17
3198	с. Бяла река	17
3199	с. Васил Левски	17
3200	с. Ведраре	17
3201	с. Виница	17
3202	с. Воден	17
3203	с. Войводиново	17
3204	с. Войнягово	17
3205	с. Войсил	17
3206	с. Врата	17
3207	с. Върбен	17
3208	с. Главатар	17
3209	с. Голям чардак	17
3210	с. Горна махала	17
3211	с. Горни Домлян	17
3212	с. Горнослав	17
3213	с. Градина	17
3214	с. Граф Игнатиево	17
3215	с. Гълъбово	17
3216	с. Дедово	17
3217	с. Джурково	17
3218	с. Динк	17
3219	с. Добралък	17
3220	с. Добри дол	17
3221	с. Добростан	17
3222	с. Долна махала	17
3223	с. Долнослав	17
3224	с. Домлян	17
3225	с. Драгойново	17
3226	с. Драгомир	17
3227	с. Дрангово	17
3228	с. Дряново	17
3229	с. Дуванлии	17
3230	с. Дъбене	17
3231	с. Дълбок извор	17
3232	с. Дълго поле	17
3233	с. Езерово	17
3234	с. Желязно	17
3235	с. Житница	17
3236	с. Жълт камък	17
3237	с. Здравец	17
3238	с. Зелениково	17
3239	с. Златитрап	17
3240	с. Златовръх	17
3241	с. Златосел	17
3242	с. Иван Вазово	17
3243	с. Иганово	17
3244	с. Избеглии	17
3245	с. Извор	17
3246	с. Искра	17
3247	с. Йоаким Груево	17
3248	с. Кадиево	17
3249	с. Калековец	17
3250	с. Калояново	17
3251	с. Каравелово	17
3252	с. Караджалово	17
3253	с. Караджово	17
3254	с. Катуница	17
3255	с. Климент	17
3256	с. Козаново	17
3257	с. Конуш	17
3258	с. Косово	17
3259	с. Костиево	17
3260	с. Кочево	17
3261	с. Красново	17
3262	с. Крислово	17
3263	с. Крумово	17
3264	с. Крушево	17
3265	с. Крушово	17
3266	с. Кръстевич	17
3267	с. Куртово	17
3268	с. Куртово Конаре	17
3269	с. Кърнаре	17
3270	с. Леново	17
3271	с. Лилково	17
3272	с. Лъкавица	17
3273	с. Любен	17
3274	с. Лясково	17
3275	с. Мало Крушево	17
3276	с. Малък чардак	17
3277	с. Манастир	17
3278	с. Маноле	17
3279	с. Манолско Конаре	17
3280	с. Марино поле	17
3281	с. Марково	17
3282	с. Милево	17
3283	с. Михилци	17
3284	с. Момино село	17
3285	с. Моминско	17
3286	с. Московец	17
3287	с. Мостово	17
3288	с. Мраченик	17
3289	с. Мулдава	17
3290	с. Мътеница	17
3291	с. Найден Герово	17
3292	с. Нареченски бани	17
3293	с. Неделево	17
3294	с. Новаково	17
3295	с. Нови извор	17
3296	с. Ново Железаре	17
3297	с. Ново село	17
3298	с. Орешец	17
3299	с. Оризари	17
3300	с. Отец Кирилово	17
3301	с. Отец Паисиево	17
3302	с. Паничери	17
3303	с. Патриарх Евтимово	17
3304	с. Певците	17
3305	с. Песнопой	17
3306	с. Поповица	17
3307	с. Поройна	17
3308	с. Правище	17
3309	с. Православен	17
3310	с. Пролом	17
3311	с. Пъдарско	17
3312	с. Първенец	17
3313	с. Радиново	17
3314	с. Рогош	17
3315	с. Розино	17
3316	с. Розовец	17
3317	с. Руен	17
3318	с. Ръжево	17
3319	с. Ръжево Конаре	17
3320	с. Свежен	17
3321	с. Селци	17
3322	с. Сини връх	17
3323	с. Ситово	17
3324	с. Скобелево	17
3325	с. Скутаре	17
3326	с. Слатина	17
3327	с. Соколица	17
3328	с. Старо Железаре	17
3329	с. Старосел	17
3330	с. Стоево	17
3331	с. Столетово	17
3332	с. Стрелци	17
3333	с. Строево	17
3334	с. Стряма	17
3335	с. Сухозем	17
3336	с. Сърнегор	17
3337	с. Татарево	17
3338	с. Тополово	17
3339	с. Три могили	17
3340	с. Триводици	17
3341	с. Трилистник	17
3342	с. Труд	17
3343	с. Тюркмен	17
3344	с. Узуново	17
3345	с. Устина	17
3346	с. Храбрино	17
3347	с. Христо Даново	17
3348	с. Цалапица	17
3349	с. Цар Калоян	17
3350	с. Царацово	17
3351	с. Царимир	17
3352	с. Церетелево	17
3353	с. Чалъкови	17
3354	с. Червен	17
3355	с. Черничево	17
3356	с. Черноземен	17
3357	с. Чехларе	17
3358	с. Чешнегирово	17
3359	с. Чоба	17
3360	с. Чурен	17
3361	с. Шишманци	17
3362	с. Югово	17
3363	с. Яврово	17
3364	с. Ягодово	17
3365	с. Ясно поле	17
3366	гр. Разград	18
3367	гр. Завет	18
3368	гр. Исперих	18
3369	гр. Кубрат	18
3370	гр. Лозница	18
3371	гр. Цар Калоян	18
3372	с. Балкански	18
3373	с. Бели Лом	18
3374	с. Белинци	18
3375	с. Беловец	18
3376	с. Бисерци	18
3377	с. Благоево	18
3378	с. Богданци	18
3379	с. Богомилци	18
3380	с. Божурово	18
3381	с. Брестовене	18
3382	с. Бърдоква	18
3383	с. Вазово	18
3384	с. Веселец	18
3385	с. Веселина	18
3386	с. Владимировци	18
3387	с. Гецово	18
3388	с. Голям извор	18
3389	с. Голям Поровец	18
3390	с. Голяма вода	18
3391	с. Горичево	18
3392	с. Гороцвет	18
3393	с. Градина	18
3394	с. Делчево	18
3395	с. Драгомъж	18
3396	с. Дряновец	18
3397	с. Духовец	18
3398	с. Дянково	18
3399	с. Езерче	18
3400	с. Желязковец	18
3401	с. Задруга	18
3402	с. Звънарци	18
3403	с. Здравец	18
3404	с. Иван Шишманово	18
3405	с. Йонково	18
3406	с. Каменар	18
3407	с. Каменово	18
3408	с. Кара Михал	18
3409	с. Китанчево	18
3410	с. Киченица	18
3411	с. Конево	18
3412	с. Костанденец	18
3413	с. Кривица	18
3414	с. Крояч	18
3415	с. Къпиновци	18
3416	с. Липник	18
3417	с. Ловско	18
3418	с. Лудогорци	18
3419	с. Лъвино	18
3420	с. Малко Йонково	18
3421	с. Малък Поровец	18
3422	с. Манастирско	18
3423	с. Манастирци	18
3424	с. Медовене	18
3425	с. Мортагоново	18
3426	с. Мъдрево	18
3427	с. Недоклан	18
3428	с. Ножарово	18
3429	с. Осенец	18
3430	с. Острово	18
3431	с. Островче	18
3432	с. Печеница	18
3433	с. Побит камък	18
3434	с. Подайва	18
3435	с. Пороище	18
3436	с. Прелез	18
3437	с. Просторно	18
3438	с. Пчелина	18
3439	с. Равно	18
3440	с. Радинград	18
3441	с. Райнино	18
3442	с. Раковски	18
3443	с. Савин	18
3444	с. Самуил	18
3445	с. Свещари	18
3446	с. Севар	18
3447	с. Сейдол	18
3448	с. Сеслав	18
3449	с. Синя вода	18
3450	с. Средоселци	18
3451	с. Старо селище	18
3452	с. Стражец	18
3453	с. Студенец	18
3454	с. Сушево	18
3455	с. Тертер	18
3456	с. Тодорово	18
3457	с. Топчии	18
3458	с. Точилари	18
3459	с. Трапище	18
3460	с. Тръбач	18
3461	с. Ушинци	18
3462	с. Хума	18
3463	с. Хърсово	18
3464	с. Черковна	18
3465	с. Чудомир	18
3466	с. Юпер	18
3467	с. Яким Груево	18
3468	с. Ясеновец	18
3469	гр. Русе	19
3470	гр. Борово	19
3471	гр. Бяла	19
3472	гр. Ветово	19
3473	гр. Глоджево	19
3474	гр. Две могили	19
3475	гр. Мартен	19
3476	гр. Сеново	19
3477	гр. Сливо поле	19
3478	с. Бабово	19
3479	с. Баниска	19
3480	с. Басарбово	19
3481	с. Батин	19
3482	с. Батишница	19
3483	с. Белцов	19
3484	с. Беляново	19
3485	с. Бистренци	19
3486	с. Божичен	19
3487	с. Борисово	19
3488	с. Босилковци	19
3489	с. Ботров	19
3490	с. Брестовица	19
3491	с. Бръшлен	19
3492	с. Бъзовец	19
3493	с. Бъзън	19
3494	с. Волово	19
3495	с. Голямо Враново	19
3496	с. Горно Абланово	19
3497	с. Джулюница	19
3498	с. Долна Студена	19
3499	с. Долно Абланово	19
3500	с. Дряновец	19
3501	с. Екзарх Йосиф	19
3502	с. Иваново	19
3503	с. Караманово	19
3504	с. Каран Върбовка	19
3505	с. Кацелово	19
3506	с. Копривец	19
3507	с. Кошарна	19
3508	с. Кошов	19
3509	с. Красен	19
3510	с. Кривина	19
3511	с. Кривня	19
3512	с. Лом Черковна	19
3513	с. Малко Враново	19
3514	с. Мечка	19
3515	с. Могилино	19
3516	с. Николово	19
3517	с. Нисово	19
3518	с. Новград	19
3519	с. Ново село	19
3520	с. Обретеник	19
3521	с. Острица	19
3522	с. Пейчиново	19
3523	с. Пепелина	19
3524	с. Пет кладенци	19
3525	с. Пиперково	19
3526	с. Пиргово	19
3527	с. Писанец	19
3528	с. Полско Косово	19
3529	с. Помен	19
3530	с. Просена	19
3531	с. Ряхово	19
3532	с. Сандрово	19
3533	с. Сваленик	19
3534	с. Семерджиево	19
3535	с. Смирненски	19
3536	с. Стамболово	19
3537	с. Стърмен	19
3538	с. Табачка	19
3539	с. Тетово	19
3540	с. Тръстеник	19
3541	с. Хотанца	19
3542	с. Ценово	19
3543	с. Церовец	19
3544	с. Червен	19
3545	с. Червена вода	19
3546	с. Черешово	19
3547	с. Чилнов	19
3548	с. Широково	19
3549	с. Щръклево	19
3550	с. Юделник	19
3551	с. Ястребово	19
3552	гр. Силистра	20
3553	гр. Алфатар	20
3554	гр. Главиница	20
3555	гр. Дулово	20
3556	гр. Тутракан	20
3557	с. Айдемир	20
3558	с. Алеково	20
3559	с. Антимово	20
3560	с. Бабук	20
3561	с. Бащино	20
3562	с. Белица	20
3563	с. Бистра	20
3564	с. Богданци	20
3565	с. Богорово	20
3566	с. Боил	20
3567	с. Босна	20
3568	с. Брадвари	20
3569	с. Бреница	20
3570	с. Българка	20
3571	с. Варненци	20
3572	с. Васил Левски	20
3573	с. Ветрен	20
3574	с. Водно	20
3575	с. Войново	20
3576	с. Вокил	20
3577	с. Вълкан	20
3578	с. Върбино	20
3579	с. Гарван	20
3580	с. Главан	20
3581	с. Голеш	20
3582	с. Господиново	20
3583	с. Грънчарово	20
3584	с. Давидово	20
3585	с. Дичево	20
3586	с. Добротица	20
3587	с. Добруджанка	20
3588	с. Долец	20
3589	с. Долно Ряхово	20
3590	с. Дунавец	20
3591	с. Зарица	20
3592	с. Зарник	20
3593	с. Зафирово	20
3594	с. Звенимир	20
3595	с. Зебил	20
3596	с. Златоклас	20
3597	с. Ирник	20
3598	с. Искра	20
3599	с. Йорданово	20
3600	с. Казимир	20
3601	с. Кайнарджа	20
3602	с. Калипетрово	20
3603	с. Калугерене	20
3604	с. Каменци	20
3605	с. Козяк	20
3606	с. Коларово	20
3607	с. Колобър	20
3608	с. Косара	20
3609	с. Краново	20
3610	с. Кутловица	20
3611	с. Листец	20
3612	с. Любен	20
3613	с. Малък Преславец	20
3614	с. Межден	20
3615	с. Нова Попина	20
3616	с. Нова Черна	20
3617	с. Ножарево	20
3618	с. Овен	20
3619	с. Окорш	20
3620	с. Орешене	20
3621	с. Осен	20
3622	с. Падина	20
3623	с. Паисиево	20
3624	с. Подлес	20
3625	с. Пожарево	20
3626	с. Полковник Ламбриново	20
3627	с. Полковник Таслаково	20
3628	с. Полковник Чолаково	20
3629	с. Поляна	20
3630	с. Попина	20
3631	с. Попкралево	20
3632	с. Попрусаново	20
3633	с. Поройно	20
3634	с. Посев	20
3635	с. Правда	20
3636	с. Преславци	20
3637	с. Професор Иширково	20
3638	с. Прохлада	20
3639	с. Раздел	20
3640	с. Руйно	20
3641	с. Светослав	20
3642	с. Секулово	20
3643	с. Ситово	20
3644	с. Скала	20
3645	с. Слатина	20
3646	с. Смилец	20
3647	с. Сокол	20
3648	с. Срацимир	20
3649	с. Сребърна	20
3650	с. Средище	20
3651	с. Старо село	20
3652	с. Стефан Караджа	20
3653	с. Стрелково	20
3654	с. Суходол	20
3655	с. Сърпово	20
3656	с. Сяново	20
3657	с. Търновци	20
3658	с. Цар Асен	20
3659	с. Цар Самуил	20
3660	с. Царев дол	20
3661	с. Ценович	20
3662	с. Черковна	20
3663	с. Черник	20
3664	с. Черногор	20
3665	с. Чернолик	20
3666	с. Чуковец	20
3667	с. Шуменци	20
3668	с. Яребица	20
3669	с. Ястребна	20
3670	гр. Сливен	21
3671	гр. Кермен	21
3672	гр. Котел	21
3673	гр. Нова Загора	21
3674	гр. Твърдица	21
3675	гр. Шивачево	21
3676	с. Асеновец	21
3677	с. Баня	21
3678	с. Биково	21
3679	с. Бинкос	21
3680	с. Блатец	21
3681	с. Близнец	21
3682	с. Богданово	21
3683	с. Божевци	21
3684	с. Бозаджии	21
3685	с. Боринци	21
3686	с. Боров дол	21
3687	с. Братан	21
3688	с. Брястово	21
3689	с. Бял кладенец	21
3690	с. Бяла	21
3691	с. Бяла паланка	21
3692	с. Въглен	21
3693	с. Гавраилово	21
3694	с. Гергевец	21
3695	с. Глуфишево	21
3696	с. Глушник	21
3697	с. Голямо Чочовени	21
3698	с. Горно Александрово	21
3699	с. Градец	21
3700	с. Градско	21
3701	с. Графитово	21
3702	с. Драгоданово	21
3703	с. Дъбова	21
3704	с. Дядово	21
3705	с. Езеро	21
3706	с. Еленово	21
3707	с. Желю войвода	21
3708	с. Жеравна	21
3709	с. Жълт бряг	21
3710	с. Загорци	21
3711	с. Зайчари	21
3712	с. Злати войвода	21
3713	с. Изгрев	21
3714	с. Ичера	21
3715	с. Калояново	21
3716	с. Камен	21
3717	с. Каменово	21
3718	с. Караново	21
3719	с. Катунище	21
3720	с. Кипилово	21
3721	с. Ковачите	21
3722	с. Коньово	21
3723	с. Кортен	21
3724	с. Крива круша	21
3725	с. Крушаре	21
3726	с. Любенец	21
3727	с. Любенова махала	21
3728	с. Малко село	21
3729	с. Малко Чочовени	21
3730	с. Медвен	21
3731	с. Мечкарево	21
3732	с. Младово	21
3733	с. Млекарево	21
3734	с. Мокрен	21
3735	с. Научене	21
3736	с. Нейково	21
3737	с. Николаево	21
3738	с. Новачево	21
3739	с. Новоселец	21
3740	с. Омарчево	21
3741	с. Оризари	21
3742	с. Орлово	21
3743	с. Остра могила	21
3744	с. Панаретовци	21
3745	с. Пет могили	21
3746	с. Питово	21
3747	с. Полско Пъдарево	21
3748	с. Прохорово	21
3749	с. Пъдарево	21
3750	с. Радево	21
3751	с. Радецки	21
3752	с. Раково	21
3753	с. Самуилово	21
3754	с. Сборище	21
3755	с. Седларево	21
3756	с. Селиминово	21
3757	с. Скобелево	21
3758	с. Сокол	21
3759	с. Соколарци	21
3760	с. Сотиря	21
3761	с. Средорек	21
3762	с. Стара река	21
3763	с. Старо село	21
3764	с. Стоил войвода	21
3765	с. Стрелци	21
3766	с. Струпец	21
3767	с. Събрано	21
3768	с. Съдиево	21
3769	с. Съдийско поле	21
3770	с. Сърцево	21
3771	с. Тича	21
3772	с. Тополчане	21
3773	с. Топузево	21
3774	с. Трапоклово	21
3775	с. Филаретово	21
3776	с. Ценино	21
3777	с. Червенаково	21
3778	с. Чинтулово	21
3779	с. Чокоба	21
3780	с. Ябланово	21
3781	гр. Смолян	22
3782	гр. Девин	22
3783	гр. Доспат	22
3784	гр. Златоград	22
3785	гр. Мадан	22
3786	гр. Неделино	22
3787	гр. Рудозем	22
3788	гр. Чепеларе	22
3789	с. Аламовци	22
3790	с. Алиговска	22
3791	с. Арда	22
3792	с. Арпаджик	22
3793	с. Баблон	22
3794	с. Баните	22
3795	с. Барутин	22
3796	с. Беден	22
3797	с. Белев дол	22
3798	с. Билянска	22
3799	с. Богутево	22
3800	с. Боево	22
3801	с. Борие	22
3802	с. Борика	22
3803	с. Бориково	22
3804	с. Борино	22
3805	с. Бориново	22
3806	с. Боровина	22
3807	с. Босилково	22
3808	с. Бостина	22
3809	с. Бреза	22
3810	с. Брезе	22
3811	с. Бръщен	22
3812	с. Буйново	22
3813	с. Буката	22
3814	с. Букаците	22
3815	с. Букова поляна	22
3816	с. Буково	22
3817	с. Бурево	22
3818	с. Бърчево	22
3819	с. Бяла река	22
3820	с. Вехтино	22
3821	с. Виево	22
3822	с. Високите	22
3823	с. Витина	22
3824	с. Вишнево	22
3825	с. Влахово	22
3826	с. Водата	22
3827	с. Водни пад	22
3828	с. Войкова лъка	22
3829	с. Вранинци	22
3830	с. Вълчан	22
3831	с. Вълчан дол	22
3832	с. Върба	22
3833	с. Върбина	22
3834	с. Върбово	22
3835	с. Въргов дол	22
3836	с. Върли дол	22
3837	с. Върлино	22
3838	с. Габрина	22
3839	с. Габрица	22
3840	с. Галище	22
3841	с. Гела	22
3842	с. Глогино	22
3843	с. Гоздевица	22
3844	с. Горна Арда	22
3845	с. Горово	22
3846	с. Градът	22
3847	с. Грамаде	22
3848	с. Гращица	22
3849	с. Грохотно	22
3850	с. Гудевица	22
3851	с. Гълъбово	22
3852	с. Гърнати	22
3853	с. Гьоврен	22
3854	с. Давидково	22
3855	с. Две тополи	22
3856	с. Дебеляново	22
3857	с. Диманово	22
3858	с. Димово	22
3859	с. Дирало	22
3860	с. Добрева череша	22
3861	с. Долен	22
3862	с. Долие	22
3863	с. Дрянка	22
3864	с. Дряновец	22
3865	с. Дунево	22
3866	с. Дуня	22
3867	с. Дъбова	22
3868	с. Еленка	22
3869	с. Еленска	22
3870	с. Елховец	22
3871	с. Ельово	22
3872	с. Ерма река	22
3873	с. Жребево	22
3874	с. Забърдо	22
3875	с. Загражден	22
3876	с. Заевите	22
3877	с. Змеица	22
3878	с. Змиево	22
3879	с. Зорница	22
3880	с. Иваново	22
3881	с. Изгрев	22
3882	с. Исьовци	22
3883	с. Касапско	22
3884	с. Катраница	22
3885	с. Кестен	22
3886	с. Киселчово	22
3887	с. Кожари	22
3888	с. Козарка	22
3889	с. Кокорово	22
3890	с. Кокорци	22
3891	с. Кориите	22
3892	с. Коритата	22
3893	с. Кочани	22
3894	с. Кошница	22
3895	с. Крайна (Мадан)	22
3896	с. Крайна (Неделино)	22
3897	с. Кремене	22
3898	с. Крушев дол	22
3899	с. Кръстатица	22
3900	с. Кукувица	22
3901	с. Кундево	22
3902	с. Купен	22
3903	с. Кутела	22
3904	с. Кушла	22
3905	с. Късак	22
3906	с. Левочево	22
3907	с. Леска	22
3908	с. Лещак	22
3909	с. Ливаде	22
3910	с. Лилеково	22
3911	с. Липец	22
3912	с. Ловци	22
3913	с. Лъка	22
3914	с. Любча	22
3915	с. Люлка	22
3916	с. Лясково	22
3917	с. Магарджица	22
3918	с. Малево	22
3919	с. Малка Арда	22
3920	с. Малко Крушево	22
3921	с. Миле	22
3922	с. Милково	22
3923	с. Митовска	22
3924	с. Михалково	22
3925	с. Могилица	22
3926	с. Момчиловци	22
3927	с. Мочуре	22
3928	с. Мугла	22
3929	с. Мъглища	22
3930	с. Мързян	22
3931	с. Надарци	22
3932	с. Оглед	22
3933	с. Оградна	22
3934	с. Орехово	22
3935	с. Орешец	22
3936	с. Оряховец	22
3937	с. Осиково	22
3938	с. Остри пазлак	22
3939	с. Острица	22
3940	с. Павелско	22
3941	с. Петково	22
3942	с. Петров дол	22
3943	с. Печинска	22
3944	с. Пещера	22
3945	с. Писаница	22
3946	с. Планинско	22
3947	с. Планинци	22
3948	с. Пловдивци	22
3949	с. Подвис	22
3950	с. Полковник Серафимово	22
3951	с. Поляна	22
3952	с. Попрелка	22
3953	с. Потока	22
3954	с. Пресока	22
3955	с. Проглед	22
3956	с. Равнил	22
3957	с. Равнината	22
3958	с. Равнища	22
3959	с. Равно нивище	22
3960	с. Река	22
3961	с. Речани	22
3962	с. Рибен дол	22
3963	с. Рибница	22
3964	с. Ровина	22
3965	с. Рустан	22
3966	с. Селище	22
3967	с. Селча	22
3968	с. Сивино	22
3969	с. Славейно	22
3970	с. Сливка	22
3971	с. Сливово	22
3972	с. Смилян	22
3973	с. Соколовци	22
3974	с. Солища	22
3975	с. Сопотот	22
3976	с. Средец	22
3977	с. Средногорци	22
3978	с. Средок	22
3979	с. Стайчин дол	22
3980	с. Старцево	22
3981	с. Стикъл	22
3982	с. Стойките	22
3983	с. Стоманево	22
3984	с. Стража	22
3985	с. Страшимир	22
3986	с. Студена	22
3987	с. Студенец	22
3988	с. Стърница	22
3989	с. Сърнино	22
3990	с. Тешел	22
3991	с. Тикале	22
3992	с. Траве	22
3993	с. Требище	22
3994	с. Триград	22
3995	с. Турян	22
3996	с. Тънка бара	22
3997	с. Тънкото	22
3998	с. Търън	22
3999	с. Уручевци	22
4000	с. Ухловица	22
4001	с. Фабрика	22
4002	с. Фатово	22
4003	с. Хасовица	22
4004	с. Хвойна	22
4005	с. Цацаровци	22
4006	с. Цирка	22
4007	с. Црънча	22
4008	с. Чавдар	22
4009	с. Чала	22
4010	с. Чамла	22
4011	с. Чепинци	22
4012	с. Чеплетен	22
4013	с. Черешките	22
4014	с. Черешово	22
4015	с. Черешовска река	22
4016	с. Чокманово	22
4017	с. Чурка	22
4018	с. Чуруково	22
4019	с. Чучур	22
4020	с. Шаренска	22
4021	с. Широка лъка	22
4022	с. Ягодина	22
4023	гр. София	23
4024	гр. Банкя	23
4025	гр. Божурище	23
4026	гр. Ботевград	23
4027	гр. Бухово	23
4028	гр. Годеч	23
4029	гр. Долна баня	23
4030	гр. Драгоман	23
4031	гр. Елин Пелин	23
4032	гр. Етрополе	23
4033	гр. Златица	23
4034	гр. Ихтиман	23
4035	гр. Копривщица	23
4036	гр. Костенец	23
4037	гр. Костинброд	23
4038	гр. Момин проход	23
4039	гр. Нови Искър	23
4040	гр. Пирдоп	23
4041	гр. Правец	23
4042	гр. Самоков	23
4043	гр. Своге	23
4044	гр. Сливница	23
4045	с. Алдомировци	23
4046	с. Алино	23
4047	с. Антон	23
4048	с. Априлово	23
4049	с. Байлово	23
4050	с. Бакьово	23
4051	с. Балша	23
4052	с. Бальовци	23
4053	с. Банчовци	23
4054	с. Батулия	23
4055	с. Бахалин	23
4056	с. Безден	23
4057	с. Бели Искър	23
4058	с. Белица	23
4059	с. Белопопци	23
4060	с. Белчин	23
4061	с. Белчински бани	23
4062	с. Бенковски	23
4063	с. Беренде	23
4064	с. Беренде извор	23
4065	с. Бистрица	23
4066	с. Бов	23
4067	с. Богданлия	23
4068	с. Богдановци	23
4069	с. Богьовци	23
4070	с. Боерица	23
4071	с. Боженица	23
4072	с. Бойковец	23
4073	с. Борика	23
4074	с. Бракьовци	23
4075	с. Братушково	23
4076	с. Брезе	23
4077	с. Брезовдол	23
4078	с. Брестака	23
4079	с. Брусен	23
4080	с. Бузяковци	23
4081	с. Буковец	23
4082	с. Букоровци	23
4083	с. Буново	23
4084	с. Бусманци	23
4085	с. Бучин проход	23
4086	с. Бърдо	23
4087	с. Бърложница	23
4088	с. Бърля	23
4089	с. Вакарел	23
4090	с. Василовци	23
4091	с. Венковец	23
4092	с. Веринско	23
4093	с. Видраре	23
4094	с. Вишан	23
4095	с. Владая	23
4096	с. Владиславци	23
4097	с. Владо Тричков	23
4098	с. Войнеговци	23
4099	с. Волуяк	23
4100	с. Врачеш	23
4101	с. Връдловци	23
4102	с. Върбница	23
4103	с. Габер	23
4104	с. Габра	23
4105	с. Габровница	23
4106	с. Гайтанево	23
4107	с. Гара Елин Пелин	23
4108	с. Герман	23
4109	с. Гинци	23
4110	с. Говедарци	23
4111	с. Голак	23
4112	с. Голема Раковица	23
4113	с. Големо Малово	23
4114	с. Голеш	23
4115	с. Голяновци	23
4116	с. Горна Василица	23
4117	с. Горна Малина	23
4118	с. Горни Богров	23
4119	с. Горни Окол	23
4120	с. Горно Камарци	23
4121	с. Горно село	23
4122	с. Горунака	23
4123	с. Градец	23
4124	с. Григорево	23
4125	с. Грълска падина	23
4126	с. Губеш	23
4127	с. Губислав	23
4128	с. Гургулят	23
4129	с. Гурково	23
4130	с. Гурмазово	23
4131	с. Гуцал	23
4132	с. Гълъбовци	23
4133	с. Делян	23
4134	с. Джамузовци	23
4135	с. Джурово	23
4136	с. Добравица	23
4137	с. Доброславци	23
4138	с. Добърчин	23
4139	с. Доганово	23
4140	с. Долна Василица	23
4141	с. Долна Малина	23
4142	с. Долна Невля	23
4143	с. Долни Богров	23
4144	с. Долни Окол	23
4145	с. Долни Пасарел	23
4146	с. Долно Камарци	23
4147	с. Долно ново село	23
4148	с. Доспей	23
4149	с. Драговищица	23
4150	с. Драгоил	23
4151	с. Драготинци	23
4152	с. Драгушиново	23
4153	с. Дреатин	23
4154	с. Дреново	23
4155	с. Дружево	23
4156	с. Дръмша	23
4157	с. Душанци	23
4158	с. Еленов дол	23
4159	с. Елешница	23
4160	с. Елов дол	23
4161	с. Железница	23
4162	с. Желен	23
4163	с. Желява	23
4164	с. Живково	23
4165	с. Житен	23
4166	с. Завидовци	23
4167	с. Заноге	23
4168	с. Заселе	23
4169	с. Зимевица	23
4170	с. Златуша	23
4171	с. Злокучене	23
4172	с. Иваняне	23
4173	с. Извор	23
4174	с. Илинден	23
4175	с. Искрец	23
4176	с. Казичене	23
4177	с. Каленовци	23
4178	с. Калотина	23
4179	с. Калугерово	23
4180	с. Камбелевци	23
4181	с. Каменица	23
4182	с. Караполци	23
4183	с. Карлиево	23
4184	с. Клисура (Самоков)	23
4185	с. Клисура (София)	23
4186	с. Ковачевци	23
4187	с. Кокаляне	23
4188	с. Комщица	23
4189	с. Костадинкино	23
4190	с. Костенец	23
4191	с. Краево	23
4192	с. Кривина	23
4193	с. Круша	23
4194	с. Крушовица	23
4195	с. Кубратово	23
4196	с. Кътина	23
4197	с. Лакатник	23
4198	с. Левище	23
4199	с. Лесковдол	23
4200	с. Лесново	23
4201	с. Летница	23
4202	с. Липинци	23
4203	с. Липница	23
4204	с. Лисец	23
4205	с. Литаково	23
4206	с. Лозен	23
4207	с. Локорско	23
4208	с. Лопушня	23
4209	с. Лопян	23
4210	с. Луково	23
4211	с. Лъга	23
4212	с. Любница	23
4213	с. Маджаре	23
4214	с. Макоцево	23
4215	с. Мала Раковица	23
4216	с. Мала църква	23
4217	с. Малки Искър	23
4218	с. Мало Бучино	23
4219	с. Мало Малово	23
4220	с. Манаселска река	23
4221	с. Манастирище	23
4222	с. Марица	23
4223	с. Мечковци	23
4224	с. Миланово	23
4225	с. Мирково	23
4226	с. Мирово	23
4227	с. Мировяне	23
4228	с. Мрамор	23
4229	с. Мургаш	23
4230	с. Мусачево	23
4231	с. Мухово	23
4232	с. Мърчаево	23
4233	с. Начево	23
4234	с. Негован	23
4235	с. Негушево	23
4236	с. Неделище	23
4237	с. Нейкьовец	23
4238	с. Несла	23
4239	с. Новачене	23
4240	с. Нови хан	23
4241	с. Ново бърдо	23
4242	с. Ново село	23
4243	с. Огняново	23
4244	с. Огоя	23
4245	с. Опицвет	23
4246	с. Оплетня	23
4247	с. Оселна	23
4248	с. Осеновлаг	23
4249	с. Осиковица	23
4250	с. Осиковска Лакавица	23
4251	с. Осоица	23
4252	с. Очуша	23
4253	с. Пановци	23
4254	с. Панчарево	23
4255	с. Пауново	23
4256	с. Петково	23
4257	с. Петрич	23
4258	с. Петърч	23
4259	с. Пищане	23
4260	с. Плана	23
4261	с. Плъзище	23
4262	с. Повалиръж	23
4263	с. Подгорие	23
4264	с. Подгумер	23
4265	с. Пожарево	23
4266	с. Полянци	23
4267	с. Понор	23
4268	с. Поповци	23
4269	с. Поповяне	23
4270	с. Потоп	23
4271	с. Правешка Лакавица	23
4272	с. Прекръсте	23
4273	с. Преспа	23
4274	с. Продановци	23
4275	с. Пролеша	23
4276	с. Пчелин	23
4277	с. Равна	23
4278	с. Равнище	23
4279	с. Равно поле	23
4280	с. Радотина	23
4281	с. Радуил	23
4282	с. Радуловци	23
4283	с. Разбоище	23
4284	с. Разлив	23
4285	с. Райово	23
4286	с. Ракита	23
4287	с. Рашково	23
4288	с. Раяновци	23
4289	с. Реброво	23
4290	с. Редина	23
4291	с. Рельово	23
4292	с. Рибарица	23
4293	с. Ропот	23
4294	с. Росоман	23
4295	с. Ръжана	23
4296	с. Саранци	23
4297	с. Световрачене	23
4298	с. Свидня	23
4299	с. Своде	23
4300	с. Селянин	23
4301	с. Скравена	23
4302	с. Смолско	23
4303	с. Смолча	23
4304	с. Стамболово	23
4305	с. Станинци	23
4306	с. Столник	23
4307	с. Стъргел	23
4308	с. Табан	23
4309	с. Томпсън	23
4310	с. Трудовец	23
4311	с. Туден	23
4312	с. Хвърчил	23
4313	с. Хераково	23
4314	с. Храбърско	23
4315	с. Царичина	23
4316	с. Цацаровци	23
4317	с. Церецел	23
4318	с. Церово	23
4319	с. Цръклевци	23
4320	с. Църквище	23
4321	с. Чавдар	23
4322	с. Чеканец	23
4323	с. Чеканчево	23
4324	с. Челопеч	23
4325	с. Чепинци	23
4326	с. Чепърлинци	23
4327	с. Черковище	23
4328	с. Черньово	23
4329	с. Чибаовци	23
4330	с. Чорул	23
4331	с. Чуковезер	23
4332	с. Чурек	23
4333	с. Шипочане	23
4334	с. Широки дол	23
4335	с. Шума	23
4336	с. Ябланица	23
4337	с. Ялботина	23
4338	с. Ямна	23
4339	с. Яна	23
4340	с. Яребковица	23
4341	с. Ярлово	23
4342	гр. Стара Загора	24
4343	гр. Гурково	24
4344	гр. Гълъбово	24
4345	гр. Казанлък	24
4346	гр. Крън	24
4347	гр. Мъглиж	24
4348	гр. Николаево	24
4349	гр. Павел баня	24
4350	гр. Раднево	24
4351	гр. Чирпан	24
4352	гр. Шипка	24
4353	с. Александрово	24
4354	с. Априлово	24
4355	с. Арнаутито	24
4356	с. Асен	24
4357	с. Бащино	24
4358	с. Бели бряг	24
4359	с. Бенковски	24
4360	с. Богомилово	24
4361	с. Боздуганово	24
4362	с. Борилово	24
4363	с. Борово	24
4364	с. Борущица	24
4365	с. Братя Даскалови	24
4366	с. Братя Кунчеви	24
4367	с. Брестова	24
4368	с. Бузовград	24
4369	с. Бъдеще	24
4370	с. Българене	24
4371	с. Бънзарето	24
4372	с. Бял извор	24
4373	с. Бяло поле	24
4374	с. Васил Левски	24
4375	с. Великово	24
4376	с. Венец	24
4377	с. Верен	24
4378	с. Ветрен	24
4379	с. Виден	24
4380	с. Винарово	24
4381	с. Воденичарово	24
4382	с. Воловарово	24
4383	с. Габарево	24
4384	с. Гита	24
4385	с. Главан	24
4386	с. Гледачево	24
4387	с. Голям дол	24
4388	с. Голямо Дряново	24
4389	с. Горно Белево	24
4390	с. Горно Ботево	24
4391	с. Горно Изворово	24
4392	с. Горно ново село	24
4393	с. Горно Сахране	24
4394	с. Горно Черковище	24
4395	с. Гранит	24
4396	с. Даскал-Атанасово	24
4397	с. Дворище	24
4398	с. Димитриево	24
4399	с. Димовци	24
4400	с. Диня	24
4401	с. Долно изворово	24
4402	с. Долно ново село	24
4403	с. Долно Сахране	24
4404	с. Дунавци	24
4405	с. Дъбово	24
4406	с. Дълбоки	24
4407	с. Държава	24
4408	с. Държавен	24
4409	с. Едрево	24
4410	с. Еленино	24
4411	с. Елхово (Николаево)	24
4412	с. Елхово (Стара Загора)	24
4413	с. Енина	24
4414	с. Жерговец	24
4415	с. Жълтопоп	24
4416	с. Загоре	24
4417	с. Землен	24
4418	с. Зетьово	24
4419	с. Зимница	24
4420	с. Златирът	24
4421	с. Златна ливада	24
4422	с. Змейово	24
4423	с. Знаменосец	24
4424	с. Изворово	24
4425	с. Искрица	24
4426	с. Казанка	24
4427	с. Калитиново	24
4428	с. Калояновец	24
4429	с. Кирилово	24
4430	с. Княжевско	24
4431	с. Ковач	24
4432	с. Ковачево	24
4433	с. Козаревец	24
4434	с. Коларово	24
4435	с. Колена	24
4436	с. Колю Мариново	24
4437	с. Конаре	24
4438	с. Константиновец	24
4439	с. Копринка	24
4440	с. Кравино	24
4441	с. Кънчево	24
4442	с. Ловец	24
4443	с. Лозен	24
4444	с. Любеново	24
4445	с. Люляк	24
4446	с. Лява река	24
4447	с. Лясково	24
4448	с. Маджерито	24
4449	с. Малка Верея	24
4450	с. Малко Дряново	24
4451	с. Малко Кадиево	24
4452	с. Малко Тръново	24
4453	с. Малък дол	24
4454	с. Манолово	24
4455	с. Марково	24
4456	с. Маца	24
4457	с. Медникарово	24
4458	с. Медово	24
4459	с. Мирово	24
4460	с. Михайлово	24
4461	с. Могила	24
4462	с. Могилово	24
4463	с. Мусачево	24
4464	с. Мъдрец	24
4465	с. Найденово	24
4466	с. Нова махала	24
4467	с. Ново село	24
4468	с. Обручище	24
4469	с. Овощник	24
4470	с. Овчарци	24
4471	с. Опан	24
4472	с. Опълченец	24
4473	с. Оризово	24
4474	с. Оряховица	24
4475	с. Осетеново	24
4476	с. Осларка	24
4477	с. Остра могила	24
4478	с. Памукчии	24
4479	с. Паничерево	24
4480	с. Партизанин	24
4481	с. Петрово	24
4482	с. Плодовитово	24
4483	с. Плоска могила	24
4484	с. Подслон	24
4485	с. Полски Градец	24
4486	с. Помощник	24
4487	с. Православ	24
4488	с. Преславен	24
4489	с. Пряпорец	24
4490	с. Пчелиново	24
4491	с. Пшеничево	24
4492	с. Пъстрен	24
4493	с. Пъстрово	24
4494	с. Радунци	24
4495	с. Разделна	24
4496	с. Ракитница	24
4497	с. Рисиманово	24
4498	с. Розово	24
4499	с. Руманя	24
4500	с. Рупките	24
4501	с. Ръжена	24
4502	с. Самуилово	24
4503	с. Свобода	24
4504	с. Свободен	24
4505	с. Селце	24
4506	с. Скобелево	24
4507	с. Славянин	24
4508	с. Сладък кладенец	24
4509	с. Сливито	24
4510	с. Спасово	24
4511	с. Средец	24
4512	с. Средно градище	24
4513	с. Средногорово	24
4514	с. Старозагорски бани	24
4515	с. Столетово	24
4516	с. Стоян-Заимово	24
4517	с. Стрелец	24
4518	с. Сулица	24
4519	с. Съединение	24
4520	с. Сърневец	24
4521	с. Сърнево	24
4522	с. Тихомирово	24
4523	с. Тополяне	24
4524	с. Тракия	24
4525	с. Трояново	24
4526	с. Трънково	24
4527	с. Тулово	24
4528	с. Турия	24
4529	с. Тъжа	24
4530	с. Търничени	24
4531	с. Хаджидимитрово	24
4532	с. Хан Аспарухово	24
4533	с. Християново	24
4534	с. Хрищени	24
4535	с. Целина	24
4536	с. Ценово	24
4537	с. Черганово	24
4538	с. Черна гора	24
4539	с. Шаново	24
4540	с. Шейново	24
4541	с. Юлиево	24
4542	с. Яворовец	24
4543	с. Яворово	24
4544	с. Ягода	24
4545	с. Яздач	24
4546	с. Ясеново	24
4547	с. Ястребово	24
4548	гр. Търговище	25
4549	гр. Антоново	25
4550	гр. Омуртаг	25
4551	гр. Опака	25
4552	гр. Попово	25
4553	с. Алваново	25
4554	с. Александрово	25
4555	с. Априлово	25
4556	с. Баба Тонка	25
4557	с. Банковец	25
4558	с. Баячево	25
4559	с. Беломорци	25
4560	с. Берковски	25
4561	с. Бистра	25
4562	с. Богомолско	25
4563	с. Божурка	25
4564	с. Бракница	25
4565	с. Братово	25
4566	с. Буйново	25
4567	с. Букак	25
4568	с. Буховци	25
4569	с. Българаново	25
4570	с. Вардун	25
4571	с. Васил Левски	25
4572	с. Великденче	25
4573	с. Великовци	25
4574	с. Величка	25
4575	с. Вельово	25
4576	с. Веренци	25
4577	с. Веселец	25
4578	с. Висок	25
4579	с. Водица	25
4580	с. Врани кон	25
4581	с. Гагово	25
4582	с. Глашатай	25
4583	с. Глогинка	25
4584	с. Голямо градище	25
4585	с. Голямо Доляне	25
4586	с. Голямо ново	25
4587	с. Голямо Соколово	25
4588	с. Голямо църквище	25
4589	с. Горица	25
4590	с. Горна Златица	25
4591	с. Горна Кабда	25
4592	с. Горна Хубавка	25
4593	с. Горно Козарево	25
4594	с. Горно Новково	25
4595	с. Горско Абланово	25
4596	с. Горско село	25
4597	с. Градинка	25
4598	с. Греевци	25
4599	с. Гърчиново	25
4600	с. Давидово	25
4601	с. Девино	25
4602	с. Длъжка поляна	25
4603	с. Добротица	25
4604	с. Долец	25
4605	с. Долна Златица	25
4606	с. Долна Кабда	25
4607	с. Долна Хубавка	25
4608	с. Долно Козарево	25
4609	с. Долно Новково	25
4610	с. Драгановец	25
4611	с. Дралфа	25
4612	с. Дриново	25
4613	с. Дъбравица	25
4614	с. Дългач	25
4615	с. Еленово	25
4616	с. Железари	25
4617	с. Заветно	25
4618	с. Зараево	25
4619	с. Захари Стояново	25
4620	с. Звезда	25
4621	с. Звездица	25
4622	с. Здравец	25
4623	с. Зелена морава	25
4624	с. Змейно	25
4625	с. Иванча	25
4626	с. Изворово	25
4627	с. Илийно	25
4628	с. Калнище	25
4629	с. Камбурово	25
4630	с. Капище	25
4631	с. Кардам	25
4632	с. Кестеново	25
4633	с. Китино	25
4634	с. Ковачевец	25
4635	с. Козица	25
4636	с. Козма презвитер	25
4637	с. Конак	25
4638	с. Коноп	25
4639	с. Копрец	25
4640	с. Кошничари	25
4641	с. Крайполе	25
4642	с. Кралево	25
4643	с. Красноселци	25
4644	с. Крепча	25
4645	с. Крушолак	25
4646	с. Кръшно	25
4647	с. Къпинец	25
4648	с. Кьосевци	25
4649	с. Лиляк	25
4650	с. Ловец	25
4651	с. Ломци	25
4652	с. Любичево	25
4653	с. Люблен	25
4654	с. Макариополско	25
4655	с. Маково	25
4656	с. Малка Черковна	25
4657	с. Малоградец	25
4658	с. Манастирица	25
4659	с. Манушевци	25
4660	с. Марчино	25
4661	с. Медовина	25
4662	с. Мечово	25
4663	с. Миладиновци	25
4664	с. Милино	25
4665	с. Мировец	25
4666	с. Могилец	25
4667	с. Момино	25
4668	с. Моравица	25
4669	с. Моравка	25
4670	с. Надарево	25
4671	с. Обител	25
4672	с. Овчарово	25
4673	с. Орач	25
4674	с. Осен	25
4675	с. Осиково	25
4676	с. Острец	25
4677	с. Пайдушко	25
4678	с. Паламарца	25
4679	с. Панайот Хитово	25
4680	с. Паничино	25
4681	с. Певец	25
4682	с. Петрино	25
4683	с. Пиринец	25
4684	с. Плъстина	25
4685	с. Подгорица	25
4686	с. Помощица	25
4687	с. Поройно	25
4688	с. Посабина	25
4689	с. Преселец	25
4690	с. Пресиян	25
4691	с. Пресяк	25
4692	с. Присойна	25
4693	с. Пробуда	25
4694	с. Пролаз	25
4695	с. Птичево	25
4696	с. Пчелно	25
4697	с. Пъдарино	25
4698	с. Първан	25
4699	с. Равно село	25
4700	с. Разбойна	25
4701	с. Разделци	25
4702	с. Ралица	25
4703	с. Росина	25
4704	с. Росица	25
4705	с. Руец	25
4706	с. Рътлина	25
4707	с. Садина	25
4708	с. Светлен	25
4709	с. Свирчово	25
4710	с. Свободица	25
4711	с. Семерци	25
4712	с. Славяново	25
4713	с. Слънчовец	25
4714	с. Станец	25
4715	с. Стара речка	25
4716	с. Старчище	25
4717	с. Стеврек	25
4718	с. Стойново	25
4719	с. Стража	25
4720	с. Стройновци	25
4721	с. Съединение	25
4722	с. Таймище	25
4723	с. Твърдинци	25
4724	с. Тиховец	25
4725	с. Трескавец	25
4726	с. Тръстика	25
4727	с. Тъпчилещово	25
4728	с. Търновца	25
4729	с. Угледно	25
4730	с. Халваджийско	25
4731	с. Цар Асен	25
4732	с. Царевци	25
4733	с. Цветница	25
4734	с. Церовище	25
4735	с. Чеканци	25
4736	с. Черковна	25
4737	с. Черна вода	25
4738	с. Черни бряг	25
4739	с. Чернокапци	25
4740	с. Шишковица	25
4741	с. Язовец	25
4742	с. Яребично	25
4743	с. Ястребино	25
4744	гр. Хасково	26
4745	гр. Димитровград	26
4746	гр. Ивайловград	26
4747	гр. Любимец	26
4748	гр. Маджарово	26
4749	гр. Меричлери	26
4750	гр. Свиленград	26
4751	гр. Симеоновград	26
4752	гр. Тополовград	26
4753	гр. Харманли	26
4754	с. Александрово	26
4755	с. Ангел войвода	26
4756	с. Балкан	26
4757	с. Бели дол	26
4758	с. Белица	26
4759	с. Белополци	26
4760	с. Белополяне	26
4761	с. Бисер	26
4762	с. Богомил	26
4763	с. Бодрово	26
4764	с. Болярски извор	26
4765	с. Бориславци	26
4766	с. Ботурче	26
4767	с. Боян Ботево	26
4768	с. Браница	26
4769	с. Брод	26
4770	с. Брусевци	26
4771	с. Брусино	26
4772	с. Брягово	26
4773	с. Бряст	26
4774	с. Брястово	26
4775	с. Бубино	26
4776	с. Българин	26
4777	с. Българска поляна	26
4778	с. Бял кладенец	26
4779	с. Бялградец	26
4780	с. Варник	26
4781	с. Васково	26
4782	с. Великан	26
4783	с. Ветрушка	26
4784	с. Винево	26
4785	с. Вис	26
4786	с. Владимирово	26
4787	с. Воден	26
4788	с. Воденци	26
4789	с. Войводенец	26
4790	с. Войводово	26
4791	с. Въгларово	26
4792	с. Вълче поле	26
4793	с. Върбица	26
4794	с. Върбово	26
4795	с. Габерово	26
4796	с. Гарваново	26
4797	с. Генералово	26
4798	с. Георги Добрево	26
4799	с. Гледка	26
4800	с. Глумово	26
4801	с. Гнездаре	26
4802	с. Големанци	26
4803	с. Голобрадово	26
4804	с. Голям извор	26
4805	с. Голяма долина	26
4806	с. Голямо Асеново	26
4807	с. Горни Главанак	26
4808	с. Горно Войводино	26
4809	с. Горно Луково	26
4810	с. Горно поле	26
4811	с. Горноселци	26
4812	с. Горски извор	26
4813	с. Горско	26
4814	с. Гугутка	26
4815	с. Гълъбец	26
4816	с. Дервишка могила	26
4817	с. Димитровче	26
4818	с. Динево	26
4819	с. Длъгнево	26
4820	с. Добрич	26
4821	с. Доброселец	26
4822	с. Долни Главанак	26
4823	с. Долно Белево	26
4824	с. Долно Ботево	26
4825	с. Долно Войводино	26
4826	с. Долно Големанци	26
4827	с. Долно Луково	26
4828	с. Долно поле	26
4829	с. Долно Съдиево	26
4830	с. Долно Черковище	26
4831	с. Долноселци	26
4832	с. Доситеево	26
4833	с. Драбишна	26
4834	с. Дрипчево	26
4835	с. Дряново	26
4836	с. Дъбовец	26
4837	с. Елена	26
4838	с. Ефрем	26
4839	с. Железари	26
4840	с. Железино	26
4841	с. Жълти бряг	26
4842	с. Здравец	26
4843	с. Зимовина	26
4844	с. Златополе	26
4845	с. Златоустово	26
4846	с. Зорница	26
4847	с. Иваново	26
4848	с. Изворово	26
4849	с. Йерусалимово	26
4850	с. Казак	26
4851	с. Калугерово	26
4852	с. Каменна река	26
4853	с. Камилски дол	26
4854	с. Капитан Андреево	26
4855	с. Капитан Петко войвода	26
4856	с. Караманци	26
4857	с. Карловско	26
4858	с. Каснаково	26
4859	с. Кладенец	26
4860	с. Клокотница	26
4861	с. Книжовник	26
4862	с. Княжево	26
4863	с. Кобилино	26
4864	с. Козлец	26
4865	с. Коларово	26
4866	с. Колец	26
4867	с. Кондово	26
4868	с. Конници	26
4869	с. Константиново	26
4870	с. Конуш	26
4871	с. Корен	26
4872	с. Костилково	26
4873	с. Костур	26
4874	с. Кралево	26
4875	с. Крепост	26
4876	с. Криво поле	26
4877	с. Крум	26
4878	с. Ламбух	26
4879	с. Левка	26
4880	с. Ленско	26
4881	с. Лешниково	26
4882	с. Лисово	26
4883	с. Лозен	26
4884	с. Любеново	26
4885	с. Лясковец	26
4886	с. Маджари	26
4887	с. Малево	26
4888	с. Малки Воден	26
4889	с. Малко Асеново	26
4890	с. Малко Брягово	26
4891	с. Малко градище	26
4892	с. Малко Попово	26
4893	с. Малък извор	26
4894	с. Манастир	26
4895	с. Мандра	26
4896	с. Мандрица	26
4897	с. Маслиново	26
4898	с. Маточина	26
4899	с. Меден бук	26
4900	с. Мезек	26
4901	с. Минерални бани	26
4902	с. Михалич	26
4903	с. Младиново	26
4904	с. Момино	26
4905	с. Момково	26
4906	с. Мрамор	26
4907	с. Мустрак	26
4908	с. Навъсен	26
4909	с. Надежден	26
4910	с. Николово	26
4911	с. Нова ливада	26
4912	с. Нова Надежда	26
4913	с. Овчарово	26
4914	с. Одринци	26
4915	с. Орешец	26
4916	с. Орешино	26
4917	с. Орешник	26
4918	с. Орлов дол	26
4919	с. Орлово	26
4920	с. Оряхово	26
4921	с. Остър камък	26
4922	с. Пашкул	26
4923	с. Пашово	26
4924	с. Планинец	26
4925	с. Планиново	26
4926	с. Плевун	26
4927	с. Подкрепа	26
4928	с. Покрован	26
4929	с. Поляново	26
4930	с. Поповец	26
4931	с. Попско	26
4932	с. Преславец	26
4933	с. Присадец	26
4934	с. Пчелари	26
4935	с. Пъстрогор	26
4936	с. Пъстроок	26
4937	с. Пътниково	26
4938	с. Пясъчево	26
4939	с. Рабово	26
4940	с. Равна гора	26
4941	с. Радиево	26
4942	с. Радовец	26
4943	с. Райкова могила	26
4944	с. Райново	26
4945	с. Рогозиново	26
4946	с. Родопи	26
4947	с. Розино	26
4948	с. Румелия	26
4949	с. Ръженово	26
4950	с. Сакарци	26
4951	с. Сборино	26
4952	с. Светлина (Димитровград)	26
4953	с. Светлина (Тополовград)	26
4954	с. Светослав	26
4955	с. Свирачи	26
4956	с. Свирково	26
4957	с. Селска поляна	26
4958	с. Сеноклас	26
4959	с. Сив кладенец	26
4960	с. Сива река	26
4961	с. Силен	26
4962	с. Синапово	26
4963	с. Сираково	26
4964	с. Скобелево	26
4965	с. Славеево	26
4966	с. Славяново	26
4967	с. Сладун	26
4968	с. Смирненци	26
4969	с. Соколенци	26
4970	с. Спахиево	26
4971	с. Срем	26
4972	с. Сталево	26
4973	с. Стамболийски	26
4974	с. Стамболово	26
4975	с. Стойково	26
4976	с. Странско	26
4977	с. Студена	26
4978	с. Сусам	26
4979	с. Сърница	26
4980	с. Татарево	26
4981	с. Текето	26
4982	с. Тополово	26
4983	с. Тракиец	26
4984	с. Троян	26
4985	с. Тънково	26
4986	с. Тянево	26
4987	с. Узунджово	26
4988	с. Устрем	26
4989	с. Филипово	26
4990	с. Хлябово	26
4991	с. Хухла	26
4992	с. Царева поляна	26
4993	с. Черепово	26
4994	с. Черна могила	26
4995	с. Черни рид	26
4996	с. Черничино	26
4997	с. Черногорово	26
4998	с. Чернодъб	26
4999	с. Чукарово	26
5000	с. Чучулига	26
5001	с. Широка поляна	26
5002	с. Шишманово	26
5003	с. Щит	26
5004	с. Ябълково	26
5005	гр. Шумен	27
5006	гр. Велики Преслав	27
5007	гр. Върбица	27
5008	гр. Каолиново	27
5009	гр. Каспичан	27
5010	гр. Нови пазар	27
5011	гр. Плиска	27
5012	гр. Смядово	27
5013	с. Александрово	27
5014	с. Байково	27
5015	с. Беджене	27
5016	с. Белокопитово	27
5017	с. Благово	27
5018	с. Близнаци	27
5019	с. Божурово	27
5020	с. Борци	27
5021	с. Боян	27
5022	с. Браничево	27
5023	с. Буйновица	27
5024	с. Бял бряг	27
5025	с. Бяла река	27
5026	с. Васил Друмев	27
5027	с. Векилски	27
5028	с. Велино	27
5029	с. Венец	27
5030	с. Веселиново	27
5031	с. Ветрище	27
5032	с. Вехтово	27
5033	с. Висока поляна	27
5034	с. Войвода	27
5035	с. Вълнари	27
5036	с. Върбак	27
5037	с. Върбяне	27
5038	с. Габрица	27
5039	с. Градище	27
5040	с. Гусла	27
5041	с. Денница	27
5042	с. Дибич	27
5043	с. Длъжко	27
5044	с. Добри Войниково	27
5045	с. Дойранци	27
5046	с. Долина	27
5047	с. Драгоево	27
5048	с. Дренци	27
5049	с. Друмево	27
5050	с. Единаковци	27
5051	с. Енево	27
5052	с. Желъд	27
5053	с. Живково	27
5054	с. Жилино	27
5055	с. Загориче	27
5056	с. Зайчино ореше	27
5057	с. Звегор	27
5058	с. Златар	27
5059	с. Златна нива	27
5060	с. Иваново	27
5061	с. Ивански	27
5062	с. Иглика	27
5063	с. Избул	27
5064	с. Изгрев	27
5065	с. Илия Блъсково	27
5066	с. Имренчево	27
5067	с. Калино	27
5068	с. Каменяк	27
5069	с. Капитан Петко	27
5070	с. Каравелово	27
5071	с. Каспичан	27
5072	с. Кладенец	27
5073	с. Климент	27
5074	с. Конево	27
5075	с. Коньовец	27
5076	с. Косово	27
5077	с. Костена река	27
5078	с. Кочово	27
5079	с. Крайгорци	27
5080	с. Красен дол	27
5081	с. Крива река	27
5082	с. Кълново	27
5083	с. Кьолмен	27
5084	с. Кюлевча	27
5085	с. Лиси връх	27
5086	с. Ловец	27
5087	с. Лозево	27
5088	с. Лятно	27
5089	с. Мадара	27
5090	с. Маломир	27
5091	с. Мараш	27
5092	с. Марково	27
5093	с. Менгишево	27
5094	с. Методиево	27
5095	с. Миланово	27
5096	с. Мировци	27
5097	с. Могила	27
5098	с. Мокреш	27
5099	с. Мостич	27
5100	с. Наум	27
5101	с. Никола Козлево	27
5102	с. Нова бяла река	27
5103	с. Ново Янково	27
5104	с. Новосел	27
5105	с. Овчарово	27
5106	с. Омарчево	27
5107	с. Осеновец	27
5108	с. Осмар	27
5109	с. Памукчии	27
5110	с. Панайот Волово	27
5111	с. Пет могили	27
5112	с. Писарево	27
5113	с. Правенци	27
5114	с. Преселка	27
5115	с. Пристое	27
5116	с. Радко Димитриево	27
5117	с. Развигорово	27
5118	с. Риш	27
5119	с. Ружица	27
5120	с. Салманово	27
5121	с. Сечище	27
5122	с. Сини вир	27
5123	с. Сливак	27
5124	с. Средковец	27
5125	с. Средня	27
5126	с. Стан	27
5127	с. Становец	27
5128	с. Станянци	27
5129	с. Стоян Михайловски	27
5130	с. Страхилица	27
5131	с. Струино	27
5132	с. Студеница	27
5133	с. Суха река	27
5134	с. Сушина	27
5135	с. Тервел	27
5136	с. Тимарево	27
5137	с. Тодор Икономово	27
5138	с. Трем	27
5139	с. Троица	27
5140	с. Тръница	27
5141	с. Тушовица	27
5142	с. Тъкач	27
5143	с. Хан Крум	27
5144	с. Хитрино	27
5145	с. Хърсово	27
5146	с. Цани Гинчево	27
5147	с. Царев брод	27
5148	с. Църквица	27
5149	с. Черенча	27
5150	с. Черна	27
5151	с. Черни връх	27
5152	с. Черноглавци	27
5153	с. Чернооково	27
5154	с. Янково	27
5155	с. Ясенково	27
5156	гр. Ямбол	28
5157	гр. Болярово	28
5158	гр. Елхово	28
5159	гр. Стралджа	28
5160	с. Александрово	28
5161	с. Асеново	28
5162	с. Атолово	28
5163	с. Безмер	28
5164	с. Богорово	28
5165	с. Болярско	28
5166	с. Борисово	28
5167	с. Ботево	28
5168	с. Бояджик	28
5169	с. Бояново	28
5170	с. Веселиново	28
5171	с. Видинци	28
5172	с. Воден	28
5173	с. Воденичане	28
5174	с. Войника	28
5175	с. Вълча поляна	28
5176	с. Вълчи извор	28
5177	с. Генерал Инзово	28
5178	с. Генерал Тошево	28
5179	с. Голям Дервент	28
5180	с. Голям манастир	28
5181	с. Голямо Крушево	28
5182	с. Горска поляна	28
5183	с. Гранитово	28
5184	с. Гълъбинци	28
5185	с. Денница	28
5186	с. Джинот	28
5187	с. Добрич	28
5188	с. Дражево	28
5189	с. Драма	28
5190	с. Дряново	28
5191	с. Дъбово	28
5192	с. Жребино	28
5193	с. Завой	28
5194	с. Зимница	28
5195	с. Златари	28
5196	с. Златиница	28
5197	с. Иглика	28
5198	с. Изгрев	28
5199	с. Иречеково	28
5200	с. Кабиле	28
5201	с. Калчево	28
5202	с. Камен връх	28
5203	с. Каменец	28
5204	с. Каравелово	28
5205	с. Кирилово	28
5206	с. Козарево	28
5207	с. Коневец	28
5208	с. Крайново	28
5209	с. Крумово	28
5210	с. Кукорево	28
5211	с. Лалково	28
5212	с. Лесово	28
5213	с. Леярово	28
5214	с. Лозенец	28
5215	с. Люлин	28
5216	с. Маленово	28
5217	с. Малко Кирилово	28
5218	с. Малко Шарково	28
5219	с. Маломир	28
5220	с. Маломирово	28
5221	с. Малък манастир	28
5222	с. Мамарчево	28
5223	с. Меден кладенец	28
5224	с. Межда	28
5225	с. Мелница	28
5226	с. Миладиновци	28
5227	с. Могила	28
5228	с. Недялско	28
5229	с. Овчи кладенец	28
5230	с. Окоп	28
5231	с. Оман	28
5232	с. Палаузово	28
5233	с. Победа	28
5234	с. Поляна	28
5235	с. Попово	28
5236	с. Правдино	28
5237	с. Пчела	28
5238	с. Първенец	28
5239	с. Раздел	28
5240	с. Робово	28
5241	с. Роза	28
5242	с. Ружица	28
5243	с. Савино	28
5244	с. Саранско	28
5245	с. Симеоново	28
5246	с. Ситово	28
5247	с. Скалица	28
5248	с. Славейково	28
5249	с. Сламино	28
5250	с. Стара река	28
5251	с. Стефан Караджово	28
5252	с. Странджа	28
5253	с. Стройно	28
5254	с. Тамарино	28
5255	с. Тенево	28
5256	с. Трънково	28
5257	с. Търнава	28
5258	с. Хаджидимитрово	28
5259	с. Ханово	28
5260	с. Чарган	28
5261	с. Чарда	28
5262	с. Челник	28
5263	с. Чернозем	28
5264	с. Шарково	28
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, role_id, email, first_name, phone, password) FROM stdin;
1	1	admin@admin.com	Admin	08 88 888 888	sha256$EtzCXoncpmeqTObc$36bf071cbf6c02ce5a8198b0adfd2e9801bdc35a0f4280bc5552358916c9cdc1
2	2	steveclark@example.com	Philip Lewis Jr.	08 88 888 888	sha256$gIqDhBCUaAFbpPuc$a6031ef8fc6a0868bd5c0ca2b4fa372a57ece125b3d96335a059df56b398cfb1
3	2	powerscatherine@example.com	Katie Wallace	08 88 888 888	sha256$p6WOvlNrToIgUWAg$53317d8ed66622d6b169f0910d2ccc29ed2d5ceb9f6354b5c0a572023a321678
4	2	mcamacho@example.org	Brett Gonzalez	08 88 888 888	sha256$LGK9Qnu9h3axu8p1$9430e5076c2002cacd6da446597b307e3712b3c8c416cc190f9df17064ee182e
5	2	hooverluke@example.net	David Perry	08 88 888 888	sha256$zqOSxJFhKR1C045x$11ca5749448729899c31a4c2bd09b7d9b83b1df93643c4b04e4061b0e9b60d11
6	2	lisacoleman@example.org	Clinton Brown	08 88 888 888	sha256$ZVNXcb37jM1aYUh3$429a1f5b11fdbacd3dbc11468bb8139941bee761d29263cff3863fd0808c42a6
7	2	andrew41@example.org	Victoria Cervantes	08 88 888 888	sha256$0UgwXQudfdobzhgm$1133e0b365566a3036101c60d4b4f54c265c5d8fec011fa64be5f2a77930dec3
8	2	piercesydney@example.org	Crystal Morales	08 88 888 888	sha256$l69xAU2VkI6kAoYi$be728c3c551551ea605b056e4a0b06a816773b3d819fa0457bce221961336988
9	2	brandysaunders@example.net	Taylor Jackson	08 88 888 888	sha256$cYZSF2tFzsijp6S7$972e6db0fd9a951a3fe213154ade8b36a8f3332d78a9f6fa4fcb439b920a0507
10	2	davisearl@example.org	Larry Marshall	08 88 888 888	sha256$uAmTcHQLAvq7jxLH$5228438f7bcf0021abdb11edd3e391a743fd9a67cbddba99f33eac897d00101e
\.


--
-- Data for Name: vehicle_ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_ads (id, model_id, make_id, fuel_type_id, settlement_id, publisher_id, car_body_configuration_id, eco_standart_id, gearbox_id, color_id, manufacture_year, hp, price, mileage, modification, description, image_names, views, is_approved, created_at, updated_at) FROM stdin;
1	95	10	4	706	3	8	5	2	12	2015	210	19000	85000	1.8 I	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg"]	0	t	2023-02-21 21:34:06.352008	2023-02-21 21:34:06.352008
2	208	12	1	792	5	8	5	2	4	2013	170	15000	99000	2.0 I	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg"]	0	t	2023-02-21 21:34:06.49079	2023-02-21 21:34:06.49079
3	409	25	3	86	5	8	5	1	1	2011	140	12000	160000	2.0 HDI	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg"]	0	t	2023-02-21 21:34:06.739798	2023-02-21 21:34:06.739798
4	463	30	3	485	6	2	5	1	15	2021	90	19000	30000	1.5 DCI	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg"]	0	t	2023-02-21 21:34:07.02339	2023-02-21 21:34:07.02339
5	1259	85	3	773	3	8	5	3	15	2015	160	22000	180000	2.2 CDI	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]	0	t	2023-02-21 21:34:07.270657	2023-02-21 21:34:07.270657
6	1259	85	3	202	7	8	6	2	15	2019	220	32000	50000	2.7 CDI	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg"]	0	t	2023-02-21 21:34:07.51081	2023-02-21 21:34:07.51081
7	1377	85	1	22	6	8	6	3	15	2021	500	90000	15000	CL 500	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]	0	t	2023-02-21 21:34:07.825996	2023-02-21 21:34:07.825996
8	1377	85	1	109	3	3	6	2	12	2020	425	70000	35000	CLA 45 AMG	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]	0	t	2023-02-21 21:34:08.097344	2023-02-21 21:34:08.097344
9	1614	97	3	455	6	1	6	2	12	2020	90	25000	20000	1.6 HDI	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]	0	t	2023-02-21 21:34:08.390952	2023-02-21 21:34:08.390952
10	1614	97	3	341	7	1	6	2	4	2020	75	23000	20000	1.4 HDI	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg"]	0	t	2023-02-21 21:34:08.719432	2023-02-21 21:34:08.719432
11	1620	97	3	864	4	1	3	1	12	2005	136	4500	200000	2.0 HDI	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]	0	t	2023-02-21 21:34:08.961133	2023-02-21 21:34:08.961133
12	1621	97	3	701	3	1	6	3	12	2020	170	21000	30000	2.0 HDI	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg"]	0	t	2023-02-21 21:34:09.141383	2023-02-21 21:34:09.141383
13	1634	97	3	651	6	8	4	2	4	2021	170	28000	15000	2.0 HDI	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg"]	0	t	2023-02-21 21:34:09.395786	2023-02-21 21:34:09.395786
14	1747	106	1	218	2	1	6	1	8	2021	360	50000	25000	2.0 I RS	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg"]	0	t	2023-02-21 21:34:09.609268	2023-02-21 21:34:09.609268
15	2079	139	3	489	2	4	3	1	13	2005	110	5000	240000	1.9 TDI	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg"]	0	t	2023-02-21 21:34:09.824231	2023-02-21 21:34:09.824231
16	2079	139	3	13	5	4	6	2	8	2022	190	65000	25000	1.9 TDI	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]	0	t	2023-02-21 21:34:10.055172	2023-02-21 21:34:10.055172
17	2092	139	3	752	5	2	6	2	1	2022	390	95000	20000	3.0 TDI	Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.	["1.jpg", "2.jpg", "3.jpg", "4.jpg"]	0	t	2023-02-21 21:34:10.296026	2023-02-21 21:34:10.296026
\.


--
-- Data for Name: vehicle_extra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_extra (vehicle_ad_id, extra_id) FROM stdin;
1	8
1	6
1	1
1	22
1	18
1	16
1	14
1	39
1	25
1	41
2	8
2	6
2	1
2	20
2	13
2	30
2	29
2	25
3	7
3	4
3	1
3	17
3	15
3	14
3	40
3	38
3	32
3	31
4	11
4	4
4	1
4	23
4	19
4	15
4	14
4	39
4	34
4	44
5	9
5	5
5	1
5	23
5	16
5	15
5	13
5	36
5	25
5	45
6	10
6	9
6	5
6	1
6	21
6	37
6	32
6	28
6	26
7	10
7	9
7	4
7	1
7	13
7	37
7	30
7	26
7	24
7	44
8	11
8	10
8	5
8	1
8	17
8	15
8	34
8	30
8	44
9	10
9	6
9	1
9	21
9	15
9	38
9	31
9	30
9	26
10	11
10	5
10	1
10	23
10	22
10	18
10	14
10	28
10	41
11	10
11	7
11	4
11	1
11	22
11	19
11	18
11	33
11	43
12	9
12	4
12	1
12	13
12	32
12	28
12	26
12	25
12	24
13	7
13	6
13	1
13	18
13	13
13	29
13	27
13	26
13	25
13	24
14	10
14	4
14	1
14	16
14	31
14	26
14	44
15	9
15	6
15	1
15	23
15	22
15	18
15	14
15	28
15	27
15	43
16	7
16	5
16	1
16	20
16	17
16	14
16	33
16	30
16	27
17	10
17	9
17	5
17	1
17	21
17	19
17	35
17	30
17	28
17	25
\.


--
-- Name: car_body_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_body_configurations_id_seq', 10, true);


--
-- Name: colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colors_id_seq', 20, true);


--
-- Name: eco_standarts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eco_standarts_id_seq', 6, true);


--
-- Name: extras_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.extras_categories_id_seq', 8, true);


--
-- Name: extras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.extras_id_seq', 80, true);


--
-- Name: fuel_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fuel_types_id_seq', 6, true);


--
-- Name: gearboxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gearboxes_id_seq', 3, true);


--
-- Name: makes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.makes_id_seq', 152, true);


--
-- Name: models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.models_id_seq', 2186, true);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_id_seq', 28, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- Name: settlements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settlements_id_seq', 5264, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: vehicle_ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_ads_id_seq', 17, true);


--
-- Name: car_body_configurations car_body_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_body_configurations
    ADD CONSTRAINT car_body_configurations_pkey PRIMARY KEY (id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: eco_standarts eco_standarts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eco_standarts
    ADD CONSTRAINT eco_standarts_pkey PRIMARY KEY (id);


--
-- Name: extras_categories extras_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extras_categories
    ADD CONSTRAINT extras_categories_pkey PRIMARY KEY (id);


--
-- Name: extras extras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extras
    ADD CONSTRAINT extras_pkey PRIMARY KEY (id);


--
-- Name: fuel_types fuel_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuel_types
    ADD CONSTRAINT fuel_types_pkey PRIMARY KEY (id);


--
-- Name: gearboxes gearboxes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gearboxes
    ADD CONSTRAINT gearboxes_pkey PRIMARY KEY (id);


--
-- Name: makes makes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.makes
    ADD CONSTRAINT makes_pkey PRIMARY KEY (id);


--
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: settlements settlements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settlements
    ADD CONSTRAINT settlements_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vehicle_ads vehicle_ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_ads
    ADD CONSTRAINT vehicle_ads_pkey PRIMARY KEY (id);


--
-- Name: extras extras_extra_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extras
    ADD CONSTRAINT extras_extra_category_id_fkey FOREIGN KEY (extra_category_id) REFERENCES public.extras_categories(id);


--
-- Name: models models_make_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_make_id_fkey FOREIGN KEY (make_id) REFERENCES public.makes(id);


--
-- Name: settlements settlements_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settlements
    ADD CONSTRAINT settlements_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: vehicle_ads vehicle_ads_car_body_configuration_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_ads
    ADD CONSTRAINT vehicle_ads_car_body_configuration_id_fkey FOREIGN KEY (car_body_configuration_id) REFERENCES public.car_body_configurations(id);


--
-- Name: vehicle_ads vehicle_ads_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_ads
    ADD CONSTRAINT vehicle_ads_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.colors(id);


--
-- Name: vehicle_ads vehicle_ads_eco_standart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_ads
    ADD CONSTRAINT vehicle_ads_eco_standart_id_fkey FOREIGN KEY (eco_standart_id) REFERENCES public.eco_standarts(id);


--
-- Name: vehicle_ads vehicle_ads_fuel_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_ads
    ADD CONSTRAINT vehicle_ads_fuel_type_id_fkey FOREIGN KEY (fuel_type_id) REFERENCES public.fuel_types(id);


--
-- Name: vehicle_ads vehicle_ads_gearbox_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_ads
    ADD CONSTRAINT vehicle_ads_gearbox_id_fkey FOREIGN KEY (gearbox_id) REFERENCES public.gearboxes(id);


--
-- Name: vehicle_ads vehicle_ads_make_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_ads
    ADD CONSTRAINT vehicle_ads_make_id_fkey FOREIGN KEY (make_id) REFERENCES public.makes(id);


--
-- Name: vehicle_ads vehicle_ads_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_ads
    ADD CONSTRAINT vehicle_ads_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.models(id);


--
-- Name: vehicle_ads vehicle_ads_publisher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_ads
    ADD CONSTRAINT vehicle_ads_publisher_id_fkey FOREIGN KEY (publisher_id) REFERENCES public.users(id);


--
-- Name: vehicle_ads vehicle_ads_settlement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_ads
    ADD CONSTRAINT vehicle_ads_settlement_id_fkey FOREIGN KEY (settlement_id) REFERENCES public.settlements(id);


--
-- Name: vehicle_extra vehicle_extra_extra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_extra
    ADD CONSTRAINT vehicle_extra_extra_id_fkey FOREIGN KEY (extra_id) REFERENCES public.extras(id);


--
-- Name: vehicle_extra vehicle_extra_vehicle_ad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_extra
    ADD CONSTRAINT vehicle_extra_vehicle_ad_id_fkey FOREIGN KEY (vehicle_ad_id) REFERENCES public.vehicle_ads(id);


--
-- PostgreSQL database dump complete
--


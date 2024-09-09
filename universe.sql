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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: black_hole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer,
    type text NOT NULL
);


ALTER TABLE public.black_hole OWNER TO postgres;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNER TO postgres;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    name character varying(40) NOT NULL,
    surface_temperature_k integer,
    center_temperature_k integer,
    volume_in_earths numeric,
    primary_element text,
    visible_without_telescope boolean NOT NULL,
    in_habitable_zone boolean NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    name character varying(40) NOT NULL,
    surface_temperature_k integer,
    center_temperature_k integer,
    volume_in_earths numeric,
    primary_element text,
    visible_without_telescope boolean NOT NULL,
    in_habitable_zone boolean NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    name character varying(40) NOT NULL,
    surface_temperature_k integer,
    center_temperature_k integer,
    volume_in_earths numeric,
    primary_element text,
    visible_without_telescope boolean NOT NULL,
    in_habitable_zone boolean NOT NULL,
    planet_id integer NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    name character varying(40) NOT NULL,
    surface_temperature_k integer,
    center_temperature_k integer,
    volume_in_earths numeric,
    primary_element text,
    visible_without_telescope boolean NOT NULL,
    in_habitable_zone boolean NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.black_hole (black_hole_id, name, galaxy_id, type) FROM stdin;
1	Sag A*	1	Supermassive Black Hole
2	RX J1131-1231	\N	Supermassive black hole
3	TON 618	\N	Supermassive black hole
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.galaxy (name, surface_temperature_k, center_temperature_k, volume_in_earths, primary_element, visible_without_telescope, in_habitable_zone, galaxy_id) FROM stdin;
Milky Way	\N	\N	327000000000000000000000000000000000000000000000000000000000000	Hydrogen	t	t	1
Andromeda	\N	\N	143000000000000000000000000000000000000000	Hydrogen	t	f	2
M82	\N	\N	30000000000	Hydrogen	f	f	3
Pinwheel Galaxy	\N	\N	30000000000	Hydrogen	f	f	4
Tadpole Galaxy	\N	\N	30000000000	Hydrogen	f	f	5
Sombrero Galaxy	\N	\N	30000000000	Hydrogen	f	f	6
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moon (name, surface_temperature_k, center_temperature_k, volume_in_earths, primary_element, visible_without_telescope, in_habitable_zone, moon_id, planet_id) FROM stdin;
Moon	400	1700	0.2725	Oxygen	t	t	1	2
Phobos	233	\N	0.01	\N	f	f	2	3
Deimos	233	\N	0.01	\N	f	f	3	3
Io	110	\N	0.01	Sulfer Dioxide	f	f	4	1
Europa	102	\N	0.01	\N	f	f	6	1
Ganymede	110	\N	0.01	Oxygen	f	f	7	1
Callisto	110	\N	0.01	Carbon Dioxide	f	f	8	1
Mimas	64	\N	0.01	Carbon Dioxide	f	f	9	1
Enceladus	64	\N	0.01	Carbon Dioxide	f	f	11	6
Tethys	64	\N	0.01	Carbon Dioxide	f	f	12	6
Dione	64	\N	0.01	Carbon Dioxide	f	f	13	6
Rhea	64	\N	0.01	Carbon Dioxide	f	f	14	6
Titan	64	\N	0.01	Carbon Dioxide	f	f	15	6
Hyperion	64	\N	0.01	Carbon Dioxide	f	f	16	6
Iapetus	64	\N	0.01	Carbon Dioxide	f	f	17	6
Epimetheus	64	\N	0.01	Carbon Dioxide	f	f	18	6
Calypso	64	\N	0.01	Carbon Dioxide	f	f	19	6
Prometheus	64	\N	0.01	Carbon Dioxide	f	f	20	6
Ariel	64	\N	0.01	Carbon Dioxide	f	f	21	7
Umbriel	64	\N	0.01	Carbon Dioxide	f	f	22	7
Titania	64	\N	0.01	Carbon Dioxide	f	f	23	7
Oberon	64	\N	0.01	Carbon Dioxide	f	f	24	7
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planet (name, surface_temperature_k, center_temperature_k, volume_in_earths, primary_element, visible_without_telescope, in_habitable_zone, planet_id, star_id) FROM stdin;
Earth	288	5700	1	Oxygen	t	t	2	1
Jupiter	\N	\N	1321	Hydrogen	t	f	1	1
Mars	209	\N	0.151	Carbon Dioxide	t	t	3	1
Mercury	437	\N	0.056	Oxygen	t	f	4	1
Venus	232	\N	0.9499	Carbon Dioxide	t	f	5	1
Saturn	134	\N	9.449	Hydrogen	t	f	6	1
Uranus	76	\N	4.007	Hydrogen	t	f	7	1
Neptune	72	\N	3.829	Hydrogen	t	f	8	1
Pluto	44	\N	0.1868	Nitrogen	t	f	9	1
Ceres	235	\N	0.00016	Water Ice	f	f	10	1
Orcus	44	\N	0.015	\N	f	f	11	1
Gonggong	\N	\N	0.01	\N	f	f	12	1
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.star (name, surface_temperature_k, center_temperature_k, volume_in_earths, primary_element, visible_without_telescope, in_habitable_zone, star_id, galaxy_id) FROM stdin;
Sol	5778	15000000	1300000	Hydrogen	t	f	1	1
Alpha Centari	5790	\N	1800000	Hydrogen	t	t	2	1
Barnads Star	3134	\N	2.7	Hydrogen	t	t	3	1
Luhman 16	1350	\N	9.35	Hydrogen	t	t	4	1
Wolf 395	1350	\N	9.35	Hydrogen	t	t	5	1
Sirius	9940	\N	9.35	Hydrogen	t	t	6	1
\.


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


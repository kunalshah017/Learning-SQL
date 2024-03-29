--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255),
    have_stars boolean DEFAULT true,
    size character varying(50) NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255),
    distance_from_parent numeric(10,2),
    parent_planet_name text NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255),
    moon_count integer,
    star_count integer NOT NULL,
    have_moon boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(255),
    parent_planet_name text NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255),
    have_planets boolean,
    galaxy_id integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', true, 'large', 2530000.00);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', true, 'huge', 100000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', true, 'medium', 3000000.00);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', true, 'massive', 5500000.00);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', true, 'large', 3900000.00);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', true, 'huge', 2600000.00);
INSERT INTO public.galaxy VALUES (7, 'Black Eye Galaxy', true, 'medium', 4700000.00);
INSERT INTO public.galaxy VALUES (8, 'Pinwheel Galaxy', true, 'massive', 6200000.00);
INSERT INTO public.galaxy VALUES (9, 'Bode''s Galaxy', true, 'large', 4400000.00);
INSERT INTO public.galaxy VALUES (10, 'Cigar Galaxy', true, 'huge', 3900000.00);
INSERT INTO public.galaxy VALUES (11, 'Sunflower Galaxy', true, 'medium', 2700000.00);
INSERT INTO public.galaxy VALUES (12, 'Cartwheel Galaxy', true, 'massive', 5200000.00);
INSERT INTO public.galaxy VALUES (13, 'Sculptor Galaxy', true, 'large', 3700000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 384400.00, 'Earth', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 9378.00, 'Mars', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 23463.00, 'Mars', 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 1070400.00, 'Jupiter', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 1882700.00, 'Jupiter', 5);
INSERT INTO public.moon VALUES (6, 'Io', 421700.00, 'Jupiter', 5);
INSERT INTO public.moon VALUES (7, 'Europa', 671100.00, 'Jupiter', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 1221870.00, 'Saturn', 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 527040.00, 'Saturn', 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 3560850.00, 'Saturn', 6);
INSERT INTO public.moon VALUES (11, 'Dione', 377400.00, 'Saturn', 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 294660.00, 'Saturn', 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 238020.00, 'Saturn', 6);
INSERT INTO public.moon VALUES (14, 'Umbriel', 266000.00, 'Uranus', 7);
INSERT INTO public.moon VALUES (15, 'Titania', 435910.00, 'Uranus', 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 191020.00, 'Uranus', 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 583520.00, 'Uranus', 7);
INSERT INTO public.moon VALUES (18, 'Miranda', 129780.00, 'Uranus', 7);
INSERT INTO public.moon VALUES (19, 'Charon', 19591.00, 'Pluto', 9);
INSERT INTO public.moon VALUES (20, 'Nix', 48694.00, 'Pluto', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 1, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 1, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 1, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, 1, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 82, 1, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 1, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 1, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 1, true, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 0, 1, false, 2);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 0, 1, false, 2);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 0, 1, false, 4);
INSERT INTO public.planet VALUES (13, 'HD 209458 b', 0, 1, false, 3);
INSERT INTO public.planet VALUES (14, 'WASP-12b', 0, 1, false, 3);
INSERT INTO public.planet VALUES (15, 'Gliese 581c', 0, 1, false, 5);
INSERT INTO public.planet VALUES (16, 'Gliese 581d', 0, 1, false, 5);
INSERT INTO public.planet VALUES (17, 'Gliese 581g', 0, 1, false, 5);
INSERT INTO public.planet VALUES (18, 'TrES-2b', 0, 1, false, 6);
INSERT INTO public.planet VALUES (19, 'GJ 1214 b', 0, 1, false, 7);
INSERT INTO public.planet VALUES (20, 'PSR B1257+12 A', 0, 1, false, 8);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Moon', 'Earth', 3);
INSERT INTO public.satellite VALUES (2, 'Phobos', 'Mars', 4);
INSERT INTO public.satellite VALUES (3, 'Deimos', 'Mars', 4);
INSERT INTO public.satellite VALUES (4, 'Ganymede', 'Jupiter', 5);
INSERT INTO public.satellite VALUES (5, 'Callisto', 'Jupiter', 5);
INSERT INTO public.satellite VALUES (6, 'Io', 'Jupiter', 5);
INSERT INTO public.satellite VALUES (7, 'Europa', 'Jupiter', 5);
INSERT INTO public.satellite VALUES (8, 'Titan', 'Saturn', 6);
INSERT INTO public.satellite VALUES (9, 'Rhea', 'Saturn', 6);
INSERT INTO public.satellite VALUES (10, 'Iapetus', 'Saturn', 6);
INSERT INTO public.satellite VALUES (11, 'Dione', 'Saturn', 6);
INSERT INTO public.satellite VALUES (12, 'Tethys', 'Saturn', 6);
INSERT INTO public.satellite VALUES (13, 'Enceladus', 'Saturn', 6);
INSERT INTO public.satellite VALUES (14, 'Umbriel', 'Uranus', 7);
INSERT INTO public.satellite VALUES (15, 'Titania', 'Uranus', 7);
INSERT INTO public.satellite VALUES (16, 'Ariel', 'Uranus', 7);
INSERT INTO public.satellite VALUES (17, 'Oberon', 'Uranus', 7);
INSERT INTO public.satellite VALUES (18, 'Miranda', 'Uranus', 7);
INSERT INTO public.satellite VALUES (19, 'Charon', 'Pluto', 9);
INSERT INTO public.satellite VALUES (20, 'Nix', 'Pluto', 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 2, 149.60);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', true, 2, 4.37);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', true, 2, 4.37);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', false, 2, 4.24);
INSERT INTO public.star VALUES (5, 'Sirius A', true, 2, 8.60);
INSERT INTO public.star VALUES (6, 'Sirius B', true, 2, 8.60);
INSERT INTO public.star VALUES (7, 'Vega', true, 2, 25.00);
INSERT INTO public.star VALUES (8, 'Betelgeuse', true, 1, 643.20);
INSERT INTO public.star VALUES (9, 'Rigel', true, 1, 860.00);
INSERT INTO public.star VALUES (10, 'Deneb', true, 1, 2600.00);
INSERT INTO public.star VALUES (11, 'Pollux', true, 2, 33.72);
INSERT INTO public.star VALUES (12, 'Capella', true, 2, 42.20);
INSERT INTO public.star VALUES (13, 'Aldebaran', true, 1, 65.00);
INSERT INTO public.star VALUES (14, 'Altair', true, 2, 16.70);
INSERT INTO public.star VALUES (15, 'Antares', true, 1, 553.00);
INSERT INTO public.star VALUES (16, 'Spica', true, 2, 250.00);
INSERT INTO public.star VALUES (17, 'Arcturus', true, 1, 36.70);
INSERT INTO public.star VALUES (18, 'Polaris', true, 2, 431.00);
INSERT INTO public.star VALUES (19, 'Bellatrix', true, 1, 243.00);
INSERT INTO public.star VALUES (20, 'Regulus', true, 2, 77.00);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


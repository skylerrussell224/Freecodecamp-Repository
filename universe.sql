--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    asteroids_id integer NOT NULL,
    name character varying(50) NOT NULL,
    asteroid_type character varying(50),
    mass integer NOT NULL,
    galaxy_id integer,
    description text
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_millions numeric,
    has_black_hole boolean NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    moon_type character varying(50),
    size integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_type character varying(50),
    supports_life boolean NOT NULL,
    number_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_type character varying(50),
    size integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES (1, 'Ceres', 'Dwarf Planet', 939000, 1, 'Largest object in the asteroid belt');
INSERT INTO public.asteroids VALUES (2, 'Vesta', 'Rocky', 259000, 1, 'Second-largest asteroid by mass');
INSERT INTO public.asteroids VALUES (3, 'Pallas', 'Rocky', 214000, 1, 'Highly inclined orbit asteroid');
INSERT INTO public.asteroids VALUES (4, 'Hygiea', 'Carbonaceous', 87000, 1, 'Dark asteroid with spherical shape');
INSERT INTO public.asteroids VALUES (5, 'Eros', 'Near-Earth', 6700, 1, 'Near-Earth asteroid studied by NEAR Shoemaker');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'barred spiral galaxy', 13600.00, true, 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'Spiral', 10000, true, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Spiral', 9000, false, 'Triangulum');
INSERT INTO public.galaxy VALUES (4, 'Spiral', 13000, true, 'Sombrero');
INSERT INTO public.galaxy VALUES (5, 'Spiral', 11000, true, 'Whirlpool');
INSERT INTO public.galaxy VALUES (6, 'Ring', 12000, false, 'Cartwheel');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', NULL, 3474, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 22, 4);
INSERT INTO public.moon VALUES (3, 'Europa', NULL, 3122, 5);
INSERT INTO public.moon VALUES (4, 'Callisto', NULL, 4821, 5);
INSERT INTO public.moon VALUES (5, 'Titan', NULL, 5150, 6);
INSERT INTO public.moon VALUES (6, 'Dione', NULL, 1123, 6);
INSERT INTO public.moon VALUES (7, 'Tethys', NULL, 1062, 6);
INSERT INTO public.moon VALUES (8, 'Titania', NULL, 1578, 7);
INSERT INTO public.moon VALUES (9, 'Oberon', NULL, 1523, 7);
INSERT INTO public.moon VALUES (10, 'Triton', NULL, 2706, 8);
INSERT INTO public.moon VALUES (11, 'Aethera', NULL, 1200, 9);
INSERT INTO public.moon VALUES (12, 'Nyx', NULL, 900, 9);
INSERT INTO public.moon VALUES (13, 'Brontia', NULL, 2100, 10);
INSERT INTO public.moon VALUES (14, 'Keraunos', NULL, 1800, 10);
INSERT INTO public.moon VALUES (15, 'Stratos', NULL, 1600, 10);
INSERT INTO public.moon VALUES (16, 'Caelus-Minor', NULL, 1400, 11);
INSERT INTO public.moon VALUES (17, 'Nimbus', NULL, 1300, 11);
INSERT INTO public.moon VALUES (18, 'Cirrus', NULL, 1100, 11);
INSERT INTO public.moon VALUES (19, 'Dawn', NULL, 1000, 12);
INSERT INTO public.moon VALUES (20, 'Dusk', NULL, 950, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', false, 79, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', false, 83, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', false, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', false, 14, 1);
INSERT INTO public.planet VALUES (9, 'Aether', 'Terrestrial', false, 2, 3);
INSERT INTO public.planet VALUES (10, 'Brontes', 'Gas Giant', false, 3, 4);
INSERT INTO public.planet VALUES (11, 'Caelum', 'Ice Giant', false, 3, 5);
INSERT INTO public.planet VALUES (12, 'Dysis', 'Terrestrial', false, 2, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Yellow Dwarf', 1392000, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Spectral', 2400000, 1);
INSERT INTO public.star VALUES (3, 'RX-And-1', 'Main Sequence', 1100000, 2);
INSERT INTO public.star VALUES (4, 'TRI-Alpha', 'Red Giant', 2500000, 3);
INSERT INTO public.star VALUES (5, 'SMB-Prime', 'Blue Giant', 4000000, 4);
INSERT INTO public.star VALUES (6, 'WHL-Core', 'Main Sequence', 1300000, 5);


--
-- Name: asteroids asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroids_id);


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
-- Name: asteroids asteroids_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


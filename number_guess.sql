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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    name character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 9999 NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1708287166318', 2, 377);
INSERT INTO public.users VALUES ('user_1708287166319', 5, 158);
INSERT INTO public.users VALUES ('user_1708287170612', 2, 464);
INSERT INTO public.users VALUES ('user_1708287170613', 5, 170);
INSERT INTO public.users VALUES ('user_1708287174226', 2, 198);
INSERT INTO public.users VALUES ('user_1708287174227', 5, 17);
INSERT INTO public.users VALUES ('user_1708287175811', 2, 52);
INSERT INTO public.users VALUES ('user_1708287175812', 5, 335);
INSERT INTO public.users VALUES ('nm', 1, 9);
INSERT INTO public.users VALUES ('user_1708287236812', 2, 543);
INSERT INTO public.users VALUES ('user_1708287236813', 5, 138);
INSERT INTO public.users VALUES ('user_1708287305799', 2, 390);
INSERT INTO public.users VALUES ('user_1708287305800', 5, 5);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (name);


--
-- PostgreSQL database dump complete
--


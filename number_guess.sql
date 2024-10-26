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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    player_id integer,
    number_of_guesses integer,
    secret_number integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 700, 699);
INSERT INTO public.games VALUES (2, 1, 330, 329);
INSERT INTO public.games VALUES (3, 2, 909, 908);
INSERT INTO public.games VALUES (4, 2, 372, 371);
INSERT INTO public.games VALUES (5, 1, 501, 498);
INSERT INTO public.games VALUES (6, 1, 933, 931);
INSERT INTO public.games VALUES (7, 1, 50, 49);
INSERT INTO public.games VALUES (8, 3, 697, 696);
INSERT INTO public.games VALUES (9, 3, 779, 778);
INSERT INTO public.games VALUES (10, 4, 799, 798);
INSERT INTO public.games VALUES (11, 4, 600, 599);
INSERT INTO public.games VALUES (12, 3, 996, 993);
INSERT INTO public.games VALUES (13, 3, 353, 351);
INSERT INTO public.games VALUES (14, 3, 53, 52);
INSERT INTO public.games VALUES (15, 5, 46, 45);
INSERT INTO public.games VALUES (16, 5, 991, 990);
INSERT INTO public.games VALUES (17, 6, 366, 365);
INSERT INTO public.games VALUES (18, 6, 275, 274);
INSERT INTO public.games VALUES (19, 5, 684, 681);
INSERT INTO public.games VALUES (20, 5, 1000, 998);
INSERT INTO public.games VALUES (21, 5, 700, 699);
INSERT INTO public.games VALUES (22, 7, 329, 328);
INSERT INTO public.games VALUES (23, 7, 745, 744);
INSERT INTO public.games VALUES (24, 8, 289, 288);
INSERT INTO public.games VALUES (25, 8, 276, 275);
INSERT INTO public.games VALUES (26, 7, 304, 301);
INSERT INTO public.games VALUES (27, 7, 494, 492);
INSERT INTO public.games VALUES (28, 7, 621, 620);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'user_1729951224150');
INSERT INTO public.players VALUES (2, 'user_1729951224149');
INSERT INTO public.players VALUES (3, 'user_1729951312018');
INSERT INTO public.players VALUES (4, 'user_1729951312017');
INSERT INTO public.players VALUES (5, 'user_1729951340293');
INSERT INTO public.players VALUES (6, 'user_1729951340292');
INSERT INTO public.players VALUES (7, 'user_1729951349883');
INSERT INTO public.players VALUES (8, 'user_1729951349882');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 28, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 8, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--


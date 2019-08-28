--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

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


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO "Guest";

--
-- Name: posts; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    body text,
    votes integer,
    user_id bigint,
    prompt_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.posts OWNER TO "Guest";

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO "Guest";

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: prompts; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.prompts (
    id bigint NOT NULL,
    movie_a public.hstore DEFAULT ''::public.hstore NOT NULL,
    movie_b public.hstore DEFAULT ''::public.hstore NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.prompts OWNER TO "Guest";

--
-- Name: prompts_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.prompts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prompts_id_seq OWNER TO "Guest";

--
-- Name: prompts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.prompts_id_seq OWNED BY public.prompts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "Guest";

--
-- Name: users; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying,
    email character varying,
    password_hash character varying,
    password_salt character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: prompts id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.prompts ALTER COLUMN id SET DEFAULT nextval('public.prompts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-08-28 15:08:38.881634	2019-08-28 15:08:38.881634
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.posts (id, body, votes, user_id, prompt_id, created_at, updated_at) FROM stdin;
1	difajadlfkfjsdf	\N	1	3	2019-08-28 16:27:21.536133	2019-08-28 16:27:21.536133
2	111111	\N	1	3	2019-08-28 16:27:27.403753	2019-08-28 16:27:27.403753
3	Leo is a horse the whole time	\N	1	4	2019-08-28 16:49:53.56614	2019-08-28 16:49:53.56614
\.


--
-- Data for Name: prompts; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.prompts (id, movie_a, movie_b, created_at, updated_at) FROM stdin;
3	"plot"=>"After discovering he is a human, a man raised as an elf at the North Pole decides to travel to New York City to locate his real father.", "year"=>"2003", "title"=>"Elf", "actors"=>"Will Ferrell, James Caan, Bob Newhart, Edward Asner", "poster"=>"https://m.media-amazon.com/images/M/MV5BMzUxNzkzMzQtYjIxZC00NzU0LThkYTQtZjNhNTljMTA1MDA1L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"	"plot"=>"Two aimless middle-aged losers still living at home are forced against their will to become roommates when their parents marry.", "year"=>"2008", "title"=>"Step Brothers", "actors"=>"Will Ferrell, John C. Reilly, Mary Steenburgen, Richard Jenkins", "poster"=>"https://m.media-amazon.com/images/M/MV5BODViZDg3ZjYtMzhiYS00YTVkLTk4MzktYWUxMTlkYjc1NjdlXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"	2019-08-28 16:18:14.910976	2019-08-28 16:18:14.910976
4	"plot"=>"In 1954, a U.S. Marshal investigates the disappearance of a murderer, who escaped from a hospital for the criminally insane.", "year"=>"2010", "title"=>"Shutter Island", "actors"=>"Leonardo DiCaprio, Mark Ruffalo, Ben Kingsley, Max von Sydow", "poster"=>"https://m.media-amazon.com/images/M/MV5BYzhiNDkyNzktNTZmYS00ZTBkLTk2MDAtM2U0YjU1MzgxZjgzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"	"plot"=>"An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.", "year"=>"2006", "title"=>"The Departed", "actors"=>"Leonardo DiCaprio, Matt Damon, Jack Nicholson, Mark Wahlberg", "poster"=>"https://m.media-amazon.com/images/M/MV5BMTI1MTY2OTIxNV5BMl5BanBnXkFtZTYwNjQ4NjY3._V1_SX300.jpg"	2019-08-28 16:49:37.771272	2019-08-28 16:49:37.771272
5	"plot"=>"Two hip detectives protect a witness to a murder while investigating a case of stolen heroin from the evidence storage room from their police precinct.", "year"=>"1995", "title"=>"Bad Boys", "actors"=>"Lisa Boyle, Michael Taliferro, Emmanuel Xuereb, Tchéky Karyo", "poster"=>"https://m.media-amazon.com/images/M/MV5BMGE1ZTQ0ZTEtZTEwZS00NWE0LTlmMDUtMTE1ZWJiZTYzZTQ2XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"	"plot"=>"Years after a plague kills most of humanity and transforms the rest into monsters, the sole survivor in New York City struggles valiantly to find a cure.", "year"=>"2007", "title"=>"I Am Legend", "actors"=>"Will Smith, Alice Braga, Charlie Tahan, Salli Richardson-Whitfield", "poster"=>"https://m.media-amazon.com/images/M/MV5BYTE1ZTBlYzgtNmMyNS00ZTQ2LWE4NjEtZjUxNDJkNTg2MzlhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg"	2019-08-28 16:50:43.383691	2019-08-28 16:50:43.383691
6	"plot"=>"When a military general inherits a toy making company and begins making war toys, his employees band together to stop him before he ruins the name of Zevo Toys forever.", "year"=>"1992", "title"=>"Toys", "actors"=>"Robin Williams, Michael Gambon, Joan Cusack, Robin Wright", "poster"=>"https://m.media-amazon.com/images/M/MV5BZWFmMTllM2EtZTNlOC00NGY3LTg1YWItZGIzOTU3Mzk3YmNkL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"	"plot"=>"Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie; they travel cross-country.", "year"=>"1988", "title"=>"Rain Man", "actors"=>"Dustin Hoffman, Tom Cruise, Valeria Golino, Gerald R. Molen", "poster"=>"https://m.media-amazon.com/images/M/MV5BMzVjNzI4NzYtMjE4NS00M2IzLWFkOWMtOTYwMWUzN2ZlNGVjL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"	2019-08-28 17:10:09.771516	2019-08-28 17:10:09.771516
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.schema_migrations (version) FROM stdin;
20190827161504
20190826164506
20190826165615
20190826171432
20190826203636
20190827161437
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.users (id, username, email, password_hash, password_salt, created_at, updated_at) FROM stdin;
1	Nick	nick@gmail.com	$2a$12$c9EN8jiDCHKEM/7GY5sw6uXfItqEy5aUan/UF431/7sWoohQl7rJm	$2a$12$c9EN8jiDCHKEM/7GY5sw6u	2019-08-28 16:10:00.905558	2019-08-28 16:10:00.905558
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.posts_id_seq', 3, true);


--
-- Name: prompts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.prompts_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: prompts prompts_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.prompts
    ADD CONSTRAINT prompts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_posts_on_prompt_id; Type: INDEX; Schema: public; Owner: Guest
--

CREATE INDEX index_posts_on_prompt_id ON public.posts USING btree (prompt_id);


--
-- Name: index_posts_on_user_id; Type: INDEX; Schema: public; Owner: Guest
--

CREATE INDEX index_posts_on_user_id ON public.posts USING btree (user_id);


--
-- Name: posts fk_rails_0a704ebd75; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_0a704ebd75 FOREIGN KEY (prompt_id) REFERENCES public.prompts(id);


--
-- Name: posts fk_rails_5b5ddfd518; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_5b5ddfd518 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--


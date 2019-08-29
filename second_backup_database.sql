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
    votes integer DEFAULT 0,
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
12	Queen Elsa's powers run unchecked and she freezes the entire planet. Humans go extinct and the sloths rule the world. 	0	1	11	2019-08-29 20:25:57.457308	2019-08-29 20:25:57.457308
13	After terrorizing a small town, ex-green beret John Rambo moves to Philadelphia and becomes a boxer.	0	1	12	2019-08-29 20:27:10.785133	2019-08-29 20:27:10.785133
14	After being suspected of unsanctioned violence and possible murdersr, the green beret is forced to hide his identity. He becomes a professional boxer with a dark secret, taking his anger out in the ring. 	0	3	12	2019-08-29 20:30:46.37016	2019-08-29 20:30:46.37016
15	After eating too many military rations, a disillusioned general decides to make toys that will destroy the world, but is disowned and forced to choose a new profession. With his newfound cynicism, he becomes a lawyer until his brother requires his help.	1	3	6	2019-08-29 20:41:12.304866	2019-08-29 20:41:12.304866
10	His employees failed and he did ruin the name of Zevo Toys forever. He then is kicked out of his company with a giant severance but passes away, forcing his two sons back together to travel the country.	1	1	6	2019-08-29 20:11:17.961948	2019-08-29 20:11:17.961948
11	After being raised by "Jaws", his abusive father, Bruce becomes non-violent and lives by the mantra "fish are friends, not food."	1	1	9	2019-08-29 20:22:33.193245	2019-08-29 20:22:33.193245
17	After saving America from the brits Benjamin Martin (Mel Gibson) finds himself alone and lost in the woods. He stumbles upon a time machine, and after irresponsibly pushing some buttons he finds himself transported to 1980 where he has to save New America (Los Angeles).	0	5	13	2019-08-29 20:50:04.258078	2019-08-29 20:50:04.258078
18	With the secret to immortality, Captain Ron has outlived all his friends and becomes a drifter/gun for hire, by the name of Snake Plisken. With seemingly, nothing to lose, Snake is selected for a dangerous mission to rescue the President of the United States.	0	5	14	2019-08-29 20:52:00.266377	2019-08-29 20:52:00.266377
16	After being chased by jaws and resentful of the sea, a new dentist decides to steal a clown fish from his father. His bitterness leads him to torture sea creatures by giving them to his niece.	1	3	9	2019-08-29 20:44:17.720884	2019-08-29 20:44:17.720884
\.


--
-- Data for Name: prompts; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.prompts (id, movie_a, movie_b, created_at, updated_at) FROM stdin;
6	"plot"=>"When a military general inherits a toy making company and begins making war toys, his employees band together to stop him before he ruins the name of Zevo Toys forever.", "year"=>"1992", "title"=>"Toys", "actors"=>"Robin Williams, Michael Gambon, Joan Cusack, Robin Wright", "poster"=>"https://m.media-amazon.com/images/M/MV5BZWFmMTllM2EtZTNlOC00NGY3LTg1YWItZGIzOTU3Mzk3YmNkL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"	"plot"=>"Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie; they travel cross-country.", "year"=>"1988", "title"=>"Rain Man", "actors"=>"Dustin Hoffman, Tom Cruise, Valeria Golino, Gerald R. Molen", "poster"=>"https://m.media-amazon.com/images/M/MV5BMzVjNzI4NzYtMjE4NS00M2IzLWFkOWMtOTYwMWUzN2ZlNGVjL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"	2019-08-28 17:10:09.771516	2019-08-28 17:10:09.771516
9	"plot"=>"When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.", "year"=>"1975", "title"=>"Jaws", "actors"=>"Roy Scheider, Robert Shaw, Richard Dreyfuss, Lorraine Gary", "poster"=>"https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"	"plot"=>"After his son is captured in the Great Barrier Reef and taken to Sydney, a timid clownfish sets out on a journey to bring him home.", "year"=>"2003", "title"=>"Finding Nemo", "actors"=>"Albert Brooks, Ellen DeGeneres, Alexander Gould, Willem Dafoe", "poster"=>"https://m.media-amazon.com/images/M/MV5BZTAzNWZlNmUtZDEzYi00ZjA5LWIwYjEtZGM1NWE1MjE4YWRhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg"	2019-08-29 20:21:09.286712	2019-08-29 20:21:09.286712
11	"plot"=>"When the newly-crowned Queen Elsa accidentally uses her power to turn things into ice to curse her home in infinite winter, her sister Anna teams up with a mountain man, his playful reindeer, and a snowman to change the weather condition.", "year"=>"2013", "title"=>"Frozen", "actors"=>"Kristen Bell, Idina Menzel, Jonathan Groff, Josh Gad", "poster"=>"https://m.media-amazon.com/images/M/MV5BMTQ1MjQwMTE5OF5BMl5BanBnXkFtZTgwNjk3MTcyMDE@._V1_SX300.jpg"	"plot"=>"Set during the Ice Age, a sabertooth tiger, a sloth, and a wooly mammoth find a lost human infant, and they try to return him to his tribe.", "year"=>"2002", "title"=>"Ice Age", "actors"=>"Ray Romano, John Leguizamo, Denis Leary, Goran Visnjic", "poster"=>"https://m.media-amazon.com/images/M/MV5BMmYxZWY2NzgtYzJjZC00MDFmLTgxZTctMjRiYjdjY2FhODg3XkEyXkFqcGdeQXVyNjk1Njg5NTA@._V1_SX300.jpg"	2019-08-29 20:25:11.570964	2019-08-29 20:25:11.570964
12	"plot"=>"A veteran Green Beret is forced by a cruel Sheriff and his deputies to flee into the mountains and wage an escalating one-man war against his pursuers.", "year"=>"1982", "title"=>"First Blood", "actors"=>"Sylvester Stallone, Richard Crenna, Brian Dennehy, Bill McKinney", "poster"=>"https://m.media-amazon.com/images/M/MV5BODBmOWU2YWMtZGUzZi00YzRhLWJjNDAtYTUwNWVkNDcyZmU5XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SX300.jpg"	"plot"=>"A small-time boxer gets a supremely rare chance to fight a heavy-weight champion in a bout in which he strives to go the distance for his self-respect.", "year"=>"1976", "title"=>"Rocky", "actors"=>"Sylvester Stallone, Talia Shire, Burt Young, Carl Weathers", "poster"=>"https://m.media-amazon.com/images/M/MV5BMTY5MDMzODUyOF5BMl5BanBnXkFtZTcwMTQ3NTMyNA@@._V1_SX300.jpg"	2019-08-29 20:26:26.279361	2019-08-29 20:26:26.279361
13	"plot"=>"Peaceful farmer Benjamin Martin is driven to lead the Colonial Militia during the American Revolution when a sadistic British officer murders his son.", "year"=>"2000", "title"=>"The Patriot", "actors"=>"Mel Gibson, Heath Ledger, Joely Richardson, Jason Isaacs", "poster"=>"https://m.media-amazon.com/images/M/MV5BMTkzMjE4ODU0MV5BMl5BanBnXkFtZTYwNTI2OTk2._V1_SX300.jpg"	"plot"=>"Two newly paired cops who are complete opposites must put aside their differences in order to catch a gang of drug smugglers.", "year"=>"1987", "title"=>"Lethal Weapon", "actors"=>"Mel Gibson, Danny Glover, Gary Busey, Mitchell Ryan", "poster"=>"https://m.media-amazon.com/images/M/MV5BZTllNWNlZjctMWQwMS00ZDc3LTg5ZjMtNzhmNzhjMmVhYTFlXkEyXkFqcGdeQXVyNTc1NTQxODI@._V1_SX300.jpg"	2019-08-29 20:45:01.199595	2019-08-29 20:45:01.199595
14	"plot"=>"A Chicagoan inherits an old yacht. He, his wife, daughter and son fly to a Caribbean island and hire a dubious Captain Ron to sail them on an adventure to Miami.", "year"=>"1992", "title"=>"Captain Ron", "actors"=>"Kurt Russell, Martin Short, Mary Kay Place, Benjamin Salisbury", "poster"=>"https://m.media-amazon.com/images/M/MV5BOWZkYTk4YjAtZmViZS00ZTY5LWE2YmItOGQ3Y2Y0N2MzODkyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"	"plot"=>"In 1997, when the U.S. president crashes into Manhattan, now a giant maximum security prison, a convicted bank robber is sent in to rescue him.", "year"=>"1981", "title"=>"Escape from New York", "actors"=>"Kurt Russell, Lee Van Cleef, Ernest Borgnine, Donald Pleasence", "poster"=>"https://m.media-amazon.com/images/M/MV5BMTUzMTY0Nzg0MV5BMl5BanBnXkFtZTgwMDU3MzQxMDE@._V1_SX300.jpg"	2019-08-29 20:50:28.094808	2019-08-29 20:50:28.094808
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
20190828220436
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.users (id, username, email, password_hash, password_salt, created_at, updated_at) FROM stdin;
1	Nick	nick@gmail.com	$2a$12$c9EN8jiDCHKEM/7GY5sw6uXfItqEy5aUan/UF431/7sWoohQl7rJm	$2a$12$c9EN8jiDCHKEM/7GY5sw6u	2019-08-28 16:10:00.905558	2019-08-28 16:10:00.905558
2	d	d@d.com	$2a$12$UBzeMXzUFqcmZEpPRoTZ4uvfIsQWeESm2P.3QS7raVfbQYIiZXQbe	$2a$12$UBzeMXzUFqcmZEpPRoTZ4u	2019-08-29 15:07:20.808059	2019-08-29 15:07:20.808059
3	Daniel	dan@email.com	$2a$12$sSLwcYUl1GNmXcQjMbbL..yuNsNVzfnEv8DmHzE4fz18kjW2IDA0C	$2a$12$sSLwcYUl1GNmXcQjMbbL..	2019-08-29 20:27:43.795275	2019-08-29 20:27:43.795275
4	Neur0Mancer	nin@email.com	$2a$12$WIdLTtqU2V7Hy9V8xnmXzO3V7W3d1NiEjc1L2VEmmRBwCzAwr0VhC	$2a$12$WIdLTtqU2V7Hy9V8xnmXzO	2019-08-29 20:31:23.487702	2019-08-29 20:31:23.487702
5	abdellah	abdellah@email.com	$2a$12$4WK5.neDb9N4U5fdZ/qdKOV3mloDagTHj9nqaQv/RCGpXWL4mTOxW	$2a$12$4WK5.neDb9N4U5fdZ/qdKO	2019-08-29 20:45:35.804605	2019-08-29 20:45:35.804605
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.posts_id_seq', 18, true);


--
-- Name: prompts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.prompts_id_seq', 14, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


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


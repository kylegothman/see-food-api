--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Homebrew)
-- Dumped by pg_dump version 14.7 (Homebrew)

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
-- Name: login; Type: TABLE; Schema: public; Owner: kylegothman
--

CREATE TABLE public.login (
    id integer NOT NULL,
    hash character varying(100),
    username character varying(100) NOT NULL
);


ALTER TABLE public.login OWNER TO kylegothman;

--
-- Name: login_id_seq; Type: SEQUENCE; Schema: public; Owner: kylegothman
--

CREATE SEQUENCE public.login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_id_seq OWNER TO kylegothman;

--
-- Name: login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kylegothman
--

ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: kylegothman
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    score bigint DEFAULT 0,
    joined timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO kylegothman;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: kylegothman
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO kylegothman;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kylegothman
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: login id; Type: DEFAULT; Schema: public; Owner: kylegothman
--

ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: kylegothman
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: kylegothman
--

COPY public.login (id, hash, username) FROM stdin;
56	$2a$10$7sUwUOpCfuBpyxB54nzKKeIXmxue6NyT.wPMj0H2Zm.hW8Al.zxyi	mj2
58	$2a$10$ZgbobuO3rPnhT.BGGl2QBuFmTj7mrxp3V6jWW28dn9t4hZRd4jrtu	mj
60	$2a$10$58Pd96rnntWG0Vqznb81R.7sIClCm8zeXkPJETzsuWOymdcMZozxi	MJ99
61	$2a$10$olEY/424Z.veO/TFOTdAeugLHdwWIUTr84HDETFVCkaV2DF9LG5tm	jake
63	$2a$10$NH3jlqXi1Zi5Y1tWPfsoZuoc0nJhEG.FuewSXpb0gOn8/AzmwF9hS	mikew
67	$2a$10$h8tOqHOtnYnJvFJ1TBgw.Ohwj4/pAglW3zIdS86QhUjXN1xxOio/2	MJ98
68	$2a$10$Y2w9nbG7315XhCPzTRd5LeOrmE1OySgOIJIjucLOq9ehYqe3r03tK	MJ97
69	$2a$10$TWa3wkWtkcGxD1SaI14Tp.lEjhXMstKBexWt69qlPlo.B2bAN/iXG	MJ96
70	$2a$10$04QBwzOyjhZC8iOd00p03u3tWb8HSv5zW0vkB4iKYOAqFlv7yHfbO	MJ95
73	$2a$10$/3NGhbYxNR01qbaMgMhKseECjuHV4jmPqMINgZ3A1ynmmCHtA3tCa	MJ94
74	$2a$10$QkT1FDCLyAgKIZJgFbVaoOCSYA4cqSG9LrmJa/HhVvcZW5qVlUq..	MJ93
75	$2a$10$fyDYxv7CweaoO/iBZirz8e0gmpMx1O.onY1eFempZcHq44MhhAcGe	MJ92
76	$2a$10$vbk23ac8hMeD8rqVQpGOA.8ihBMv1.6KmABoXN4LA2FMS/iLueGa.	jkjake`
77	$2a$10$bYEFh7ru4u7ss.80TIAr/ueWYhMDin.B8zIMATiV13SMWBHecoScm	mo
78	$2a$10$qHLhAaR6rKFi/WV42Gcg6uX0rP2Qa6oDCxHqCfYVCN7oD8pGiKUOa	theking
79	$2a$10$K62jBAix2OgDT4Yqw81HYuZrmKzIU6JYSU.t3z5xaXlI49lcdAdsm	pop
80	$2a$10$BHo1x5LtSD4HjX83OrNHfO8yULsruofoIr3f2eecXx7oj.aNzsL9e	MJ21
81	$2a$10$PBy0bh1zzXyTuXEpr/x2nOYDysa8aWcyz0NK3/W3EvV6X/AsV1aHa	MJ20
83	$2a$10$NYW7UijLSCXowAql/uRu9uXHy8BBbEks1HSyhow2YJS8neFlXarQO	MJ19
84	$2a$10$w6itxUbKEpz4D3IwtvzndeWclniLcYh5U9yUVOC6Ajq57jEOW6oeu	MJ18
87	$2a$10$zeSW6x59v3W6ru9zZczgBO9bFOPLvsKQgtxCUSd5EOhAXteq62Pre	MJ17
88	$2a$10$b5o3gCjgxR4WuLzbU173hO75KdWh3b/NwwHwIrU3kF807bSWTl5vm	mj36
89	$2a$10$7RzMebcyNedRmgL8J1gbZO.Gj5wbjkSYa3HL1fn5rSLakTr8LNeZi	spider
90	$2a$10$AilJMo9S61q3oKKOXZ2fdudpQNoW6evAJn/siXNDf2z87XKXo8Gy6	oneeye
91	$2a$10$xL1edGfo76e5t3HiCjRAv.U.eGWI1kW9VCPZ1NvuCiAmHpVQoYEk.	mooo
92	$2a$10$CctBK0U2c59IwhbO28UmYuwQbDG.LvJgC0q7PLtQ5i7A8oeuAllB2	fbzxvn
93	$2a$10$xRJs3mYrwjqhiZmo4fD7T.y/xXFKMDHtcnbHsWyDjvQAB/fWTYlQ.	sdjfh
94	$2a$10$Qsam0MvU//AQ/g5cjT9BRuoC5NxEmocf92kwuribu/zADraUnGlO6	sfldkghls
95	$2a$10$f396XNsHN8guvzoufNVLYOdkO.4MTAWmSXzf2eDhsRveY9EgYCOyu	dsldjhf
96	$2a$10$NmRltSjF.GQqiwdl4zhPz.XgCVCRm9HoUEBOyZuVUW8swdCJgrR1.	killermike
97	$2a$10$6RBEvraICSaIyq0ZcxDuO.SSTZTvRxeHlBmjjXGCjH1y1En5INq2q	zcfhdfh
98	$2a$10$ZK1hwTlePaVy5Wn9LU5zU.K5aJWNzQTIk2JNm3gq2C3fkGGzJ30Mm	hoop
99	$2a$10$mBEbEgxeJO6LbS0gobJpOeckR1C6YNfCEDAxQhE4Kdw9m33zCVyou	cowboy
100	$2a$10$g3IiXZjqEKuuzmFnHn3uQ.akZcWaHg2AcFG.YlJ/eSw.UsHLruEd.	sfgnsfg
101	$2a$10$sNlh4KLaRgzXYzFDKBrOrecGqbaypQJ04nGIe1wHxsdRmDOc9jacG	xb
102	$2a$10$fhg8hRxWmfpq3saCw3Cp8OELhiWxOR7Xk.rKke2AF0manUiAjfHRC	mmm
103	$2a$10$Tqi/kIVSM2rJtqEKCGChpe2XlGvx0WUe7ilrr1hq4DcEBX557ZZhe	coco
52	$2a$10$Jvijqh5vzPJTC62qXon37ut/xB2bKZm2pe2cOruuuDTj/tjdfnbZS	mj23
53	$2a$10$ucpS73H8Q7GnVPZLEmMTpOTK8hQZRJhPXqs/52FqdWMdhs3y.wlMO	MJ9
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: kylegothman
--

COPY public.users (id, name, username, score, joined) FROM stdin;
48	Michael Jordan	mj23	0	2023-03-08 18:29:56.177
49	Mikey	MJ9	0	2023-03-08 18:32:05.252
50	Michael Jordan	mj2	0	2023-03-08 18:40:16.124
51	Michael Jordan	mj	0	2023-03-08 18:40:37.279
53	JAKE	jake	0	2023-03-08 18:44:22.344
54	jake	mikew	0	2023-03-08 18:47:59.187
55	Mikey	MJ98	0	2023-03-08 19:49:18.552
56	Mikey	MJ97	0	2023-03-08 19:49:35.515
57	Mikey	MJ96	0	2023-03-08 19:49:45.595
58	Mikey	MJ95	0	2023-03-08 19:50:36.172
59	Mikey	MJ94	0	2023-03-08 19:51:16.023
60	Mikey	MJ93	0	2023-03-08 19:51:33.826
61	Mikey	MJ92	0	2023-03-08 19:51:45.328
62	jake	jkjake`	0	2023-03-08 19:54:05.084
63	mo	mo	0	2023-03-08 19:54:57.974
64	elvis	theking	0	2023-03-08 19:55:58.972
65	michael	pop	0	2023-03-08 19:57:06.558
66	Michael	MJ21	0	2023-03-08 20:06:33.092
67	Michael	MJ20	0	2023-03-08 20:06:43.125
68	Michael	MJ19	0	2023-03-08 20:07:00.986
69	Michael	MJ18	0	2023-03-08 20:07:34.903
70	Michael	MJ17	0	2023-03-08 20:08:10.16
71	mike	mj36	0	2023-03-08 20:13:20.376
72	peter parker	spider	0	2023-03-08 20:16:44.883
73	mike	oneeye	0	2023-03-08 20:19:53.324
74	mo	mooo	0	2023-03-08 20:20:26.087
75	sfb	fbzxvn	0	2023-03-08 20:22:32.996
76	fsahdkjg	sdjfh	0	2023-03-08 20:24:00.407
77	sdjglks	sfldkghls	0	2023-03-08 20:26:05.553
78	hdkjfh	dsldjhf	19	2023-03-08 20:31:58.012
79	mike	killermike	33	2023-03-08 20:40:13.152
80	dzfhSFh	zcfhdfh	3	2023-03-08 20:58:42.52
81	mj	hoop	0	2023-03-08 21:35:10.834
82	mike	cowboy	0	2023-03-08 21:37:55.232
83	ghfg	sfgnsfg	0	2023-03-08 22:28:08.611
84	sfgafx	xb	0	2023-03-08 22:31:29.352
85	Mike	mmm	0	2023-03-09 12:52:14.082
86	joey	coco	1	2023-03-09 13:08:26.368
52	Mikey	MJ99	794	2023-03-08 18:40:46.455
\.


--
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kylegothman
--

SELECT pg_catalog.setval('public.login_id_seq', 103, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kylegothman
--

SELECT pg_catalog.setval('public.users_id_seq', 86, true);


--
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: kylegothman
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);


--
-- Name: login login_username_key; Type: CONSTRAINT; Schema: public; Owner: kylegothman
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_username_key UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: kylegothman
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: kylegothman
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9
-- Dumped by pg_dump version 16.9

-- Started on 2025-06-19 11:48:36

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

--
-- TOC entry 6 (class 2615 OID 16398)
-- Name: quadrant_tech; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA quadrant_tech;


ALTER SCHEMA quadrant_tech OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16411)
-- Name: employee_login; Type: TABLE; Schema: quadrant_tech; Owner: postgres
--

CREATE TABLE quadrant_tech.employee_login (
    login_id integer NOT NULL,
    staff_id integer NOT NULL,
    username character varying(100) NOT NULL,
    password text NOT NULL
);


ALTER TABLE quadrant_tech.employee_login OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16410)
-- Name: employee_login_login_id_seq; Type: SEQUENCE; Schema: quadrant_tech; Owner: postgres
--

CREATE SEQUENCE quadrant_tech.employee_login_login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE quadrant_tech.employee_login_login_id_seq OWNER TO postgres;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_login_login_id_seq; Type: SEQUENCE OWNED BY; Schema: quadrant_tech; Owner: postgres
--

ALTER SEQUENCE quadrant_tech.employee_login_login_id_seq OWNED BY quadrant_tech.employee_login.login_id;


--
-- TOC entry 217 (class 1259 OID 16400)
-- Name: staff; Type: TABLE; Schema: quadrant_tech; Owner: postgres
--

CREATE TABLE quadrant_tech.staff (
    staff_id integer NOT NULL,
    full_name character varying(150) NOT NULL,
    designation character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(20)
);


ALTER TABLE quadrant_tech.staff OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16429)
-- Name: staff_attendance; Type: TABLE; Schema: quadrant_tech; Owner: postgres
--

CREATE TABLE quadrant_tech.staff_attendance (
    attendance_id integer NOT NULL,
    staff_id integer NOT NULL,
    attendance_date date DEFAULT CURRENT_DATE NOT NULL,
    check_in_time time without time zone NOT NULL,
    check_out_time time without time zone,
    total_hours interval GENERATED ALWAYS AS (
CASE
    WHEN (check_out_time IS NOT NULL) THEN (check_out_time - check_in_time)
    ELSE NULL::interval
END) STORED,
    CONSTRAINT valid_checkout CHECK (((check_out_time IS NULL) OR (check_out_time > check_in_time)))
);


ALTER TABLE quadrant_tech.staff_attendance OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16428)
-- Name: staff_attendance_attendance_id_seq; Type: SEQUENCE; Schema: quadrant_tech; Owner: postgres
--

CREATE SEQUENCE quadrant_tech.staff_attendance_attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE quadrant_tech.staff_attendance_attendance_id_seq OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 220
-- Name: staff_attendance_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: quadrant_tech; Owner: postgres
--

ALTER SEQUENCE quadrant_tech.staff_attendance_attendance_id_seq OWNED BY quadrant_tech.staff_attendance.attendance_id;


--
-- TOC entry 216 (class 1259 OID 16399)
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: quadrant_tech; Owner: postgres
--

CREATE SEQUENCE quadrant_tech.staff_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE quadrant_tech.staff_staff_id_seq OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 216
-- Name: staff_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: quadrant_tech; Owner: postgres
--

ALTER SEQUENCE quadrant_tech.staff_staff_id_seq OWNED BY quadrant_tech.staff.staff_id;


--
-- TOC entry 4747 (class 2604 OID 16414)
-- Name: employee_login login_id; Type: DEFAULT; Schema: quadrant_tech; Owner: postgres
--

ALTER TABLE ONLY quadrant_tech.employee_login ALTER COLUMN login_id SET DEFAULT nextval('quadrant_tech.employee_login_login_id_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 16403)
-- Name: staff staff_id; Type: DEFAULT; Schema: quadrant_tech; Owner: postgres
--

ALTER TABLE ONLY quadrant_tech.staff ALTER COLUMN staff_id SET DEFAULT nextval('quadrant_tech.staff_staff_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 16432)
-- Name: staff_attendance attendance_id; Type: DEFAULT; Schema: quadrant_tech; Owner: postgres
--

ALTER TABLE ONLY quadrant_tech.staff_attendance ALTER COLUMN attendance_id SET DEFAULT nextval('quadrant_tech.staff_attendance_attendance_id_seq'::regclass);


--
-- TOC entry 4914 (class 0 OID 16411)
-- Dependencies: 219
-- Data for Name: employee_login; Type: TABLE DATA; Schema: quadrant_tech; Owner: postgres
--

COPY quadrant_tech.employee_login (login_id, staff_id, username, password) FROM stdin;
1	1	narmada	test123
2	2	sneha	test123
3	3	vikram	test123
4	4	rohit	test123
5	5	shalini	test123
6	6	ganesh	test123
7	7	priya	test123
8	8	harshita	test123
9	9	ganga	test123
10	10	rahul	test123
11	11	simran	test123
12	12	aditya	test123
13	13	kavya	test123
14	14	ankit	test123
15	15	meera	test123
16	16	anjali	test123
17	17	manoj	test123
18	18	rekha	test123
19	19	karan	test123
20	20	tarun	test123
\.


--
-- TOC entry 4912 (class 0 OID 16400)
-- Dependencies: 217
-- Data for Name: staff; Type: TABLE DATA; Schema: quadrant_tech; Owner: postgres
--

COPY quadrant_tech.staff (staff_id, full_name, designation, email, phone) FROM stdin;
1	Narmada Bayya	HR Manager	narmada@quadrant.com	1234567890
2	Sneha Joshi	HR Executive	sneha@quadrant.com	1234567895
3	Vikram Rao	HR Coordinator	vikram@quadrant.com	9876543211
4	Rohit Sharma	Operations Manager	rohit@quadrant.com	1234567894
5	Shalini Mehta	Project Manager	shalini@quadrant.com	1112223334
6	Ganesh Kumar	Team Lead - Backend	ganesh@quadrant.com	1234567891
7	Priya Patel	Team Lead - Frontend	priya@quadrant.com	1234567897
8	Harshita Reddy	Team Lead - QA	harshita@quadrant.com	7776665554
9	Ganga Reddy	Software Engineer	ganga@quadrant.com	1234567892
10	Rahul Verma	Software Engineer	rahul@quadrant.com	8889990001
11	Simran Kaur	QA Engineer	simran@quadrant.com	9998887776
12	Aditya Jain	DevOps Engineer	aditya@quadrant.com	6655443322
13	Kavya Sinha	Intern - QA	kavya@quadrant.com	1234567893
14	Ankit Verma	Intern - DevOps	ankit@quadrant.com	1234567896
15	Meera Shah	Intern - UI/UX	meera@quadrant.com	5554443322
16	Anjali Desai	Finance Analyst	anjali@quadrant.com	9988776655
17	Manoj Gupta	Sales Executive	manoj@quadrant.com	8899776655
18	Rekha Nair	Admin Assistant	rekha@quadrant.com	7788990011
19	Karan Malhotra	IT Support	karan@quadrant.com	6677889900
20	Tarun Dey	Network Admin	tarun@quadrant.com	5566778899
\.


--
-- TOC entry 4916 (class 0 OID 16429)
-- Dependencies: 221
-- Data for Name: staff_attendance; Type: TABLE DATA; Schema: quadrant_tech; Owner: postgres
--

COPY quadrant_tech.staff_attendance (attendance_id, staff_id, attendance_date, check_in_time, check_out_time) FROM stdin;
1	1	2025-06-19	09:00:00	17:30:00
2	2	2025-06-19	09:10:00	17:40:00
3	3	2025-06-19	09:15:00	17:45:00
4	4	2025-06-19	08:45:00	17:15:00
5	5	2025-06-19	09:00:00	18:00:00
6	6	2025-06-19	09:05:00	17:35:00
7	7	2025-06-19	09:10:00	17:45:00
8	8	2025-06-19	09:00:00	17:30:00
9	9	2025-06-19	09:20:00	18:10:00
10	10	2025-06-19	09:30:00	18:00:00
11	11	2025-06-19	09:25:00	17:55:00
12	12	2025-06-19	08:50:00	17:20:00
13	13	2025-06-19	10:00:00	16:00:00
14	14	2025-06-19	10:15:00	16:15:00
15	15	2025-06-19	09:50:00	15:50:00
16	16	2025-06-19	09:00:00	17:00:00
17	17	2025-06-19	09:30:00	17:30:00
18	18	2025-06-19	09:00:00	17:30:00
19	19	2025-06-19	08:45:00	17:15:00
20	20	2025-06-19	09:10:00	17:40:00
\.


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_login_login_id_seq; Type: SEQUENCE SET; Schema: quadrant_tech; Owner: postgres
--

SELECT pg_catalog.setval('quadrant_tech.employee_login_login_id_seq', 20, true);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 220
-- Name: staff_attendance_attendance_id_seq; Type: SEQUENCE SET; Schema: quadrant_tech; Owner: postgres
--

SELECT pg_catalog.setval('quadrant_tech.staff_attendance_attendance_id_seq', 20, true);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 216
-- Name: staff_staff_id_seq; Type: SEQUENCE SET; Schema: quadrant_tech; Owner: postgres
--

SELECT pg_catalog.setval('quadrant_tech.staff_staff_id_seq', 20, true);


--
-- TOC entry 4757 (class 2606 OID 16418)
-- Name: employee_login employee_login_pkey; Type: CONSTRAINT; Schema: quadrant_tech; Owner: postgres
--

ALTER TABLE ONLY quadrant_tech.employee_login
    ADD CONSTRAINT employee_login_pkey PRIMARY KEY (login_id);


--
-- TOC entry 4759 (class 2606 OID 16420)
-- Name: employee_login employee_login_staff_id_key; Type: CONSTRAINT; Schema: quadrant_tech; Owner: postgres
--

ALTER TABLE ONLY quadrant_tech.employee_login
    ADD CONSTRAINT employee_login_staff_id_key UNIQUE (staff_id);


--
-- TOC entry 4761 (class 2606 OID 16422)
-- Name: employee_login employee_login_username_key; Type: CONSTRAINT; Schema: quadrant_tech; Owner: postgres
--

ALTER TABLE ONLY quadrant_tech.employee_login
    ADD CONSTRAINT employee_login_username_key UNIQUE (username);


--
-- TOC entry 4763 (class 2606 OID 16437)
-- Name: staff_attendance staff_attendance_pkey; Type: CONSTRAINT; Schema: quadrant_tech; Owner: postgres
--

ALTER TABLE ONLY quadrant_tech.staff_attendance
    ADD CONSTRAINT staff_attendance_pkey PRIMARY KEY (attendance_id);


--
-- TOC entry 4765 (class 2606 OID 16439)
-- Name: staff_attendance staff_attendance_staff_id_attendance_date_key; Type: CONSTRAINT; Schema: quadrant_tech; Owner: postgres
--

ALTER TABLE ONLY quadrant_tech.staff_attendance
    ADD CONSTRAINT staff_attendance_staff_id_attendance_date_key UNIQUE (staff_id, attendance_date);


--
-- TOC entry 4753 (class 2606 OID 16409)
-- Name: staff staff_email_key; Type: CONSTRAINT; Schema: quadrant_tech; Owner: postgres
--

ALTER TABLE ONLY quadrant_tech.staff
    ADD CONSTRAINT staff_email_key UNIQUE (email);


--
-- TOC entry 4755 (class 2606 OID 16407)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: quadrant_tech; Owner: postgres
--

ALTER TABLE ONLY quadrant_tech.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);


--
-- TOC entry 4766 (class 2606 OID 16423)
-- Name: employee_login employee_login_staff_id_fkey; Type: FK CONSTRAINT; Schema: quadrant_tech; Owner: postgres
--

ALTER TABLE ONLY quadrant_tech.employee_login
    ADD CONSTRAINT employee_login_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES quadrant_tech.staff(staff_id) ON DELETE CASCADE;


--
-- TOC entry 4767 (class 2606 OID 16440)
-- Name: staff_attendance staff_attendance_staff_id_fkey; Type: FK CONSTRAINT; Schema: quadrant_tech; Owner: postgres
--

ALTER TABLE ONLY quadrant_tech.staff_attendance
    ADD CONSTRAINT staff_attendance_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES quadrant_tech.staff(staff_id) ON DELETE CASCADE;


-- Completed on 2025-06-19 11:48:37

--
-- PostgreSQL database dump complete
--



--Departments
CREATE TABLE public.departments
(
    dept_no character varying(20) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT departments_pkey PRIMARY KEY (dept_no)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.departments
    OWNER to postgres;

--Dept_Emp
CREATE TABLE public.dept_emp
(
    emp_no integer,
    dept_no character varying(10) COLLATE pg_catalog."default",
    from_date date,
    to_date date,
    CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.dept_emp
    OWNER to postgres;

--Dept_Manager
CREATE TABLE public.dept_manager
(
    dept_no character varying(10) COLLATE pg_catalog."default",
    emp_no integer,
    from_date date,
    to_date date,
    CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.dept_manager
    OWNER to postgres;
	
	
--_Employees
CREATE TABLE public.employees
(
    emp_no integer NOT NULL,
    birth_date date,
    first_name character varying(100) COLLATE pg_catalog."default",
    last_name character varying(100) COLLATE pg_catalog."default",
    gender character varying(10) COLLATE pg_catalog."default",
    hire_date date,
    CONSTRAINT employess_pkey PRIMARY KEY (emp_no)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.employees
OWNER to postgres;

--salaries
CREATE TABLE public.salaries
(
    emp_no integer,
    salary double precision,
    from_date date,
    to_date date,
    CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.salaries
    OWNER to postgres;

--Titles
CREATE TABLE public.titles
(
    emp_no integer,
    title character varying(100) COLLATE pg_catalog."default",
    from_date date,
    to_date date,
    CONSTRAINT titles_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.titles
    OWNER to postgres;
BEGIN;


ALTER TABLE IF EXISTS public.campaign DROP CONSTRAINT IF EXISTS campaign_category_fkey;

ALTER TABLE IF EXISTS public.campaign DROP CONSTRAINT IF EXISTS campaign_contacts_fkey;

ALTER TABLE IF EXISTS public.campaign DROP CONSTRAINT IF EXISTS campaign_sub_category_fkey;



DROP TABLE IF EXISTS public.campaign;

CREATE TABLE IF NOT EXISTS public.campaign
(
    cf_id integer NOT NULL,
    contact_id integer NOT NULL,
    company_name character varying COLLATE pg_catalog."default",
    description character varying COLLATE pg_catalog."default",
    goal numeric,
    pledged numeric,
    outcome character varying COLLATE pg_catalog."default",
    backers_count integer,
    country character varying COLLATE pg_catalog."default",
    currency character varying COLLATE pg_catalog."default",
    launch_date timestamp with time zone,
    end_date timestamp with time zone,
    category_id character varying COLLATE pg_catalog."default" NOT NULL,
    subcategory_id character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT campaign_pkey PRIMARY KEY (cf_id)
);

DROP TABLE IF EXISTS public.category;

CREATE TABLE IF NOT EXISTS public.category
(
    category_id character varying COLLATE pg_catalog."default" NOT NULL,
    category character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT category_pkey PRIMARY KEY (category_id)
);

DROP TABLE IF EXISTS public.contacts;

CREATE TABLE IF NOT EXISTS public.contacts
(
    contact_id integer NOT NULL,
    first_name character varying COLLATE pg_catalog."default" NOT NULL,
    last_name character varying COLLATE pg_catalog."default" NOT NULL,
    email character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT contacts_pkey PRIMARY KEY (contact_id)
);

DROP TABLE IF EXISTS public.subcategory;

CREATE TABLE IF NOT EXISTS public.subcategory
(
    subcategory_id character varying COLLATE pg_catalog."default" NOT NULL,
    subcategory character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT subcategory_pkey PRIMARY KEY (subcategory_id)
);

ALTER TABLE IF EXISTS public.campaign
    ADD CONSTRAINT campaign_category_fkey FOREIGN KEY (category_id)
    REFERENCES public.category (category_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.campaign
    ADD CONSTRAINT campaign_contacts_fkey FOREIGN KEY (contact_id)
    REFERENCES public.contacts (contact_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.campaign
    ADD CONSTRAINT campaign_subcategory_fkey FOREIGN KEY (subcategory_id)
    REFERENCES public.subcategory (subcategory_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.origin_secrets DROP CONSTRAINT IF EXISTS origin_secrets_origin_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_secret_keys DROP CONSTRAINT IF EXISTS origin_secret_keys_origin_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_public_keys DROP CONSTRAINT IF EXISTS origin_public_keys_origin_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_public_encryption_keys DROP CONSTRAINT IF EXISTS origin_public_encryption_keys_origin_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_projects DROP CONSTRAINT IF EXISTS origin_projects_origin_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_project_integrations DROP CONSTRAINT IF EXISTS origin_project_integrations_project_id_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_project_integrations DROP CONSTRAINT IF EXISTS origin_project_integrations_integration_id_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_private_encryption_keys DROP CONSTRAINT IF EXISTS origin_private_encryption_keys_origin_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_packages DROP CONSTRAINT IF EXISTS origin_packages_origin_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_members DROP CONSTRAINT IF EXISTS origin_members_origin_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_invitations DROP CONSTRAINT IF EXISTS origin_invitations_origin_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_channels DROP CONSTRAINT IF EXISTS origin_channels_origin_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_channel_packages DROP CONSTRAINT IF EXISTS origin_channel_packages_package_id_fkey;
ALTER TABLE IF EXISTS ONLY public.origin_channel_packages DROP CONSTRAINT IF EXISTS origin_channel_packages_channel_id_fkey;
DROP TRIGGER IF EXISTS set_updated_at ON public.job_graph;
DROP TRIGGER IF EXISTS origin_packages_vector ON public.origin_packages;
DROP RULE IF EXISTS "_RETURN" ON public.origins_with_stats;
DROP INDEX IF EXISTS public.state;
DROP INDEX IF EXISTS public.origin_packages_origin_name_target_index;
DROP INDEX IF EXISTS public.origin_packages_ident_array_index;
DROP INDEX IF EXISTS public.origin_channel_packages_packages_index;
DROP INDEX IF EXISTS public.job_graph_dependencies_idx;
DROP INDEX IF EXISTS public.ident_index;
ALTER TABLE IF EXISTS ONLY public.origins DROP CONSTRAINT IF EXISTS origins_pkey;
ALTER TABLE IF EXISTS ONLY public.origins DROP CONSTRAINT IF EXISTS origins_name_key;
ALTER TABLE IF EXISTS ONLY public.origin_secrets DROP CONSTRAINT IF EXISTS origin_secrets_pkey;
ALTER TABLE IF EXISTS ONLY public.origin_secret_keys DROP CONSTRAINT IF EXISTS origin_secret_keys_pkey;
ALTER TABLE IF EXISTS ONLY public.origin_secret_keys DROP CONSTRAINT IF EXISTS origin_secret_keys_full_name_key;
ALTER TABLE IF EXISTS ONLY public.origin_public_keys DROP CONSTRAINT IF EXISTS origin_public_keys_pkey;
ALTER TABLE IF EXISTS ONLY public.origin_public_keys DROP CONSTRAINT IF EXISTS origin_public_keys_full_name_key;
ALTER TABLE IF EXISTS ONLY public.origin_public_encryption_keys DROP CONSTRAINT IF EXISTS origin_public_encryption_keys_pkey;
ALTER TABLE IF EXISTS ONLY public.origin_public_encryption_keys DROP CONSTRAINT IF EXISTS origin_public_encryption_keys_full_name_key;
ALTER TABLE IF EXISTS ONLY public.origin_projects DROP CONSTRAINT IF EXISTS origin_projects_pkey;
ALTER TABLE IF EXISTS ONLY public.origin_projects DROP CONSTRAINT IF EXISTS origin_projects_origin_package_name_name_target_key;
ALTER TABLE IF EXISTS ONLY public.origin_project_integrations DROP CONSTRAINT IF EXISTS origin_project_integrations_project_id_integration_id_key;
ALTER TABLE IF EXISTS ONLY public.origin_project_integrations DROP CONSTRAINT IF EXISTS origin_project_integrations_pkey;
ALTER TABLE IF EXISTS ONLY public.origin_private_encryption_keys DROP CONSTRAINT IF EXISTS origin_private_encryption_keys_pkey;
ALTER TABLE IF EXISTS ONLY public.origin_private_encryption_keys DROP CONSTRAINT IF EXISTS origin_private_encryption_keys_full_name_key;
ALTER TABLE IF EXISTS ONLY public.origin_packages DROP CONSTRAINT IF EXISTS origin_packages_pkey;
ALTER TABLE IF EXISTS ONLY public.origin_packages DROP CONSTRAINT IF EXISTS origin_packages_ident_target_key;
ALTER TABLE IF EXISTS ONLY public.origin_package_settings DROP CONSTRAINT IF EXISTS origin_package_settings_pkey;
ALTER TABLE IF EXISTS ONLY public.origin_package_settings DROP CONSTRAINT IF EXISTS origin_package_settings_origin_name_key;
ALTER TABLE IF EXISTS ONLY public.origin_members DROP CONSTRAINT IF EXISTS origin_members_origin_account_id_key;
ALTER TABLE IF EXISTS ONLY public.origin_invitations DROP CONSTRAINT IF EXISTS origin_invitations_pkey;
ALTER TABLE IF EXISTS ONLY public.origin_invitations DROP CONSTRAINT IF EXISTS origin_invitations_origin_account_id_key;
ALTER TABLE IF EXISTS ONLY public.origin_integrations DROP CONSTRAINT IF EXISTS origin_integrations_pkey;
ALTER TABLE IF EXISTS ONLY public.origin_integrations DROP CONSTRAINT IF EXISTS origin_integrations_origin_integration_name_key;
ALTER TABLE IF EXISTS ONLY public.origin_channels DROP CONSTRAINT IF EXISTS origin_channels_pkey;
ALTER TABLE IF EXISTS ONLY public.origin_channels DROP CONSTRAINT IF EXISTS origin_channels_origin_name_key;
ALTER TABLE IF EXISTS ONLY public.origin_channel_packages DROP CONSTRAINT IF EXISTS origin_channel_packages_pkey;
ALTER TABLE IF EXISTS ONLY public.job_graph DROP CONSTRAINT IF EXISTS job_graph_pkey;
ALTER TABLE IF EXISTS ONLY public.audit_origin DROP CONSTRAINT IF EXISTS audit_origin_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts DROP CONSTRAINT IF EXISTS accounts_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts DROP CONSTRAINT IF EXISTS accounts_name_key;
ALTER TABLE IF EXISTS ONLY public.account_tokens DROP CONSTRAINT IF EXISTS account_tokens_token_key;
ALTER TABLE IF EXISTS ONLY public.account_tokens DROP CONSTRAINT IF EXISTS account_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.account_tokens DROP CONSTRAINT IF EXISTS account_tokens_account_id_key;
ALTER TABLE IF EXISTS ONLY public.__diesel_schema_migrations DROP CONSTRAINT IF EXISTS __diesel_schema_migrations_pkey;
DROP VIEW IF EXISTS public.packages_with_channel_platform;
DROP TABLE IF EXISTS public.origins_with_stats;
DROP VIEW IF EXISTS public.origins_with_secret_key;
DROP TABLE IF EXISTS public.origins;
DROP TABLE IF EXISTS public.origin_secrets;
DROP SEQUENCE IF EXISTS public.origin_secrets_id_seq;
DROP TABLE IF EXISTS public.origin_secret_keys;
DROP SEQUENCE IF EXISTS public.origin_secret_key_id_seq;
DROP TABLE IF EXISTS public.origin_public_keys;
DROP TABLE IF EXISTS public.origin_public_encryption_keys;
DROP SEQUENCE IF EXISTS public.origin_public_key_id_seq;
DROP SEQUENCE IF EXISTS public.origin_public_encryption_key_id_seq;
DROP TABLE IF EXISTS public.origin_projects;
DROP TABLE IF EXISTS public.origin_project_integrations;
DROP SEQUENCE IF EXISTS public.origin_project_integration_id_seq;
DROP SEQUENCE IF EXISTS public.origin_project_id_seq;
DROP TABLE IF EXISTS public.origin_private_encryption_keys;
DROP SEQUENCE IF EXISTS public.origin_private_encryption_key_id_seq;
DROP VIEW IF EXISTS public.origin_packages_with_version_array;
DROP VIEW IF EXISTS public.origin_package_versions;
DROP TABLE IF EXISTS public.origin_package_settings;
DROP SEQUENCE IF EXISTS public.origin_package_settings_id_seq;
DROP TABLE IF EXISTS public.origin_members;
DROP TABLE IF EXISTS public.origin_invitations;
DROP SEQUENCE IF EXISTS public.origin_invitations_id_seq;
DROP TABLE IF EXISTS public.origin_integrations;
DROP SEQUENCE IF EXISTS public.origin_integration_id_seq;
DROP SEQUENCE IF EXISTS public.origin_id_seq;
DROP TABLE IF EXISTS public.origin_channels;
DROP TABLE IF EXISTS public.origin_channel_packages;
DROP SEQUENCE IF EXISTS public.origin_channel_id_seq;
DROP VIEW IF EXISTS public.job_graph_completed;
DROP TABLE IF EXISTS public.job_graph;
DROP SEQUENCE IF EXISTS public.job_graph_id_seq;
DROP TABLE IF EXISTS public.audit_package_group;
DROP TABLE IF EXISTS public.audit_package;
DROP TABLE IF EXISTS public.audit_origin;
DROP SEQUENCE IF EXISTS public.audit_origin_id_seq;
DROP TABLE IF EXISTS public.accounts;
DROP SEQUENCE IF EXISTS public.accounts_id_seq;
DROP TABLE IF EXISTS public.account_tokens;
DROP SEQUENCE IF EXISTS public.account_tokens_id_seq;
DROP TABLE IF EXISTS public.__diesel_schema_migrations;
DROP FUNCTION IF EXISTS public.update_origin_package_vector_index();
DROP FUNCTION IF EXISTS public.t_rdeps_for_id(job_graph_id bigint);
DROP FUNCTION IF EXISTS public.t_deps_for_id_group(in_id bigint, in_group_id bigint);
DROP FUNCTION IF EXISTS public.t_deps_for_id(job_graph_id bigint);
DROP FUNCTION IF EXISTS public.job_graph_mark_failed(job_graph_id bigint);
DROP FUNCTION IF EXISTS public.job_graph_mark_complete(job_graph_id bigint, as_built text);
DROP FUNCTION IF EXISTS public.job_graph_fixup_waiting_on_count();
DROP FUNCTION IF EXISTS public.get_origin_package_v5(op_ident text, op_visibilities public.origin_package_visibility[]);
DROP FUNCTION IF EXISTS public.get_all_origin_packages_for_ident_v1(op_ident text);
DROP TABLE IF EXISTS public.origin_packages;
DROP SEQUENCE IF EXISTS public.origin_package_id_seq;
DROP FUNCTION IF EXISTS public.next_id_v1(sequence_id regclass, OUT result bigint);
DROP FUNCTION IF EXISTS public.diesel_set_updated_at();
DROP FUNCTION IF EXISTS public.diesel_manage_updated_at(_tbl regclass);
DROP TYPE IF EXISTS public.package_channel_trigger;
DROP TYPE IF EXISTS public.origin_package_visibility;
DROP TYPE IF EXISTS public.origin_package_operation;
DROP TYPE IF EXISTS public.origin_operation;
DROP TYPE IF EXISTS public.origin_member_role;
DROP TYPE IF EXISTS public.job_exec_state;
DROP EXTENSION IF EXISTS intarray;
DROP EXTENSION IF EXISTS plpgsql;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: hab
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO hab;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: hab
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- Name: job_exec_state; Type: TYPE; Schema: public; Owner: hab
--

CREATE TYPE public.job_exec_state AS ENUM (
    'pending',
    'waiting_on_dependency',
    'ready',
    'running',
    'complete',
    'job_failed',
    'dependency_failed',
    'cancel_pending',
    'cancel_complete'
);


ALTER TYPE public.job_exec_state OWNER TO hab;

--
-- Name: origin_member_role; Type: TYPE; Schema: public; Owner: hab
--

CREATE TYPE public.origin_member_role AS ENUM (
    'readonly_member',
    'member',
    'maintainer',
    'administrator',
    'owner'
);


ALTER TYPE public.origin_member_role OWNER TO hab;

--
-- Name: origin_operation; Type: TYPE; Schema: public; Owner: hab
--

CREATE TYPE public.origin_operation AS ENUM (
    'origin_create',
    'origin_delete',
    'owner_transfer'
);


ALTER TYPE public.origin_operation OWNER TO hab;

--
-- Name: origin_package_operation; Type: TYPE; Schema: public; Owner: hab
--

CREATE TYPE public.origin_package_operation AS ENUM (
    'promote',
    'demote'
);


ALTER TYPE public.origin_package_operation OWNER TO hab;

--
-- Name: origin_package_visibility; Type: TYPE; Schema: public; Owner: hab
--

CREATE TYPE public.origin_package_visibility AS ENUM (
    'public',
    'private',
    'hidden'
);


ALTER TYPE public.origin_package_visibility OWNER TO hab;

--
-- Name: package_channel_trigger; Type: TYPE; Schema: public; Owner: hab
--

CREATE TYPE public.package_channel_trigger AS ENUM (
    'unknown',
    'builder_ui',
    'hab_client'
);


ALTER TYPE public.package_channel_trigger OWNER TO hab;

--
-- Name: diesel_manage_updated_at(regclass); Type: FUNCTION; Schema: public; Owner: hab
--

CREATE FUNCTION public.diesel_manage_updated_at(_tbl regclass) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    EXECUTE format('CREATE TRIGGER set_updated_at BEFORE UPDATE ON %s
                    FOR EACH ROW EXECUTE PROCEDURE diesel_set_updated_at()', _tbl);
END;
$$;


ALTER FUNCTION public.diesel_manage_updated_at(_tbl regclass) OWNER TO hab;

--
-- Name: diesel_set_updated_at(); Type: FUNCTION; Schema: public; Owner: hab
--

CREATE FUNCTION public.diesel_set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (
        NEW IS DISTINCT FROM OLD AND
        NEW.updated_at IS NOT DISTINCT FROM OLD.updated_at
    ) THEN
        NEW.updated_at := current_timestamp;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.diesel_set_updated_at() OWNER TO hab;

--
-- Name: next_id_v1(regclass); Type: FUNCTION; Schema: public; Owner: hab
--

CREATE FUNCTION public.next_id_v1(sequence_id regclass, OUT result bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
                DECLARE
                    our_epoch bigint := 1409266191000;
                    seq_id bigint;
                    now_millis bigint;
                BEGIN
                    SELECT nextval(sequence_id) % 1024 INTO seq_id;
                    SELECT FLOOR(EXTRACT(EPOCH FROM clock_timestamp()) * 1000) INTO now_millis;
                    result := (now_millis - our_epoch) << 23;
                    result := result | (seq_id << 13);
                END;
                $$;


ALTER FUNCTION public.next_id_v1(sequence_id regclass, OUT result bigint) OWNER TO hab;

--
-- Name: origin_package_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_package_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_package_id_seq OWNER TO hab;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: origin_packages; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_packages (
    id bigint DEFAULT public.next_id_v1('public.origin_package_id_seq'::regclass) NOT NULL,
    owner_id bigint,
    name text,
    ident text,
    ident_array text[],
    checksum text,
    manifest text,
    config text,
    target text,
    deps text[],
    tdeps text[],
    exposes integer[],
    scheduler_sync boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    visibility public.origin_package_visibility DEFAULT 'public'::public.origin_package_visibility NOT NULL,
    ident_vector tsvector,
    origin text,
    build_deps text[] DEFAULT '{}'::text[],
    build_tdeps text[] DEFAULT '{}'::text[]
);


ALTER TABLE public.origin_packages OWNER TO hab;

--
-- Name: get_all_origin_packages_for_ident_v1(text); Type: FUNCTION; Schema: public; Owner: hab
--

CREATE FUNCTION public.get_all_origin_packages_for_ident_v1(op_ident text) RETURNS SETOF public.origin_packages
    LANGUAGE plpgsql STABLE
    AS $$
  BEGIN
    RETURN QUERY SELECT * FROM origin_packages WHERE ident LIKE (op_ident || '%') ORDER BY ident;
    RETURN;
  END
  $$;


ALTER FUNCTION public.get_all_origin_packages_for_ident_v1(op_ident text) OWNER TO hab;

--
-- Name: get_origin_package_v5(text, public.origin_package_visibility[]); Type: FUNCTION; Schema: public; Owner: hab
--

CREATE FUNCTION public.get_origin_package_v5(op_ident text, op_visibilities public.origin_package_visibility[]) RETURNS SETOF public.origin_packages
    LANGUAGE sql STABLE
    AS $$
    SELECT *
    FROM origin_packages
    WHERE ident = op_ident
    AND visibility = ANY(op_visibilities);
$$;


ALTER FUNCTION public.get_origin_package_v5(op_ident text, op_visibilities public.origin_package_visibility[]) OWNER TO hab;

--
-- Name: job_graph_fixup_waiting_on_count(); Type: FUNCTION; Schema: public; Owner: hab
--

CREATE FUNCTION public.job_graph_fixup_waiting_on_count() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
i_count integer;
BEGIN
UPDATE job_graph
SET waiting_on_count = subquery.remaining
FROM (SELECT id, (cardinality(k.dependencies) - complete_count) AS remaining
      FROM (
            SELECT *,
               (
               SELECT
               count(*)
               FROM
               job_graph AS d
               WHERE
               d.group_id = d.group_id
               AND j.dependencies @> array[d.id]::bigint[]
               AND d.job_state = 'complete')
             AS complete_count
             FROM job_graph AS j)
       AS k) AS subquery
WHERE
 job_graph.id = subquery.id
AND  waiting_on_count != subquery.remaining;
GET DIAGNOSTICS i_count = ROW_COUNT;
RETURN i_count;
END
$$;


ALTER FUNCTION public.job_graph_fixup_waiting_on_count() OWNER TO hab;

--
-- Name: job_graph_mark_complete(bigint, text); Type: FUNCTION; Schema: public; Owner: hab
--

CREATE FUNCTION public.job_graph_mark_complete(job_graph_id bigint, as_built text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  i_count integer;
BEGIN
  -- Decrement count of the things that depend on us
  -- TODO: Consider limiting this update to jobs 'ready'
  UPDATE job_graph
    SET waiting_on_count = waiting_on_count - 1
    FROM (SELECT id
          FROM job_graph AS d
          WHERE d.dependencies @> array[job_graph_id]::bigint[]
         ) as deps
    WHERE job_graph.id = deps.id;

  UPDATE job_graph
    SET job_state = 'ready'
    WHERE waiting_on_count = 0
    AND job_state = 'waiting_on_dependency';

  -- postgres magic to get number of altered rows in prior query
  GET DIAGNOSTICS i_count = ROW_COUNT;

  -- Mark this job complete
  -- TODO: Consider limiting this update to jobs 'Pending'
  UPDATE job_graph
    SET job_state = 'complete', as_built_ident = as_built
    WHERE id = job_graph_id;

  RETURN i_count;
END
$$;


ALTER FUNCTION public.job_graph_mark_complete(job_graph_id bigint, as_built text) OWNER TO hab;

--
-- Name: job_graph_mark_failed(bigint); Type: FUNCTION; Schema: public; Owner: hab
--

CREATE FUNCTION public.job_graph_mark_failed(job_graph_id bigint) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  failed_count integer;
BEGIN
  -- Recursively expand all things that depend on me
  -- this maybe could be DRY with the t_rdeps_for_id call above
  WITH RECURSIVE re(id) AS (
    SELECT g.id FROM job_graph g where g.dependencies @> array[job_graph_id]::bigint[]
  UNION
    SELECT g.id
    FROM job_graph g, re
    WHERE g.dependencies @> array[re.id]::bigint[])
  UPDATE job_graph SET job_state = 'dependency_failed'
    WHERE id IN (SELECT id from re)
    AND (job_state = 'waiting_on_dependency' OR job_state = 'ready');

  GET DIAGNOSTICS failed_count = ROW_COUNT;

  -- Mark this job complete
  -- TODO: Consider limiting this update to jobs 'Pending'
  UPDATE job_graph SET job_state = 'job_failed'
  WHERE id = job_graph_id;

  RETURN failed_count;
END
$$;


ALTER FUNCTION public.job_graph_mark_failed(job_graph_id bigint) OWNER TO hab;

--
-- Name: t_deps_for_id(bigint); Type: FUNCTION; Schema: public; Owner: hab
--

CREATE FUNCTION public.t_deps_for_id(job_graph_id bigint) RETURNS SETOF bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  failed_count integer;
BEGIN
  -- Recursively expand all things that depend on me
  RETURN QUERY (
    WITH RECURSIVE re(id) AS (
      SELECT UNNEST(g.dependencies) FROM job_graph g WHERE g.id = job_graph_id
    UNION
      SELECT UNNEST(g.dependencies)
      FROM job_graph g, re
      WHERE g.id = re.id)
    SELECT * FROM re);
END
$$;


ALTER FUNCTION public.t_deps_for_id(job_graph_id bigint) OWNER TO hab;

--
-- Name: t_deps_for_id_group(bigint, bigint); Type: FUNCTION; Schema: public; Owner: hab
--

CREATE FUNCTION public.t_deps_for_id_group(in_id bigint, in_group_id bigint) RETURNS SETOF bigint
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Recursively expand all things that depend on me
  RETURN QUERY (
    WITH RECURSIVE re(id) AS (
      SELECT UNNEST(g.dependencies) FROM job_graph g where g.id = in_id
    AND g.group_id = in_group_id
    UNION
      SELECT UNNEST(g2.dependencies)
      FROM job_graph g2, re
      WHERE g2.id = re.id  AND g2.group_id = in_group_id )
    SELECT * FROM re);
END
$$;


ALTER FUNCTION public.t_deps_for_id_group(in_id bigint, in_group_id bigint) OWNER TO hab;

--
-- Name: t_rdeps_for_id(bigint); Type: FUNCTION; Schema: public; Owner: hab
--

CREATE FUNCTION public.t_rdeps_for_id(job_graph_id bigint) RETURNS SETOF bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  failed_count integer;
BEGIN
  -- Recursively expand all things that depend on me
  RETURN QUERY (
    WITH RECURSIVE re(id) AS (
      SELECT g.id FROM job_graph g WHERE g.dependencies @> array[job_graph_id]::bigint[]
    UNION
      SELECT g.id
      FROM job_graph g, re
      WHERE g.dependencies @> array[re.id]::bigint[] )
    SELECT * FROM re);
END
$$;


ALTER FUNCTION public.t_rdeps_for_id(job_graph_id bigint) OWNER TO hab;

--
-- Name: update_origin_package_vector_index(); Type: FUNCTION; Schema: public; Owner: hab
--

CREATE FUNCTION public.update_origin_package_vector_index() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE iws TEXT;
    BEGIN
        NEW.ident_vector := to_tsvector(array_to_string(NEW.ident_array[1:2], ' '));
        RETURN NEW;
    END;
$$;


ALTER FUNCTION public.update_origin_package_vector_index() OWNER TO hab;

--
-- Name: __diesel_schema_migrations; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.__diesel_schema_migrations (
    version character varying(50) NOT NULL,
    run_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.__diesel_schema_migrations OWNER TO hab;

--
-- Name: account_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.account_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_tokens_id_seq OWNER TO hab;

--
-- Name: account_tokens; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.account_tokens (
    id bigint DEFAULT public.next_id_v1('public.account_tokens_id_seq'::regclass) NOT NULL,
    account_id bigint,
    token text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.account_tokens OWNER TO hab;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO hab;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.accounts (
    id bigint DEFAULT public.next_id_v1('public.accounts_id_seq'::regclass) NOT NULL,
    name text,
    email text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.accounts OWNER TO hab;

--
-- Name: audit_origin_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.audit_origin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audit_origin_id_seq OWNER TO hab;

--
-- Name: audit_origin; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.audit_origin (
    id bigint DEFAULT public.next_id_v1('public.audit_origin_id_seq'::regclass) NOT NULL,
    operation public.origin_operation,
    target_object text,
    origin text,
    requester_id bigint,
    requester_name text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.audit_origin OWNER TO hab;

--
-- Name: audit_package; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.audit_package (
    operation public.origin_package_operation,
    trigger public.package_channel_trigger,
    requester_id bigint,
    requester_name text,
    created_at timestamp with time zone DEFAULT now(),
    origin text,
    channel text,
    package_ident text
);


ALTER TABLE public.audit_package OWNER TO hab;

--
-- Name: audit_package_group; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.audit_package_group (
    package_ids bigint[],
    operation public.origin_package_operation,
    trigger public.package_channel_trigger,
    requester_id bigint,
    requester_name text,
    group_id bigint,
    created_at timestamp with time zone DEFAULT now(),
    origin text,
    channel text
);


ALTER TABLE public.audit_package_group OWNER TO hab;

--
-- Name: job_graph_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.job_graph_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_graph_id_seq OWNER TO hab;

--
-- Name: job_graph; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.job_graph (
    id bigint DEFAULT nextval('public.job_graph_id_seq'::regclass) NOT NULL,
    group_id bigint NOT NULL,
    project_name text,
    job_id bigint,
    job_state public.job_exec_state,
    manifest_ident text,
    as_built_ident text,
    dependencies bigint[] NOT NULL,
    waiting_on_count integer NOT NULL,
    target_platform text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.job_graph OWNER TO hab;

--
-- Name: job_graph_completed; Type: VIEW; Schema: public; Owner: hab
--

CREATE VIEW public.job_graph_completed AS
 SELECT j.id,
    j.group_id,
    j.project_name,
    j.job_id,
    j.job_state,
    j.manifest_ident,
    j.as_built_ident,
    j.dependencies,
    j.waiting_on_count,
    j.target_platform,
    j.created_at,
    j.updated_at,
    ( SELECT array_cat(ARRAY[]::bigint[], array_agg(d.id)) AS array_cat
           FROM public.job_graph d
          WHERE ((d.id = ANY (j.dependencies)) AND (d.job_state = 'complete'::public.job_exec_state))) AS complete
   FROM public.job_graph j;


ALTER TABLE public.job_graph_completed OWNER TO hab;

--
-- Name: origin_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_channel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_channel_id_seq OWNER TO hab;

--
-- Name: origin_channel_packages; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_channel_packages (
    channel_id bigint NOT NULL,
    package_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.origin_channel_packages OWNER TO hab;

--
-- Name: origin_channels; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_channels (
    id bigint DEFAULT public.next_id_v1('public.origin_channel_id_seq'::regclass) NOT NULL,
    owner_id bigint,
    name text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    origin text
);


ALTER TABLE public.origin_channels OWNER TO hab;

--
-- Name: origin_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_id_seq OWNER TO hab;

--
-- Name: origin_integration_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_integration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_integration_id_seq OWNER TO hab;

--
-- Name: origin_integrations; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_integrations (
    id bigint DEFAULT public.next_id_v1('public.origin_integration_id_seq'::regclass) NOT NULL,
    origin text,
    integration text,
    name text,
    body text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.origin_integrations OWNER TO hab;

--
-- Name: origin_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_invitations_id_seq OWNER TO hab;

--
-- Name: origin_invitations; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_invitations (
    id bigint DEFAULT public.next_id_v1('public.origin_invitations_id_seq'::regclass) NOT NULL,
    origin text,
    account_id bigint,
    account_name text,
    owner_id bigint,
    ignored boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.origin_invitations OWNER TO hab;

--
-- Name: origin_members; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_members (
    origin text,
    account_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    member_role public.origin_member_role DEFAULT 'readonly_member'::public.origin_member_role NOT NULL
);


ALTER TABLE public.origin_members OWNER TO hab;

--
-- Name: origin_package_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_package_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_package_settings_id_seq OWNER TO hab;

--
-- Name: origin_package_settings; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_package_settings (
    id bigint DEFAULT public.next_id_v1('public.origin_package_settings_id_seq'::regclass) NOT NULL,
    origin text,
    name text,
    visibility public.origin_package_visibility,
    owner_id bigint,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.origin_package_settings OWNER TO hab;

--
-- Name: origin_package_versions; Type: VIEW; Schema: public; Owner: hab
--

CREATE VIEW public.origin_package_versions AS
 SELECT origin_packages.origin,
    origin_packages.name,
    origin_packages.visibility,
    origin_packages.ident_array[3] AS version,
    count(origin_packages.ident_array[4]) AS release_count,
    max(origin_packages.ident_array[4]) AS latest,
    array_agg(DISTINCT origin_packages.target) AS platforms,
    regexp_matches(origin_packages.ident_array[3], '([\d\.]*\d+)(.+)?'::text) AS version_array
   FROM public.origin_packages
  GROUP BY origin_packages.ident_array[3], origin_packages.origin, origin_packages.name, origin_packages.visibility;


ALTER TABLE public.origin_package_versions OWNER TO hab;

--
-- Name: origin_packages_with_version_array; Type: VIEW; Schema: public; Owner: hab
--

CREATE VIEW public.origin_packages_with_version_array AS
 SELECT origin_packages.id,
    origin_packages.owner_id,
    origin_packages.name,
    origin_packages.ident,
    origin_packages.ident_array,
    origin_packages.checksum,
    origin_packages.manifest,
    origin_packages.config,
    origin_packages.target,
    origin_packages.deps,
    origin_packages.tdeps,
    origin_packages.exposes,
    origin_packages.created_at,
    origin_packages.updated_at,
    origin_packages.visibility,
    origin_packages.origin,
    origin_packages.build_deps,
    origin_packages.build_tdeps,
    regexp_matches(origin_packages.ident_array[3], '([\d\.]*\d+)(.+)?'::text) AS version_array
   FROM public.origin_packages;


ALTER TABLE public.origin_packages_with_version_array OWNER TO hab;

--
-- Name: origin_private_encryption_key_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_private_encryption_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_private_encryption_key_id_seq OWNER TO hab;

--
-- Name: origin_private_encryption_keys; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_private_encryption_keys (
    id bigint DEFAULT public.next_id_v1('public.origin_private_encryption_key_id_seq'::regclass) NOT NULL,
    owner_id bigint,
    name text,
    revision text,
    full_name text,
    body text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    origin text
);


ALTER TABLE public.origin_private_encryption_keys OWNER TO hab;

--
-- Name: origin_project_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_project_id_seq OWNER TO hab;

--
-- Name: origin_project_integration_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_project_integration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_project_integration_id_seq OWNER TO hab;

--
-- Name: origin_project_integrations; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_project_integrations (
    id bigint DEFAULT public.next_id_v1('public.origin_project_integration_id_seq'::regclass) NOT NULL,
    origin text NOT NULL,
    body text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL,
    integration_id bigint NOT NULL
);


ALTER TABLE public.origin_project_integrations OWNER TO hab;

--
-- Name: origin_projects; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_projects (
    id bigint DEFAULT public.next_id_v1('public.origin_project_id_seq'::regclass) NOT NULL,
    origin text,
    package_name text,
    name text,
    plan_path text,
    owner_id bigint,
    vcs_type text,
    vcs_data text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    vcs_installation_id bigint,
    visibility public.origin_package_visibility DEFAULT 'public'::public.origin_package_visibility NOT NULL,
    auto_build boolean DEFAULT true NOT NULL,
    target text
);


ALTER TABLE public.origin_projects OWNER TO hab;

--
-- Name: origin_public_encryption_key_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_public_encryption_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_public_encryption_key_id_seq OWNER TO hab;

--
-- Name: origin_public_key_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_public_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_public_key_id_seq OWNER TO hab;

--
-- Name: origin_public_encryption_keys; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_public_encryption_keys (
    id bigint DEFAULT public.next_id_v1('public.origin_public_key_id_seq'::regclass) NOT NULL,
    owner_id bigint,
    name text,
    revision text,
    full_name text,
    body text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    origin text
);


ALTER TABLE public.origin_public_encryption_keys OWNER TO hab;

--
-- Name: origin_public_keys; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_public_keys (
    id bigint DEFAULT public.next_id_v1('public.origin_public_key_id_seq'::regclass) NOT NULL,
    owner_id bigint,
    name text,
    revision text,
    full_name text,
    body text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    origin text
);


ALTER TABLE public.origin_public_keys OWNER TO hab;

--
-- Name: origin_secret_key_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_secret_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_secret_key_id_seq OWNER TO hab;

--
-- Name: origin_secret_keys; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_secret_keys (
    id bigint DEFAULT public.next_id_v1('public.origin_secret_key_id_seq'::regclass) NOT NULL,
    owner_id bigint,
    name text,
    revision text,
    full_name text,
    body text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    origin text,
    encryption_key_rev text
);


ALTER TABLE public.origin_secret_keys OWNER TO hab;

--
-- Name: origin_secrets_id_seq; Type: SEQUENCE; Schema: public; Owner: hab
--

CREATE SEQUENCE public.origin_secrets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_secrets_id_seq OWNER TO hab;

--
-- Name: origin_secrets; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origin_secrets (
    id bigint DEFAULT public.next_id_v1('public.origin_secrets_id_seq'::regclass) NOT NULL,
    owner_id bigint,
    name text,
    value text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    origin text
);


ALTER TABLE public.origin_secrets OWNER TO hab;

--
-- Name: origins; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origins (
    name text NOT NULL,
    owner_id bigint,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    default_package_visibility public.origin_package_visibility DEFAULT 'public'::public.origin_package_visibility NOT NULL
);


ALTER TABLE public.origins OWNER TO hab;

--
-- Name: origins_with_secret_key; Type: VIEW; Schema: public; Owner: hab
--

CREATE VIEW public.origins_with_secret_key AS
 SELECT origins.name,
    origins.owner_id,
    origin_secret_keys.full_name AS private_key_name,
    origins.default_package_visibility,
    accounts.name AS owner_account
   FROM ((public.origins
     LEFT JOIN public.origin_secret_keys ON ((origins.name = origin_secret_keys.origin)))
     LEFT JOIN public.accounts ON ((origins.owner_id = accounts.id)))
  ORDER BY origins.name, origin_secret_keys.full_name DESC;


ALTER TABLE public.origins_with_secret_key OWNER TO hab;

--
-- Name: origins_with_stats; Type: TABLE; Schema: public; Owner: hab
--

CREATE TABLE public.origins_with_stats (
    name text,
    owner_id bigint,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    default_package_visibility public.origin_package_visibility,
    package_count bigint
);

ALTER TABLE ONLY public.origins_with_stats REPLICA IDENTITY NOTHING;


ALTER TABLE public.origins_with_stats OWNER TO hab;

--
-- Name: packages_with_channel_platform; Type: VIEW; Schema: public; Owner: hab
--

CREATE VIEW public.packages_with_channel_platform AS
 SELECT op.id,
    op.owner_id,
    op.name,
    op.ident,
    op.ident_array,
    op.checksum,
    op.manifest,
    op.config,
    op.target,
    op.deps,
    op.tdeps,
    op.build_deps,
    op.build_tdeps,
    op.exposes,
    op.visibility,
    op.created_at,
    op.updated_at,
    op.origin,
    array_agg(oc.name) OVER w AS channels,
    array_agg(op.target) OVER w AS platforms
   FROM ((public.origin_packages op
     JOIN public.origin_channel_packages ocp ON ((op.id = ocp.package_id)))
     JOIN public.origin_channels oc ON ((oc.id = ocp.channel_id)))
  WINDOW w AS (PARTITION BY op.origin, op.name, op.ident);


ALTER TABLE public.packages_with_channel_platform OWNER TO hab;

--
-- Data for Name: __diesel_schema_migrations; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.__diesel_schema_migrations (version, run_on) FROM stdin;
00000000000000	2021-11-06 21:38:53.385423
20180824184520	2021-11-06 21:38:53.385423
20180824193407	2021-11-06 21:38:53.385423
20181009192420	2021-11-06 21:38:53.385423
20181010198563	2021-11-06 21:38:53.385423
20181019666111	2021-11-06 21:38:53.385423
20181031233453	2021-11-06 21:38:53.385423
20181101111111	2021-11-06 21:38:53.385423
20181102111111	2021-11-06 21:38:53.385423
20181106111111	2021-11-06 21:38:53.385423
20181106222222	2021-11-06 21:38:53.385423
20181106444444	2021-11-06 21:38:53.385423
20181112111111	2021-11-06 21:38:53.385423
20190321066600	2021-11-06 21:38:53.385423
20190405002317	2021-11-06 21:38:53.385423
20190419	2021-11-06 21:38:53.385423
20190513223900	2021-11-06 21:38:53.385423
20190516004032	2021-11-06 21:38:53.385423
20190531198242	2021-11-06 21:38:53.385423
20190617214130	2021-11-06 21:38:53.385423
20190624198169	2021-11-06 21:38:53.385423
20191016347289	2021-11-06 21:38:53.385423
20191105011907	2021-11-06 21:38:53.385423
20191205163232	2021-11-06 21:38:53.385423
20200128174159	2021-11-06 21:38:53.385423
20200203175437	2021-11-06 21:38:53.385423
20200211810532	2021-11-06 21:38:53.385423
20200212195406	2021-11-06 21:38:53.385423
20200303000001	2021-11-06 21:38:53.385423
20200326195026	2021-11-06 21:38:53.385423
20200327193418	2021-11-06 21:38:53.385423
20200422172800	2021-11-06 21:38:53.385423
20200423220500	2021-11-06 21:38:53.385423
20200804136423	2021-11-06 21:38:53.385423
20200908193306	2021-11-06 21:38:53.385423
20200908195315	2021-11-06 21:38:53.385423
20201109000001	2021-11-06 21:38:53.385423
\.


--
-- Data for Name: account_tokens; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.account_tokens (id, account_id, token, created_at) FROM stdin;
1903954122277658624	1903950252151414784	_Qk9YLTEKYmxkci0yMDIxMTEwODE3NTQ0OApibGRyLTIwMjExMTA4MTc1NDQ4CnhpUVZpZzdnWkVKNkROWGNaRHBGY0ZrU3hRakg0bHJUCjBOQk8rQnVCNkpmUEVSTGR2Y01va2dQK2Z1ZnVSV2lBK3JBMGNISEVlVUFDWGp2ag==	2021-11-06 21:46:49.2527+00
\.


--
-- Name: account_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.account_tokens_id_seq', 3, true);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.accounts (id, name, email, created_at, updated_at) FROM stdin;
1903950252151414784	chef-davin	Davin.Taddeo@progress.com	2021-11-06 21:39:07.898446+00	2021-11-06 21:39:07.898446+00
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.accounts_id_seq', 2, true);


--
-- Data for Name: audit_origin; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.audit_origin (id, operation, target_object, origin, requester_id, requester_name, created_at) FROM stdin;
1903950513095843840	origin_create	core	core	1903950252151414784	chef-davin	2021-11-06 21:39:39.00652+00
1904426183013974016	origin_create	chef	chef	1903950252151414784	chef-davin	2021-11-07 13:24:43.279015+00
1904426252354215936	origin_create	habitat	habitat	1903950252151414784	chef-davin	2021-11-07 13:24:51.545133+00
\.


--
-- Name: audit_origin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.audit_origin_id_seq', 1, true);


--
-- Data for Name: audit_package; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.audit_package (operation, trigger, requester_id, requester_name, created_at, origin, channel, package_ident) FROM stdin;
\.


--
-- Data for Name: audit_package_group; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.audit_package_group (package_ids, operation, trigger, requester_id, requester_name, group_id, created_at, origin, channel) FROM stdin;
\.


--
-- Data for Name: job_graph; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.job_graph (id, group_id, project_name, job_id, job_state, manifest_ident, as_built_ident, dependencies, waiting_on_count, target_platform, created_at, updated_at) FROM stdin;
\.


--
-- Name: job_graph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.job_graph_id_seq', 1, false);


--
-- Name: origin_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_channel_id_seq', 2, true);


--
-- Data for Name: origin_channel_packages; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_channel_packages (channel_id, package_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: origin_channels; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_channels (id, owner_id, name, created_at, updated_at, origin) FROM stdin;
1903950512944848896	1903950252151414784	unstable	2021-11-06 21:39:38.988446+00	2021-11-06 21:39:38.988446+00	core
1903950513020354560	1903950252151414784	stable	2021-11-06 21:39:38.997503+00	2021-11-06 21:39:38.997503+00	core
1904426182812655616	1903950252151414784	unstable	2021-11-07 13:24:43.253269+00	2021-11-07 13:24:43.253269+00	chef
1904426182913327104	1903950252151414784	stable	2021-11-07 13:24:43.267769+00	2021-11-07 13:24:43.267769+00	chef
1904426252178071552	1903950252151414784	unstable	2021-11-07 13:24:51.524476+00	2021-11-07 13:24:51.524476+00	habitat
1904426252261965824	1903950252151414784	stable	2021-11-07 13:24:51.533959+00	2021-11-07 13:24:51.533959+00	habitat
\.


--
-- Name: origin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_id_seq', 1, false);


--
-- Name: origin_integration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_integration_id_seq', 1, false);


--
-- Data for Name: origin_integrations; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_integrations (id, origin, integration, name, body, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: origin_invitations; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_invitations (id, origin, account_id, account_name, owner_id, ignored, created_at, updated_at) FROM stdin;
\.


--
-- Name: origin_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_invitations_id_seq', 1, false);


--
-- Data for Name: origin_members; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_members (origin, account_id, created_at, updated_at, member_role) FROM stdin;
core	1903950252151414784	2021-11-06 21:39:38.971831+00	2021-11-06 21:39:38.971831+00	owner
chef	1903950252151414784	2021-11-07 13:24:43.23861+00	2021-11-07 13:24:43.23861+00	owner
habitat	1903950252151414784	2021-11-07 13:24:51.514406+00	2021-11-07 13:24:51.514406+00	owner
\.


--
-- Name: origin_package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_package_id_seq', 1, false);


--
-- Data for Name: origin_package_settings; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_package_settings (id, origin, name, visibility, owner_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: origin_package_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_package_settings_id_seq', 1, false);


--
-- Data for Name: origin_packages; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_packages (id, owner_id, name, ident, ident_array, checksum, manifest, config, target, deps, tdeps, exposes, scheduler_sync, created_at, updated_at, visibility, ident_vector, origin, build_deps, build_tdeps) FROM stdin;
\.


--
-- Name: origin_private_encryption_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_private_encryption_key_id_seq', 1, false);


--
-- Data for Name: origin_private_encryption_keys; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_private_encryption_keys (id, owner_id, name, revision, full_name, body, created_at, updated_at, origin) FROM stdin;
\.


--
-- Name: origin_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_project_id_seq', 1, false);


--
-- Name: origin_project_integration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_project_integration_id_seq', 1, false);


--
-- Data for Name: origin_project_integrations; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_project_integrations (id, origin, body, created_at, updated_at, project_id, integration_id) FROM stdin;
\.


--
-- Data for Name: origin_projects; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_projects (id, origin, package_name, name, plan_path, owner_id, vcs_type, vcs_data, created_at, updated_at, vcs_installation_id, visibility, auto_build, target) FROM stdin;
\.


--
-- Name: origin_public_encryption_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_public_encryption_key_id_seq', 1, false);


--
-- Data for Name: origin_public_encryption_keys; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_public_encryption_keys (id, owner_id, name, revision, full_name, body, created_at, updated_at, origin) FROM stdin;
\.


--
-- Name: origin_public_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_public_key_id_seq', 1, true);


--
-- Data for Name: origin_public_keys; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_public_keys (id, owner_id, name, revision, full_name, body, created_at, updated_at, origin) FROM stdin;
1903950513582383104	1903950252151414784	core	20211106213939	core-20211106213939	SIG-PUB-1\ncore-20211106213939\n\nrj/bx0nfn8GfPNimB7YMfTBS4QGV6j55Cr3fsvUs+TY=	2021-11-06 21:39:39.064324+00	2021-11-06 21:39:39.064324+00	core
1904426183542456320	1903950252151414784	chef	20211107132443	chef-20211107132443	SIG-PUB-1\nchef-20211107132443\n\n2uZkRfvJRYAS3QRH/22ypil26pbyE7tqZO7W3HgzBU4=	2021-11-07 13:24:43.342213+00	2021-11-07 13:24:43.342213+00	chef
1904426252974972928	1903950252151414784	habitat	20211107132451	habitat-20211107132451	SIG-PUB-1\nhabitat-20211107132451\n\n3ed21w7t95lreCwOlkWlyIrqrU+u2wP8rmkqMIWgwNU=	2021-11-07 13:24:51.619213+00	2021-11-07 13:24:51.619213+00	habitat
\.


--
-- Name: origin_secret_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_secret_key_id_seq', 1, true);


--
-- Data for Name: origin_secret_keys; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_secret_keys (id, owner_id, name, revision, full_name, body, created_at, updated_at, origin, encryption_key_rev) FROM stdin;
1903950513666269184	1903950252151414784	core	20211106213939	core-20211106213939	BOX-1\nbldr-20211106213853\nbldr-20211106213853\ntK8cQEdal7NmARf/zy4jUE00NgWMyUzy\nbzjuv3YN4gQcMTdka4WSuXOQW/0E601O06BI3mtSsobn9gxepdpR5RG2ESveZUq59alyjEhWoZdHjX8SpuVgBUdTCZe0EDwMVL3naxIJh1sn3k26gBxI9FKjwBGI9/90sGiuXSE8Q1p0s+1L2PEaPlevxj/rv+1uO8WmW0y+H3ZaHni+iFgB	2021-11-06 21:39:39.074135+00	2021-11-06 21:39:39.074135+00	core	20211106213853
1904426183777337344	1903950252151414784	chef	20211107132443	chef-20211107132443	BOX-1\nbldr-20211107014519\nbldr-20211107014519\nPgUWgJi0fwnDmWzfoymuDT69INQrrb98\nkIt87OJz+HNLJPkjXcAx2bQVsM7EU2NPgWqwokRwHQg/0uPVvyiamVRzrwM4eotJVSk/VjoJ/P8BlQK72czDkp39qA8z8ZZeyrm4lftJ/xQGjaV9u4nw8FvmLYSGTmcAHDw1o0Fo0rvmmzrGcSBaEuDfqknA1MZyMRH55/VkelwuC6V/R9Xz	2021-11-07 13:24:43.370192+00	2021-11-07 13:24:43.370192+00	chef	20211107014519
1904426253067247616	1903950252151414784	habitat	20211107132451	habitat-20211107132451	BOX-1\nbldr-20211107014519\nbldr-20211107014519\nAuO8tlvbSgUBWEaziSFai1alvCVtDpLF\ne/k/6yb0fJ4J0tkZ7xQChiOSnvPgNwAJe2OzTuOPIAa+Ll8pqdznQOp9waGYP3kiwSurFXEMlHs9d2I8Ejj13zrc8rrMuo+9JF0w8h4GMYcV2Pz1J8GBRE/Enpi/xPoZJGDNOvTzTzTTB0EkywZXQUFVNVwXTT4WsH2aI/BhAc38aOA8vwtSrdFW	2021-11-07 13:24:51.630461+00	2021-11-07 13:24:51.630461+00	habitat	20211107014519
\.


--
-- Data for Name: origin_secrets; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origin_secrets (id, owner_id, name, value, created_at, updated_at, origin) FROM stdin;
\.


--
-- Name: origin_secrets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hab
--

SELECT pg_catalog.setval('public.origin_secrets_id_seq', 1, false);


--
-- Data for Name: origins; Type: TABLE DATA; Schema: public; Owner: hab
--

COPY public.origins (name, owner_id, created_at, updated_at, default_package_visibility) FROM stdin;
core	1903950252151414784	2021-11-06 21:39:38.961647+00	2021-11-06 21:39:38.961647+00	public
chef	1903950252151414784	2021-11-07 13:24:43.215136+00	2021-11-07 13:24:43.215136+00	public
habitat	1903950252151414784	2021-11-07 13:24:51.503523+00	2021-11-07 13:24:51.503523+00	public
\.


--
-- Name: __diesel_schema_migrations __diesel_schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.__diesel_schema_migrations
    ADD CONSTRAINT __diesel_schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: account_tokens account_tokens_account_id_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.account_tokens
    ADD CONSTRAINT account_tokens_account_id_key UNIQUE (account_id);


--
-- Name: account_tokens account_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.account_tokens
    ADD CONSTRAINT account_tokens_pkey PRIMARY KEY (id);


--
-- Name: account_tokens account_tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.account_tokens
    ADD CONSTRAINT account_tokens_token_key UNIQUE (token);


--
-- Name: accounts accounts_name_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_name_key UNIQUE (name);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: audit_origin audit_origin_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.audit_origin
    ADD CONSTRAINT audit_origin_pkey PRIMARY KEY (id);


--
-- Name: job_graph job_graph_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.job_graph
    ADD CONSTRAINT job_graph_pkey PRIMARY KEY (id);


--
-- Name: origin_channel_packages origin_channel_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_channel_packages
    ADD CONSTRAINT origin_channel_packages_pkey PRIMARY KEY (channel_id, package_id);


--
-- Name: origin_channels origin_channels_origin_name_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_channels
    ADD CONSTRAINT origin_channels_origin_name_key UNIQUE (origin, name);


--
-- Name: origin_channels origin_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_channels
    ADD CONSTRAINT origin_channels_pkey PRIMARY KEY (id);


--
-- Name: origin_integrations origin_integrations_origin_integration_name_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_integrations
    ADD CONSTRAINT origin_integrations_origin_integration_name_key UNIQUE (origin, integration, name);


--
-- Name: origin_integrations origin_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_integrations
    ADD CONSTRAINT origin_integrations_pkey PRIMARY KEY (id);


--
-- Name: origin_invitations origin_invitations_origin_account_id_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_invitations
    ADD CONSTRAINT origin_invitations_origin_account_id_key UNIQUE (origin, account_id);


--
-- Name: origin_invitations origin_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_invitations
    ADD CONSTRAINT origin_invitations_pkey PRIMARY KEY (id);


--
-- Name: origin_members origin_members_origin_account_id_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_members
    ADD CONSTRAINT origin_members_origin_account_id_key UNIQUE (origin, account_id);


--
-- Name: origin_package_settings origin_package_settings_origin_name_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_package_settings
    ADD CONSTRAINT origin_package_settings_origin_name_key UNIQUE (origin, name);


--
-- Name: origin_package_settings origin_package_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_package_settings
    ADD CONSTRAINT origin_package_settings_pkey PRIMARY KEY (id);


--
-- Name: origin_packages origin_packages_ident_target_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_packages
    ADD CONSTRAINT origin_packages_ident_target_key UNIQUE (ident, target);


--
-- Name: origin_packages origin_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_packages
    ADD CONSTRAINT origin_packages_pkey PRIMARY KEY (id);


--
-- Name: origin_private_encryption_keys origin_private_encryption_keys_full_name_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_private_encryption_keys
    ADD CONSTRAINT origin_private_encryption_keys_full_name_key UNIQUE (full_name);


--
-- Name: origin_private_encryption_keys origin_private_encryption_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_private_encryption_keys
    ADD CONSTRAINT origin_private_encryption_keys_pkey PRIMARY KEY (id);


--
-- Name: origin_project_integrations origin_project_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_project_integrations
    ADD CONSTRAINT origin_project_integrations_pkey PRIMARY KEY (id);


--
-- Name: origin_project_integrations origin_project_integrations_project_id_integration_id_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_project_integrations
    ADD CONSTRAINT origin_project_integrations_project_id_integration_id_key UNIQUE (project_id, integration_id);


--
-- Name: origin_projects origin_projects_origin_package_name_name_target_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_projects
    ADD CONSTRAINT origin_projects_origin_package_name_name_target_key UNIQUE (origin, package_name, name, target);


--
-- Name: origin_projects origin_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_projects
    ADD CONSTRAINT origin_projects_pkey PRIMARY KEY (id);


--
-- Name: origin_public_encryption_keys origin_public_encryption_keys_full_name_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_public_encryption_keys
    ADD CONSTRAINT origin_public_encryption_keys_full_name_key UNIQUE (full_name);


--
-- Name: origin_public_encryption_keys origin_public_encryption_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_public_encryption_keys
    ADD CONSTRAINT origin_public_encryption_keys_pkey PRIMARY KEY (id);


--
-- Name: origin_public_keys origin_public_keys_full_name_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_public_keys
    ADD CONSTRAINT origin_public_keys_full_name_key UNIQUE (full_name);


--
-- Name: origin_public_keys origin_public_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_public_keys
    ADD CONSTRAINT origin_public_keys_pkey PRIMARY KEY (id);


--
-- Name: origin_secret_keys origin_secret_keys_full_name_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_secret_keys
    ADD CONSTRAINT origin_secret_keys_full_name_key UNIQUE (full_name);


--
-- Name: origin_secret_keys origin_secret_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_secret_keys
    ADD CONSTRAINT origin_secret_keys_pkey PRIMARY KEY (id);


--
-- Name: origin_secrets origin_secrets_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_secrets
    ADD CONSTRAINT origin_secrets_pkey PRIMARY KEY (id);


--
-- Name: origins origins_name_key; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origins
    ADD CONSTRAINT origins_name_key UNIQUE (name);


--
-- Name: origins origins_pkey; Type: CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origins
    ADD CONSTRAINT origins_pkey PRIMARY KEY (name);


--
-- Name: ident_index; Type: INDEX; Schema: public; Owner: hab
--

CREATE INDEX ident_index ON public.origin_packages USING gin (ident_vector);


--
-- Name: job_graph_dependencies_idx; Type: INDEX; Schema: public; Owner: hab
--

CREATE INDEX job_graph_dependencies_idx ON public.job_graph USING gin (dependencies);


--
-- Name: origin_channel_packages_packages_index; Type: INDEX; Schema: public; Owner: hab
--

CREATE INDEX origin_channel_packages_packages_index ON public.origin_channel_packages USING btree (package_id);


--
-- Name: origin_packages_ident_array_index; Type: INDEX; Schema: public; Owner: hab
--

CREATE INDEX origin_packages_ident_array_index ON public.origin_packages USING gin (ident_array);


--
-- Name: origin_packages_origin_name_target_index; Type: INDEX; Schema: public; Owner: hab
--

CREATE INDEX origin_packages_origin_name_target_index ON public.origin_packages USING btree (origin, name, target);


--
-- Name: state; Type: INDEX; Schema: public; Owner: hab
--

CREATE INDEX state ON public.job_graph USING btree (job_state);


--
-- Name: origins_with_stats _RETURN; Type: RULE; Schema: public; Owner: hab
--

CREATE RULE "_RETURN" AS
    ON SELECT TO public.origins_with_stats DO INSTEAD  SELECT o.name,
    o.owner_id,
    o.created_at,
    o.updated_at,
    o.default_package_visibility,
    count(DISTINCT ops.name) AS package_count
   FROM (public.origins o
     LEFT JOIN public.origin_package_settings ops ON ((o.name = ops.origin)))
  GROUP BY o.name
  ORDER BY o.name;


--
-- Name: origin_packages origin_packages_vector; Type: TRIGGER; Schema: public; Owner: hab
--

CREATE TRIGGER origin_packages_vector BEFORE INSERT ON public.origin_packages FOR EACH ROW EXECUTE PROCEDURE public.update_origin_package_vector_index();


--
-- Name: job_graph set_updated_at; Type: TRIGGER; Schema: public; Owner: hab
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.job_graph FOR EACH ROW EXECUTE PROCEDURE public.diesel_set_updated_at();


--
-- Name: origin_channel_packages origin_channel_packages_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_channel_packages
    ADD CONSTRAINT origin_channel_packages_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.origin_channels(id) ON DELETE CASCADE;


--
-- Name: origin_channel_packages origin_channel_packages_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_channel_packages
    ADD CONSTRAINT origin_channel_packages_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.origin_packages(id);


--
-- Name: origin_channels origin_channels_origin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_channels
    ADD CONSTRAINT origin_channels_origin_fkey FOREIGN KEY (origin) REFERENCES public.origins(name);


--
-- Name: origin_invitations origin_invitations_origin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_invitations
    ADD CONSTRAINT origin_invitations_origin_fkey FOREIGN KEY (origin) REFERENCES public.origins(name);


--
-- Name: origin_members origin_members_origin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_members
    ADD CONSTRAINT origin_members_origin_fkey FOREIGN KEY (origin) REFERENCES public.origins(name);


--
-- Name: origin_packages origin_packages_origin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_packages
    ADD CONSTRAINT origin_packages_origin_fkey FOREIGN KEY (origin) REFERENCES public.origins(name);


--
-- Name: origin_private_encryption_keys origin_private_encryption_keys_origin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_private_encryption_keys
    ADD CONSTRAINT origin_private_encryption_keys_origin_fkey FOREIGN KEY (origin) REFERENCES public.origins(name);


--
-- Name: origin_project_integrations origin_project_integrations_integration_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_project_integrations
    ADD CONSTRAINT origin_project_integrations_integration_id_fkey FOREIGN KEY (integration_id) REFERENCES public.origin_integrations(id) ON DELETE CASCADE;


--
-- Name: origin_project_integrations origin_project_integrations_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_project_integrations
    ADD CONSTRAINT origin_project_integrations_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.origin_projects(id) ON DELETE CASCADE;


--
-- Name: origin_projects origin_projects_origin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_projects
    ADD CONSTRAINT origin_projects_origin_fkey FOREIGN KEY (origin) REFERENCES public.origins(name);


--
-- Name: origin_public_encryption_keys origin_public_encryption_keys_origin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_public_encryption_keys
    ADD CONSTRAINT origin_public_encryption_keys_origin_fkey FOREIGN KEY (origin) REFERENCES public.origins(name);


--
-- Name: origin_public_keys origin_public_keys_origin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_public_keys
    ADD CONSTRAINT origin_public_keys_origin_fkey FOREIGN KEY (origin) REFERENCES public.origins(name);


--
-- Name: origin_secret_keys origin_secret_keys_origin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_secret_keys
    ADD CONSTRAINT origin_secret_keys_origin_fkey FOREIGN KEY (origin) REFERENCES public.origins(name);


--
-- Name: origin_secrets origin_secrets_origin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hab
--

ALTER TABLE ONLY public.origin_secrets
    ADD CONSTRAINT origin_secrets_origin_fkey FOREIGN KEY (origin) REFERENCES public.origins(name);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: hab
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


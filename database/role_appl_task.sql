--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2021-04-07 10:27:54

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
-- TOC entry 10 (class 2615 OID 28825)
-- Name: mnv; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA mnv;


ALTER SCHEMA mnv OWNER TO postgres;

--
-- TOC entry 11 (class 2615 OID 28390)
-- Name: org; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA org;


ALTER SCHEMA org OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 28389)
-- Name: wil; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA wil;


ALTER SCHEMA wil OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 27380)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 3991 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- TOC entry 952 (class 1255 OID 28606)
-- Name: fnc_kecamatan_profil_setgeom(); Type: FUNCTION; Schema: org; Owner: postgres
--

CREATE FUNCTION org.fnc_kecamatan_profil_setgeom() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF NEW.longitude IS NOT NULL AND NEW.latitude IS NOT NULL THEN 
  		NEW.geom = ST_GeomFromText('POINT('||coalesce(NEW.longitude, OLD.longitude)||' '||coalesce(NEW.latitude, OLD.latitude)||')', 4326);
  	END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION org.fnc_kecamatan_profil_setgeom() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 235 (class 1259 OID 28828)
-- Name: tb_bobot_kecukupan; Type: TABLE; Schema: mnv; Owner: postgres
--

CREATE TABLE mnv.tb_bobot_kecukupan (
    id_bobot_kecukupan integer NOT NULL,
    nama character varying(255) NOT NULL,
    bobot double precision NOT NULL,
    status integer NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_by integer,
    updated_date timestamp without time zone
);


ALTER TABLE mnv.tb_bobot_kecukupan OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 28826)
-- Name: tb_bobot_kecukupan_id_bobot_kecukupan_seq; Type: SEQUENCE; Schema: mnv; Owner: postgres
--

CREATE SEQUENCE mnv.tb_bobot_kecukupan_id_bobot_kecukupan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mnv.tb_bobot_kecukupan_id_bobot_kecukupan_seq OWNER TO postgres;

--
-- TOC entry 3992 (class 0 OID 0)
-- Dependencies: 234
-- Name: tb_bobot_kecukupan_id_bobot_kecukupan_seq; Type: SEQUENCE OWNED BY; Schema: mnv; Owner: postgres
--

ALTER SEQUENCE mnv.tb_bobot_kecukupan_id_bobot_kecukupan_seq OWNED BY mnv.tb_bobot_kecukupan.id_bobot_kecukupan;


--
-- TOC entry 237 (class 1259 OID 28836)
-- Name: tb_bobot_ketersediaan; Type: TABLE; Schema: mnv; Owner: postgres
--

CREATE TABLE mnv.tb_bobot_ketersediaan (
    id_bobot_ketersediaan integer NOT NULL,
    nama character varying(255) NOT NULL,
    bobot double precision NOT NULL,
    status integer NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_by integer,
    updated_date timestamp without time zone
);


ALTER TABLE mnv.tb_bobot_ketersediaan OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 28834)
-- Name: tb_bobot_ketersediaan_id_bobot_ketersediaan_seq; Type: SEQUENCE; Schema: mnv; Owner: postgres
--

CREATE SEQUENCE mnv.tb_bobot_ketersediaan_id_bobot_ketersediaan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mnv.tb_bobot_ketersediaan_id_bobot_ketersediaan_seq OWNER TO postgres;

--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 236
-- Name: tb_bobot_ketersediaan_id_bobot_ketersediaan_seq; Type: SEQUENCE OWNED BY; Schema: mnv; Owner: postgres
--

ALTER SEQUENCE mnv.tb_bobot_ketersediaan_id_bobot_ketersediaan_seq OWNED BY mnv.tb_bobot_ketersediaan.id_bobot_ketersediaan;


--
-- TOC entry 239 (class 1259 OID 28844)
-- Name: tb_bobot_kondisi; Type: TABLE; Schema: mnv; Owner: postgres
--

CREATE TABLE mnv.tb_bobot_kondisi (
    id_bobot_kondisi integer NOT NULL,
    nama character varying(255) NOT NULL,
    bobot double precision NOT NULL,
    status integer NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_by integer,
    updated_date timestamp without time zone
);


ALTER TABLE mnv.tb_bobot_kondisi OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 28842)
-- Name: tb_bobot_kondisi_id_bobot_kondisi_seq; Type: SEQUENCE; Schema: mnv; Owner: postgres
--

CREATE SEQUENCE mnv.tb_bobot_kondisi_id_bobot_kondisi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mnv.tb_bobot_kondisi_id_bobot_kondisi_seq OWNER TO postgres;

--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 238
-- Name: tb_bobot_kondisi_id_bobot_kondisi_seq; Type: SEQUENCE OWNED BY; Schema: mnv; Owner: postgres
--

ALTER SEQUENCE mnv.tb_bobot_kondisi_id_bobot_kondisi_seq OWNED BY mnv.tb_bobot_kondisi.id_bobot_kondisi;


--
-- TOC entry 241 (class 1259 OID 28852)
-- Name: tb_indikator; Type: TABLE; Schema: mnv; Owner: postgres
--

CREATE TABLE mnv.tb_indikator (
    id_indikator integer NOT NULL,
    id_variabel integer NOT NULL,
    type integer NOT NULL,
    nama character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_by integer,
    updated_date timestamp without time zone
);


ALTER TABLE mnv.tb_indikator OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 28850)
-- Name: tb_indikator_id_indikator_seq; Type: SEQUENCE; Schema: mnv; Owner: postgres
--

CREATE SEQUENCE mnv.tb_indikator_id_indikator_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mnv.tb_indikator_id_indikator_seq OWNER TO postgres;

--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 240
-- Name: tb_indikator_id_indikator_seq; Type: SEQUENCE OWNED BY; Schema: mnv; Owner: postgres
--

ALTER SEQUENCE mnv.tb_indikator_id_indikator_seq OWNED BY mnv.tb_indikator.id_indikator;


--
-- TOC entry 243 (class 1259 OID 28860)
-- Name: tb_jawaban; Type: TABLE; Schema: mnv; Owner: postgres
--

CREATE TABLE mnv.tb_jawaban (
    id_jawaban integer NOT NULL,
    id_pertanyaan integer NOT NULL,
    id_monev_detil integer NOT NULL,
    ketersediaan character varying(255),
    bobot_ketersediaan double precision,
    kecukupan character varying(255),
    bobot_kecukupan double precision,
    kondisi character varying(255),
    bobot_kondisi double precision,
    kebutuhan double precision,
    keterisian double precision,
    bobot_keb_ket double precision,
    jumlah double precision,
    bobot_nilai double precision,
    jumlah_bobot_nilai double precision
);


ALTER TABLE mnv.tb_jawaban OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 28858)
-- Name: tb_jawaban_id_jawaban_seq; Type: SEQUENCE; Schema: mnv; Owner: postgres
--

CREATE SEQUENCE mnv.tb_jawaban_id_jawaban_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mnv.tb_jawaban_id_jawaban_seq OWNER TO postgres;

--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 242
-- Name: tb_jawaban_id_jawaban_seq; Type: SEQUENCE OWNED BY; Schema: mnv; Owner: postgres
--

ALTER SEQUENCE mnv.tb_jawaban_id_jawaban_seq OWNED BY mnv.tb_jawaban.id_jawaban;


--
-- TOC entry 244 (class 1259 OID 28869)
-- Name: tb_jenis_lokpri; Type: TABLE; Schema: mnv; Owner: postgres
--

CREATE TABLE mnv.tb_jenis_lokpri (
    id_jenis_lokpri integer NOT NULL,
    nama character varying(255) NOT NULL
);


ALTER TABLE mnv.tb_jenis_lokpri OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 28876)
-- Name: tb_jenis_variabel; Type: TABLE; Schema: mnv; Owner: postgres
--

CREATE TABLE mnv.tb_jenis_variabel (
    id_jenis_variabel integer NOT NULL,
    nama character varying(255) NOT NULL
);


ALTER TABLE mnv.tb_jenis_variabel OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 28874)
-- Name: tb_jenis_variabel_id_jenis_variabel_seq; Type: SEQUENCE; Schema: mnv; Owner: postgres
--

CREATE SEQUENCE mnv.tb_jenis_variabel_id_jenis_variabel_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mnv.tb_jenis_variabel_id_jenis_variabel_seq OWNER TO postgres;

--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 245
-- Name: tb_jenis_variabel_id_jenis_variabel_seq; Type: SEQUENCE OWNED BY; Schema: mnv; Owner: postgres
--

ALTER SEQUENCE mnv.tb_jenis_variabel_id_jenis_variabel_seq OWNED BY mnv.tb_jenis_variabel.id_jenis_variabel;


--
-- TOC entry 248 (class 1259 OID 28884)
-- Name: tb_monev; Type: TABLE; Schema: mnv; Owner: postgres
--

CREATE TABLE mnv.tb_monev (
    id_monev integer NOT NULL,
    id_pegawai integer NOT NULL,
    rata_rata_ciq double precision NOT NULL,
    rata_rata_pap double precision NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_by integer,
    updated_date timestamp without time zone
);


ALTER TABLE mnv.tb_monev OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 28892)
-- Name: tb_monev_detil; Type: TABLE; Schema: mnv; Owner: postgres
--

CREATE TABLE mnv.tb_monev_detil (
    id_monev_detil integer NOT NULL,
    id_variabel integer NOT NULL,
    id_monev integer NOT NULL,
    rata2 double precision NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_by integer,
    updated_date timestamp without time zone
);


ALTER TABLE mnv.tb_monev_detil OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 28890)
-- Name: tb_monev_detil_id_monev_detil_seq; Type: SEQUENCE; Schema: mnv; Owner: postgres
--

CREATE SEQUENCE mnv.tb_monev_detil_id_monev_detil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mnv.tb_monev_detil_id_monev_detil_seq OWNER TO postgres;

--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 249
-- Name: tb_monev_detil_id_monev_detil_seq; Type: SEQUENCE OWNED BY; Schema: mnv; Owner: postgres
--

ALTER SEQUENCE mnv.tb_monev_detil_id_monev_detil_seq OWNED BY mnv.tb_monev_detil.id_monev_detil;


--
-- TOC entry 247 (class 1259 OID 28882)
-- Name: tb_monev_id_monev_seq; Type: SEQUENCE; Schema: mnv; Owner: postgres
--

CREATE SEQUENCE mnv.tb_monev_id_monev_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mnv.tb_monev_id_monev_seq OWNER TO postgres;

--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 247
-- Name: tb_monev_id_monev_seq; Type: SEQUENCE OWNED BY; Schema: mnv; Owner: postgres
--

ALTER SEQUENCE mnv.tb_monev_id_monev_seq OWNED BY mnv.tb_monev.id_monev;


--
-- TOC entry 252 (class 1259 OID 28902)
-- Name: tb_pertanyaan; Type: TABLE; Schema: mnv; Owner: postgres
--

CREATE TABLE mnv.tb_pertanyaan (
    id_pertanyaan integer NOT NULL,
    id_indikator integer NOT NULL,
    id_jenis_lokpri integer NOT NULL,
    pertanyaan character varying(255) NOT NULL,
    bobot_default integer,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_by integer,
    updated_date timestamp without time zone
);


ALTER TABLE mnv.tb_pertanyaan OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 28900)
-- Name: tb_pertanyaan_id_pertanyaan_seq; Type: SEQUENCE; Schema: mnv; Owner: postgres
--

CREATE SEQUENCE mnv.tb_pertanyaan_id_pertanyaan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mnv.tb_pertanyaan_id_pertanyaan_seq OWNER TO postgres;

--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 251
-- Name: tb_pertanyaan_id_pertanyaan_seq; Type: SEQUENCE OWNED BY; Schema: mnv; Owner: postgres
--

ALTER SEQUENCE mnv.tb_pertanyaan_id_pertanyaan_seq OWNED BY mnv.tb_pertanyaan.id_pertanyaan;


--
-- TOC entry 254 (class 1259 OID 28910)
-- Name: tb_variabel; Type: TABLE; Schema: mnv; Owner: postgres
--

CREATE TABLE mnv.tb_variabel (
    id_variabel integer NOT NULL,
    id_jenis_variabel integer NOT NULL,
    nama character varying(100) NOT NULL,
    presentase integer NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_by integer,
    updated_date timestamp without time zone
);


ALTER TABLE mnv.tb_variabel OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 28908)
-- Name: tb_variabel_id_variabel_seq; Type: SEQUENCE; Schema: mnv; Owner: postgres
--

CREATE SEQUENCE mnv.tb_variabel_id_variabel_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mnv.tb_variabel_id_variabel_seq OWNER TO postgres;

--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 253
-- Name: tb_variabel_id_variabel_seq; Type: SEQUENCE OWNED BY; Schema: mnv; Owner: postgres
--

ALTER SEQUENCE mnv.tb_variabel_id_variabel_seq OWNED BY mnv.tb_variabel.id_variabel;


--
-- TOC entry 225 (class 1259 OID 28522)
-- Name: tb_jabatan; Type: TABLE; Schema: org; Owner: postgres
--

CREATE TABLE org.tb_jabatan (
    id_jabatan integer NOT NULL,
    kode character varying(16) NOT NULL,
    nama character varying(255) NOT NULL
);


ALTER TABLE org.tb_jabatan OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 28520)
-- Name: tb_jabatan_id_jabatan_seq; Type: SEQUENCE; Schema: org; Owner: postgres
--

CREATE SEQUENCE org.tb_jabatan_id_jabatan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE org.tb_jabatan_id_jabatan_seq OWNER TO postgres;

--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 224
-- Name: tb_jabatan_id_jabatan_seq; Type: SEQUENCE OWNED BY; Schema: org; Owner: postgres
--

ALTER SEQUENCE org.tb_jabatan_id_jabatan_seq OWNED BY org.tb_jabatan.id_jabatan;


--
-- TOC entry 230 (class 1259 OID 28553)
-- Name: tb_kecamatan_profil; Type: TABLE; Schema: org; Owner: postgres
--

CREATE TABLE org.tb_kecamatan_profil (
    id_kecamatan integer NOT NULL,
    alamat text NOT NULL,
    longitude double precision,
    latitude double precision,
    geom public.geometry
);


ALTER TABLE org.tb_kecamatan_profil OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 28561)
-- Name: tb_pegawai_kecamatan; Type: TABLE; Schema: org; Owner: postgres
--

CREATE TABLE org.tb_pegawai_kecamatan (
    id_pegawai integer NOT NULL,
    id_kecamatan integer NOT NULL,
    id_jabatan integer NOT NULL
);


ALTER TABLE org.tb_pegawai_kecamatan OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 28394)
-- Name: tb_appl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_appl (
    id_appl integer NOT NULL,
    appl_name character varying(255) NOT NULL
);


ALTER TABLE public.tb_appl OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 28392)
-- Name: tb_appl_id_appl_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_appl_id_appl_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_appl_id_appl_seq OWNER TO postgres;

--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 211
-- Name: tb_appl_id_appl_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_appl_id_appl_seq OWNED BY public.tb_appl.id_appl;


--
-- TOC entry 213 (class 1259 OID 28400)
-- Name: tb_appl_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_appl_setting (
    code character varying(20) NOT NULL,
    name character varying(255) NOT NULL,
    value_type integer NOT NULL,
    value_date date,
    value_number double precision,
    value_string character varying(255)
);


ALTER TABLE public.tb_appl_setting OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 28410)
-- Name: tb_appl_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_appl_task (
    id_appl_task integer NOT NULL,
    id_appl_task_parent integer,
    id_appl integer NOT NULL,
    appl_task_name character varying(255) NOT NULL,
    controller_name character varying(255),
    action_name character varying(255),
    description character varying(255) NOT NULL,
    icon_name character varying(255) NOT NULL
);


ALTER TABLE public.tb_appl_task OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 28421)
-- Name: tb_appl_task_delegation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_appl_task_delegation (
    id_appl_task_delegation integer NOT NULL,
    id_appl_task integer NOT NULL,
    delegate_for integer NOT NULL,
    delegate_by integer NOT NULL,
    approved_by integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    status integer NOT NULL,
    created_by integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_by integer,
    updated_date timestamp without time zone
);


ALTER TABLE public.tb_appl_task_delegation OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 28419)
-- Name: tb_appl_task_delegation_id_appl_task_delegation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_appl_task_delegation_id_appl_task_delegation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_appl_task_delegation_id_appl_task_delegation_seq OWNER TO postgres;

--
-- TOC entry 4004 (class 0 OID 0)
-- Dependencies: 216
-- Name: tb_appl_task_delegation_id_appl_task_delegation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_appl_task_delegation_id_appl_task_delegation_seq OWNED BY public.tb_appl_task_delegation.id_appl_task_delegation;


--
-- TOC entry 214 (class 1259 OID 28408)
-- Name: tb_appl_task_id_appl_task_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_appl_task_id_appl_task_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_appl_task_id_appl_task_seq OWNER TO postgres;

--
-- TOC entry 4005 (class 0 OID 0)
-- Dependencies: 214
-- Name: tb_appl_task_id_appl_task_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_appl_task_id_appl_task_seq OWNED BY public.tb_appl_task.id_appl_task;


--
-- TOC entry 219 (class 1259 OID 28429)
-- Name: tb_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_role (
    id_role integer NOT NULL,
    role_name character varying(255) NOT NULL
);


ALTER TABLE public.tb_role OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 28435)
-- Name: tb_role_appl_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_role_appl_task (
    id_role integer NOT NULL,
    id_appl_task integer NOT NULL
);


ALTER TABLE public.tb_role_appl_task OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 28427)
-- Name: tb_role_id_role_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_role_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_role_id_role_seq OWNER TO postgres;

--
-- TOC entry 4006 (class 0 OID 0)
-- Dependencies: 218
-- Name: tb_role_id_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_role_id_role_seq OWNED BY public.tb_role.id_role;


--
-- TOC entry 222 (class 1259 OID 28442)
-- Name: tb_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_user (
    id_user integer NOT NULL,
    username character varying(32) NOT NULL,
    password character varying(128) NOT NULL,
    email character varying(64) NOT NULL,
    first_name character varying(30) NOT NULL,
    middle_name character varying(30),
    last_name character varying(30),
    address text NOT NULL,
    phone_number character varying(30),
    mobile_number character varying(30),
    file_image character varying(30),
    status integer NOT NULL,
    last_login timestamp without time zone,
    created_date timestamp without time zone NOT NULL,
    updated_by integer,
    updated_date timestamp without time zone
);


ALTER TABLE public.tb_user OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 28440)
-- Name: tb_user_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_user_id_user_seq OWNER TO postgres;

--
-- TOC entry 4007 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_user_id_user_seq OWNED BY public.tb_user.id_user;


--
-- TOC entry 223 (class 1259 OID 28455)
-- Name: tb_user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_user_role (
    id_user integer NOT NULL,
    id_role integer NOT NULL
);


ALTER TABLE public.tb_user_role OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 28532)
-- Name: tb_kabupaten; Type: TABLE; Schema: wil; Owner: postgres
--

CREATE TABLE wil.tb_kabupaten (
    id_kabupaten integer NOT NULL,
    kode character(4) NOT NULL,
    nama character varying(255) NOT NULL,
    id_provinsi integer NOT NULL
);


ALTER TABLE wil.tb_kabupaten OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 28530)
-- Name: tb_kabupaten_id_kabupaten_seq; Type: SEQUENCE; Schema: wil; Owner: postgres
--

CREATE SEQUENCE wil.tb_kabupaten_id_kabupaten_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wil.tb_kabupaten_id_kabupaten_seq OWNER TO postgres;

--
-- TOC entry 4008 (class 0 OID 0)
-- Dependencies: 226
-- Name: tb_kabupaten_id_kabupaten_seq; Type: SEQUENCE OWNED BY; Schema: wil; Owner: postgres
--

ALTER SEQUENCE wil.tb_kabupaten_id_kabupaten_seq OWNED BY wil.tb_kabupaten.id_kabupaten;


--
-- TOC entry 229 (class 1259 OID 28542)
-- Name: tb_kecamatan; Type: TABLE; Schema: wil; Owner: postgres
--

CREATE TABLE wil.tb_kecamatan (
    id_kecamatan integer NOT NULL,
    kode character(7) NOT NULL,
    nama character varying(255) NOT NULL,
    id_kabupaten integer NOT NULL,
    geom public.geometry
);


ALTER TABLE wil.tb_kecamatan OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 28540)
-- Name: tb_kecamatan_id_kecamatan_seq; Type: SEQUENCE; Schema: wil; Owner: postgres
--

CREATE SEQUENCE wil.tb_kecamatan_id_kecamatan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wil.tb_kecamatan_id_kecamatan_seq OWNER TO postgres;

--
-- TOC entry 4009 (class 0 OID 0)
-- Dependencies: 228
-- Name: tb_kecamatan_id_kecamatan_seq; Type: SEQUENCE OWNED BY; Schema: wil; Owner: postgres
--

ALTER SEQUENCE wil.tb_kecamatan_id_kecamatan_seq OWNED BY wil.tb_kecamatan.id_kecamatan;


--
-- TOC entry 233 (class 1259 OID 28568)
-- Name: tb_provinsi; Type: TABLE; Schema: wil; Owner: postgres
--

CREATE TABLE wil.tb_provinsi (
    id_provinsi integer NOT NULL,
    kode character(2) NOT NULL,
    nama character varying(255) NOT NULL
);


ALTER TABLE wil.tb_provinsi OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 28566)
-- Name: tb_provinsi_id_provinsi_seq; Type: SEQUENCE; Schema: wil; Owner: postgres
--

CREATE SEQUENCE wil.tb_provinsi_id_provinsi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wil.tb_provinsi_id_provinsi_seq OWNER TO postgres;

--
-- TOC entry 4010 (class 0 OID 0)
-- Dependencies: 232
-- Name: tb_provinsi_id_provinsi_seq; Type: SEQUENCE OWNED BY; Schema: wil; Owner: postgres
--

ALTER SEQUENCE wil.tb_provinsi_id_provinsi_seq OWNED BY wil.tb_provinsi.id_provinsi;


--
-- TOC entry 3690 (class 2604 OID 28831)
-- Name: tb_bobot_kecukupan id_bobot_kecukupan; Type: DEFAULT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_bobot_kecukupan ALTER COLUMN id_bobot_kecukupan SET DEFAULT nextval('mnv.tb_bobot_kecukupan_id_bobot_kecukupan_seq'::regclass);


--
-- TOC entry 3691 (class 2604 OID 28839)
-- Name: tb_bobot_ketersediaan id_bobot_ketersediaan; Type: DEFAULT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_bobot_ketersediaan ALTER COLUMN id_bobot_ketersediaan SET DEFAULT nextval('mnv.tb_bobot_ketersediaan_id_bobot_ketersediaan_seq'::regclass);


--
-- TOC entry 3692 (class 2604 OID 28847)
-- Name: tb_bobot_kondisi id_bobot_kondisi; Type: DEFAULT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_bobot_kondisi ALTER COLUMN id_bobot_kondisi SET DEFAULT nextval('mnv.tb_bobot_kondisi_id_bobot_kondisi_seq'::regclass);


--
-- TOC entry 3693 (class 2604 OID 28855)
-- Name: tb_indikator id_indikator; Type: DEFAULT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_indikator ALTER COLUMN id_indikator SET DEFAULT nextval('mnv.tb_indikator_id_indikator_seq'::regclass);


--
-- TOC entry 3694 (class 2604 OID 28863)
-- Name: tb_jawaban id_jawaban; Type: DEFAULT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_jawaban ALTER COLUMN id_jawaban SET DEFAULT nextval('mnv.tb_jawaban_id_jawaban_seq'::regclass);


--
-- TOC entry 3695 (class 2604 OID 28879)
-- Name: tb_jenis_variabel id_jenis_variabel; Type: DEFAULT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_jenis_variabel ALTER COLUMN id_jenis_variabel SET DEFAULT nextval('mnv.tb_jenis_variabel_id_jenis_variabel_seq'::regclass);


--
-- TOC entry 3696 (class 2604 OID 28887)
-- Name: tb_monev id_monev; Type: DEFAULT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_monev ALTER COLUMN id_monev SET DEFAULT nextval('mnv.tb_monev_id_monev_seq'::regclass);


--
-- TOC entry 3697 (class 2604 OID 28895)
-- Name: tb_monev_detil id_monev_detil; Type: DEFAULT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_monev_detil ALTER COLUMN id_monev_detil SET DEFAULT nextval('mnv.tb_monev_detil_id_monev_detil_seq'::regclass);


--
-- TOC entry 3698 (class 2604 OID 28905)
-- Name: tb_pertanyaan id_pertanyaan; Type: DEFAULT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_pertanyaan ALTER COLUMN id_pertanyaan SET DEFAULT nextval('mnv.tb_pertanyaan_id_pertanyaan_seq'::regclass);


--
-- TOC entry 3699 (class 2604 OID 28913)
-- Name: tb_variabel id_variabel; Type: DEFAULT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_variabel ALTER COLUMN id_variabel SET DEFAULT nextval('mnv.tb_variabel_id_variabel_seq'::regclass);


--
-- TOC entry 3686 (class 2604 OID 28525)
-- Name: tb_jabatan id_jabatan; Type: DEFAULT; Schema: org; Owner: postgres
--

ALTER TABLE ONLY org.tb_jabatan ALTER COLUMN id_jabatan SET DEFAULT nextval('org.tb_jabatan_id_jabatan_seq'::regclass);


--
-- TOC entry 3681 (class 2604 OID 28397)
-- Name: tb_appl id_appl; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl ALTER COLUMN id_appl SET DEFAULT nextval('public.tb_appl_id_appl_seq'::regclass);


--
-- TOC entry 3682 (class 2604 OID 28413)
-- Name: tb_appl_task id_appl_task; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_task ALTER COLUMN id_appl_task SET DEFAULT nextval('public.tb_appl_task_id_appl_task_seq'::regclass);


--
-- TOC entry 3683 (class 2604 OID 28424)
-- Name: tb_appl_task_delegation id_appl_task_delegation; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_task_delegation ALTER COLUMN id_appl_task_delegation SET DEFAULT nextval('public.tb_appl_task_delegation_id_appl_task_delegation_seq'::regclass);


--
-- TOC entry 3684 (class 2604 OID 28432)
-- Name: tb_role id_role; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_role ALTER COLUMN id_role SET DEFAULT nextval('public.tb_role_id_role_seq'::regclass);


--
-- TOC entry 3685 (class 2604 OID 28445)
-- Name: tb_user id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user ALTER COLUMN id_user SET DEFAULT nextval('public.tb_user_id_user_seq'::regclass);


--
-- TOC entry 3687 (class 2604 OID 28535)
-- Name: tb_kabupaten id_kabupaten; Type: DEFAULT; Schema: wil; Owner: postgres
--

ALTER TABLE ONLY wil.tb_kabupaten ALTER COLUMN id_kabupaten SET DEFAULT nextval('wil.tb_kabupaten_id_kabupaten_seq'::regclass);


--
-- TOC entry 3688 (class 2604 OID 28545)
-- Name: tb_kecamatan id_kecamatan; Type: DEFAULT; Schema: wil; Owner: postgres
--

ALTER TABLE ONLY wil.tb_kecamatan ALTER COLUMN id_kecamatan SET DEFAULT nextval('wil.tb_kecamatan_id_kecamatan_seq'::regclass);


--
-- TOC entry 3689 (class 2604 OID 28571)
-- Name: tb_provinsi id_provinsi; Type: DEFAULT; Schema: wil; Owner: postgres
--

ALTER TABLE ONLY wil.tb_provinsi ALTER COLUMN id_provinsi SET DEFAULT nextval('wil.tb_provinsi_id_provinsi_seq'::regclass);


--
-- TOC entry 3966 (class 0 OID 28828)
-- Dependencies: 235
-- Data for Name: tb_bobot_kecukupan; Type: TABLE DATA; Schema: mnv; Owner: postgres
--

INSERT INTO mnv.tb_bobot_kecukupan (id_bobot_kecukupan, nama, bobot, status, created_by, created_date, updated_by, updated_date) VALUES (1, 'Cukup', 100, 1, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_bobot_kecukupan (id_bobot_kecukupan, nama, bobot, status, created_by, created_date, updated_by, updated_date) VALUES (2, 'Lumayan Cukup', 50, 1, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_bobot_kecukupan (id_bobot_kecukupan, nama, bobot, status, created_by, created_date, updated_by, updated_date) VALUES (3, 'Tidak Cukup', 0, 1, 1, '2021-04-02 14:54:44.592715', NULL, NULL);


--
-- TOC entry 3968 (class 0 OID 28836)
-- Dependencies: 237
-- Data for Name: tb_bobot_ketersediaan; Type: TABLE DATA; Schema: mnv; Owner: postgres
--

INSERT INTO mnv.tb_bobot_ketersediaan (id_bobot_ketersediaan, nama, bobot, status, created_by, created_date, updated_by, updated_date) VALUES (1, 'Ya', 100, 1, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_bobot_ketersediaan (id_bobot_ketersediaan, nama, bobot, status, created_by, created_date, updated_by, updated_date) VALUES (2, 'Tidak', 0, 1, 1, '2021-04-02 14:54:44.592715', NULL, NULL);


--
-- TOC entry 3970 (class 0 OID 28844)
-- Dependencies: 239
-- Data for Name: tb_bobot_kondisi; Type: TABLE DATA; Schema: mnv; Owner: postgres
--

INSERT INTO mnv.tb_bobot_kondisi (id_bobot_kondisi, nama, bobot, status, created_by, created_date, updated_by, updated_date) VALUES (1, 'Layak Atas', 100, 1, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_bobot_kondisi (id_bobot_kondisi, nama, bobot, status, created_by, created_date, updated_by, updated_date) VALUES (2, 'Layak Bawah', 90, 1, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_bobot_kondisi (id_bobot_kondisi, nama, bobot, status, created_by, created_date, updated_by, updated_date) VALUES (3, 'Cukup Layak Atas', 80, 1, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_bobot_kondisi (id_bobot_kondisi, nama, bobot, status, created_by, created_date, updated_by, updated_date) VALUES (4, 'Cukup Layak Bawah', 60, 1, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_bobot_kondisi (id_bobot_kondisi, nama, bobot, status, created_by, created_date, updated_by, updated_date) VALUES (5, 'Tidak Layak Atas', 50, 1, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_bobot_kondisi (id_bobot_kondisi, nama, bobot, status, created_by, created_date, updated_by, updated_date) VALUES (6, 'Tidak Layak Bawah', 10, 1, 1, '2021-04-02 14:54:44.592715', NULL, NULL);


--
-- TOC entry 3972 (class 0 OID 28852)
-- Dependencies: 241
-- Data for Name: tb_indikator; Type: TABLE DATA; Schema: mnv; Owner: postgres
--

INSERT INTO mnv.tb_indikator (id_indikator, id_variabel, type, nama, created_by, created_date, updated_by, updated_date) VALUES (1, 1, 1, 'Indikator 1: Bangunan Kantor', 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_indikator (id_indikator, id_variabel, type, nama, created_by, created_date, updated_by, updated_date) VALUES (2, 1, 1, 'Indikator 2: Meubelair', 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_indikator (id_indikator, id_variabel, type, nama, created_by, created_date, updated_by, updated_date) VALUES (3, 1, 1, 'Indikator 3: Mesin Kantor', 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_indikator (id_indikator, id_variabel, type, nama, created_by, created_date, updated_by, updated_date) VALUES (4, 1, 1, 'Indikator 4: Kendaraan Kantor', 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_indikator (id_indikator, id_variabel, type, nama, created_by, created_date, updated_by, updated_date) VALUES (5, 2, 2, 'Indikator 1: Proporsi Keterisian Aparatur di Kecamatan', 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_indikator (id_indikator, id_variabel, type, nama, created_by, created_date, updated_by, updated_date) VALUES (6, 2, 3, 'Indikator 2: Tingkat Pendidikan Aparatur di Kecamatan', 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_indikator (id_indikator, id_variabel, type, nama, created_by, created_date, updated_by, updated_date) VALUES (7, 3, 4, 'Indikator 1: Proses Pelayanan Administrasi di kecamatan', 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_indikator (id_indikator, id_variabel, type, nama, created_by, created_date, updated_by, updated_date) VALUES (8, 4, 4, 'Indikator 1: Kelembagaan yang ada di Kecamatan', 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_indikator (id_indikator, id_variabel, type, nama, created_by, created_date, updated_by, updated_date) VALUES (9, 5, 4, 'Indikator 1: Sarana Prasarana Aktivitas Lintas Batas', 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_indikator (id_indikator, id_variabel, type, nama, created_by, created_date, updated_by, updated_date) VALUES (11, 7, 4, 'indikator 1', 1, '2021-04-04 08:38:19.362714', NULL, NULL);


--
-- TOC entry 3974 (class 0 OID 28860)
-- Dependencies: 243
-- Data for Name: tb_jawaban; Type: TABLE DATA; Schema: mnv; Owner: postgres
--

INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (272, 36, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (273, 37, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (274, 38, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (275, 39, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (276, 40, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (277, 41, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (278, 42, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (279, 43, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (280, 44, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (281, 45, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (282, 46, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (283, 47, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (284, 48, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (285, 49, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (286, 50, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (287, 51, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (288, 52, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (289, 53, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (290, 54, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (291, 55, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (292, 56, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (293, 57, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (294, 58, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (295, 59, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (266, 30, 22, NULL, NULL, NULL, NULL, NULL, NULL, 102, 21, 214200, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (267, 31, 22, NULL, NULL, NULL, NULL, NULL, NULL, 1212, 2121, 257065200, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (268, 32, 22, NULL, NULL, NULL, NULL, NULL, NULL, 5, 7, 3500, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (237, 1, 21, 'Ya', NULL, 'Lumayan Cukup', NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (238, 2, 21, 'Ya', NULL, 'Lumayan Cukup', NULL, '20', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (239, 3, 21, 'Ya', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (240, 4, 21, 'Tidak', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (241, 5, 21, 'Tidak', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (242, 6, 21, 'Ya', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (243, 7, 21, 'Tidak', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (244, 8, 21, 'Ya', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (245, 9, 21, 'Ya', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (246, 10, 21, 'Ya', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (247, 11, 21, 'Tidak', NULL, 'Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (248, 12, 21, 'Ya', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (249, 13, 21, 'Ya', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (250, 14, 21, 'Tidak', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (251, 15, 21, 'T', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (252, 16, 21, 'Tidak', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (253, 17, 21, 'Tidak', NULL, 'Tidak Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (254, 18, 21, 'Tidak', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (255, 19, 21, 'Tidak', NULL, 'Lumayan Cukup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (256, 20, 21, 'Ya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (257, 21, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (258, 22, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (259, 23, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (260, 24, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (261, 25, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (262, 26, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (269, 33, 22, NULL, NULL, NULL, NULL, NULL, NULL, 1, 12, 1200, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (270, 34, 22, NULL, NULL, NULL, NULL, NULL, NULL, 12, 21, 25200, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (271, 35, 22, NULL, NULL, NULL, NULL, NULL, NULL, 21, 21, 44100, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (264, 28, 21, 'Tidak', NULL, 'Cukup', NULL, '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (265, 29, 21, 'Ya', NULL, 'Tidak Cukup', NULL, '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO mnv.tb_jawaban (id_jawaban, id_pertanyaan, id_monev_detil, ketersediaan, bobot_ketersediaan, kecukupan, bobot_kecukupan, kondisi, bobot_kondisi, kebutuhan, keterisian, bobot_keb_ket, jumlah, bobot_nilai, jumlah_bobot_nilai) VALUES (263, 27, 21, 'Tidak', NULL, 'Lumayan Cukup', NULL, '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 3975 (class 0 OID 28869)
-- Dependencies: 244
-- Data for Name: tb_jenis_lokpri; Type: TABLE DATA; Schema: mnv; Owner: postgres
--

INSERT INTO mnv.tb_jenis_lokpri (id_jenis_lokpri, nama) VALUES (1, 'Lokasi Prioritas Batas Darat');
INSERT INTO mnv.tb_jenis_lokpri (id_jenis_lokpri, nama) VALUES (2, 'Lokasi Prioritas Batas Laut');
INSERT INTO mnv.tb_jenis_lokpri (id_jenis_lokpri, nama) VALUES (3, 'Lokasi Prioritas PKSN Darat');
INSERT INTO mnv.tb_jenis_lokpri (id_jenis_lokpri, nama) VALUES (4, 'Lokasi Prioritas PKSN Laut');
INSERT INTO mnv.tb_jenis_lokpri (id_jenis_lokpri, nama) VALUES (5, 'Lokasi Prioritas PPKT');


--
-- TOC entry 3977 (class 0 OID 28876)
-- Dependencies: 246
-- Data for Name: tb_jenis_variabel; Type: TABLE DATA; Schema: mnv; Owner: postgres
--

INSERT INTO mnv.tb_jenis_variabel (id_jenis_variabel, nama) VALUES (1, 'Pelayanan Administrasi Pemerintahan');
INSERT INTO mnv.tb_jenis_variabel (id_jenis_variabel, nama) VALUES (2, 'Membantu Pengawasan CIQ');


--
-- TOC entry 3979 (class 0 OID 28884)
-- Dependencies: 248
-- Data for Name: tb_monev; Type: TABLE DATA; Schema: mnv; Owner: postgres
--

INSERT INTO mnv.tb_monev (id_monev, id_pegawai, rata_rata_ciq, rata_rata_pap, created_by, created_date, updated_by, updated_date) VALUES (6, 16, 0, 0, 1, '2021-04-03 14:42:10.089387', NULL, NULL);
INSERT INTO mnv.tb_monev (id_monev, id_pegawai, rata_rata_ciq, rata_rata_pap, created_by, created_date, updated_by, updated_date) VALUES (7, 16, 0, 0, 1, '2021-04-04 15:05:24.502176', NULL, NULL);
INSERT INTO mnv.tb_monev (id_monev, id_pegawai, rata_rata_ciq, rata_rata_pap, created_by, created_date, updated_by, updated_date) VALUES (5, 16, 0, 257353400, 1, '2021-04-02 15:47:30.977987', 1, '2021-04-06 02:15:22.136076');


--
-- TOC entry 3981 (class 0 OID 28892)
-- Dependencies: 250
-- Data for Name: tb_monev_detil; Type: TABLE DATA; Schema: mnv; Owner: postgres
--

INSERT INTO mnv.tb_monev_detil (id_monev_detil, id_variabel, id_monev, rata2, created_by, created_date, updated_by, updated_date) VALUES (23, 3, 5, 0, 1, '2021-04-02 15:47:30.977987', NULL, NULL);
INSERT INTO mnv.tb_monev_detil (id_monev_detil, id_variabel, id_monev, rata2, created_by, created_date, updated_by, updated_date) VALUES (24, 4, 5, 0, 1, '2021-04-02 15:47:30.977987', NULL, NULL);
INSERT INTO mnv.tb_monev_detil (id_monev_detil, id_variabel, id_monev, rata2, created_by, created_date, updated_by, updated_date) VALUES (25, 5, 5, 0, 1, '2021-04-02 15:47:30.977987', NULL, NULL);
INSERT INTO mnv.tb_monev_detil (id_monev_detil, id_variabel, id_monev, rata2, created_by, created_date, updated_by, updated_date) VALUES (21, 1, 5, 0, 1, '2021-04-02 15:47:30.977987', NULL, NULL);
INSERT INTO mnv.tb_monev_detil (id_monev_detil, id_variabel, id_monev, rata2, created_by, created_date, updated_by, updated_date) VALUES (22, 2, 5, 0, 1, '2021-04-02 15:47:30.977987', NULL, NULL);


--
-- TOC entry 3983 (class 0 OID 28902)
-- Dependencies: 252
-- Data for Name: tb_pertanyaan; Type: TABLE DATA; Schema: mnv; Owner: postgres
--

INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (1, 1, 1, 'Gedung Kantor', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (2, 1, 1, 'Ruangan Kerja', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (3, 1, 1, 'Ruang Rapat', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (4, 1, 1, 'Ruang Pelayanan', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (5, 1, 1, 'Ruang Tunggu', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (6, 1, 1, 'Toilet', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (7, 1, 1, 'Taman/Ruang Terbuka', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (8, 1, 1, 'Instalasi Air', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (9, 1, 1, 'Instalasi Listrik', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (10, 1, 1, 'Jaringan Internet', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (11, 2, 1, 'Meja', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (12, 2, 1, 'Kursi', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (13, 2, 1, 'Lemari', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (14, 2, 1, 'Meeting Desk', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (15, 2, 1, 'Fiiling Cabbinet', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (16, 2, 1, 'Papan Informasi', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (17, 3, 1, 'Komputer', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (18, 3, 1, 'Mesin Tik', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (19, 3, 1, 'Mesin Fotocopy', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (20, 3, 1, 'Printer', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (21, 3, 1, 'Telepon', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (22, 3, 1, 'Scanner', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (23, 3, 1, 'Proyektor', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (24, 3, 1, 'Sound System', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (25, 3, 1, 'AC', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (26, 3, 1, 'Kipas Angin', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (27, 4, 1, 'Kendaraan Roda Dua', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (28, 4, 1, 'Kendaraan Roda Empat', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (29, 4, 1, 'Kendaraan Air/Speedboat', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (30, 5, 1, 'Eselon III a (Camat)', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (31, 5, 1, 'Eselon III b (Sekcam)', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (32, 5, 1, 'Eselon IV a (kasi)', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (33, 5, 1, 'Eselon IV b (Kasub)', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (34, 5, 1, 'Staf/Honorer', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (35, 5, 1, 'Pegawai Linmas/Pol PP', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (36, 6, 1, 'Pascasarjana', 100, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (37, 6, 1, 'Sarjana', 80, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (38, 6, 1, 'SMA', 60, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (39, 6, 1, 'SMP', 40, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (40, 7, 1, 'Dasar Hukum Pelayanan Kecamatan', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (41, 7, 1, 'Persyaratan, Product Pelayanan, Biaya', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (42, 7, 1, 'Standar Pelayanan Minimal', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (43, 7, 1, 'SOP', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (44, 7, 1, 'Jangka waktu penyelesaian', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (45, 7, 1, 'Pengawasan Internal', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (46, 7, 1, 'Penanganan Pengaduan', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (47, 7, 1, 'Jumlah Pelaksana', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (48, 7, 1, 'Jaminan Pelayanan', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (49, 7, 1, 'Evaluasi Kinerja dan Akuntabilitas', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (50, 8, 1, 'Paten', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (51, 8, 1, 'Lembaga kemasyarakatan', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (52, 8, 1, 'FKDM (Forum Kewaspadaan Dini Masyarakat)', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (53, 8, 1, 'UPT/Dukcapil', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (54, 9, 1, 'Pos Lintas Batas', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (55, 9, 1, 'Kantor Imigrasi', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (56, 9, 1, 'Kantor Karantina', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (57, 9, 1, 'Kantor Kepabeanan', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (58, 9, 1, 'Pos Pamtas', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_pertanyaan (id_pertanyaan, id_indikator, id_jenis_lokpri, pertanyaan, bobot_default, created_by, created_date, updated_by, updated_date) VALUES (59, 9, 1, 'Pos Angkatan Laut', NULL, 1, '2021-04-02 14:54:44.592715', NULL, NULL);


--
-- TOC entry 3985 (class 0 OID 28910)
-- Dependencies: 254
-- Data for Name: tb_variabel; Type: TABLE DATA; Schema: mnv; Owner: postgres
--

INSERT INTO mnv.tb_variabel (id_variabel, id_jenis_variabel, nama, presentase, created_by, created_date, updated_by, updated_date) VALUES (1, 1, 'Sarana Prasarana Perintahan Kecamatan', 35, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_variabel (id_variabel, id_jenis_variabel, nama, presentase, created_by, created_date, updated_by, updated_date) VALUES (2, 1, 'Kondisi Aparatur Kecamatan', 20, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_variabel (id_variabel, id_jenis_variabel, nama, presentase, created_by, created_date, updated_by, updated_date) VALUES (3, 1, 'Proses Pelayanan (Processing)', 35, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_variabel (id_variabel, id_jenis_variabel, nama, presentase, created_by, created_date, updated_by, updated_date) VALUES (4, 1, 'Kelembagaan Kecamatan', 10, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_variabel (id_variabel, id_jenis_variabel, nama, presentase, created_by, created_date, updated_by, updated_date) VALUES (5, 2, 'Aktivitas Lintas Batas', 100, 1, '2021-04-02 14:54:44.592715', NULL, NULL);
INSERT INTO mnv.tb_variabel (id_variabel, id_jenis_variabel, nama, presentase, created_by, created_date, updated_by, updated_date) VALUES (7, 1, 'Variabel Add Tambah', 12, 1, '2021-04-04 08:35:08.184585', NULL, NULL);


--
-- TOC entry 3956 (class 0 OID 28522)
-- Dependencies: 225
-- Data for Name: tb_jabatan; Type: TABLE DATA; Schema: org; Owner: postgres
--

INSERT INTO org.tb_jabatan (id_jabatan, kode, nama) VALUES (1, 'CAMAT', 'Camat');
INSERT INTO org.tb_jabatan (id_jabatan, kode, nama) VALUES (2, 'SEKCAMAT', 'Sekretaris Kecamatan');
INSERT INTO org.tb_jabatan (id_jabatan, kode, nama) VALUES (6, 'cmtX', 'tes');
INSERT INTO org.tb_jabatan (id_jabatan, kode, nama) VALUES (3, 'CMT', 'CAMAT XX updates');


--
-- TOC entry 3961 (class 0 OID 28553)
-- Dependencies: 230
-- Data for Name: tb_kecamatan_profil; Type: TABLE DATA; Schema: org; Owner: postgres
--

INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610614, 'Alamat Kecamatan Badau', 111.945704203, 0.959941543, '0101000020E6100000C9E4EB6A86FC5B408637A853D7B7EE3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810203, 'Alamat Kecamatan Kei Besar', 133.010586797, -5.64462009, '0101000020E61000004D5C1FBA56A060400C94F349179416C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (640311, 'Alamat Kecamatan Maratua', 118.582361138, 2.19581364, '0101000020E6100000F78AA66745A55D402649DFBD06910140');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810303, 'Alamat Kecamatan Wer Tamrian', 131.38169005, -7.742703453, '0101000020E6100000AD3E0DCE366C60408B0B054187F81EC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530512, 'Alamat Kecamatan Mataru', 124.628949948, -8.367373052, '0101000020E6100000C75E48B740285F401D8B175218BC20C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530418, 'Alamat Kecamatan Lamaknen Selatan', 125.115638977, -9.1509482, '0101000020E6100000E81606A166475F40B7C71C15494D22C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (910119, 'Alamat Kecamatan Waan', 140.112448083, -8.211136854, '0101000020E610000074DFB82C9983614016D235211A6C20C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650314, 'Alamat Kecamatan Tulin Onsoi', 116.889994409, 4.199869333, '0101000020E6100000C8111CABF5385D4055D5E28BAACC1040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810813, 'Alamat Kecamatan Wetar Utara', 126.275402835, -7.697615822, '0101000020E61000003E633633A0915F400DA652CD5BCA1EC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (920905, 'Alamat Kecamatan Sausapor', 132.119338133, -0.580758249, '0101000020E6100000D34C349ED18360408BCACA529295E2BF');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (910108, 'Alamat Kecamatan Sota', 140.905345205, -8.308857728, '0101000020E610000018E28196F89C6140F4C0A199229E20C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610321, 'Alamat Kecamatan Entikong', 110.252248407, 1.000594817, '0101000020E61000001EA280D624905B4062FEF8B56F02F03F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210308, 'Alamat Kecamatan Bunguran Utara', 108.098293978, 4.033326819, '0101000020E6100000D739D3724A065B4025BDF66C20221040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810803, 'Alamat Kecamatan Mndona Hiera', 128.915322685, -8.203656803, '0101000020E610000095ABCC524A1D60405FFC58B4456820C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (147204, 'Alamat Kecamatan Sungai Sembilan', 101.202505589, 1.931737556, '0101000020E6100000C88000DAF54C59407999B7A365E8FE3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210505, 'Alamat Kecamatan Jemaja Timur', 105.76530186, 2.915089949, '0101000020E61000002611A7B4FA705A4093D3DEAD1A520740');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810808, 'Alamat Kecamatan P. Leti', 127.674573702, -8.198255289, '0101000020E61000003A352D372CEB5F402F079DB7816520C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911221, 'Alamat Kecamatan Oksamol', 140.895877685, -4.854040783, '0101000020E610000051C9AD07AB9C6140AEBDC1AA896A13C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710308, 'Alamat Kecamatan Tabukan Utara', 125.508603583, 3.676833495, '0101000020E610000042E70AF68C605F4027E6EEAD276A0D40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710325, 'Alamat Kecamatan Kepulauan Marore', 125.482002046, 4.704647173, '0101000020E6100000350B1C1FD95E5F40F2034D078FD11240');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210504, 'Alamat Kecamatan Siantan Selatan', 106.167371735, 2.983761327, '0101000020E61000006306F037B68A5A40C8463442BEDE0740');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911204, 'Alamat Kecamatan Iwur', 140.849514442, -5.044928974, '0101000020E6100000D43BE9382F9B61402FE467DC012E14C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710316, 'Alamat Kecamatan Kendahe', 125.426202991, 3.706627293, '0101000020E61000005AF3E8E8465B5F40072BCF352CA70D40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (141009, 'Alamat Kecamatan Rangsang Pesisir', 102.865805894, 1.070438417, '0101000020E610000080DA1F5D69B75940285A96088420F13F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (531403, 'Alamat Kecamatan Lobalain', 123.078308833, -10.78663758, '0101000020E6100000442E0D0303C55E4026CF2F29C29225C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530403, 'Alamat Kecamatan Raihat', 125.114156564, -9.033767143, '0101000020E61000003D4055574E475F408DBA4DED491122C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610108, 'Alamat Kecamatan Paloh', 109.41563957, 1.830541772, '0101000020E6100000B404B6D6995A5B40EF3A4B2BE649FD3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530313, 'Alamat Kecamatan Mutis', 124.217590285, -9.448135533, '0101000020E61000002680CDFFEC0D5F4031D2440572E522C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650312, 'Alamat Kecamatan Sebatik Tengah', 117.823407687, 4.142580678, '0101000020E610000029BC27B6B2745D40BE3454AB00921040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911603, 'Alamat Kecamatan Waropko', 140.869362347, -5.520360018, '0101000020E6100000A417FCD0D19B6140EAD2AD41D91416C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (532102, 'Alamat Kecamatan Malaka Barat', 124.920873368, -9.654394111, '0101000020E610000050D4D996EF3A5F4047E1B2BE0C4F23C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650318, 'Alamat Kecamatan Krayan Timur', 115.990252277, 4.188944543, '0101000020E61000004A20164B60FF5C404AC5A3AD7AC11040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (720409, 'Alamat Kecamatan Toli-toli Utara', 121.035167062, 1.258842361, '0101000020E6100000EE4B592D40425E40E30735E33724F43F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710317, 'Alamat Kecamatan Tahuna', 125.483636035, 3.624972916, '0101000020E61000007F5F8EE4F35E5F4096D8D8CCF1FF0C40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210210, 'Alamat Kecamatan Meral Barat', 103.336447791, 1.080567595, '0101000020E610000003CA505C88D5594029471A3F014AF13F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710409, 'Alamat Kecamatan Damau', 126.815271053, 3.773033156, '0101000020E6100000AC80A3662DB45F4007F3DD012C2F0E40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810806, 'Alamat Kecamatan Wetar', 126.284379147, -7.829849825, '0101000020E6100000E101984433925F4084DD0B27C4511FC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810305, 'Alamat Kecamatan Tanimbar Utara', 131.74004473, -7.193906403, '0101000020E6100000AB1D4972AE776040E07A6D668FC61CC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (532110, 'Alamat Kecamatan Kobalima Timur', 125.036942045, -9.387966144, '0101000020E6100000D5C72A425D425F40D6DE987FA3C622C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911902, 'Alamat Kecamatan Supiori Utara', 135.623892167, -0.72415984, '0101000020E6100000DCAFB4ECF6F360400C0DBC41512CE7BF');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210110, 'Alamat Kecamatan Telok Sebong', 104.413962926, 1.134269062, '0101000020E61000004B3B5B5E7E1A5A403A79E250F725F23F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210307, 'Alamat Kecamatan Bunguran Timur', 108.343334834, 3.906399063, '0101000020E6100000E3E6AA32F9155B402BAEE5264E400F40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (121805, 'Alamat Kecamatan Tanjung Beringin', 99.2123712775, 3.481617449, '0101000020E610000039DEB27D97CD5840841AC53F5ADA0B40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610617, 'Alamat Kecamatan Putussibau Selatan', 113.644068969, 0.921935032, '0101000020E61000004D8E0D6D38695C403D416FE57D80ED3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210509, 'Alamat Kecamatan Jemaja Barat', 105.673076654, 3.097190484, '0101000020E610000064281AB0136B5A406B19F2CD0BC70840');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530503, 'Alamat Kecamatan Alor Barat Daya', 124.450670684, -8.199232264, '0101000020E6100000F142DAC9D71C5F40476074C5016620C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (217102, 'Alamat Kecamatan Batu Ampar', 104.010694722, 1.169428493, '0101000020E6100000B54EEA38AF005A400921C7A6FAB5F23F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (141003, 'Alamat Kecamatan Rangsang', 103.032544551, 0.920572036, '0101000020E6100000508DBD3515C25940A66D877C5375ED3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530401, 'Alamat Kecamatan Lamaknen', 125.126515422, -9.086347337, '0101000020E61000007FFB23D418485F40FC05D9B7352C22C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650315, 'Alamat Kecamatan Lumbis Ogong', 116.401357135, 4.170784147, '0101000020E6100000D735D6D5AF195D403929180AE2AE1040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650211, 'Alamat Kecamatan Bahau Hulu', 115.756326544, 3.15614349, '0101000020E6100000E9E472A767F05C4034447828C83F0940');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810308, 'Alamat Kecamatan Kormomolin', 131.526024289, -7.612369479, '0101000020E610000003C5E330D5706040867E15FC10731EC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810302, 'Alamat Kecamatan Selaru', 130.973571815, -8.186867997, '0101000020E610000070371480275F60406C917F29AD5F20C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (641105, 'Alamat Kecamatan Long Pahangai', 114.66781178, 0.957156296, '0101000020E6100000F2BE9E6DBDAA5C4038608F3D06A1EE3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (720402, 'Alamat Kecamatan Dampal Utara', 120.311538778, 0.930531047, '0101000020E610000088BC5740F0135E406BE2D80BE9C6ED3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810306, 'Alamat Kecamatan Yaru', 131.945220728, -7.03638078, '0101000020E61000005D488A3F3F7E60403E36D10041251CC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911001, 'Alamat Kecamatan Sarmi', 138.744829901, -1.836811567, '0101000020E6100000183C84A5D557614049DF92869463FDBF');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810205, 'Alamat Kecamatan Kei Besar Utara Timur', 133.12219103, -5.436446602, '0101000020E6100000DEB629FDE8A360404C29A8DBEBBE15C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911617, 'Alamat Kecamatan Ninati', 140.930330861, -5.695504938, '0101000020E61000008BCE3945C59D614081AA4B7232C816C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911618, 'Alamat Kecamatan Sesnuk', 140.790840873, -6.183872401, '0101000020E610000001BC84914E9961405EBAF30B49BC18C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530423, 'Alamat Kecamatan Nanaet Duabesi', 124.966226201, -9.287229676, '0101000020E610000055756BA6D63D5F40ABB8A1C40F9322C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (217104, 'Alamat Kecamatan Nongsa', 104.124806777, 1.108854074, '0101000020E6100000306290D5FC075A40A0DCFDC4DDBDF13F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911219, 'Alamat Kecamatan Tarup', 140.874374608, -5.198294826, '0101000020E6100000033A75E0FA9B6140468B82CC0DCB14C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710413, 'Alamat Kecamatan Miangas', 126.583558917, 5.55690587, '0101000020E610000078F37F0759A55F40D6664A88453A1640');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530417, 'Alamat Kecamatan Lasiolat', 125.04930834, -9.070408117, '0101000020E610000015EE2ADE27435F40A0C65F880C2422C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610707, 'Alamat Kecamatan Jagoi Babang', 109.780412489, 1.38343637, '0101000020E610000047693947F2715B4088F3D32C8E22F63F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530501, 'Alamat Kecamatan Teluk Mutiara', 124.53955059, -8.228905018, '0101000020E61000009AA532FF87225F408D66DC09337520C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (110609, 'Alamat Kecamatan Mesjid Raya', 95.5183216481, 5.586343028, '0101000020E61000007ED98F2E2CE157408EFD854E6A581640');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210107, 'Alamat Kecamatan Bintan Utara', 104.255549581, 1.081215379, '0101000020E6100000B239A1EC5A105A40C2CB4B7FA84CF13F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911205, 'Alamat Kecamatan Batom', 140.909581826, -4.370325727, '0101000020E61000009776584B1B9D61406754D9AA367B11C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710309, 'Alamat Kecamatan Nusa Tabukan', 125.588711988, 3.773194505, '0101000020E610000048CE0B75AD655F401260C399802F0E40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (140301, 'Alamat Kecamatan Bengkalis', 102.247133183, 1.450633267, '0101000020E610000073AFB207D18F5940FD12843ACB35F73F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810218, 'Alamat Kecamatan Kei Besar Selatan Barat', 132.884572775, -5.914440386, '0101000020E6100000D371906B4E9C6040E50B800F63A817C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210508, 'Alamat Kecamatan Siantan Utara', 106.202758387, 3.338563409, '0101000020E6100000E74950FEF98C5A40DA378ABB60B50A40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (532003, 'Alamat Kecamatan Sabu Timur', 121.977333499, -10.49950722, '0101000020E610000060DFCDA18C7E5E4021080C69BFFF24C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810814, 'Alamat Kecamatan Wetar Barat', 125.880423228, -7.8868676, '0101000020E610000085B9AADA58785F402E872705278C1FC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (750503, 'Alamat Kecamatan Anggrek', 122.773974413, 0.816912667, '0101000020E6100000A7F1F9CB88B15E401C808E082624EA3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911905, 'Alamat Kecamatan Supiori Barat', 135.450528285, -0.621348909, '0101000020E6100000EF3F4BBA6AEE6040D0ED711B17E2E3BF');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810706, 'Alamat Kecamatan Sir-Sir', 134.544918828, -5.621613493, '0101000020E610000082279CF96FD16040D2BF5C3F887C16C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (117402, 'Alamat Kecamatan Langsa Barat', 97.9971493263, 4.51007877, '0101000020E6100000F76B684BD17F5840B822CE16520A1240');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530504, 'Alamat Kecamatan Alor Selatan', 124.724250343, -8.322160031, '0101000020E610000050531C1E5A2E5F405A72DA28F2A420C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210318, 'Alamat Kecamatan Bunguran Selatan', 108.284676949, 3.743397168, '0101000020E61000005378AA2538125B40FDFDE3367AF20D40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210506, 'Alamat Kecamatan Jemaja', 105.713636031, 2.979993409, '0101000020E61000001A997536AC6D5A40BB9ACFC806D70740');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911605, 'Alamat Kecamatan Jair', 140.530879185, -6.492892645, '0101000020E6100000783658F6FC90614013DB7AD9B8F819C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911110, 'Alamat Kecamatan Yaffi', 140.923271686, -3.541310104, '0101000020E61000002B1610718B9D614016654D649A540CC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (910104, 'Alamat Kecamatan Kimaam', 138.773572051, -8.00597185, '0101000020E6100000A1842C1AC1586140ABE408BE0E0320C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911104, 'Alamat Kecamatan Web', 140.81024627, -3.660683137, '0101000020E610000064EB9589ED9961403178933D14490DC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610506, 'Alamat Kecamatan Ketungau Hulu', 111.086467904, 0.879002197, '0101000020E61000005BF5ACB088C55B40CF442737C920EC3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (121902, 'Alamat Kecamatan Sei Suka', 99.3268070156, 3.317759042, '0101000020E6100000BE06F967EAD45840B32FAB40C58A0A40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911903, 'Alamat Kecamatan Supiori Timur', 135.707034345, -0.772123494, '0101000020E6100000909D7D06A0F660400B8166543CB5E8BF');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810807, 'Alamat Kecamatan PP. Terselatan', 127.192950023, -7.999608545, '0101000020E610000009A30D4B59CC5F40FF4EE66199FF1FC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210305, 'Alamat Kecamatan Bunguran Barat', 108.158817103, 3.801474912, '0101000020E61000008DDB350F2A0A5B40F9D5BCAD6B690E40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (820703, 'Alamat Kecamatan Morotai Jaya', 128.481462312, 2.509221165, '0101000020E61000007D89A623680F604021D9D08BE2120440');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (820701, 'Alamat Kecamatan Morotai Selatan', 128.388714245, 2.113405857, '0101000020E61000007538DB58700C604038EB775441E80040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710405, 'Alamat Kecamatan Nanusa', 127.112999673, 4.731325656, '0101000020E610000099FFFA623BC75F40A5FBFCA1E0EC1240');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710324, 'Alamat Kecamatan Tahuna Timur', 125.508716608, 3.598051046, '0101000020E6100000B1921AD08E605F40CC449FFCCEC80C40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (531407, 'Alamat Kecamatan Rote Barat', 122.852067508, -10.86370232, '0101000020E61000000836284688B65E4037C2C33037BA25C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530302, 'Alamat Kecamatan Miomafo Barat', 124.331564101, -9.550448323, '0101000020E6100000A694A25838155F4099D8D25CD41923C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210203, 'Alamat Kecamatan Karimun', 103.432840268, 0.948333022, '0101000020E6100000ECDCAAA7B3DB5940819E667EBE58EE3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650309, 'Alamat Kecamatan Nunukan Selatan', 117.696372695, 4.05019522, '0101000020E61000008DB6C75E916C5D401943316066331040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810809, 'Alamat Kecamatan P. Masela', 129.860400238, -8.155788811, '0101000020E6100000C8751466883B6040CCA7108DC34F20C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (820705, 'Alamat Kecamatan Morotai Timur', 128.535492591, 2.200653925, '0101000020E61000000DB35BC1221160402683ED71F09A0140');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (531406, 'Alamat Kecamatan Rote Timur', 123.361701732, -10.6374889, '0101000020E61000002E76051F26D75E404320F2F1644625C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210306, 'Alamat Kecamatan Serasan', 109.016622451, 2.522128855, '0101000020E610000029DB9C5710415B40F42EA4E4512D0440');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210212, 'Alamat Kecamatan Belat', 103.485934049, 0.819305771, '0101000020E6100000F11D208B19DF594062CF7BBCC037EA3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530315, 'Alamat Kecamatan Bikomi Tengah', 124.421446454, -9.43607984, '0101000020E61000007E3C8CFAF81A5F40657D56DB45DF22C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (141002, 'Alamat Kecamatan Rangsang Barat', 102.711666575, 1.066913673, '0101000020E61000000152F6F18BAD5940370B53121412F13F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (140310, 'Alamat Kecamatan Rupat', 101.585957992, 1.856904883, '0101000020E6100000121EF35580655940864804E5E1B5FD3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (820704, 'Alamat Kecamatan Morotai Utara', 128.5722965, 2.389919515, '0101000020E6100000B0E3BF40501260403AFA671F8E1E0340');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530513, 'Alamat Kecamatan Pureman', 124.876251393, -8.335507573, '0101000020E61000009B00B98014385F40CF300BA6C7AB20C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (531410, 'Alamat Kecamatan Landu Leko', 123.330120522, -10.53312074, '0101000020E61000009F6ED3B120D55E40173D9E33F51025C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (920524, 'Alamat Kecamatan Ayau', 131.173492764, 0.508779869, '0101000020E6100000206FB2408D65604034FB46B8EC47E03F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (910109, 'Alamat Kecamatan Ulilin', 140.821233833, -7.042736789, '0101000020E610000052E32C8C479A61403D5D5C31C32B1CC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810817, 'Alamat Kecamatan Kisar Utara', 127.196294899, -7.966058126, '0101000020E6100000E7E47A1890CC5F40F8D164573EDD1FC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (147205, 'Alamat Kecamatan Medang Kampai', 101.602906628, 1.593094517, '0101000020E61000004E73AE05966659400C3B1FAD507DF93F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610623, 'Alamat Kecamatan Puring Kencana', 111.675673005, 0.963289725, '0101000020E6100000F6D0FC393EEB5B40A7542EF944D3EE3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710902, 'Alamat Kecamatan Siau Barat', 125.342357343, 2.726402466, '0101000020E6100000C0EEC52EE9555F4049A19918ACCF0540');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810815, 'Alamat Kecamatan Wetar Timur', 126.660237907, -7.704489078, '0101000020E61000003F897E5641AA5F40C698B99565D11EC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (531401, 'Alamat Kecamatan Rote Barat Daya', 122.956310759, -10.87575426, '0101000020E6100000F3AD0A3234BD5E40BC10C4DC62C025C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610307, 'Alamat Kecamatan Sekayam', 110.558410681, 0.823663423, '0101000020E610000074282700BDA35B4006491665735BEA3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (532004, 'Alamat Kecamatan Sabu Liae', 121.869180285, -10.58943963, '0101000020E6100000CA9958A6A0775E40F7A1FB07CB2D25C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (141008, 'Alamat Kecamatan Tasik Putri Puyu', 102.349444435, 1.258982404, '0101000020E61000000706314C5D9659401BB6B6BBCA24F43F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (820702, 'Alamat Kecamatan Morotai Selatan Barat', 128.325270348, 2.287896299, '0101000020E610000098605C9D680A604068C126939C4D0240');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650204, 'Alamat Kecamatan Kayan Hilir', 115.556696395, 1.968346511, '0101000020E6100000DF94EAE9A0E35C40200D3FE9587EFF3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210501, 'Alamat Kecamatan Siantan', 106.237621469, 3.205760369, '0101000020E6100000AE8BAD30358F5A40D8573DB165A50940');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (140702, 'Alamat Kecamatan Bangko', 100.866848594, 2.144435894, '0101000020E6100000127486727A375940C6C98801CE270140');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (910112, 'Alamat Kecamatan Naukenjerai', 140.806322418, -8.827663651, '0101000020E6100000EFEAAB64CD9961401344B287C3A721C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610505, 'Alamat Kecamatan Ketungau Tengah', 111.460006857, 0.75750251, '0101000020E61000000CB099C070DD5B402FD062E7753DE83F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (532006, 'Alamat Kecamatan Raijua', 121.571225236, -10.62378436, '0101000020E610000046D14AF48E645E409FE9E3A9603F25C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911207, 'Alamat Kecamatan Kiwirok Timur', 140.839262116, -4.745592411, '0101000020E6100000BC9F393CDB9A61402B90B5937CFB12C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210502, 'Alamat Kecamatan Palmatak', 106.295831675, 3.335324004, '0101000020E6100000BD4FFAE7EE925A403FF3F559BEAE0A40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210205, 'Alamat Kecamatan Tebing', 103.386221244, 1.079481774, '0101000020E610000007004FD9B7D859403A543FAE8E45F13F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (140303, 'Alamat Kecamatan Bandar Laksamana', 101.711849064, 1.444185472, '0101000020E61000005E6460EF8E6D5940BC92B939621BF73F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (531408, 'Alamat Kecamatan Rote Selatan', 123.194440972, -10.78815651, '0101000020E610000084EF8BB871CC5E40B4280540899325C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650301, 'Alamat Kecamatan Sebatik', 117.877147597, 4.064856501, '0101000020E610000052B8AC2F23785D4077E91ABE69421040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650308, 'Alamat Kecamatan Sebatik Barat', 117.77556252, 4.119089611, '0101000020E6100000D0D9FAD0A2715D40482782A0F2791040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210309, 'Alamat Kecamatan Subi', 108.836632879, 2.908582331, '0101000020E61000000E84A1648B355B4094F22AD0C6440740');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810204, 'Alamat Kecamatan Kei Besar Selatan', 132.923346215, -5.841693389, '0101000020E6100000EF895C0D8C9D6040C00E2CDFE45D17C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710604, 'Alamat Kecamatan Wori', 124.860297795, 1.646613826, '0101000020E610000023967B1E0F375F40A3FB3CBD8758FA3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530404, 'Alamat Kecamatan Tasifeto Barat', 124.886182931, -9.20970316, '0101000020E6100000C7BA9C38B7385F40BE226C365E6B22C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810309, 'Alamat Kecamatan Nirunmas', 131.587519659, -7.457916785, '0101000020E6100000302507F6CC72604036753F23E8D41DC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (720410, 'Alamat Kecamatan Dako Pemean', 120.895347755, 1.244174583, '0101000020E61000006991AB604D395E40B2FD879B23E8F33F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650310, 'Alamat Kecamatan Sebatik Timur', 117.88468286, 4.114207731, '0101000020E610000008C2DBA49E785D40A76116DFF2741040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530317, 'Alamat Kecamatan Bikomi Utara', 124.41888354, -9.373425992, '0101000020E61000007E48E8FCCE1A5F40933B0EB131BF22C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530126, 'Alamat Kecamatan Amfoang Timur', 124.03554633, -9.43726756, '0101000020E6100000F1351D6446025F407B9A9B88E1DF22C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (117202, 'Alamat Kecamatan Sukajaya', 95.325536555, 5.823625282, '0101000020E610000029584697D5D457402665096D644B1740');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (217109, 'Alamat Kecamatan Bengkong', 104.036620129, 1.156672184, '0101000020E61000008A1BF4FB57025A40FA9027B1BA81F23F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710406, 'Alamat Kecamatan Kabaruan', 126.771920415, 3.809828299, '0101000020E61000008B62E22467B15F4079A45C42877A0E40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (532111, 'Alamat Kecamatan Kobalima', 124.987661132, -9.470289465, '0101000020E61000001A5E09D7353F5F401CA8DFC7C9F022C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530505, 'Alamat Kecamatan Alor Timur', 125.009521851, -8.245649195, '0101000020E61000001DA989019C405F40A1A035BBC57D20C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610712, 'Alamat Kecamatan Siding', 109.981659817, 1.157602643, '0101000020E6100000FD73B283D37E5B40AD2B57598A85F23F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810707, 'Alamat Kecamatan Aru Tengah Timur', 134.648612785, -6.101794848, '0101000020E6100000F66A996FC1D46040C33E9CE83C6818C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210104, 'Alamat Kecamatan Gunung Kijang', 104.606088923, 1.031812842, '0101000020E61000002FB03129CA265A409CB9BF2E4E82F03F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (910101, 'Alamat Kecamatan Merauke', 140.557548936, -8.517828885, '0101000020E610000044C1DD70D791614090FF1BDE200921C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810801, 'Alamat Kecamatan Moa Lakor', 127.934418215, -8.178950003, '0101000020E61000008C8D0E82CDFB5F401A02B5559F5B20C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (531405, 'Alamat Kecamatan Pantai Baru', 123.256051728, -10.66436758, '0101000020E61000000976C92663D05E40CE3EC9FC275425C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (217110, 'Alamat Kecamatan Batam Kota', 104.058108737, 1.118664248, '0101000020E6100000B841B50DB8035A40B8D4857B0CE6F13F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810812, 'Alamat Kecamatan P. Lakor', 128.156582912, -8.244667251, '0101000020E6100000E1C42ABA02056040FAE4A206457D20C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650210, 'Alamat Kecamatan Kayan Selatan', 114.928014245, 1.505846269, '0101000020E6100000D11FDC9564BB5C40B489E241F217F83F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530318, 'Alamat Kecamatan Naibenu', 124.483953191, -9.281627194, '0101000020E6100000F308CE16F91E5F40DBC98770319022C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (140707, 'Alamat Kecamatan Sinaboi', 100.968013622, 2.211681271, '0101000020E6100000A42468EFF33D594038F740F385B10140');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610612, 'Alamat Kecamatan Batang Lupar', 112.270047855, 1.02809681, '0101000020E61000001E65CC7648115C409C2601A41573F03F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911228, 'Alamat Kecamatan Murkim', 140.752253978, -3.998174468, '0101000020E61000007839EF7612986140FC183EE542FC0FC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650319, 'Alamat Kecamatan Krayan Barat', 115.723285576, 3.94608737, '0101000020E6100000AAA5954F4AEE5C401E784A4196910F40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (217101, 'Alamat Kecamatan Belakang Padang', 103.817134743, 1.043779144, '0101000020E6100000106785EF4BF4594047A17BC251B3F03F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610601, 'Alamat Kecamatan Putussibau Utara', 113.10503909, 1.127261243, '0101000020E61000008116E0F5B8465C40A2BBCB154309F23F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (532005, 'Alamat Kecamatan Hawu Mehara', 121.75015967, -10.57924724, '0101000020E6100000675BB49D02705E4050322018932825C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (920505, 'Alamat Kecamatan Kep. Ayau', 131.057243918, 0.375605799, '0101000020E61000008F7632F1D46160401626B9E7EC09D83F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (217103, 'Alamat Kecamatan Sekupang', 103.962463826, 1.101832122, '0101000020E61000003210E00199FD5940ABC11AB81AA1F13F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (910105, 'Alamat Kecamatan Semangga', 140.377160976, -8.395458601, '0101000020E6100000EB27E5B3118C61400F6FBC8C79CA20C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (910110, 'Alamat Kecamatan Elikobal', 140.785452792, -7.563687869, '0101000020E610000024C6E46D2299614019078A6437411EC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810804, 'Alamat Kecamatan Pulau-Pulau Babar', 129.65600909, -7.87432308, '0101000020E6100000B86DC606FE346040B4F3AA8C4E7F1FC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (217106, 'Alamat Kecamatan Lubuk Raja', 104.006085932, 1.134145708, '0101000020E6100000F7B93FB663005A40E7234CF87525F23F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210319, 'Alamat Kecamatan Serasan Timur', 109.088540584, 2.510360058, '0101000020E6100000852920A6AA455B40785B72A737150440');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (820206, 'Alamat Kecamatan Patani Utara', 128.793527024, 0.405919934, '0101000020E61000005012C9926419604041C4549A97FAD93F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710407, 'Alamat Kecamatan Melonguane', 126.708791823, 3.902718613, '0101000020E610000043DD60D85CAD5F40959A4289C4380F40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (917104, 'Alamat Kecamatan Muaratami', 140.900813232, -2.692615964, '0101000020E6100000CF674576D39C6140448A103D7A8A05C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650205, 'Alamat Kecamatan Kayan Hulu', 114.832984848, 1.781341895, '0101000020E61000004E0EAE9F4FB55C408D50E05B6080FC3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (532101, 'Alamat Kecamatan Malaka Tengah', 124.898508446, -9.567710943, '0101000020E6100000FCAF912981395F405B883B02AB2223C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (910601, 'Alamat Kecamatan Biak Kota', 136.095028222, -1.176497941, '0101000020E6100000FC35A0780A0361405C804681EFD2F2BF');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650305, 'Alamat Kecamatan Krayan', 115.867520237, 4.110838042, '0101000020E61000001FA2997385F75C40B32B16877F711040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210310, 'Alamat Kecamatan Pulau Laut', 107.967947641, 4.711483768, '0101000020E61000007695A9DAF2FD5A4087C76C338FD81240');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (141006, 'Alamat Kecamatan Pulau Merbau', 102.529823023, 1.044063538, '0101000020E6100000FC1CD39EE8A15940327FEAF77BB4F03F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (910115, 'Alamat Kecamatan Okaba', 139.608550638, -7.61626235, '0101000020E61000007005303F7973614041063C7A0D771EC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650311, 'Alamat Kecamatan Sebatik Utara', 117.882520198, 4.153157918, '0101000020E61000000B1EFF357B785D40DABBE36DD59C1040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (641104, 'Alamat Kecamatan Long Apari', 114.229315859, 1.010618879, '0101000020E6100000FCB66C1CAD8E5C402467A0B37E2BF03F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911229, 'Alamat Kecamatan Mofinop', 140.887721558, -4.110798806, '0101000020E61000000E720A37689C6140CAD2003E757110C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530516, 'Alamat Kecamatan Pantar Tengah', 124.123785708, -8.451347436, '0101000020E61000009FE4E31AEC075F40C581D90217E720C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911101, 'Alamat Kecamatan Waris', 140.873283372, -3.203743191, '0101000020E61000002E5CF8EFF19B61407E05311C44A109C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650317, 'Alamat Kecamatan Krayan Tengah', 115.83072296, 3.748977967, '0101000020E6100000204FA2902AF55C403C840D29E8FD0D40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530309, 'Alamat Kecamatan Insana Utara', 124.547323456, -9.238444965, '0101000020E6100000A3F6F55807235F4048245D75157A22C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650302, 'Alamat Kecamatan Nunukan', 117.482678474, 4.016675183, '0101000020E61000000B144134E45E5D402C8F964C13111040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530316, 'Alamat Kecamatan Bikomi Nilulat', 124.359108537, -9.459573339, '0101000020E610000048885FA2FB165F40AF3C5A324DEB22C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810708, 'Alamat Kecamatan Aru Tengah Selatan', 134.749535268, -6.569810499, '0101000020E610000046E86231FCD76040617D48677C471AC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610604, 'Alamat Kecamatan Embaloh Hulu', 112.587434534, 1.341577573, '0101000020E61000008B04048798255C401650910B1A77F53F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210204, 'Alamat Kecamatan Meral', 103.369448894, 1.017997456, '0101000020E61000007F51F90CA5D7594031E64EB3B749F03F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810301, 'Alamat Kecamatan Tanimbar Selatan', 131.232306815, -7.926669429, '0101000020E610000003A2B30E6F6760403008AFD4E8B41FC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (140302, 'Alamat Kecamatan Bantan', 102.339204716, 1.483201732, '0101000020E61000009D77B287B59559400AF844BD31BBF73F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210315, 'Alamat Kecamatan Bunguran Timur Laut', 108.246089472, 4.054866168, '0101000020E610000050880EEEBF0F5B400CDE34D62E381040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210311, 'Alamat Kecamatan Pulau Tiga', 108.109369656, 3.633245779, '0101000020E610000077EC95E9FF065B409214B929E3100D40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911107, 'Alamat Kecamatan Towe', 140.869445215, -3.84849753, '0101000020E6100000D782C57ED29B6140B9B1B012B9C90EC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210206, 'Alamat Kecamatan Buru', 103.466960668, 0.891055482, '0101000020E61000000365FFAEE2DD59408B9143C98683EC3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210114, 'Alamat Kecamatan Bintan Pesisir', 104.72686979, 0.86191305, '0101000020E61000000620DE08852E5A400FDC37ADCA94EB3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (532103, 'Alamat Kecamatan Wewiku', 124.833708082, -9.715186942, '0101000020E610000075A624795B355F401FD59CFB2C6E23C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650203, 'Alamat Kecamatan Pujungan', 115.650111685, 2.641026648, '0101000020E6100000A3740A6E9BE95C402F324894D2200540');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (917101, 'Alamat Kecamatan Jayapura Utara', 140.686385349, -2.510469054, '0101000020E6100000134D68DEF69561408566A4CC701504C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (610109, 'Alamat Kecamatan Sajingan Besar', 109.578802553, 1.636433128, '0101000020E61000007CFEDC190B655B409F9DED80D42EFA3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810701, 'Alamat Kecamatan Pulau-Pulau Aru', 134.366808563, -5.799189982, '0101000020E61000004ABF4FE5BCCB60405EECCFDB5E3217C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (910118, 'Alamat Kecamatan Tabonji', 139.065061909, -7.503438865, '0101000020E6100000DA6BB6FC1462614068D7527A85031EC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650307, 'Alamat Kecamatan Krayan Selatan', 115.768329013, 3.612428402, '0101000020E6100000CAD9734D2CF15C4032DAADDC40E60C40');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (910907, 'Alamat Kecamatan Mimika Timur Jauh', 137.121231478, -4.73620254, '0101000020E61000002F28D620E1236140E7202214DFF112C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (530402, 'Alamat Kecamatan Tasifeto Timur', 124.961509796, -9.109957903, '0101000020E6100000A2266260893D5F40BBA4FA664C3822C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (140311, 'Alamat Kecamatan Rupat Utara', 101.573516695, 2.024760253, '0101000020E61000000A2F5E7FB46459406801E780B5320040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911904, 'Alamat Kecamatan Kep. Aruri', 135.450604543, -0.747492781, '0101000020E6100000A6F3375A6BEE6040D0830CFB75EBE7BF');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (650313, 'Alamat Kecamatan Sei Menggaris', 117.304117197, 4.200545192, '0101000020E610000009D1F9A776535D40480A04B85BCD1040');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (710806, 'Alamat Kecamatan Pinogaluman', 123.19544092, 0.879598535, '0101000020E6100000CFECA11A82CC5E4084E7ADD3AB25EC3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (117201, 'Alamat Kecamatan Sukakarya', 95.2777686973, 5.858784742, '0101000020E610000063B05BF6C6D1574073C67444656F1740');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (140706, 'Alamat Kecamatan Pasir Limau Kapas', 100.382755146, 2.202866323, '0101000020E6100000869C700F7F1859404BF5F560789F0140');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (810709, 'Alamat Kecamatan Aru Selatan Timur', 134.343861964, -6.717327923, '0101000020E6100000FD36CEEA00CB6040A12B07368BDE1AC0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911607, 'Alamat Kecamatan Kombut', 140.896008, -5.969057893, '0101000020E61000008A1EF818AC9C6140717659B650E017C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (911106, 'Alamat Kecamatan Arso Timur', 140.939964584, -2.948107142, '0101000020E6100000B4759B30149E6140C5F37F32B99507C0');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (210201, 'Alamat Kecamatan Moro', 103.798546154, 0.814988944, '0101000020E6100000B3F153611BF35940449CA2B16314EA3F');
INSERT INTO org.tb_kecamatan_profil (id_kecamatan, alamat, longitude, latitude, geom) VALUES (1, 'bandung', 131.38169005, -7.742703453, '0101000020E6100000AD3E0DCE366C60408B0B054187F81EC0');


--
-- TOC entry 3962 (class 0 OID 28561)
-- Dependencies: 231
-- Data for Name: tb_pegawai_kecamatan; Type: TABLE DATA; Schema: org; Owner: postgres
--

INSERT INTO org.tb_pegawai_kecamatan (id_pegawai, id_kecamatan, id_jabatan) VALUES (16, 110609, 1);
INSERT INTO org.tb_pegawai_kecamatan (id_pegawai, id_kecamatan, id_jabatan) VALUES (17, 110609, 2);
INSERT INTO org.tb_pegawai_kecamatan (id_pegawai, id_kecamatan, id_jabatan) VALUES (18, 110609, 2);
INSERT INTO org.tb_pegawai_kecamatan (id_pegawai, id_kecamatan, id_jabatan) VALUES (19, 1, 6);
INSERT INTO org.tb_pegawai_kecamatan (id_pegawai, id_kecamatan, id_jabatan) VALUES (20, 121902, 1);
INSERT INTO org.tb_pegawai_kecamatan (id_pegawai, id_kecamatan, id_jabatan) VALUES (21, 1, 2);


--
-- TOC entry 3679 (class 0 OID 27685)
-- Dependencies: 207
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3943 (class 0 OID 28394)
-- Dependencies: 212
-- Data for Name: tb_appl; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_appl (id_appl, appl_name) VALUES (1, 'Web Application');


--
-- TOC entry 3944 (class 0 OID 28400)
-- Dependencies: 213
-- Data for Name: tb_appl_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_appl_setting (code, name, value_type, value_date, value_number, value_string) VALUES ('namaorg', 'Nama Organisasi', 3, NULL, NULL, 'Badan Nasional Pengelola Perbatasan Republik Indonesia');
INSERT INTO public.tb_appl_setting (code, name, value_type, value_date, value_number, value_string) VALUES ('namaorgpendek', 'Nama Pendek', 3, NULL, NULL, 'BNPP-RI');
INSERT INTO public.tb_appl_setting (code, name, value_type, value_date, value_number, value_string) VALUES ('alamatorg', 'Jalan Kebon Sirih No.31 Jakarta Pusat', 3, NULL, NULL, 'Jl. Raya No. 1');
INSERT INTO public.tb_appl_setting (code, name, value_type, value_date, value_number, value_string) VALUES ('longitudeorg', 'Longitude', 2, NULL, NULL, '106.83020883068788');
INSERT INTO public.tb_appl_setting (code, name, value_type, value_date, value_number, value_string) VALUES ('latituteorg', 'Latitute', 2, NULL, NULL, '-6.181834027627567');
INSERT INTO public.tb_appl_setting (code, name, value_type, value_date, value_number, value_string) VALUES ('telporg', 'No. Telpon', 3, NULL, NULL, '021-31924491');
INSERT INTO public.tb_appl_setting (code, name, value_type, value_date, value_number, value_string) VALUES ('faxorg', 'No. Faximili', 3, NULL, NULL, '');
INSERT INTO public.tb_appl_setting (code, name, value_type, value_date, value_number, value_string) VALUES ('weborg', 'Web', 3, NULL, NULL, 'bnpp.go.id');
INSERT INTO public.tb_appl_setting (code, name, value_type, value_date, value_number, value_string) VALUES ('emailorgsmtpserver', 'Email Smtp Server', 3, NULL, NULL, 'smtp.gmail.com');
INSERT INTO public.tb_appl_setting (code, name, value_type, value_date, value_number, value_string) VALUES ('emailorgsmtpport', 'Email Smtp Port', 2, NULL, 587, NULL);
INSERT INTO public.tb_appl_setting (code, name, value_type, value_date, value_number, value_string) VALUES ('emailorg', 'Email', 3, NULL, NULL, 'bnpp.monev@gmail.com');
INSERT INTO public.tb_appl_setting (code, name, value_type, value_date, value_number, value_string) VALUES ('emailorgpassword', 'Email Password', 3, NULL, NULL, 'b33np3p3');


--
-- TOC entry 3946 (class 0 OID 28410)
-- Dependencies: 215
-- Data for Name: tb_appl_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (201, 200, 1, 'Konfigurasi Aplikasi', 'konfigurasi_appl', 'index', 'Konfigurasi Aplikasi', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (203, 200, 1, 'Hak Akses Aplikasi', 'pengaturan_hak_akses', 'index', 'Pengaturan hak akses aplikasi', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (300, NULL, 1, 'Monev', NULL, NULL, 'Monitoring dan Evaluasi', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (100, NULL, 1, 'Master', 'master', NULL, 'Pengelolaan data master', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (101, 100, 1, 'Variabel', 'master', 'variabel', 'Pengaturan variabel penilaian', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (102, 100, 1, 'Bobot', 'master', 'bobot', 'Pengaturan Bobot penilaian', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (103, 100, 1, 'Pegawai Kecamatan', 'master', 'pegkecamatan', 'Pengaturan master pegawai', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (104, 100, 1, 'Jabatan Kecamatan', 'master', 'jabatan', 'Pengaturan master jabatan pegawai', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (302, 300, 1, 'Input Monev', 'monev', 'AddMonev', 'Input data monitoring dan evaluasi', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (200, NULL, 1, 'Pengaturan', '', NULL, 'Pengaturan Aplikasi dan Pengguna', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (204, 200, 1, 'Pengguna Aplikasi', 'setting-app', 'users', 'Pengaturan pengguna aplikasi', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (202, 200, 1, 'Menu Aplikasi', 'setting-app', 'menu', 'Pengaturan Menu Aplikasi', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (301, 300, 1, 'Laporan Monev', 'monev', 'ReportMonev', 'Laporan Monitoring dan Evaluasi', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (10501, 100, 1, 'Provinsi', 'master-wil', 'provinsi', 'Penganturan data provinsi', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (10502, 100, 1, 'Kabupaten', 'master-wil', 'kabupaten', 'Penganturan data kabupaten', 'cil-speedometer');
INSERT INTO public.tb_appl_task (id_appl_task, id_appl_task_parent, id_appl, appl_task_name, controller_name, action_name, description, icon_name) VALUES (10503, 100, 1, 'Kecamatan', 'master-wil', 'kecamatan', 'Penganturan data kecamatan', 'cil-speedometer');


--
-- TOC entry 3948 (class 0 OID 28421)
-- Dependencies: 217
-- Data for Name: tb_appl_task_delegation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3950 (class 0 OID 28429)
-- Dependencies: 219
-- Data for Name: tb_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_role (id_role, role_name) VALUES (1, 'Administrator');
INSERT INTO public.tb_role (id_role, role_name) VALUES (3, 'Petugas Kecamatan');


--
-- TOC entry 3951 (class 0 OID 28435)
-- Dependencies: 220
-- Data for Name: tb_role_appl_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 100);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 101);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 102);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 103);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 104);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 10501);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 10502);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 10503);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 200);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 201);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 202);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 203);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 204);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 300);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 301);
INSERT INTO public.tb_role_appl_task (id_role, id_appl_task) VALUES (1, 302);


--
-- TOC entry 3953 (class 0 OID 28442)
-- Dependencies: 222
-- Data for Name: tb_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_user (id_user, username, password, email, first_name, middle_name, last_name, address, phone_number, mobile_number, file_image, status, last_login, created_date, updated_by, updated_date) VALUES (1, 'admin', 'OZUVHBmdl/7m6yfH2RDOx/2WwQBaA65NT7MSvQ4Vzgc=', 'admin@email.com', 'Administrator', 'middle', 'laste', 'Kota Bogor', '087870066954', '087870066954 x', 'admin.jpg', 1, NULL, '2021-03-26 00:17:44.843963', 1, '2021-03-30 21:24:28.699716');
INSERT INTO public.tb_user (id_user, username, password, email, first_name, middle_name, last_name, address, phone_number, mobile_number, file_image, status, last_login, created_date, updated_by, updated_date) VALUES (9, 'eri', 'ZOgPFdVwlU09cT4+zX+XtHHfo/DdyBB6jcY30UYOEoM=', 'safari.erie@gmail.com', 'eri', 'sa', NULL, 'Bandung', '081313030332 xxx', '081313030332 xxx', NULL, 1, NULL, '2021-03-30 17:21:19.582342', 1, '2021-03-30 21:25:14.47024');
INSERT INTO public.tb_user (id_user, username, password, email, first_name, middle_name, last_name, address, phone_number, mobile_number, file_image, status, last_login, created_date, updated_by, updated_date) VALUES (16, 'ghaisan', '2vy/gzCj1Y4GDvXur6p5EXgs1XYKUhF8NAidYbGTNKc=', 'ghaisan@gmail.com', 'ghaisan', 'dzikri', 'alkhalifi', 'limbangan garut', '081313030332', '081313030332', NULL, 1, NULL, '2021-03-31 02:24:31.684713', NULL, NULL);
INSERT INTO public.tb_user (id_user, username, password, email, first_name, middle_name, last_name, address, phone_number, mobile_number, file_image, status, last_login, created_date, updated_by, updated_date) VALUES (17, 'ghd', '7FZ7X3Uy8vuobEPaUZNY0LW8IV70985b+SPYEKjShZY=', 'ggh@gmail.com', 'ghaisan', 'dzikri', 'alkhalifi', 'limbangan garut', '081313030332', '081313030332', NULL, 1, NULL, '2021-04-01 10:39:47.747285', NULL, NULL);
INSERT INTO public.tb_user (id_user, username, password, email, first_name, middle_name, last_name, address, phone_number, mobile_number, file_image, status, last_login, created_date, updated_by, updated_date) VALUES (20, 'safariGhaisan', 'jpJdzgoCjf9BB/wuIqAy7b3awvPKeVEQsLwtxlQ0SlY=', 'fg@gmail.com', '91', '987', '12', 'sa', 'sa', '232', NULL, 1, NULL, '2021-04-01 13:32:37.957622', NULL, NULL);
INSERT INTO public.tb_user (id_user, username, password, email, first_name, middle_name, last_name, address, phone_number, mobile_number, file_image, status, last_login, created_date, updated_by, updated_date) VALUES (21, 'asjajajaj', 'gfN4YZDCzcRFWvbk3lxgjq4J0VRdNnNm1efxOjj0Ups=', 'as@gmail.com', 'as', 'sa', 'as', 'assa', 'sasa', 'sa', NULL, 1, NULL, '2021-04-01 14:38:57.173053', NULL, NULL);
INSERT INTO public.tb_user (id_user, username, password, email, first_name, middle_name, last_name, address, phone_number, mobile_number, file_image, status, last_login, created_date, updated_by, updated_date) VALUES (18, 'user11', '5N8THGE5ygPRHwNtnElr0M4fvRKj/kJBF/0YHT2Cck0=', 'user11@gmail.com', 'user11', 'dzikri', 'alkhalifi', 'limbangan garut', '081313030332', '081313030332', NULL, -1, NULL, '2021-04-01 10:40:37.758233', 1, '2021-04-01 14:44:29.948872');
INSERT INTO public.tb_user (id_user, username, password, email, first_name, middle_name, last_name, address, phone_number, mobile_number, file_image, status, last_login, created_date, updated_by, updated_date) VALUES (19, 'erisafari', 'MfNe/ZvrlTikXtF+7AtIiJVQsRR3wsGZ7vlXnYXs0AY=', 'Test@gmail.com', '738923789', '1271890', '731987239', '38971289', 'sa', 'sa', NULL, -1, NULL, '2021-04-01 13:30:37.24106', 1, '2021-04-01 14:44:46.080952');


--
-- TOC entry 3954 (class 0 OID 28455)
-- Dependencies: 223
-- Data for Name: tb_user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_user_role (id_user, id_role) VALUES (1, 1);
INSERT INTO public.tb_user_role (id_user, id_role) VALUES (1, 3);
INSERT INTO public.tb_user_role (id_user, id_role) VALUES (9, 1);
INSERT INTO public.tb_user_role (id_user, id_role) VALUES (16, 3);
INSERT INTO public.tb_user_role (id_user, id_role) VALUES (17, 3);


--
-- TOC entry 3958 (class 0 OID 28532)
-- Dependencies: 227
-- Data for Name: tb_kabupaten; Type: TABLE DATA; Schema: wil; Owner: postgres
--

INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (1106, '1106', 'Aceh Besar', 11);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (1172, '1172', 'Kota Sabang', 11);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (1174, '1174', 'Kota Langsa', 11);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (1218, '1218', 'Serdang Bedagai', 12);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (1219, '1219', 'Batu Bara', 12);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (1403, '1403', 'Bengkalis', 14);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (1407, '1407', 'Rokan Hilir', 14);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (1410, '1410', 'Kep. Meranti', 14);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (1472, '1472', 'Kota Dumai', 14);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (2101, '2101', 'Bintan', 21);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (2102, '2102', 'Karimun', 21);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (2103, '2103', 'Natuna', 21);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (2105, '2105', 'Kepulauan Anambas', 21);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (2171, '2171', 'Kota Batam', 21);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (5301, '5301', 'Kupang', 53);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (5303, '5303', 'Timor Tengah Utara', 53);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (5304, '5304', 'Belu', 53);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (5305, '5305', 'Alor', 53);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (5314, '5314', 'Rote Ndao', 53);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (5320, '5320', 'Sabu Raijua', 53);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (5321, '5321', 'Malaka', 53);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (6101, '6101', 'Sambas', 61);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (6103, '6103', 'Sanggau', 61);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (6105, '6105', 'Sintang', 61);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (6106, '6106', 'Kapuas Hulu', 61);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (6107, '6107', 'Bengkayang', 61);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (6403, '6403', 'Berau', 64);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (6411, '6411', 'Mahakam Ulu', 64);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (6502, '6502', 'Malinau', 65);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (6503, '6503', 'Nunukan', 65);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (7103, '7103', 'Kepulauan Sangihe', 71);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (7104, '7104', 'Kepulauan Talaud', 71);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (7106, '7106', 'Minahasa Utara', 71);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (7108, '7108', 'Bolaang Mongondow Utara', 71);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (7109, '7109', 'Kep. Siau Tagulandang Biaro', 71);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (7204, '7204', 'Toli Toli', 72);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (7505, '7505', 'Gorontalo Utara', 75);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (8102, '8102', 'Maluku Tenggara', 81);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (8103, '8103', 'Kepulauan Tanimbar', 81);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (8107, '8107', 'Kepulauan Aru', 81);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (8108, '8108', 'Maluku Barat Daya', 81);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (8202, '8202', 'Halmahera Tengah', 82);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (8207, '8207', 'Pulau Morotai', 82);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (9101, '9101', 'Merauke', 91);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (9106, '9106', 'Biak Numfor', 91);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (9109, '9109', 'Mimika', 91);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (9110, '9110', 'Sarmi', 91);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (9111, '9111', 'Keerom', 91);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (9112, '9112', 'Pegunungan Bintang', 91);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (9116, '9116', 'Boven Digoel', 91);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (9119, '9119', 'Supiori', 91);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (9171, '9171', 'Kota Jayapura', 91);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (9205, '9205', 'Raja Ampat', 92);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (9209, '9209', 'Tambrauw', 92);
INSERT INTO wil.tb_kabupaten (id_kabupaten, kode, nama, id_provinsi) VALUES (14, 'ACCC', 'test', 11);


--
-- TOC entry 3960 (class 0 OID 28542)
-- Dependencies: 229
-- Data for Name: tb_kecamatan; Type: TABLE DATA; Schema: wil; Owner: postgres
--

INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (110609, '110609 ', 'Mesjid Raya', 1106, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (117201, '117201 ', 'Sukakarya', 1172, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (117202, '117202 ', 'Sukajaya', 1172, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (117402, '117402 ', 'Langsa Barat', 1174, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (121805, '121805 ', 'Tanjung Beringin', 1218, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (121902, '121902 ', 'Sei Suka', 1219, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (140301, '140301 ', 'Bengkalis', 1403, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (140302, '140302 ', 'Bantan', 1403, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (140303, '140303 ', 'Bandar Laksamana', 1403, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (140310, '140310 ', 'Rupat', 1403, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (140311, '140311 ', 'Rupat Utara', 1403, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (140702, '140702 ', 'Bangko', 1407, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (140706, '140706 ', 'Pasir Limau Kapas', 1407, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (140707, '140707 ', 'Sinaboi', 1407, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (141002, '141002 ', 'Rangsang Barat', 1410, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (141003, '141003 ', 'Rangsang', 1410, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (141006, '141006 ', 'Pulau Merbau', 1410, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (141008, '141008 ', 'Tasik Putri Puyu', 1410, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (141009, '141009 ', 'Rangsang Pesisir', 1410, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (147204, '147204 ', 'Sungai Sembilan', 1472, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (147205, '147205 ', 'Medang Kampai', 1472, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210104, '210104 ', 'Gunung Kijang', 2101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210107, '210107 ', 'Bintan Utara', 2101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210110, '210110 ', 'Telok Sebong', 2101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210114, '210114 ', 'Bintan Pesisir', 2101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210201, '210201 ', 'Moro', 2102, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210203, '210203 ', 'Karimun', 2102, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210204, '210204 ', 'Meral', 2102, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210205, '210205 ', 'Tebing', 2102, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210206, '210206 ', 'Buru', 2102, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210210, '210210 ', 'Meral Barat', 2102, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210212, '210212 ', 'Belat', 2102, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210305, '210305 ', 'Bunguran Barat', 2103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210306, '210306 ', 'Serasan', 2103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210307, '210307 ', 'Bunguran Timur', 2103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210308, '210308 ', 'Bunguran Utara', 2103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210309, '210309 ', 'Subi', 2103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210310, '210310 ', 'Pulau Laut', 2103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210311, '210311 ', 'Pulau Tiga', 2103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210315, '210315 ', 'Bunguran Timur Laut', 2103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210318, '210318 ', 'Bunguran Selatan', 2103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210319, '210319 ', 'Serasan Timur', 2103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210501, '210501 ', 'Siantan', 2105, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210502, '210502 ', 'Palmatak', 2105, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210504, '210504 ', 'Siantan Selatan', 2105, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210505, '210505 ', 'Jemaja Timur', 2105, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210506, '210506 ', 'Jemaja', 2105, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210508, '210508 ', 'Siantan Utara', 2105, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (210509, '210509 ', 'Jemaja Barat', 2105, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (217101, '217101 ', 'Belakang Padang', 2171, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (217102, '217102 ', 'Batu Ampar', 2171, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (217103, '217103 ', 'Sekupang', 2171, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (217104, '217104 ', 'Nongsa', 2171, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (217106, '217106 ', 'Lubuk Raja', 2171, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (217109, '217109 ', 'Bengkong', 2171, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (217110, '217110 ', 'Batam Kota', 2171, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530126, '530126 ', 'Amfoang Timur', 5301, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530302, '530302 ', 'Miomafo Barat', 5303, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530309, '530309 ', 'Insana Utara', 5303, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530313, '530313 ', 'Mutis', 5303, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530315, '530315 ', 'Bikomi Tengah', 5303, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530316, '530316 ', 'Bikomi Nilulat', 5303, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530317, '530317 ', 'Bikomi Utara', 5303, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530318, '530318 ', 'Naibenu', 5303, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530401, '530401 ', 'Lamaknen', 5304, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530402, '530402 ', 'Tasifeto Timur', 5304, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530403, '530403 ', 'Raihat', 5304, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530404, '530404 ', 'Tasifeto Barat', 5304, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530417, '530417 ', 'Lasiolat', 5304, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530418, '530418 ', 'Lamaknen Selatan', 5304, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530423, '530423 ', 'Nanaet Duabesi', 5304, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530501, '530501 ', 'Teluk Mutiara', 5305, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530503, '530503 ', 'Alor Barat Daya', 5305, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530504, '530504 ', 'Alor Selatan', 5305, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530505, '530505 ', 'Alor Timur', 5305, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530512, '530512 ', 'Mataru', 5305, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530513, '530513 ', 'Pureman', 5305, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (530516, '530516 ', 'Pantar Tengah', 5305, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (531401, '531401 ', 'Rote Barat Daya', 5314, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (531403, '531403 ', 'Lobalain', 5314, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (531405, '531405 ', 'Pantai Baru', 5314, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (531406, '531406 ', 'Rote Timur', 5314, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (531407, '531407 ', 'Rote Barat', 5314, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (531408, '531408 ', 'Rote Selatan', 5314, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (531410, '531410 ', 'Landu Leko', 5314, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (532003, '532003 ', 'Sabu Timur', 5320, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (532004, '532004 ', 'Sabu Liae', 5320, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (532005, '532005 ', 'Hawu Mehara', 5320, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (532006, '532006 ', 'Raijua', 5320, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (532101, '532101 ', 'Malaka Tengah', 5321, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (532102, '532102 ', 'Malaka Barat', 5321, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (532103, '532103 ', 'Wewiku', 5321, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (532110, '532110 ', 'Kobalima Timur', 5321, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (532111, '532111 ', 'Kobalima', 5321, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610108, '610108 ', 'Paloh', 6101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610109, '610109 ', 'Sajingan Besar', 6101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610307, '610307 ', 'Sekayam', 6103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610321, '610321 ', 'Entikong', 6103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610505, '610505 ', 'Ketungau Tengah', 6105, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610506, '610506 ', 'Ketungau Hulu', 6105, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610601, '610601 ', 'Putussibau Utara', 6106, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610604, '610604 ', 'Embaloh Hulu', 6106, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610612, '610612 ', 'Batang Lupar', 6106, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610614, '610614 ', 'Badau', 6106, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610617, '610617 ', 'Putussibau Selatan', 6106, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610623, '610623 ', 'Puring Kencana', 6106, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610707, '610707 ', 'Jagoi Babang', 6107, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (610712, '610712 ', 'Siding', 6107, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (640311, '640311 ', 'Maratua', 6403, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (641104, '641104 ', 'Long Apari', 6411, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (641105, '641105 ', 'Long Pahangai', 6411, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650203, '650203 ', 'Pujungan', 6502, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650204, '650204 ', 'Kayan Hilir', 6502, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650205, '650205 ', 'Kayan Hulu', 6502, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650210, '650210 ', 'Kayan Selatan', 6502, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650211, '650211 ', 'Bahau Hulu', 6502, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650301, '650301 ', 'Sebatik', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650302, '650302 ', 'Nunukan', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650305, '650305 ', 'Krayan', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650307, '650307 ', 'Krayan Selatan', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650308, '650308 ', 'Sebatik Barat', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650309, '650309 ', 'Nunukan Selatan', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650310, '650310 ', 'Sebatik Timur', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650311, '650311 ', 'Sebatik Utara', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650312, '650312 ', 'Sebatik Tengah', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650313, '650313 ', 'Sei Menggaris', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650314, '650314 ', 'Tulin Onsoi', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650315, '650315 ', 'Lumbis Ogong', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650317, '650317 ', 'Krayan Tengah', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650318, '650318 ', 'Krayan Timur', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (650319, '650319 ', 'Krayan Barat', 6503, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710308, '710308 ', 'Tabukan Utara', 7103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710309, '710309 ', 'Nusa Tabukan', 7103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710316, '710316 ', 'Kendahe', 7103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710317, '710317 ', 'Tahuna', 7103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710324, '710324 ', 'Tahuna Timur', 7103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710325, '710325 ', 'Kepulauan Marore', 7103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710405, '710405 ', 'Nanusa', 7104, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710406, '710406 ', 'Kabaruan', 7104, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710407, '710407 ', 'Melonguane', 7104, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710409, '710409 ', 'Damau', 7104, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710413, '710413 ', 'Miangas', 7104, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710604, '710604 ', 'Wori', 7106, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710806, '710806 ', 'Pinogaluman', 7108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (710902, '710902 ', 'Siau Barat', 7109, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (720402, '720402 ', 'Dampal Utara', 7204, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (720409, '720409 ', 'Toli-toli Utara', 7204, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (720410, '720410 ', 'Dako Pemean', 7204, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (750503, '750503 ', 'Anggrek', 7505, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810203, '810203 ', 'Kei Besar', 8102, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810204, '810204 ', 'Kei Besar Selatan', 8102, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810205, '810205 ', 'Kei Besar Utara Timur', 8102, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810218, '810218 ', 'Kei Besar Selatan Barat', 8102, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810301, '810301 ', 'Tanimbar Selatan', 8103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810302, '810302 ', 'Selaru', 8103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810303, '810303 ', 'Wer Tamrian', 8103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810305, '810305 ', 'Tanimbar Utara', 8103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810306, '810306 ', 'Yaru', 8103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810308, '810308 ', 'Kormomolin', 8103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810309, '810309 ', 'Nirunmas', 8103, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810701, '810701 ', 'Pulau-Pulau Aru', 8107, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810706, '810706 ', 'Sir-Sir', 8107, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810707, '810707 ', 'Aru Tengah Timur', 8107, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810708, '810708 ', 'Aru Tengah Selatan', 8107, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810709, '810709 ', 'Aru Selatan Timur', 8107, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810801, '810801 ', 'Moa Lakor', 8108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810803, '810803 ', 'Mndona Hiera', 8108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810804, '810804 ', 'Pulau-Pulau Babar', 8108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810806, '810806 ', 'Wetar', 8108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810807, '810807 ', 'PP. Terselatan', 8108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810808, '810808 ', 'P. Leti', 8108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810809, '810809 ', 'P. Masela', 8108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810812, '810812 ', 'P. Lakor', 8108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810813, '810813 ', 'Wetar Utara', 8108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810814, '810814 ', 'Wetar Barat', 8108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810815, '810815 ', 'Wetar Timur', 8108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (810817, '810817 ', 'Kisar Utara', 8108, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (820206, '820206 ', 'Patani Utara', 8202, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (820701, '820701 ', 'Morotai Selatan', 8207, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (820702, '820702 ', 'Morotai Selatan Barat', 8207, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (820703, '820703 ', 'Morotai Jaya', 8207, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (820704, '820704 ', 'Morotai Utara', 8207, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (820705, '820705 ', 'Morotai Timur', 8207, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (910101, '910101 ', 'Merauke', 9101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (910104, '910104 ', 'Kimaam', 9101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (910105, '910105 ', 'Semangga', 9101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (910108, '910108 ', 'Sota', 9101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (910109, '910109 ', 'Ulilin', 9101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (910110, '910110 ', 'Elikobal', 9101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (910112, '910112 ', 'Naukenjerai', 9101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (910115, '910115 ', 'Okaba', 9101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (910118, '910118 ', 'Tabonji', 9101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (910119, '910119 ', 'Waan', 9101, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (910601, '910601 ', 'Biak Kota', 9106, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (910907, '910907 ', 'Mimika Timur Jauh', 9109, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911001, '911001 ', 'Sarmi', 9110, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911101, '911101 ', 'Waris', 9111, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911104, '911104 ', 'Web', 9111, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911106, '911106 ', 'Arso Timur', 9111, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911107, '911107 ', 'Towe', 9111, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911110, '911110 ', 'Yaffi', 9111, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911204, '911204 ', 'Iwur', 9112, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911205, '911205 ', 'Batom', 9112, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911207, '911207 ', 'Kiwirok Timur', 9112, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911219, '911219 ', 'Tarup', 9112, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911221, '911221 ', 'Oksamol', 9112, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911228, '911228 ', 'Murkim', 9112, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911229, '911229 ', 'Mofinop', 9112, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911603, '911603 ', 'Waropko', 9116, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911605, '911605 ', 'Jair', 9116, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911607, '911607 ', 'Kombut', 9116, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911617, '911617 ', 'Ninati', 9116, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911618, '911618 ', 'Sesnuk', 9116, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911902, '911902 ', 'Supiori Utara', 9119, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911903, '911903 ', 'Supiori Timur', 9119, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911904, '911904 ', 'Kep. Aruri', 9119, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (911905, '911905 ', 'Supiori Barat', 9119, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (917101, '917101 ', 'Jayapura Utara', 9171, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (917104, '917104 ', 'Muaratami', 9171, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (920505, '920505 ', 'Kep. Ayau', 9205, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (920524, '920524 ', 'Ayau', 9205, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (920905, '920905 ', 'Sausapor', 9209, NULL);
INSERT INTO wil.tb_kecamatan (id_kecamatan, kode, nama, id_kabupaten, geom) VALUES (1, 'KEC1   ', 'Test Keca 1 updateb 11', 1106, NULL);


--
-- TOC entry 3964 (class 0 OID 28568)
-- Dependencies: 233
-- Data for Name: tb_provinsi; Type: TABLE DATA; Schema: wil; Owner: postgres
--

INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (11, '11', 'ACEH');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (12, '12', 'SUMATERA UTARA');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (14, '14', 'RIAU');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (21, '21', 'KEPULAUAN RIAU');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (53, '53', 'NUSA TENGGARA TIMUR');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (61, '61', 'KALIMANTAN BARAT');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (64, '64', 'KALIMANTAN TIMUR');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (65, '65', 'KALIMANTAN UTARA');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (71, '71', 'SULAWESI UTARA');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (72, '72', 'SULAWESI TENGAH');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (75, '75', 'GORONTALO');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (81, '81', 'MALUKU');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (82, '82', 'MALUKU');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (91, '91', 'PAPUA');
INSERT INTO wil.tb_provinsi (id_provinsi, kode, nama) VALUES (92, '92', 'PAPUA BARAT');


--
-- TOC entry 4011 (class 0 OID 0)
-- Dependencies: 234
-- Name: tb_bobot_kecukupan_id_bobot_kecukupan_seq; Type: SEQUENCE SET; Schema: mnv; Owner: postgres
--

SELECT pg_catalog.setval('mnv.tb_bobot_kecukupan_id_bobot_kecukupan_seq', 3, true);


--
-- TOC entry 4012 (class 0 OID 0)
-- Dependencies: 236
-- Name: tb_bobot_ketersediaan_id_bobot_ketersediaan_seq; Type: SEQUENCE SET; Schema: mnv; Owner: postgres
--

SELECT pg_catalog.setval('mnv.tb_bobot_ketersediaan_id_bobot_ketersediaan_seq', 2, true);


--
-- TOC entry 4013 (class 0 OID 0)
-- Dependencies: 238
-- Name: tb_bobot_kondisi_id_bobot_kondisi_seq; Type: SEQUENCE SET; Schema: mnv; Owner: postgres
--

SELECT pg_catalog.setval('mnv.tb_bobot_kondisi_id_bobot_kondisi_seq', 6, true);


--
-- TOC entry 4014 (class 0 OID 0)
-- Dependencies: 240
-- Name: tb_indikator_id_indikator_seq; Type: SEQUENCE SET; Schema: mnv; Owner: postgres
--

SELECT pg_catalog.setval('mnv.tb_indikator_id_indikator_seq', 11, true);


--
-- TOC entry 4015 (class 0 OID 0)
-- Dependencies: 242
-- Name: tb_jawaban_id_jawaban_seq; Type: SEQUENCE SET; Schema: mnv; Owner: postgres
--

SELECT pg_catalog.setval('mnv.tb_jawaban_id_jawaban_seq', 295, true);


--
-- TOC entry 4016 (class 0 OID 0)
-- Dependencies: 245
-- Name: tb_jenis_variabel_id_jenis_variabel_seq; Type: SEQUENCE SET; Schema: mnv; Owner: postgres
--

SELECT pg_catalog.setval('mnv.tb_jenis_variabel_id_jenis_variabel_seq', 3, true);


--
-- TOC entry 4017 (class 0 OID 0)
-- Dependencies: 249
-- Name: tb_monev_detil_id_monev_detil_seq; Type: SEQUENCE SET; Schema: mnv; Owner: postgres
--

SELECT pg_catalog.setval('mnv.tb_monev_detil_id_monev_detil_seq', 25, true);


--
-- TOC entry 4018 (class 0 OID 0)
-- Dependencies: 247
-- Name: tb_monev_id_monev_seq; Type: SEQUENCE SET; Schema: mnv; Owner: postgres
--

SELECT pg_catalog.setval('mnv.tb_monev_id_monev_seq', 7, true);


--
-- TOC entry 4019 (class 0 OID 0)
-- Dependencies: 251
-- Name: tb_pertanyaan_id_pertanyaan_seq; Type: SEQUENCE SET; Schema: mnv; Owner: postgres
--

SELECT pg_catalog.setval('mnv.tb_pertanyaan_id_pertanyaan_seq', 60, true);


--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 253
-- Name: tb_variabel_id_variabel_seq; Type: SEQUENCE SET; Schema: mnv; Owner: postgres
--

SELECT pg_catalog.setval('mnv.tb_variabel_id_variabel_seq', 7, true);


--
-- TOC entry 4021 (class 0 OID 0)
-- Dependencies: 224
-- Name: tb_jabatan_id_jabatan_seq; Type: SEQUENCE SET; Schema: org; Owner: postgres
--

SELECT pg_catalog.setval('org.tb_jabatan_id_jabatan_seq', 6, true);


--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 211
-- Name: tb_appl_id_appl_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_appl_id_appl_seq', 2, true);


--
-- TOC entry 4023 (class 0 OID 0)
-- Dependencies: 216
-- Name: tb_appl_task_delegation_id_appl_task_delegation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_appl_task_delegation_id_appl_task_delegation_seq', 1, false);


--
-- TOC entry 4024 (class 0 OID 0)
-- Dependencies: 214
-- Name: tb_appl_task_id_appl_task_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_appl_task_id_appl_task_seq', 20, true);


--
-- TOC entry 4025 (class 0 OID 0)
-- Dependencies: 218
-- Name: tb_role_id_role_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_role_id_role_seq', 3, true);


--
-- TOC entry 4026 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_user_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_user_id_user_seq', 21, true);


--
-- TOC entry 4027 (class 0 OID 0)
-- Dependencies: 226
-- Name: tb_kabupaten_id_kabupaten_seq; Type: SEQUENCE SET; Schema: wil; Owner: postgres
--

SELECT pg_catalog.setval('wil.tb_kabupaten_id_kabupaten_seq', 14, true);


--
-- TOC entry 4028 (class 0 OID 0)
-- Dependencies: 228
-- Name: tb_kecamatan_id_kecamatan_seq; Type: SEQUENCE SET; Schema: wil; Owner: postgres
--

SELECT pg_catalog.setval('wil.tb_kecamatan_id_kecamatan_seq', 1, true);


--
-- TOC entry 4029 (class 0 OID 0)
-- Dependencies: 232
-- Name: tb_provinsi_id_provinsi_seq; Type: SEQUENCE SET; Schema: wil; Owner: postgres
--

SELECT pg_catalog.setval('wil.tb_provinsi_id_provinsi_seq', 1, false);


--
-- TOC entry 3743 (class 2606 OID 28833)
-- Name: tb_bobot_kecukupan pk_bobot_kecukupan; Type: CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_bobot_kecukupan
    ADD CONSTRAINT pk_bobot_kecukupan PRIMARY KEY (id_bobot_kecukupan);


--
-- TOC entry 3745 (class 2606 OID 28841)
-- Name: tb_bobot_ketersediaan pk_bobot_ketersediaan; Type: CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_bobot_ketersediaan
    ADD CONSTRAINT pk_bobot_ketersediaan PRIMARY KEY (id_bobot_ketersediaan);


--
-- TOC entry 3747 (class 2606 OID 28849)
-- Name: tb_bobot_kondisi pk_bobot_kondisi; Type: CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_bobot_kondisi
    ADD CONSTRAINT pk_bobot_kondisi PRIMARY KEY (id_bobot_kondisi);


--
-- TOC entry 3749 (class 2606 OID 28857)
-- Name: tb_indikator pk_indikator; Type: CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_indikator
    ADD CONSTRAINT pk_indikator PRIMARY KEY (id_indikator);


--
-- TOC entry 3751 (class 2606 OID 28868)
-- Name: tb_jawaban pk_jawaban_type1; Type: CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_jawaban
    ADD CONSTRAINT pk_jawaban_type1 PRIMARY KEY (id_jawaban);


--
-- TOC entry 3753 (class 2606 OID 28873)
-- Name: tb_jenis_lokpri pk_jenis_lokpri; Type: CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_jenis_lokpri
    ADD CONSTRAINT pk_jenis_lokpri PRIMARY KEY (id_jenis_lokpri);


--
-- TOC entry 3755 (class 2606 OID 28881)
-- Name: tb_jenis_variabel pk_jenis_variabel; Type: CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_jenis_variabel
    ADD CONSTRAINT pk_jenis_variabel PRIMARY KEY (id_jenis_variabel);


--
-- TOC entry 3757 (class 2606 OID 28889)
-- Name: tb_monev pk_monev; Type: CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_monev
    ADD CONSTRAINT pk_monev PRIMARY KEY (id_monev);


--
-- TOC entry 3759 (class 2606 OID 28897)
-- Name: tb_monev_detil pk_monev_detil; Type: CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_monev_detil
    ADD CONSTRAINT pk_monev_detil PRIMARY KEY (id_monev_detil);


--
-- TOC entry 3763 (class 2606 OID 28907)
-- Name: tb_pertanyaan pk_pertanyaan; Type: CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_pertanyaan
    ADD CONSTRAINT pk_pertanyaan PRIMARY KEY (id_pertanyaan);


--
-- TOC entry 3765 (class 2606 OID 28915)
-- Name: tb_variabel pk_variabel; Type: CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_variabel
    ADD CONSTRAINT pk_variabel PRIMARY KEY (id_variabel);


--
-- TOC entry 3761 (class 2606 OID 28899)
-- Name: tb_monev_detil uq_monev_detil; Type: CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_monev_detil
    ADD CONSTRAINT uq_monev_detil UNIQUE (id_variabel, id_monev);


--
-- TOC entry 3723 (class 2606 OID 28527)
-- Name: tb_jabatan pk_jabatan; Type: CONSTRAINT; Schema: org; Owner: postgres
--

ALTER TABLE ONLY org.tb_jabatan
    ADD CONSTRAINT pk_jabatan PRIMARY KEY (id_jabatan);


--
-- TOC entry 3735 (class 2606 OID 28560)
-- Name: tb_kecamatan_profil pk_organisasi; Type: CONSTRAINT; Schema: org; Owner: postgres
--

ALTER TABLE ONLY org.tb_kecamatan_profil
    ADD CONSTRAINT pk_organisasi PRIMARY KEY (id_kecamatan);


--
-- TOC entry 3737 (class 2606 OID 28565)
-- Name: tb_pegawai_kecamatan pk_pegawai_kecamatan; Type: CONSTRAINT; Schema: org; Owner: postgres
--

ALTER TABLE ONLY org.tb_pegawai_kecamatan
    ADD CONSTRAINT pk_pegawai_kecamatan PRIMARY KEY (id_pegawai);


--
-- TOC entry 3725 (class 2606 OID 28529)
-- Name: tb_jabatan tb_jabatan_kode_key; Type: CONSTRAINT; Schema: org; Owner: postgres
--

ALTER TABLE ONLY org.tb_jabatan
    ADD CONSTRAINT tb_jabatan_kode_key UNIQUE (kode);


--
-- TOC entry 3703 (class 2606 OID 28399)
-- Name: tb_appl pk_appl; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl
    ADD CONSTRAINT pk_appl PRIMARY KEY (id_appl);


--
-- TOC entry 3705 (class 2606 OID 28407)
-- Name: tb_appl_setting pk_appl_setting; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_setting
    ADD CONSTRAINT pk_appl_setting PRIMARY KEY (code);


--
-- TOC entry 3707 (class 2606 OID 28418)
-- Name: tb_appl_task pk_appl_task; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_task
    ADD CONSTRAINT pk_appl_task PRIMARY KEY (id_appl_task);


--
-- TOC entry 3709 (class 2606 OID 28426)
-- Name: tb_appl_task_delegation pk_appl_task_delegation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_task_delegation
    ADD CONSTRAINT pk_appl_task_delegation PRIMARY KEY (id_appl_task_delegation);


--
-- TOC entry 3711 (class 2606 OID 28434)
-- Name: tb_role pk_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_role
    ADD CONSTRAINT pk_role PRIMARY KEY (id_role);


--
-- TOC entry 3713 (class 2606 OID 28439)
-- Name: tb_role_appl_task pk_role_appl_task; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_role_appl_task
    ADD CONSTRAINT pk_role_appl_task PRIMARY KEY (id_role, id_appl_task);


--
-- TOC entry 3715 (class 2606 OID 28450)
-- Name: tb_user pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT pk_user PRIMARY KEY (id_user);


--
-- TOC entry 3721 (class 2606 OID 28459)
-- Name: tb_user_role pk_user_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user_role
    ADD CONSTRAINT pk_user_role PRIMARY KEY (id_user, id_role);


--
-- TOC entry 3717 (class 2606 OID 28454)
-- Name: tb_user tb_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_email_key UNIQUE (email);


--
-- TOC entry 3719 (class 2606 OID 28452)
-- Name: tb_user tb_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_username_key UNIQUE (username);


--
-- TOC entry 3727 (class 2606 OID 28537)
-- Name: tb_kabupaten pk_kabupaten; Type: CONSTRAINT; Schema: wil; Owner: postgres
--

ALTER TABLE ONLY wil.tb_kabupaten
    ADD CONSTRAINT pk_kabupaten PRIMARY KEY (id_kabupaten);


--
-- TOC entry 3731 (class 2606 OID 28550)
-- Name: tb_kecamatan pk_kecamatan; Type: CONSTRAINT; Schema: wil; Owner: postgres
--

ALTER TABLE ONLY wil.tb_kecamatan
    ADD CONSTRAINT pk_kecamatan PRIMARY KEY (id_kecamatan);


--
-- TOC entry 3739 (class 2606 OID 28573)
-- Name: tb_provinsi pk_provinsi; Type: CONSTRAINT; Schema: wil; Owner: postgres
--

ALTER TABLE ONLY wil.tb_provinsi
    ADD CONSTRAINT pk_provinsi PRIMARY KEY (id_provinsi);


--
-- TOC entry 3729 (class 2606 OID 28539)
-- Name: tb_kabupaten tb_kabupaten_kode_key; Type: CONSTRAINT; Schema: wil; Owner: postgres
--

ALTER TABLE ONLY wil.tb_kabupaten
    ADD CONSTRAINT tb_kabupaten_kode_key UNIQUE (kode);


--
-- TOC entry 3733 (class 2606 OID 28552)
-- Name: tb_kecamatan tb_kecamatan_kode_key; Type: CONSTRAINT; Schema: wil; Owner: postgres
--

ALTER TABLE ONLY wil.tb_kecamatan
    ADD CONSTRAINT tb_kecamatan_kode_key UNIQUE (kode);


--
-- TOC entry 3741 (class 2606 OID 28575)
-- Name: tb_provinsi tb_provinsi_kode_key; Type: CONSTRAINT; Schema: wil; Owner: postgres
--

ALTER TABLE ONLY wil.tb_provinsi
    ADD CONSTRAINT tb_provinsi_kode_key UNIQUE (kode);


--
-- TOC entry 3809 (class 2620 OID 28607)
-- Name: tb_kecamatan_profil trg_setgeom_bi; Type: TRIGGER; Schema: org; Owner: postgres
--

CREATE TRIGGER trg_setgeom_bi BEFORE INSERT ON org.tb_kecamatan_profil FOR EACH ROW EXECUTE FUNCTION org.fnc_kecamatan_profil_setgeom();


--
-- TOC entry 3810 (class 2620 OID 28608)
-- Name: tb_kecamatan_profil trg_setgeom_bu; Type: TRIGGER; Schema: org; Owner: postgres
--

CREATE TRIGGER trg_setgeom_bu BEFORE UPDATE ON org.tb_kecamatan_profil FOR EACH ROW EXECUTE FUNCTION org.fnc_kecamatan_profil_setgeom();


--
-- TOC entry 3785 (class 2606 OID 28966)
-- Name: tb_bobot_kecukupan fktb_bobot_k260797; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_bobot_kecukupan
    ADD CONSTRAINT fktb_bobot_k260797 FOREIGN KEY (updated_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3787 (class 2606 OID 28976)
-- Name: tb_bobot_ketersediaan fktb_bobot_k72236; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_bobot_ketersediaan
    ADD CONSTRAINT fktb_bobot_k72236 FOREIGN KEY (updated_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3786 (class 2606 OID 28971)
-- Name: tb_bobot_ketersediaan fktb_bobot_k73928; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_bobot_ketersediaan
    ADD CONSTRAINT fktb_bobot_k73928 FOREIGN KEY (created_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3784 (class 2606 OID 28961)
-- Name: tb_bobot_kecukupan fktb_bobot_k885366; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_bobot_kecukupan
    ADD CONSTRAINT fktb_bobot_k885366 FOREIGN KEY (created_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3788 (class 2606 OID 28981)
-- Name: tb_bobot_kondisi fktb_bobot_k950025; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_bobot_kondisi
    ADD CONSTRAINT fktb_bobot_k950025 FOREIGN KEY (created_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3789 (class 2606 OID 28986)
-- Name: tb_bobot_kondisi fktb_bobot_k96190; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_bobot_kondisi
    ADD CONSTRAINT fktb_bobot_k96190 FOREIGN KEY (updated_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3790 (class 2606 OID 28931)
-- Name: tb_indikator fktb_indikat281860; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_indikator
    ADD CONSTRAINT fktb_indikat281860 FOREIGN KEY (id_variabel) REFERENCES mnv.tb_variabel(id_variabel);


--
-- TOC entry 3791 (class 2606 OID 28936)
-- Name: tb_indikator fktb_indikat365478; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_indikator
    ADD CONSTRAINT fktb_indikat365478 FOREIGN KEY (created_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3792 (class 2606 OID 28941)
-- Name: tb_indikator fktb_indikat780685; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_indikator
    ADD CONSTRAINT fktb_indikat780685 FOREIGN KEY (updated_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3793 (class 2606 OID 29021)
-- Name: tb_jawaban fktb_jawaban132504; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_jawaban
    ADD CONSTRAINT fktb_jawaban132504 FOREIGN KEY (id_pertanyaan) REFERENCES mnv.tb_pertanyaan(id_pertanyaan);


--
-- TOC entry 3794 (class 2606 OID 29026)
-- Name: tb_jawaban fktb_jawaban133456; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_jawaban
    ADD CONSTRAINT fktb_jawaban133456 FOREIGN KEY (id_monev_detil) REFERENCES mnv.tb_monev_detil(id_monev_detil);


--
-- TOC entry 3795 (class 2606 OID 28991)
-- Name: tb_monev fktb_monev204000; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_monev
    ADD CONSTRAINT fktb_monev204000 FOREIGN KEY (created_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3797 (class 2606 OID 29031)
-- Name: tb_monev fktb_monev337678; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_monev
    ADD CONSTRAINT fktb_monev337678 FOREIGN KEY (id_pegawai) REFERENCES org.tb_pegawai_kecamatan(id_pegawai);


--
-- TOC entry 3796 (class 2606 OID 28996)
-- Name: tb_monev fktb_monev942163; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_monev
    ADD CONSTRAINT fktb_monev942163 FOREIGN KEY (updated_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3799 (class 2606 OID 29006)
-- Name: tb_monev_detil fktb_monev_d20361; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_monev_detil
    ADD CONSTRAINT fktb_monev_d20361 FOREIGN KEY (id_monev) REFERENCES mnv.tb_monev(id_monev);


--
-- TOC entry 3800 (class 2606 OID 29011)
-- Name: tb_monev_detil fktb_monev_d401605; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_monev_detil
    ADD CONSTRAINT fktb_monev_d401605 FOREIGN KEY (created_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3798 (class 2606 OID 29001)
-- Name: tb_monev_detil fktb_monev_d485223; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_monev_detil
    ADD CONSTRAINT fktb_monev_d485223 FOREIGN KEY (id_variabel) REFERENCES mnv.tb_variabel(id_variabel);


--
-- TOC entry 3801 (class 2606 OID 29016)
-- Name: tb_monev_detil fktb_monev_d547769; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_monev_detil
    ADD CONSTRAINT fktb_monev_d547769 FOREIGN KEY (updated_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3803 (class 2606 OID 28951)
-- Name: tb_pertanyaan fktb_pertany230595; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_pertanyaan
    ADD CONSTRAINT fktb_pertany230595 FOREIGN KEY (created_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3804 (class 2606 OID 28956)
-- Name: tb_pertanyaan fktb_pertany376759; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_pertanyaan
    ADD CONSTRAINT fktb_pertany376759 FOREIGN KEY (updated_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3802 (class 2606 OID 28946)
-- Name: tb_pertanyaan fktb_pertany58416; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_pertanyaan
    ADD CONSTRAINT fktb_pertany58416 FOREIGN KEY (id_indikator) REFERENCES mnv.tb_indikator(id_indikator);


--
-- TOC entry 3805 (class 2606 OID 29036)
-- Name: tb_pertanyaan fktb_pertany750938; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_pertanyaan
    ADD CONSTRAINT fktb_pertany750938 FOREIGN KEY (id_jenis_lokpri) REFERENCES mnv.tb_jenis_lokpri(id_jenis_lokpri);


--
-- TOC entry 3806 (class 2606 OID 28916)
-- Name: tb_variabel fktb_variabe287133; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_variabel
    ADD CONSTRAINT fktb_variabe287133 FOREIGN KEY (created_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3808 (class 2606 OID 28926)
-- Name: tb_variabel fktb_variabe78813; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_variabel
    ADD CONSTRAINT fktb_variabe78813 FOREIGN KEY (id_jenis_variabel) REFERENCES mnv.tb_jenis_variabel(id_jenis_variabel);


--
-- TOC entry 3807 (class 2606 OID 28921)
-- Name: tb_variabel fktb_variabe859030; Type: FK CONSTRAINT; Schema: mnv; Owner: postgres
--

ALTER TABLE ONLY mnv.tb_variabel
    ADD CONSTRAINT fktb_variabe859030 FOREIGN KEY (updated_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3780 (class 2606 OID 28601)
-- Name: tb_kecamatan_profil fktb_kecamat25874; Type: FK CONSTRAINT; Schema: org; Owner: postgres
--

ALTER TABLE ONLY org.tb_kecamatan_profil
    ADD CONSTRAINT fktb_kecamat25874 FOREIGN KEY (id_kecamatan) REFERENCES wil.tb_kecamatan(id_kecamatan);


--
-- TOC entry 3781 (class 2606 OID 28576)
-- Name: tb_pegawai_kecamatan fktb_pegawai200973; Type: FK CONSTRAINT; Schema: org; Owner: postgres
--

ALTER TABLE ONLY org.tb_pegawai_kecamatan
    ADD CONSTRAINT fktb_pegawai200973 FOREIGN KEY (id_pegawai) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3783 (class 2606 OID 28591)
-- Name: tb_pegawai_kecamatan fktb_pegawai784749; Type: FK CONSTRAINT; Schema: org; Owner: postgres
--

ALTER TABLE ONLY org.tb_pegawai_kecamatan
    ADD CONSTRAINT fktb_pegawai784749 FOREIGN KEY (id_jabatan) REFERENCES org.tb_jabatan(id_jabatan);


--
-- TOC entry 3782 (class 2606 OID 28581)
-- Name: tb_pegawai_kecamatan fktb_pegawai81134; Type: FK CONSTRAINT; Schema: org; Owner: postgres
--

ALTER TABLE ONLY org.tb_pegawai_kecamatan
    ADD CONSTRAINT fktb_pegawai81134 FOREIGN KEY (id_kecamatan) REFERENCES org.tb_kecamatan_profil(id_kecamatan);


--
-- TOC entry 3772 (class 2606 OID 28495)
-- Name: tb_appl_task_delegation fktb_appl_ta177839; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_task_delegation
    ADD CONSTRAINT fktb_appl_ta177839 FOREIGN KEY (created_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3767 (class 2606 OID 28515)
-- Name: tb_appl_task fktb_appl_ta241630; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_task
    ADD CONSTRAINT fktb_appl_ta241630 FOREIGN KEY (id_appl_task_parent) REFERENCES public.tb_appl_task(id_appl_task);


--
-- TOC entry 3771 (class 2606 OID 28490)
-- Name: tb_appl_task_delegation fktb_appl_ta429304; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_task_delegation
    ADD CONSTRAINT fktb_appl_ta429304 FOREIGN KEY (approved_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3766 (class 2606 OID 28470)
-- Name: tb_appl_task fktb_appl_ta626576; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_task
    ADD CONSTRAINT fktb_appl_ta626576 FOREIGN KEY (id_appl) REFERENCES public.tb_appl(id_appl);


--
-- TOC entry 3773 (class 2606 OID 28500)
-- Name: tb_appl_task_delegation fktb_appl_ta647587; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_task_delegation
    ADD CONSTRAINT fktb_appl_ta647587 FOREIGN KEY (updated_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3769 (class 2606 OID 28480)
-- Name: tb_appl_task_delegation fktb_appl_ta662836; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_task_delegation
    ADD CONSTRAINT fktb_appl_ta662836 FOREIGN KEY (delegate_for) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3768 (class 2606 OID 28475)
-- Name: tb_appl_task_delegation fktb_appl_ta726266; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_task_delegation
    ADD CONSTRAINT fktb_appl_ta726266 FOREIGN KEY (id_appl_task) REFERENCES public.tb_appl_task(id_appl_task);


--
-- TOC entry 3770 (class 2606 OID 28485)
-- Name: tb_appl_task_delegation fktb_appl_ta907139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_appl_task_delegation
    ADD CONSTRAINT fktb_appl_ta907139 FOREIGN KEY (delegate_by) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3775 (class 2606 OID 28510)
-- Name: tb_role_appl_task fktb_role_ap391526; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_role_appl_task
    ADD CONSTRAINT fktb_role_ap391526 FOREIGN KEY (id_appl_task) REFERENCES public.tb_appl_task(id_appl_task);


--
-- TOC entry 3774 (class 2606 OID 28505)
-- Name: tb_role_appl_task fktb_role_ap616582; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_role_appl_task
    ADD CONSTRAINT fktb_role_ap616582 FOREIGN KEY (id_role) REFERENCES public.tb_role(id_role);


--
-- TOC entry 3776 (class 2606 OID 28460)
-- Name: tb_user_role fktb_user_ro344701; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user_role
    ADD CONSTRAINT fktb_user_ro344701 FOREIGN KEY (id_user) REFERENCES public.tb_user(id_user);


--
-- TOC entry 3777 (class 2606 OID 28465)
-- Name: tb_user_role fktb_user_ro623740; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user_role
    ADD CONSTRAINT fktb_user_ro623740 FOREIGN KEY (id_role) REFERENCES public.tb_role(id_role);


--
-- TOC entry 3778 (class 2606 OID 28596)
-- Name: tb_kabupaten fktb_kabupat893399; Type: FK CONSTRAINT; Schema: wil; Owner: postgres
--

ALTER TABLE ONLY wil.tb_kabupaten
    ADD CONSTRAINT fktb_kabupat893399 FOREIGN KEY (id_provinsi) REFERENCES wil.tb_provinsi(id_provinsi);


--
-- TOC entry 3779 (class 2606 OID 28586)
-- Name: tb_kecamatan fktb_kecamat126317; Type: FK CONSTRAINT; Schema: wil; Owner: postgres
--

ALTER TABLE ONLY wil.tb_kecamatan
    ADD CONSTRAINT fktb_kecamat126317 FOREIGN KEY (id_kabupaten) REFERENCES wil.tb_kabupaten(id_kabupaten);


-- Completed on 2021-04-07 10:27:55

--
-- PostgreSQL database dump complete
--


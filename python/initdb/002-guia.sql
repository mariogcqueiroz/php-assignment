--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

-- Started on 2020-04-12 18:08:01

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
-- TOC entry 277 (class 1255 OID 59031)
-- Name: AuxilioMesDelete(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public."AuxilioMesDelete"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN

DELETE FROM auxilio_mes

WHERE id_auxilio = NEW.id;

RETURN NEW;

END;$$;


--
-- TOC entry 278 (class 1255 OID 59032)
-- Name: AuxilioMesInsert(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public."AuxilioMesInsert"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN

INSERT INTO auxilio_mes(

            id_auxilio, id_mes, pagar)

VALUES (NEW.id, 1, NEW.valor),(NEW.id, 2, NEW.valor),(NEW.id, 3, NEW.valor),(NEW.id, 4, NEW.valor),(NEW.id, 5, NEW.valor),(NEW.id, 6, NEW.valor),(NEW.id, 7, NEW.valor),(NEW.id, 8, NEW.valor),(NEW.id, 9, NEW.valor),(NEW.id, 10, NEW.valor);

RETURN NEW;

END;

$$;


--
-- TOC entry 279 (class 1255 OID 59033)
-- Name: unaccent_string(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.unaccent_string(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$

SELECT translate(

    LOWER($1),

    'áâãäåāăąÁÂÃÄÅĀĂĄèééêëēĕėęěĒĔĖĘĚÉìíîïìĩīĭÌÍÎÏÌĨĪĬóôõöōŏőÒÓÔÕÖŌŎŐùúûüũūŭůÙÚÛÜŨŪŬŮ',

    'aaaaaaaaaaaaaaaaeeeeeeeeeeeeeeeeiiiiiiiiiiiiiiiiooooooooooooooouuuuuuuuuuuuuuuu'

);

$_$;


--
-- TOC entry 280 (class 1255 OID 59034)
-- Name: updatePesquisaAluno(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public."updatePesquisaAluno"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN

	UPDATE pesquisa_aluno

	SET status = 2

	WHERE (NEW.id = id_pesquisa) AND (OLD.status=1 AND (NEW.status=2 OR NEW.status=3));

RETURN NEW;

END;$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 59035)
-- Name: extensao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extensao (
    id integer NOT NULL,
    titulo text NOT NULL,
    coordenador bigint NOT NULL,
    cargahorario smallint NOT NULL,
    datainicio date NOT NULL,
    datafim date NOT NULL,
    periodicidade text NOT NULL,
    horario time without time zone NOT NULL,
    local text,
    plano text,
    id_edital integer,
    categoria integer DEFAULT 1,
    relatorio text,
    coordenador2 bigint,
    nprocesso bigint,
    status smallint DEFAULT 1,
    area integer,
    ocorrencias text
);


--
-- TOC entry 197 (class 1259 OID 59043)
-- Name: Extensao_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Extensao_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2780 (class 0 OID 0)
-- Dependencies: 197
-- Name: Extensao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Extensao_id_seq" OWNED BY public.extensao.id;


--
-- TOC entry 198 (class 1259 OID 59045)
-- Name: aluno; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.aluno (
    nome text NOT NULL,
    cpf bigint NOT NULL,
    matricula bigint NOT NULL,
    email text NOT NULL,
    telefone bigint,
    id_curso integer NOT NULL,
    rg text,
    datanasc date,
    periodo smallint DEFAULT 1,
    status smallint DEFAULT 1
);


--
-- TOC entry 199 (class 1259 OID 59053)
-- Name: aluno_horas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.aluno_horas (
    id integer NOT NULL,
    descricao text NOT NULL,
    id_aluno bigint NOT NULL,
    grupo integer NOT NULL,
    status integer NOT NULL,
    inscricao_gci integer,
    arquivo text,
    ch integer NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 59059)
-- Name: aluno_horas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.aluno_horas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2781 (class 0 OID 0)
-- Dependencies: 200
-- Name: aluno_horas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.aluno_horas_id_seq OWNED BY public.aluno_horas.id;


--
-- TOC entry 201 (class 1259 OID 59061)
-- Name: areacapes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.areacapes (
    id integer NOT NULL,
    nome text NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 59067)
-- Name: areacapes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.areacapes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2782 (class 0 OID 0)
-- Dependencies: 202
-- Name: areacapes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.areacapes_id_seq OWNED BY public.areacapes.id;


--
-- TOC entry 203 (class 1259 OID 59069)
-- Name: auth_assignment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_assignment (
    item_name character varying(64) NOT NULL,
    user_id integer NOT NULL,
    created_at integer
);


--
-- TOC entry 204 (class 1259 OID 59072)
-- Name: auth_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_item (
    name character varying(64) NOT NULL,
    type integer NOT NULL,
    description text,
    rule_name character varying(64),
    data text,
    created_at integer,
    updated_at integer,
    group_code character varying(64)
);


--
-- TOC entry 205 (class 1259 OID 59078)
-- Name: auth_item_child; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_item_child (
    parent character varying(64) NOT NULL,
    child character varying(64) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 59081)
-- Name: auth_item_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_item_group (
    code character varying(64) NOT NULL,
    name character varying(255) NOT NULL,
    created_at integer,
    updated_at integer
);


--
-- TOC entry 207 (class 1259 OID 59084)
-- Name: auth_rule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_rule (
    name character varying(64) NOT NULL,
    data text,
    created_at integer,
    updated_at integer
);


--
-- TOC entry 208 (class 1259 OID 59090)
-- Name: auxilio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auxilio (
    id integer NOT NULL,
    id_aluno bigint NOT NULL,
    edital integer NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    valor numeric(10,2),
    inicio date,
    fim date,
    justificativa text,
    relatoriofinal text,
    nbanco integer,
    agencia text,
    contacorrente text
);


--
-- TOC entry 209 (class 1259 OID 59097)
-- Name: auxilio_mes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auxilio_mes (
    id integer NOT NULL,
    id_auxilio integer NOT NULL,
    id_mes integer NOT NULL,
    pagar real DEFAULT 1 NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 59101)
-- Name: auxilio_mes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auxilio_mes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2783 (class 0 OID 0)
-- Dependencies: 210
-- Name: auxilio_mes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auxilio_mes_id_seq OWNED BY public.auxilio_mes.id;


--
-- TOC entry 211 (class 1259 OID 59103)
-- Name: auxilios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auxilios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2784 (class 0 OID 0)
-- Dependencies: 211
-- Name: auxilios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auxilios_id_seq OWNED BY public.auxilio.id;


--
-- TOC entry 212 (class 1259 OID 59105)
-- Name: ch_limite; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ch_limite (
    id integer NOT NULL,
    nome text NOT NULL,
    ch integer NOT NULL,
    id_curso integer
);


--
-- TOC entry 213 (class 1259 OID 59111)
-- Name: ch_limite_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ch_limite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2785 (class 0 OID 0)
-- Dependencies: 213
-- Name: ch_limite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ch_limite_id_seq OWNED BY public.ch_limite.id;


--
-- TOC entry 214 (class 1259 OID 59113)
-- Name: configuracao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.configuracao (
    id integer NOT NULL,
    definicao text NOT NULL,
    valor text NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 59119)
-- Name: configuracao_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.configuracao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2786 (class 0 OID 0)
-- Dependencies: 215
-- Name: configuracao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.configuracao_id_seq OWNED BY public.configuracao.id;


--
-- TOC entry 216 (class 1259 OID 59121)
-- Name: conselhoaluno; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conselhoaluno (
    id integer NOT NULL,
    reivindicacao text,
    id_aluno bigint NOT NULL,
    id_conselhoclasse integer NOT NULL,
    id_professor bigint NOT NULL,
    datainclusao timestamp without time zone DEFAULT now()
);


--
-- TOC entry 217 (class 1259 OID 59128)
-- Name: conselhoaluno_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conselhoaluno_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2787 (class 0 OID 0)
-- Dependencies: 217
-- Name: conselhoaluno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conselhoaluno_id_seq OWNED BY public.conselhoaluno.id;


--
-- TOC entry 218 (class 1259 OID 59130)
-- Name: conselhoclasse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conselhoclasse (
    id integer NOT NULL,
    assunto text NOT NULL,
    dataconselho date,
    hora time without time zone
);


--
-- TOC entry 219 (class 1259 OID 59136)
-- Name: conselhoclasse_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conselhoclasse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2788 (class 0 OID 0)
-- Dependencies: 219
-- Name: conselhoclasse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conselhoclasse_id_seq OWNED BY public.conselhoclasse.id;


--
-- TOC entry 220 (class 1259 OID 59138)
-- Name: conselhodisciplinas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conselhodisciplinas (
    id integer NOT NULL,
    reivindicacao text,
    id_disciplina bigint NOT NULL,
    id_conselhoclasse integer NOT NULL,
    id_professor bigint NOT NULL,
    datainclusao timestamp without time zone DEFAULT now()
);


--
-- TOC entry 221 (class 1259 OID 59145)
-- Name: conselhodisciplinas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conselhodisciplinas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2789 (class 0 OID 0)
-- Dependencies: 221
-- Name: conselhodisciplinas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conselhodisciplinas_id_seq OWNED BY public.conselhodisciplinas.id;


--
-- TOC entry 222 (class 1259 OID 59147)
-- Name: conselhoturma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conselhoturma (
    id integer NOT NULL,
    reivindicacao text,
    id_turma integer NOT NULL,
    id_conselhoclasse integer NOT NULL,
    id_professor bigint NOT NULL,
    datainclusao timestamp with time zone DEFAULT now()
);


--
-- TOC entry 223 (class 1259 OID 59154)
-- Name: conselhoturma_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conselhoturma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2790 (class 0 OID 0)
-- Dependencies: 223
-- Name: conselhoturma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conselhoturma_id_seq OWNED BY public.conselhoturma.id;


--
-- TOC entry 224 (class 1259 OID 59156)
-- Name: convenio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.convenio (
    id integer NOT NULL,
    nome text,
    data_fim date,
    data_inicio date
);


--
-- TOC entry 225 (class 1259 OID 59162)
-- Name: curso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.curso (
    nome text NOT NULL,
    id integer NOT NULL,
    carga_horaria integer,
    coordenador bigint
);


--
-- TOC entry 226 (class 1259 OID 59168)
-- Name: curso_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.curso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2791 (class 0 OID 0)
-- Dependencies: 226
-- Name: curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.curso_id_seq OWNED BY public.curso.id;


--
-- TOC entry 227 (class 1259 OID 59170)
-- Name: disciplinas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.disciplinas (
    id integer NOT NULL,
    id_servidor integer,
    ch smallint,
    nomedisciplina text,
    turma text,
    id_turma integer
);


--
-- TOC entry 2792 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN disciplinas.ch; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.disciplinas.ch IS '
';


--
-- TOC entry 228 (class 1259 OID 59176)
-- Name: disciplinas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.disciplinas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2793 (class 0 OID 0)
-- Dependencies: 228
-- Name: disciplinas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.disciplinas_id_seq OWNED BY public.disciplinas.id;


--
-- TOC entry 229 (class 1259 OID 59178)
-- Name: edital; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.edital (
    id integer NOT NULL,
    identificacao text NOT NULL,
    ano smallint NOT NULL,
    tipo integer NOT NULL,
    datainicio date,
    datafinal date,
    arquivo text
);


--
-- TOC entry 230 (class 1259 OID 59184)
-- Name: edital_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.edital_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2794 (class 0 OID 0)
-- Dependencies: 230
-- Name: edital_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.edital_id_seq OWNED BY public.edital.id;


--
-- TOC entry 231 (class 1259 OID 59186)
-- Name: estagio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estagio (
    id integer NOT NULL,
    id_servidor bigint,
    datainicio date,
    datafim date,
    id_aluno bigint NOT NULL,
    local text,
    status_relatorio bigint DEFAULT 0,
    cond_estagio bigint DEFAULT 0,
    valor numeric(10,2)
);


--
-- TOC entry 232 (class 1259 OID 59194)
-- Name: estagio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.estagio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2795 (class 0 OID 0)
-- Dependencies: 232
-- Name: estagio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.estagio_id_seq OWNED BY public.estagio.id;


--
-- TOC entry 233 (class 1259 OID 59196)
-- Name: estagio_supervisor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estagio_supervisor (
    id integer NOT NULL,
    curso integer NOT NULL,
    siape_supervisor bigint,
    data_inicial date,
    data_final date
);


--
-- TOC entry 234 (class 1259 OID 59199)
-- Name: estagio_supervisor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.estagio_supervisor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2796 (class 0 OID 0)
-- Dependencies: 234
-- Name: estagio_supervisor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.estagio_supervisor_id_seq OWNED BY public.estagio_supervisor.id;


--
-- TOC entry 235 (class 1259 OID 59201)
-- Name: extensao_alunos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extensao_alunos (
    id integer NOT NULL,
    id_extensao integer NOT NULL,
    situacao smallint DEFAULT 1 NOT NULL,
    id_aluno bigint NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 59205)
-- Name: extensao_alunos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.extensao_alunos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2797 (class 0 OID 0)
-- Dependencies: 236
-- Name: extensao_alunos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.extensao_alunos_id_seq OWNED BY public.extensao_alunos.id;


--
-- TOC entry 237 (class 1259 OID 59207)
-- Name: extensao_ministrante; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extensao_ministrante (
    id integer NOT NULL,
    id_extensao integer NOT NULL,
    id_professor bigint NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 59210)
-- Name: extensao_ministrante_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.extensao_ministrante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2798 (class 0 OID 0)
-- Dependencies: 238
-- Name: extensao_ministrante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.extensao_ministrante_id_seq OWNED BY public.extensao_ministrante.id;


--
-- TOC entry 239 (class 1259 OID 59212)
-- Name: gestao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gestao (
    id integer NOT NULL,
    id_servidor integer NOT NULL,
    cargo text NOT NULL,
    datainicio date NOT NULL,
    datafim date
);


--
-- TOC entry 240 (class 1259 OID 59218)
-- Name: migration; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


--
-- TOC entry 241 (class 1259 OID 59221)
-- Name: moodle_enroll; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moodle_enroll (
    id integer NOT NULL,
    course text NOT NULL,
    matricula text NOT NULL,
    role text
);


--
-- TOC entry 242 (class 1259 OID 59227)
-- Name: moddle_enroll_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.moddle_enroll_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2799 (class 0 OID 0)
-- Dependencies: 242
-- Name: moddle_enroll_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.moddle_enroll_id_seq OWNED BY public.moodle_enroll.id;


--
-- TOC entry 243 (class 1259 OID 59229)
-- Name: nucleo_aluno; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nucleo_aluno (
    id integer NOT NULL,
    id_nucleodepesquisa integer NOT NULL,
    id_aluno bigint NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 59232)
-- Name: nucleo_aluno_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nucleo_aluno_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2800 (class 0 OID 0)
-- Dependencies: 244
-- Name: nucleo_aluno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nucleo_aluno_id_seq OWNED BY public.nucleo_aluno.id;


--
-- TOC entry 245 (class 1259 OID 59234)
-- Name: nucleo_professores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nucleo_professores (
    id_nucleodepesquisa integer NOT NULL,
    id_professores bigint NOT NULL,
    id integer NOT NULL,
    status smallint DEFAULT 1,
    inclusao timestamp without time zone DEFAULT now(),
    exclusao date
);


--
-- TOC entry 246 (class 1259 OID 59239)
-- Name: nucleo_professores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nucleo_professores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2801 (class 0 OID 0)
-- Dependencies: 246
-- Name: nucleo_professores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nucleo_professores_id_seq OWNED BY public.nucleo_professores.id;


--
-- TOC entry 247 (class 1259 OID 59241)
-- Name: nucleorelatorio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nucleorelatorio (
    id integer NOT NULL,
    idnucleo integer NOT NULL,
    dataprevista date NOT NULL,
    dataentrega date,
    relatorio text
);


--
-- TOC entry 248 (class 1259 OID 59247)
-- Name: nucleo_relatorio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nucleo_relatorio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2802 (class 0 OID 0)
-- Dependencies: 248
-- Name: nucleo_relatorio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nucleo_relatorio_id_seq OWNED BY public.nucleorelatorio.id;


--
-- TOC entry 249 (class 1259 OID 59249)
-- Name: nucleodepesquisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nucleodepesquisa (
    nomedonucleo text NOT NULL,
    datadeinicio date NOT NULL,
    id integer NOT NULL,
    coordenador bigint,
    id_areacapes integer NOT NULL,
    id_subarea integer NOT NULL,
    vicelider bigint,
    projeto text
);


--
-- TOC entry 250 (class 1259 OID 59255)
-- Name: nucleodepesquisa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nucleodepesquisa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2803 (class 0 OID 0)
-- Dependencies: 250
-- Name: nucleodepesquisa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nucleodepesquisa_id_seq OWNED BY public.nucleodepesquisa.id;


--
-- TOC entry 251 (class 1259 OID 59257)
-- Name: pesquisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pesquisa (
    id integer NOT NULL,
    titulo text NOT NULL,
    id_edital integer,
    orientador bigint NOT NULL,
    datainicio date NOT NULL,
    datafinal date NOT NULL,
    patente boolean NOT NULL,
    status smallint NOT NULL,
    area integer NOT NULL,
    edital integer,
    arquivo text,
    ocorrencias text,
    coorientador bigint,
    nprocesso bigint
);


--
-- TOC entry 252 (class 1259 OID 59263)
-- Name: pesquisa_aluno; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pesquisa_aluno (
    id integer NOT NULL,
    id_pesquisa integer NOT NULL,
    id_aluno bigint NOT NULL,
    status smallint NOT NULL,
    valorbolsa money,
    categoria smallint NOT NULL
);


--
-- TOC entry 253 (class 1259 OID 59266)
-- Name: pesquisa_aluno_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pesquisa_aluno_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2804 (class 0 OID 0)
-- Dependencies: 253
-- Name: pesquisa_aluno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pesquisa_aluno_id_seq OWNED BY public.pesquisa_aluno.id;


--
-- TOC entry 254 (class 1259 OID 59268)
-- Name: pesquisa_coorientador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pesquisa_coorientador (
    id integer NOT NULL,
    id_pesquisa integer NOT NULL,
    id_coorientador bigint NOT NULL
);


--
-- TOC entry 255 (class 1259 OID 59271)
-- Name: pesquisa_coorientador_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pesquisa_coorientador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2805 (class 0 OID 0)
-- Dependencies: 255
-- Name: pesquisa_coorientador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pesquisa_coorientador_id_seq OWNED BY public.pesquisa_coorientador.id;


--
-- TOC entry 256 (class 1259 OID 59273)
-- Name: pesquisa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pesquisa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2806 (class 0 OID 0)
-- Dependencies: 256
-- Name: pesquisa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pesquisa_id_seq OWNED BY public.pesquisa.id;


--
-- TOC entry 257 (class 1259 OID 59275)
-- Name: pesquisa_relatorio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pesquisa_relatorio (
    id integer NOT NULL,
    id_pesquisa integer NOT NULL,
    tipo smallint NOT NULL,
    dataprevista date NOT NULL,
    dataentrega date,
    relatorio text
);


--
-- TOC entry 258 (class 1259 OID 59281)
-- Name: pesquisa_relatorio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pesquisa_relatorio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2807 (class 0 OID 0)
-- Dependencies: 258
-- Name: pesquisa_relatorio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pesquisa_relatorio_id_seq OWNED BY public.pesquisa_relatorio.id;


--
-- TOC entry 259 (class 1259 OID 59283)
-- Name: plano_de_trab; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plano_de_trab (
    id integer NOT NULL,
    siape_fk integer NOT NULL,
    inicio_data date NOT NULL,
    final_data date NOT NULL,
    tipo_fk integer NOT NULL,
    status integer NOT NULL,
    arquivo text,
    observacao text,
    respostadaa text
);


--
-- TOC entry 260 (class 1259 OID 59289)
-- Name: plano_de_trab_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plano_de_trab_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2808 (class 0 OID 0)
-- Dependencies: 260
-- Name: plano_de_trab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plano_de_trab_id_seq OWNED BY public.plano_de_trab.id;


--
-- TOC entry 261 (class 1259 OID 59291)
-- Name: professor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.professor (
    nome text NOT NULL,
    cpf bigint NOT NULL,
    telefone bigint NOT NULL,
    email text NOT NULL,
    rg text NOT NULL,
    area text,
    tipo smallint,
    siape bigint,
    regime integer
);


--
-- TOC entry 262 (class 1259 OID 59297)
-- Name: profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    category_id integer NOT NULL,
    name text NOT NULL,
    cpf bigint NOT NULL
);


--
-- TOC entry 263 (class 1259 OID 59303)
-- Name: profile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2809 (class 0 OID 0)
-- Dependencies: 263
-- Name: profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profile_id_seq OWNED BY public.profile.id;


--
-- TOC entry 264 (class 1259 OID 59305)
-- Name: subareacapes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subareacapes (
    numero integer NOT NULL,
    id_area integer NOT NULL,
    nome text NOT NULL
);


--
-- TOC entry 265 (class 1259 OID 59311)
-- Name: tcc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tcc (
    id integer NOT NULL,
    id_servidor integer NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    id_aluno bigint NOT NULL,
    id_aluno2 bigint
);


--
-- TOC entry 266 (class 1259 OID 59314)
-- Name: tcc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tcc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2810 (class 0 OID 0)
-- Dependencies: 266
-- Name: tcc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tcc_id_seq OWNED BY public.tcc.id;


--
-- TOC entry 267 (class 1259 OID 59316)
-- Name: tipo_atividade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_atividade (
    id integer NOT NULL,
    nome text NOT NULL,
    maximo integer NOT NULL,
    pontos integer NOT NULL
);


--
-- TOC entry 268 (class 1259 OID 59322)
-- Name: tipo_atividade_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tipo_atividade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2811 (class 0 OID 0)
-- Dependencies: 268
-- Name: tipo_atividade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipo_atividade_id_seq OWNED BY public.tipo_atividade.id;


--
-- TOC entry 269 (class 1259 OID 59324)
-- Name: tipoedital; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipoedital (
    id integer NOT NULL,
    nome text NOT NULL
);


--
-- TOC entry 270 (class 1259 OID 59330)
-- Name: tipoedital_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tipoedital_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2812 (class 0 OID 0)
-- Dependencies: 270
-- Name: tipoedital_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipoedital_id_seq OWNED BY public.tipoedital.id;


--
-- TOC entry 271 (class 1259 OID 59332)
-- Name: turma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.turma (
    id integer NOT NULL,
    nome text NOT NULL,
    ano text NOT NULL,
    id_curso integer NOT NULL,
    codigo_turma text
);


--
-- TOC entry 272 (class 1259 OID 59338)
-- Name: turma_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.turma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2813 (class 0 OID 0)
-- Dependencies: 272
-- Name: turma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.turma_id_seq OWNED BY public.turma.id;


--
-- TOC entry 273 (class 1259 OID 59340)
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(255) NOT NULL,
    confirmation_token character varying(255),
    status integer DEFAULT 1 NOT NULL,
    superadmin smallint DEFAULT 0,
    created_at integer NOT NULL,
    updated_at integer NOT NULL,
    registration_ip character varying(64),
    bind_to_ip character varying(255),
    email character varying(128),
    email_confirmed smallint DEFAULT 0 NOT NULL
);


--
-- TOC entry 274 (class 1259 OID 59349)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2814 (class 0 OID 0)
-- Dependencies: 274
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 275 (class 1259 OID 59351)
-- Name: user_visit_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_visit_log (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    ip character varying(64) NOT NULL,
    language character(2) NOT NULL,
    user_agent character varying(255) NOT NULL,
    user_id integer,
    visit_time integer NOT NULL,
    browser character varying(30),
    os character varying(20)
);


--
-- TOC entry 276 (class 1259 OID 59357)
-- Name: user_visit_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_visit_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2815 (class 0 OID 0)
-- Dependencies: 276
-- Name: user_visit_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_visit_log_id_seq OWNED BY public.user_visit_log.id;


--
-- TOC entry 2329 (class 2604 OID 59359)
-- Name: aluno_horas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aluno_horas ALTER COLUMN id SET DEFAULT nextval('public.aluno_horas_id_seq'::regclass);


--
-- TOC entry 2330 (class 2604 OID 59360)
-- Name: areacapes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.areacapes ALTER COLUMN id SET DEFAULT nextval('public.areacapes_id_seq'::regclass);


--
-- TOC entry 2332 (class 2604 OID 59361)
-- Name: auxilio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auxilio ALTER COLUMN id SET DEFAULT nextval('public.auxilios_id_seq'::regclass);


--
-- TOC entry 2334 (class 2604 OID 59362)
-- Name: auxilio_mes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auxilio_mes ALTER COLUMN id SET DEFAULT nextval('public.auxilio_mes_id_seq'::regclass);


--
-- TOC entry 2335 (class 2604 OID 59363)
-- Name: ch_limite id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ch_limite ALTER COLUMN id SET DEFAULT nextval('public.ch_limite_id_seq'::regclass);


--
-- TOC entry 2336 (class 2604 OID 59364)
-- Name: configuracao id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.configuracao ALTER COLUMN id SET DEFAULT nextval('public.configuracao_id_seq'::regclass);


--
-- TOC entry 2338 (class 2604 OID 59365)
-- Name: conselhoaluno id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhoaluno ALTER COLUMN id SET DEFAULT nextval('public.conselhoaluno_id_seq'::regclass);


--
-- TOC entry 2339 (class 2604 OID 59366)
-- Name: conselhoclasse id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhoclasse ALTER COLUMN id SET DEFAULT nextval('public.conselhoclasse_id_seq'::regclass);


--
-- TOC entry 2341 (class 2604 OID 59367)
-- Name: conselhodisciplinas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhodisciplinas ALTER COLUMN id SET DEFAULT nextval('public.conselhodisciplinas_id_seq'::regclass);


--
-- TOC entry 2343 (class 2604 OID 59368)
-- Name: conselhoturma id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhoturma ALTER COLUMN id SET DEFAULT nextval('public.conselhoturma_id_seq'::regclass);


--
-- TOC entry 2344 (class 2604 OID 59369)
-- Name: curso id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso ALTER COLUMN id SET DEFAULT nextval('public.curso_id_seq'::regclass);


--
-- TOC entry 2345 (class 2604 OID 59370)
-- Name: disciplinas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.disciplinas ALTER COLUMN id SET DEFAULT nextval('public.disciplinas_id_seq'::regclass);


--
-- TOC entry 2346 (class 2604 OID 59371)
-- Name: edital id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.edital ALTER COLUMN id SET DEFAULT nextval('public.edital_id_seq'::regclass);


--
-- TOC entry 2349 (class 2604 OID 59372)
-- Name: estagio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estagio ALTER COLUMN id SET DEFAULT nextval('public.estagio_id_seq'::regclass);


--
-- TOC entry 2350 (class 2604 OID 59373)
-- Name: estagio_supervisor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estagio_supervisor ALTER COLUMN id SET DEFAULT nextval('public.estagio_supervisor_id_seq'::regclass);


--
-- TOC entry 2326 (class 2604 OID 59374)
-- Name: extensao id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao ALTER COLUMN id SET DEFAULT nextval('public."Extensao_id_seq"'::regclass);


--
-- TOC entry 2352 (class 2604 OID 59375)
-- Name: extensao_alunos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao_alunos ALTER COLUMN id SET DEFAULT nextval('public.extensao_alunos_id_seq'::regclass);


--
-- TOC entry 2353 (class 2604 OID 59376)
-- Name: extensao_ministrante id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao_ministrante ALTER COLUMN id SET DEFAULT nextval('public.extensao_ministrante_id_seq'::regclass);


--
-- TOC entry 2354 (class 2604 OID 59377)
-- Name: moodle_enroll id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moodle_enroll ALTER COLUMN id SET DEFAULT nextval('public.moddle_enroll_id_seq'::regclass);


--
-- TOC entry 2355 (class 2604 OID 59378)
-- Name: nucleo_aluno id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleo_aluno ALTER COLUMN id SET DEFAULT nextval('public.nucleo_aluno_id_seq'::regclass);


--
-- TOC entry 2358 (class 2604 OID 59379)
-- Name: nucleo_professores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleo_professores ALTER COLUMN id SET DEFAULT nextval('public.nucleo_professores_id_seq'::regclass);


--
-- TOC entry 2360 (class 2604 OID 59380)
-- Name: nucleodepesquisa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleodepesquisa ALTER COLUMN id SET DEFAULT nextval('public.nucleodepesquisa_id_seq'::regclass);


--
-- TOC entry 2359 (class 2604 OID 59381)
-- Name: nucleorelatorio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleorelatorio ALTER COLUMN id SET DEFAULT nextval('public.nucleo_relatorio_id_seq'::regclass);


--
-- TOC entry 2361 (class 2604 OID 59382)
-- Name: pesquisa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa ALTER COLUMN id SET DEFAULT nextval('public.pesquisa_id_seq'::regclass);


--
-- TOC entry 2362 (class 2604 OID 59383)
-- Name: pesquisa_aluno id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_aluno ALTER COLUMN id SET DEFAULT nextval('public.pesquisa_aluno_id_seq'::regclass);


--
-- TOC entry 2363 (class 2604 OID 59384)
-- Name: pesquisa_coorientador id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_coorientador ALTER COLUMN id SET DEFAULT nextval('public.pesquisa_coorientador_id_seq'::regclass);


--
-- TOC entry 2364 (class 2604 OID 59385)
-- Name: pesquisa_relatorio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_relatorio ALTER COLUMN id SET DEFAULT nextval('public.pesquisa_relatorio_id_seq'::regclass);


--
-- TOC entry 2365 (class 2604 OID 59386)
-- Name: plano_de_trab id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_de_trab ALTER COLUMN id SET DEFAULT nextval('public.plano_de_trab_id_seq'::regclass);


--
-- TOC entry 2366 (class 2604 OID 59387)
-- Name: profile id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profile ALTER COLUMN id SET DEFAULT nextval('public.profile_id_seq'::regclass);


--
-- TOC entry 2367 (class 2604 OID 59388)
-- Name: tcc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tcc ALTER COLUMN id SET DEFAULT nextval('public.tcc_id_seq'::regclass);


--
-- TOC entry 2368 (class 2604 OID 59389)
-- Name: tipo_atividade id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_atividade ALTER COLUMN id SET DEFAULT nextval('public.tipo_atividade_id_seq'::regclass);


--
-- TOC entry 2369 (class 2604 OID 59390)
-- Name: tipoedital id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipoedital ALTER COLUMN id SET DEFAULT nextval('public.tipoedital_id_seq'::regclass);


--
-- TOC entry 2370 (class 2604 OID 59391)
-- Name: turma id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.turma ALTER COLUMN id SET DEFAULT nextval('public.turma_id_seq'::regclass);


--
-- TOC entry 2374 (class 2604 OID 59392)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 2375 (class 2604 OID 59393)
-- Name: user_visit_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_visit_log ALTER COLUMN id SET DEFAULT nextval('public.user_visit_log_id_seq'::regclass);


--
-- TOC entry 2696 (class 0 OID 59045)
-- Dependencies: 198
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.aluno (nome, cpf, matricula, email, telefone, id_curso, rg, datanasc, periodo, status) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 59053)
-- Dependencies: 199
-- Data for Name: aluno_horas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.aluno_horas (id, descricao, id_aluno, grupo, status, inscricao_gci, arquivo, ch) FROM stdin;
\.


--
-- TOC entry 2699 (class 0 OID 59061)
-- Dependencies: 201
-- Data for Name: areacapes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.areacapes (id, nome) FROM stdin;
10100008	MATEMÁTICA
10200002	PROBABILIDADE E ESTATÍSTICA
10300007	CIÊNCIA DA COMPUTAÇÃO
10400001	ASTRONOMIA
10500006	FÍSICA
10600000	QUÍMICA
10700005	GEOCIÊNCIAS
20100000	BIOLOGIA GERAL
20200005	GENÉTICA
20600003	MORFOLOGIA
20700008	FISIOLOGIA
20800002	BIOQUÍMICA
20900007	BIOFÍSICA
21000000	FARMACOLOGIA
21100004	IMUNOLOGIA
21200009	MICROBIOLOGIA
21300003	PARASITOLOGIA
20500009	ECOLOGIA
10800000	OCEANOGRAFIA
20300000	BOTÂNICA
20400004	ZOOLOGIA
30100003	ENGENHARIA CIVIL
30700000	ENGENHARIA SANITÁRIA
31000002	ENGENHARIA DE TRANSPORTES
30200008	ENGENHARIA DE MINAS
30300002	ENGENHARIA DE MATERIAIS E METALÚRGICA
30600006	ENGENHARIA QUÍMICA
30900000	ENGENHARIA NUCLEAR
30500001	ENGENHARIA MECÂNICA
30800005	ENGENHARIA DE PRODUÇÃO
31100007	ENGENHARIA NAVAL E OCEÂNICA
31200001	ENGENHARIA AEROESPACIAL
30400007	ENGENHARIA ELÉTRICA
31300006	ENGENHARIA BIOMÉDICA
40100006	MEDICINA
40500004	NUTRIÇÃO
40200000	ODONTOLOGIA
40300005	FARMÁCIA
40400000	ENFERMAGEM
40600009	SAÚDE COLETIVA
40900002	EDUCAÇÃO FÍSICA
40700003	FONOAUDIOLOGIA
40800008	FISIOTERAPIA E TERAPIA OCUPACIONAL
50100009	AGRONOMIA
50200003	RECURSOS FLORESTAIS E ENGENHARIA FLORESTAL
50300008	ENGENHARIA AGRÍCOLA
50400002	ZOOTECNIA
50600001	RECURSOS PESQUEIROS E ENGENHARIA DE PESCA
50500007	MEDICINA VETERINÁRIA
50700006	CIÊNCIA E TECNOLOGIA DE ALIMENTOS
60100001	DIREITO
60200006	ADMINISTRAÇÃO
61300004	TURISMO
60300000	ECONOMIA
60400005	ARQUITETURA E URBANISMO
61200000	DESENHO INDUSTRIAL
60500000	PLANEJAMENTO URBANO E REGIONAL
60600004	DEMOGRAFIA
60700009	CIÊNCIA DA INFORMAÇÃO
60800003	MUSEOLOGIA
60900008	COMUNICAÇÃO
61000000	SERVIÇO SOCIAL
70100004	FILOSOFIA
71000003	TEOLOGIA
70200009	SOCIOLOGIA
70300003	ANTROPOLOGIA
70400008	ARQUEOLOGIA
70500002	HISTÓRIA
70600007	GEOGRAFIA
70700001	PSICOLOGIA
70800006	EDUCAÇÃO
70900000	CIÊNCIA POLÍTICA
80100007	LINGUÍSTICA
80200001	LETRAS
80300006	ARTES
90100000	INTERDISCIPLINAR
90200000	ENSINO
90300009	MATERIAIS
90400003	BIOTECNOLOGIA
90500008	CIÊNCIAS AMBIENTAIS
\.


--
-- TOC entry 2701 (class 0 OID 59069)
-- Dependencies: 203
-- Data for Name: auth_assignment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_assignment (item_name, user_id, created_at) FROM stdin;
\.


--
-- TOC entry 2702 (class 0 OID 59072)
-- Dependencies: 204
-- Data for Name: auth_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_item (name, type, description, rule_name, data, created_at, updated_at, group_code) FROM stdin;
commonPermission	2	Common permission	\N	\N	1432650860	1432650860	\N
/*	3	\N	\N	\N	1432650861	1432650861	\N
/user-management/*	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-visit-log/*	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-visit-log/grid-page-size	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-visit-log/grid-sort	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-visit-log/bulk-delete	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-visit-log/bulk-deactivate	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-visit-log/bulk-activate	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-visit-log/toggle-attribute	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-visit-log/delete	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-visit-log/update	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-visit-log/create	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-visit-log/view	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-visit-log/index	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-permission/*	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-permission/set-roles	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user-permission/set	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user/*	3	\N	\N	\N	1432650863	1432650863	\N
/user-management/user/grid-page-size	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/user/grid-sort	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/user/bulk-delete	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/user/bulk-deactivate	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/user/bulk-activate	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/user/toggle-attribute	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/user/delete	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/user/update	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/user/view	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/user/index	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/user/change-password	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/user/create	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/*	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/grid-page-size	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/grid-sort	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/bulk-delete	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/bulk-deactivate	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/bulk-activate	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/toggle-attribute	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/delete	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/index	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/update	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/create	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/set-child-permissions	3	\N	\N	\N	1432650864	1432650864	\N
/user-management/role/set-child-roles	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/role/view	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/*	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/grid-page-size	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/grid-sort	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/bulk-delete	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/bulk-deactivate	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/bulk-activate	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/toggle-attribute	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/delete	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/index	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/update	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/create	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/refresh-routes	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/set-child-routes	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/set-child-permissions	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/permission/view	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/auth-item-group/*	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/auth-item-group/grid-page-size	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/auth-item-group/grid-sort	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/auth-item-group/bulk-delete	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/auth-item-group/bulk-deactivate	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/auth-item-group/bulk-activate	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/auth-item-group/toggle-attribute	3	\N	\N	\N	1432650865	1432650865	\N
/user-management/auth-item-group/delete	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth-item-group/update	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth-item-group/create	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth-item-group/view	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth-item-group/index	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth/*	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth/confirm-email-receive	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth/confirm-email	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth/password-recovery-receive	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth/password-recovery	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth/confirm-registration-email	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth/registration	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth/change-own-password	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth/logout	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth/login	3	\N	\N	\N	1432650866	1432650866	\N
/user-management/auth/captcha	3	\N	\N	\N	1432650866	1432650866	\N
listarAuxilioMes	2	Listar AuxilioMes	\N	\N	1467558117	1467558117	\N
editAuxilioMes	2	Edit AuxilioMes	\N	\N	1467558278	1467558278	\N
Cae	1	Cae	\N	\N	\N	\N	\N
downloadEdital	2	Download de arquivos de Edital	\N	\N	\N	\N	\N
downloadExtensao	2	Download de arquivos de Extensão	\N	\N	\N	\N	\N
listarestagio	2	listar estagio	\N	\N	\N	\N	\N
viewUsers	2	View users	\N	\N	1432650867	1432650867	userManagement
moodleadm	1	Moodle admin	\N	\N	1566434117	1566434117	\N
editUsers	2	Edit users	\N	\N	1432650867	1432650867	userManagement
deleteUsers	2	Delete users	\N	\N	1432650867	1432650867	userManagement
changeUserPassword	2	Change user password	\N	\N	1432650867	1432650867	userManagement
assignRolesToUsers	2	Assign roles to users	\N	\N	1432650867	1432650867	userManagement
viewVisitLog	2	View visit log	\N	\N	1432650867	1432650867	userManagement
viewUserRoles	2	View user roles	\N	\N	1432650867	1432650867	userManagement
viewRegistrationIp	2	View registration IP	\N	\N	1432650868	1432650868	userManagement
viewUserEmail	2	View user email	\N	\N	1432650868	1432650868	userManagement
editUserEmail	2	Edit user email	\N	\N	1432650868	1432650868	userManagement
bindUserToIp	2	Bind user to IP	\N	\N	1432650868	1432650868	userManagement
changeOwnPassword	2	Change own password	\N	\N	1432650868	1432650868	userCommonPermissions
/site/*	3	\N	\N	\N	1432817085	1432817085	\N
/site/about	3	\N	\N	\N	1432817085	1432817085	\N
/site/contact	3	\N	\N	\N	1432817085	1432817085	\N
/site/logout	3	\N	\N	\N	1432817085	1432817085	\N
/site/login	3	\N	\N	\N	1432817085	1432817085	\N
/site/index	3	\N	\N	\N	1432817085	1432817085	\N
/site/captcha	3	\N	\N	\N	1432817085	1432817085	\N
/site/error	3	\N	\N	\N	1432817085	1432817085	\N
/professor/aviso	3	\N	\N	\N	1467558165	1467558165	\N
editestagio	2	edit estagio	\N	\N	\N	\N	\N
/auxilio-mes/*	3	\N	\N	\N	1467558165	1467558165	\N
/auxilio-mes/batchupdate	3	\N	\N	\N	1467558165	1467558165	\N
/auxilio-mes/index	3	\N	\N	\N	1467558165	1467558165	\N
funcionario	1	Funcionário	\N	\N	1432817627	1432817627	\N
gerente	1	Gerente	\N	\N	1432650866	1432820501	\N
confirmarEmail	2	Confirmar Email	\N	\N	1432835149	1432835149	\N
/tipoedital/*	3	\N	\N	\N	1433250534	1433250534	\N
/tipoedital/delete	3	\N	\N	\N	1433250534	1433250534	\N
/tipoedital/update	3	\N	\N	\N	1433250535	1433250535	\N
/tipoedital/create	3	\N	\N	\N	1433250535	1433250535	\N
/tipoedital/view	3	\N	\N	\N	1433250535	1433250535	\N
/tipoedital/index	3	\N	\N	\N	1433250535	1433250535	\N
/professor/*	3	\N	\N	\N	1433250535	1433250535	\N
/professor/delete	3	\N	\N	\N	1433250535	1433250535	\N
/professor/update	3	\N	\N	\N	1433250535	1433250535	\N
/professor/create	3	\N	\N	\N	1433250535	1433250535	\N
/professor/view	3	\N	\N	\N	1433250535	1433250535	\N
/professor/index	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa-relatorio/*	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa-relatorio/delete	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa-relatorio/update	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa-relatorio/create	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa-relatorio/view	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa-relatorio/index	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa-coorientador/*	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa-coorientador/delete	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa-coorientador/update	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa-coorientador/create	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa-coorientador/view	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa-coorientador/index	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa/*	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa/delete	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa/update	3	\N	\N	\N	1433250535	1433250535	\N
/pesquisa/create	3	\N	\N	\N	1433250536	1433250536	\N
/pesquisa/view	3	\N	\N	\N	1433250536	1433250536	\N
/pesquisa/index	3	\N	\N	\N	1433250536	1433250536	\N
/pesquisa-aluno/*	3	\N	\N	\N	1433250536	1433250536	\N
/pesquisa-aluno/delete	3	\N	\N	\N	1433250536	1433250536	\N
/pesquisa-aluno/update	3	\N	\N	\N	1433250536	1433250536	\N
/pesquisa-aluno/create	3	\N	\N	\N	1433250536	1433250536	\N
/pesquisa-aluno/view	3	\N	\N	\N	1433250536	1433250536	\N
/pesquisa-aluno/index	3	\N	\N	\N	1433250536	1433250536	\N
/nucleo-professores/*	3	\N	\N	\N	1433250536	1433250536	\N
/nucleo-professores/delete	3	\N	\N	\N	1433250536	1433250536	\N
/nucleo-professores/update	3	\N	\N	\N	1433250536	1433250536	\N
/nucleo-professores/create	3	\N	\N	\N	1433250536	1433250536	\N
/nucleo-professores/view	3	\N	\N	\N	1433250536	1433250536	\N
/nucleo-professores/index	3	\N	\N	\N	1433250536	1433250536	\N
/edital/*	3	\N	\N	\N	1433250536	1433250536	\N
/edital/delete	3	\N	\N	\N	1433250536	1433250536	\N
/edital/update	3	\N	\N	\N	1433250536	1433250536	\N
/edital/create	3	\N	\N	\N	1433250536	1433250536	\N
/edital/view	3	\N	\N	\N	1433250536	1433250536	\N
/edital/index	3	\N	\N	\N	1433250536	1433250536	\N
/curso/*	3	\N	\N	\N	1433250536	1433250536	\N
/curso/delete	3	\N	\N	\N	1433250536	1433250536	\N
/curso/update	3	\N	\N	\N	1433250536	1433250536	\N
/curso/create	3	\N	\N	\N	1433250536	1433250536	\N
/curso/view	3	\N	\N	\N	1433250536	1433250536	\N
/curso/index	3	\N	\N	\N	1433250537	1433250537	\N
/aluno/*	3	\N	\N	\N	1433250537	1433250537	\N
/aluno/delete	3	\N	\N	\N	1433250537	1433250537	\N
/aluno/update	3	\N	\N	\N	1433250537	1433250537	\N
/aluno/create	3	\N	\N	\N	1433250537	1433250537	\N
/aluno/view	3	\N	\N	\N	1433250537	1433250537	\N
/aluno/index	3	\N	\N	\N	1433250537	1433250537	\N
viewEdital	2	View Edital	\N	\N	1433250497	1433250497	\N
moodleall	2	Moodle all	\N	\N	1566434162	1566434162	\N
viewPesquisa	2	View Pesquisa	\N	\N	1433251055	1433251055	\N
viewProfessor	2	View Professor	\N	\N	1433251208	1433251208	\N
editEdital	2	Edit Edital	\N	\N	1433251583	1433251583	\N
deleteEdital	2	Delete Edital	\N	\N	1433252591	1433252591	\N
editPesquisa	2	Edit Pesquisa	\N	\N	1433252705	1433252705	\N
deletePesquisa	2	Delete Pesquisa	\N	\N	1433252773	1433252773	\N
editProfessor	2	Edit Professor	\N	\N	1433252836	1433252836	\N
deleteProfessor	2	Delete Professor	\N	\N	1433252889	1433252889	\N
editAluno	2	Edit Aluno	\N	\N	1433252950	1433252950	\N
deleteAluno	2	Delete Aluno	\N	\N	1433253006	1433253006	\N
listarEditais	2	Listar Editais	\N	\N	1433253230	1433253230	\N
listarPesquisas	2	Listar Pesquisas	\N	\N	1433253288	1433253288	\N
listarProfessores	2	Listar Professores	\N	\N	1433253342	1433253342	\N
listarAlunos	2	Listar Alunos	\N	\N	1433253399	1433253399	\N
viewTipoEdital	2	View TipoEdital	\N	\N	1433254638	1433254638	\N
editTipoEdital	2	Edit TipoEdital	\N	\N	1433254704	1433254704	\N
deleteTipoEdital	2	Delete TipoEdital	\N	\N	1433254758	1433254758	\N
listarTiposEditais	2	Listar TiposEditais	\N	\N	1433254876	1433254876	\N
listarCursos	2	Listar Cursos	\N	\N	1433254955	1433254955	\N
viewCurso	2	View Curso	\N	\N	1433254999	1433255028	\N
editCurso	2	Edit Curso	\N	\N	1433255047	1433255047	\N
deleteCurso	2	Delete Curso	\N	\N	1433255090	1433255090	\N
viewPesquisaAluno	2	View PesquisaAluno	\N	\N	1433255359	1433255359	\N
editPesquisaAluno	2	Edit PesquisaAluno	\N	\N	1433255401	1433255401	\N
listarPesquisaAluno	2	Listar PesquisaAluno	\N	\N	1433255443	1433255443	\N
deletePesquisaAluno	2	Delete PesquisaAluno	\N	\N	1433255489	1433255489	\N
/subareacapes/*	3	\N	\N	\N	1434467622	1434467622	\N
/subareacapes/delete	3	\N	\N	\N	1434467623	1434467623	\N
/subareacapes/update	3	\N	\N	\N	1434467624	1434467624	\N
/subareacapes/create	3	\N	\N	\N	1434467625	1434467625	\N
/subareacapes/view	3	\N	\N	\N	1434467626	1434467626	\N
/subareacapes/index	3	\N	\N	\N	1434467627	1434467627	\N
/pesquisa-aluno/batchupdate	3	\N	\N	\N	1434467628	1434467628	\N
/pesquisa-aluno/remove	3	\N	\N	\N	1434467628	1434467628	\N
/areacapes/*	3	\N	\N	\N	1434467629	1434467629	\N
createAluno	2	Aluno Create	\N	\N	1433251363	1433251363	\N
createCurso	2	Curso Create	\N	\N	1433255187	1433255187	\N
createPesquisa	2	Pesquisa Create	\N	\N	1433251138	1433251138	\N
createPesquisaAluno	2	PesquisaAluno Create	\N	\N	1433255299	1433255299	\N
createProfessor	2	Sevidor Create	\N	\N	1433251267	1433251267	\N
createTipoEdital	2	TipoEdital Create	\N	\N	1433254814	1433254814	\N
/areacapes/delete	3	\N	\N	\N	1434467630	1434467630	\N
/areacapes/update	3	\N	\N	\N	1434467631	1434467631	\N
/areacapes/create	3	\N	\N	\N	1434467632	1434467632	\N
/areacapes/view	3	\N	\N	\N	1434467633	1434467633	\N
/areacapes/index	3	\N	\N	\N	1434467634	1434467634	\N
/gridview/*	3	\N	\N	\N	1434467635	1434467635	\N
/gridview/export/*	3	\N	\N	\N	1434467635	1434467635	\N
/gridview/export/download	3	\N	\N	\N	1434467636	1434467636	\N
viewNucleos	2	View Núcleos	\N	\N	1434468737	1434468737	\N
/nucleodepesquisa/*	3	\N	\N	\N	1434468756	1434468756	\N
/nucleodepesquisa/delete	3	\N	\N	\N	1434468757	1434468757	\N
/nucleodepesquisa/update	3	\N	\N	\N	1434468758	1434468758	\N
/nucleodepesquisa/create	3	\N	\N	\N	1434468759	1434468759	\N
/nucleodepesquisa/view	3	\N	\N	\N	1434468760	1434468760	\N
/nucleodepesquisa/index	3	\N	\N	\N	1434468760	1434468760	\N
listarNucleos	2	Listar Núcleos	\N	\N	1434468829	1434468829	\N
deleteNucleos	2	Delete Núcleos	\N	\N	1434468972	1434468972	\N
editNucleos	2	Edit Núcleos	\N	\N	1434469126	1434469126	\N
removePesquisaAluno	2	Remove PesquisaAluno	\N	\N	1434629294	1434629294	\N
deletar	2	Deletar	\N	\N	1435064770	1435064770	\N
viewPesquisaRelatorio	2	View PesquisaRelatorio	\N	\N	1445516361	1445516518	\N
editPesquisaRelatorio	2	EditPesquisaRelatorio	\N	\N	1445516691	1445516691	\N
listarPesquisaRelatorio	2	ListarPequisaRelatorio	\N	\N	1445516871	1445516871	\N
/moodle/*	3	\N	\N	\N	1566434408	1566434408	\N
/pesquisa-relatorio/batchupdate	3	\N	\N	\N	1448967333	1448967333	\N
/pesquisa-relatorio/remove	3	\N	\N	\N	1448967335	1448967335	\N
/pesquisa/relatorio	3	\N	\N	\N	1448967338	1448967338	\N
/nucleodepesquisa/dynsub	3	\N	\N	\N	1448967341	1448967341	\N
/extensao/*	3	\N	\N	\N	1448967343	1448967343	\N
/extensao/delete	3	\N	\N	\N	1448967346	1448967346	\N
/extensao/update	3	\N	\N	\N	1448967347	1448967347	\N
/extensao/create	3	\N	\N	\N	1448967350	1448967350	\N
/extensao/view	3	\N	\N	\N	1448967355	1448967355	\N
/extensao/index	3	\N	\N	\N	1448967360	1448967360	\N
/extensao-alunos/*	3	\N	\N	\N	1448967366	1448967366	\N
/extensao-alunos/delete	3	\N	\N	\N	1448967369	1448967369	\N
/extensao-alunos/update	3	\N	\N	\N	1448967371	1448967371	\N
/extensao-alunos/create	3	\N	\N	\N	1448967377	1448967377	\N
/extensao-alunos/view	3	\N	\N	\N	1448967382	1448967382	\N
/extensao-alunos/index	3	\N	\N	\N	1448967383	1448967383	\N
/auxilio/*	3	\N	\N	\N	1448967385	1448967385	\N
/auxilio/delete	3	\N	\N	\N	1448967387	1448967387	\N
/auxilio/update	3	\N	\N	\N	1448967388	1448967388	\N
/auxilio/create	3	\N	\N	\N	1448967389	1448967389	\N
/auxilio/view	3	\N	\N	\N	1448967393	1448967393	\N
/auxilio/index	3	\N	\N	\N	1448967394	1448967394	\N
viewAtividadeExtensao	2	View AtividadeExtensao	\N	\N	1448967595	1448967595	\N
editAtividadeExtensao	2	Edit AtividadeExtensao	\N	\N	1448967748	1448967748	\N
listarAtividadeExtensao	2	Listar AtividadeExtensao	\N	\N	1448967860	1448967860	\N
deleteAtividadeExtensao	2	Delete AtividadeExtensao	\N	\N	1448968012	1448968012	\N
editAuxilio	2	Edit Auxilio	\N	\N	1448968187	1448968187	\N
deleteAuxilio	2	Delete Auxilio	\N	\N	1448968267	1448968267	\N
viewAuxilio	2	View Auxilio	\N	\N	1448968377	1448968377	\N
listarAuxilio	2	Listar Auxilio	\N	\N	1448968443	1448968443	\N
editExtensaoAlunos	2	Edit ExtensaoAlunos	\N	\N	1448968739	1448968739	\N
listarExtensaoAlunos	2	Listar ExtensaoAlunos	\N	\N	1448968878	1448968878	\N
deleteExtensaoAlunos	2	Delete ExtensaoAlunos	\N	\N	1448969029	1448969029	\N
viewExtensaoAlunos	2	View ExtensaoAlunos	\N	\N	1448969142	1448969142	\N
acessarrelatorios	2	Acessar relatórios	\N	\N	1450480707	1450480707	\N
/pesquisa/declaracao	3	\N	\N	\N	1450480820	1450480820	\N
/pesquisa/aviso	3	\N	\N	\N	1450480820	1450480820	\N
/nucleorelatorio/*	3	\N	\N	\N	1450480820	1450480820	\N
/nucleorelatorio/batchupdate	3	\N	\N	\N	1450480820	1450480820	\N
/nucleorelatorio/remove	3	\N	\N	\N	1450480820	1450480820	\N
/nucleorelatorio/delete	3	\N	\N	\N	1450480820	1450480820	\N
/nucleorelatorio/update	3	\N	\N	\N	1450480820	1450480820	\N
/nucleorelatorio/create	3	\N	\N	\N	1450480820	1450480820	\N
/nucleorelatorio/view	3	\N	\N	\N	1450480820	1450480820	\N
/nucleorelatorio/index	3	\N	\N	\N	1450480820	1450480820	\N
/extensao/declaracao	3	\N	\N	\N	1450480820	1450480820	\N
/extensao/relatorio	3	\N	\N	\N	1450480820	1450480820	\N
/extensao-alunos/batchupdate	3	\N	\N	\N	1450480820	1450480820	\N
/extensao-alunos/remove	3	\N	\N	\N	1450480820	1450480820	\N
/extensao-alunos/declaracao	3	\N	\N	\N	1450480820	1450480820	\N
/auxilio/aviso	3	\N	\N	\N	1450480820	1450480820	\N
nucelodownloads	2	Download de arquivos do Núcleo de pesquisa	\N	\N	1457098993	1467279770	\N
batchupdates	2	acessar bacthUpdates	\N	\N	1450484102	1450484102	\N
removechildfrommaster	2	Remove child from master	\N	\N	1450542033	1450542098	\N
ajaxcalls	2	Ajax Calls	\N	\N	1450543678	1450543678	\N
nucleorelatorio	2	Add/removeRelatório Núcleo	\N	\N	1454786488	1454786488	\N
/pesquisa/download	3	\N	\N	\N	1457098701	1457098701	\N
/pesquisa-aluno/declaracao	3	\N	\N	\N	1457098701	1457098701	\N
/nucleodepesquisa/download	3	\N	\N	\N	1457098701	1457098701	\N
/nucleo-aluno/*	3	\N	\N	\N	1457098701	1457098701	\N
/nucleo-aluno/delete	3	\N	\N	\N	1457098701	1457098701	\N
/nucleo-aluno/update	3	\N	\N	\N	1457098702	1457098702	\N
/nucleo-aluno/create	3	\N	\N	\N	1457098702	1457098702	\N
/nucleo-aluno/view	3	\N	\N	\N	1457098702	1457098702	\N
/nucleo-aluno/index	3	\N	\N	\N	1457098702	1457098702	\N
/auxilio/relatorio	3	\N	\N	\N	1457098702	1457098702	\N
downloadpesquisa	2	Download de arquivos de Pesquisa	\N	\N	1457098682	1457098912	\N
viewAuxilioMes	2	View AuxilioMes	\N	\N	1467558216	1467558216	\N
relatorioAuxilioPorMes	2	relatorio Auxilio Por Mes	\N	\N	1467558499	1467558499	\N
delete_estagio	2	delete estagio	\N	\N	\N	\N	\N
viewestagio	2	View estagio	\N	\N	\N	\N	\N
estagio_decla_aluno	2	estagio declaracao Aluno	\N	\N	\N	\N	\N
estagio_decla_professor	2	estagio declaracao professor	\N	\N	\N	\N	\N
downloadNucleoRelatorio	2	Download de arquivos de Nucleo Relatorios	\N	\N	\N	\N	\N
downloadPesquisaRelatorio	2	Download de arquivos de Pesquisa Relatorios	\N	\N	\N	\N	\N
/edital/download	3		\N	\N	\N	\N	\N
/extensao/download	3		\N	\N	\N	\N	\N
/nucleorelatorio/download	3		\N	\N	\N	\N	\N
/pesquisa-relatorio/download	3		\N	\N	\N	\N	\N
/estagio/create	3		\N	\N	\N	\N	\N
/estagio/declaracaoaluno	3		\N	\N	\N	\N	\N
/estagio/declaracaoorientador	3		\N	\N	\N	\N	\N
/estagio/delete	3		\N	\N	\N	\N	\N
/estagio/index	3		\N	\N	\N	\N	\N
/estagio/update	3		\N	\N	\N	\N	\N
/estagio/view	3		\N	\N	\N	\N	\N
createAuxilio	2	Auxilio Create	\N	\N	1448968124	1448968124	\N
createExtensaoAlunos	2	ExtensaoAlunos Create	\N	\N	1448968529	1448968529	\N
createNucleos	2	Núcleos Create	\N	\N	1434469056	1434469056	\N
createPesquisaRelatório	2	PesquisaRelatório Create	\N	\N	1445516007	1445516150	\N
criarestagio	2	estagio Create	\N	\N	\N	\N	\N
listar_Sup_estagio	2	listar supervisor estagio	\N	\N	\N	\N	\N
edit_Sup_estagio	2	edit supervisor estagio	\N	\N	\N	\N	\N
delete_Sup_estagio	2	delete supervisor estagio	\N	\N	\N	\N	\N
view_Sup_estagio	2	View supervisor estagio	\N	\N	\N	\N	\N
/estagio-supervisor/create	3		\N	\N	\N	\N	\N
/estagio-supervisor/delete	3		\N	\N	\N	\N	\N
/estagio-supervisor/index	3		\N	\N	\N	\N	\N
/estagio-supervisor/update	3		\N	\N	\N	\N	\N
/estagio-supervisor/view	3		\N	\N	\N	\N	\N
Estagio	1	Estagio	\N	\N	\N	\N	\N
plano de trab view	2	plano_de_trabalho_view	\N	\N	\N	\N	\N
plano de trab index	2	plano_de_trabalho_index	\N	\N	\N	\N	\N
declaracaoalunosextensao	2	Emitir Declaração de Alunos de Projetos  de extensão-ensino	\N	\N	1553784244	1553784244	\N
listarconvenio	2	listar convenio	\N	\N	\N	\N	\N
editconvenio	2	edit convenio	\N	\N	\N	\N	\N
delete_convenio	2	delete convenio	\N	\N	\N	\N	\N
viewconvenio	2	View convenio	\N	\N	\N	\N	\N
/convenio/create	3		\N	\N	\N	\N	\N
/convenio/delete	3		\N	\N	\N	\N	\N
/convenio/index	3		\N	\N	\N	\N	\N
/convenio/update	3		\N	\N	\N	\N	\N
/convenio/view	3		\N	\N	\N	\N	\N
listarpendencia	2	listar pendencia	\N	\N	\N	\N	\N
/estagio/pendencia	3		\N	\N	\N	\N	\N
supervisor_declaracao	2	supervisor declaracao	\N	\N	\N	\N	\N
/estagio-supervisor/declaracao	3		\N	\N	\N	\N	\N
listarconfig	2	listar config	\N	\N	\N	\N	\N
altconfig	2	alt config	\N	\N	\N	\N	\N
/configuracao/index	3		\N	\N	\N	\N	\N
/configuracao/update	3		\N	\N	\N	\N	\N
pendenciaview	2	pendencia view	\N	\N	\N	\N	\N
/estagio/pendenciaview	3		\N	\N	\N	\N	\N
/conselhoaluno/*	3		\N	\N	\N	\N	\N
/conselhoaluno/create	3		\N	\N	\N	\N	\N
/conselhoaluno/delete	3		\N	\N	\N	\N	\N
/conselhoaluno/index	3		\N	\N	\N	\N	\N
/conselhoaluno/update	3		\N	\N	\N	\N	\N
/conselhoaluno/view	3		\N	\N	\N	\N	\N
/conselhoclasse/*	3		\N	\N	\N	\N	\N
/conselhoclasse/create	3		\N	\N	\N	\N	\N
/conselhoclasse/delete	3		\N	\N	\N	\N	\N
/conselhoclasse/index	3		\N	\N	\N	\N	\N
/conselhoclasse/update	3		\N	\N	\N	\N	\N
/conselhoclasse/view	3		\N	\N	\N	\N	\N
/conselhodisciplinas/*	3		\N	\N	\N	\N	\N
/conselhodisciplinas/create	3		\N	\N	\N	\N	\N
/conselhodisciplinas/delete	3		\N	\N	\N	\N	\N
/conselhodisciplinas/index	3		\N	\N	\N	\N	\N
/conselhodisciplinas/update	3		\N	\N	\N	\N	\N
/conselhodisciplinas/view	3		\N	\N	\N	\N	\N
/conselhoturma/*	3		\N	\N	\N	\N	\N
/conselhoturma/create	3		\N	\N	\N	\N	\N
/conselhoturma/delete	3		\N	\N	\N	\N	\N
/conselhoturma/index	3		\N	\N	\N	\N	\N
/conselhoturma/update	3		\N	\N	\N	\N	\N
/conselhoturma/view	3		\N	\N	\N	\N	\N
/disciplinas/*	3		\N	\N	\N	\N	\N
/disciplinas/create	3		\N	\N	\N	\N	\N
/disciplinas/delete	3		\N	\N	\N	\N	\N
/disciplinas/index	3		\N	\N	\N	\N	\N
/disciplinas/update	3		\N	\N	\N	\N	\N
/disciplinas/view	3		\N	\N	\N	\N	\N
/turma/*	3		\N	\N	\N	\N	\N
/turma/create	3		\N	\N	\N	\N	\N
/turma/delete	3		\N	\N	\N	\N	\N
/turma/index	3		\N	\N	\N	\N	\N
/turma/update	3		\N	\N	\N	\N	\N
/turma/view	3		\N	\N	\N	\N	\N
/moodle/delete	3	\N	\N	\N	1566434408	1566434408	\N
conselhoalunodelete	2	Conselhoaluno delete	\N	\N	\N	\N	\N
conselhoalunoindex	2	Conselhoaluno index	\N	\N	\N	\N	\N
conselhoalunoupdate	2	Conselhoaluno update	\N	\N	\N	\N	\N
conselhoalunoview	2	Conselhoaluno view	\N	\N	\N	\N	\N
conselhoclassecreate	2	Conselhoclasse create	\N	\N	\N	\N	\N
conselhoclassedelete	2	Conselhoclasse delete	\N	\N	\N	\N	\N
conselhoclasseindex	2	Conselhoclasse index	\N	\N	\N	\N	\N
conselhoclasseupdate	2	Conselhoclasse update	\N	\N	\N	\N	\N
conselhoclasseview	2	Conselhoclasse view	\N	\N	\N	\N	\N
conselhodisciplinacreate	2	Conselhodisciplina create	\N	\N	\N	\N	\N
conselhodisciplinadelete	2	Conselhodisciplina delete	\N	\N	\N	\N	\N
conselhodisciplinaindex	2	Conselhodisciplina index	\N	\N	\N	\N	\N
conselhodisciplinaupdate	2	Conselhodisciplina update	\N	\N	\N	\N	\N
conselhodisciplinaview	2	Conselhodisciplina view	\N	\N	\N	\N	\N
conselhoturmacreate	2	Conselhoturma create	\N	\N	\N	\N	\N
conselhoturmadelete	2	Conselhoturma delete	\N	\N	\N	\N	\N
conselhoturmaindex	2	Conselhoturma index	\N	\N	\N	\N	\N
conselhoturmaupdate	2	Conselhoturma update	\N	\N	\N	\N	\N
conselhoturmaview	2	Conselhoturma view	\N	\N	\N	\N	\N
disciplinascreate	2	Disciplinas create	\N	\N	\N	\N	\N
disciplinasdelete	2	Disciplinas delete	\N	\N	\N	\N	\N
disciplinasindex	2	Disciplinas index	\N	\N	\N	\N	\N
disciplinasupdate	2	Disciplinas update	\N	\N	\N	\N	\N
disciplinasview	2	Disciplinas view	\N	\N	\N	\N	\N
turmacreate	2	Turma create	\N	\N	\N	\N	\N
turmadelete	2	Turma delete	\N	\N	\N	\N	\N
turmaindex	2	Turma index	\N	\N	\N	\N	\N
turmaupdate	2	Turma update	\N	\N	\N	\N	\N
turmaview	2	Turma view	\N	\N	\N	\N	\N
listar_PRT	2	listar Plano de trabalho	\N	\N	\N	\N	\N
funcionarioc	1	CAPD	\N	\N	\N	1535370419	\N
edit_PRT	2	edit Plano de trabalho	\N	\N	\N	\N	\N
delete_PRT	2	delete Plano de trabalho	\N	\N	\N	\N	\N
view_PRT	2	View Plano de trabalho	\N	\N	\N	\N	\N
relatorio_PRT	2	Relatorio Plano de trabalho	\N	\N	\N	\N	\N
/plano-trabalho/create	3		\N	\N	\N	\N	\N
/plano-trabalho/delete	3		\N	\N	\N	\N	\N
/plano-trabalho/index	3		\N	\N	\N	\N	\N
/plano-trabalho/update	3		\N	\N	\N	\N	\N
/plano-trabalho/view	3		\N	\N	\N	\N	\N
/plano-trabalho/relatorio	3		\N	\N	\N	\N	\N
Docente	1	Docente	\N	\N	\N	\N	\N
funcdaa	1	FuncionarioDAA	\N	\N	1537378323	1537378323	\N
downloadarquivoplano	2	Download de Arquivos do Plano de Trabalho	\N	\N	1537752146	1537752146	\N
/tipo-atividade/*	3	\N	\N	\N	1537752202	1537752202	\N
/tipo-atividade/delete	3	\N	\N	\N	1537752202	1537752202	\N
/tipo-atividade/update	3	\N	\N	\N	1537752203	1537752203	\N
/tipo-atividade/create	3	\N	\N	\N	1537752203	1537752203	\N
criar_PRT	2	Plano de trabalho Create	\N	\N	\N	\N	\N
criar_Sup_estagio	2	supervisor estagio Create	\N	\N	\N	\N	\N
criarconvenio	2	convenio Create	\N	\N	\N	\N	\N
/tipo-atividade/view	3	\N	\N	\N	1537752203	1537752203	\N
/tipo-atividade/index	3	\N	\N	\N	1537752203	1537752203	\N
/site/process	3	\N	\N	\N	1537752204	1537752204	\N
/plano-trabalho/*	3	\N	\N	\N	1537752204	1537752204	\N
/plano-trabalho/download	3	\N	\N	\N	1537752204	1537752204	\N
changestatusitemplano	2	Mudar status do item do plano de trabalho	\N	\N	1541770284	1553871165	rlspermissions
impersonateservidorcapd	2	Realizar funções em Conselhos como qualquer usuário	\N	\N	1551199260	1553872347	rlspermissions
/nucleodepesquisa/relatorio	3	\N	\N	\N	1537752205	1537752205	\N
/import/*	3	\N	\N	\N	1537752206	1537752206	\N
/import/create	3	\N	\N	\N	1537752206	1537752206	\N
/estagio-supervisor/*	3	\N	\N	\N	1537752206	1537752206	\N
/estagio/*	3	\N	\N	\N	1537752206	1537752206	\N
/estagio/aviso	3	\N	\N	\N	1537752207	1537752207	\N
/convenio/*	3	\N	\N	\N	1537752207	1537752207	\N
/conselhoturma/batchupdate	3	\N	\N	\N	1537752207	1537752207	\N
/conselhodisciplinas/batchupdate	3	\N	\N	\N	1537752208	1537752208	\N
/conselhoaluno/batchupdate	3	\N	\N	\N	1537752208	1537752208	\N
/configuracao/*	3	\N	\N	\N	1537752208	1537752208	\N
/configuracao/delete	3	\N	\N	\N	1537752209	1537752209	\N
/configuracao/create	3	\N	\N	\N	1537752209	1537752209	\N
/configuracao/view	3	\N	\N	\N	1537752209	1537752209	\N
tabelaplano	2	Consultar Tabela de Planos dos Professores	\N	\N	1538167493	1538167493	\N
/plano-trabalho/plano	3	\N	\N	\N	1538167909	1538167909	\N
chefedaa	1	Chefe DAA	\N	\N	1538167978	1538167978	\N
mgntdisciplina	2	gerenciar disciplinas	\N	\N	1541713320	1541713320	\N
visualizar_horario_discente	2	Visualizar Horário Discente	\N	\N	1550589672	1550589672	\N
/tcc/*	3	\N	\N	\N	1550589687	1550589687	\N
/tcc/delete	3	\N	\N	\N	1550589687	1550589687	\N
/tcc/update	3	\N	\N	\N	1550589687	1550589687	\N
/tcc/create	3	\N	\N	\N	1550589687	1550589687	\N
/tcc/view	3	\N	\N	\N	1550589687	1550589687	\N
/tcc/index	3	\N	\N	\N	1550589687	1550589687	\N
/plano-trabalho/horario	3	\N	\N	\N	1550589687	1550589687	\N
listar_alunohoras	2	listar alunohoras	\N	\N	\N	\N	\N
edit_alunohoras	2	edit alunohoras	\N	\N	\N	\N	\N
delete_alunohoras	2	delete alunohoras	\N	\N	\N	\N	\N
view_alunohoras	2	View alunohoras	\N	\N	\N	\N	\N
listar_chlimite	2	listar chlimite	\N	\N	\N	\N	\N
edit_chlimite	2	edit chlimite	\N	\N	\N	\N	\N
delete_chlimite	2	delete chlimite	\N	\N	\N	\N	\N
view_chlimite	2	View chlimite	\N	\N	\N	\N	\N
decl_alunohoras	2	decl alunohoras	\N	\N	\N	\N	\N
aluno	1	aluno	\N	\N	\N	\N	\N
addtccstudent	2	Adicionar Alunos de TCCs	\N	\N	1552592913	1552592913	\N
editalmanager	2	Gerenciar editais	\N	\N	1552593351	1552593351	\N
prodireadonly	2	Pro-Reitoria Apenas Leitura	\N	\N	1558100600	1558100600	\N
proreitores	1	Pro-Reitores	\N	\N	1558101399	1558101399	\N
coordcurso	1	Coordenador de Curso	\N	\N	1566224754	1566224754	\N
viewAluno	2	Aluno View	\N	\N	1433251313	1433251313	\N
conselhoalunocreate	2	Conselhoaluno create	\N	\N	\N	\N	\N
createAtividadeExtensao	2	AtividadeExtensao Create	\N	\N	1448967287	1448967287	\N
createEdital	2	Edital Create	\N	\N	1433250719	1433250776	\N
createUsers	2	users Create	\N	\N	1432650867	1432650867	userManagement
criar_alunohoras	2	alunohoras Create	\N	\N	\N	\N	\N
criar_chlimite	2	chlimite Create	\N	\N	\N	\N	\N
/moodle/update	3	\N	\N	\N	1566434408	1566434408	\N
/moodle/create	3	\N	\N	\N	1566434408	1566434408	\N
/moodle/view	3	\N	\N	\N	1566434408	1566434408	\N
/moodle/index	3	\N	\N	\N	1566434408	1566434408	\N
\.


--
-- TOC entry 2703 (class 0 OID 59078)
-- Dependencies: 205
-- Data for Name: auth_item_child; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_item_child (parent, child) FROM stdin;
viewUsers	/user-management/user/index
viewUsers	/user-management/user/view
viewUsers	/user-management/user/grid-page-size
createUsers	/user-management/user/create
editUsers	/user-management/user/update
editUsers	/user-management/user/bulk-activate
editUsers	/user-management/user/bulk-deactivate
deleteUsers	/user-management/user/delete
deleteUsers	/user-management/user/bulk-delete
changeUserPassword	/user-management/user/change-password
assignRolesToUsers	/user-management/user-permission/set
assignRolesToUsers	/user-management/user-permission/set-roles
viewVisitLog	/user-management/user-visit-log/index
viewVisitLog	/user-management/user-visit-log/grid-page-size
viewVisitLog	/user-management/user-visit-log/view
assignRolesToUsers	viewUsers
assignRolesToUsers	viewUserRoles
changeUserPassword	viewUsers
deleteUsers	viewUsers
createUsers	viewUsers
editUsers	viewUsers
editUserEmail	viewUserEmail
changeOwnPassword	/user-management/auth/change-own-password
gerente	changeOwnPassword
confirmarEmail	/user-management/auth/confirm-email-receive
confirmarEmail	/user-management/auth/confirm-email
gerente	confirmarEmail
viewEdital	/edital/view
createEdital	/edital/create
viewPesquisa	/pesquisa/view
createPesquisa	/pesquisa/create
viewProfessor	/professor/view
createProfessor	/professor/create
viewAluno	/aluno/view
createAluno	/aluno/create
editEdital	/edital/update
deleteEdital	/edital/delete
editPesquisa	/pesquisa/update
deletePesquisa	/pesquisa/delete
editProfessor	/professor/update
deleteProfessor	/professor/delete
editAluno	/aluno/update
deleteAluno	/aluno/delete
listarEditais	/edital/index
listarPesquisas	/pesquisa/index
listarProfessores	/professor/index
listarAlunos	/aluno/index
chefedaa	downloadEdital
chefedaa	downloadExtensao
chefedaa	viewEdital
chefedaa	createEdital
funcionario	viewProfessor
chefedaa	editEdital
funcionario	viewAluno
chefedaa	deleteEdital
chefedaa	viewTipoEdital
chefedaa	editTipoEdital
chefedaa	deleteTipoEdital
chefedaa	createTipoEdital
chefedaa	createAtividadeExtensao
chefedaa	viewAtividadeExtensao
funcionario	listarProfessores
funcionario	listarAlunos
funcionario	changeOwnPassword
viewTipoEdital	/tipoedital/view
editTipoEdital	/tipoedital/update
deleteTipoEdital	/tipoedital/delete
createTipoEdital	/tipoedital/create
listarTiposEditais	/tipoedital/index
listarCursos	/curso/index
viewCurso	/curso/view
editCurso	/curso/update
deleteCurso	/curso/delete
createCurso	/curso/create
createPesquisaAluno	/pesquisa-aluno/create
viewPesquisaAluno	/pesquisa-aluno/view
editPesquisaAluno	/pesquisa-aluno/update
listarPesquisaAluno	/pesquisa-aluno/index
deletePesquisaAluno	/pesquisa-aluno/delete
chefedaa	editAtividadeExtensao
chefedaa	listarAtividadeExtensao
chefedaa	deleteAtividadeExtensao
chefedaa	createExtensaoAlunos
funcionario	listarCursos
chefedaa	editExtensaoAlunos
chefedaa	listarExtensaoAlunos
chefedaa	deleteExtensaoAlunos
chefedaa	viewExtensaoAlunos
addtccstudent	/tcc/delete
addtccstudent	/tcc/update
addtccstudent	/tcc/create
gerente	viewEdital
gerente	createEdital
gerente	viewPesquisa
gerente	createPesquisa
gerente	viewProfessor
gerente	createProfessor
gerente	viewAluno
gerente	createAluno
gerente	editEdital
gerente	deleteEdital
gerente	editPesquisa
gerente	deletePesquisa
gerente	editProfessor
gerente	deleteProfessor
gerente	editAluno
gerente	deleteAluno
gerente	listarEditais
gerente	listarPesquisas
gerente	listarProfessores
gerente	listarAlunos
gerente	viewTipoEdital
gerente	editTipoEdital
gerente	deleteTipoEdital
gerente	createTipoEdital
gerente	listarTiposEditais
gerente	listarCursos
gerente	viewCurso
gerente	editCurso
gerente	deleteCurso
gerente	createCurso
gerente	createPesquisaAluno
gerente	viewPesquisaAluno
gerente	editPesquisaAluno
gerente	listarPesquisaAluno
gerente	deletePesquisaAluno
viewNucleos	/nucleodepesquisa/view
listarNucleos	/nucleodepesquisa/index
deleteNucleos	/nucleodepesquisa/delete
createNucleos	/nucleodepesquisa/create
editNucleos	/nucleodepesquisa/update
addtccstudent	/tcc/view
addtccstudent	/tcc/index
declaracaoalunosextensao	/extensao-alunos/declaracao
gerente	declaracaoalunosextensao
gerente	viewNucleos
gerente	listarNucleos
gerente	deleteNucleos
gerente	createNucleos
gerente	editNucleos
removePesquisaAluno	/pesquisa-aluno/remove
gerente	removePesquisaAluno
deletar	/tipoedital/delete
deletar	/professor/delete
deletar	/pesquisa-relatorio/delete
deletar	/pesquisa-coorientador/delete
deletar	/pesquisa/delete
deletar	/pesquisa-aluno/delete
deletar	/nucleo-professores/delete
deletar	/edital/delete
deletar	/curso/delete
deletar	/aluno/delete
deletar	/nucleodepesquisa/delete
gerente	deletar
createPesquisaRelatório	/pesquisa-relatorio/create
gerente	createPesquisaRelatório
viewPesquisaRelatorio	/pesquisa-relatorio/view
editPesquisaRelatorio	/pesquisa-relatorio/update
listarPesquisaRelatorio	/pesquisa-relatorio/index
gerente	viewPesquisaRelatorio
gerente	editPesquisaRelatorio
gerente	listarPesquisaRelatorio
createAtividadeExtensao	/extensao/create
viewAtividadeExtensao	/extensao/view
editAtividadeExtensao	/extensao/update
listarAtividadeExtensao	/extensao/index
deleteAtividadeExtensao	/extensao/delete
createAuxilio	/auxilio/create
editAuxilio	/auxilio/update
deleteAuxilio	/auxilio/delete
viewAuxilio	/auxilio/view
listarAuxilio	/auxilio/index
createExtensaoAlunos	/extensao-alunos/create
editExtensaoAlunos	/extensao-alunos/update
listarExtensaoAlunos	/extensao-alunos/index
deleteExtensaoAlunos	/extensao-alunos/delete
viewExtensaoAlunos	/extensao-alunos/view
gerente	createAtividadeExtensao
gerente	viewAtividadeExtensao
gerente	editAtividadeExtensao
gerente	listarAtividadeExtensao
gerente	deleteAtividadeExtensao
gerente	createAuxilio
gerente	editAuxilio
gerente	deleteAuxilio
gerente	viewAuxilio
gerente	listarAuxilio
gerente	createExtensaoAlunos
gerente	editExtensaoAlunos
gerente	listarExtensaoAlunos
gerente	deleteExtensaoAlunos
gerente	viewExtensaoAlunos
acessarrelatorios	/pesquisa/relatorio
acessarrelatorios	/pesquisa/declaracao
acessarrelatorios	/pesquisa/aviso
acessarrelatorios	/extensao/declaracao
acessarrelatorios	/extensao/relatorio
acessarrelatorios	/extensao-alunos/declaracao
acessarrelatorios	/auxilio/aviso
gerente	acessarrelatorios
batchupdates	/pesquisa-aluno/batchupdate
batchupdates	/pesquisa-relatorio/batchupdate
batchupdates	/nucleorelatorio/batchupdate
batchupdates	/extensao-alunos/batchupdate
gerente	batchupdates
removechildfrommaster	/pesquisa-aluno/remove
removechildfrommaster	/pesquisa-relatorio/remove
removechildfrommaster	/extensao-alunos/remove
gerente	removechildfrommaster
ajaxcalls	/nucleodepesquisa/dynsub
gerente	ajaxcalls
removechildfrommaster	/nucleorelatorio/remove
nucleorelatorio	/nucleorelatorio/batchupdate
nucleorelatorio	/nucleorelatorio/remove
nucleorelatorio	/nucleorelatorio/create
gerente	nucleorelatorio
downloadpesquisa	/pesquisa/download
nucelodownloads	/nucleodepesquisa/download
gerente	downloadpesquisa
gerente	nucelodownloads
acessarrelatorios	/pesquisa-aluno/declaracao
acessarrelatorios	/auxilio/relatorio
listarAuxilioMes	/auxilio-mes/index
editAuxilioMes	/auxilio-mes/batchupdate
relatorioAuxilioPorMes	/auxilio/relatorio
gerente	listarAuxilioMes
gerente	editAuxilioMes
gerente	viewAuxilioMes
gerente	relatorioAuxilioPorMes
funcionario	confirmarEmail
downloadEdital	/edital/download
downloadExtensao	/extensao/download
downloadNucleoRelatorio	/nucleorelatorio/download
downloadPesquisaRelatorio	/pesquisa-relatorio/download
gerente	downloadEdital
gerente	downloadExtensao
gerente	downloadNucleoRelatorio
gerente	downloadPesquisaRelatorio
chefedaa	addtccstudent
editalmanager	/tipoedital/*
editalmanager	/edital/*
editalmanager	/edital/download
Cae	editAuxilioMes
Cae	listarAuxilioMes
Cae	relatorioAuxilioPorMes
Cae	viewAuxilioMes
Cae	createAuxilio
Cae	deleteAuxilio
Cae	editAuxilio
Cae	listarAuxilio
criarestagio	/estagio/create
estagio_decla_aluno	/estagio/declaracaoaluno
estagio_decla_professor	/estagio/declaracaoorientador
delete_estagio	/estagio/delete
listarestagio	/estagio/index
editestagio	/estagio/update
viewestagio	/estagio/view
criar_Sup_estagio	/estagio-supervisor/create
delete_Sup_estagio	/estagio-supervisor/delete
listar_Sup_estagio	/estagio-supervisor/index
edit_Sup_estagio	/estagio-supervisor/update
view_Sup_estagio	/estagio-supervisor/view
Estagio	criarestagio
Estagio	delete_estagio
Estagio	viewestagio
Estagio	listarestagio
Estagio	editestagio
Estagio	estagio_decla_aluno
Estagio	estagio_decla_professor
Estagio	criar_Sup_estagio
Estagio	delete_Sup_estagio
Estagio	view_Sup_estagio
Estagio	listar_Sup_estagio
Estagio	edit_Sup_estagio
gerente	criarestagio
gerente	delete_estagio
gerente	viewestagio
gerente	listarestagio
gerente	editestagio
gerente	estagio_decla_aluno
gerente	estagio_decla_professor
gerente	criar_Sup_estagio
gerente	delete_Sup_estagio
gerente	view_Sup_estagio
gerente	listar_Sup_estagio
gerente	edit_Sup_estagio
Cae	changeOwnPassword
funcionario	declaracaoalunosextensao
gerente	plano de trab view
gerente	plano de trab index
criarconvenio	/convenio/create
delete_convenio	/convenio/delete
listarconvenio	/convenio/index
editconvenio	/convenio/update
viewconvenio	/convenio/view
Estagio	criarconvenio
Estagio	delete_convenio
Estagio	viewconvenio
Estagio	listarconvenio
Estagio	editconvenio
gerente	criarconvenio
gerente	delete_convenio
gerente	viewconvenio
gerente	listarconvenio
gerente	editconvenio
Cae	viewAuxilio
Estagio	listarpendencia
gerente	listarpendencia
supervisor_declaracao	/estagio-supervisor/declaracao
gerente	supervisor_declaracao
Estagio	supervisor_declaracao
listarconfig	/configuracao/index
altconfig	/configuracao/update
gerente	listarconfig
gerente	altconfig
listarpendencia	/estagio/pendencia
pendenciaview	/estagio/pendenciaview
Estagio	pendenciaview
gerente	pendenciaview
moodleall	/moodle/*
conselhoalunocreate	/conselhoaluno/create
moodleadm	moodleall
conselhoalunodelete	/conselhoaluno/delete
conselhoalunoindex	/conselhoaluno/index
conselhoalunoupdate	/conselhoaluno/update
conselhoalunoview	/conselhoaluno/view
conselhoclassecreate	/conselhoclasse/create
conselhoclassedelete	/conselhoclasse/delete
conselhoclasseindex	/conselhoclasse/index
conselhoclasseupdate	/conselhoclasse/update
conselhoclasseview	/conselhoclasse/view
conselhodisciplinacreate	/conselhodisciplinas/create
conselhodisciplinadelete	/conselhodisciplinas/delete
conselhodisciplinaindex	/conselhodisciplinas/index
conselhodisciplinaupdate	/conselhodisciplinas/update
conselhodisciplinaview	/conselhodisciplinas/view
conselhoturmacreate	/conselhoturma/create
conselhoturmadelete	/conselhoturma/delete
conselhoturmaindex	/conselhoturma/index
conselhoturmaupdate	/conselhoturma/update
chefedaa	editalmanager
conselhoturmaview	/conselhoturma/view
disciplinascreate	/disciplinas/create
disciplinasdelete	/disciplinas/delete
disciplinasindex	/disciplinas/index
disciplinasupdate	/disciplinas/update
disciplinasview	/disciplinas/view
turmacreate	/turma/create
turmadelete	/turma/delete
turmaindex	/turma/index
turmaupdate	/turma/update
turmaview	/turma/view
funcionarioc	conselhoclasseindex
funcionarioc	conselhoclassecreate
funcionarioc	conselhoclasseupdate
funcionarioc	conselhoclasseview
funcionarioc	conselhoalunoindex
funcionarioc	conselhoalunocreate
funcionarioc	conselhoalunoupdate
funcionarioc	conselhoalunoview
funcionarioc	conselhoturmaindex
funcionarioc	conselhoturmacreate
funcionarioc	conselhoturmaupdate
funcionarioc	conselhoturmaview
funcionarioc	turmaindex
listar_PRT	/plano-trabalho/index
edit_PRT	/plano-trabalho/update
delete_PRT	/plano-trabalho/delete
funcionarioc	turmaview
funcionarioc	disciplinasindex
view_PRT	/plano-trabalho/view
criar_PRT	/plano-trabalho/create
relatorio_PRT	/plano-trabalho/relatorio
funcionarioc	disciplinasview
funcionarioc	conselhodisciplinaindex
funcionarioc	conselhodisciplinacreate
funcionarioc	conselhodisciplinaupdate
funcionarioc	conselhodisciplinaview
funcionarioc	viewProfessor
funcionarioc	createProfessor
funcionarioc	viewAluno
funcionarioc	createAluno
funcionarioc	editProfessor
funcionarioc	editAluno
funcionarioc	listarProfessores
funcionarioc	listarAlunos
tabelaplano	/plano-trabalho/plano
chefedaa	tabelaplano
mgntdisciplina	/disciplinas/*
mgntdisciplina	/disciplinas/create
mgntdisciplina	/disciplinas/delete
mgntdisciplina	/disciplinas/index
Docente	listar_PRT
Docente	edit_PRT
Docente	delete_PRT
Docente	view_PRT
Docente	criar_PRT
Docente	relatorio_PRT
funcdaa	listar_PRT
funcdaa	edit_PRT
mgntdisciplina	/disciplinas/update
funcdaa	view_PRT
funcdaa	criar_PRT
funcdaa	relatorio_PRT
downloadarquivoplano	/plano-trabalho/download
funcdaa	downloadarquivoplano
Docente	downloadarquivoplano
mgntdisciplina	/disciplinas/view
chefedaa	disciplinascreate
chefedaa	disciplinasdelete
chefedaa	disciplinasindex
chefedaa	disciplinasupdate
chefedaa	disciplinasview
chefedaa	mgntdisciplina
funcdaa	changestatusitemplano
chefedaa	changestatusitemplano
visualizar_horario_discente	/plano-trabalho/horario
chefedaa	visualizar_horario_discente
funcdaa	visualizar_horario_discente
funcdaa	declaracaoalunosextensao
gerente	criar_alunohoras
gerente	delete_alunohoras
gerente	view_alunohoras
gerente	listar_alunohoras
gerente	edit_alunohoras
gerente	criar_chlimite
gerente	delete_chlimite
gerente	view_chlimite
gerente	listar_chlimite
gerente	edit_chlimite
aluno	decl_alunohoras
aluno	criar_alunohoras
aluno	view_alunohoras
aluno	listar_alunohoras
gerente	decl_alunohoras
chefedaa	declaracaoalunosextensao
funcionario	viewCurso
prodireadonly	/auxilio-mes/index
prodireadonly	/tipoedital/view
prodireadonly	/tipoedital/index
prodireadonly	/professor/view
prodireadonly	/professor/index
prodireadonly	/pesquisa-relatorio/view
prodireadonly	/pesquisa-relatorio/index
prodireadonly	/pesquisa-coorientador/view
prodireadonly	/pesquisa-coorientador/index
prodireadonly	/pesquisa/view
prodireadonly	/pesquisa/index
prodireadonly	/pesquisa-aluno/view
prodireadonly	/pesquisa-aluno/index
prodireadonly	/nucleo-professores/view
prodireadonly	/nucleo-professores/index
prodireadonly	/edital/view
prodireadonly	/edital/index
prodireadonly	/curso/view
prodireadonly	/curso/index
prodireadonly	/aluno/view
prodireadonly	/aluno/index
prodireadonly	/subareacapes/view
prodireadonly	/subareacapes/index
prodireadonly	/areacapes/view
prodireadonly	/areacapes/index
prodireadonly	/gridview/*
prodireadonly	/gridview/export/*
prodireadonly	/nucleodepesquisa/view
prodireadonly	/nucleodepesquisa/index
prodireadonly	/pesquisa/relatorio
prodireadonly	/nucleodepesquisa/dynsub
prodireadonly	/extensao/view
prodireadonly	/extensao/index
prodireadonly	/extensao-alunos/view
prodireadonly	/extensao-alunos/index
prodireadonly	/auxilio/view
prodireadonly	/auxilio/index
prodireadonly	/pesquisa/declaracao
prodireadonly	/pesquisa/aviso
prodireadonly	/nucleorelatorio/view
prodireadonly	/nucleorelatorio/index
prodireadonly	/extensao/declaracao
prodireadonly	/extensao/relatorio
prodireadonly	/extensao-alunos/declaracao
prodireadonly	/auxilio/aviso
prodireadonly	/pesquisa/download
prodireadonly	/pesquisa-aluno/declaracao
prodireadonly	/nucleodepesquisa/download
prodireadonly	/nucleo-aluno/view
prodireadonly	/nucleo-aluno/index
prodireadonly	/auxilio/relatorio
prodireadonly	/edital/download
prodireadonly	/extensao/download
prodireadonly	/nucleorelatorio/download
prodireadonly	/pesquisa-relatorio/download
prodireadonly	/estagio/declaracaoaluno
prodireadonly	/estagio/declaracaoorientador
prodireadonly	/estagio/index
prodireadonly	/estagio/view
prodireadonly	/estagio-supervisor/index
prodireadonly	/estagio-supervisor/view
prodireadonly	/convenio/index
prodireadonly	/convenio/view
prodireadonly	/estagio/pendencia
prodireadonly	/estagio-supervisor/declaracao
prodireadonly	/configuracao/index
prodireadonly	/estagio/pendenciaview
prodireadonly	/conselhoaluno/index
prodireadonly	/conselhoaluno/view
prodireadonly	/conselhoclasse/index
prodireadonly	/conselhoclasse/view
prodireadonly	/conselhodisciplinas/index
prodireadonly	/conselhodisciplinas/view
prodireadonly	/conselhoturma/index
prodireadonly	/conselhoturma/view
prodireadonly	/disciplinas/index
prodireadonly	/disciplinas/view
prodireadonly	/turma/index
prodireadonly	/turma/view
prodireadonly	/plano-trabalho/index
prodireadonly	/plano-trabalho/view
prodireadonly	/plano-trabalho/relatorio
prodireadonly	/tipo-atividade/view
prodireadonly	/tipo-atividade/index
prodireadonly	/site/process
prodireadonly	/plano-trabalho/download
prodireadonly	/nucleodepesquisa/relatorio
prodireadonly	/import/create
prodireadonly	/configuracao/view
prodireadonly	/plano-trabalho/plano
prodireadonly	/tcc/view
prodireadonly	/tcc/index
prodireadonly	/plano-trabalho/horario
proreitores	prodireadonly
funcionarioc	viewEdital
funcionarioc	viewPesquisa
funcionarioc	viewTipoEdital
funcionarioc	viewCurso
funcionarioc	viewPesquisaAluno
funcionarioc	viewNucleos
funcionarioc	viewPesquisaRelatorio
funcionarioc	viewAtividadeExtensao
funcionarioc	viewAuxilio
funcionarioc	viewExtensaoAlunos
funcionarioc	viewAuxilioMes
funcionarioc	viewestagio
funcionarioc	view_Sup_estagio
funcionarioc	viewconvenio
coordcurso	conselhoalunocreate
coordcurso	conselhoalunoindex
coordcurso	conselhoalunoupdate
coordcurso	conselhoalunoview
coordcurso	conselhoclasseindex
coordcurso	conselhoclasseview
coordcurso	conselhodisciplinacreate
coordcurso	conselhodisciplinaindex
coordcurso	conselhodisciplinaupdate
coordcurso	conselhodisciplinaview
coordcurso	conselhoturmacreate
coordcurso	conselhoturmaindex
coordcurso	conselhoturmaupdate
coordcurso	conselhoturmaview
coordcurso	listarAlunos
coordcurso	viewAluno
conselhoalunoupdate	/conselhoaluno/batchupdate
conselhodisciplinaupdate	/conselhodisciplinas/batchupdate
conselhoturmaupdate	/conselhoturma/batchupdate
\.


--
-- TOC entry 2704 (class 0 OID 59081)
-- Dependencies: 206
-- Data for Name: auth_item_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_item_group (code, name, created_at, updated_at) FROM stdin;
userManagement	User management	1432650866	1432650866
userCommonPermissions	User common permission	1432650868	1432650868
rlspermissions	Permissões RLS	1553868797	1553868797
\.


--
-- TOC entry 2705 (class 0 OID 59084)
-- Dependencies: 207
-- Data for Name: auth_rule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_rule (name, data, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2706 (class 0 OID 59090)
-- Dependencies: 208
-- Data for Name: auxilio; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auxilio (id, id_aluno, edital, status, valor, inicio, fim, justificativa, relatoriofinal, nbanco, agencia, contacorrente) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 59097)
-- Dependencies: 209
-- Data for Name: auxilio_mes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auxilio_mes (id, id_auxilio, id_mes, pagar) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 59105)
-- Dependencies: 212
-- Data for Name: ch_limite; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ch_limite (id, nome, ch, id_curso) FROM stdin;
1	Participação em eventos técnicos, científicos, acadêmicos, culturais, artísticos e esportivos-Externos ao GCI	60	6014
5	Apresentação de trabalhos em feiras, congressos, mostras, seminários e outros.	60	6014
6	Intérprete de línguas em eventos institucionais e outros	60	6014
7	Participação em programa de iniciação a docência.	60	6014
9	Cursos e minicursos. Externos ao GCI 	60	6014
3	Participação em comissão organizadora de eventos institucionais e outros-Externos ao GCI	60	6014
12	Participação como representante de turma por um período mínimo de um semestre letivo	60	6014
13	Participação como representante discente nas instâncias da Instituição por um período mínimo de um semestre letivo	60	6014
14	Participação em órgãos e entidades estudantis, de classe, sindicais ou comunitárias.	60	6014
15	Realização de trabalho comunitário.	60	6014
16	Participação como ouvinte em defesas de trabalhos acadêmicos.	60	6014
\.


--
-- TOC entry 2712 (class 0 OID 59113)
-- Dependencies: 214
-- Data for Name: configuracao; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.configuracao (id, definicao, valor) FROM stdin;
3	Nome do Coordenador Integração Empresa-Escola	Profa. Christiane Rosa de Paiva
4	Portaria do Coordenador Integração Empresa-Escola	Portaria nº  400/2018
7	20172	21/08/2017;24/12/2017
8	20181	01/02/2018;15/07/2018
9	20182	01/08/2018;22/12/2018
10	20191	01/02/2019;15/07/2019
13	20161	28/03/2016;17/12/2016
11	Nome do Chefe do DAA	Prof(a) Maria Tâmara de Moraes Guimarães Silva
14	20192	01/08/2019;18/12/2019
12	Portaria do Chefe do DAA	1.261/2019
2	Portaria do Gerente de Pesquisa	294/2020
1	Nome do Gerente de Pesquisa	Prof. Jacques Elias de Carvalho
5	E-mail do Coordenador Integração Empresa-Escola	chris.paiva@ifg.edu.br
17	Semestre_Corrente	20201
15	20201	03/02/2020;16/07/2020
\.


--
-- TOC entry 2714 (class 0 OID 59121)
-- Dependencies: 216
-- Data for Name: conselhoaluno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conselhoaluno (id, reivindicacao, id_aluno, id_conselhoclasse, id_professor, datainclusao) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 59130)
-- Dependencies: 218
-- Data for Name: conselhoclasse; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conselhoclasse (id, assunto, dataconselho, hora) FROM stdin;
5	Coordenações de Curso	\N	\N
7	NAPNE	\N	\N
2	Acompanhamento CAPD	\N	\N
\.


--
-- TOC entry 2718 (class 0 OID 59138)
-- Dependencies: 220
-- Data for Name: conselhodisciplinas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conselhodisciplinas (id, reivindicacao, id_disciplina, id_conselhoclasse, id_professor, datainclusao) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 59147)
-- Dependencies: 222
-- Data for Name: conselhoturma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conselhoturma (id, reivindicacao, id_turma, id_conselhoclasse, id_professor, datainclusao) FROM stdin;
\.


--
-- TOC entry 2722 (class 0 OID 59156)
-- Dependencies: 224
-- Data for Name: convenio; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.convenio (id, nome, data_fim, data_inicio) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 59162)
-- Dependencies: 225
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.curso (nome, id, carga_horaria, coordenador) FROM stdin;
Técnico Integrado em Informática para Internet	140	\N	\N
Técnico Integrado em Secretaria Escolar	142	\N	\N
Técnico Subsequente em Edificações	143	\N	\N
Técnico em Edificações - EaD	257	\N	\N
Técnico em Química - EaD	256	\N	\N
Técnico em Alimentação Escolar - EaD	255	\N	\N
Técnico em Multimeios Didáticos - EaD	254	\N	\N
Técnico em Infraestrutura Escolar - EaD	253	\N	\N
Técnico em Secretaria Escolar - EaD	252	\N	\N
Licenciatura em Pedagogia	261	\N	\N
Mestrado Profissional em Educação Profissional e Tecnológica	6015	\N	\N
Técnico Integrado em Comércio Exterior	6011	\N	1014720
Técnico Integrado em Edificações	6003	\N	1374998
Técnico Integrado em Química	6005	\N	1837294
Técnico Integrado em Secretaria Escolar - Proeja	6010	\N	1657700
Técnico Integrado em Secretaria Escolar - EJA - Semestral	6016	\N	1657700
Técnico Integrado em Transporte de Cargas - EJA - Semestral	6017	\N	2789063
Técnico Integrado em Transporte de Cargas - Proeja	6008	\N	2789063
Licenciatura em Ciências Sociais	6009	\N	2847454
Licenciatura em Química	6002	\N	1650135
Bacharelado em Engenharia Civil da Mobilidade	6013	\N	1790457
Tecnologia em Logística	6001	\N	1941231
Bacharelado em Ciência da Computação	6014	\N	1324561
\.


--
-- TOC entry 2725 (class 0 OID 59170)
-- Dependencies: 227
-- Data for Name: disciplinas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.disciplinas (id, id_servidor, ch, nomedisciplina, turma, id_turma) FROM stdin;
\.


--
-- TOC entry 2727 (class 0 OID 59178)
-- Dependencies: 229
-- Data for Name: edital; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.edital (id, identificacao, ano, tipo, datainicio, datafinal, arquivo) FROM stdin;
60	CADASTRO DE PROJETO DE PESQUISA	2015	7	\N	\N	\N
62	PIBIC-EM 022/2012	2012	1	\N	\N	\N
71	PIBITI 003/2015 	2015	11	\N	\N	\N
70	PIBIC e PIBIC-Af 004/2015 	2015	16	\N	\N	\N
67	PIBIC-EM 005/2014	2014	1	\N	\N	\N
69	PIBIC-EM 005/2015 	2015	1	\N	\N	\N
63	PIBITI 006/2013	2013	11	\N	\N	\N
66	PROAPP 006/2014	2014	14	\N	\N	\N
64	CPP 021/2012 	2012	7	\N	\N	\N
65	CPP 016/2013	2013	7	\N	\N	\N
82	EDITAL 005/2016 PIBITI	2016	11	2016-08-01	2017-07-31	
80	EDITAL 007/2016 PIBIC-EM	2016	1	2016-08-01	2017-07-31	
76	Edital 06/2010 PIBIC-EM	2010	1	2010-11-15	2016-08-23	
78	Edital PIBIC-EM 07/2016	2016	1	2016-08-15	2017-07-15	
61	AUXÍLIO TEMPO INTEGRAL 2016	2015	12	\N	\N	\N
73	AUXÍLIO EJA 2016	2016	13	2016-03-28	2016-12-23	
77	Edital 07/2016 PIBIC-EM	2016	1	2016-08-15	2017-07-15	
74	AUXÍLIO EDITAL 04/2016 EaD	2016	19	2016-03-28	2016-12-23	Edital EaD.pdf
123	AUXÍLIO EDITAL 002/2016 - Permanência	2016	22	\N	\N	\N
125	AUXÍLIO EDITAL 002/2016 - Transporte	2016	22	\N	\N	\N
124	AUXÍLIO EDITAL 002/2016 - Alimentação	2016	22	\N	\N	\N
83	PIBITI 003/2014	2014	11	2014-08-01	2015-07-31	
81	EDITAL 006/2016 PIBIC 	2016	16	2016-08-01	2017-07-31	
68	PIBIC e PIBIC-Af 004/2014	2014	16	\N	\N	\N
84	EDITAL 006/2017 PIBITI	2017	11	2017-08-01	2018-07-31	edital_006_2017_proppg-ifg_pibiti.pdf
85	EDITAL 007/2017 PIBIC-Af	2017	16	2017-08-01	2018-07-31	edital_007_2017_proppg-ifg_pibic_pibic-af.pdf
86	EDITAL 008/2017 PIBIC-EM	2017	1	2017-08-01	2018-07-31	edital_008-2017_proppg-ifg_pibic-em.pdf
88	PIBIC e PIBIC-Af - Edital nº 010/2018	2018	16	2018-04-06	2019-07-31	Edital_010_2018_PROPPG-IFG_PIBIC_PIBIC-Af.pdf
87	Edital de Extensão 010/2017	2017	23	2017-08-21	2017-12-31	
89	PIBIC-EM - Edital nº 009/2018	2018	1	2018-04-06	2018-07-31	Edital_009-2018_PROPPG-IFG_PIBIC-EM.pdf
90	PIBITI - Edital nº 011/2018	2018	11	2018-04-06	2018-07-31	Edital_011_2018_PROPPG-IFG_PIBITI.pdf
91	Edital nº 004/2018 - PROEX-IFG	2018	23	2018-05-17	\N	
92	Portaria nº 516/2017 - Ações de Extensão	2017	23	2017-03-22	\N	Portaria 516 Ações de Extensão.pdf
93	EDITAL Nº 004/2018 - SUBMISSÃO DE PROJETOS DE ENSINO	2018	21	2018-08-06	2018-08-23	Edital 004 - Projeto de Ensino 2018-2.pdf
94	EDITAL Nº 001/2019 - SUBMISSÃO DE PROJETOS DE ENSINO	2019	21	2019-02-15	2019-03-15	Edital 001 - Projeto de Ensino 2019-1.pdf
126	Edital nº 20/2019/PROEN/IFG	2019	21	2019-03-29	2019-05-24	Edital nº 20-2019-PROEN-IFG - SELECAO DE PROJETOS DE ENSINO.pdf
127	Edital 008/2019 PIBIC-AF	2019	16	2019-08-01	2020-07-31	Edital nº 008-2019-PROPPG.pdf
128	Edital 008/2019 PIBIC	2019	16	2019-08-01	2020-07-31	Edital nº 008-2019-PROPPG.pdf
129	Edital 008/2019 PIBIC-EM	2019	1	2019-08-01	2020-07-31	Edital nº 008-2019-PROPPG.pdf
130	Edital 008/2019 PIBIC-EM/EJA	2019	1	2019-08-01	2020-07-31	Edital nº 008-2019-PROPPG.pdf
131	Edital 008/2019 PIBITI	2019	11	2019-08-01	2020-07-31	Edital nº 008-2019-PROPPG.pdf
133	Edital nº 03/2019/PROEX/IFG	2019	23	2019-08-05	2020-08-05	EDITAL_003_2019_PROEX_IFG cópia.pdf
134	EDITAL N°03/2019/PROEX/IFG	2019	23	2019-02-18	\N	EDITAL_003_2019_PROEX_IFG.pdf
132	EDITAL Nº 010/2019 DAA/ANÁPOLIS/IFG - SUBMISSÃO DE PROJETOS DE ENSINO	2019	24	2019-08-29	2019-12-18	EDITAL 10-2019 - ANA-CA-ANA-DAA-CP-ANAPOLI-IFG.pdf
135	EDITAL Nº 002/2020 DAA/ANÁPOLIS/IFG - SUBMISSÃO DE PROJETOS DE ENSINO	2020	24	2020-02-21	2021-02-08	EDITAL 2_2020 - ANA-DAA_CP-ANAPOLI_IFG.pdf
\.


--
-- TOC entry 2729 (class 0 OID 59186)
-- Dependencies: 231
-- Data for Name: estagio; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.estagio (id, id_servidor, datainicio, datafim, id_aluno, local, status_relatorio, cond_estagio, valor) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 59196)
-- Dependencies: 233
-- Data for Name: estagio_supervisor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.estagio_supervisor (id, curso, siape_supervisor, data_inicial, data_final) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 59035)
-- Dependencies: 196
-- Data for Name: extensao; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.extensao (id, titulo, coordenador, cargahorario, datainicio, datafim, periodicidade, horario, local, plano, id_edital, categoria, relatorio, coordenador2, nprocesso, status, area, ocorrencias) FROM stdin;
\.


--
-- TOC entry 2733 (class 0 OID 59201)
-- Dependencies: 235
-- Data for Name: extensao_alunos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.extensao_alunos (id, id_extensao, situacao, id_aluno) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 59207)
-- Dependencies: 237
-- Data for Name: extensao_ministrante; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.extensao_ministrante (id, id_extensao, id_professor) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 59212)
-- Dependencies: 239
-- Data for Name: gestao; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gestao (id, id_servidor, cargo, datainicio, datafim) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 59218)
-- Dependencies: 240
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migration (version, apply_time) FROM stdin;
m000000_000000_base	1432650854
m140608_173539_create_user_table	1432650858
m140611_133903_init_rbac	1432650859
m140808_073114_create_auth_item_group_table	1432650859
m140809_072112_insert_superadmin_to_user	1432650860
m140809_073114_insert_common_permisison_to_auth_item	1432650860
m141023_141535_create_user_visit_log	1432650860
m141116_115804_add_bind_to_ip_and_registration_ip_to_user	1432650860
m141121_194858_split_browser_and_os_column	1432650860
m141201_220516_add_email_and_email_confirmed_to_user	1432650861
m141207_001649_create_basic_user_permissions	1432650868
m160826_172021_userman	1472395797
m160912_204609_Edital	1476402316
m160920_172129_cae	1476402317
m160929_174341_estagio	1476402319
m161006_192047_Troca_nome_edital	1476402320
m161010_202619_plano	1478120572
m161025_163655_convenio	1478120574
m161025_164902_cae2	1478120574
m161031_180100_pendencia	1478120576
m161103_150656_estagio_valor	1478194951
m161104_180717_declaracao_supervisor	1478637383
m161107_173841_config	1478637385
m161109_175020_pendencia2	1478739137
m161122_184549_pendenciaview	1479894809
m161122_185219_configupdate	1479917168
m161222_164002_nucleochave	1480102320
m161109_151551_supervisordeestagio	1468989899
m161223_164002_create_profile_table	1534988577
m170101_164002_matricula_aluno	1534988578
m170930_144916_horas	1535039974
m171002_011410_conselhoclasse	1535040947
m171001_134123_horas_compl_mod	1535042233
m171002_011411_conselhoclassesec	1535246433
m171002_101411_planoTT	1537376709
m171010_211213_new_alunoHoras	1551016762
m171010_215958_aluno_perm	1551016764
m171028_160402_fk_chlimite	1551016765
m171206_125203_alunop	1551016766
\.


--
-- TOC entry 2739 (class 0 OID 59221)
-- Dependencies: 241
-- Data for Name: moodle_enroll; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.moodle_enroll (id, course, matricula, role) FROM stdin;
3001	algebra	20201060140321	\N
3002	algebra	20201060140399	\N
3003	algebra	20201060140364	\N
3004	algebra	20201060140356	\N
3005	algebra	20201060140070	\N
3006	algebra	20201060140232	\N
3007	algebra	20191060140436	\N
3008	algebra	20201060140429	\N
3009	algebra	20201060140410	\N
3010	algebra	20201060140224	\N
3011	algebra	20201060140283	\N
3012	algebra	20201060140305	\N
3013	algebra	20201060140267	\N
3014	algebra	20201060140240	\N
3015	algebra	20201060140097	\N
3016	algebra	20201060140020	\N
3017	algebra	20201060140259	\N
3018	algebra	20201060140194	\N
3019	algebra	20201060140313	\N
3020	algebra	20201060140038	\N
3021	algebra	20201060140011	\N
3022	algebra	20201060140402	\N
3023	algebra	20191060130015	\N
3024	algebra	20201060140089	\N
3025	algebra	20201060140330	\N
3026	algebra	20191060140282	\N
3027	algebra	20201060140100	\N
3028	algebra	20181060140340	\N
3029	algebra	20191060140460	\N
3030	algebra	20201060140143	\N
3031	algebra	20201060140208	\N
3032	algebra	20192060140027	\N
3033	algebra	20201060140291	\N
3034	algebra	20201060140348	\N
3035	algebra	20201060140178	\N
3036	algebra	20201060140135	\N
3037	algebra	20201060140062	\N
3038	algebra	20201060140160	\N
3039	algebra	20201060140054	\N
3040	algebra	20201060140119	\N
3041	algebra	20201060140380	\N
3042	algebra	20201060140275	\N
3043	algebra	20201060140216	\N
3044	algebra	20201060140372	\N
3045	algebra	20201060140151	\N
3046	algebra	20201060140186	\N
3047	algebra	20201060140046	\N
3048	algebra	20201060140127	\N
3049	ICC	1788576	editingteacher 
3050	ICC	20201060140321	\N
3051	ICC	20201060140399	\N
3052	ICC	20201060140364	\N
3053	ICC	20201060140356	\N
3054	ICC	20201060140070	\N
3055	ICC	20201060140232	\N
3056	ICC	20191060140436	\N
3057	ICC	20201060140429	\N
3058	ICC	20201060140410	\N
3059	ICC	20201060140224	\N
3060	ICC	20201060140283	\N
3061	ICC	20201060140305	\N
3062	ICC	20191060140304	\N
3063	ICC	20201060140267	\N
3064	ICC	20201060140240	\N
3065	ICC	20201060140097	\N
3066	ICC	20201060140020	\N
3067	ICC	20201060140259	\N
3068	ICC	20201060140194	\N
3069	ICC	20201060140313	\N
3070	ICC	20201060140038	\N
3071	ICC	20201060140011	\N
3072	ICC	20201060140402	\N
3073	ICC	20201060140089	\N
3074	ICC	20201060140330	\N
3075	ICC	20191060140282	\N
3076	ICC	20201060140100	\N
3077	ICC	20201060140143	\N
3078	ICC	20201060140208	\N
3079	ICC	20192060140027	\N
3080	ICC	20201060140291	\N
3081	ICC	20191060140398	\N
3082	ICC	20191060140363	\N
3083	ICC	20191060140169	\N
3084	ICC	20201060140348	\N
3085	ICC	20201060140178	\N
3086	ICC	20201060140135	\N
3087	ICC	20191060140339	\N
3088	ICC	20201060140062	\N
3089	ICC	20201060140160	\N
3090	ICC	20201060140054	\N
3091	ICC	20201060140119	\N
3092	ICC	20201060140380	\N
3093	ICC	20201060140275	\N
3094	ICC	20201060140216	\N
3095	ICC	20201060140372	\N
3096	ICC	20201060140151	\N
3097	ICC	20201060140186	\N
3098	ICC	20191060140290	\N
3099	ICC	20201060140046	\N
3100	ICC	20201060140127	\N
3101	Fundamentos	1650583	editingteacher 
3102	Fundamentos	20201060140321	\N
3103	Fundamentos	20201060140399	\N
3104	Fundamentos	20201060140364	\N
3105	Fundamentos	20201060140356	\N
3106	Fundamentos	20201060140070	\N
3107	Fundamentos	20201060140232	\N
3108	Fundamentos	20201060140429	\N
3109	Fundamentos	20201060140410	\N
3110	Fundamentos	20201060140224	\N
3111	Fundamentos	20191060140320	\N
3112	Fundamentos	20201060140283	\N
3113	Fundamentos	20201060140305	\N
3114	Fundamentos	20201060140267	\N
3115	Fundamentos	20171060140229	\N
3116	Fundamentos	20201060140240	\N
3117	Fundamentos	20201060140097	\N
3118	Fundamentos	20201060140020	\N
3119	Fundamentos	20201060140259	\N
3120	Fundamentos	20201060140194	\N
3121	Fundamentos	20201060140313	\N
3122	Fundamentos	20201060140038	\N
3123	Fundamentos	20201060140011	\N
3124	Fundamentos	20201060140402	\N
3125	Fundamentos	20201060140089	\N
3126	Fundamentos	20201060140330	\N
3127	Fundamentos	20191060140282	\N
3128	Fundamentos	20181060140200	\N
3129	Fundamentos	20201060140100	\N
3130	Fundamentos	20181060140340	\N
3131	Fundamentos	20191060140460	\N
3132	Fundamentos	20201060140143	\N
3133	Fundamentos	20201060140208	\N
3134	Fundamentos	20192060140027	\N
3135	Fundamentos	20201060140291	\N
3136	Fundamentos	20191060140398	\N
3137	Fundamentos	20201060140348	\N
3138	Fundamentos	20201060140178	\N
3139	Fundamentos	20201060140135	\N
3140	Fundamentos	20191060140339	\N
3141	Fundamentos	20201060140062	\N
3142	Fundamentos	20201060140160	\N
3143	Fundamentos	20201060140054	\N
3144	Fundamentos	20201060140119	\N
3145	Fundamentos	20201060140380	\N
3146	Fundamentos	20201060140275	\N
3147	Fundamentos	20201060140216	\N
3148	Fundamentos	20201060140372	\N
3149	Fundamentos	20201060140151	\N
3150	Fundamentos	20201060140186	\N
3151	Fundamentos	20201060140046	\N
3152	Fundamentos	20201060140127	\N
3153	Fisica	1657700	editingteacher 
3154	Fisica	20201060140321	\N
3155	Fisica	20201060140399	\N
3156	Fisica	20201060140364	\N
3157	Fisica	20201060140356	\N
3158	Fisica	20201060140070	\N
3159	Fisica	20201060140232	\N
3160	Fisica	20191060140436	\N
3161	Fisica	20201060140429	\N
3162	Fisica	20201060140410	\N
3163	Fisica	20201060140224	\N
3164	Fisica	20201060140283	\N
3165	Fisica	20201060140305	\N
3166	Fisica	20201060140267	\N
3167	Fisica	20201060140240	\N
3168	Fisica	20201060140097	\N
3169	Fisica	20201060140020	\N
3170	Fisica	20201060140259	\N
3171	Fisica	20201060140194	\N
3172	Fisica	20201060140313	\N
3173	Fisica	20192060140019	\N
3174	Fisica	20201060140038	\N
3175	Fisica	20201060140011	\N
3176	Fisica	20201060140402	\N
3177	Fisica	20201060140089	\N
3178	Fisica	20201060140330	\N
3179	Fisica	20191060140282	\N
3180	Fisica	20201060140100	\N
3181	Fisica	20181060140340	\N
3182	Fisica	20191060140460	\N
3183	Fisica	20201060140143	\N
3184	Fisica	20201060140208	\N
3185	Fisica	20201060140291	\N
3186	Fisica	20201060140348	\N
3187	Fisica	20201060140178	\N
3188	Fisica	20201060140135	\N
3189	Fisica	20191060140339	\N
3190	Fisica	20201060140062	\N
3191	Fisica	20201060140160	\N
3192	Fisica	20201060140054	\N
3193	Fisica	20201060140119	\N
3194	Fisica	20201060140380	\N
3195	Fisica	20201060140275	\N
3196	Fisica	20201060140216	\N
3197	Fisica	20201060140372	\N
3198	Fisica	20201060140151	\N
3199	Fisica	20201060140186	\N
3200	Fisica	20191060140290	\N
3201	Fisica	20201060140046	\N
3202	Fisica	20201060140127	\N
3203	Algoritmos	1324561	editingteacher 
3204	Algoritmos	20201060140321	\N
3205	Algoritmos	20201060140399	\N
3206	Algoritmos	20201060140364	\N
3207	Algoritmos	20201060140356	\N
3208	Algoritmos	20201060140070	\N
3209	Algoritmos	20201060140232	\N
3210	Algoritmos	20191060140436	\N
3211	Algoritmos	20201060140410	\N
3212	Algoritmos	20201060140224	\N
3213	Algoritmos	20201060140283	\N
3214	Algoritmos	20201060140305	\N
3215	Algoritmos	20201060140267	\N
3216	Algoritmos	20201060140240	\N
3217	Algoritmos	20181060140137	\N
3218	Algoritmos	20201060140097	\N
3219	Algoritmos	20201060140020	\N
3220	Algoritmos	20201060140259	\N
3221	Algoritmos	20201060140194	\N
3222	Algoritmos	20201060140313	\N
3223	Algoritmos	20201060140038	\N
3224	Algoritmos	20201060140011	\N
3225	Algoritmos	20201060140402	\N
3226	Algoritmos	20201060140089	\N
3227	Algoritmos	20201060140330	\N
3228	Algoritmos	20191060140282	\N
3229	Algoritmos	20201060140100	\N
3230	Algoritmos	20181060140340	\N
3231	Algoritmos	20191060140460	\N
3232	Algoritmos	20201060140143	\N
3233	Algoritmos	20201060140208	\N
3234	Algoritmos	20201060140291	\N
3235	Algoritmos	20191060140398	\N
3236	Algoritmos	20201060140348	\N
3237	Algoritmos	20201060140178	\N
3238	Algoritmos	20201060140135	\N
3239	Algoritmos	20191060140339	\N
3240	Algoritmos	20201060140062	\N
3241	Algoritmos	20201060140160	\N
3242	Algoritmos	20201060140054	\N
3243	Algoritmos	20201060140119	\N
3244	Algoritmos	20201060140380	\N
3245	Algoritmos	20201060140275	\N
3246	Algoritmos	20201060140216	\N
3247	Algoritmos	20201060140372	\N
3248	Algoritmos	20201060140151	\N
3249	Algoritmos	20201060140186	\N
3250	Algoritmos	20191060140290	\N
3251	Algoritmos	20201060140046	\N
3252	Algoritmos	20201060140127	\N
3253	Programacao	1949756	editingteacher 
3254	Programacao	20181060140269	\N
3255	Programacao	20201060140321	\N
3256	Programacao	20201060140399	\N
3257	Programacao	20201060140364	\N
3258	Programacao	20201060140356	\N
3259	Programacao	20201060140070	\N
3260	Programacao	20201060140232	\N
3261	Programacao	20191060140436	\N
3262	Programacao	20201060140429	\N
3263	Programacao	20201060140410	\N
3264	Programacao	20201060140224	\N
3265	Programacao	20201060140283	\N
3266	Programacao	20201060140305	\N
3267	Programacao	20191060140304	\N
3268	Programacao	20201060140267	\N
3269	Programacao	20201060140240	\N
3270	Programacao	20201060140097	\N
3271	Programacao	20201060140020	\N
3272	Programacao	20201060140259	\N
3273	Programacao	20201060140194	\N
3274	Programacao	20201060140313	\N
3275	Programacao	20201060140038	\N
3276	Programacao	20201060140011	\N
3277	Programacao	20201060140402	\N
3278	Programacao	20201060140089	\N
3279	Programacao	20201060140330	\N
3280	Programacao	20201060140100	\N
3281	Programacao	20201060140143	\N
3282	Programacao	20201060140208	\N
3283	Programacao	20192060140027	\N
3284	Programacao	20201060140291	\N
3285	Programacao	20191060140398	\N
3286	Programacao	20201060140348	\N
3287	Programacao	20201060140178	\N
3288	Programacao	20201060140135	\N
3289	Programacao	20191060140339	\N
3290	Programacao	20201060140062	\N
3291	Programacao	20201060140160	\N
3292	Programacao	20201060140054	\N
3293	Programacao	20201060140119	\N
3294	Programacao	20201060140380	\N
3295	Programacao	20201060140275	\N
3296	Programacao	20201060140216	\N
3297	Programacao	20201060140372	\N
3298	Programacao	20201060140151	\N
3299	Programacao	20201060140186	\N
3300	Programacao	20191060140290	\N
3301	Programacao	20201060140046	\N
3302	Programacao	20201060140127	\N
3303	ARQUITETURAI	1788576	editingteacher 
3304	ARQUITETURAI	20191060140142	\N
3305	ARQUITETURAI	20181060140269	\N
3306	ARQUITETURAI	20191060140428	\N
3307	ARQUITETURAI	20191060140061	\N
3308	ARQUITETURAI	20181060140234	\N
3309	ARQUITETURAI	20191060140037	\N
3310	ARQUITETURAI	20181060140056	\N
3311	ARQUITETURAI	20191060140118	\N
3312	ARQUITETURAI	20191060140193	\N
3313	ARQUITETURAI	20191060140320	\N
3314	ARQUITETURAI	20191060140380	\N
3315	ARQUITETURAI	20191060140304	\N
3316	ARQUITETURAI	20191060140401	\N
3317	ARQUITETURAI	20181060140293	\N
3318	ARQUITETURAI	20182060140011	\N
3319	ARQUITETURAI	20181060140218	\N
3320	ARQUITETURAI	20191060140045	\N
3321	ARQUITETURAI	20191060140096	\N
3322	ARQUITETURAI	20171060140180	\N
3323	ARQUITETURAI	20191060140207	\N
3324	ARQUITETURAI	20181060140200	\N
3325	ARQUITETURAI	20181060140331	\N
3326	ARQUITETURAI	20181060140145	\N
3327	ARQUITETURAI	20171060140300	\N
3328	ARQUITETURAI	20191060140169	\N
3329	ARQUITETURAI	20181060140366	\N
3330	ARQUITETURAI	20181060140226	\N
3331	ARQUITETURAI	20191060140215	\N
3332	ARQUITETURAI	20191060140185	\N
3333	ARQUITETURAI	20191060140355	\N
3334	ARQUITETURAI	20191060140100	\N
3335	ARQUITETURAI	20171060140130	\N
3336	ARQUITETURAI	20181060140021	\N
3337	ARQUITETURAI	20161060140060	\N
3338	ARQUITETURAI	20191060140231	\N
3339	Engenharia	1949756	editingteacher 
3340	Engenharia	20191060140142	\N
3341	Engenharia	20181060140269	\N
3342	Engenharia	20191060140061	\N
3343	Engenharia	20191060140037	\N
3344	Engenharia	20191060140118	\N
3345	Engenharia	20191060140193	\N
3346	Engenharia	20191060140304	\N
3347	Engenharia	20191060140401	\N
3348	Engenharia	20181060140293	\N
3349	Engenharia	20182060140011	\N
3350	Engenharia	20181060140218	\N
3351	Engenharia	20191060140045	\N
3352	Engenharia	20191060140096	\N
3353	Engenharia	20191060140207	\N
3354	Engenharia	20181060140200	\N
3355	Engenharia	20192060140027	\N
3356	Engenharia	20181060140331	\N
3357	Engenharia	20191060140398	\N
3358	Engenharia	20181060140145	\N
3359	Engenharia	20161060140213	\N
3360	Engenharia	20191060140363	\N
3361	Engenharia	20161060140140	\N
3362	Engenharia	20171060140300	\N
3363	Engenharia	20181060140366	\N
3364	Engenharia	20181060140226	\N
3365	Engenharia	20181060140315	\N
3366	Engenharia	20171060140083	\N
3367	Engenharia	20191060140185	\N
3368	Engenharia	20191060140100	\N
3369	Engenharia	20171060140130	\N
3370	Engenharia	20171060140121	\N
3371	Engenharia	20191060140231	\N
3373	edII	20191060140142	\N
3374	edII	20191060140061	\N
3375	edII	20191060140037	\N
3376	edII	20191060140118	\N
3377	edII	20191060140193	\N
3378	edII	20191060140380	\N
3379	edII	20191060140401	\N
3380	edII	20181060140293	\N
3381	edII	20171060140229	\N
3382	edII	20182060140011	\N
3383	edII	20181060140218	\N
3384	edII	20191060140045	\N
3385	edII	20191060140096	\N
3386	edII	20171060140180	\N
3387	edII	20191060140207	\N
3388	edII	20181060140200	\N
3389	edII	20181060140331	\N
3390	edII	20171060140300	\N
3391	edII	20181060140226	\N
3392	edII	20191060140185	\N
3393	edII	20191060140100	\N
3394	CALCULOII	3194852	editingteacher 
3395	CALCULOII	20191060140142	\N
3396	CALCULOII	20191060140061	\N
3397	CALCULOII	20191060140037	\N
3398	CALCULOII	20191060140118	\N
3399	CALCULOII	20191060140193	\N
3400	CALCULOII	20191060140380	\N
3401	CALCULOII	20191060140401	\N
3402	CALCULOII	20181060140293	\N
3403	CALCULOII	20181060140137	\N
3404	CALCULOII	20182060140011	\N
3405	CALCULOII	20181060140218	\N
3406	CALCULOII	20191060140045	\N
3407	CALCULOII	20191060140096	\N
3408	CALCULOII	20181060140331	\N
3409	CALCULOII	20181060140145	\N
3410	CALCULOII	20181060140226	\N
3411	CALCULOII	20191060140355	\N
3412	CALCULOII	20191060140100	\N
3413	CALCULOII	20161060140060	\N
3414	CALCULOII	20191060140231	\N
3415	IHM	1872739	editingteacher 
3416	IHM	20191060140142	\N
3417	IHM	20191060140428	\N
3418	IHM	20191060140061	\N
3419	IHM	20191060140037	\N
3420	IHM	20191060140118	\N
3421	IHM	20191060140193	\N
3422	IHM	20191060140380	\N
3423	IHM	20191060140401	\N
3424	IHM	20181060140293	\N
3425	IHM	20192060140019	\N
3426	IHM	20182060140011	\N
3427	IHM	20181060140218	\N
3428	IHM	20191060140045	\N
3429	IHM	20191060140096	\N
3430	IHM	20171060140180	\N
3431	IHM	20191060140207	\N
3432	IHM	20181060140340	\N
3433	IHM	20191060140460	\N
3434	IHM	20181060140331	\N
3435	IHM	20191060140371	\N
3436	IHM	20181060140366	\N
3437	IHM	20181060140226	\N
3438	IHM	20191060140215	\N
3439	IHM	20181060140315	\N
3440	IHM	20191060140185	\N
3441	IHM	20191060140070	\N
3442	IHM	20191060140100	\N
3443	IHM	20191060140029	\N
3444	IHM	20171060140130	\N
3445	IHM	20181060140021	\N
3446	IHM	20191060140223	\N
3447	IHM	20191060140231	\N
3448	PWEB	1872739	editingteacher 
3449	PWEB	20191060140142	\N
3450	PWEB	20191060140061	\N
3451	PWEB	20191060140037	\N
3452	PWEB	20191060140118	\N
3453	PWEB	20191060140193	\N
3454	PWEB	20191060140304	\N
3455	PWEB	20191060140401	\N
3456	PWEB	20181060140293	\N
3457	PWEB	20161060140078	\N
3458	PWEB	20182060140011	\N
3459	PWEB	20181060140218	\N
3460	PWEB	20191060140045	\N
3461	PWEB	20191060140096	\N
3462	PWEB	20191060140207	\N
3463	PWEB	20181060140064	\N
3464	PWEB	20181060140331	\N
3465	PWEB	20181060140048	\N
3466	PWEB	20161060140213	\N
3467	PWEB	20191060140363	\N
3468	PWEB	20171060140300	\N
3469	PWEB	20181060140226	\N
3470	PWEB	20191060140215	\N
3471	PWEB	20191060140185	\N
3472	PWEB	20191060140100	\N
3473	PWEB	20171060140105	\N
3474	PWEB	20191060140029	\N
3475	PWEB	20171060140130	\N
3476	PWEB	20181060140021	\N
3477	PWEB	20161060140060	\N
3478	PWEB	20171060140121	\N
3479	PWEB	20191060140231	\N
3480	Metodologia	1324561	editingteacher 
3481	Metodologia	20191060140142	\N
3482	Metodologia	20181060140269	\N
3483	Metodologia	20191060140428	\N
3484	Metodologia	20191060140061	\N
3485	Metodologia	20181060140234	\N
3486	Metodologia	20191060140037	\N
3487	Metodologia	20181060140056	\N
3488	Metodologia	20181060140080	\N
3489	Metodologia	20161060140159	\N
3490	Metodologia	20191060140118	\N
3491	Metodologia	20191060140193	\N
3492	Metodologia	20191060140320	\N
3493	Metodologia	20191060140304	\N
3494	Metodologia	20191060140401	\N
3495	Metodologia	20181060140188	\N
3496	Metodologia	20181060140293	\N
3497	Metodologia	20181060140161	\N
3498	Metodologia	20171060140229	\N
3499	Metodologia	20181060140137	\N
3500	Metodologia	20182060140011	\N
3501	Metodologia	20181060140218	\N
3502	Metodologia	20191060140045	\N
3503	Metodologia	20181060140129	\N
3504	Metodologia	20191060140096	\N
3505	Metodologia	20171060140180	\N
3506	Metodologia	20191060140207	\N
3507	Metodologia	20181060140064	\N
3508	Metodologia	20181060140331	\N
3509	Metodologia	20181060140048	\N
3510	Metodologia	20181060140145	\N
3511	Metodologia	20161060140213	\N
3512	Metodologia	20191060140363	\N
3513	Metodologia	20191060140169	\N
3514	Metodologia	20181060140226	\N
3515	Metodologia	20191060140185	\N
3516	Metodologia	20191060140100	\N
3517	Metodologia	20171060140105	\N
3518	Metodologia	20191060140290	\N
3519	Metodologia	20161060140060	\N
3520	Metodologia	20191060140223	\N
3521	Metodologia	20171060140121	\N
3522	Metodologia	20191060140231	\N
3523	PDI	1788576	editingteacher 
3524	PDI	20181060140234	\N
3525	PDI	20181060140056	\N
3526	PDI	20181060140080	\N
3527	PDI	20181060140188	\N
3528	PDI	20181060140161	\N
3529	PDI	20181060140129	\N
3530	PDI	20181060140064	\N
3531	PDI	20181060140048	\N
3532	mobile	1949756	editingteacher 
3533	mobile	20181060140080	\N
3534	mobile	20161060140159	\N
3535	mobile	20181060140188	\N
3536	mobile	20181060140161	\N
3537	mobile	20161060140116	\N
3538	mobile	20181060140129	\N
3539	mobile	20171060140180	\N
3540	mobile	20161060140140	\N
3541	SO	1788576	editingteacher 
3542	SO	20181060140234	\N
3543	SO	20181060140056	\N
3544	SO	20181060140080	\N
3545	SO	20181060140188	\N
3546	SO	20181060140161	\N
3547	SO	20161060140078	\N
3548	SO	20181060140129	\N
3549	SO	20181060140064	\N
3550	SO	20181060140048	\N
3551	SO	20161060140213	\N
3552	SO	20161060140140	\N
3553	SO	20161060140060	\N
3554	Estatistica	1875022	editingteacher 
3555	Estatistica	20181060140080	\N
3556	Estatistica	20181060140188	\N
3557	Estatistica	20181060140161	\N
3558	Estatistica	20171060140229	\N
3559	Estatistica	20161060140078	\N
3560	Estatistica	20181060140129	\N
3561	Estatistica	20181060140064	\N
3562	Estatistica	20181060140048	\N
3563	Estatistica	20171060140105	\N
3564	Estatistica	20171060140121	\N
3565	Estatistica	20201060140224	\N
3566	Estatistica	20201060140283	\N
3567	Estatistica	20201060140305	\N
3568	Estatistica	20191060140304	\N
3569	Estatistica	20201060140267	\N
3570	Estatistica	20201060140240	\N
3571	Estatistica	20201060140097	\N
3572	Estatistica	20201060140020	\N
3573	Estatistica	20201060140259	\N
3574	Estatistica	20201060140194	\N
3575	Estatistica	20201060140313	\N
3576	Estatistica	20201060140038	\N
3577	Estatistica	20201060140011	\N
3578	Estatistica	20201060140402	\N
3579	Estatistica	20201060140089	\N
3580	Estatistica	20201060140330	\N
3581	Estatistica	20201060140100	\N
3582	Estatistica	20201060140143	\N
3583	Estatistica	20201060140208	\N
3584	Estatistica	20192060140027	\N
3585	Estatistica	20201060140291	\N
3586	Estatistica	20191060140398	\N
3587	Estatistica	20201060140348	\N
3588	Estatistica	20201060140178	\N
3589	Estatistica	20201060140135	\N
3590	Estatistica	20191060140339	\N
3591	Estatistica	20201060140062	\N
3592	Estatistica	20201060140160	\N
3593	Estatistica	20201060140054	\N
3594	Estatistica	20201060140119	\N
3595	Estatistica	20201060140380	\N
3596	Estatistica	20201060140275	\N
3597	Estatistica	20201060140216	\N
3598	Estatistica	20201060140372	\N
3599	Estatistica	20201060140151	\N
3600	Estatistica	20201060140186	\N
3601	Estatistica	20191060140290	\N
3602	Estatistica	20201060140046	\N
3603	Estatistica	20201060140127	\N
3604	TG	1497734	editingteacher 
3605	TG	20181060140188	\N
3606	TG	20181060140161	\N
3607	TG	20171060140229	\N
3608	TG	20181060140137	\N
3609	TG	20181060140064	\N
3610	TG	20181060140048	\N
3611	BDII	1872739	editingteacher 
3612	BDII	20171060140067	\N
3613	BDII	20171060140180	\N
3614	BDII	20171060140300	\N
3615	BDII	20181060140366	\N
3616	BDII	20171060140083	\N
3617	BDII	20171060140105	\N
3618	BDII	20181060140021	\N
3619	BDII	20171060140121	\N
3620	compiladores	1872739	editingteacher 
3621	compiladores	20171060140067	\N
3622	compiladores	20161060140043	\N
3623	compiladores	20171060140083	\N
3624	compiladores	20171060140105	\N
3625	Datamining	1324561	editingteacher 
3626	Datamining	20171060140067	\N
3627	Datamining	20161060140310	\N
3628	Datamining	20161060140043	\N
3629	Datamining	20161060140078	\N
3630	Datamining	20161060140116	\N
3631	Datamining	20171060140083	\N
3632	Datamining	20171060140105	\N
3633	tcc1	1324561	editingteacher 
3634	tcc1	20171060140067	\N
3635	tcc1	20161060140140	\N
3636	tcc1	20171060140083	\N
3637	tcc1	20171060140105	\N
3639	PAA	20181060140234	\N
3640	PAA	20181060140056	\N
3641	PAA	20161060140159	\N
3642	PAA	20181060140188	\N
3643	PAA	20181060140161	\N
3644	PAA	20171060140229	\N
3645	PAA	20181060140137	\N
3646	PAA	20181060140129	\N
3647	PAA	20181060140064	\N
3648	PAA	20181060140331	\N
3649	PAA	20181060140048	\N
3650	PAA	20161060140213	\N
3651	PAA	20161060140140	\N
3652	PAA	20171060140300	\N
3653	PAA	20191060140215	\N
3654	PAA	20181060140315	\N
3655	PAA	20191060140070	\N
3656	PAA	20191060140029	\N
3657	PAA	20171060140130	\N
3658	PAA	20181060140021	\N
3659	PAA	20161060140060	\N
3372	edII	3165623	editingteacher 
3638	PAA	3165623	editingteacher 
3000	﻿algebra	3090264	editingteacher 
\.


--
-- TOC entry 2741 (class 0 OID 59229)
-- Dependencies: 243
-- Data for Name: nucleo_aluno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nucleo_aluno (id, id_nucleodepesquisa, id_aluno) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 59234)
-- Dependencies: 245
-- Data for Name: nucleo_professores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nucleo_professores (id_nucleodepesquisa, id_professores, id, status, inclusao, exclusao) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 59249)
-- Dependencies: 249
-- Data for Name: nucleodepesquisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nucleodepesquisa (nomedonucleo, datadeinicio, id, coordenador, id_areacapes, id_subarea, vicelider, projeto) FROM stdin;
\.


--
-- TOC entry 2745 (class 0 OID 59241)
-- Dependencies: 247
-- Data for Name: nucleorelatorio; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nucleorelatorio (id, idnucleo, dataprevista, dataentrega, relatorio) FROM stdin;
\.


--
-- TOC entry 2749 (class 0 OID 59257)
-- Dependencies: 251
-- Data for Name: pesquisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pesquisa (id, titulo, id_edital, orientador, datainicio, datafinal, patente, status, area, edital, arquivo, ocorrencias, coorientador, nprocesso) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 59263)
-- Dependencies: 252
-- Data for Name: pesquisa_aluno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pesquisa_aluno (id, id_pesquisa, id_aluno, status, valorbolsa, categoria) FROM stdin;
\.


--
-- TOC entry 2752 (class 0 OID 59268)
-- Dependencies: 254
-- Data for Name: pesquisa_coorientador; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pesquisa_coorientador (id, id_pesquisa, id_coorientador) FROM stdin;
\.


--
-- TOC entry 2755 (class 0 OID 59275)
-- Dependencies: 257
-- Data for Name: pesquisa_relatorio; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pesquisa_relatorio (id, id_pesquisa, tipo, dataprevista, dataentrega, relatorio) FROM stdin;
\.


--
-- TOC entry 2757 (class 0 OID 59283)
-- Dependencies: 259
-- Data for Name: plano_de_trab; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.plano_de_trab (id, siape_fk, inicio_data, final_data, tipo_fk, status, arquivo, observacao, respostadaa) FROM stdin;
\.


--
-- TOC entry 2759 (class 0 OID 59291)
-- Dependencies: 261
-- Data for Name: professor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.professor (nome, cpf, telefone, email, rg, area, tipo, siape, regime) FROM stdin;
\.


--
-- TOC entry 2760 (class 0 OID 59297)
-- Dependencies: 262
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.profile (id, user_id, category_id, name, cpf) FROM stdin;
\.


--
-- TOC entry 2762 (class 0 OID 59305)
-- Dependencies: 264
-- Data for Name: subareacapes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subareacapes (numero, id_area, nome) FROM stdin;
10101004	10100008	ALGEBRA
10101012	10100008	CONJUNTOS
10101020	10100008	LÓGICA MATEMÁTICA
10101039	10100008	TEORIA DOS NÚMEROS
10101047	10100008	GRUPO DE ÁLGEBRA NÃO-COMUTATIVA
10101055	10100008	ÁLGEBRA COMUTATIVA
10101063	10100008	GEOMETRIA ALGÉBRICA
10102000	10100008	ANÁLISE
10102019	10100008	ANÁLISE COMPLEXA
10102027	10100008	ANÁLISE FUNCIONAL
10102035	10100008	ANÁLISE FUNCIONAL NÃO-LINEAR
10102043	10100008	EQUAÇÕES DIFERENCIAIS ORDINÁRIAS
10102051	10100008	EQUAÇÕES DIFERENCIAIS PARCIAIS
10102060	10100008	EQUAÇÕES DIFERENCIAIS FUNCIONAIS
10103007	10100008	GEOMETRIA E TOPOLOGIA
10103015	10100008	GEOMETRIA DIFERÊNCIAL
10103023	10100008	TOPOLOGIA ALGÉBRICA
10103031	10100008	TOPOLOGIA DAS VARIEDADES
10103040	10100008	SISTEMAS DINÂMICOS
10103058	10100008	TEORIA DAS SINGULARIDADES E TEORIA DAS CATÁSTROFES
10103066	10100008	TEORIA DAS FOLHEAÇÕES
10104003	10100008	MATEMÁTICA APLICADA
10104011	10100008	FÍSICA MATEMÁTICA
10104020	10100008	ANÁLISE NUMÉRICA
10104038	10100008	MATEMÁTICA DISCRETA E COMBINATÓRIA
10201017	10200002	TEORIA GERAL E FUNDAMENTOS DA PROBABILIDADE
10201025	10200002	TEORIA GERAL E PROCESSOS ESTOCÁSTICOS
10201033	10200002	TEOREMAS DE LIMITE
10201041	10200002	PROCESSOS MARKOVIANOS
10201050	10200002	ANÁLISE ESTOCÁSTICA
10201068	10200002	PROCESSOS ESTOCÁSTICOS ESPECIAIS
10202005	10200002	ESTATÍSTICA
10202013	10200002	FUNDAMENTOS DA ESTATÍSTICA
10202021	10200002	INFERÊNCIA PARAMÉTRICA
10202030	10200002	INFERÊNCIA NÃO-PARAMÉTRICA
10202048	10200002	INFERÊNCIA EM PROCESSOS ESTOCÁSTICOS
10202056	10200002	ANÁLISE MULTIVARIADA
10202064	10200002	REGRESSÃO E CORRELAÇÃO
10202072	10200002	PLANEJAMENTO DE EXPERIMENTOS
10202080	10200002	ANÁLISE DE DADOS
10203001	10200002	PROBABILIDADE E ESTATÍSTICA APLICADAS
10301003	10300007	TEORIA DA COMPUTAÇÃO
10301011	10300007	COMPUTABILIDADE E MODELOS DE COMPUTAÇÃO
10301020	10300007	LINGUAGEM FORMAIS E AUTÔMATOS
10301038	10300007	ANÁLISE DE ALGORÍTMOS E COMPLEXIDADE DE COMPUTAÇÃO
10301046	10300007	LÓGICAS E SEMÂNTICA DE PROGRAMAS
10302000	10300007	MATEMÁTICA DA COMPUTAÇÃO
10302018	10300007	MATEMÁTICA SIMBÓLICA
10302026	10300007	MODELOS ANALÍTICOS E DE SIMULAÇÃO
10303006	10300007	METODOLOGIA E TÉCNICAS DA COMPUTAÇÃO
10303014	10300007	LINGUAGENS DE PROGRAMAÇÃO
10303022	10300007	ENGENHARIA DE SOFTWARE
10303030	10300007	BANCO DE DADOS
10303049	10300007	SISTEMAS DE INFORMAÇÃO
10303057	10300007	PROCESSAMENTO GRÁFICO (GRAPHICS)
10304002	10300007	SISTEMA DE COMPUTAÇÃO
10304010	10300007	HARDWARE
10304029	10300007	ARQUITETURA DE SISTEMAS DE COMPUTAÇÃO
10304037	10300007	SOFTWARE BÁSICO
10304045	10300007	TELEINFORMÁTICA
10401008	10400001	ASTRONOMIA DE POSIÇÃO E MECÂNICA CELESTE
10401016	10400001	ASTRONOMIA FUNDAMENTAL
10401024	10400001	ASTRONOMIA DINÂMICA
10402004	10400001	ASTROFÍSICA ESTELAR
10403000	10400001	ASTROFÍSICA DO MEIO INTERESTELAR
10403019	10400001	MEIO INTERESTELAR
10403027	10400001	NEBULOSA
10404007	10400001	ASTROFÍSICA EXTRAGALÁTICA
10404015	10400001	GALÁXIAS
10404023	10400001	AGLOMERADOS DE GALÁXIAS
10404031	10400001	QUASARES
10404040	10400001	COSMOLOGIA
10405003	10400001	ASTROFÍSICA DO SISTEMA SOLAR
10405011	10400001	FÍSICA SOLAR
10405020	10400001	MOVIMENTO DA TERRA
10405038	10400001	SISTEMA PLANETÁRIO
10406000	10400001	INSTRUMENTAÇÃO ASTRONÔMICA
10406018	10400001	ASTRONOMIA ÓTICA
10406026	10400001	RADIOASTRONOMIA
10406034	10400001	ASTRONOMIA ESPACIAL
10406042	10400001	PROCESSAMENTO DE DADOS ASTRONÔMICOS
10501002	10500006	FÍSICA GERAL
10501010	10500006	MÉTODOS MATEMÁTICOS DA FÍSICA
10501029	10500006	FÍSICA CLÁSSICA E FÍSICA QUÂNTICA; MECÂNICA E CAMPOS
10501037	10500006	RELATIVIDADE E GRAVITAÇÃO
10501045	10500006	FÍSICA ESTATÍSTICA E TERMODINÂMICA
10501053	10500006	METROLOGIA, TECN. GER. DE LAB. E SIST. DE INSTRUMENTAÇÃO
10501061	10500006	INSTRUMENTAÇÃO ESPECÍFICA DE USO GERAL EM FÍSICA
10502009	10500006	ÁREAS CLÁSSICAS DE FENOMENOLOGIA E SUAS APLICAÇÕES
10502017	10500006	ELETRICIDADE E MAGNETISMO; CAMPOS E PARTÍCULAS CARREGADAS
10502025	10500006	ÓTICA
10502033	10500006	ACÚSTICA
10502041	10500006	TRANSFERÊNCIA DE CALOR; PROCESSOS TÉRMICOS E TERMODINÂMICOS
10502050	10500006	MECÂNICA, ELASTICIDADE E REOLOGIA
10502068	10500006	DINÂMICA DOS FLUIDOS
10503005	10500006	FÍSICA DAS PARTÍCULAS ELEMENTARES E CAMPOS
10503013	10500006	TEORIA GERAL DE PARTÍCULAS E CAMPOS
10503021	10500006	TEOR.ESP.E MOD.DE INTERAÇÃO; SIST.DE PARTÍCULAS; R.CÓSMICOS
10503030	10500006	REAÇÕES ESPECÍFICAS E FENOMIOLOGIA DE PARTÍCULAS
10503048	10500006	PROPRIEDADES DE PARTÍCULAS ESPECÍFICAS E RESSONÂNCIAS
10504001	10500006	FÍSICA NUCLEAR
10504010	10500006	ESTRUTURA NUCLEAR
10504028	10500006	DESINTEGRAÇÃO NUCLEAR E RADIOATIVIDADE
10504036	10500006	REAÇÕES NUCLEARES E ESPALHAMENTO GERAL
10504044	10500006	REAÇÕES NUCLEARES E ESPALHAMENTO (REAÇÕES ESPECÍFICAS)
10504052	10500006	PROPRIEDADES DE NÚCLEOS ESPECÍFICOS
10504060	10500006	MET.EXPER.E INSTRUMENT.PARA PART.ELEMENT.E FÍSICA NUCLEAR
10505008	10500006	FÍSICA ATÔMICA E MOLECULAR
10505016	10500006	ESTRUTURA ELETRÔNICA DE ÁTOMOS E MOLÉCULAS; TEORIA
10505024	10500006	ESPECTROS ATÔMICOS E INTEGRAÇÃO DE FÓTONS
10505032	10500006	ESPECTROS MOLECUL. E INTERAÇÕES DE FÓTONS COM MOLÉCULAS
10505040	10500006	PROCESSOS DE COLISÃO E INTERAÇÕES DE ÁTOMOS E MOLÉCULAS
10505059	10500006	INF.SOB.ATOM.E MOL.OBIT.EXPERIMENTALMENTE; INST.E TÉCNICAS
10505067	10500006	ESTUDOS DE ÁTOMOS E MOLÉCULAS ESPECIAIS
10506004	10500006	FÍSICA DOS FLÚIDOS, FÍSICA DE PLASMAS E DESCARGAS ELÉTRICAS
20203004	20200005	GENÉTICA VEGETAL
10506012	10500006	CINÉTICA E TEOR.DE TRANSP.DE FLÚIDOS; PROPRIED.FIS.DE GASES
10506020	10500006	FÍSICA DE PLASMAS E DESCARGAS ELÉTRICAS
10507000	10500006	FÍSICA DA MATÉRIA CONDENSADA
10507019	10500006	ESTRUTURA DE LÍQUIDOS E SÓLIDOS; CRISTALOGRAFIA
10507027	10500006	PROPRIEDADES MECÂNICAS E ACÚSTICAS DA MATÉRIA CONDENSADA
10507035	10500006	DINÂMICA DA REDE E ESTATÍSTICA DE CRISTAIS
10507043	10500006	EQUAÇÃO DE ESTADO, EQUILIB. DE FASES E TRANSIÇÕES DE FASES
10507051	10500006	PROPRIEDADES TÉRMICAS DA MATÉRIA CONDENSADA
10507060	10500006	PROPRIEDADES DE TRANSP.DE MATÉRIA COND. (NÃO ELETRÔNICAS)
10507078	10500006	CAMPOS QUÂNTICOS E SÓLIDOS, HÉLIO, LÍQUIDO, SÓLIDO
10507086	10500006	SUPERFÍCIES E INTERFACES; PELÍCULAS E FILAMENTOS
10507094	10500006	ESTADOS ELETRÔNICOS
10507108	10500006	TRANSP.ELETR.E PROPR.ELET.DE SUPERFÍCIES; INTERF.E PELÍCULAS
10507116	10500006	ESTRUT.ELETR.E PROPR.ELET.DE SUPERFÍCIES; INTERF.E PELÍCULAS
10507124	10500006	SUPERCONDUTIVIDADE
10507132	10500006	MATERIAIS MAGNÉTICOS E PROPRIEDADES MAGNÉTICAS
10507140	10500006	RESS.MAGN. REL.MAT.COND.; EFEIT.MOSBAUER; CORR.ANG.PERTUBADA
10507159	10500006	MATERIAIS DIELÉTRICOS E PROPRIEDADES DIELÉTRICAS
10507167	10500006	PROP.OTIC.E ESPEC.MATR.COND.; OUTRAS INTER.MAT.COM RAD.PART.
10507175	10500006	EMISSÃO ELETRON.E IÔNICA POR LIQ.E SÓLIDOS; FENOM.DE IMPACTO
10601007	10600000	QUÍMICA ORGÂNICA
10601015	10600000	ESTRUTURA, CONFORMAÇÃO E ESTEREOQUÍMICA
10601023	10600000	SÍNTESE ORGÂNICA
10601031	10600000	FÍSICO-QUÍMICA ORGÂNICA
10601040	10600000	FOTOQUÍMICA ORGÂNICA
10601058	10600000	QUÍMICA DOS PRODUTOS NATURAIS
10601066	10600000	EVOLUÇÃO, SISTEMÁTICA E ECOLOGIA QUÍMICA
10601074	10600000	POLÍMEROS E COLÓIDES
10602003	10600000	QUÍMICA INORGÂNICA
10602011	10600000	CAMPOS DE COORDENAÇÃO
10602020	10600000	NÃO-METAIS E SEUS COMPOSTOS
10602038	10600000	COMPOSTOS ORGANO-METÁLICOS
10602046	10600000	DETERMINAÇÃO DE ESTRUTURAS DE COMPOSTOS INORGÂNICOS
10602054	10600000	FOTO-QUÍMICA INORGÂNICA
10602062	10600000	FÍSICO QUÍMICA INORGÂNICA
10602070	10600000	QUÍMICA BIO-INORGÂNICA
10603000	10600000	FÍSICO-QUÍMICA
10603018	10600000	CINÉTICA QUÍMICA E CATALISE
10603026	10600000	ELETROQUÍMICA
10603034	10600000	ESPECTROSCOPIA
10603042	10600000	QUÍMICA DE INTERFACES
10603050	10600000	QUÍMICA DO ESTADO CONDENSADO
10603069	10600000	QUÍMICA NÚCLEAR E RADIOQUÍMICA
10603077	10600000	QUÍMICA TEÓRICA
10603085	10600000	TERMODINÂMICA QUÍMICA
10604006	10600000	QUÍMICA ANALÍTICA
10604014	10600000	SEPARAÇÃO
10604022	10600000	MÉTODOS ÓTICOS DE ANÁLISE
10604030	10600000	ELETROANALÍTICA
10604049	10600000	GRAVIMETRIA
10604057	10600000	TITIMETRIA
10604065	10600000	INSTRUMENTAÇÃO ANALÍTICA
10604073	10600000	ANÁLISE DE TRAÇOS E QUÍMICA AMBIENTAL
10700005	10700005	GEOCIÊNCIAS
10701001	10700005	GEOLOGIA
10701010	10700005	MINERALOGIA
10701028	10700005	PETROLOGIA
10701036	10700005	GEOQUÍMICA
10701044	10700005	GEOLOGIA REGIONAL
10701052	10700005	GEOTECTÔNICA
10701060	10700005	GEOCRONOLOGIA
10701079	10700005	CARTOGRAFIA GEOLÓGICA
10701087	10700005	METALOGENIA
10701095	10700005	HIDROGEOLOGIA
10701109	10700005	PROSPECÇÃO MINERAL
10701117	10700005	SEDIMENTOLOGIA
10701125	10700005	PALEONTOLOGIA ESTRATIGRÁFICA
10701133	10700005	ESTRATIGRAFIA
10701141	10700005	GEOLOGIA AMBIENTAL
10702008	10700005	GEOFÍSICA
10702016	10700005	GEOMAGNETISMO
10702024	10700005	SISMOLOGIA
10702032	10700005	GEOTERMIA E FLUXO TÉRMICO
10702040	10700005	PROPRIEDADES FÍSICAS DAS ROCHAS
10702059	10700005	GEOFÍSICA NUCLEAR
10702067	10700005	SENSORIAMENTO REMOTO
10702075	10700005	AERONOMIA
10702083	10700005	DESENVOLVIMENTO DE INSTRUMENTAÇÃO GEOFÍSICA
10702091	10700005	GEOFÍSICA APLICADA
10702105	10700005	GRAVIMETRIA
10703004	10700005	METEOROLOGIA
10703012	10700005	METEOROLOGIA DINÂMICA
10703020	10700005	METEOROLOGIA SINÓTICA
10703039	10700005	METEOROLOGIA FÍSICA
10703047	10700005	QUÍMICA DA ATMOSFERA
10703055	10700005	INSTRUMENTAÇÃO METEOROLÓGICA
10703063	10700005	CLIMATOLOGIA
10703071	10700005	MICROMETEOROLOGIA
10703080	10700005	SENSORIAMENTO REMOTO DA ATMOSFERA
10703098	10700005	METEOROLOGIA APLICADA
10704000	10700005	GEODÉSIA
10704019	10700005	GEODÉSIA FÍSICA
10704027	10700005	GEODÉSIA GEOMÉTRICA
10704035	10700005	GEODÉSIA CELESTE
10704043	10700005	FOTOGRAMETRIA
10704051	10700005	CARTOGRAFIA BÁSICA
10705007	10700005	GEOGRAFIA FÍSICA
10705015	10700005	GEOMORFOLOGIA
10705023	10700005	CLIMATOLOGIA GEOGRÁFICA
10705031	10700005	PEDOLOGIA
10705040	10700005	HIDROGEOGRAFIA
10705058	10700005	GEOECOLOGIA
10705066	10700005	FOTOGEOGRAFIA (FÍSICO-ECOLÓGICA)
10705074	10700005	GEOCARTOGRAFIA
10802002	10700005	OCEANOGRAFIA FÍSICA
10802010	10700005	VARIÁVEIS FÍSICAS DA ÁGUA DO MAR
10802029	10700005	MOVIMENTO DA ÁGUA DO MAR
10802037	10700005	ORIGEM DAS MASSAS DE ÁGUA
10802045	10700005	INTERAÇÃO DO OCEANO COM O LEITO DO MAR
10802053	10700005	INTERAÇÃO DO OCEANO COM A ATMOSFERA
10803009	10700005	OCEANOGRAFIA QUÍMICA
10803017	10700005	PROPRIEDADES QUÍMICAS DA ÁGUA DO MAR
10803025	10700005	INTER.QUÍM.-BIOL./GEOL.DAS SUBST. QUIM.DA ÁGUA DO MAR
10804005	10700005	OCEANOGRAFIA GEOLÓGICA
10804013	10700005	GEOMORFOLOGIA SUBMARINA
10804021	10700005	SEDIMENTOLOGIA MARINHA
10804030	10700005	GEOFÍSICA MARINHA
10804048	10700005	GEOQUÍMICA MARINHA
20100000	20100000	BIOLOGIA GERAL
20200005	20200005	GENÉTICA
20201001	20200005	GENÉTICA QUANTITATIVA
20202008	20200005	GENÉTICA MOLECULAR E DE MICROORGANISMOS
20204000	20200005	GENÉTICA ANIMAL
20205007	20200005	GENÉTICA HUMANA E MÉDICA
20206003	20200005	MUTAGENESE
20600003	20600003	MORFOLOGIA
20601000	20600003	CITOLOGIA E BIOLOGIA CELULAR
20602006	20600003	EMBRIOLOGIA
20603002	20600003	HISTOLOGIA
20604009	20600003	ANATOMIA
20604017	20600003	ANATOMIA HUMANA
20604025	20600003	ANATOMIA ANIMAL
20700008	20700008	FISIOLOGIA
20701004	20700008	FISIOLOGIA GERAL
20702000	20700008	FISIOLOGIA DOS ÓRGÃOS E SISTEMAS
20702019	20700008	NEUROFISIOLOGIA
20702027	20700008	FISIOLOGIA CARDIOVASCULAR
20702035	20700008	FISIOLOGIA DA RESPIRAÇÃO
20702043	20700008	FISIOLOGIA RENAL
20702051	20700008	FISIOLOGIA ENDÓCRINA
20702060	20700008	FISIOLOGIA DA DIGESTÃO
20702078	20700008	CINESIOLOGIA
20703007	20700008	FISIOLOGIA DO ESFORÇO
20704003	20700008	FISIOLOGIA COMPARADA
20800002	20800002	BIOQUÍMICA
20801009	20800002	QUÍMICA DE MACROMOLÉCULAS
20801017	20800002	PROTEÍNAS
20801025	20800002	LIPÍDEOS
20801033	20800002	GLICÍDEOS
20802005	20800002	BIOQUÍMICA DOS MICROORGANISMOS
20803001	20800002	METABOLISMO E BIOENERGÉTICA
20804008	20800002	BIOLOGIA MOLECULAR
20805004	20800002	ENZIMOLOGIA
20900007	20900007	BIOFÍSICA
20901003	20900007	BIOFÍSICA MOLECULAR
20902000	20900007	BIOFÍSICA CELULAR
20903006	20900007	BIOFÍSICA DE PROCESSOS E SISTEMAS
20904002	20900007	RADIOLOGIA E FOTOBIOLOGIA
21000000	21000000	FARMACOLOGIA
21001006	21000000	FARMACOLOGIA GERAL
21001014	21000000	FARMACOCINÉTICA
21001022	21000000	BIODISPONIBILIDADE
21002002	21000000	FARMACOLOGIA AUTONÔMICA
21003009	21000000	NEUROPSICOFARMACOLOGIA
21004005	21000000	FARMACOLOGIA CARDIORENAL
21005001	21000000	FARMACOLOGIA BIOQUIMICA E MOLECULAR
21006008	21000000	ETNOFARMACOLOGIA
21007004	21000000	TOXICOLOGIA
21008000	21000000	FARMACOLOGIA CLÍNICA
21100004	21100004	IMUNOLOGIA
21101000	21100004	IMUNOQUÍMICA
21102007	21100004	IMUNOLOGIA CELULAR
21103003	21100004	IMUNOGENÉTICA
21104000	21100004	IMUNOLOGIA APLICADA
21200009	21200009	MICROBIOLOGIA
21201005	21200009	BIOLOGIA E FISIOLOGIA DOS MICROORGANISMOS
21201013	21200009	VIROLOGIA
21201021	21200009	BACTEROLOGIA
21201030	21200009	MICOLOGIA
21202001	21200009	MICROBIOLOGIA APLICADA
21202010	21200009	MICROBIOLOGIA MÉDICA
21202028	21200009	MICROBIOLOGIA INDUSTRIAL E DE FERMENTAÇÃO
21300003	21300003	PARASITOLOGIA
21301000	21300003	PROTOZOOLOGIA DE PARASITOS
21301018	21300003	PROTOZOOLOGIA PARASITÁRIA HUMANA
21301026	21300003	PROTOZOOLOGIA PARASITÁRIA ANIMAL
21302006	21300003	HELMINTOLOGIA DE PARASITOS
21302014	21300003	HELMINTOLOGIA HUMANA
21302022	21300003	HELMINTOLOGIA ANIMAL
21303002	21300003	ENTOMOLOGIA E MALACOLOGIA DE PARASITOS E VETORES
20500009	20500009	ECOLOGIA
20501005	20500009	ECOLOGIA TEÓRICA
20502001	20500009	ECOLOGIA DE ECOSSISTEMAS
20503008	20500009	ECOLOGIA APLICADA
10800000	10800000	OCEANOGRAFIA
10801006	10800000	OCEANOGRAFIA BIOLÓGICA
10801014	10800000	INTER.ENTRE OS ORGAN.MARINHOS E OS PARÂMETROS AMBIENTAIS
20300000	20300000	BOTÂNICA
20301006	20300000	PALEOBOTÂNICA
20302002	20300000	MORFOLOGIA VEGETAL
20302010	20300000	MORFOLOGIA EXTERNA
20302029	20300000	CITOLOGIA VEGETAL
20302037	20300000	ANATOMIA VEGETAL
20302045	20300000	PALINOLOGIA
20303009	20300000	FISIOLOGIA VEGETAL
20303017	20300000	NUTRIÇÃO E CRESCIMENTO VEGETAL
20303025	20300000	REPRODUÇÃO VEGETAL
20303033	20300000	ECOFISIOLOGIA VEGETAL
20304005	20300000	TAXONOMIA VEGETAL
20304013	20300000	TAXONOMIA DE CRIPTÓGAMOS
20304021	20300000	TAXONOMIA DE FANEROGAMOS
20305001	20300000	FITOGEOGRAFIA
20306008	20300000	BOTÂNICA APLICADA
20400004	20400004	ZOOLOGIA
20401000	20400004	PALEOZOOLOGIA
20402007	20400004	MORFOLOGIA DOS GRUPOS RECENTES
20403003	20400004	FISIOLOGIA DOS GRUPOS RECENTES
20404000	20400004	COMPORTAMENTO ANIMAL
20405006	20400004	TAXONOMIA DOS GRUPOS RECENTES
20406002	20400004	ZOOLOGIA APLICADA
20406010	20400004	CONSERVAÇÃO DAS ESPÉCIES ANIMAIS
20406029	20400004	UTILIZAÇÃO DOS ANIMAIS
20406037	20400004	CONTROLE POPULACIONAL DE ANIMAIS
30100003	30100003	ENGENHARIA CIVIL
30101000	30100003	CONSTRUÇÃO CIVIL
30101018	30100003	MATERIAIS E COMPONENTES DE CONSTRUÇÃO
30101026	30100003	PROCESSOS CONSTRUTIVOS
30101034	30100003	INSTALAÇÕES PREDIAIS
30102006	30100003	ESTRUTURAS
30102014	30100003	ESTRUTURAS DE CONCRETO
30102022	30100003	ESTRUTURAS DE MADEIRAS
30102030	30100003	ESTRUTURAS METÁLICAS
30102049	30100003	MECÂNICA DAS ESTRUTURAS
30103002	30100003	GEOTÉCNICA
30103010	30100003	FUNDAÇÕES E ESCAVAÇÕES
30103029	30100003	MECÂNICAS DAS ROCHAS
30103037	30100003	MECÂNICA DOS SOLOS
30103045	30100003	OBRAS DE TERRA E ENROCAMENTO
30103053	30100003	PAVIMENTOS
30104009	30100003	ENGENHARIA HIDRÁULICA
30104017	30100003	HIDRÁULICA
30104025	30100003	HIDROLOGIA
30105005	30100003	INFRA-ESTRUTURA DE TRANSPORTES
30105013	30100003	AEROPORTOS; PROJETO E CONSTRUÇÃO
30105021	30100003	FERROVIAS; PROJETOS E CONSTRUÇÃO
30902002	30900000	FUSÃO CONTROLADA
30105030	30100003	PORTOS E VIAS NAVEGÁVEIS; PROJETO E CONSTRUÇÃO
30105048	30100003	RODOVIAS; PROJETO E CONSTRUÇÃO
30700000	30700000	ENGENHARIA SANITÁRIA
30701007	30700000	RECURSOS HÍDRICOS
30701015	30700000	PLANEJAMENTO INTEGRADO DOS RECURSOS HÍDRICOS
30701023	30700000	TECNOLOGIA E PROBLEMAS SANITÁRIOS DE IRRIGAÇÃO
30701031	30700000	ÁGUAS SUBTERRÂNEAS E POÇOS PROFUNDOS
30701040	30700000	CONTROLE DE ENCHENTES E DE BARRAGENS
30701058	30700000	SEDIMENTOLOGIA
30702003	30700000	TRATAMENTO DE ÁGUAS DE ABASTECIMENTO E RESIDUÁRIAS
30702011	30700000	QUÍMICA SANITÁRIA
30702020	30700000	PROCESSOS SIMPLIFICADOS DE TRATAMENTO DE ÁGUAS
30702038	30700000	TÉCNICAS CONVENCIONAIS DE TRATAMENTO DE ÁGUAS
30702046	30700000	TÉCNICAS AVANÇADAS DE TRATAMENTO DE ÁGUAS
30702054	30700000	ESTUDOS E CARACTERIZAÇÃO DE EFLUENTES INDUSTRIAIS
30702062	30700000	LAY OUT DE PROCESSOS INDUSTRIAIS
30702070	30700000	RESÍDUOS RADIOATIVOS
30702078	30700000	TÉCNICAS CONVENCIONAIS DE TRATAMENTO DE ÁGUAS
30703000	30700000	SANEAMENTO BÁSICO
30703018	30700000	TÉCNICAS DE ABASTECIMENTO DA ÁGUA
30703026	30700000	DRENAGEM DE ÁGUAS RESIDUÁRIAS
30703034	30700000	DRENAGEM URBANA DE ÁGUAS PLUVIAIS
30703042	30700000	RESÍDUOS SÓLIDOS, DOMÉSTICOS E INDUSTRIAIS
30703050	30700000	LIMPEZA PÚBLICA
30703069	30700000	INSTALAÇÕES HIDRÁULICO-SANITÁRIAS
30704006	30700000	SANEAMENTO AMBIENTAL
30704014	30700000	ECOLOGIA APLICADA À ENGENHARIA SANITÁRIA
30704022	30700000	MICROBIOLOGIA APLICADA E ENGENHARIA SANITÁRIA
30704030	30700000	PARASITOLOGIA APLICADA À ENGENHARIA SANITÁRIA
30704049	30700000	QUALIDADE DO AR, DAS ÁGUAS E DO SOLO
30704057	30700000	CONTROLE DA POLUIÇÃO
30704065	30700000	LEGISLAÇÃO AMBIENTAL
31000002	31000002	ENGENHARIA DE TRANSPORTES
31001009	31000002	PLANEJAMENTO DE TRANSPORTES
31001017	31000002	PLANEJAMENTO E ORGANIZAÇÃO DO SISTEMA DE TRANSPORTE
31001025	31000002	ECONOMIA DOS TRANSPORTES
31002005	31000002	VEÍCULOS E EQUIPAMENTOS DE CONTROLE
31002013	31000002	VIAS DE TRANSPORTE
31002021	31000002	VEÍCULOS DE TRANSPORTES
31002030	31000002	ESTAÇÃO DE TRANSPORTE
31002048	31000002	EQUIPAMENTOS AUXILIARES E CONTROLES
31003001	31000002	OPERAÇÕES DE TRANSPORTES
31003010	31000002	ENGENHARIA DE TRÁFEGO
31003028	31000002	CAPACIDADE DE VIAS DE TRANSPORTE
31003036	31000002	OPERAÇÃO DE SISTEMAS DE TRANSPORTE
30200008	30200008	ENGENHARIA DE MINAS
30201004	30200008	PESQUISA MINERAL
30201012	30200008	CARACTERIZAÇÃO DO MINÉRIO
30201020	30200008	DIMENSIONAMENTO DE JAZIDAS
30202000	30200008	LAVRA
30202019	30200008	LAVRA A CÉU ABERTO
30202027	30200008	LAVRA DE MINA SUBTERRÂNEA
30202035	30200008	EQUIPAMENTOS DE LAVRA
30203007	30200008	TRATAMENTO DE MINÉRIOS
30203015	30200008	MÉTODOS DE CONCENTRAÇÃO E ENRIQUECIMENTOS DE MINÉRIOS
30203023	30200008	EQUIPAMENTOS DE BENEFICIAMENTO DE MINÉRIOS
30300002	30300002	ENGENHARIA DE MATERIAIS E METALÚRGICA
30301009	30300002	INSTALAÇÕES E EQUIPAMENTOS METALÚRGICOS
30301017	30300002	INSTALAÇÕES METALÚRGICAS
30301025	30300002	EQUIPAMENTOS METALÚRGICOS
30302005	30300002	METALURGIA EXTRATIVA
30302013	30300002	AGLOMERAÇÃO
30302021	30300002	ELETROMETALURGIA
30302030	30300002	HIDROMETALURGIA
30302048	30300002	PIROMETALURGIA
30302056	30300002	TRATAMENTO DE MINÉRIOS
30303001	30300002	METALURGIA DE TRANSFORMAÇÃO
30303010	30300002	CONFORMAÇÃO MECÂNICA
30303028	30300002	FUNDIÇÃO
30303036	30300002	METALURGIA DE PÓ
30303044	30300002	RECOBRIMENTOS
30303052	30300002	SOLDAGEM
30303060	30300002	TRATAMENTO TÉRMICO, MECÂNICOS E QUÍMICOS
30303079	30300002	USINAGEM
30304008	30300002	METALURGIA FÍSICA
30304016	30300002	ESTRUTURA DOS METAIS E LIGAS
30304024	30300002	PROPRIEDADES FÍSICAS DOS METAIS E LIGAS
30304032	30300002	PROPRIEDADES MECÂNICAS DOS METAIS E LIGAS
30304040	30300002	TRANSFORMAÇÃO DE FASES
30304059	30300002	CORROSÃO
30305004	30300002	MATERIAIS NÃO-METÁLICOS
30305012	30300002	EXTRAÇÃO E TRANSFORMAÇÃO DE MATERIAIS
30305020	30300002	CERÂMICOS
30305039	30300002	MATERIAIS CONJUGADOS NÃO-METÁLICOS
30305047	30300002	POLÍMEROS,  APLICAÇÕES
30600006	30600006	ENGENHARIA QUÍMICA
30601002	30600006	PROCESSOS INDUSTRIAIS DE ENGENHARIA QUÍMICA
30601010	30600006	PROCESSOS BIOQUÍMICOS
30601029	30600006	PROCESSOS ORGÂNICOS
30601037	30600006	PROCESSOS INORGÂNICOS
30602009	30600006	OPERAÇÕES INDUSTRIAIS E EQUIPAMENTOS PARA ENG. QUÍMICA
30602017	30600006	REATORES QUÍMICOS
30602025	30600006	OPERAÇÕES CARACTERÍSTICAS DE PROCESSOS BIOQUÍMICOS
30602033	30600006	OPERAÇÕES DE SEPARAÇÃO E MISTURA
30603005	30600006	TECNOLOGIA QUÍMICA
30603013	30600006	BALANÇOS GLOBAIS DE MATÉRIA E ENERGIA
30603021	30600006	ÁGUA
30603030	30600006	ÁLCOOL
30603048	30600006	ALIMENTOS
30603056	30600006	BORRACHAS
30603064	30600006	CARVÃO
30603072	30600006	CERÂMICA
30603080	30600006	CIMENTO
30603099	30600006	COURO
30603102	30600006	DETERGENTES
30603110	30600006	FERTILIZANTES
30603129	30600006	MEDICAMENTOS
30603137	30600006	METAIS NÃO-FERROSOS
30603145	30600006	ÓLEOS
30603153	30600006	PAPEL E CELULOSE
30603161	30600006	PETRÓLEO E PETROQUÍMICA
30603170	30600006	POLÍMEROS
30603188	30600006	PRODUTOS NATURAIS
30603196	30600006	TÉXTEIS
30603200	30600006	TRATAMENTOS E APROVEITAMENTOS DE REJEITOS
30603218	30600006	XISTO
30900000	30900000	ENGENHARIA NUCLEAR
30901006	30900000	APLICAÇÕES DE RADIOISÓTOPOS
30901014	30900000	PRODUÇÃO DE RADIOISÓPOTOS
30901022	30900000	APLICAÇÕES INDUSTRIAIS DE RADIOISÓPOTOS
30901030	30900000	INSTRUMENTAÇÃO PARA MEDIDA E CONTROLE DE RADIAÇÃO
30902010	30900000	PROCESSOS INDUSTRIAIS DA FUSÃO CONTROLADA
30902029	30900000	PROBLEMAS TECNOLÓGICOS DA FUSÃO CONTROLADA
30903009	30900000	COMBUSTÍVEL NÚCLEAR
30903017	30900000	EXTRAÇÃO DE COMBUSTÍVEL NÚCLEAR
30903025	30900000	CONVERSÃO, ENRIQUECIMENTO E FABRICAÇÃO DE COMBUST. NÚCLEAR
30903033	30900000	REPROCESSAMENTO DO COMBUSTÍVEL NÚCLEAR
30903041	30900000	REJEITOS DE COMBUSTÍVEL NÚCLEAR
30904005	30900000	TECNOLOGIA DOS REATORES
30904013	30900000	NÚCLEO DO REATOR
30904021	30900000	MATERIAIS NUCLEARES E BLINDAGEM DE REATORES
30904030	30900000	TRANSFERÊNCIA DE CALOR EM REATORES
30904048	30900000	GERAÇÃO E INTEGRAÇÃO COM SISTEMAS ELÉTRICOS EM REATORES
30904056	30900000	INSTRUMENTAÇÃO PARA OPERAÇÃO E CONTROLE DE REATORES
30904064	30900000	SEGURANÇA, LOCALIZAÇÃO E LICENCIAMENTO DE REATORES
30904072	30900000	ASPECTOS ECONÔMICOS DE REATORES
30500001	30500001	ENGENHARIA MECÂNICA
30501008	30500001	FENÔMENOS DE TRANSPORTES
30501016	30500001	TRANSFERÊNCIA DE CALOR
30501024	30500001	MECÂNICA DOS FLUÍDOS
30501032	30500001	DINÂMICA DOS GASES
30501040	30500001	PRINCÍPIOS VARIACIONAIS E MÉTODOS NUMÉRICOS
30502004	30500001	ENGENHARIA TÉRMICA
30502012	30500001	TERMODINÂMICA
30502020	30500001	CONTROLE AMBIENTAL
30502039	30500001	APROVEITAMENTO DA ENERGIA
30503000	30500001	MECÂNICA DOS SÓLIDOS
30503019	30500001	MECÂNICA DOS CORPOS SÓLIDOS, ELÁSTICOS E PLÁSTICOS
30503027	30500001	DINÂMICA DOS CORPOS RÍGIDOS, ELÁSTICOS E PLÁSTICOS
30503035	30500001	ANÁLISE DE TENSÕES
30503043	30500001	TERMOELASTICIDADE
30504007	30500001	PROJETOS DE MÁQUINAS
30504015	30500001	TEORIA DOS MECANISMOS
30504023	30500001	ESTÁTICA E DINÂMICA APLICADA
30504031	30500001	ELEMENTOS DE MÁQUINAS
30504040	30500001	FUNDAMENTOS GERAIS DE PROJETOS DAS MÁQUINAS
30504058	30500001	MÁQUINAS, MOTORES E EQUIPAMENTOS
30504066	30500001	MÉTODOS DE SÍNTESE E OTIMIZAÇÃO APLICADOS AO PROJ.  MECÂNICO
30504074	30500001	CONTROLE DE SISTEMAS MECÂNICOS
30504082	30500001	APROVEITAMENTO DE ENERGIA
30505003	30500001	PROCESSOS DE FABRICAÇÃO
30505011	30500001	MATRIZES E FERRAMENTAS
30505020	30500001	MÁQUINAS DE USINAGEM E CONFORMAÇÃO
30505038	30500001	CONTROLE NUMÉRICO
30505046	30500001	ROBOTIZAÇÃO
30505054	30500001	PROCESSOS DE FABRICAÇÃO, SELEÇÃO ECONÔMICA
30800005	30800005	ENGENHARIA DE PRODUÇÃO
30801001	30800005	GERÊNCIA DE PRODUÇÃO
30801010	30800005	PLANEJAMENTO DE INSTALAÇOES INDUSTRIAIS
30801028	30800005	PLANEJAMENTO, PROJETO E CONTROLE DE SIST. DE PRODUÇÃO
30801036	30800005	HIGIENE E SEGURANÇA DO TRABALHO
30801044	30800005	SUPRIMENTOS
30801052	30800005	GARANTIA DE CONTROLE DE QUALIDADE
30802008	30800005	PESQUISA OPERACIONAL
30802016	30800005	PROCESSOS ESTOCÁSTICOS E TEORIAS DAS FILAS
30802024	30800005	PROGRAMAÇÃO LINEAR, NÃO-LINEAR, MISTA E DINÂMICA
30802032	30800005	SÉRIES TEMPORAIS
30802040	30800005	TEORIA DOS GRAFOS
30802059	30800005	TEORIA DOS JOGOS
30803004	30800005	ENGENHARIA DO PRODUTO
30803012	30800005	ERGONOMIA
30803020	30800005	METODOLOGIA DE PROJETO DO PRODUTO
30803039	30800005	PROCESSOS DE TRABALHO
30803047	30800005	GERÊNCIA DO PROJETO E DO PRODUTO
30803055	30800005	DESENVOLVIMENTO DE PRODUTO
30804000	30800005	ENGENHARIA ECONÔMICA
30804019	30800005	ESTUDO DE MERCADO
30804027	30800005	LOCALIZAÇÃO INDUSTRIAL
30804035	30800005	ANÁLISE DE CUSTOS
30804043	30800005	ECONOMIA DE TECNOLOGIA
30804051	30800005	VIDA ECONÔMICA DOS EQUIPAMENTOS
30804060	30800005	AVALIAÇÃO DE PROJETOS
31100007	31100007	ENGENHARIA NAVAL E OCEÂNICA
31101003	31100007	HIDRODINÂMICA DE NAVIOS E SISTEMAS OCEÂNICOS
31101011	31100007	RESISTÊNCIA HIDRODINÂMICA
31101020	31100007	PROPULSÃO DE NAVIOS
31102000	31100007	ESTRUTURAS NAVAIS E OCEÂNICAS
31102018	31100007	ANÁLISE TEÓRICA E EXPERIMENTAL DE ESTRUTURA
31102026	31100007	DINÂMICA ESTRUTURAL NAVAL E OCEÂNICA
31102034	31100007	SÍNTESE ESTRUTURAL NAVAL E OCEÂNICA
31103006	31100007	MÁQUINAS MARÍTIMAS
31103014	31100007	ANÁLISE DE SISTEMAS PROPULSORES
31103022	31100007	CONTROLE E AUTOMAÇÃO DE SISTEMAS PROPULSORES
31103030	31100007	EQUIPAMENTOS AUXILIARES DO SISTEMA PROPULSIVO
31103049	31100007	MOTOR DE PROPULSÃO
31104002	31100007	PROJETOS DE NAVIOS E DE SISTEMAS OCEÂNICOS
31104010	31100007	PROJETOS DE NAVIOS
31104029	31100007	PROJETOS DE SISTEMAS OCEÂNICOS FIXOS E SEMI-FIXOS
31104037	31100007	PROJETOS DE EMBARCAÇÕES NÃO-CONVENCIONAIS
31105009	31100007	TECNOLOGIA DE CONSTRUÇÃO NAVAL E DE SISTEMAS OCEÂNICOS
31105017	31100007	MÉTODOS DE FABRICAÇÃO DE NAVIOS E SISTEMAS OCEÂNICOS
31105025	31100007	SOLDAGEM DE ESTRUTURAS NAVAIS E OCEÂNICOS
31105033	31100007	CUSTOS DE CONSTRUÇÃO NAVAL
31105041	31100007	NORMATIZAÇÃO E CERTIFICAÇÃO DE QUALIDADE DE NAVIOS
31200001	31200001	ENGENHARIA AEROESPACIAL
31201008	31200001	AERODINÂMICA
31201016	31200001	AERODINÂMICA DE AERONAVES ESPACIAIS
31201024	31200001	AERODINÂMICA DOS PROCESSOS GEOFÍSICOS E INTERPLANETÁRIOS
31202004	31200001	DINÂMICA DE VÔO
31202012	31200001	TRAJETÓRIAS E ÓRBITAS
31202020	31200001	ESTABILIDADE E CONTROLE
31203000	31200001	ESTRUTURAS AEROESPACIAIS
31203019	31200001	AEROELASTICIDADE
31203027	31200001	FADIGA
31203035	31200001	PROJETOS DE ESTRUTURAS AEROESPACIAIS
31204007	31200001	MATERIAIS E PROCESSOS P/ENGENHARIA AERON. E AEROESPACIAL
31205003	31200001	PROPULSÃO AEROESPACIAL
31205011	31200001	COMBUSTÃO E ESCOAMENTO COM REAÇÕES QUÍMICAS
31205020	31200001	PROPULSÃO DE FOGUTES
31205038	31200001	MÁQUINAS DE FLUXO
31205046	31200001	MOTORES ALTERNATIVOS
31206000	31200001	SISTEMAS AEROESPACIAIS
31206018	31200001	AVIÕES
31206026	31200001	FOGUETES
31206034	31200001	HELICÓPTEROS
31206042	31200001	HOVERCRAFT
31206050	31200001	SATÉLITES E OUTROS DISPOSITIVOS AEROESPACIAIS
31206069	31200001	NORMATIZAÇÃO E CERT. DE QUAL. DE AERONAVES E COMPONENTES
31206077	31200001	MANUTENÇÃO DE SISTEMAS AEROESPACIAIS
30400007	30400007	ENGENHARIA ELÉTRICA
30401003	30400007	MATERIAIS ELÉTRICOS
30401011	30400007	MATERIAIS CONDUTORES
30401020	30400007	MATERIAIS E COMPONENTES SEMICONDUTORES
30401038	30400007	MATERIAIS E DISPOSITIVOS SUPERCONDUTORES
30401046	30400007	MATERIAIS DIELÉTRICOS, PIESOELÉTRICOS E FERROELÉTRICOS
30401054	30400007	MAT. E COMP. ELETROÓTICOS E MAGNET., MAT. FOTOELÉTRICOS
30401062	30400007	MATERIAIS E DISPOSITIVOS MAGNÉTICOS
30402000	30400007	MEDIDAS ELÉTRICAS, MAGNÉTICAS E ELETRÔNICAS; INSTRUMENTAÇÃO
30402018	30400007	MEDIDAS ELÉTRICAS
30402026	30400007	MEDIDAS MAGNÉTICAS
30402034	30400007	INSTRUMENTAÇÃO ELETROMECÂNICA
30402042	30400007	INSTRUMENTAÇÃO ELETRÔNICA
30402050	30400007	SISTEMAS ELETRÔNICOS DE MEDIDAS E DE CONTROLE
30403006	30400007	CIRCUITOS ELÉTRICOS, MAGNÉTICOS E ELETRÔNICOS
30403014	30400007	TEORIA GERAL DOS CIRCUITOS ELÉTRICOS
30403022	30400007	CIRCUITOS LINEARES E NÃO LINEARES
30403030	30400007	CIRCUITOS ELETRÔNICOS
30403049	30400007	CIRCUITOS MAGNÉTICOS, MAGNÉTISMO, ELETROMAGNÉTISMO
30404002	30400007	SISTEMAS ELÉTRICOS DE POTÊNCIA
30404010	30400007	GERAÇÃO DE ENERGIA ELÉTRICA
30404029	30400007	TRANSMISSÃO DA ENERGIA ELET., DISTRIB. DA ENERGIA ELÉTRICA
30404037	30400007	CONVERSÃO E RETIFICAÇÃO DA ENERGIA ELÉTRICA
30404045	30400007	MEDIÇÃO, CONTROLE, CORREÇÃO E PROTEÇÃO DE SIST. ELET. E POT.
30404053	30400007	MÁQUINAS ELÉTRICAS E DISPOSITIVOS DE POTÊNCIA
30404061	30400007	INSTALAÇÕES ELÉTRICAS PREDIAIS E INDUSTRIAIS
30405009	30400007	ELETRÔNICA INDUSTRIAL, SISTEMAS E CONTROLES ELETRÔNICOS
30405017	30400007	ELETRÔNICA INDUSTRIAL
30405025	30400007	AUTOMAÇÃO ELETRÔNICA DE PROCESSOS ELÉTRICOS E INDUSTRIAIS
30405033	30400007	CONTROLE DE PROCESSOS ELETRÔNICOS, RETROALIMENTAÇÃO
30406005	30400007	TELECOMUNICAÇÕES
30406013	30400007	TEORIA ELETROMAG., MICROONDAS, PROPAGAÇÃO DE ONDAS, ANTENAS
30406021	30400007	RADIONAVEGAÇÃO E RADIOASTRONOMIA
30406030	30400007	SISTEMAS DE TELECOMUNICAÇÕES
31300006	31300006	ENGENHARIA BIOMÉDICA
31301002	31300006	BIOENGENHARIA
31301010	31300006	PROCESSAMENTO DE SINAIS BIOLÓGICOS
31301029	31300006	MODELAGEM DE FENÔMENOS BIOLÓGICOS
31301037	31300006	MODELAGEM DE SISTEMAS BIOLÓGICOS
31302009	31300006	ENGENHARIA MÉDICA
31302017	31300006	BIOMATERIAIS E MATERIAIS BIOCOMPATÍVEIS
31302025	31300006	TRANSDUTORES PARA APLICAÇÕES BIOMÉDICAS
31302033	31300006	INSTRUMENTAÇÃO ODONTOLÓGICA E MÉDICO-HOSPITALAR
31302041	31300006	TECNOLOGIA DE PRÓTESES
40100006	40100006	MEDICINA
40101002	40100006	CLÍNICA MÉDICA
40101010	40100006	ANGIOLOGIA
40101029	40100006	DERMATOLOGIA
40101045	40100006	CANCEROLOGIA
40101061	40100006	ENDOCRINOLOGIA
40101100	40100006	CARDIOLOGIA
40101118	40100006	GASTROENTEROLOGIA
40101126	40100006	PNEUMOLOGIA
40101134	40100006	NEFROLOGIA
40101169	40100006	FISIATRIA
40107000	40100006	MEDICINA LEGAL E DEONTOLOGIA
40101037	40100006	ALERGOLOGIA E IMUNOLOGIA CLÍNICA
40101053	40100006	HEMATOLOGIA
40101070	40100006	NEUROLOGIA
40101088	40100006	PEDIATRIA
40101096	40100006	DOENÇAS INFECCIOSAS E PARASITÁRIAS
40101142	40100006	REUMATOLOGIA
40103005	40100006	SAÚDE MATERNO-INFANTIL
40104001	40100006	PSIQUIATRIA
40105008	40100006	ANATOMIA PATOLÓGICA E PATOLOGIA CLÍNICA
40106004	40100006	RADIOLOGIA MÉDICA
40101150	40100006	GINECOLOGIA E OBSTETRÍCIA
40101177	40100006	OFTALMOLOGIA
40101186	40100006	ORTOPEDIA
40102009	40100006	CIRURGIA
40102017	40100006	CIRURGIA PLÁSTICA E RESTAURADORA
40102025	40100006	CIRURGIA OTORRINOLARINGOLOGIA
40102033	40100006	CIRURGIA OFTALMOLÓGICA
40102041	40100006	CIRURGIA CARDIOVASCULAR
40102050	40100006	CIRURGIA TORÁXICA
40102068	40100006	CIRURGIA GASTROENTEROLOGICA
40102076	40100006	CIRURGIA PEDIÁTRICA
40102084	40100006	NEUROCIRURGIA
40102092	40100006	CIRURGIA UROLÓGICA
40102106	40100006	CIRURGIA PROCTOLÓGICA
40102114	40100006	CIRURGIA ORTOPÉDICA
40102122	40100006	CIRURGIA TRAUMATOLÓGICA
40102130	40100006	ANESTESIOLOGIA
40102149	40100006	CIRURGIA EXPERIMENTAL
40500004	40500004	NUTRIÇÃO
40501000	40500004	BIOQUÍMICA DA NUTRIÇÃO
40502007	40500004	DIETÉTICA
40503003	40500004	ANÁLISE NUTRICIONAL DE POPULAÇÃO
40504000	40500004	DESNUTRIÇÃO E DESENVOLVIMENTO FISIOLÓGICO
40200000	40200000	ODONTOLOGIA
40201007	40200000	CLÍNICA ODONTOLÓGICA
40202003	40200000	CIRURGIA BUCO-MAXILO-FACIAL
40203000	40200000	ORTODONTIA
40204006	40200000	ODONTOPEDIATRIA
40205002	40200000	PERIODONTIA
40206009	40200000	ENDODONTIA
40207005	40200000	RADIOLOGIA ODONTOLÓGICA
40208001	40200000	ODONTOLOGIA SOCIAL E PREVENTIVA
40209008	40200000	MATERIAIS ODONTOLÓGICOS
40300005	40300005	FARMÁCIA
40301001	40300005	FARMACOTECNIA
40302008	40300005	FARMACOGNOSIA
40303004	40300005	ANÁLISE TOXICOLÓGICA
40304000	40300005	ANÁLISE E CONTROLE DE MEDICAMENTOS
40305007	40300005	BROMATOLOGIA
40400000	40400000	ENFERMAGEM
40401006	40400000	ENFERMAGEM MÉDICO-CIRÚRGICA
40402002	40400000	ENFERMAGEM OBSTÉTRICA
40403009	40400000	ENFERMAGEM PEDIÁTRICA
40404005	40400000	ENFERMAGEM PSIQUIÁTRICA
40405001	40400000	ENFERMAGEM DE DOENÇAS CONTAGIOSAS
40406008	40400000	ENFERMAGEM DE SAÚDE PÚBLICA
40600009	40600009	SAÚDE COLETIVA
40601005	40600009	EPIDEMIOLOGIA
40602001	40600009	SAÚDE PÚBLICA
40603008	40600009	MEDICINA PREVENTIVA
40900002	40900002	EDUCAÇÃO FÍSICA
40700003	40700003	FONOAUDIOLOGIA
40800008	40800008	FISIOTERAPIA E TERAPIA OCUPACIONAL
50100009	50100009	AGRONOMIA
50101005	50100009	CIÊNCIA DO SOLO
50101013	50100009	GÊNESE, MORFOLOGIA E CLASSIFICAÇÃO DOS SOLOS
50101021	50100009	FÍSICA DO SOLO
50101030	50100009	QUÍMICA DO SOLO
50101048	50100009	MICROBIOLOGIA E BIOQUÍMICA DO SOLO
50101056	50100009	FERTILIDADE DO SOLO E ADUBAÇÃO
50101064	50100009	MANEJO E CONSERVAÇÃO DO SOLO
50102001	50100009	FITOSSANIDADE
50102010	50100009	FITOPATOLOGIA
50102028	50100009	ENTOMOLOGIA AGRÍCOLA
50102036	50100009	PARASITOLOGIA AGRÍCOLA
50102044	50100009	MICROBIOLOGIA AGRÍCOLA
50102052	50100009	DEFESA FITOSSANITÁRIA
50103008	50100009	FITOTECNIA
50103016	50100009	MANEJO E TRATOS CULTURAIS
50103024	50100009	MECANIZAÇÃO AGRÍCOLA
50103032	50100009	PRODUÇÃO E BENEFICIAMENTO DE SEMENTES
50103040	50100009	PRODUÇÃO DE MUDAS
50103059	50100009	MELHORAMENTO VEGETAL
50103067	50100009	FISIOLOGIA DE PLANTAS CULTIVADAS
50103075	50100009	MATOLOGIA
50104004	50100009	FLORICULTURA, PARQUES E JARDINS
50104012	50100009	FLORICULTURA
50104020	50100009	PARQUES E JARDINS
50104039	50100009	ARBORIZAÇÃO DE VIAS PÚBLICAS
50105000	50100009	AGROMETEROLOGIA
50106007	50100009	EXTENSÃO RURAL
50200003	50200003	RECURSOS FLORESTAIS E ENGENHARIA FLORESTAL
50201000	50200003	SILVICULTURA
50201018	50200003	DENDROLOGIA
50201026	50200003	FLORESTAMENTO E REFLORESTAMENTO
50201034	50200003	GENÉTICA E MELHORAMENTO FLORESTAL
50201042	50200003	SEMENTES FLORESTAIS
50201050	50200003	NUTRIÇÃO FLORESTAL
50201069	50200003	FISIOLOGIA FLORESTAL
50201077	50200003	SOLOS FLORESTAIS
50201085	50200003	PROTEÇÃO FLORESTAL
50202006	50200003	MANEJO FLORESTAL
50202014	50200003	ECONOMIA FLORESTAL
50202022	50200003	POLÍTICA E LEGISLAÇÃO FLORESTAL
50202030	50200003	ADMINISTRAÇÃO FLORESTAL
50202049	50200003	DENDROMETRIA E INVENTÁRIO FLORESTAL
50202057	50200003	FOTOINTERPRETAÇÃO FLORESTAL
50202065	50200003	ORDENAMENTO FLORESTAL
50203002	50200003	TÉCNICAS E OPERAÇÕES FLORESTAIS
50203010	50200003	EXPLORAÇÃO FLORESTAL
50203029	50200003	MECANIZAÇÃO FLORESTAL
50204009	50200003	TECNOLOGIA E UTILIZAÇÃO DE PRODUTOS FLORESTAIS
50204017	50200003	ANATOMIA E IDENTIFICAÇÃO DE PRODUTOS FLORESTAIS
50204025	50200003	PROPRIEDADES FISICO-MECÂNICAS DA MADEIRA
50204033	50200003	RELAÇÕES ÁGUA-MADEIRA E SECAGEM
50204041	50200003	TRATAMENTO DA MADEIRA
50204050	50200003	PROCESSAMENTO MECÂNICO DA MADEIRA
50204068	50200003	QUÍMICA DA MADEIRA
50204076	50200003	RESINAS DE MADEIRAS
50204084	50200003	TECNOLOGIA DE CELULOSE E PAPEL
50204092	50200003	TECNOLOGIA DE CHAPAS
50205005	50200003	CONSERVAÇÃO DA NATUREZA
50205013	50200003	HIDROLOGIA FLORESTAL
50205021	50200003	CONSERVAÇÃO DE ÁREAS SILVESTRES
50205030	50200003	CONSERVAÇÃO DAS BACIAS HIDROGRÁFICAS
50205048	50200003	RECUPERAÇÃO DE ÁREAS DEGRADADAS
50206001	50200003	ENERGIA DE BIOMASSA FLORESTAL
50300008	50300008	ENGENHARIA AGRÍCOLA
50301004	50300008	MÁQUINAS E IMPLEMENTOS AGRÍCOLAS
50302000	50300008	ENGENHARIA DE ÁGUA E SOLO
50302019	50300008	IRRIGAÇÃO E DRENAGEM
50302027	50300008	CONSERVAÇÃO DE SOLO E ÁGUA
50303007	50300008	ENGENHARIA DE PROCESSAMENTO DE PRODUTOS AGRÍCOLAS
50303015	50300008	PRÉ-PROCESSAMENTO DE PRODUTOS AGRÍCOLAS
50303023	50300008	ARMAZENAMENTO DE PRODUTOS AGRÍCOLAS
50303031	50300008	TRANSFERÊNCIA DE PRODUTOS AGRÍCOLAS
50304003	50300008	CONSTRUÇÕES RURAIS E AMBIÊNCIA
50304011	50300008	ASSENTAMENTO RURAL
50304020	50300008	ENGENHARIA DE CONSTRUÇÕES RURAIS
50304038	50300008	SANEAMENTO RURAL
50305000	50300008	ENERGIZAÇÃO RURAL
50400002	50400002	ZOOTECNIA
50401009	50400002	ECOLOGIA DOS ANIMAIS DOMÉSTICOS E ETOLOGIA
50402005	50400002	GENÉTICA E MELHORAMENTO DOS ANIMAIS DOMÉSTICOS
50403001	50400002	NUTRIÇÃO E ALIMENTAÇÃO ANIMAL
50403010	50400002	EXIGÊNCIAS NUTRICIONAIS DOS ANIMAIS
50403028	50400002	AVALIAÇÃO DE ALIMENTOS PARA ANIMAIS
50403036	50400002	CONSERVAÇÃO DE ALIMENTOS PARA ANIMAIS
50404008	50400002	PASTAGEM E FORRAGICULTURA
50404016	50400002	AVALIAÇÃO, PRODUÇÃO E CONSERVAÇÃO DE FORRAGENS
50404024	50400002	MANEJO E CONSERVAÇÃO DE PASTAGENS
50404032	50400002	FISIOLOGIA DE PLANTAS FORRAGEIRAS
50404040	50400002	MELHORAMENTO DE PLANTAS FORRAGEIRAS E PRODUÇÃO DE SEMENTES
50404059	50400002	TOXICOLOGIA E PLANTAS TÓXICAS
50405004	50400002	PRODUÇÃO ANIMAL
50405012	50400002	CRIAÇÃO DE ANIMAIS
50405020	50400002	MANEJO DE ANIMAIS
50405039	50400002	INSTALAÇÕES PARA PRODUÇÃO ANIMAL
50600001	50600001	RECURSOS PESQUEIROS E ENGENHARIA DE PESCA
50601008	50600001	RECURSOS PESQUEIROS MARINHOS
50601016	50600001	FATORES ABIÓTICOS DO MAR
50601024	50600001	AVALIAÇÃO DE ESTOQUE PESQUEIROS MARINHOS
50601032	50600001	EXPLORAÇÃO PESQUEIRA MARINHA
50601040	50600001	MANEJO E CONSERVAÇÃO DE RECURSOS PESQUEIROS MARINHOS
50602004	50600001	RECURSOS PESQUEIROS DE ÁGUAS INTERIORES
50602012	50600001	FATORES ABIÓTICOS DE ÁGUAS INTERIORES
50602020	50600001	AVALIAÇÃO DE ESTOQUES PESQUEIROS DE ÁGUAS INTERIORES
50602039	50600001	EXPLORAÇÃO PESQUEIRA DE ÁGUAS INTERIORES
50602047	50600001	MANEJO E CONSERV. DE RECURSOS PESQUEIROS DE ÁGUAS INFERIORES
50603000	50600001	AQUICULTURA
50603019	50600001	MARICULTURA
50603027	50600001	CARCINOCULTURA
50603035	50600001	OSTREICULTURA
50603043	50600001	PISCICULTURA
50604007	50600001	ENGENHARIA DE PESCA
50500007	50500007	MEDICINA VETERINÁRIA
50501003	50500007	CLÍNICA E CIRÚRGIA ANIMAL
50501011	50500007	ANESTESIOLOGIA ANIMAL
50501020	50500007	TÉCNICA CIRÚRGICA ANIMAL
50501038	50500007	RADIOLOGIA DE ANIMAIS
50501046	50500007	FARMACOLOGIA E TERAPÉUTICA ANIMAL
50501054	50500007	OBSTETRÍCIA ANIMAL
50501062	50500007	CLÍNICA VETERINÁRIA
50501070	50500007	CLÍNICA CIRÚRGICA ANIMAL
50501089	50500007	TOXICOLOGIA ANIMAL
50502000	50500007	MEDICINA VETERINÁRIA PREVENTIVA
50502018	50500007	EPIDEMIOLOGIA ANIMAL
50502026	50500007	SANEAMENTO APLICADO À SAÚDE DO HOMEM
50502034	50500007	DOENÇAS INFECCIOSAS DE ANIMAIS
50502042	50500007	DOENÇAS PARASITÁRIAS DE ANIMAIS
50502050	50500007	SAÚDE ANIMAL (PROGRAMAS SANITÁRIOS)
50503006	50500007	PATOLOGIA ANIMAL
50503014	50500007	PATOLOGIA AVIÁRIA
50503022	50500007	ANATOMIA PATOLÓGICA ANIMAL
50503030	50500007	PATOLOGIA CLÍNICA ANIMAL
50504002	50500007	REPRODUÇÃO ANIMAL
50504010	50500007	GINECOLOGIA E ANDROLOGIA ANIMAL
50504029	50500007	INSEMINAÇÃO ARTIFICIAL ANIMAL
50504037	50500007	FISIOPATOLOGIA DA REPRODUÇÃO ANIMAL
50505009	50500007	INSPEÇÃO DE PRODUTOS DE ORIGEM ANIMAL
50700006	50700006	CIÊNCIA E TECNOLOGIA DE ALIMENTOS
50701002	50700006	CIÊNCIA DE ALIMENTOS
50701010	50700006	VALOR NUTRITIVO DE ALIMENTOS
50701029	50700006	QUÍMICA, FÍSICA, FÍSICO-QUÍM. BIOQ. DOS ALI. MAT. PRIMAS ALI
50701037	50700006	MICROBIOLOGIA DE ALIMENTOS
50701045	50700006	FISIOLOGIA PÓS-COLHEITA
50701053	50700006	TOXICIDADE E RESÍDUOS DE PESTICIDAS EM ALIMENTOS
50701061	50700006	AVALIAÇÃO E CONTROLE DE QUALIDADE DE ALIMENTOS
50701070	50700006	PADRÕES, LEGISLAÇÃO E FISCALIZAÇÃO DE ALIMENTOS
50702009	50700006	TECNOLOGIA DE ALIMENTOS
50702017	50700006	TECNOLOGIA DE PRODUTOS DE ORIGEM ANIMAL
50702025	50700006	TECNOLOGIA DE PRODUTOS DE ORIGEM VEGETAL
50702033	50700006	TECNOLOGIA DAS BEBIDAS
50702041	50700006	TECNOLOGIA DE ALIMENTOS DIETÉTICOS E NUTRICIONAIS
50702050	50700006	APROVEITAMENTO DE SUBPRODUTOS
50702068	50700006	EMBALAGENS DE PRODUTOS ALIMENTARES
50703005	50700006	ENGENHARIA DE ALIMENTOS
50703013	50700006	INSTALAÇÕES INDUSTRIAIS DE PRODUÇÃO DE ALIMENTOS
50703021	50700006	ARMAZENAMENTO DE ALIMENTOS
60101008	60100001	TEORIA DO DIREITO
60101016	60100001	TEORIA GERAL DO DIREITO
60101024	60100001	TEORIA GERAL DO PROCESSO
60101032	60100001	TEORIA DO ESTADO
60101040	60100001	HISTÓRIA DO DIREITO
60101059	60100001	FILOSOFIA DO DIREITO
60101067	60100001	LÓGICA JURÍDICA
60101075	60100001	SOCIOLOGIA JURÍDICA
60101083	60100001	ANTROPOLOGIA JURÍDICA
60102004	60100001	DIREITO PÚBLICO
60102012	60100001	DIREITO TRIBUTÁRIO
60102020	60100001	DIREITO PENAL
60102039	60100001	DIREITO PROCESSUAL PENAL
60102047	60100001	DIREITO PROCESSUAL CIVIL
60102055	60100001	DIREITO CONSTITUCIONAL
60102063	60100001	DIREITO ADMINISTRATIVO
60102071	60100001	DIREITO INTERNACIONAL PÚBLICO
60103000	60100001	DIREITO PRIVADO
60103019	60100001	DIREITO CIVIL
60103027	60100001	DIREITO COMERCIAL
60103035	60100001	DIREITO DO TRABALHO
60103043	60100001	DIREITO INTERNACIONAL PRIVADO
60104007	60100001	DIREITOS ESPECIAIS
60201002	60200006	ADMINISTRAÇÃO DE EMPRESAS
60201010	60200006	ADMINISTRAÇÃO DE PRODUÇÃO
60201029	60200006	ADMINISTRAÇÃO FINANCEIRA
60201037	60200006	MERCADOLOGIA
60201045	60200006	NEGÓCIOS INTERNACIONAIS
60201053	60200006	ADMINISTRAÇÃO DE RECURSOS HUMANOS
60202009	60200006	ADMINISTRAÇÃO PÚBLICA
60202017	60200006	CONTABILIDADE E FINANÇAS PÚBLICAS
60202025	60200006	ORGANIZAÇÕES PÚBLICAS
60202033	60200006	POLÍTICA E PLANEJAMENTO GOVERNAMENTAIS
60202041	60200006	ADMINISTRAÇÃO DE PESSOAL
60203005	60200006	ADMINISTRAÇÃO DE SETORES ESPECÍFICOS
60204001	60200006	CIÊNCIAS CONTÁBEIS
61300004	61300004	TURISMO
60301007	60300000	TEORIA ECONÔMICA
60301015	60300000	ECONOMIA GERAL
60301023	60300000	TEORIA GERAL DA ECONOMIA
60301031	60300000	HISTÓRIA DO PENSAMENTO ECONÔMICO
60301040	60300000	HISTÓRIA ECONÔMICA
60301058	60300000	SISTEMAS ECONÔMICOS
60302003	60300000	MÉTODOS QUANTITATIVOS EM ECONOMIA
60302011	60300000	MÉTODOS E MODELOS MATEMÁT., ECONOMÉTRICOS E ESTATÍSTICOS
60302020	60300000	ESTATÍSTICA SÓCIO-ECONÔMICA
60302038	60300000	CONTABILIDADE NACIONAL
60302046	60300000	ECONOMIA MATEMÁTICA
60303000	60300000	ECONOMIA MONETÁRIA E FISCAL
60303018	60300000	TEORIA MONETÁRIA E FINANCEIRA
60303026	60300000	INSTITUIÇÕES MONETÁRIAS E FINANCEIRAS DO BRASIL
60303034	60300000	FINANÇAS PÚBLICAS INTERNAS
60303042	60300000	POLÍTICA FISCAL DO BRASIL
60304006	60300000	CRESCIMENTO, FLUTUAÇÕES E PLANEJAMENTO ECONÔMICO
60304014	60300000	CRESCIMENTO E DESENVOLVIMENTO ECONÔMICO
60304022	60300000	TEORIA E POLÍTICA DE PLANEJAMENTO ECONÔMICO
60304030	60300000	FLUTAÇÕES CICLÍCAS E PROJEÇÕES ECONÔMICAS
60304049	60300000	INFLAÇÃO
60305002	60300000	ECONOMIA INTERNACIONAL
60305010	60300000	TEORIA DO COMÉRCIO INTERNACIONAL
60305029	60300000	RELAÇÕES DO COMÉRCIO; POLÍT. COMERCIAL; INTEGRAÇÃO ECONÔMICA
60305037	60300000	BALANÇO DE PAGAMENTO; FINANÇAS INTERNACIONAIS
60305045	60300000	INVESTIMENTOS INTERNACIONAIS E AJUDA EXTERNA
60306009	60300000	ECONOMIA DOS RECURSOS HUMANOS
60306017	60300000	TREIN. E ALOCAÇÃO DE MÃO-DE-OBRA;OFERTA MÃO-DE-OBRA F. TRAB.
60306025	60300000	MERCADO DE TRABALHO; POLÍTICA DO GOVERNO
60306033	60300000	SINDICATOS, DISSÍDIOS COLET., RELAÇÕES DE EMPREGO(EMP./EMP)
60306041	60300000	CAPITAL HUMANO
60306050	60300000	DEMOGRAFIA ECONÔMICA
60307005	60300000	ECONOMIA INDUSTRIAL
60307013	60300000	ORGANIZAÇÃO INDUSTRIAL E ESTUDOS INDUSTRIAIS
60307021	60300000	MUDANÇA TECNOLÓGICA
60308001	60300000	ECONOMIA DO BEM-ESTAR SOCIAL
60308010	60300000	ECONOMIA DOS PROGRAMAS DE BEM-ESTAR SOCIAL
60308028	60300000	ECONOMIA DO CONSUMIDOR
60309008	60300000	ECONOMIA REGIONAL E URBANA
60309016	60300000	ECONOMIA REGIONAL
60309024	60300000	ECONOMIA URBANA
60309032	60300000	RENDA E TRIBUTAÇÃO
60310006	60300000	ECONOMIAS AGRÁRIA E DOS RECURSOS NATURAIS
60310014	60300000	ECONOMIA AGRÁRIA
60310022	60300000	ECONOMIA DOS RECURSOS NATURAIS
60401001	60400005	FUNDAMENTOS DE ARQUITETURA E URBANISMO
60401010	60400005	HISTÓRIA DA ARQUITETURA E URBANISMO
60401028	60400005	TEORIA DA ARQUITETURA
60401036	60400005	HISTÓRIA DO URBANISMO
60401044	60400005	TEORIA DO URBANISMO
60402008	60400005	PROJETO DE ARQUITETURA E URBANISMO
60402016	60400005	PLANEJAMENTO E PROJETOS DA EDIFICAÇÃO
60402024	60400005	PLANEJAMENTO E PROJETO DO ESPAÇO URBANO
60402032	60400005	PLANEJAMENTO E PROJETO DO EQUIPAMENTO
60403004	60400005	TECNOLOGIA DE ARQUITETURA E URBANISMO
60403012	60400005	ADEQUAÇÃO AMBIENTAL
60404000	60400005	PAISAGISMO
60404019	60400005	DESENVOLVIMENTO HISTÓRICO DO PAISAGISMO
60404027	60400005	CONCEITUAÇÃO DE PAISAGISMO E METODOLOGIA DO PAISAGISMO
60404035	60400005	ESTUDOS DE ORGANIZAÇÃO DO ESPAÇO EXTERIOR
60404043	60400005	PROJETOS DE ESPAÇOS LIVRES URBANOS
61200000	61200000	DESENHO INDUSTRIAL
60501006	60500000	FUNDAMENTOS DO PLANEJAMENTO URBANO E REGIONAL
60501014	60500000	TEORIA DO PLANEJAMENTO URBANO E REGIONAL
60501022	60500000	TEORIA DA URBANIZAÇÃO
60501030	60500000	POLÍTICA URBANA
60501049	60500000	HISTÓRIA URBANA
60502002	60500000	MÉTODOS E TÉCNICAS DO PLANEJAMENTO URBANO E REGIONAL
60502010	60500000	INFORMAÇÃO, CADASTRO E MAPEAMENTO
60502029	60500000	TÉCNICA DE PREVISÃO URBANA E REGIONAL
60502037	60500000	TÉCNICAS DE ANÁLISE E AVALIAÇÃO URBANA E REGIONAL
60502045	60500000	TÉCNICAS DE PLANEJAMENTO E PROJETO URBANOS E REGIONAIS
60503009	60500000	SERVIÇOS URBANOS E REGIONAIS
60503017	60500000	ADMINISTRAÇÃO MUNICIPAL E URBANA
60503025	60500000	ESTUDOS DA HABITAÇÃO
60503033	60500000	ASPECTOS SOCIAIS DO PLANEJAMENTO URBANO E REGIONAL
60503041	60500000	ASPECTOS ECONÔMICOS DO PLANEJAMENTO URBANO E REGIONAL
60503050	60500000	ASPECTOS FÍSICO-AMBIENTAIS DO PLANEJ. URBANO E REGIONAL
60503068	60500000	SERVIÇOS COMUNITÁRIOS
60503076	60500000	INFRA-ESTRUTURAS URBANAS E REGIONAIS
60503084	60500000	TRANSPORTE E TRÁFEGO URBANO E REGIONAL
60503092	60500000	LEGISLAÇÃO URBANA E REGIONAL
60601000	60600004	DISTRIBUIÇÃO ESPACIAL
60601019	60600004	DISTRIBUIÇÃO ESPACIAL GERAL
60601027	60600004	DISTRIBUIÇÃO ESPACIAL URBANA
60601035	60600004	DISTRIBUIÇÃO ESPACIAL RURAL
60602007	60600004	TENDÊNCIA POPULACIONAL
60602015	60600004	TENDÊNCIAS PASSADAS
60602023	60600004	TAXAS E ESTIMATIVAS CORRENTES
60602031	60600004	PROJEÇÕES
60603003	60600004	COMPONENTES DA DINÂMICA DEMOGRÁFICA
60603011	60600004	FECUNDIDADE
60603020	60600004	MORTALIDADE
60603038	60600004	MIGRAÇÃO
60604000	60600004	NUPCIALIDADE E FAMÍLIA
60604018	60600004	CASAMENTO E DIVÓRCIO
60604026	60600004	FAMÍLIA E REPRODUÇÃO
60605006	60600004	DEMOGRAFIA HISTÓRICA
60605014	60600004	DISTRIBUIÇÃO ESPACIAL
60605022	60600004	NATALIDADE, MORTALIDADE, MIGRAÇÃO
60605049	60600004	MÉTODOS E TÉCNICAS DE DEMOGRAFIA HISTÓRICA
60606002	60600004	POLÍTICA PÚBLICA E POPULAÇÃO
60606010	60600004	POLÍTICA POPULACIONAL
60606029	60600004	POLÍTICAS DE REDISTRIBUIÇÃO DE POPULAÇÃO
60606037	60600004	POLÍTICAS DE PLANEJAMENTO FAMILIAR
60607009	60600004	FONTES DE DADOS DEMOGRÁFICOS
60701005	60700009	TEORIA DA INFORMAÇÃO
60701013	60700009	TEORIA GERAL DA INFORMAÇÃO
60701021	60700009	PROCESSOS DA COMUNICAÇÃO
60701030	60700009	REPRESENTAÇÃO DA INFORMAÇÃO
60702001	60700009	BIBLIOTECONOMIA
60702010	60700009	TEORIA DA CLASSIFICAÇÃO
60702028	60700009	MÉTODOS QUANTITATIVOS, BIBLIOMETRIA
60702036	60700009	TÉCNICAS DE RECUPERAÇÃO DE INFORMAÇÃO
60702044	60700009	PROCESSOS DE DISSEMINAÇÃO DA INFORMAÇÃO
60703008	60700009	ARQUIVOLOGIA
60703016	60700009	ORGANIZAÇÃO DE ARQUIVOS
60800003	60800003	MUSEOLOGIA
60901004	60900008	TEORIA DA COMUNICAÇÃO
60902000	60900008	JORNALISMO E EDITORAÇÃO
60902019	60900008	TEORIA E ÉTICA DO JORNALISMO
60902027	60900008	ORGANIZAÇÃO EDITORIAL DE JORNAIS
60902035	60900008	ORGANIZAÇÃO COMERCIAL DE JORNAIS
60902043	60900008	JORNALISMO ESPECIALIZADO (COMUNITÁRIO, RURAL, EMP. CIENTIF.)
60903007	60900008	RÁDIO E TELEVISÃO
60903015	60900008	RADIODIFUSÃO
60903023	60900008	VIDEODIFUSÃO
60904003	60900008	RELAÇÕES PÚBLICAS E PROPAGANDA
60905000	60900008	COMUNICAÇÃO VISUAL
61201006	60900008	PROGRAMAÇÃO VISUAL
61202002	60900008	DESENHO DE PRODUTO
61000000	61000000	SERVIÇO SOCIAL
61001007	61000000	FUNDAMENTOS DO SERVIÇO SOCIAL
61002003	61000000	SERVIÇO SOCIAL APLICADO
61002011	61000000	SERVIÇO SOCIAL DO TRABALHO
61002020	61000000	SERVIÇO SOCIAL DA EDUCAÇÃO
61002038	61000000	SERVIÇO SOCIAL DO MENOR
61002046	61000000	SERVIÇO SOCIAL DA SAÚDE
61002054	61000000	SERVIÇO SOCIAL DA HABITAÇÃO
61100005	61000000	ECONOMIA DOMÉSTICA
70101000	70100004	HISTÓRIA DA FILOSOFIA
70102007	70100004	METAFÍSICA
70103003	70100004	LÓGICA
70104000	70100004	ÉTICA
70105006	70100004	EPISTEMOLOGIA
70106002	70100004	FILOSOFIA BRASILEIRA
71001000	71000003	HISTÓRIA DA TEOLOGIA
71002006	71000003	TEOLOGIA MORAL
71003002	71000003	TEOLOGIA SISTEMÁTICA
71004009	71000003	TEOLOGIA PASTORAL
70201005	70200009	FUNDAMENTOS DA SOCIOLOGIA
70201013	70200009	TEORIA SOCIOLÓGICA
70201021	70200009	HISTÓRIA DA SOCIOLOGIA
70202001	70200009	SOCIOLOGIA DO CONHECIMENTO
70203008	70200009	SOCIOLOGIA DO DESENVOLVIMENTO
70204004	70200009	SOCIOLOGIA URBANA
70205000	70200009	SOCIOLOGIA RURAL
70206007	70200009	SOCIOLOGIA DA SAÚDE
70207003	70200009	OUTRAS SOCIOLOGIAS ESPECÍFICAS
70301000	70300003	TEORIA ANTROPOLÓGICA
70302006	70300003	ETNOLOGIA INDÍGENA
70303002	70300003	ANTROPOLOGIA URBANA
70304009	70300003	ANTROPOLOGIA RURAL
70305005	70300003	ANTROPOLOGIA DAS POPULAÇÕES AFRO-BRASILEIRAS
70401004	70400008	TEORIA E MÉTODO EM ARQUEOLOGIA
70402000	70400008	ARQUEOLOGIA PRÉ-HISTÓRICA
70403007	70400008	ARQUEOLOGIA HISTÓRICA
70501009	70500002	TEORIA E FILOSOFIA DA HISTÓRIA
70502005	70500002	HISTÓRIA ANTIGA E MEDIEVAL
70503001	70500002	HISTÓRIA MODERNA E CONTEMPORÂNEA
70504008	70500002	HISTÓRIA DA AMÉRICA
70504016	70500002	HISTÓRIA DOS ESTADOS UNIDOS
70504024	70500002	HISTÓRIA LATINO-AMERICANA
70505004	70500002	HISTÓRIA DO BRASIL
70505012	70500002	HISTÓRIA DO BRASIL COLÔNIA
70505020	70500002	HISTÓRIA DO BRASIL IMPÉRIO
70505039	70500002	HISTÓRIA DO BRASIL REPÚBLICA
70505047	70500002	HISTÓRIA REGIONAL DO BRASIL
70506000	70500002	HISTÓRIA DAS CIÊNCIAS
70601003	70600007	GEOGRAFIA HUMANA
70601011	70600007	GEOGRAFIA DA POPULAÇÃO
70601020	70600007	GEOGRAFIA AGRÁRIA
70601038	70600007	GEOGRAFIA URBANA
70601046	70600007	GEOGRAFIA ECONÔMICA
70601054	70600007	GEOGRAFIA POLÍTICA
70602000	70600007	GEOGRAFIA REGIONAL
70602018	70600007	TEORIA DO DESENVOLVIMENTO REGIONAL
70602026	70600007	REGIONALIZAÇÃO
70602034	70600007	ANÁLISE REGIONAL
70701008	70700001	FUNDAMENTOS E MEDIDAS DA PSICOLOGIA
70701016	70700001	HISTÓRIA, TEORIAS E SISTEMAS EM PSICOLOGIA
70701024	70700001	METODOLOGIA, INSTRUMENTAÇÃO E EQUIPAMENTO EM PSICOLOGIA
70701032	70700001	CONSTRUÇÃO E VALIDADE DE TESTES, ESC. E O. MEDIDAS PSICOLÓG.
70701040	70700001	TÉCN. DE PROCES. ESTÁT., MATEMÁTICO E COMPUT. EM PSICOLOGIA
70702004	70700001	PSICOLOGIA EXPERIMENTAL
70702012	70700001	PROCESSOS PERCEPTUAIS E MOTORES
70702020	70700001	PROCESSOS DE APRENDIZAGEM, MEMÓRIA E MOTIVAÇÃO
70702039	70700001	PROCESSOS COGNITIVOS E ATENCIONAIS
70702047	70700001	ESTADOS SUBJETIVOS E EMOÇÃO
70703000	70700001	PSICOLOGIA FISIOLÓGICA
70703019	70700001	NEUROLOGIA, ELETROFISIOLOGIA E COMPORTAMENTO
70703027	70700001	PROCESSOS PSICO-FISIOLÓGICOS
70703035	70700001	ESTIMULAÇÃO ELÉTRICA E COM DROGAS; COMPORTAMENTO
70703043	70700001	PSICOBIOLOGIA
70704007	70700001	PSICOLOGIA COMPARATIVA
70704015	70700001	ESTUDOS NATURALÍSTICOS DO COMPORTAMENTO ANIMAL
70704023	70700001	MECANISMOS INSTINTIVOS E PROCESSOS SOCIAIS EM ANIMAIS
70705003	70700001	PSICOLOGIA SOCIAL
70705011	70700001	RELAÇÕES INTERPESSOAIS
70705020	70700001	PROCESSOS GRUPAIS E DE COMUNICAÇÃO
70705038	70700001	PAPEIS E ESTRUTURAS SOCIAIS; INDIVÍDUO
70706000	70700001	PSICOLOGIA COGNITIVA
70707006	70700001	PSICOLOGIA DO DESENVOLVIMENTO HUMANO
70707014	70700001	PROCESSOS PERCEPTUAIS E COGNITIVOS; DESENVOLVIMENTO
70707022	70700001	DESENVOLVIMENTO SOCIAL E DA PERSONALIDADE
70708002	70700001	PSICOLOGIA DO ENSINO E DA APRENDIZAGEM
70708010	70700001	PLANEJAMENTO INSTITUCIONAL
70708029	70700001	PROGRAMAÇÃO DE CONDIÇÕES DE ENSINO
70708037	70700001	TREINAMENTO DE PESSOAL
70708045	70700001	APRENDIZAGEM E DESEMPENHO ACADÊMICOS
70708053	70700001	ENSINO E APRENDIZAGEM NA SALA DE AULA
70709009	70700001	PSICOLOGIA DO TRABALHO E ORGANIZACIONAL
70709017	70700001	ANÁLISE INSTITUCIONAL
70709025	70700001	RECRUTAMENTO E SELEÇÃO DE PESSOAL
70709033	70700001	TREINAMENTO E AVALIAÇÃO
70709041	70700001	FATORES HUMANOS NO TRABALHO
70709050	70700001	PLANEJAMENTO AMBIENTAL E COMPORTAMENTO HUMANO
70710007	70700001	TRATAMENTO E PREVENÇÃO PSICOLÓGICA
70710015	70700001	INTERVENÇÃO TERAPÊUTICA
70710023	70700001	PROGRAMAS DE ATENDIMENTO COMUNITÁRIO
70710031	70700001	TREINAMENTO E REABILITAÇÃO
70710040	70700001	DESVIOS DA CONDUTA
70710058	70700001	DISTÚRBIOS DA LINGUAGEM
70710066	70700001	DISTÚRBIOS PSICOSSOMÁTICOS
70801002	70800006	FUNDAMENTOS DA EDUCAÇÃO
70801010	70800006	FILOSOFIA DA EDUCAÇÃO
70801029	70800006	HISTÓRIA DA EDUCAÇÃO
70801037	70800006	SOCIOLOGIA DA EDUCAÇÃO
70801045	70800006	ANTROPOLOGIA EDUCACIONAL
70801053	70800006	ECONOMIA DA EDUCAÇÃO
70801061	70800006	PSICOLOGIA EDUCACIONAL
70802009	70800006	ADMINISTRAÇÃO EDUCACIONAL
70802017	70800006	ADMINISTRAÇÃO DE SISTEMAS EDUCACIONAIS
70802025	70800006	ADMINISTRAÇÃO DE UNIDADES EDUCATIVAS
70803005	70800006	PLANEJAMENTO E AVALIAÇÃO EDUCACIONAL
70803013	70800006	POLÍTICA EDUCACIONAL
70803021	70800006	PLANEJAMENTO EDUCACIONAL
70803030	70800006	AVAL. DE SISTEMAS, INST. PLANOS  E PROGRAMAS EDUCACIONAIS
70804001	70800006	ENSINO-APRENDIZAGEM
70804010	70800006	TEORIAS DA INSTRUÇÃO
70804028	70800006	MÉTODOS E TÉCNICAS DE ENSINO
70804036	70800006	TECNOLOGIA EDUCACIONAL
70804044	70800006	AVALIAÇÃO DA APRENDIZAGEM
70805008	70800006	CURRÍCULO
70805016	70800006	TEORIA GERAL DE PLANEJAMENTO E DESENV. CURRICULAR
70805024	70800006	CURRÍCULOS ESPECÍFICOS PARA NÍVEIS E TIPOS DE EDUCAÇÃO
70806004	70800006	ORIENTAÇÃO E ACONSELHAMENTO
70806012	70800006	ORIENTAÇÃO EDUCACIONAL
70806020	70800006	ORIENTAÇÃO VOCACIONAL
70807000	70800006	TÓPICOS ESPECÍFICOS DE EDUCAÇÃO
70807019	70800006	EDUCAÇÃO DE ADULTOS
70807027	70800006	EDUCAÇÃO PERMANENTE
70807035	70800006	EDUCAÇÃO RURAL
70807043	70800006	EDUCAÇÃO EM PERIFERIAS URBANAS
70807051	70800006	EDUCAÇÃO ESPECIAL
70807060	70800006	EDUCAÇÃO PRÉ-ESCOLAR
70807078	70800006	ENSINO PROFISSIONALIZANTE
70901007	70900000	TEORIA POLÍTICA
70901015	70900000	TEORIA POLÍTICA CLÁSSICA
70901023	70900000	TEORIA POLÍTICA MEDIEVAL
70901031	70900000	TEORIA POLÍTICA MODERNA
70901040	70900000	TEORIA POLÍTICA CONTEMPORÂNEA
70902003	70900000	ESTADO E GOVERNO
70902011	70900000	ESTRUTURA E TRANSFORMAÇÃO DO ESTADO
70902020	70900000	SISTEMAS GOVERNAMENTAIS COMPARADOS
70902038	70900000	RELAÇÕES INTERGOVERNAMENTAIS
70902046	70900000	ESTUDOS DO PODER LOCAL
70902054	70900000	INSTITUIÇÕES GOVERNAMENTAIS ESPECÍFICAS
70903000	70900000	COMPORTAMENTO POLÍTICO
70903018	70900000	ESTUDOS ELEITORAIS E PARTIDOS POLÍTICOS
70903026	70900000	ATITUDE E IDEOLOGIAS POLÍTICAS
70903034	70900000	CONFLITOS E COALIZÕES POLÍTICAS
70903042	70900000	COMPORTAMENTO LEGISLATIVO
70903050	70900000	CLASSES SOCIAIS E GRUPOS DE INTERESSE
70904006	70900000	POLÍTICAS PÚBLICAS
70904014	70900000	ANÁLISE DO PROCESSO DECISÓRIO
70904022	70900000	ANÁLISE INSTITUCIONAL
70904030	70900000	TÉCNICAS DE ANTECIPAÇÃO
70905002	70900000	POLÍTICA INTERNACIONAL
70905010	70900000	POLÍTICA EXTERNA DO BRASIL
70905029	70900000	ORGANIZAÇÕES INTERNACIONAIS
70905037	70900000	INTEGRAÇÃO INTERNACIONAL, CONFLITO, GUERRA E PAZ
70905045	70900000	RELAÇÕES INTERNACIONAIS, BILATERAIS E MULTILATERAIS
80101003	80100007	TEORIA E ANÁLISE LINGUÍSTICA
80102000	80100007	FISIOLOGIA DA LINGUAGEM
80103006	80100007	LINGÜÍSTICA HISTÓRICA
80104002	80100007	SOCIOLINGUÍSTICA E DIALETOLOGIA
80105009	80100007	PSICOLINGUÍSTICA
80106005	80100007	LINGUÍSTICA APLICADA
80201008	80200001	LÍNGUA PORTUGUESA
80202004	80200001	LÍNGUAS ESTRANGEIRAS MODERNAS
80203000	80200001	LÍNGUAS CLÁSSICAS
80204007	80200001	LÍNGUAS INDÍGENAS
80205003	80200001	TEORIA LITERARIA
80206000	80200001	LITERATURA BRASILEIRA
80207006	80200001	OUTRAS LITERATURAS VERNÁCULAS
80208002	80200001	LITERATURAS ESTRANGEIRAS MODERNAS
80209009	80200001	LITERATURAS CLÁSSICAS
80210007	80200001	LITERATURA COMPARADA
80301002	80300006	FUNDAMENTOS E CRÍTICA DAS ARTES
80301010	80300006	TEORIA DA ARTE
80301029	80300006	HISTÓRIA DA ARTE
80301037	80300006	CRÍTICA DA ARTE
80302009	80300006	ARTES PLÁSTICAS
80302017	80300006	PINTURA
80302025	80300006	DESENHO
80302033	80300006	GRAVURA
80302041	80300006	ESCULTURA
80302050	80300006	CERÂMICA
80302068	80300006	TECELAGEM
80303005	80300006	MÚSICA
80303013	80300006	REGÊNCIA
80303021	80300006	INSTRUMENTAÇÃO MUSICAL
80303030	80300006	COMPOSIÇÃO MUSICAL
80303048	80300006	CANTO
80304001	80300006	DANÇA
80304010	80300006	EXECUÇÃO DA DANÇA
80304028	80300006	COREOGRAFIA
80305008	80300006	TEATRO
80305016	80300006	DRAMATURGIA
80305024	80300006	DIREÇÃO TEATRAL
80305032	80300006	CENOGRAFIA
80305040	80300006	INTERPRETAÇÃO TEATRAL
80306004	80300006	ÓPERA
80307000	80300006	FOTOGRAFIA
80308007	80300006	CINEMA
80308015	80300006	ADMINISTRAÇÃO E PRODUÇÃO DE FILMES
80308023	80300006	ROTEIRO E DIREÇÃO CINEMATOGRÁFICOS
80308031	80300006	TÉCNICAS DE REGISTROS E PROCESSAMENTO DE FILMES
80308040	80300006	INTERPRETAÇÃO CINEMATOGRÁFICA
80309003	80300006	ARTES DO VÍDEO
80310001	80300006	EDUCAÇÃO ARTÍSTICA
90191000	90100000	MEIO AMBIENTE E AGRÁRIAS
90192000	90100000	SOCIAIS E HUMANIDADES
90193000	90100000	ENGENHARIA/TECNOLOGIA/GESTÃO
90194000	90100000	SAÚDE E BIOLÓGICAS
90201000	90200000	ENSINO DE CIÊNCIAS E MATEMÁTICA
90300009	90300009	MATERIAIS
90400003	90400003	BIOTECNOLOGIA
90500008	90500008	CIÊNCIAS AMBIENTAIS
\.


--
-- TOC entry 2763 (class 0 OID 59311)
-- Dependencies: 265
-- Data for Name: tcc; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tcc (id, id_servidor, datainicio, datafim, id_aluno, id_aluno2) FROM stdin;
\.


--
-- TOC entry 2765 (class 0 OID 59316)
-- Dependencies: 267
-- Data for Name: tipo_atividade; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tipo_atividade (id, nome, maximo, pontos) FROM stdin;
15	Orientação de Projeto de Iniciação Científica e Tecnológia - Externo ao Câmpus	2	3
4	Atendimento ao discente/pais ou responsáveis	4	1
7	Orientação de monografia de especialização	4	2
8	Orientação de Dissertação de Mestrado	2	4
9	Co-Orientação de Dissertação de Mestrado	1	2
10	Orientação de Tese de Doutorado	2	6
11	Co-Orientação de Tese de Doutorado	1	3
12	Participação em Comissões de Elaboração/Revisão/Avaliação de Projetos de Cursos e Regulamentos Acadêmicos	2	3
13	Participação em Comissões de Elaboração de Projetos de Modernização, Instalação e Supervisão de Laboratórios	2	3
37	Demais Atividades (sem pontuação)	99	0
20	Planejamento e Regência de Aulas em Cursos de Formação Inicial e Continuada (FIC)	12	2
24	Autoria de Livro	1	8
25	Autoria de Capítulo de Livro	1	2
26	Publicação de artigo em periódicos Qualis A ou B	2	2
27	Apresentação de trabalho, palestra e mesa-redonda	1	2
28	Obra, curadoria e mostra	1	2
29	Matrícula em curso de Especialização	1	4
30	Matrícula em Programa de Mestrado	1	4
31	Matrícula em Programa de Doutorado	1	4
33	Participação em Conselho, Comissão ou outro Fórum ou Instância de Representação da Instituição, nomeado por Portaria	2	2
35	Participação em Comissão Organizadora de Eventos Institucionais, nomeado por Portaria	1	2
36	Organização de Eventos e outras Atividades definidas pelo Conselho Departamental, Direção-Geral do Campus ou Reitoria	2	2
17	Participação em Projeto de Pesquisa - Externo ao Câmpus Anápolis	1	4
19	Participação em Núcleo de Pesquisa Cadastrado no Diretório de Grupos de Pesquisa do CNPq e certificado pelo IFG - Externo ao Câmpus Anápolis	2	1
22	Participação em Projeto de Extensão - Externo ao Câmpus Anápolis	1	4
23	Orientação de Projeto de Extensão - Externo ao Câmpus Anápolis	2	2
34	Paticipação em instâncias externas indicado pela Instituição, por meio de Portaria	1	2
32	Coordenação ou Presidência de Comissão ou outro Fórum Permanente, constituído por Portaria	1	4
6	Orientação de Trabalho de Conclusão de Curso (TCC)-Externo ao Câmpus Anápolis	4	2
\.


--
-- TOC entry 2767 (class 0 OID 59324)
-- Dependencies: 269
-- Data for Name: tipoedital; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tipoedital (id, nome) FROM stdin;
1	PIBIC-EM
13	AUXÍLIO PERMANÊNCIA (EJA)
20	Cursos FIC
14	PROAPP
18	Editais Externos
19	AUXÍLIO EaD
12	AUXÍLIO ALIMENTAÇÃO (TEMPO INTEGRAL)
11	PIBITI
7	Cadastro de Projeto de Pesquisa
16	PIBIC e PIBIC-Af
22	AUXÍLIO PRESENCIAL
21	Chamada Pública
23	EDITAL EXTENSÃO
24	Projetos de Ensino
\.


--
-- TOC entry 2769 (class 0 OID 59332)
-- Dependencies: 271
-- Data for Name: turma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.turma (id, nome, ano, id_curso, codigo_turma) FROM stdin;
1	Bacharelado em Engenharia Civil da Mobilidade-2018	2018	6013	\N
2	Tecnologia em Logística-2018	2018	6001	\N
3	Técnico Integrado em Edificações-2018	2018	6003	\N
4	Bacharelado em Ciência da Computação-2018	2018	6014	\N
5	Licenciatura em Química-2018	2018	6002	\N
6	Técnico Integrado em Química-2018	2018	6005	\N
7	Técnico Integrado em Comércio Exterior-2018	2018	6011	\N
8	Técnico Integrado em Secretaria Escolar - Proeja-2018	2018	6010	\N
9	Licenciatura em Ciências Sociais-2018	2018	6009	\N
10	Técnico Integrado em Transporte de Cargas - Proeja-2018	2018	6008	\N
11	Mestrado Profissional em Educação Profissional e Tecnológica-2018	2018	6015	\N
12	Bacharelado em Engenharia Civil da Mobilidade-2017	2017	6013	\N
13	Tecnologia em Logística-2017	2017	6001	\N
14	Técnico Integrado em Edificações-2017	2017	6003	\N
15	Bacharelado em Ciência da Computação-2017	2017	6014	\N
16	Licenciatura em Química-2017	2017	6002	\N
17	Técnico Integrado em Química-2017	2017	6005	\N
18	Técnico Integrado em Comércio Exterior-2017	2017	6011	\N
19	Técnico Integrado em Secretaria Escolar - Proeja-2017	2017	6010	\N
20	Licenciatura em Ciências Sociais-2017	2017	6009	\N
21	Técnico Integrado em Transporte de Cargas - Proeja-2017	2017	6008	\N
22	Mestrado Profissional em Educação Profissional e Tecnológica-2017	2017	6015	\N
23	Bacharelado em Engenharia Civil da Mobilidade-2016	2016	6013	\N
24	Tecnologia em Logística-2016	2016	6001	\N
25	Técnico Integrado em Edificações-2016	2016	6003	\N
26	Bacharelado em Ciência da Computação-2016	2016	6014	\N
27	Licenciatura em Química-2016	2016	6002	\N
28	Técnico Integrado em Química-2016	2016	6005	\N
29	Técnico Integrado em Comércio Exterior-2016	2016	6011	\N
30	Técnico Integrado em Secretaria Escolar - Proeja-2016	2016	6010	\N
31	Licenciatura em Ciências Sociais-2016	2016	6009	\N
32	Técnico Integrado em Transporte de Cargas - Proeja-2016	2016	6008	\N
33	Bacharelado em Engenharia Civil da Mobilidade-2015	2015	6013	\N
34	Tecnologia em Logística-2015	2015	6001	\N
35	Técnico Integrado em Edificações-2015	2015	6003	\N
36	Licenciatura em Química-2015	2015	6002	\N
37	Técnico Integrado em Química-2015	2015	6005	\N
38	Técnico Integrado em Comércio Exterior-2015	2015	6011	\N
39	Técnico Integrado em Secretaria Escolar - Proeja-2015	2015	6010	\N
40	Licenciatura em Ciências Sociais-2015	2015	6009	\N
41	Técnico Integrado em Transporte de Cargas - Proeja-2015	2015	6008	\N
42	Bacharelado em Engenharia Civil da Mobilidade-2014	2014	6013	\N
43	Tecnologia em Logística-2014	2014	6001	\N
44	Técnico Integrado em Edificações-2014	2014	6003	\N
45	Licenciatura em Química-2014	2014	6002	\N
46	Técnico Integrado em Química-2014	2014	6005	\N
47	Técnico Integrado em Comércio Exterior-2014	2014	6011	\N
48	Técnico Integrado em Secretaria Escolar - Proeja-2014	2014	6010	\N
49	Licenciatura em Ciências Sociais-2014	2014	6009	\N
50	Técnico Integrado em Transporte de Cargas - Proeja-2014	2014	6008	\N
53	Bacharelado em Engenharia Civil da Mobilidade-2019	2019	6013	\N
54	Tecnologia em Logística-2019	2019	6001	\N
55	Técnico Integrado em Edificações-2019	2019	6003	\N
56	Bacharelado em Ciência da Computação-2019	2019	6014	\N
57	Licenciatura em Química-2019	2019	6002	\N
58	Técnico Integrado em Química-2019	2019	6005	\N
59	Técnico Integrado em Comércio Exterior-2019	2019	6011	\N
60	Técnico Integrado em Secretaria Escolar - Proeja-2019	2019	6010	\N
61	Licenciatura em Ciências Sociais-2019	2019	6009	\N
62	Técnico Integrado em Transporte de Cargas - Proeja-2019	2019	6008	\N
65	Bacharelado em Engenharia Civil da Mobilidade-2020	2020	6013	\N
66	Tecnologia em Logística-2020	2020	6001	\N
63	Mestrado Profissional em Educação Profissional e Tecnológica-2019	2019	6015	20191.MPEPT.2
67	Técnico Integrado em Edificações-2020	2020	6003	\N
68	Bacharelado em Ciência da Computação-2020	2020	6014	\N
69	Licenciatura em Química-2020	2020	6002	\N
70	Técnico Integrado em Química-2020	2020	6005	\N
71	Técnico Integrado em Comércio Exterior-2020	2020	6011	\N
72	Técnico Integrado em Secretaria Escolar - Proeja-2020	2020	6010	\N
73	Licenciatura em Ciências Sociais-2020	2020	6009	\N
74	Técnico Integrado em Transporte de Cargas - Proeja-2020	2020	6008	\N
75	Mestrado Profissional em Educação Profissional e Tecnológica-2020	2020	6015	\N
\.


--
-- TOC entry 2771 (class 0 OID 59340)
-- Dependencies: 273
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."user" (id, username, auth_key, password_hash, confirmation_token, status, superadmin, created_at, updated_at, registration_ip, bind_to_ip, email, email_confirmed) FROM stdin;
\.


--
-- TOC entry 2773 (class 0 OID 59351)
-- Dependencies: 275
-- Data for Name: user_visit_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_visit_log (id, token, ip, language, user_agent, user_id, visit_time, browser, os) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 0)
-- Dependencies: 197
-- Name: Extensao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Extensao_id_seq"', 95, true);


--
-- TOC entry 2817 (class 0 OID 0)
-- Dependencies: 200
-- Name: aluno_horas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.aluno_horas_id_seq', 1, true);


--
-- TOC entry 2818 (class 0 OID 0)
-- Dependencies: 202
-- Name: areacapes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.areacapes_id_seq', 90500008, true);


--
-- TOC entry 2819 (class 0 OID 0)
-- Dependencies: 210
-- Name: auxilio_mes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auxilio_mes_id_seq', 6150, true);


--
-- TOC entry 2820 (class 0 OID 0)
-- Dependencies: 211
-- Name: auxilios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auxilios_id_seq', 11281, true);


--
-- TOC entry 2821 (class 0 OID 0)
-- Dependencies: 213
-- Name: ch_limite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ch_limite_id_seq', 16, true);


--
-- TOC entry 2822 (class 0 OID 0)
-- Dependencies: 215
-- Name: configuracao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.configuracao_id_seq', 17, true);


--
-- TOC entry 2823 (class 0 OID 0)
-- Dependencies: 217
-- Name: conselhoaluno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conselhoaluno_id_seq', 321, true);


--
-- TOC entry 2824 (class 0 OID 0)
-- Dependencies: 219
-- Name: conselhoclasse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conselhoclasse_id_seq', 7, true);


--
-- TOC entry 2825 (class 0 OID 0)
-- Dependencies: 221
-- Name: conselhodisciplinas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conselhodisciplinas_id_seq', 3, true);


--
-- TOC entry 2826 (class 0 OID 0)
-- Dependencies: 223
-- Name: conselhoturma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conselhoturma_id_seq', 6, true);


--
-- TOC entry 2827 (class 0 OID 0)
-- Dependencies: 226
-- Name: curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.curso_id_seq', 6017, true);


--
-- TOC entry 2828 (class 0 OID 0)
-- Dependencies: 228
-- Name: disciplinas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.disciplinas_id_seq', 21773, true);


--
-- TOC entry 2829 (class 0 OID 0)
-- Dependencies: 230
-- Name: edital_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.edital_id_seq', 135, true);


--
-- TOC entry 2830 (class 0 OID 0)
-- Dependencies: 232
-- Name: estagio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estagio_id_seq', 553, true);


--
-- TOC entry 2831 (class 0 OID 0)
-- Dependencies: 234
-- Name: estagio_supervisor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estagio_supervisor_id_seq', 15, true);


--
-- TOC entry 2832 (class 0 OID 0)
-- Dependencies: 236
-- Name: extensao_alunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.extensao_alunos_id_seq', 214, true);


--
-- TOC entry 2833 (class 0 OID 0)
-- Dependencies: 238
-- Name: extensao_ministrante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.extensao_ministrante_id_seq', 143, true);


--
-- TOC entry 2834 (class 0 OID 0)
-- Dependencies: 242
-- Name: moddle_enroll_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.moddle_enroll_id_seq', 3659, true);


--
-- TOC entry 2835 (class 0 OID 0)
-- Dependencies: 244
-- Name: nucleo_aluno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nucleo_aluno_id_seq', 25, true);


--
-- TOC entry 2836 (class 0 OID 0)
-- Dependencies: 246
-- Name: nucleo_professores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nucleo_professores_id_seq', 56, true);


--
-- TOC entry 2837 (class 0 OID 0)
-- Dependencies: 248
-- Name: nucleo_relatorio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nucleo_relatorio_id_seq', 25, true);


--
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 250
-- Name: nucleodepesquisa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nucleodepesquisa_id_seq', 12, true);


--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 253
-- Name: pesquisa_aluno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pesquisa_aluno_id_seq', 474, true);


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 255
-- Name: pesquisa_coorientador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pesquisa_coorientador_id_seq', 90, true);


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 256
-- Name: pesquisa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pesquisa_id_seq', 284, true);


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 258
-- Name: pesquisa_relatorio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pesquisa_relatorio_id_seq', 283, true);


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 260
-- Name: plano_de_trab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plano_de_trab_id_seq', 1527, true);


--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 263
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.profile_id_seq', 1, true);


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 266
-- Name: tcc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tcc_id_seq', 409, true);


--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 268
-- Name: tipo_atividade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_atividade_id_seq', 37, true);


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 270
-- Name: tipoedital_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipoedital_id_seq', 24, true);


--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 272
-- Name: turma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.turma_id_seq', 75, true);


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 274
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_id_seq', 142, true);


--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 276
-- Name: user_visit_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_visit_log_id_seq', 2371, true);


--
-- TOC entry 2389 (class 2606 OID 59395)
-- Name: auth_assignment auth_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_pkey PRIMARY KEY (item_name, user_id);


--
-- TOC entry 2394 (class 2606 OID 59397)
-- Name: auth_item_child auth_item_child_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_pkey PRIMARY KEY (parent, child);


--
-- TOC entry 2396 (class 2606 OID 59399)
-- Name: auth_item_group auth_item_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_item_group
    ADD CONSTRAINT auth_item_group_pkey PRIMARY KEY (code);


--
-- TOC entry 2391 (class 2606 OID 59401)
-- Name: auth_item auth_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT auth_item_pkey PRIMARY KEY (name);


--
-- TOC entry 2398 (class 2606 OID 59403)
-- Name: auth_rule auth_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_rule
    ADD CONSTRAINT auth_rule_pkey PRIMARY KEY (name);


--
-- TOC entry 2411 (class 2606 OID 59405)
-- Name: conselhoaluno conselhoaluno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhoaluno
    ADD CONSTRAINT conselhoaluno_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 59407)
-- Name: conselhoclasse conselhoclasse_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhoclasse
    ADD CONSTRAINT conselhoclasse_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 59409)
-- Name: conselhodisciplinas conselhodisciplinas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhodisciplinas
    ADD CONSTRAINT conselhodisciplinas_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 59411)
-- Name: conselhoturma conselhoturma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhoturma
    ADD CONSTRAINT conselhoturma_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 59413)
-- Name: aluno_horas fk_matricula; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aluno_horas
    ADD CONSTRAINT fk_matricula PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 59415)
-- Name: migration migration_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- TOC entry 2379 (class 2606 OID 59417)
-- Name: extensao pk_Extensao; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao
    ADD CONSTRAINT "pk_Extensao" PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 59419)
-- Name: aluno pk_aluno; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT pk_aluno PRIMARY KEY (matricula);


--
-- TOC entry 2387 (class 2606 OID 59421)
-- Name: areacapes pk_areacapes; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.areacapes
    ADD CONSTRAINT pk_areacapes PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 59423)
-- Name: auxilio pk_auxilio; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auxilio
    ADD CONSTRAINT pk_auxilio PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 59425)
-- Name: auxilio_mes pk_auxiliomes; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auxilio_mes
    ADD CONSTRAINT pk_auxiliomes PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 59427)
-- Name: configuracao pk_configuracao; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.configuracao
    ADD CONSTRAINT pk_configuracao PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 59429)
-- Name: curso pk_curso; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT pk_curso PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 59431)
-- Name: disciplinas pk_disciplinas; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.disciplinas
    ADD CONSTRAINT pk_disciplinas PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 59433)
-- Name: edital pk_edital; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.edital
    ADD CONSTRAINT pk_edital PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 59435)
-- Name: estagio pk_estagio; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estagio
    ADD CONSTRAINT pk_estagio PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 59437)
-- Name: estagio_supervisor pk_estagio_supervidor; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estagio_supervisor
    ADD CONSTRAINT pk_estagio_supervidor PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 59439)
-- Name: extensao_ministrante pk_extensao_ministrante; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao_ministrante
    ADD CONSTRAINT pk_extensao_ministrante PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 59441)
-- Name: extensao_alunos pk_extensaoalunos; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao_alunos
    ADD CONSTRAINT pk_extensaoalunos PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 59443)
-- Name: gestao pk_gestao; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gestao
    ADD CONSTRAINT pk_gestao PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 59445)
-- Name: convenio pk_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 59447)
-- Name: ch_limite pk_id_grupo_ch; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ch_limite
    ADD CONSTRAINT pk_id_grupo_ch PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 59449)
-- Name: moodle_enroll pk_moddle_enroll; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moodle_enroll
    ADD CONSTRAINT pk_moddle_enroll PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 59451)
-- Name: nucleo_aluno pk_nucleo_alunos; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleo_aluno
    ADD CONSTRAINT pk_nucleo_alunos PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 59453)
-- Name: nucleodepesquisa pk_nucleodepesquisa; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleodepesquisa
    ADD CONSTRAINT pk_nucleodepesquisa PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 59455)
-- Name: nucleo_professores pk_nucleoprofessores; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleo_professores
    ADD CONSTRAINT pk_nucleoprofessores PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 59457)
-- Name: pesquisa pk_pesquisa; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa
    ADD CONSTRAINT pk_pesquisa PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 59459)
-- Name: pesquisa_aluno pk_pesquisa_aluno; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_aluno
    ADD CONSTRAINT pk_pesquisa_aluno PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 59461)
-- Name: pesquisa_coorientador pk_pesquisa_coorientador; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_coorientador
    ADD CONSTRAINT pk_pesquisa_coorientador PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 59463)
-- Name: pesquisa_relatorio pk_pesquisa_relatorio; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_relatorio
    ADD CONSTRAINT pk_pesquisa_relatorio PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 59465)
-- Name: professor pk_professor; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT pk_professor PRIMARY KEY (cpf);


--
-- TOC entry 2458 (class 2606 OID 59467)
-- Name: nucleorelatorio pk_relatorio_nucleodepesquisa; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleorelatorio
    ADD CONSTRAINT pk_relatorio_nucleodepesquisa PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 59469)
-- Name: subareacapes pk_subarea; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subareacapes
    ADD CONSTRAINT pk_subarea PRIMARY KEY (numero);


--
-- TOC entry 2490 (class 2606 OID 59471)
-- Name: tcc pk_tcc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tcc
    ADD CONSTRAINT pk_tcc PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 59473)
-- Name: tipoedital pk_tipoedital; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipoedital
    ADD CONSTRAINT pk_tipoedital PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 59475)
-- Name: plano_de_trab plano_de_trabalho_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_de_trab
    ADD CONSTRAINT plano_de_trabalho_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 59477)
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 59479)
-- Name: turma turma_codigo_turma_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_codigo_turma_key UNIQUE (codigo_turma);


--
-- TOC entry 2500 (class 2606 OID 59481)
-- Name: turma turma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 59483)
-- Name: tipo_atividade type_actvity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_atividade
    ADD CONSTRAINT type_actvity_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 59485)
-- Name: auxilio un_auxilio; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auxilio
    ADD CONSTRAINT un_auxilio UNIQUE (id_aluno, edital);


--
-- TOC entry 2423 (class 2606 OID 59487)
-- Name: curso un_curso; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT un_curso UNIQUE (nome);


--
-- TOC entry 2440 (class 2606 OID 59489)
-- Name: extensao_alunos un_extensao_alunos; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao_alunos
    ADD CONSTRAINT un_extensao_alunos UNIQUE (id_extensao, id_aluno);


--
-- TOC entry 2444 (class 2606 OID 59491)
-- Name: extensao_ministrante un_extensaoministrante; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao_ministrante
    ADD CONSTRAINT un_extensaoministrante UNIQUE (id_extensao, id_professor);


--
-- TOC entry 2452 (class 2606 OID 59493)
-- Name: moodle_enroll un_moodle_enroll; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moodle_enroll
    ADD CONSTRAINT un_moodle_enroll UNIQUE (course, matricula);


--
-- TOC entry 2463 (class 2606 OID 59495)
-- Name: nucleodepesquisa un_nucleodepesquisa; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleodepesquisa
    ADD CONSTRAINT un_nucleodepesquisa UNIQUE (nomedonucleo);


--
-- TOC entry 2471 (class 2606 OID 59497)
-- Name: pesquisa_aluno un_pesquisa; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_aluno
    ADD CONSTRAINT un_pesquisa UNIQUE (id_aluno, id_pesquisa);


--
-- TOC entry 2482 (class 2606 OID 59499)
-- Name: professor un_siape; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT un_siape UNIQUE (siape);


--
-- TOC entry 2496 (class 2606 OID 59501)
-- Name: tipoedital un_tipoedital; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipoedital
    ADD CONSTRAINT un_tipoedital UNIQUE (nome);


--
-- TOC entry 2381 (class 2606 OID 59503)
-- Name: extensao un_titulo_extensao; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao
    ADD CONSTRAINT un_titulo_extensao UNIQUE (titulo);


--
-- TOC entry 2502 (class 2606 OID 59505)
-- Name: turma un_turma_nome; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT un_turma_nome UNIQUE (nome);


--
-- TOC entry 2504 (class 2606 OID 59507)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 59509)
-- Name: user_visit_log user_visit_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_visit_log
    ADD CONSTRAINT user_visit_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 1259 OID 59510)
-- Name: fki_auxilio_aluno; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_auxilio_aluno ON public.auxilio USING btree (id_aluno);


--
-- TOC entry 2376 (class 1259 OID 59511)
-- Name: fki_coordenador2_professor; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_coordenador2_professor ON public.extensao USING btree (coordenador2);


--
-- TOC entry 2424 (class 1259 OID 59512)
-- Name: fki_disciplinas_professores; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_disciplinas_professores ON public.disciplinas USING btree (id_servidor);


--
-- TOC entry 2425 (class 1259 OID 59513)
-- Name: fki_disciplinas_turma; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_disciplinas_turma ON public.disciplinas USING btree (id_turma);


--
-- TOC entry 2428 (class 1259 OID 59514)
-- Name: fki_edital; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_edital ON public.edital USING btree (tipo);


--
-- TOC entry 2433 (class 1259 OID 59515)
-- Name: fki_estagiosupervisor_curso; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_estagiosupervisor_curso ON public.estagio_supervisor USING btree (curso);


--
-- TOC entry 2436 (class 1259 OID 59516)
-- Name: fki_extensao_alunos_aluno; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_extensao_alunos_aluno ON public.extensao_alunos USING btree (id_aluno);


--
-- TOC entry 2377 (class 1259 OID 59517)
-- Name: fki_extensao_edital; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_extensao_edital ON public.extensao USING btree (id_edital);


--
-- TOC entry 2459 (class 1259 OID 59518)
-- Name: fki_nucleovicelider_professor; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_nucleovicelider_professor ON public.nucleodepesquisa USING btree (vicelider);


--
-- TOC entry 2464 (class 1259 OID 59519)
-- Name: fki_pesquisa_area; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_pesquisa_area ON public.pesquisa USING btree (area);


--
-- TOC entry 2465 (class 1259 OID 59520)
-- Name: fki_pesquisa_coorientador -> professor; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fki_pesquisa_coorientador -> professor" ON public.pesquisa USING btree (coorientador);


--
-- TOC entry 2472 (class 1259 OID 59521)
-- Name: fki_pesquisa_coorientador_pesquisa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_pesquisa_coorientador_pesquisa ON public.pesquisa_coorientador USING btree (id_pesquisa);


--
-- TOC entry 2488 (class 1259 OID 59522)
-- Name: fki_tcc_aluno; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_tcc_aluno ON public.tcc USING btree (id_aluno);


--
-- TOC entry 2392 (class 1259 OID 59523)
-- Name: idx-auth_item-type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx-auth_item-type" ON public.auth_item USING btree (type);


--
-- TOC entry 2483 (class 1259 OID 59524)
-- Name: idx-profile-user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx-profile-user_id" ON public.profile USING btree (user_id);


--
-- TOC entry 2571 (class 2620 OID 59525)
-- Name: auxilio insertAuxilio; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "insertAuxilio" AFTER INSERT ON public.auxilio FOR EACH ROW EXECUTE PROCEDURE public."AuxilioMesInsert"();


--
-- TOC entry 2572 (class 2620 OID 59526)
-- Name: pesquisa updatePesquisa; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "updatePesquisa" BEFORE UPDATE ON public.pesquisa FOR EACH ROW EXECUTE PROCEDURE public."updatePesquisaAluno"();


--
-- TOC entry 2513 (class 2606 OID 59527)
-- Name: auth_assignment auth_assignment_item_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_item_name_fkey FOREIGN KEY (item_name) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2514 (class 2606 OID 59532)
-- Name: auth_assignment auth_assignment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2517 (class 2606 OID 59537)
-- Name: auth_item_child auth_item_child_child_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_child_fkey FOREIGN KEY (child) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2518 (class 2606 OID 59542)
-- Name: auth_item_child auth_item_child_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_parent_fkey FOREIGN KEY (parent) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2515 (class 2606 OID 59547)
-- Name: auth_item auth_item_rule_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT auth_item_rule_name_fkey FOREIGN KEY (rule_name) REFERENCES public.auth_rule(name) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2523 (class 2606 OID 59552)
-- Name: conselhoaluno conselhoaluno_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhoaluno
    ADD CONSTRAINT conselhoaluno_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.aluno(matricula) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2524 (class 2606 OID 59557)
-- Name: conselhoaluno conselhoaluno_id_conselhoclasse_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhoaluno
    ADD CONSTRAINT conselhoaluno_id_conselhoclasse_fkey FOREIGN KEY (id_conselhoclasse) REFERENCES public.conselhoclasse(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2525 (class 2606 OID 59562)
-- Name: conselhoaluno conselhoaluno_id_professor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhoaluno
    ADD CONSTRAINT conselhoaluno_id_professor_fkey FOREIGN KEY (id_professor) REFERENCES public.professor(siape) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2526 (class 2606 OID 59567)
-- Name: conselhodisciplinas conselhodisciplinas_id_conselhoclasse_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhodisciplinas
    ADD CONSTRAINT conselhodisciplinas_id_conselhoclasse_fkey FOREIGN KEY (id_conselhoclasse) REFERENCES public.conselhoclasse(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2527 (class 2606 OID 59572)
-- Name: conselhodisciplinas conselhodisciplinas_id_disciplina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhodisciplinas
    ADD CONSTRAINT conselhodisciplinas_id_disciplina_fkey FOREIGN KEY (id_disciplina) REFERENCES public.disciplinas(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2528 (class 2606 OID 59577)
-- Name: conselhodisciplinas conselhodisciplinas_id_professor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhodisciplinas
    ADD CONSTRAINT conselhodisciplinas_id_professor_fkey FOREIGN KEY (id_professor) REFERENCES public.professor(siape) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2529 (class 2606 OID 59582)
-- Name: conselhoturma conselhoturma_id_conselhoclasse_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhoturma
    ADD CONSTRAINT conselhoturma_id_conselhoclasse_fkey FOREIGN KEY (id_conselhoclasse) REFERENCES public.conselhoclasse(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2530 (class 2606 OID 59587)
-- Name: conselhoturma conselhoturma_id_professor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhoturma
    ADD CONSTRAINT conselhoturma_id_professor_fkey FOREIGN KEY (id_professor) REFERENCES public.professor(siape) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2531 (class 2606 OID 59592)
-- Name: conselhoturma conselhoturma_id_turma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conselhoturma
    ADD CONSTRAINT conselhoturma_id_turma_fkey FOREIGN KEY (id_turma) REFERENCES public.turma(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2564 (class 2606 OID 59597)
-- Name: profile fk-profile-user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT "fk-profile-user_id" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 2535 (class 2606 OID 59602)
-- Name: estagio fk_aluno; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estagio
    ADD CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES public.aluno(matricula) ON UPDATE CASCADE;


--
-- TOC entry 2511 (class 2606 OID 59607)
-- Name: aluno_horas fk_aluno; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aluno_horas
    ADD CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES public.aluno(matricula);


--
-- TOC entry 2510 (class 2606 OID 59612)
-- Name: aluno fk_aluno_curso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT fk_aluno_curso FOREIGN KEY (id_curso) REFERENCES public.curso(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2549 (class 2606 OID 59617)
-- Name: nucleodepesquisa fk_areacapes; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleodepesquisa
    ADD CONSTRAINT fk_areacapes FOREIGN KEY (id_areacapes) REFERENCES public.areacapes(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2516 (class 2606 OID 59622)
-- Name: auth_item fk_auth_item_group_code; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT fk_auth_item_group_code FOREIGN KEY (group_code) REFERENCES public.auth_item_group(code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2519 (class 2606 OID 59627)
-- Name: auxilio fk_auxilio_aluno; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auxilio
    ADD CONSTRAINT fk_auxilio_aluno FOREIGN KEY (id_aluno) REFERENCES public.aluno(matricula) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2520 (class 2606 OID 59632)
-- Name: auxilio fk_auxilio_edital; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auxilio
    ADD CONSTRAINT fk_auxilio_edital FOREIGN KEY (edital) REFERENCES public.edital(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2521 (class 2606 OID 59637)
-- Name: auxilio_mes fk_auxlio_mes_auxilio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auxilio_mes
    ADD CONSTRAINT fk_auxlio_mes_auxilio FOREIGN KEY (id_auxilio) REFERENCES public.auxilio(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2507 (class 2606 OID 59642)
-- Name: extensao fk_coordenador2_professor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao
    ADD CONSTRAINT fk_coordenador2_professor FOREIGN KEY (coordenador2) REFERENCES public.professor(cpf) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2508 (class 2606 OID 59647)
-- Name: extensao fk_coordenador_professor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao
    ADD CONSTRAINT fk_coordenador_professor FOREIGN KEY (coordenador) REFERENCES public.professor(cpf) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2522 (class 2606 OID 59652)
-- Name: ch_limite fk_curso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ch_limite
    ADD CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES public.curso(id);


--
-- TOC entry 2532 (class 2606 OID 59657)
-- Name: disciplinas fk_disciplinas_professores; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.disciplinas
    ADD CONSTRAINT fk_disciplinas_professores FOREIGN KEY (id_servidor) REFERENCES public.professor(siape) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2533 (class 2606 OID 59662)
-- Name: disciplinas fk_disciplinas_turma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.disciplinas
    ADD CONSTRAINT fk_disciplinas_turma FOREIGN KEY (id_turma) REFERENCES public.turma(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2534 (class 2606 OID 59667)
-- Name: edital fk_edital; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.edital
    ADD CONSTRAINT fk_edital FOREIGN KEY (tipo) REFERENCES public.tipoedital(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2537 (class 2606 OID 59672)
-- Name: estagio_supervisor fk_estagiosupervisor_curso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estagio_supervisor
    ADD CONSTRAINT fk_estagiosupervisor_curso FOREIGN KEY (curso) REFERENCES public.curso(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2539 (class 2606 OID 59677)
-- Name: extensao_alunos fk_extensao; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao_alunos
    ADD CONSTRAINT fk_extensao FOREIGN KEY (id_extensao) REFERENCES public.extensao(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2540 (class 2606 OID 59682)
-- Name: extensao_alunos fk_extensao_alunos_aluno; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao_alunos
    ADD CONSTRAINT fk_extensao_alunos_aluno FOREIGN KEY (id_aluno) REFERENCES public.aluno(matricula) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2509 (class 2606 OID 59687)
-- Name: extensao fk_extensao_edital; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao
    ADD CONSTRAINT fk_extensao_edital FOREIGN KEY (id_edital) REFERENCES public.edital(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2541 (class 2606 OID 59692)
-- Name: extensao_ministrante fk_extensaoministrante_extensao; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao_ministrante
    ADD CONSTRAINT fk_extensaoministrante_extensao FOREIGN KEY (id_extensao) REFERENCES public.extensao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2542 (class 2606 OID 59697)
-- Name: extensao_ministrante fk_extensaoministrante_professor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extensao_ministrante
    ADD CONSTRAINT fk_extensaoministrante_professor FOREIGN KEY (id_professor) REFERENCES public.professor(cpf) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2543 (class 2606 OID 59702)
-- Name: gestao fk_gestao_servidor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gestao
    ADD CONSTRAINT fk_gestao_servidor FOREIGN KEY (id_servidor) REFERENCES public.professor(siape);


--
-- TOC entry 2512 (class 2606 OID 59707)
-- Name: aluno_horas fk_grupo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aluno_horas
    ADD CONSTRAINT fk_grupo FOREIGN KEY (grupo) REFERENCES public.ch_limite(id);


--
-- TOC entry 2544 (class 2606 OID 59712)
-- Name: nucleo_aluno fk_nucleo_alunos; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleo_aluno
    ADD CONSTRAINT fk_nucleo_alunos FOREIGN KEY (id_aluno) REFERENCES public.aluno(matricula) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2545 (class 2606 OID 59717)
-- Name: nucleo_aluno fk_nucleo_alunos_nucleodepesquisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleo_aluno
    ADD CONSTRAINT fk_nucleo_alunos_nucleodepesquisa FOREIGN KEY (id_nucleodepesquisa) REFERENCES public.nucleodepesquisa(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2550 (class 2606 OID 59722)
-- Name: nucleodepesquisa fk_nucleo_coordenador; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleodepesquisa
    ADD CONSTRAINT fk_nucleo_coordenador FOREIGN KEY (coordenador) REFERENCES public.professor(cpf) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2546 (class 2606 OID 59727)
-- Name: nucleo_professores fk_nucleo_professores; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleo_professores
    ADD CONSTRAINT fk_nucleo_professores FOREIGN KEY (id_professores) REFERENCES public.professor(cpf) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2547 (class 2606 OID 59732)
-- Name: nucleo_professores fk_nucleo_professores_nucleodepesquisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleo_professores
    ADD CONSTRAINT fk_nucleo_professores_nucleodepesquisa FOREIGN KEY (id_nucleodepesquisa) REFERENCES public.nucleodepesquisa(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2551 (class 2606 OID 59737)
-- Name: nucleodepesquisa fk_nucleovicelider_professor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleodepesquisa
    ADD CONSTRAINT fk_nucleovicelider_professor FOREIGN KEY (vicelider) REFERENCES public.professor(cpf) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2557 (class 2606 OID 59742)
-- Name: pesquisa_aluno fk_pesquisa_aluno_aluno; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_aluno
    ADD CONSTRAINT fk_pesquisa_aluno_aluno FOREIGN KEY (id_aluno) REFERENCES public.aluno(matricula) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2558 (class 2606 OID 59747)
-- Name: pesquisa_aluno fk_pesquisa_aluno_pesquisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_aluno
    ADD CONSTRAINT fk_pesquisa_aluno_pesquisa FOREIGN KEY (id_pesquisa) REFERENCES public.pesquisa(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2553 (class 2606 OID 59752)
-- Name: pesquisa fk_pesquisa_area; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa
    ADD CONSTRAINT fk_pesquisa_area FOREIGN KEY (area) REFERENCES public.areacapes(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2554 (class 2606 OID 59757)
-- Name: pesquisa fk_pesquisa_coorientador; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa
    ADD CONSTRAINT fk_pesquisa_coorientador FOREIGN KEY (coorientador) REFERENCES public.professor(cpf) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2559 (class 2606 OID 59762)
-- Name: pesquisa_coorientador fk_pesquisa_coorientador_coorientador; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_coorientador
    ADD CONSTRAINT fk_pesquisa_coorientador_coorientador FOREIGN KEY (id_coorientador) REFERENCES public.professor(cpf) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2560 (class 2606 OID 59767)
-- Name: pesquisa_coorientador fk_pesquisa_coorientador_pesquisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_coorientador
    ADD CONSTRAINT fk_pesquisa_coorientador_pesquisa FOREIGN KEY (id_pesquisa) REFERENCES public.pesquisa(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2555 (class 2606 OID 59772)
-- Name: pesquisa fk_pesquisa_edital; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa
    ADD CONSTRAINT fk_pesquisa_edital FOREIGN KEY (id_edital) REFERENCES public.edital(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2556 (class 2606 OID 59777)
-- Name: pesquisa fk_pesquisa_orientador; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa
    ADD CONSTRAINT fk_pesquisa_orientador FOREIGN KEY (orientador) REFERENCES public.professor(cpf) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2561 (class 2606 OID 59782)
-- Name: pesquisa_relatorio fk_pesquisa_relatorio_pesquisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_relatorio
    ADD CONSTRAINT fk_pesquisa_relatorio_pesquisa FOREIGN KEY (id_pesquisa) REFERENCES public.pesquisa(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2536 (class 2606 OID 59787)
-- Name: estagio fk_professor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estagio
    ADD CONSTRAINT fk_professor FOREIGN KEY (id_servidor) REFERENCES public.professor(siape) ON UPDATE CASCADE;


--
-- TOC entry 2548 (class 2606 OID 59792)
-- Name: nucleorelatorio fk_relatorio_nucleodepesquisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleorelatorio
    ADD CONSTRAINT fk_relatorio_nucleodepesquisa FOREIGN KEY (idnucleo) REFERENCES public.nucleodepesquisa(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2562 (class 2606 OID 59797)
-- Name: plano_de_trab fk_siape; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_de_trab
    ADD CONSTRAINT fk_siape FOREIGN KEY (siape_fk) REFERENCES public.professor(siape) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2565 (class 2606 OID 59802)
-- Name: subareacapes fk_subarea_area; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subareacapes
    ADD CONSTRAINT fk_subarea_area FOREIGN KEY (id_area) REFERENCES public.areacapes(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 2552 (class 2606 OID 59807)
-- Name: nucleodepesquisa fk_subareacapes; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleodepesquisa
    ADD CONSTRAINT fk_subareacapes FOREIGN KEY (id_subarea) REFERENCES public.subareacapes(numero) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2538 (class 2606 OID 59812)
-- Name: estagio_supervisor fk_supervisor_servidor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estagio_supervisor
    ADD CONSTRAINT fk_supervisor_servidor FOREIGN KEY (siape_supervisor) REFERENCES public.professor(siape) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2566 (class 2606 OID 59817)
-- Name: tcc fk_tcc_aluno; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tcc
    ADD CONSTRAINT fk_tcc_aluno FOREIGN KEY (id_aluno) REFERENCES public.aluno(matricula) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2567 (class 2606 OID 59822)
-- Name: tcc fk_tcc_aluno2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tcc
    ADD CONSTRAINT fk_tcc_aluno2 FOREIGN KEY (id_aluno2) REFERENCES public.aluno(matricula) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2568 (class 2606 OID 59827)
-- Name: tcc fk_tcc_servidor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tcc
    ADD CONSTRAINT fk_tcc_servidor FOREIGN KEY (id_servidor) REFERENCES public.professor(siape) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2563 (class 2606 OID 59832)
-- Name: plano_de_trab fk_tipo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_de_trab
    ADD CONSTRAINT fk_tipo FOREIGN KEY (tipo_fk) REFERENCES public.tipo_atividade(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2569 (class 2606 OID 59837)
-- Name: turma turma_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.curso(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2570 (class 2606 OID 59842)
-- Name: user_visit_log user_visit_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_visit_log
    ADD CONSTRAINT user_visit_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2020-04-12 18:08:01

--
-- PostgreSQL database dump complete
--


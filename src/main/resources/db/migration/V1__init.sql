77--
-- PostgreSQL database cluster dump
--
--
-- Started on 2023-04-25 22:23:16
--
--SET default_transaction_read_only = off;
--
--SET client_encoding = 'UTF8';
--SET standard_conforming_strings = on;
--
--
-- Roles
--
--
--CREATE ROLE postgres;
--ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
--
--
-- User Configurations
--
--
--
--
--
--
--
--
--
--
-- Databases
--
--
--
-- Database "template1" dump
--
--
--\connect template1
--
--
-- PostgreSQL database dump
--
--
-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2
--
-- Started on 2023-04-25 22:23:16
--
--SET statement_timeout = 0;
--SET lock_timeout = 0;
--SET idle_in_transaction_session_timeout = 0;
--SET client_encoding = 'UTF8';
--SET standard_conforming_strings = on;
--SELECT pg_catalog.set_config('search_path', '', false);
--SET check_function_bodies = false;
--SET xmloption = content;
--SET client_min_messages = warning;
--SET row_security = off;
--
-- Completed on 2023-04-25 22:23:17
--
--
-- PostgreSQL database dump complete
--
--
--
-- Database "loja_virtual" dump
--
--
--
-- PostgreSQL database dump
--
--
-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2
--
-- Started on 2023-04-25 22:23:17
--
--SET statement_timeout = 0;
--SET lock_timeout = 0;
--SET idle_in_transaction_session_timeout = 0;
--SET client_encoding = 'UTF8';
--SET standard_conforming_strings = on;
--SELECT pg_catalog.set_config('search_path', '', false);
--SET check_function_bodies = false;
--SET xmloption = content;
--SET client_min_messages = warning;
--SET row_security = off;
--
--
-- TOC entry 3506 (class 1262 OID 17670)
-- Name: loja_virtual; Type: DATABASE; Schema: -; Owner: postgres
--
--
--CREATE DATABASE loja_virtual WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
--
--
ALTER DATABASE loja_virtual OWNER TO postgres;
--
--\connect loja_virtual

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
-- TOC entry 254 (class 1255 OID 18099)
-- Name: validaChavePessoa(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."validaChavePessoa"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

declare existe integer;
begin
 	existe = (select count(1) from pessoa_fisica where id = new.pessoa_id);

	if (existe <= 0) then
		existe = (select count(1) from pessoa_juridica where id = new.pessoa_id);

		if (existe <= 0) then
			raise exception 'BDERROR01: ID da pessoa para realizar a associação do cadastro não foi encontrado.';
		end if;

	end if;

	return new;

end;

$$;


ALTER FUNCTION public."validaChavePessoa"() OWNER TO postgres;

--
-- TOC entry 255 (class 1255 OID 18110)
-- Name: validaChavePessoaForn(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."validaChavePessoaForn"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

declare existe integer;
begin
 	existe = (select count(1) from pessoa_fisica where id = new.pessoa_forn_id);

	if (existe <= 0) then
		existe = (select count(1) from pessoa_juridica where id = new.pessoa_forn_id);

		if (existe <= 0) then
			raise exception 'BDERROR02: ID da pessoa (fornecedor) para realizar a associação do cadastro não foi encontrado.';
		end if;

	end if;

	return new;

end;
$$;


ALTER FUNCTION public."validaChavePessoaForn"() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 17672)
-- Name: acesso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acesso (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.acesso OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17671)
-- Name: acesso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.acesso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acesso_id_seq OWNER TO postgres;

--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 214
-- Name: acesso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.acesso_id_seq OWNED BY public.acesso.id;


--
-- TOC entry 237 (class 1259 OID 17923)
-- Name: avaliacao_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avaliacao_produto (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL,
    nota integer NOT NULL,
    pessoa_id bigint NOT NULL,
    produto_id bigint NOT NULL
);


ALTER TABLE public.avaliacao_produto OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17922)
-- Name: avaliacao_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avaliacao_produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avaliacao_produto_id_seq OWNER TO postgres;

--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 236
-- Name: avaliacao_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avaliacao_produto_id_seq OWNED BY public.avaliacao_produto.id;


--
-- TOC entry 239 (class 1259 OID 17935)
-- Name: categoria_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria_produto (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.categoria_produto OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17934)
-- Name: categoria_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_produto_id_seq OWNER TO postgres;

--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 238
-- Name: categoria_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_produto_id_seq OWNED BY public.categoria_produto.id;


--
-- TOC entry 241 (class 1259 OID 17942)
-- Name: conta_pagar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conta_pagar (
    id bigint NOT NULL,
    data_pagamento date,
    data_vencimento date NOT NULL,
    descricao character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    valor_desconto numeric(38,2),
    valor_total numeric(38,2) NOT NULL,
    fornecedor_id bigint NOT NULL,
    pessoa_id bigint NOT NULL
);


ALTER TABLE public.conta_pagar OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17941)
-- Name: conta_pagar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conta_pagar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conta_pagar_id_seq OWNER TO postgres;

--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 240
-- Name: conta_pagar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conta_pagar_id_seq OWNED BY public.conta_pagar.id;


--
-- TOC entry 243 (class 1259 OID 17956)
-- Name: conta_receber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conta_receber (
    id bigint NOT NULL,
    data_pagamento date,
    data_vencimento date NOT NULL,
    descricao character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    valor_desconto numeric(38,2),
    valor_total numeric(38,2) NOT NULL,
    pessoa_id bigint NOT NULL
);


ALTER TABLE public.conta_receber OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17955)
-- Name: conta_receber_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conta_receber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conta_receber_id_seq OWNER TO postgres;

--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 242
-- Name: conta_receber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conta_receber_id_seq OWNED BY public.conta_receber.id;


--
-- TOC entry 217 (class 1259 OID 17704)
-- Name: cupom_desconto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cupom_desconto (
    id bigint NOT NULL,
    valor_monetario numeric(38,2),
    valor_porcentagem numeric(38,2),
    codigo character varying(255) NOT NULL,
    data_validade date NOT NULL
);


ALTER TABLE public.cupom_desconto OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17703)
-- Name: cupom_desconto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cupom_desconto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cupom_desconto_id_seq OWNER TO postgres;

--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 216
-- Name: cupom_desconto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cupom_desconto_id_seq OWNED BY public.cupom_desconto.id;


--
-- TOC entry 245 (class 1259 OID 17965)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco (
    id bigint NOT NULL,
    bairro character varying(255) NOT NULL,
    cep character varying(255) NOT NULL,
    cidade character varying(255) NOT NULL,
    complemento character varying(255),
    numero character varying(255) NOT NULL,
    rua character varying(255) NOT NULL,
    tipo_endereco character varying(255) NOT NULL,
    uf character varying(255) NOT NULL,
    pessoa_id bigint NOT NULL
);


ALTER TABLE public.endereco OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17964)
-- Name: endereco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endereco_id_seq OWNER TO postgres;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 244
-- Name: endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.endereco_id_seq OWNED BY public.endereco.id;


--
-- TOC entry 219 (class 1259 OID 17720)
-- Name: forma_pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forma_pagamento (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.forma_pagamento OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17719)
-- Name: forma_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forma_pagamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forma_pagamento_id_seq OWNER TO postgres;

--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 218
-- Name: forma_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forma_pagamento_id_seq OWNED BY public.forma_pagamento.id;


--
-- TOC entry 221 (class 1259 OID 17727)
-- Name: imagem_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imagem_produto (
    id bigint NOT NULL,
    produto_id bigint NOT NULL,
    imagem_miniatura text NOT NULL,
    imagem_original text NOT NULL
);


ALTER TABLE public.imagem_produto OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17726)
-- Name: imagem_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imagem_produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imagem_produto_id_seq OWNER TO postgres;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 220
-- Name: imagem_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagem_produto_id_seq OWNED BY public.imagem_produto.id;


--
-- TOC entry 223 (class 1259 OID 17736)
-- Name: item_venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_venda (
    id bigint NOT NULL,
    produto_id bigint NOT NULL,
    venda_id bigint NOT NULL,
    quantidade double precision NOT NULL
);


ALTER TABLE public.item_venda OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17735)
-- Name: item_venda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_venda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_venda_id_seq OWNER TO postgres;

--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 222
-- Name: item_venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_venda_id_seq OWNED BY public.item_venda.id;


--
-- TOC entry 225 (class 1259 OID 17743)
-- Name: marca_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca_produto (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.marca_produto OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17742)
-- Name: marca_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marca_produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marca_produto_id_seq OWNER TO postgres;

--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 224
-- Name: marca_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marca_produto_id_seq OWNED BY public.marca_produto.id;


--
-- TOC entry 247 (class 1259 OID 17984)
-- Name: nota_fiscal_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nota_fiscal_compra (
    id bigint NOT NULL,
    descricao character varying(255),
    numero character varying(255) NOT NULL,
    serie character varying(255) NOT NULL,
    valor_desconto numeric(38,2),
    valoricms numeric(38,2) NOT NULL,
    valor_total numeric(38,2) NOT NULL,
    conta_pagar_id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    data_compra date NOT NULL
);


ALTER TABLE public.nota_fiscal_compra OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17983)
-- Name: nota_fiscal_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nota_fiscal_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nota_fiscal_compra_id_seq OWNER TO postgres;

--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 246
-- Name: nota_fiscal_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nota_fiscal_compra_id_seq OWNED BY public.nota_fiscal_compra.id;


--
-- TOC entry 249 (class 1259 OID 18004)
-- Name: nota_fiscal_venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nota_fiscal_venda (
    id bigint NOT NULL,
    numero character varying(255) NOT NULL,
    pdf text NOT NULL,
    serie character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    xml text NOT NULL,
    venda_id bigint NOT NULL
);


ALTER TABLE public.nota_fiscal_venda OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 18003)
-- Name: nota_fiscal_venda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nota_fiscal_venda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nota_fiscal_venda_id_seq OWNER TO postgres;

--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 248
-- Name: nota_fiscal_venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nota_fiscal_venda_id_seq OWNED BY public.nota_fiscal_venda.id;


--
-- TOC entry 227 (class 1259 OID 17768)
-- Name: nota_item_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nota_item_produto (
    id bigint NOT NULL,
    quantidade double precision NOT NULL,
    nota_fiscal_compra_id bigint NOT NULL,
    produto_id bigint NOT NULL
);


ALTER TABLE public.nota_item_produto OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17767)
-- Name: nota_item_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nota_item_produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nota_item_produto_id_seq OWNER TO postgres;

--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 226
-- Name: nota_item_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nota_item_produto_id_seq OWNED BY public.nota_item_produto.id;


--
-- TOC entry 235 (class 1259 OID 17829)
-- Name: seq_pessoa; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_pessoa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_pessoa OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17774)
-- Name: pessoa_fisica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa_fisica (
    id bigint DEFAULT nextval('public.seq_pessoa'::regclass) NOT NULL,
    cpf character varying(255) NOT NULL,
    data_nascimento date,
    email character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    telefone character varying(255) NOT NULL
);


ALTER TABLE public.pessoa_fisica OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17781)
-- Name: pessoa_juridica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa_juridica (
    id bigint DEFAULT nextval('public.seq_pessoa'::regclass) NOT NULL,
    cnpj character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    telefone character varying(255) NOT NULL,
    categoria character varying(255),
    inscricao_estadual character varying(255) NOT NULL,
    inscricao_municipal character varying(255),
    nome_fantasia character varying(255) NOT NULL,
    razao_social character varying(255) NOT NULL
);


ALTER TABLE public.pessoa_juridica OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 18023)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    id bigint NOT NULL,
    alerta_estoque boolean,
    altura double precision NOT NULL,
    ativo boolean NOT NULL,
    descricao text NOT NULL,
    largura double precision NOT NULL,
    link_video character varying(255),
    nome character varying(255) NOT NULL,
    peso double precision NOT NULL,
    profundidade double precision NOT NULL,
    quantidade_alerta_estoque integer,
    quantidade_cliques integer,
    quantidade_estoque integer NOT NULL,
    tipo_unidade character varying(255) NOT NULL,
    valor_venda numeric(38,2) NOT NULL
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 18022)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produto_id_seq OWNER TO postgres;

--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 250
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 231 (class 1259 OID 17798)
-- Name: status_rastreio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status_rastreio (
    id bigint NOT NULL,
    centro_distribuicao character varying(255),
    cidade character varying(255),
    estado character varying(255),
    status character varying(255),
    venda_id bigint NOT NULL
);


ALTER TABLE public.status_rastreio OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17797)
-- Name: status_rastreio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_rastreio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_rastreio_id_seq OWNER TO postgres;

--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 230
-- Name: status_rastreio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_rastreio_id_seq OWNED BY public.status_rastreio.id;


--
-- TOC entry 233 (class 1259 OID 17807)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    data_atualizacao_senha date NOT NULL,
    login character varying(255) NOT NULL,
    senha character varying(255) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17815)
-- Name: usuario_acesso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_acesso (
    usuario_id bigint NOT NULL,
    acesso_id bigint NOT NULL
);


ALTER TABLE public.usuario_acesso OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17806)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 232
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 253 (class 1259 OID 18052)
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda (
    id bigint NOT NULL,
    data_entrega date NOT NULL,
    data_venda date NOT NULL,
    dias_para_entrega integer NOT NULL,
    valor_desconto numeric(38,2),
    valor_frete numeric(38,2) NOT NULL,
    valor_total numeric(38,2) NOT NULL,
    cupom_desconto_id bigint,
    endereco_cobranca_id bigint NOT NULL,
    endereco_entrega_id bigint NOT NULL,
    forma_pagamento_id bigint NOT NULL,
    nota_fiscal_venda_id bigint NOT NULL,
    pessoa_id bigint NOT NULL
);


ALTER TABLE public.venda OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 18051)
-- Name: venda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venda_id_seq OWNER TO postgres;

--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 252
-- Name: venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venda_id_seq OWNED BY public.venda.id;


--
-- TOC entry 3273 (class 2604 OID 17675)
-- Name: acesso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acesso ALTER COLUMN id SET DEFAULT nextval('public.acesso_id_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 17926)
-- Name: avaliacao_produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao_produto ALTER COLUMN id SET DEFAULT nextval('public.avaliacao_produto_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 17938)
-- Name: categoria_produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_produto ALTER COLUMN id SET DEFAULT nextval('public.categoria_produto_id_seq'::regclass);


--
-- TOC entry 3286 (class 2604 OID 17945)
-- Name: conta_pagar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta_pagar ALTER COLUMN id SET DEFAULT nextval('public.conta_pagar_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 17959)
-- Name: conta_receber id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta_receber ALTER COLUMN id SET DEFAULT nextval('public.conta_receber_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 17707)
-- Name: cupom_desconto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cupom_desconto ALTER COLUMN id SET DEFAULT nextval('public.cupom_desconto_id_seq'::regclass);


--
-- TOC entry 3288 (class 2604 OID 17968)
-- Name: endereco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id SET DEFAULT nextval('public.endereco_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 17723)
-- Name: forma_pagamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_pagamento ALTER COLUMN id SET DEFAULT nextval('public.forma_pagamento_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 17730)
-- Name: imagem_produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagem_produto ALTER COLUMN id SET DEFAULT nextval('public.imagem_produto_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 17739)
-- Name: item_venda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_venda ALTER COLUMN id SET DEFAULT nextval('public.item_venda_id_seq'::regclass);


--
-- TOC entry 3278 (class 2604 OID 17746)
-- Name: marca_produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca_produto ALTER COLUMN id SET DEFAULT nextval('public.marca_produto_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 17987)
-- Name: nota_fiscal_compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal_compra ALTER COLUMN id SET DEFAULT nextval('public.nota_fiscal_compra_id_seq'::regclass);


--
-- TOC entry 3290 (class 2604 OID 18007)
-- Name: nota_fiscal_venda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal_venda ALTER COLUMN id SET DEFAULT nextval('public.nota_fiscal_venda_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 17771)
-- Name: nota_item_produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_item_produto ALTER COLUMN id SET DEFAULT nextval('public.nota_item_produto_id_seq'::regclass);


--
-- TOC entry 3291 (class 2604 OID 18026)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 17801)
-- Name: status_rastreio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_rastreio ALTER COLUMN id SET DEFAULT nextval('public.status_rastreio_id_seq'::regclass);


--
-- TOC entry 3283 (class 2604 OID 17810)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 3292 (class 2604 OID 18055)
-- Name: venda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda ALTER COLUMN id SET DEFAULT nextval('public.venda_id_seq'::regclass);


--
-- TOC entry 3294 (class 2606 OID 17677)
-- Name: acesso acesso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acesso
    ADD CONSTRAINT acesso_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 17928)
-- Name: avaliacao_produto avaliacao_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao_produto
    ADD CONSTRAINT avaliacao_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3320 (class 2606 OID 17940)
-- Name: categoria_produto categoria_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_produto
    ADD CONSTRAINT categoria_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3322 (class 2606 OID 17949)
-- Name: conta_pagar conta_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta_pagar
    ADD CONSTRAINT conta_pagar_pkey PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 17963)
-- Name: conta_receber conta_receber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conta_receber
    ADD CONSTRAINT conta_receber_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 17709)
-- Name: cupom_desconto cupom_desconto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cupom_desconto
    ADD CONSTRAINT cupom_desconto_pkey PRIMARY KEY (id);


--
-- TOC entry 3326 (class 2606 OID 17972)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);


--
-- TOC entry 3298 (class 2606 OID 17725)
-- Name: forma_pagamento forma_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_pagamento
    ADD CONSTRAINT forma_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3300 (class 2606 OID 17734)
-- Name: imagem_produto imagem_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagem_produto
    ADD CONSTRAINT imagem_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 17741)
-- Name: item_venda item_venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT item_venda_pkey PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 17748)
-- Name: marca_produto marca_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca_produto
    ADD CONSTRAINT marca_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 17991)
-- Name: nota_fiscal_compra nota_fiscal_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal_compra
    ADD CONSTRAINT nota_fiscal_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 18011)
-- Name: nota_fiscal_venda nota_fiscal_venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal_venda
    ADD CONSTRAINT nota_fiscal_venda_pkey PRIMARY KEY (id);


--
-- TOC entry 3306 (class 2606 OID 17773)
-- Name: nota_item_produto nota_item_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_item_produto
    ADD CONSTRAINT nota_item_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 17780)
-- Name: pessoa_fisica pessoa_fisica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT pessoa_fisica_pkey PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 17787)
-- Name: pessoa_juridica pessoa_juridica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa_juridica
    ADD CONSTRAINT pessoa_juridica_pkey PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 18030)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3312 (class 2606 OID 17805)
-- Name: status_rastreio status_rastreio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_rastreio
    ADD CONSTRAINT status_rastreio_pkey PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 17828)
-- Name: usuario_acesso unique_acesso_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_acesso
    ADD CONSTRAINT unique_acesso_user UNIQUE (usuario_id, acesso_id);


--
-- TOC entry 3314 (class 2606 OID 17814)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 18057)
-- Name: venda venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2620 OID 18101)
-- Name: avaliacao_produto validaChavePessoa_AvaliacaoProduto; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "validaChavePessoa_AvaliacaoProduto" BEFORE INSERT OR UPDATE ON public.avaliacao_produto FOR EACH ROW EXECUTE FUNCTION public."validaChavePessoa"();


--
-- TOC entry 3354 (class 2620 OID 18102)
-- Name: conta_pagar validaChavePessoa_ContaPagar; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "validaChavePessoa_ContaPagar" BEFORE INSERT OR UPDATE ON public.conta_pagar FOR EACH ROW EXECUTE FUNCTION public."validaChavePessoa"();


--
-- TOC entry 3355 (class 2620 OID 18111)
-- Name: conta_pagar validaChavePessoa_ContaPagar-fornecedor; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "validaChavePessoa_ContaPagar-fornecedor" BEFORE INSERT OR UPDATE ON public.conta_pagar FOR EACH ROW EXECUTE FUNCTION public."validaChavePessoaForn"();


--
-- TOC entry 3356 (class 2620 OID 18103)
-- Name: conta_receber validaChavePessoa_ContaReceber; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "validaChavePessoa_ContaReceber" BEFORE INSERT OR UPDATE ON public.conta_receber FOR EACH ROW EXECUTE FUNCTION public."validaChavePessoa"();


--
-- TOC entry 3357 (class 2620 OID 18104)
-- Name: endereco validaChavePessoa_Endereco; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "validaChavePessoa_Endereco" BEFORE INSERT OR UPDATE ON public.endereco FOR EACH ROW EXECUTE FUNCTION public."validaChavePessoa"();


--
-- TOC entry 3353 (class 2620 OID 18112)
-- Name: avaliacao_produto validaChavePessoa_NotaFiscalCompra; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "validaChavePessoa_NotaFiscalCompra" BEFORE INSERT OR UPDATE ON public.avaliacao_produto FOR EACH ROW EXECUTE FUNCTION public."validaChavePessoa"();


--
-- TOC entry 3351 (class 2620 OID 18105)
-- Name: usuario validaChavePessoa_Usuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "validaChavePessoa_Usuario" BEFORE INSERT OR UPDATE ON public.usuario FOR EACH ROW EXECUTE FUNCTION public."validaChavePessoa"();


--
-- TOC entry 3358 (class 2620 OID 18106)
-- Name: venda validaChavePessoa_Venda; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "validaChavePessoa_Venda" BEFORE INSERT OR UPDATE ON public.venda FOR EACH ROW EXECUTE FUNCTION public."validaChavePessoa"();


--
-- TOC entry 3341 (class 2606 OID 17870)
-- Name: usuario_acesso acesso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_acesso
    ADD CONSTRAINT acesso_fk FOREIGN KEY (acesso_id) REFERENCES public.acesso(id);


--
-- TOC entry 3344 (class 2606 OID 17992)
-- Name: nota_fiscal_compra conta_pagar_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal_compra
    ADD CONSTRAINT conta_pagar_fk FOREIGN KEY (conta_pagar_id) REFERENCES public.conta_pagar(id);


--
-- TOC entry 3346 (class 2606 OID 18073)
-- Name: venda cupom_desconto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT cupom_desconto_fk FOREIGN KEY (cupom_desconto_id) REFERENCES public.cupom_desconto(id);


--
-- TOC entry 3347 (class 2606 OID 18078)
-- Name: venda endereco_cobranca_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT endereco_cobranca_fk FOREIGN KEY (endereco_cobranca_id) REFERENCES public.endereco(id);


--
-- TOC entry 3348 (class 2606 OID 18083)
-- Name: venda endereco_entrega_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT endereco_entrega_fk FOREIGN KEY (endereco_entrega_id) REFERENCES public.endereco(id);


--
-- TOC entry 3349 (class 2606 OID 18088)
-- Name: venda forma_pagamento_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT forma_pagamento_fk FOREIGN KEY (forma_pagamento_id) REFERENCES public.forma_pagamento(id);


--
-- TOC entry 3338 (class 2606 OID 17997)
-- Name: nota_item_produto nota_fiscal_compra_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_item_produto
    ADD CONSTRAINT nota_fiscal_compra_fk FOREIGN KEY (nota_fiscal_compra_id) REFERENCES public.nota_fiscal_compra(id);


--
-- TOC entry 3350 (class 2606 OID 18093)
-- Name: venda nota_fiscal_venda_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT nota_fiscal_venda_fk FOREIGN KEY (nota_fiscal_venda_id) REFERENCES public.nota_fiscal_venda(id);


--
-- TOC entry 3343 (class 2606 OID 18031)
-- Name: avaliacao_produto produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao_produto
    ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- TOC entry 3335 (class 2606 OID 18036)
-- Name: imagem_produto produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagem_produto
    ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- TOC entry 3336 (class 2606 OID 18041)
-- Name: item_venda produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- TOC entry 3339 (class 2606 OID 18046)
-- Name: nota_item_produto produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_item_produto
    ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- TOC entry 3342 (class 2606 OID 17875)
-- Name: usuario_acesso usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_acesso
    ADD CONSTRAINT usuario_fk FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- TOC entry 3337 (class 2606 OID 18058)
-- Name: item_venda venda_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT venda_fk FOREIGN KEY (venda_id) REFERENCES public.venda(id);


--
-- TOC entry 3345 (class 2606 OID 18063)
-- Name: nota_fiscal_venda venda_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_fiscal_venda
    ADD CONSTRAINT venda_fk FOREIGN KEY (venda_id) REFERENCES public.venda(id);


--
-- TOC entry 3340 (class 2606 OID 18068)
-- Name: status_rastreio venda_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_rastreio
    ADD CONSTRAINT venda_fk FOREIGN KEY (venda_id) REFERENCES public.venda(id);


-- Completed on 2023-04-25 22:23:18

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-04-25 22:23:18

--
-- PostgreSQL database cluster dump complete
--


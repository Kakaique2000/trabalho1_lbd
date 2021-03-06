PGDMP         2                w            postgres    12.1    12.0 Z    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    13318    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    2959                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    1            �            1259    17466    anais_de_conferencia    TABLE     �   CREATE TABLE public.anais_de_conferencia (
    id_anal_conf integer NOT NULL,
    id_editora integer NOT NULL,
    volume character varying(70),
    numero integer,
    data date
);
 (   DROP TABLE public.anais_de_conferencia;
       public         heap    postgres    false            �            1259    17469    artigos    TABLE     �   CREATE TABLE public.artigos (
    id_artigo integer NOT NULL,
    id_editora integer,
    tipo_artigo character varying NOT NULL,
    pg_inicial integer,
    pg_final integer
);
    DROP TABLE public.artigos;
       public         heap    postgres    false            �            1259    17475    artigos_de_anais    TABLE     �   CREATE TABLE public.artigos_de_anais (
    id_artigo integer NOT NULL,
    titulo_congresso character varying(60),
    numero integer,
    data date,
    id_anal_conf integer,
    volume character varying(255)
);
 $   DROP TABLE public.artigos_de_anais;
       public         heap    postgres    false            �            1259    17478    artigos_de_livros    TABLE     �   CREATE TABLE public.artigos_de_livros (
    id_artigo integer NOT NULL,
    titulo_artigo character varying(60),
    num_edicao integer,
    num_cap integer,
    id_artigo_1 integer,
    ano_pub integer
);
 %   DROP TABLE public.artigos_de_livros;
       public         heap    postgres    false            �            1259    17481    artigos_de_periodicos    TABLE     �   CREATE TABLE public.artigos_de_periodicos (
    id_artigo integer NOT NULL,
    titulo_periodico integer,
    num_volume integer,
    data date,
    id_periodico integer
);
 )   DROP TABLE public.artigos_de_periodicos;
       public         heap    postgres    false            �            1259    17484    autores    TABLE     j   CREATE TABLE public.autores (
    id_autor integer NOT NULL,
    nome_autor character varying NOT NULL
);
    DROP TABLE public.autores;
       public         heap    postgres    false            �            1259    17490    autores_id_autor_seq    SEQUENCE     �   CREATE SEQUENCE public.autores_id_autor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.autores_id_autor_seq;
       public          postgres    false    208            �           0    0    autores_id_autor_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.autores_id_autor_seq OWNED BY public.autores.id_autor;
          public          postgres    false    209            �            1259    17492 	   capitulos    TABLE     �   CREATE TABLE public.capitulos (
    id_capitulo integer NOT NULL,
    id_livro integer NOT NULL,
    capitulo character varying(10)
);
    DROP TABLE public.capitulos;
       public         heap    postgres    false            �            1259    17495    capitulos_id_capitulo_seq    SEQUENCE     �   CREATE SEQUENCE public.capitulos_id_capitulo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.capitulos_id_capitulo_seq;
       public          postgres    false    210            �           0    0    capitulos_id_capitulo_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.capitulos_id_capitulo_seq OWNED BY public.capitulos.id_capitulo;
          public          postgres    false    211            �            1259    17497    editoras    TABLE     e   CREATE TABLE public.editoras (
    id_editora integer NOT NULL,
    editora character varying(40)
);
    DROP TABLE public.editoras;
       public         heap    postgres    false            �            1259    17500    editoras_id_editora_seq    SEQUENCE     �   CREATE SEQUENCE public.editoras_id_editora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.editoras_id_editora_seq;
       public          postgres    false    212            �           0    0    editoras_id_editora_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.editoras_id_editora_seq OWNED BY public.editoras.id_editora;
          public          postgres    false    213            �            1259    17661    emprestimos    TABLE     �   CREATE TABLE public.emprestimos (
    id_emprestimo integer NOT NULL,
    id_pub integer NOT NULL,
    data_devolucao date NOT NULL,
    data_emprestimo date NOT NULL,
    cpf_cnpj_pessoa character varying(14) NOT NULL
);
    DROP TABLE public.emprestimos;
       public         heap    postgres    false            �            1259    17659    emprestimos_id_emprestimo_seq    SEQUENCE     �   CREATE SEQUENCE public.emprestimos_id_emprestimo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.emprestimos_id_emprestimo_seq;
       public          postgres    false    221            �           0    0    emprestimos_id_emprestimo_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.emprestimos_id_emprestimo_seq OWNED BY public.emprestimos.id_emprestimo;
          public          postgres    false    220            �            1259    17507    livros    TABLE       CREATE TABLE public.livros (
    id_livro integer NOT NULL,
    id_editora integer NOT NULL,
    titulo character varying(60) NOT NULL,
    tipo_livro character varying(20),
    titulo_original character varying(60),
    num_edicao integer,
    ano_pub date,
    num_pag integer
);
    DROP TABLE public.livros;
       public         heap    postgres    false            �            1259    17510    monografias    TABLE     �   CREATE TABLE public.monografias (
    id_monografia integer NOT NULL,
    numero_monog integer NOT NULL,
    nome_instituicao character varying(70),
    data date
);
    DROP TABLE public.monografias;
       public         heap    postgres    false            �            1259    17513 
   periodicos    TABLE     �   CREATE TABLE public.periodicos (
    id_periodico integer NOT NULL,
    id_artigo integer NOT NULL,
    titulo character varying(70),
    volume character varying(70),
    numero integer,
    data date
);
    DROP TABLE public.periodicos;
       public         heap    postgres    false            �            1259    17672    pessoas    TABLE     �   CREATE TABLE public.pessoas (
    nome_pessoa character varying(255) NOT NULL,
    cpf_cnpj_pessoa character varying(14) NOT NULL
);
    DROP TABLE public.pessoas;
       public         heap    postgres    false            �            1259    17521    publicacoes    TABLE     �   CREATE TABLE public.publicacoes (
    id_pub integer NOT NULL,
    tipo_publicacao character varying(20) NOT NULL,
    local_publicacao character varying NOT NULL,
    tema_publicacao character varying(50),
    titulo_publicacao character varying(50)
);
    DROP TABLE public.publicacoes;
       public         heap    postgres    false            �            1259    17527    publicacoes_autores    TABLE     h   CREATE TABLE public.publicacoes_autores (
    id_pub integer NOT NULL,
    id_autor integer NOT NULL
);
 '   DROP TABLE public.publicacoes_autores;
       public         heap    postgres    false            �            1259    17530    publicacoes_id_pub_seq    SEQUENCE     �   CREATE SEQUENCE public.publicacoes_id_pub_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.publicacoes_id_pub_seq;
       public          postgres    false    217            �           0    0    publicacoes_id_pub_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.publicacoes_id_pub_seq OWNED BY public.publicacoes.id_pub;
          public          postgres    false    219            �
           2604    17532    autores id_autor    DEFAULT     t   ALTER TABLE ONLY public.autores ALTER COLUMN id_autor SET DEFAULT nextval('public.autores_id_autor_seq'::regclass);
 ?   ALTER TABLE public.autores ALTER COLUMN id_autor DROP DEFAULT;
       public          postgres    false    209    208            �
           2604    17533    capitulos id_capitulo    DEFAULT     ~   ALTER TABLE ONLY public.capitulos ALTER COLUMN id_capitulo SET DEFAULT nextval('public.capitulos_id_capitulo_seq'::regclass);
 D   ALTER TABLE public.capitulos ALTER COLUMN id_capitulo DROP DEFAULT;
       public          postgres    false    211    210            �
           2604    17534    editoras id_editora    DEFAULT     z   ALTER TABLE ONLY public.editoras ALTER COLUMN id_editora SET DEFAULT nextval('public.editoras_id_editora_seq'::regclass);
 B   ALTER TABLE public.editoras ALTER COLUMN id_editora DROP DEFAULT;
       public          postgres    false    213    212            �
           2604    17664    emprestimos id_emprestimo    DEFAULT     �   ALTER TABLE ONLY public.emprestimos ALTER COLUMN id_emprestimo SET DEFAULT nextval('public.emprestimos_id_emprestimo_seq'::regclass);
 H   ALTER TABLE public.emprestimos ALTER COLUMN id_emprestimo DROP DEFAULT;
       public          postgres    false    220    221    221            �
           2604    17537    publicacoes id_pub    DEFAULT     x   ALTER TABLE ONLY public.publicacoes ALTER COLUMN id_pub SET DEFAULT nextval('public.publicacoes_id_pub_seq'::regclass);
 A   ALTER TABLE public.publicacoes ALTER COLUMN id_pub DROP DEFAULT;
       public          postgres    false    219    217            v          0    17466    anais_de_conferencia 
   TABLE DATA           ^   COPY public.anais_de_conferencia (id_anal_conf, id_editora, volume, numero, data) FROM stdin;
    public          postgres    false    203   �o       w          0    17469    artigos 
   TABLE DATA           [   COPY public.artigos (id_artigo, id_editora, tipo_artigo, pg_inicial, pg_final) FROM stdin;
    public          postgres    false    204   �o       x          0    17475    artigos_de_anais 
   TABLE DATA           k   COPY public.artigos_de_anais (id_artigo, titulo_congresso, numero, data, id_anal_conf, volume) FROM stdin;
    public          postgres    false    205   2p       y          0    17478    artigos_de_livros 
   TABLE DATA           p   COPY public.artigos_de_livros (id_artigo, titulo_artigo, num_edicao, num_cap, id_artigo_1, ano_pub) FROM stdin;
    public          postgres    false    206   �p       z          0    17481    artigos_de_periodicos 
   TABLE DATA           l   COPY public.artigos_de_periodicos (id_artigo, titulo_periodico, num_volume, data, id_periodico) FROM stdin;
    public          postgres    false    207   �p       {          0    17484    autores 
   TABLE DATA           7   COPY public.autores (id_autor, nome_autor) FROM stdin;
    public          postgres    false    208   �p       }          0    17492 	   capitulos 
   TABLE DATA           D   COPY public.capitulos (id_capitulo, id_livro, capitulo) FROM stdin;
    public          postgres    false    210   
q                 0    17497    editoras 
   TABLE DATA           7   COPY public.editoras (id_editora, editora) FROM stdin;
    public          postgres    false    212   'q       �          0    17661    emprestimos 
   TABLE DATA           n   COPY public.emprestimos (id_emprestimo, id_pub, data_devolucao, data_emprestimo, cpf_cnpj_pessoa) FROM stdin;
    public          postgres    false    221   Wq       �          0    17507    livros 
   TABLE DATA           y   COPY public.livros (id_livro, id_editora, titulo, tipo_livro, titulo_original, num_edicao, ano_pub, num_pag) FROM stdin;
    public          postgres    false    214   �q       �          0    17510    monografias 
   TABLE DATA           Z   COPY public.monografias (id_monografia, numero_monog, nome_instituicao, data) FROM stdin;
    public          postgres    false    215   �q       �          0    17513 
   periodicos 
   TABLE DATA           [   COPY public.periodicos (id_periodico, id_artigo, titulo, volume, numero, data) FROM stdin;
    public          postgres    false    216   �q       �          0    17672    pessoas 
   TABLE DATA           ?   COPY public.pessoas (nome_pessoa, cpf_cnpj_pessoa) FROM stdin;
    public          postgres    false    222   r       �          0    17521    publicacoes 
   TABLE DATA           t   COPY public.publicacoes (id_pub, tipo_publicacao, local_publicacao, tema_publicacao, titulo_publicacao) FROM stdin;
    public          postgres    false    217   Hr       �          0    17527    publicacoes_autores 
   TABLE DATA           ?   COPY public.publicacoes_autores (id_pub, id_autor) FROM stdin;
    public          postgres    false    218   s       �           0    0    autores_id_autor_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.autores_id_autor_seq', 4, true);
          public          postgres    false    209            �           0    0    capitulos_id_capitulo_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.capitulos_id_capitulo_seq', 1, false);
          public          postgres    false    211            �           0    0    editoras_id_editora_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.editoras_id_editora_seq', 4, true);
          public          postgres    false    213            �           0    0    emprestimos_id_emprestimo_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.emprestimos_id_emprestimo_seq', 2, true);
          public          postgres    false    220            �           0    0    publicacoes_id_pub_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.publicacoes_id_pub_seq', 35, true);
          public          postgres    false    219            �
           2606    17539 .   anais_de_conferencia anais_de_conferencia_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.anais_de_conferencia
    ADD CONSTRAINT anais_de_conferencia_pkey PRIMARY KEY (id_anal_conf);
 X   ALTER TABLE ONLY public.anais_de_conferencia DROP CONSTRAINT anais_de_conferencia_pkey;
       public            postgres    false    203            �
           2606    17541 %   artigos_de_anais artigo_de_anais_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.artigos_de_anais
    ADD CONSTRAINT artigo_de_anais_pkey PRIMARY KEY (id_artigo);
 O   ALTER TABLE ONLY public.artigos_de_anais DROP CONSTRAINT artigo_de_anais_pkey;
       public            postgres    false    205            �
           2606    17543 (   artigos_de_livros artigo_de_livros__pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.artigos_de_livros
    ADD CONSTRAINT artigo_de_livros__pkey PRIMARY KEY (id_artigo);
 R   ALTER TABLE ONLY public.artigos_de_livros DROP CONSTRAINT artigo_de_livros__pkey;
       public            postgres    false    206            �
           2606    17545 .   artigos_de_periodicos artigo_de_periodico_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.artigos_de_periodicos
    ADD CONSTRAINT artigo_de_periodico_pkey PRIMARY KEY (id_artigo);
 X   ALTER TABLE ONLY public.artigos_de_periodicos DROP CONSTRAINT artigo_de_periodico_pkey;
       public            postgres    false    207            �
           2606    17547    artigos artigos__pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.artigos
    ADD CONSTRAINT artigos__pkey PRIMARY KEY (id_artigo);
 ?   ALTER TABLE ONLY public.artigos DROP CONSTRAINT artigos__pkey;
       public            postgres    false    204            �
           2606    17549    autores autor_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id_autor);
 <   ALTER TABLE ONLY public.autores DROP CONSTRAINT autor_pkey;
       public            postgres    false    208            �
           2606    17551    capitulos capitulo_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.capitulos
    ADD CONSTRAINT capitulo_pkey PRIMARY KEY (id_capitulo, id_livro);
 A   ALTER TABLE ONLY public.capitulos DROP CONSTRAINT capitulo_pkey;
       public            postgres    false    210    210            �
           2606    17553    editoras editora_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.editoras
    ADD CONSTRAINT editora_pkey PRIMARY KEY (id_editora);
 ?   ALTER TABLE ONLY public.editoras DROP CONSTRAINT editora_pkey;
       public            postgres    false    212            �
           2606    17666    emprestimos emprestimos_PK 
   CONSTRAINT     m   ALTER TABLE ONLY public.emprestimos
    ADD CONSTRAINT "emprestimos_PK" PRIMARY KEY (id_emprestimo, id_pub);
 F   ALTER TABLE ONLY public.emprestimos DROP CONSTRAINT "emprestimos_PK";
       public            postgres    false    221    221            �
           2606    17557    publicacoes_autores id_autor 
   CONSTRAINT     h   ALTER TABLE ONLY public.publicacoes_autores
    ADD CONSTRAINT id_autor PRIMARY KEY (id_pub, id_autor);
 F   ALTER TABLE ONLY public.publicacoes_autores DROP CONSTRAINT id_autor;
       public            postgres    false    218    218            �
           2606    17559    livros livro_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.livros
    ADD CONSTRAINT livro_pkey PRIMARY KEY (id_livro);
 ;   ALTER TABLE ONLY public.livros DROP CONSTRAINT livro_pkey;
       public            postgres    false    214            �
           2606    17561    monografias monografias_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.monografias
    ADD CONSTRAINT monografias_pkey PRIMARY KEY (id_monografia);
 F   ALTER TABLE ONLY public.monografias DROP CONSTRAINT monografias_pkey;
       public            postgres    false    215            �
           2606    17563    periodicos periodicos_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.periodicos
    ADD CONSTRAINT periodicos_pkey PRIMARY KEY (id_periodico);
 D   ALTER TABLE ONLY public.periodicos DROP CONSTRAINT periodicos_pkey;
       public            postgres    false    216            �
           2606    17676    pessoas pessoas_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.pessoas
    ADD CONSTRAINT pessoas_pkey PRIMARY KEY (cpf_cnpj_pessoa);
 >   ALTER TABLE ONLY public.pessoas DROP CONSTRAINT pessoas_pkey;
       public            postgres    false    222            �
           2606    17567    publicacoes publicacoes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.publicacoes
    ADD CONSTRAINT publicacoes_pkey PRIMARY KEY (id_pub);
 F   ALTER TABLE ONLY public.publicacoes DROP CONSTRAINT publicacoes_pkey;
       public            postgres    false    217            �
           2606    17568 .   artigos_de_livros artigos__artigo_de_livros_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.artigos_de_livros
    ADD CONSTRAINT artigos__artigo_de_livros_fk FOREIGN KEY (id_artigo) REFERENCES public.artigos(id_artigo);
 X   ALTER TABLE ONLY public.artigos_de_livros DROP CONSTRAINT artigos__artigo_de_livros_fk;
       public          postgres    false    204    206    2763            �
           2606    17573 -   artigos_de_anais artigos__artigos_de_anais_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.artigos_de_anais
    ADD CONSTRAINT artigos__artigos_de_anais_fk FOREIGN KEY (id_artigo) REFERENCES public.artigos(id_artigo);
 W   ALTER TABLE ONLY public.artigos_de_anais DROP CONSTRAINT artigos__artigos_de_anais_fk;
       public          postgres    false    205    204    2763            �
           2606    17578    artigos artigos_publicacao_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.artigos
    ADD CONSTRAINT artigos_publicacao_fk FOREIGN KEY (id_artigo) REFERENCES public.publicacoes(id_pub);
 G   ALTER TABLE ONLY public.artigos DROP CONSTRAINT artigos_publicacao_fk;
       public          postgres    false    204    217    2783            �
           2606    17583 1   publicacoes_autores autores_publicacao_autores_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.publicacoes_autores
    ADD CONSTRAINT autores_publicacao_autores_fk FOREIGN KEY (id_autor) REFERENCES public.autores(id_autor);
 [   ALTER TABLE ONLY public.publicacoes_autores DROP CONSTRAINT autores_publicacao_autores_fk;
       public          postgres    false    218    208    2771            �
           2606    17588 4   anais_de_conferencia editora_anais_de_conferencia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.anais_de_conferencia
    ADD CONSTRAINT editora_anais_de_conferencia_fk FOREIGN KEY (id_editora) REFERENCES public.editoras(id_editora);
 ^   ALTER TABLE ONLY public.anais_de_conferencia DROP CONSTRAINT editora_anais_de_conferencia_fk;
       public          postgres    false    203    212    2775            �
           2606    17593    artigos editora_artigos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.artigos
    ADD CONSTRAINT editora_artigos_fk FOREIGN KEY (id_editora) REFERENCES public.editoras(id_editora);
 D   ALTER TABLE ONLY public.artigos DROP CONSTRAINT editora_artigos_fk;
       public          postgres    false    204    212    2775            �
           2606    17598    livros editora_livros_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livros
    ADD CONSTRAINT editora_livros_fk FOREIGN KEY (id_editora) REFERENCES public.editoras(id_editora);
 B   ALTER TABLE ONLY public.livros DROP CONSTRAINT editora_livros_fk;
       public          postgres    false    214    212    2775            �
           2606    25657    artigos_de_anais id_anal_conf    FK CONSTRAINT     �   ALTER TABLE ONLY public.artigos_de_anais
    ADD CONSTRAINT id_anal_conf FOREIGN KEY (id_anal_conf) REFERENCES public.anais_de_conferencia(id_anal_conf) NOT VALID;
 G   ALTER TABLE ONLY public.artigos_de_anais DROP CONSTRAINT id_anal_conf;
       public          postgres    false    203    2761    205            �
           2606    25673 "   artigos_de_periodicos id_artigo_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.artigos_de_periodicos
    ADD CONSTRAINT "id_artigo_FK" FOREIGN KEY (id_artigo) REFERENCES public.artigos(id_artigo) NOT VALID;
 N   ALTER TABLE ONLY public.artigos_de_periodicos DROP CONSTRAINT "id_artigo_FK";
       public          postgres    false    207    2763    204            �
           2606    25678 %   artigos_de_periodicos id_periodico_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.artigos_de_periodicos
    ADD CONSTRAINT "id_periodico_FK" FOREIGN KEY (id_periodico) REFERENCES public.periodicos(id_periodico) NOT VALID;
 Q   ALTER TABLE ONLY public.artigos_de_periodicos DROP CONSTRAINT "id_periodico_FK";
       public          postgres    false    216    2781    207            �
           2606    25668    emprestimos id_pessoa_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.emprestimos
    ADD CONSTRAINT "id_pessoa_FK" FOREIGN KEY (cpf_cnpj_pessoa) REFERENCES public.pessoas(cpf_cnpj_pessoa) NOT VALID;
 D   ALTER TABLE ONLY public.emprestimos DROP CONSTRAINT "id_pessoa_FK";
       public          postgres    false    221    222    2789            �
           2606    17667    emprestimos id_pub_FK    FK CONSTRAINT        ALTER TABLE ONLY public.emprestimos
    ADD CONSTRAINT "id_pub_FK" FOREIGN KEY (id_pub) REFERENCES public.publicacoes(id_pub);
 A   ALTER TABLE ONLY public.emprestimos DROP CONSTRAINT "id_pub_FK";
       public          postgres    false    2783    217    221            �
           2606    17618    capitulos livro_capitulo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.capitulos
    ADD CONSTRAINT livro_capitulo_fk FOREIGN KEY (id_livro) REFERENCES public.livros(id_livro);
 E   ALTER TABLE ONLY public.capitulos DROP CONSTRAINT livro_capitulo_fk;
       public          postgres    false    2777    210    214            �
           2606    17633 8   anais_de_conferencia publicacoes_anais_de_conferencia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.anais_de_conferencia
    ADD CONSTRAINT publicacoes_anais_de_conferencia_fk FOREIGN KEY (id_anal_conf) REFERENCES public.publicacoes(id_pub);
 b   ALTER TABLE ONLY public.anais_de_conferencia DROP CONSTRAINT publicacoes_anais_de_conferencia_fk;
       public          postgres    false    203    217    2783            �
           2606    17638    livros publicacoes_livro_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livros
    ADD CONSTRAINT publicacoes_livro_fk FOREIGN KEY (id_livro) REFERENCES public.publicacoes(id_pub);
 E   ALTER TABLE ONLY public.livros DROP CONSTRAINT publicacoes_livro_fk;
       public          postgres    false    214    217    2783            �
           2606    17643 &   monografias publicacoes_monografias_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.monografias
    ADD CONSTRAINT publicacoes_monografias_fk FOREIGN KEY (id_monografia) REFERENCES public.publicacoes(id_pub);
 P   ALTER TABLE ONLY public.monografias DROP CONSTRAINT publicacoes_monografias_fk;
       public          postgres    false    217    215    2783            �
           2606    17648 $   periodicos publicacoes_periodicos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.periodicos
    ADD CONSTRAINT publicacoes_periodicos_fk FOREIGN KEY (id_periodico) REFERENCES public.publicacoes(id_pub);
 N   ALTER TABLE ONLY public.periodicos DROP CONSTRAINT publicacoes_periodicos_fk;
       public          postgres    false    216    217    2783            �
           2606    17653 5   publicacoes_autores publicacoes_publicacao_autores_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.publicacoes_autores
    ADD CONSTRAINT publicacoes_publicacao_autores_fk FOREIGN KEY (id_pub) REFERENCES public.publicacoes(id_pub);
 _   ALTER TABLE ONLY public.publicacoes_autores DROP CONSTRAINT publicacoes_publicacao_autores_fk;
       public          postgres    false    2783    218    217            v   -   x�36�4�,(��M�,�W(��)�M�4�4�42�5 "S�=... ��	�      w   7   x�36���L,*�LϏOI�O�K��4�42�26E���,+��4�420������ �h      x   F   x�36�t��KK-J�K�LTHIUpJ-����4�4200�50�52�46�,(��M�,�W(��)�M����� ?��      y      x������ � �      z      x������ � �      {   8   x�3��N�,,MU��,N�O�2���/NU�OJ-*��2ᄰ\3�KR�b���� �QG      }      x������ � �             x�3�N,J�,K�2�tJ-�������� V�X      �   .   x�3�46�4202�50�5� 2-u�LCCSSS#c3SK�=... ��S      �      x������ � �      �   6   x�36�4���,K-*�LILIU ��Ë�Ks�9�-u�t,�b���� pp�      �      x������ � �      �   #   x���/NUH-J��444555263������ m�}      �   �   x�]�Q�AD�ӧ�D��蠮��3����l�;��?ۃ�*����*���R��{Ӂ3���(i��ȉ���}��Ձ��툁�irM�'�lyZ�L�`�R��0yD�����W��������_���eb8}vp�0vm;�\�ʉʼ��y2�l~�>,������
���Vu��s�L>a)      �      x�36�4�26�4����� �     
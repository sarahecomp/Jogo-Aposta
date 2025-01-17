PGDMP     ;        
            w            jogo    9.6.14    9.6.14 '    {           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            |           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            }           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ~           1262    16471    jogo    DATABASE     �   CREATE DATABASE jogo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE jogo;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16886    aposta    TABLE       CREATE TABLE public.aposta (
    id integer NOT NULL,
    maquina integer NOT NULL,
    concurso date NOT NULL,
    jogador character varying(14) NOT NULL,
    vendedor character varying(30) NOT NULL,
    data timestamp without time zone NOT NULL,
    preco money,
    d1 smallint NOT NULL,
    d2 smallint NOT NULL,
    d3 smallint NOT NULL,
    d4 smallint NOT NULL,
    d5 smallint NOT NULL,
    d6 smallint NOT NULL,
    d7 smallint NOT NULL,
    d8 smallint NOT NULL,
    d9 smallint NOT NULL,
    d10 smallint NOT NULL
);
    DROP TABLE public.aposta;
       public         postgres    false    3            �            1259    16884    aposta_id_seq    SEQUENCE     v   CREATE SEQUENCE public.aposta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.aposta_id_seq;
       public       postgres    false    3    192            �           0    0    aposta_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.aposta_id_seq OWNED BY public.aposta.id;
            public       postgres    false    191            �            1259    16662    concurso    TABLE     e   CREATE TABLE public.concurso (
    data date NOT NULL,
    hora time without time zone[] NOT NULL
);
    DROP TABLE public.concurso;
       public         postgres    false    3            �            1259    16744    dezena    TABLE       CREATE TABLE public.dezena (
    id integer NOT NULL,
    concurso date NOT NULL,
    hora time without time zone[] NOT NULL,
    d1 smallint NOT NULL,
    d2 smallint NOT NULL,
    d3 smallint NOT NULL,
    d4 smallint NOT NULL,
    d5 smallint NOT NULL
);
    DROP TABLE public.dezena;
       public         postgres    false    3            �            1259    16742    dezena_id_seq    SEQUENCE     v   CREATE SEQUENCE public.dezena_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.dezena_id_seq;
       public       postgres    false    189    3            �           0    0    dezena_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.dezena_id_seq OWNED BY public.dezena.id;
            public       postgres    false    188            �            1259    16518    jogador    TABLE     m   CREATE TABLE public.jogador (
    telefone character varying(14) NOT NULL,
    nome character varying(30)
);
    DROP TABLE public.jogador;
       public         postgres    false    3            �            1259    16878    maquina    TABLE     9   CREATE TABLE public.maquina (
    id integer NOT NULL
);
    DROP TABLE public.maquina;
       public         postgres    false    3            �            1259    16657    usuario    TABLE     �   CREATE TABLE public.usuario (
    username character varying(30) NOT NULL,
    nome character varying(30),
    senha character varying(10),
    admin boolean
);
    DROP TABLE public.usuario;
       public         postgres    false    3            �           2604    16889 	   aposta id    DEFAULT     f   ALTER TABLE ONLY public.aposta ALTER COLUMN id SET DEFAULT nextval('public.aposta_id_seq'::regclass);
 8   ALTER TABLE public.aposta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    192    192            �           2604    16747 	   dezena id    DEFAULT     f   ALTER TABLE ONLY public.dezena ALTER COLUMN id SET DEFAULT nextval('public.dezena_id_seq'::regclass);
 8   ALTER TABLE public.dezena ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    188    189            x          0    16886    aposta 
   TABLE DATA               �   COPY public.aposta (id, maquina, concurso, jogador, vendedor, data, preco, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10) FROM stdin;
    public       postgres    false    192   q)       �           0    0    aposta_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.aposta_id_seq', 3, true);
            public       postgres    false    191            s          0    16662    concurso 
   TABLE DATA               .   COPY public.concurso (data, hora) FROM stdin;
    public       postgres    false    187   �)       u          0    16744    dezena 
   TABLE DATA               H   COPY public.dezena (id, concurso, hora, d1, d2, d3, d4, d5) FROM stdin;
    public       postgres    false    189   M*       �           0    0    dezena_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.dezena_id_seq', 5, true);
            public       postgres    false    188            q          0    16518    jogador 
   TABLE DATA               1   COPY public.jogador (telefone, nome) FROM stdin;
    public       postgres    false    185   �*       v          0    16878    maquina 
   TABLE DATA               %   COPY public.maquina (id) FROM stdin;
    public       postgres    false    190   �*       r          0    16657    usuario 
   TABLE DATA               ?   COPY public.usuario (username, nome, senha, admin) FROM stdin;
    public       postgres    false    186   	+       �           2606    16891    aposta aposta_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.aposta
    ADD CONSTRAINT aposta_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.aposta DROP CONSTRAINT aposta_pkey;
       public         postgres    false    192    192            �           2606    16669    concurso concurso_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.concurso
    ADD CONSTRAINT concurso_pkey PRIMARY KEY (data);
 @   ALTER TABLE ONLY public.concurso DROP CONSTRAINT concurso_pkey;
       public         postgres    false    187    187            �           2606    16752    dezena dezena_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.dezena
    ADD CONSTRAINT dezena_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.dezena DROP CONSTRAINT dezena_pkey;
       public         postgres    false    189    189            �           2606    16522    jogador jogador_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.jogador
    ADD CONSTRAINT jogador_pkey PRIMARY KEY (telefone);
 >   ALTER TABLE ONLY public.jogador DROP CONSTRAINT jogador_pkey;
       public         postgres    false    185    185            �           2606    16882    maquina maquina_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.maquina
    ADD CONSTRAINT maquina_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.maquina DROP CONSTRAINT maquina_pkey;
       public         postgres    false    190    190            �           2606    16661    usuario usuario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (username);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    186    186            �           2606    16892    aposta aposta_concurso_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aposta
    ADD CONSTRAINT aposta_concurso_fkey FOREIGN KEY (concurso) REFERENCES public.concurso(data);
 E   ALTER TABLE ONLY public.aposta DROP CONSTRAINT aposta_concurso_fkey;
       public       postgres    false    2032    187    192            �           2606    16897    aposta aposta_jogador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aposta
    ADD CONSTRAINT aposta_jogador_fkey FOREIGN KEY (jogador) REFERENCES public.jogador(telefone);
 D   ALTER TABLE ONLY public.aposta DROP CONSTRAINT aposta_jogador_fkey;
       public       postgres    false    192    2028    185            �           2606    16907    aposta aposta_maquina_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.aposta
    ADD CONSTRAINT aposta_maquina_fkey FOREIGN KEY (maquina) REFERENCES public.maquina(id);
 D   ALTER TABLE ONLY public.aposta DROP CONSTRAINT aposta_maquina_fkey;
       public       postgres    false    2036    192    190            �           2606    16902    aposta aposta_vendedor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aposta
    ADD CONSTRAINT aposta_vendedor_fkey FOREIGN KEY (vendedor) REFERENCES public.usuario(username);
 E   ALTER TABLE ONLY public.aposta DROP CONSTRAINT aposta_vendedor_fkey;
       public       postgres    false    192    2030    186            �           2606    16753    dezena dezena_concurso_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dezena
    ADD CONSTRAINT dezena_concurso_fkey FOREIGN KEY (concurso) REFERENCES public.concurso(data);
 E   ALTER TABLE ONLY public.dezena DROP CONSTRAINT dezena_concurso_fkey;
       public       postgres    false    189    2032    187            x   m   x���;�@Ck�)RP4���L�AM�r�ςP�#����df��ժ��A+����_��-�-b��bzU�<&�`�d:��)������:�}}("��Hy�D��"�      s   O   x�m���0C�s�K��*�d6�؝
����d}+�^�Ka��Z�=ڬʒ��-���E}���\�?�1�|�&"7_� �      u   Y   x�}̱�0D���K��vB�,l�؝ H��_>}-iK,8h�j�D���+TlF>3Z�c���E� &1�<��K�C�"_�/"r�V!�      q       x�307��043���0�N,J������� C�6      v      x�35��0����� ��      r   >   x�+��K�I��P�F�&�%\ɩŉ�� &P���镑��W	�
s��I�PW� �
A     
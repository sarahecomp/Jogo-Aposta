PGDMP     3    #    
            w            jogo    9.6.14    9.6.14 $    t           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            u           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            v           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            w           1262    16471    jogo    DATABASE     �   CREATE DATABASE jogo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE jogo;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            x           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            y           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16635    aposta    TABLE     �  CREATE TABLE public.aposta (
    id integer NOT NULL,
    concurso integer NOT NULL,
    jogador character varying(14) NOT NULL,
    usuario character varying(30) NOT NULL,
    data timestamp without time zone NOT NULL,
    preco money NOT NULL,
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
       public         postgres    false    3            �            1259    16633    aposta_id_seq    SEQUENCE     v   CREATE SEQUENCE public.aposta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.aposta_id_seq;
       public       postgres    false    191    3            z           0    0    aposta_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.aposta_id_seq OWNED BY public.aposta.id;
            public       postgres    false    190            �            1259    16490    concurso    TABLE     �   CREATE TABLE public.concurso (
    id integer NOT NULL,
    datainicio date NOT NULL,
    horainicio time without time zone[] NOT NULL,
    datafim date NOT NULL,
    horafim time without time zone[] NOT NULL,
    dezena integer
);
    DROP TABLE public.concurso;
       public         postgres    false    3            �            1259    16485    dezena    TABLE     �   CREATE TABLE public.dezena (
    id integer NOT NULL,
    d1 smallint,
    d2 smallint,
    d3 smallint,
    d4 smallint,
    d5 smallint,
    d6 smallint,
    d7 smallint,
    d8 smallint,
    d9 smallint,
    d10 smallint
);
    DROP TABLE public.dezena;
       public         postgres    false    3            �            1259    16518    jogador    TABLE     m   CREATE TABLE public.jogador (
    telefone character varying(14) NOT NULL,
    nome character varying(30)
);
    DROP TABLE public.jogador;
       public         postgres    false    3            �            1259    16505    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(30),
    username character varying(30),
    senha character varying(10),
    admin boolean
);
    DROP TABLE public.usuario;
       public         postgres    false    3            �            1259    16503    usuario_id_seq    SEQUENCE     w   CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public       postgres    false    3    188            {           0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
            public       postgres    false    187            �           2604    16638 	   aposta id    DEFAULT     f   ALTER TABLE ONLY public.aposta ALTER COLUMN id SET DEFAULT nextval('public.aposta_id_seq'::regclass);
 8   ALTER TABLE public.aposta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190    191            �           2604    16508 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    188    188            q          0    16635    aposta 
   TABLE DATA               v   COPY public.aposta (id, concurso, jogador, usuario, data, preco, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10) FROM stdin;
    public       postgres    false    191   #'       |           0    0    aposta_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.aposta_id_seq', 25, true);
            public       postgres    false    190            l          0    16490    concurso 
   TABLE DATA               X   COPY public.concurso (id, datainicio, horainicio, datafim, horafim, dezena) FROM stdin;
    public       postgres    false    186   )       k          0    16485    dezena 
   TABLE DATA               M   COPY public.dezena (id, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10) FROM stdin;
    public       postgres    false    185   �)       o          0    16518    jogador 
   TABLE DATA               1   COPY public.jogador (telefone, nome) FROM stdin;
    public       postgres    false    189   *       n          0    16505    usuario 
   TABLE DATA               C   COPY public.usuario (id, nome, username, senha, admin) FROM stdin;
    public       postgres    false    188   J*       }           0    0    usuario_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.usuario_id_seq', 6, true);
            public       postgres    false    187            �           2606    16640    aposta aposta_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.aposta
    ADD CONSTRAINT aposta_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.aposta DROP CONSTRAINT aposta_pkey;
       public         postgres    false    191    191            �           2606    16497    concurso concurso_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.concurso
    ADD CONSTRAINT concurso_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.concurso DROP CONSTRAINT concurso_pkey;
       public         postgres    false    186    186            �           2606    16489    dezena dezena_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.dezena
    ADD CONSTRAINT dezena_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.dezena DROP CONSTRAINT dezena_pkey;
       public         postgres    false    185    185            �           2606    16522    jogador jogador_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.jogador
    ADD CONSTRAINT jogador_pkey PRIMARY KEY (telefone);
 >   ALTER TABLE ONLY public.jogador DROP CONSTRAINT jogador_pkey;
       public         postgres    false    189    189            �           2606    16510    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    188    188            �           2606    16512    usuario usuario_username_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_username_key UNIQUE (username);
 F   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_username_key;
       public         postgres    false    188    188            �           2606    16641    aposta aposta_concurso_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.aposta
    ADD CONSTRAINT aposta_concurso_fkey FOREIGN KEY (concurso) REFERENCES public.concurso(id);
 E   ALTER TABLE ONLY public.aposta DROP CONSTRAINT aposta_concurso_fkey;
       public       postgres    false    191    2025    186            �           2606    16646    aposta aposta_jogador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aposta
    ADD CONSTRAINT aposta_jogador_fkey FOREIGN KEY (jogador) REFERENCES public.jogador(telefone);
 D   ALTER TABLE ONLY public.aposta DROP CONSTRAINT aposta_jogador_fkey;
       public       postgres    false    191    189    2031            �           2606    16651    aposta aposta_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aposta
    ADD CONSTRAINT aposta_usuario_fkey FOREIGN KEY (usuario) REFERENCES public.usuario(username);
 D   ALTER TABLE ONLY public.aposta DROP CONSTRAINT aposta_usuario_fkey;
       public       postgres    false    188    2029    191            �           2606    16498    concurso concurso_dezena_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.concurso
    ADD CONSTRAINT concurso_dezena_fkey FOREIGN KEY (dezena) REFERENCES public.dezena(id);
 G   ALTER TABLE ONLY public.concurso DROP CONSTRAINT concurso_dezena_fkey;
       public       postgres    false    185    2023    186            q   �  x���=n1���S�p��9�1\�	� ���U#�B�߾?�`��gH3b����h���򑛴�uՊ�����!V�*��W�����^"��zS[^�G5�$xC�p>�I�>J��@�DYT��[�h�f� �������8"�U�A���D́G'����Mob�ʪ���4�<�����"�p�"vD���R�P���)�
[�؎�sY}�8�J��f_�M��!��H�#��T�<��e����7��%3����U�����C~���V|��Ƌ��4�\�c����`�D��9 �<�Hdf	Ǝz�f�q��%D�͛9S�B&'(���,������bV��Y�1�B'<]r�Z"%mזf:�}�k��12^+��C�5!ݟ�a;�y6lp��w�}+��0�^[�b�'�CፕR}O��)T~�%�F(�vC2��4���Zo���R�?�N�      l   �   x�����0ϤV��ơ*�D�k�!�g$K>�e2�����d��tr݈����{�؋d����<� 4 ��!��+����@�R4x	�d	�@�+ ~C�g���@>�kB��4���yW`{ǧ���      k   \   x�}��	�0Cѳ<L�\;qv��sԴ�
����Th���;&b�����8^��J�RG���?�����Q�������|���&�!"7U�,�      o   4   x���D���%�y�\�A��< �Y��[ZX�s'%fp��qqq $��      n   >   x�3�����˫��IL)J��4426�,�2�tN-N�LP!SN�Ē���b�\(������ �7V     
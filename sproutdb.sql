PGDMP  &    0                |        
   sprouttest    16.0    16.0 8    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    74184 
   sprouttest    DATABASE     ~   CREATE DATABASE sprouttest WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Swedish_Sweden.1252';
    DROP DATABASE sprouttest;
                postgres    false            �            1259    74227    climate_zone    TABLE     _   CREATE TABLE public.climate_zone (
    id integer NOT NULL,
    name character(40) NOT NULL
);
     DROP TABLE public.climate_zone;
       public         heap    postgres    false            �            1259    74185    light_level    TABLE     E   CREATE TABLE public.light_level (
    name character(20) NOT NULL
);
    DROP TABLE public.light_level;
       public         heap    postgres    false            �            1259    74237    light_preferrence    TABLE     �   CREATE TABLE public.light_preferrence (
    plant_id integer NOT NULL,
    light_level_id character(20) NOT NULL,
    modifier real
);
 %   DROP TABLE public.light_preferrence;
       public         heap    postgres    false            �            1259    74304    plant    TABLE     �  CREATE TABLE public.plant (
    id integer NOT NULL,
    name character(64) NOT NULL,
    preferred_watering_frequency character(64) NOT NULL,
    extra_info character(500),
    preferred_average_temperature character(64),
    preferred_pot_size character(64),
    sprout character(64),
    vegetative character(64),
    flowering character(64),
    mature character(40),
    humidity character(64),
    soil_ph character(64),
    preferred_watering_amount character(64)
);
    DROP TABLE public.plant;
       public         heap    postgres    false            �            1259    74197 
   plant_care    TABLE     D   CREATE TABLE public.plant_care (
    name character(30) NOT NULL
);
    DROP TABLE public.plant_care;
       public         heap    postgres    false            �            1259    74202    plant_care_preferrence    TABLE     x   CREATE TABLE public.plant_care_preferrence (
    plant_care_id character(30) NOT NULL,
    plant_id integer NOT NULL
);
 *   DROP TABLE public.plant_care_preferrence;
       public         heap    postgres    false            �            1259    74342    plant_id_seq    SEQUENCE     �   ALTER TABLE public.plant ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.plant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    74207    season    TABLE     Y   CREATE TABLE public.season (
    id integer NOT NULL,
    name character(30) NOT NULL
);
    DROP TABLE public.season;
       public         heap    postgres    false            �            1259    74212    season_preferrence    TABLE     �   CREATE TABLE public.season_preferrence (
    season_id integer NOT NULL,
    plant_id integer NOT NULL,
    modifier real NOT NULL
);
 &   DROP TABLE public.season_preferrence;
       public         heap    postgres    false            �            1259    74217    soil    TABLE     W   CREATE TABLE public.soil (
    id integer NOT NULL,
    name character(30) NOT NULL
);
    DROP TABLE public.soil;
       public         heap    postgres    false            �            1259    74222    soil_preferrence    TABLE     �   CREATE TABLE public.soil_preferrence (
    plant_id integer NOT NULL,
    soil_id integer NOT NULL,
    modifier real NOT NULL
);
 $   DROP TABLE public.soil_preferrence;
       public         heap    postgres    false            �            1259    74232    zone_preferrence    TABLE     �   CREATE TABLE public.zone_preferrence (
    plant_id integer NOT NULL,
    zone_id integer NOT NULL,
    modifier real NOT NULL
);
 $   DROP TABLE public.zone_preferrence;
       public         heap    postgres    false            �            1259    82187 
   plant_info    VIEW     �  CREATE VIEW public.plant_info AS
 SELECT p.name,
    p.preferred_watering_frequency,
    p.extra_info,
    p.preferred_average_temperature,
    p.preferred_pot_size,
    p.sprout,
    p.vegetative,
    p.flowering,
    p.mature,
    p.humidity,
    p.soil_ph,
    p.preferred_watering_amount,
    ll.name AS light_level,
    pc.name AS plant_care,
    season.name AS season,
    soil.name AS soil,
    zone.name AS climate_zone
   FROM ((((((((((public.plant p
     LEFT JOIN public.light_preferrence lightp ON ((lightp.plant_id = p.id)))
     LEFT JOIN public.light_level ll ON ((ll.name = lightp.light_level_id)))
     LEFT JOIN public.plant_care_preferrence pcp ON ((pcp.plant_id = p.id)))
     LEFT JOIN public.plant_care pc ON ((pc.name = pcp.plant_care_id)))
     LEFT JOIN public.season_preferrence seasonp ON ((seasonp.plant_id = p.id)))
     LEFT JOIN public.season ON ((season.id = seasonp.season_id)))
     LEFT JOIN public.soil_preferrence soilp ON ((soilp.plant_id = p.id)))
     LEFT JOIN public.soil ON ((soil.id = soilp.soil_id)))
     LEFT JOIN public.zone_preferrence zonep ON ((zonep.plant_id = p.id)))
     LEFT JOIN public.climate_zone zone ON ((zonep.zone_id = zone.id)));
    DROP VIEW public.plant_info;
       public          postgres    false    215    228    228    228    228    228    228    228    228    228    228    228    228    228    224    224    223    223    222    222    221    221    220    220    219    219    218    218    217    217    216            �            1259    74293    season_id_seq    SEQUENCE     �   ALTER TABLE public.season ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.season_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    74294    soil_id_seq    SEQUENCE     �   ALTER TABLE public.soil ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.soil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    74295    zone_id_seq    SEQUENCE     �   ALTER TABLE public.climate_zone ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.zone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222                       0    74227    climate_zone 
   TABLE DATA                 public          postgres    false    222   kD       �          0    74185    light_level 
   TABLE DATA                 public          postgres    false    215   E                 0    74237    light_preferrence 
   TABLE DATA                 public          postgres    false    224   �E                 0    74304    plant 
   TABLE DATA                 public          postgres    false    228   6F       �          0    74197 
   plant_care 
   TABLE DATA                 public          postgres    false    216   �I       �          0    74202    plant_care_preferrence 
   TABLE DATA                 public          postgres    false    217   @J       �          0    74207    season 
   TABLE DATA                 public          postgres    false    218   �J       �          0    74212    season_preferrence 
   TABLE DATA                 public          postgres    false    219   �K       �          0    74217    soil 
   TABLE DATA                 public          postgres    false    220   _L       �          0    74222    soil_preferrence 
   TABLE DATA                 public          postgres    false    221   �L                 0    74232    zone_preferrence 
   TABLE DATA                 public          postgres    false    223   WM                  0    0    plant_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.plant_id_seq', 13, true);
          public          postgres    false    229                       0    0    season_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.season_id_seq', 30, true);
          public          postgres    false    225                       0    0    soil_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.soil_id_seq', 9, true);
          public          postgres    false    226                       0    0    zone_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.zone_id_seq', 7, true);
          public          postgres    false    227            J           2606    74189    light_level pk_light_level 
   CONSTRAINT     Z   ALTER TABLE ONLY public.light_level
    ADD CONSTRAINT pk_light_level PRIMARY KEY (name);
 D   ALTER TABLE ONLY public.light_level DROP CONSTRAINT pk_light_level;
       public            postgres    false    215            \           2606    74241 &   light_preferrence pk_light_preferrence 
   CONSTRAINT     z   ALTER TABLE ONLY public.light_preferrence
    ADD CONSTRAINT pk_light_preferrence PRIMARY KEY (plant_id, light_level_id);
 P   ALTER TABLE ONLY public.light_preferrence DROP CONSTRAINT pk_light_preferrence;
       public            postgres    false    224    224            ^           2606    74310    plant pk_plant 
   CONSTRAINT     L   ALTER TABLE ONLY public.plant
    ADD CONSTRAINT pk_plant PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.plant DROP CONSTRAINT pk_plant;
       public            postgres    false    228            L           2606    74201    plant_care pk_plant_care 
   CONSTRAINT     X   ALTER TABLE ONLY public.plant_care
    ADD CONSTRAINT pk_plant_care PRIMARY KEY (name);
 B   ALTER TABLE ONLY public.plant_care DROP CONSTRAINT pk_plant_care;
       public            postgres    false    216            N           2606    74206 0   plant_care_preferrence pk_plant_care_preferrence 
   CONSTRAINT     �   ALTER TABLE ONLY public.plant_care_preferrence
    ADD CONSTRAINT pk_plant_care_preferrence PRIMARY KEY (plant_care_id, plant_id);
 Z   ALTER TABLE ONLY public.plant_care_preferrence DROP CONSTRAINT pk_plant_care_preferrence;
       public            postgres    false    217    217            P           2606    74211    season pk_season 
   CONSTRAINT     N   ALTER TABLE ONLY public.season
    ADD CONSTRAINT pk_season PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.season DROP CONSTRAINT pk_season;
       public            postgres    false    218            R           2606    74216 (   season_preferrence pk_season_preferrence 
   CONSTRAINT     w   ALTER TABLE ONLY public.season_preferrence
    ADD CONSTRAINT pk_season_preferrence PRIMARY KEY (season_id, plant_id);
 R   ALTER TABLE ONLY public.season_preferrence DROP CONSTRAINT pk_season_preferrence;
       public            postgres    false    219    219            T           2606    74221    soil pk_soil 
   CONSTRAINT     J   ALTER TABLE ONLY public.soil
    ADD CONSTRAINT pk_soil PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.soil DROP CONSTRAINT pk_soil;
       public            postgres    false    220            V           2606    74226 $   soil_preferrence pk_soil_preferrence 
   CONSTRAINT     q   ALTER TABLE ONLY public.soil_preferrence
    ADD CONSTRAINT pk_soil_preferrence PRIMARY KEY (plant_id, soil_id);
 N   ALTER TABLE ONLY public.soil_preferrence DROP CONSTRAINT pk_soil_preferrence;
       public            postgres    false    221    221            X           2606    74231    climate_zone pk_zone 
   CONSTRAINT     R   ALTER TABLE ONLY public.climate_zone
    ADD CONSTRAINT pk_zone PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.climate_zone DROP CONSTRAINT pk_zone;
       public            postgres    false    222            Z           2606    74236 $   zone_preferrence pk_zone_preferrence 
   CONSTRAINT     q   ALTER TABLE ONLY public.zone_preferrence
    ADD CONSTRAINT pk_zone_preferrence PRIMARY KEY (plant_id, zone_id);
 N   ALTER TABLE ONLY public.zone_preferrence DROP CONSTRAINT pk_zone_preferrence;
       public            postgres    false    223    223            g           2606    74331 (   light_preferrence fk_light_preferrence_0    FK CONSTRAINT     �   ALTER TABLE ONLY public.light_preferrence
    ADD CONSTRAINT fk_light_preferrence_0 FOREIGN KEY (plant_id) REFERENCES public.plant(id);
 R   ALTER TABLE ONLY public.light_preferrence DROP CONSTRAINT fk_light_preferrence_0;
       public          postgres    false    4702    228    224            h           2606    74287 (   light_preferrence fk_light_preferrence_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.light_preferrence
    ADD CONSTRAINT fk_light_preferrence_1 FOREIGN KEY (light_level_id) REFERENCES public.light_level(name);
 R   ALTER TABLE ONLY public.light_preferrence DROP CONSTRAINT fk_light_preferrence_1;
       public          postgres    false    224    215    4682            _           2606    74242 2   plant_care_preferrence fk_plant_care_preferrence_0    FK CONSTRAINT     �   ALTER TABLE ONLY public.plant_care_preferrence
    ADD CONSTRAINT fk_plant_care_preferrence_0 FOREIGN KEY (plant_care_id) REFERENCES public.plant_care(name);
 \   ALTER TABLE ONLY public.plant_care_preferrence DROP CONSTRAINT fk_plant_care_preferrence_0;
       public          postgres    false    217    4684    216            `           2606    74311 2   plant_care_preferrence fk_plant_care_preferrence_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.plant_care_preferrence
    ADD CONSTRAINT fk_plant_care_preferrence_1 FOREIGN KEY (plant_id) REFERENCES public.plant(id);
 \   ALTER TABLE ONLY public.plant_care_preferrence DROP CONSTRAINT fk_plant_care_preferrence_1;
       public          postgres    false    217    228    4702            a           2606    74252 *   season_preferrence fk_season_preferrence_0    FK CONSTRAINT     �   ALTER TABLE ONLY public.season_preferrence
    ADD CONSTRAINT fk_season_preferrence_0 FOREIGN KEY (season_id) REFERENCES public.season(id);
 T   ALTER TABLE ONLY public.season_preferrence DROP CONSTRAINT fk_season_preferrence_0;
       public          postgres    false    219    4688    218            b           2606    74316 *   season_preferrence fk_season_preferrence_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.season_preferrence
    ADD CONSTRAINT fk_season_preferrence_1 FOREIGN KEY (plant_id) REFERENCES public.plant(id);
 T   ALTER TABLE ONLY public.season_preferrence DROP CONSTRAINT fk_season_preferrence_1;
       public          postgres    false    219    4702    228            c           2606    74321 &   soil_preferrence fk_soil_preferrence_0    FK CONSTRAINT     �   ALTER TABLE ONLY public.soil_preferrence
    ADD CONSTRAINT fk_soil_preferrence_0 FOREIGN KEY (plant_id) REFERENCES public.plant(id);
 P   ALTER TABLE ONLY public.soil_preferrence DROP CONSTRAINT fk_soil_preferrence_0;
       public          postgres    false    4702    228    221            d           2606    74267 &   soil_preferrence fk_soil_preferrence_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.soil_preferrence
    ADD CONSTRAINT fk_soil_preferrence_1 FOREIGN KEY (soil_id) REFERENCES public.soil(id);
 P   ALTER TABLE ONLY public.soil_preferrence DROP CONSTRAINT fk_soil_preferrence_1;
       public          postgres    false    4692    221    220            e           2606    74326 &   zone_preferrence fk_zone_preferrence_0    FK CONSTRAINT     �   ALTER TABLE ONLY public.zone_preferrence
    ADD CONSTRAINT fk_zone_preferrence_0 FOREIGN KEY (plant_id) REFERENCES public.plant(id);
 P   ALTER TABLE ONLY public.zone_preferrence DROP CONSTRAINT fk_zone_preferrence_0;
       public          postgres    false    223    228    4702            f           2606    74277 &   zone_preferrence fk_zone_preferrence_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.zone_preferrence
    ADD CONSTRAINT fk_zone_preferrence_1 FOREIGN KEY (zone_id) REFERENCES public.climate_zone(id);
 P   ALTER TABLE ONLY public.zone_preferrence DROP CONSTRAINT fk_zone_preferrence_1;
       public          postgres    false    223    4696    222                �   x���v
Q���W((M��L�K���M,I����KU�s
�t��sW�q�Us�	u���
F:
�%E��ɉ9
���5�'���K)�$d��3�/5� ������K��+��K�+!�԰�h_A~Nb���� >�      �   x   x���v
Q���W((M��L���L�(��I-K�Q�s
�t��sW�q�Us�	u���
�i�99
ťy
H@]Ӛ˓Bs�J2Q������)�
��悜���r2X�\.. ��e�         �   x���v
Q���W((M��L���L�(�/(JMK-*J�KNUs�	uV�0�QPO+��Q(.�S@�:
���\���U�XT���j9f�R�]fT6�Z~�U������
�1˜�~44��aT4˒��oH��jh@M�q���4�� y�W         �  x���o�0���+�ej��.��i�ЄԵRi+������?ېv���g�V�8��ٱ?�>��������w70_<��b^�R�����v�}x�F�Fw������~���Yԁ�G&���Tk�c��V����
���G��À�!R��V�����m$��� 2���<z$������#b���Ic�o����'�{��E@����(�搬�G.u�}5ο�]A��&L�?8��6�Ʃ��VC�E�Py9�A�'�s�B��y*����%�p�T��T�:0�L�Xr�.iJB$��x��c'�=._ L�� �*�����0MH�(�hza��;���X'0fc�p��m#��{'��#<�� "]��1�\���B,��!��$��F�1�Ʀ��@�7���8,�~��7"��6[��̪J�k:�	�X/��^�!H�&����~Y�Ş��{���;i����t1�L��(C��JnfPk��. �� ��A$���tU�z�B8�%ۙ�ʸu�Gui�Cj�x�/f8����M"�"�:�8"	v��Z'�4�Z�j�T���|_k��*������d������?���kz��YHI�����N � ��5�	w�hKc���(�
Bj,a%��<Cd`z��+�[Kx�a�ND���c�䉯�� ui�W��!a�]�]���������������[�6��ݯ�3���krn�h��6\�Wq����C��j��|�v?7aM��Ͼ1�j�b\!���,�T�T��%�
wd�%�q�%P��/y/ձ�s��S���ۥ�A�XC�]�X����y�r�B�Fx['lIx|Q�v�C=!���(�=!z���Бn�"0���{�zV�r�cՆ�'' �=��      �   c   x���v
Q���W((M��L�+�I�+�ON,JUs�	uV�P/(*���KW��5��<�3��(37�I$��ZT���Y�ZD�AE��%%��2�� \�M      �   �   x���v
Q���W((M��L�+�I�+�ON,J�/(JMK-*J�KNUs�	uV�P��d�dV�)`�:
ƚ�\���[PT������P����Kнf42לF��(��5���-h�`K��-J-�/)�e2��`2��$A3�i@��� ͺD�      �   �   x���O�0��U���NA#��L�b��K�~��:�{i�����h�H� �Juͳۤ�~H�R�tO��K�	���L�'��?�@�*o�.�L������Xt@�����OU�r�L$�X�\5��΁M� ˷��i��d��~� ˷�����+B��@�]�@��~�L�]�<��
H,      �   �   x���v
Q���W((M��L�+NM,�ϋ/(JMK-*J�KNUs�	uV�04�Q0�Q0Դ��$M��MuL��hF�F3r5m4'K#0T���iI�N#r�$K�Н�di*Y��Ȃ\����14 �NC�N.. E��      �   u   x���v
Q���W((M��L�+���Q�s
�t��sW�q�Us�	u���
�:
�9����
`�X���5�'���M/�/)��KW�ͬ���&@��SsrR�3�@v`3�� ��JJ      �   c   x���v
Q���W((M��L�+��̉/(JMK-*J�KNUs�	uV�0�Q0�Q0Դ��$A�)Y����eN�.C#��Y��˒<'����i3�k�� p���         l   x���v
Q���W((M��L֫��K�/(JMK-*J�KNUs�	uV�0�Q0�Q0Դ��$A������Ȳ˜\]d��Ј,�,��eI����F�ȳ���� ��     
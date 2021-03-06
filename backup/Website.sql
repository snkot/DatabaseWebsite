PGDMP         8        	        x            Website    13.0    13.0 Q    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    16394    Website    DATABASE     f   CREATE DATABASE "Website" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Website";
                postgres    false            �            1259    16474    comments    TABLE     �   CREATE TABLE public.comments (
    id integer NOT NULL,
    content text,
    rating integer NOT NULL,
    "time" time with time zone NOT NULL,
    "idUser" integer NOT NULL,
    text character varying NOT NULL
);
    DROP TABLE public.comments;
       public         heap    postgres    false            �            1259    16472    Comment_id_seq    SEQUENCE     �   ALTER TABLE public.comments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Comment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            �            1259    16457 
   dashboards    TABLE     �   CREATE TABLE public.dashboards (
    id integer NOT NULL,
    views integer NOT NULL,
    rating integer NOT NULL,
    downloads integer NOT NULL,
    revenue numeric NOT NULL,
    "idProject" integer NOT NULL
);
    DROP TABLE public.dashboards;
       public         heap    postgres    false            �            1259    16455    Dashboard_id_seq    SEQUENCE     �   ALTER TABLE public.dashboards ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Dashboard_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    207            �            1259    16499    devlogs    TABLE       CREATE TABLE public.devlogs (
    id integer NOT NULL,
    theme character varying NOT NULL,
    rating integer NOT NULL,
    date timestamp with time zone NOT NULL,
    "idPost" integer NOT NULL,
    "idProject" integer NOT NULL,
    "idComment" integer
);
    DROP TABLE public.devlogs;
       public         heap    postgres    false            �            1259    16497    Devlog_id_seq    SEQUENCE     �   ALTER TABLE public.devlogs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Devlog_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213            �            1259    16509    discussions    TABLE     �   CREATE TABLE public.discussions (
    id integer NOT NULL,
    theme character varying NOT NULL,
    marks character varying,
    date time with time zone NOT NULL,
    "idPost" integer NOT NULL,
    "idComment" integer
);
    DROP TABLE public.discussions;
       public         heap    postgres    false            �            1259    16507    Discussion_id_seq    SEQUENCE     �   ALTER TABLE public.discussions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Discussion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    16428 	   donations    TABLE     �   CREATE TABLE public.donations (
    id integer NOT NULL,
    sum numeric NOT NULL,
    comment character varying,
    date timestamp with time zone NOT NULL,
    "idUser" integer NOT NULL,
    "idProject" integer NOT NULL
);
    DROP TABLE public.donations;
       public         heap    postgres    false            �            1259    16436    Donation_id_seq    SEQUENCE     �   ALTER TABLE public.donations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Donation_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    204            �            1259    16519    posts    TABLE     �   CREATE TABLE public.posts (
    id integer NOT NULL,
    content text,
    "idUser" integer NOT NULL,
    text character varying NOT NULL
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    16517    Post_id_seq    SEQUENCE     �   ALTER TABLE public.posts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Post_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    16464    projectPages    TABLE     $  CREATE TABLE public."projectPages" (
    id integer NOT NULL,
    "URL" character varying NOT NULL,
    description character varying,
    preview character varying,
    screenshot character varying,
    trailer character varying,
    "idComment" integer,
    "idProject" integer NOT NULL
);
 "   DROP TABLE public."projectPages";
       public         heap    postgres    false            �            1259    16462    ProjectPage_id_seq    SEQUENCE     �   ALTER TABLE public."projectPages" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ProjectPage_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    16403    role    TABLE     x   CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying NOT NULL,
    access integer NOT NULL
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    16408    Role_id_seq    SEQUENCE     �   ALTER TABLE public.role ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Role_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    201            �            1259    16395    users    TABLE     *  CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    name character varying NOT NULL,
    description character varying,
    avatar character varying,
    contact character varying,
    "idRole" integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16406    User_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    200            �            1259    17077 	   libraries    TABLE     �   CREATE TABLE public.libraries (
    id integer NOT NULL,
    favorites character varying,
    purchases character varying,
    "idUser" integer NOT NULL
);
    DROP TABLE public.libraries;
       public         heap    postgres    false            �            1259    17075    libraries_id_seq    SEQUENCE     �   ALTER TABLE public.libraries ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.libraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    17054    projectToLibrary    TABLE        CREATE TABLE public."projectToLibrary" (
    id integer NOT NULL,
    "idProject" integer,
    "idLibrary" integer NOT NULL
);
 &   DROP TABLE public."projectToLibrary";
       public         heap    postgres    false            �            1259    17052    projectToLibrary_id_seq    SEQUENCE     �   ALTER TABLE public."projectToLibrary" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."projectToLibrary_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    17092    projects    TABLE       CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying NOT NULL,
    marks character varying,
    content character varying NOT NULL,
    cost numeric NOT NULL,
    "releaseDate" time with time zone NOT NULL,
    "idUser" integer NOT NULL
);
    DROP TABLE public.projects;
       public         heap    postgres    false            �            1259    17090    projects_id_seq    SEQUENCE     �   ALTER TABLE public.projects ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            %          0    16474    comments 
   TABLE DATA           O   COPY public.comments (id, content, rating, "time", "idUser", text) FROM stdin;
    public          postgres    false    211   �`       !          0    16457 
   dashboards 
   TABLE DATA           X   COPY public.dashboards (id, views, rating, downloads, revenue, "idProject") FROM stdin;
    public          postgres    false    207   �b       '          0    16499    devlogs 
   TABLE DATA           ^   COPY public.devlogs (id, theme, rating, date, "idPost", "idProject", "idComment") FROM stdin;
    public          postgres    false    213   Nc       )          0    16509    discussions 
   TABLE DATA           T   COPY public.discussions (id, theme, marks, date, "idPost", "idComment") FROM stdin;
    public          postgres    false    215   fd                 0    16428 	   donations 
   TABLE DATA           R   COPY public.donations (id, sum, comment, date, "idUser", "idProject") FROM stdin;
    public          postgres    false    204   �e       /          0    17077 	   libraries 
   TABLE DATA           G   COPY public.libraries (id, favorites, purchases, "idUser") FROM stdin;
    public          postgres    false    221   �f       +          0    16519    posts 
   TABLE DATA           <   COPY public.posts (id, content, "idUser", text) FROM stdin;
    public          postgres    false    217   mg       #          0    16464    projectPages 
   TABLE DATA           x   COPY public."projectPages" (id, "URL", description, preview, screenshot, trailer, "idComment", "idProject") FROM stdin;
    public          postgres    false    209   �i       -          0    17054    projectToLibrary 
   TABLE DATA           J   COPY public."projectToLibrary" (id, "idProject", "idLibrary") FROM stdin;
    public          postgres    false    219   �l       1          0    17092    projects 
   TABLE DATA           [   COPY public.projects (id, name, marks, content, cost, "releaseDate", "idUser") FROM stdin;
    public          postgres    false    223   �l                 0    16403    role 
   TABLE DATA           0   COPY public.role (id, name, access) FROM stdin;
    public          postgres    false    201   5n                 0    16395    users 
   TABLE DATA           b   COPY public.users (id, login, password, name, description, avatar, contact, "idRole") FROM stdin;
    public          postgres    false    200   �n       8           0    0    Comment_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Comment_id_seq"', 11, true);
          public          postgres    false    210            9           0    0    Dashboard_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Dashboard_id_seq"', 10, true);
          public          postgres    false    206            :           0    0    Devlog_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Devlog_id_seq"', 10, true);
          public          postgres    false    212            ;           0    0    Discussion_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Discussion_id_seq"', 10, true);
          public          postgres    false    214            <           0    0    Donation_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Donation_id_seq"', 10, true);
          public          postgres    false    205            =           0    0    Post_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Post_id_seq"', 10, true);
          public          postgres    false    216            >           0    0    ProjectPage_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."ProjectPage_id_seq"', 10, true);
          public          postgres    false    208            ?           0    0    Role_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Role_id_seq"', 36, true);
          public          postgres    false    203            @           0    0    User_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."User_id_seq"', 44, true);
          public          postgres    false    202            A           0    0    libraries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.libraries_id_seq', 12, true);
          public          postgres    false    220            B           0    0    projectToLibrary_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."projectToLibrary_id_seq"', 1, false);
          public          postgres    false    218            C           0    0    projects_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.projects_id_seq', 24, true);
          public          postgres    false    222            z           2606    16481    comments Comment_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comment_pkey" PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.comments DROP CONSTRAINT "Comment_pkey";
       public            postgres    false    211            v           2606    16461    dashboards Dashboard_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT "Dashboard_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.dashboards DROP CONSTRAINT "Dashboard_pkey";
       public            postgres    false    207            |           2606    16506    devlogs Devlog_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.devlogs
    ADD CONSTRAINT "Devlog_pkey" PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.devlogs DROP CONSTRAINT "Devlog_pkey";
       public            postgres    false    213            ~           2606    16516    discussions Discussion_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT "Discussion_pkey" PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.discussions DROP CONSTRAINT "Discussion_pkey";
       public            postgres    false    215            t           2606    16435    donations Donation_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT "Donation_pkey" PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.donations DROP CONSTRAINT "Donation_pkey";
       public            postgres    false    204            �           2606    16526    posts Post_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "Post_pkey" PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.posts DROP CONSTRAINT "Post_pkey";
       public            postgres    false    217            x           2606    16471    projectPages ProjectPage_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."projectPages"
    ADD CONSTRAINT "ProjectPage_pkey" PRIMARY KEY (id);
 K   ALTER TABLE ONLY public."projectPages" DROP CONSTRAINT "ProjectPage_pkey";
       public            postgres    false    209            r           2606    16414    role Role_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.role
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.role DROP CONSTRAINT "Role_pkey";
       public            postgres    false    201            p           2606    16402    users User_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.users DROP CONSTRAINT "User_pkey";
       public            postgres    false    200            �           2606    17084    libraries libraries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.libraries
    ADD CONSTRAINT libraries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.libraries DROP CONSTRAINT libraries_pkey;
       public            postgres    false    221            �           2606    17058 &   projectToLibrary projectToLibrary_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."projectToLibrary"
    ADD CONSTRAINT "projectToLibrary_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."projectToLibrary" DROP CONSTRAINT "projectToLibrary_pkey";
       public            postgres    false    219            �           2606    17099    projects projects_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            postgres    false    223            �           2606    16567    projectPages Comment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."projectPages"
    ADD CONSTRAINT "Comment_fkey" FOREIGN KEY ("idComment") REFERENCES public.comments(id) NOT VALID;
 G   ALTER TABLE ONLY public."projectPages" DROP CONSTRAINT "Comment_fkey";
       public          postgres    false    211    2938    209            �           2606    16587    devlogs Comment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.devlogs
    ADD CONSTRAINT "Comment_fkey" FOREIGN KEY ("idComment") REFERENCES public.comments(id) NOT VALID;
 @   ALTER TABLE ONLY public.devlogs DROP CONSTRAINT "Comment_fkey";
       public          postgres    false    2938    211    213            �           2606    16597    discussions Comment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT "Comment_fkey" FOREIGN KEY ("idComment") REFERENCES public.comments(id) NOT VALID;
 D   ALTER TABLE ONLY public.discussions DROP CONSTRAINT "Comment_fkey";
       public          postgres    false    211    215    2938            �           2606    16577    devlogs Post_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.devlogs
    ADD CONSTRAINT "Post_fkey" FOREIGN KEY ("idPost") REFERENCES public.posts(id) NOT VALID;
 =   ALTER TABLE ONLY public.devlogs DROP CONSTRAINT "Post_fkey";
       public          postgres    false    217    2944    213            �           2606    16592    discussions Post_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT "Post_fkey" FOREIGN KEY ("idPost") REFERENCES public.posts(id) NOT VALID;
 A   ALTER TABLE ONLY public.discussions DROP CONSTRAINT "Post_fkey";
       public          postgres    false    215    2944    217            �           2606    17121    projectPages Project_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."projectPages"
    ADD CONSTRAINT "Project_fkey" FOREIGN KEY ("idProject") REFERENCES public.projects(id) NOT VALID;
 G   ALTER TABLE ONLY public."projectPages" DROP CONSTRAINT "Project_fkey";
       public          postgres    false    223    2950    209            �           2606    16932    users Role_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Role_fkey" FOREIGN KEY ("idRole") REFERENCES public.role(id) NOT VALID;
 ;   ALTER TABLE ONLY public.users DROP CONSTRAINT "Role_fkey";
       public          postgres    false    2930    200    201            �           2606    16547    donations User_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.donations
    ADD CONSTRAINT "User_fkey" FOREIGN KEY ("idUser") REFERENCES public.users(id) NOT VALID;
 ?   ALTER TABLE ONLY public.donations DROP CONSTRAINT "User_fkey";
       public          postgres    false    204    2928    200            �           2606    16572    posts User_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "User_fkey" FOREIGN KEY ("idUser") REFERENCES public.users(id) NOT VALID;
 ;   ALTER TABLE ONLY public.posts DROP CONSTRAINT "User_fkey";
       public          postgres    false    217    200    2928            �           2606    16602    comments User_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "User_fkey" FOREIGN KEY ("idUser") REFERENCES public.users(id) NOT VALID;
 >   ALTER TABLE ONLY public.comments DROP CONSTRAINT "User_fkey";
       public          postgres    false    2928    211    200            �           2606    17106    projectToLibrary libraries_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."projectToLibrary"
    ADD CONSTRAINT libraries_fkey FOREIGN KEY ("idLibrary") REFERENCES public.libraries(id) NOT VALID;
 K   ALTER TABLE ONLY public."projectToLibrary" DROP CONSTRAINT libraries_fkey;
       public          postgres    false    219    221    2948            �           2606    17111    projectToLibrary projects_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."projectToLibrary"
    ADD CONSTRAINT projects_fkey FOREIGN KEY ("idProject") REFERENCES public.projects(id) NOT VALID;
 J   ALTER TABLE ONLY public."projectToLibrary" DROP CONSTRAINT projects_fkey;
       public          postgres    false    2950    223    219            �           2606    17116    dashboards projects_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT projects_fkey FOREIGN KEY ("idProject") REFERENCES public.projects(id) NOT VALID;
 B   ALTER TABLE ONLY public.dashboards DROP CONSTRAINT projects_fkey;
       public          postgres    false    2950    223    207            �           2606    17126    devlogs projects_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.devlogs
    ADD CONSTRAINT projects_fkey FOREIGN KEY ("idProject") REFERENCES public.projects(id) NOT VALID;
 ?   ALTER TABLE ONLY public.devlogs DROP CONSTRAINT projects_fkey;
       public          postgres    false    2950    223    213            �           2606    17131    donations projects_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT projects_fkey FOREIGN KEY ("idProject") REFERENCES public.projects(id) NOT VALID;
 A   ALTER TABLE ONLY public.donations DROP CONSTRAINT projects_fkey;
       public          postgres    false    2950    223    204            �           2606    17085    libraries users_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.libraries
    ADD CONSTRAINT users_fkey FOREIGN KEY ("idUser") REFERENCES public.users(id);
 >   ALTER TABLE ONLY public.libraries DROP CONSTRAINT users_fkey;
       public          postgres    false    2928    221    200            �           2606    17101    projects users_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT users_fkey FOREIGN KEY ("idUser") REFERENCES public.users(id) NOT VALID;
 =   ALTER TABLE ONLY public.projects DROP CONSTRAINT users_fkey;
       public          postgres    false    2928    200    223            %   �  x�uS[n�0��N��lI��4���G��,z�z��K��v�ڄ K ��G���f�iy��t#�s�]~ɞu=�9#�Uo�"�|Ŵ���+fRjՕ���d�(1�����E:�Z�\�75asuS-�� B�^��x1��5o7q7f6������ڶc���y@c�o��O����p7z���\����n(�q۾����Oս4��)�1TwU?Y�z��J�KM}�A��"r�#�%l�d��&?�П�j�;-t�-\�����Y̐ު#��#1�|j5�(��\��{��%�7rPX�6iCba�_�`��T�����Z���$3�!���*l�q�[R�;�Wm!�l�Ť�+��ۚ�d�ʯ����RG�m�b`��`�
i�L�$�K�v1��J?�[�p���	���S��:!�&�/!�k�9� -$�      !      x�-��@B�qsr��.��Ҥ?�<l�� ʈ�~ ��^�ͮ��.JW�3R��g"�J�E�o��.b��3(�)t�x�	�_(��h�r����$�b��9�<.�kq�E�e�&�KNi7�/��      '     x�m�Mn�0����W�&!�C������b��O��D0#�E�*y���3��JbIV0X�/��j�7T@����ᑧ��%IZ0��30Wy!���b�����1�]��[ S�
�u�7�}��Sp��>�=]ᨠJ�H��+�l�5��ʦ$ug��C�A�q��8��Ŷ&���$�i+�Ϭ: ]iie��b�f�V�9���0�[��(�rLk���F{A�@���W���2��q��=�$��u�is���N��-u�^����s�      )   :  x�m�9r�0Ek��3����>���d��}�@*c��y�^$(r��&���̰��{\*�
í�n�p��4^��	.�wfؤ���*	+݇��!ZI�� �_���L���Rq��9�[�6/�Ux��ws�آ�7����͛S\�`m�q�~ֳ��V�Zݧ9��J?s��!���Y�a�VHX�*�y��o�?�Q���&��բ���k`�Vq)VrB�V֟�+��XuE��O�\�h/x�����C1���V����R�o����Z0��+:�-U����	;��c����         �   x�}�=N1�k��D(���$�JTt�`��ESq�����Í0b�;Br�����P-�F�N�IZް�d֮�NX���A�r�{~$�(r�WB��Z4?����q~�_�E�����hPk�F��twWwG��x�ڿRw����Y
%�l�7dw 4R�����N���N��Φio/�oUO�Z(U���g�/wH"�C;.aF������j��u���X�<����8�1�B� #e)      /   �   x�UN�
�@}���� 	wg��hX��=����
I�fB��j�9#�p��ms���F$s�Ff��ﾦ��� 3J�Jȝ����g=G��avb�f,t7M@>���!u�l@Wz4t���L1����\OG=l�1��*��B�p}l��$�D!�}F!���!��G[      +   D  x�u�[n�0E��Uhq줯YĬ�?��8,�Af�s��Mg�
b[yy.9�����"j��Z�d&#���e��,g�=U�	6$y�����t�ع��5s�$,��<isҴ�2��v�l��2���/5�vl8� GAUz^�=ߥ�d#?j.Af�GEf��4�zΙ��R.�T[�yT��v�x��� �IU�}T�4Gq.%�GS���N������|���y����fc�S_�x�C*��D2��p�rV���l���
DK;��Ɗ�Ȓ#_�A�J�pA�ѪBjxjT�{a�f���n��R���x6��؛-W:�n�\HK�Qb [)��[�^������p���.�u�z���j��Up��jKbM�r�DRׅ-��5)��8/?e����m�-.���qߗ8�
*_�"`�_M^�&.dm�[���Gc�3�k����m��u���?��y߫�O:�S����a�����DW��y�id�|U��t.��C���2���*oЫM�0��0����h�>���`k���z�D�l=[?���M���^o�F8�_�Փ��k�l[Y��n��ٌ��      #   �  x��U[��0�&��	b�k�'��A�_k�{��m`ؙ����Hr��e�ŉ(������B굷RY �sL9I�$����Q*��2X��ꃛ�?��Vn���F�f��V��:l��h���j�䱮�8�"��\?�K����@"i|۟�w����V��	q�u������11��w2!� z~�)��0%�J�lo�R�.�ws��e+Љ�����;�(%&��:��>�(.ޘg\� 	�D�@XJ(�&NQV@T$�o��9����'��ꀡ�dou����/�5�-�n���̘m���ZՇۺ�JV����n��G���vw���K�����c��8K��Q�i����ͧ�pa���Tw>��Od͢U>j�Wt۷��W3j���ߡ�޳G�g�/�jrQTꨒ`k�so2E��W�r�&db�>��b�IdC5$����?y~l\Q�[�J�	(CjBVR��Eu[��k�q�ܟh��;ap�F�j~��l7���G�e��g���G;��euk�5�G��le��&��VC��Gʏ�-���t2'<O\���Qe�ӕ��&�㘰'�OL�G4��0�e��I���bVf��'�vl=iP���C�xoj�<1���X\�հ}q��+~ϖ[֑��r�x6S��t;����ݪ;܃�NcS���S�p<�c5^;�ؗ`�e�K.�z�k�ˇ`Ev�~>F�'�?�i@'C��WYV��f������">�      -      x������ � �      1   I  x�m�MO�0��ί�)䣣�nC���qDBfMi�6��0i�z�� �&E���y��Vp�^���Ǌj�v����:�efJΤ2I3��	���;آ�v���y��d�Ep����)�iM}͒
LxF$鋩�b��)��u��������p���6���o�w��D��Jgjr��2��&�^Q˗��.:�{���j%t��2��i	�#��@�;q�������
���1NRfq �Δi��NЕD~hhERia.M�hBÖ�=�h�o��"��������K#�iϼ���{x���fD�>[�P>�56���`ZdW�9e��1��_�n         <   x�36�LL����4�26���OI-�4�26�L.JM,�/�4�26�L��L�+�4����� g�         �  x�uRKo�0?��)"q�K��}�S��[�G�n�'��yt�Ӧ;�!$$�NH8 �Aц6�1���p��4�9�;���2B��S]7`}��q25̤Y�i/���hB5�8#^��~~#TBU�q�-��E�a"�?�<�(� �g��<Q�\^��<;̎�ޚ��VB5�t4�}�V���]ܟ@?�cFo�r�z	����c!X^[����ÂE����˟�2;��y�}O���J�$A0cviى��Y��F�V�neo���z���X��������8~b�XD&К=�;�i��"�o(��0��h��qt��@r=JzS����"�#��:f�m�3hI��E�^	�,�fGJ�y��a��3e��gy1L����A-�ca����$�.������
���[�!p(�(�����i�,��W�����H��%p�V~k�K�br�B>�
J과�K�x�j��1`8Jl�xu�z�����Y��*�|X��i,��Ƶa�E�Xx��e����Iȝ�C�&��2,<�oT�&�n��*���:^3W�v�İ�',w��Bb�tA���S;���.fy�g���G��\,h�E�hz_b'�9�a����ٝ�5x!���4|hw8�t�-p�+lt�v�GAr���OM�A56��u+Y�Q7����𔩳%�0�Ņ�\i9�9��r�T�E�p�     
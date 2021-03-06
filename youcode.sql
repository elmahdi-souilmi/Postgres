PGDMP         !                y            YOUCODE    13.2    13.2     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    17221    YOUCODE    DATABASE     f   CREATE DATABASE "YOUCODE" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_Morocco.1252';
    DROP DATABASE "YOUCODE";
                postgres    false            ?            1255    17231    changestatus() 	   PROCEDURE     ?   CREATE PROCEDURE public.changestatus()
    LANGUAGE sql
    AS $$
UPDATE youcoders
SET is_accepted  = true
WHERE campus  = 'Youssoufia'
$$;
 &   DROP PROCEDURE public.changestatus();
       public          postgres    false            ?            1255    17228 0   nbyoucoders(character varying, boolean, integer)    FUNCTION     V  CREATE FUNCTION public.nbyoucoders(ville character varying, status boolean, seuil integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
n INTEGER;
BEGIN
SELECT COUNT(*) INTO n FROM youcoders where is_accepted=status and campus = ville;
IF n < seuil THEN
RAISE EXCEPTION 'Trop de rattrapage (%) !', n;
ELSE
RETURN n;
END IF;
END
$$;
 Z   DROP FUNCTION public.nbyoucoders(ville character varying, status boolean, seuil integer);
       public          postgres    false            ?            1255    17230    stsameref(character varying)    FUNCTION     -  CREATE FUNCTION public.stsameref(student character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
sClasse VARCHAR;
n INTEGER;

BEGIN
SELECT classe INTO sClasse FROM youcoders where full_name=student;

SELECT COUNT(*) INTO n FROM youcoders where classe=sClasse;




return n;

END
$$;
 ;   DROP FUNCTION public.stsameref(student character varying);
       public          postgres    false            ?            1255    17229    studentperc(integer)    FUNCTION       CREATE FUNCTION public.studentperc(total integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
n INTEGER;
percentage NUMERIC;
BEGIN
SELECT COUNT(*) INTO n FROM youcoders where campus='Youssoufia' and classe = 'FEBE';

percentage = (total * n)/100;

return percentage;

END
$$;
 1   DROP FUNCTION public.studentperc(total integer);
       public          postgres    false            ?            1255    17233    update_false()    FUNCTION     ?   CREATE FUNCTION public.update_false() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
       UPDATE youcoders SET is_accepted = false;
       RETURN NEW;
    END;
$$;
 %   DROP FUNCTION public.update_false();
       public          postgres    false            ?            1255    17232    updateclasse() 	   PROCEDURE     ?   CREATE PROCEDURE public.updateclasse()
    LANGUAGE sql
    AS $$
UPDATE youcoders
SET classe  = 'DATA BI'
WHERE nbr_competence=14 AND matricule LIKE '%2%'
$$;
 &   DROP PROCEDURE public.updateclasse();
       public          postgres    false            ?            1259    17222 	   youcoders    TABLE     G  CREATE TABLE public.youcoders (
    matricule character varying(4) NOT NULL,
    full_name character varying(15) NOT NULL,
    campus character varying(15) NOT NULL,
    classe character varying(15) NOT NULL,
    referentiel character varying(15) NOT NULL,
    nbr_competence numeric(5,0) DEFAULT 0,
    is_accepted boolean
);
    DROP TABLE public.youcoders;
       public         heap    postgres    false            ?          0    17222 	   youcoders 
   TABLE DATA           s   COPY public.youcoders (matricule, full_name, campus, classe, referentiel, nbr_competence, is_accepted) FROM stdin;
    public          postgres    false    200   ?       (           2606    17227    youcoders youcoders_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.youcoders
    ADD CONSTRAINT youcoders_pkey PRIMARY KEY (matricule);
 B   ALTER TABLE ONLY public.youcoders DROP CONSTRAINT youcoders_pkey;
       public            postgres    false    200            )           2620    17234    youcoders update_false    TRIGGER     r   CREATE TRIGGER update_false AFTER INSERT ON public.youcoders FOR EACH ROW EXECUTE FUNCTION public.update_false();
 /   DROP TRIGGER update_false ON public.youcoders;
       public          postgres    false    200    206            ?   ?   x?}??j?0?????^$ǿG%??ژ??RzY??E?brh??Vu?	????c??8ǫl䖭?
G{?&{4?*?%6???0m??h?H??'F???h?x)K?C?̥DB}?9???Ӣ'?!?4M.??}Im?v?3??[?G?8Z??/C?O?E3T*?b+???>颉?x?mw7?<??Ѕ?Yn?[O??v2l???'N(C?????_y?n?W?F?????<A?? qO     
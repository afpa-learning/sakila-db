-------------------------------------------------------------------------------------
-- Entraînement à la création de vues                                              --
--                                                                                 --
-- Travail à faire :                                                               --
-- 1. Regarder la vidéo https://www.youtube.com/watch?v=0pe3XzbjdxA                --
--    pour comprendre le concept de vue                                            --
--    Grafikart utilise une BDD SqLite mais c'est la même chose (presque) partout. --
-- 2. Compléter ce fichier avec vos propositions de requêtes.                      --
-- 3. Pousser votre code sur votre Git                                             --
--                                                                                 --
-- Merry query!                                                                    --
-------------------------------------------------------------------------------------

-- Créer une vue "long_films" qui présente tous les films (avec leur langue) de plus de 2 heures
-->
CREATE OR REPLACE
VIEW `long_films` AS
??????

-- Créer une vue "customers_with_rentals" qui présente tous les client qui ont des prêts en cours.
--> 

-- Créer une vue "film_list" qui présente toutes les informations des films (ormis la langue) avec, en plus les noms des acteurs (sous forme de chaîne de caractères dans une colonne)
-- Indices :
-- + il vous faudra utiliser un GROUP BY ainsi que GROUP_CONCAT pour concaténer les noms des acteurs : https://sql.sh/fonctions/group_concat
-->
CREATE OR REPLACE
VIEW `film_list` AS
select
    `film`.`film_id` AS `id`,
    ?????
    group_concat(???????????) AS `actors`
from
    ?????? JOINTURE ?????
group by
    `film`.`film_id`,
    `category`.`name`;

-- Créer une vue "top_three_genre" qui présente les 3 genres qui rapporte le plus.
-- Indices : 
-- + procédez en 2 étapes : 1->conception de la requête qui sélectionne les 3 genres avec leur revenu respectif, 2->construction de la vue
-- + pour la requête, vous allez utiliser les tables "category", "film_category", "inventory", "payment" et "rental"
--> 
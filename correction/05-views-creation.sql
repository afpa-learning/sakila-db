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

-- Créer une vue "film_list" qui présente tous les films (avec leur langue) de plus de 2 heures
CREATE OR REPLACE
VIEW `film_list` AS
select
    `film`.`film_id` AS `FID`,
    `film`.`title` AS `title`,
    `film`.`description` AS `description`,
    `category`.`name` AS `category`,
    `film`.`rental_rate` AS `price`,
    `film`.`length` AS `length`,
    `film`.`rating` AS `rating`,
    group_concat(concat(`actor`.`first_name`, _utf8mb4' ', `actor`.`last_name`) separator ', ') AS `actors`
from
    ((((`film`
left join `film_category` on
    (`film_category`.`film_id` = `film`.`film_id`))
left join `category` on
    (`category`.`category_id` = `film_category`.`category_id`))
left join `film_actor` on
    (`film`.`film_id` = `film_actor`.`film_id`))
left join `actor` on
    (`film_actor`.`actor_id` = `actor`.`actor_id`))
group by
    `film`.`film_id`,
    `category`.`name`;

-- Créer une vue "customers_with_rentals" qui présente tous les client qui ont des prêts en cours.
--> 

-- Créer une vue "customers_with_rentals" qui présente tous les client qui ont des prêts en cours.
--> 

-- Créer une vue "top_three_genre" qui présente les 3 genres qui rapporte le plus.
-- Indices : 
-- + procédez en 2 étapes : 1->conception de la requête qui sélectionne les 3 genres avec leur revenu respectif, 2->construction de la vue
-- + pour la requête, vous allez utiliser les tables "category", "film_category", "inventory", "payment" et "rental"
--> 
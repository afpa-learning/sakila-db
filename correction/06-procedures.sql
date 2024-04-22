-----------------------------------------------------------------------------------------------
-- Implémetnation de procédures stockées                                                     --
--                                                                                           --
-- Complétez ce fichier avec vos propositions de procédures                                  --
-- Dans le cas où du code vous est déjà fourni, bien faire attention de compléter les "????" --
--                                                                                           --
-- Bon courage !                                                                             --
-----------------------------------------------------------------------------------------------

-- Ecrire une fonction qui renvoie un status utilisateur en fonction du nombre de DVD déjà loués.
-- De 0 à 10 locations : le status est "Casual viewer"
-- de 10 à 30 locations : le status est "Amateur"
-- > 30 locations : le status est "Cinéphile"
--
-- En SQL, pour appeler une fonction vous pouvez utiliser un SELECT.
-- Exemple : SELECT user_status(1);
--
-- Données en entrée :
-- + int, identifiant de l'utilisateur
-- Donnée en sortie :
-- + VARCHAR(20), le status de l'utilisateur
CREATE FUNCTION sakila.user_status(IN user_id int)
RETURNS VARCHAR(20)
BEGIN
	DECLARE rentals_count INT DEFAULT 0;

	SELECT count(*) INTO rentals_count FROM rental WHERE customer_id = user_id;

	if rentals_count < 10 THEN
		return "Casual viewer";
    elseif rentals_count < 30 THEN
    	return "Amateur";
    ELSE 
    	return "Cinéphile";
    end if;
END

-- Ecrire une fonction qui retourne le nombre de DVD disponibles à location (non empruntés) proposés par un magasin.
-- 
-- Attention, si l'identifiant du magasin n'existe pas dans la table magasin il faudra lever une erreur avec le mécanisme de SIGNAL de MariaDb
-- Plus d'information sur SIGNAL : https://mariadb.com/kb/en/signal/
--
-- Donnée d'entrée :
-- + int, identifiant d'un magasin
CREATE FUNCTION sakila.count_inventory(IN store_id int)
RETURNS INT
BEGIN
	DECLARE store_ok TINYINT(1) DEFAULT 0;
	DECLARE inventory_count INT DEFAULT 0;

	-- vérification de l'existence du magasin
	SET store_ok = EXISTS(SELECT * from store s WHERE s.store_id = store_id);
	
	if store_ok = 0 then
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001, MESSAGE_TEXT='Le magasin n''existe pas.';
	end if;

	SELECT count(*) into inventory_count FROM inventory i WHERE i.store_id = 1
	AND i.inventory_id NOT IN (SELECT r.inventory_id FROM rental r WHERE r.return_date IS NULL);
	
	return inventory_count;
END

-- Ecrire une fonction qui renvoie "VRAI" si le DVD est en inventaire dans un magasin précisé en paramètre.
-- 
-- La fonction retourne "FAUX" dans le cas contraire.
--
-- Données en entrée : 
-- + int, identifiant d'un magasin
-- + text, titre du film
-- Donnée en sortie :
-- + TINYINT(1) (équivalent du bool en MySQL), 1 si le film est en inventaire, 0 sinon
--
-- Pour tester votre fonction utilisez l'appel suivant : SELECT is_film_in_inventory(1, "ACADEMY DINOSAUR");
CREATE FUNCTION sakila.is_film_in_inventory(IN store_id int, IN film_title TEXT)
RETURNS TINYINT(1)
BEGIN
	DECLARE inventory_count INT DEFAULT 0;
	
	SELECT count(*) into inventory_count from inventory i 
	WHERE store_id = 1 AND film_id = 
		(SELECT f.film_id FROM film f WHERE title = "ACADEMY DINOSAUR");
	
	if inventory_count > 0 then
		return 1;
	else
		return 0;
	end if;
END

-- Ecrire une procédure qui renvoie une chaîne de caractère correspondant à la concaténation des 3 films les plus loués.
-- Il vous est demandé d'utiliser un curseur pour constuire cette procédure.
-- 
-- Données en entrée : aucune
-- Données en sortie : chaîne de caractère correspondant à la concaténation de 3 titres de films
-- Avec le jeu d'essai founi vous devriez obtenir : "FORWARD TEMPLE, ROCKETEER MOTHER, BUCKET BROTHERHOOD"
-- Ci-dessous la déclaration de la procédure et des indices sur le développement
CREATE FUNCTION sakila.most_rented_films()
RETURNS TEXT 
BEGIN
	-- Déclaration de la variable pour le gestionnaire NOT FOUND.
  DECLARE finished TINYINT(1) DEFAULT 0;
	-- chaîne de caractères stockant le résultat
	DECLARE most_rented TEXT DEFAULT "";
	-- Déclaration des variables de récupération des résultats
	DECLARE film_title VARCHAR(400) DEFAULT "";
	DECLARE inventory_count INT DEFAULT 0;

	-- déclaration du curseur
	DECLARE film_cursor CURSOR FOR 
		select f.title, count(*) as nb_location 
		from film f join inventory i on f.film_id = i.film_id 
		join rental r on r.inventory_id = i.inventory_id 
		GROUP by f.film_id ORDER by nb_location DESC LIMIT 3;
	
	-- On indique au gestionnaire de curseur que si la fin est atteinte, la variable "finished" doit passer à 1
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

	OPEN film_cursor;
	foreach_film: LOOP
		FETCH film_cursor INTO film_title, inventory_count;
	
		IF finished = 1 THEN 
			-- si le curseur a ter
			leave foreach_film;
		end if;
	
		-- mise à jour de la chaîne de caractères résultat
		SET most_rented = CONCAT(film_title, ", ", most_rented);
	END LOOP foreach_film;
	CLOSE film_cursor;
  -- Utlisation de LEFT pour renvoyer une chaîne de caractère de comprenant la virgule finale
	return LEFT(most_rented, length(most_rented) - 2);
END

-- Ecrire une fonction stockée nommée "inventory_in_stock" 
-- Compléter la procédure stockée suivante :
CREATE FUNCTION `sakila`.`inventory_in_stock`(p_inventory_id INT) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
    -- déclaration des variables
    DECLARE v_rentals INT;
    DECLARE v_out     INT;

    SELECT COUNT(*) INTO v_rentals
    FROM rental
    WHERE inventory_id = p_inventory_id;

    IF v_rentals = 0 THEN
      RETURN TRUE;
    END IF;

    SELECT COUNT(rental_id) INTO v_out
    FROM inventory LEFT JOIN rental USING(inventory_id)
    WHERE inventory.inventory_id = p_inventory_id
    AND rental.return_date IS NULL;

    IF v_out > 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
END

-- Ecrire une procédure qui renvoie la médiane de la durée des films
-- Indice : https://www.1keydata.com/fr/sql/sql-mediane.php
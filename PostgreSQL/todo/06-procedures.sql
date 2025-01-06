-----------------------------------------------------------------------------------------------
-- Implémentation de procédures stockées                                                     --
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

	-- Implémenter une structure de contrôle permettant de renvoyer la chaîne de caractère attendue
    -- Plus d'information sur les structures de contrôle en MariaDB : https://mariadb.com/kb/en/programmatic-compound-statements/
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
	
	-- Traiter l'erreur au besoin
    -- ??????????

	SELECT count(*) into ????????? FROM inventory i WHERE i.store_id = 1
	AND i.inventory_id NOT IN (SELECT r.inventory_id FROM rental r WHERE r.return_date IS ?????);
	
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
-- + TINYINT(1) (équivalent du bool en MySQL) : 1 si le film est en inventaire, 0 sinon
--
-- Pour tester votre fonction utilisez l'appel suivant : SELECT is_film_in_inventory(1, "ACADEMY DINOSAUR");
CREATE FUNCTION sakila.is_film_in_inventory(int store_id, TEXT film_title)
RETURNS ????????
BEGIN
    -- Déclaration de la variable résultat
    DECLARE inventory_count INT DEFAULT 0;

    -- Faire la requête permettant de mettre à jour la variable
    -- Pour plus d'informations concernant les variables MySQL : https://www.mysqltutorial.org/mysql-stored-procedure/variables-in-stored-procedures/

    -- retourner le résultat de la fonction
END

--
-- Ecrire une procédure qui renvoie une chaîne de caractère correspondant à la concaténation des 3 films les plus loués.
-- Il vous est demandé d'utiliser un curseur pour constuire cette procédure.
-- 
-- Données en entrée : aucune
-- Données en sortie : chaîne de caractère correspondant à la concaténation de 3 titres de films
--
-- Avec le jeu d'essai founi vous devriez obtenir : "FORWARD TEMPLE, ROCKETEER MOTHER, BUCKET BROTHERHOOD"
--
-- Ci-dessous la déclaration de la procédure et des indices sur le développement
CREATE FUNCTION sakila.most_rented_films()
RETURNS TEXT 
BEGIN
    -- Vous allez utiliser un curseur pour passer en revue les résultats d'une requête
    -- Voici un tutoriel sur le fonctionnement des curseurs en MySQL : https://waytolearnx.com/2019/11/les-curseurs-dans-mysql.html

    -- Les étapes de l'algorithme à développer sont :
    -- 1 déclaration des variables qui seront utilisées

    -- 2 Déclaration du curseur avec la requête répondant au besoin (vous avez peut être déjà fait cette requête :) )

    -- 3 Boucle qui permettra de passer en revue les résultat de la requête et constuire la chaîne de caractère résultat

    -- 4 retour de la chaîne de caractères résultat
end


-- Ecrire une procédure qui renvoie la médiane de la durée des films
-- Indice sur le développement : https://www.1keydata.com/fr/sql/sql-mediane.php
-----------------------------------------------------------------------------------
-- Entraînement LMD : Langage de manipulation des données                        --
--                                                                               --
-- Requêtes UPDATE :                                                             --
-- 1. Prendre connaissance de la ressource : https://sql.sh/cours/update         --
-- 2. Compléter ce fichier avec vos propositions de requêtes                     --
-- 3. Pousser votre code sur votre Git                                           --
--                                                                               --
-- Merry query!                                                                  --
-----------------------------------------------------------------------------------

-- Une erreur s'est glissée dans le prénom de l'utilisateur d'identifiant 98.
-- Ecrire une requête permettant de changer l'ortographe de "Lillian" en "Lilian"
-->

-- Le client Lee Hawks rend le film "DETECTIVE VISION" (des années après, il avait oublié, ne lui en voulez pas)
-- Il l'a rendu ce matin à 8h30.
-- Ecrire une requête qui met à jour la date et heure de retour pour sa location.
-->

-- Comme chacun le sait, "ACADEMY DINOSAUR" est un film hilarant. Le film n'a malheureusement que la catégorie "Documentary".
-- Il est important que les gens sachent qu'une importante dose d'humour les attend en louant ce film.
--
-- Ecrire une requête qui ajoute la catégorie "Comedy" au film "ACADEMY DINOSAUR".
-->

-- Le membre de l'équipe Jon Stephens met à jour son mot de passe (jusqu'alors manquant).
-- RÈGLE FONDAMENTALE : les mots de passe en base de données doivent être HACHÉS !!
-- Plus d'informations sur les fonctions de Hachage : https://youtu.be/OHXfKCH0b6s?si=XoQk2piTDPrxi6dO&t=32
--
-- Jon souhaite mettre son mot de passe à jour avec le mot de passe suivant : edgarCodd4Ever
--
-- Avant de l'insérer, hachez le en suivant les recommandations de OWasp : https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html
-- Pour hacher des mots de passe vous pourrez utiliser des outils en ligne, par exemple pour Argon2id : https://argon2.online/
--
-- Ecrire la requête avec le hash calculé via l'outil en ligne.
-->

-- Que remarquez vous en comparant le hash du mot de passe de Mike et celui de Jon ?
-- Essayez de retrouver le mot de passe en clair de Jon en utilisant l'outil suivant : https://sha1.gromweb.com/?hash=8cb2237d0679ca88db6464eac60da96345513964
--
-- Quelle est la morale de cette histoire ? :)
--
-- Re-calculez le hash du mot de passe de Mike en utilisant Argon2id puis écrivez une requête qui permet de le mettre à jour.
-->

-- Mettre à "null" les valeurs de la colonne "address2" de la table "address" dans le cas où "adress2" est vide (mais non "null")
--> 

-- Le fournisseur a augmenté le coût des supports. Chaque DVD coûte maintenant 1 dollar de plus.
-- Modifiez le coût de remplacement de tous les films en augmentant la valeur d'un.
-->

-- Le magasin d'identifiant 1 déménage, il ne sera plus situé au 47 MySakila Drive mais au 78 DataBase street (même ville, même département).
-- Ecrire une requête permettant de faire la modification.
--> 

-----------------------------------------------------------------------------------------------
-- Implémentation de triggers                                                                --
--                                                                                           --
-- Complétez ce fichier avec vos propositions de triggers.                                   --
-- Dans le cas où du code vous est déjà fourni, bien faire attention de compléter les "????" --
--                                                                                           --
-- Plus d'informations sur les triggers :                                                    --
-- + https://www.mariadbtutorial.com/mariadb-triggers/mariadb-create-trigger/                --
--                                                                                           --
-- Attention de ne pas oublier "delimiter //" lors de la création de triggers.               --
--                                                                                           --
-- Bon courage !                                                                             --
-----------------------------------------------------------------------------------------------

-------- Cas d'utilisation : empêcher la suppression d'enregistrement --------
-- 
-- On considère que Mike Hillyer est le super administrateur de l'application (en plus d'être un excellent loueur).
-- Vous allez mettre en place une trigger pour empêcher la suppression de cet utilisateur.
--
-- Vous allez procéder en plusieurs étapes :
-- 1. Cibler quand le trigger doit se déclencher
-- 2. Cibler la table à utiliser
-- 3. Implémenter l'empêchement de suppression
--
-- Compléter les ????? de ce trigger
delimiter //
CREATE OR REPLACE TRIGGER `stop_delete_admin` ??????? ON ????? FOR EACH ROW
BEGIN
    -- Insérer ici le code de vérification d'identité
    -- Il est possible de faire référenc à l'enregistrement que l'on tente de supprimer en utilisant le mot clé OLD
    if ????? then
        -- La ligne suivante permet d'interrompre le traitement et ainsi d'empêcher la suppression
        -- Faire évoluer cette ligne pour afficher le message 'Impossible de supprimer l'utilisateur super admin : <prenom-identifiant-1> <nom-identifiant-1>
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = ???????;
    end f;
END;
// 

--
-- Il vous est demandé d'écrire un trigger qui empêche la suppression de tous les enregistrements de "rental" pour lesquels il n'y a pas de dates de retour.
-- Cette fois-ci, aucun code n'est fourni.
-- You can do it!
-->


-------- Cas d'utilisation : mettre à jour des informations d'une table --------
--
-- Mettre en place un trigger permettant de mettre à jour la "last_update" de la table "rental" dans le cas où la colonne "return_date" est mise à jour.
-- "last_update" doit donc être mis à jour lors de la modification de "return_date"
--
-- En SQL la date actuelle peut être retrouvée en utilisant le fonction "now()"
delimiter //
CREATE OR REPLACE TRIGGER `update_last_update` ??????? ON ??????????
BEGIN
    ????????
END;
//

--
-- Mettre en place un trigger permettant de mettre à jour une table de suivi des dépenses totales des clients.
-- Chaque total devra être rattaché au membre du staff qui a encaissé le paiement.
--
-- Etapes de développement :
-- 1. Créer une table "total_payment" avec la structure suivante (données fictives)
--  __________________________
--  |     total_payment      |
--  | id | amount | staff_id |
--  |  1 |  1212  |     1    |
--  |  2 |  5465  |     2    |
--  ▔▔▔▔▔▔▔▔▔▔▔▔▔▔
--  Pour créer une nouvelle table de base de données référez vous à la documentation suivante : https://www.mariadbtutorial.com/mariadb-basics/mariadb-create-table/
--  Pour les types de données à utiliser pour chaque colonne : https://mariadb.com/kb/en/data-types-numeric-data-types/
--
-- 2. Une fois la table créée, implémentez un trigger qui devra mettre à jour la colonne "amount" qui correspond au "staff_id" correct


-------- Cas d'utilisation : création de table d'audit --------
--
-- Implémentez une table d'audit de la table "staff".
-- Vous pourrez vous inspirer du tutoriel suivant : https://medium.com/@rajeshkumarraj82/mysql-table-audit-trail-using-triggers-bd32b772cce5
--
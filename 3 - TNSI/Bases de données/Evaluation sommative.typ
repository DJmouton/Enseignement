#import "/Templates/layouts.typ": NSI, titre, sous_titre
#import "/Templates/utils.typ": cadre
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import fletcher.shapes: pill

#show: doc => NSI(doc)
#titre[Evaluation Bases de Données]

On pourra utiliser les mots clés suivants du langage SQL : `SELECT`,
`FROM`, `WHERE`, `JOIN…ON`, `INSERT INTO…VALUES`, `UPDATE…SET`, `COUNT`, `ORDER BY`.

On pourra également utilser la requête `SELECT COUNT(*) FROM table` qui renvoie le nombre d'enregistrements de la relation table.

Le gestionnaire d'une agence de locations de voitures a mis en place une base de données relationnelle afin de pouvoir gérer au mieux son parc automobile et ses locations.

Pour cela, il crée trois relations (`vehicule`, `utilisateur` et `location`) dont on donne un extrait ci-dessous :

#show table.cell.where(y: 0): strong
#table(
    columns: 6,
    "id_vehicule", "immatriculation", "marque", "modele", "type", "carburant",
    "1", "AB-135-YZ", "Peugeot", "208", "citadine", "diesel",
    "2", "EC-246-TP", "Renault", "Zoe", "citadine", "electrique",
    "3", "LC-231-MG", "Tesla", "Model X", "SUV", "electrique",
    "4", "ML-128-VM", "Citroën", "C3", "citadine", "essence",
    "5", "CL-142-CE", "Citroën", "C5", "berline", "diesel",
    "6", "JL-526-LM", "Peugeot", "508", "berline", "diesel",
    "...", "...", "...", "...", "...", "...",
)

#table(
    columns: 6,
    "id_utilisateur", "nom", "prenom", "permis", "adresse", "ville",
    "131", "MARTIN", "Jeanne", "106566874", "2 place de l'Etoile", "Paris",
    "132", "PETIT", "Pierre", "75625569", "6 rue d'Alsace", "Lille",
    "133", "DUBOIS", "Louise", "1448526", "52 rue de la Liberté", "Rennes",
    "134", "DUPONT", "Paul", "1288638", "4 boulevard Jaurès", "Paris",
    "135", "MOREAU", "Violette", "14081221926", "14 rue du 8 mai", "Rouen",
    "136", "DURAND", "Kevin", "19262316811", "20 avenue Curie", "Caen",
    "...", "...", "...", "...", "...", "...",
)

#table(
    columns: 5,
    "id_location", "id_utilisateur", "id_vehicule", "date_debut", "date_fin",
    "1", "135", "4", "2022-04-14", "2022-05-14",
    "2", "131", "2", "2022-06-21", "2022-06-28",
    "3", "136", "5", "2022-06-21", "2022-06-22",
    "...", "...", "...", "...", "...",
)

L'attribut `id_vehicule` de la relation `vehicule`, l'attribut `id_utilisateur` de la relation `utilisateur` et l'attribut `id_location` de la relation `location` sont des clés primaires.

Les attributs `date_debut` et `date_fin` sont de type `DATE` sous forme AAAA-MM-JJ où AAAA correspond à l'année, MM correspond au mois et JJ au jour du mois.

#pagebreak(weak: true)

*Exercice 1*

a. Écrire le résultat de la requête suivante :

`SELECT id_vehicule
FROM vehicule WHERE type = 'citadine';`

b. Écrire une requête permettant d’afficher les immatriculations des véhicules
diesel.

c. Écrire le résultat de la requête suivante :

`SELECT immatriculation, modele
FROM vehicule ORDER BY marque ;
`
d. Écrire une requête permettant de calculer le nombre de véhicules dans la
table vehicule.

e. Écrire une requête permettant d’afficher les noms et prénoms des utilisa-
teurs par ordre alphabétique du nom.

*Exercice 2*

a. Citer, en justifiant, les clés étrangères de la table location.

b. Écrire un schéma relationnel des relations vehicule, utilisateur et location.

c. Expliquer pourquoi la requête suivante produit une erreur :

`INSERT INTO location
VALUES (1, 132, 4, '2022-05-10', '2022-05-12');`

*Exercice 3*

Une erreur s'est glissée dans la relation utilisateur :
Louise DUBOIS habite au numéro 50 de la rue de la Liberté, et non pas au 52.

a. Écrire une requête permettant de modifier cette information.

Un nouveau client souhaite louer une voiture. Ses informations sont les sui-
vantes :
#table(
    columns: 5,
    "nom", "prenom", "permis", "adresse", "ville",
    "LEFEBVRE", "Gabriel", "124689", "0 ruelle des champs", "Amiens",
)

b. Écrire une requête permettant d'ajouter ce nouvel utilisateur.
On lui affectera un id_utilisateur de 137.

Une nouvelle location de véhicule a été effectuée : Pierre PETIT souhaite louer le véhicule de marque Tesla entre le 21 juin 2022 et le 23 juin 2022.

c. Écrire une requête permettant d'ajouter cette information à la table
location. On lui donnera un id_location égal à 4.

*Exercice 4*

Écrire une requête permettant de lister les modèles et les immatriculations des véhicules dont les locations ont débuté le 21 juin 2022 ainsi que les noms et prénoms des utilisateurs correspondants.

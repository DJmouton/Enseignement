#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import fletcher.shapes: pill

#import "/Templates/layouts.typ": NSI, titre, sous_titre
#import "/Templates/utils.typ": cadre

#show: doc => NSI(doc)

#titre("Activité données en tables")

= L'entreprise de mon cousin

Votre cousin décide de se lancer dans la fabrication de cartes électroniques pour l’industrie solaire photovoltaïque. Il a déjà beaucoup de cartes électroniques à son catalogue, les commandes commencent à affluer et il a du mal à planifier la gestion des fournitures de pièces détachées, la fabrication des cartes électroniques, le contrôle qualité, la vente, les stocks, les clients...

Bref il vous appelle à l’aide pour la gestion de son stock et de sa fabrication de cartes électroniques. Bien sûr le projet vous enthousiasme et vous avez accepté de relever ce challenge.

Pour vous mettre dans le bain votre cousin vous explique le processus de conception et de fabrication de ses cartes électroniques.

=== Les données pour réaliser votre tâche

Le logiciel de conception de schéma électronique établi la liste des composants nécessaires pour chacune des cartes automatiquement. Le format CSV est utilisé.

Les fichiers produits sont dans le dossier `DATA/`

= Données en table : mise en oeuvre

/*Important :* Pour chaque exercice, il faudra faire un fichier python différent.

Exemple: `exercice1.py`, `exercice2.py`...
*/
== Lire un fichier de données

Voilà le code qui permet de lire le contenu d'un fichier CSV produit par le logiciel de conception :

`import csv

chemin_fichier = "DATA/CARTE_I2C_LM75.csv"

with open(chemin_fichier, newline="", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    for ligne in reader:
        print(ligne)
`

== Utiliser des sélections

*Exercice 1 :* Ecrire une fonction qui donne la liste des résistances pour la carte CARTE_I2C_LM75.

_Note : Les résistances sont les composants de catégorie "Résistors"_

#underline([_Résultat attendu :_]):

`{'Category': 'Resistors', 'Reference': 'R1', 'Value': '10k'}
{'Category': 'Resistors', 'Reference': 'R2', 'Value': '10k'}
{'Category': 'Resistors', 'Reference': 'R3', 'Value': '150'}
{'Category': 'Resistors', 'Reference': 'R4', 'Value': '150'}`

*Exercice 2 :* Ecrire une fonction qui donne la liste des différentes valeurs des composants de la carte CARTE_I2C_LM75, sans doublons.

#underline([_Résultat attendu :_])

`['10k', '150', 'LM75', 'I2C_VOX', 'BVIS3', 'JUMPER', 'JUMPER2', 'PTEST']`

*Exercice 3 :* Ecrire une fonction qui, pour chaque valeur des composants, affiche la quantité nécessaire à la fabrication de la carte.

#underline([_Résultat attendu :_])

`{'10k': 2, '150': 2, 'LM75': 1, 'I2C_VOX': 2, 'BVIS3': 1,
 'JUMPER': 2, 'JUMPER2': 3, 'PTEST': 3}`

== Le magasin à composants

Le fournisseur chez lequel l'entreprise de votre cousin achète ses composants fourni un catalogue avec le prix HT (hors taxe) pour chaque composants. Ce catalogue est dans le fichier `CATALOGUE PRIX COMPOSANTS.csv`.

*Exercice 4 :* Ecrire une fonction qui associe chaque valeur de composants dans le catalogue à son prix HT.

Attention ce sont des prix professionnels donc il faut ajouter les taxes. Pour calculer un prix TTC (toutes taxes comprises) il faut multiplier par 1,20 le prix HT.

*Exercice 5 :* Modifier la fonction de l'exercice précédent afin qu'elle associe, en plus du prix HT, le prix TTC.

== Utiliser une jointure : facture d'une carte

Maintenant que l'on a tout les outils pour créer une liste de composants d'une carte et de récuper le prix de ces composants, il est l'heure de faire une factures grâce à nos scripts.

*Exercice 6 :* Ecrire une fonction qui associe à chaque valeur de composants de la carte CARTE_I2C_LM75 son prix.

*Exercice 7 :* Ecrire une fonction qui réalise la facture de la carte CARTE_I2C_LM75. La facture doit contenir :
- la catégorie du composant,
- son nom,
- sa quantité,
- son prix HT individuel,
- son prix HT combiné (quantité \* prix),
- à la fin:
    - le prix HT total de la carte,
    - le prix TTC total de la carte

== Travail par lots

Il y a déjà beaucoup de cartes électroniques référencées dans l’entreprise de votre cousin. Pour améliorer l’efficacité de vos logiciels vous souhaitez travailler par lot. Vous allez travailler sur tous les fichiers de description des cartes avec un script unique, les fichier sont dans le dossier `DATA/`

*Exercice 8 :* Ecrire une fonction qui afficher la facture de chaque carte électroniques.

== Améliorations

Vous avez montré votre travail à votre cousin, il est très satisfait de l’aide que vous lui apportez.

Pour pouvoir immédiatement utiliser vos résultats il vous demande d’en améliorer la présentation, il veut faire des fiches pour aider à la réalisation des cartes électroniques, ces fiches seront distribuées aux ouvriers chargés de câbler les prototypes.

*Exerice 9 :* Ecrire une fonction qui réalise la fiche demandée. Cet exercice est ouvert, vous n'êtes pas obligé de faire exactement comme le résultat attendu.

#underline([_Exemple de résultat attendu :_])

#image("liste_composants.png")

De même, votre cousin aimerait que les factures soient lisible pour que le magasinier puisser passer commande facilement.

*Exerice 10 :* Ecrire une fonction qui réalise la facture demandée. Cet exercice est ouvert, vous n'êtes pas obligé de faire exactement comme le résultat attendu.

#underline([_Exemple de résultat attendu :_])

#image("facture.png")

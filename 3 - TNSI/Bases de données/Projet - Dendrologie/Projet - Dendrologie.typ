#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import fletcher.shapes: pill

#import "/Templates/layouts.typ": NSI, titre, sous_titre
#import "/Templates/utils.typ": cadre

#show: doc => NSI(doc)

#titre("Projet Dendrologie")
#sous_titre("Partie 1")

= Introduction

Vous faites partie de guides touristiques pour oiseaux sur Grenoble et votre job est de répertorier tout les arbres de la ville pour au mieux répondre aux attentes de vos clients.

Pour ce faire, vous avez accès à un fichier CSV contenant l'entièreté des arbres de Grenoble avec tout les détails associés à ces arbres.

#image("carte.png")

Votre rôle au long de ce projet sera de :
+ Concevoir une base de données pertinente à partir des données fournies.
+ Afficher ces arbres sur une carte de Grenoble avec leur données relatives.
+ Permettre la recherche d'arbres en fonction de ses charactéristiques.

Les rendus attendus pour ce projet sont :
- Un *journal de bord*, détaillant ce que vous avez fait à chaque séance.
- Le *modèle relationnel* de votre base de données, avec la justification de vos choix de table et d'attributs.
- Le *code* de votre projet.
Le projet se soldera par un oral de présentation de votre projet.

= Conception de la base de données

== Les attentes de notre base de données
Les données que nous utiliserons sont dans le fichier `arbres_de_grenoble.csv`. Pour notre base de données, toutes les colonnes de cette table de données ne nous seront pas utiles.

Pour ce projet, nous seront utile les données de localisation, autant pour les afficher sur la carte que pour faire des recherches, mais aussi les données relatives à l'arbre en lui même, que ce soit le genre botanique, ses charactéristiques (taille, âge...), sa description, etc.

== Manipulation de bases de données en python

Pour manipuler la base de donnée en python, nous allons utiliser le module `sqlite3`

`import sqlite3`

Créer ou se connecter au ficher base_de_donnees.db :
`connection = sqlite3.connect("base_de_donnees.bd")`

Pour manipuler cette base de données, nous allons utiliser un "curseur" :
`cursor = connection.cursor()`

À partir de ce cursor, nous pouvons simplement exécuter des commandes SQL comme vu en cours précédemment.
```
cursor.execute("""
  DROP TABLE IF EXISTS department;

  CREATE TABLE department(
    id integer,
    name text,
    PRIMARY KEY("id")
  );
""")
```

On peut ajouter des lignes de plusieurs manières différentes

```
cursor.execute("INSERT INTO department VALUES (1,"Sales");")

id = 2
name = "Admin"
cursor.execute(f"INSERT INTO department VALUES (id,name);")

cursor.execute("INSERT INTO department VALUES (?,?);", (3, "IT"))
```

Pour sélectionner des lignes, il faut utiliser la méthode `fetchball()` qui renvoie une liste de chaque lignes de la requête.

```
cursor.execute("SELECT * FROM department")
lignes = cursor.fetchall()
for ligne in lignes:
    print(ligne)
```

*Important* : Comme lorsque l'on manipule un fichier, il faut fermer la base de données après l'avoir utilisé pour ne pas perdre de données.

`connection.close()`

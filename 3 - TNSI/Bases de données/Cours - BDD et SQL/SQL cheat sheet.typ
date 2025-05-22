#import "/Templates/layouts.typ": NSI, titre, sous_titre
#import "/Templates/utils.typ": cadre

#show: doc => NSI(doc)

#set page(flipped: true, header: text(size: 24pt, "Cheat Sheet SQL"))


#show table.cell.where(y: 0): strong
#set table(
    align: (x, y) => (
        if y < 1 { center } else { left }
    ),
)

= Requêtes de sélection (affichage) des données

#table(
    columns: (1fr, 1fr, 3fr, 1fr, 2fr),
    "Fonction", "Action", "Options", "Exemple", "Explication verbeuse",
    "SELECT",
    "Sélectionner un attribut",
    "* permet de sélectionner tous les attributs de la table",
    ``` SELECT *
    FROM Monstres ;```,
    "Je sélectionne tous les attributs de la table monstre pour toutes les entités",

    "WHERE",
    "Sélectionner un élément",
    [
        - =, >, >=, <, ≤,
        - LIKE (permet la sélection de motif textuel plus complexe),
        - AND, OR, NOT (permet d'ajouter des conditions)
        - BETWEEN : sélectionner entre 2 nombre spécifier
    ],
    ``` SELECT *
    FROM Monstres
    WHERE Classe = 'Mage';```,
    "J'utilise une condition booléenne pour sélectionner tous les attributs des Monstres qui sont de classe 'Mage'.",

    "ORDER BY",
    "Ordonner la table de manière croissante ou décroissante",
    "DESC : permet de classer par ordre descendant (décroissant)",
    ``` SELECT *
    FROM Monstres
    ORDER BY Race;```,
    "Je sélectionne tous les attributs de la table monstre pour toutes les entités en classant les monstres par race (ordre alphabétique)",

    "LIMIT",
    "Limiter l'affichage de l'attribut par un nombre spécifié",
    "",
    ``` SELECT Race
    FROM Monstres
    LIMIT 3;```,
    "J'affiche l'attribut race des trois premières entités.",
)

//TODO distinct count minmax sumavg groupby join

#pagebreak(weak: true)

= Requêtes de création/modification des données

#table(
    columns: (1fr, 1fr, 1fr, 2fr, 3fr),
    "Fonction", "Action", "Options", "Exemple", "Explication verbeuse",
    [CREATE TABLE Table #v(2em) #text(size: 8pt, emph("hors programme"))],
    "Créer une table",
    "PRIMARY KEY, désigne la clé primaire",
    ``` CREATE TABLE Monstres (
    Identifiant PRIMARY KEY VARCHAR(20),
    Classe VARCHAR(20),
    Niveaux INT,
    Tribu VARCHAR(20))```,
    "Je crée une relation qui s'appelle 'Monstres' avec un attribut 'identifiant' qui est la clé primaire, un attribut Classe et qui peu contenir 20 caractères. Je crée un autre attribut 'Niveaux' qui contiendra des nombres entiers (INT).",

    "INSERT INTO Table VALUES",
    "Insérer une entité",
    "",
    ``` INSERT INTO Monstres
    VALUES ( 1, "Mage", 75, "Elfe" );```,
    "J'insère une nouvelle entité dans la relation 'Monstres' qui a pour id la valeur '1', pour Classe la valeur 'Mage', un niveau égale à '75' et une appartient à la race des 'Elfe'.",

    "DROP TABLE Table",
    "Effacer la table",
    "IF EXISTS",
    ``` DROP TABLE IF EXISTS Monstres;```,
    "Je supprime la table 'Monstres' si elle existe.",

    "UPDATE TABLE Table SET",
    "Modifier la table",
    "",
    ``` UPDATE Monstres
    SET Classe = 'Guerrier'
    WHERE Classe = 'Mage'```,
    "Modifier la valeur de classe des entités de la table 'Monstres' dont la classe est égale à 'Mage' en mettant la valeur 'Guerrier' à la place.",

    "DELETE FROM Table WHERE",
    "Supprimer une ou plusieurs entités",
    "",
    ``` DELETE FROM Monstres WHERE tribu = 'Elfe'```,
    "Supprimer toutes les entités dont la tribu est 'Elfe'",
)

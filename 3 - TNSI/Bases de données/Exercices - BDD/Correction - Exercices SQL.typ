#import "/Templates/layouts.typ": NSI, titre, sous_titre
#import "/Templates/utils.typ": cadre

#show: doc => NSI(doc)

#titre[Correction Exercices SQL]
#show raw: it => box(
    outset: 0.15em,
    radius: 2pt,
    fill: luma(230),
    it,
)
#set raw(lang: "SQL")

*Exercice 1 *
1. `SELECT NomStations
FROM Stations
WHERE Capacite > 200`
>>> Tanger, La Bourboule et Courchevel

2. `SELECT Nom
FROM Clients
WHERE Solde > 10000 OR SUBSTRING(Nom, 1, 1) == "J" # SUBSTRING n'est pas à savoir`
>>> Smith et Jonhson

3. `SELECT NomStations
FROM Activités
Where Libelle == Plongée`
>>> Tanger, Victoria


*Exercice 2*
1. `SELECT Nom
FROM Clients JOIN Séjours ON Clients.Id = Séjours.IdClient
WHERE Station == "La Bourboule"`
>>> Jonhson et Smith

2. `SELECT Stations
FROM Séjours JOIN Clients ON Clients.Id = Séjours.IdClient
WHERE Clients.Region == "Europe"`
>>> Courchevel, La Bourboule et Victoria

*Exercice 3*
1. `SELECT COUNT(Stations) AS Total
FROM Séjours
WHERE Station == "Victoria"`
>>> 2

2. `SELECT AVG(Prix) AS PrixMoyenActicitésTanger
FROM Activités
WHERE NomStation == "Tanger"`
>>> 90

*Exercice 4*
1. `SELECT NomStation + '(' + Lieu + ')' AS Stations,
       Tarif AS TarifHT,
       Tarif * 1.2 AS TarifTTC
FROM Stations`

2. Non, le tarif TTC est uniquement présent grâce à la requête et n'est pas stocké dans la table.

*Exercice 5*
1. `INSERT INTO Clients VALUES (4, "Karibou", "Juliette", "Toronto", "Amérique", 7213)
INSERT INTO Séjours VALUES (4, "La Bourboule", 10-07-2019, 3)`

2. Non, il n'y a pas de tables qui enregistre les activités que les clients ont fait.

*Exercice 6*
1. `UPDATE Stations
SET Capacite = 450, Tarif = 2300
WHERE NomStation = "Courchevel"`

2. Non, on ne peut pas modifier une table, il faudrait en recréer une.

*Exercice 7*

`DELETE
FROM Séjours
WHERE idClient = 4

DELETE
FROM Clients
WHERE Id = 4`

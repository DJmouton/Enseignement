#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import fletcher.shapes: pill

#import "/Templates/layouts.typ": NSI, titre, sous_titre
#import "/Templates/utils.typ": cadre

#show: doc => NSI(doc)

#titre[TNSI - Modélisation et conception d'une base de données]

#show table.cell.where(y: 0): strong
#set table(
    stroke: (x, y) => (
        if y < 2 { 1pt } else { (top: 0pt, bottom: 1pt, left: 1pt, right: 1pt) }
    ),
    align: (x, y) => (
        if y < 1 { center } else { left }
    ),
)

#let association(action, variable) = arguments(
    grid(
        stroke: 0pt,
        grid.cell(inset: 5pt, strong(action)),
        grid.cell(inset: 5pt, stroke: (top: 1pt), align(left, variable))
    ),
    inset: 5pt,
    stroke: 1pt,
)

= Concevoir une base de donnée

== Généralités

=== Intérêts d'un Système de Gestion de Base de Données (SGBD)

- Assure la persistance des données
- Structure l'information
- Permet de trouver rapidement une information
- Multi-utilisateurs
- Sécurise les données
    - Filtre les données qu'un groupe d'utilisateurs peut voir
    - Centralise la sauvegarde et la mise à jour des données
- Maintient la cohérence des données
    - Non redondance
    - Contrôle de l'intégrité des données (lors de la saisie, mise à jour, suppression)

=== Type de SGBD
- Bases hiérarchiques (structure arborescente) ou réseau (structure de graphe)
    - navigation entre les données
#v(-0.5em)
#rect(radius: 10pt)[
    - Bases relationnelles
        - Données sous forme de table, langage SQL
]
#v(-0.5em)
- Bases déductives
    - Intégration d'ensemble de règles, langage DATALOG
- Bases objet
    - Données sous forme d'objets
- Bases noSQL
    - Pas de structuration des données

== Volumétrie

=== Exemple d'une banque (BNP Paribas)

#grid(
    columns: 2,
    [
        Grande masse d’informations $8 * 10^6$ clients

        - 4 comptes par client, donc $32 * 10^6$ comptes
        - 20 écritures par mois par compte, donc $6.4 * 10^8$ écritures par mois
    ],
    [
        Plusieurs utilisateurs simultanément

        - 2140 agences
        - 31.460 collaborateurs
        - des milliers d’accès internet
    ],
)

== Analyse

+ Travail préalable à la création de la base de données
//- Travail complexe et difficile
+ Déterminer les informations qui sont nécessaires à l'application
    - gestion de la paie, des congés, du stock
    - application web
+ Dictionnaire de données
    - Parmi toutes les informations, on repère les données élémentaires ou propriétés
    - niveau de granularité dépend du contexte (adresse, client,... )
    - Le dictionnaire de données représente l'ensemble des données élémentaires


== Modèle Conceptuel de Données: MCD

- Le MCD est une représentation du système d'informations à l'aide d'entités et d'associations
- C'est le résultat du travail des analystes, il sert de base à la création de la base de données
- Peut être lu et compris par des non informaticiens
- Un MCD est toujours contextuel //! à préciser la définition

#let client = table(
    columns: 70pt,
    "client",
    underline("id_client"),
    "nom",
    "prenom",
    "mail"
)

#cadre(
    titre: "Notion d'identité",
    grid(
        columns: 2,
        [
            - Une entité regroupe les propriétés relatives à un même sujet, qui a du sens
                - Exemple: une voiture, un individu...
            - Comporte un identifiant
                - peut être composé par une seule ou plusieurs propriétés
                - est unique: ne peut être le même pour deux entités
            - Se représente par un rectangle, l'identifiant est souligné
        ],
        align(center, client),
    ),
)

#let produit = table(
    columns: 70pt,
    "produit",
    underline("id_produit"),
    "libelle",
    "couleur",
    "prix"
)

#cadre(titre: "Notion d'association")[
    - Les entités peuvent être liées par des associations
    - Une association est une représentation abstraite de la mémorisation d'un lien entre entités
    - Elle est représentée par un cercle entre entités
        - Exemples: `commande`, `est_inscrit`, `travaille_pour`, `est_marie`, `habite_dans`....

    #align(
        center,
        diagram(
            node-inset: 0pt,
            node-shape: rect,
            edge-stroke: 0.1em,
            node((0, 0), client, name: <cli>),
            node((2, 0), shape: pill, ..association("commande", "quantite"), name: <com>),
            node((4, 0), produit, name: <pro>),
            edge(<cli>, <com>),
            edge(<com>, <pro>),
        ),
    )
]

#cadre(titre: "Cardinalités")[
    - Les cardinalités précisent le nombre de fois que l'entité peut intervenir dans une association.
    - La valeur minimale est 0 ou 1, la valeur maximale est 1 ou n
    - L'association peut-être hiérarchique (maximum 1 d'un côté, n de l'autre) ou maillée (maximum n des deux côtés), entre une ou plusieurs entités

    #align(
        center,
        diagram(
            node-inset: 0pt,
            node-shape: rect,
            edge-stroke: 0.1em,
            node((0, 0), client, name: <cli>),
            node((2, 0), shape: pill, ..association("commande", "quantite"), name: <com>),
            node((4, 0), produit, name: <pro>),
            edge(<cli>, <com>, $0,n$),
            edge(<com>, <pro>, $0,n$),
        ),
    )
]
=== Autres exemples

#let etudiant = table(
    columns: 70pt,
    "etudiant",
    underline("id_etudiant"),
    "nom",
    "prenom",
    "mail"
)

#let etablissement = table(
    "etablissement",
    underline("libelle"),
    "adresse"
)

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), etudiant, name: <etu>),
        node((2, 0), shape: pill, ..association("est_inscrit", "annee"), name: <com>),
        node((4, 0), etablissement, name: <eta>),
        edge(<etu>, <com>),
        edge(<com>, <eta>),
    ),
)

Un (`min=1, max=1`) étudiant peut être inscrit dans aucune ou plusieurs (`min = 0` `max = n`) universités.

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), etudiant, name: <etu>),
        node((2, 0), shape: pill, ..association("est_inscrit", "annee"), name: <com>),
        node((4, 0), etablissement, name: <eta>),
        edge(<etu>, <com>, $1, 1$),
        edge(<com>, <eta>, $0, n$),
    ),
)

#let individu = table(
    columns: 70pt,
    "individu",
    underline("id_individu"),
    "nom",
    "prenom",
    "mail"
)

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), individu, name: <ind>),
        node((2, 0), shape: pill, ..association("est_marie", ""), name: <mar>),
        edge((<ind.east>, 50%, <ind.north-east>), <mar>),
        edge((<ind.east>, 50%, <ind.south-east>), <mar>),
    ),
)

Un individu peut-être marié à au plus une personne. Il peut ne pas être marié. `min=0, max=0` des deux côtés.

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), individu, name: <ind>),
        node((2, 0), shape: pill, ..association("est_marie", ""), name: <mar>),
        edge((<ind.east>, 50%, <ind.north-east>), <mar>, $0, 1$),
        edge((<ind.east>, 50%, <ind.south-east>), <mar>, $0, 1$),
    ),
)

Un individu peut-être divorcé à plusieurs personnes. Il peut ne pas être divorcé. `min=0, max=n` des deux côtés.

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), individu, name: <ind>),
        node((2, 0), shape: pill, ..association("est_divorce", ""), name: <mar>),
        edge((<ind.east>, 50%, <ind.north-east>), <mar>, $0, n$),
        edge((<ind.east>, 50%, <ind.south-east>), <mar>, $0, n$),
    ),
)

#let abonne = table(
    "abonne",
    underline("id_abonne"),
    "nom",
    "prenom",
    "date_fin_abonnement",
    "mail",
    "tel"
)

#let terrain = table(
    columns: 70pt,
    "terrain",
    underline("libelle"),
    "type_sport"
)

#let creneau = table(
    columns: 70pt,
    "creneau",
    underline("jour"),
    underline("heure")
)

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), abonne, name: <abo>),
        node((2, 0), shape: pill, ..association("reservation", "utilise"), name: <res>),
        node((4, 0), terrain, name: <ter>),
        node((2, 0.8), creneau, name: <cre>),
        edge((<abo.east>, 50%, <abo.north-east>), <res>),
        edge((<abo.east>, 50%, <abo.south-east>), <res>),
        edge(<ter>, <res>),
        edge(<cre>, <res>),
    ),
)

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), abonne, name: <abo>),
        node((2, 0), shape: pill, ..association("reservation", "utilise"), name: <res>),
        node((4, 0), terrain, name: <ter>),
        node((2, 0.8), creneau, name: <cre>),
        edge(<abo> /*(<abo.east>, 50%, <abo.north-east>)*/, <res>, $0, n$),
        //edge((<abo.east>, 50%, <abo.south-east>), <res>, $0, n$),
        edge(<ter>, <res>, $0, n$),
        edge(<cre>, <res>, $0, n$),
    ),
)

/*== Complément sur les cardinalités

[http://tony3d3.free.fr/files/Les-Cardinalites.pdf](http://tony3d3.free.fr/files/Les-Cardinalites.pdf)*/

== Modèle Relationnel

- La traduction concrète du MCD dépend du modèle de la base
- Dans le cas d'une base de données relationnelle, on obtient un modèle relationnel

=== Principe

- Données sous forme de tables
- Chaque table et chaque colonne (ou attribut) porte un nom
- Chaque attribut est typé
- Chaque ligne représente un enregistrement
- Pas de lien physique entre les tables


== Passage du MCD au Modèle Relationnel

=== Principe
- Chaque entité devient une table
- Chaque propriété d'une entité devient un attribut
- L'identifiant d'une entité devient la clé primaire de la table (Primary Key)

#cadre(titre: "Lien Hiérarchique")[
    Une association (0-n)-(0-1) est un lien hiérarchique.

    Elle se traduit par la migration de la clé primaire côté n vers une clé étrangère (Foreign Key) côté 1

    #align(
        center,
        diagram(
            node-inset: 0pt,
            node-shape: rect,
            edge-stroke: 0.1em,
            node((0, 0), etudiant, name: <etu>),
            node((2, 0), shape: pill, ..association("est_inscrit", "annee"), name: <com>),
            node((4, 0), etablissement, name: <eta>),
            edge(<etu>, <com>, $1, 1$),
            edge(<com>, <eta>, $0, n$),
        ),
    )

    On l'indique avec une flêche *de la clé étrangère vers la clé primaire*.

    #align(
        center,
        diagram(
            node-inset: 0pt,
            node-shape: rect,
            edge-stroke: 0.1em,
            node((0, 0), etudiant, name: <etu>),
            node((4, 0), etablissement, name: <eta>),
            edge(<etu>, <eta>, "-|>"),
        ),
    )
]

#let commande = table(
    "commande",
    underline(emph("id_client")),
    underline(emph("id_produit")),
    "quantite"
)
#cadre(titre: "Lien Maillé")[
    Une association maillée (0-n)-(0-n) donne lieu à la création d'une nouvelle table dont la clé primaire est l'union des clés primaires des entités qu'elle relie.

    Ces attributs sont aussi des clés étrangères.

    #align(
        center,
        diagram(
            node-inset: 0pt,
            node-shape: rect,
            edge-stroke: 0.1em,
            node((0, 0), client, name: <cli>),
            node((2, 0), shape: pill, ..association("commande", "quantite"), name: <com>),
            node((4, 0), produit, name: <pro>),
            edge(<cli>, <com>, $0,n$),
            edge(<com>, <pro>, $0,n$),
        ),
    )

    On l'indique donc avec deux flêches, de la table `relation` vers les tables contenant les clés primaires.

    #align(
        center,
        diagram(
            node-inset: 0pt,
            node-shape: rect,
            edge-stroke: 0.1em,
            node((0, 0), client, name: <cli>),
            node((2, 0), commande, name: <com>),
            node((4, 0), produit, name: <pro>),
            edge(<com>, <cli>, "-|>"),
            edge(<com>, <pro>, "-|>"),
        ),
    )
]

=== Autres exemples

=== Est marié

#let individu_bis = table(
    "individu",
    underline("id_individu"),
    emph("id_individu_marie"),
    "nom",
    "prenom",
    "mail"
)

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), individu_bis, name: <ind>),
        //edge(<ind.east>, (<ind.east>, -25%, <ind.west>), (<ind.south-west>, 125%,<ind.north-east>), (<ind.north>, -25%, <ind.south>), <ind.north>, "-|>"),
        edge((<ind.east>, 50%, <ind.north-east>), (<ind.east>, 50%, <ind.south-east>), bend: 90deg, "-|>"),
    ),
)

=== Est divorcé

#let est_divorce = table(
    "est_divorce",
    emph("id_individu"),
    emph("id_individu_marie")
)

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), individu, name: <ind>),
        node((2, 0), est_divorce, name: <div>),
        edge(<div.west>, (<ind.east>, 50%, <ind.north-east>), "-|>"),
        edge(<div.west>, (<ind.east>, 50%, <ind.south-east>), "-|>"),
    ),
)

=== Réservation

#let reservation = table(
    "reservation",
    underline(emph("id_abonne")),
    underline(emph("libelle")),
    underline(emph("jour")),
    underline(emph("heure")),
    "utilise"
)

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), abonne, name: <abo>),
        node((2, 0), reservation, name: <res>),
        node((4, 0), terrain, name: <ter>),
        node((2, 0.9), creneau, name: <cre>),
        edge(<res>, <abo>, "-|>"),
        edge(<res>, <ter>, "-|>"),
        edge(<res>, <cre>, "-|>"),
    ),
)

= Conception à partir d'un csv

=== Retour sur l'exemple des catégories socio-professionnelles

Dans le cas où on récupère des données réelles, le problème se pose différemment.

Le dictionnaire des données est déduit du csv récupéré.

En revanche, les données réelles peuvent poser d'autres problèmes: doublons, incohérences, données non complétées ou peu exploitables.

En général, il faut faire un travail de "nettoyage" pour pouvoir créer les tables.

== Construire une structure optimisée

#cadre(titre: "Regrouper les données en tables")[
    - Mettre dans une même table les données relatives à un même sujet
    - Créer de nouvelles tables pour éviter la redondance des données
        - Limite les incohérences lors des mises à jour
        - Facilite la construction des requêtes et améliore la pertinence des résultats
]

#cadre(titre: "Établir les relations entre tables")[
    - Définir les clés primaires
        - Uniques et non NULL
    - Définir les clés étrangères
        - Référencent les clés primaires
]

#cadre(titre: "Définir des colonnes pertinentes")[
    - Facilité d'interrogation des colonnes
    - Données cohérentes au sein d'une colonne
    - Ne pas conserver des données qui peuvent être calculées
]

=== Cas des catégories socioprofessionnelles du Nord.

#image("categorie_socio_csv.png")

== Construire une structure pertinente

#cadre(titre: "Regrouper les données en tables")[
    - Tables = données relatives à un même sujet
        - Données sur les villes et sur les effectifs des catégories
]

#cadre(titre: "Éviter la redondance des colonnes")[
    - var = Tranche + categorie
    - categorie = abréviation Catégorie socioprofessionnelle
]

#cadre(titre: "Éviter la redondance des valeurs")[
    - Les colonnes `departement` et `region` ne contiennent qu'une seule valeur
    - À conserver uniquement si volonté d'étendre à d'autres données
]

#cadre(titre: "Données cohérentes")[
    - Les colonnes Sexe, Tranche, ... contiennent aussi des totaux !
        - Les totaux peuvent être calculés à l'aide de fonctions et d'agrégats
    - Décomposer `coordonnees` en deux REAL
]

== MCD possible

#let ville = table(
    "ville",
    underline("code"),
    "region",
    "departement",
    "nom",
    "coordonnees"
)

#let genre = table(
    columns: 70pt,
    "genre",
    underline("genre")
)

#let categorie = table(
    "categorie",
    underline("categorie")
)

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), ville, name: <vil>),
        node((2, 0), shape: pill, ..association("evaluation", "effectif"), name: <eva>),
        node((4, 0), genre, name: <gen>),
        node((2, 0.8), categorie, name: <cat>),
        edge(<vil>, <eva>, $0, n$),
        edge(<gen>, <eva>, $0, n$),
        edge(<cat>, <eva>, $0, n$),
    ),
)

#let evaluation = table(
    "evaluation",
    underline(emph("code")),
    underline(emph("genre")),
    underline(emph("categorie")),
    "effectif"
)

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), ville, name: <vil>),
        node((2, 0), evaluation, name: <eva>),
        node((4, 0), genre, name: <gen>),
        node((2, 0.9), categorie, name: <cat>),
        edge(<eva>, <vil>, "-|>"),
        edge(<eva>, <gen>, "-|>"),
        edge(<eva>, <cat>, "-|>"),
    ),
)

#let evaluation_bis = table(
    "evaluation",
    underline(emph("code")),
    underline("genre"),
    underline("categorie"),
    "effectif"
)

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), ville, name: <vil>),
        node((2, 0), evaluation_bis, name: <eva>),
        edge(<vil>, <eva>, $1, infinity$),
    ),
)

= Bilan

//== Quelques remarques

- Base de données relationnelle: ensemble de tables, aucun lien physique entre les tables
- Contraintes d'intégrité :
    - Clé primaire
    - Clé étrangère (contrainte référentielle)
    - Contrainte de domaine (CHECK prix > 0, CHECK reponse IN ('O','N')...) //! uuum
- Produit Cartésien vs `JOIN`: `JOIN` plus efficace
- `JOIN` indépendant des contraintes référentielles

/*
- Exécution d'une requête:

    ```sql
    SELECT DISTINCT attribut_1, attribut_2
    FROM table1
    WHERE attribut_3 > 4
    ORDER BY attribut_2;
    ```

== Sources

Ce cours est librement adapté d'un cours de Lille 1

- Livres
  - Des Bases de Données à l'Internet, *Philippe Mathieu*, _Vuibert_
  - Bases de Données, de la modélisation au SQL, *Laurent Audibert*, _Ellipses_

- Sources: articles Wikipedia
  - https://fr.wikipedia.org/wiki/Base_de_donn%C3%A9es_relationnelle
  - https://fr.wikipedia.org/wiki/Mod%C3%A8le_relationnel
  - http://www.capa-invest.fr/portfolio/bnp-paribas-bddf/
*/

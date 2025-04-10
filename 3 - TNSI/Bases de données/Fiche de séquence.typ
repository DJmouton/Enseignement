#import "/Templates/layouts.typ": SNT, titre, sous_titre

#show: doc => SNT(doc)

#set page(flipped: true)

#titre[TNSI - Bases de données]

#sous_titre[Fiche de séquence]

= Programme et objectifs

#table(
  columns: (0.6fr, 1fr, 1fr, auto),
  [*Contenus*], [*Capacités attendues*], [*Commentaires*], [*ID*],
  "Modèle relationnel : relation, attribut, domaine, clef primaire, clef étrangère, schéma relationnel.", 
  "Identifier les concepts définissantle modèle relationnel.", 
  "Ces concepts permettent d’exprimer les contraintes d’intégrité (domaine, relation et référence).",
  "A",
  "Base de données relationnelle.", 
  "Savoir distinguer la structure d’une base de données de son contenu. \nRepérer des anomalies dans le schéma d’une base de données.", 
  "La structure est un ensemble de schémas relationnels qui respecte les contraintes du modèle relationnel. \nLes anomalies peuvent être des redondances de données ou des anomalies d’insertion, de suppression, de mise à jour. \nOn privilégie la manipulation de données nombreuses et réalistes.",
  "B",
  "Système de gestion de bases de données relationnelles.", 
  "dentifier les services rendus par un système de gestion de bases de données relationnelles : persistance des données, gestion des accès concurrents, efficacité de traitement des requêtes, sécurisation des accès.", 
  "Il s’agit de comprendre le rôle et les enjeux des différents services sans en détailler le fonctionnement.",
  "C",
  "Langage SQL : requêtes d’interrogation et de mise à jour d’une base de données.", 
  "Identifier les composants d’une requête. \nConstruire des requêtes d’interrogation à l’aide des clauses du langage SQL : SELECT, FROM, WHERE, JOIN. \nConstruire des requêtes d’insertion et de mise à jour à l’aide de : UPDATE, INSERT, DELETE.", 
  "On peut utiliser DISTINCT, ORDER BY ou les fonctions d’agrégation sans utiliser les clauses GROUP BY et HAVING.",
  "D"
)

= Séance 1 - Les bases de données relationnelles & Langage SQL

#sym.arrow Lister les services rendus par un *système de gestion de base de données relationnelles* : persistance des données, gestions des accès concurrents, efficacité du traitement des requêtes, sécurisation des accès.

#sym.arrow Construire des requêtes SQL d'interrogation (*SELECT*, *FROM*, *WHERE*, *JOIN*) et d'insertion (*UPDATE*, *INSERT*, *DELETE*) en sachant trier (*ORDER BY*), effectuer des fonctions d'agrégation (par ex. *COUNT*) et en enlevant les doublons (*DISTINCT*).

#pagebreak(weak:true)
== Phases de la séance

#let phase_séance(nom: "", objectifs: "", durée: "", contenu: "", prof: "", eleve: "", supports: "") = arguments(nom, objectifs, durée, contenu, prof, eleve, supports)

#let planning_séance(..args) = [
  #set text(size: 10pt)
  #table(
    columns: (auto, auto, auto, 2.5fr, 1fr, 1.5fr, 1fr),
    [*Phase*], [*Objectifs*], [*Durée*], [*Contenu*], [*Posture prof*], [*Posture élève*], [*Supports*],
    ..args,
  )
]

#planning_séance(
  ..phase_séance(
    nom: "Introduction",
    objectifs: "A, C",
    durée: "30m",
    contenu: "Comprendre le principe des bases de données relationnelles. \nDéfinitions initiales, Clés primaires et étrangères, contraintes d'identité. \nIntérêt d'une BDD.",
    prof: "Cours magistral",
    eleve: "Ecoutent",
    supports: "Sujet papier, tableau"

  ),
  ..phase_séance(
    nom: "Découverte SQL",
    objectifs: "D",
    durée: "1h",
    contenu: "Cours-exercice guidé pour découvrir le SQL en manipulant sur machine.",
    prof: "Passe dans les rangs pour aider",
    eleve: "Pratiquent en autonmie",
    supports: "Sujet papier, SQLite Studio sur machine"
  ),
  ..phase_séance(
    nom: "Instit.",
    objectifs: "A, C, D",
    durée: "30m",
    contenu: "Récap et institutionalisation avec exercices fait en commun.",
    prof: "Au tableau, anime le récap",
    eleve: "Remplissent leur feuille récap et répondent aux exercices",
    supports: "Feuille récap, tableau"
  )
)

= Séance 2 - Concevoir une base de données

#sym.arrow Comprendre les concepts du modèle relationnel
- Définir les mots suivants : relation, attributs, domaine, clef primaire, clef étrangère, schéma relationnel
- Expliquer les contraintes d'intégrité (domaine, relation et référence)
- Distinguer la structure d'une base de données de son contenu
- Repérer les anomalies dans le schéma d'une base de données (redondances de données, anomalies d'insertion, de suppression, de mise à jour)

#planning_séance(
  ..phase_séance(
    nom: "Cours",
    objectifs: "B, C",
    durée: "30m",
    contenu: "Comprendre comment concevoir une base de données. \nModèle conceptuel de données (comme UML). \nExplication en détail d'une SGBD",
    prof: "Cours magistral",
    eleve: "Ecoutent",
    supports: "Sujet papier, tableau"
  ),
  ..phase_séance(
    nom: "TP",
    objectifs: "B, C, D",
    durée: "1h30",
    contenu: "TP guidé menant à la conception d'une BDD et la manipulation d'une base de données via SQL.",
    prof: "Passe dans les rangs + fait des remarque quand besoin",
    eleve: "Autonomie + écoutent quand remarque au tableau",
    supports: "Sujet papier, tableau, SQLite Studio"
  )
)

= Séance 3 - Mini projet BDD

#planning_séance(
  ..phase_séance(
    nom: "Projet",
    objectifs: "B, D",
    durée: "2h",
    contenu: "Mini projet où il faudra concevoir puis implémenter une base de données."
  )
)

= Source

- https://qkzk.xyz/docs/nsi/cours_terminale/bdd/partie_2/
- https://adrientaudiere.github.io/cours_nsi/#/terminal/bases_de_donnees
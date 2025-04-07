#import "/Templates/layouts.typ": SNT, titre, sous_titre

#show: doc => SNT(doc)

//#import "@preview/fletcher:0.4.5" as fletcher: diagram, node, edge

#set page(flipped: true)

#titre[SNT: Activité de Reconnaissabilité des réseaux sociaux]

#sous_titre[Fiche de séance]

= Programme et objectifs

#table(
  columns: (0.6fr, 1fr, 1fr, auto),
  [*Contenus*], [*Capacités attendues*], [*Commentaires*], [*ID*],
  "Modèle relationnel : relation, attribut, domaine, clef primaire, clef étrangère, schéma relationnel.", 
  "Identifier les concepts définissantle modèle relationnel.", 
  "Ces concepts permettent d’exprimer les contraintes d’intégrité (domaine, relation et référence).",
  "A",
  "Base de données relationnelle.", 
  "Distinguer plusieurs réseaux sociaux selon leurs caractéristiques, y compris un ordre de grandeur de leurs nombres d'abonnés. Paramétrer des abonnements pour assurer la confidentialité de données personnelles.", 
  "La structure est un ensemble de schémas relationnels qui respecte les contraintes du modèle relationnel. \nLes anomalies peuvent être des redondances de données ou des anomalies d’insertion, de suppression, de mise à jour. \nOn privilégie la manipulation de données nombreuses et réalistes.",
  "B",
  "Système de gestion de bases de données relationnelles.", 
  "Identifier les sources de revenus des entreprises de réseautage social.", 
  "Il s’agit de comprendre le rôle et les enjeux des différents services sans en détailler le fonctionnement.",
  "C",
  "Langage SQL : requêtes d’interrogation et de mise à jour d’une base de données.", 
  "Identifier les composants d’une requête. \nConstruire des requêtes d’interrogation à l’aide des clauses du langage SQL : SELECT, FROM, WHERE, JOIN. \nConstruire des requêtes d’insertion et de mise à jour à l’aide de : UPDATE, INSERT, DELETE.", 
  "On peut utiliser DISTINCT, ORDER BY ou les fonctions d’agrégation sans utiliser les clauses GROUP BY et HAVING.",
  "D"
)

= Séance 1 - Découverte SGBD & Langage SQL

#sym.arrow Lister les services rendus par un *système de gestion de base de données relationnelles* : persistance des données, gestions des accès concurrents, efficacité du traitement des requêtes, sécurisation des accès.

#sym.arrow Construire des requêtes SQL d'interrogation (*SELECT*, *FROM*, *WHERE*, *JOIN*) et d'insertion (*UPDATE*, *INSERT*, *DELETE*) en sachant trier (*ORDER BY*), effectuer des fonctions d'agrégation (par ex. *COUNT*) et en enlevant les doublons (*DISTINCT*).

#pagebreak(weak:true)
== Phases de la séance

#let phase_séance(nom: "", objectifs: "", durée: "", contenu: "", prof: "", eleve: "", supports: "") = arguments(nom, objectifs, durée, contenu, prof, eleve, supports)

#let planning_séance(..args) = [
  #set text(size: 10pt)
  #table(
    columns: (3fr, 2fr, 1.5fr, 14fr, 3fr, 3fr, 3fr),
    [*Phase*], [*Objectifs*], [*Durée*], [*Contenu*], [*Posture prof*], [*Posture élève*], [*Supports*],
    ..args,
  )
]

#planning_séance(
  ..phase_séance(
    nom: "Introduction",
    durée: "5m",
    contenu: [
      - *Contexte de l'activité :* deux réseaux sociaux cherchent à correspondre leurs utilisateurs pour échanger des données.
      - *Création des groupes :* répartir la classe en 2 groupes qui représenteront chacun un réseau social.
        - Optionel : leur laisser choisir un nom de réseau social;
        - Variante 1 : S'il y a trop d'élèves, voir pour subdiviser la classe en plus petits groupes (2 ayant le réseau 1, 2 ayant le 2 par exemple).
        - Variante 2 : Répartir la classe en binôme/trinôme, il doit y avoir autant de groupes ayant le réseau 1 que le 2.
      - *Distribution du matériel :* il faut avoir pré-coupé la fiche des identités numériques avant de la donner aux groupes. 
    ],
    prof: "Explique au tableau, montre le matériel",
    eleve: "Ecoute",
    supports: "Matériel en main"
  ),
  ..phase_séance(
    nom: "Schématisation du réseau social",
    objectifs: "D",
    durée: "20m",
    contenu: [
      - Question préalable du choix de type de schéma, idéalement ils arrivent sur une représentation par graphe, mais ne pas leur donner la solution s'ils ne l'ont pas.
      - Schématisation des identités numériques et leurs relations, possible de le faire individuellement ou sur une feuille commune, mais les groupes doivent se mettre d'accord sur quel est le schéma final du groupe.
    ],
    prof: "Passe dans les rangs, oriente les élèves si besoin",
    eleve: "Font l'activité en groupe",
    supports: "Matériel + papier stylo"
  ),
  ..phase_séance(
    nom: "Mise en commun des schémas",
    durée: "10m",
    contenu: [
      - Avant de commencer, avoir séparé le tableau en 2 parties (une pour chaque réseau), avec au milieu un tableau pour noter les utilisateurs identifiés.
      - *Reportage du schéma au tableau :* chaque réseau social vient écrire son schéma au tableau.
        - Si plusieurs groupes ont le même réseau, seul l'un d'entre eux vient présenter, possiblement avec les autres qui l'aide.
        - Variante 1 : Au lieu de venir le faire au tableau, faire des paires de groupes (un de chaque réseau) pour qu'ils mettent en commun leurs schéma.
      - Si les schémas ne sont pas du même modèle (par exemple graphe), essayer de montrer les similitudes et si possible montrer que c'est en fait (représentable) par un graphe. Pas la peine d'expliquer ce qu'est un graphe, juste le montrer.
    ],
    prof: "Choisi qui va au tableau, encardre mais n'écrit rien",
    eleve: "Un par réseau écrit au tableau, les autres écoutent, aident si besoin, remplissent leur feuille",
    supports: "Tableau, feuille élève"
  ),
  ..phase_séance(
    nom: "Reconnaissance des utilisateurs",
    objectifs: "A",
    durée: "10m",
    contenu: [
      - Si les élèves ne trouvent pas, voici l'ordre de priorité de reconnaissance des utilisateurs :
        - Même Login social / Email
        - Même amis, puis nombre d'amis légèrement différent
        Montrer la différence de certitude entre ces données, un login social garanti l'identité tandis qu'une relation non. Des même utilisateur peuvent avoir des email différent entre les réseaux. Comme le Sudoku : on fait des hypothèses et au bout d'un moment tout se valide.
      - Pas besoin de finir le tableau, juste montrer au minimum un exemple des deux types de reconnaissance.
    ],
    prof: "Encadre la recherche, donne les réponses si vraiment besoin",
    eleve: "Lèvent la main pour proposer des liens, remplissent leur feuille",
    supports: "Tableau, feuille élève"
  ),
  ..phase_séance(
    nom: "Exercices 4, 5 et 6",
    objectifs: "A, B",
    durée: "10m",
    contenu: [
      - *Exercice 4 :* Login social, email, relations... Login social et email garantissent l'identité, pas les relations. Donner des exemples d'autres identifieurs *unique* (numéro de téléphone, etc...)
      - *Exercice 5 :* Même utilisateur mais différent email, pas les mêmes amis. On fait parfoit des choix sans être sûr et on voit si c'est cohérent à la fin, priorité aux identifieurs uniques.
      - *Exercice 6 :* Cela montre que même en étant anonyme et en n'étant pas identifiable seul, nos relations peuvent nous identifier. Eviter d'avoir les mêmes amis sur toutes les plateformes, mais aussi d'utiliser le login social qui est très facilement identifiable.
    ],
    prof: "Corrige au tableau, intéroge pour avoir les réponses",
    eleve: "Corrigent sur leur copies",
    supports: "Tableau, feuille élève"
  )
)

= Séance 2 - Concevoir une base de données

#sym.arrow Comprendre les concepts du modèle relationnel
- Définir les mots suivants : relation, attributs, domaine, clef primaire, clef étrangère, schéma relationnel
- Expliquer les contraintes d'intégrité (domaine, relation et référence)
- Distinguer la structure d'une base de données de son contenu
- Repérer les anomalies dans le schéma d'une base de données (redondances de données, anomalies d'insertion, de suppression, de mise à jour)
#import "/Templates/layouts.typ": SNT, titre, sous_titre

#show: doc => SNT(doc)

//#import "@preview/fletcher:0.4.5" as fletcher: diagram, node, edge

#titre[SNT: Séquence sur les Réseaux Sociaux]

#outline(indent: 1em, depth: 2)


= Programme et objectifs

#table(
  columns: (0.6fr, 1fr, 0.08fr),
  [*Contenus*], [*Capacités attendues*], [*ID*],
  "Identité numérique, e-réputation, identification authentification", "Connaître les principaux concepts liés à l'usage des réseaux sociaux.", "A",
  "Réseaux sociaux existants", "Distinguer plusieurs réseaux sociaux selon leurs caractéristiques, y compris un ordre de grandeur de leurs nombres d'abonnés. Paramétrer des abonnements pour assurer la confidentialité de données personnelles.", "B",
  "Modèle économique des réseaux sociaux", "Identifier les sources de revenus des entreprises de réseautage social.", "C",
  "Rayon, diamètre et centre d'un graphe", "Déterminer ces caractéristiques sur des graphes simples", "D",
  "Notion de « petit monde » Expérience de Milgram", "Décrire comment l'information présentée par les réseaux sociaux est conditionnée par le choix préalable de ses amis.", "E",
  "Cyberviolence", "Connaître les dispositions de l'article 222-33-2-2 du code pénal. Connaître les différentes formes de cyberviolence (harcèlement, discrimination, sexting...) et les ressources disponibles pour lutter contre la cyberviolence.", "F",
  table.cell(colspan: 3, [*Notions transversales*]),
  "Affectations, variables  \nSéquences \nInstructions conditionnelles \nBoucles bornées et non bornées \nDéfinitions et appels de fonctions", "Écrire  et  développer  des  programmes  pour  répondre  à  des problèmes et modéliser des phénomènes physiques, économiques et sociaux.", "T1",
)

La séquence est composée de 2 parties distinct: une partie "sociale" portant sur les différents aspect sociaux et économique ainsi que la cyberviolence, et une partie "réseau" qui porte sur la modélisation des réseaux sociaux et les impactes de ces relations.


= Séances

Les secondes de Champollion ont 1h de SNT une semaine sur deux et 2h l'autre semaine. Le programme de SNT nous laisse en moyenne 6h/séquence, ce qui nous fait 2 séances de 2h et 2 séance de 1h.

#let phase_séance(nom, objectifs, durée, contenu, supports) = arguments(nom, objectifs, durée, contenu, supports)

#let début_séance = phase_séance("Début de cours", "/", "5-10m", "Arrivé en classe, appel et questions flash/quiz", "Tableau")

#let fin_séance = phase_séance("Fin de cours", "/", "5m", "Récap de la séance, questions et devoirs", "/")

#let planning_séance(..args) = [
  #set text(size: 10pt)
  #table(
    columns: (9.1em, 4.7em, 3.8em, 1fr, 5.1em),
    [*Phase*], [*Objectif*], [*Durée*], [*Contenu*], [*Supports*],
    ..args,
  )
]


== Séance 1 (2h): Fonctionnement des réseaux sociaux

#planning_séance(
  ..début_séance,
  ..phase_séance("Contexte historique", "/", "5m", "Chronologie rapide des réseaux sociaux", "Tableau"),
  ..phase_séance("Activité charactéristique et revenu des réseaux sociaux", "B, C", "30m", "En binôme, les élèves iront se renseigner sur un réseau social en particulier, son fonctionnement et ses sources de revenu", "Internet, fiche d'activité"),  
  ..phase_séance("Activité confidentialité", "B", "30m", "Étude de plusieurs documents lié à l'identité numérique et la confidentialité.", "Fiche d'activité"),
  ..phase_séance("Institutionalisation et exercices", "A, B, C", "45m", "Partie sur les caractéristiques des réseaux sociaux, les modèles économique des réseaux sociaux et l'idendité numérique et sa protection.", "Tableau, fiche de cours"),
  ..fin_séance
)


== Séance 2 (1h): Cyberviolence

#planning_séance(
  ..début_séance,
  ..phase_séance("Activité cyberviolence", "A, F", "30m", "Travail de recherche et de réflexion sur le cyberviolence, qui se conclura par un mini débat avec la classe", "Internet, fiche d'activité"),
  ..phase_séance("Institutionalisation", "A, F", "15m", "Partie sur les différentes formes de cyberviolence et de prévention", "Tableau, fiche de cours"),
  ..fin_séance
)


== Séance 3 (2h): Modélisation des réseaux sociaux

#planning_séance(
  ..début_séance,
  ..phase_séance("Activité petit monde et découverte des graphes", "D, E", "40m", "Par binôme, les élèves reproduirons une expérience du petit monde sur le web, puis découvriront les graphes via la représentation d'un réseau social", "Internet, fiche d'activité"),
  ..phase_séance("Contexte historique", "/", "5m", "Chronologie rapide sur les graphes", "Tableau"),
  ..phase_séance("Institutionalisation et exercices", "B, D, E", "50m", "Partie sur les graphes, la représentation des réseaux sociaux et l'importance des abonnements pour assurer sa confidentialité", "Tableau, fiche de cours"),
  ..fin_séance
)


== Séance 4 (1h): Activité notée
#planning_séance(
  ..début_séance,
  ..phase_séance("Activité représentation mathématique d'un réseau social", "D, T1", "45m", "Activité avec une matrice d'adjacence, de l'algorithmie et de la programmation. L'activité est ramassée et notée.", "PC, fichier source, IDE"),
  ..fin_séance
)


= Évaluations
[ TODO ]
== Quiz fonctionnement

== Quiz cyberviolence

== Quiz modélisation

== Évaluation sommative


= Sources

- éduscol
- 3.0 - Cahier de SNT - Sciences Numériques et Technologie - SNT - 2de \* Cahier d'activités/d'exercices (Ed. 2020) Bordas
- https://snt.ababsurdo.fr/prof/

= Livres

== Bordas (+ Livre du professeur)

=== #sym.arrow Livre du professeur

- Donne l'objectif de chaque activité
- Guide la correction et les différentes réactions des élèves

=== #sym.arrow Découverte

*Activité 1. Un site à explorer*
- Vidéo à regarder
- Sensibilise à ce qui peut être collecté et déduit d'un utilisateur

*Activité 2. Six degrés de séparation*
- Recherche d'un lien entre une célébrité et un élève
- Permet aux élèves de découvrir d'eux même le petit monde de Milgram

*Activité 3. Comparaison de réseaux sociaux*
- Permet de faire ressortir les différentes charactéristique des réseaux sociaux
- Les fait travailler sur des réseaux qu'ils utilisent déjà

*Activité 4. Nombre d'amis en commun*
- Début de représentation en graphe
- Algorithme de recommandation

=== #sym.arrow Cours 

*Cours 1. Des relations entre les personnes*
- Concept de relation hors technologie/numérique
- Les différent types de relation

*Cours 2. Un outil de communication*
- Utilité et fonctionnement d'un réseau social
- Très peu de temps passé sur le modèle économique

*Cours 3. Modélisation d'un réseau social*
- Notions de base d'un graphe avec quelques exemples
- Petit exemple d'isomorphisme
- Orientation d'un graphe

*Cours 4. Représentation informatique*
- Matrice d'adjacence
- Pas de code

=== #sym.arrow Application

*Activité 5. Groupes de travail*
- Coloriage d'un graphe

*Activité 6. Le personnage central*
- Représentation graphique pouvant d'un graphe peut être trompeuse: seul les liens comptent
- Isomorphisme d'un graphe

*Activité 7. Le nombre de Bacon*
- Algorithmie
- Petit monde de Milgram

*Activité 8. Les petits mondes temporels*
- Recherche du plus court chemin dans un graphe

*Activité 9. Anonymat sur les réseaux sociaux*
- Analyse de la structure d'un graphe
- Notion de reconnaissance d'un utilisateur entre deux réseaux uniquement grâce à ses relations

*Activité 10. La star du réseau*
- Graphe orienté et relations dissymétrique
- Algorithmie

=== #sym.arrow Analyse et débats

*Enjeu 1. Harcèlement numérique et cyberviolence*
- Texte de loi
- Non impunité: les auteurs sont retrouvable 

*Enjeu 2. Les réseaux sociaux et la vie privée (RGPD)*
- Vie privée et RGPD
- Conditions d'utilisation
- Durabilité des données (les réseaux sociaux gardent tout et on peut les télécharger)

*Enjeu 3. Le modèle économique des réseaux sociaux*
- Modèle économique
- "Si c'est gratuit, c'est vous le produit"
- Économie de l'attention
- En débat: la commercialisation de ses propres données

*Enjeu 4. Réseaux sociaux et communautés*
- Algorithme de recommandation
- Bulles d'information et communautés fermées
- Campagnes de désinformation

=== #sym.arrow L'essentiel

Carte mentale d'ouverture qui montre les divers sujet qui abordent le fonctionnement et les enjeux des réseaux sociaux

=== #sym.arrow Pour faire le point

*QCM*
- Pertinent mais peu de questions

*J'ai compris le chapitre si*
- Bon récape du point de vue de l'élève en 5 points important

*Activité 11. Les graphes, c'est de l'informatique*
- Programmation
- Manipulation des graphes sans objet ni bibliothèque (matrice d'adjacence)
- Compréhension puis amélioration d'un code existant
- Notion d'amis d'amis: système de recommandation

== Bordas Cahier

TODO

== Delagrave (+ Livre du professeur)

=== #sym.arrow Livre du professeur

- Parle en longueur du programme
- Donne des pistes de recherche (MOOC, sitographie, bibliographe)
- Explique comment utiliser une bibliothèque pour les graphes
- Propose des prolongements possibles pour les activités
- Indique les capacités attentues des réseaux sociaux

=== #sym.arrow Introduction

*Pour commencer*
- Vidéo + quiz intégré
- Notions de graphe
- Idée de la bulle d'information

*Pour tester ses connaissances*
- Plusieurs petits QCM sur les réseaux sociaux
- À priori si des connaissances préalable au cours

*Activité 1. Repères historiques*
- Frise chronologique
- Premier réseau social et naissance des télécommunication civile
- Historique des gros réseaux sociaux d'aujourd'hui
- Hétérogénéité des réseaux sociaux

*Activité 2. Les caractéristiques des réseaux sociaux*
- Distinguer plusieurs réseaux sociaux et en connaître les concepts
- Paramétrer des abonnements
- Notion d'identité numérique et e-réputation

*Activité 3. Le modèle économique des réseaux sociaux*
- Identifier les sources de revenus des réseaux sociaux
- Gratuité des réseaux sociaux
- Ciblage des publicités

*Activité 4. Les communautés dans les réseaux sociaux*
- Notions de graphe
- Notion du petit monde de Milgram

*Activité 5: Cyberviolence*
- Article de loi
- Les formes de cyberviolence
- Chiffres sur les collégien/lycéen
- Comment réagir face aux cyberviolence

=== #sym.arrow Cours

*1. Les caractéristiques des réseaux sociaux*
- 


















== Nathan (+ Guide pédagogique)

== Hatier/Foucher (+ Guide pédagogique)

== Hachette éducation

== Didier


#import "/Templates/layouts.typ": SNT, titre, sous_titre

#show: doc => SNT(doc)

//#import "@preview/fletcher:0.4.5" as fletcher: diagram, node, edge

#set page(flipped: true)

#titre[SNT: Activité de Reconnaissabilité des réseaux sociaux]

#sous_titre[Fiche de séance]

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

*Objectifs de séance :*
- Comprendre et sensibiliser sur l'importance des identifiants uniques et de nos relations.
- Arriver naturellement à la représentation par un graphe d'un réseau.

#pagebreak(weak: true)
= Phases de la séance

#let phase_séance(nom: "", objectifs: "", durée: "", contenu: "", prof: "", eleve: "", supports: "") = arguments(
    nom,
    objectifs,
    durée,
    contenu,
    prof,
    eleve,
    supports,
)

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
        supports: "Matériel en main",
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
        supports: "Matériel + papier stylo",
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
        supports: "Tableau, feuille élève",
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
        supports: "Tableau, feuille élève",
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
        supports: "Tableau, feuille élève",
    ),
)

= Analyse à postériori

Lors de l'étape de schématisation du graphe, différents sous-groupes se créaient et se "battaient" pour avoir le matériel pour construire leur graphe. Ceci pousse à faire une subdivision en sous groupes voir binôme comme dans les variantes du plan de séance pour les classes nombreuses. Cela permet aussi de faire la partie reconnaissance en paire de binôme au lieu d'être au tableau où la plupart des élèves ne font rien. Cependant, cela enlève l'interactivité le reste de la classe et il se peut que certains groupes ne finissent pas l'activité, peut être alors l'allonger à 1h30 au lieu de 1h pour cette variante.

Le guidage vers une représentation de personnes et de liens mène naturellement vers une représentation par les graphes. Plusieurs autres représentations sont possible mais la plupart sont juste un graphe sous une autre forme.

Cependant la représentation de leur graphe est parfoit non ideale, dans le sens où les arêtes ressemblent à un spaghetti (mais c'est juste une question d'isomorphisme de graphe)

Un problème pour l'identification est au niveau des identités numériques choisies, par exemple Cloclo08 et Chloe étaient mis en relation alors qu'un algorithme de recherche de similitudes n'aurait pas pris en compte cela, c'est uniquement notre point de vue humain. Il serait pertinent d'avoir d'autres identifieurs unique (numéro de téléphone par exemple) ou non (nom prénom, age), ainsi que d'avoir des amis en communs qui ne sont pas dans les identités numériques fournies, ce qui pourrait fausser les pistes et faire ressortir les identificateurs plus puissants.

La question 6, bien que pertinente, manque de justification concrètes illustrées par l'activité, certains élèves posent la question "C'est quoi le problème d'être reconnu ?", ce qui devrait être répondu par la partie 1 du cours de réseaux sociaux (#sym.arrow vente de données des utilisateurs.)

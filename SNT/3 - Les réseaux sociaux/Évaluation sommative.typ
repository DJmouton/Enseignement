#import "/Templates/layouts.typ": SNT, titre, sous_titre
#import "/Templates/utils.typ": cadre, pointillets, correction
#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge, shapes
#import shapes: pill, ellipse

#show: doc => SNT(doc)

Prénom: #h(1fr) Nom: #h(1fr)

#sous_titre("SNT - Réseaux sociaux")
#titre("Évaluation de séquence")

45 minutes. Merci de répondre à toutes les questions sur le sujet.

Pas de points négatifs par réponse fausse.

#let h_gutter_ex = 1
#let v_gutter_ex = .5
#let (manon, chloe, barth, erwan, alex, audrey, maxence, lisa, amandine) = (
  (-0.5 * h_gutter_ex, -1 * v_gutter_ex),
  (-1.25 * h_gutter_ex, -2.5 * v_gutter_ex),
  (-0.2 * h_gutter_ex, -1.5 * v_gutter_ex),
  (0.25 * h_gutter_ex, 0.5 * v_gutter_ex),
  (-1.25 * h_gutter_ex, 0.5 * v_gutter_ex),
  (1 * h_gutter_ex, -2.5 * v_gutter_ex),
  (1 * h_gutter_ex, -1 * v_gutter_ex),
  (1.5 * h_gutter_ex, 0 * v_gutter_ex),
  (2 * h_gutter_ex, -1.75 * v_gutter_ex),
)
#let gros_graphe = diagram({
  let node_stroke = 1.5pt
  let edge_stroke = 1.5pt
  node(manon, "Manon", shape: pill, stroke: node_stroke)
  node(chloe, "Chloe", shape: pill, stroke: node_stroke)
  //node(barth, "Barth", shape: pill, stroke: node_stroke)
  node(erwan, "Erwan", shape: pill, stroke: node_stroke)
  node(alex, "Alex", shape: pill, stroke: node_stroke)
  node(audrey, "Audrey", shape: pill, stroke: node_stroke)
  node(maxence, "Maxence", shape: pill, stroke: node_stroke)
  node(lisa, "Lisa", shape: pill, stroke: node_stroke)
  node(amandine, "Amandine", shape: pill, stroke: node_stroke)
  edge(manon, alex, stroke: edge_stroke)
  edge(manon, maxence, stroke: edge_stroke)
  edge(manon, chloe, stroke: edge_stroke)
  edge(manon, erwan, stroke: edge_stroke)
  //edge(manon, barth, stroke: edge_stroke)
  edge(chloe, maxence, stroke: edge_stroke)
  //edge(chloe, barth, stroke: edge_stroke)
  edge(chloe, alex, stroke: edge_stroke)
  edge(chloe, manon, stroke: edge_stroke)
  //edge(barth, audrey, stroke: edge_stroke)
  //edge(barth, maxence, stroke: edge_stroke)
  edge(erwan, maxence, stroke: edge_stroke)
  edge(erwan, alex, stroke: edge_stroke)
  edge(audrey, amandine, stroke: edge_stroke)
  edge(audrey, maxence, stroke: edge_stroke)
  edge(maxence, amandine, stroke: edge_stroke)
  edge(maxence, lisa, stroke: edge_stroke)
})


/*
- Définir identité numérique
- Donner 3 exemples de ce qui compose une identité numérique
- citer les sources de revenus d'un réseau social
- expliquer "quand c'est gratuit c'est vous le produit"
- Définir la différence entre cyberviolence et cyberharcèlement
*/
=== 1) Définir ce qu'est un réseau social. 

#pointillets(repeat: 5)

=== 2) Expliquer comment un réseau social peut être représenté par un graphe. Précisez ce que signifient les termes sommet et arête dans ce contexte.

#pointillets(repeat: 5)

=== 3) À partir du graphe fourni :

#align(center, gros_graphe)
==== #h(1em) a) Trouvez la distance entre Chloe et Amandine.

#pointillets(repeat: 3)

==== #h(1em) b) Déterminez le rayon, le diamètre et le centre du graphe.

#pointillets(repeat: 8)

=== 4) Définir ce qu'est une identité numérique.

#pointillets(repeat: 4)

=== 5) Donnez trois exemples de ce qui compose une identité numérique.

#pointillets(repeat: 4)

=== 6) Citez trois sources de revenus principales des réseaux sociaux.

#pointillets(repeat: 4)

=== 7) Expliquez la phrase : "Quand c'est gratuit, c'est vous le produit".

#pointillets(repeat: 6)

=== 8) Définir la différence entre cyberviolence et cyberharcèlement.

#pointillets(repeat: 6)














/*

= Attentes



== Fonctionnement
#cadre(titre: "Définitions à connaître")[
  - Un *réseau social* rassemble des personnes physiques ou morales, mises en relation par l'intermédiaire d'une application dédiée. La connexion à un réseau social s'effectue depuis toute machine connectée à Internet: ordinateur, smartphone, tablette, etc.
  - Un *abonné actif* est un abonné se connectant régulièrement au réseau social.
  - L'*identité numérique* est l'ensemble des traces numériques qu'une personne ou une collectivité laisse sur le Web, comme ses coordonnées ou ses goûts.
  - L'*e-réputation* (ou web-réputation) est la notoriété associée à une identité numérique. Elle peut renvoyer une image positive ou négative de cette identité.
  - Le *processus d'authentification* permet l'accès individualisé à un réseau à l'aide d'un _login_ et d'un mot de passe.
]


=== Il faut être capable de :

#set list(marker: [#sym.square])

- définir les termes suivants : réseau social, identité numérique
- distinguer plusieurs réseaux sociaux selon leur caractéristiques
- identifier les sources de revenu d'une entreprise du réseautage social
- expliquer la notion : "Quand c'est gratuit, c'est vous le produit"
- comprendre que le paramétrage d'un abonnement influe sur la confidentialité des données personnelles


== Cyberviolence

#cadre(titre: "Définitions à connaître")[
  - La *cyberviolence* est un acte agressif et intentionnel, organisé à l'encontre d'une victime par un ou plusieurs individus, par l'intermédiaire d'un média numérique tel un réseau social.
  - Le *harcèlement* se définit comme une violence répétée qui peut être verbale, physique ou psychologique. Cette violence s'exerce aussi bien au sein de l'école que sur les réseaux sociaux.
]

== Modélisation

#cadre(titre: "Définitions à connaître")[
  - Un *graphe* est un ensemble de *sommets* reliés par des *arêtes*.
  - La *distance* entre deux sommets d'un graphe est égale à la longueur la plus court chemin entre ces deux sommets.
  - Le *rayon* du graphe est la plus petite distance à laquelle un sommet puisse se trouver de tous les autres.
  - Le *diamètre* d'un graphe est la distance entre les deux sommets les plus éloignés du graphe.
  - Le *centre* d'un graphe est formé de l'ensemble des *sommets* (il peut y en avoir plusieurs) se situant à une distance des autres sommets du graphe égale au *rayon*.
  - Un *influenceur* sur un réseau social donné est une personne située au centre du graphe.
]

*Je dois être capable de :*

#set list(marker: sym.square)

- compter le nombre de sommets et d'arêtes d'un graphe
- repérer le centre d'un graphe
- évaluer la distance entre deux sommets choisis au hasard dans le graphe
- évaluer le rayon d'un graphe
- évaluer le diamètre d'un graphe
- décrire comment l'information présentée par les réseaux sociaux est conditionnée par le choix préalable de ses amis

*/
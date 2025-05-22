#import "/Templates/layouts.typ": SNT, titre, sous_titre
#import "/Templates/utils.typ": cadre, pointillets, correction
#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge, shapes
#import shapes: pill, ellipse

#show: doc => SNT(doc)

#sous_titre("SNT - Réseaux sociaux - Partie 3")
#titre("Modalisation des Réseaux Sociaux")


= Modélisation d'un réseau

#cadre(titre: "L'essentiel")[
    Un réseau social est composé d'individus reliés par des liens.
    Pour le modéliser, nous allons utiliser une représentation inspirée de la théorie des graphes.
    Cette représentation facilite l'étude des réseaux et permet à des algorithmes performants de parcourir le réseau à la recherche dinformations.
]


= Sommet, arête et graphe

#cadre(titre: "L'essentiel")[
    #correction(
        énoncé: pointillets(repeat: 3),
    )[Dans un réseau social, une personne est représentée par un cercle ou un point numéroté appelé *sommet*.
        Le lien d'amitié entre deux individus est représenté par un trait appelé *arête*.
        Un *graphe* est un ensemble de sommets et d'arêtes.]
]

#let h_gutter_ex = 1
#let v_gutter_ex = .5
#let (sarah, arthur, timéo, aya, clémentine, noah, victor) = (
    (-1 * h_gutter_ex, -1 * v_gutter_ex),
    (1 * h_gutter_ex, -1 * v_gutter_ex),
    (2 * h_gutter_ex, -1 * v_gutter_ex),
    (0 * h_gutter_ex, 0 * v_gutter_ex),
    (-1 * h_gutter_ex, 1 * v_gutter_ex),
    (1 * h_gutter_ex, 1 * v_gutter_ex),
    (2 * h_gutter_ex, 1 * v_gutter_ex),
)

#let exemple = diagram({
    let node_stroke = 1.5pt
    let edge_stroke = 1.5pt
    node(sarah, "Sarah", shape: pill, stroke: node_stroke)
    node(arthur, "Arthur", shape: pill, stroke: node_stroke)
    node(timéo, "Timéo", shape: pill, stroke: node_stroke)
    node(aya, "Aya", shape: pill, stroke: node_stroke)
    node(clémentine, "Clémentine", shape: pill, stroke: node_stroke)
    node(noah, "Noah", shape: pill, stroke: node_stroke)
    node(victor, "Victor", shape: pill, stroke: node_stroke)
    edge(sarah, aya, stroke: edge_stroke)
    edge(aya, arthur, stroke: edge_stroke)
    edge(aya, clémentine, stroke: edge_stroke)
    edge(aya, noah, stroke: edge_stroke)
    edge(arthur, timéo, stroke: edge_stroke)
    edge(timéo, victor, stroke: edge_stroke)
})

#set text(size: 13pt)
#align(center, exemple)
#set text(size: 10pt)

Ce graphe comporte 7 sommets reliés par 6 arêtes.

Sarah et Victor ne sont donc pas amis dans un réseau social du type Facebook. Une flèche entre deux sommets permet d'orienter le lien d'amitié, comme c'est le cas avec les followers d'Instagram.

== Exercice 1: Déterminer les caractéristiques d'un graphe

=== 1. Compléter le Caractéristiques de chacun des graphes suivants.

#let node_radius = 3pt
#let edge_width = 1.5pt

#let taureau = diagram({
    let (a, b, c, d, e) = ((-1, -0.7), (1, -0.7), (-0.5, 0), (0.5, 0), (0, 1.2))
    node(a, fill: luma(0), radius: node_radius)
    node(b, fill: luma(0), radius: node_radius)
    node(c, fill: luma(0), radius: node_radius)
    node(d, fill: luma(0), radius: node_radius)
    node(e, fill: luma(0), radius: node_radius)
    edge(a, c, stroke: edge_width)
    edge(b, d, stroke: edge_width)
    edge(c, d, stroke: edge_width)
    edge(c, e, stroke: edge_width)
    edge(d, e, stroke: edge_width)
})

#let petersen = diagram({
    let arm_length = 0.5
    let angle_offset = -90deg
    node((0, 0), name: <origin>)
    let (a1, a2, b1, b2, c1, c2, d1, d2, e1, e2) = (
        (rel: (-90deg, arm_length), to: <origin>),
        (rel: (-90deg, arm_length * 2), to: <origin>),
        (rel: (-18deg, arm_length), to: <origin>),
        (rel: (-18deg, arm_length * 2), to: <origin>),
        (rel: (54deg, arm_length), to: <origin>),
        (rel: (54deg, arm_length * 2), to: <origin>),
        (rel: (126deg, arm_length), to: <origin>),
        (rel: (126deg, arm_length * 2), to: <origin>),
        (rel: (198deg, arm_length), to: <origin>),
        (rel: (198deg, arm_length * 2), to: <origin>),
    )
    node(a1, fill: luma(0), radius: node_radius)
    node(a2, fill: luma(0), radius: node_radius)
    node(b1, fill: luma(0), radius: node_radius)
    node(b2, fill: luma(0), radius: node_radius)
    node(c1, fill: luma(0), radius: node_radius)
    node(c2, fill: luma(0), radius: node_radius)
    node(d1, fill: luma(0), radius: node_radius)
    node(d2, fill: luma(0), radius: node_radius)
    node(e1, fill: luma(0), radius: node_radius)
    node(e2, fill: luma(0), radius: node_radius)

    edge(a1, a2, stroke: edge_width)
    edge(b1, b2, stroke: edge_width)
    edge(c1, c2, stroke: edge_width)
    edge(d1, d2, stroke: edge_width)
    edge(e1, e2, stroke: edge_width)

    edge(a2, b2, stroke: edge_width)
    edge(b2, c2, stroke: edge_width)
    edge(c2, d2, stroke: edge_width)
    edge(d2, e2, stroke: edge_width)
    edge(e2, a2, stroke: edge_width)

    edge(a1, c1, stroke: edge_width)
    edge(a1, d1, stroke: edge_width)
    edge(b1, d1, stroke: edge_width)
    edge(b1, e1, stroke: edge_width)
    edge(c1, e1, stroke: edge_width)
})

#let criquet = diagram({
    let (a, b, c, d, e) = ((-0.5, -0.75), (0.5, -0.75), (0, 0), (-0.5, 1), (0.5, 1))
    node(a, fill: luma(0), radius: node_radius)
    node(b, fill: luma(0), radius: node_radius)
    node(c, fill: luma(0), radius: node_radius)
    node(d, fill: luma(0), radius: node_radius)
    node(e, fill: luma(0), radius: node_radius)
    edge(a, c, stroke: edge_width)
    edge(b, c, stroke: edge_width)
    edge(c, d, stroke: edge_width)
    edge(c, e, stroke: edge_width)
    edge(d, e, stroke: edge_width)
})

#grid(
    columns: (1fr, 2fr, 2fr, 2fr),
    rows: 6,
    column-gutter: 3em,
    row-gutter: 1.53em,
    [], align(center, taureau), align(center, petersen), align(center, criquet),
    [], align(center, [*Le graphe taureau*]), align(center, [*Le graphe de Petersen*]), align(
        center,
        [*Le graphe criquet*],
    ),
    [*Nombre de sommets:*], pointillets(), pointillets(), pointillets(),
    [*Nombre d'arêtes:*], pointillets(), pointillets(), pointillets(),
    [*Rayon:*], pointillets(), pointillets(), pointillets(),
    [*Diamètre:*], pointillets(), pointillets(), pointillets(),
    grid.cell(
        colspan: 4,
        [
            === 2. Entourer en couleur le ou les centre(s) des trois graphes.
        ],
    )
)




= Distance entre deux sommets d'un graphe

#cadre(titre: "L'essentiel")[
    #correction(
        énoncé: pointillets(repeat: 2),
    )[La *distance* entre deux sommets est égale à la longueur du plus court "chemin" entre ces sommets. Ce nombre n'a pas d'unité.]
]

_Pour l'exemple de la page 1_ : La *distance* entre Sarah et Clémentine est de 2.


= Caractéristiques d'un graphe

#cadre(titre: "L'essentiel")[

    #correction(énoncé: pointillets(repeat: 6))[
        - Le *rayon* du graphe est la plus petite distance à laquelle un des sommets se trouve de touts les autres.
        - Le *diamètre* du graphe est la distance entre les deux sommets les plus éloignés du graphe.
        - Le *centre* d'un graphe est formé de l'ensemble des sommets (il peut y en avoir plusieurs) se situant à une distance des autres sommets inférieure ou égale au rayon. Les centres d'un graphe sont les personnes à partir desquelles l'information se diffuse plus vite sur le réseau. Ils sont appelés des "*influenceurs*".
    ]
]
_Pour l'exemple de la page 1_ :
Le *rayon* du graphe est égal à 2: Arthur est à la distance 2 de chaque sommet. Il est ici l'unique *centre* du graphe.

Le *diamètre* du graphe est égal à 4: les deux sommets les plus éloignés sont Sarah-Victor, ou Clémentine-Victor, ou Noah-Victor, qui sont à une distance de 4.

== Exercice 2: Un exemple de réseau dans la classe

Manon, élève en classe de seconde, vient d'être élue déléguée par ses camarades. Elle a de nombreux amis sur Instagram, et voudrait profiter de ce réseau social pour diffuser des informations à la classe.

Le réseau de Manon comporte 12 amis. Emma est amie avec Adam, Kawtar et Manon. Damien est ami avec Manon et Raphaël. Raphaël et Manon sont amis. Adam est ami avec Liam, Paul et Nathan. Nathan et Liam sont amis. Kawtar est amie avec Chloé, Hayfaa et Victor. Chloé et Victor sont amis.

#let ex2_gauche = [
    === 1. Reconstituer le graphe des relations à partir des liens d'amitié existants.
    #rect(
        width: 100%,
        height: 195pt,
    )
    #v(1em)
]

#let ex2_droite = [
    === 2. Déterminer le rayon, le diamètre et le centre de ce graphe.

    #pointillets(repeat: 1, section_correction: true)

    === 3. Conseiller à Manon deux liens d'amitié à créer sur le réseau afin d'être placée, elle aussi, au centre du graphe. Ajouter les arêtes correspondantes au graphe.

    #pointillets(repeat: 3, section_correction: true)
]

/*#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  ex2_gauche, ex2_droite
)*/

#ex2_gauche
#ex2_droite

=== 4. Si le lien d'amitié entre Emma et Manon se rompt, quelle sera la conséquence sur les centres du graphe ?

#pointillets(repeat: 2, section_correction: true)

= La notion du "petit monde"

#cadre(titre: "L'essentiel")[
    En 1967, l'*expérience de Milgram* a montré que toute personne était à une distance moyenne de six liens de tout autre individu dans le monde. On parle d'un effet "*petit monde*".
    Grâce aux réseaux sociaux, ce nombre se réduit: en 2011, il avait chuté à 4,67 sur Facebook.
    Les réseaux sociaux favorisent la formation de communautés d'intérêt, et les algorithmes de recommandation renforcent ce phénomène.
    Certains chercheurs alertent donc sur le cloisonnement de communautés qui cultivent l'entre-soi, avec pour conséquence l'appauvrissement de la pensée critique
]

== Exercice 3: Des liens qui unissent... ou qui isolent

Le réseau Facebook, fort de 3.1 milliards d'abonnés actifs, est le support de nombreuses études sociologiques. Les chercheurs observent notamment la formation de liens (_bonding_) entre personnes qui partagent un même centre d'intérêt ou même opinion, par exemple politique.

Ces communautés constituent des espaces d'échange privilégiés, mais forment aussi des petits mondes relativement cloisonnés où le fonformisme est encouragé.

=== 1. Donner un exemple de formation d'une communauté d'intérêt dans le domaine de votre choix.

#pointillets(repeat: 2, section_correction: true)

=== 2. Expliquer pourquoi les phénomènes communautaires font craindre un appauvrissement de la pensée critique.

#pointillets(repeat: 3, section_correction: true)

=== 3. Une solution souvent évoquée pour lutter contre cet effet consiste à nouer des liens entre des communautés qui ne se ressemblent pas (_bridging_). Proposer un exemple.

#pointillets(repeat: 3, section_correction: true)

= Résumé

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

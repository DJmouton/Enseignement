#import "/Typst templates/style.typ": template, définition, remarque, exercice, exemple, studentline, algorithme, TODO

#show: doc => template(doc)

#import "@preview/fletcher:0.4.5" as fletcher: diagram, node, edge


/* --- CONTENT --- */

up
#v(1fr)
#align(center, text(weight: "bold", size: 45pt, [Les Graphes]))
#v(1fr)
down bruh

the quick brown fox jumps over the lazy dog 1234567890211°00100100110à

#pagebreak()

#outline(indent: 2em, depth: 2)
#pagebreak()

= Notion de graphe et vocabulaire
Le concept de graphe permet de résoudre de nombreux problèmes en mathématiques comme en informatique. C'est un outil de représentation très courant, et nous l'avons déjà rencontré à plusieurs reprises, en particulier lors de l'étude de réseaux et d'arbres binaires.

== Définitions et exemples
Une multitude de problèmes concrets d'origines très diverses peuvent donner lieu à des modélisations par des graphes : c'est donc une structure essentielle en sciences, qui requiert un formalisme mathématique particulier que nous allons découvrir.

L'étude de la théorie des graphes est un champ très vaste des mathématiques : nous allons surtout nous intéresser à l'implémentation en Python d'un graphe et à différents problèmes algorithmiques qui se posent dans les graphes.

#définition([
  #studentline(linecount: 2, [
    On appelle graphe la donnée d'un ensemble fini de *sommets* et d'un ensemble de *lien* entre ces sommets.
  ])
])

=== Graphes non orientés
#définition([
  #studentline(linecount: 2, [
    - Les relations entre sommets s'appellent des *arêtes*.
    - Les arêtes peuvent être empruntés dans les *deux sens*.
  ])
])

#remarque([
  - Dans une représentation graphique, les sommets sont représentés par des cercles et les arêtes par des traits.
  - Une arête entre deux sommets $u$ et $v$ est notée indifféremment par le couple $(u, v)$ ou par le couple $(v, u)$.
  - Une arête reliant un sommet à lui-même est appelée une *boucle*.
  - Deux sommets peuvent être reliés par plusieurs arêtes.
])


#figure(
  caption: [Exemples de graphes non orientés],
  gap: 1.5em,
  grid(
    columns: (1fr, 1fr, 1fr),
    rows: (auto, auto),
    row-gutter: 1em,
    diagram(
      node-stroke: black + 0.5pt,
      spacing: (15mm, 10mm),
      node((0, 0), [$a$], name: <a>),
      node((0, 1), [$b$], name: <b>, shape: circle),
      node((1, 1), [$c$], name: <c>),
      node((1, 0), [$d$], name: <d>),
      node((0.5, -1), [$e$], name: <e>),
      edge(<a>, <b>),
      edge(<b>, <c>),
      edge(<c>, <e>, bend: 30deg),
      edge(<a>, <e>),
      edge(<e>, <d>),
    ),
    diagram(
      node-stroke: black + 0.5pt,
      spacing: (15mm, 10mm),
      node((0, -1), [$0$], name: <0>),
      node((1, -1), [$1$], name: <1>),
      node((0, 1), [$2$], name: <2>),
      node((0.5, 0), [$3$], name: <3>),
      node((1, 1), [$4$], name: <4>),
      edge(<0>, <2>),
      edge(<2>, <4>),
      edge(<1>, <3>),
    ),
    diagram(
      node-stroke: black + 0.5pt,
      spacing: (15mm, 10mm),
      node((0, -1), [$a$], name: <a>),
      node((-0.5, 0), [$b$], name: <b>, shape: circle),
      node((0.5, 0), [$c$], name: <c>),
      node((-1, 1), [$d$], name: <d>),
      node((0, 1), [$e$], name: <e>),
      node((1, 1), [$f$], name: <f>),
      edge(<a>, <b>),
      edge(<a>, <c>),
      edge(<b>, <d>),
      edge(<b>, <e>),
      edge(<c>, <f>),
    ),
    [(a)],
    [(b)],
    [(c)],
  )
) <3graphex>


#exemple([
  Dans le graphe non orienté de la @3graphex, on a les sommets ${a, b, c, d, e}$ et les arêtes ${(a, b), (a, e), (b, c), (c, e), (d, e)}$.
])

#exercice([
  Décrire la structure du graphe de la figure 2b comme dans l’exemple. Quelle est la particularité de ce graphe ?
  
  #studentline(linecount: 2, [
    #sym.arrow Le graphe 2b a pour sommets ${0, 1, 2, 3, 4}$ et pour arêtes ${(0, 2), (2, 4), (1, 3)}$.
    
    #sym.arrow Le graphe est composé de 2 parties déconnectées.
  ])
])

#exercice([
  Décrire la structure du graphe de la figure 2c comme dans l’exemple. Quelle est la particularité de ce graphe ?

  #studentline(linecount: 3, [
    #sym.arrow Le graphe 2c a pour sommets ${a, b, c, d, e, f}$ et pour arêtes ${(a, b), (a, c), (b, d), (b, e), (c, f)}$.

    #sym.arrow Le graphe ressemble à un arbre.
  ])
])

#exercice([
  Un graphe possible permettant de modéliser le problème des sept ponts de Königsberg (voir problème) est le suivant :

  #align(center, [#diagram(
    node-stroke: black + 0.5pt,
    spacing: (15mm, 10mm),
    node((0, 0), [$1$], name: <1>),
    node((1, -1), [$2$], name: <2>),
    node((1, 1), [$3$], name: <3>),
    node((2, 0), [$4$], name: <4>),
    edge(<1>, <2>, bend: 45deg),
    edge(<1>, <2>, bend: -35deg),
    edge(<1>, <3>, bend: 35deg),
    edge(<1>, <3>, bend: -45deg),
    edge(<1>, <4>),
    edge(<2>, <4>),
    edge(<3>, <4>)
    )])

  Décrire la structure de ce graphe comme dans l’exemple. Que représentent les sommets et les arêtes de ce graphe ?

  #studentline(linecount: 4, [
    #sym.arrow Ce graphe a pour sommets ${1, 2, 3, 4}$ et pour sommets $({(1, 2), (1, 2), (1, 3), (1, 3), (1, 4), (2, 4), (3, 4)})$

    #sym.arrow Les sommets représentent les différentes parties de la ville et les arêtes représentent les ponts.
  ])
  Que recherche-t-on sur ce graphe pour répondre au problème posé ?

  #studentline(linecount: 1, [
    #sym.arrow On cherche à parcourir toutes les arêtes de ce graphe exactement une fois.
  ])
])

=== Graphes orientés

#définition([
  #studentline(linecount: 2, [
    - Les relations entre sommets s'appellent des *arcs*.
    - Les arcs ne peuvent être empruntés que dans *un seul sens*.
  ])
])

#remarque([
  - Le nombre de sommets est appelé l’*ordre* du graphe et le nombre d’arcs est appelé la *taille* du graphe.
  - Dans une représentation graphique, les sommets sont représentés par des cercles et les arcs par des flèches.
  - Un arc partant d’un sommet $u$ et arrivant à un sommet $v$ est noté par le couple $(u, v)$.
  - Un arc reliant un sommet à lui-même est appelé une *boucle*.
  - Deux sommets peuvent être reliés par plusieurs arcs.
])

-FIGURE3-

#exemple([
  Dans le graphe orienté de la figure 3a, on a les sommets ${2, 3, 5, 7, 8, 9, 10, 11}$ et les arcs ${(3, 8), (3, 10), (5, 11), (7, 8), (7, 11), (8, 9), (11, 2), (11, 9), (11, 10)}$
])

=== Graphes pondérés

== Adjacence, degré, voisin

=== Adjacence de sommets

=== Voisins d'un sommet

== Chemins et connexité

=== Chemins entre deux sommets

=== Connexité

= Modélisation d'un graphe

== Représentation par matrice d'adjacence

=== Graphe orienté

=== Graphe non orienté

=== Graphe pondéré

=== Exercices

=== Implémentation

== Représentation par liste d'adjacence

=== Exercices

=== Implémentation

= Parcours de graphes

#définition[
  Un parcours de graphe est un algorithme consistant à explorer tous les sommets d'un graphe de proche en proche à partir d'un sommet initial. Ces parcours sont notamment utilisés pour rechercher un plus court chemin (et donc dans les GPS) ou pour trouver la sortie d'un labyrinthe.
]

#emoji.warning *Attention:* parcourir simplement le dictionnaire ou la matrice d’un graphe n’est pas considéré comme un parcours de graphe.

Tout les parcours suivent plus ou moins le même algorithme de base:

- On visite un sommet A . On crée une structure S qui contiendra au départ l’ensemble des voisins de A.
- Tant que S n'est pas vide:
  + on choisit un sommet s dans S
  + on visite s
  + on ajoute à S tout les voisins de s pas encore visités

#remarque[
  Contrairement à un parcours d'arbre, où les fils d'un nœud ne peuvent pas avoir été visités avant le nœud, un voisin d'un sommet peut avoir déjà été visité en tant que voisin d'un sommet précédent.
  
  Il est donc nécessaire de mémoriser les sommets déja visités ou découverts (on dira qu'un sommet est découvert lorsqu'on l'ajoute à S).
]

Le choix de la structure de l'ensemble S est prépondérant:

- Si on choisit une file (FIFO): on visitera les sommets dans l'ordre d'arrivée, donc les plus proches du sommet précédent. On obtient donc un parcours en largeur -> BFS.
- Si on choisit une pile (LIFO): on visitera d'abord les derniers sommets arrivés, donc on parcourt le graphe en visitant à chaque étape un voisin du précédent. On obtient donc un parcours en profondeur -> DFS.

== Le parcours en largeur (BFS, Breath First Search)

#définition[
  Pour le parcours en largeur, on va:
  + Commencer à un sommet du graphe.
  + Visiter tout les voisins de ce sommets.
  + Visiter tout les voisins non visités de ces voisins.
  + Répéter étape 3. jusqu'à ce que tout les sommets du graphe soient parcourus.
]

#algorithme[
  - *entrées:* $G$ un graphe et $s$ un sommet
  + $f$: une file vide
  + enfiler $s$ dans $f$
  + marquer $s$
  + *tant que* $f$ non vide
    + défiler $f$ dans $s$
    + *pour* tout voisin $t$ de $s$ dans $G$
      + *si* $t$ non marqué
        + enfiler $t$ dans $f$
        + marquer $t$
      + *fin si*
    + *fin pour*
  + *fin tant que*
]

#remarque(image("/attachments/graphe_file_bfs.png"))

#exercice[
  Appliquer l'algorithme du BFS à ce graphe en partant de B.
  
  #TODO
]

Animation de cet algorithme sur un gros graphe: https://youtu.be/x-VTfcmrLEQ

=== Application du BFS: recherche du plus cours chemin

#définition[
  L'algorithme BFS découvre les sommets «par cercles concentriques» autour du point de départ, chaque sommet est découvert via un sommet de distance k-1 du centre. Chaque sommet de distance k peut voir le sommet de distance k-1 qui l'as découvert comme parent.

  Nous allons pour cela nous servir d'une structure de dictionnaire pour associer à chaque sommet son sommet-parent.

  Il faudra ensuite une fonction pour recréer le chemin.
]

#remarque[
  - Comment est-on sûr qu'un chemin *existe* entre deux sommets A et B ?
  Si le graphe est connexe, tout parcours BFS au départ de A va parcourir l'intégralité du graphe, et donc passera par B à un moment. Un chemin sera donc forcément trouvé entre A et B.
  #v(0.5em)
  
  - Comment est-on sûr que ce chemin trouvé est *le plus court* ?
  La découverte des sommets par cercles concentriques entre A et B nous assure qu'on ne peut pas rater le point B : s'il est à la distance k de A, il sera forcément visité puisque tous les sommets à la distance k vont passer par la liste d'attente, après les sommets de distance k-1 et avant les sommets de distance k+1.

  Lorsqu'on remontera de B vers A en passant par les sommets parents successifs, il ne peut y avoir qu'un seul sommet par «couche» : le chemin sera donc exactement de longueur k, il sera donc minimal.
]

#algorithme[]


== Parcours en profondeur (DFS, Depth First Search)

=== Algorithme du DFS

= Résumé

hey what's up
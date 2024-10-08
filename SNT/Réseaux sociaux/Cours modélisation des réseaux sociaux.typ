#import "/Typst templates/style.typ": template, frame, titre, surtitre

#import "@preview/cetz:0.2.2"

#show: doc => template(doc)

#surtitre("SNT - Réseaux sociaux - Partie 3")
#titre("Modalisation des Réseaux Sociaux")

= Modélisation d'un réseau

#frame(
  title: "L'essentiel",
  body: [
    Un réseau social est composé d'individus reliés par des liens. 
    Pour le modéliser, nous allons utiliser une représentation inspirée de la théorie des graphes. 
    Cette représentation facilite l'étude des réseaux et permet à des algorithmes performants de parcourir le réseau à la recherche dinformations.
  ]
)

= Sommet, arête et graphe

#frame(
  title: "L'essentiel",
  body: [
    Dans un réseau social, une personne est représentée par un cercle ou un point numéroté appelé *sommet*.
    Le lien d'amitié entre deux individus est représenté par un trait appelé *arête*. 
    Un *graphe* est un ensemble de sommets et d'arêtes.
  ]
)

= Distance entre deux sommets d'un graphe

#frame(
  title: "L'essentiel",
  body: [
    La *distance* entre deux sommets est égale à la longueur du plus court "chemin" entre ces sommets. Ce nombre n'a pas d'unité.
  ]
)

= Caractéristiques d'un graphe

#frame(
  title: "L'essentiel",
  body: [
    
    - Le *rayon* du graphe est la plus petite distance à laquelle un des sommets se trouve de touts les autres.
    - Le *diamètre* du graphe est la distance entre les deux sommets les plus éloignés du graphe.
    - Le *centre* d'un graphe est formé de l'ensemble des sommets (il peut y en avoir plusieurs) se situant à une distance des autres sommets inférieure ou égale au rayon. Les centres d'un graphe sont les personnes à partir desquelles l'information se diffuse plus vite sur le réseau. Ils sont appelés des "*influenceurs*".
  ]
)

= La notion du "petit monde"

#frame(
  title: "L'essentiel",
  body: [
    En 1967, l'*expérience de Milgram* a montré que toute personne était à une distance moyenne de six liens de tout autre individu dans le monde. On parle d'un effet "*petit monde*".
    Grâce aux réseaux sociaux, ce nombre se réduit: en 2011, il avait chuté à 4,67 sur Facebook.
    Les réseaux sociaux favorisent la formation de communautés d'intérêt, et les algorithmes de recommandation renforcent ce phénomène.
    Certains chercheurs alertent donc sur le cloisonnement de communautés qui cultivent l'entre-soi, avec pour conséquence l'appauvrissement de la pensée critique
  ]
)

= Résumé
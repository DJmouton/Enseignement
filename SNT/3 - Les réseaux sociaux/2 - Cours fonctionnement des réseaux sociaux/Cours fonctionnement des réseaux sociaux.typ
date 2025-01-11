#import "/Templates/layouts.typ": SNT, titre, sous_titre
#import "/Templates/utils.typ": cadre, pointillets
#import "@preview/cetz:0.2.2"

#show: doc => SNT(doc)

#sous_titre[SNT - Réseaux Sociaux - Partie 1]
#titre[Fonctionnement des Réseaux Sociaux]

#let repères_historiques = cadre(titre: "Repères historique")[
  #table(
    stroke: none,
    inset: 0em,
    column-gutter: 10pt, 
    row-gutter: 15pt,
    columns: (auto, 1fr), 
    [*1995*], "Naissance d'un des premier réseaux sociaux, Classmates, qui met en relation d'anciens camarades de classe.", 
    [*2006*], "Apparition de Twitter (désormais X) et ouverture de Facebook au grand public.",
    [*2009*], "Lancement de la messagerie instantanée WhatsApp",
    [*2010*], "Multiplication du partage des photos et des vidéos via l'entrée de nouveaux acteurs comme Instagram et Snapchat.",
  )
]

#let fun_facts = cadre(titre: "Le savais-tu ?")[

  - Si l'ensemble des utilisateurs de X (anciennement Twitter) formaient un pays, ce serait le quatrième plus grand pays au monde.
  - En 1998, l'agence fédérale américaine qui régit le droit de la consommation aux États-Unis a promulgé le texte COPPA, qui protège les internautes de moins de 13 ans d'une utilisation abusive de leurs informations personnelles à des fins commerciales. Pour éviter toute complication juridique, les réseaux sociaux ont interdit l'inscription avant cet âge.
]

#grid(
  columns: (1fr, 1fr),
  column-gutter: 10pt,
  repères_historiques,
  fun_facts,
)


= Caractéristiques des réseaux sociaux

#cadre(titre: "L'essentiel")[
  Contrairement à un *réseau informatique*, composé de machines connectées physiquement entre elles, un *réseau social* met en relation des personnes (grâce à des liens d'"amitié") ou encore des entreprises (mise en relation avec le client) de façon virtuelle. 
  Grâce à des applications dédiées, les usager échangent toutes sortes de contenus numériques: messages, photos, vidéos, sons, etc.
]

#let figure_nombre_utilisateurs = align(center, cetz.canvas({
  import cetz.draw: circle, content

  let ratio_bulle = 0.4
  let ratio_texte = 7
  let distance_nom_utilisateurs = 0.6

  let bulle_réseau(position, utilisateurs, couleur_bulle, couleur_texte, nom) = {
    let rayon = calc.sqrt(utilisateurs / 3.14) * ratio_bulle
    let taille_texte = rayon * ratio_texte * 1pt

    circle(position, radius: rayon, stroke: 1pt, fill: couleur_bulle.luma(), name: nom)

    content((nom, taille_texte * distance_nom_utilisateurs, nom + ".north"), text(size: taille_texte, fill: couleur_texte, [*#nom*]))

    content((nom, taille_texte * distance_nom_utilisateurs, nom + ".south"), text(size: taille_texte, fill: couleur_texte, [#utilisateurs M]))
  }

  bulle_réseau((-7.2, 0), 50, blue, white, "Facebook")
  bulle_réseau((-5, -2), 46.6, red, white, "Youtube")
  bulle_réseau((-3.3, 0), 32, green, black, "Whatsapp")
  bulle_réseau((-2, -2), 30, rgb("#e6008a"), white, "Instagram")
  bulle_réseau((-0.7, -0.3), 23, rgb("#00e3e3"), black, "Tiktok")
  bulle_réseau((0.6, -1.6), 21, yellow, black, "Snapchat")
  bulle_réseau((2, -0.5), 15, luma(100), white, "X")
  bulle_réseau((3.3, -1.2), 13.5, rgb("#2bb1ff"), black, "LinkedIn")
  bulle_réseau((4.7, -0.6), 13, rgb("#c90000"), white, "Pinterest")
}))

#figure(
  caption: "Le nombre d'abonnés des réseaux sociaux les plus utilisés en France, en 2024.",
  figure_nombre_utilisateurs
)


= L'identité numérique et sa protection

#cadre(titre: "L'essentiel")[
  En ligne, tout comme en société, chaque individu est caractérisé par son *identité numérique*. Toutes les traces que nous laissons sur les réseaux sociaux ont une influence sur la perception qu'ont les autres de nous-même, et forgent notre *e-réputation*.
  La connection à un réseau social se fait via un processus d'*authentification* par un login et un mot de passe qui sont personnels. Un paramétrage adapté du compte permet de maîtriser la *confidentialité* des données.
]

#let figure_identité_numérique = align(center, cetz.canvas({
  import cetz.draw: line, content

  content((0, 0), text(size: 45pt, emoji.person))

  let texte_ligne(départ: (0, 0), arrivée: (1, 1), distance_coude: 0.5, titre: "..................................", sous_titre: "...............................................") = {

    let (x_départ, y_départ) = départ
    let (x_arrivée, y_arrivée) = arrivée

    line(départ, (x_départ + distance_coude, y_départ), (x_départ + distance_coude, y_arrivée), arrivée, stroke: 0.5pt,name: "ligne")

    let orientation = "east"
    if (x_départ - x_arrivée < 0) {orientation = "west"}

    content("ligne.end", anchor: "south-" + orientation, rect(stroke: none, inset: 3pt /*(top: 0pt,bottom:6pt, rest:3pt)*/, text(size: 10pt, weight: "bold", titre)))
    content("ligne.end", anchor: "north-" + orientation, rect(stroke: none, inset: 2pt /*(top: 6pt, bottom: 5pt,rest:2pt)*/, text(size: 8pt,  sous_titre)))
  }

  let décallage_départ = 1
  let coude_base = 1
  let longueur = 3.5
  let interligne = 0.15
  let séparation_verticale = 1.2
  
  // Gauche
  texte_ligne(départ: (- décallage_départ, interligne * 2), arrivée: (- longueur, (séparation_verticale + interligne) * 2), distance_coude: - coude_base,
    titre: "Réputation",
    sous_titre: "ce que l'on dit sur moi"
  )

  texte_ligne(départ: (- décallage_départ, interligne), arrivée: (- longueur, séparation_verticale + interligne), distance_coude: - (coude_base + interligne),
    titre: "Expression",
    sous_titre: "ce que je dis"
  )

  texte_ligne(départ: (- décallage_départ, 0), arrivée: (- longueur, 0), distance_coude: - coude_base,
    titre: "Réseau",
    sous_titre: "qui je connais"
  )

  texte_ligne(départ: (- décallage_départ, - interligne), arrivée: (- longueur, - (séparation_verticale + interligne)), distance_coude: - (coude_base + interligne),
    titre: "Certification",
    sous_titre: "qui peut certifier mon identité"
  )

  texte_ligne(départ: (- décallage_départ, - interligne * 2), arrivée: (- longueur, - (séparation_verticale + interligne) * 2), distance_coude: - coude_base,
    titre: "Achat",
    sous_titre: "ce que j'achète"
  )

  // Droite
  texte_ligne(départ: (décallage_départ, interligne * 2), arrivée: (longueur, (séparation_verticale + interligne) * 2), distance_coude: coude_base,
    titre: "Opinion",
    sous_titre: "ce que je pense"
  )

  texte_ligne(départ: (décallage_départ, interligne), arrivée: (longueur, séparation_verticale + interligne), distance_coude: coude_base + interligne,
    titre: "Savoir",
    sous_titre: "ce que je sais"
  )

  texte_ligne(départ: (décallage_départ, 0), arrivée: (longueur, 0), distance_coude: coude_base,
    titre: "Hobbies",
    sous_titre: "ce que j'aime"
  )

  texte_ligne(départ: (décallage_départ, - interligne), arrivée: (longueur, - (séparation_verticale + interligne)), distance_coude: coude_base + interligne,
    titre: "Avatar",
    sous_titre: "comment je me montre"
  )

  texte_ligne(départ: (décallage_départ, - interligne * 2), arrivée: (longueur, - (séparation_verticale + interligne) * 2), distance_coude: coude_base,
    titre: "Profession",
    sous_titre: "quel est mon métier et où je travaille"
  )

}))

#figure(
  caption: "Les parties de l'identité numérique.",
  figure_identité_numérique
)


== Exercice 1: Un exemple de "login social"

Paola, une jeune créatrice du web, veut s'inscrire sur un site de financement participatif pour percevoir des pourboires de la part de ses fans. Le site lui propose deux modes de connexion \[ci-contre\]: une authentification dite "classique", ou une authentification rapide par un processus dit de "login social".

#let ex1gauche = [
  === 1. Présenter les deux solutions qui s'offrent à elle pour créer son compte.

  #pointillets(repeat: 3, section_correction: true)


  === 2. Quelles informations doivent être fournies pour une authentification classique ?

  #pointillets(repeat: 2, section_correction: true)


  === 3. Quelles pourraient être les informations transmises par Google au site de financement participatif si Paola choisit le login social ?
]

#grid(columns: 2, ex1gauche, [#rect(inset: 3pt, outset: -3pt, stroke: 1pt, image("loginsocial2.png")) #v(-1em) #align(center, text(style: "italic", "Document: Interface de connection du site"))])

#pointillets(repeat: 3, section_correction: true)

=== 4. Quelle solution devrait préférer Paola si elle ne tient pas à divulger ces informations ?

#pointillets(repeat: 3, section_correction: true)


= Modèle économique des réseaux sociaux

#cadre(titre: "L'essentiel")[
  Les entreprises de réseaux sociaux génèrent plus de la moitié de leurs revenus grâce à la publicité. La revente de données, l'intégration de jeux en ligne ou encore d'applications génèrent également des revenus. Des algorithmes proposent en outre des *publicités ciblées* selon les relations de l'abonné, ses goûts, ses opinions, son âge, etc.
]


== Exercice 2: Quelques extraits d'une politique de confidentialité
Amir installe une nouvelle application sur son téléphone portable. Pour valider l'inscription, il doit "reconnaître avoir lu" la politique de confidentialité. Curioux, il choisir de parcourir le document:

#let extrait_ex2 = block(
  breakable: true,
  stroke: 0pt,
  fill: luma(225),
  width: 100%,
  inset: 5pt
)[
  "Lorsque vous utilisez nos services \[...\] nous devons ainsi collecter des informations importantes vous concernant, par exemple : votre nom, nom d'utilisateur, mot de passe, adresse, _e-mail_, numéro de téléphone et date de naissance. \[...\] Sur internet, il convient de faire preuve de bon sens : n'envoyez pas de messages ou ne partagez pas de contenu que vous ne voudriez pas que quelqu'un d'autre puisse enregistrer ou partager \[...\].
  #linebreak()
  Nous collectons des informations sur votre activité \[...\] la manière dont vous interagissez avec d'autres \[utilisateurs\], tels que leur noms, l'heure et la date de vos échanges, le nombre de  messages que vous échangez avec vos amis, les amis avec lesquels vous échangez le plus de message.
  #linebreak()
  Nous collections des informations issues des capteurs de l'appareil, comme les accéléromètres, gyroscopes, boussoles, microphones et la présence ou non d'écouteurs connectés ; et des informations sur vos connexions réseau mobile et sans fil, comme votre numéro de téléphone mobile, votre prestataire de service, votre adresse IP et la puissance du signal. \[...\] nous pouvons - avec votre autorisation - collecter des informations depuis le répertoire de votre appareil \[...\].
  #linebreak()
  Lorsque vous visitez notre site web nous collectons également des informations dans les fichiers journaux, entre autres : les pages que vous avez visitées avant ou après avoir accédé à notre site, \[...\].
  #linebreak()
  Nous utilisons certaines des informations que nous receuillons à votre sujet pour essayer de choisir les bonnes publicités et vous les envoyer au bon moment. Par exemple, si vous avez cliqué sur une série de publicités pour des jeux-vidéo, nous pourrons coninuer à vous en présenter \[...\]."
   #align(right, "(Extrait au 30 oct. 2019)")
]

#let questions_ex2 = [
  === 1. Lire l'extrait et souligner les informations dont dispose l'application concertant le matériel utilisé par Amir.


  === 2. a. Entourer les informations collectées par le site au moment de l'inscription.


  === b. Cette liste est-elle exhaustive ? Justifier.

  #pointillets(repeat: 4, section_correction: true)


  === 3. Que pensez-vous de la possibilité, pour l'application, de collecter des informations sur les amis d'Amir ?

  #pointillets(repeat: 5, section_correction: true)
]

#grid(
  columns: (2.02fr, 2fr),
  inset: 5pt,
  extrait_ex2,
  questions_ex2
)

  === 4. Comment l'application pourra-t-elle proposer à Amir des publicités ciblées ?

  #pointillets(repeat: 2, section_correction: true)

=== 5. La politique de confidentialité dont vous avez lu un extrait compte plus de 10 900 mots, ce qui représente 40 pages d'un roman. Pourquoi ces documents sont-ils généralement si long ?

#pointillets(repeat: 2, section_correction: true)


= Résumé

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

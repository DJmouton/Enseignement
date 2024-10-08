#import "/Typst templates/style.typ": template, frame, titre, surtitre

#import "@preview/cetz:0.2.2"

#show: doc => template(doc)

#surtitre[SNT - Réseaux Sociaux - Partie 1]
#titre[Fonctionnement des Réseaux Sociaux]

#let repères_historiques = frame(
  title: "Repères historique",
  body: [
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
)

#let fun_facts = frame(
  title: "Le savais-tu ?",
  body: [

    - Si l'ensemble des utilisateurs de X (anciennement Twitter) formaient un pays, ce serait le quatrième plus grand pays au monde.
    - En 1998, l'agence fédérale américaine qui régit le droit de la consommation aux États-Unis a promulgé le texte COPPA, qui protège les internautes de moins de 13 ans d'une utilisation abusive de leurs informations personnelles à des fins commerciales. Pour éviter toute complication juridique, les réseaux sociaux ont interdit l'inscription avant cet âge.
  ]
)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 10pt,
  repères_historiques,
  fun_facts,
)

= Caractéristiques des réseaux sociaux

#frame(
  title: "L'essentiel",
  body: [
    Contrairement à un *réseau informatique*, composé de machines connectées physiquement entre elles, un *réseau social* met en relation des personnes (grâce à des liens d'"amitié") ou encore des entreprises (mise en relation avec le client) de façon virtuelle. 
    Grâce à des applications dédiées, les usager échangent toutes sortes de contenus numériques: messages, photos, vidéos, sons, ²xetc.
  ]
)


#let figure_nombre_utilisateurs = align(center, cetz.canvas({
  import cetz.draw: circle, content

  let ratio_bulle = 0.4
  let ratio_texte = 10
  let distance_nom_utilisateurs = 0.6

  let bulle_réseau(position, utilisateurs, couleur_bulle, couleur_texte, nom) = {
    let rayon = calc.sqrt(utilisateurs / 3.14) * ratio_bulle
    let taille_texte = rayon * ratio_texte * 1pt

    circle(position, radius: rayon, stroke: 1pt, fill: couleur_bulle.luma(), name: nom)

    content((nom, taille_texte * distance_nom_utilisateurs, nom + ".north"), text(size: taille_texte, fill: couleur_texte, [*#nom*]))

    content((nom, taille_texte * distance_nom_utilisateurs, nom + ".south"), text(size: taille_texte, fill: couleur_texte, [#utilisateurs M]))
  }

  bulle_réseau((-7.2, -0.5), 50, blue, white, "Facebook")
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

#frame(
  title: "L'essentiel",
  body: [
    En ligne, tout comme en société, chaque individu est caractérisé par son *identité numérique*. Toutes les traces que nous laissons sur les réseaux sociaux ont une influence sur la perception qu'ont les autres de nous-même, et forgent notre *e-réputation*.
    La connection à un réseau social se fait via un processus d'*authentification* par un login et un mot de passe qui sont personnels. Un paramétrage adapté du compte permet de maîtriser la *confidentialité* des données.
  ]
)

/*
#let figure_identité_numérique = align(center, cetz.canvas({
  import cetz.draw: line, content

  content((0, 0), text(size: 50pt, "🧑"))

  let partie(arrivée, orientation: 1, texte, sous_texte) = {
    line((0, 0), (1, 10))
  }

}))

#figure(
  caption: "Juste un mec",
  figure_identité_numérique
)
*/

= Modèle économique des réseaux sociaux

#frame(
  title: "L'essentiel",
  body: [
    Les entreprises de réseaux sociaux génèrent plus de la moitié de leurs revenus grâce à la publicité. La revente de données, l'intégration de jeux en ligne ou encore d'applications génèrent également des revenus. Des algorithmes proposent en outre des *publicités ciblées* selon les relations de l'abonné, ses goûts, ses opinions, son âge, etc.
  ]
)

= Résumé

#frame(
  title: "Définitions à connaître",
  body: [
    
    - Un *réseau social* rassemble des personnes physiques ou morales, mises en relation par l'intermédiaire d'une application dédiée. La connexion à un réseau social s'effectue depuis toute machine connectée à Internet: ordinateur, smartphone, tablette, etc.
    - Un *abonné actif* est un abonné se connectant régulièrement au réseau social.
    - L'*identité numérique* est l'ensemble des traces numériques qu'une personne ou une collectivité laisse sur le Web, comme ses coordonnées ou ses goûts.
    - L'*e-réputation* (ou web-réputation) est la notoriété associée à une identité numérique. Elle peut renvoyer une image positive ou négative de cette identité.
    - Le *processus d'authentification* permet l'accès individualisé à un réseau à l'aide d'un _login_ et d'un mot de passe.
  ]
)

/*
#frame(
  title: "Ce qu'il faut retenir",
  body: [
    #set list(marker: [#sym.square])
    Il faut être capable de :
    - définir les termes suivants : réseau social, identité numérique
    - distinguer plusieurs réseaux sociaux selon leur caractéristiques
    - identifier les sources de revenu d'une entreprise du réseautage social
    - expliquer la notion : "Quand c'est gratuit, c'est vous le produit"
    - comprendre que le paramétrage d'un abonnement influe sur la confidentialité des données personnelles
  ]
)
*/
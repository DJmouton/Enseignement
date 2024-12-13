#import "/Templates/layouts.typ": SNT, titre, sous_titre
#import "/Templates/utils.typ": pointillets

#show: doc => SNT(doc)

//! Ne pas oublier de mettre à jour.
#set page(header: [2#smallcaps("nde") 3 #h(1fr) 02/12/2024])

#let à_savoir = align(right, [#sym.arrow.r.curve #underline(offset: 0.15em,"À savoir !")])

#sous_titre[SNT - Réseaux Sociaux - Activité 1]
#v(-1em)
#titre[Charactéristiques et revenus #linebreak() des réseaux sociaux]

En 2024, environ 50,7 millions de Français étaient actifs sur les réseaux sociaux. Un utilisateur y passe en moyenne 1h48 chaque jour ! Voici 9 réseaux sociaux parmi les plus utilisés en France.


=== 1. Seul ou en binôme, choisissez _deux_ réseau social et complétez les lignes du tableau suivant en vérifiant les informations sur le web.

#let facebook = [#v(-0.5em) #align(center, image("./facebook.png", height: 30pt)) #v(-1em) #pointillets()]
#let whatsapp = [#v(-0.5em) #align(center, image("./whatsapp.png", height: 30pt)) #v(-1em) #pointillets()]
#let linkedin = [#v(1em) #align(center, image("./linkedin.png", height: 13pt))]
#let youtube = [#v(-0em) #align(center, image("./youtube.png", height: 20pt)) #v(-0.5em) #pointillets()]
#let x = [#v(-0em) #align(center, image("./x.png", height: 20pt)) #v(-0.5em) #pointillets()]
#let instagram = [#v(-0em) #align(center, image("./instagram.png", height: 20pt)) #v(-0.5em) #pointillets()]
#let snapchat = [#v(-0.5em) #align(center, image("./snapchat.png", height: 30pt)) #v(-1em) #pointillets()]
#let pinterest = [#v(1em) #align(center, image("./pinterest.png", height: 13pt))]
#let tiktok = [#v(-0em) #align(center, image("./tiktok.png", height: 20pt)) #v(-0.5em) #pointillets()]

#let fond_titre_table = luma(220)
#set table.cell(inset: (top: 8pt))
#table(
  columns: (1fr, 2fr, 2fr, 2fr),
  table.cell(fill: fond_titre_table, [*Nom du réseau social*]),
  table.cell(fill: fond_titre_table, [*Contenu(s) échangé(s) sur le réseau entre ses utilisateurs*]),
  table.cell(fill: fond_titre_table, [*Peut-on "noter", "liker" ou "aimer" les commentaires ?*]),
  table.cell(fill: fond_titre_table, [*Membres du réseau: contacts, amis, followers ?*]),
  facebook, "Messages, photos, vidéos", pointillets(repeat: 2), pointillets(repeat: 2),
  whatsapp, pointillets(repeat: 2), pointillets(repeat: 2), pointillets(repeat: 2),
  linkedin, pointillets(repeat: 2), "Oui: bouton j'aime", pointillets(repeat: 2),
  youtube, pointillets(repeat: 2), pointillets(repeat: 2), pointillets(repeat: 2),
  x, pointillets(repeat: 2), pointillets(repeat: 2), [Followers, amis],
  instagram, pointillets(repeat: 2), pointillets(repeat: 2), pointillets(repeat: 2),
  snapchat, pointillets(repeat: 2), pointillets(repeat: 2), pointillets(repeat: 2),
  pinterest, pointillets(repeat: 2), pointillets(repeat: 2), pointillets(repeat: 2),
  tiktok, pointillets(repeat: 2), pointillets(repeat: 2), pointillets(repeat: 2),
)


=== 2. Entourer, dans le tableau, le nom des réseaux sociaux que vous utilisez.


=== 3. Rechercher sur le Web trois sources de revenus des entreprises privées de réseaux sociaux.

#pointillets(repeat: 6)

#à_savoir

=== 4. a. Choisir une des neuf entreprises citées plus haut, puis rechercher sur le Web son chiffre d'affaires annuel et son nombre d'utilisateurs "actifs".

#pointillets(repeat: 3)

=== b. Calculer le revenu moyen annuel par utilisateur en calculant le quotient $frac("chiffre d'affaires", "nombre d'inscrits actifs")$. Commentez ce chiffre : vous semble-t-il élevé ?

#pointillets(repeat: 4)


=== c. Comment expliquer la rentabilité de ces entreprises ?

#pointillets(repeat: 4)

#à_savoir

=== 5. Commenter le slogan : "Quand c'est gratuit, c'est vous le produit !"

#pointillets(repeat: 5)

#à_savoir
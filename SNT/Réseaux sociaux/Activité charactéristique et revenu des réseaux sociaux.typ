#import "/Templates/layouts.typ": SNT, titre, sous_titre
#import "/Templates/utils.typ": pointillets

#show: doc => SNT(doc)

#set page(header: [2#smallcaps("nde") 3 #h(1fr) Lundi 25 Novembre 2024])

#sous_titre[SNT - Réseaux Sociaux - Activité 1]
#v(-1em)
#titre[Charactéristiques et revenus #linebreak() des réseaux sociaux]

En 2024, environ 50,7 millions de Français étaient actifs sur les réseaux sociaux. Un utilisateur y passe en moyenne 1h48 chaque jour ! Voici 9 réseaux sociaux parmi les plus utilisés en France.


=== 1. Compléter le tableau suivant en vérifiant les informations sur le web

#let fond_titre_table = luma(220)
#set table.cell(inset: (top: 8pt))
#table(
  columns: (1fr, 2fr, 2fr, 2fr),
  table.cell(fill: fond_titre_table, [*Nom du réseau social*]),
  table.cell(fill: fond_titre_table, [*Contenu(s) échangé(s) sur le réseau entre ses utilisateurs*]),
  table.cell(fill: fond_titre_table, [*Peut-on "noter", "liker" ou "aimer" les commentaires ?*]),
  table.cell(fill: fond_titre_table, [*Membres du réseau: contacts, amis, followers ?*]),
  [Facebook], "Messages, photos, vidéos", pointillets(repeat: 2), pointillets(repeat: 2),
  [Youtube], pointillets(repeat: 2), pointillets(repeat: 2), pointillets(repeat: 2),
  [WhatsApp], pointillets(repeat: 2), pointillets(repeat: 2), pointillets(repeat: 2),
  [Instagram], pointillets(repeat: 2), pointillets(repeat: 2), pointillets(repeat: 2),
  [TikTok], pointillets(repeat: 2), pointillets(repeat: 2), pointillets(repeat: 2),
  [Snapchat], pointillets(repeat: 2), pointillets(repeat: 2), pointillets(repeat: 2),
  [X (Twitter)], pointillets(repeat: 2), pointillets(repeat: 2), [Followers, amis],
  [Linkedin], pointillets(repeat: 2), "Oui: bouton j'aime", pointillets(repeat: 2),
  [Pinterest], pointillets(repeat: 2), pointillets(repeat: 2), pointillets(repeat: 2),
)


=== 2. Entourer, dans le tableau, le nom des réseaux sociaux que vous utilisez.


=== 3. Rechercher sur le Web trois sources de revenus des entreprises privées de réseaux sociaux.

#pointillets(repeat: 4)


=== 4. a. Choisir une des sept entreprises citées plus haut, puis rechercher sur le Web son chiffre d'affaires annuel et son nombre d'utilisateurs "actifs".

#pointillets(repeat: 2)

=== b. Calculer le revenu moyen annuel par utilisateur en calculant le quotient $frac("chiffre d'affaires", "nombre d'inscrits actifs")$. Commentez ce chiffre : vous semble-t-il élevé ?

#pointillets(repeat: 3)


=== c. Comment expliquer la rentabilité de ces entreprises ?

#pointillets(repeat: 3)


=== 5. Commenter le slogan : "Quand c'est gratuit, c'est vous le produit !"

#pointillets(repeat: 3)
#import "/Typst templates/style.typ": template, frame, définition, remarque, exercice, exemple, studentline, algorithme, TODO, titre, surtitre

#show: doc => template(doc)

#let pointillets = [#v(0.8em) #move(dy: 0.2em ,line(length: 100%, stroke: (dash: "dotted")))]

#surtitre[SNT - Réseaux Sociaux - Activité 1]
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
  [Facebook], "Messages, photos, vidéos", pointillets, pointillets,
  [Youtube], pointillets, pointillets, pointillets,
  [WhatsApp], pointillets, pointillets, pointillets,
  [Instagram], pointillets, pointillets, pointillets,
  [TikTok], pointillets, pointillets, pointillets,
  [Snapchat], pointillets, pointillets, pointillets,
  [X (Twitter)], pointillets, pointillets, [Followers, amis],
  [Linkedin], pointillets, "Oui: bouton j'aime", pointillets,
  [Pinterest], pointillets, pointillets, pointillets,
)

=== 2. Entourer, dans le tableau, le nom des réseaux sociaux que vous utilisez.

=== 3. Rechercher sur le Web trois sources de revenus des entreprises privées de réseaux sociaux.

#pointillets
#pointillets

=== 4. a. Choisir une des sept entreprises citées plus haut, puis rechercher sur le Web son chiffre d'affaires annuel et son nombre d'utilisateurs "actifs".

#v(1em)
#line(stroke: (dash: "dotted"), length: 100%)

=== b. Calculer le revenu moyen annuel par utilisateur en calculant le quotient $frac("chiffre d'affaires", "nombre d'inscrits actifs")$. Commentez ce chiffre : vous semble-t-il élevé ?

#pointillets
#pointillets


=== c. Comment expliquer la rentabilité de ces entreprises ?

#pointillets
#pointillets

=== 5. Commenter le slogan : "Quand c'est gratuit, c'est vous le produit !"

#pointillets
#pointillets
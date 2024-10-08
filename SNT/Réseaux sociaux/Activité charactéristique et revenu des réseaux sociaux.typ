#import "/Typst templates/style.typ": template, frame, définition, remarque, exercice, exemple, studentline, algorithme, TODO, titre, surtitre

#show: doc => template(doc)


#surtitre[SNT - Réseaux Sociaux - Activité]
#titre[Charactéristiques et revenus #linebreak() des réseaux sociaux]

#let pointillets = [#v(0.8em) #move(dy: 0.2em ,line(length: 100%, stroke: (dash: "dotted")))]

=== 1. Compléter le tableau suivant en vérifiant les informations sur le web


#let fond_titre_table = luma(220)
#set table.cell(inset: (top: 8pt))
#table(
  columns: (1fr, 2fr, 2fr, 2fr),
  table.cell(fill: fond_titre_table, [*Nom du réseau social*]),
  table.cell(fill: fond_titre_table, [*Contenu(s) échangé(s) sur le réseau entre ses utilisateurs*]),
  table.cell(fill: fond_titre_table, [*Peut-on "noter", "liker" ou "aimer" les commentaires ?*]),
  table.cell(fill: fond_titre_table, [*Membres du réseau: contacts, amis, followers ?*]),
  [facebook], "Messages, photos, vidéos", pointillets, pointillets,
  [youtube], pointillets, pointillets, pointillets,
  [whatsapp], pointillets, pointillets, pointillets,
  [instagram], pointillets, pointillets, pointillets,
  [tiktok], pointillets, pointillets, pointillets,
  [snapchat], pointillets, pointillets, pointillets,
  [x], pointillets, pointillets, [Followers, amis],
  [linkedin], pointillets, "Oui: bouton j'aime", pointillets,
  [pinterest], pointillets, pointillets, pointillets,
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
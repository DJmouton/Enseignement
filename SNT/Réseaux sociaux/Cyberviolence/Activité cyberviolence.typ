#import "/Templates/layouts.typ": SNT, titre, sous_titre
#import "/Templates/utils.typ": pointillets, cadre

#show: doc => SNT(doc)

#set page(header: [2#smallcaps("nde") 3 #h(1fr) 16/12/2024])

#let à_savoir = align(right, [#sym.arrow.r.curve #underline(offset: 0.15em,"À savoir !")])

#sous_titre[SNT - Réseaux Sociaux - Activité 2]
#v(-1em)
#titre[Cyberviolence]

Les nouvelles technologies offrent un nouvel espace pour les comportements violents. Selon un étude récente, 40% des jeunes déclarent avoir été victimes de cyberviolence au moins une fois dans l'année scolaire. Quels comportements adopter pour profiter en toute quiétude des services proposés par les réseaux sociaux ?

#let loi = cadre(titre: "Le cyberharcèlement est puni par la loi")[
  D'après l'article de loi n° 222-33-2-2 du code pénal:

  "Le fait de harceler une personne par des propos ou comportements répétés ayant pour objet ou pour effet une dégradation de ses conditions de vie se traduisant par une altération de sa santé physique ou mentale" est puni d'un à trois ans d'emprisonnement et de 15 000 € à 45 000 € d'amende. L'infraction est également constituée lorsque les faits "ont été commis par l'utilisation d'un service de communication au public en ligne ou par le biais d'un support numérique ou électronique."
]

#grid(columns: 2, column-gutter: 10pt, image(height: 229pt, "./photoperso.jpg"), grid(rows: 2, loi, align(center, image(height: 75pt, "./nonauharcelement.jpg"))))


=== 1. Donner cinq exemples de cyberviolence en lien avec les réseaux sociaux. #linebreak() Exemple : _l'auteur de vioelnce public des commentaires insultants sur le profil de la victime._

#pointillets(repeat: 5)

=== 2. Commenter le slogan de la campagne "Une photo, c'est perso, la partager c'est harceler". #linebreak() Si votre avis est mitigé, expliquer pourquoi.

#pointillets(repeat: 3)

=== Comment réagir si on est témoin d'un harcèlement ou si on le subit soi-même ?

#pointillets(repeat: 3)
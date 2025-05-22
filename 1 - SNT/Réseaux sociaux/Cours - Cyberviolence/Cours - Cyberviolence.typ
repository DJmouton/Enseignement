> des réseaux sociaux#import "/Templates/layouts.typ": SNT, titre, sous_titre
#import "/Templates/utils.typ": cadre, pointillets

#import "@preview/cetz:0.2.2"

#show: doc => SNT(doc)

#sous_titre[SNT - Réseaux Sociaux - Partie 2]
#titre[Cyberviolence]

Avec la multiplication des réseaux sociaux, de nouvelles formes de violences numériques se sont répandues. On parle de cyberviolence, et de cyberharcèlement.

#cadre(titre: "L'essentiel")[
    /*Sur le Web, la violence prend des formes variées :
    - divulgation de photos publiées sans autorisation ou encore modifiées intentionnellement;
    - diffusion d'images à caractère pornographique;
    - usurpation d'identité ;
    - envoie d'insultes et de menaces ;
    - publication de calomnies, etc.*/
    La *cyberviolence* désigne des actes agressifs intentionnels comme les menaces, la diffamation ou les insultes sur les réseaux sociaux, la diffusion d'image d'une personne sans son autorisation, les actes de violence (provoqués, filmés ou diffusés). Le *cyberharcèlement* est une cyberviolence répétée
]

Aujourd'hui, *40% des lycéens* subissent des cyberviolences au moins une fois dans l'année et *6% des lycéens* subissent un *cyberharcèlement* régulier.

#let formes = cadre(titre: "Les armes du cyberharceleur")[
    - Forums
    - SMS, e-mails
    - Réseaux sociaux
    - Jeux en ligne
    - Partage de vidéos
]

#let outil = cadre(titre: "Les formes de cyberviolence")[
    - Insultes, menaces via SMS, e-mail
    - Insultes, rumeurs postées sur le mur de la victime
    - Envoie de photos intimes de la victime à ses amis
    - Envoi de contenu pronographique
    - Appels anonymes masqués
    - _Happy Slapping_: agression provoquée, filmée et diffusée
    - Incitation à lyncher un élève sur un Forums
    - Création d'un faux compte avec des contenus au nom de la victime
]

#grid(
    columns: (1fr, 3fr),
    column-gutter: 10pt,
    formes, outil,
)
= Agir contre la cyberviolence

#cadre(titre: "L'essentiel")[
    Les actes de harcèlement en ligne sont punis par des peines de prison et des amendes de plusieurs dizaines de milliers d'euros. Les sanctions sont aménagées pour les mineurs. Pour agir contre la cyberviolence et s'informer sur les dispositifs existants, il existe de nombreuses ressources en ligne sur le site https://nonauharcelement.education.gouv.fr, ainsi qu'un numéro de téléphone dédié: le *3020*.
]

#cadre(titre: "Définitions à connaître")[

    - La *cyberviolence* est un acte agressif et intentionnel, organisé à l'encontre d'une victime par un ou plusieurs individus, par l'intermédiaire d'un média numérique tel un réseau social.
    - Le *harcèlement* se définit comme une violence répétée qui peut être verbale, physique ou psychologique. Cette violence s'exerce aussi bien au sein de l'école que sur les réseaux sociaux.
]

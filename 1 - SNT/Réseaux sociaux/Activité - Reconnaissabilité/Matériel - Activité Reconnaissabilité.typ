#import "/Templates/layouts.typ": SNT, titre, sous_titre
#import "/Templates/utils.typ": cadre, pointillets

#set page(margin: 40pt)
#set text(size: 12pt)
//#image("graphe.png")
//#pagebreak(weak: true)

#set rect(width: 100%, height: 100%, radius: 10pt, inset: 2em)

#let confid = text(size: 8pt, [_Les autres données sont confidentielles ou manquantes._])


#let manonA = rect()[
    #align(center, [*Manon A.*])

    #confid
    === Amis:
    - Alex M.
    - Maxence O.
    - Chloe A.
    - Erwan D.
    - Barth F.
]
#let manonB = rect()[
    #align(center, [*Nounoudenfer*])

    #confid
    === Amis:
    - Destroyer38
    - larouetourne07
    - LaMenace26
    - PoeCfou
    - Cloclo07
]


#let chloeA = rect()[
    #align(center, [*Chloe A.*])

    #confid
    === Amis:
    - Maxence O.
    - Barth F.
    - Alex M.
    - Manon A.
]
#let chloeB = rect()[
    #align(center, [*Cloclo07*])

    #confid
    === Amis:
    //  - LaMenace26
    - PoeCfou
    - Nounoudenfer
    - Destroyer38
]


#let barthA = rect()[
    #align(center, [*Barth F.*])

    #confid
    === Amis
    - Chloe A.
    //  - Amandine B.
    - Audrey R.
    - Manon A.
    - Maxence O.
]
#let barthB = rect()[
    #align(center, [*PoeCfou*])

    #confid
    === Amis
    - Nounoudenfer
    - Chevalasagne
    - LaMenace26
    - Cloclo07
    - Moudjine
]

// Mauvaise localisation
#let erwanA = rect()[
    #align(center, [*Erwan D.*])
    *Login* er.d\@zemail.fr
    *Localisation* Grenoble (38)

    #confid
    === Amis
    - Maxence O.
    - Manon A.
    - Alex M.
]
#let erwanB = rect()[
    #align(center, [*larouetourne07*])
    *Login* er.d\@zemail.fr

    #confid
    === Amis
    - Nounoudenfer
    //  - Destroyer38
    //  - LaMenace26
]

//. !Email + Localisation
#let alexA = rect()[
    #align(center, [*Alex M.*])
    *Login* alex.m\@promail.fr
    *Localisation* Grenoble (38)

    #confid
    === Amis
    - Chloe A.
    - Erwan D.
    - Manon A.
]
#let alexB = rect()[
    #align(center, [*Destroyer38*])
    *Login* destroyer38\@zemail.fr

    #confid
    === Amis
    - Cloclo07
    - Nounoudenfer
    //  - larouetourne07
]


#let audreyA = rect()[
    #align(center, [*Audrey R.*])

    #confid
    === Amis
    - Amandine B.
    - Barth F.
    - Maxence O.
]
#let audreyB = rect()[
    #align(center, [*Chevalasagne*])

    #confid
    === Amis:
    - LaMenace26
    - Moudjine
    - PoeCfou
]


#let maxenceA = rect()[
    #align(center, [*Maxence O.*])

    #confid
    === Amis
    - Erwan D.
    - Amandine B.
    - Chloe A.
    - Barth F.
    - Manon A.
    - Lisa B.
    - Audrey R.
]
#let maxenceB = rect()[
    #align(center, [*LaMenace26*])

    #confid
    === Amis:
    - Chevalasagne
    - Nounoudenfer
    - PoeCfou
    - Moudjine
    //  - Cloclo07
    - Lisa26
    //  - larouetourne07
]


#let lisaA = rect()[
    #align(center, [*Lisa B.*])

    #confid
    === Amis:
    - Maxence O.
]
#let lisaB = rect()[
    #align(center, [*Lisa26*])

    #confid
    === Amis:
    - LaMenace26
]

// Login social
#let amandineA = rect()[
    #align(center, [*Amandine B.*])

    #confid
    *Login:* _Via instagram:_ Moudj38
    === Amis
    - Maxence O.
    //  - Barth F.
    - Audrey R.
]
#let amandineB = rect()[
    #align(center, [*Moudjine*])

    #confid
    *Login:* _Via instagram:_ Moudj38
    === Amis:
    - Chevalasagne
    - LaMenace26
    - PoeCfou
]


#grid(
    columns: (1fr, 1fr, 1fr),
    rows: (1fr, 1fr, 1fr),
    column-gutter: 20pt,
    row-gutter: 20pt,
    manonA, chloeA, barthA,
    erwanA, alexA, audreyA,
    maxenceA, lisaA, amandineA,
)

#pagebreak()

#grid(
    columns: (1fr, 1fr, 1fr),
    rows: (1fr, 1fr, 1fr),
    column-gutter: 20pt,
    row-gutter: 20pt,
    manonB, chloeB, barthB,
    erwanB, alexB, audreyB,
    maxenceB, lisaB, amandineB,
)

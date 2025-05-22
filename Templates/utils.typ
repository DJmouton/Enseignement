// Permet de contrôler toutes les corrections en même temps
#let CORRIGÉ_GLOBAL = false


#set text(lang: "FR")


// Cadre pour du contenu avec un titre en haut à gauche
#let cadre(titre: [Joli cadre], couleur: black, breakable: false, body) = [
    #v(1em)
    #block(
        radius: 1em,
        stroke: couleur,
        inset: 1em,
        width: 100%,
        breakable: breakable,
    )[
        // Le titre
        #move(
            dx: 0pt,
            dy: -20pt,
            rect(
                fill: white, // Fond blanc pour casser le contour du cadre
                radius: 7pt,
                [*#titre*],
            ),
        )
        #v(-2.8em)
        #body
    ]
]


// Exemples
#cadre(titre: "Définition", couleur: red)[#lorem(30)]
#cadre(titre: [Remarque])[#lorem(30)]


// Permet de superposer des contenu
#let z-stack(..items) = {
    grid(
        columns: items.pos().len() * (1fr,),
        column-gutter: -100%,
        rows: 1,
        ..items
    )
}


// Permet d'avoir 2 versions d'un contenu au même endroit, modifié par un bool, idéal pour garder la mise en page entre une version élève et une version corrigée
#let correction(correction_visible: CORRIGÉ_GLOBAL, énoncé: [], corrigé) = {
    block(
        breakable: true,
        stroke: 0pt,
        inset: 0pt,
    )[
        #if correction_visible { z-stack(corrigé, hide(énoncé)) } else {
            z-stack(stroke: (luma(250)), hide(corrigé), énoncé)
        }
    ]
}


// Tu devineras jamais cque ça fait
#let pointillet = [#v(1em) #move(dy: 0em, line(length: 100%, stroke: (dash: "dotted")))]

#let pointillets(repeat: 1, section_correction: false) = [
    #if section_correction [
        #grid(
            columns: (auto, 1fr),
            move(dy: 5pt, text(size: 9pt, style: "italic", "Ma réponse : ")), pointillet,
        )
        #for i in range(repeat - 1) [#pointillet]

        #grid(
            columns: (auto, 1fr),
            move(dy: 5pt, text(size: 9pt, style: "italic", "Correction : ")), pointillet,
        )
        #for i in range(repeat - 1) [#pointillet]
    ] else [
        #for i in range(repeat) [#pointillet]
    ]
]
// Exemples
#correction(énoncé: smallcaps(lorem(30)))[#lorem(40)]
#correction(énoncé: lorem(40))[#for i in range(3) [#pointillets]]

#pointillets(repeat: 2)

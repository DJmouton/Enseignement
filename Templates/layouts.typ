/*
Template de mise en page pour l'entièreté d'un document

Utilisation:
1. Importer le template voulu

  #import "/Templates/layout.typ": SNT

2. L'appliquer au document entier:

  #show: doc => template(doc)

Peut-être aussi utilisé pour n'importe quel contenu
*/
//#import "/Templates/Metadata.typ": classe_snt, date_snt


#let SNT(body) = {
    set page(
        paper: "a4",
        numbering: "1 / 1",
        //header: [#classe_snt #h(1fr) #date_snt],
    )

    set par(justify: false)
    set text(
        //font: "OpenDyslexic",
        size: 10pt,
        lang: "FR",
    )

    set figure.caption(separator: [ -- ])
    set figure(supplement: "Figure")
    show figure: it => [#it #v(0.5em)]

    [#body]
}


#let NSI(body) = {
    set page(
        paper: "a4",
        numbering: "1 / 1",
        header: [
            #context {
                let headings = query(selector(heading).before(here()))
                if headings.len() < 3 { text("") }
                let first = none
                let second = none
                while headings.len() > 0 {
                    let current = headings.pop()
                    if second == none {
                        if current.level == 2 { second = current.body }
                    } else {
                        if current.level == 1 { first = current.body }
                    }
                }
                if first == none or second == none { text("") } else { text(size: 8pt, [#first > #second]) }
            }
        ],
    )

    show heading: it => [#it #v(0.5em)]
    show heading.where(level: 1): set heading(numbering: "1.")
    show heading.where(level: 2): set heading(numbering: "1.1")
    show heading.where(level: 3): set heading(numbering: none)

    set par(justify: false)

    set text(
        font: "DejaVu Sans",
        size: 10pt,
        lang: "FR",
    )

    set figure.caption(separator: [ -- ])
    set figure(supplement: "Figure")
    show figure: it => [#it #v(0.5em)]

    show raw: it => box(
        outset: 0.15em,
        radius: 2pt,
        fill: luma(240),
        it,
    )

    [#body]
}


#let QCM(body, classe: [2#smallcaps("nde") 6], date: [01/01/1970]) = {
    import "/Templates/layouts.typ": SNT

    SNT([
        //#set page(header: [#classe #h(1fr) #date], numbering: none)

        #set text(size: 14pt)
        Prénom: #h(1fr) Nom: #h(1fr)
        #body
    ])
}


#let titre(body) = align(center, text(size: 24pt, smallcaps(body)))


#let sous_titre(body) = align(center, text(size: 14pt, smallcaps(body)))


// Exemple
#let exemple(preface) = [
    #preface

    #titre([What's up gang])
    #sous_titre([It's a "me", Mario])

    = Moi, roi du monde

    #lorem(30)

    == Pourquoi voter pour moi

    === Parceque

    #lorem(15)

    === Feur

    == Vous n'avez pas le choix

    #figure(caption: "Waw c'est fou", emoji.alien)

    = Ze end

]

#SNT(exemple([Exemple de SNT]))

#pagebreak(weak: true)

#NSI(exemple([Exemple de NSI]))

#let Fiche_séance(body) = {
    set page(
        paper: "a4",
        numbering: "1 / 1",
        header: [#classe_snt #h(1fr) #date_snt],
    )

    set par(justify: false)
    set text(
        //font: "OpenDyslexic",
        size: 10pt,
        lang: "FR",
    )

    set figure.caption(separator: [ -- ])
    set figure(supplement: "Figure")
    show figure: it => [#it #v(0.5em)]

    [#body]
}

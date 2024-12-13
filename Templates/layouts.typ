/* 
Template de mise en page pour l'entièreté d'un document

Utilisation:
1. Importer le template voulu

  #import "/Templates/layout.typ": SNT

2. L'appliquer au document entier:

  #show: doc => template(doc)

Peut-être aussi utilisé pour n'importe quel contenu
*/


#let SNT(body) = {
  set page(
    paper: "a4",
    numbering: "1 / 1"
  ) 

  set par(
    justify: false,
  )
  set text(
    //font: "OpenDyslexic",
    size: 10pt,
    lang: "FR"
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
        if headings.len() < 3 {
          return
        }
        let first = none
        let second = none
        while headings.len() > 0 and (first == none or second == none) {
          let current = headings.pop()
          if second == none {
            if current.level == 2 {second = current.body}
          }
          else {
            if current.level == 1 {first = current.body}
          }
        }
        if first == none or second == none {return}
        text(size: 8pt, [#first > #second])
      }
    ],
  ) 

  //show par: set block(below: 1.5em)
  set par(
    justify: true,
    leading: 1.5em,
  )
  
  set heading(numbering: "1.1.1.")
  show heading: set block(above: 2em, below: 1.2em)
  set text(
    //font: "",
    size: 11pt,
    lang: "FR"
  )
  
  set figure.caption(separator: [ -- ])
  set figure(supplement: "Figure")
  show figure: it => [#it #v(0.5em)]
  
  [#body]
}


#let QCM(body, classe: [2#smallcaps("nde") 6], date: [01/01/1970]) = {
  import "/Templates/layouts.typ": SNT

  SNT([
    #set page(header: [#classe #h(1fr) #date], numbering: none)
    
    #set text(size: 14pt)
    Prénom: #h(1fr) Nom: #h(1fr)
    #body
  ]
  )
}


#let titre(body) = align(center, text(size: 24pt, smallcaps(body)))


#let sous_titre(body) = align(center, text(size: 14pt, smallcaps(body)))


// Exemple
#let exemple = [

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

Exemple layout SNT

#SNT(exemple)

#pagebreak(weak:true)

Exemple layout NSI

#NSI(exemple)




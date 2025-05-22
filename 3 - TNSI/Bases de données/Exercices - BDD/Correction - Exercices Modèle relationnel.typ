D#import "/Templates/layouts.typ": NSI, titre, sous_titre
#import "/Templates/utils.typ": cadre
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import fletcher.shapes: pill

#show: doc => NSI(doc)

#titre[Correction Exercices Modèle Relationnel]
#show raw: it => box(
    outset: 0.15em,
    radius: 2pt,
    fill: luma(230),
    it,
)
#set raw(lang: "SQL")

#show table.cell.where(y: 0): strong
#set table(
    stroke: (x, y) => (
        if y < 2 { 1pt } else { (top: 0pt, bottom: 1pt, left: 1pt, right: 1pt) }
    ),
    align: (x, y) => (
        if y < 1 { center } else { left }
    ),
)

#let association(action, variable) = arguments(
    grid(
        stroke: 0pt,
        grid.cell(inset: 5pt, strong(action)),
        grid.cell(inset: 5pt, stroke: (top: 1pt), align(left, variable))
    ),
    inset: 5pt,
    stroke: 1pt,
)

*Exercice 1*
1. Oui, car le nom/prénom n'est pas un clé primaire.
2. Oui, car la date n'est pas une clé primaire et un client
peut avoir autant de réservation qu'il veut.
3. Non, car il n'y a qu'une seule date à la réservation
4. Oui, grâce à l'association "correspond"
5. Oui, car il n'y a pas de contrainte sur la date de la réservation
(ce n'est pas une clé primaire)

*Exercice 2*
1. Oui, un patient peuvent assister à plusieurs consultations (1, n).
2. Non, car il ne peut y avoir qu'un seul patient lors
d'une consultation (1, 1).
3. Oui, on peut préscrire (0, n) médicaments.
4. Oui, car il n'y a aucune contrainte entre medecin et medicament.

*Exercice 3*

#let client = table(
    columns: 70pt,
    "client",
    underline("id_client"),
    "nom",
    "prenom"
)

#let reservation = table(
    "reservation",
    underline("id_reservation"),
    emph("id_client"),
    emph("id_chambre"),
    "date"
)

#let chambre = table(
    columns: 70pt,
    "chambre",
    underline("id_chambre"),
    emph("nom_hotel"),
    "prix"
)

#let hotel = table(
    columns: 70pt,
    "hotel",
    underline("nom"),
    "adresse"
)

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), client, name: <cli>),
        node((4, 0), reservation, name: <res>),
        node((4, 2), chambre, name: <cha>),
        node((0, 2), hotel, name: <hot>),
        edge(<res>, <cli>, "-|>"),
        edge(<res>, <cha>, "-|>"),
        edge(<cha>, <hot>, "-|>"),
    ),
)

*Exercice 4*

#let patient = table(
    columns: 70pt,
    "patient",
    underline("num_secu"),
    "nom",
)

#let consultation = table(
    "consultation",
    underline("id_consultation"),
    emph("matricule"),
    emph("num_secu"),
    "date"
)

#let medicament = table(
    "medicament",
    underline("code"),
    "libelle"
)

#let medecin = table(
    columns: 70pt,
    "medecin",
    underline("matricule"),
    "nom",
)

#let prescription = table(
    "prescription",
    underline(emph("id_consultation")),
    underline(emph("code")),
    "nb_prises"
)

#align(
    center,
    diagram(
        node-inset: 0pt,
        node-shape: rect,
        edge-stroke: 0.1em,
        node((0, 0), consultation, name: <con>),
        node((0, -1), patient, name: <pat>),
        node((-2, 0), prescription, name: <pre>),
        node((-2, 1), medicament, name: <medi>),
        node((2, 0), medecin, name: <mede>),
        edge(<con>, <pat>, "-|>"),
        edge(<pre>, <con>, "-|>"),
        edge(<pre>, <medi>, "-|>"),
        edge(<con>, <mede>, "-|>"),
    ),
)


*Exercice 5*

#set table(stroke: 1pt)

#table(
    columns: (1fr, 1fr, 1fr, 1fr, 2fr, 1fr),
    rows: (auto, 3em, 3em, 3em),
    "Relation", "Attribut", "Type", "Unicité", "Valeur nulle permise", "Clé",
    "chambre", "nom_hotel", "Texte", "Non", "Non", "FK",
    "chambre", "prix", "Réel", "Non", "Oui", "",
    "reservation", "date", "Date", "Non", "Oui", "",
    "client", "id_client", "Entier", "Oui", "Non", "PK",
)

*Exercice 6*
- Anomalies ligne 1 : Pas de num_secu, alors qu'il faut un patient.
- Anomalies ligne 2 : Aucune, date peut être nulle.
- Anomalies ligne 3 : Le num_sécu n'est pas un entier.
/*
*Exerice 7*
`CREATE TABLE consultation(
  id_consultation INT PRIMARY KEY,
  matricule INT FOREIGN KEY REFERENCES medecin(matricule),
  num_secu INT FOREIGN KEY REFERENCES patient(num_secu),
  date DATE,
)

CREATE TABLE prescription(
  id_consultation INT FOREIGN KEY REFERENCES consultation(id_consultation)
  code INT FOREIGN KEY REFERENCES medicament(code)
  nb_prises INT
  PRIMARY KEY (id_consultation)
  PRIMARY KRY (code)
)`

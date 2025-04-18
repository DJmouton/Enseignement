#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import fletcher.shapes: pill

#import "/Templates/layouts.typ": NSI, titre, sous_titre
#import "/Templates/utils.typ": cadre, correction as cor

#show: doc => NSI(doc)

#titre[TNSI - Conception BDD - Exercices]

#show table.cell.where(y: 0): strong
#set table(
  stroke: (x, y) => (
    if y < 2 { 1pt }
    else { (top: 0pt, bottom: 1pt, left: 1pt, right: 1pt) }
  ),
  align: (x, y) => (
    if y < 1 { center }
    else { left }
  )
)

#let association(action, variable) = arguments(
  grid(
    stroke: 0pt,
    grid.cell(inset: 5pt, strong(action)),
    grid.cell(inset: 5pt, stroke: (top: 1pt), align(left, variable))
  ),
  inset: 5pt,
  stroke: 1pt
)

=== Exercice 1

On souhaite gérer des réservations dans une compagnie d’hôtels.
On considère donc le modèle Entités/Associations suivant :

#let client = table(columns: 70pt,
  "client", 
  underline("id_client"), 
  "nom", 
  "prenom"
)

#let reservation = table(
  "reservation", 
  underline("id_reservation"), 
  "date"
  )

#let chambre = table(columns: 70pt,
  "chambre", 
  underline("id_chambre"), 
  "prix"
)

#let hotel = table(columns: 70pt,
  "hotel", 
  underline("nom"), 
  "adresse"
)

#align(center, diagram(
  node-inset: 0pt,
  node-shape: rect,
  edge-stroke: 0.1em,
  node((0, 0), client, name: <cli>),
  node((2, 0), shape: pill, ..association("effectue", ""), name: <eff>),
  node((4, 0), reservation, name: <res>),
  node((4, 1), shape: pill, ..association("correspond", ""), name: <cor>),
  node((4, 2), chambre, name: <cha>),
  node((2, 2), shape: pill, ..association("appartient", ""), name: <app>),
  node((0, 2), hotel, name: <hot>),
  edge(<eff>, <cli>, $1,n$),
  edge(<eff>, <res>, $1,1$),
  edge(<cor>, <res>, $1,1$),
  edge(<cor>, <cha>, $0,n$),
  edge(<app>, <cha>, $1,1$),
  edge(<app>, <hot>, $0,n$)
))

À l’aide de ce modèle, répondre aux questions suivantes :
+ Peut-on avoir des clients homonymes ?
+ Un client peut-il réserver plusieurs chambres à une date donnée ?
+ Est-il possible de réserver une chambre sur plusieurs jours ?
+ Peut-on savoir si une chambre est libre à une date donnée ?
+ Peut-on réserver plusieurs fois une chambre à une date donnée ?

=== Exercice 2

On donne le modèle Entités/associations représentant des visites dans un centre médical.


#let patient = table(columns: 70pt,
  "patient", 
  underline("num_secu"), 
  "nom", 
)

#let consultation = table(
  "consultation",
  underline("id_consultation"),
  "date"
)

#let medicament = table(
  "medicament",
  underline("code"),
  "libelle"
)

#let medecin = table(columns: 70pt,
  "medecin",
  underline("matricule"),
  "nom",
)

#align(center, diagram(
  node-inset: 0pt,
  node-shape: rect,
  edge-stroke: 0.1em,
  node((0, 0), consultation, name: <con>),
  node((0, -1), shape: pill, ..association("assiste", ""), name: <ass>),
  node((2, -1), patient, name: <pat>),
  node((-2, 0), shape: pill, ..association("prescrit", "nb_prises"), name: <pre>),
  node((-2, 1), medicament, name: <medi>),
  node((2, 0), shape: pill, ..association("donne", ""), name: <don>),
  node((2, 1), medecin, name: <mede>),
  edge(<ass>, <con>, $1,1$),
  edge(<ass>, <pat>, $1,n$),
  edge(<pre>, <con>, $0,n$),
  edge(<pre>, <medi>, $0,n$),
  edge(<don>, <con>, $1,1$),
  edge(<don>, <mede>, $0,n$)
))

En utilisant ce modèle, répondre aux questions suivantes :
+ Un patient peut-il effectuer plusieurs visites ?
+ Un médecin peut-il recevoir plusieurs patients dans la même consultation ?
+ Peut-on prescrire plusieurs médicaments dans une même consultation ?
+ Deux médecins différents peuvent-ils prescrire le même médicament ?

#line(length: 100%)

_*Compétence :* Savoir passer du modèle Entités/Associations au modèle relationnel._

=== Exercice 3

Donner le schéma relationnel de la base de donnée “compagnie d’Hôtels” décrite par le modèle Entités/Associations dans l’exercice 1.

=== Exercice 4

Donner le schéma relationnel de la base de données “visites médicales” décrite par le modèle Entités/Associations dans l’exercice 2.

#line(length: 100%)

_*Compétence :* Identifier le type des données ainsi que les contraintes d’intégrité dans un modèle relationnel._

=== Exercice 5

À partir du modèle relationnel construit dans l’exercice 3, remplir le tableau ci-dessous :

#set table(stroke: 1pt)

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 2fr, 1fr, ), 
  rows: (auto, 3em, 3em, 3em),
  "Relation", "Attribut", "Type", "Unicité", "Valeur nulle permise", "Clé",
  "chambre", "nom_hotel", "", "", "", "",
  "chambre", "prix", "", "", "", "",
  "reservation", "date", "", "", "", "",
  "client", "id_client", "", "", "", ""
)

- Pour la colonne *Type*, on choisira parmi : _Entier_, _Réel_, _Texte_, _Date_.
- Pour la colonne *Unicité* et Valeur nulle permise, on répondra par _Oui_ ou _Non_.
- Pour la colonne *Clé*, on mettra _PK_ pour la clé primaire et _FK_ pour la clé étrangère ou on laissera vide.

#line(length: 100%)

_*Compétence :* Identifier les anomalies parmi les occurrences d’une relation donnée._

=== Exercice 6

On donne ci-dessous les occurrences de la relation Consultation issue du modèle relationnel construit dans l’exercice 4. Citer les anomalies constatées :

#table(
  columns: 4,
  "id_consultation", "matricule", "num_secu", "date",
  "1", "123", "", "21/11/2018",
  "2", "123", "182086926825812", "",
  "2", "526", "'Aspirine'", "13/09/2020"
)

#v(5em)
#line(length: 100%)

_*Compétence :* Convertir une relation du modèle relationnel au modèle physique_

=== Exercice 7

#grid(columns: 2, [
  Supposons que la base de données de l’exercice 4 existe dans le SGBD SQlite. 

  On a déjà écrit les requêtes suivantes pour la création des relations Patient, Médecin et Médicament.

  Donner l’écriture avec le langage SQL permettant la création des relations _consultation_ et _prescrit_.
  ], [
  ```
  CREATE TABLE patient (
      num_secu INT,
      nom TEXT,
      PRIMARY KEY(num_secu)
  )

  CREATE TABLE medecin (
      matricule INT,
      nom TEXT,
      PRIMARY KEY (matricule)
  )

  CREATE TABLE medicament (
      code INT,
      libelle TEXT,
      PRIMARY KEY (code)
  )
  ```
])

#line(length: 100%)

=== Exercice 8. Bilan

Pendant la phase de conception, toutes les donnée recueillies et spécifiées sont inscrites dans ce que l’on appelle un dictionnaire des données. On dispose du dictionnaire de données suivant :

#table(columns: 3,
  "Code de la donnée",	"Description",	"Type",
  "code_ven",	"Identifiant du vendeur",	"Entier",
  "nom_ven",	"Nom du vendeur",	"Texte",
  "ville_ven",	"Ville où travaille le vendeur",	"Texte",
  "code_cli",	"Identifiant du client",	"Entier",
  "nom_cli",	"Nom du client",	"Entier",
  "rue_cli",	"Rue où habite le client",	"Texte",
  "cp_cli",	"Code postal du client",	"Entier",
  "ville_cli",	"Ville où habite le client",	"Texte",
  "dnaiss_cli",	"Date de naissance du client",	"Date",
  "email_cli",	"Adresse mail du client",	"Texte",
  "num_fact",	"Identifiant de la facture",	"Entier",
  "date_fact",	"Date de facturation",	"Date",
  "num_prod",	"Identifiant du produit",	"Entier",
  "des_prod",	"Désignation du produit",	"Texte",
  "prix_prod",	"Prix du produit",	"Réel",
  "quantite",	"Quantité commandée",	"Entier" 
)

#set table(stroke: (x, y) => (
  if y < 2 { 1pt }
  else { (top: 0pt, bottom: 1pt, left: 1pt, right: 1pt) }
))

#let client = table(columns: 100pt,
  "client", 
  underline("code_cli"),
  "nom_cli",
  table.cell(stroke: (bottom: 0pt), "email_cli"),
)

#let facture = table(columns: 100pt,
  "facture",
  underline("num_fact"),
  "date_fact"
)

#let vendeur = table(columns: 100pt,
  "vendeur",
  underline("code_ven"), 
  table.cell(stroke: (bottom: 0pt), "ville_ven")
)

#let ex8 = align(center, diagram(
  node-inset: 0pt,
  node-shape: rect,
  edge-stroke: 0.1em,
  node((0, 0), client, name: <cli>),
  node((2, 0), shape: pill, ..association("recois", ""), name: <rec>),
  node((2, 2), facture, name: <fac>),
  node((2, 4), shape: pill, ..association("etablit", ""), name: <eta>),
  node((4, 4), vendeur, name: <ven>),
  edge(<rec>, <cli>, $0,n$),
  edge(<rec>, <fac>, $1,1$),
  edge(<eta>, <fac>, $1,1$),
  edge(<eta>, <ven>, $0,n$)
))

+ À partir de l’analyse du dictionnaire de données précédent :
  - Identifier les différentes entités en jeu ainsi que leurs identifiants
  - Les 3 associations mises en jeu par ces entités seront nommées "*établit*" "*recoit*" et "*ajoute*". Pour chacune d’entre elle, spécifier leur cardinalité et éventuellement leurs attributs.
+ Compléter les données manquantes au modèle conceptuel Entités/Associations suivant :
  #ex8
  #v(10em)
+ En déduire le modèle relationnel
+ Donner le code pour créer la relation Facture dans le SQBD SQlite en considérant que la date de facturation ne peut pas être nulle.

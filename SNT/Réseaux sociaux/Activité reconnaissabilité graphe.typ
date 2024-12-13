#import "/Templates/layouts.typ": SNT, titre, sous_titre
#import "/Templates/utils.typ": cadre, pointillets

#show: doc => SNT(doc)

#set page(header: [2#smallcaps("nde") 3 #h(1fr) 09/12/2024])

#let à_savoir = align(right, [#sym.arrow.r.curve #underline(offset: 0.15em,"À savoir !")])

#sous_titre[SNT - Réseaux Sociaux - Activité 2]
#titre[Identification des utilisateurs #linebreak() _Document Enseignant_]
/* Littérature
- https://www.sciencedirect.com/science/article/abs/pii/S002002551930756X
*/

// Matching user accounts across social sites is also called user identification, user recognition, user identity resolution, user matching, and anchor linking, the aim of which is to find identical users among different social sites.
L'identification d'utilisateurs à travers différent réseaux peut se faire grâce à différents facteurs

== Déroulement

+ Séparation de la classe en deux groupe de même taille.
+ Chaque élève reçoit une *fiche d'identité numérique* de son groupe correspondant.
+ Les deux groupes se choisissent un nom (pour l'engagement).
+ On construit ensemble les graphes de chaque groupes
  - On essaye d'identifier les premières ancre dans les 2 graphes.
  - Expliciter les attributs *unique-à-l'utilisateur*.
  - Se laisser lurer par les attributs accessible qui peuvent.
+ Une fois les graphes terminés, on essaye de trouver les utilisateurs grâce à leurs amis, on peut confirmer des choix
+ Quand tout les personnes sont identifiées, les élèves doivent répondre aux questions:
  - Quels sont les élements de l'identité numérique qui sont très fort pour identifier un utilisateur ?
  - Quels sont ceux qui ne le sont pas.
  - Comment identifier autrement les utilisateurs ?

== Graphe


#let activité(body) = [
  #pagebreak(weak: true)
  #sous_titre[SNT - Réseaux Sociaux - Activité 2]
  #titre[Identification des utilisateurs]
  L'objectif premier d'un réseau social est de connecter des utilisateurs via des liens sociaux. Ces liens sociaux sont une source d'information primordiale pour les entreprises des réseaux sociaux et arriver à associer les comptes d'un même utilisateur à travers plusieurs d'en eux a beaucoup de valeur.

  = Partie 1: Identification grâce à deux réseaux sociaux complices.

  #let consigne = [
    Voici ci-contre votre identité numérique. L'objectif va être de modéliser le réseau social dont vous appartenez afin de retrouver votre binôme dans l'autre réseau social.
    + Analysez les informations des deux réseaux (A et B).
    + Identifiez des indices pour lier les comptes des deux réseaux.
    + Complétez les correspondances sur votre fiche.
  ]

  #grid(columns: (1fr, 1fr), consigne, rect(width: 100%, height: 150pt, [
    #align(center, [== _Votre identité numérique_])

    #body
  ]))

  #table(columns: (1fr, 1fr, 4fr),
  [Utilisateur du réseau A], [Utilisateur du réseau B], [Comment les avez-vous-identifié ?],
  [#v(2em)], [], [],
  [#v(2em)], [], [],
  [#v(2em)], [], [],
  [#v(2em)], [], [],
  [#v(2em)], [], [],
  [#v(2em)], [], [],
  [#v(2em)], [], [],
  [#v(2em)], [], [],
  [#v(2em)], [], [],
  [#v(2em)], [], [],
  )
=== 1. Quels indices vous ont permis de faire des correspondances entre les utilisateurs des réseaux A et B ? Expliquez comment vous avez utilisé des informations comme les professions, centres d’intérêt, villes, ou relations d’amitié pour établir vos correspondances.

#pointillets(repeat: 4)

=== 2. Comment les relations d’amitié dans les deux réseaux vous ont-elles aidé à confirmer vos hypothèses ? Avez-vous identifié des amis communs externes ? Si oui, comment cela a influencé vos décisions ?
#pointillets(repeat: 4)
=== 3. Avez-vous trouvé des contradictions ou des informations manquantes entre les réseaux ? Si oui, comment avez-vous décidé quelles correspondances étaient les plus probables malgré ces fausses pistes ?
#pointillets(repeat: 4)
=== 4. À quel point pensez-vous qu’il est facile ou difficile d’identifier une personne entre différents réseaux sociaux en utilisant les données disponibles ? Quels facteurs rendent ce processus plus simple ou plus complexe ?
#pointillets(repeat: 4)
=== 5. Quels risques pour la vie privée cette activité illustre-t-elle dans l’utilisation des réseaux sociaux ? Quels conseils donneriez-vous pour protéger ses informations personnelles en ligne ?
#pointillets(repeat: 4)
]

#activité([
  Réseau social A

  Nom complet : Marie Dupont

Profession : Architecte

Ville : Lyon

Amis : Jean Martin, Sophie Legrand
])

#activité([
  Réseau social B

  Pseudonyme : ArchiFan69

Centre d’intérêt principal : Architecture 
et design

Amis : PixelQueen, CodeGeek75
])

#activité([
  Réseau social A
])

Utilisateur 2

    Réseau A :
        Nom complet : Jean Martin
        Profession : Développeur
        Ville : Paris
        Amis : Marie Dupont, Hugo Petit, EXTERNE : Pierre Renard
        Connexion : jean.martin.dev@gmail.com
    Réseau B :
        Pseudonyme : CodeGeek75
        Centre d’intérêt principal : Programmation
        Amis : ArchiFan69, GamerDude38, EXTERNE : BuildMaster22
        Connexion : jean.martin.dev@gmail.com

Utilisateur 3

    Réseau A :
        Nom complet : Hugo Petit
        Profession : Enseignant
        Ville : Lille
        Amis : Jean Martin, Clara Rousseau
        Connexion : hugo.petit59@gmail.com
    Réseau B :
        Pseudonyme : EduKing59
        Centre d’intérêt principal : Éducation
        Amis : PixelQueen, NewsJunkie67, EXTERNE : Alice Robert
        Connexion : hugo.petit59@gmail.com

Utilisateur 4

    Réseau A :
        Nom complet : Sophie Legrand
        Profession : Designer
        Ville : Marseille
        Amis : Marie Dupont, Emma Blanc
        Connexion : sophie.legrand.design@outlook.fr
    Réseau B :
        Pseudonyme : PixelQueen
        Centre d’intérêt principal : Graphisme et illustration
        Amis : ArchiFan69, EduKing59, ShutterQueen
        Connexion : sophie.legrand.design@outlook.fr

Utilisateur 5

    Réseau A :
        Nom complet : Léa Dubois
        Profession : Médecin
        Ville : Lyon
        Amis : Lucas Moreau, EXTERNE : Yann Lefèvre
        Connexion : lea.dubois.medecin@gmail.com
    Réseau B :
        Pseudonyme : HealthHero
        Centre d’intérêt principal : Santé et bien-être
        Amis : FoodieManiac, EXTERNE : BuildMaster22
        Connexion : lea.dubois.medecin@gmail.com

Utilisateur 6

    Réseau A :
        Nom complet : Thomas Lemoine
        Profession : Entrepreneur
        Ville : Bordeaux
        Amis : Clara Rousseau
        Connexion : thomas.lemoine@startupworld.com
    Réseau B :
        Pseudonyme : BizMaster33
        Centre d’intérêt principal : Startups
        Amis : NewsJunkie67, EXTERNE : Pierre Renard
        Connexion : thomas.lemoine@startupworld.com

Utilisateur 7

    Réseau A :
        Nom complet : Emma Blanc
        Profession : Photographe
        Ville : Nantes
        Amis : Sophie Legrand, Lucas Moreau, Paul Girard
        Connexion : login via Instagram (emma.blanc.photo)
    Réseau B :
        Pseudonyme : ShutterQueen
        Centre d’intérêt principal : Photographie
        Amis : PixelQueen, GamerDude38
        Connexion : login via Instagram (emma.blanc.photo)

Utilisateur 8

    Réseau A :
        Nom complet : Lucas Moreau
        Profession : Chef
        Ville : Toulouse
        Amis : Emma Blanc, Léa Dubois, EXTERNE : Alice Robert
        Connexion : lucas.moreau.cuisine@gmail.com
    Réseau B :
        Pseudonyme : FoodieManiac
        Centre d’intérêt principal : Cuisine
        Amis : HealthHero, ShutterQueen
        Connexion : lucas.moreau.cuisine@gmail.com

Utilisateur 9

    Réseau A :
        Nom complet : Clara Rousseau
        Profession : Journaliste
        Ville : Strasbourg
        Amis : Hugo Petit, Thomas Lemoine, EXTERNE : Yann Lefèvre
        Connexion : clara.rousseau.news@gmail.com
    Réseau B :
        Pseudonyme : NewsJunkie67
        Centre d’intérêt principal : Actualité
        Amis : EduKing59, BizMaster33, EXTERNE : Alice Robert
        Connexion : clara.rousseau.news@gmail.com

Utilisateur 10

    Réseau A :
        Nom complet : Paul Girard
        Profession : Étudiant
        Ville : Grenoble
        Amis : Emma Blanc, EXTERNE : Yann Lefèvre
        Connexion : paul.girard@etudiant.fr
    Réseau B :
        Pseudonyme : GamerDude38
        Centre d’intérêt principal : Jeux vidéo
        Amis : CodeGeek75, ShutterQueen
        Connexion : paul.girard@etudiant.fr
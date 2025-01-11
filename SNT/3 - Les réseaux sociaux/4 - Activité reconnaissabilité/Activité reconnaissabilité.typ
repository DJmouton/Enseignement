#import "/Templates/layouts.typ": SNT, titre, sous_titre
#import "/Templates/utils.typ": cadre, pointillets

#show: doc => SNT(doc)

#let à_savoir = align(right, [#sym.arrow.r.curve #underline(offset: 0.15em,"À savoir !")])


#sous_titre[SNT - Réseaux Sociaux - Activité 3]
#titre[Reconnaissabilité des utilisateurs]
#v(1em)


Dans cette activité, nous allons essayer de retrouver des utilisateurs présents sur 2 réseaux sociaux différents à l'aide d'informations limitées.

Vous travaillez pour un réseau  social, votre première tâche est de schématiser les utilisateurs et leur relations. Ensuite, vous travaillerez avec un autre réseau social pour associer les utilisateurs de votre réseau social à ceux du leur.


=== 1. En groupe, construisez le schéma de votre réseau social à l'aide des fiches utilisateur dont vous disposez. Ce schéma doit contenir clairement l'identifiant des l'utilisateur ainsi que les relations entre ces utilisateurs. #linebreak() a. Comment allez-vous représenter les utilisateurs et leur relations dans le schéma ?

#pointillets(repeat: 2)

=== b. Réalisez le schéma du réseau social de votre groupe.

#rect(
    width: 100%, 
    height: 1fr, 
    radius: 10pt,
)

=== 2. Après avoir mis en commun avec l'autre groupe au tableau, dessiner ici le schéma du réseau social de l'autre groupe.

#rect(
    width: 100%, 
    height: 1fr, 
    radius: 10pt,
)

#pagebreak()

=== 3. Remplissez le tableau en cherchant des moyens de faire correspondre les utilisateurs des deux réseaux ensemble. Chaque utilisateur a un équivalent dans l'autre réseau.

#let s = 2.5em

#table(
    columns: (1fr, 1fr, 3fr),
    rows: (auto,s,s,s,s,s,s,s,s,s),
    [*Nom d'utilisateur dans le réseau social A*],
    [*Nom d'utitisateur dans le réseau social B*],
    [*Raisons pour prouve que ce sont les mêmes utilisateurs.*]
)

=== 4. Quels indices avez-vous utilisés pour faire correspondre les utilisateurs d'un réseau social à l'autre ? Lesquels ont été les plus efficace ?

#pointillets(repeat: 4)

#à_savoir

=== 5. Avez-vous trouvé des contradictions ou des informations manquantes entre les réseaux sociaux ? Si oui, comment avez-vous choisi quelle piste choisir ?

#pointillets(repeat: 3)

=== 6. Quels risques pour la vie privée cette activité illustre-t-elle dans l'utilisations des réseaux sociaux ? Quels conseils donneriez-vous pour protéger ses informations personnels en ligne ?

#pointillets(repeat: 5)

#à_savoir

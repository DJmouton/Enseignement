#import "/Templates/layouts.typ": SNT, titre, sous_titre
#import "/Templates/utils.typ": cadre, pointillets, correction

#show: doc => SNT(doc)

#sous_titre("NSI - Conception et programmation - Devoir Maison")
#v(-0.5em)
#titre("Identifier et corriger\nles erreurs dans un code")

==  *Introduction *
Dans ce devoir maison, vous allez travailler sur un code imparfait modélisant un système bancaire simple. Votre mission est de détecter les erreurs dans le code, de proposer des correctifs et d’écrire des tests permettant de vérifier que les modifications apportées fonctionnent correctement.

==  *Consignes *

===  *1. Analyse du code *
- Identifiez les erreurs ou problèmes potentiels dans le code fourni.
- Pour chaque problème identifié, expliquez pourquoi il est problématique et proposez une solution pour le corriger.
- Vous devez évaluer aussi bien la logique des méthodes que la cohérence globale des interactions entre les classes.

===  *2. Écriture des tests *
- Utilisez le module Python `unittest` pour écrire des tests unitaires.
- Écrivez au moins 8 tests couvrant les points suivants :
  - Dépôts et retraits sur un compte bancaire.
  - Transferts entre comptes, y compris les cas limites (par exemple : solde insuffisant, montant nul ou négatif).
  - Ajout et suppression de comptes dans la banque.
  - Calcul du total des actifs.

===  *3. Justification des modifications *
- Une fois les erreurs corrigées, expliquez les changements apportés et leur impact sur le fonctionnement du code.
- Votre justification doit être claire et montrer que vous comprenez pourquoi chaque correction était nécessaire.

 

==  *Livrables *
Vous devez rendre un fichier comprenant :
1. Une section « Analyse des erreurs » listant les problèmes trouvés et les solutions proposées.
2. Une section « Tests unitaires » avec vos tests (pas besoin de copier tout le code), et le fichier .py dans lequel vous les avez écrits
3. Une section « Corrections apportées » expliquant les modifications effectuées dans le code.


==  *Critères d’évaluation *
Votre travail sera évalué selon les critères suivants :

1.  *Identification des erreurs (6 points) * :
   - Pertinence des erreurs identifiées.
   - Clarté des explications fournies.

2.  *Qualité des tests unitaires (8 points) * :
   - Nombre de tests écrits et cas couverts.
   - Efficacité des tests pour détecter les erreurs.

3.  *Justification des corrections (6 points) * :
   - Cohérence des corrections apportées.
   - Qualité des explications et impact des modifications.


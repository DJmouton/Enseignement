class CompteBancaire:
    def __init__(self, titulaire, solde_initial=0):
        self.titulaire = titulaire
        self.solde = solde_initial

    def deposer(self, montant):
        self.solde = self.solde + montant

    def retirer(self, montant):
        self.solde = self.solde - montant

    def afficher_solde(self):
        return f"{self.titulaire}: {self.solde} €"


class Banque:
    def __init__(self):
        self.comptes = []

    def ajouter_compte(self, compte):
        self.comptes.append(compte)

    def supprimer_compte(self, titulaire):
        for compte in self.comptes:
            if compte.titulaire == titulaire:
                self.comptes.remove(compte)

    def transferer(self, titulaire_source, titulaire_cible, montant):
        source = None
        cible = None
        for compte in self.comptes:
            if compte.titulaire == titulaire_source:
                source = compte
            if compte.titulaire == titulaire_cible:
                cible = compte

        source.retirer(montant)
        cible.deposer(montant)

    def afficher_tous_les_comptes(self):
        comptes_str = []
        for compte in self.comptes:
            comptes_str.append(compte.afficher_solde())
        return "\n".join(comptes_str)

    def total_actifs(self):
        total = 0
        for compte in self.comptes:
            total += compte.solde
        return total

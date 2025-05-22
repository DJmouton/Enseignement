import csv

chemin_carte = "DATA/CARTE_I2C_LM75.csv"

carte_i2c_lm75 = []

with open(chemin_carte, newline="", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    for ligne in reader:
        carte_i2c_lm75.append(ligne)


def exercice1():
    resistances = []
    for ligne in carte_i2c_lm75:
        if ligne["Category"] == "Resistors":
            resistances.append(ligne)
    return resistances


def exercice2():
    valeurs = []
    for ligne in carte_i2c_lm75:
        valeur = ligne["Value"]
        if valeur not in valeurs:
            valeurs.append(valeur)
    return valeurs


def exercice3():
    quantité = {}
    for ligne in carte_i2c_lm75:
        valeur = ligne["Value"]
        if valeur not in quantité.keys():
            quantité[valeur] = 0
        quantité[valeur] += 1
    return quantité


chemin_catalogue = "CATALOGUE PRIX COMPOSANTS.csv"

catalogue = []

with open(chemin_catalogue, newline="", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    for ligne in reader:
        catalogue.append(ligne)


if __name__ == "__main__":
    print("\n> Exercice 1")
    for ligne in exercice1():
        print(ligne)
    print("\n> Exercice 2")
    print(exercice2())
    print("\n> Exercice 3")
    print(exercice3())

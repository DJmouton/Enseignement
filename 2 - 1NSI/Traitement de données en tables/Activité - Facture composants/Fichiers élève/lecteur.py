import csv

chemin_fichier = "DATA/CARTE_I2C_LM75.csv"

with open(chemin_fichier, newline="", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    for ligne in reader:
        print(ligne)

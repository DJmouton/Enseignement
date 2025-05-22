import folium
import csv

GRENOBLE = (45.18, 5.73)
RADIUS_SMALL = 1
RADIUS_DEFAULT = 1.5
RADIUS_BIG = 2
COLOR_YOUNG = "yellowgreen"
COLOR_DEFAULT = "forestgreen"
COLOR_OLD = "darkgreen"
OPACITY = 1
FILL_OPACITY = 0.5

map_arbres = folium.Map(GRENOBLE, zoom_start=12, prefer_canvas=True)

with open("arbres_de_grenoble.csv") as arbres_raw:
    arbres = csv.DictReader(arbres_raw)
    for arbre in arbres:
        # Check if coordonnées valides
        coordonnées = str.split(arbre["geo_point_2d"], ",")
        if "" in coordonnées:
            continue
        x = float(coordonnées[0])
        y = float(coordonnées[1])
        # Récupération des paramètres de l'arbre
        couleur: float
        match arbre["stadededeveloppement"]:
            case "Arbre jeune":
                couleur = (COLOR_YOUNG,)
            case "Arbre vieillissant":
                couleur = (COLOR_OLD,)
            case _:
                couleur = COLOR_DEFAULT
        rayon: str
        match arbre["hauteurarbre"]:
            case "Moins de 10 m":
                rayon = RADIUS_SMALL
            case "Plus de 20 m":
                rayon = RADIUS_BIG
            case _:
                rayon = RADIUS_DEFAULT
        nom_commun = arbre["nom_bota"]
        # Création du cercle
        folium.Circle(
            location=[x, y],
            radius=rayon,
            color=couleur,
            opacity=OPACITY,
            fill_color=couleur,
            fill_opacity=FILL_OPACITY,
            tooltip=nom_commun,
        ).add_to(map_arbres)

map_arbres.save("index.html")

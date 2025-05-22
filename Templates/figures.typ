#import "@preview/cetz:0.2.2"

// W.I.P.

#let figure_nombre_utilisateurs = align(
    center,
    cetz.canvas({
        import cetz.draw: circle, content

        let ratio_bulle = 0.4
        let ratio_texte = 10
        let distance_nom_utilisateurs = 0.5

        let bulle_réseau(position, utilisateurs, couleur_bulle, couleur_texte, nom) = {
            let rayon = calc.sqrt(utilisateurs / 3.14) * ratio_bulle
            let taille_texte = rayon * ratio_texte * 1pt

            circle(position, radius: rayon, stroke: 1pt, fill: couleur_bulle, name: nom)

            content(
                (nom, taille_texte * distance_nom_utilisateurs, nom + ".north"),
                text(size: taille_texte, fill: couleur_texte, [*#nom*]),
            )

            content(
                (nom, taille_texte * distance_nom_utilisateurs, nom + ".south"),
                text(size: taille_texte, fill: couleur_texte, [#utilisateurs M]),
            )
        }

        bulle_réseau((-7.2, 0), 50, blue, white, "Facebook")
        bulle_réseau((-5, -2), 46.6, red, white, "Youtube")
        bulle_réseau((-3.3, 0), 32, green, black, "Whatsapp")
        bulle_réseau((-2, -2), 30, rgb("#e6008a"), white, "Instagram")
        bulle_réseau((-0.7, -0.3), 23, rgb("#00e3e3"), black, "Tiktok")
        bulle_réseau((0.6, -1.6), 21, yellow, black, "Snapchat")
        bulle_réseau((2, -0.5), 15, luma(100), white, "X")
        bulle_réseau((3.3, -1.2), 13.5, rgb("#2bb1ff"), black, "LinkedIn")
        bulle_réseau((4.7, -0.6), 13, rgb("#c90000"), white, "Pinterest")
    }),
)

// #figure(
//     caption: "Le nombre d'abonnés des réseaux sociaux les plus utilisés en France, en 2024.",
//     figure_nombre_utilisateurs
// )


#let figure_identité_numérique(parts) = align(
    center,
    cetz.canvas({
        import cetz.draw: line, content

        content((0, 0), text(size: 45pt, emoji.person))

        let texte_ligne(
            départ: (0, 0),
            arrivée: (1, 1),
            distance_coude: 0.5,
            titre: "Titre",
            sous_titre: "sous-titre",
        ) = {
            let (x_départ, y_départ) = départ
            let (x_arrivée, y_arrivée) = arrivée

            line(
                départ,
                (x_départ + distance_coude, y_départ),
                (x_départ + distance_coude, y_arrivée),
                arrivée,
                stroke: 0.5pt,
                name: "ligne",
            )

            let orientation = "east"
            if (x_départ - x_arrivée < 0) { orientation = "west" }

            content(
                "ligne.end",
                anchor: "south-" + orientation,
                rect(stroke: none, inset: 3pt, text(size: 10pt, weight: "bold", titre)),
            )
            content(
                "ligne.end",
                anchor: "north-" + orientation,
                rect(stroke: none, inset: 2pt, text(size: 8pt, sous_titre)),
            )
        }

        let décallage_départ = 1
        let coude_base = 1
        let longueur = 3.5
        let interligne = 0.15
        let séparation_verticale = 1

        for part in parts { }
    }),
)

#let parts = (
    ("Réputation", "ce que l'on dit sur moi"),
    ("kk", "kkl"),
)

/*

    // Gauche
    texte_ligne(départ: (- décallage_départ, interligne * 2), arrivée: (- longueur, (séparation_verticale + interligne) * 2), distance_coude: - coude_base,
        titre: "Réputation",
        sous_titre: "ce que l'on dit sur moi"
    )

    texte_ligne(départ: (- décallage_départ, interligne), arrivée: (- longueur, séparation_verticale + interligne), distance_coude: - (coude_base + interligne),
        titre: "Expression",
        sous_titre: "ce que je dis"
    )

    texte_ligne(départ: (- décallage_départ, 0), arrivée: (- longueur, 0), distance_coude: - coude_base,
        titre: "Réseau",
        sous_titre: "qui je connais"
    )

    texte_ligne(départ: (- décallage_départ, - interligne), arrivée: (- longueur, - (séparation_verticale + interligne)), distance_coude: - (coude_base + interligne),
        titre: "Certification",
        sous_titre: "qui peut certifier mon identité"
    )

    texte_ligne(départ: (- décallage_départ, - interligne * 2), arrivée: (- longueur, - (séparation_verticale + interligne) * 2), distance_coude: - coude_base,
        titre: "Achat",
        sous_titre: "ce que j'achète"
    )

    // Droite
    texte_ligne(départ: (décallage_départ, interligne * 2), arrivée: (longueur, (séparation_verticale + interligne) * 2), distance_coude: coude_base,
        titre: "Opinion",
        sous_titre: "ce que je pense"
    )

    texte_ligne(départ: (décallage_départ, interligne), arrivée: (longueur, séparation_verticale + interligne), distance_coude: coude_base + interligne,
        titre: "Savoir",
        sous_titre: "ce que je sais"
    )

    texte_ligne(départ: (décallage_départ, 0), arrivée: (longueur, 0), distance_coude: coude_base,
        titre: "Hobbies",
        sous_titre: "ce que j'aime"
    )

    texte_ligne(départ: (décallage_départ, - interligne), arrivée: (longueur, - (séparation_verticale + interligne)), distance_coude: coude_base + interligne,
        titre: "Avatar",
        sous_titre: "comment je me montre"
    )

    texte_ligne(départ: (décallage_départ, - interligne * 2), arrivée: (longueur, - (séparation_verticale + interligne) * 2), distance_coude: coude_base,
        titre: "Profession",
        sous_titre: "quel est mon métier et où je travaille"
    )

20
#figure(
    caption: "Les parties de l'identité numérique.",
    figure_identité_numérique(parts)
)

*/

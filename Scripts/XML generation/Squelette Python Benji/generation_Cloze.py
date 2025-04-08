#!/usr/bin/python3

from base_generation import *
from random import randint
CATEGORY = "Exercice Ordre de Grandeur"

def generer_question(mot, o):
    print('  <questiontext format="html">\n    <text><![CDATA[')
    # TODO : Texte (et trous) de la question
    print(f"Combien de chiffres dans {mot} ? {{:SA:={o}}}")
    print('    ]]></text>\n   </questiontext>')

if __name__ == "__main__":
    if len(sys.argv)<2 :
        print('usage :', sys.argv[0], 'number_of_questions', file=sys.stderr)
        exit(1)
    n = int(sys.argv[1])
    print(ENTETE.format(CATEGORY=CATEGORY))
    for i in range(n):
        # TODO : tirage aléatoire des éléments de la question
        o = randint(1, 10)
        mot = ""
        for _ in range(o):
            mot += str(randint(0, 9))
        cible = mot
        mot = int(mot)
        print(f"""<question type="cloze">
  <name><text>{CATEGORY} version {i} (réponse {o})</text>
  </name>""")
        generer_question(cible, o)

        # Feedback général, à compléter si besoin
        print("""  <generalfeedback>
          <text></text>
          </generalfeedback>""")

        print('  <penalty>0.0000000</penalty>')
        # Autant de hint qu'on veut laisser d'essais
        hint( "Raté, essayez encore." )
        hint( "Vous pouvez passer la souris sur la réponse pour avoir un indice.", show=True)
        hint( "Dernière chance, vos réponses incorrectes vont être effacées.", clear=True)

        # Mélange des réponses ?
        print('  <shuffleanswers>0</shuffleanswers>')
        print('</question>')
    print('</quiz>')

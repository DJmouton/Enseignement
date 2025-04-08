#!/usr/bin/python3

from base_generation import *

CATEGORY = "Exercice mot"

import string

def generer_question(mot):
    print('  <questiontext format="html">\n    <text><![CDATA[')
    print(f'Voici un mot sur l\'alphabet usuel : {mot}.')
    print('Quelle est sa lettre la plus petite dans l\'ordre alphabétique ?')
    lmin = min(mot)
    print(f'{{:SA:={lmin}'
          + "".join([f'~{l}#Cette lettre est dans le mot mais ce n\'est pas la plus petite' for l in mot if l!=lmin])
          + '~*#Cette lettre n\'est même pas dans le mot !'+'}')
    print('    ]]></text>\n  </questiontext>')

if __name__ == "__main__":
    if len(sys.argv)<2 :
        print('usage :', sys.argv[0], 'number_of_questions', file=sys.stderr)
        exit(1)
    n = int(sys.argv[1])
    print(ENTETE.format(CATEGORY=CATEGORY))
    for i in range(n):
        mot = "".join([random.choice(string.ascii_lowercase) for k in range(random.randint(6,12))])
        print(f"""<question type="cloze">
  <name><text>{CATEGORY} version {i} (mot {mot})</text>
  </name>""")
        generer_question(mot)

        print("""  <generalfeedback>
          <text></text>
          </generalfeedback>""")

        print('  <penalty>0.0000000</penalty>')
        hint( "Raté, essayez encore." )
        hint( "Vous pouvez passer la souris sur la réponse pour avoir un indice.", show=True)
        hint( "Dernière chance, vos réponses incorrectes vont être effacées.", clear=True)

        print('  <shuffleanswers>0</shuffleanswers>')
        print('</question>')
    print('</quiz>')

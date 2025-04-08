#!/usr/bin/python3

from base_generation import *

CATEGORY = "Exercice devinette"
MAX=100

def generer_question(n):
    print('  <questiontext format="html">\n    <text><![CDATA[')
    print(f'Je pense à un nombre entre 1 et {MAX}.')
    print('Pouvez-vous le deviner ?')
    print(f'{{:NM:={n}:0.1'
          + f'~{n//2}:{n//2+.5}#Trop petit !'
          + '~*#Trop grand !'+'}')
    print('    ]]></text>\n  </questiontext>')

    
if __name__ == "__main__":
    if len(sys.argv)<2 :
        print('usage :', sys.argv[0], 'number_of_questions', file=sys.stderr)
        exit(1)
    n = int(sys.argv[1])
    print(ENTETE.format(CATEGORY=CATEGORY))
    for i in range(n):
        cible = random.randint(1,MAX)
        print(f"""<question type="cloze">
  <name><text>{CATEGORY} version {i} (réponse {cible})</text>
  </name>""")
        generer_question(cible)

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

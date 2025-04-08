import sys
import random

# Quelques fonctions utilitaires
def ask(val):
    """à utiliser dans une table, voir fonction ask_mat"""
    # {{ et }} permettent d'écrire des accolades avec format
    return f'<td>{{:NM:={str(val)}:0,01}}</td>'
    
def ask_mat(A):
    """A est la matrice des réponses (numériques) attendues"""
    print('<table style="display:inline">')
    for row in A:
        print('<tr>', ''.join(map(ask,row)), '</tr>')
    print('</table>')    

def ouinon(question, answer):
    """à utiliser dans une liste HTML"""
    return (f'<li>{question}'
            + ('{:MCH:=oui~non}' if answer else '{:MCH:oui~=non}')
            + '</li>')

ENTETE = """<?xml version="1.0" encoding="UTF-8"?>\n<quiz>
<question type="category">
  <category>
    <text>$module$/{CATEGORY}</text>
  </category>
</question>"""
HINT = """  <hint format="html"><text><![CDATA[
{hint}
  ]]></text>{show}{clear}</hint>"""

def hint(h, show=False, clear=False):
    # Pour accompagner certains indices (dans les balises <hint>) :
    # print('<shownumcorrect/>') # affiche le nombre de réponses correctes
    # print('<clearwrong/>') # efface les réponses erronnées
    print(HINT.format(hint=h,
                      show="<shownumcorrect/>" if show else "",
                      clear="<clearwrong/>" if clear else ""))


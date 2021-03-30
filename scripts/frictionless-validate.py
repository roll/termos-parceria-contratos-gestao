from frictionless import extract
rows = extract('data/termos-parceria-contratos-gestao.csv')

file = open('data/termos-parceria-contratos-gestao.csv', encoding = "utf-8")
print(file.read())

from pprint import pprint
from frictionless import describe

resource = describe('data/termos-parceria-contratos-gestao.csv')
pprint(resource)

from pprint import pprint

pprint(rows)

from pprint import pprint
from frictionless import validate

report = validate('data/termos-parceria-contratos-gestao.csv')
pprint(report.flatten(["rowPosition", "fieldPosition", "code"]))


from frictionless import Package

dp = Package('datapackage.json')

for resource in dp.resource_names:
    dp.get_resource(resource).schema.expand()
    dp.get_resource(resource).dialect.expand()

dp.to_json('build/datapackage.json')

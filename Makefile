.PHONY: help publish

#====================================================================
# PHONY TARGETS

help: 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

expand: ## Extrai metadados armazenados em arquivos externos e exporta datapackage.json para buid/
	python scripts/expand-metadata.py

update:
	dpckan resource update --resource-name termos-parceria-contratos-gestao --resource-id f66ad9dc-090a-4c0f-9da0-def65046e4b7
	dpckan resource update --resource-name aditivos --resource-id 0644f029-4bc7-4647-904a-c59d2d5fd1ee
	dpckan resource update --resource-name repasses --resource-id 87f51195-abfc-4bc1-a968-84dc07f92ddb
	dpckan resource update --resource-name relatorios --resource-id 5717dd1b-4b30-4198-850e-051168bfca92
.PHONY: help publish

#====================================================================
# PHONY TARGETS

help: 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

expand: ## Extrai metadados armazenados em arquivos externos e exporta datapackage.json para buid/
	python scripts/expand-metadata.py

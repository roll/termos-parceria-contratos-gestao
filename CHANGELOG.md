# CHANGELOG

Arquivo para documentação das principais alterações sofridas por este conjunto de dados.

O histórico completo das alterações está disponível [aqui](https://github.com/dados-mg/termos-parceria-contratos-gestao/commits/master).

## Junho/2021

- Representação das informações do conjunto de dados em 4 arquivos, com identificação única de cada termo de parceria e/ou contrato de gestão realizada pela coluna `ID_INSTRUMENTO`, presente em todos os arquivos.

- Redistribuição das informações constantes da versão anterior deste conjunto de dados entre os arquivos `termos-parceria-contratos-gestao` e `repasses`, conforme quadro abaixo:

    | Coluna Anterior|	Nova coluna |	Arquivo |
    | --            |   --             | --            |
    |TIPO_INSTRUMENTO|	sem alteração|	termos-parcerias-contratos-gestao|
    |NUM_TERMO_CONTRATO|	sem alteração|	termos-parcerias-contratos-gestao|
    |CODIGO_ORGAO_ESTATAL|	ORGAO_ESTATAL_CODIGO|	termos-parcerias-contratos-gestao|
    |NOME_ORGAO_ESTATAL|	ORGAO_ESTATAL_NOME|	termos-parcerias-contratos-gestao|
    |ORGAO_ESTATAL_SIGLA|	sem alteração|	termos-parcerias-contratos-gestao|
    |ENTIDADE_PARCEIRA_NOME|	sem alteração|	termos-parcerias-contratos-gestao|
    |ENTIDADE_PARCEIRA_SIGLA|	sem alteração|	termos-parcerias-contratos-gestao|
    |ENTIDADE_PARCEIRA_CNPJ|	sem alteração|	termos-parcerias-contratos-gestao|
    |OBJETO|	sem alteração|	termos-parcerias-contratos-gestao|
    |SITUACAO|	sem alteração|	termos-parcerias-contratos-gestao|
    |DATA_INICIO_VIGENCIA|	sem alteração|	termos-parcerias-contratos-gestao|
    |DATA_FIM_VIGENCIA|	sem alteração|	termos-parcerias-contratos-gestao|
    |ANO|	sem alteração|	repasses|
    |REPASSE_PREVISTO|	sem alteração|	repasses|
    |REPASSE_REALIZADO|	sem alteração|	repasses|

-  Inserção, no arquivo `termos-parceria-contratos-gestao`, das colunas:
	- `URL_INTEGRA_TERMO_CONTRATO`: Link para acessar o Contrato de Gestão ou Termo de Parceria;
	- `URL_DOCUMENTOS_TERMO_CONTRATO`: Link para acessar a página principal contendo os documentos do Contrato de Gestão ou Termo de Parceria.

- Inserção, no arquivo `relatorios`, de informações sobre os relatórios das comissões de avaliação, os relatórios de monitoramento e os relatórios gerenciais.

- Inserção, no arquivo `aditivos`, de informações sobre os termos termos aditivos celebrados.

## Novembro/2019

- Publicação da versão inicial do conjunto de dados
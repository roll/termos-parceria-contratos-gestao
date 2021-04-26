library(data.table); library(dplyr); library(daff); library(glue)

source("scripts/utils.R")

## adequacoes gerais para comparabilidade do conjunto atual

v1_raw <- fread("data/termos-parceria-contratos-gestao-abril21.csv", sep = ";", dec = ",")

v1 <- v1_raw %>% 
  arrange(TIPO_INSTRUMENTO, NUM_TERMO_CONTRATO) %>% 
  rename(ORGAO_ESTATAL_CODIGO = CODIGO_ORGAO_ESTATAL, ORGAO_ESTATAL_NOME = NOME_ORGAO_ESTATAL) %>% 
  mutate(TIPO_INSTRUMENTO = ifelse(TIPO_INSTRUMENTO == "Contratos de Gestão", "Contrato de Gestão", "Termo de Parceria")) %>% 
  mutate(NUM_TERMO_CONTRATO = standardize_num_termo_contrato(NUM_TERMO_CONTRATO)) %>% 
  mutate(ID_INSTRUMENTO = ifelse(TIPO_INSTRUMENTO == "Contrato de Gestão", glue("CG_{NUM_TERMO_CONTRATO}"), glue("TP_{NUM_TERMO_CONTRATO}")), .before = TIPO_INSTRUMENTO) %>% 
  mutate(DATA_INICIO_VIGENCIA = date_conversion(DATA_INICIO_VIGENCIA)) %>% 
  mutate(DATA_FIM_VIGENCIA = date_conversion(DATA_FIM_VIGENCIA))
  
v1_instrumentos <- v1 %>% 
  distinct(TIPO_INSTRUMENTO, NUM_TERMO_CONTRATO, ORGAO_ESTATAL_CODIGO, ORGAO_ESTATAL_NOME, ORGAO_ESTATAL_SIGLA, ENTIDADE_PARCEIRA_NOME, ENTIDADE_PARCEIRA_SIGLA, ENTIDADE_PARCEIRA_CNPJ, OBJETO, SITUACAO, DATA_INICIO_VIGENCIA, DATA_FIM_VIGENCIA)

v1_repasses <- v1 %>% 
        select(ID_INSTRUMENTO, ANO, REPASSE_PREVISTO, REPASSE_REALIZADO) %>% 
        arrange(ID_INSTRUMENTO, ANO)

## adequacoes gerais para comparabilidade do novo conjunto

v2_raw <- fread("data/termos-parceria-contratos-gestao.csv", sep = ";", dec = ",")

v2_instrumentos <- v2_raw %>% 
            select(-URL_INTEGRA_TERMO_CONTRATO, -URL_DOCUMENTOS_TERMO_CONTRATO) %>% 
            arrange(TIPO_INSTRUMENTO, NUM_TERMO_CONTRATO)

v2_repasses <- fread("data/repasses.csv", sep = ";", dec = ",") %>% 
                select(-OBSERVACOES) %>% 
                arrange(ID_INSTRUMENTO, ANO)

## diff entre os conjuntos

diff_instrumentos <- diff_data(v1_instrumentos, v2_instrumentos, ids = "ID_INSTRUMENTO")

render_diff(diff_instrumentos)

diff_repasses <- diff_data(v1_repasses, v2_repasses, ids = c("ID_INSTRUMENTO", "ANO"))

render_diff(diff_repasses)

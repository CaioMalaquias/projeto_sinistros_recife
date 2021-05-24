
# Bibliotecas -------------------------------------------------------------
library(rio)

# Registro da API do Google -----------------------------------------------
# API <- "A API foi inserida aqui"
# register_google(key = API)

# Carrega Base de Sinistros -----------------------------------------------
# Base de Sinistros disponível na página da Prefeitura da Cidade do Recife
# www.recife.pe.gov.br

# Base 2016
sinistrosRecife2016Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2016-jan.csv', sep = ';', encoding = 'UTF-8')
# Base 2017
sinistrosRecife2017Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2017-jan.csv', sep = ';', encoding = 'UTF-8')
# Base 2018
sinistrosRecife2018Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2018-jan.csv', sep = ';', encoding = 'UTF-8')
# Base 2019
sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2019-jan.csv', sep = ';', encoding = 'UTF-8')
# Base 2020
sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')
# Base 2021
sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')


# Join das Bases ----------------------------------------------------------
# junta as bases de dados linha a linha
sinistrosRecife <- rbind(sinistrosRecife2016Raw,
                            sinistrosRecife2017Raw,
                            sinistrosRecife2018Raw,
                            sinistrosRecife2019Raw,
                            sinistrosRecife2020Raw,
                            sinistrosRecife2021Raw)

# Limpando a staging area
rm(list=setdiff(ls(), "sinistrosRecife"))
# Exportando
export(sinistrosRecife, "bases_tratadas/sinistrosRecife.rds")
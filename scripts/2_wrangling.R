
# Bibliotecas -------------------------------------------------------------
library(tidyverse)
library(ggmap)

# Cria uma variavel de endereço completo, com nome da rua, numero, bairro,
# cidade e estado, tornando os endereços únicos (chave)
sinistrosRecife <-
sinistrosRecife %>%
  mutate(enderecoCompleto = paste(endereco, numero, bairro,
                                  "Recife - Pernambuco", sep = ", "))

# Registro da API do Google -----------------------------------------------
API <- "API inserida aqui"
register_google(key = API)


# Enriquecendo Latitudes e Longitudes -------------------------------------
# coleta, via API da Google, as latitudes e longitudes dos endereços
# da base de dados sinistrosRecife

for(i in 1:nrow(sinistrosRecife)){
  # O tryCatch abaixo resolve o problema dos erros específicos que ocorrem
  # nos casos 973, 1840, 2022, 2358, 2505, 3897, 4139, 4387, e 4549
  result <- tryCatch(geocode(sinistrosRecife$enderecoCompleto[i],
                             output = "latlon",
                             source = "google",
                             region = "BR"),
                     warning = function(w) data.frame(lon = NA, lat = NA))
  sinistrosRecife$lon[i] <- as.numeric(result[1]) # aloca na nova coluna
  sinistrosRecife$lat[i] <- as.numeric(result[2]) # aloca na nova coluna
}

# Cria arquivo .rds
rio::export(sinistrosRecife, "bases_tratadas/sinistrosRecife.rds")


# Bibliotecas -------------------------------------------------------------
library(tidyverse)
library(sf)

# Geocode dos Endereços ---------------------------------------------------
# sinistrosGeocode <- data.frame(stringsAsFactors = FALSE)

# coleta, via API da Google, as latitudes e longitudes dos endereços
# da base de dados sinistrosRecife
 
for(i in 1:nrow(sinistrosRecife)){
  # O tryCatch abaixo resolve o problema dos erros específicos que ocorrem
  # nos casos 973, 1840, 2022, 2358, 2505, 3897, 4139, 4387, e 4549
  result <- tryCatch(geocode(sinistrosRecife$endereco[i],
                             output = "latlon",
                             source = "google",
                             region = "BR"),
                     warning = function(w) data.frame(lon = NA, lat = NA))
  sinistrosRecife$lon[i] <- as.numeric(result[1]) # aloca na nova coluna
  sinistrosRecife$lat[i] <- as.numeric(result[2]) # aloca na nova coluna
}

# Cria arquivo .rds
export(sinistrosRecife, "bases_tratadas/sinistrosRecife.rds")

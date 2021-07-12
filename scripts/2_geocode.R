
# Bibliotecas -------------------------------------------------------------
install.packages(c("rio", "tidyverse", "sf", "ggmap"))
library(rio)
library(tidyverse)
library(sf)
library(ggmap)

# Geocode dos Endereços ---------------------------------------------------
# sinistrosGeocode <- data.frame(stringsAsFactors = FALSE)

# Loop through the addresses to get the latitude and longitude of each address and add it to the
# origAddress data frame in new columns lat and lon
for(i in 1:nrow(sinistrosRecife)){
  result <- tryCatch(geocode(sinistrosRecife$endereco[i],
                             output = "latlon",
                             source = "google",
                             ext = "com.br"),
                     warning = function(w) data.frame(lon = NA, lat = NA, address = NA))
  sinistrosRecife$lon[i] <- as.numeric(result[1])
  sinistrosRecife$lat[i] <- as.numeric(result[2])
  sinistrosRecife$geoAddress[i] <- as.character(result[3])
}
sinistrosRecife972 <- sinistrosRecife
# o 973 deu erro
for(i in 974:nrow(sinistrosRecife)){
  result <- geocode(sinistrosRecife$endereco[i], output = "latlona", source = "google")
  sinistrosRecife$lon[i] <- as.numeric(result[1])
  sinistrosRecife$lat[i] <- as.numeric(result[2])
  sinistrosRecife$geoAddress[i] <- as.character(result[3])
}
# o 1840 deu erro
for(i in 1841:nrow(sinistrosRecife)){
  result <- geocode(sinistrosRecife$endereco[i], output = "latlona", source = "google")
  sinistrosRecife$lon[i] <- as.numeric(result[1])
  sinistrosRecife$lat[i] <- as.numeric(result[2])
  sinistrosRecife$geoAddress[i] <- as.character(result[3])
}
sinistrosRecife1841_2021 <- sinistrosRecife # o 2022 deu erro
#r o 2022 deu erro
for(i in 2023:nrow(sinistrosRecife)){
  result <- geocode(sinistrosRecife$endereco[i], output = "latlona", source = "google")
  sinistrosRecife$lon[i] <- as.numeric(result[1])
  sinistrosRecife$lat[i] <- as.numeric(result[2])
  sinistrosRecife$geoAddress[i] <- as.character(result[3])
}
# o 2358 deu erro
for(i in 2359:nrow(sinistrosRecife)){
  result <- geocode(sinistrosRecife$endereco[i], output = "latlona", source = "google")
  sinistrosRecife$lon[i] <- as.numeric(result[1])
  sinistrosRecife$lat[i] <- as.numeric(result[2])
  sinistrosRecife$geoAddress[i] <- as.character(result[3])
}
# o 2505 deu erro
for(i in 2506:nrow(sinistrosRecife)){
  result <- geocode(sinistrosRecife$endereco[i], output = "latlona", source = "google")
  sinistrosRecife$lon[i] <- as.numeric(result[1])
  sinistrosRecife$lat[i] <- as.numeric(result[2])
  sinistrosRecife$geoAddress[i] <- as.character(result[3])
}
# o 3897 deu erro
for(i in 3898:nrow(sinistrosRecife)){
  result <- geocode(sinistrosRecife$endereco[i], output = "latlona", source = "google")
  sinistrosRecife$lon[i] <- as.numeric(result[1])
  sinistrosRecife$lat[i] <- as.numeric(result[2])
  sinistrosRecife$geoAddress[i] <- as.character(result[3])
}
# o 4139 deu erro
for(i in 4140:nrow(sinistrosRecife)){
  result <- geocode(sinistrosRecife$endereco[i], output = "latlona", source = "google")
  sinistrosRecife$lon[i] <- as.numeric(result[1])
  sinistrosRecife$lat[i] <- as.numeric(result[2])
  sinistrosRecife$geoAddress[i] <- as.character(result[3])
}
# o 4387 deu erro
for(i in 4388:nrow(sinistrosRecife)){
  result <- geocode(sinistrosRecife$endereco[i], output = "latlona", source = "google")
  sinistrosRecife$lon[i] <- as.numeric(result[1])
  sinistrosRecife$lat[i] <- as.numeric(result[2])
  sinistrosRecife$geoAddress[i] <- as.character(result[3])
}
# o 4549 deu erro
for(i in 4550:nrow(sinistrosRecife)){
  result <- geocode(sinistrosRecife$endereco[i], output = "latlona", source = "google")
  sinistrosRecife$lon[i] <- as.numeric(result[1])
  sinistrosRecife$lat[i] <- as.numeric(result[2])
  sinistrosRecife$geoAddress[i] <- as.character(result[3])
}
# Cria arquivo .Rdata
export(sinistrosRecife, "bases_tratadas/sinistrosRecife.rds")
export(sinistrosRecife, "Projeto.Rdata")

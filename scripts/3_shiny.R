library(shiny)
library(shinythemes)
library(leaflet)
library(tidyverse)


a<- readRDS("C:/Users/quemu/Downloads/sinistros_latlon.rds")
#construção da user interface
ui <- fluidPage(theme = shinytheme("cosmo"),
                navbarPage("Sinistros Recife",
                tabPanel("Sinistros Recife",
                         
                           top = 60, left = "auto", right = 20, bottom = "auto",
                           width = 330, height = "auto",draggable = TRUE,
                           style = "opacity: 1; z-index: 10;", # modificação z-index 
                          
                           leafletOutput("map1", height = "800px")#renderizar o mapa
                           
                  ),
                  tabPanel("Sinistros Recife - Cluster",
                           top = 60, left = "auto", right = 20, bottom = "auto",
                           width = 330, height = "auto",draggable = TRUE,
                           style = "opacity: 1; z-index: 10;", # modificação z-index 
                           leafletOutput("map2", height = "800px")#renderizar o mapa 
                  )
                )#fim da navbarPage
)#fim da fluidpage

#constrção do serve side
server <- function(input, output, session) {
  output$map1 <- renderLeaflet({
    cores<-colorFactor(palette = "viridis", # paleta de cor
                       a$tipo#aplicar ao objeto
    )
    
    leaflet(a)%>%#aplicando o leaflet ao nosso objeto
      addTiles()%>%setView(lat=-8.0517328,lng=-34.8728813,zoom=14)%>%#determinando o ponto start do datavis
      addProviderTiles("CartoDB.Positron", options = providerTileOptions(noWrap = TRUE)) %>%#adicionando um tile minimalista
      addCircleMarkers( #adicionando as marcações circulares
        lng=~lon, #definindo as longitudes
        lat=~lat, #definindo as latitudes
        fillOpacity=0.5, #definindo a transparencia
        radius = 1, #tamanho do ponto
        color=~cores(tipo)#defindo o parametro de cor nos markers
      )%>%
      addLegend( #adiciondo as legendas
        'bottomleft', #posição da legenda
        pal = cores, #definindo a paleta de cores
        values = a$tipo, #os valores 
        title = "Tipo de Acidente" #titulo do Gráfico
      )
  })
  output$map2 <- renderLeaflet({
    leaflet(a)%>%#aplicando o leaflet ao nosso objeto
      addTiles()%>%setView(lat=-8.0517328,lng=-34.8728813,zoom=14)%>%#determinando o ponto start do datavis
      addProviderTiles("CartoDB.Positron", options = providerTileOptions(noWrap = TRUE)) %>%#adicionando um tile minimalista
      addMarkers(
        clusterOptions = markerClusterOptions()#executando a função por cluster      )
    })
  
}

shinyApp(ui, server)
shinyApp(ui, server)

  
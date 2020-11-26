#Importamos las librerias
library(queueing)
library(data.table)

server <- function(input, output) {
  output$notation <- renderText({
    #Esta línea de código se renderizará (escribirá en pantalla) cada vez que se inserte el número de servidores
    paste("(M / M /", input$`number-of-servers`, ") : (GD / Inf / Inf)")
  })
  
  output$summary <- renderTable({
    #Define las entradas del modelo MMC
    i_mmc <- NewInput.MMC(lambda = input$`arrival-rate`, 
                          mu = input$`server-service-rate`, 
                          c = input$`number-of-servers`, 
                          n = input$`number-customers-system`, 
                         method = 0)
    #Verifica el modelo
    CheckInput(i_mmc)
    
    #Crea el modelo de líneas de espera
    o_mmc <- QueueingModel(i_mmc)
    
    #Guarda el resumen de los resultados en una variable
    list <- summary.o_MMC(o_mmc)
    list2 <- list[[1]]
    
    #Convierte un data.frame a un data.table
    table <- setDT(list2)
   
    #Renderiza la tabla y lo muestra en ui.R
    data.table(table)
    
  })
  
  
  output$Pn <-renderTable({
    #Define las entradas del modelo MMC
    i_mmc <- NewInput.MMC(lambda = input$`arrival-rate`, 
                          mu = input$`server-service-rate`, 
                          c = input$`number-of-servers`, 
                          n = input$`number-customers-system`, 
                          method = 0)
    #Verifica el modelo
    CheckInput(i_mmc)
    
    #Crea el modelo de líneas de espera
    o_mmc <- QueueingModel(i_mmc)
    
    #Probabilidad de que un modelo de cola (o red) tenga n clientes.
    pn <- Pn(o_mmc)

    #Renderiza el objeto y lo muestra en ui.R
    data.table(pn)
  })
  
  output$Qn <- renderTable({
    #Define las entradas del modelo MMC
    i_mmc <- NewInput.MMC(lambda = input$`arrival-rate`, 
                          mu = input$`server-service-rate`, 
                          c = input$`number-of-servers`, 
                          n = input$`number-customers-system`, 
                          method = 0)
    #Verifica el modelo
    CheckInput(i_mmc)
    
    #Crea el modelo de líneas de espera
    o_mmc <- QueueingModel(i_mmc)
    
    #Probabilidad de que una llegada que ingrese al sistema vea n clientes en él.
    qn <- Qn(o_mmc)
    
    #Renderiza el objeto y lo muestra en ui.R
    data.table(qn)
  })
}
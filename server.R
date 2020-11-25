library(queueing)
library(data.table)
# Define server logic required to draw a histogram ----
server <- function(input, output) {
  output$notation <- renderText({
    paste("(M / M /", input$`number-of-servers`, ") : (GD / Inf / Inf)")
  })
  
  output$summary <- renderTable({
    i_mmc <- NewInput.MMC(lambda = input$`arrival-rate`, 
                          mu = input$`server-service-rate`, 
                          c = input$`number-of-servers`, 
                          n = input$`number-customers-system`, 
                          method = 0)
    CheckInput(i_mmc)
    
    o_mmc <- QueueingModel(i_mmc)
    
    list <- summary.o_MMC(o_mmc)
    list2 <- list[[1]]
    
    table <- setDT(list2)
   
    data.table(table)
    
  })
  
  output$Pn <-renderTable({
    i_mmc <- NewInput.MMC(lambda = input$`arrival-rate`, 
                          mu = input$`server-service-rate`, 
                          c = input$`number-of-servers`, 
                          n = input$`number-customers-system`, 
                          method = 0)
    
    CheckInput(i_mmc)
    
    o_mmc <- QueueingModel(i_mmc)
    pn <- Pn(o_mmc)

    
    data.table(pn)
  })
  
  output$Qn <- renderTable({
    i_mmc <- NewInput.MMC(lambda = input$`arrival-rate`, 
                          mu = input$`server-service-rate`, 
                          c = input$`number-of-servers`, 
                          n = input$`number-customers-system`, 
                          method = 0)
    CheckInput(i_mmc)
    
    o_mmc <- QueueingModel(i_mmc)
    qn <- Qn(o_mmc)
    
    data.table(qn)
  })
}
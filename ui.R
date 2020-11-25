library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  titlePanel(h1("M/M/S Model")),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("arrival-rate", h4("Arrival rate:"), value = 8), 
      
      
      numericInput("server-service-rate", h4("Server service rate:"), value = 6), 
      
      
      numericInput("number-of-servers", h4("Number of servers:"), value = 2), 
      
      
      numericInput("number-customers-system", h4("Number of customers in the system:"), value = 10), 
      
      br(),
      br(),
      submitButton("Calculate"),
      br(),
      br(),
      img(src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-7iu5srP1E4zn1oV2XygirR2AVpAqhnMZ4Q&usqp=CAU")
    ),
  
    mainPanel(
      fluidRow(
        column(12,
               h2(textOutput("notation"), align="center"),
               hr()
        )
      ),
      fluidRow(
        column(12,
               h3("Summary:"),
               br(),
               tableOutput("summary"),
               br()  
          
        )
      ),
      
      fluidRow(
        column(12,
               h3("Where:", align = "center"),
               br(),
               p(strong("Pn"), " = Probabilitie that a queueing model (or network) has ", strong("n"), "customers", align = "center"),
               p(strong("Qn"), " = Probabilitie that an arrival that enter the system see", strong("n"), "customers in it", align = "center"),
               p("lambda = ", strong(HTML("&Lambda;")), " = Arrival rate", align = "center"),
               p("mu = ", strong(HTML("&mu;")), " = Server service rate", align = "center"),
               p("c = ", strong(HTML(" s ")), "Number of servers", align = "center"),
               p("RO = ", strong(HTML("&rho;")), "Utilization factor", align = "center"),
               p(strong("P0"), " = Probability of 0 clients in the system", align = "center"),
               p(strong("Lq"), " = Expected tail length", align = "center"),
               p(strong("Wq"), " = Waiting time in queue", align = "center"),
               p(strong("L"), " = Expected number of clients in the system", align = "center"),
               p(strong("W"), " = Waiting time in the system", align = "center"),
               br(),
               br()
          
        )
      ),
      
      fluidRow(
        column(6,
               h3("Pn:"),
               tableOutput("Pn")
               ),
        
        column(6,
               h3("Qn:"),
               tableOutput("Qn")  
        )
      )
    )
  )
)
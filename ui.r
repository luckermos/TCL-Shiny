library(shiny)

ui <- fluidPage(
  titlePanel("Teorema Central do Limite"),
  sidebarLayout(
    sidebarPanel(
      selectInput("dist",label="Distribuição da População", choices = c("Uniforme Contínua","Normal","Exponencial","Gama",
                                                                        "Weibull","t de Student","Qui-Quadrado","F de Snedecor")),
      tags$h4("Parâmetros:"),
      conditionalPanel(
        condition = "input.dist == 'Uniforme Contínua'",
        numericInput("min.U", label="Valor Mínimo", value=0, step=0.1),
        numericInput("max.U", label="Valor Máximo", value=1, step=0.1)
      ),
      conditionalPanel(
        condition = "input.dist == 'Normal'",
        numericInput("mean.N", label="Média", value=0, step=0.1),
        numericInput("sd.N", label="Desvio Padrão", value=1, step=0.1, min=0.1)
      ),
      conditionalPanel(
        condition = "input.dist == 'Exponencial'",
        numericInput("rate.E", label="Taxa", value=1, step=0.1, min=0.1)
      ),
      conditionalPanel(
        condition = "input.dist == 'Gama'",
        numericInput("shape.G", label="Forma", value=1, step=0.1, min=0.1),
        numericInput("scale.G", label="Escala", value=0.5, step=0.1, min=0.1)
      ),
      conditionalPanel(
        condition = "input.dist == 'Weibull'",
        numericInput("shape.W", label="Forma", value=1, step=0.1, min=0.1),
        numericInput("scale.W", label="Escala", value=0.5, step=0.1, min=0.1)
      ),
      conditionalPanel(
        condition = "input.dist == 't de Student'",
        numericInput("df.T", label="Graus de Liberdade", value=10, step=1, min=1)
      ),
      conditionalPanel(
        condition = "input.dist == 'Qui-Quadrado'",
        numericInput("df.Q", label="Graus de Liberdade", value=5, step=1, min=1)
      ),
      conditionalPanel(
        condition = "input.dist == 'F de Snedecor'",
        numericInput("df1.F", label="Graus de Liberdade 1", value=3, step=1, min=1),
        numericInput("df2.F", label="Graus de Liberdade 2", value=8, step=1, min=1)
      ),
      sliderInput("N", label = "Número de Amostras", value=10, min=5, max=1000),
      sliderInput("n", label = "Tamanho de cada amostra", value=10, min=5, max=1000),
      width=4,
      "",
      tags$b("O teorema central do limite"),
      "é um teorema fundamental de probabilidade e estatísticas. O teorema descreve a distribuição da média de uma amostra aleatória de uma população com variância finita. Quando o", tags$b("tamanho amostral é suficientemente grande"), "a distribuição da média é uma distribuição aproximadamente normal. O teorema aplica-se independentemente da forma da distribuição da população.",
      tags$a(href="https://pt.wikipedia.org/wiki/Teorema_central_do_limite","Saiba mais"),
      tags$h6("Feito por Lucas Emanuel Ferreira Ramos")
    ),
    mainPanel(
      tags$h4(textOutput("exp")),
      plotOutput("plot.amos",height = "400px"),
      plotOutput("plot.mean",height = "400px"),
      width=6
    )
  )
)
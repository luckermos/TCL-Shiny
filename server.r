server <- function(input, output, session) {
  output$plot.amos <- renderPlot({
    if(input$dist=="Uniforme Contínua"){
      amos <- runif(input$n,min=input$min.U,max=input$max.U)
    }else if(input$dist=="Normal"){
      amos <- rnorm(input$n,mean=input$mean.N,sd=input$sd.N)
    }else if(input$dist=="Exponencial"){
      amos <- rexp(input$n,rate=input$rate.E)
    }else if(input$dist=="Gama"){
      amos <- rgamma(input$n,shape=input$shape.G,scale=input$scale.G)
    }else if(input$dist=="Weibull"){
      amos <- rweibull(input$n,shape=input$shape.W,scale=input$scale.W)
    }else if(input$dist=="t de Student"){
      amos <- rt(input$n,df=input$df.T)
    }else if(input$dist=="Qui-Quadrado"){
      amos <- rchisq(input$n,df=input$df.Q)
    }else if(input$dist=="F de Snedecor"){
      amos <- rf(input$n,df1=input$df1.F,df2=input$df2.F)
    }
    hist(amos, main=paste("Distribuição de uma das",as.character(input$N),"Amostras"), xlab=NULL, col="#009999", density=25, prob=T)
    lines(density(amos),col='black')})
  
  output$plot.mean <- renderPlot({
    means <- c()
    for(i in 1:input$N){
      if(input$dist=="Uniforme Contínua"){
        means <- c(means,mean(runif(input$n,min=input$min.U,max=input$max.U)))
      }else if(input$dist=="Normal"){
        means <- c(means,mean(rnorm(input$n,mean=input$mean.N,sd=input$sd.N)))
      }else if(input$dist=="Exponencial"){
        means <- c(means,mean(rexp(input$n,rate=input$rate.E)))
      }else if(input$dist=="Gama"){
        means <- c(means,mean(rgamma(input$n,shape=input$shape.G,scale=input$scale.G)))
      }else if(input$dist=="Weibull"){
        means <- c(means,mean(rweibull(input$n,shape=input$shape.W,scale=input$scale.W)))
      }else if(input$dist=="t de Student"){
        means <- c(means,mean(rt(input$n,df=input$df.T)))
      }else if(input$dist=="Qui-Quadrado"){
        means <- c(means,mean(rchisq(input$n,df=input$df.Q)))
      }else if(input$dist=="F de Snedecor"){
        means <- c(means,mean(rf(input$n,df1=input$df1.F,df2=input$df2.F)))
      }
    }
    hist(means, main=paste("Distribuição das Médias das",as.character(input$N),"Amostras"), xlab=NULL, col= "dark blue", angle=-45, density=25, prob=T)
    lines(density(means), col='black')})
  output$exp <- renderText({paste("Foram geradas",as.character(input$N),"Amostras  com",as.character(input$n),"elementos cada.")})
}
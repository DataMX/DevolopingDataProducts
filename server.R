
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
lmsl <- lm(stack.loss ~ Air.Flow + Water.Temp, data = stackloss)
userdata = data.frame(Air.Flow=58, Water.Temp=20, Acid.Conc. = 15)

shinyServer(function(input, output) {

    output$plot1 <- renderPlot({
    library(GGally)       
    ggpairs(stackloss,  alpha=0.3) 
    })
  output$plot2 <- renderPlot({
    plot(lmsl, which = 1)
  })
  output$plot3 <- renderPlot({
      plot(lmsl, which = 2)
  })
  output$plot4 <- renderPlot({
      plot(lmsl, which = 3)
  })
  output$plot5 <- renderPlot({
      plot(lmsl, which = 4)
  })
  output$plot6 <- renderPlot({
      plot(lmsl, which = 5)
  })
  output$plot7 <- renderPlot({
      plot(lmsl, which = 6)
  })
    output$summary <- renderPrint({         
        summary(lmsl)
        })
    output$predict <- renderPrint({  
        userdata = data.frame(Air.Flow=input$Air.Flow, Water.Temp=input$Water.Temp)
        predict(lmsl, userdata, interval="predict") 
    })
    output$text1 <- renderText({
        userdata = data.frame(Air.Flow=input$Air.Flow, Water.Temp=input$Water.Temp)
        p <- predict(lmsl, userdata, interval="predict")
        paste("Your predicted value of stack loss with given variables is",
                round(p[1]/10,2),"% of ingoing ammonia.", "The 95% confidence interval is",
                round(p[2]/10,2), "to", round(p[3]/10,2), "% of ingoing ammonia.")
})
})


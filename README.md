# DevolopingDataProducts
Shiny App Course Project for Coursera's Developing Data Products

This is a motivating example of a Shiny App for Coursera's Developing Data Products offered by Johns Hopkins University.
I am using Brownlee's Stack Loss Plant Data provided in the R package `datasets` as `stackloss`.  

In this app, the stack loss is fit in a multiple variable linear regression that contains 21 days of operational data for a plant that oxidizes ammonia to nitric acid.  The stackloss is an inverse measure of the plant's overall efficiency.  The formula to be fit is below.  The model does not include acid concentration as when included, acid concentration was not statistically significant at a 95% Confidence Interval.  Additional details about `stackloss` or the linear model can be found under the About Stackloss, Linear Model tabs.

```{r, echo = TRUE}
lmsl <- lm(stack.loss ~ Air.Flow + Water.Temp, data = stackloss)
```

Under Predict, users can enter Air Flow and Water Temp variables to predict stack loss.  This predicted loss could be compared to actual loss to create indicator of whether plant efficiency is changing.

`userdata = data.frame(Air.Flow=input$Air.Flow, Water.Temp=input$Water.Temp)`  
`predict(lmsl, userdata, interval="predict")

App can be found at:
https://datamx.shinyapps.io/DevolopingDataProducts/
`



---
title       : Predicting Plant Efficiency with Stackloss
subtitle    : Shiny App Pitch
author      : DataMX
job         : Coursera's Developing Data Products
framework   : revealjs        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     :     # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Predicting Plant Efficiency with Stackloss
  
# Shiny App Pitch

 DataMX
  
 1/25/15  

 Coursera's Developing Data Products

---  


## Motivation

This is a motivating example of a Shiny App for Coursera's Developing Data Products offered by Johns Hopkins University.  I am using Brownlee's Stack Loss Plant Data provided in the R package `datasets` as `stackloss`.  

In this app, the stack loss is fit in a multiple variable linear regression that contains 21 days of operational data for a plant that oxidizes ammonia to nitric acid.  The stackloss is an inverse measure of the plant's overall efficiency.

--- 

## Linear Regression Model

 The formula to be fit is below.  The model does not include acid concentration as when included, acid concentration was not statistically significant at a 95% Confidence Interval.  Additional details about `stackloss` or the linear model can be found under the About Stackloss, Linear Model tabs within the app.


```r
lmsl <- lm(stack.loss ~ Air.Flow + Water.Temp, data = stackloss)
```

---

## Prediction

Under Predict, users can enter Air Flow and Water Temp variables to predict stack loss.  This predicted loss could be compared to actual loss to create indicator of whether plant efficiency is changing.


Example Code and Output

```r
predict(lmsl, userdata, interval="predict")
```

```
##        fit      lwr      upr
## 1 14.47514 7.491007 21.45928
```

---
 
 
## Try it Out!

The app can be found at:
https://datamx.shinyapps.io/DevolopingDataProducts/




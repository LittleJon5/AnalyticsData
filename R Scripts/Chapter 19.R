require(ggplot2)
require(reshape2)
require(magrittr)

## Chapter 19, Problem 38
###############
###############

gas <-  read.table("C:\\Users\\Jonathan\\Documents\\GitHub\\AnalyicsData\\Stine&Foster\\Data by Chapter\\Chapter 19\\19_convenience\\19_convenience.txt",
             header = TRUE,
             sep = "\t"
             )

names(gas) <- c("sales", "gallons", "washes", "day", "cents", "weekend")

gas$weekend <- factor(gas$weekend, labels = c("WeekDay", "WeekEnd"))

## Scatterplot Sales on Volume
#########################

ggplot(data = gas, aes(x = sales, y = gallons, color = weekend)) +
        geom_point() +
        labs(x = "Sales", y = "Gallons", title = "Sales on Volume \n") +
        guides(color = guide_legend(title = "Day Type"))

## ScatterPlot Sales on Volume with line
#########################

ggplot(data = gas, aes(x = gallons, y = sales, color = weekend)) +
  geom_point() +
  geom_smooth(data = gas, aes(x = gallons, y = sales, color = "black"), method = "lm") + 
  labs(x = "Sales", y = "Gallons", title = "Sales on Volume \n") +
  guides(color = guide_legend(title = "Day Type"))

## Linear Model of the Graph
############################
gasLM <- lm(sales ~ gallons ,data = gas)

gasLM %>% summary


## prediction between 3500 and 4000 gallons
#################

gallons <- data.frame(gallons = c(3500, 4000))

(prediction <- predict.lm(gasLM, newdata = gallons))

prediction[2] - prediction[1]

## Changing things into littres and canadian dollars
#####################

gas$liters <- gas$gallons * 3.7854
gas$cDollars <- gas$sales * 1.1

litersLm <- lm(cDollars ~ liters, data = gas)

litersLm %>% summary

paste("Sales = ",
      litersLm$coefficients[1],
      " + ", litersLm$coefficients[2],
      "*Liters",
      sep = "")


##################
## The Causation Correlation problem
## #################

# This questions is trying to highlight the correlation causation problem. 
# One doesn't cause the other, the results of our investigation shows that there 
# is a relation ship between the volume of gas sold and the amount spend in the
# conveneice store. 

#########################
## 4165 Gallons of gas, 1744 sales
##########################

newData <- data.frame(gallons = 4165)

pred4165 <- predict(gasLM, newdata = newData)

1774 - pred4165

## based on our prediction function this shows us that the sales amount we recieved
## was 709 dollars less than what we expected it to be.
###

### residuatls plot

gas$residuals <- resid(gasLM)

ggplot(data = gas, aes(x = gallons, y = residuals, color = weekend)) +
  geom_point()

gas$residuals %>% mean

gas$residuals %>% sd



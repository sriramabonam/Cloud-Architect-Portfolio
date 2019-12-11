Cars <- read.csv(file.choose()) # choose the Cars.csv data set
View(Cars)
dim(Cars)   # Dimension of DataSet
attach(Cars)

summary(Cars)
Cars[23:34,1:2]

# Exploratory Data Analysis(60% of time)
# 1. Measures of Central Tendency
# 2. Measures of Dispersion
# 3. Third Moment Business decision
# 4. Fourth Moment Business decision
# 5. Probability distributions of variables
# 6. Graphical representations
  #  > Histogram,Box plot,Dot plot,Stem & Leaf plot, 
  #     Bar plot

head(Cars)
tail(Cars,3)
colnames(Cars)

# 7. Find the correlation b/n Output (MPG) & (HP,VOL,SP)-Scatter plot
pairs(Cars)
plot(Cars)
windows()
plot(Cars)

# 8. Correlation Coefficient matrix - Strength & Direction of Correlation
cor(Cars)




# The Linear Model of interest
m1 <- lm(MPG ~ . ,data = Cars)
coef(m1)

summary(m1)

# Prediction based on only Volume 
model.carV <- lm(MPG ~ VOL,data = Cars)
summary(model.carV) # Volume became significant

# Prediction based on only Weight
model.carW <- lm(MPG ~ WT,data = Cars)
summary(model.carW) # Weight became significant

# Prediction based on Volume and Weight
model.carVW <- lm(MPG ~ VOL + WT,data = Cars)
summary(model.carVW) # Both became Insignificant

# It is Better to delete influential observations rather than deleting entire column which is 
# costliest process
# Deletion Diagnostics for identifying influential observations
#influence.measures(m1)
library(car)
## plotting Influential measures 
windows()
#influenceIndexPlot(m1) # index plots for infuence measures
influencePlot(m1) # A user friendly representation of the above

# Regression after deleting the 77th observation, which is influential observation
model.car1 <- lm(MPG ~ VOL + SP + HP + WT,data = Cars[-77,])
summary(model.car1)

# Regression after deleting the 77th & 71st Observations
model.car3 <-lm(MPG ~ VOL + SP + HP + WT,data=Cars[-c(71,77,1),])
summary(model.car3)

## Variance Inflation factor to check collinearity b/n variables 
vif(m1)
## vif>10 then there exists collinearity among all the variables 

## Added Variable plot to check correlation b/n variables and o/p variable

windows()
avPlots(m1) 
## VIF and AV plot has given us an indication to delete "wt" variable

finalmodel <- lm(MPG ~ VOL + SP + HP,data = Cars)
summary(finalmodel)
## Final model
finalmodel2 <- lm(MPG ~ SP + HP + WT,data = Cars)
summary(finalmodel2)

pred1 <- predict(finalmodel,newdata = Cars )
pred1



windows()
avPlots(finalmodel)



# Evaluate model LINE assumptions 
windows()
plot(finalmodel)


m2 <- lm(MPG ~ . ,data = Cars)
vif(m2)
windows()
avPlots(m2)
summary(m2)


m1 <- lm(log(MPG) ~ HP+VOL+SP)

summary(m1)

m2 <- lm(MPG ~ log(HP)+sqrt(VOL)+log(SP))
summary(m2)
m3 <- lm(MPG ~ sqrt(HP) + HP +sqrt(VOL) + VOL +sqrt(SP)+ SP)

summary(m3)








library(MASS)
stepAIC(m1)


#Residual plots,QQplot,std-Residuals Vs Fitted,Cook's Distance 
windows()
qqPlot(finalmodel)
# QQ plot of studentized residuals helps in identifying outlier 


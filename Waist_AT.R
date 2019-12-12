

siddu <- read.csv(file.choose()) # choose the wc-at.csv data set
View(wc.at)
attach(wc.at)

mean(AT)

mean(wc.at$AT)
dim(wc.at)
head(wc.at,3)
colnames(wc.at)
windows()
plot(Waist,AT)
#summary(wc.at)
# Correlation coefficient value for Waist and Addipose tissue
cor(AT,Waist)
m1 <- lm(AT ~ Waist)

#lm(y ~ x)

#y = B0 + B1x
summary(m1)

pv = ((-215.9815) + (3.4589*72.60))

pv
pv  <- predict(m1,wc.at)
pv

pv <- as.data.frame(pv)

kiran <- cbind(wc.at,pv)
# R-squared value for the above model is 0.667. 
# we may have to do transformation of variables for better R-squared value
# Applying transformations

# Logarthmic transformation
reg_log <- lm(AT ~ log(Waist))  # Regression using logarthmic transformation
summary(reg_log)
# R-squared value for the above model is 0.6723. 
# we may have to do different transformation better R-squared value
# Applying different transformations

# Exponential model 
model3 <- lm(AT ~  1/sqrt(Waist)) # regression using Exponential model
summary(model3)
# R-squared value has increased from 0.67 to 0.7071 
# Higher the R-sqaured value - Better chances of getting good model 
# for Waist and addipose Tissue

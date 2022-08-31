---
  title: "Medical Charge Predictions"
output: html_document
date: "2022-08-30"
---


Load in the data
```{r}
df <- read.csv('Medical Cost Dataset.csv', header=TRUE)
num_cols <- unlist(lapply(df, is.numeric))  
##Plot all numeric data
plot(df[,num_cols])

##See correlations
```{r}
round(cor(df[,num_cols]),2)
```

#Box plot to show the charges on y and different categories on the x axis. To see the relationships

```{r}
smoker = as.factor(df$smoker)
sex = as.factor(df$sex)
region = as.factor(df$region)
boxplot(df$charges ~ smoker, main ='Smoker')
boxplot(df$charges ~ sex, main ='sex')
boxplot(df$charges ~ region, main ='region')
```


##Use liner regression to predict the charges
```{r}
model1 = lm(charges ~. , data =df)
```


```{r}
summary(model1)
```

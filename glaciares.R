# Data de balance de masa acumulado promedio de los glaciares 
# referencia de todo el mundo desde 1945 a 2014

names(glaciers_csv)
str(glaciers_csv)
attach(glaciers_csv)

summary(glaciers_csv)
median(`Balance de masa acumulada promedio`)

# Histograma con curva normal para Balance de masa acumulada promedio 

hist(`Balance de masa acumulada promedio`,prob= TRUE,
     main = "Histograma con curva normal", ylab= "Densidad")
x<-seq(min(`Balance de masa acumulada promedio`), max(`Balance de masa acumulada promedio`), length = 20)
f<-dnorm(x,mean=mean(`Balance de masa acumulada promedio`),sd =sd(`Balance de masa acumulada promedio`))
lines(x,f,col="red",lwd=2)


# Histograma con boxplot para Balance de masa acumulada promedio

hist(`Balance de masa acumulada promedio`,probability = TRUE, ylab="",main="",
     col = rgb(1,0,0, alpha = 0.5), axes =FALSE)
axis(1)
par(new=TRUE)
boxplot(`Balance de masa acumulada promedio`,horizontal = TRUE,axes=FALSE,
lwd =2,col=rgb(0,0,0,alpha = 0.2))

# Histograma con ggplot2 


install.packages("ggplot2")

library(ggplot2)

nbreaks <- pretty(range(glaciers_csv$`Balance de masa acumulada promedio`), n = nclass.Sturges(glaciers_csv$`Balance de masa acumulada promedio`),
                  min.n = 1)

ggplot(data.frame(glaciers_csv$`Balance de masa acumulada promedio`), aes(x = glaciers_csv$`Balance de masa acumulada promedio`)) +
  geom_histogram(aes(y = ..density..), breaks = nbreaks,
                 color = "gray", fill = "white") +
  geom_density(fill = "blue", alpha = 0.3)



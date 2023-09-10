library(tidyverse)
head(mtcars)
View(mtcars)
#1 
#mapping is pull data into axis x or y
#chart rule 1 Variable need to plot 2.Type (Continuous or Discret)
ggplot(data=mtcars,mapping=aes(x=mpg))+
  geom_histogram()
ggplot(data=mtcars,mapping=aes(x=mpg))+
  geom_density()
ggplot(data=mtcars,mapping=aes(x=mpg))+
  geom_boxplot()


base<-ggplot(data=mtcars,mapping=aes(x=mpg))
base+geom_dotplot()

base2<-ggplot(mtcars,aes(y=mpg,x=hp))
base2+geom_point(size=5,col="red",alpha=0.3)+geom_smooth()+geom_rug()

#linear model lm
base2+geom_smooth(method = "lm",fill="blue",fill='pink')+theme_minimal()

View(diamonds)

#<ord> can ordering 
diamonds$cut%>%head

#boxplot vs violin -> boxplot compare btw box violin compare within itself.
#EDA use various chart to see insignt.

library(patchwork)
#P1+P2+P3
#(P1+P2)/P3

#overploting
set.seed(50)
ggplot(sample_n(diamonds,1000),aes(carat,price))+geom_point(alpha=0.8,shape='.')

#1 reduce alpha
#2 add shape
#3 sampling not all data+set.seed()

#mapp variable to chart ->color
set.seed(50)
ggplot(sample_frac(diamonds,0.7),aes(carat,price,col=cut))+geom_point(alpha=0.3)+theme_minimal()+scale_color_manual(values = c('pink','red','gold','green','blue'))


set.seed(50)
ggplot(sample_frac(diamonds,0.7),aes(carat,price,col=cut))+geom_point(alpha=0.3)+theme_minimal()+scale_color_brewer(type="seq",palette = 1)
                                                                                                        
set.seed(50)
ggplot(sample_frac(diamonds,0.7),
        aes(carat,price,col=price))+
        geom_point(alpha=0.3)+
        theme_minimal()+
        scale_color_gradient(low="gold",high = "blue")

#facet
#segment chart into group
#wrap 1d
set.seed(50)
ggplot(sample_frac(diamonds,0.3),
       aes(carat,price,col=price))+
  geom_point(alpha=0.3)+
  theme_minimal()+
  scale_color_gradient(low="gold",high = "blue")+
  facet_wrap(~cut,ncol=2)

#grid 2d
set.seed(50)
ggplot(sample_frac(diamonds,0.3),
       aes(carat,price,col=price))+
  geom_point(alpha=0.3)+
  theme_minimal()+
  scale_color_gradient(low="gold",high = "blue")+
  facet_grid(cut~clarity)

#label
ggplot(mtcars,aes(hp,mpg))+
  geom_point()+
  theme_minimal()+
  labs(
    title = "My first scatter plot",
    subtitle = "Awesome work",
    x="Horse Power",
    y="Mile per Gallon",
    caption="Pewered by R"
  )
#stacking
ggplot(diamonds,aes(cut,fill=color))+geom_bar()

library(ggthemes)
ggplot(diamonds,aes(cut,fill=color))+geom_bar()+theme_wsj()

# 5 charts by use diamonds data set--pdf
# Create 5 charts form Skooldio in google sheet 121212

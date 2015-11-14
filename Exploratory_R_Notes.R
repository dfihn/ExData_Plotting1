#xyplot(y ~ x | f*g, data)

library(lattice)
library(datasets)
xyplot(Ozone ~ Wind, data = airquality)

or

airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

#lattice graphics return object to trellis class
#for example

p <- xyplot(Ozone ~ Wind, data = airquality)
print(p)
#but if you use the function itself it will autoprint
xyplot(Ozone ~ Wind, data = airquality)

#///////////////////////////////

#lattice default panel functions

set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f*x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2,1))

#building a custom panel
#adding a regression line
xyplot(y ~ x | f, panel = function(x, y, ...){
 panel.xyplot(x, y,...)
 panel.lmline(x,y, col = 2) #lmline = regression!!
})

#remember: if you want to separate panels based on a variables levels,
#if you want each level name noted in each panel you have to use the 
#factors variable!!
#also, use trellis.par.set() if you want to fine tune the display



#GGPlot2 plotting!!
package in r (Grammar of Graphics)
3rd graphic device (base and lattice)

install.packages("ggplot2")

qplot():  (plot is the base function)
#made up fof geoms (points, lines)
#generally have (x, y , then factor), factor is like gender (a subset)

qplot(): hides stuff underneath
ggplot(very flexible)

library("ggplot2")

#part2
library("ggplot2")
str(mpg)
qplot(displ,hwy, data = mpg)
?qplot()
qplot(displ, hwy, data = mpg, color = drv)
#when you use color, you color based on the factors of the variable (there being 3 levels)
qplot(displ, hwy, data = mpg, geom = c("smooth", "point"))
?geom()
qplot(hwy, data = mpg, fill = drv, xlab = "test1", ylab = "test2")
#like the split function, in a graph you can separate based on the levels in a variable
qplot(displ,hwy, data = mpg, facets = .~drv)
# or if you just have 1 x axis, you can use historgram and create bandwith
qplot(hwy, data = mpg, facets = drv~., bindwith = 2)
# you can use density as well as point, and smooth on Geom argument
# you can also put in the argument for "shape", shape = 
#use the facets arguemnt by the levels of a variable, be careful
qplot(hwy, drv, data = mpg, facets = class~., shape = factor(cyl))
#qplot can be used to built quick plots, simliar to plot() from base graphics
#hard to modify qplot function


#ggplot2, more fundamentals of ggplot
#replacing of base plots in R
#ggplot2 book, get it if you want to research further!

things that you need:
1. data frame: if not already made use data.frame() function
2. aesthetic mappings
3. geoms: objects to place on the page (lines, points, shapes)
4. facets: conditional plots
5. stats: statistical transformation

qplot(logpm25, NocturnalSympt, data = maacs, facets = .~bmicat, geom = c("point", "smooth"), method = "lm")
#using aes() function converts item to conform to ggplot() requirements
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
g
#if you wish to add items to a plot, use the geom_point() function, example:
g <- ggplot(maacs, aes(logpm25, NocturalSympt))
print(g)
p <- g + geom_point()
g _ geom_point() #this is you want it to automatically display

geom_point() is used to make scatterplots
#what if you want to smooth out your graph?
g + geom_smooth() + geom_point()

things to add to ggplot()
1. geom_point()
2. geom_smooth("include a method if you want linear model")
3. facet_grid("include the variable whose factors you want turned into panels")
such as : facet_grid(.~bmicat)

#annotation!

xlab()
ylab()
ggtitle()
labs(): specify x, y tables

geom_point(color = "steelblue", size = 4, alpha = 1/2) or
geom_point(color = bmicat, size = 4, alpha = 1/2)

geom_point(aes(color = bmicat)) + labs(title = "MAACS Cohort") + labs(x = expression("log " * 
        PM[2.5]), y = "Nocturnal Symptoms")
can also add: geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE)
geom_point(aes(color = bmicat)) + theme_bw(base_family = "Times")

#axis limits differ from other base graphic devices

testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] <- 100 ##Outlier!
plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3)) #this eliminates the outlier
# here is the g plot example

g <- ggplot(testdat, aes(x =x , y = y))
g + geom_line()
g + geom_line() + ylim(-3,3)
#if you want to include the outlier though
g + geom_line() + coord_cartesian(ylim = c(-3,3))
#tertile = two points cutting a distribution into 3 parts

#final plot!! take special notes on the items added to the original ggplot
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
#in order to demonstrate this use flat file, or get the original maacs data or something comporable
##add Layers
g + geom_point(alpha = 1/3) #(add points!)
+facet_wrap(bmicat ~ no2dec, nrow = 2, ncol =4)
+geom_smooth(method="lm", se=FALSE, col = "steelblue")
+theme_bw(base_family = "Avenir", base_size = 10)
+labs(x = expression("log" * PM[2.5])
+labs(y = "Nocturnal Symptoms")
+labs(title = "MAACS Cohort")


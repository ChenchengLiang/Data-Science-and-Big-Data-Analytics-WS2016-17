install.packages('matrixStats');
library(matrixStats);

#1.Store mtcars in a new variable (mtcars is a built-in variable that is always available)
#and display its data type.
x=mtcars;
typeof(x); ## display data type

#2. Use R to calculate the mean, median, and max for all columns.
x=mtcars;
summary(x);


#3. Visualize the miles per gallon1 (mpg) as well as plot its density (Two plots required, just
#a density plot is not sufficient!).
hist (mtcars$mpg,
  main="MPG",
  xlab="index of cars",
  ylab="mpg")


plot(density(mtcars$mpg),
main="Density",
xlab="index of cars",
ylab="density")


######4. Extend cars with a new column that contains the fuel consumption measured in l
#100km.
#1mpg=42.5 l/100km
x=mtcars;
x["fuel_consumption"] = x[,1]*42.5;
View(x)

5. Visualize the relationship between the miles per gallon and l
#100km.
x=mtcars;
#1mpg=42.5 l/100km
x["fuel_consumption"] = x[,1]*42.5;
plot(x$fuel_consumption,
main ="Relation bewteen mpg and fuel_consumption(red line denotes mpg)",
xlab="Index of car type",
ylab="Fuel_consumption",
ylim=c(-100,2000))
#lines(x$fuel_consumption)
#lines(d1)
lines(x[,1],col="red")
#lines(d1)
lines(x[,12],)
  
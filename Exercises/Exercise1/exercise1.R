install.packages('matrixStats');
library(matrixStats);
######1.Store mtcars in a new variable (mtcars is a built-in variable that is always available)
#and display its data type.
x=mtcars;
typeof(x); ## display data type

######2. Use R to calculate the mean, median, and max for all columns.
x=mtcars;
x=data.matrix(x); #transform to matrix for colMedians and colMaxs
x_col_mean=colMeans(x);  #Mean for columns
x_col_median=colMedians(x); #Medians for columns
x_com_max=colMaxs(x);       #Maxs for columns

#show(x_col_mean)
#show(x_col_median)
#show(x_com_max)

data.frame(x_col_mean)
data.frame(x_col_median)
data.frame(x_com_max)

summary(x);

######3. Visualize the miles per gallon1 (mpg) as well as plot its density (Two plots required, just
#a density plot is not sufficient!).
x=mtcars;
par(mfrow = c(2, 1))  # 2 rows and 1 columns

d1=density(x[,1]);
#d2=density(x[,2])
plot(x[,1]
     main="MPG",
     xlab="Index of cars",
     ylab="mpg")
#par(new=TRUE);
#lines(d2)
plot(d1,
     main="Density",
     xlab="Index of cars")


######4. Extend cars with a new column that contains the fuel consumption measured in l
#100km.
#1mpg=42.5 l/100km   235215?
x=mtcars;
#x["fuel_consumption"] = rowMeans(x);
x["fuel_consumption"] = 235/x[,1];
#x$fuel_consumption=rowMeans(x);
#plot(x[,1])
#plot(d1)
View(x)

######5. Visualize the relationship between the miles per gallon and l
#100km.
x=mtcars;
#1mpg=42.5 l/100km   235215?
x["fuel_consumption"] = x[,1]*235215;
plot(x$fuel_consumption,
main ="Relation bewteen mpg and fuel_consumption(blue line denotes mpg)",
xlab="Index of car type",
ylab="Fuel_consumption",
ylim=c(-10,2000))
#lines(x$fuel_consumption)
#lines(d1)
lines(x[,1],col="blue")
#lines(d1)
lines(x[,12],)

plot(x[,1],x$fuel_consumption,
     main ="Relation bewteen mpg and fuel_consumption(blue line denotes mpg)",
     xlab="Fuel_consumption",
     ylab="mpg")
  
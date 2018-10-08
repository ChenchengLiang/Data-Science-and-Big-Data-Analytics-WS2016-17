install.packages('ggplot2');
library(ggplot2);


#########
#1. Create three data samples with normally distributed data:
#    S1: 100 values,  = 0:0;  = 1:0
#    S2: 100 values,  = 1:5;  = 1:0
#    S3: 10 values,  = 1:5;  = 1:0



#rnorm: Generates random numbers  from normal distribution
#Generates 100 numbers from a normal with mean 0 and sd=1
S1=rnorm(100, 0, 1)
#S1_TEST=rnorm(100, 0, 1)
S2=rnorm(100, 1.5, 1)
S3=rnorm(10, 1.5, 1)
#Stest=rnorm(100, 0, 1)


###########
# 2. Plot the densities of S1, S2, and S3 separately.
D1=density(S1)
D2=density(S2)
D3=density(S3)
#plot(S1)
par(mfrow = c(3, 1))  # 3 rows and 1 columns
plot(D1)
plot(D2)
plot(D3)

##############
# 3. Plot the densities of S1 and S2, as well as S1 and S3 together.
par(mfrow = c(2, 1))  # 2 rows and 1 columns
plot(D1,main="S1 and S2",
     xlim=c(-4,6),ylim=c(0,0.5))
lines(D2,col="blue")

plot(D1,main="S1 and S3",
     xlim=c(-4,5),ylim=c(0,1))
lines(D3,col="blue")
############
#4. Interpret the above density plots. What do they indicate?
#The more overlapping area the more different between them


plot(D1,main="S1, S2-blue,S3-red")
lines(D2,col="blue")
lines(D3,col="red")


############
#5. Perform a t-test between S1 and S2, as well as between S1 and S3. How signicant is
#the dierence between the samples?
x1=t.test(S1,S2)
x2=t.test(S1,S3)
x1$p.value
x2$p.value

#According to the less p value the more different between them.
#p value of x1 significant less than that of x2,
#which means S1 is far different from S2, and less far different from S3
#But both p values are less than 0.05, so S1 and S2 are different, also S1 and S3 are different.



###############
# 6. Apply the kmeans algorithm to the columns Petal.Width and Petal.Length of the
# iris data set
#  Three times for k = 2
#  Three times for k = 3
#  Three times for k = 4
x=iris
#d=frame()
d=rbind(matrix(x$Petal.Width,ncol = 2), matrix(x$Petal.Length,ncol = 2))
colnames(d) <- c("Width", "Length")
#d$w=x$Petal.Width
#d$l=x$Petal.Length

# c1=kmeans(x$Petal.Width,2)
# c2=kmeans(x$Petal.Width,2)
# c3=kmeans(x$Petal.Width,2)
plot(d)
#plot(x$Petal.Width,x$Petal.Length,xlim=c(0,5),ylim=c(0,7))
#plot(x$Petal.Length,x$Petal.Width,xlim=c(0,7),ylim=c(0,5))

 c1_key2=kmeans(d,2)
 c2_key2=kmeans(d,2)
 c3_key2=kmeans(d,2)
 
 c1_key3=kmeans(d,3)
 c2_key3=kmeans(d,3)
 c3_key3=kmeans(d,3)

 c1_key4=kmeans(d,4)
 c2_key4=kmeans(d,4)
 c3_key4=kmeans(d,4)



################
# 7. Visualize the results of each clustering (Hint: look at the R documentation to see how
# to do that). Do the clusters remain the same? Are the results as you would expect
# them to be?
 
 #key=2
 par(mfrow = c(3, 1))  # 3 rows and 1 columns
plot(d, col = c1_key2$cluster)
points(c1_key2$centers, col = 1:5, pch = 8,cex = 2)

plot(d, col = c2_key2$cluster)
points(c2_key2$centers, col = 1:5, pch = 8,cex = 2)

plot(d, col = c2_key2$cluster)
points(c2_key2$centers, col = 1:5, pch = 8,cex = 2)

#key=3
par(mfrow = c(3, 1))  # 3 rows and 1 columns
plot(d, col = c1_key3$cluster)
points(c1_key3$centers, col = 1:5, pch = 8,cex = 2)

plot(d, col = c2_key3$cluster)
points(c2_key3$centers, col = 1:5, pch = 8,cex = 2)

plot(d, col = c2_key3$cluster)
points(c2_key3$centers, col = 1:5, pch = 8,cex = 2)

#key=4
par(mfrow = c(3, 1))  # 3 rows and 1 columns
plot(d, col = c1_key4$cluster)
points(c1_key4$centers, col = 1:5, pch = 8,cex = 2)

plot(d, col = c2_key4$cluster)
points(c2_key4$centers, col = 1:5, pch = 8,cex = 2)

plot(d, col = c2_key4$cluster)
points(c2_key4$centers, col = 1:5, pch = 8,cex = 2)

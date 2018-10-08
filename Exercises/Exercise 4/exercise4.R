######################################################
#1. Load the libraries e1071 and party. You may have to install them.
######################################################
install.packages("e1071")
install.packages("party")
install.packages("caret")
install.packages("partykit")
#install.packages("rpart")
#install.packages("rpart.plot")
library("e1071")
library("party")
library("caret")
library("partykit")

#library("rpart")
#library("rpart.plot")

######################################################
#2. Create a training set and a test set from the iris data set.
######################################################
x=iris
# a random permutation
#y=t(x)
#y=sample(y)
#y=t(y)

y = x[sample(nrow(x)),]



train=y[1:100,]
test=y[101:150,]


######################################################
#3.naiveBayes
######################################################
model_naiveBayes=naiveBayes(Species ~ ., data = train)

pred_naiveBayes=predict(model_naiveBayes, test)

#table(pred_naiveBayes, test$Species)

confusionMatrix(pred_naiveBayes,test$Species)

######################################################
#4.ctree
######################################################
model_ctree <- ctree(Species ~ .,data = train)
#model_ctree <- ctree(Species ~ .,data = train, controls = ctree_control(maxsurrogate = 3)

######################################################
#5. Plot the decision tree.
######################################################
plot(model_ctree)
plot(model_ctree,type = "simple")
#plot(as.simpleparty(model_ctree))
#err is just the SSE(sum of squared error)
model_ctree
######################################################
#6. Evaluate the results of both classiers
######################################################
pred_ctree=predict(model_ctree, test)

confusionMatrix(pred_ctree,test$Species)

confusionMatrix(pred_naiveBayes,test$Species)

#plot(tra)
#table(pred_ctree, train$Species)




######################################################
#extra, comparing different data set
######################################################
y1 = x[sample(nrow(x)),]
train=y1[1:100,]
test=y1[101:150,]
model_ctree <- ctree(Species ~ .,data = train)
pred_ctree=predict(model_ctree, test)
confusionMatrix(pred_ctree,test$Species)


model_naiveBayes=naiveBayes(Species ~ ., data = train)
pred_naiveBayes=predict(model_naiveBayes, test)
confusionMatrix(pred_naiveBayes,test$Species)
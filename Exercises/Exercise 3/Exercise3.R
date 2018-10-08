#################################
#Association Rule Mining with R
#################################


#########################
#1. Load the libraries arules and arulesViz. You may have to install them. Hint: library
#and install.packages are the commands for loading and installing.
#########################

install.packages("arules")
install.packages("arulesViz")
library("arules")
library("arulesViz")


#########################
#2.Load the example data using the command association-Data
#########################
Associate_data=read.transactions("http://user.informatik.uni-goettingen.de/~sherbold/AssociationRules.csv",rm.duplicates=FALSE,format="basket",sep=" ")

summary(Associate_data)
show(Associate_data)



#########################
#3.Train association rules with the apriori command.
#########################

rules = apriori(Associate_data)
summary(rules)
#The default behavior is to mine rules with minimum support of 0.1, minimum confidence of 0.8


#rules = apriori(Associate_data,parameter = list(supp = 0.5, conf = 0.9, target = "rules"))
rules = apriori(Associate_data, parameter=list(support=0.01, confidence=0.5))
summary(rules)
# rules = apriori(Associate_data, parameter=list(support=0.01, confidence=0.9))
# rules = apriori(Associate_data, parameter=list(support=0.1, confidence=0.5))



#########################
#4. Visualize the results with the plot command.
# Use the parameter interactive=TRUE with the plot command and see what hap-
#  pens.
#########################

plot(rules)
plot(rules,interactive=TRUE)

#If the lift is > 1, 
#like it is here for Rules 1 and 2, 
#that lets us know the degree to which those two occurrences are dependent on one another, 
#and makes those rules potentially useful for predicting the consequent in future data sets.

#########################
#5. While doing this, think about reasonable values for support and condence. See what
#happens when you choose dierent values.
#########################


#Frequent itemset: a set of items L that appears together "often enough¡°:
#Support: the % of transactions that contain L
#Frequent itemsets are used to find rules X->Y with a minimum
#Confidence: The % of transactions that contain X, which also contain Y

rules = apriori(Associate_data, parameter=list(support=0.01, confidence=0.5))
plot(rules,interactive=TRUE)
rules = apriori(Associate_data, parameter=list(support=0.1, confidence=0.5))
plot(rules,interactive=TRUE)
rules = apriori(Associate_data, parameter=list(support=0.5, confidence=0.5))
plot(rules,interactive=TRUE)
rules = apriori(Associate_data, parameter=list(support=0.005, confidence=0.5))
plot(rules,interactive=TRUE)
#The lower support(which means less items are pruned) the more rules
plot(Associate_data$i,Associate_data$p)

rules = apriori(Associate_data, parameter=list(support=0.01, confidence=0.5))
plot(rules,interactive=TRUE)
rules = apriori(Associate_data, parameter=list(support=0.01, confidence=0.9))
plot(rules,interactive=TRUE)
rules = apriori(Associate_data, parameter=list(support=0.01, confidence=0.1))
plot(rules,interactive=TRUE)
#The lower confidence the more rules

#high confidence
rules = apriori(Associate_data, parameter=list(support=0.005, confidence=0.8))
plot(rules,interactive=TRUE)


rules = apriori(Associate_data, parameter=list(support=0.01, confidence=0.7))
plot(rules,interactive=TRUE)

inspect(rules)


#################################
#Logistic Regression with R
#################################


#########################
#1.Load the example data using the command cuse <-
#  read.table("http://data.princeton.edu/wws509/datasets/cuse.dat",
#             header=TRUE)
#########################
cuse = read.table("http://data.princeton.edu/wws509/datasets/cuse.dat",
             header=TRUE)


#########################
#2. Train a logistic regression model over the formula cbind(using, notUsing) ~ age +
#  education + wantsMore
# The command for logistic regression models is glm and the family is bino-
#  mial(logit).
#########################

x <- glm(cbind(using, notUsing) ~ age + education + wantsMore,
                family = binomial(logit), data = cuse)

x <- glm(cbind(notUsing, using) ~ age + education + wantsMore,
         family = binomial(logit), data = cuse)

plot(x)



#########################
#3. Print a summary of the trained regression model. Interpret the coecients. Which
#features are important? Why?
#########################



summary(x)

#A set of coefficients that indicate the relative impact of each driver.
#Y=b0+...b1*x(age25-29)+b2*x(age30-39 ).....

#The coefficient is "significant" if P is small

plot(cuse$using,cuse$notUsing)


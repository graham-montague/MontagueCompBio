# git hub to website:
# go to terminal
# git status
# git pull
# git status
# git add -A
# git status
# git commit -am 'brief message'
# git status
# git push
# git status
# git pull



# homework 4 --------

# Question 1
x = 1.1
a = 2.2
b = 3.3

# a.
z <- x^a^b
print(z)

# b.
z <- (x^a)^b
print(z)

# c. 
z <- 3*x^3 + 2*x^2 + 1
print(z)

# Question 2
?rep()
?seq()

# a.
rep(c(seq(1,8), seq(7,1)))

# b.
rep(rep(1:5, times = 1:5))

# c.
rep(5:1, times = 1:5)

# Question 3
?asin() 
?acos()
?atan()
?runif

# Make the two random uniform vectors
set.seed(123)
x <- runif(1)
print(x)
y <- runif(1)
print(y)

# Convert to polar coordinates
polar <- sqrt(x^2 + y^2)

theta = atan2(y,x)

print("Polar coordinates:")
print(c("r =", polar))
print(c("θ (in radians) =", theta))
print(c("θ (in degrees) =", theta * (180/pi)))

# Question 4
queue <- c("sheep", "fox", "owl", "ant")
queue <- c("sheep", "fox", "owl", "ant", "serpent")
queue <- c("donkey", "sheep", "fox", "owl", "ant", "serpent")
queue <- c("donkey", "sheep", "fox", "owl", "ant")
queue <- c("donkey", "sheep", "fox", "ant")
queue <- c("donkey", "sheep", "fox", "aphid", "ant")

# the aphid is the 4th in line

# Question 5
# Create sequence from 1 to 100
numbers <- 1:100

# vector of all of the integers from 1 to 100 that are not divisible by 2, 3, or 7
result <- numbers[numbers %% 2 != 0 & numbers %% 3 != 0 & numbers %% 7 != 0]
print(result)


# homework 5 ---------------------------------------

# Question 1 : Assign to the variable n_dims a single random integer between 3 and 10.
# make this reproducible by using the set.seed() however, if you want new numbers you can comment this out
# set.seed(25) 
# randomly assign a single random integer between 3 and 10 
n_dims <- sample(3:10, 
                 size = 1)
print(n_dims)

# part a: Create a vector of consecutive integers from 1 to n_dims^2. 
# we need to create a vector of numbers 1: n_dims^2
numbers <- 1:(n_dims^2)
print(numbers)

#part b: Use the sample function to randomly reshuffle these values.
numbers <- sample(numbers)
print(numbers)

# part c: create a square matrix with these elements.
# this needs to be square so we need to use 9 X 9 matrix because
square_matrix <- matrix(numbers, 
                 nrow = n_dims, 
                 ncol = n_dims)

# part d: print out the matrix.
print(square_matrix)

# part e: find a function in r to transpose the matrix.
# I found the t() function to transpose my 9 X 9 matrix
transposed <- t(square_matrix)

# part f: print it out again and note how it has changed.
print(transposed) # it flipped flopped the columns and the rows in the matrix. For example, the value in [1,2] of 67 for the square_matrix matrix moved to [2,1] in the transposed matrix

# part g: calculate the sum and the mean of the elements in the first row and then the last row.
# For the first row of the transposed matrix
sum_first_row <- sum(transposed[1, ])
print(sum_first_row)
mean_first_row <- mean(transposed[1, ])
print(mean_first_row)

# For the last row of the transposed matrix
sum_last_row <- sum(transposed[n_dims, ])
print(sum_last_row)
mean_last_row <- mean(transposed[n_dims, ])
print(mean_last_row)

# part h: read about the eigen() function and use it on your matrix
?eigen()

eigen_matrix <- eigen(transposed)
print(eigen_matrix)

# part i: look carefully at the elements of $values and $vectors in the output. What kind of numbers are these?
eigen_matrix$values
eigen_matrix$vectors

# I have read the R help file on the output from the eigen() function. The help file states that the values and vectors may contain complex numbers. 

# part j: dig in with the typeof() function to figure out their type.

# Check the typeof() for the values of of the eigen matrix
typeof(eigen_matrix$values) 
# this returned that the values are complex

# What is the typeof() of the vectors in the eigen table?
typeof(eigen_matrix$vectors)
# This also returned a complex type

# part k: if have set your code up properly, you should be able to re-run it and create a matrix of different size because n_dims will change.

# I re ran the code and it changed the n_dims. However, if I wanted to keep the same table, I would run the set.seed() function to prevent it from changing each time and it is reproducible. 


# Question 2 
# part a: Create a list with the following named elements: my_matrix, which is a 4 x 4 matrix filled with random uniform values
my_matrix <- matrix(runif(16), nrow = 4, ncol = 4)
print(my_matrix)

# part b: my_logical which is a 100-element vector of TRUE or FALSE values. Do this efficiently by setting up a vector of random values and then applying an inequality to it.
my_logical <- runif(100) > 0.5
print(my_logical)

# part c: my_letters, which is a 26-element vector of all the lower-case letters in random order.
my_letters <- sample(letters)
print(my_letters)

# Now I need to create a list of all of these. 
# Create the list with all three named elements
my_list <- list(
  my_matrix = my_matrix,
  my_logical = my_logical,
  my_letters = my_letters
)
str(my_list)
print(my_list)

# part d: create a new list, which has the element[2,2] from the matrix, the second element of the logical vector, and the second element of the letters vector.
my_list2 <- list(
  matrix_element = my_list$my_matrix[2,2],
  logical_element = my_list$my_logical[2],
  letter_element = my_list$my_letters[2]
)
str(my_list2)
print(my_list2)

# part e: use the typeof() function to confirm the underlying data types of each component in this list
typeof(my_list2$matrix_element) # double
typeof(my_list2$logical_element) # logical
typeof(my_list2$letter_element) # character

# part f: combine the underlying elements from the new list into a single atomic vector with the c() function.
vector <- c(my_list2$matrix_element,
            my_list2$logical_element,
            my_list2$letter_element)

# part g: what is the data type of this vector?
typeof(vector)
# it is a character

# Question 3 
# part a: Create a data frame with the two variables (= columns) and 26 cases (= rows) below: call the first variable my_unis and fill it with 26 random uniform values from 0 to 10
# First we need to create my_unis
# part b: call the second variable my_letters and fill it with 26 capital letters in random order.
# now we need to make my_letters
my_df <- data.frame(
  my_unis = runif(26, min = 0, max = 10),
  my_letters = sample(LETTERS)
)
print(my_df)

# part c: for the first variable, use a single line of code in R to select 4 random rows and replace the numerical values in those rows with NA.
my_df$my_unis[sample(1:26, 4)] <- NA 

# part d: for the first variable, write a single line of R code to identify which rows have the missing values.
which(is.na(my_df$my_unis)) # columns 4, 5, 18, 21 have missing columns

# part e: re-order the entire data frame to arrange the second variable in alphabetical order
my_df <- my_df[order(my_df$my_letters), ]

# part f: calculate the column mean for the first variable.
mean_variable1 <- mean(my_df$my_unis, na.rm = TRUE) # 5.15755






# Homework 6 --------------------------

# Question 1. Think about an ongoing study in your lab (or a paper you have read in a different class), and decide on a pattern that you might expect in your experiment if a specific hypothesis were true.

# I am in Dr. Mark Henderson's lab studying catch per unit effort (CPUE; fish/hr) of Atlantic Salmon in Lake Champlain using boat electrofishing. We have generated CPUE of Atlantic Salmon catch rates for a sampling protocol for fish collection for acoustic telemetry studies. Understanding the optimal sampling time is beneficial for us because we want to be most efficient while collecting fish in the field. We are interested in how the water temperature of Lake Champlain effects the CPUE of Atlantic Salmon. We hypothesize that as the water temperature increases, the CPUE of Atlantic Salmon will decrease because the Atlantic Salmon will be in deeper water and out of the electrical field where we are shocking (<15 ft.). The Atlantic Salmon are cold-water fish and want to live in the cooler and deeper waters when the surface temperature is higher. 

# Question 2. To start simply, assume that the data in each of your treatment groups follow a normal distribution. Specify the sample sizes, means, and variances for each group that would be reasonable if your hypothesis were true. You may need to consult some previous literature and/or an expert in the field to come up with these numbers.

# Question 3. Using the methods we have covered in class, write code to create a random data set that has these attributes. Organize these data into a data frame with the appropriate structure.
library(ggplot2)
library(dplyr)

# Set seed for reproducibility
# set.seed(25)

# Create the dataframe
?rnorm()

low <- data.frame(
  temp_group = "Low (2-4.9°C)",
  CPUE = rnorm(n = 20, mean = 18, sd = 1.2),
  temperature = runif(20, 2, 4.9));low

medium <- data.frame(
  temp_group = "Medium (5-7.9°C)",
  CPUE = rnorm(n = 20, mean = 12, sd = 1.5),
  temperature = runif(20, 5, 7.9));medium

high <- data.frame(
  temp_group = "High (8-10.9°C)",
  CPUE = rnorm(n = 20, mean = 8, sd = 2),
  temperature = runif(20, 8, 10.9));high

# combine all of the the datasets together to make a big dataset with low, medium, and high datasets
data <- rbind(low, medium, high)

# Question 4. Now write code to analyze the data (probably as an ANOVA or regression analysis, but possibly as a logistic regression or contingency table analysis. Write code to generate a useful graph of the data.

# First, we can do a linear regression on the continuous variables 
# Fit linear model
linear_regression <- lm(CPUE ~ temperature, data = data)

my_out <- c(slope=summary(linear_regression)$coefficients[2,1],
            p_value=summary(linear_regression)$coefficients[2,4],
            r_squared = summary(linear_regression)$r.squared);my_out

print(summary(linear_regression))

## 

# 3. Visualizations
# Create scatter plot with regression line
salmon_plot <- ggplot(data, aes(x = temperature, y = CPUE)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", color = "blue") +
  labs(
    title = "Linear Regression: CPUE vs Temperature",
    x = "Temperature (°C)",
    y = "CPUE (fish/hour)"
  ) + theme(plot.title = element_text(size = 10));salmon_plot

print(salmon_plot)


# Question 5. Try running your analysis multiple times to get a feeling for how variable the results are with the same parameters, but different sets of random numbers.

## I have rerun the code above so that the random numbers change each time to see the differences!

# Question 6. Now, using a series of for loops, adjust the parameters of your data to explore how they might impact your results/analysis, and store the results of your for loops into an object so you can view it. For example, what happens if you were to start with a small sample size and then re-run your analysis? Would you still get a significant result? What if you were to increase that sample size by 5, or 10? How small can your sample size be before you detect a significant pattern (p < 0.05)? How small can the differences between the groups be (the “effect size”) for you to still detect a significant pattern?
# Set seed for reproducibility
set.seed(25)

# Change sample sizes, decreasing sample sizes
m <- c(2,3,4,5,6,7,8,9,10,15)
for (i in seq_along(m)){
  print(m[i])
  low <- data.frame(
    temp_group = "Low (2-4.9°C)",
    CPUE = rnorm(n = m[i], mean = 10, sd = 1.2),
    temperature = runif(m[i], 2, 4.9));low
  
  medium <- data.frame(
    temp_group = "Medium (5-7.9°C)",
    CPUE = rnorm(n = m[i], mean = 6, sd = 1.3),
    temperature = runif(m[i], 5, 7.9));medium
  
  high <- data.frame(
    temp_group = "High (8-10.9°C)",
    CPUE = rnorm(n = m[i], mean = 4, sd = 1.3),
    temperature = runif(m[i], 8, 10.9));high
  data <- rbind(low, medium, high)
  linear_regression <- lm(CPUE ~ temperature, data = data)
  
  my_out <- c(slope=summary(linear_regression)$coefficients[2,1],
              p_value=summary(linear_regression)$coefficients[2,4],
              r_squared = summary(linear_regression)$r.squared);my_out
  
  print(summary(linear_regression))
  
}

# I wanted to test if changing the sample sizes would impact the p-value and r-squared of the regression. I found a significant difference (p < 0.05) with 20 samples, so I wanted to see how if I decreased the sample size that at what sample size I would not see a significant difference. Therefore, I created a for loop and included various sample sizes and found that at 2 sample sizes, I did not see a significant difference. So, a sample size of 3 would be the effective sample size (this is the answer for Question 7). 

# Change the means for each temp group for sample size of 20
mean_low <- c(5, 6, 7, 8, 9, 10, 11)
for (i in seq_along(mean_low)){
  print(mean_low[i])
  low <- data.frame(
    temp_group = "Low (2-4.9°C)",
    CPUE = rnorm(n = 20, mean = mean_low[i], sd = 1.2),
    temperature = runif(20, 2, 4.9));low
  
  medium <- data.frame(
    temp_group = "Medium (5-7.9°C)",
    CPUE = rnorm(n = m[i], mean = 6, sd = 1.3),
    temperature = runif(m[i], 5, 7.9));medium
  
  high <- data.frame(
    temp_group = "High (8-10.9°C)",
    CPUE = rnorm(n = m[i], mean = 4, sd = 1.3),
    temperature = runif(m[i], 8, 10.9));high
  data <- rbind(low, medium, high)
  linear_regression <- lm(CPUE ~ temperature, data = data)
  
  my_out <- c(slope=summary(linear_regression)$coefficients[2,1],
              p_value=summary(linear_regression)$coefficients[2,4],
              r_squared = summary(linear_regression)$r.squared);my_out
  
  print(summary(linear_regression))
  
}

## The lower the mean is for the low temperature group, the less the p value gets from the regression analysis. This does mot really have any significant management implications because you really can not alter the means (the data is the data that you collect) however, for practicing the for loop, it was helpful to do. 

# Question 7. Alternatively, for the effect sizes you originally hypothesized, what is the minimum sample size you would need in order to detect a statistically significant effect? Again, run the model a few times with the same parameter set to get a feeling for the effect of random variation in the data.

## See the comment in Question #6. The effective sample size to detect a significant difference in the linear regression would be 

# Question 8. Write up your results in a markdown file, organized with headers and different code chunks to show your analysis. Be explicit in your explanation and justification for sample sizes, means, and variances.

## Complete



### Homework 7 -------------------------------------------------------------------


# Question 1. Examine the structure of the iris data set. How many observations and variables are in the data set?
# install libraries
library(tidyverse)

# use the built in dataset of iris
data(iris)
class(iris)
glimpse(iris)
head(iris)
print(iris)

### There are 150 observations and 5 variables in the iris dataset.

# Question 2. Create a new data frame iris1 that contains only the species virginica and versicolor with sepal lengths longer than 6 cm and sepal widths longer than 2.5 cm. How many observations and variables are in the data set?

# Make iris1 data frame
iris1 <- iris %>%
  filter(Species %in% c("virginica", "versicolor") & 
           Sepal.Length > 6 & 
           Sepal.Width > 2.5)
## this does the same thing as above without piping
iris1 <- filter(iris, Species %in% c("virginica", "versicolor") & 
           Sepal.Length > 6 & 
           Sepal.Width > 2.5)

# look at the variables and observations with glimpse function
glimpse(iris1)
print(iris2)

# This reduced the dataset to 56 observations 

# Question 3. Now, create a iris2 data frame from iris1 that contains only the columns for Species, Sepal.Length, and Sepal.Width. How many observations and variables are in the data set?

# make iris2 dataframe
iris2 <- iris1 %>%
  select(Species, Sepal.Length, Sepal.Width)

# use glimpse to check the variables and observations
glimpse(iris2)
print(iris2)

# The iris2 data frame still has 56 observations (rows) and now only 3 columns

# Question 4. Create an iris3 data frame from iris2 that orders the observations from largest to smallest sepal length. Show the first 6 rows of this data set.

# make iris3 data frame and use arrange() to see the largest to smallest sepal length 
iris3 <- iris2 %>%
  arrange(desc(Sepal.Length))

print(iris3)
# Show the first 6 rows for the question
head(iris3)

# Question 5. Create an iris4 data frame from iris3 that creates a column with a sepal area (length * width) value for each observation. How many observations and variables are in the data set?

# create a new iris4 data frame and use mutate to make a new dataframe of sepal area
iris4 <- iris3 %>%
  mutate(Sepal.Area = Sepal.Length * Sepal.Width)

#use glimpse again to check the observations and variables 
glimpse(iris4)

### There are 56 observations and 4 variables in the iris4 data frame.
  
# Question 6. Create iris5 that calculates the average sepal length, the average sepal width, and the sample size of the entire iris4 data frame and print iris5.

# make iris5 and use summarize to get the means of sepal length and sepal width
iris5 <- iris4 %>%
  summarize(
    average.Sepal.Length = mean(Sepal.Length),
    average.Sepal.Width = mean(Sepal.Width),
    sample.size = n())

# Print iris5 for the question
print(iris5)

# Question 7. Finally, create iris6 that calculates the average sepal length, the average sepal width, and the sample size for each species of in the iris4 data frame and print iris6.

# make iris6 dataframe now. use the group_by function to group by the species so then we can summarize by the species for the stats
iris6 <- iris4 %>%
  group_by(Species) %>%
  summarize(
    Average.Sepal.Length = mean(Sepal.Length),
    Average.Sepal.Width = mean(Sepal.Width),
    Sample.Size = n())

# Print iris6 for the question
print(iris6)

# Question 8. In these exercises, you have successively modified different versions of the data frame iris1 iris2 iris3 iris4 iris5 iris6. At each stage, the output data frame from one operation serves as the input fro the next. A more efficient way to do this is to use the pipe operator %>% from the tidyr package. See if you can rework all of your previous statements (except for iris5) into an extended piping operation that uses iris as the input and generates irisFinal as the output.

# Create irisFinal using a single pipe sequence
irisFinal <- iris %>%
  filter(Species %in% c("virginica", "versicolor") & 
           Sepal.Length > 6 & 
           Sepal.Width > 2.5) %>%
  select(Species, Sepal.Length, Sepal.Width) %>%
  arrange(desc(Sepal.Length)) %>%
  mutate(Sepal.Area = Sepal.Length * Sepal.Width) %>%
  group_by(Species) %>%
  summarize(
    Average.Sepal.Length = mean(Sepal.Length),
    Average.Sepal.Width = mean(Sepal.Width),
    Sample.Size = n())

# check out the final output- it is the same as iris6!
print(irisFinal)

# Question 9. Create a ‘longer’ data frame using the original iris data set with three columns named “Species”, “Measure”, “Value”. The column “Species” will retain the species names of the data set. The column “Measure” will include whether the value corresponds to Sepal.Length, Sepal.Width, Petal.Length, or Petal.Width and the column “Value” will include the numerical values of those measurements.

# need to create using the pivot_longer function
iris_longer <- iris %>%
  pivot_longer(
    cols = c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),
    names_to = "Measure",
    values_to = "Value")

head(iris_longer)
# check out the entire dataframe
print(iris_longer)













# Homework 8 ------------------------

# Run the sample code. Set up a new .Rmd file for this exercise. Copy and paste the code below into different code chunks, and then read the text and run the code chunks one at a time to see what they do. You probably won’t understand everything in the code, but this is a good start for seeing some realistic uses of ggplot. We will cover most of these details in the next few weeks.
library(ggplot2) # for graphics
library(MASS) # for maximum likelihood estimation

# Code chunk # 1: Read in data vector
# quick and dirty, a truncated normal distribution to work on the solution set

# z <- rnorm(n=3000,mean=0.2)
# z <- data.frame(1:3000,z)
# names(z) <- list("ID","myVar")
# z <- z[z$myVar>0,]
# str(z)
# summary(z$myVar)

# Try it with your own data.
# Once the code is in and runs, try running this analysis on your own data (or data from your lab, or data from a published paper; if you’re stumped, check out publicly available data sets on Dryad, ESA, or the LTER Network). Find a vector of data (of any size), set it up in a .csv file, and read the data into a data frame with this code chunk:

# z <- read.table("MyDataFile.csv",header=TRUE,sep=",")
# str(z)
# summary(z)

# This is freshwater drum total length data (along with depth data where the drum were captured) that were collected from Lake Erie using a bottom trawl. 
z <- read.table("DrumLengths.csv",header=TRUE,sep=",")
str(z)
summary(z)

# Once your data are in, go ahead and comment out the “fake data” that are simulated in the chunk below. At that point, if you compile the entire file, it should run all of the code on your own data. Be sure to add comments to the code and commentary to the .Rmd file so that you can go back to it later and understand and use the code in your work

# Code Chunk # 2: plot histogram of data
# Plot a histogram of the data, using a modification of the code from lecture. Here we are switching from qplot to ggplot for more graphics options. We are also rescaling the y axis of the histogram from counts to density, so that the area under the histogram equals 1.0.

p1 <- ggplot(data=z, aes(x=myVar, y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2) 
print(p1)

# Code Chunk # 3: add empirical density curve
# Now modify the code to add in a kernel density plot of the data. This is an empirical curve that is fitted to the data. It does not assume any particular probability distribution, but it smooths out the shape of the histogram:

p1 <-  p1 +  geom_density(linetype="dotted",size=0.75)
print(p1)

# Code Chunk # 4: Get maximum likelihood parameters for normal
# Next, fit a normal distribution to your data and grab the maximum likelihood estimators of the two parameters of the normal, the mean and the variance

normPars <- fitdistr(z$myVar,"normal")
print(normPars)
str(normPars)
normPars$estimate["mean"] # note structure of getting a named attribute


# Code Chunk # 5: Plot normal probability density
# Now let’s call the dnorm function inside ggplot’s stat_function to generate the probability density for the normal distribution. Read about stat_function in the help system to see how you can use this to add a smooth function to any ggplot. Note that we first get the maximum likelihood parameters for a normal distribution fitted to thse data by calling fitdistr. Then we pass those parameters (meanML and sdML to stat_function):

meanML <- normPars$estimate["mean"]
sdML <- normPars$estimate["sd"]

xval <- seq(0,max(z$myVar),len=length(z$myVar))

stat <- stat_function(aes(x = xval, y = ..y..), fun = dnorm, colour="red", n = length(z$myVar), args = list(mean = meanML, sd = sdML))
p1 + stat

# Notice that the best-fitting normal distribution (red curve) for these data actually has a biased mean. That is because the data set has no negative values, so the normal distribution (which is symmetric) is not working well.

# Code Chunk # 6: Plot exponential probability density
# Now let’s use the same template and add in the curve for the exponential:
expoPars <- fitdistr(z$myVar,"exponential")
rateML <- expoPars$estimate["rate"]

stat2 <- stat_function(aes(x = xval, y = ..y..), fun = dexp, colour="blue", n = length(z$myVar), args = list(rate=rateML))
p1 + stat + stat2


# Code Chunk # 7: Plot uniform probability density
# For the uniform, we don’t need to use fitdistr because the maximum likelihood estimators of the two parameters are just the minimum and the maximum of the data:
stat3 <- stat_function(aes(x = xval, y = ..y..), fun = dunif, colour="darkgreen", n = length(z$myVar), args = list(min=min(z$myVar), max=max(z$myVar)))
p1 + stat + stat2 + stat3

# Code Chunk # 8: Plot gamma probability density
gammaPars <- fitdistr(z$myVar,"gamma")
shapeML <- gammaPars$estimate["shape"]
rateML <- gammaPars$estimate["rate"]

stat4 <- stat_function(aes(x = xval, y = ..y..), fun = dgamma, colour="brown", n = length(z$myVar), args = list(shape=shapeML, rate=rateML))
p1 + stat + stat2 + stat3 + stat4


# Code Chunk # 9: Plot beta probability density
# This one has to be shown in its own plot because the raw data must be rescaled so they are between 0 and 1, and then they can be compared to the beta.

pSpecial <- ggplot(data=z, aes(x=myVar/(max(myVar + 0.1)), y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2) + 
  xlim(c(0,1)) +
  geom_density(size=0.75,linetype="dotted")

betaPars <- fitdistr(x=z$myVar/max(z$myVar + 0.1),start=list(shape1=1,shape2=2),"beta")
shape1ML <- betaPars$estimate["shape1"]
shape2ML <- betaPars$estimate["shape2"]

statSpecial <- stat_function(aes(x = xval, y = ..y..), fun = dbeta, colour="orchid", n = length(z$myVar), args = list(shape1=shape1ML,shape2=shape2ML))
pSpecial + statSpecial

# Question # 3: Find best-fitting distribution. Take a look at the second-to-last graph which shows the histogram of your data and 4 probability density curves (normal, uniform, exponential, gamma) that are fit to the data. Find the best-fitting distribution for your data. For most data sets, the gamma will probably fit best, but if you data set is small, it may be very hard to see much of a difference between the curves. The beta distribution in the final graph is somewhat special. It often fits the data pretty well, but that is because we have assumed the largest data point is the true upper bound, and everything is scaled to that. The fit of the uniform distribution also fixes the upper bound. The other curves (normal, exponential, and gamma) are more realistic because they do not have an upper bound.

# I found that the normal probability density looks like the best fit to my freshwater drum length data. 

# Question # 4: Simulate a new data set. Using the best-fitting distribution, go back to the code and get the maximum likelihood parameters. Use those to simulate a new data set, with the same length as your original vector, and plot that in a histogram and add the probability density curve. Right below that, generate a fresh histogram plot of the original data, and also include the probability density curve.

## Simulate new freshwater drum length data with the same length as the original data set (n = 1075)
set.seed(25) 

# get the length of the original data
n <- length(z$myVar)

# get the mean and sd to generate random data
z2 <- rnorm(n, mean = normPars$estimate["mean"], sd = normPars$estimate["sd"])

# make this into a dataframe
z2 <- data.frame(1:1075,z2)

# make column names similar to original data
names(z2) <- list("ID","myVar")
z2 <- z2[z2$myVar>0,]
str(z2)
summary(z2$myVar)

# make a histogram plot of the simulated data
p2 <- ggplot(data=z2, aes(x=myVar, y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2) 
print(p2)

# Code Chunk # 3: add empirical density curve
p2 <-  p2 +  geom_density(linetype="dotted",size=0.75)
print(p2)

# Code Chunk # 4: Get maximum likelihood parameters for normal distribution for the simulated data
normPars2 <- fitdistr(z2$myVar,"normal")
print(normPars2)
str(normPars2)
normPars2$estimate["mean"] # note structure of getting a named attribute

# Code Chunk # 5: Plot normal probability density for the simulated data
meanML2 <- normPars2$estimate["mean"]
sdML2 <- normPars2$estimate["sd"]

xval2 <- seq(0,max(z2$myVar),len=length(z2$myVar))

stat2 <- stat_function(aes(x = xval2, y = ..y..), fun = dnorm, colour="red", n = length(z2$myVar), args = list(mean = meanML2, sd = sdML2))
# simulated data
p2 + stat2

# raw drum data
p1 + stat

# Question #5: How do the two histogram profiles compare? Do you think the model is doing a good job of simulating realistic data that match your original measurements? Why or why not?

# The two histograms show similar overall patterns with comparable data spreads, both approximating a normal distribution. However, the original data exhibits more irregularities with multiple peaks and valleys (multimodality), while the simulated data presents a smoother, more idealized normal shape. This is likely from the the simulated data being generated purely from normal distribution, whereas real data often contains natural variability (collected in the field), and perhaps some measurement error. While the normal distribution approximates the overall shape of the original data, a more complex distribution might be needed to accurately model the data, or the irregularities in the original data represent random noise rather than meaningful structure. 

# Question # 6: If you have entered a large data frame with many columns, try running all of the code on a different variable to see how the simulation performs

# I also ran this data using the depth data in the original dataset. This is cool code and it is fun to play around to see how the simulation preforms







# Homework 9 ---------
# load libraries ----
library(pracma)
library(pryr)
library(devtools)
install_github("ngotelli/upscaler")
help(package="upscaler")
library(upscaler)

# Script to find "countdata" CSV files in multiple year folders
# This script assumes you have a main directory with 10 year folders

# Set the main directory path where your year folders are located
# Replace this with your actual path
main_dir <- "path/to/your/main/directory"

# List all year folders
year_folders <- list.dirs(main_dir, full.names = TRUE, recursive = FALSE)

# Initialize an empty list to store the countdata file paths
countdata_files <- c()

# Loop through each year folder
for (folder in year_folders) {
  # List all files in the current folder
  files <- list.files(folder, full.names = TRUE, pattern = "\\.csv$")
  
  # Find files with "countdata" in their name
  countdata_in_folder <- files[grep("countdata", files, ignore.case = TRUE)]
  
  # Add found files to our list
  countdata_files <- c(countdata_files, countdata_in_folder)
  
  # Print the files found in this folder
  cat("Found in folder", basename(folder), ":\n")
  if (length(countdata_in_folder) > 0) {
    for (file in countdata_in_folder) {
      cat("  -", basename(file), "\n")
    }
  } else {
    cat("  No countdata files found\n")
  }
  cat("\n")
}

# Print the total number of countdata files found
cat("Total countdata files found:", length(countdata_files), "\n")

# Optional: Save the file paths to a text file
write.table(countdata_files, file = "countdata_file_list.txt", 
            row.names = FALSE, col.names = FALSE, quote = FALSE)

# If you want to immediately read these files into a list of dataframes:
countdata_list <- list()

for (file in countdata_files) {
  # Extract year from filename (adjust the pattern as needed)
  year_match <- regexpr("\\d{6}", basename(file))
  year <- NA
  if (year_match > 0) {
    year_str <- substr(basename(file), year_match, year_match + 5)
    year <- substr(year_str, 1, 4)  # Extract just the year part
  }
  
  # Read the CSV file
  data <- read.csv(file)
  
  # Store in list with year as name
  if (!is.na(year)) {
    countdata_list[[year]] <- data
  } else {
    # Use the file basename if year extraction fails
    countdata_list[[basename(file)]] <- data
  }
}

# Print the names of the dataframes in the list
cat("Dataframes created:\n")
print(names(countdata_list))






# homework 4

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


# Question 2 ----------------------------------
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

# Question 3 ------------------------------------
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

# Create the data
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
scatter_plot <- ggplot(data, aes(x = temperature, y = CPUE)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", color = "blue") +
  labs(
    title = "Linear Regression: CPUE vs Temperature",
    x = "Temperature (°C)",
    y = "CPUE (fish/hour)"
  ) + theme(plot.title = element_text(size = 10));scatter_plot


# Question 5. Try running your analysis multiple times to get a feeling for how variable the results are with the same parameters, but different sets of random numbers.

## I have rerun the code above so that the random numbers change each time to see the differences!

# Question 6. Now, using a series of for loops, adjust the parameters of your data to explore how they might impact your results/analysis, and store the results of your for loops into an object so you can view it. For example, what happens if you were to start with a small sample size and then re-run your analysis? Would you still get a significant result? What if you were to increase that sample size by 5, or 10? How small can your sample size be before you detect a significant pattern (p < 0.05)? How small can the differences between the groups be (the “effect size”) for you to still detect a significant pattern?
# Set seed for reproducibility
set.seed(25)

# Change sample sizes
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

## Check Homework_6 tab for Markdown
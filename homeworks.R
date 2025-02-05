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

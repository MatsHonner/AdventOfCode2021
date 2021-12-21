library(tidyverse)

# test 1
df <- readLines("c:\\R\\advent_code\\2021\\day13_test.txt")
split <- which(df == "")
values <- df[1:(split-1)]
values <- as.data.frame(str_split(values, ",", simplify = TRUE))
colnames(values) <- c("x", "y")
values$x <- as.numeric(values$x) + 1 # starts at zero...
values$y <- as.numeric(values$y) + 1 # starts at zero...
commands <- df[(split+1):length(df)]
direction <- str_extract(commands, "\\w(?==)")
steps <- str_extract(commands, "(?<==)\\d+")
commands <- as.data.frame(cbind(direction, steps))
commands$steps <- as.numeric(commands$steps) + 1 # starts at zero...

max_x <- max(values$x)
max_y <- max(values$y)
m <- matrix(0, nrow = max_y, ncol = max_x)
for (i in 1:nrow(values)) {
  m[values[i,]$y, values[i,]$x] <- 1
}

# fold along y
upper_part <- m[1:(commands$steps[1]-1), 1:max_x]
lower_part <- m[(commands$steps[1]+1):max_y, 1:max_x]
mirror_lower_part <- matrix(0, nrow = min(nrow(upper_part), nrow(lower_part)), ncol = min(ncol(upper_part), ncol(lower_part)))
for (i in 1:nrow(mirror_lower_part)) {
  mirror_lower_part[i,] <- lower_part[(nrow(mirror_lower_part)+1)-i,]
}
m <- upper_part + mirror_lower_part
m[m>=2] <- 1
sum(m)

# fold along x
m <- t(m)
upper_part <- m[1:(commands$steps[1]-1), 1:max_x]
lower_part <- m[(commands$steps[1]+1):max_y, 1:max_x]
mirror_lower_part <- matrix(0, nrow = min(nrow(upper_part), nrow(lower_part)), ncol = min(ncol(upper_part), ncol(lower_part)))
for (i in 1:nrow(mirror_lower_part)) {
  mirror_lower_part[i,] <- lower_part[(nrow(mirror_lower_part)+1)-i,]
}
m <- upper_part + mirror_lower_part
m[m>=2] <- 1
m <- t(m)
sum(m)

# 1
df <- readLines("c:\\R\\advent_code\\2021\\day13.txt")
split <- which(df == "")
values <- df[1:(split-1)]
values <- as.data.frame(str_split(values, ",", simplify = TRUE))
colnames(values) <- c("x", "y")
values$x <- as.numeric(values$x) + 1 # starts at zero...
values$y <- as.numeric(values$y) + 1 # starts at zero...
commands <- df[(split+1):length(df)]
direction <- str_extract(commands, "\\w(?==)")
steps <- str_extract(commands, "(?<==)\\d+")
commands <- as.data.frame(cbind(direction, steps))
commands$steps <- as.numeric(commands$steps) + 1 # starts at zero...

max_x <- max(values$x)
max_y <- max(values$y)
m <- matrix(0, nrow = max_y, ncol = max_x)
for (i in 1:nrow(values)) {
  m[values[i,]$y, values[i,]$x] <- 1
}

# fold along y
upper_part <- m[1:(commands$steps[1]-1), 1:max_x]
lower_part <- m[(commands$steps[1]+1):max_y, 1:max_x]
mirror_lower_part <- matrix(0, nrow = min(nrow(upper_part), nrow(lower_part)), ncol = min(ncol(upper_part), ncol(lower_part)))
for (i in 1:nrow(mirror_lower_part)) {
  mirror_lower_part[i,] <- lower_part[(nrow(mirror_lower_part)+1)-i,]
}
m <- upper_part + mirror_lower_part
m[m>=2] <- 1
sum(m)

# fold along x
m <- t(m)
upper_part <- m[1:(commands$steps[1]-1), 1:max_x]
lower_part <- m[(commands$steps[1]+1):max_y, 1:max_x]
mirror_lower_part <- matrix(0, nrow = min(nrow(upper_part), nrow(lower_part)), ncol = min(ncol(upper_part), ncol(lower_part)))
for (i in 1:nrow(mirror_lower_part)) {
  mirror_lower_part[i,] <- lower_part[(nrow(mirror_lower_part)+1)-i,]
}
m <- upper_part + mirror_lower_part
m[m>=2] <- 1
m <- t(m)
sum(m)


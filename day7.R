library(tidyverse)
library(tictoc)

# test
p <- readLines("c:\\R\\advent_code\\2021\\day7_test.txt")
p <- str_split(p, ",")
p <- unlist(p)
p <- as.numeric(p)

lowest_pos <- min(p)
highest_pos <- max(p)
lowest_value <- Inf

tic()
for (i in lowest_pos:highest_pos) {
  lowest_value <- ifelse(sum(abs(p-i)) < lowest_value, sum(abs(p-i)), lowest_value)
}
toc()
lowest_value

# 1
p <- readLines("c:\\R\\advent_code\\2021\\day7.txt")
p <- str_split(p, ",")
p <- unlist(p)
p <- as.numeric(p)

lowest_pos <- min(p)
highest_pos <- max(p)
lowest_value <- Inf

tic()
for (i in lowest_pos:highest_pos) {
  lowest_value <- ifelse(sum(abs(p-i)) < lowest_value, sum(abs(p-i)), lowest_value)
}
toc()
lowest_value


# 2
calc_cost <- function(s) {
  cost <- 0 
  for (i in 1:s) {
    cost <- cost + i
  }
  return(cost)
}

calc_total_cost <- function(s) {
  cost <- 0
  for (i in 1:length(s)) {
    cost <- cost + calc_cost(s[i])
  }
  return(cost)
}

p <- readLines("c:\\R\\advent_code\\2021\\day7.txt")
p <- str_split(p, ",")
p <- unlist(p)
p <- as.numeric(p)

lowest_pos <- min(p)
highest_pos <- max(p)
lowest_value <- Inf

tic()
for (i in lowest_pos:highest_pos) {
  lowest_value <- ifelse(calc_total_cost(abs(p-i)) < lowest_value, calc_total_cost(abs(p-i)), lowest_value)
}
toc()
lowest_value



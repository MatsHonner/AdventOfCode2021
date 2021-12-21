library(tidyverse)
library(tictoc)

# test
df <- readLines("c:\\R\\advent_code\\2021\\day14_test.txt")
split <- which(df == "")
s <- df[1:(split-1)]
rules <- df[(split+1):length(df)]
rules <- as.data.frame(str_split(rules, " -> ", simplify = TRUE))
colnames(rules) <- c("trigger", "insert")

s_old <- s
s_new <- ""
for (i in 1:15) {
  tic()
  for (j in 1:(nchar(s_old)-1)) {
    next_two <- str_sub(s_old, 1, 2)
    if (next_two %in% rules$trigger) {
      s_new <- paste0(s_new, str_sub(s_old,1,1))
      s_new <- paste0(s_new, rules[rules$trigger == next_two, "insert"])
      s_old <- str_sub(s_old,2,nchar(s_old))
    }
    else {
      s_new <- paste0(s_new, str_sub(s_old,1,1))
      s_old <- str_sub(s_old,2,nchar(s_old))
    }
  }
  s_new <- paste0(s_new, str_sub(s_old,nchar(s_old),1))
  s_old <- s_new
  s_new <- ""

  print(paste0("#", i, ", ", nchar(s_old)))
  toc()
}

t <- str_split(s_old, "", simplify = TRUE)
t_sum <- table(t)
print(max(t_sum) - min(t_sum))

# 1
df <- readLines("c:\\R\\advent_code\\2021\\day14.txt")
split <- which(df == "")
s <- df[1:(split-1)]
rules <- df[(split+1):length(df)]
rules <- as.data.frame(str_split(rules, " -> ", simplify = TRUE))
colnames(rules) <- c("trigger", "insert")

s_old <- s
s_new <- ""
for (i in 1:10) {
  for (i in 1:(nchar(s_old)-1)) {
    next_two <- str_sub(s_old, 1, 2)
    if (next_two %in% rules$trigger) {
      s_new <- paste0(s_new, str_sub(s_old,1,1))
      s_new <- paste0(s_new, rules[rules$trigger == next_two, "insert"])
      s_old <- str_sub(s_old,2,nchar(s_old))
    }
    else {
      s_new <- paste0(s_new, str_sub(s_old,1,1))
      s_old <- str_sub(s_old,2,nchar(s_old))
    }
  }
  s_new <- paste0(s_new, str_sub(s_old,nchar(s_old),1))
  s_old <- s_new
  s_new <- ""
  print(nchar(s_old))
}

t <- str_split(s_old, "", simplify = TRUE)
t_sum <- table(t)
print(max(t_sum) - min(t_sum))

# 2
df <- readLines("c:\\R\\advent_code\\2021\\day14.txt")
split <- which(df == "")
s <- df[1:(split-1)]
rules <- df[(split+1):length(df)]
rules <- as.data.frame(str_split(rules, " -> ", simplify = TRUE))
colnames(rules) <- c("trigger", "insert")

s_old <- s
s_new <- ""
for (i in 1:40) {
  tic()
  for (j in 1:(nchar(s_old)-1)) {
    next_two <- str_sub(s_old, 1, 2)
    if (next_two %in% rules$trigger) {
      s_new <- paste0(s_new, str_sub(s_old,1,1))
      s_new <- paste0(s_new, rules[rules$trigger == next_two, "insert"])
      s_old <- str_sub(s_old,2,nchar(s_old))
    }
    else {
      s_new <- paste0(s_new, str_sub(s_old,1,1))
      s_old <- str_sub(s_old,2,nchar(s_old))
    }
  }
  s_new <- paste0(s_new, str_sub(s_old,nchar(s_old),1))
  s_old <- s_new
  s_new <- ""
  
  print(paste0("#", i, ", ", nchar(s_old)))
  toc()
}

t <- str_split(s_old, "", simplify = TRUE)
t_sum <- table(t)
print(max(t_sum) - min(t_sum))



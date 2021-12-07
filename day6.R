library(tidyverse)

# test
df <- readLines("c:\\R\\advent_code\\2021\\day6_test.txt")
df <- str_split(df, ",")
df <- unlist(df)
df <- table(df)
df <- as.data.frame(df, stringsAsFactors = FALSE)
df[, 1] <- as.numeric(df[, 1]) + 1 # +1 to adapt to R starting a vector with 1, not 0

board <- rep(0, 9)
for (i in 1:nrow(df)) {
  board[df[i, 1]] <- df[i, 2]
}

for (i in 1:80) {
  was_one <- board[1]
  board[1] <- board[2]
  board[2] <- board[3]
  board[3] <- board[4]
  board[4] <- board[5]
  board[5] <- board[6]
  board[6] <- board[7]
  board[7] <- board[8]
  board[8] <- board[9]
  board[9] <- 0
  board[7] <- board[7] + was_one
  board[9] <- was_one
}

sum(board)

# 1
df <- readLines("c:\\R\\advent_code\\2021\\day6.txt")
df <- str_split(df, ",")
df <- unlist(df)
df <- table(df)
df <- as.data.frame(df, stringsAsFactors = FALSE)
df[, 1] <- as.numeric(df[, 1]) + 1 # +1 to adapt to R starting a vector with 1, not 0

board <- rep(0, 9)
for (i in 1:nrow(df)) {
  board[df[i, 1]] <- df[i, 2]
}

for (i in 1:80) {
  was_one <- board[1]
  board[1] <- board[2]
  board[2] <- board[3]
  board[3] <- board[4]
  board[4] <- board[5]
  board[5] <- board[6]
  board[6] <- board[7]
  board[7] <- board[8]
  board[8] <- board[9]
  board[9] <- 0
  board[7] <- board[7] + was_one
  board[9] <- was_one
}

sum(board)

# 2
df <- readLines("c:\\R\\advent_code\\2021\\day6.txt")
df <- str_split(df, ",")
df <- unlist(df)
df <- table(df)
df <- as.data.frame(df, stringsAsFactors = FALSE)
df[, 1] <- as.numeric(df[, 1]) + 1 # +1 to adapt to R starting a vector with 1, not 0

board <- rep(0, 9)
for (i in 1:nrow(df)) {
  board[df[i, 1]] <- df[i, 2]
}

for (i in 1:256) {
  was_one <- board[1]
  board[1] <- board[2]
  board[2] <- board[3]
  board[3] <- board[4]
  board[4] <- board[5]
  board[5] <- board[6]
  board[6] <- board[7]
  board[7] <- board[8]
  board[8] <- board[9]
  board[9] <- 0
  board[7] <- board[7] + was_one
  board[9] <- was_one
}

sum(board)




library(tidyverse)

wr_line <- function(b, l) { # board, line
  if (l$is_horisontal_line) {
    for (i in l$y1:l$y2) {
      b[i, l$x1] <- b[i, l$x1] + 1
    }
  }
  else {
    for (i in l$x1:l$x2) {
      b[l$y1, i] <- b[l$y1, i] + 1
    }
  }
  return(b)
}

# test
df <- readLines("c:\\R\\advent_code\\2021\\day5_test.txt")
df <- data.frame(df)

s <- str_extract_all(df$df, "[0-9]+", simplify = TRUE)
colnames(s) <- c("x1", "y1", "x2", "y2")
s <- data.frame(s)
s[, 1] <- as.numeric(s[, 1])
s[, 2] <- as.numeric(s[, 2])
s[, 3] <- as.numeric(s[, 3])
s[, 4] <- as.numeric(s[, 4])
s <- s + 1 # adapt to R having matrices starting with '1'...

# keep only horisontal and vertical lines
s <- s %>% filter(x1 == x2 | y1 == y2)
s$is_horisontal_line <- ifelse(s$x1 == s$x2, TRUE, FALSE)

board <- matrix(0, nrow = 10, ncol = 10)

s
for (i in 1:nrow(s)) {
  board <- wr_line(board, s[i, ])
}
board

board[board == 1] <- 0
board

board[board > 1] <- 1
sum(colSums(board))

# 1
df <- readLines("c:\\R\\advent_code\\2021\\day5.txt")
df <- data.frame(df)

s <- str_extract_all(df$df, "[0-9]+", simplify = TRUE)
colnames(s) <- c("x1", "y1", "x2", "y2")
s <- data.frame(s)
s[, 1] <- as.numeric(s[, 1])
s[, 2] <- as.numeric(s[, 2])
s[, 3] <- as.numeric(s[, 3])
s[, 4] <- as.numeric(s[, 4])
s <- s + 1 # adapt to R having matrices starting with '1'...

# keep only horisontal and vertical lines
s <- s %>% filter(x1 == x2 | y1 == y2)
s$is_horisontal_line <- ifelse(s$x1 == s$x2, TRUE, FALSE)

board <- matrix(0, nrow = 1000, ncol = 1000)

for (i in 1:nrow(s)) {
  board <- wr_line(board, s[i, ])
}

board[board == 1] <- 0 # remove all single points
board[board > 1] <- 1 # make all multiple points 1, to sum them up...
sum(colSums(board))


# test
wr_line <- function(b, l) { # board, line
  if (l$direction == "horizontal") {
    for (i in l$y1:l$y2) {
      b[i, l$x1] <- b[i, l$x1] + 1
    }
  }
  else if (l$direction == "vertical") {
    for (i in l$x1:l$x2) {
      b[l$y1, i] <- b[l$y1, i] + 1
    }
  }
  else { # diagonal...
    x <- numeric()
    y <- numeric()
    for (i in 1:abs(l$x1-l$x2)) {
      if (l$x1-l$x2 < 0) {x[i] <- l$x1 + i}
      else {x[i] <- l$x1 - i}
      if (l$y1-l$y2 < 0) {y[i] <- l$y1 + i}
      else {y[i] <- l$y1 - i}
    }
    x <- c(l$x1, x)
    y <- c(l$y1, y)
    for (i in 1:(abs(l$x1-l$x2)+1)) {
      b[y[i], x[i]] <- b[y[i], x[i]] + 1
    }
  }
  return(b)
}

df <- readLines("c:\\R\\advent_code\\2021\\day5_test.txt")
df <- data.frame(df)

s <- str_extract_all(df$df, "[0-9]+", simplify = TRUE)
colnames(s) <- c("x1", "y1", "x2", "y2")
s <- data.frame(s)
s[, 1] <- as.numeric(s[, 1])
s[, 2] <- as.numeric(s[, 2])
s[, 3] <- as.numeric(s[, 3])
s[, 4] <- as.numeric(s[, 4])
s <- s + 1 # adapt to R having matrices starting with '1'...

s$direction <- case_when(
  s$x1 == s$x2 ~ "horizontal",
  s$y1 == s$y2 ~ "vertical",
  TRUE ~ "diagonal"
)

board <- matrix(0, nrow = 10, ncol = 10)

for (i in 1:nrow(s)) {
  board <- wr_line(board, s[i, ])
}

board[board == 1] <- 0 # remove all single points
board[board > 1] <- 1 # make all multiple points 1, to sum them up...
sum(colSums(board))



l <- s[9,]
x <- numeric()
y <- numeric()

for (i in 1:abs(l$x1-l$x2)) {
  if (l$x1-l$x2 < 0) {x[i] <- l$x1 + i}
  else {x[i] <- l$x1 - i}
  if (l$y1-l$y2 < 0) {y[i] <- l$y1 + i}
  else {y[i] <- l$y1 - i}
}
x <- c(l$x1, x)
y <- c(l$y1, y)
for (i in 1:(abs(l$x1-l$x2)+1)) {
  board[y[i], x[i]] <- board[y[i], x[i]] + 1
}
board




# 2
wr_line <- function(b, l) { # board, line
  if (l$direction == "horizontal") {
    for (i in l$y1:l$y2) {
      b[i, l$x1] <- b[i, l$x1] + 1
    }
  }
  else if (l$direction == "vertical") {
    for (i in l$x1:l$x2) {
      b[l$y1, i] <- b[l$y1, i] + 1
    }
  }
  else { # diagonal...
    x <- numeric()
    y <- numeric()
    for (i in 1:abs(l$x1-l$x2)) {
      if (l$x1-l$x2 < 0) {x[i] <- l$x1 + i}
      else {x[i] <- l$x1 - i}
      if (l$y1-l$y2 < 0) {y[i] <- l$y1 + i}
      else {y[i] <- l$y1 - i}
    }
    x <- c(l$x1, x)
    y <- c(l$y1, y)
    for (i in 1:(abs(l$x1-l$x2)+1)) {
      b[y[i], x[i]] <- b[y[i], x[i]] + 1
    }
  }
  return(b)
}

df <- readLines("c:\\R\\advent_code\\2021\\day5.txt")
df <- data.frame(df)

s <- str_extract_all(df$df, "[0-9]+", simplify = TRUE)
colnames(s) <- c("x1", "y1", "x2", "y2")
s <- data.frame(s)
s[, 1] <- as.numeric(s[, 1])
s[, 2] <- as.numeric(s[, 2])
s[, 3] <- as.numeric(s[, 3])
s[, 4] <- as.numeric(s[, 4])
s <- s + 1 # adapt to R having matrices starting with '1'...

s$direction <- case_when(
  s$x1 == s$x2 ~ "horizontal",
  s$y1 == s$y2 ~ "vertical",
  TRUE ~ "diagonal"
)

board <- matrix(0, nrow = 1000, ncol = 1000)

for (i in 1:nrow(s)) {
  board <- wr_line(board, s[i, ])
}

board[board == 1] <- 0 # remove all single points
board[board > 1] <- 1 # make all multiple points 1, to sum them up...
sum(colSums(board))


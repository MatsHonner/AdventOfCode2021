library(tidyverse)

`%!in%` = Negate(`%in%`) #macro for negating the %in%

# 1
mark_board <- function(b, num) {
  for(x in 1:5) {
    for(y in 1:5) {
      b[x, y] <- ifelse(b[x, y] == num, NA, b[x, y])
    }
  }
  return(b)
}
check_board <- function(b) {
  # check all rows
  for(i in 1:5){
    if(all(is.na(b[i,]))) {
      return(TRUE)
    }
  }
  # check all columns
  for(i in 1:5){
    if(all(is.na(b[,i]))) {
      return(TRUE)
    }
  }
  return(FALSE)
}
sum_board <- function(b) {
  return(sum(rowSums(b, na.rm = TRUE)))
}

# Get and set up the numbers and boards
numbers <- readLines("c:\\R\\advent_code\\2021\\day4_numbers.txt") %>% as.numeric()
boards <- readLines("c:\\R\\advent_code\\2021\\day4_boards.txt")
s <- str_extract_all(boards, "[0-9]+")
s <- unlist(s)
s <- as.numeric(s)

x <- seq(1, 2500, 25)
#x <- seq(1, 25, 25)
y <- 1
boards_list <- list()
for(i in x) {
  boards_list[[y]] <- matrix(s[i:(i+24)], nrow = 5, ncol = 5, , byrow = TRUE)
  y <- y + 1
}

# 1
# Mark and check the boards
for(i in numbers) {
  # Mark every board, for each number
  for(j in 1:length(boards_list)) {
    boards_list[[j]] <- mark_board(boards_list[[j]], i)
  }
  # Check every board
  for(j in 1:length(boards_list)) {
    if(check_board(boards_list[[j]])) { # if bingo then print the final answer
      print(sum_board(boards_list[[j]]) * i)
#      stop()
    }
  }
  
}

# 2
numbers <- readLines("c:\\R\\advent_code\\2021\\day4_numbers.txt") %>% as.numeric()
#numbers <- readLines("c:\\R\\advent_code\\2021\\day4_numbers_test.txt") %>% as.numeric()
boards <- readLines("c:\\R\\advent_code\\2021\\day4_boards.txt")
#boards <- readLines("c:\\R\\advent_code\\2021\\day4_boards_test.txt")
s <- str_extract_all(boards, "[0-9]+")
s <- unlist(s)
s <- as.numeric(s)

x <- seq(1, 2500, 25)
#x <- seq(1, 75, 25)
y <- 1
boards_list <- list()
for(i in x) {
  boards_list[[y]] <- matrix(s[i:(i+24)], nrow = 5, ncol = 5, , byrow = TRUE)
  y <- y + 1
}


# Mark and check the boards
finished_boards <- numeric()
for(i in numbers) {
  # Mark every board, for each number
  for(j in 1:length(boards_list)) {
    boards_list[[j]] <- mark_board(boards_list[[j]], i)
  }
  # Check every board
  for(j in 1:length(boards_list)) {
    if(check_board(boards_list[[j]]) & j %!in% finished_boards) { # if bingo and not already ready
      finished_boards <- c(finished_boards, j)
      if (length(finished_boards) == 100) {
#      if (length(finished_boards) == 3) {
        print(sum_board(boards_list[[j]]) * i)
        stop()
      }
    }
  }
}




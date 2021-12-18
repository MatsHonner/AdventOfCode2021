library(tidyverse)

count_flashes <- 0

increase_cells_around_the_flash <- function(x, y, m) {
  for (i in (x-1):(x+1)) {
    for (j in (y-1):(y+1)) {
      if (!is.na(m[j, i]) & m[j, i] != 0) {m[j, i] <- m[j, i] + 1}
    }
  }
  return(m)
}

increase_by_1 <- function (m) {
  for (x in 2:(ncol(m)-1)) {
    for (y in 2:(nrow(m)-1)) {
      m[y, x] <- m[y, x] + 1
    }
  }
  return(m)
}

flash <- function(m) {
  no_more_flashes <- TRUE
  repeat {
    for (x in 2:(ncol(m)-1)) {
      for (y in 2:(nrow(m)-1)) {
        if (m[y, x] > 9) {
          no_more_flashes <- FALSE
          assign("count_flashes", count_flashes+1, envir = .GlobalEnv)
          m[y, x] <- 0
          m <- increase_cells_around_the_flash(x, y, m)
        }
      }
    }
    
    if (no_more_flashes) {break()}
    else {no_more_flashes <- TRUE}
  }
  return(m)
}

# test 1
df <- readLines("c:\\R\\advent_code\\2021\\day11_test1.txt")

m_raw <- str_split(df, "", simplify = TRUE)
class(m_raw) <- "numeric"
# Surround the matrix with NAs to indicate edges
m <- cbind(c(NA), m_raw, c(NA))
m <- rbind(c(NA), m, c(NA))

m <- increase_by_1(m)
m <- flash(m)
m


# test 2
df <- readLines("c:\\R\\advent_code\\2021\\day11_test2.txt")

m_raw <- str_split(df, "", simplify = TRUE)
class(m_raw) <- "numeric"
# Surround the matrix with NAs to indicate edges
m <- cbind(c(NA), m_raw, c(NA))
m <- rbind(c(NA), m, c(NA))

for (i in 1:100) {
  m <- increase_by_1(m)
  m <- flash(m)
}
m
count_flashes

# 1
df <- readLines("c:\\R\\advent_code\\2021\\day11.txt")

m_raw <- str_split(df, "", simplify = TRUE)
class(m_raw) <- "numeric"
# Surround the matrix with NAs to indicate edges
m <- cbind(c(NA), m_raw, c(NA))
m <- rbind(c(NA), m, c(NA))

for (i in 1:100) {
  m <- increase_by_1(m)
  m <- flash(m)
}
m
count_flashes





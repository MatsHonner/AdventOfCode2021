library(tidyverse)


is_lowest <- function(m) { # return True if center cell is the lowest of the 3.3 matrix m. NAs on the edges...
  lowest <- FALSE
  lowest <- case_when(
    is.na(m[2,1]) & is.na(m[1,2]) ~ m[2,2]<m[3,2] & m[2,2]<m[2,3], # upper left corner
    is.na(m[1,2]) & is.na(m[2,3]) ~ m[2,2]<m[2,1] & m[2,2]<m[3,2], # upper right corner
    is.na(m[2,3]) & is.na(m[3,2]) ~ m[2,2]<m[1,2] & m[2,2]<m[2,1], # lower right corner
    is.na(m[2,1]) & is.na(m[3,2]) ~ m[2,2]<m[1,2] & m[2,2]<m[2,3], # lower left corner
    is.na(m[1,2]) ~                 m[2,2]<m[2,1] & m[2,2]<m[3,2] & m[2,2]<m[2,3], # upper row
    is.na(m[2,3]) ~                 m[2,2]<m[1,2] & m[2,2]<m[2,1] & m[2,2]<m[3,2], # right row
    is.na(m[3,2]) ~                 m[2,2]<m[2,1] & m[2,2]<m[1,2] & m[2,2]<m[2,3], # lower row
    is.na(m[2,1]) ~                 m[2,2]<m[1,2] & m[2,2]<m[2,3] & m[2,2]<m[3,2], # left row
    TRUE ~                          m[2,2]<m[1,2] & m[2,2]<m[2,3] & m[2,2]<m[3,2] & m[2,2]<m[2,1] # anywhere in the middle...
  )
  return(lowest)
}

pick_a_matrix <- function(x, y, m) { # find the 3x3 matrix square around coordinates x, y in matrix m
  return(m[(y-1):(y+1),(x-1):(x+1)])
}


# test
df <- readLines("c:\\R\\advent_code\\2021\\day9_test.txt")

m_raw <- str_split(df, "", simplify = TRUE)
class(m_raw) <- "numeric"
# Surround the matrix with NAs to indicate edges
m <- cbind(c(NA), m_raw, c(NA))
m <- rbind(c(NA), m, c(NA))

risk_level <- 0
for (x in 2:(ncol(m)-1)) {
  for (y in 2:(nrow(m)-1)) {
    part_of_m <- pick_a_matrix(x, y, m)
    lowest <- is_lowest(part_of_m)
    if (lowest) {
      risk_level <- risk_level + part_of_m[2,2] + 1
    }
  }
}
risk_level

# 1
df <- readLines("c:\\R\\advent_code\\2021\\day9.txt")

m_raw <- str_split(df, "", simplify = TRUE)
class(m_raw) <- "numeric"
# Surround the matrix with NAs to indicate edges
m <- cbind(c(NA), m_raw, c(NA))
m <- rbind(c(NA), m, c(NA))

risk_level <- 0
for (x in 2:(ncol(m)-1)) {
  for (y in 2:(nrow(m)-1)) {
    part_of_m <- pick_a_matrix(x, y, m)
    lowest <- is_lowest(part_of_m)
    if (lowest) {
      risk_level <- risk_level + part_of_m[2,2] + 1
    }
  }
}
risk_level









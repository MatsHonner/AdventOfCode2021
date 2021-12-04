library(tidyverse)

# 1
df <- read.csv("c:\\R\\advent_code\\2021\\day2_1.csv", header = FALSE)

df <- cbind(df$V1, data.frame(str_split_fixed(df$V1, " ", 2)))
colnames(df) <- c("original", "command", "steps")
df$steps <- as.integer(df$steps)

df$x <- ifelse(df$command == "forward", df$steps, 0)
df$y <- ifelse(df$command == "up", df$steps, 0)
df$y <- ifelse(df$command == "down", -df$steps, df$y)

df$x_cum <- cumsum(df$x)
df$y_cum <- cumsum(df$y)

# 2
#df <- read.csv("c:\\R\\advent_code\\2021\\day2_test.csv", header = FALSE)
df <- read.csv("c:\\R\\advent_code\\2021\\day2_1.csv", header = FALSE)

df <- cbind(df$V1, data.frame(str_split_fixed(df$V1, " ", 2)))
colnames(df) <- c("original", "command", "steps")
df$steps <- as.integer(df$steps)

df$aim_delta <- ifelse(df$command == "up", df$steps, 0)
df$aim_delta <- ifelse(df$command == "down", -df$steps, df$aim_delta)

df$aim <- cumsum(df$aim_delta)

df$x <- ifelse(df$command == "forward", df$steps, 0)
df$y <- ifelse(df$command == "forward", -df$steps*df$aim, 0)

df$x_cum <- cumsum(df$x)
df$y_cum <- cumsum(df$y)





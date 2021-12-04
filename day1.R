library(tidyverse)

# 1
df <- read.csv("c:\\R\\advent_code\\2021\\day1_1.csv", header = FALSE)

df$V2[2:2000] <- df$V1[1:1999]
df$V3 <- df$V1-df$V2
df$V4 <- df$V3>0

# 2
df <- read.csv("c:\\R\\advent_code\\2021\\day1_1.csv", header = FALSE)

df$V2[2:2000] <- df$V1[1:1999]
df$V3[3:2000] <- df$V1[1:1998]

df$sum <- df$V1 + df$V2 + df$V3

df$V4[4:2000] <- df$sum[3:1999]

df$V5 <- df$sum - df$V4
df$V6 <- df$V5 > 0
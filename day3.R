library(tidyverse)
library(skimr)

# 1
df <- readLines("c:\\R\\advent_code\\2021\\day3_1.txt")
df <- data.frame(df)

s <- str_split_fixed(df$df, "", 12)
s <- data.frame(s)

for (i in 1:12) {
  print(names(which.max(table(s[i]))))
}

a <- 2484
b <- 1611
a*b

# -----
df <- readLines("c:\\R\\advent_code\\2021\\day3_test.txt")
df <- data.frame(df)

s <- str_split_fixed(df$df, "", 5)
s <- data.frame(s)

for (i in 1:5) {
  print(names(which.max(table(s[i]))))
}
# -----

# 2
# Test:
#df <- readLines("c:\\R\\advent_code\\2021\\day3_1.txt")
df <- readLines("c:\\R\\advent_code\\2021\\day3_test.txt")
df <- data.frame(df)

#s <- str_split_fixed(df$df, "", 12)
s <- str_split_fixed(df$df, "", 5)
s <- data.frame(s)

tmp <- table(s[1]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[1] == 1)

tmp <- table(s[2]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[2] == 0)

tmp <- table(s[3]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[3] == 1)

tmp <- table(s[4]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[4] == 1)

tmp <- table(s[5]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[5] == 1)

#Real dataset:
df <- readLines("c:\\R\\advent_code\\2021\\day3_1.txt")
df <- data.frame(df)

s <- str_split_fixed(df$df, "", 12)
s <- data.frame(s)

tmp <- table(s[1]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[1] == 1)

tmp <- table(s[2]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[2] == 0)

tmp <- table(s[3]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[3] == 0)

tmp <- table(s[4]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[4] == 1)

tmp <- table(s[5]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[5] == 1)

tmp <- table(s[6]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[6] == 1)

tmp <- table(s[7]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[7] == 1)

tmp <- table(s[8]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[8] == 1)

tmp <- table(s[9]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[9] == 0)

tmp <- table(s[10]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[10] == 0)

tmp <- table(s[11]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[11] == 0)

tmp <- table(s[12]) %>%
  data.frame() %>%
  arrange(desc(Freq), desc(Var1)) %>%
  top_n(1)
s <- filter(s, s[12] == 1)

a <- s

# Test:
#df <- readLines("c:\\R\\advent_code\\2021\\day3_1.txt")
df <- readLines("c:\\R\\advent_code\\2021\\day3_test.txt")
df <- data.frame(df)

#s <- str_split_fixed(df$df, "", 12)
s <- str_split_fixed(df$df, "", 5)
s <- data.frame(s)

tmp <- table(s[1]) %>%
  data.frame() %>%
  arrange(Freq, Var1) %>%
  slice(1)
s <- filter(s, s[1] == 0)

tmp <- table(s[2]) %>%
  data.frame() %>%
  arrange(Freq, Var1) %>%
  slice(1)
s <- filter(s, s[2] == 1)

tmp <- table(s[3]) %>%
  data.frame() %>%
  arrange(Freq, Var1) %>%
  slice(1)
s <- filter(s, s[3] == 0)

#Real data:
df <- readLines("c:\\R\\advent_code\\2021\\day3_1.txt")
df <- data.frame(df)

s <- str_split_fixed(df$df, "", 12)
s <- data.frame(s)

tmp <- table(s[1]) %>%
  data.frame() %>%
  arrange(Freq, Var1) %>%
  slice(1)
s <- filter(s, s[1] == 0)

tmp <- table(s[2]) %>%
  data.frame() %>%
  arrange(Freq, Var1) %>%
  slice(1)
s <- filter(s, s[2] == 0)

tmp <- table(s[3]) %>%
  data.frame() %>%
  arrange(Freq, Var1) %>%
  slice(1)
s <- filter(s, s[3] == 0)

tmp <- table(s[4]) %>%
  data.frame() %>%
  arrange(Freq, Var1) %>%
  slice(1)
s <- filter(s, s[4] == 0)

tmp <- table(s[5]) %>%
  data.frame() %>%
  arrange(Freq, Var1) %>%
  slice(1)
s <- filter(s, s[5] == 1)

tmp <- table(s[6]) %>%
  data.frame() %>%
  arrange(Freq, Var1) %>%
  slice(1)
s <- filter(s, s[6] == 1)

tmp <- table(s[7]) %>%
  data.frame() %>%
  arrange(Freq, Var1) %>%
  slice(1)
s <- filter(s, s[7] == 1)

tmp <- table(s[8]) %>%
  data.frame() %>%
  arrange(Freq, Var1) %>%
  slice(1)
s <- filter(s, s[8] == 0)

b <- s

a_dec <- 2545
b_dec <- 231
a_dec*b_dec













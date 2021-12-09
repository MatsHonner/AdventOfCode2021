library(tidyverse)

# test
df <- readLines("c:\\R\\advent_code\\2021\\day8_test.txt")
df <- str_split_fixed(df, " \\| ", 2)
df <- unlist(df)

display <- df[, 2]

#easy_digits <- str_extract_all(display, "((^|\\s+)(\\w{2}|\\w{4}|\\w{3}|\\w{7})(\\s+|$))")
# easy_digits1 <- str_extract_all(display, "((^|\\s+)(\\w{2})(\\s+|$))") %>% unlist() %>% as.data.frame() # 1 
# easy_digits4 <- str_extract_all(display, "((^|\\s+)(\\w{4})(\\s+|$))") %>% unlist() %>% as.data.frame() # 4
# easy_digits7 <- str_extract_all(display, "((^|\\s+)(\\w{3})(\\s+|$))") %>% unlist() %>% as.data.frame() # 7
# easy_digits8 <- str_extract_all(display, "((^|\\s+)(\\w{7})(\\s+|$))") %>% unlist() %>% as.data.frame() # 8
easy_digits1 <- str_extract_all(display, "(?<=^|\\s)\\w{2}(\\s+|$)") %>% unlist() %>% as.data.frame() # 1 
easy_digits4 <- str_extract_all(display, "(?<=^|\\s)\\w{4}(\\s+|$)") %>% unlist() %>% as.data.frame() # 4
easy_digits7 <- str_extract_all(display, "(?<=^|\\s)\\w{3}(\\s+|$)") %>% unlist() %>% as.data.frame() # 7
easy_digits8 <- str_extract_all(display, "(?<=^|\\s)\\w{7}(\\s+|$)") %>% unlist() %>% as.data.frame() # 8
nrow(easy_digits1) + nrow(easy_digits4) + nrow(easy_digits7) + nrow(easy_digits8)

# 1
df <- readLines("c:\\R\\advent_code\\2021\\day8.txt")
df <- str_split_fixed(df, " \\| ", 2)
df <- unlist(df)

display <- df[, 2]

#easy_digits <- str_extract_all(display, "((^|\\s+)(\\w{2}|\\w{4}|\\w{3}|\\w{7})(\\s+|$))")
# easy_digits1 <- str_extract_all(display, "((^|\\s+)(\\w{2})(\\s+|$))") %>% unlist() %>% as.data.frame() # 1 
# easy_digits4 <- str_extract_all(display, "((^|\\s+)(\\w{4})(\\s+|$))") %>% unlist() %>% as.data.frame() # 4
# easy_digits7 <- str_extract_all(display, "((^|\\s+)(\\w{3})(\\s+|$))") %>% unlist() %>% as.data.frame() # 7
# easy_digits8 <- str_extract_all(display, "((^|\\s+)(\\w{7})(\\s+|$))") %>% unlist() %>% as.data.frame() # 8
easy_digits1 <- str_extract_all(display, "(?<=^|\\s)\\w{2}(\\s+|$)") %>% unlist() %>% as.data.frame() # 1 
easy_digits4 <- str_extract_all(display, "(?<=^|\\s)\\w{4}(\\s+|$)") %>% unlist() %>% as.data.frame() # 4
easy_digits7 <- str_extract_all(display, "(?<=^|\\s)\\w{3}(\\s+|$)") %>% unlist() %>% as.data.frame() # 7
easy_digits8 <- str_extract_all(display, "(?<=^|\\s)\\w{7}(\\s+|$)") %>% unlist() %>% as.data.frame() # 8
nrow(easy_digits1) + nrow(easy_digits4) + nrow(easy_digits7) + nrow(easy_digits8)

# test











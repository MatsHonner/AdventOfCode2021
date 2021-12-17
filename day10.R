library(tidyverse)

# tmp <- ("()")
# tmp <- ("(){}")
# tmp <- ("({})")
# tmp <- ("({<[]>})")
# tmp <- ("({<[]>}")
# tmp <- ("({<[]>}")
# tmp <- ("(}")

starters <- c("(", "[", "{", "<")
enders <- c(")", "]", "}", ">")
error_log <- ""

comp <- function(s1, s2) {
  if      (s1 == "(" & s2 == ")") {return(TRUE)}
  else if (s1 == "[" & s2 == "]") {return(TRUE)}
  else if (s1 == "{" & s2 == "}") {return(TRUE)}
  else if (s1 == "<" & s2 == ">") {return(TRUE)}
  else                            {return(FALSE)}
}

check <- function(s) {
  print(paste0("Entering: s=", s))
  if (s == "") {
    print("Exiting directly")
    return("")
  }
  repeat {
    if (s == "") {return("")}
    s1 <- substr(s, 1, 1)
    s_rest <- substr(s, 2, nchar(s))
    if (s1 %in% starters) {
      print(paste0("Starter: s1=", s1, ", s_rest=", s_rest))
      s <- check(s_rest)
      if (s == "") {return("")}
      else {
        s2 <- substr(s, 1, 1)
        s_rest <- substr(s, 2, nchar(s))
        if (comp(s1, s2)) {
          print(paste0("Matching pair: s1=", s1, ", s2=", s2, ", s_rest=", s_rest))
          s <- s_rest
        }
        else {
          print(paste0("Error=", s1, ", s2=", s2, ", s_rest=", s_rest))
          error_log <- paste0(error_log, s2)
          assign("error_log", error_log, envir = .GlobalEnv)
          return("")
        }
      }
    }
    else { # ender...
      print(paste0("ender: s1=", s1, ", s_rest=", s_rest))
      return(s)
    }
  }
}

# df <- readLines("c:\\R\\advent_code\\2021\\day10_test.txt")
# 
# for (i in df) {
#   check(i)
# }
# 
# e <- as.data.frame(strsplit(error_log, ""))
# colnames(e) <- c("e")
# 
# cnt <- 0
# for (i in 1:length(e$e)) {
#   tmp <- case_when(
#     e$e[i] == ")" ~ 3,
#     e$e[i] == "]" ~ 57,
#     e$e[i] == "}" ~ 1197,
#     e$e[i] == ">" ~ 25137
#   )
#   cnt <- cnt + tmp
# }
# cnt

# 1
df <- readLines("c:\\R\\advent_code\\2021\\day10.txt")

for (i in df) {
  check(i)
}

e <- as.data.frame(strsplit(error_log, ""))
colnames(e) <- c("e")

cnt <- 0
for (i in 1:length(e$e)) {
  tmp <- case_when(
    e$e[i] == ")" ~ 3,
    e$e[i] == "]" ~ 57,
    e$e[i] == "}" ~ 1197,
    e$e[i] == ">" ~ 25137
  )
  cnt <- cnt + tmp
}
cnt


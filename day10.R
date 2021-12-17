library(tidyverse)

tmp <- ("()")
tmp <- ("(){}")
tmp <- ("({})")
# tmp <- ("({<[]>})")
# tmp <- ("({<[]>}")
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

check_syntax <- function(s) {
  print(paste0("START OF FUNCTION, s=", s))
  if (nchar(s) == 0) {print("empty string, returning directly..."); return("")}

  s1 <- substr(s, 1, 1)
  s_rest <- substr(s, 2, nchar(s))
  print(paste0("s1=", s1, ", s_rest=", s_rest))
  repeat {
    if (s1 %in% starters) {
      print(paste0("Starter: s1=", s1, ", s_rest=", s_rest))
      s <- check_syntax(s_rest)
      s2 <- substr(s, 1, 1)
      s_rest <- substr(s, 2, nchar(s))
      print(paste0("s1=", s1, ", s2=", s2, ", s_rest=", s_rest))
      if (s2 == "") {
        print("end of string, returns")
        return("")
      } # end of string
      if (comp(s1,s2)) {
        print(paste0("matching pair: ", s1, s2))
        if (s_rest == "") {return("")}
        else {
          print(paste("Här, s_rest=", s_rest))
          s1 <- substr(s_rest, 1, 1)
          s_rest <- substr(s_rest, 2, nchar(s))
          print(paste0("Going further: s1=", s1, ", s_rest=", s_rest))
        }
      } # matching pair
      else {
        print(paste0("Syntax error: ", s2))
        error_log <- c(error_log, s2)
        return("")
      }
    }
    else if (s1 %in% enders) {print(paste0("ender, returning: ", s)); return(s)}
    else {print(paste0("no starter, no ender: ", s1)); return("")}
  }
}

check_syntax(tmp)







tmp <- ("()")
tmp <- ("(){}")
tmp <- ("({})")
tmp <- ("({<[]>})")
tmp <- ("({<[]>}")
tmp <- ("({<[]>}")
tmp <- ("(}")


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

check(tmp)
  
  



# test
# df <- readLines("c:\\R\\advent_code\\2021\\day10_test.txt")
# 
# for (i in 1:length(df)) {
#   
# }





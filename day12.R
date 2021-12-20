library(tidyverse)
library(data.tree)

# first exploratory...
df <- readLines("c:\\R\\advent_code\\2021\\day12_test1.txt")
df <- str_split(df, "-", simplify = TRUE)
df <- as.data.frame(df)
df <- rbind(df, data.frame(V1=df$V2, V2=df$V1)) # make the net both ways, to and from each node
colnames(df) <- c("from", "to")

# Visualize the network
library(igraph)
edges <- df
nodes <- data.frame(unique(df$from))
net <- graph_from_data_frame(d = edges, vertices = nodes)
plot(net, layout = layout_with_graphopt, edge.arrow.size = 0.2)

p <- filter(df, from == "start")
n <- Node$new("start")
for (i in p$to) {
  n$AddChild(i)
}
print(n, limit = 20)

already_exists <- function(node, childname) {
  exist <- FALSE
  repeat {
    if (node$isRoot & node$name == childname) {return(TRUE)}
    else if (node$isRoot) {return(FALSE)}
    else {return(already_exists(node$parent, childname))}
  }
}

for (i in n$children){
  p <- filter(df, from == i$name)
  for (j in p$to) { # all children
    if (!already_exists(i,j) & i$name != "end") {i$AddChild(j)}
  }
}
print(n, limit = 20)

#########################################################################
# test 1
library(tidyverse)
library(data.tree)

df <- readLines("c:\\R\\advent_code\\2021\\day12_test1.txt")
df <- str_split(df, "-", simplify = TRUE)
df <- as.data.frame(df)
df <- rbind(df, data.frame(V1=df$V2, V2=df$V1)) # make the net both ways, to and from each node
colnames(df) <- c("from", "to")


already_exists <- function(node, childname) {
  exist <- FALSE
  if (node$isRoot & node$name == childname) {exist <- TRUE}
  else if (node$isRoot) {exist <- FALSE}
  else if (node$name == childname & str_detect(childname, "[a-z]")) {exist <- TRUE}
  else {exist <- already_exists(node$parent, childname)}
  return(exist)
}
get_all_paths <- function(node) {
  for (i in node$children){
    p <- filter(df, from == i$name)
    for (j in p$to) { # all children
      if (!already_exists(i$parent,j) & i$name != "end") {i$AddChild(j)}
    }
    get_all_paths(i)
  }
}


p <- filter(df, from == "start")
n <- Node$new("start")
for (i in p$to) {
  n$AddChild(i)
}
get_all_paths(n)

print(n, limit = 30)
all_paths <- data.frame(s = ToDataFrameTable(n, "pathString")) %>% filter(str_detect(.$s, "end"))



#########################################################################
# test 2
library(tidyverse)
library(data.tree)

df <- readLines("c:\\R\\advent_code\\2021\\day12_test2.txt")
df <- str_split(df, "-", simplify = TRUE)
df <- as.data.frame(df)
df <- rbind(df, data.frame(V1=df$V2, V2=df$V1)) # make the net both ways, to and from each node
colnames(df) <- c("from", "to")


already_exists <- function(node, childname) {
  exist <- FALSE
  if (node$isRoot & node$name == childname) {exist <- TRUE}
  else if (node$isRoot) {exist <- FALSE}
  else if (node$name == childname & str_detect(childname, "[a-z]")) {exist <- TRUE}
  else {exist <- already_exists(node$parent, childname)}
  return(exist)
}
get_all_paths <- function(node) {
  for (i in node$children){
    p <- filter(df, from == i$name)
    for (j in p$to) { # all children
      if (!already_exists(i$parent,j) & i$name != "end") {i$AddChild(j)}
    }
    get_all_paths(i)
  }
}


p <- filter(df, from == "start")
n <- Node$new("start")
for (i in p$to) {
  n$AddChild(i)
}
get_all_paths(n)

print(n, limit = 30)
all_paths <- data.frame(s = ToDataFrameTable(n, "pathString")) %>% filter(str_detect(.$s, "end"))



#########################################################################
# test 3
library(tidyverse)
library(data.tree)

df <- readLines("c:\\R\\advent_code\\2021\\day12_test3.txt")
df <- str_split(df, "-", simplify = TRUE)
df <- as.data.frame(df)
df <- rbind(df, data.frame(V1=df$V2, V2=df$V1)) # make the net both ways, to and from each node
colnames(df) <- c("from", "to")


already_exists <- function(node, childname) {
  exist <- FALSE
  if (node$isRoot & node$name == childname) {exist <- TRUE}
  else if (node$isRoot) {exist <- FALSE}
  else if (node$name == childname & str_detect(childname, "[a-z]")) {exist <- TRUE}
  else {exist <- already_exists(node$parent, childname)}
  return(exist)
}
get_all_paths <- function(node) {
  for (i in node$children){
    p <- filter(df, from == i$name)
    for (j in p$to) { # all children
      if (!already_exists(i$parent,j) & i$name != "end") {i$AddChild(j)}
    }
    get_all_paths(i)
  }
}


p <- filter(df, from == "start")
n <- Node$new("start")
for (i in p$to) {
  n$AddChild(i)
}
get_all_paths(n)

print(n, limit = 30)
all_paths <- data.frame(s = ToDataFrameTable(n, "pathString")) %>% filter(str_detect(.$s, "end"))


#########################################################################
# 1
library(tidyverse)
library(data.tree)

df <- readLines("c:\\R\\advent_code\\2021\\day12.txt")
df <- str_split(df, "-", simplify = TRUE)
df <- as.data.frame(df)
df <- rbind(df, data.frame(V1=df$V2, V2=df$V1)) # make the net both ways, to and from each node
colnames(df) <- c("from", "to")


already_exists <- function(node, childname) {
  exist <- FALSE
  if (node$isRoot & node$name == childname) {exist <- TRUE}
  else if (node$isRoot) {exist <- FALSE}
  else if (node$name == childname & str_detect(childname, "[a-z]")) {exist <- TRUE}
  else {exist <- already_exists(node$parent, childname)}
  return(exist)
}
get_all_paths <- function(node) {
  for (i in node$children){
    p <- filter(df, from == i$name)
    for (j in p$to) { # all children
      if (!already_exists(i$parent,j) & i$name != "end") {i$AddChild(j)}
    }
    get_all_paths(i)
  }
}


p <- filter(df, from == "start")
n <- Node$new("start")
for (i in p$to) {
  n$AddChild(i)
}
get_all_paths(n)

print(n, limit = 30)
all_paths <- data.frame(s = ToDataFrameTable(n, "pathString")) %>% filter(str_detect(.$s, "end"))








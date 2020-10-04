#'THis is a description of riksdagen function
#'
#'@name riksdagen
#'
#'@description riksdagen function creates an API to get data and makes some basic analysis.
#'
#'@details The function creates an API connecting to website to get the data of voting in different parties and makes some basic analysis.
#'
#'@param voteyear a character with fixed format
#'
#'@return a data frame with percentage of voting data
#'
#'@examples  riksdagen("2020/21")
#'
#'@importFrom  httr GET content modify_url
#'
#'@importFrom jsonlite fromJSON
#'
#'@export riksdagen
#'
#'
#'

#library(httr)
#library(jsonlite)

  riksdagen <- function(voteyear){
  year <- c("2020/21","2019/20", "2018/19", "2017/18", "2016/17", "2015/16", "2014/15", "2013/14", "2012/13", "2011/12", "2010/11", "2009/10", "2008/09", "2007/08", "2006/07", "2005/06", "2004/05", "2003/04", "2002/03")
  if (! (voteyear %in% year)){
    stop("The wrong input, try again!")
  }
  url <- modify_url("http://data.riksdagen.se", path = "voteringlista/")
  my_query <- list(rm = voteyear, sz = "500", utformat = "json", gruppering = "parti")
  mydata <- GET(url, query = my_query)
  myjson <- fromJSON(content(mydata, "text"))
  myjson1 <- myjson$voteringlista$votering
  n <- nrow(myjson1)
  m <- ncol(myjson1)
  a <- vector(length = n)
  for (i in seq_along(myjson1)){
    a <- as.numeric(myjson1[, 2])
    a[which(is.na(a))] <- 0
    myjson1[, 2] <- NULL
    myjson1[, 5] <- a
    if((i + 1) == m){
      break
    }
  }
  myjson1$Total <- rowSums(myjson1[, c(2, 3, 4, 5)], na.rm = TRUE)
  avedata <- lapply(myjson1[, c(2, 3, 4, 5)], function(y) round(100 * (y / myjson1$Total)))
  avedata1 <- as.data.frame(avedata)

  myjson1 <- cbind(myjson1, avedata1)
  colnames(myjson1) <- c("Party", "Yes", "No", "Absence", "Refrain", "Total", "AveYes", "AveNo", "AveAbsence", "AveRefrain")
  return(myjson1)

  }








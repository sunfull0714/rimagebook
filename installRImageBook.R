installRImageBook <- function(){
  if(!require(RCurl)){
    install.packages("RCurl")
    library("RCurl")
  }
  OS <- Sys.getenv("OS")
  if(regexpr("win", Sys.getenv("OS"), ignore.case=TRUE) > 0){
    file <- "RImageBook_0.1.zip"
    url <- sprintf("https://rimagebook.googlecode.com/files/%s",file)
  } else {
    file <- "biOps_0.2.1.1.tar.gz"
    url <- sprintf("http://cran.r-project.org/src/contrib/%s",file)
  }
  content <- getBinaryURL(url)
  tempfile <- sprintf("%s\\%s",tempdir(),file)
  writeBin(content, tempfile)
  install.packages(tempfile,repos=NULL)
}
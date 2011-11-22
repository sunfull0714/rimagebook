installRImageBook <- function(){
  if(!require(RCurl)){
    install.packages("RCurl")
    library("RCurl")
  }
  OS <- Sys.getenv("OS")
  if(regexpr("win", Sys.getenv("OS"), ignore.case=TRUE) > 0){
    file <- "RImageBook_0.1.zip"
    url <- sprintf("http://rimagebook.googlecode.com/files/%s",file)
    pkgtype <- "win.binary"
  } else {
    file <- "RImageBook_0.2.tar.gz"
    url <- sprintf("http://rimagebook.googlecode.com/files/%s",file)
    pkgtype <- "source"
  }
  content <- getBinaryURL(url)
  tempfile <- sprintf("%s\\%s",tempdir(),file)
  writeBin(content, tempfile)
  install.packages(tempfile, repos=NULL, type=pkgtype)
}

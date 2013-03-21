installRImageBook <- function(){
  OS <- Sys.getenv("OS")
  if(regexpr("win", Sys.getenv("OS"), ignore.case=TRUE) > 0){
    file <- "RImageBook_0.7.1.zip"
    url <- sprintf("http://rimagebook.googlecode.com/files/%s",file)
    pkgtype <- "win.binary"
  } else {
    file <- "RImageBook_0.7.1.tar.gz"
    url <- sprintf("http://rimagebook.googlecode.com/files/%s",file)
    pkgtype <- "source"
  }
  tempfile <- sprintf("%s\\%s",tempdir(),file)
  download.file(url, tempfile)
  install.packages(tempfile, repos=NULL, type=pkgtype, INSTALL_opts="--no-multiarch")
}

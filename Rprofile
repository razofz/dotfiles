library(base)
library(utils)

print_version <- function() {
  v <- R.Version()
  ret <- paste0(
    v$version.string,
    ", ",
    v$nickname
  )
  return(ret)
}

less <- function(x) {
  if (typeof(x) == "character") {
    file.show(x)
  } else {
    page(x, method = "print")
  }
}

see_package_code <- function(package_name) {
  less(as.list(getNamespace(package_name)))
}

.First <- function() {
  if (!nzchar(Sys.getenv("RADIAN_VERSION"))) {
    Sys.setenv(R_HISTSIZE = 10000)
    if (interactive()) try(loadhistory("~/.Rhistory_all"))
    timestamp(quiet = T)
    timestamp(stamp = print_version()) # , prefix = "", suffix = "")
    timestamp(stamp = R.home(), quiet = T)
    timestamp(stamp = getwd(), quiet = T)
  } else {
    timestamp(stamp = R.home(), quiet = T)
    timestamp(stamp = getwd(), quiet = T)
  }
  options(max.print = 500)
}

.Last <- function() {
  # filename <- paste0(
  #   "~/.R-saved-histories/",
  #   format(Sys.time(), "%y%m%d-%H%M%S"),
  #   ".Rhistory"
  # )
  if (!nzchar(Sys.getenv("RADIAN_VERSION"))) {
    timestamp(quiet = T)
    # savehistory(file = filename)
    if (interactive()) try(savehistory("~/.Rhistory"))
    if (interactive()) try(file.append("~/.Rhistory_all", "~/.Rhistory"))
  }
}

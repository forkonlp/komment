#' get search options for president
#'
#' return options of president params of \code{\link{search_speech}}.
#'
#' @return character vector of president names
#'
#' @export
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom rvest html_attr
#' @importFrom xml2 read_html

get_president <- function(){
  tar <- "http://www.pa.go.kr/research/contents/speech/index.jsp"

  hobj <- xml2::read_html(tar)

  category <- rvest::html_nodes(hobj, "ul.iList li label")
  category <- rvest::html_attr(category, "for")

  label <- rvest::html_nodes(hobj, "ul.iList li label")
  label <- rvest::html_text(label)

  res <- data.frame(category, label, stringsAsFactors = F)

  res <- res[-grep("[a-z]0", res$category),]
  res <- res[grep("damPst", res$category),]
  res <- res$label
  res <- sapply(strsplit(res, " "), function(x) x[1])

  return(res)

}

#' get search options for field
#'
#' return options of field params of \code{\link{search_speech}}.
#'
#' @return character vector of fields
#'
#' @export
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom rvest html_attr
#' @importFrom xml2 read_html


get_field <- function(){
  tar <- "http://www.pa.go.kr/research/contents/speech/index.jsp"

  hobj <- xml2::read_html(tar)

  category <- rvest::html_nodes(hobj, "ul.iList li label")
  category <- rvest::html_attr(category, "for")

  label <- rvest::html_nodes(hobj, "ul.iList li label")
  label <- rvest::html_text(label)

  res <- data.frame(category, label, stringsAsFactors = F)

  res <- res[-grep("[a-z]0", res$category),]
  res <- res[grep("Field", res$category),]
  res <- res$label

  return(res)
}

#' get search options for event
#'
#' return options of event params of \code{\link{search_speech}}.
#'
#' @return character vector of events
#'
#' @export
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom rvest html_attr
#' @importFrom xml2 read_html
#' @importFrom tibble tibble

get_event <- function(){
  tar <- "http://www.pa.go.kr/research/contents/speech/index.jsp"

  hobj <- xml2::read_html(tar)

  category <- rvest::html_nodes(hobj, "ul.iList li label")
  category <- rvest::html_attr(category, "for")

  label <- rvest::html_nodes(hobj, "ul.iList li label")
  label <- rvest::html_text(label)

  res <- data.frame(category, label, stringsAsFactors = F)

  res <- res[-grep("[a-z]0", res$category),]
  res <- res[grep("Event", res$category),]
  res <- res$label

  return(res)
}

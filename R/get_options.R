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

  category <- rvest::html_nodes(hobj, "div.items label")
  category <- rvest::html_attr(category, "for")

  label <- rvest::html_nodes(hobj, "div.items label")
  label <- rvest::html_text(label)

  res <- data.frame(category, label, stringsAsFactors = F)

  res <- res[-grep("[a-z]0", res$category),]
  res <- res$label
  res <- gsub("\\s+", "", res)

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

  category <- rvest::html_nodes(hobj, "div.items option")
  category <- rvest::html_attr(category, "value")

  res <- category[-grepl("", category)]

  return(res)
}

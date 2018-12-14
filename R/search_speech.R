#' search speech
#'
#' search script of president's speech. Data is form \href{http://www.pa.go.kr/research/contents/speech/index.jsp}{presidential archives of korea}.
#'
#' @param keyword keyword to search. Default is all results. Accept character data type.
#' @param searchField All:0, Title:1, Content:2, Place:3. Default is 0 means all parts. Accept numeric data type.
#' @param count request number of results. Default is all. Accept numeric data type.
#' @param president president to search. Default is all results.
#'                  \code{\link{get_president}} provides available list. Accept character data type.
#' @param field field to search. Default is all results.
#'              \code{\link{get_field}} provides available list. Accept character data type.
#' @param event event to search. Default is all results.
#'              \code{\link{get_event}} provides available list. Accept character data type.
#' @param order order of search results. Defaults is order by date.
#'              order by date:1, order by title character:2. Accept numeric data type.
#' @return a [tibble][tibble::tibble-package] president, field, event, title, date, link
#'
#' @examples
#' \dontrun{
#' splist <- search_speech(count = 20)
#' splist
#' }
#'
#' @export
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom rvest html_attr
#' @importFrom xml2 read_html
#' @importFrom tibble tibble

search_speech <- function(keyword = "",
                          searchField = 0,
                          count = 10000,
                          president = "",
                          field = "",
                          event = "",
                          order = 1) {
  root <- "http://www.pa.go.kr/research/contents/speech/index.jsp"

  params <-
    paste0(
      "spMode=",
      "&artid=",
      "&catid=",
      "&orderColumn=",
      order,
      "&pageIndex=1",
      "&searchHistoryCount=0",
      "&damPst=",
      president,
      "&speechField=",
      field,
      "&speechEvent=",
      event,
      "&searchCondition=0",
      "&searchKeyword=",
      keyword,
      "&pageUnit=",
      count
    )

  res <-
    tibble(
      president = "",
      field = "",
      event = "",
      title = "",
      date = "",
      link = ""
    )

  tar <- paste0(root, "?", params)

  hobj <- xml2::read_html(tar)

  dat <- rvest::html_nodes(hobj, "td")
  dat <- rvest::html_text(dat)

  if (length(dat) > 6) {
    president <- dat[seq(from = 2,
                         to = length(dat),
                         by = 6)]
    field <- dat[seq(from = 3,
                     to = length(dat),
                     by = 6)]
    event <- dat[seq(from = 4,
                     to = length(dat),
                     by = 6)]
    title <- dat[seq(from = 5,
                     to = length(dat),
                     by = 6)]
    date <- dat[seq(from = 6,
                    to = length(dat),
                    by = 6)]

    link <- rvest::html_nodes(hobj, "td.title a")
    link <- rvest::html_attr(link, "href")
    link <- paste0(root, link)

    res <- tibble(president, field, event, title, date, link)
  }
  return(res)
}

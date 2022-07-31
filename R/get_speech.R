#' get speech
#'
#' get Speech's script of link from \code{\link{search_speech}}. only can get one script at once.
#'
#' @param link Sciprt link form \code{\link{search_speech}}. Like form is like
#'             \url{http://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1310475}
#'
#' @param paragraph logical if sepeate paragraph or not. Default is FALSE.
#'
#' @return a [tibble][tibble::tibble-package] title, date, president, place, field, event, source, paragraph, content
#'
#' @export
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom httr GET content config
#' @importFrom tibble tibble

get_speech <- function(link, paragraph = FALSE) {
  if ("tbl" %in% class(link)) {
    link <- as.character(link)
  }

  hobj <- httr::GET(link, httr::config(ssl_verifypeer = 0))
  hobj <- httr::content(hobj)

  title <- rvest::html_nodes(hobj, "td.subject")
  title <- rvest::html_text(title)

  meta_data <- rvest::html_nodes(hobj, "table.board-view tr td")
  meta_data <- rvest::html_text(meta_data)

  content <- rvest::html_nodes(hobj, "td.content")
  content <- gsub(pattern = '<.*?>', replacement = '\t', content)
  content <- strsplit(content, '\t')

  content <- trimws(content[[1]])
  content <- gsub("^[[:blank:]]$", "", content)
  content <- content[nchar(content) > 0]

  if (!paragraph) {
    content <- paste0(content , collapse = " ")
  }

  date <- meta_data[2]
  president <- meta_data[3]
  place <- meta_data[4]
  event <- meta_data[5]

  source <- meta_data[6]
  source <- strsplit(source, "\r\n")[[1]][2]
  source <- trimws(source)

  res <-
    tibble(title,
           date,
           president,
           place,
           event,
           source,
           paragraph = 1:length(content),
           content)

  return(res)
}

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
#' @importFrom xml2 read_html
#' @importFrom tibble tibble

get_speech <- function(link, paragraph = FALSE) {

  if ("tbl" %in% class(link)) {
    link <- as.character(link)
  }

  hobj <- xml2::read_html(link)

  title <- rvest::html_nodes(hobj, "h4")
  title <- rvest::html_text(title)

  meta_data <- rvest::html_nodes(hobj, "div.viewItem dl dd")
  meta_data <- rvest::html_text(meta_data)

  content <- rvest::html_nodes(hobj, "div.conTxt")
  content <- gsub(pattern = '<.*?>', replacement = '\t', content)
  content <- strsplit(content, '\t')

  content <- trimws(content[[1]])
  content <- gsub("^[[:blank:]]$", "", content)
  content <- content[nchar(content) > 0]


  if (!paragraph) {
    content <- paste0(content , collapse = " ")
  }

  date <- meta_data[1]
  president <- meta_data[2]
  place <- meta_data[3]
  field <- meta_data[4]
  event <- meta_data[5]
  source <- meta_data[6]

  res <- tibble(title, date, president, place, field, event, source, paragraph = 1:length(content), content)

  return(res)
}

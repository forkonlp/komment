context("test-get_speech.R")

test_that("get speech text data", {
  skip_if_offline()
  dat <- get_speech("https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1311235")
  expect_equal(dat$date, "1957.07.04")
})

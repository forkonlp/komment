context("test-search_speech.R")

test_that("multiplication works", {
  skip_if_offline()
  dat <- search_speech(keyword = "NGO", order = 1)
  expect_equal(dat$date[1], "1998.06.06")
})

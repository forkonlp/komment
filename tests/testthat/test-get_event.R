context("test-get_event.R")

test_that("get event option", {
  skip_if_offline()
  dat <- get_event()
  expect_equal(length(dat), 7)
})

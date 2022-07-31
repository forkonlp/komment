context("test-get_president.R")

test_that("get president options", {
  skip_if_offline()
  dat <- get_president()
  expect_equal(length(dat), 11)
})

#context("latlong")
#library(API)
library(testthat)


test_that("latlong rejects errounous input", {
  expect_error(latlong("1",2))})



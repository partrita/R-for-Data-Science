library(testthat)
source("_common.R")

test_that("status() throws error for invalid type", {
  expect_error(status("invalid"), "Invalid `type`")
})

test_that("status() returns expected output for valid types", {
  expect_output(status("polishing"), "final polishing")
  expect_output(status("restructuring"), "heavy restructuring")
  expect_output(status("drafting"), "dumping ground for ideas")
  expect_output(status("complete"), "largely complete")
})

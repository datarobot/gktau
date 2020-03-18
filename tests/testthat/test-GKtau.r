#
#  test-GKtau.r - unit test for GKtau function
#

context("Test GKtau function")

x <- rep(c("a", "b", "c", "d"), each = 3)
y <- rep(c("a", "b", "c", "d"), times = 3)
z <- rep(c("a", "b", "a", "c"), each = 3)

outputNames <- c("xName", "yName", "Nx", "Ny", "tauxy", "tauyx")
correctOutput <- data.frame(xName = "x", yName = "z",
                            Nx = 4, Ny = 3,
                            tauxy = 1, tauyx = 0.667,
                            stringsAsFactors = FALSE)

test_that("Required parameters are present", {
  expect_error(GKtau())
  expect_error(GKtau(x))
  expect_error(GKtau(x, dgts = 4))
  expect_error(GKtau(x, includeNA = "no"))
})

test_that("Function return has correct components",{
  output <- GKtau(x, z)
  expect_equal(length(output), 6)
  expect_equal(names(output), outputNames)
  expect_equal(output, correctOutput)
})

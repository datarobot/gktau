#
#  test-GKtauDataframe.r - unit test for GKtauDataframe function
#

context("Test GKtauDataframe function")

x <- rep(c("a", "b", "c", "d"), each = 3)
y <- rep(c("a", "b", "c", "d"), times = 3)
z <- rep(c("a", "b", "a", "c"), each = 3)
df <- data.frame(x = x, y = y, z = z)
badDataframe <- data.frame(x = x)

correctOutput <- matrix(c(4.000, 0.111, 1.000, 0.111, 4.000, 0.111, 0.667, 0.074, 3.000), byrow = TRUE, nrow = 3)
colnames(correctOutput) <- c("x", "y", "z")
rownames(correctOutput) <- c("x", "y", "z")
class(correctOutput) <- 'GKtauMatrix'

test_that("Required parameters are present", {
  expect_error(GKtauDataframe())
  expect_error(GKtauDataframe(badDataframe))
  expect_error(GKtauDataframe(dgts = 4))
  expect_error(GKtauDataframe(includeNA = "no"))
})

test_that("Function return has correct components",{
  output <- GKtauDataframe(df)
  expect_equal(class(output), "GKtauMatrix")
  expect_equal(nrow(output), 3)
  expect_equal(ncol(output), 3)
  expect_equal(output, correctOutput)
})

context("riksdagen")


test_that("riksdagen rejects errounous input", {
  expect_error(riksdagen(2002/02))
  expect_error(riksdagen(200203))
  expect_error(riksdagen("2002-03"))
  expect_error(riksdagen("2001/02"))
  expect_error(riksdagen("2002_03"))
})

test_that("riksdagen() works", {
  riksdagen_test <- riksdagen("2020/21")
  expect_equal(print(riksdagen_test[, 1]), c("-", "C", "KD", "L", "M", "MP", "S", "SD", "V"))
  expect_equal(print(riksdagen_test[, 2]), c(0, 25, 15, 15, 55, 12, 64, 20, 12))
  expect_equal(print(riksdagen_test[, 6]), c(12, 186, 132, 114, 420, 96, 600, 372, 162))
  expect_equal(print(riksdagen_test[, 7]), c(0, 13, 11, 13, 13, 12, 11, 5, 7))
  expect_equal(print(colnames(riksdagen_test)), c("Party", "Yes", "No", "Absence", "Refrain", "Total", "AveYes", "AveNo", "AveAbsence", "AveRefrain"))
})

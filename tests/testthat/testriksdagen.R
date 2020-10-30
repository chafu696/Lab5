context("riksdagen")


test_that("riksdagen rejects errounous input", {
  expect_error(riksdagen(2002/02))
  expect_error(riksdagen(200203))
  expect_error(riksdagen("2002-03"))
  expect_error(riksdagen("2001/02"))
  expect_error(riksdagen("2002_03"))
})

test_that("riksdagen() works", {
  riksdagen_test <- riksdagen("2019/20")
  expect_equal(riksdagen_test[, 1], c("-", "C", "KD", "L", "M", "MP", "S", "SD", "V"))
  expect_equal(riksdagen_test[, 2], c(273, 6007, 2920, 3890, 8902, 4027, 24120, 7140, 3938))
  expect_equal(riksdagen_test[, 6], c(1220, 18910, 13420, 11590, 42700, 9760, 61000, 37820, 16470))
  expect_equal(riksdagen_test[, 7], c(22, 32, 22, 34, 21, 41, 40, 19, 24))
  expect_equal(colnames(riksdagen_test), c("Party", "Yes", "No", "Absence", "Refrain", "Total", "AveYes", "AveNo", "AveAbsence", "AveRefrain"))
})

# generate 1000 random data points between -2 and 2
data = data.frame(x = runif(1000, -2, 2), drop = FALSE)
cover = create_width_balanced_cover(min(data$x), max(data$x), 10, 25)

test_that("we can clusterball with equal sized bins", {
  data = data.frame(x = 1:100, drop = FALSE)
  cover = create_width_balanced_cover(1, 100, 10, 0)
  bins = create_bins(data, data$x, apply(cover, 1, check_in_interval))
  expect_no_warning(create_mapper_object(data, dist(data), data$x, lapply(bins, is_in_ball), "single"))
})

test_that("mapper happens ok with distance matrix as a matrix", {
  expect_no_warning(create_1D_mapper_object(data, as.matrix(dist(data)), data$x, cover, "single"))
})

test_that("mapper happens ok with distance matrix as a dist", {
  expect_no_warning(create_1D_mapper_object(data, dist(data), data$x, cover, "single"))
})

test_that("1D mapper is ok with no clustering method", {
  expect_no_warning(create_1D_mapper_object(data, dist(data), data$x, cover))
})

test_that("we can ball with equal sized bins", {
  data = data.frame(x = 1:100, drop = FALSE)
  cover = create_width_balanced_cover(1, 100, 10, 0)
  bins = create_bins(data, data$x, apply(cover, 1, check_in_interval))
  expect_no_warning(run_mapper(convert_to_clusters(bins), dist(data), binning = FALSE))
})



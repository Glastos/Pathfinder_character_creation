carac <- list()

for (i in 1:6) {
  val <- sample(1:6, 4, replace = TRUE)
  carac <- append(carac,sum(val[-which.min(val)]))
}

return(carac)

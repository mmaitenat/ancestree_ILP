calc_ancestry_graph <- function(F) {
  combs <- combn(10, 2)
  raw_connections <- apply(combs, 2, function(x) {
    mut1 <- x[1]
    mut2 <- x[2]
    if (all(F[, mut1] >= F[, mut2])) {
      return(c(x[1], x[2]))
    } else if (all(F[, mut2] >= F[, mut1])) {
      return(c(x[2], x[1]))
    } else {
      return(c(NA, NA))
    }
  })
  raw_connections <- t(raw_connections)
  ancestry_pairs <- raw_connections[complete.cases(raw_connections),]
  colnames(ancestry_pairs) <- c("parent", "child")
  return(ancestry_pairs)
}

extend_ancestry_graph <- function(F, A) {
  n <- ncol(F)
  root_arcs <- data.frame(parent = rep(0, n), child = 1:n)
  A_ext <- rbind(root_arcs, A)
  return(A_ext)
}

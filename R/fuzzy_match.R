#' @import fuzzyjoin
#' @import dplyr
#' @export text_match


text_match = function(a,b){
  # a <- data.frame(name = c('Ace Co', 'Bayes', 'asd', 'Bcy', 'Baes', 'Bays'),
  #                 price = c(10, 13, 2, 1, 15, 1))
  # b <- data.frame(name = c('Ace Co.', 'Bayes Inc.', 'asdf'),
  #                 qty = c(9, 99, 10))
  #

  return(stringdist_join(a, b,
                         by = "name",
                         mode = "left",
                         ignore_case = FALSE,
                         method = "jw",
                         max_dist = 99,
                         distance_col = "dist") %>%
           group_by(name.x) %>%
           top_n(1, -dist))

}

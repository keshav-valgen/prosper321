#'Doing String matching
#'
#' This fucntion matches two strings and give the count that how many matched
#' @import fuzzyjoin
#' @import dplyr
#' @export text_match


text_match = function(a,b){

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

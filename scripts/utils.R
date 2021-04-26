standardize_num_termo_contrato <- function(x) {
  num <- stringr::str_sub(x, 1, 3)
  year <- stringr::str_sub(x, 5, 6)
  
  glue::glue("{num}/20{year}")  
}


date_conversion <- function(x) {
  year <- stringr::str_sub(x, 1, 4)
  month <- stringr::str_sub(x, 5, 6)
  day <- stringr::str_sub(x, 7, 8)
  
  glue::glue("{day}/{month}/{year}")  
}
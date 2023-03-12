format_amount <- function(amount) {
  amount <- str_replace_all(amount, "[[:blank:]]", "") %>% str_remove("--") %>% str_replace(",", ".")
    
  return(amount)
}
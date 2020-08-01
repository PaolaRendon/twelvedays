#' Takes a noun and makes it plural
#'
#' @param num An integer
#' @param num_word A string corresponding to the integer
#' @param item A string
#' @param verb A string
#' @param adjective A string
#' @param location A string
#'
#' @return A string containing the words in grammatical order.
#'
#' @import stringr
#' @import glue
#' @import dplyr
#' @import purrr
#' @import stringi
#' @import english
#'
#' @export


make_phrase <- function(num, num_word, item, verb, adjective, location){

  verb <- str_replace_na(verb, "")
  adjective <- str_replace_na(adjective, "")
  location <- str_replace_na(location, "")
  phrase <- glue("{num_word} {adjective} {item} {verb} {location}")
  phrase <- str_replace_all(phrase, "  ", " ")
  return(phrase)
}

xmas <- read.csv("https://www.dropbox.com/s/e584pryn8evm1gz/xmas.csv?dl=1")

make_phrase(num = 10,
            num_word = "ten",
            item = "lords",
            verb = "a-leaping",
            adjective = "",
            location = "")


xmas <- xmas %>%
  mutate(Full.Phrase = pmap_chr(list(Day, Words(Day), Gift.Item, Verb,
                                     Adjective, Location), make_phrase))


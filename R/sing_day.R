#' Takes a noun and makes it plural
#'
#' @param dataset A data frame containing information about gifts
#' @param line The number of the line for the day you want to sing about
#' @param phrase_col The variable name for the column in the dataset that
#' contains the gift phrases
#'
#' @return A string singing the line of the song with all gifts for the given day.
#'
#' @import stringr
#' @import dplyr
#' @import glue
#' @import purrr
#' @import english
#'
#' @export
#'


sing_day <- function(dataset, line, phrase_col){

  phrases <- dataset %>% pull({{phrase_col}})

  phrases <- head(phrases, line)

  day_phrases <- map(phrases, invisible)

  line <- ordinal(line)

  day_phrases <- glue_collapse(day_phrases, sep = ",\n")

  glue("On the {line} day of Christmas, my true love sent to me,
  {day_phrases}")
}

xmas <- read.csv("https://www.dropbox.com/s/e584pryn8evm1gz/xmas.csv?dl=1")

xmas2 <- read.csv("https://www.dropbox.com/s/ap2hqssese1ki4j/xmas_2.csv?dl=1")

xmas <- xmas %>%
  mutate(Full.Phrase = pmap_chr(list(Day, Words(Day), Gift.Item, Verb,
                                     Adjective, Location), make_phrase))

sing_day(xmas, 2, Full.Phrase)

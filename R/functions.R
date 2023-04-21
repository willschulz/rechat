#' Parse Chats
#'
#' This function parses a ReChat csv export into an R list.
#' @param file Path to csv file.
#' @keywords parse
#' @export
#' @examples
#' parseChats()

parseChats <- function(file) {
  raw_chat_data <- readr::read_lines(file)
  tops <- which(stringr::str_detect(raw_chat_data, pattern = "Room Id:"))
  bottoms <- which(raw_chat_data=="----------------------------------")
  chats_list <- list()
  for (i in 1:length(tops)){
    thischat <- raw_chat_data[tops[i]:bottoms[i]]
    thischatlist <- list()
    #room id
    thischatlist$room_id <- gsub(" ", "", x = stringr::str_split(thischat[1], ",", simplify = T)[2], fixed = T)
    #started at
    thischatlist$started_at <- lubridate::parse_date_time(x = stringr::str_replace_all(stringr::str_remove_all(stringr::str_remove(thischat[2], pattern = "Started At:, "), pattern = ","), pattern = "/", replacement = "-"), orders = "mdYHMS", tz = "America/New_York")
    #participant data
    thischatlist$participants <- readr::read_delim(I(thischat[(which(thischat == "Participants") + 1):(which(thischat == "Messages") - 2)]), delim = ",", show_col_types = FALSE)
    #messages
    thischatlist$messages <- readr::read_delim(I(thischat[(which(thischat == "Messages") + 1):(which(thischat == "Poll Responses") - 2)]), delim = ",", show_col_types = FALSE)
    chats_list[[i]] <- thischatlist
  }
  return(chats_list)
}

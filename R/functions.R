#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()

cat_function <- function(love=TRUE){
  if(love==TRUE){
    print("I love cats!")
  }
  else {
    print("I am not a cool person.")
  }
}


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
  tops <- which(str_detect(raw_chat_data, pattern = "Room Id:"))
  bottoms <- which(raw_chat_data=="----------------------------------")
  chats_list <- list()
  for (i in 1:length(tops)){
    thischat <- raw_chat_data[tops[i]:bottoms[i]]
    thischatlist <- list()
    #room id
    thischatlist$room_id <- str_split(thischat[1], ",", simplify = T)[2] %>% gsub(" ", "", x=., fixed = T)
    #started at
    thischatlist$started_at <- str_remove(thischat[2], pattern = "Started At:, ") %>% str_remove_all(pattern = ",") %>% str_replace_all(pattern = "/", replacement = "-") %>% lubridate::parse_date_time(x = ., orders = "mdYHMS", tz = "America/New_York")
    #participant data
    thischatlist$participants <- thischat[(which(thischat=="Participants")+1):(which(thischat=="Messages")-2)] %>% {readr::read_delim(I(.), delim = ",", show_col_types = FALSE)}
    #messages
    thischatlist$messages <- thischat[(which(thischat=="Messages")+1):(which(thischat=="Poll Responses")-2)] %>% {readr::read_delim(I(.), delim = ",", show_col_types = FALSE)}
    chats_list[[i]] <- thischatlist
  }
  return(chats_list)
}

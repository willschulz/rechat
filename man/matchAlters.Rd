% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{matchAlters}
\alias{matchAlters}
\title{Match Alters}
\usage{
matchAlters(survey_data, chat_data)
}
\arguments{
\item{survey_data}{A dataframe of survey responses, including a column named ego_code that contains the receipt code the respondent entered after completing their chat.}

\item{chat_data}{A list of chat data generated from the parseChat function.}
}
\description{
This function adds an alter_code field to the survey_data dataframe, containing the receipt code that identifies each participant's chat partner.  Note that this function is written for dyadic chats only, and that the survey_data dataframe must contain a column named ego_code that contains the confirmation code entered by the participant after their chat (confirmation codes are generated by ReChat and participants should be instructed to enter the generated code into a free-text field in the survey, to facilitate this matching procedure).
}
\examples{
matchAlters()
}
\keyword{match}

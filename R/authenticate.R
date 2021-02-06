#' Connects to Google Cloud API for user-authentication
#'
#' This function can be used to authenticate users
#'
#' @usage authenticate(googleAuthR.client_id, googleAuthR.client_secret)
#'
#' @param googleAuthR.client_id Client id provided by Google API cloud service
#'
#' @param googleAuthR.client_secret Client secret provided by Google API cloud service
#'
#' @return a vector of objects
#'
#' @author Mohmed Soudy \email{Mohamed.soudy@57357.com}, Yasmine Afify \email{yasmine.afify@cis.asu.edu.eg}, and Nagwa Badr \email{Nagwabadr@cis.asu.edu.eg}
#'
#' @export

authenticate <- function(googleAuthR.client_id, googleAuthR.client_secret)
{
  options(googleAuthR.client_id = googleAuthR.client_id,
          googleAuthR.client_secret = googleAuthR.client_secret)

  gar_auth()
}

#' Connects to Google Cloud API label detection and perform multiple object detection
#'
#' This function can be used to classify image based on objects detected
#'
#' @usage GetLabels(ImagePaths)
#'
#' @param ImagePaths vector of complete image's paths
#'
#' @return a vector of objects
#'
#' @author Mohmed Soudy \email{Mohamed.soudy@57357.com}, Yasmine Afify \email{yasmine.afify@cis.asu.edu.eg}, and Nagwa Badr \email{Nagwabadr@cis.asu.edu.eg}
#'
#' @export
GetLabels <- function(ImagePaths)
{
  Class <- NULL
  for (path in ImagePaths)
  {
    APIObject <- gcv_get_image_annotations(imagePaths = ImagePaths, maxNumResults = 7)
    DetectedObjects <- tolower(as.character(APIObject[,3]))
    #Get corresponding class from data
    ClassLogic <- system.file("extdata", "ClassLogic.csv", package = "ORTSC")
    #Map identified objects
    Identification <- ClassLogic[ClassLogic$Object %in% DetectedObjects,]
    #Calculate weights for class
    Weights <- setNames(aggregate(Identification$Weight, by = list(Identification$Class), sum), c("Class", "Weight"))
    #Get class of maximum weight
    Class <<- c(Class, Weights$Class[which.max(Weights$Weight)])
  }
  return(Class)
}

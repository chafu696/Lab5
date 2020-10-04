#'runRiksShiny
#'
#'@name runRiksShiny
#'
#'@description runRiksShiny runs an included shiny app allowing the user to see which way each party votes in total by year
#'
#'@return runs a Shiny app locally
#'
#'@examples  \dontrun{runRiksShiny()}
#'
#'@import shiny ggplot2
#'
#'@importFrom tidyr gather
#'
#'@export runRiksShiny
#'
#'


runRiksShiny <- function() {
  appDir <- system.file("ShinyApp", package = "riksdagen")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `mypackage`.", call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = "normal")
}
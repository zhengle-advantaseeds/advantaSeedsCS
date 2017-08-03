#' @export

runAdvantaApps <- function(shinyApp) {
  # locate all the shiny app examples that exist
  validApps <- list.files(system.file("advantaApps", package = "advantaSeedsCS"))

  validAppsMsg <-
    paste0(
      "Valid examples are: '",
      paste(validApps, collapse = "', '"),
      "'")

  
  if (missing(shinyApp) || !nzchar(shinyApp) ||
      !example %in% validApps) {
    stop(
      'Please run `runAdvantaApps()` with a valid example app as an argument.\n',
      validAppsMsg,
      call. = FALSE)
  }

  # find and launch the app
  appDir <- system.file("advantaApps", shinyApp, package = "advantaSeedsCS")
  shiny::runApp(appDir, display.mode = "normal")
}
# mimicing birdrecoveries
runShinyApp <- function() {
  appDir <-paste(getwd(),"/inst/shiny-apps/ukraina",sep="");
  shiny::runApp(appDir, display.mode = "normal")
}

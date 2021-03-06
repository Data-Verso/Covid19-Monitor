#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    navbarPage(
      theme = shinythemes::shinytheme("flatly"),
      title = "Monitor Covid-19",id = "covid19",
      # Brazil Monitor Tab ------------------------------------------------------
      tabPanel(
        title = "Monitor Brasil",
        mod_Brazil_Monitor_ui("Brazil_Monitor_ui_1")
        
      ),
      # About Tab ---------------------------------------------------------------
      tabPanel("Sobre esta Aplicacao",
               tags$div(
                 tags$h4("Codigo Fonte:"),
                 tags$a(href="https://github.com/viniciusmsousa/Covid19-Monitor","github.com/viniciusmsousa"),
                 tags$h4("Contato:"),
                 "vinisousa04@gmail.com ou via ", tags$a(href="https://www.linkedin.com/in/viniciusmsousa/","linkedin"),
                 tags$br()
               )
      )
    )
  )
} 

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'covid19'
    ),
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
    tags$link(rel="stylesheet", type="text/css", href="www/estilos.css")
  )
}


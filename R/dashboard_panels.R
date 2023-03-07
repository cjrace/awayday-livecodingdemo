dashboard_panel <- function() {
  tabPanel(
    value = "dashboard",
    "Dashboard",

    # Define UI for application that draws a histogram

    # Sidebar with a slider input for number of bins
    gov_main_layout(
      gov_row(
        column(
          width = 12,
          h1("Overall content title for this dashboard page (h1)"),
        ),
        column(
          width = 12,
          div(
            class = "well",
            style = "min-height: 100%; height: 100%; overflow-y: visible",
            gov_row(
              column(
                width = 4,
                selectizeInput("breakdown",
                  "Select a breakdown",
                  choices = c('gender', 'grade')
                )
              ),
              column(
                width = 4,
                selectizeInput(
                  inputId = "selectArea",
                  label = "Choose an area:",
                  choices = choicesAreas$area_name
                )
              ),
              column(
                width = 4,
                radioGroupButtons(inputId = 'headcount_fte',
                                  choices =list('headcount, full_time_equivalent'))
              ),
              column(
                width = 12,
                paste("Download the underlying data for this dashboard:"), br(),
                downloadButton(
                  outputId = "download_data",
                  label = "Download data",
                  icon = shiny::icon("download"),
                  class = "downloadButton"
                )
              )
            )
          )
        ),
        column(
          width = 12,
          tabsetPanel(
            id = "tabsetpanels",
            tabPanel(
              "Example panel 1",
              fluidRow(
                column(
                  width = 12,
                  h2("Outputs 1 (h2)"),
                  box(
                    width = 12,
                    plotlyOutput("lineRevBal")
                  )
                )
              )
            ),
            tabPanel(
              "Table",
              fluidRow(
                column(
                  width = 12,
                  h2("Teacher table"),
                  p("View teacher headount or FTE by characteristic and geographical area"),
                  column(
                    width = 12,
                    dataTableOutput("tabBenchmark")
                  )
                )
              )
            )
          )
        )
        # add box to show user input
      )
    )
  )
}

ui <- fluidPage(
  selectInput(inputId = "yr", label = "Select Year", 
              choices = c("2020/21","2019/20", "2018/19", "2017/18", "2016/17", "2015/16", "2014/15", "2013/14", "2012/13", "2011/12", "2010/11", "2009/10", "2008/09", "2007/08", "2006/07", "2005/06", "2004/05", "2003/04", "2002/03")),
  checkboxGroupInput(inputId = "vote", label = "Select vote result", 
                     choices = c("Yes","No","Absence","Refrain"), selected = "Yes"),
  plotOutput("plot")
)

server <- function(input,output){
  apiCall <- reactive({
    riksdagen(input$yr)
  })
  rikInput <- reactive({
    cols <- apiCall()[c("Party",input$vote)]
    tidyr::gather(cols, key, Votes, -Party)
  })
  
  output$plot <- renderPlot(ggplot2::ggplot(data = rikInput(), aes(fill=key, y=Votes, x=Party)) +
                              ggplot2::geom_col(position="stack") +
                              ggplot2::ggtitle(paste("Vote distribution by party in the year", input$yr))
  )
  
}

shinyApp(ui=ui,server=server)
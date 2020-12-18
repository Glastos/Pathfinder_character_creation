shinyServer(function(input, output) {

    output$race_info <- renderUI({
        race_text <- paste("<b>", names(data_race)[1],"</b>: ", input$race,
                           "<br/><b>", names(data_race)[2],"</b>: ",data_race[data_race[,1]==input$race,2:3],
                           "<br/><b>", names(data_race)[4],"</b>: ",data_race[data_race[,1]==input$race,4],
                           "<br/><b>", names(data_race)[5],"</b>: ",data_race[data_race[,1]==input$race,5],
                           "<br/><b>", names(data_race)[6],"</b>: ",data_race[data_race[,1]==input$race,6:7],
                           "<br/><b>", names(data_race)[8],"</b>: ",data_race[data_race[,1]==input$race,8],
                           "<br/><b>Caractéristique</b>: ",
                           "<br/><b>", names(data_race)[9],"</b>: ",data_race[data_race[,1]==input$race,9],
                           "  <b>", names(data_race)[12],"</b>: ",data_race[data_race[,1]==input$race,12],
                           "<br/><b>", names(data_race)[10],"</b>: ",data_race[data_race[,1]==input$race,10],
                           "  <b>", names(data_race)[13],"</b>: ",data_race[data_race[,1]==input$race,13],
                           "<br/><b>", names(data_race)[11],"</b>: ",data_race[data_race[,1]==input$race,11],
                           "  <b>", names(data_race)[14],"</b>: ",data_race[data_race[,1]==input$race,14],
                           sep = "")
        return(HTML(race_text))
    })
    
    output$classe_info <- renderUI({
        classe_text <- paste("<b>Classe</b>:", input$classe)
        return(HTML(classe_text))
    })
    
    carac_Value <- reactiveValues(data = list(c(10,10,10,10,10,10)))
    
    observeEvent(input$reroll_carac, {
        carac_Value$data <- source("src/roll_carac.R")
    })
    
    output$caracteristiques <- renderUI({
        Force <- carac_Value$data[[1]][1]
        Dexterite <- carac_Value$data[[1]][2]
        Constitution <- carac_Value$data[[1]][3]
        Intelligence <- carac_Value$data[[1]][4]
        Sagesse <- carac_Value$data[[1]][5]
        Charisme <- carac_Value$data[[1]][6]
        HTML(paste("For: ",Force, "<br/>Dex: ",Dexterite,
                   "<br/>Con: ",Constitution, "<br/>Int: ",Intelligence,
                   "<br/>Sag: ",Sagesse, "<br/>Cha: ",Charisme,
                   sep = ""))
    })
})